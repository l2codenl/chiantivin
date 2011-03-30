class CreateWineCategories < ActiveRecord::Migration
  def self.up
    create_table :wine_categories do |t|
      t.string :title
      t.string :url
      t.text :body

      t.timestamps
    end
  end

  def self.down
    drop_table :wine_categories
  end
end
