class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :address, null: false
      t.string :unit_id, null: false
      t.integer :rent_amount, null: false
      t.integer :number_of_rooms, null: false
      t.boolean :pet_friendly, null: true, default: false
      t.boolean :occupied_or_not, null: false, default: false
      t.integer :rent_deposit, null: false
      t.string  :begining_of_lease_date, null: false
      t.string  :end_of_lease_date, null: true
    end
  end
end
