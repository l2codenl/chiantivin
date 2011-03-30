class CreateWines < ActiveRecord::Migration
  def self.up
    create_table :wines do |t|
      t.string :title
      t.string :url
      t.integer :wine_category_id

      t.timestamps
    end
  end

  def self.down
    drop_table :wines
  end
end
