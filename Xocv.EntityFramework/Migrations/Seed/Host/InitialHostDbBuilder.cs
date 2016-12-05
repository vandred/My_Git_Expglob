using Xocv.EntityFramework;

namespace Xocv.Migrations.Seed.Host
{
    public class InitialHostDbBuilder
    {
        private readonly XocvDbContext _context;

        public InitialHostDbBuilder(XocvDbContext context)
        {
            _context = context;
        }

        public void Create()
        {
            new DefaultEditionCreator(_context).Create();
            new DefaultLanguagesCreator(_context).Create();
            new HostRoleAndUserCreator(_context).Create();
            new DefaultSettingsCreator(_context).Create();

            _context.SaveChanges();
        }
    }
}
