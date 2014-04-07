json.array!(@appointments) do |appointment|
  json.extract! appointment, :id, :user_id, :appointment_date
  json.url appointment_url(appointment, format: :json)
end
