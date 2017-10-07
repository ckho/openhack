class JobPostsController < ApplicationController
	def index
		@posts = JobPost.all
	end

	def new
		@post = JobPost.new
	end

	def edit
		find_post_by_id
	end

	def update
		find_post_by_id
		if @post.update(post_params)
			redirect_to @post
		else
			redirect_to edit_job_post_path
		end
	end
	
	def show
		find_post_by_id
	end

	def create
		@post = JobPost.create(post_params)

		if @post.save
			redirect_to @post
		else
			redirect_to new_post_path
		end
	end

	def find_post_by_id
		@post = JobPost.find(params[:id])
	end

	def post_params
		params.require(:job_post).permit(:job, :poster, :content)
	end

	def destroy
		find_post_by_id
		@post.destroy
		redirect_to root_path
	end
end
