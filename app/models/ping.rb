class Ping
  include DataMapper::Resource

  property :id, Serial
  property :description, String
  property :created_at, DateTime
  
end
