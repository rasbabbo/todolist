class ListsController < ApplicationController
	before_action :set_list, only: [:show, :update, :destroy]

	before_action :render_main_layout_if_format_html

	respond_to :json, :html

	def index
		respond_with (@lists = List.all)
	end


  def create
  	respond_with List.create(list_params)
  end

  def show
  	respond_with @list
  end

  def update
  	respond_with @book.update(list_params)
  end

  def destroy
  	respond_with @book.destroy
  end

  private
  def set_list
  	@list = List.find(params[:id])
  end

  def book_params
  	params.require(:book).permit(:task, :description, :complete)
  end

  def render_main_layout_if_format_html
  	#check the request format
  	if request.format.symbol == :html
  		render "layouts/application"
  	end
  end
  
end
