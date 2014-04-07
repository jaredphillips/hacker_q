class RemoveAppointmentDateFromAppointments < ActiveRecord::Migration
  def change
  	remove_column :appointments, :appointment_date
  end
end
