import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'connectivity_provider.g.dart';

final _log = Logger("ConnectivityProvider");

@Riverpod(keepAlive: true)
Stream<ConnectivityResult> connectivity(Ref ref) {
  final controller = StreamController<ConnectivityResult>.broadcast();
  final connectivity = Connectivity();

  ConnectivityResult mapResults(List<ConnectivityResult> results) {
    if (results.contains(ConnectivityResult.none)) {
      return ConnectivityResult.none;
    } else if (results.contains(ConnectivityResult.ethernet)) {
      return ConnectivityResult.ethernet;
    } else if (results.contains(ConnectivityResult.wifi)) {
      return ConnectivityResult.wifi;
    } else if (results.contains(ConnectivityResult.mobile)) {
      return ConnectivityResult.mobile;
    }
    return ConnectivityResult.other;
  }

  final subscription = connectivity.onConnectivityChanged.listen(
    (results) {
      final newStatus = mapResults(results);
      _log.fine("Connectivity changed (stream): $newStatus");
      if (!controller.isClosed) {
        controller.add(newStatus);
      }
    },
    onError: (e, s) {
      _log.warning("Connectivity stream reported an error.", e, s);
      if (!controller.isClosed) {
        controller.add(ConnectivityResult.none);
      }
    },
  );

  connectivity.checkConnectivity().then((results) {
    final initialStatus = mapResults(results);
    _log.info("Initial connectivity status: $initialStatus");
    if (!controller.isClosed) {
      controller.add(initialStatus);
    }
  });

  ref.onDispose(() {
    subscription.cancel();
    controller.close();
    _log.info("Connectivity provider disposed and resources cleaned up.");
  });

  return controller.stream;
}
