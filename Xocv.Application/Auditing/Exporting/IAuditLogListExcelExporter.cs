using System.Collections.Generic;
using Xocv.Auditing.Dto;
using Xocv.Dto;

namespace Xocv.Auditing.Exporting
{
    public interface IAuditLogListExcelExporter
    {
        FileDto ExportToFile(List<AuditLogListDto> auditLogListDtos);
    }
}
