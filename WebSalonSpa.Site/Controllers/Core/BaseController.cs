using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using WebSalonSpa.Data.DataContext;
using WebSalonSpa.Data.Models;
using WebSalonSpa.Data.Repositories;
using WebSalonSpa.Data.Repositories.Interfaces;
using WebSalonSpa.Domain.ViewModel;
using WebSalonSpa.Helpers;
using WebSalonSpa.Mapping;
using WebSalonSpa.Models;
using WebSalonSpa.Site.Helpers;

namespace WebSalonSpa.Site.Controllers.Core
{
    public class BaseController : Controller
    {
        private IUserRepository _userRepository = new UserRepository();
        private LookupRepository _lookupRepository = new LookupRepository();
        public int UserId
        {
            get
            {
                return Convert.ToInt32(User.Identity.GetUserId());
            }
        }
        public async Task<UserViewModel> GetCurrentUser()
        {
            return AutoMapperHelper<UserView, UserViewModel>.Map(await _userRepository.GetById(UserId));
        }
        public async Task GetLookup(string names)
        {
            if(!string.IsNullOrEmpty(names) && names.Split(',').Length > 0)
            {
                foreach(var name in names.Split(','))
                {
                    if (name.ToUpper().Contains(LookupNames.LOOKUP_GENDER))
                    {
                        var data = await _lookupRepository.GetEntityGenders();
                        ViewData[LookupNames.LOOKUP_GENDER] = data.ToList().Select(g => new SelectListItem() { Text = g.GenderName, Value = g.GenderId.ToString() }).ToList();
                    }
                    if (name.ToUpper().Contains(LookupNames.LOOKUP_BUSINESS_CATEGORY))
                    {
                        var data = await _lookupRepository.GetBusinessCategories();
                        ViewData[LookupNames.LOOKUP_BUSINESS_CATEGORY] = data.ToList().Select(g => new SelectListItem() { Text = g.BusinessCategoryName, Value = g.BusinessCategoryId.ToString() }).ToList();
                    }
                    if (name.ToUpper().Contains(LookupNames.LOOKUP_CITY))
                    {
                        var data = await _lookupRepository.GetCities();
                        ViewData[LookupNames.LOOKUP_CITY] = data.ToList().Select(g => new SelectListItem() { Text = g.Name, Value = g.CityId.ToString() }).ToList();
                    }
                }
            }
        }
    }
}