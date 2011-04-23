class LeaguesController < ApplicationController
def show
	@tournament = Tournament.find(params[:tournament_id]) 
	@phase = @tournament.phases.find(params[:id]) 
	@groups = @phase.groups
	@title = "Phase de type League"
end

def classement
end

def matchs
end

end