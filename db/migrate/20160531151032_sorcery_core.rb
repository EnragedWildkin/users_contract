class SorceryCore < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :email,            :null => false
      t.string  :crypted_password
      t.string  :salt

      t.string  :first_name
      t.string  :last_name
      t.string  :middle_name

      t.string  :contract_price
      t.string  :location
      t.string  :address

      t.integer :taxpayer_id
      t.integer :register_number
      t.date    :register_number_start_date
      t.integer :c_a_number
      t.string  :bank_name
      t.string  :bank_address
      t.string  :swift_code
      t.integer :iban_number

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end