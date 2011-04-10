class PhasesController < ApplicationController

def show
	@tournament = Tournament.find(params[:tournament_id]) 
	@phase = @tournament.leagues.find(params[:id]) 
	@title = @phase.name
end
  
def index
   @tournament = Tournament.find(params[:tournament_id]) 
   @phases = @tournament.phases.all
   @title = "All Phases of Tournament"
end

end