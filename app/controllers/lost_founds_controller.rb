class LostFoundsController < ApplicationController
  before_filter :signed_in_user, only: [:new, :edit, :update]
  before_filter :correct_user, only: [:edit, :update, :destroy], notice: "You can't do that!!"
  
  
  # GET /lost_founds
  # GET /lost_founds.json
  def index
    @lost_founds = LostFound.find(:all, order: "created_at DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lost_founds }
    end
  end

  # GET /lost_founds/1
  # GET /lost_founds/1.json
  def show
    @lost_found = LostFound.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lost_found }
    end
  end

  # GET /lost_founds/new
  # GET /lost_founds/new.json
  def new
    @lost_found = LostFound.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lost_found }
    end
  end

  # GET /lost_founds/1/edit
  def edit
    @lost_found = LostFound.find(params[:id])
  end

  # POST /lost_founds
  # POST /lost_founds.json
  def create
    @lost_found = LostFound.new(params[:lost_found])

    respond_to do |format|
      if @lost_found.save
        format.html { redirect_to @lost_found, notice: 'Lost found was successfully created.' }
        format.json { render json: @lost_found, status: :created, location: @lost_found }
      else
        format.html { render action: "new" }
        format.json { render json: @lost_found.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /lost_founds/1
  # PUT /lost_founds/1.json
  def update
    @lost_found = LostFound.find(params[:id])

    respond_to do |format|
      if @lost_found.update_attributes(params[:lost_found])
        format.html { redirect_to @lost_found, notice: 'Lost found was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lost_found.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lost_founds/1
  # DELETE /lost_founds/1.json
  def destroy
    @lost_found = LostFound.find(params[:id])
    @lost_found.destroy

    respond_to do |format|
      format.html { redirect_to lost_founds_url }
      format.json { head :no_content }
    end
  end
  
  
private
  
  def signed_in_user
    redirect_to signin_path, notice: "Please sign in." unless signed_in?
  end
  
  def correct_user
      @lostfound = LostFound.find(params[:id])
      redirect_to(root_path) unless current_user?(@lostfound.user)
  end
  
end
