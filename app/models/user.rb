# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :rememberable, :validatable

  validates :name, presence: true, uniqueness: true

  has_many :created_games, class_name: 'Game', foreign_key: 'creator_id', dependent: :delete_all
end
