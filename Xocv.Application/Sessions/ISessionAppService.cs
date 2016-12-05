using System.Threading.Tasks;
using Abp.Application.Services;
using Xocv.Sessions.Dto;

namespace Xocv.Sessions
{
    public interface ISessionAppService : IApplicationService
    {
        Task<GetCurrentLoginInformationsOutput> GetCurrentLoginInformations();
    }
}
