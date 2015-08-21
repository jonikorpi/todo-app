if Meteor.isClient
  # counter starts at 0
  Session.setDefault 'counter', 0
  Template.body.helpers tasks: [
    { text: 'This is task 1' }
    { text: 'This is task 2' }
    { text: 'This is task 3' }
  ]

if Meteor.isServer
  Meteor.startup ->
    # code to run on server at startup
