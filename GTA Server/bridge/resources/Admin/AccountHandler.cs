using GTANetworkAPI;

namespace Admin
{
    public class AccountHandler : Script
    {
        public static AccountHandler instance;

        [ServerEvent(Event.ResourceStart)]
        public void OnResourceStart()
        {
            if (instance != null)
                NAPI.Util.ConsoleOutput("WARNING: An instance of 'AccountHandler.cs' has already been declared!");
            else
                instance = this;
        }

        public AdminAccount GetAccount(Client player)
        {
            return player.HasData("Account") ? player.GetData("Account") : null;
        }

        public AdminAccount InitAccount(Client player, object[] data)
        {
            if (player != null && data != null)
            {
                AdminAccount acc = new AdminAccount();

                acc.SocialClub = (string)data[0];
                acc.AdminName = (string)data[1];
                acc.Level = (byte)data[2];
                acc.Password = (string)data[3];

                player.SetData("Account", acc);
                return acc;
            }
            else return null;
        }
    }
}
