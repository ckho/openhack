class AddElementsToCompany < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :name, :string
    add_column :companies, :description, :text
    add_column :companies, :rating, :integer
    add_column :companies, :number_of_votes, :integer
    add_column :companies, :logo, :string
  end
end
