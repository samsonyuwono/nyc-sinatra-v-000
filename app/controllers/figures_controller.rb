require 'pry'
class FiguresController < ApplicationController

  get '/figures' do
    @figures= Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  get '/figures/:id' do
    @figure= Figure.find_by_id(params[:id])
    erb :'figures/show'
  end
  # binding.pry
  post '/figures' do
    @figure= Figure.create(params[:figure])
    if !params([:title][:name]).empty?
      @figure.title << Title.create(params[:title])
    end
    if !params([:landmark][:name]).empty?
      @figure.landmark << Landmark.create(params[:landmark])
    end
    @figure.save
    redirect to '/figures/#{figure.id}'
  end

end

# if !params([:figure][:title_id]).empty?
#   @figure.titles << Title.create(params[:figure][:title_ids])
# end
# if !params([:figure][:landmark_id]).empty?
#   @figure.landmarks << Landmark.create(params[:figure][:landmark_ids])
# end
