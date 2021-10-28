using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace Workshop.Authentication.Migrations
{
    public partial class UpdateCode20211028001 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Tasks",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Title = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Description = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Status = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    CreatedDate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    CreatedBy = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    ModifiedDate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    ModifiedBy = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    IsActive = table.Column<bool>(type: "bit", nullable: true),
                    IsDeleted = table.Column<bool>(type: "bit", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Tasks", x => x.Id);
                });

            migrationBuilder.UpdateData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "asdfghjklmnbvcxzqwertyuio01",
                column: "ConcurrencyStamp",
                value: "8676d3fc-cce8-4e98-9d09-11433612059f");

            migrationBuilder.UpdateData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "asdfghjklmnbvcxzqwertyuio02",
                column: "ConcurrencyStamp",
                value: "d61b04c1-02d3-4b12-9dcc-cc63df091e61");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Tasks");

            migrationBuilder.UpdateData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "asdfghjklmnbvcxzqwertyuio01",
                column: "ConcurrencyStamp",
                value: "d90f7e6c-f8ec-45a0-a0a2-566b8800b682");

            migrationBuilder.UpdateData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "asdfghjklmnbvcxzqwertyuio02",
                column: "ConcurrencyStamp",
                value: "f270d3c5-2209-46f4-83b3-be44e73317d3");
        }
    }
}
