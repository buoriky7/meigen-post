class Word < ApplicationRecord
	belongs_to :user
    has_many :favorites, dependent: :destroy
    def favorited_by?(user)
      favorites.where(user_id: user.id).exists?
    end

	attachment :image
	validates :speaker, presence: true, length: { in: 1..30 }
	validates :speaker_gender, presence: true
	validates :sp_word, presence: true, length: { in: 3..100 }
	validates :word_flag, presence: true
	validates :genre, presence: true, length: { in: 1..10 }

end
