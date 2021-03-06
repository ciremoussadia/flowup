# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'subscriptions#new'

  resources :subscriptions, only: %i[new create index]
end
