using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace moviesite
{
    public class User
    {
        private int userid;
        public int UserId
        {
            get { return userid; }
            set { userid = value; }
        }

        private string username;
        public string UserName
        {
            get { return username; }
            set { username = value; }
        }

        private string password;
        public string PassWord
        {
            get { return password; }
            set { password = value; }
        }

        private string avatar;
        public string Avatar
        {
            get { return avatar; }
            set { avatar = value; }
        }

        private string description;
        public string Description
        {
            get { return description; }
            set { description = value; }
        }

        private bool is_superuser;
        public bool Is_Superuser
        {
            get { return is_superuser; }
            set { is_superuser = value; }
        }

        private DateTime date_joined;
        public DateTime Date_Joined
        {
            get { return date_joined; }
            set { date_joined = value; }
        }

        private DateTime last_lgin;
        public DateTime Last_Login
        {
            get { return last_lgin; }
            set { last_lgin = value; }
        }

        private string name;
        public string Name
        {
            get { return name; }
            set { name = value; }
        }

        private string email;
        public string Email
        {
            get { return email; }
            set { email = value; }
        }
        private string qq;
        public string Qq
        {
            get { return qq; }
            set { qq = value; }
        }
        private string phone;
        public string Phone
        {
            get { return phone; }
            set { phone = value; }
        }
        private string url;
        public string Url
        {
            get { return url; }
            set { url = value; }
        }

        private string address;
        public string Address
        {
            get { return address; }
            set { address = value; }
        }
    }
}