class JobApplication
  include ActiveModel::Validations

  attr_accessor :applicant_email, :job_offer, :cv_link

  validates :applicant_email, :job_offer, presence: true
  validates_format_of :cv_link, with: /www./, message: 'must contain "www."', allow_nil: true
  validates_format_of :cv_link, with: /.com/, message: 'must contain ".com"', allow_nil: true

  def initialize(email, offer, cv_link = nil)
    @applicant_email = email
    @job_offer = offer
    @cv_link = cv_link
    validate!
  end

  def self.create_for(email, offer, cv_link = nil)
    cv_link = nil if cv_link == ''
    JobApplication.new(email, offer, cv_link)
  end

  def process
    JobVacancy::App.deliver(:notification, :contact_info_email_to_applicant, self)
    JobVacancy::App.deliver(:notification, :contact_info_email_to_employer, self)
  end
end
