class AddJobRefToCompanies < ActiveRecord::Migration[5.0]
  def change
    add_reference :companies, :job_post, foreign_key: true
  end
end
