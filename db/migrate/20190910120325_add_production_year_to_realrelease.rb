class AddProductionYearToRealrelease < ActiveRecord::Migration[5.2]
  def change
    add_column :realreleases, :production_year, :integer
  end
end
