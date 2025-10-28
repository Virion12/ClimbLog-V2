import 'package:climblog_mobile/Riverpod/helpers_riverpod.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:climblog_mobile/Services/local_db/route_service.dart';
import 'package:climblog_mobile/database/database.dart';



final routeServiceProvider = Provider<RouteService>((ref) {
  final db = ref.watch(dbProvider);
  return RouteService(db);
});

final selectedDate1Provider = StateProvider<DateTime>((ref) => DateTime.now());
final selectedDate2Provider = StateProvider<DateTime>((ref) => DateTime.now());
final selectedDate3Provider = StateProvider<DateTime>((ref) => DateTime.now());
final selectedDate4Provider = StateProvider<DateTime>((ref) => DateTime.now());


final routesProvider = StreamProvider.autoDispose<List<ClimbingRoute>>((ref) {
  final routeService = ref.watch(routeServiceProvider);

  
  return routeService.watchAllRoutesWithoutToDelete().map((routes) {
    debugPrint("=== Aktualne lokalne drogi ===");
    if (routes.isEmpty) {
      debugPrint("Brak dróg w bazie.");
    } else {
      for (var r in routes) {
        debugPrint(
          "ID: ${r.id}, Name: ${r.name}, Color: ${r.color}, Height: ${r.height}, BackendId: ${r.backendId}"
        );
      }
    }
    debugPrint("=== Koniec listy ===");
    return routes;
  });
});

final selectedRouteProvider = StateProvider<ClimbingRoute?>((ref) => null);


//Filtering Date

enum DateFilterOption {
  all,
  lastDay,
  lastWeek,
  lastMonth,
  last3Months,
  last6Months,
  lastYear,
}


final dataProvider = StateProvider<DateFilterOption>((ref) => DateFilterOption.all);

final filteredRoutesProvider = StreamProvider.autoDispose<List<ClimbingRoute>>((ref) {
  final routeService = ref.watch(routeServiceProvider);
  final filter = ref.watch(dataProvider);

  return routeService.watchAllRoutesWithoutToDelete().map((routes) {
    final now = DateTime.now();
    DateTime? fromDate;

    switch (filter) {
      case DateFilterOption.all:
        fromDate = null;
        break;
      case DateFilterOption.lastDay:
        fromDate = now.subtract(const Duration(days: 1));
        break;
      case DateFilterOption.lastWeek:
        fromDate = now.subtract(const Duration(days: 7));
        break;
      case DateFilterOption.lastMonth:
        fromDate = DateTime(now.year, now.month - 1, now.day);
        break;
      case DateFilterOption.last3Months:
        fromDate = DateTime(now.year, now.month - 3, now.day);
        break;
      case DateFilterOption.last6Months:
        fromDate = DateTime(now.year, now.month - 6, now.day);
        break;
      case DateFilterOption.lastYear:
        fromDate = DateTime(now.year - 1, now.month, now.day);
        break;
    }

    if (fromDate != null) {
      routes = routes.where((r) => r.createdAt.isAfter(fromDate!)).toList();
    }

    return routes;
  });
});

final sortedRoutesProviderTop60 = Provider.autoDispose<List<ClimbingRoute>>((ref) {
  final asyncRoutes = ref.watch(filteredRoutesProvider);

  return asyncRoutes.maybeWhen(
    data: (routes) {
      final sorted = [...routes];

      sorted.sort((a, b) {
        if (a.isFavorite && !b.isFavorite) return -1;
        if (!a.isFavorite && b.isFavorite) return 1;
        return b.createdAt.compareTo(a.createdAt);
      });

      return sorted.take(30).toList();
    },
    orElse: () => [],
  );
});

final climbingRoutesStreamProviderForChartdata1 = StreamProvider<List<ClimbingRoute>>((ref) {
  final routeService = ref.watch(routeServiceProvider);
  final startDate = ref.watch(selectedDate1Provider);
  final endDate = ref.watch(selectedDate2Provider);

  return routeService.getRoutesByDateRange(startDate, endDate);
});

final climbingRoutesStreamProviderForChartdata2 = StreamProvider<List<ClimbingRoute>>((ref) {
  final routeService = ref.watch(routeServiceProvider);
  final startDate = ref.watch(selectedDate3Provider);
  final endDate = ref.watch(selectedDate4Provider);

  return routeService.getRoutesByDateRange(startDate, endDate);
});

final List<String> climbingGrades = [
  "4a", "4a+", "4b", "4b+", "4c", "4c+",
  "5a", "5a+", "5b", "5b+", "5c", "5c+",
  "6a", "6a+", "6b", "6b+", "6c", "6c+",
  "7a", "7a+", "7b", "7b+", "7c", "7c+",
  "8a", "8a+", "8b", "8b+", "8c", "8c+",
  "9a", "9a+", "9b", "9b+", "9c"
];

final highestGradeProvider = Provider.autoDispose<String?>((ref) {
  final routesAsync = ref.watch(routesProvider);

  return routesAsync.when(
    data: (routes) {
      if (routes.isEmpty) return null;

      int maxIndex = -1;
      String? highestGrade;

      for (final route in routes) {
        final index = climbingGrades.indexOf(route.grade);
        if (index > maxIndex) {
          maxIndex = index;
          highestGrade = route.grade;
        }
      }

      return highestGrade;
    },
    loading: () => null,
    error: (err, _) => null,
  );
});

final totalHeightProvider = Provider<double>((ref) {
  final routesAsync = ref.watch(routesProvider);
  
  return routesAsync.maybeWhen(
    data: (routes) => routes.fold<double>(0.0, (sum, route) => sum + route.height),
    orElse: () => 0.0,
  );
});

class Mountain {
  final String name;
  final int heightMeters;

  const Mountain(this.name, this.heightMeters);
}
final List<Mountain> mountains = [
  Mountain("Mount Everest", 8849),
  Mountain("K2", 8611),
  Mountain("Kangchenjunga", 8586),
  Mountain("Lhotse", 8516),
  Mountain("Makalu", 8485),
  Mountain("Cho Oyu", 8188),
  Mountain("Dhaulagiri", 8167),
  Mountain("Manaslu", 8163),
  Mountain("Nanga Parbat", 8126),
  Mountain("Gasherbrum I", 8080),
  Mountain("Broad Peak", 8051),
  Mountain("Gasherbrum II", 8035),
  Mountain("Gyachung Kang", 7952),
  Mountain("Gasherbrum III", 7946),
  Mountain("Annapurna II", 7937),
  Mountain("Gasherbrum IV", 7925),
  Mountain("Distaghil Sar", 7885),
  Mountain("Kongur Tagh", 7649),
  Mountain("Muztagh Ata", 7546),
  Mountain("Aconcagua", 6961),
  Mountain("Ojos del Salado", 6893),
  Mountain("Huascarán", 6768),
  Mountain("Mercedario", 6720),
  Mountain("Tupungato", 6570),
  Mountain("Sajama", 6542),
  Mountain("Illimani", 6438),
  Mountain("Chimborazo", 6263),
  Mountain("Denali", 6190),
  Mountain("Mount Logan", 5959),
  Mountain("Cotopaxi", 5897),
  Mountain("Kilimanjaro", 5895),
  Mountain("Elbrus", 5642),
  Mountain("Pico de Orizaba", 5636),
  Mountain("Mount Saint Elias", 5489),
  Mountain("Popocatépetl", 5426),
  Mountain("Dykh-Tau", 5205),
  Mountain("Mount Kenya", 5199),
  Mountain("Shkhara", 5193),
  Mountain("Koshtan-Tau", 5152),
  Mountain("Kazbek", 5047),
  Mountain("Mont Blanc", 4808),
  Mountain("Dufourspitze", 4634),
  Mountain("Monte Rosa", 4634),
  Mountain("Mount Meru", 4566),
  Mountain("Ras Dashen", 4550),
  Mountain("Weisshorn", 4505),
  Mountain("Matterhorn", 4478),
  Mountain("Mount Whitney", 4421),
  Mountain("Mount Elbert", 4401),
  Mountain("Mount Massive", 4398),
  Mountain("Mount Rainier", 4392),
  Mountain("Dent Blanche", 4357),
  Mountain("Mount Shasta", 4322),
  Mountain("Grand Combin", 4314),
  Mountain("Pikes Peak", 4302),
  Mountain("Finsteraarhorn", 4274),
  Mountain("Aletschhorn", 4193),
  Mountain("Jungfrau", 4158),
  Mountain("Mönch", 4110),
  Mountain("Barre des Écrins", 4102),
  Mountain("Gran Paradiso", 4061),
  Mountain("Piz Bernina", 4049),
  Mountain("Eiger", 3970),
  Mountain("Piz Roseg", 3937),
  Mountain("Ortler", 3905),
  Mountain("Piz Palü", 3900),
  Mountain("Großglockner", 3798),
  Mountain("Wildspitze", 3768),
  Mountain("Mount Hood", 3429),
  Mountain("Aneto", 3404),
  Mountain("Posets", 3369),
  Mountain("Monte Perdido", 3355),
  Mountain("Pico Maldito", 3350),
  Mountain("Vignemale", 3298),
  Mountain("Gerlach", 2655),
  Mountain("Lodowy Szczyt", 2627),
  Mountain("Wysoka", 2547),
  Mountain("Rysy", 2499),
  Mountain("Świnica", 2301),
  Mountain("Kozi Wierch", 2291),
  Mountain("Kościelec", 2155),
  Mountain("Szalony Wierch", 2061),
  Mountain("Mount Mitchell", 2037),
  Mountain("Kasprowy Wierch", 1987),
  Mountain("Mount Washington", 1917),
  Mountain("Giewont", 1895),
  Mountain("Babia Góra", 1725),
  Mountain("Śnieżka", 1603),
  Mountain("Pilsko", 1557),
  Mountain("Tarnica", 1346),
  Mountain("Halicz", 1333),
  Mountain("Turbacz", 1310),
  Mountain("Skrzyczne", 1257),
  Mountain("Połonina Wetlińska", 1255),
  Mountain("Wielka Racza", 1236),
  Mountain("Czantoria Wielka", 995),
  Mountain("Ślęża", 718),
  Mountain("Łysica", 612),
  Mountain("Góra Św. Anny", 406),
  Mountain("Kopiec Kościuszki", 326),
  Mountain("Wzgórze Telegraf", 300),
  Mountain("Bronx", 0),
];


final currentMountainProvider = Provider.autoDispose<Mountain>((ref) {
  final height = ref.watch(totalHeightProvider);
  

  for (int i = 0; i < mountains.length; i++) {
    if (height >= mountains[i].heightMeters) {
      return mountains[i];
    }
  }

  return mountains.last;
});

final nextMountainProvider = Provider.autoDispose<Mountain?>((ref) {
  final height = ref.watch(totalHeightProvider);
  final current = ref.watch(currentMountainProvider);
  

  final currentIndex = mountains.indexOf(current);
  

  if (currentIndex > 0) {
    return mountains[currentIndex - 1];
  }
  

  return null;
});

final mountainProgressProvider = Provider.autoDispose<double>((ref) {
  final height = ref.watch(totalHeightProvider);
  final current = ref.watch(currentMountainProvider);
  final next = ref.watch(nextMountainProvider);
  
  if (next == null) return 1.0;
  
  final range = next.heightMeters - current.heightMeters;
  final progress = height - current.heightMeters;
  
  return (progress / range).clamp(0.0, 1.0);
});

class RouteCharacteristicsCount {
  final int powery;
  final int sloppy;
  final int dynamic;
  final int crimpy;
  final int reachy;
  final int onsighted;
  final int redPointed;
  final int flashed;
  final int favorite;
  final int total;

  const RouteCharacteristicsCount({
    required this.powery,
    required this.sloppy,
    required this.dynamic,
    required this.crimpy,
    required this.reachy,
    required this.onsighted,
    required this.redPointed,
    required this.flashed,
    required this.favorite,
    required this.total,
  });

  const RouteCharacteristicsCount.empty()
      : powery = 0,
        sloppy = 0,
        dynamic = 0,
        crimpy = 0,
        reachy = 0,
        onsighted = 0,
        redPointed = 0,
        flashed = 0,
        favorite = 0,
        total = 0;
}

final routeCharacteristicsCountProvider = Provider.autoDispose<RouteCharacteristicsCount>((ref) {
  final routesAsync = ref.watch(filteredRoutesProvider);

  return routesAsync.maybeWhen(
    data: (routes) {
      if (routes.isEmpty) return const RouteCharacteristicsCount.empty();

      return RouteCharacteristicsCount(
        powery: routes.where((r) => r.isPowery).length,
        sloppy: routes.where((r) => r.isSloppy).length,
        dynamic: routes.where((r) => r.isDynamic).length,
        crimpy: routes.where((r) => r.isCrimpy).length,
        reachy: routes.where((r) => r.isReachy).length,
        onsighted: routes.where((r) => r.isOnsighted).length,
        redPointed: routes.where((r) => r.isRedPointed).length,
        flashed: routes.where((r) => r.isFlashed).length,
        favorite: routes.where((r) => r.isFavorite).length,
        total: routes.length,
      );
    },
    orElse: () => const RouteCharacteristicsCount.empty(),
  );
});

