using Abp.WebApi.Controllers;

namespace Xocv.WebApi
{
    public abstract class XocvApiControllerBase : AbpApiController
    {
        protected XocvApiControllerBase()
        {
            LocalizationSourceName = XocvConsts.LocalizationSourceName;
        }
    }
}