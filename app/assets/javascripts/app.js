$(document).ready(function(){

  $("#scrap-journey").on("click", function(){
    confirm('Are you sure you want to stop this journey?')
  })

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


  centerColumn = $("#center-col")
  rightColumn = $("#post-col")
  allUsers = $("#allUsers")
  allUsers.on("click", function(event){
    console.log("hi, you just clicked on the allUsers button")
  })

  allPosts = $("#allPosts")
  allPosts.on("click", function(event){
    console.log("hi, you just clicked on the allPosts button")
    $.ajax({
      type: 'GET',
      dataType: 'json',
      url: "/posts"
    }).done(function(response) {
      console.log("response", response)
      showAllPosts(response)
    }).fail(function( response ){
      console.log("failure")
    })
  })

  function showAllPosts ( response ){



  }

  // centerColumn.css("background-color","red")

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
