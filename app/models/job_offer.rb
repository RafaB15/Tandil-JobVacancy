class JobOffer
  include DataMapper::Resource

  # property <name>, <type>
  property :id, Serial
  property :title, String
  property :location, String
  property :description, String
  belongs_to :user

	validates_presence_of :title

	def owner
		user
	end

end
