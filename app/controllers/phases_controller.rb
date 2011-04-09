class PhasesController < ApplicationController

def show
	@tournament = Tournament.find(params[:tournament_id]) 
	@phase = @tournament.phases.find(params[:id]) 
	@title = @phase.name
end
  
def index
	@tournament = Tournament.find(params[:tournament_id]) 
    @phases = @tournament.phases.all
	@title = "All Phases of Tournament"
end
  
def new
  @tournament = Tournament.find(params[:tournament_id]) 
  @phase = @tournament.phases.new
  @title = "Nouvelle Etape"
end

 
  def create
  	@tournament = Tournament.find(params[:tournament_id])
    @phase = @tournament.phases.build(params[:phase])
    if @phase.save
	  flash[:success] = "Nouvelle Etape Crée!"
      redirect_to ([@tournament,@phase])
    else
      render 'new'
    end
  end
  
    def edit
	@tournament = Tournament.find(params[:tournament_id])
	@phase = @tournament.phases.find(params[:id])
    @title = "Edit Phase"
  end
  
    def update
	@tournament = Tournament.find(params[:tournament_id])
	@phase = @tournament.phases.find(params[:id])
    if @phase.update_attributes(params[:phase])
      flash[:success] = "Phase updated."
      redirect_to ([@tournament,@phase])
    else
      @title = "Edit Phase"
      render 'edit'
    end
  end
end