class CreateDisbursements < ActiveRecord::Migration[6.1]
  def change
    create_table :disbursements do |t|
      t.float :amount, null: false
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
