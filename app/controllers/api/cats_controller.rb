class Api::CatsController < ApplicationController
  before_action :authenticate_user

  def index
    @cats = Cat.order(:id => :asc)
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

  def update
    @cat = Cat.find_by(id: params[:id])
    @cat.name = params[:name] || @cat.name
    @cat.age = params[:age] || @cat.age
    @cat.size = params[:size] || @cat.size
    @cat.breed = params[:breed] || @cat.breed
    @cat.save
    render "show.json.jb"
  end

  def destroy
    @cat = Cat.find_by(id: params[:id])
    @cat.destroy
    render json: { message: "successfully deleted" }
  end
end
