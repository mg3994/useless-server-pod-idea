import 'dart:js_interop';

import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    show EmailAccountRequestException, EmailAccountRequestExceptionReason;
import 'package:serverpod_client/serverpod_client.dart' show UuidValue;
import 'package:web/web.dart' as web;
import 'package:website_client/website_client.dart' as wc;

import '../navigation.dart';

/// Sets up the signup form — binds the submit button and handles registration.
void setupSignupForm(wc.Client client, PageRouter router) {
  final nameEl =
      web.document.querySelector('#signup-name') as web.HTMLInputElement?;
  final emailEl =
      web.document.querySelector('#signup-email') as web.HTMLInputElement?;
  final passwordEl =
      web.document.querySelector('#signup-password') as web.HTMLInputElement?;
  final confirmEl = web.document.querySelector(
    '#signup-confirm-password',
  ) as web.HTMLInputElement?;
  final btnEl =
      web.document.querySelector('#signup-btn') as web.HTMLButtonElement?;
  final errorEl = web.document.querySelector('#signup-error');
  final successEl = web.document.querySelector('#signup-success');

  if (nameEl == null ||
      emailEl == null ||
      passwordEl == null ||
      confirmEl == null ||
      btnEl == null ||
      errorEl == null ||
      successEl == null) {
    print('Signup elements not found - skipping signup setup');
    return;
  }

  void showError(String message) {
    errorEl.classList.remove('hidden');
    successEl.classList.add('hidden');
    errorEl.innerHTML =
        '<div class="p-4 rounded-lg bg-red-100 dark:bg-red-900/30 text-red-700 dark:text-red-400 text-sm">$message</div>'
            .toJS;
  }

  void showSuccess(String message) {
    successEl.classList.remove('hidden');
    errorEl.classList.add('hidden');
    successEl.innerHTML =
        '<div class="p-4 rounded-lg bg-green-100 dark:bg-green-900/30 text-green-700 dark:text-green-400 text-sm">$message</div>'
            .toJS;
  }

  void clearMessages() {
    errorEl.classList.add('hidden');
    successEl.classList.add('hidden');
    errorEl.innerHTML = ''.toJS;
    successEl.innerHTML = ''.toJS;
  }

  void attemptSignup() async {
    clearMessages();

    final name = nameEl.value.trim();
    final email = emailEl.value.trim();
    final password = passwordEl.value;
    final confirmPassword = confirmEl.value;

    // Validation
    if (name.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      showError('Please fill in all fields.');
      return;
    }

    if (password != confirmPassword) {
      showError('Passwords do not match.');
      return;
    }

    if (password.length < 6) {
      showError('Password must be at least 6 characters long.');
      return;
    }

    btnEl.disabled = true;
    btnEl.textContent = 'Creating account...';

    try {
      // Step 1: Start registration — sends verification email
      final accountRequestId = await client.emailIdp.startRegistration(
        email: email,
      );

      // Show verification code input
      _showVerificationStep(
        client: client,
        accountRequestId: accountRequestId,
        name: name,
        password: password,
        btnEl: btnEl,
        onError: showError,
        onSuccess: showSuccess,
        router: router,
      );
    } on EmailAccountRequestException catch (e) {
      final message = switch (e.reason) {
        EmailAccountRequestExceptionReason.expired =>
          'The registration request has expired. Please try again.',
        EmailAccountRequestExceptionReason.policyViolation =>
          'The password does not meet the password policy requirements.',
        EmailAccountRequestExceptionReason.invalid =>
          'This email may already be registered. Try signing in instead.',
        _ => 'Registration failed. Please try again.',
      };
      showError(message);
    } catch (e) {
      showError('Registration failed: ${e.toString()}');
    } finally {
      if (btnEl.textContent == 'Creating account...') {
        btnEl.disabled = false;
        btnEl.textContent = 'Create account';
      }
    }
  }

  btnEl.addEventListener('click', ((web.Event _) => attemptSignup()).toJS);

  // Allow Enter key
  void onKeydown(web.Event e) {
    final event = e as web.KeyboardEvent;
    if (event.key == 'Enter') {
      attemptSignup();
    }
  }

  for (final field in [nameEl, emailEl, passwordEl, confirmEl]) {
    field.addEventListener('keydown', ((web.Event e) => onKeydown(e)).toJS);
  }
}

/// Shows the verification code input and handles the verify + finish flow.
void _showVerificationStep({
  required wc.Client client,
  required UuidValue accountRequestId,
  required String name,
  required String password,
  required web.HTMLButtonElement btnEl,
  required void Function(String) onError,
  required void Function(String) onSuccess,
  required PageRouter router,
}) {
  // Replace the button area with a verification code input
  final btnParent = btnEl.parentElement;
  if (btnParent == null) return;

  // Store the button for restoration
  final originalBtn = btnEl;

  // Create verification UI
  btnParent.innerHTML =
      '''
    <div id="verification-step" class="mt-4">
      <p class="text-sm text-surface-600 dark:text-surface-400 mb-3 text-center">
        A verification code has been sent to your email. Enter it below to continue.
      </p>
      <input
        type="text"
        id="verification-code"
        placeholder="Enter verification code"
        class="w-full px-4 py-3 rounded-xl border border-surface-200 dark:border-surface-700 bg-white dark:bg-surface-800 text-surface-900 dark:text-white focus:outline-none focus:ring-2 focus:ring-primary-500 text-center tracking-widest text-lg"
        autocomplete="one-time-code"
      />
      <button
        id="verify-btn"
        class="btn-primary w-full mt-4"
      >
        Verify and create account
      </button>
      <button
        id="back-to-signup"
        class="btn-ghost w-full mt-2 text-sm"
      >
        ← Back
      </button>
    </div>
  '''
          .toJS;

  final codeEl =
      btnParent.querySelector('#verification-code') as web.HTMLInputElement?;
  final verifyBtn =
      btnParent.querySelector('#verify-btn') as web.HTMLButtonElement?;
  final backBtn =
      btnParent.querySelector('#back-to-signup') as web.HTMLButtonElement?;

  if (codeEl == null || verifyBtn == null || backBtn == null) return;

  void restoreSignupForm() {
    btnParent.innerHTML = ''.toJS;
    btnParent.appendChild(originalBtn);
    originalBtn.disabled = false;
    originalBtn.textContent = 'Create account';
  }

  backBtn.addEventListener(
    'click',
    ((web.Event _) => restoreSignupForm()).toJS,
  );

  void attemptVerify() async {
    final code = codeEl.value.trim();
    if (code.isEmpty) {
      onError('Please enter the verification code.');
      return;
    }

    verifyBtn.disabled = true;
    verifyBtn.textContent = 'Verifying...';

    try {
      // Step 2: Verify the code
      final token = await client.emailIdp.verifyRegistrationCode(
        accountRequestId: accountRequestId,
        verificationCode: code,
      );

      // Step 3: Finish registration
      await client.emailIdp.finishRegistration(
        registrationToken: token,
        password: password,
      );

      onSuccess('Account created successfully! Redirecting...');
      // The auth stream listener will update the UI
      Future.delayed(const Duration(seconds: 1), () {
        router.navigateTo('home-page');
      });
    } on EmailAccountRequestException catch (e) {
      final message = switch (e.reason) {
        EmailAccountRequestExceptionReason.expired =>
          'The verification code has expired. Please start over.',
        EmailAccountRequestExceptionReason.policyViolation =>
          'The password does not meet the password policy requirements.',
        EmailAccountRequestExceptionReason.invalid =>
          'Invalid verification code. Please try again.',
        _ => 'Verification failed. Please try again.',
      };
      onError(message);
    } catch (e) {
      onError('Verification failed: ${e.toString()}');
    } finally {
      verifyBtn.disabled = false;
      verifyBtn.textContent = 'Verify and create account';
    }
  }

  verifyBtn.addEventListener('click', ((web.Event _) => attemptVerify()).toJS);

  codeEl.addEventListener(
    'keydown',
    ((web.Event e) {
      if ((e as web.KeyboardEvent).key == 'Enter') {
        attemptVerify();
      }
    }).toJS,
  );

  // Focus the code input
  codeEl.focus();
}
