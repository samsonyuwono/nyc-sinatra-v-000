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
    @figure= Figure.find(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure= Figure.find(params[:id])
    erb :'figures/edit'
  end

  post '/figures' do
    binding.pry
    @figure= Figure.create(params[:figure])
    if !params([:title][:name]).empty?
      @figure.title << Title.create(params[:title])
    end
    if !params([:landmark][:name]).empty?
      @figure.landmark << Landmark.create(params[:landmark])
    end
    @figure.save
    redirect "/figures/#{figure.id}"
  end


  patch '/figures/:id' do
    @figure= Figure_find_by_id(params[:id])
    @figure.update(params[:figure])
    @figure.save
  end

  # post '/figures/:id' do
  #   @figure= Figure.find(params[:id])
  #   if !params([:title][:name]).empty?
  #     @figure.titles << Title.create(params[:title])
  #   end
  #   if !params([:landmark][:name]).empty?
  #     @figure.landmarks << Landmark.create(params[:landmark])
  #   end
  #   @figure.save
  #   redirect "/figures/#{figure.id}"
  # end


end

# if !params([:figure][:title_id]).empty?
#   @figure.titles << Title.create(params[:figure][:title_ids])
# end
# if !params([:figure][:landmark_id]).empty?
#   @figure.landmarks << Landmark.create(params[:figure][:landmark_ids])
# end
