class AddBenefitsToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :benefits, :string
  end
end
