using Abp.Application.Services;
using Xocv.Dto;
using Xocv.Logging.Dto;

namespace Xocv.Logging
{
    public interface IWebLogAppService : IApplicationService
    {
        GetLatestWebLogsOutput GetLatestWebLogs();

        FileDto DownloadWebLogs();
    }
}
