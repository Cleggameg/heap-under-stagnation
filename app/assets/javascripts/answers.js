$(document).ready(function() {

  $(".new_answer").on("ajax:success", function(e, data, status, xhr) {
  $("#answer_list").append(xhr.responseText);
  $("#answer_content").val("")
  return console.log("stuff", xhr.responseText);
}).on("ajax:error", function(e, xhr, status, error) {
  console.log("Failure!!")
  return $("#new_answer").prepend("<p>ERROR</p>");
});
});
