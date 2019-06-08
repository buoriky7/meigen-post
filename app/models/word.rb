class Word < ApplicationRecord
	belongs_to :user
	attachment :image
end
