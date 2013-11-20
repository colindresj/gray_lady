$(function(){
  addEventList();
});

function addEventList() {
  $('#get-links').on('click', function(){
    getLinks()
    .done(function(response) {
      $.each(response, function(index, link){
        li = '<li>' + link + '</li>';
        $('#links').append(li);
      });
    })
    .fail(function() {
      console.log("error");
    });
  });

  $('#get-pics').on('click', function(){
    getPictures()
    .done(function(response) {
      $.each(response, function(index, picture){
        li = '<li><img src="' + picture + '"></li>';
        $('#links').append(li);
      });
    })
    .fail(function() {
      console.log("error");
    });
  });
}

function getLinks(){
  return $.ajax({
    url: 'scraper/links',
    type: 'get',
    dataType: 'json'
  });
}

function getPictures(){
  return $.ajax({
    url: 'scraper/pictures',
    type: 'get',
    dataType: 'json'
  });
}
