class AddColumnBelongsToTeacher < ActiveRecord::Migration
  def change
    add_reference :refinery_talks, :teacher, index: true
  end
end
