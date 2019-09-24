class IdeasController < ApplicationController

	def index 
		# assiging the ideas object the all ideas table content from the datbase
		@ideas = Idea.all
	end 

	def create 
    #creating a new create idea using the create function by hitting to the idea model 
		@ideas = Idea.create(idea_params)
    if @idea.valid?
      redirect_to root_path
    else 
      render 'new' 
    end

	end

  #editing the ideas by 

  def edit
    @idea = Idea.find(params[:id])
  end

  #updating our ideas field 

  def update 
    @ideas = Idea.find(params[:id])
    if @ideas.update( idea_params )
      redirect_to root_path
    else
      redirect_to edit_idea_path(params[:id])
    end
  end
  
  #creating the destroy or delete for our ideator

  def destroy 
    @idea = Idea.find(params[:id])
    @idea.destroy
    redirect_to root_path
  end

    # creating a encapsulation to prevent the external user from cracking the permission 

	private 

   #creating private space to whitelist the parameters

	def idea_params
		params.require(:idea).permit(:description, :author)
	end

end

