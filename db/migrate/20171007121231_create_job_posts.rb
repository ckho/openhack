class CreateJobPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :job_posts do |t|
      t.string :job
      t.string :poster
      t.text :content

      t.timestamps
    end
  end
end
