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
    public class BusinessRepository : IBusinessRepository
    {

        #region Constructor

        public BusinessRepository()
        {
        }

        #endregion Constructor

        #region Methods
        public async Task<Business> GetById(long id)
        {
            using (var ctx = new WebSalonSpaDbContext())
            {
                return await ctx.Businesses
                    .Include(x => x.BusinessCategory)
                    .Where(x => x.BusinessId == id).SingleOrDefaultAsync();
            }
        }

        public async Task<BusinessView> GetByUserId(long id)
        {
            using (var ctx = new WebSalonSpaDbContext())
            {
                return await ctx.BusinessViews
                    .Where(x => x.UserId == id).SingleOrDefaultAsync();
            }
        }

        public async Task<bool> UpdateBasicInfo(Business model)
        {
            if (model == null)
            {
                throw new ArgumentNullException("Business");
            }

            using (var ctx = new WebSalonSpaDbContext())
            {
                var exist = await ctx.Businesses.AnyAsync(x => x.BusinessId == model.BusinessId);

                if (!exist)
                {
                    throw new ArgumentNullException("Business");
                }

                Business customer = new Business()
                {
                    BusinessId = model.BusinessId,
                    BusinessName = model.BusinessName,
                    CityId = model.CityId,
                    BusinessCategoryId = model.BusinessCategoryId,
                    CompleteAddress = model.CompleteAddress,
                    Desciption = model.Desciption
                };

                await ctx.SaveChangesAsync();
            }

            return true;
        }

        public async Task<bool> UpdateContact(Business model)
        {
            if (model == null)
            {
                throw new ArgumentNullException("Business");
            }

            using (var ctx = new WebSalonSpaDbContext())
            {
                var exist = await ctx.Businesses.AnyAsync(x => x.BusinessId == model.BusinessId);

                if (!exist)
                {
                    throw new ArgumentNullException("Business");
                }

                Business customer = new Business()
                {
                    BusinessId = model.BusinessId,
                    BusinessEmail = model.BusinessEmail,
                    PrimaryPhoneNumber = model.PrimaryPhoneNumber,
                    SecondPhoneNumber = model.SecondPhoneNumber,
                };

                await ctx.SaveChangesAsync();
            }

            return true;
        }

        public async Task<bool> UpdateAvailability(Business model)
        {
            if (model == null)
            {
                throw new ArgumentNullException("Business");
            }

            using (var ctx = new WebSalonSpaDbContext())
            {
                var exist = await ctx.Businesses.AnyAsync(x => x.BusinessId == model.BusinessId);

                if (!exist)
                {
                    throw new ArgumentNullException("Business");
                }

                Business customer = new Business()
                {
                    BusinessId = model.BusinessId,
                    TimeOpen = model.TimeOpen,
                    TimeClose = model.TimeClose,
                };

                await ctx.SaveChangesAsync();
            }

            return true;
        }

        public async Task<IList<BusinessView>> SearchBusiness()
        {
            using (var ctx = new WebSalonSpaDbContext())
            {
                var d = await ctx.BusinessViews.ToListAsync();
                return await ctx.BusinessViews.ToListAsync();
            }
        }
        #endregion Methods
    }
}
