class ChangeYearToBeIntegerInRealrelease < ActiveRecord::Migration[5.2]
  def change
      change_column :realreleases, :year, :integer, using: 'year::integer'
  end
end
