namespace Xocv.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Star_1 : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.AbpUsers", "EmailConfirmationCode", c => c.String(maxLength: 328));
        }
        
        public override void Down()
        {
            AlterColumn("dbo.AbpUsers", "EmailConfirmationCode", c => c.String(maxLength: 128));
        }
    }
}
