using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WebSalonSpa.Data.DataContext;

namespace WebSalonSpa.Data.Repositories.Interfaces
{
    public interface ILookupRepository
    {
        Task<IList<EntityGender>> GetEntityGenders();
        Task<IList<BusinessCategory>> GetBusinessCategories();
    }
}
