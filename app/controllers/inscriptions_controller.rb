class InscriptionsController < ApplicationController
  before_filter :authenticate

  def create
    @tournament = Tournament.find(params[:inscription][:tournament_id])
    current_user.inscrit!(@tournament)
	flash[:success] = "Inscription prise en compte !"
    redirect_to @tournament
  end

  def destroy
    @tournament = Inscription.find(params[:id]).tournament
    current_user.desinscrit!(@tournament)
	flash[:success] = "Desinscription prise en compte !"
    redirect_to @tournament
  end
end
