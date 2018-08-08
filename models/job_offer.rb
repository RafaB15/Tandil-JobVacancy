class JobOffer < Sequel::Model
  many_to_one :user

  def validate
    super
    validates_presence :title
  end

	def owner
		user
	end

	def owner=(a_user)
		self.user = a_user
	end

	def self.all_active
		JobOffer.where(is_active: true)
	end

	def self.find_by_owner(user)
		JobOffer.where(user: user)
	end

	def self.deactivate_old_offers
		JobOffer.all_active.each do | offer |
			if (Date.today - offer.updated_on) >= 30
				offer.deactivate
				offer.save
			end
		end
	end

	def activate
		self.is_active = true
	end

	def deactivate
		self.is_active = false
	end

end
