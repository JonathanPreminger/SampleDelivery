require 'rails_helper'

RSpec.describe Article, type: :model do
  before :all do
    Article.destroy_all
  end

  it 'should persist an article' do
    @article = Article.create(title:"music",content:"whatever")
    expect(Article.count).to eq(1)
  end

  it 'should delete an article' do
    @article = Article.create(title:"music",content:"whatever")
    @total = Article.count
    Article.first.destroy
    expect(Article.count).to be < @total
  end
end
