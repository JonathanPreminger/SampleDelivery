
require 'rails_helper'

# Schema information
#create_table "realreleases", force: :cascade do |t|
#  t.text "name"
#  t.integer "year"
#  t.datetime "created_at", null: false
#  t.datetime "updated_at", null: false
#  t.integer "artist_id"
#  t.index ["artist_id"], name: "index_realreleases_on_artist_id"
#end

RSpec.describe Realrelease, :type => :model do
  it "is valid with valid attributes" do
    expect(Realrelease.new).to_not be_valid
end

  describe 'Database' do
    it { is_expected.to have_db_column(:id).of_type(:integer) }
    it { is_expected.to have_db_column(:name).of_type(:text) }
    it { is_expected.to have_db_column(:year).of_type(:integer) }
    it { is_expected.to have_db_column(:artist_id).of_type(:integer) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false)}
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false)}
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:artist) }
  end

  describe 'Associations' do
    it { is_expected.to have_many(:tracks).dependent(:destroy) }
    it { should accept_nested_attributes_for :tracks }
  end
end
