// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function() {
    var open_bugs = parseInt($('#opened_bugs').text());
    var closed_bugs = parseInt($('#closed_bugs').text());

    if ($('.ct-chart')[0]) {
        new Chartist.Pie('.ct-chart', {
            series: [open_bugs, closed_bugs]
        });
    }
});

