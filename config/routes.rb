Rails.application.routes.draw do

  namespace :admin do
    get 'settings/slack' => 'settings#slack', as: :slack_settings
  end

end
