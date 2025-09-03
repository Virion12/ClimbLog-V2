using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace ClimbLogApi.Migrations
{
    /// <inheritdoc />
    public partial class RouteV3 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "ImagePath",
                table: "Routes",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "thumbnailPath",
                table: "Routes",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "ImagePath",
                table: "Routes");

            migrationBuilder.DropColumn(
                name: "thumbnailPath",
                table: "Routes");
        }
    }
}
