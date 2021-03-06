@Chats = new Meteor.Collection 'Chats'

Router.configure
  layoutTemplate: 'layout'

Meteor.startup ->
  Router.map ->
    @route 'index',
      path: '/'
      template: 'index'
    @route 'message',
      path: '/message'
      template: 'main'

Meteor.methods
  'createPost': (text)->
    user = Meteor.user()
    if not user
      throw new Meteor.Error(401, 'You need to login to Facebook')

    postAt = new Date

    postData =
      username: user.profile.name
      text: text
      postAt: postAt
    Chats.insert postData

if Meteor.isClient
  Template.main.helpers
    chats: ->
      Chats.find({},{sort:{postAt:-1}})
  Template.main.events
    'change .text': (e, t)->
      e.stopPropagation()
      text = $('input.text').val()
      Meteor.call 'createPost', text, (err,res)->
        $('input.text').val ""
        if not err
          console.log err
        else
          console.log res

