class AddIndexToColumnSlugOnTableRefineryTalksTeachers < ActiveRecord::Migration
  def change
    add_index :refinery_talks_teachers, :slug
  end
end
