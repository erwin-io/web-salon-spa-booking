using System;
using System.Collections.Generic;
using System.Data.Entity.ModelConfiguration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WebSalonSpa.Data.DataContext;

namespace WebSalonSpa.Data.ViewConfiguration
{
    public class UserViewConfiguration : EntityTypeConfiguration<UserView>
    {
        public UserViewConfiguration()
        {
            this.HasKey(t => t.UserId);
            this.ToTable("UserView");
        }
    }
}
