class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :set_search

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :prefecture, :user_gender ])
	end



	def set_search
	  #@search = Article.search(params[:q])
	  @search = Word.ransack(params[:q]) #ransackメソッド推奨
	  @search_words = @search.result.page(params[:page])

	end

end
