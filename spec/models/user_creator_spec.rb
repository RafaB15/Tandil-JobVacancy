require 'rspec'

describe UserCreator do
  describe 'create' do
    it 'should raise error when age is invalid' do
      creator = described_class.new('john', 'john.doe@someplace.com', 'on_demand', 'P4$$word', '15')
      creator.validate_and_save_user
    rescue InvalidAgeError => e
      expect(e.message).to eq InvalidAgeError::INVALID_AGE_ERROR_MSG
    end
  end
end
