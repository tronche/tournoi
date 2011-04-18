class InscriptionsController < ApplicationController
  before_filter :authenticate


  def create
    @tournament = Tournament.find(params[:inscription][:tournament_id])
    if @tournament.open?
		current_user.inscriptions.create!(:tournament_id => @tournament.id)
		flash[:success] = "Inscription prise en compte !"
	else
		flash[:error] = "Tournoi demarre .."
	end
    redirect_to @tournament
  end

  def destroy
    @tournament = Inscription.find(params[:id]).tournament
    if @tournament.open?
		current_user.inscriptions.find_by_tournament_id(@tournament).destroy
		flash[:success] = "Desinscription prise en compte !"
	else
		flash[:error] = "Tournoi demarre .."
	end
    redirect_to @tournament
  end
  

  
  def update
    @inscription = Inscription.find(params[:id])
	if @inscription.tournament.choix? && @inscription.user == current_user && @inscription.user.titulaire?(@inscription.tournament)
		if @inscription.update_attributes(:team_id=>(params[:inscription][:team_id]))
			flash[:success] = "Equipe Prise en compte"
		end
	else
	flash[:error] = "Vous devez utiliser"
	end
	redirect_to @inscription.tournament
  end
  
end
