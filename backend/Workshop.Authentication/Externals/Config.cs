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
                //new ApiResource(BookstoreConstants.AdminClientId, BookstoreConstants.AdminClientName, new [] { JwtClaimTypes.Role })
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
                    ClientId = "web_mvc", //BookstoreConstants.AdminClientId,
                    ClientName = "Web Mvc",//BookstoreConstants.AdminClientName,
                    RequireConsent = false,
                    AllowedGrantTypes = GrantTypes.HybridAndClientCredentials,
                    //ClientSecrets = { new Secret(BookstoreConstants.AuthenSecretKey.Sha256()) },
                    ClientSecrets = { new Secret("Web_Mvc is my secret key".Sha256()) },
                    //"Web_Mvc is my secret key for authentication."
                    RedirectUris = { /*AdminMvcUrl*/ "https://localhost:44350/" + "signin-oidc" },
                    FrontChannelLogoutUri = "https://localhost:44350/" + "signout-oidc",
                    PostLogoutRedirectUris = { "https://localhost:44350/" + "signout-callback-oidc" },

                    AllowOfflineAccess = true,
                    AllowedScopes = { "openid", "profile", "apis", "roles" }

                },
                    new Client
                {
                    ClientId = "react-clients",
                    ClientName = "react-clients",
                    AllowedGrantTypes = GrantTypes.Code,
                    AllowAccessTokensViaBrowser = true,
                    RequireClientSecret = false,
                    RequireConsent = false,
                    RequirePkce = true,
                    RedirectUris = new List<string> {
                        "http://localhost:3000/authentication/login-callback",
                        "http://localhost:3000/"
                    },
                    PostLogoutRedirectUris = new List<string> {
                        "http://localhost:3000/authentication/logout-callback",
                        "http://localhost:3000/" 
                    },
                    AllowedScopes = {
                                      IdentityServerConstants.StandardScopes.OpenId,
                                      IdentityServerConstants.StandardScopes.Profile,
                                      IdentityServerConstants.StandardScopes.Email,
                                      IdentityServerConstants.StandardScopes.Phone
                                     },
                    AllowedCorsOrigins = new List<string>
                    {
                        "http://localhost:3000",
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
