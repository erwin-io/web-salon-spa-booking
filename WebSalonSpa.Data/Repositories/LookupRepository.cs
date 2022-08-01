using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Runtime.Caching;
using System.Threading.Tasks;
using WebSalonSpa.Data.DataContext;
using WebSalonSpa.Data.Repositories;
using WebSalonSpa.Data.Repositories.Interfaces;

namespace WebSalonSpa.Data.Repositories
{
    public class LookupRepository
    {

        #region Constructor

        public LookupRepository()
        {
        }

        #endregion Constructor

        #region Methods

        public async Task<IList<EntityGender>> GetEntityGenders()
        {
            using (var ctx = new WebSalonSpaDbContext())
            {
                return await ctx.EntityGenders.ToListAsync();
            }
        }

        public async Task<IList<BusinessCategory>> GetBusinessCategories()
        {
            using (var ctx = new WebSalonSpaDbContext())
            {
                return await ctx.BusinessCategories.ToListAsync();
            }
        }

        public async Task<IList<City>> GetCities()
        {
            using (var ctx = new WebSalonSpaDbContext())
            {
                return await ctx.Cities.ToListAsync();
            }
        }
        #endregion Methods
    }
}
