if Meteor.isClient
  Template.main.helpers
    strData: 'String Data'
    funData: (x)->
      x+100
