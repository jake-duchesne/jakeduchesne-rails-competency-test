class ArticlesController < ApplicationController
  before_action :require_login, only: [:show]
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :ownership, only: [:edit, :update, :destroy]
  before_action :set_category, only: [:show]
  access  all:            [:show, :index], 
          user: {except:  [:destroy, :new, :create, :update, :edit]},
          editor:         [:destroy, :new, :create, :delete, :edit],
          admin:          :all

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end
    
    def set_category
      @articles = Article.all
      @article_list = @articles.group_by{ |t| t.category.title }
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :body, :category_id, :user_id)
    end

    def require_login
      if current_user.is_a?(GuestUser)
        redirect_to new_user_registration_path, notice: "Please login to view that page"
      end
    end

    def ownership
      # current_user.articles.find(params[:id])
      redirect_to articles_path, notice: "THIS IS NOT YOUR ARTICLE" unless @article.user_id == current_user.id
    end
       
end
