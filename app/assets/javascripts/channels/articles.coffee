jQuery(document).on 'turbolinks:load', ->
   comments = $('#comments')
   if comments.length > 0
     App.global_chat = App.cable.subscriptions.create {
       channel: "ArticlesChannel"
       article_id: comments.data('article-id')
     },
     connected: ->
     disconnected: ->
     received: (data) ->
       comments.append data['comment']
     send_comment: (comment, article_id) ->
       @perform 'send_comment', comment: comment, article_id: article_id
   $('#new_comment').submit (e) ->
     $this = $(this)
     textarea = $this.find('#comment_content')
     if $.trim(textarea.val()).length > 1
       App.global_chat.send_comment textarea.val(),
       comments.data('article-id')
       textarea.val('')
     e.preventDefault()
     return false 