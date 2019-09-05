require 'rails_helper'

RSpec.describe Artist, :type => :model do
  it "is valid with valid attributes" do
    expect(Artist.new).to be_valid
end

  describe 'Database' do
    it { is_expected.to have_db_column(:id).of_type(:integer) }
    it { is_expected.to have_db_column(:name).of_type(:text)}
  end

  describe 'Validations' do
  #  it { is_expected.to validate_presence_of(:artist) }
  #  it { is_expected.to validate_presence_of(:club) }
  #  it { is_expected.to validate_presence_of(:start) }
  end

  describe 'Associations' do
    it { is_expected.to have_many(:realreleases).dependent(:destroy) }
    it { is_expected.to have_many(:djsets).dependent(:destroy) }
    it { should have_many(:tracks).through(:realreleases).dependent(:destroy) } 


  end
end
