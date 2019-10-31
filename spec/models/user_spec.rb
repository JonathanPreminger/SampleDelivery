

# Schema information
#  create_table "users", force: :cascade do |t|
#    t.string "email", default: "", null: false
#    t.string "encrypted_password", default: "", null: false
#    t.string "reset_password_token"
#    t.datetime "reset_password_sent_at"
#    t.datetime "remember_created_at"
#    t.integer "sign_in_count", default: 0, null: false
#    t.datetime "current_sign_in_at"
#    t.datetime "last_sign_in_at"
#    t.string "current_sign_in_ip"
#    t.string "last_sign_in_ip"
#    t.string "confirmation_token"
#    t.datetime "confirmed_at"
#    t.datetime "confirmation_sent_at"
#    t.string "unconfirmed_email"
#    t.datetime "created_at", null: false
#    t.datetime "updated_at", null: false
#    t.index ["email"], name: "index_users_on_email", unique: true
#    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
#  end

RSpec.describe User, :type => :model do
  it "is valid with valid attributes" do
    expect(Realrelease.new).to_not be_valid
end

  describe 'Database' do
    it { is_expected.to have_db_column(:email).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:encrypted_password).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:reset_password_token).of_type(:string) }
    it { is_expected.to have_db_column(:reset_password_sent_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:remember_created_at).of_type(:datetime)}
    it { is_expected.to have_db_column(:sign_in_count).of_type(:integer).with_options(null: false)}
    it { is_expected.to have_db_column(:current_sign_in_at).of_type(:datetime)}
    it { is_expected.to have_db_column(:last_sign_in_at).of_type(:datetime)}
    it { is_expected.to have_db_column(:current_sign_in_ip).of_type(:string)}
    it { is_expected.to have_db_column(:confirmation_token).of_type(:string)}
    it { is_expected.to have_db_column(:confirmed_at).of_type(:datetime)}
    it { is_expected.to have_db_column(:current_sign_in_at).of_type(:datetime)}
    it { is_expected.to have_db_column(:confirmation_sent_at).of_type(:datetime)}
    it { is_expected.to have_db_column(:unconfirmed_email).of_type(:string)}
    it { is_expected.to have_db_column(:created_at).of_type(:datetime)}
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime)}
  end

  describe 'Validations' do
  end

  describe 'Associations' do
  end
end
