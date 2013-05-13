class RoomsController < ApplicationController
  # GET /rooms
  # GET /rooms.json
  def index
    @rooms = Room.accessible_by(current_ability)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rooms }
    end
  end

  # GET /rooms/1
  # GET /rooms/1.json
  def show
    @room = Room.find(params[:id])
		authorize! :show, @room
		if can?(:write, @room) 
			@all_users = User.all.map{|g| g.name}
			@all_groups = Group.all.map{|g| g.name}
		end
		@post = @room.posts.where(:user_id => current_user.id).first

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @room }
    end
  end

  # GET /rooms/new
  # GET /rooms/new.json
  def new
    @room = Room.new
		authorize! :create, @room

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @room }
    end
  end

  # GET /rooms/1/edit
  def edit
    @room = Room.find(params[:id])
		authorize! :edit, @room
  end

  # POST /rooms
  # POST /rooms.json
  def create
    @room = Room.new(params[:room])
		authorize! :create, @room
    respond_to do |format|
      if @room.save
        format.html { redirect_to @room, notice: 'Room was successfully created.' }
        format.json { render json: @room, status: :created, location: @room }
      else
        format.html { render action: "new" }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rooms/1
  # PUT /rooms/1.json
  def update
    @room = Room.find(params[:id])
		authorize! :edit, @room
    respond_to do |format|
      if @room.update_attributes(params[:room])
        format.html { redirect_to @room, notice: 'Room was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    @room = Room.find(params[:id])
		authorize! :destroy, @room
    @room.destroy

    respond_to do |format|
      format.html { redirect_to rooms_url }
      format.json { head :no_content }
    end
  end

	def post
		@room = Room.find(params[:id])
		authorize! :show, @room
		@post = @room.posts.where(:user_id => current_user.id).first
		@post.data = params[:data]
		@post.save
		render 'post'
	end

	def rebuild

	end

	def clear
		@room = Room.find(params[:id])
		authorize! :update, @room
		@room.posts.each do |p|
			p.data = ""
			p.save
		end
	end

	def display
		@room = Room.find(params[:id])
		authorize! :update, @room
		list = @room.posts
		@rows = params[:r].to_i || 5
		@cols = params[:c].to_i || 6
		@scaleTo = params[:s].to_i || 100
		@posts = Array.new(@rows) {Array.new(@cols) {list.length > 0 ? list.delete_at(0) : nil} }
		render 'display', :layout => 'grid-display'
	end

	def assign
		@room = Room.find(params[:id])
		authorize! :update, @room
		@a = Assignment.new(params[:assignment])
		@a.room = @room
		if @a.save
			if @a.assignable.is_a? User
				Post.create(:user_id => @a.assignable.id, :room_id => @room.id, :data => '') unless Post.where(:user_id => @a.assignable.id, :room_id => @room.id).count > 0
			elsif @a.assignable
				@a.assignable.users.each do |u|
					Post.create(:user_id => u.id, :room_id => @room.id, :data => '') unless Post.where(:user_id => u.id, :room_id => @room.id).count > 0
				end
			else
# Should something go here?
			end
			flash[:notice] = "Assigned #{@a.assignable.display} to room."
			redirect_to @room
		else
			flash[:error] = "Failed to assign #{@a.assignable.display} to room."
			redirect_to @room
		end
	end

	def unassign
		@room = Room.find(params[:id])
		authorize! :update, @room
		@a = @room.assignments.find(params[:assignment_id])
		posts = []
		if @a.assignable.is_a? User
				posts << @room.posts.where(:user_id => @a.assignable.id).first
		else
			@a.assignable.users.each do |u|
				posts << @room.posts.where(:user_id => u.id).first
			end
		end
		flash[:notice] = "Unassigned #{@a.assignable.display}."
		@a.delete
		posts.each do |p|
			p.delete unless @room.users.include?(p.user) 
		end
		redirect_to @room
	end

	def modal
		@room = Room.find(params[:id])
		@post = @room.posts.find(params[:post]);
		@user = @post.user
	end

	def prompt
		@room = Room.find(params[:id])
		authorize! :update, @room
		@room.prompt = params[:content]
		@room.save
	end

	def lock
		@room = Room.find(params[:id])
		authorize! :update, @room
		@room.open = false
		@room.save
		redirect_to @room, :notice => 'Locked room.'
	end

	def unlock
		@room = Room.find(params[:id])
		authorize! :update, @room
		@room.open = true
		@room.save
		redirect_to @room, :notice => 'Unlocked room'
	end

	def rebuild
		@room = Room.find(params[:id])
		authorize! :update, @room
		@room.posts.all.each{ |p| p.delete}

		@room.users.each{|u| Post.create(:user_id => u.id, :room_id => @room.id, :data => '') }
		redirect_to @room, :notice => "Rebuilt membership for #{@room.users.count} users."
	end
end
