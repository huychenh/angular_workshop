using IdentityServer4.Services;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using System;
using Workshop.Authentication.Externals;
using Workshop.Authentication.Models;

namespace Workshop.Authentication
{
  public class Startup
  {
    public Startup(IConfiguration configuration)
    {
      Configuration = configuration;
    }

    public IConfiguration Configuration { get; }

    // This method gets called by the runtime. Use this method to add services to the container.
    public void ConfigureServices(IServiceCollection services)
    {

      services.AddDbContext<DatabaseContext>(options =>
          options.UseSqlServer(Configuration.GetConnectionString("DefaultConnection")));

      // Block 1: Add ASP.NET Identity
      services.AddIdentity<ApplicationUser, IdentityRole>(options => options.SignIn.RequireConfirmedEmail = false)
          .AddEntityFrameworkStores<DatabaseContext>()
          .AddDefaultTokenProviders();

      services.AddControllersWithViews();

      services.Configure<IISOptions>(iis =>
      {
        iis.AuthenticationDisplayName = "Windows";
        iis.AutomaticAuthentication = false;
      });

      // Block 2: Add IdentityServer4 with InMemory Configuration
      var builder = services.AddIdentityServer(options =>
      {
        options.Events.RaiseErrorEvents = true;
        options.Events.RaiseInformationEvents = true;
        options.Events.RaiseFailureEvents = true;
        options.Events.RaiseSuccessEvents = true;
      })
      .AddInMemoryIdentityResources(Config.GetIdentityResources())
      .AddInMemoryApiResources(Config.GetApis())
      .AddInMemoryClients(Config.GetClients())
      .AddAspNetIdentity<ApplicationUser>();

      builder.AddDeveloperSigningCredential();

      //services.AddAuthentication("Bearer")
      //        .AddJwtBearer("Bearer", options =>
      //        {
      //          options.Authority = "https://localhost:44386/";
      //          options.RequireHttpsMetadata = true;
      //          options.Audience = "apis";
      //          options.SaveToken = true;

      //         });


      services.ConfigureApplicationCookie(options =>
      {
        options.ExpireTimeSpan = TimeSpan.FromMinutes(1);
      });

      services.AddTransient<IProfileService, ProfileService>();

      services.AddCors(options => options.AddPolicy("AllowAll", p => p.AllowAnyOrigin()
                                        .AllowAnyMethod()
                                        .AllowAnyHeader()));
    }

    // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
    public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
    {
      if (env.IsDevelopment())
      {
        app.UseDeveloperExceptionPage();
      }
      else
      {
        app.UseExceptionHandler("/Home/Error");
        // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
        app.UseHsts();
      }
      app.UseHttpsRedirection();
      app.UseStaticFiles();

      app.UseRouting();

      app.UseIdentityServer();
      app.UseAuthorization();
      app.UseCors("CorsPolicy");

      app.UseEndpoints(endpoints =>
            {
              endpoints.MapControllerRoute(
                  name: "default",
                  pattern: "{controller=Home}/{action=Index}/{id?}");
            });
    }
  }
}
