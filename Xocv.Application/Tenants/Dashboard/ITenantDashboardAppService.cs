using Abp.Application.Services;
using Xocv.Tenants.Dashboard.Dto;

namespace Xocv.Tenants.Dashboard
{
    public interface ITenantDashboardAppService : IApplicationService
    {
        GetMemberActivityOutput GetMemberActivity();
    }
}
