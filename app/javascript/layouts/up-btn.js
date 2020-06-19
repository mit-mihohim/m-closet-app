$(function() {
  var upIcon = $(".up-icon");
  upIcon.hide();

  $(document).scroll(function() {
    if ($(this).scrollTop() > 150) {
      upIcon.fadeIn();
    } else {
      upIcon.fadeOut();
    }
  });
  upIcon.click(function() {
    $("body,html").animate({
      scrollTop: 0
    }, 500);
    return false;
  });
});