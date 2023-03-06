class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  validates :password, on: :create, format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i, message:" is invalid. Include both letters and numbers"}, 
  length: { minimum: 6, message:" is too short (minimum is 6 characters)"}
  validates :nickname, presence: true       
  validates :first_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/, message:"is invalid. Input full-width characters"}
  validates :last_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/, message:"is invalid. Input full-width characters"}
  validates :first_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/, message:"is invalid. Input full-width katakana characters"}
  validates :last_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/, message:"is invalid. Input full-width katakana characters"}
  validates :birth_day, presence: true
end
