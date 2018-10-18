class ArticlesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "articles_#{params['article_id']}_channel"
  end

  def unsubscribed
  end

  def send_comment(data)
    current_user.comments.create!(content: data['comment'], article_id: data['article_id'])
  end
end