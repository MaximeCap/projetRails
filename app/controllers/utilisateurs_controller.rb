class UtilisateursController < ApplicationController
  def new
    @utilisateur = Utilisateur.new
  end
  
  def show
    @utilisateur = Utilisateur.find(params[:id])
  end
end
