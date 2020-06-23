# frozen_string_literal: true

class User < ApplicationRecord
  validates :username, length: { minimum: 4, maximum: 12 }, presence: true, uniqueness: true
  validates :email, format: { with: /\A[\w+\-.]+@[\w+\-.]*\.[a-z]+\z/i }, presence: true, uniqueness: true
  validates :password, length: { minimum: 6, maximum: 16 }, presence: true
end
