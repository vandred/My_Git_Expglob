using System.Threading.Tasks;
using Abp;
using Abp.Notifications;
using Xocv.Authorization.Users;
using Xocv.MultiTenancy;

namespace Xocv.Notifications
{
    public interface IAppNotifier
    {
        Task WelcomeToTheApplicationAsync(User user);

        Task NewUserRegisteredAsync(User user);

        Task NewTenantRegisteredAsync(Tenant tenant);

        Task SendMessageAsync(UserIdentifier user, string message, NotificationSeverity severity = NotificationSeverity.Info);
    }
}
