using System.Data.SqlClient;
using Shouldly;
using Xunit;

namespace Xocv.Tests.General
{
    public class ConnectionString_Tests
    {
        [Fact]
        public void SqlConnectionStringBuilder_Test()
        {
            var csb = new SqlConnectionStringBuilder("Server=localhost; Database=Xocv; Trusted_Connection=True;");
            csb["Database"].ShouldBe("Xocv");
        }
    }
}
