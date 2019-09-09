
require 'rails_helper'

# Schema information
#create_table "events", force: :cascade do |t|
#    t.integer "revenue_figure"
#    t.integer "total_charge_dj"
#    t.integer "charge_communication"
#    t.integer "charge_others"
#    t.text "charge_others_description"
#    t.integer "number_of_dj"
#    t.text "line_up"
#    t.string "place"
#    t.string "name"
#    t.datetime "created_at", null: false
#    t.datetime "updated_at", null: false
#    t.string "benefits"
#    t.datetime "start"
#    end

RSpec.describe Event, :type => :model do
  it "is valid with valid attributes" do
    expect(Event.new).to_not be_valid
end

  describe 'Database' do
    it { is_expected.to have_db_column(:id).of_type(:integer) }
    it { is_expected.to have_db_column(:revenue_figure).of_type(:integer) }
    it { is_expected.to have_db_column(:total_charge_dj).of_type(:integer) }
    it { is_expected.to have_db_column(:charge_communication).of_type(:integer) }
    it { is_expected.to have_db_column(:charge_others).of_type(:integer) }
    it { is_expected.to have_db_column(:number_of_dj).of_type(:integer) }
    it { is_expected.to have_db_column(:charge_others_description).of_type(:text) }
    it { is_expected.to have_db_column(:line_up).of_type(:text) }
    it { is_expected.to have_db_column(:place).of_type(:string) }
    it { is_expected.to have_db_column(:start).of_type(:datetime) }
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false)}
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false)}
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:revenue_figure) }
    it { is_expected.to validate_presence_of(:total_charge_dj) }
    it { is_expected.to validate_presence_of(:charge_others) }
    it { is_expected.to validate_presence_of(:charge_communication) }
    it { should allow_value(nil).for(:revenue_figure) }
  end

  describe 'Associations' do
    # none for the moment
  end
end
