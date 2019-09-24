class IdeasController < ApplicationController

	def index 
		# assiging the ideas object the all ideas table content from the datbase
		@ideas = Idea.order("created_at DESC").paginate(:page => params[:page], :per_page => 10 )
	end 

	def create 
    #creating a new create idea using the create function by hitting to the idea model 
		@ideas = Idea.create(idea_params)
     if @idea.valid?
      flash[:success] = "Your idea has been posted!"
    else
      flash[:alert] = "Woops! Looks like there has been an error!"
    end
    redirect_to root_path

	end

  #editing the ideas by 

  def edit
    @idea = Idea.find(params[:id])
  end

  #updating our ideas field 

  def update 
    @ideas = Idea.find(params[:id])
    if @ideas.update( idea_params )
      flash[:success] = " The idea has been udpated"
      redirect_to root_path
    else
      flash[:alert] = " whoops error"
      redirect_to edit_idea_path(params[:id])
    end
  end
  
  #creating the destroy or delete for our ideator

  def destroy 
    @idea = Idea.find(params[:id])
    @idea.destroy
    flash[:success] = "The idea was successfully deleted!"
    redirect_to root_path
  end

    # creating a encapsulation to prevent the external user from cracking the permission 

	private 

   #creating private space to whitelist the parameters

	def idea_params
		params.require(:idea).permit(:description, :author)
	end

end

