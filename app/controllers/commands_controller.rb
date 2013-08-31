class CommandsController < ApplicationController
	before_action :set_command, only: [:show, :edit, :update, :destroy, :do_job]
	protect_from_forgery :except => [:update]

def new
	@command = Command.new
	@buttons = Button.all
end

def create
	# render text: params[:command].inspect
	# @button_idx = params[:button]
	# @button = Button.find(Integer(params[:button]))
	# @button = Button.find(params[:command][:button])
	@command = Command.new(command_params)

	if @command.save
		redirect_to @command
	else
		render 'new'
	end
end

# GET /posts/1
# GET /posts/1.json
def show
end

# GET /posts/1/edit
def edit
	@buttons = Button.all
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

# PATCH/PUT /commands/1
# PATCH/PUT /commands/1.json
def update
	respond_to do |format|
		# if (params[:command][:button] != '')
		# 	params[:command][:button] = Button.find(params[:command][:button])
		# end
		if @command.update(command_params)
			format.html { redirect_to @command, notice: 'Command was successfully updated.' }
			format.json { head :no_content }
		else
			format.html { render action: 'edit' }
			format.json { render json: @post.errors, status: :unprocessable_entity }
		end
	end
end

def do_job
	# todo: 명령 실행하게. 결과 보여주게? 
	result = system("/usr/bin/python /Users/bandoche/XCode/Git/pyIrConditioner/update_rails.py %s &" % params[:id])
	respond_to do |format|
		format.html { redirect_to @command, notice: 'Job is processing.' }
		format.json { head :no_content } 
	end
end

private
    # Use callbacks to share common setup or constraints between actions.
	def set_command
		@command = Command.find(params[:id])
	end

	def command_params
		# params.require(:command).permit(:owner, :status, :img_path, :audio_path)
		logger.debug "Params.req: #{params}"
		params.require(:command).permit(:owner, :status, :button_id, :img_path, :audio_path)
	end

end
