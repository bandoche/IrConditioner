class CommandsController < ApplicationController
	before_action :set_command, only: [:show, :edit, :update, :destroy]

def new
	@command = Command.new
	@buttons = Button.all
end

def create
	# render text: params[:command].inspect
	# @button_idx = params[:button]
	# @button = Button.find(Integer(params[:button]))
	@button = Button.find(params[:command][:button])
	@command = Command.new(params[:command].permit(:owner, :status, :img_path, :audio_path))
	@command.button = @button

	# @buttons = Button.all

	if @command.save
		redirect_to @command
	else
		render 'new'
	end
end

# def create
#   ref_models = params[:model].delete(:ref_models)
#   @model = Model.new(params[:model])
#   ref_models.each do |ref|
#     @ref = RefModel.where("ref_name = ?", ref)
#     @model.ref_models << @ref
#   end
#   respond_to do |format|
#     ...
#   end
# end

def show
	# @command = Command.find(params[:id])
	# @command.button_obj = Button.find(Integer(@command.button))
end

def index
	@commands = Command.all
	@buttons = Button.all
end


# DELETE /commands/1
# DELETE /commands/1.json
def destroy
	@command.destroy
	respond_to do |format|
		format.html { redirect_to commands_url }
		format.json { head :no_content }
	end
end

private
    # Use callbacks to share common setup or constraints between actions.
	def set_command
		@command = Command.find(params[:id])
	end

	def command_params
		params.require(:command).permit(:owner, :status, :button, :img_path, :audio_path)
	end

end
