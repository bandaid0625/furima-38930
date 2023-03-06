class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, presence: true
         validates :first_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/, message:"全角（漢字・ひらがな・カタカナ）で入力してください。"}
         validates :last_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/, message:"全角（漢字・ひらがな・カタカナ）で入力してください。"}
         validates :first_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/, message:"カタカナで入力してください。"}
         validates :last_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/, message:"カタカナで入力してください。"}
         validates :birth_day, presence: true
end
