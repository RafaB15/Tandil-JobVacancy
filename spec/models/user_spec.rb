require 'spec_helper'

describe User do

	describe 'model' do

		subject { @user = User.new }

		it { should respond_to( :id) }
		it { should respond_to( :name ) }
		it { should respond_to( :crypted_password) }
		it { should respond_to( :email ) }
		it { should respond_to( :job_offers ) }

	end

	describe 'valid?' do

	  let(:user) { User.new }

	  it 'should be false when name is blank' do
	  	user.email = 'john.doe@someplace.com'
	  	user.password = 'a_secure_passWord!'
	  	expect(user.valid?).to eq false
	  end


	  it 'should be false when email is not valid' do
	  	user.name = 'John Doe'
	  	user.email = 'john'
	  	user.password = 'a_secure_passWord!'
	  	expect(user.valid?).to eq false
	  end

	  it 'should be false when password is blank' do
	  	user.name = 'John Doe'
	  	user.email = 'john.doe@someplace.com'
	  	expect(user.valid?).to eq false
	  end

	  it 'should be true when all field are valid' do
	  	user.name = 'John Doe'
	  	user.email = 'john.doe@someplace.com'
	  	user.password = 'a_secure_passWord!'
	  	expect(user.valid?).to eq true
	  end

	end

	describe 'authenticate' do

		before do
			@password = 'password'
		 	@user = User.new
		 	@user.email = 'john.doe@someplace.com'
		 	@user.password = @password
		end

		it 'should return nil when password do not match' do
			email = @user.email
			password = 'wrong_password'
			expect(User).to receive(:first).with(email: email).and_return(@user)

			authentication_result = User.authenticate(email, password)

      expect(authentication_result).to be_nil
		end

		it 'should return nil when email do not match' do
			email = 'wrong@email.com'
			expect(User).to receive(:first).with(email: email).and_return(nil)

			authentication_result = User.authenticate(email, @password)

      expect(authentication_result).to be_nil
		end

		it 'should return the user when email and password match' do
			email = @user.email
			expect(User).to receive(:first).with(email: email).and_return(@user)

			authentication_result = User.authenticate(email, @password)

      expect(authentication_result).to eq @user
		end

	end

end

