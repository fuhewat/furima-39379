class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :post_code,             null: false
      t.string     :send_municipalities,   null: false
      t.integer    :send_area_id,          null: false, default: "0"
      t.string     :send_address_number,   null: false
      t.string     :tel_number,            null: false
      t.string     :building_name
      t.references :order,                 null: false,foreign_key: true
      t.timestamps
    end
  end
end
