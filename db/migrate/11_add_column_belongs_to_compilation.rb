class AddColumnBelongsToCompilation < ActiveRecord::Migration
  def change
    add_reference :refinery_talks, :compilation, index: true
  end
end
