require 'rails_helper'

# == schema information
#  create_table "artists", force: :cascade do |t|
#    t.datetime "created_at", null: false
#    t.datetime "updated_at", null: false
#    t.text "name"
#    t.string "number"
#  end

RSpec.describe Artist, :type => :model do
  it "is valid with valid attributes" do
    expect(Artist.new).to_not be_valid
end

  describe 'Database' do
    it { is_expected.to have_db_column(:id).of_type(:integer) }
    it { is_expected.to have_db_column(:name).of_type(:text)}
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false)}
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false)}
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'Associations' do
    it { is_expected.to have_many(:realreleases).dependent(:destroy) }
    it { is_expected.to have_many(:djsets).dependent(:destroy) }
    it { should have_many(:tracks).through(:realreleases).dependent(:destroy) }
    it { should accept_nested_attributes_for :djsets }
    it { should accept_nested_attributes_for :realreleases }
  end
end
