class CreateFigments < ActiveRecord::Migration
  def self.up
    create_table :figments do |t|
      t.integer :value
      t.string :contents
      t.references :account

      t.timestamps
    end
  end

  def self.down
    drop_table :figments
  end
end
