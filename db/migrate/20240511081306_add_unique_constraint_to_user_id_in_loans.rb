class AddUniqueConstraintToUserIdInLoans < ActiveRecord::Migration[7.1]
  def change
    remove_index :loans, :user_id
    add_index :loans, :user_id, unique: true
  end
end
