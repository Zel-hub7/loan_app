class CreateLoans < ActiveRecord::Migration[7.1]
  def change
    create_table :loans do |t|
      t.decimal :amount, precision: 15, scale: 2
      t.string :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
