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
                return await ctx.Businesses.Where(c => c.BusinessId == id).SingleOrDefaultAsync();
            }
        }

        public async Task<Business> GetByUserId(long id)
        {
            using (var ctx = new WebSalonSpaDbContext())
            {
                return await ctx.Businesses.Where(c => c.UserId == id).SingleOrDefaultAsync();
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
                var exist = await ctx.Businesses.AnyAsync(c => c.BusinessId == model.BusinessId);

                if (!exist)
                {
                    throw new ArgumentNullException("Business");
                }

                Business customer = new Business()
                {
                    BusinessId = model.BusinessId,
                    FirstName = model.FirstName,
                    LastName = model.LastName,
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
                var exist = await ctx.Businesses.AnyAsync(c => c.BusinessId == model.BusinessId);

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
                var exist = await ctx.Businesses.AnyAsync(c => c.BusinessId == model.BusinessId);

                if (!exist)
                {
                    throw new ArgumentNullException("Business");
                }

                Business customer = new Business()
                {
                    BusinessId = model.BusinessId,
                    OpenHourStart = model.OpenHourStart,
                    OpenHourEnd = model.OpenHourEnd,
                };

                await ctx.SaveChangesAsync();
            }

            return true;
        }
        #endregion Methods
    }
}
