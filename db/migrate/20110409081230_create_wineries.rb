class CreateWineries < ActiveRecord::Migration
  def self.up
    create_table :wineries do |t|
      t.string :title
      t.string :url
      t.text :body

      t.timestamps
    end
  end

  def self.down
    drop_table :wineries
  end
end
