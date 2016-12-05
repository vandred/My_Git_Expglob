using System.Data.Common;
using System.Data.Entity;
using Abp.Zero.EntityFramework;
using Xocv.Authorization.Roles;
using Xocv.Authorization.Users;
using Xocv.Chat;
using Xocv.Friendships;
using Xocv.MultiTenancy;
using Xocv.Storage;

namespace Xocv.EntityFramework
{
    public class XocvDbContext : AbpZeroDbContext<Tenant, Role, User>
    {
        /* Define an IDbSet for each entity of the application */

        public virtual IDbSet<BinaryObject> BinaryObjects { get; set; }

        public virtual IDbSet<Friendship> Friendships { get; set; }

        public virtual IDbSet<ChatMessage> ChatMessages { get; set; }

        /* Setting "Default" to base class helps us when working migration commands on Package Manager Console.
         * But it may cause problems when working Migrate.exe of EF. ABP works either way.         * 
         */
        public XocvDbContext()
            : base("Default")
        {
            
        }

        /* This constructor is used by ABP to pass connection string defined in XocvDataModule.PreInitialize.
         * Notice that, actually you will not directly create an instance of XocvDbContext since ABP automatically handles it.
         */
        public XocvDbContext(string nameOrConnectionString)
            : base(nameOrConnectionString)
        {

        }

        /* This constructor is used in tests to pass a fake/mock connection.
         */
        public XocvDbContext(DbConnection dbConnection)
            : base(dbConnection, true)
        {

        }
    }
}
