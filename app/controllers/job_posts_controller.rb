class JobPostsController < ApplicationController
	def index
		@posts = JobPost.all
	end

	def new
		@post = JobPost.new
		set_company
	end

	def edit
		set_post
		set_company
	end

	def update
		set_company
		set_post
		if @post.update(post_params)
			redirect_to [@company, @post]
		else
			redirect_to edit_company_job_post_path
		end
	end
	
	def show
		set_company
		set_post
	end

	def create
		set_company
		@post = @company.job_posts.create(post_params)

		if @post.save
			redirect_to [@company, @post]
		else
			redirect_to new_company_post_path
		end
	end

	def post_params
		params.require(:job_post).permit(:job, :content, :company_id)
	end

	def destroy
		set_company
		set_post
		@post.destroy
		redirect_to @company
	end

	private
		def set_company
			@company = Company.find(params[:company_id])
		end

		def set_post
			@post = JobPost.find(params[:id])
		end
end
