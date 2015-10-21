class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name
      t.integer :user_id
      t.timestamps null: false
    end

    add_column :images, :album_id, :integer, :default => nil
  end
end
