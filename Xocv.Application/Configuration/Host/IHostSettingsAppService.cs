using System.Threading.Tasks;
using Abp.Application.Services;
using Xocv.Configuration.Host.Dto;

namespace Xocv.Configuration.Host
{
    public interface IHostSettingsAppService : IApplicationService
    {
        Task<HostSettingsEditDto> GetAllSettings();

        Task UpdateAllSettings(HostSettingsEditDto input);

        Task SendTestEmail(SendTestEmailInput input);
    }
}
