﻿using System.Web;
using System.Web.Mvc;

namespace Mvc3SimpleDemo
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}
