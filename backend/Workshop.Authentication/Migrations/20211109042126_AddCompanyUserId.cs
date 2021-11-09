using Microsoft.EntityFrameworkCore.Migrations;

namespace Workshop.Authentication.Migrations
{
    public partial class AddCompanyUserId : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "CompanyUserId",
                table: "Schedules",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.UpdateData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "asdfghjklmnbvcxzqwertyuio01",
                column: "ConcurrencyStamp",
                value: "2e3b7c4d-97af-481e-af26-66be5be69571");

            migrationBuilder.UpdateData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "asdfghjklmnbvcxzqwertyuio02",
                column: "ConcurrencyStamp",
                value: "2767373f-05f2-423e-b3ce-fc0d301c254e");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "CompanyUserId",
                table: "Schedules");

            migrationBuilder.UpdateData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "asdfghjklmnbvcxzqwertyuio01",
                column: "ConcurrencyStamp",
                value: "91578b6d-a414-4385-a2c6-1aeaf4c58b07");

            migrationBuilder.UpdateData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "asdfghjklmnbvcxzqwertyuio02",
                column: "ConcurrencyStamp",
                value: "c5ee1b33-d08f-4c6d-a207-546b3d6fdf84");
        }
    }
}
