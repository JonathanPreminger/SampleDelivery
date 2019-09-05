
require 'rails_helper'

# Schema information
#create_table "tracks", force: :cascade do |t|
#  t.text "name"
#  t.text "duration"
#  t.datetime "created_at", null: false
#  t.datetime "updated_at", null: false
#  t.integer "realrelease_id"
#  t.index ["realrelease_id"], name: "index_tracks_on_realrelease_id"
#end

RSpec.describe Track, :type => :model do
  it "is valid with valid attributes" do
    expect(Track.new).to_not be_valid
end

  describe 'Database' do
    it { is_expected.to have_db_column(:name).of_type(:text) }
    it { is_expected.to have_db_column(:duration).of_type(:text) }
    it { is_expected.to have_db_column(:realrelease_id).of_type(:integer) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false)}
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false)}
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:realrelease) }
  end

  describe 'Associations' do
    it { is_expected.to belong_to(:realrelease)}
  end
end
