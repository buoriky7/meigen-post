class RootController < ApplicationController
  def top
  	 @word = Word.find(Word.favorite_ids.sample)
  	 # @word = User.group("name")
  end

  def about
  end
end
