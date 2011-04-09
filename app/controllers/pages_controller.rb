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

  def video
  send_file 'videos/fifa.flv',
  :filename => 'fifavideo' + '.flv',
  :type => 'video/x-flv',
  :disposition => 'inline'
  end

end
