class AddCompanyRefToJobPost < ActiveRecord::Migration[5.0]
  def change
    add_reference :job_posts, :company, foreign_key: true
  end
end
