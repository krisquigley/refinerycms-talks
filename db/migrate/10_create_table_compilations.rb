class CreateTableCompilations < ActiveRecord::Migration

  def up
    create_table :refinery_talks_compilations do |t|
      t.string :title
      t.belongs_to :teacher, index: true
      t.timestamps
    end

  end

  def down

    drop_table :refinery_talks_compilations

  end

end
