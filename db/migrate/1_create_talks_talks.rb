class CreateTalksTalks < ActiveRecord::Migration

  def up
    create_table :refinery_talks do |t|
      t.text :description
      t.string :title
      t.string :teacher
      t.datetime :date
      t.integer :file_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-talks"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/talks/talks"})
    end

    drop_table :refinery_talks

  end

end
