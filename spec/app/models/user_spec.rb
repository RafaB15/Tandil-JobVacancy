require 'spec_helper'

describe User do

	describe 'model' do

		subject { @user = User.new }

		it { should respond_to( :name ) }
		it { should respond_to( :email ) }
		it { should respond_to( :id) }

	end

end

