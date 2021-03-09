class Api::CatsController < ApplicationController
  def index
    if current_user
      @cats = Cat.all
    else
      @cats = []
    end
    render "index.json.jb"
  end

  def create
    @cat = Cat.new(
      name: params[:name],
      age: params[:age],
      size: params[:size],
      breed: params[:breed],
    )
    @cat.save
    render "show.json.jb"
  end

  def show
    @cat = Cat.find_by(id: params[:id])
    render "show.json.jb"
  end
end
