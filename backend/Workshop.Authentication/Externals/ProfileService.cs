using IdentityModel;
using IdentityServer4.Models;
using IdentityServer4.Services;
using System.Threading.Tasks;

namespace Workshop.Authentication.Externals
{
    public class ProfileService : IProfileService
    {
        public ProfileService() { }
        public Task GetProfileDataAsync(ProfileDataRequestContext context)
        {
            //Name
            var nameClaims = context.Subject.FindAll(JwtClaimTypes.Name);
            context.IssuedClaims.AddRange(nameClaims);

            //Role
            var roleClaims = context.Subject.FindAll(JwtClaimTypes.Role);
            context.IssuedClaims.AddRange(roleClaims);

            //Email
            var emailClaims = context.Subject.FindAll(JwtClaimTypes.Email);
            context.IssuedClaims.AddRange(emailClaims);

            return Task.CompletedTask;
        }

        public Task IsActiveAsync(IsActiveContext context)
        {
            return Task.CompletedTask;
        }
    }
}
