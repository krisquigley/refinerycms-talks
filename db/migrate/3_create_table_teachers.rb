class CreateTableTeachers < ActiveRecord::Migration

  def up
    create_table :refinery_talks_teachers do |t|
      t.string :teacher
      t.timestamps
    end

  end

  def down

    drop_table :refinery_talks_teachers

  end

end
