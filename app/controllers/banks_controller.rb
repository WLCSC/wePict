class BanksController < ApplicationController
  # GET /banks
  # GET /banks.json
  def index
		@room = Room.find(params[:room_id])
    @banks = current_user.banks
		authorize! :manage, @room

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @banks }
    end
  end

  # GET /banks/1
  # GET /banks/1.json
  def show
		@room = Room.find(params[:room_id])
    @bank = current_user.banks.find(params[:id])
		authorize! :read, @bank
		
		redirect_to user_bank_questions_path(@room, @bank, :room_id => @room.id)
  end

  # GET /banks/new
  # GET /banks/new.json
  def new
		@room = Room.find(params[:room_id])
    @bank = current_user.banks.build
		authorize! :create, @bank

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /banks/1/edit
  def edit
		@room = Room.find(params[:room_id])
    @bank = current_user.banks.find(params[:id])
		authorize! :update, @bank
  end

  # POST /banks
  # POST /banks.json
  def create
		#@room = Room.find(params[:room_id])
    @bank = current_user.banks.build(params[:bank])
		authorize! :create, @bank

    respond_to do |format|
      if @bank.save
        format.html { redirect_to [current_user, @bank], notice: 'Bank was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /banks/1
  # PUT /banks/1.json
  def update
		@room = Room.find(params[:room_id])
    @bank = current_user.banks.find(params[:id])
		authorize! :update, @bank

    respond_to do |format|
      if @bank.update_attributes(params[:bank])
        format.html { redirect_to [current_user, @bank], notice: 'Bank was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /banks/1
  # DELETE /banks/1.json
  def destroy
		@room = Room.find(params[:room_id])
    @bank = current_user.banks.find(params[:id])
		authorize! :destroy, @bank
    @bank.destroy

    respond_to do |format|
      format.html { redirect_to user_banks_url(@room), :notice => 'Removed question bank.' }
    end
  end

	def copy
        @room = Room.find(params[:room_id])
		@u1 = current_user
        @bank = @room.banks.find(params[:id])
		@target = User.where(:name => params[:user_name])
		authorize! :update, @bank

		@bank.copy(@target)
		redirect_to user_banks_path(@target, :room_id => @room.id), :notice => "Successfully copied question bank."
	end
end
