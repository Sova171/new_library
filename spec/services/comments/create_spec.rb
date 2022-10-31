# frozen_string_literal: true

require 'rails_helper'

describe ::Comments::Create do
  subject { described_class.call(book:, comment_params:) }

  let(:user)           { create(:user) }
  let(:book)           { create(:book) }
  let(:comment)        { Faker::JapaneseMedia::OnePiece.quote }
  let(:comment_params) { { content: comment, user: } }

  it 'creates new comment' do
    expect { subject }.to change(Comment, :count).by(1)
  end

  context 'when comment is invalid' do
    let(:comment) { nil }

    it "doesn't creates new comment" do
      expect { subject }.to change(Comment, :count).by(0)
    end
  end
end
