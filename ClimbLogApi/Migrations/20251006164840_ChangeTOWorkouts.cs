using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace ClimbLogApi.Migrations
{
    /// <inheritdoc />
    public partial class ChangeTOWorkouts : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Excercises_WorkoutPlans_WorkoutPlanId",
                table: "Excercises");

            migrationBuilder.DropForeignKey(
                name: "FK_WorkoutPlans_Users_UserID",
                table: "WorkoutPlans");

            migrationBuilder.RenameColumn(
                name: "UserID",
                table: "WorkoutPlans",
                newName: "UserId");

            migrationBuilder.RenameIndex(
                name: "IX_WorkoutPlans_UserID",
                table: "WorkoutPlans",
                newName: "IX_WorkoutPlans_UserId");

            migrationBuilder.RenameColumn(
                name: "WorkoutPlanId",
                table: "Excercises",
                newName: "WorkoutSessionId");

            migrationBuilder.RenameIndex(
                name: "IX_Excercises_WorkoutPlanId",
                table: "Excercises",
                newName: "IX_Excercises_WorkoutSessionId");

            migrationBuilder.AddColumn<string>(
                name: "Name",
                table: "Excercises",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.CreateTable(
                name: "WorkoutDays",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    WorkoutPlanId = table.Column<int>(type: "int", nullable: false),
                    WorkoutDayOfWeek = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_WorkoutDays", x => x.Id);
                    table.ForeignKey(
                        name: "FK_WorkoutDays_WorkoutPlans_WorkoutPlanId",
                        column: x => x.WorkoutPlanId,
                        principalTable: "WorkoutPlans",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "WorkoutSessions",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    WorkoutDayId = table.Column<int>(type: "int", nullable: false),
                    Start = table.Column<TimeSpan>(type: "time", nullable: false),
                    Location = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_WorkoutSessions", x => x.Id);
                    table.ForeignKey(
                        name: "FK_WorkoutSessions_WorkoutDays_WorkoutDayId",
                        column: x => x.WorkoutDayId,
                        principalTable: "WorkoutDays",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_WorkoutDays_WorkoutPlanId",
                table: "WorkoutDays",
                column: "WorkoutPlanId");

            migrationBuilder.CreateIndex(
                name: "IX_WorkoutSessions_WorkoutDayId",
                table: "WorkoutSessions",
                column: "WorkoutDayId");

            migrationBuilder.AddForeignKey(
                name: "FK_Excercises_WorkoutSessions_WorkoutSessionId",
                table: "Excercises",
                column: "WorkoutSessionId",
                principalTable: "WorkoutSessions",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_WorkoutPlans_Users_UserId",
                table: "WorkoutPlans",
                column: "UserId",
                principalTable: "Users",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Excercises_WorkoutSessions_WorkoutSessionId",
                table: "Excercises");

            migrationBuilder.DropForeignKey(
                name: "FK_WorkoutPlans_Users_UserId",
                table: "WorkoutPlans");

            migrationBuilder.DropTable(
                name: "WorkoutSessions");

            migrationBuilder.DropTable(
                name: "WorkoutDays");

            migrationBuilder.DropColumn(
                name: "Name",
                table: "Excercises");

            migrationBuilder.RenameColumn(
                name: "UserId",
                table: "WorkoutPlans",
                newName: "UserID");

            migrationBuilder.RenameIndex(
                name: "IX_WorkoutPlans_UserId",
                table: "WorkoutPlans",
                newName: "IX_WorkoutPlans_UserID");

            migrationBuilder.RenameColumn(
                name: "WorkoutSessionId",
                table: "Excercises",
                newName: "WorkoutPlanId");

            migrationBuilder.RenameIndex(
                name: "IX_Excercises_WorkoutSessionId",
                table: "Excercises",
                newName: "IX_Excercises_WorkoutPlanId");

            migrationBuilder.AddForeignKey(
                name: "FK_Excercises_WorkoutPlans_WorkoutPlanId",
                table: "Excercises",
                column: "WorkoutPlanId",
                principalTable: "WorkoutPlans",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_WorkoutPlans_Users_UserID",
                table: "WorkoutPlans",
                column: "UserID",
                principalTable: "Users",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
