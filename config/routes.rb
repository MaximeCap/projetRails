Rails.application.routes.draw do
  root 'statique#accueil'

  get 'statique/contact'

  get 'statique/team'

  get 'statique/services'


end
