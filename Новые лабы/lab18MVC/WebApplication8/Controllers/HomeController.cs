using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Mvc3SimpleDemo.Models;

namespace Mvc3SimpleDemo.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View(UserDataStorage.Instance.GetAllUsers().OrderBy(x => x.UserName));
        }

        public ActionResult Details(int id)
        {
            return View(UserDataStorage.Instance.GetUserByUserId(id));
        }
        public ActionResult Edit(int id)
        {
            return View(UserDataStorage.Instance.GetUserByUserId(id));
        }

        [HttpPost]
        public ActionResult Edit(int id, UserModel model)
        {
            if (!TryUpdateModel(model))
            {
                return View(model);
            }

            UserDataStorage.Instance.UpdateUser(model);
            return View("Details", model);
        }
        public ActionResult Create()
        {
            return View(new UserModel());
        }
        [HttpPost]
        public ActionResult Create(int id, UserModel model)
        {
            if (!TryUpdateModel(model))
            {
                return View(model);
            }

            UserDataStorage.Instance.CreateUser(model);
            return View("Details", model);
        }
        public ActionResult Delete(int id)
        {
            return View(UserDataStorage.Instance.GetUserByUserId(id));
        }
        [HttpPost]
        public ActionResult Delete(int id, FormCollection form)
        {
            UserDataStorage.Instance.GetUserByUserId(id);
            return RedirectToAction("Index");
        }
        public ActionResult About()
        {
            ViewBag.Message = "Welcome to ASP.NET MVC";

            return View();
        }

    }
}