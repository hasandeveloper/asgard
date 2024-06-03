class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.integer :status

      t.timestamps
    end
    change_column_default :tasks, :status, 0
    add_column :tasks, :user_id,  :integer
  end
end
