class RemoveBankCodeFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :bank_code, :integer
  end
end
