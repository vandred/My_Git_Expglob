using Abp.Application.Services;
using Abp.Application.Services.Dto;
using Xocv.Authorization.Permissions.Dto;

namespace Xocv.Authorization.Permissions
{
    public interface IPermissionAppService : IApplicationService
    {
        ListResultDto<FlatPermissionWithLevelDto> GetAllPermissions();
    }
}
