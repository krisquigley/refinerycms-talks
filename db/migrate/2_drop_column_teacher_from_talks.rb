class DropColumnTeacherFromTalks < ActiveRecord::Migration

  def change
    remove_column :refinery_talks, :teacher, :string
  end

end
