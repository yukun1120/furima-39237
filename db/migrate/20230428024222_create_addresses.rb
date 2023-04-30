class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :post_code, null:false
      t.integer :region_id, null:false
      t.string :municipality, null:false
      t.string :number, null:false
      t.string :building
      t.string :telephone, null:false
      t.references :order, null:false, foreign_key: true
      t.timestamps
    end
  end
end
