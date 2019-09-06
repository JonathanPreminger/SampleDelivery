class RemoveBenefitsFromEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :benefits
  end
end
