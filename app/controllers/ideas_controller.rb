class IdeasController < ApplicationController
	def index 
		# assiging the ideas object the all ideas table content from the datbase
		@ideas = Idea.all
	end 

end
