using System.Threading.Tasks;
using Abp.Configuration;

namespace Xocv.Timing
{
    public interface ITimeZoneService
    {
        Task<string> GetDefaultTimezoneAsync(SettingScopes scope, int? tenantId);
    }
}
