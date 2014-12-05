class CreateTableSystematizations < ActiveRecord::Migration

  def up
    create_table :refinery_talks_systematizations do |t|
      t.belongs_to :talk
      t.belongs_to :compilation
      t.timestamps
    end
  end

  def down

    drop_table :refinery_talks_systematizations

  end

end
