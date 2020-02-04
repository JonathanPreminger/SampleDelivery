

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

  before(:each) do
    Event.destroy_all
    @event = Event.create(total_charge_dj: 100, charge_others: 100, charge_communication: 100, name:'eventone', revenue_figure: 500)
  end

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
    it { is_expected.to validate_presence_of(:total_charge_dj) }
    it { is_expected.to validate_presence_of(:charge_others) }
    it { is_expected.to validate_presence_of(:charge_communication) }
    it { should allow_value(nil).for(:revenue_figure) }
  end

  describe 'Associations' do
    # none for the moment
  end

  context 'validations' do
    it "ensure name presence" do
      event = Event.new(id: 12, total_charge_dj: 300, charge_others: 100, charge_communication: 50).save
      expect(event).to eq(false)
    end

    it "ensure total_charge_dj presence" do
      event = Event.new(id: 12, name: "event1", charge_others: 100, charge_communication: 50).save
      expect(event).to eq(false)
    end

    it "ensure charge_others presence" do
      event = Event.new(id: 12, name: "event1", total_charge_dj: 300, charge_communication: 50).save
      expect(event).to eq(false)
    end

    it "ensure charge_communication presence" do
      event = Event.new(id: 12, name: "event1", total_charge_dj: 300, charge_others: 100).save
      expect(event).to eq(false)
    end
  end

  context 'comptability module' do
    it "calcul the total charge" do
      expect(Event.total_charge).to eq(300)
    end

    it "calcul the total benefits" do
      expect(Event.sum(:revenue_figure) - Event.total_charge).to eq(200)
    end

    it "calcul the average benefits" do
      expect(Event.total_benefits / Event.count).to eq(200)
    end

    it "calcul a single benefits" do
      expect(@event.revenue_figure.to_i - @event.total_charge_dj.to_i - @event.charge_others.to_i - @event.charge_communication.to_i).to eq(200)
    end

    it "calcul the benefice rate" do
      result = (100 * (@event.benefits / Event.average_benefits.to_f)) - 100
      expect(result).to eq(0)
    end

    it "verify the positivness of the benefice rate" do
      expect(@event.positiv_benefits_rate).to eq(true)
    end

    it "calcul the total charge individual" do
      expect(@event.total_charge_indiv).to eq(300)
    end

    it "calcul the benefice rate" do
      expect(((@event.benefits.to_f / @event.revenue_figure.to_f) * 100).round).to eq(40)
    end

    it "calcul the positivness of the return rate" do
      expect(@event.positiv_return_rate).to eq(true)
    end
  end

  context 'scope tests' do
    let (:params) {{id: 12, total_charge_dj: 300, charge_others: 100, charge_communication: 50}}
    before(:each) do
      User.new(params).save
    end
  end

end
