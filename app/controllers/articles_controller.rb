# frozen_string_literal: true

class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
  end
  def index
    @articles=Article.all
  end
  def new
    @article = Article.new
  end
  def create
    @article = Article.new(article_params)
    
    if @article.save
      flash[:notice] = 'Article was created successfully.'
      redirect_to @article
    else
      render 'new'
    end
    # Article.create(article_params)
    #@article.save(article_params)
    # redirect_to articles_path
  end

  def destroy
    Article.find(params[:id]).delete
    redirect_to articles_path
  end

  def edit
    @article = Article.find(params[:id])
  end
  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    if @article.save
      flash[:notice] = 'Article was Updated Successfully.'
      redirect_to articles_path
    else
    # Article.create(article_params)
    #@article.save(article_params)
    render 'edit'
    end
  end
  private
  # Using a private method to encapsulate the permissible parameters
  # is just a good pattern since you'll be able to reuse the same
  # permit list between create and update. Also, you can specialize
  # this method with per-user checking of permissible attributes.
  def article_params
    params.require(:article).permit(:title, :description)
  end
end
