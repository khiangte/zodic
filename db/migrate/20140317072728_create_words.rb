class CreateWords < ActiveRecord::Migration
  def self.up
    create_table :words do |t|
      t.string :word
      t.string :thumal
      t.string :pos
      t.string :meaning
      t.string :example

    end
  end

  def self.down
    drop_table :words
  end
end
