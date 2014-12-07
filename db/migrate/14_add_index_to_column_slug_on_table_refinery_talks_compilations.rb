class AddIndexToColumnSlugOnTableRefineryTalksCompilations < ActiveRecord::Migration
  def change
    add_index :refinery_talks_compilations, :slug
  end
end
