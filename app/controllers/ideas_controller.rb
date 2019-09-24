class IdeasController < ApplicationController

	def index 
		# assiging the ideas object the all ideas table content from the datbase
		@ideas = Idea.all
	end 

	def create 
		@ideas = Idea.create(idea_params)
		redirect_to root_path
	end

    # creating a encapsulation to prevent the external user from cracking the permission 

	private 

	def idea_params
		params.require(:idea).permit(:description, :author)
	end

end

