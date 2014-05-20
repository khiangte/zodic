class CreateMizoenglishes < ActiveRecord::Migration
  def self.up
    create_table :mizoenglishes do |t|
			t.string :word
      t.string :definition
    end
  end

  def self.down
    drop_table :mizoenglishes
  end
end
