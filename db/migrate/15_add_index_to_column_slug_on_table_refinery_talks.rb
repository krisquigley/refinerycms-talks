class AddIndexToColumnSlugOnTableRefineryTalks < ActiveRecord::Migration
  def change
    add_index :refinery_talks, :slug
  end
end
