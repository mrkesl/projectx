using System.IO;
using GTANetworkAPI;
using Newtonsoft.Json;
using BCr = BCrypt.Net;

namespace Admin
{
    public class Database : Script
    {
        public static Database instance;

        private const string dataFolderName = "AdminAccounts";
        private const string bannedFolderName = "BannedPlayers";

        [ServerEvent(Event.PlayerConnected)]
        public void OnPlayerConnected(Client player)
        {
            IsPlayerBanned(player);
        }

        [ServerEvent(Event.ResourceStart)]
        public void OnResourceStart()
        {
            if (instance != null)
                NAPI.Util.ConsoleOutput("WARNING: An instance of 'Database.cs' has already been declared!");
            else
                instance = this;
            InitDataFolders();
        }

        private void InitDataFolders()
        {
            Directory.CreateDirectory(Path.Combine(NAPI.Resource.GetResourceFolder(this), dataFolderName));
            Directory.CreateDirectory(Path.Combine(NAPI.Resource.GetResourceFolder(this), bannedFolderName));
        }

        public bool RegisterAdminAccount(Client player, string adminName, string password, byte admLvl)
        {
            string path = Path.Combine(NAPI.Resource.GetResourceFolder(this), dataFolderName, player.SocialClubName.ToString() + ".json");
            if (!File.Exists(path))
            {
                var hashedPass = BCr.BCrypt.HashPassword(password, BCr.BCrypt.GenerateSalt(12));
                object[] data = { player.SocialClubName, adminName, admLvl, hashedPass };
                File.WriteAllText(path, JsonConvert.SerializeObject(AccountHandler.instance.InitAccount(player, data), Formatting.Indented));
                return true;
            }
            else return false;
        }

        public void LoginAdmin(Client player, string password)
        {
            string path = Path.Combine(NAPI.Resource.GetResourceFolder(this), dataFolderName, player.SocialClubName.ToString() + ".json");
            if (File.Exists(path))
            {
                AdminAccount savedAcc = JsonConvert.DeserializeObject<AdminAccount>(File.ReadAllText(path));
                if(BCr.BCrypt.Verify(password, savedAcc.Password))
                {
                    player.SetData("Account", savedAcc);
                    NAPI.Chat.SendChatMessageToPlayer(player, "~g~SUCCESS: ~w~You're now logged into your admin account. Use ~y~/ahelp ~w~to get started.");
                    return;
                }
                else
                {
                    NAPI.Chat.SendChatMessageToPlayer(player, "~r~ERROR: ~w~Wrong password.");
                    return;
                }
            }
            else
            {
                NAPI.Chat.SendChatMessageToPlayer(player, "~r~ERROR: ~w~No admin account found with the SocialClubeName: ~y~" + player.SocialClubName);
                return;
            }
        }

        public bool BanPlayer(Client player, BanData data)
        {
            string path = Path.Combine(NAPI.Resource.GetResourceFolder(this), bannedFolderName, player.SocialClubName.ToString() + ".json");
            if (!File.Exists(path))
            {
                File.WriteAllText(path, JsonConvert.SerializeObject(data, Formatting.Indented));
                return true;
            }
            else return false;
        }
        
        public void IsPlayerBanned(Client player)
        {
            string path = Path.Combine(NAPI.Resource.GetResourceFolder(this), bannedFolderName, player.SocialClubName.ToString() + ".json");
            if (File.Exists(path))
                NAPI.Player.KickPlayer(player, "You're banned..");
        }
    }
}
