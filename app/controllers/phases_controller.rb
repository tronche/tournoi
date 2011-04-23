class PhasesController < ApplicationController


# Methode qui ont besoin du type d'objet ( p_type)

def new
  @tournament = Tournament.find(params[:tournament_id]) 
  @phase = p_type.new
  @title = "Creer Nouvelle etape de type #{p_type}"
end

def create
	@tournament = Tournament.find(params[:tournament_id]) 
	
	if @tournament.phases <<  p_type.new(params[:phase])
	  flash[:success] = "Nouvelle Etape de Type #{p_type} Cree!"
      redirect_to tournament_phases_path
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
      flash[:success] = "#{p_type} mis a jour."
      redirect_to tournament_phases_path
    else
      @title = "Editer #{p_type}"
      render 'edit'
    end
end

def start
	@tournament = Tournament.find(params[:tournament_id])
	@phase = @tournament.phases.find(params[:id])
	
	if @phase.canstart? && @phase.start!

	  flash[:success] = "Demarrage de la phase , groupes constitues. "
 
	  redirect_to tournament_phases_path
	else	
			  render 'show'
	end

  end



# Méthode Génériques pour les phases

  
def index
   @tournament = Tournament.find(params[:tournament_id]) 
   @phases = @tournament.phases.all
   @title = "All Phases of Tournament"
end

def destroy
  @tournament = Tournament.find(params[:tournament_id])
  @tournament.phases.find(params[:id]).destroy
  flash[:success] = "Phase detruite."
  redirect_to tournament_phases_path(@tournament)
end
  
  private
  def p_type
    params[:type].constantize
  end

end