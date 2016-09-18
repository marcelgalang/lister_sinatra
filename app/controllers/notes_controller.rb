class NotesController < ApplicationController

  get '/notes' do
    if logged_in?
      @notes = Note.all
      erb :'notes/index'
    else
      redirect to '/login'
    end
  end

  get '/notes/new' do
    if logged_in?
      erb :'notes/new'
    else
      redirect to '/login'
    end
  end

  post 'notes' do
    if params[:content] == ""
      redirect to '/notes/new'
    else
      user = User.find_by_id(session[:user_id])
      @note = Note.create(:content => params[:content], :user_id => user.id)

      redirect to ('/notes/#{@note.id}')
    end
  end

  get '/notes/:id' do
    if logged_in?
      @note = Note.find_by_id(params[:id])
      erb :'/notes/show'
    else
      redirect to '/login'
    end
  end

  post '/notes/:id/edit' do
    if session[:user_id]
      @note = Note.find_by_id(params[:id])
      #give permissions to other users here?
      if @note.user_id == session[:user_id]
        erb :'notes/edit'
      else
        redirect to '/notes'
      end
    else
      redirect to '/login'
    end
  end

  patch '/notes/:id' do
    if params[content]==""
      redirect to '/notes/#{params[:id]}/edit'
    else
      @note = Note.find_by_id(params[:id])
      @note.content = params[:content]
      @note.save
      redirect to '/notes/#{notes.id}'
    end
  end

  delete '/notes/:id/delete' do
    @note = Note.find_by_id(params[:id])

    if logged_in?
      if @note.user_id == session[:user_id]
        @note.delete
        redirect to '/notes'
      else
        redirect to '/notes'
      end
    else
        redirect to '/login'
    end
  end




end
