// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
//= require jquery
//= require jquery_ujs
//= require select2
import "@hotwired/turbo-rails"
import "controllers"
import "chartkick"
import "Chart.bundle"

$(document).on('turbo:load', function() {
    $( '.dropdown' ).select2({
        theme: "bootstrap",
        width: 500,
        allowClear: true,
        multiple: true,
        placeholder: 'Search'
    });
})