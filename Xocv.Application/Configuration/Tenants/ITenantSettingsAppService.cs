using System.Threading.Tasks;
using Abp.Application.Services;
using Xocv.Configuration.Tenants.Dto;

namespace Xocv.Configuration.Tenants
{
    public interface ITenantSettingsAppService : IApplicationService
    {
        Task<TenantSettingsEditDto> GetAllSettings();

        Task UpdateAllSettings(TenantSettingsEditDto input);
    }
}
