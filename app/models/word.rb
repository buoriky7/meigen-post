class Word < ApplicationRecord
	belongs_to :user
	attachment :image
	validates :speaker, presence: true, length: { in: 2..30 }
	validates :speaker_gender, presence: true
	validates :sp_word, presence: true, length: { in: 3..100 }
	validates :commentary, presence: true, length: { maximum: 200 }
	validates :word_flag, presence: true
	validates :genre, presence: true, length: { in: 1..10 }
end
