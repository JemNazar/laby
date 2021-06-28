using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Mvc3SimpleDemo.Models
{
    public class UserDataStorage
    {
        public static UserDataStorage Instance = new UserDataStorage();

        private List<UserModel> userList = new List<UserModel>();
        public UserDataStorage()
        {

            this.userList.Add(

                 new UserModel
                 {

                     UserId = 1,
                     UserName = "g_threepwood",
                     FirstName = "Guybrush",
                     LastName = "Threepwood"
                 });
            this.userList.Add(

                new UserModel
                {

                    UserId = 2,
                    UserName = "e_marley",
                    FirstName = "Elaine",
                    LastName = "Marley"
                });

        }

        public List<UserModel> GetAllUsers()
        {

            return this.userList;
        }

        public UserModel GetUserByUserId(int userId)
        {

            return this.userList.Find(x => x.UserId == userId);
        }
        public void UpdateUser(UserModel model)
        {
            var oldModel = this.userList.Find(x => x.UserId == model.UserId);
            
            if (oldModel == null)
            {
                return;
            }
            this.userList.Remove(oldModel);
            this.userList.Add(model);
        }

        public void CreateUser(UserModel model)
        {
            if (this.userList.Exists(x => x.UserName == model.UserName))
            {
                throw new InvalidOperationException();
            }
            model.UserId = this.userList.Max(x => x.UserId) + 1;
            this.userList.Add(model);
            
        }
        public void DeleteUser(int userId)
        {
            var model = this.userList.Find(x => x.UserId == userId);
            if (model == null)
            {
                return;
            }
            this.userList.Remove(model);
        }
    }
}



