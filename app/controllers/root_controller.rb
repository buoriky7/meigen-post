class RootController < ApplicationController
  def top
  	 @word = Word.find(Word.favorite_ids.sample)
  	 @words = Word.all
  end

  def about
  end
end
