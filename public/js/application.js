 $(document).ready(function() {
    
});


$("#flip_card").click(function(e) {
  e.preventDefault();
  var url = $(this).attr("href")
  $.get(url, function(response) {
    var new_card_text = $(response).find("#card_content")
    replace current card_content with new_card_text
  });
});
