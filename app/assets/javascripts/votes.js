$(document).ready(function(){

  $(".question_up").on("click", function(event){
    var up_url = $(this).attr("href");
    console.log("HEYY!!")
    event.preventDefault();
    $.ajax({
      url: up_url,
      method: "post",
      success: function(response){
        console.log("YAYYYY!!")
        $(".question_vote_count").html(response);
      }
    })
  })
  $(".question_down").on("click", function(event){
    var up_url = $(this).attr("href");
    console.log("HEYY!!")
    event.preventDefault();
    $.ajax({
      url: up_url,
      method: "post",
      success: function(response){
        console.log("YAYYYY!!")
        $(".question_vote_count").html(response);
      }
    })
  })

    $(".answer_up").on("click", function(event){
    var up_url = $(this).attr("href");
    var id = $(this).attr("type")
    console.log(id);
    console.log(">>>>>>>>>>>>>>>>>")
    event.preventDefault();
    $.ajax({
      url: up_url,
      method: "post",
      success: function(response){
        console.log("YAYYYY!!")
        $(".answer_vote_count" + id + "").html(response);
      }
    })
  })

    $(".answer_down").on("click", function(event){
    var up_url = $(this).attr("href");
    var id = $(this).attr("type")
    console.log(id);
    console.log(">>>>>>>>>>>>>>>>>")
    event.preventDefault();
    $.ajax({
      url: up_url,
      method: "post",
      success: function(response){
        console.log("YAYYYY!!");
        console.log(response);
        $(".answer_vote_count" + id + "").html(response);
      }
    })
  })
})
