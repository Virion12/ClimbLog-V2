import 'package:climblog_mobile/Services/local_db/workout_service.dart';

class PredefinedWorkoutPlans {
  static List<PredefinedPlan> getAllPlans() {
    return [
      strengthAndPowerPlan,
      beginnerFoundationPlan,
      techniqueEfficiencyPlan,
      enduranceStaminaPlan,
      outdoorProjectPlan,
      competitionReadinessPlan,
      fingerStrengthPlan,
    ];
  }

  static PredefinedPlan get strengthAndPowerPlan => PredefinedPlan(
    name: "Strength & Power Plan",
    backgroundImage: './assets/plan1.jpg',
    days: [
      WorkoutDayInput(
        dayOfWeek: 1,
        sessions: [
          WorkoutSessionInput(
            name: "Max Power & Pull Strength",
            location: "Climbing Gym",
            start: "18:00",
            exercises: [
              ExerciseInput(name: "Campus Board Ladders", setNumber: 6, repNumber: 8, breakTime: 180),
              ExerciseInput(name: "Limit Bouldering", setNumber: 6, time: 300, breakTime: 240),
              ExerciseInput(name: "One Arm Lock-offs", setNumber: 4, time: 10, breakTime: 120),
              ExerciseInput(name: "Explosive Pull-ups", setNumber: 4, repNumber: 8, breakTime: 90),
            ],
          ),
        ],
      ),
      WorkoutDayInput(
        dayOfWeek: 2,
        sessions: [
          WorkoutSessionInput(
            name: "Fingerboard Strength",
            location: "Home",
            start: "19:00",
            exercises: [
              ExerciseInput(name: "20mm Edge Max Hangs", setNumber: 6, time: 10, breakTime: 180),
              ExerciseInput(name: "Half Crimp 10s Holds", setNumber: 5, time: 10, breakTime: 150),
              ExerciseInput(name: "Pinch Block Holds", setNumber: 4, time: 12, breakTime: 120),
              ExerciseInput(name: "Theraband Finger Extensions", setNumber: 3, repNumber: 20, breakTime: 60),
            ],
          ),
        ],
      ),
      WorkoutDayInput(
        dayOfWeek: 4,
        sessions: [
          WorkoutSessionInput(
            name: "Power Endurance Circuit",
            location: "Home Wall",
            start: "18:00",
            exercises: [
              ExerciseInput(name: "4x4 Boulder Circuit", setNumber: 4, repNumber: 4, breakTime: 180),
              ExerciseInput(name: "Hard Problem Linking", setNumber: 3, time: 240, breakTime: 180),
              ExerciseInput(name: "Core Circuit (L-Sit, Leg Raises)", setNumber: 3, time: 300, breakTime: 90),
              ExerciseInput(name: "Stretching / Shoulder Mobility", time: 600, breakTime: 0),
            ],
          ),
        ],
      ),
      WorkoutDayInput(
        dayOfWeek: 6,
        sessions: [
          WorkoutSessionInput(
            name: "Dynamic Movement Training",
            location: "Gym",
            start: "10:00",
            exercises: [
              ExerciseInput(name: "Dynos on Boulders", setNumber: 6, repNumber: 3, breakTime: 180),
              ExerciseInput(name: "Coordination Problems", setNumber: 5, repNumber: 2, breakTime: 180),
              ExerciseInput(name: "Slab Power Balance", setNumber: 3, time: 300, breakTime: 90),
              ExerciseInput(name: "Mobility & Stretch", time: 900, breakTime: 0),
            ],
          ),
        ],
      ),
    ],
  );

  static PredefinedPlan get beginnerFoundationPlan => PredefinedPlan(
    name: "Beginner Foundation Plan",
    backgroundImage: './assets/plan2.jpg',
    days: [
      WorkoutDayInput(
        dayOfWeek: 1,
        sessions: [
          WorkoutSessionInput(
            name: "Movement & Technique",
            start: "18:00",
            exercises: [
              ExerciseInput(name: "Easy Boulders (Fluent Movement)", setNumber: 10, repNumber: 1, breakTime: 60),
              ExerciseInput(name: "Silent Feet Drill", setNumber: 5, repNumber: 3, breakTime: 120),
              ExerciseInput(name: "Foot Swap Practice", setNumber: 4, repNumber: 5, breakTime: 60),
              ExerciseInput(name: "Stretching", time: 600, breakTime: 0),
            ],
          ),
        ],
      ),
      WorkoutDayInput(
        dayOfWeek: 3,
        sessions: [
          WorkoutSessionInput(
            name: "General Strength",
            start: "18:30",
            exercises: [
              ExerciseInput(name: "Pull-ups", setNumber: 4, repNumber: 10, breakTime: 90),
              ExerciseInput(name: "Push-ups", setNumber: 4, repNumber: 15, breakTime: 60),
              ExerciseInput(name: "Plank Holds", setNumber: 3, time: 60, breakTime: 30),
              ExerciseInput(name: "Leg Raises", setNumber: 3, repNumber: 15, breakTime: 60),
            ],
          ),
        ],
      ),
      WorkoutDayInput(
        dayOfWeek: 5,
        sessions: [
          WorkoutSessionInput(
            name: "Endurance Practice",
            start: "18:00",
            exercises: [
              ExerciseInput(name: "Easy Route Laps", setNumber: 4, repNumber: 2, breakTime: 180),
              ExerciseInput(name: "Traversing 10min", setNumber: 2, time: 600, breakTime: 120),
              ExerciseInput(name: "Core Routine", setNumber: 3, time: 300, breakTime: 60),
            ],
          ),
        ],
      ),
      WorkoutDayInput(
        dayOfWeek: 7,
        sessions: [
          WorkoutSessionInput(
            name: "Mobility & Stretch",
            start: "09:00",
            exercises: [
              ExerciseInput(name: "Shoulder Mobility", time: 600, breakTime: 0),
              ExerciseInput(name: "Hip Openers", time: 600, breakTime: 0),
              ExerciseInput(name: "Breathing & Recovery", time: 600, breakTime: 0),
            ],
          ),
        ],
      ),
    ],
  );

  static PredefinedPlan get fingerStrengthPlan => PredefinedPlan(
    name: "Finger Strength Plan",
    backgroundImage: './assets/plan3.jpg',
    days: [
      WorkoutDayInput(
        dayOfWeek: 1,
        sessions: [
          WorkoutSessionInput(
            name: "Max Hangs",
            location: "Home",
            start: "18:00",
            exercises: [
              ExerciseInput(name: "20mm Edge Hang", setNumber: 6, time: 10, breakTime: 180),
              ExerciseInput(name: "15mm Half Crimp", setNumber: 5, time: 8, breakTime: 180),
              ExerciseInput(name: "Open Hand 25mm Edge", setNumber: 5, time: 10, breakTime: 180),
              ExerciseInput(name: "Pinch Block Lift", setNumber: 4, repNumber: 10, breakTime: 120),
            ],
          ),
        ],
      ),
      WorkoutDayInput(
        dayOfWeek: 3,
        sessions: [
          WorkoutSessionInput(
            name: "Repeaters",
            start: "18:00",
            exercises: [
              ExerciseInput(name: "7-3 Repeaters (20mm Edge)", setNumber: 6, time: 420, breakTime: 180),
              ExerciseInput(name: "Grip Switch Repeaters", setNumber: 5, time: 360, breakTime: 120),
              ExerciseInput(name: "Antagonist Theraband", setNumber: 3, repNumber: 20, breakTime: 60),
            ],
          ),
        ],
      ),
      WorkoutDayInput(
        dayOfWeek: 5,
        sessions: [
          WorkoutSessionInput(
            name: "Finger Conditioning + Recovery",
            start: "17:30",
            exercises: [
              ExerciseInput(name: "Rice Bucket Rotations", setNumber: 3, repNumber: 20, breakTime: 60),
              ExerciseInput(name: "Extensor Band Work", setNumber: 3, repNumber: 20, breakTime: 60),
              ExerciseInput(name: "Stretching Fingers & Forearms", time: 600, breakTime: 0),
            ],
          ),
        ],
      ),
    ],
  );

  static PredefinedPlan get techniqueEfficiencyPlan => PredefinedPlan(
    name: "Technique & Efficiency Plan",
    backgroundImage: './assets/plan4.jpg',
    days: [
      WorkoutDayInput(
        dayOfWeek: 2,
        sessions: [
          WorkoutSessionInput(
            name: "Movement Practice",
            start: "19:00",
            exercises: [
              ExerciseInput(name: "Silent Feet Drill", setNumber: 5, repNumber: 3, breakTime: 120),
              ExerciseInput(name: "Flag Practice", setNumber: 4, repNumber: 5, breakTime: 90),
              ExerciseInput(name: "Downclimb Routes", setNumber: 3, repNumber: 2, breakTime: 180),
              ExerciseInput(name: "Balance Traverses", setNumber: 3, time: 300, breakTime: 120),
            ],
          ),
        ],
      ),
      WorkoutDayInput(
        dayOfWeek: 4,
        sessions: [
          WorkoutSessionInput(
            name: "Flow & Precision",
            start: "18:30",
            exercises: [
              ExerciseInput(name: "Route Reading & Visualization", time: 600, breakTime: 0),
              ExerciseInput(name: "Continuous Climbing 15min", setNumber: 2, time: 900, breakTime: 180),
              ExerciseInput(name: "Foot Accuracy Drills", setNumber: 3, repNumber: 10, breakTime: 60),
            ],
          ),
        ],
      ),
    ],
  );

  static PredefinedPlan get enduranceStaminaPlan => PredefinedPlan(
    name: "Endurance & Stamina Plan",
    backgroundImage: './assets/plan5.jpg',
    days: [
      WorkoutDayInput(
        dayOfWeek: 1,
        sessions: [
          WorkoutSessionInput(
            name: "ARC Training",
            start: "18:00",
            exercises: [
              ExerciseInput(name: "Continuous Climbing", time: 1800, breakTime: 300),
              ExerciseInput(name: "Easy Traverses", time: 1200, breakTime: 120),
            ],
          ),
        ],
      ),
      WorkoutDayInput(
        dayOfWeek: 3,
        sessions: [
          WorkoutSessionInput(
            name: "4x4 Circuits",
            start: "18:30",
            exercises: [
              ExerciseInput(name: "Boulder Sets", setNumber: 4, repNumber: 4, breakTime: 240),
              ExerciseInput(name: "Grip Repeaters", setNumber: 4, time: 420, breakTime: 180),
              ExerciseInput(name: "Core Stability", setNumber: 3, time: 300, breakTime: 60),
            ],
          ),
        ],
      ),
      WorkoutDayInput(
        dayOfWeek: 5,
        sessions: [
          WorkoutSessionInput(
            name: "Aerobic Capacity",
            start: "18:00",
            exercises: [
              ExerciseInput(name: "Route Laps", setNumber: 6, repNumber: 1, breakTime: 180),
              ExerciseInput(name: "Jogging / Skipping", time: 900, breakTime: 0),
            ],
          ),
        ],
      ),
    ],
  );

  static PredefinedPlan get outdoorProjectPlan => PredefinedPlan(
    name: "Outdoor Project Preparation Plan",
    backgroundImage: './assets/plan6.jpg',
    days: [
      WorkoutDayInput(
        dayOfWeek: 2,
        sessions: [
          WorkoutSessionInput(
            name: "Power Endurance",
            start: "18:00",
            exercises: [
              ExerciseInput(name: "Linked Problems", setNumber: 3, time: 300, breakTime: 180),
              ExerciseInput(name: "Rest Simulation", time: 120, breakTime: 0),
              ExerciseInput(name: "Core Routine", setNumber: 3, time: 300, breakTime: 60),
            ],
          ),
        ],
      ),
      WorkoutDayInput(
        dayOfWeek: 5,
        sessions: [
          WorkoutSessionInput(
            name: "Crux Simulation",
            location: "Home Wall",
            start: "19:00",
            exercises: [
              ExerciseInput(name: "Crux Repeats", setNumber: 6, repNumber: 2, breakTime: 300),
              ExerciseInput(name: "Lock-off Practice", setNumber: 3, repNumber: 10, breakTime: 120),
              ExerciseInput(name: "Mobility Recovery", time: 900, breakTime: 0),
            ],
          ),
        ],
      ),
      WorkoutDayInput(
        dayOfWeek: 6,
        sessions: [
          WorkoutSessionInput(
            name: "Outdoor Session",
            location: "Crag",
            start: "09:00",
            exercises: [
              ExerciseInput(name: "Warm-up Routes", setNumber: 3, repNumber: 1, breakTime: 180),
              ExerciseInput(name: "Project Attempts", setNumber: 6, repNumber: 1, breakTime: 600),
              ExerciseInput(name: "Cooldown Stretching", time: 900, breakTime: 0),
            ],
          ),
        ],
      ),
    ],
  );

  static PredefinedPlan get competitionReadinessPlan => PredefinedPlan(
    name: "Competition Readiness Plan",
    backgroundImage: './assets/plan7.jpg',
    days: [
      WorkoutDayInput(
        dayOfWeek: 1,
        sessions: [
          WorkoutSessionInput(
            name: "Simulation Round",
            start: "18:00",
            exercises: [
              ExerciseInput(name: "Flash Attempts", setNumber: 5, repNumber: 1, breakTime: 300),
              ExerciseInput(name: "Onsight Practice", setNumber: 4, repNumber: 1, breakTime: 360),
              ExerciseInput(name: "Visualization", time: 600, breakTime: 0),
            ],
          ),
        ],
      ),
      WorkoutDayInput(
        dayOfWeek: 3,
        sessions: [
          WorkoutSessionInput(
            name: "Coordination Training",
            start: "18:30",
            exercises: [
              ExerciseInput(name: "Coordination Boulders", setNumber: 5, repNumber: 2, breakTime: 180),
              ExerciseInput(name: "Dynamic Jumps", setNumber: 4, repNumber: 5, breakTime: 120),
              ExerciseInput(name: "Campus Board", setNumber: 4, repNumber: 8, breakTime: 240),
            ],
          ),
        ],
      ),
      WorkoutDayInput(
        dayOfWeek: 5,
        sessions: [
          WorkoutSessionInput(
            name: "Tapering + Recovery",
            start: "17:00",
            exercises: [
              ExerciseInput(name: "Light Boulder Flow", setNumber: 4, time: 300, breakTime: 90),
              ExerciseInput(name: "Mobility & Stretch", time: 900, breakTime: 0),
              ExerciseInput(name: "Breathing & Relaxation", time: 600, breakTime: 0),
            ],
          ),
        ],
      ),
    ],
  );
}

class PredefinedPlan {
  final String name;
  final String backgroundImage;
  final List<WorkoutDayInput> days;

  const PredefinedPlan({
    required this.name,
    required this.backgroundImage,
    required this.days,
  });
}
