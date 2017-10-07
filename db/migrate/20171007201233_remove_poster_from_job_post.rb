class RemovePosterFromJobPost < ActiveRecord::Migration[5.0]
  def change
    remove_column :job_posts, :poster, :string
  end
end
