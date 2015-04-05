class AddDetailsToBugs < ActiveRecord::Migration
  def change
    add_reference :bugs, :user, index: true
    add_foreign_key :bugs, :users
    add_column :bugs, :title, :string
    add_column :bugs, :description, :string
    add_column :bugs, :priority, :string
    add_column :bugs, :is_closed, :boolean
  end
end
