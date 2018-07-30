using System;

namespace Admin
{
    public class BanData
    {
        public string SocialClub { get; set; }
        public string HardwareID { get; set; }
        public string IP { get; set; }

        public string BannedBy { get; set; }
        public string Reason { get; set; }
        public DateTime Date { get; set; }
    }
}
