
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/new' do

    erb :new
  end

  post '/articles' do
    @article_new = Article.create(title: params["title"], content: params["content"])
    redirect to "articles/#{@article_new.id}"
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])

    erb :show
  end

  get "/articles/:id/edit" do
    @article = Article.find(params[:id])

    erb :edit
  end

  patch '/articles/:id' do
    @patch_article = Article.find(params[:id])
    @patch_article.update(title: params["title"], content: params["content"])
    redirect to "articles/#{@patch_article.id}"
  end

  delete '/articles/:id' do
    @article_id = Article.find(params[:id])
    @article_id.delete
    redirect to "articles"
  end

end
