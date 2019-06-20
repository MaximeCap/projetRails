class UtilisateursController < ApplicationController
  def new
  end
  
  def show
    @utilisateur = Utilisateur.find(params[:id])
  end
end
