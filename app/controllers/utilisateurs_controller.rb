class UtilisateursController < ApplicationController
  def new
    @utilisateur = Utilisateur.new
  end
  
  def show
    @utilisateur = Utilisateur.find(params[:id])
  end

  def create
    @utilisateur = Utilisateur.new(utilisateur_params)# On crée une autre fonction car si on utilise params[] > permet à n'importe qui d'avoir des droits administrateurs
    if @utilisateur.save
      # Sauvegarde confirmé <- True
    else
      render "new"
    end
  end

  private 

  def utilisateur_params
    params.require(:utilisateur).permit(:nom, :email, :password, :password_confirmation)
  end

end
