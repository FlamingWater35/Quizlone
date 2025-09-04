import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'connectivity_provider.g.dart';

@riverpod
Stream<ConnectivityResult> connectivity(Ref ref) {
  return Connectivity().onConnectivityChanged.map((results) => results.first);
}
