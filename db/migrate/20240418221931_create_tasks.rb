class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.text :description
      t.string :status, null: false, default: "draft"
      t.references :created_by, null: false, foreign_key: { to_table: :users }, index: true
      t.references :assigned_to, null: false, foreign_key: { to_table: :users }, index: true
      t.datetime :deadline
      t.timestamps
    end
  end
end
