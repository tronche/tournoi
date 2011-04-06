class PagesController < ApplicationController
  def home
  @title="Accueil"
  end
  
  def about
  @title="A Propos"
  end
  
  def contact
  @title="Contact"
  end


end
