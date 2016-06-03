class SorceryCore < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :email,            :null => false
      t.string  :crypted_password
      t.string  :salt
      t.integer :taxpayer_id
      t.integer :register_number
      t.date    :register_number_start_date
      t.string  :swift_code
      t.integer :iban_number
      t.integer :bank_code
      t.belongs_to :role

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
