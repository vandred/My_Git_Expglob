using System.Collections.Generic;
using Abp.Application.Services.Dto;
using Xocv.Editions.Dto;

namespace Xocv.MultiTenancy.Dto
{
    public class GetTenantFeaturesForEditOutput
    {
        public List<NameValueDto> FeatureValues { get; set; }

        public List<FlatFeatureDto> Features { get; set; }
    }
}