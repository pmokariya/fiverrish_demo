class ServicesController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_service, only: [:show, :edit, :update]

  def index
    if params[:key] == "all"
      @services = Service.all
    elsif params[:key] == "my"
      @services = current_user.services if current_user.services.present?
    else
      @services = current_user.services if current_user.services.present?
    end
  end

  def show
  end

  def new
    @service = current_user.services.build
  end

  def create
    # TODO: Save the newly created service. Redirect to an appropriate page if save fails.
    @user = current_user
    @service = @user.services.new(service_params)
    respond_to do |format|
      if @service.save
        format.html { redirect_to @service, notice: 'Service was successfully created.' }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    # TODO: Save the updated service. Redirect to an appropriate page if save fails.
    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to services_path, notice: 'Service was successfully updated.' }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @service.destroy
    respond_to do |format|
      format.html { redirect_to services_path, notice: 'Service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_service
    @service = Service.find(params[:id])
  end
  def service_params
    params.require(:service).permit!
  end
end
