class JobPostsController < ApplicationController
	def index
		@posts = JobPost.all
	end
end
