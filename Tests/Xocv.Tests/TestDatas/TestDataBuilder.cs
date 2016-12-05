using EntityFramework.DynamicFilters;
using Xocv.EntityFramework;

namespace Xocv.Tests.TestDatas
{
    public class TestDataBuilder
    {
        private readonly XocvDbContext _context;
        private readonly int _tenantId;

        public TestDataBuilder(XocvDbContext context, int tenantId)
        {
            _context = context;
            _tenantId = tenantId;
        }

        public void Create()
        {
            _context.DisableAllFilters();

            new TestOrganizationUnitsBuilder(_context, _tenantId).Create();

            _context.SaveChanges();
        }
    }
}
