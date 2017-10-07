class AddRatingToCompany < ActiveRecord::Migration[5.0]
  def change
	remove_column :companies, :rating
    add_column :companies, :rating, :float
  end
end
