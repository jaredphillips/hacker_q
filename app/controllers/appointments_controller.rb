class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  def index
    @appointments = Appointment.all
  end

  def show
  end

  def new
    @appointment = Appointment.new
  end

  def edit
  end

  def create
    @appointment = Appointment.new(user_id: current_user.id)
    if @appointment.save
      redirect_to appointments_path, notice: 'Appointment was successfully created.' 
    else
      render action: 'new'
    end
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to @appointment, notice: 'Appointment was successfully updated.' 
    else
      render action: 'edit' 
    end
  end

  def destroy
    Appointment.find(params[:id]).destroy
    redirect_to appointments_url 
  end

  private
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    def appointment_params
      params.require(:appointment).permit(:user_id)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

end
