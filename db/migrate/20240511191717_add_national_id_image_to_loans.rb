class AddNationalIdImageToLoans < ActiveRecord::Migration[7.1]
  def change
    add_column :loans, :national_id_image, :string
  end
end
