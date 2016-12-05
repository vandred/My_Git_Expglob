using System.Collections.Generic;
using Abp.Application.Services.Dto;
using Xocv.Authorization.Permissions.Dto;

namespace Xocv.Authorization.Users.Dto
{
    public class GetUserPermissionsForEditOutput
    {
        public List<FlatPermissionDto> Permissions { get; set; }

        public List<string> GrantedPermissionNames { get; set; }
    }
}