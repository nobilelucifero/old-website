$(document).ready(function () {

  var el = $('#portfolio');

  if(el.length) {

    $.jribbble.getShotsByPlayerId('nobilelucifero', function (playerShots) {

      var result = [];

      $.each(playerShots.shots, function (i, shot) {
          result.push('<li><span data-href="' + shot.url + '" title="' + shot.title + '">');
          result.push('<img src="' + shot.image_url + '" ');
          result.push('alt="' + shot.title + '"></span></li>');
      });

      $('#portfolio').html(result.join(''));
    }, {page: 1, per_page: 12});
  }

});