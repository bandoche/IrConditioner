class ButtonsController < ApplicationController
def new
	@button = Button.new
end

def create
	# render text: params[:button].inspect
	@button = Button.new(params[:button].permit(:title, :cmd))

	if @button.save
		redirect_to @button
	else
		render 'new'
	end
end

def show
	@button = Button.find(params[:id])
end

def index
	@buttons = Button.all
end
private
	def button_params
		params.require(:button).permit(:title, :cmd)
	end
end
