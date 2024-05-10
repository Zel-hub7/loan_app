class AddNameColumnAndDefaultStatusToLoans < ActiveRecord::Migration[7.1]
  def change
    add_column :loans, :name, :string
    change_column :loans, :status, :string, default: "pending"
  end
end
