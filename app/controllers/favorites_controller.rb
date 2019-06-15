class FavoritesController < ApplicationController
  def index
    @user = current_user
    @favorite = @user.favorites
  
  end

  def lank_all
  end

  def lank_pro
  end

  def lank_ama
  end


  def create
  	word = Word.find(params[:word_id])
  	favorite = current_user.favorites.new(word_id: word.id)
  	favorite.save
  	redirect_to word_path(word)
  end

  def destroy
  	word = Word.find(params[:word_id])
  	favorite = current_user.favorites.find_by(word_id: word.id)
  	favorite.destroy
    # 同一ページへリダイレクトする！
  	redirect_back(fallback_location: root_path)
  end
end
