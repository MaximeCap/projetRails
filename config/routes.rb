Rails.application.routes.draw do
  get 'utilisateurs/new'

  root 'statique#accueil'

  get '/contact', to: 'statique#contact'

  get '/team', to: 'statique#team'

  get '/services', to: 'statique#services'

  get '/signup', to: 'utilisateurs#new'

end
