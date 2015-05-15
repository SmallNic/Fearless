$(document).ready(function(){

  var Goal = function(id, journeyID, userID, deadline ){
    this.id = id
    this.journeyID = journeyID
    this.userID = userID
    this.deadline = deadline
  }

  journeys = []

  $.ajax({
    type: 'GET',
    dataType: 'json',
    url: "/journeys"
  }).done(function( journeyResponse ) {
    for (var i=0; i < journeyResponse.length; i++){
      journeys.push(journeyResponse[i])
    }
  }).fail(function(){
    console.log("failure")
  })

  var goalBoxComplete = $(".goalBoxComplete")
  var goalBoxIncomplete = $(".goalBoxIncomplete")

  $(".completeButton").on("click", function( event ){
    event.preventDefault()
    id = $(this).attr("id")
    $.ajax({
      type: 'GET',
      dataType: 'json',
      url: "/goals/" + id
    }).done(function( response ) {
      // console.log("response", response)
      var userID;
      for (var i=0; i < journeys.length; i++){
        if (response.journey_id == journeys[i].id){
          userID = journeys[i].user_id
        }
      }
      goal = new Goal(response.id, response.journey_id, userID, response.deadline)
      console.log("goal:", goal)
      updateGoalStatus(goal)
    }).fail(function(){
      console.log("failure")
    })
  })

  var updateGoalStatus = function( goal){
    $("#goalBox"+id+"").css("background-color","#7AC376")
    $.ajax({
      type: 'PUT',
      dataType: 'json',
      data: {goal:{isAchieved: true, deadline:goal.deadline}},
      url: "/users/" + goal.userID +"/journeys/" + goal.journeyID + "/goals/" + goal.id
    }).done(function() {
      console.log("success")
    }).fail(function(){
      console.log("failure")
    })
  }

  $("#scrap-journey").on("click", function(){
    confirm('Are you sure you want to stop this journey?')
  })

/********************* Support Button *********************/

  $(".support").on("click", function( event ){
    event.preventDefault()
    console.log("hi, you just clicked on the Support button")
    journeyID = $(this).attr("journeyID")
    var userID;
    var numSupporters;
    for (var i=0; i < journeys.length; i++){
      if (journeyID == journeys[i].id){
        userID = journeys[i].user_id
        numSupporters = journeys[i].num_supporters
      }
    }

    $.ajax({
      type: 'PATCH',
      dataType: 'json',
      data: {journey:{num_supporters: (numSupporters+1)}},
      url: "/users/" + userID +"/journeys/" + journeyID
    }).done(function() {
      console.log("success")
    }).fail(function( response ){
      console.log("failure:", response)
    })
  })

})
