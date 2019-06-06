
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
# Form page to create Article
  get '/articles/new' do
    erb :new
  end

#Create and redirect
  post '/articles' do
    @new_article = Article.create(params)
    redirect :"/articles/#{@new_article.id}"
  end

# Show all
  get '/articles' do
    @articles = Article.all
    erb :index
  end

# Show Specific
  get '/articles/:id' do
    @article = Article.find_by(id: params[:id])
    erb :show
  end
# Form to update Article
  get '/articles/:id/edit' do
    @article = Article.find_by(id: params[:id])
    erb :edit
  end

#Create and redirect
    patch '/articles/:id' do
      @updated_article = Article.update(params[:id], title: params[:title], content: params[:content])
      redirect :"/articles/#{@updated_article.id}"
    end
#Deletion
  delete '/articles/:id' do
    Article.find_by(id: params[:id]).destroy
    redirect :'/articles'
  end
end
