class AddStartToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :start, :datetime
  end
end
