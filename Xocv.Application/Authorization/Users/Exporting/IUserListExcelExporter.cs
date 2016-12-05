using System.Collections.Generic;
using Xocv.Authorization.Users.Dto;
using Xocv.Dto;

namespace Xocv.Authorization.Users.Exporting
{
    public interface IUserListExcelExporter
    {
        FileDto ExportToFile(List<UserListDto> userListDtos);
    }
}