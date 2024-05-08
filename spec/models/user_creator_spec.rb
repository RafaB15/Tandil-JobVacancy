require 'rspec'

describe UserCreator do
  describe 'create' do
    it 'should raise error when age is invalid' do
      invalid_age = '15'
      creator = described_class.new('john', 'john.doe@someplace.com', 'on_demand', 'P4$$word', invalid_age)
      expect { creator.create_user }.to raise_error(InvalidAgeError)
    end

    it 'should raise error when email is invalid' do
      invalid_email = 'www.john-doe.com'
      creator = described_class.new('john', invalid_email, 'on_demand', 'P4$$word', '18')
      expect do
        creator.create_user
      end.to raise_error(ActiveModel::ValidationError, 'Validation failed: Email invalid email')
    end
  end
end
