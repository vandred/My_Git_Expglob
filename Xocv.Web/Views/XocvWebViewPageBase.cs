using Abp.Dependency;
using Abp.Runtime.Session;
using Abp.Web.Mvc.Views;

namespace Xocv.Web.Views
{
    public abstract class XocvWebViewPageBase : XocvWebViewPageBase<dynamic>
    {
       
    }

    public abstract class XocvWebViewPageBase<TModel> : AbpWebViewPage<TModel>
    {
        public IAbpSession AbpSession { get; private set; }
        
        protected XocvWebViewPageBase()
        {
            AbpSession = IocManager.Instance.Resolve<IAbpSession>();
            LocalizationSourceName = XocvConsts.LocalizationSourceName;
        }
    }
}