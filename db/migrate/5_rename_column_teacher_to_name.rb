class RenameColumnTeacherToName < ActiveRecord::Migration
  def change
    rename_column :refinery_talks_teachers, :teacher, :name
  end
end
