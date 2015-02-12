class ArticlesController < ApplicationController
  inherit_resources
  actions :all, except: [:index, :show, :destroy]

  def index
    @articles = Article.filter(params)
    render :filter if request.xhr?
  end

  def new
    new! do |format|
      format.html { render :content, locals: {action: :new} }
    end
  end

  def edit
    edit! do |format|
      format.html { render :content, locals: {action: :edit} }
    end
  end

  def create
    create! do |success, _failure|
      success.js do
        flash[:success] = t(:created, model: t(:article_nomative))
        render :messages
      end
    end
  end

  def update
    update! do |success, _failure|
      success.js do
        flash[:success] = t(:updated, model: t(:article_nomative))
        render :messages
      end
    end
  end

  private

  def permitted_params
    params.permit(article: [:title, :category, :author])
  end
end
