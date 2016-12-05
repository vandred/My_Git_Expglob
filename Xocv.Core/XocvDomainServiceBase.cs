using Abp.Domain.Services;

namespace Xocv
{
    public abstract class XocvDomainServiceBase : DomainService
    {
        /* Add your common members for all your domain services. */

        protected XocvDomainServiceBase()
        {
            LocalizationSourceName = XocvConsts.LocalizationSourceName;
        }
    }
}
