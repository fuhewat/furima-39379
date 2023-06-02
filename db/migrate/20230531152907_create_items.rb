class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string      :title,               null: false, default: ""
      t.text        :description,         null: false
      t.integer     :price,               null: false, default: "0"
      t.integer     :category_id,         null: false, default: "0"
      t.integer     :condition_id,        null: false, default: "0"
      t.integer     :delivery_charge_id,  null: false, default: "0"
      t.integer     :send_area_id,        null: false, default: "0"
      t.integer     :sender_day_id,       null: false, default: "0"
      t.references  :user,                null: false, foreign_key: true
      t.timestamps
    end
  end
end
