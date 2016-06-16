class SorceryCore < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :email
      t.string  :crypted_password
      t.string  :salt
      t.string  :taxpayer_id
      t.string  :register_number
      t.date    :register_number_start_date
      t.string  :swift_code
      t.string  :iban_number
      t.integer :bank_code
      t.string  :passport_number
      t.string  :intermediary_bank_name
      t.string  :intermediary_bank_swift_code
      t.belongs_to :role

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
