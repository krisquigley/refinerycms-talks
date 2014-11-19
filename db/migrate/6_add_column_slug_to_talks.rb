class AddColumnSlugToTalks < ActiveRecord::Migration
  def change
    add_column :refinery_talks, :slug, :string
  end
end
