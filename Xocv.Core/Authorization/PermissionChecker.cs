using Abp.Authorization;
using Xocv.Authorization.Roles;
using Xocv.Authorization.Users;
using Xocv.MultiTenancy;

namespace Xocv.Authorization
{
    /// <summary>
    /// Implements <see cref="PermissionChecker"/>.
    /// </summary>
    public class PermissionChecker : PermissionChecker<Tenant, Role, User>
    {
        public PermissionChecker(UserManager userManager)
            : base(userManager)
        {

        }
    }
}
