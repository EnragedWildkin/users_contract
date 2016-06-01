class CreateUserFields < ActiveRecord::Migration
  def change
    create_table :user_fields do |t|
      t.string  :first_name
      t.string  :last_name
      t.string  :middle_name

      t.string  :contract_price
      t.string  :location
      t.string  :address

      t.integer :c_a_number
      t.string  :bank_name
      t.string  :bank_address
      t.string  :language
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
