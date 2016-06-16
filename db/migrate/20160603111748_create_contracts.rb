class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.string     :number
      t.date       :start_date
      t.date       :end_date
      t.belongs_to :user
      t.belongs_to :draft
      t.belongs_to :person_type

      t.timestamps null: false
    end
  end
end
