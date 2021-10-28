using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using Workshop.Common;
using Workshop.Common.Models;

namespace Workshop.Authentication.Models
{
  public class DatabaseContext : IdentityDbContext<ApplicationUser>
  {
    public DatabaseContext(DbContextOptions<DatabaseContext> options)
        : base(options)
    {
    }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
      base.OnModelCreating(modelBuilder);

      modelBuilder.Entity<IdentityRole>().HasData(
          new IdentityRole()
          {
            Id = "asdfghjklmnbvcxzqwertyuio01",
            Name = WorkshopConstants.SuperUserRole,
            NormalizedName = WorkshopConstants.SuperUserRole
          },
          new IdentityRole()
          {
            Id = "asdfghjklmnbvcxzqwertyuio02",
            Name = WorkshopConstants.UserRole,
            NormalizedName = WorkshopConstants.UserRole
          }
      );
    }

    public virtual DbSet<TaskModel> Tasks { get; set; }

  }
}
