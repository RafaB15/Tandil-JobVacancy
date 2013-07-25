class JobOffer
	include DataMapper::Resource

	# property <name>, <type>
	property :id, Serial
	property :title, String
	property :location, String
	property :description, String
	belongs_to :owner, :model => 'User'

	validates_presence_of :title
end
