class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :alias, :string
  end
end
