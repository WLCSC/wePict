class QuestionsController < ApplicationController
	# GET /questions
	# GET /questions.json
	def index
		@room = Room.find(params[:room_id])
		@bank = @room.banks.find(params[:bank_id])
		@questions = @bank.questions

		respond_to do |format|
			format.html # index.html.erb
			format.json { render json: @questions }
		end
	end

	# GET /questions/1
	# GET /questions/1.json
	def show
		@room = Room.find(params[:room_id])
		@bank = @room.banks.find(params[:bank_id])
		@question = @bank.questions.find(params[:id])

		respond_to do |format|
			format.html # show.html.erb
			format.json { render json: @question }
		end
	end

	# GET /questions/new
	# GET /questions/new.json
	def new
		@room = Room.find(params[:room_id])
		@bank = @room.banks.find(params[:bank_id])
		@question = @bank.questions.build 
		@question.sequence = (@bank.questions.maximum(:sequence) || 0) + 1

		respond_to do |format|
			format.html # new.html.erb
			format.json { render json: @question }
		end
	end

	# GET /questions/1/edit
	def edit
		@room = Room.find(params[:room_id])
		@bank = @room.banks.find(params[:bank_id])
		@question = @bank.questions.find(params[:id])
	end

	# POST /questions
	# POST /questions.json
	def create
		@room = Room.find(params[:room_id])
		@bank = @room.banks.find(params[:bank_id])
		@question = @bank.questions.build(params[:question])
		
		if params[:remote]
			@success = @question.save	
		else
				if @question.save
					redirect_to room_bank_questions_path(@room, @bank), notice: 'Question was successfully created.' 
				else
					render action: "new"
			end
		end
	end

	# PUT /questions/1
	# PUT /questions/1.json
	def update
		@question = Question.find(params[:id])

		respond_to do |format|
			if @question.update_attributes(params[:question])
				format.html { redirect_to @question, notice: 'Question was successfully updated.' }
				format.json { head :no_content }
			else
				format.html { render action: "edit" }
				format.json { render json: @question.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /questions/1
	# DELETE /questions/1.json
	def destroy
		@question = Question.find(params[:id])
		@question.destroy

		respond_to do |format|
			format.html { redirect_to questions_url }
			format.json { head :no_content }
		end
	end

	def post
		@room = Room.find(params[:room_id])
		@bank = @room.banks.find(params[:bank_id])
		@question = @bank.questions.find(params[:id])
		@room.prompt = @question.content
		@room.save
	end
end
