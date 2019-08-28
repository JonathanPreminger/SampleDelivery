class AddConfirmdjsetToDjset < ActiveRecord::Migration[5.2]
  def change
    add_column :djsets, :confirmdjset, :boolean
  end
end
