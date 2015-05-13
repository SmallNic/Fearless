$(document).ready(function(){

  $(".completeButton").on("click", function(){
    console.log("hi, you just clicked on the Complete button")
  })

  $(".support-button").on("click", function(){
    console.log("hi, you just clicked on the Support button")
    var supporter = $("#current-user-alias").html()
    console.log(supporter, "supports you")
    $.ajax({
      type:"POST",
      dataType: "json",
      data: supporter,
      url: "http://localhost:3000/journeys/"
      //url: "/cards" ***this will always go to the server's cards index page***
    }).done(function(){
      console.log("success")
    }).fail(function(){
      console.log("failure")
    })

  })

  // card.createInRails()
  //
  //
  // var Card = function( id, description, completed ){
  //   this.id = id
  //   this.description = description
  //   this.completed = completed
  // }
  //
  // Card.prototype = {
  //   createInRails:function(){
  //     $.ajax({
  //       type:"POST",
  //       dataType: "json",
  //       data: {card:{description: this.description, complete: this.completed}},
  //       url: "http://localhost:3000/cards"
  //       //url: "/cards" ***this will always go to the server's cards index page***
  //     }).done(function(){
  //       trilloModel.fetchCards()
  //     }).fail(function(){
  //       console.log("saving to rails API failed")
  //     })
  //   }
  // }

})
