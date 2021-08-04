json.extract! business, :id, :customer_id, :address, :latitude, :longitude, :status, :created_at, :updated_at
json.url business_url(business, format: :json)
