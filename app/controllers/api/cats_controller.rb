class Api::CatsController < ApplicationController
  def index
    if current_user
      @cats = Cat.order(:id => :asc)
      render "index.json.jb"
    else
      render json: { error: "you must be logged in to perform this action" }
    end
  end

  def create
    @cat = Cat.new(
      name: params[:name],
      age: params[:age],
      size: params[:size],
      breed: params[:breed],
    )
    if current_user
      @cat.save
      render "show.json.jb"
    elsif render json: { error: "you must be logged in to perform this action" }
    end
  end

  def show
    if current_user
      @cat = Cat.find_by(id: params[:id])
      render "show.json.jb"
    else
      render json: { error: "you must be logged in to do this action" }
    end
  end

  def update
    @cat = Cat.find_by(id: params[:id])
    @cat.name = params[:name] || @cat.name
    @cat.age = params[:age] || @cat.age
    @cat.size = params[:size] || @cat.size
    @cat.breed = params[:breed] || @cat.breed
    if @cat.save
      render "show.json.jb"
    else
      render json: { errors: @cat.errors.full_messages }
    end
  end

  def destroy
    if current_user
      @cat = Cat.find_by(id: params[:id])
      @cat.destroy
      render "show.json.jb"
    else
      render json: { error: "you must be logged in to do this action" }
    end
  end
end
