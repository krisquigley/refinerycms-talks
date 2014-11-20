class AddColumnSlugToTeachers < ActiveRecord::Migration
  def change
    add_column :refinery_talks_teachers, :slug, :string
  end
end
