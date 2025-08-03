class ResourcesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_resource, only: %i[show edit update destroy]
  include Pundit

  # GET /resources
  def index
    @resources = policy_scope(Resource)
  end

  # GET /resources/1
  def show
    authorize @resource
    @statuses = Resource::STATUSES
  end

  # GET /resources/new
  def new
    @resource = Resource.new
    authorize @resource
    @statuses = Resource::STATUSES
  end

  # GET /resources/1/edit
  def edit
    authorize @resource
    @statuses = Resource::STATUSES
  end

  # POST /resources
  def create
    @resource = Resource.new(resource_params)
    authorize @resource
    @statuses = Resource::STATUSES

    respond_to do |format|
      if @resource.save
        format.html { redirect_to @resource, notice: "Tài nguyên đã được tạo thành công." }
        format.json { render :show, status: :created, location: @resource }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resources/1
  def update
    authorize @resource
    @statuses = Resource::STATUSES
    respond_to do |format|
      if @resource.update(resource_params)
        format.html { redirect_to @resource, notice: "Tài nguyên đã được cập nhật." }
        format.json { render :show, status: :ok, location: @resource }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resources/1
  def destroy
    authorize @resource
    @resource.destroy!

    respond_to do |format|
      format.html { redirect_to resources_path, status: :see_other, notice: "Tài nguyên đã bị xóa." }
      format.json { head :no_content }
    end
  end

  private

    def set_resource
      @resource = Resource.find(params[:id])
    end

    def resource_params
      params.require(:resource).permit(:title, :author, :category, :status, :image) 
    end
end
