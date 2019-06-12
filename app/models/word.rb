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

	# クラスメソッド
	def self.favorite_ids
		# 代入
		counts = Favorite.group(:word_id).count
		# key value 絞り込み
		# いいねのｘ個以上！
		selected_counts = counts.select {|k, v| v >= 1 }
		# keyで抽出
		selected_counts.keys
	end


end

