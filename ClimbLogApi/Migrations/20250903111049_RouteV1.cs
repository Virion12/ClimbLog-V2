using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace ClimbLogApi.Migrations
{
    /// <inheritdoc />
    public partial class RouteV1 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "Email",
                table: "Users",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<double>(
                name: "Heigth",
                table: "Users",
                type: "float",
                nullable: false,
                defaultValue: 0.0);

            migrationBuilder.AddColumn<string>(
                name: "Name",
                table: "Users",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "PhotoUrl",
                table: "Users",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<double>(
                name: "Weigth",
                table: "Users",
                type: "float",
                nullable: false,
                defaultValue: 0.0);

            migrationBuilder.CreateTable(
                name: "Routes",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserID = table.Column<int>(type: "int", nullable: false),
                    IsPublic = table.Column<bool>(type: "bit", nullable: false),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Color = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Heigth = table.Column<double>(type: "float", nullable: false),
                    IsPowery = table.Column<bool>(type: "bit", nullable: false),
                    IsSloppy = table.Column<bool>(type: "bit", nullable: false),
                    IsDynamic = table.Column<bool>(type: "bit", nullable: false),
                    IsCrimpy = table.Column<bool>(type: "bit", nullable: false),
                    IsReachy = table.Column<bool>(type: "bit", nullable: false),
                    IsOnsighted = table.Column<bool>(type: "bit", nullable: false),
                    IsRedPointed = table.Column<bool>(type: "bit", nullable: false),
                    IsFlashed = table.Column<bool>(type: "bit", nullable: false),
                    IsFavorite = table.Column<bool>(type: "bit", nullable: false),
                    NumberOfTried = table.Column<int>(type: "int", nullable: false),
                    IsDone = table.Column<bool>(type: "bit", nullable: false),
                    Grade = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Routes", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Routes_Users_UserID",
                        column: x => x.UserID,
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Routes_UserID",
                table: "Routes",
                column: "UserID");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Routes");

            migrationBuilder.DropColumn(
                name: "Email",
                table: "Users");

            migrationBuilder.DropColumn(
                name: "Heigth",
                table: "Users");

            migrationBuilder.DropColumn(
                name: "Name",
                table: "Users");

            migrationBuilder.DropColumn(
                name: "PhotoUrl",
                table: "Users");

            migrationBuilder.DropColumn(
                name: "Weigth",
                table: "Users");
        }
    }
}
