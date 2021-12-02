using IdentityModel;
using IdentityServer4;
using IdentityServer4.Models;
using System.Collections.Generic;

namespace Workshop.Authentication.Externals
{
    public static class Config
    {
        public static IEnumerable<IdentityResource> GetIdentityResources()
        {
            return new IdentityResource[]
            {
                new IdentityResources.OpenId(),
                new IdentityResources.Profile(),
                new IdentityResources.Email(),
                new IdentityResources.Phone(),
                new IdentityResource("roles", new[] { JwtClaimTypes.Role })
            };
        }

        public static IEnumerable<ApiResource> GetApis()
        {
            return new ApiResource[]
            {
                new ApiResource("apis","My API"),
                //new ApiResource(WorkshopConstants.AdminClientId, WorkshopConstants.AdminClientName, new [] { JwtClaimTypes.Role })
                new ApiResource("web_mvc", "Web Mvc", new [] { JwtClaimTypes.Role })
            };
        }

        public static IEnumerable<Client> GetClients()
        {
            return new[]
            {
                //Admin Mvc
                new Client
                {
                    ClientId = "web_mvc", //WorkshopConstants.AdminClientId,
                    ClientName = "Web Mvc",//WorkshopConstants.AdminClientName,
                    RequireConsent = false,
                    AllowedGrantTypes = GrantTypes.HybridAndClientCredentials,
                    //ClientSecrets = { new Secret(WorkshopConstants.AuthenSecretKey.Sha256()) },
                    ClientSecrets = { new Secret("Web_Mvc is my secret key".Sha256()) },
                    //"Web_Mvc is my secret key for authentication."
                    RedirectUris = { /*AdminMvcUrl*/ "https://localhost:44312/" + "signin-oidc" },
                    FrontChannelLogoutUri = "https://localhost:44312/" + "signout-oidc",
                    PostLogoutRedirectUris = { "https://localhost:44312/" + "signout-callback-oidc" },

                    AllowOfflineAccess = true,
                    AllowedScopes = { "openid", "profile", "apis", "roles" }

                },
                    new Client
                {
                    ClientId = "angular_client",
                    ClientName = "angular_client",
                    AllowedGrantTypes = GrantTypes.Code,
                    AllowAccessTokensViaBrowser = true,
                    RequireClientSecret = false,
                    RequireConsent = false,
                    RequirePkce = true,
                    RedirectUris = new List<string> {
                        "http://localhost:4200/login-callback",
                        "http://localhost:4200/"
                    },
                    PostLogoutRedirectUris = new List<string> {
                        "http://localhost:4200/logout-callback",
                        "http://localhost:4200/" 
                    },
                    AllowedScopes = {
                                      IdentityServerConstants.StandardScopes.OpenId,
                                      IdentityServerConstants.StandardScopes.Profile,
                                      IdentityServerConstants.StandardScopes.Email,
                                      IdentityServerConstants.StandardScopes.Phone
                                     },
                    AllowedCorsOrigins = new List<string>
                    {
                        "http://localhost:4200",
                    },
                    AccessTokenLifetime = 86400
                }

            };
        }

        #region Config for Authentication
        public static string AdminMvcUrl { get; set; }
        #endregion
    }
}
