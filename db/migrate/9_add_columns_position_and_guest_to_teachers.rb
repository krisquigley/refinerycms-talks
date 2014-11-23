class AddColumnsPositionAndGuestToTeachers < ActiveRecord::Migration
  def change
    add_column :refinery_talks_teachers, :position, :integer
    add_column :refinery_talks_teachers, :guest, :boolean, default: false
  end
end
