using GTANetworkAPI;
using System;

namespace Admin
{
    public class Admin : Script
    {
        private enum AdminRanks { JuniorAdmin = 1, Admin, Senior, Lead, Management}
        private const string Cmds = "mute, unmute, spawnwep, spawncar, setkevlar, sethealth, goto, gethere, kick, ban, login, register";
        private const byte defaultAdmLvl = 1;

        [Command("ahelp", "~y~USAGE: ~w~/ahelp to display all admin commands.")]
        public void CMD_Help(Client player)
        {
            NAPI.Chat.SendChatMessageToPlayer(player, "~y~AdmCmds: ~w~" + Cmds);
        }

        [Command("unmute", "~y~USAGE: ~w~/unmute [target] to unmute the target.")]
        public void CMD_UnmutePlayer(Client player, string targetName)
        {
            AdminAccount acc = AccountHandler.instance.GetAccount(player);
            if (acc != null)
            {
                if (DoesPlayerHaveAccess(acc.Level, AdminRanks.JuniorAdmin))
                {
                    Client target = GetPlayerByNameOrID(targetName);
                    if (target != null)
                    {
                        target.TriggerEvent("TOGGLE_MUTE", true);
                        target.SendChatMessage("[UNMUTED]: An admin has unmuted you.");
                        SendAdmMsg(player, "You have unmuted: ~o~" + target.Name);
                        return;
                    }
                    else SendPlayerNotFound(player);
                }
                else SendNoPermMsg(player);
            }
            else SendNoPermMsg(player);
        }

        [Command("mute", "~y~USAGE: ~w~/mute [target] to mute the target.")]
        public void CMD_MutePlayer(Client player, string targetName)
        {
            AdminAccount acc = AccountHandler.instance.GetAccount(player);
            if (acc != null)
            {
                if (DoesPlayerHaveAccess(acc.Level, AdminRanks.JuniorAdmin))
                {
                    Client target = GetPlayerByNameOrID(targetName);
                    if (target != null)
                    {
                        target.TriggerEvent("TOGGLE_MUTE", false);
                        target.SendChatMessage("~r~[MUTED]: An admin has muted you..");
                        SendAdmMsg(player, "You have muted: ~o~" + target.Name);
                        return;
                    }
                    else SendPlayerNotFound(player);
                }
                else SendNoPermMsg(player);
            }
            else SendNoPermMsg(player);
        }

        [Command("spawnwep", "~y~USAGE: ~w~/spawnwep [weaponName] [ammo] to spawn a weapon.")]
        public void CMD_SpawnWeapon(Client player, string wepName, int ammo = 9999)
        {
            AdminAccount acc = AccountHandler.instance.GetAccount(player);
            if (acc != null)
            {
                if (DoesPlayerHaveAccess(acc.Level, AdminRanks.Senior))
                {
                    WeaponHash wepHash = NAPI.Util.WeaponNameToModel(wepName);
                    NAPI.Player.GivePlayerWeapon(player, wepHash, ammo);
                    SendAdmMsg(player, "You successfully gave yourself a: ~o~" + wepName.ToUpper() + " ~w~with: ~o~" + ammo + " ~w~bullets.");
                    return;
                }
                else SendNoPermMsg(player);
            }
            else SendNoPermMsg(player);
        }

        [Command("spawncar", "~y~USAGE: ~w~/spawncar [vehicleName] [color1] [color2] to spawn a vehicle.")]
        public void CMD_SpawnCar(Client player, string vehName, int color1 = 1, int color2 = 1)
        {
            AdminAccount acc = AccountHandler.instance.GetAccount(player);
            if (acc != null)
            {
                if (DoesPlayerHaveAccess(acc.Level, AdminRanks.Senior))
                {
                    VehicleHash vehHash = NAPI.Util.VehicleNameToModel(vehName); 
                    if (vehHash != 0)
                    {
                        NAPI.Player.SetPlayerIntoVehicle(player, NAPI.Vehicle.CreateVehicle(vehHash, player.Position, player.Rotation, color1, color2), -1);
                        SendAdmMsg(player, "You successfully spawned : ~o~" + vehName.ToUpper());
                        return;
                    } else
                    {
                        NAPI.Chat.SendChatMessageToPlayer(player, "~r~ERROR: ~w~There is no vehicle model called: ~o~" + vehName);
                        return;
                    }
                }
                else SendNoPermMsg(player);
            }
            else SendNoPermMsg(player);
        }

        [Command("setkevlar", "~y~USAGE: ~w~/setkevlar [target] [amount] to set the targets kevlar.")]
        public void CMD_SetKevlar(Client player, string targetName, int amount)
        {
            AdminAccount acc = AccountHandler.instance.GetAccount(player);
            if (acc != null)
            {
                if (DoesPlayerHaveAccess(acc.Level, AdminRanks.Senior))
                {
                    if (amount <= 0 || amount > 100) NAPI.Chat.SendChatMessageToPlayer(player, "~r~ERROR: ~w~Valid range is 1-100..");
                    Client target = GetPlayerByNameOrID(targetName);
                    if (target != null)
                    {
                        target.Armor = amount;
                        SendAdmMsg(target, "Your kevlar was set to: ~o~" + amount + " ~w~by ~o~" + acc.AdminName);
                        SendAdmMsg(player, "You set the kevlar of: ~o~" + target.Name + " ~w~to ~o~" + amount);
                    }
                    else SendPlayerNotFound(player);
                }
                else SendNoPermMsg(player);
            }
            else SendNoPermMsg(player);
        }

        [Command("sethealth", "~y~USAGE: ~w~/sethealth [target] [amount] to set the targets health.")]
        public void CMD_SetHealth(Client player, string targetName, int amount)
        {
            AdminAccount acc = AccountHandler.instance.GetAccount(player);
            if (acc != null)
            {
                if (DoesPlayerHaveAccess(acc.Level, AdminRanks.Senior))
                {
                    if (amount <= 0 || amount > 100) NAPI.Chat.SendChatMessageToPlayer(player, "~r~ERROR: ~w~Valid range is 1-100..");
                    Client target = GetPlayerByNameOrID(targetName);
                    if (target != null)
                    {
                        if (target.Health > 0)
                        {
                            target.Health = amount;
                            SendAdmMsg(target, "Your health was set to: ~o~" + amount + " ~w~by ~o~" + acc.AdminName);
                            SendAdmMsg(player, "You set the health of: ~o~" + target.Name + " ~w~to ~o~" + amount);
                        }
                        else NAPI.Chat.SendChatMessageToPlayer(player, "~r~ERROR: ~w~Player is dead."); return;
                    }
                    else SendPlayerNotFound(player);
                }
                else SendNoPermMsg(player);
            }
            else SendNoPermMsg(player);
        }

        [Command("goto", "~y~USAGE: ~w~/goto [target] to teleport to the targets position.")]
        public void CMD_Goto(Client player, string targetName)
        {
            AdminAccount acc = AccountHandler.instance.GetAccount(player);
            if (acc != null)
            {
                if (DoesPlayerHaveAccess(acc.Level, AdminRanks.JuniorAdmin))
                {
                    Client target = GetPlayerByNameOrID(targetName);
                    if (target != null)
                    {
                        player.Position = new Vector3(target.Position.X + 1f,
                                                      target.Position.Y,
                                                      target.Position.Z + 1f);
                        SendAdmMsg(player, "You teleported to: ~o~" + target.Name);
                        return;
                    }
                    else SendPlayerNotFound(player);
                }
                else SendNoPermMsg(player);
            }
            else SendNoPermMsg(player);
        }

        [Command("gethere", "~y~USAGE: ~w~/gethere [target] to teleport the target to your position.")]
        public void CMD_GetHere(Client player, string targetName)
        {
            AdminAccount acc = AccountHandler.instance.GetAccount(player);
            if (acc != null)
            {
                if (DoesPlayerHaveAccess(acc.Level, AdminRanks.JuniorAdmin))
                {
                    Client target = GetPlayerByNameOrID(targetName);
                    if (target != null)
                    {
                        target.Position = new Vector3(player.Position.X + 1f,
                                                      player.Position.Y,
                                                      player.Position.Z + 1f);
                        SendAdmMsg(player, "You teleported: ~o~" + target.Name + " ~w~to your position.");
                        target.SendChatMessage("[TELEPORTED]: An admin teleported you..");
                        return;
                    }
                    else SendPlayerNotFound(player);
                }
                else SendNoPermMsg(player);
            }
            else SendNoPermMsg(player);
        }

        [Command("kick", "~y~USAGE: ~w~/kick [target] [reason] to kick the target from the server.", GreedyArg = true)]
        public void CMD_Kick(Client player, string targetName, string reason)
        {
            AdminAccount acc = AccountHandler.instance.GetAccount(player);
            if (acc != null)
            {
                if (DoesPlayerHaveAccess(acc.Level, AdminRanks.JuniorAdmin))
                {
                    Client target = GetPlayerByNameOrID(targetName);
                    if (target != null)
                    {
                        NAPI.Player.KickPlayer(target, reason);
                        SendGlobalAdmCmd(target.Name + " was kicked by " + acc.AdminName + ". Reason: " + reason);
                        return;
                    }
                    else SendPlayerNotFound(player);
                }
                else SendNoPermMsg(player);
            }
            else SendNoPermMsg(player);
        }

        [Command("ban", "~y~USAGE: ~w~/ban [target] [reason] to ban the target from the server.", GreedyArg = true)]
        public void CMD_Ban(Client player, string targetName, string reason)
        {
            AdminAccount acc = AccountHandler.instance.GetAccount(player);
            if (acc != null)
            {
                if (DoesPlayerHaveAccess(acc.Level, AdminRanks.Admin))
                {
                    Client target = GetPlayerByNameOrID(targetName);
                    if (target != null)
                    {
                        BanData data = new BanData
                        {
                            SocialClub = target.SocialClubName,
                            HardwareID = target.Serial,
                            IP = target.Address,

                            BannedBy = acc.AdminName,
                            Reason = reason,
                            Date = DateTime.Now
                        };
                        if (Database.instance.BanPlayer(target, data))
                        {
                            // Player doesn't seem to get the kick reason, hence the sendchat has been added.
                            NAPI.Chat.SendChatMessageToPlayer(target, "BANNED: " + reason);
                            NAPI.Player.KickPlayer(target, "BANNED: " + reason);
                            SendGlobalAdmCmd(target.Name + " was banned by " + acc.AdminName + ". Reason: " + reason);
                        }
                        else SendAdmMsg(player, "Something went wrong.. A file for this player already exists!");
                    }
                    else SendPlayerNotFound(player);
                }
                else SendNoPermMsg(player);
            }
            else SendNoPermMsg(player);
        }

        [Command("login", "~y~USAGE: ~w~/login [password] to login to your admin account.", SensitiveInfo = true)]
        public void CMD_Login(Client player, string password)
        {
            if(AccountHandler.instance.GetAccount(player) == null)
            {
                Database.instance.LoginAdmin(player, password);
                return;
            } else
            {
                NAPI.Chat.SendChatMessageToPlayer(player, "~r~ERROR: ~w~You're already logged into your admin account!");
                return;
            }
        }

        [Command("register", "~y~USAGE: ~w~/register [adminName] [password] to register your admin account.", SensitiveInfo = true)]
        public void CMD_Register(Client player, string adminName, string password)
        {
            if (AccountHandler.instance.GetAccount(player) == null)
            {
                if (Database.instance.RegisterAdminAccount(player, adminName, password, defaultAdmLvl))
                {
                    NAPI.Chat.SendChatMessageToPlayer(player, "~g~SUCCESS: ~w~You have successfully registered your admin account.");
                    NAPI.Chat.SendChatMessageToPlayer(player, "~g~INFO: ~w~You have been automatically logged in..Use ~y~/ahelp ~w~to get started.");
                }
                else
                    NAPI.Chat.SendChatMessageToPlayer(player, "~r~ERROR: ~w~An account with the SocialClubName: ~y~" + player.SocialClubName + " ~w~has already been registered.");
            }
            else
            {
                NAPI.Chat.SendChatMessageToPlayer(player, "~r~ERROR: ~w~You already have an admin account registered! Use ~y~/login ~w~instead.");
                return;
            }
        }

        #region Utility
        private Client GetPlayerByNameOrID(string nameOrID)
        {
            foreach (Client c in NAPI.Pools.GetAllPlayers())
            {
                if (c.Handle.ToString() == nameOrID || c.Name.ToLower().Contains(nameOrID.ToLower()))
                {
                    return c;
                }
            }
            return null;
        }

        #region ChatMessages
        private void SendNoPermMsg(Client player)
        {
            NAPI.Chat.SendChatMessageToPlayer(player, "~r~ERROR: ~w~You don't have permission to use this command!");
        }

        private void SendGlobalAdmCmd(string msg)
        {
            NAPI.Chat.SendChatMessageToAll("~r~AdmCmd: " + msg);
        }

        private void SendPlayerNotFound(Client player)
        {
            NAPI.Chat.SendChatMessageToPlayer(player, "~r~ERROR: ~w~Player not found!");
        }

        private void SendAdmMsg(Client player, string msg)
        {
            NAPI.Chat.SendChatMessageToPlayer(player, "~y~AdmCMD: ~w~" + msg);
        }
        #endregion

        private bool DoesPlayerHaveAccess(byte admLvl, AdminRanks requiredRank)
        {
            return admLvl >= (byte)requiredRank ? true : false;
        }
        #endregion
    }
}
