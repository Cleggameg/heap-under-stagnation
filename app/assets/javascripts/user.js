$(document).ready(function() {

  $(".logout_button").on("click", function(event){
    var delete_url = $(this).attr("href");
    event.preventDefault();
    $.ajax({
      url: "/logout",
      method: "delete",
      success: function(response){
        console.log(response);
        $(".pull-right").append(response);
        $(".logout_button").hide();
        $(".hidden_form").hide();
      }

    });
  });

  $(".new_question").on("ajax:success", function(e, data, status, xhr) {
  $(".question_list").prepend(xhr.responseText);
  $(".question_text_area").val("")
  return console.log("stuff", xhr.responseText);
}).on("ajax:error", function(e, xhr, status, error) {
  return $("#new_article").prepend("<p>ERROR</p>");
});

});
