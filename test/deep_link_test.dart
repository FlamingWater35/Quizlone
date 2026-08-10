import 'package:auto_route/auto_route.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quizlone/routing/app_router.dart';

void main() {
  group('DeepLinkResolver', () {
    List<PageRouteInfo> routesOf(DeepLink link) {
      // _RoutesDeepLink exposes its routes list publicly; dynamic access keeps
      // the test independent of auto_route internals.
      return (link as dynamic).routes as List<PageRouteInfo>;
    }

    test('unknown paths fall back to the start route', () {
      final link = DeepLinkResolver.resolve('/nope', activeListId: 'list-1');
      expect(link.isValid, isTrue);
      expect(routesOf(link), hasLength(1));
      expect(routesOf(link).single.runtimeType, StartRoute);
    });

    test('mode routes require an active list', () {
      final link = DeepLinkResolver.resolve('/flashcards', activeListId: null);
      expect(routesOf(link), hasLength(1));
      expect(routesOf(link).single.runtimeType, StartRoute);
    });

    test('mode routes build the full stack when an active list exists', () {
      final link = DeepLinkResolver.resolve('/flashcards', activeListId: 'list-1');
      final routes = routesOf(link);
      expect(routes, hasLength(3));
      expect(routes[0].runtimeType, StartRoute);
      expect(routes[1].runtimeType, ModeSelectionRoute);
      expect(routes[2].runtimeType, FlashcardRoute);
    });

    test('non-mode routes resolve without an active list', () {
      final link = DeepLinkResolver.resolve('/about', activeListId: null);
      final routes = routesOf(link);
      expect(routes, hasLength(2));
      expect(routes[0].runtimeType, StartRoute);
      expect(routes[1].runtimeType, AboutRoute);
    });

    test('path prefixes are matched', () {
      final link = DeepLinkResolver.resolve('/learn/extra', activeListId: 'list-1');
      final routes = routesOf(link);
      expect(routes[2].runtimeType, LearnRoute);
    });
  });
}
