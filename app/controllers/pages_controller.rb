class PagesController < ApplicationController

  def home

    @articles = Article.all
    @article_list = @articles.group_by{ |t| t.category.title }

  end

end
