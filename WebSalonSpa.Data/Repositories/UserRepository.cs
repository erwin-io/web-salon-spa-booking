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

        public async Task<UserView> GetById(int id)
        {
            using (var ctx = new WebSalonSpaDbContext())
            {
                var u = await ctx.UserViews.Where(c => c.UserId == id).SingleOrDefaultAsync();
                return await ctx.UserViews.Where(c => c.UserId == id).SingleOrDefaultAsync();
            }
        }
        #endregion Methods
    }
}
