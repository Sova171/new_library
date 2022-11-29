# frozen_string_literal: true

# Pin npm packages by running ./bin/importmap

pin 'application', preload: true
pin '@hotwired/turbo-rails', to: 'turbo.min.js', preload: true
pin '@hotwired/stimulus', to: 'stimulus.min.js', preload: true
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js', preload: true
pin_all_from 'app/javascript/controllers', under: 'controllers'
pin 'chartkick', to: 'chartkick.js'
pin 'Chart.bundle', to: 'Chart.bundle.js'
pin 'bootstrap', to: 'https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js'
pin 'unicode-emoji-picker', to: 'https://ga.jspm.io/npm:unicode-emoji-picker@1.3.0/index.js'
pin 'scrollable-component', to: 'https://ga.jspm.io/npm:scrollable-component@1.2.1/index.js'
pin 'unicode-emoji', to: 'https://ga.jspm.io/npm:unicode-emoji@2.4.0/index.js'
