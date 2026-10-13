import 'package:webpage/scripts/client.dart';

import 'connectivity_snackbar.dart';
import 'core/config/config.dart' show currentFBConfig;
import 'features/auth/navigation_wiring.dart' show setupNavigation;
import 'features/navigation.dart';

/// Entry point for the webpage client-side script.
Future<void> main() async {
  final flavorConfig = currentFBConfig;

  final client = await getClient(flavorConfig);

  // Setup connectivity snackbar — listens to browser online/offline events
  setupConnectivitySnackbar();

  // Setup navigation, auth forms, and auth state listening
  final router = PageRouter();
  setupNavigation(client, router);

  // Show the home page by default
  router.navigateTo('home-page');
}
