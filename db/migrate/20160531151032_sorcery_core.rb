class SorceryCore < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :email,            :null => false
      t.string  :crypted_password
      t.string  :salt
      t.string  :first_name
      t.string  :last_name
      t.string  :middle_name
      t.boolean :remote

      t.string  :location_city
      t.string  :location_country

      t.integer :contract_zip_code
      t.string  :contract_street
      t.string  :contract_city
      t.string  :contract_country

      t.integer :taxpayer_id
      t.integer :register_number
      t.date    :register_number_start_date
      t.integer :c_a_number
      t.string  :bank_name
      t.integer :bank_zip_code
      t.string  :bank_street
      t.string  :bank_city
      t.string  :bank_country
      t.string  :swift_code
      t.integer :iban_number

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end