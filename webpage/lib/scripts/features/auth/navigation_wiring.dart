import 'dart:js_interop';

import 'package:web/web.dart' as web;
import 'package:webpage/scripts/session_manager.dart'
    show WebAuthSessionManagerExtension;
import 'package:website_client/website_client.dart' as wc;

import '../navigation.dart';
import 'login_form.dart' show setupLoginForm;
import 'signup_form.dart' show setupSignupForm;

/// Sets up all navigation links, auth state listening, and sign-out.
void setupNavigation(wc.Client client, PageRouter router) {
  // ── Navigation buttons ──

  // Navbar: Log in
  _bindNavButton('nav-login', () => router.navigateTo('login-page'));
  // Navbar: Sign up
  _bindNavButton('nav-signup', () => router.navigateTo('signup-page'));
  // Hero: Log in
  _bindNavButton('hero-login', () => router.navigateTo('login-page'));
  // Hero: Sign up (Get started)
  _bindNavButton('hero-signup', () => router.navigateTo('signup-page'));
  // Login page: go to signup
  _bindNavButton('go-to-signup', () => router.navigateTo('signup-page'));
  // Signup page: go to login
  _bindNavButton('go-to-login', () => router.navigateTo('login-page'));
  // Navbar: Home
  _bindNavButton('nav-home', () => router.navigateTo('home-page'));
  // Navbar: Logo
  _bindNavButton('nav-logo', () => router.navigateTo('home-page'));

  // ── Sign out ──
  final signoutBtn =
      web.document.querySelector('#nav-signout') as web.HTMLButtonElement?;
  if (signoutBtn != null) {
    signoutBtn.addEventListener(
      'click',
      ((web.Event _) async {
        await client.auth.signOutAllDevices();
        router.navigateTo('home-page');
      }).toJS,
    );
  }

  // ── Auth state listener ──
  // Update the navbar when auth state changes
  final sessionManager = client.authSessionManager;
  sessionManager.authInfoStream.listen((authInfo) {
    final loggedOut = web.document.querySelector('#auth-actions-logged-out');
    final loggedIn = web.document.querySelector('#auth-actions-logged-in');
    final userEmail = web.document.querySelector('#user-email');

    if (authInfo != null && client.auth.isAuthenticated) {
      // User is authenticated
      loggedOut?.classList.add('hidden');
      loggedIn?.classList.remove('hidden');

      // Fetch and display user email
      _fetchAndSetUserEmail(client, userEmail);
    } else {
      // User is not authenticated
      loggedOut?.classList.remove('hidden');
      loggedIn?.classList.add('hidden');
      userEmail?.innerHTML = ''.toJS;
    }
  });

  // ── Setup auth forms ──
  setupLoginForm(client, router);
  setupSignupForm(client, router);

  // ── Initial auth state check ──
  if (client.auth.isAuthenticated) {
    _fetchAndSetUserEmail(client, web.document.querySelector('#user-email'));
  }
}

/// Fetches the user's profile and sets the email in the navbar.
Future<void> _fetchAndSetUserEmail(
  wc.Client client,
  web.Element? userEmailEl,
) async {
  try {
    final profile = await client.modules.serverpod_auth_core.userProfileInfo
        .get();
    if (userEmailEl != null && profile.email != null) {
      userEmailEl.textContent = profile.email;
    }
  } catch (_) {
    // Silently fail — email display is optional
  }
}

/// Binds a click handler to a nav button, preventing default navigation.
void _bindNavButton(String id, void Function() onClick) {
  final el = web.document.querySelector('#$id');
  if (el == null) return;

  el.addEventListener(
    'click',
    ((web.Event e) {
      e.preventDefault();
      onClick();
    }).toJS,
  );
}
