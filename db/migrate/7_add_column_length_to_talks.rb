class AddColumnLengthToTalks < ActiveRecord::Migration
  def change
    add_column :refinery_talks, :talk_length, :integer
  end
end
