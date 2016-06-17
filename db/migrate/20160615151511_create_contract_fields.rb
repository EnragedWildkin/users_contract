class CreateContractFields < ActiveRecord::Migration
  def change
    create_table :contract_fields do |t|
      t.string     :customer_payment
      t.string     :maximum_bonuses_size
      t.string     :total_payments
      t.string     :language
      t.belongs_to :contract

      t.timestamps null: false
    end
  end
end
