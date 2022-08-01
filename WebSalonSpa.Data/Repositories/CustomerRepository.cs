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
    public class CustomerRepository : ICustomerRepository
    {

        #region Constructor

        public CustomerRepository()
        {
        }

        #endregion Constructor

        #region Methods

        public async Task<Customer> GetById(long id)
        {
            using (var ctx = new WebSalonSpaDbContext())
            {
                //var customers = (from c in await ctx.Customers.ToListAsync()
                //                from g in ctx.EntityGenders
                //                where g.GenderId == c.GenderId && c.CustomerId == id
                //                orderby c.CustomerId
                //                select c).SingleOrDefault();

                //return customers;
                return await ctx.Customers
                    .Include(x => x.EntityGender)
                    .Include(x => x.EntityGender).Where(x => x.CustomerId == id).SingleOrDefaultAsync();
            }
        }

        public async Task<CustomerView> GetByUserId(long id)
        {
            using (var ctx = new WebSalonSpaDbContext())
            {
                return await ctx.CustomerViews
                    .Where(x => x.UserId == id).SingleOrDefaultAsync();
            }
        }

        public async Task<bool> UpdateBasicInfo(Customer model)
        {
            if (model == null)
            {
                throw new ArgumentNullException("Customer");
            }

            using (var ctx = new WebSalonSpaDbContext())
            {
                var exist = await ctx.Customers.AnyAsync(x => x.CustomerId == model.CustomerId);

                if (!exist)
                {
                    throw new ArgumentNullException("Customer");
                }

                Customer customer = new Customer()
                {
                    CustomerId = model.CustomerId,
                    FirstName = model.FirstName,
                    MiddleName = model.MiddleName,
                    LastName = model.LastName,
                    GenderId = model.GenderId,
                    BirthDate = model.BirthDate,
                    CompleteAddress = model.CompleteAddress,
                };

                await ctx.SaveChangesAsync();
            }

            return true;
        }

        public async Task<bool> UpdateContact(Customer model)
        {
            if (model == null)
            {
                throw new ArgumentNullException("Customer");
            }

            using (var ctx = new WebSalonSpaDbContext())
            {
                var exist = await ctx.Customers.AnyAsync(x => x.CustomerId == model.CustomerId);

                if (!exist)
                {
                    throw new ArgumentNullException("Customer");
                }

                Customer customer = new Customer()
                {
                    CustomerId = model.CustomerId,
                    Email = model.Email,
                    PhoneNumber = model.PhoneNumber
                };

                await ctx.SaveChangesAsync();
            }

            return true;
        }
        #endregion Methods
    }
}
