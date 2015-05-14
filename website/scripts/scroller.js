var headline_count;
var headline_interval;
var current_headline = 0;
var old_headline = -1;
$(document).ready(function() {
    headline_count = $('#news-slide-list li').size();
    $('#news-slide-list li:eq(0)').css('left', '475px');
    headline_rotate();
    headline_interval = setInterval(headline_rotate, 18000);
});

function headline_rotate() {
    current_headline = (old_headline + 1) % headline_count;
    $('#news-slide-list li:eq(' + old_headline + ')').animate({ left: -475 }, "slow", function() {
        $(this).css('left', '475px');
    });
    $('#news-slide-list li:eq(' + current_headline + ')').animate({ left: 0 }, 6000);
    old_headline = current_headline;
}
