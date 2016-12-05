using System.Collections.Generic;
using Abp.Dependency;
using Abp.RealTime;

namespace Xocv.Authorization.Users
{
    public interface IUserLogoutInformer
    {
        void InformClients(IReadOnlyList<IOnlineClient> clients);
    }
}
