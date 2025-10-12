using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace ClimbLogApi.Migrations
{
    /// <inheritdoc />
    public partial class benchmarkv1 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Benchmarks",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserID = table.Column<int>(type: "int", nullable: false),
                    BodyWeight = table.Column<double>(type: "float", nullable: false),
                    Ex1Points = table.Column<int>(type: "int", nullable: false),
                    Ex2Points = table.Column<int>(type: "int", nullable: false),
                    Ex3Points = table.Column<int>(type: "int", nullable: false),
                    Ex4Points = table.Column<int>(type: "int", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Benchmarks", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Benchmarks_Users_UserID",
                        column: x => x.UserID,
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Benchmarks_UserID",
                table: "Benchmarks",
                column: "UserID");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Benchmarks");
        }
    }
}
