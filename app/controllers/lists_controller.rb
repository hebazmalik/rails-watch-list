class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(strong_params)
    if @list.save
      redirect_to list_path(@list), notice: 'List was successfully created.'
    else
      render :new
    end
  end

  def show
    @list = List.find(params[:id])
  end

  private

  def strong_params
    params.require(:list).permit(:name)
  end
end
