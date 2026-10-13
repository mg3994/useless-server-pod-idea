import 'dart:js_interop';

import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    show
        AuthUserBlockedException,
        EmailAccountLoginException,
        EmailAccountLoginExceptionReason;
import 'package:web/web.dart' as web;
import 'package:website_client/website_client.dart' as wc;

import '../navigation.dart';

/// Sets up the login form — binds the submit button and handles authentication.
void setupLoginForm(wc.Client client, PageRouter router) {
  final emailEl =
      web.document.querySelector('#login-email') as web.HTMLInputElement?;
  final passwordEl =
      web.document.querySelector('#login-password') as web.HTMLInputElement?;
  final btnEl =
      web.document.querySelector('#login-btn') as web.HTMLButtonElement?;
  final errorEl = web.document.querySelector('#login-error');

  if (emailEl == null ||
      passwordEl == null ||
      btnEl == null ||
      errorEl == null) {
    print('Login elements not found - skipping login setup');
    return;
  }

  void showError(String message) {
    errorEl.classList.remove('hidden');
    errorEl.innerHTML =
        '<div class="p-4 rounded-lg bg-red-100 dark:bg-red-900/30 text-red-700 dark:text-red-400 text-sm">$message</div>'
            .toJS;
  }

  void clearError() {
    errorEl.classList.add('hidden');
    errorEl.innerHTML = ''.toJS;
  }

  void attemptLogin() async {
    clearError();

    final email = emailEl.value.trim();
    final password = passwordEl.value;

    if (email.isEmpty || password.isEmpty) {
      showError('Please enter both email and password.');
      return;
    }

    btnEl.disabled = true;
    btnEl.textContent = 'Signing in...';

    try {
      await client.emailIdp.login(email: email, password: password);
      // Login succeeded — the auth stream listener will update the UI
      router.navigateTo('home-page');
    } on EmailAccountLoginException catch (e) {
      final message = switch (e.reason) {
        EmailAccountLoginExceptionReason.invalidCredentials =>
          'Invalid email or password. Please try again.',
        EmailAccountLoginExceptionReason.tooManyAttempts =>
          'Too many failed attempts. Please try again later.',
        _ => 'Login failed. Please try again.',
      };
      showError(message);
    } on AuthUserBlockedException catch (_) {
      showError('Your account has been blocked. Contact support.');
    } catch (e) {
      showError('Login failed: ${e.toString()}');
    } finally {
      btnEl.disabled = false;
      btnEl.textContent = 'Sign in';
    }
  }

  btnEl.addEventListener('click', ((web.Event _) => attemptLogin()).toJS);

  // Allow Enter key on email/password fields
  void onKeydown(web.Event e) {
    final event = e as web.KeyboardEvent;
    if (event.key == 'Enter') {
      attemptLogin();
    }
  }

  emailEl.addEventListener('keydown', ((web.Event e) => onKeydown(e)).toJS);
  passwordEl.addEventListener('keydown', ((web.Event e) => onKeydown(e)).toJS);
}
