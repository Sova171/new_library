# frozen_string_literal: true

require 'rails_helper'

describe ::Comments::Create do
  subject { described_class.call(book:, comment_params:) }

  let(:user)           { create(:user) }
  let(:book)           { create(:book) }
  let(:comment)        { Faker::JapaneseMedia::OnePiece.quote }
  let(:comment_params) { { content: comment, user: } }

  it 'create new comment' do
    expect { subject }.to change(Comment, :count).by(1)
  end
end
