class LeaguesController < ApplicationController

def new
  @tournament = Tournament.find(params[:tournament_id]) 
  @league = League.new
  @title = "Nouvelle Etape"
end

def create
  	@tournament = Tournament.find(params[:tournament_id])
	@league = @tournament.leagues.build(params[:league])
	
    if @league.save
	  flash[:success] = "Nouvelle Etape de Type League Crée!"
      redirect_to ([@tournament])
    else
      render 'new'
    end
 end
  
  def edit
	@tournament = Tournament.find(params[:tournament_id])
	@league = @tournament.leagues.find(params[:id])
    @title = "Edit Phase"
  end
  
    def update
	@tournament = Tournament.find(params[:tournament_id])
	@league = @tournament.leagues.find(params[:id])
    if @league.update_attributes(params[:league])
      flash[:success] = "Phase updated."
      redirect_to ([@tournament])
    else
      @title = "Edit Phase"
      render 'edit'
    end
	end
  


end