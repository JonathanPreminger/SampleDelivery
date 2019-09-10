class RemoveYearFromRealreleases < ActiveRecord::Migration[5.2]
  def change
    remove_column :realreleases, :year, :integer
  end
end
