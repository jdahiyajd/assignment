class UserFilesController < ApplicationController
  before_action :authenticate_user!, except: %i[shared_link]
  before_action :set_user_file, only: %i[ show edit update destroy ]

  # GET /user_files or /user_files.json
  def index
    if params[:user_file_tag]
      @user_files = UserFile.tagged_with(params[:user_file_tag]).where(user_id: current_user.id)
    else
      @user_files = UserFile.where(user_id: current_user.id)
    end
  end

  # GET /user_files/1 or /user_files/1.json
  def show
  end

  # GET /user_files/new
  def new
    @user_file = UserFile.new
  end

  # GET /user_files/1/edit
  def edit
  end

  # POST /user_files or /user_files.json
  def create
    @user_file = UserFile.new(user_file_params)
    @user_file.user = current_user
    respond_to do |format|
      if @user_file.save
        format.html { redirect_to @user_file, notice: "User file was successfully created." }
        format.json { render :show, status: :created, location: @user_file }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_files/1 or /user_files/1.json
  def update
    respond_to do |format|
      if @user_file.update(user_file_params)
        format.html { redirect_to @user_file, notice: "User file was successfully updated." }
        format.json { render :show, status: :ok, location: @user_file }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_files/1 or /user_files/1.json
  def destroy
    @user_file.destroy
    respond_to do |format|
      format.html { redirect_to user_files_url, notice: "User file was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def shared_link
    @user_file = UserFile.where(slug: params[:slug]).first
    respond_to do |format|
      if @user_file.present?
        format.html { render :template => "user_files/shared_file"}
      else
        render :plain => 'Not Found', :status => '404'
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_file
      @user_file = UserFile.where(user_id: current_user.id).find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_file_params
      params.require(:user_file).permit(:title, :desc, :file, :user_file_tag_list, :user_file_tag, { user_file_tag_ids: [] }, :user_file_tag_ids)
    end
end
