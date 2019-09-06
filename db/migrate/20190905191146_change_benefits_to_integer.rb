class ChangeBenefitsToInteger < ActiveRecord::Migration[5.2]
  def change
    change_column :events, :benefits, :integer
  end
end
