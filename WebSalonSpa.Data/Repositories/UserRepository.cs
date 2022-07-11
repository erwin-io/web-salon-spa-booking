using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Runtime.Caching;
using System.Threading.Tasks;
using WebSalonSpa.Data.DataContext;
using WebSalonSpa.Data.Models;
using WebSalonSpa.Data.Repositories;
using WebSalonSpa.Data.Repositories.Interfaces;

namespace WebSalonSpa.Data.Repositories
{
    public class UserRepository : IUserRepository
    {

        #region Constructor

        public UserRepository()
        {
        }

        #endregion Constructor

        #region Methods

        public async Task<ApplicationUser> GetById(int id)
        {
            using (var ctx = new WebSalonSpaDbContext())
            {
                return await ctx.Users.Where(c => c.Id == id).SingleOrDefaultAsync();
            }
        }
        #endregion Methods
    }
}
