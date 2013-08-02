require File.expand_path('../../config/boot',        __FILE__)
#PADRINO_ROOT = File.expand_path('../..', __FILE__) unless defined?(PADRINO_ROOT)
#require File.expand_path('../../../config/environment', __FILE__)

include Clockwork

every(1.minute, 'Deactivate old offers') { JobOffer.deactivate_old_offers }