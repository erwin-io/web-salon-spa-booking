using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WebSalonSpa.Data.DataContext;

namespace WebSalonSpa.Data.Repositories.Interfaces
{
    public interface IBusinessRepository
    {
        Task<Business> GetById(long BusinessId);
        Task<BusinessView> GetByUserId(long UserId);
        Task<IList<BusinessView>> SearchBusiness();
        Task<bool> UpdateBasicInfo(Business model);
        Task<bool> UpdateContact(Business model);
        Task<bool> UpdateAvailability(Business model);
    }
}
