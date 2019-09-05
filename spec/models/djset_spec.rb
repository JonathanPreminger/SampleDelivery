require 'rails_helper'

RSpec.describe Djset, :type => :model do
  it "is valid with valid attributes" do
    expect(Djset.new).not_to be_valid
end

  describe 'Database' do
    it { is_expected.to have_db_column(:id).of_type(:integer) }
    it { is_expected.to have_db_column(:start).of_type(:datetime)}
    it { is_expected.to have_db_column(:club).of_type(:text) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:artist) }
    it { is_expected.to validate_presence_of(:club) }
    it { is_expected.to validate_presence_of(:start) }
  end

  describe 'Associations' do
    it { is_expected.to belong_to(:artist) }

  end
end
