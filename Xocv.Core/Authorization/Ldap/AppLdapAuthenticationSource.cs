using Abp.Zero.Ldap.Authentication;
using Abp.Zero.Ldap.Configuration;
using Xocv.Authorization.Users;
using Xocv.MultiTenancy;

namespace Xocv.Authorization.Ldap
{
    public class AppLdapAuthenticationSource : LdapAuthenticationSource<Tenant, User>
    {
        public AppLdapAuthenticationSource(ILdapSettings settings, IAbpZeroLdapModuleConfig ldapModuleConfig)
            : base(settings, ldapModuleConfig)
        {
        }
    }
}
