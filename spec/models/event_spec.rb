
require 'rails_helper'

RSpec.describe Event, type: :model do
before(:each) do
  @event = Event.create!(name: "SD O1", place:"Berghain", line_up: "GC-1", charge_others_description: "blabla", revenue_figure: 1000, total_charge_dj: 400, charge_communication: 50, charge_others: 100 )
end

describe 'creation' do
  it 'should have one creted' do
    expect(Event.all.count).to eq(1)
  end
end

describe 'validation' do
  it 'should not let the user create an event without a place' do
    @event.place = nil
    expect(@event).to_not be_valid
  end
  it 'should not let the user create an event without a name' do
    @event.name = nil
    expect(@event).to_not be_valid
  end

  describe 'validation' do
  it { is_expected.to validate_presence_of(:revenue_figure) }
  it { is_expected.to validate_presence_of(:charge_communication) }
  it { is_expected.to validate_presence_of(:total_charge_dj) }
  it { is_expected.to validate_presence_of(:charge_others) }
  it { is_expected.to validate_presence_of(:charge_others_description) }
end
describe 'Database' do
   it { is_expected.to have_db_column(:id).of_type(:integer) }
   it { is_expected.to have_db_column(:total_charge_dj).of_type(:integer) }
   it { is_expected.to have_db_column(:charge_others).of_type(:integer) }
   it { is_expected.to have_db_column(:charge_communication).of_type(:integer) }
   it { is_expected.to have_db_column(:charge_others).of_type(:integer) }
   it { is_expected.to have_db_column(:revenue_figure).of_type(:integer) }
   it { is_expected.to have_db_column(:line_up).of_type(:text) }
   it { is_expected.to have_db_column(:charge_others_description).of_type(:text) }
   it { is_expected.to have_db_column(:place).of_type(:text) }
   it { is_expected.to have_db_column(:name).of_type(:text) }



end


end
end
