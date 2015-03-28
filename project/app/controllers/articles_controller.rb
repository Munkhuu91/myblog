class ArticlesController < ApplicationController

#	http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
 
	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
	end

	def new
	end

	def edit
		@article = Article.find(params[:id])
	end

	def create
		@article = Article.new(params[:article])

	if @article.save
		redirect_to @article
	else 
		render 'new'
	end
	end

	def update
	  @article = Article.find(params[:id])
	 
	  if @article.update_attributes(params[:article])
		redirect_to @article
	  else
		render 'edit'
	  end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
	 
		redirect_to articles_path
	end
	
	def search
#	select * from article where text ="aaa"
#	@articles = Article.where("text = ?",params[:q])
	@articles = Article.where("text = ? and title = ?",params[:text],params[:title])
	@articles = Article.where("text LIKE ? OR title LIKE ?", "%#{params[:text]}%", "%#{params[:title]}%") 
	if @articles.present?
	else 
		render 'error'
	end
	
	def error
	end
#	  Article.find_by_text(params[:q])
	  
#	  debug
#	  @articles.each do |article|
#		puts article.title
#	  end
	  
#		@articles = Article.where(:text => params[:q])  ' 1=1 -- '
#		@articles = Article.where("text = ?", params[:q] )
	end
end