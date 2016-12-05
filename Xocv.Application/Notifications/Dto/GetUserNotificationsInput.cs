using Abp.Notifications;
using Xocv.Dto;

namespace Xocv.Notifications.Dto
{
    public class GetUserNotificationsInput : PagedInputDto
    {
        public UserNotificationState? State { get; set; }
    }
}