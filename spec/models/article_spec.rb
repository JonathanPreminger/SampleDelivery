
# extract from the schema
# create_table "articles", force: :cascade do |t|
#  t.string "title"
#  t.text "content"
#  t.datetime "created_at", null: false
#  t.datetime "updated_at", null: false
# end

RSpec.describe Article, :type => :model do
  it "is valid with valid attributes" do
    expect(Article.new).to_not be_valid
end

  describe 'Database' do
    it { is_expected.to have_db_column(:id).of_type(:integer) }
    it { is_expected.to have_db_column(:title).of_type(:string)}
    it { is_expected.to have_db_column(:content).of_type(:text)}
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
  end


  describe 'Validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:content) }
  end

   describe 'Associations' do
  end
end
