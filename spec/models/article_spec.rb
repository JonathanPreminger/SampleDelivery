require 'rails_helper'

RSpec.describe Article, type: :model do
  it 'should persist an article' do
    Article.create(title:'first')
    expect(Article.count).to eq(1)
  end
end
