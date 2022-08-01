class ArticlesController < ApplicationController


  http_basic_authenticate_with name: "atul", password: "atul@12", except: [:index, :show]

  before_action  :validate_and_save  [save]
  def index
    @article = Article.all
  end
  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save

      redirect_to @article
    else
      render :new,  status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])

  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to root_path, status: :see_other
    #redirect_to root_path, status: :see_other
  end
  def validate_and_save
    puts "you are succesfully  update your article "
  end


  private
  def article_params
    params.require(:article).permit( :title , :body )
  end
end


