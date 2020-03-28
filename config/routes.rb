# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, only: [:sessions]
  root to: 'games#index'
end
