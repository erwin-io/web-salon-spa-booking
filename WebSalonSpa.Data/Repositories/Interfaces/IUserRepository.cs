using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WebSalonSpa.Data.DataContext;
using WebSalonSpa.Data.Models;

namespace WebSalonSpa.Data.Repositories.Interfaces
{
    public interface IUserRepository
    {
        Task<ApplicationUser> GetById(int id);
    }
}
