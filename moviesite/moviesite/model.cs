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

    public class Movie
    {
        private int movieid;
        public int MovieId
        {
            get { return movieid; }
            set { movieid = value; }
        }
        private string name;
        public string Name
        {
            get { return name; }
            set { name = value; }
        }
        private string image;
        public string Image
        {
            get { return image; }
            set { image = value; }
        }
        private string summary;
        public string Summary
        {
            get { return summary; }
            set { summary = value; }
        }
        private string isrecommend;
        public string IsRecommend
        {
            get { return isrecommend; }
            set { isrecommend = value; }
        }
        private int clickcount;
        public int Clickount
        {
            get { return clickcount; }
            set { clickcount = value; }
        }
        private string boxoffice;
        public string BoxOffice
        {
            get { return boxoffice; }
            set { boxoffice = value; }
        }
        private double grade;
        public double Grade
        {
            get { return grade; }
            set { grade = value; }
        }
        private string url;
        public string Url
        {
            get { return url; }
            set { url = value; }
        }
        private string password;
        public string Password
        {
            get { return password; }
            set { password = value; }
        }
        private DateTime dateupload;
        public DateTime DateUpload
        {
            get { return dateupload; }
            set { dateupload = value; }
        }
        private string type;
        public string Type
        {
            get { return type; }
            set { type = value; }
        }
        private int duration;
        public int Duration
        {
            get { return duration; }
            set { duration = value; }
        }
        private string director;
        public string Director
        {
            get { return director; }
            set { director = value; }
        }
        private string scriptwriter;
        public string Scriptwriter
        {
            get { return scriptwriter; }
            set { scriptwriter = value; }
        }
        private string actor;
        public string Actor
        {
            get { return actor; }
            set { actor = value; }
        }
        private DateTime date_release;
        public DateTime DateRelease
        {
            get { return date_release; }
            set { date_release = value; }

        
        }
        private string language;
        public string Language
        {
            get { return language; }
            set { language = value; }
        }
        private int category_id;
        public int CategoryId
        {
            get { return category_id; }
            set { category_id = value; }
        }
    }
}