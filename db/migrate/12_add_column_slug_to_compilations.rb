class AddColumnSlugToCompilations < ActiveRecord::Migration
  def change
    add_column :refinery_talks_compilations, :slug, :string
  end
end
