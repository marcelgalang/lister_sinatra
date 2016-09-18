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

  end


end
