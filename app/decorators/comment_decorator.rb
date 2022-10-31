# frozen_string_literal: true

class CommentDecorator < ApplicationDecorator
  def comment_date
    comment.created_at.strftime('%d.%m.%Y, %H:%M')
  end

  def comment_user
    comment.user.email
  end
end
