using Microsoft.AspNet.Identity.EntityFramework;
using System.Data.Entity;
using System.Data.Entity.Validation;
using WebSalonSpa.Data.Models;
using WebSalonSpa.Data.ViewConfiguration;

namespace WebSalonSpa.Data.DataContext
{
    public class WebSalonSpaDbContext : IdentityDbContext<ApplicationUser, CustomRole,
    int, CustomUserLogin, CustomUserRole, CustomUserClaim>
    {
        private static string _connectionString;
        public WebSalonSpaDbContext()
            : base("ApplicationDbContext")
        {
        }
        public WebSalonSpaDbContext(string connectionString)
            : base(connectionString)
        {
            _connectionString = connectionString;
        }

        public static WebSalonSpaDbContext Create()
        {
            return new WebSalonSpaDbContext();
        }

        public virtual DbSet<User> CompanyUsers { get; set; }
        public virtual DbSet<Business> Businesses { get; set; }
        public virtual DbSet<BusinessCategory> BusinessCategories { get; set; }
        public virtual DbSet<City> Cities { get; set; }
        public virtual DbSet<Customer> Customers { get; set; }
        public virtual DbSet<EntityApprovalStatu> EntityApprovalStatus { get; set; }
        public virtual DbSet<EntityGender> EntityGenders { get; set; }
        public virtual DbSet<EntityStatu> EntityStatus { get; set; }
        public virtual DbSet<File> Files { get; set; }
        //public virtual DbSet<User> Users { get; set; }
        public virtual DbSet<UserType> UserTypes { get; set; }
        public virtual DbSet<BusinessView> BusinessViews { get; set; }
        public virtual DbSet<CustomerView> CustomerViews { get; set; }
        public virtual DbSet<UserView> UserViews { get; set; }
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            // Do not pluralize the db tables
            modelBuilder.Conventions.Remove<System.Data.Entity.ModelConfiguration.Conventions.PluralizingTableNameConvention>();
            base.OnModelCreating(modelBuilder);
            modelBuilder.Entity<ApplicationUser>()
                .ToTable("Users", "dbo").Property(p => p.Id).HasColumnName("UserId");

            modelBuilder.Entity<BusinessCategory>()
                .HasMany(e => e.Businesses)
                .WithRequired(e => e.BusinessCategory)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<City>()
                .HasMany(e => e.Businesses)
                .WithRequired(e => e.City)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<EntityGender>()
                .HasMany(e => e.Customers)
                .WithRequired(e => e.EntityGender)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<EntityStatu>()
                .HasMany(e => e.Customers)
                .WithRequired(e => e.EntityStatu)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<User>()
                .HasMany(e => e.Businesses)
                .WithRequired(e => e.User)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<User>()
                .HasMany(e => e.Customers)
                .WithRequired(e => e.User)
                .WillCascadeOnDelete(false);

            modelBuilder.Configurations.Add(new UserViewConfiguration());
            modelBuilder.Configurations.Add(new BusinessViewConfiguration());
            modelBuilder.Configurations.Add(new CustomerViewConfiguration());
        }


        public override int SaveChanges()
        {
            try
            {
                return base.SaveChanges();
            }
            catch (DbEntityValidationException e)
            {
                throw e;
            }
        }
    }
}
