import 'dart:js_interop';

import 'package:blogger_theme/blogger_theme.dart';
import 'package:blogger_theme/renderer.dart';
import 'package:web/web.dart' as web;
import 'package:website_client/website_client.dart' as wc;

/// Sets up the greeting form UI - binds the input field, button, and response area.
void setupGreetingForm(wc.Client client) {
  final inputEl =
      web.document.querySelector('#name-input') as web.HTMLInputElement?;
  final btnEl =
      web.document.querySelector('#greet-btn') as web.HTMLButtonElement?;
  final responseEl = web.document.querySelector('#greeting-response');

  if (inputEl == null || btnEl == null || responseEl == null) {
    print('UI elements not found - skipping greeting setup');
    return;
  }

  void sendGreeting() {
    final name = inputEl.value.trim();
    if (name.isEmpty) {
      responseEl.classList.remove('hidden');
      responseEl.innerHTML = div(
        {'class': 'p-4 rounded-lg bg-red-100 text-red-700'},
        ['Please enter a name first.'.component],
      ).render().toJS;
      return;
    }

    btnEl.disabled = true;
    btnEl.textContent = 'Sending...';
    responseEl.classList.remove('hidden');
    responseEl.innerHTML = div(
      {'class': 'p-4 rounded-lg bg-surface-100 text-surface-600'},
      ['Loading...'.component],
    ).render().toJS;

    callGreeting(client, name, responseEl, btnEl);
  }

  btnEl.addEventListener('click', ((web.Event _) => sendGreeting()).toJS);

  inputEl.addEventListener(
    'keydown',
    ((web.Event e) {
      final event = e as web.KeyboardEvent;
      if (event.key == 'Enter') {
        sendGreeting();
      }
    }).toJS,
  );
}

/// Calls the server greeting endpoint and displays the result or error.
Future<void> callGreeting(
  wc.Client client,
  String name,
  web.Element responseEl,
  web.HTMLButtonElement btnEl,
) async {
  try {
    final greeting = await client.greeting.hello(name);

    final timestamp = greeting.timestamp.toLocal().toString();

    responseEl.classList.remove('hidden');
    responseEl.innerHTML =
        '''
      <div class="p-4 rounded-lg bg-green-100 text-green-700">
        <p class="font-bold text-lg mb-2">${escapeXml(greeting.message)}</p>
        <p class="text-sm mb-1 text-surface-500">Author: ${escapeXml(greeting.author)}</p>
        <p class="text-sm text-surface-500">Time: $timestamp</p>
      </div>
    '''
            .toJS;
  } catch (e) {
    responseEl.classList.remove('hidden');
    responseEl.innerHTML =
        '''
      <div class="p-4 rounded-lg bg-red-100 text-red-700">
        Error: ${escapeXml(e.toString())}
      </div>
    '''
            .toJS;
  } finally {
    btnEl.disabled = false;
    btnEl.textContent = 'Send Greeting';
  }
}
