class RenameDescriptionToShortDescriptionInTasks < ActiveRecord::Migration[7.1]
  def change
    rename_column :tasks, :description, :short_description
  end
end
