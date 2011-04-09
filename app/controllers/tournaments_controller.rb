class TournamentsController < ApplicationController

  def destroy
    Tournament.find(params[:id]).destroy
    flash[:success] = "Tournament destroyed."
    redirect_to tournaments_path
  end

  def index
    @title = "All Tournaments"
    @tournaments = Tournament.all
  end

    def show
    @tournament = Tournament.find(params[:id])
	@title = @tournament.name
  end
  
  def new
    @tournament = Tournament.new
	@title = "Sign up"
  end
  
  def create
    @tournament = Tournament.new(params[:tournament])
    if @tournament.save
	  flash[:success] = "New Tournament Saved!"
      redirect_to @tournament
    else
      render 'new'
    end
  end

  def edit
	@tournament = Tournament.find(params[:id])
    @title = "Edit Tournament"
  end
  
    def update
	@tournament = Tournament.find(params[:id])
    if @tournament.update_attributes(params[:tournament])
      flash[:success] = "Tournament updated."
      redirect_to @tournament
    else
      @title = "Edit tournament"
      render 'edit'
    end
  end
end