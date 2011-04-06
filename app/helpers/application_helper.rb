module ApplicationHelper


  # Retourne un titre 
  def title
    base_title = "Gestion Automatique de Tournois Footballistiques"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  # Retourne l'adresse de WaP
  def wearepes
    wearepes = "http://www.wearepes.com"
   "#{wearepes}"
  end
  
end
