using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WebSalonSpa.Data.DataContext;

namespace WebSalonSpa.Data.Repositories.Interfaces
{
    public interface ICustomerRepository
    {
        Task<Customer> GetById(long id);
        Task<Customer> GetByUserId(long id);
        Task<bool> UpdateBasicInfo(Customer model);
        Task<bool> UpdateContact(Customer model);
    }
}
