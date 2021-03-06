class TournamentsController < ApplicationController

  def destroy
    Tournament.find(params[:id]).destroy
    flash[:success] = "Tournoi detruit."
    redirect_to tournaments_path
  end

  def index
    @title = "Tous les tournois"
    @tournaments = Tournament.all
  end

    def show
    @tournament = Tournament.find(params[:id])
	@title = @tournament.name
  end
  
  def new
    @tournament = Tournament.new
	@title = "Participez"
  end
  
  def create
    @tournament = Tournament.new(params[:tournament])
    if @tournament.save
	  flash[:success] = "Nouveau Tournoi Sauvegarde!"
      redirect_to @tournament
    else
      render 'new'
    end
  end

  def edit
	@tournament = Tournament.find(params[:id])
    @title = "Editer Tournoi"
  end
  
  def update
	@tournament = Tournament.find(params[:id])
    if @tournament.update_attributes(params[:tournament])
      flash[:success] = "Tournoi mis a jour."
      redirect_to @tournament
    else
      @title = "Editer tournoi"
      render 'edit'
    end
  end
  
    def upstatus
	@tournament = Tournament.find(params[:id])
	if @tournament.upstatus(params[:tournament][:status])
      flash[:success] = "Status du Tournoi mis a jour."
      redirect_to @tournament
    else
	  render 'show'
    end
  end
  
end