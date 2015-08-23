Texts = new Mongo.Collection("tasks")

if Meteor.isClient

  # Set session defaults
  Session.setDefault "counter", 0
  Session.setDefault "targetDate", 0

  Template.body.helpers

    weekDays: ->
      now = moment()
      weekStart = moment(now).startOf("isoweek")
      days = []
      for number in [0..6]
        thisDay = moment(weekStart).add(number, "d")
        day =
          machine: thisDay
          human: thisDay.format("dddd, MMMM Do YYYY")
          today: true if thisDay.day() == now.day()
        days.push(day)
      # console.log days
      return days

  Template.day.events

    "submit .todo-input": (event) ->
      event.preventDefault()
      form = event.target
      text = form.text.value

      # console.log text
      # console.log $(form).closest(".day").data("machine")

      # Texts.update
      #   text: text
      #   date: form.closest(".day").data("machine")

    # "click .check-toggle": (event) ->
    #   Tasks.update @_id, $set: checked: !@checked
    #
    # "click .delete": (event) ->
    #   Tasks.remove @_id

  Meteor.startup ->
    # console.log "getting texts"
    # Texts.find().each ->
    #   console.log @

if Meteor.isServer
  Meteor.startup ->
    # code to run on server at startup
