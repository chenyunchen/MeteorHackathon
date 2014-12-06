@chats = [
  {text: 'hello!',author:'yun'},
  {text: 'hello!',author:'yun'},
  {text: 'hello!',author:'yun'},
]

@Chats = new Meteor.Collection 'chats'

if Meteor.isClient
  Template.main.helpers
    chats: chats

if Meteor.isServer
  if Chats.find().count() is 0
    Chats.insert chat for chat in chats
