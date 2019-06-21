class FavoritesController < ApplicationController
  def index
    @user = current_user
    @favorite = @user.favorites
  
  end

  # ↓参考：https://qiita.com/tomoharutsutsumi/items/488beb4983b12484bbb6

  def rank_all
    word_favorite_count = Word.joins(:favorites).where(created_at: 1.months.ago..Time.now).group(:word_id).count
    word_favorited_ids = Hash[word_favorite_count.sort_by{ |_, v| -v }].keys
    @word_ranking = Word.where(id: word_favorited_ids).sort_by{|o| word_favorited_ids.index(o.id)}[0..9]
  end

  def rank_pro
    word_favorite_count = Word.joins(:favorites).where(word_flag: "著名人", created_at: 1.months.ago..Time.now).group(:word_id).count
    word_favorited_ids = Hash[word_favorite_count.sort_by{ |_, v| -v }].keys
    @word_ranking = Word.where(id: word_favorited_ids).sort_by{|o| word_favorited_ids.index(o.id)}[0..9]
  end

  def rank_ama
      word_favorite_count = Word.joins(:favorites).where(word_flag: "一般人", created_at: 1.months.ago..Time.now).group(:word_id).count
      word_favorited_ids = Hash[word_favorite_count.sort_by{ |_, v| -v }].keys
      @word_ranking = Word.where(id: word_favorited_ids).sort_by{|o| word_favorited_ids.index(o.id)}[0..9]
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
    # 同一ページへリダイレクト
  	redirect_back(fallback_location: root_path)
  end
end
