class CreateBugs < ActiveRecord::Migration
  def change
    create_table :bugs do |t|

      t.timestamps null: false
    end
  end
end
