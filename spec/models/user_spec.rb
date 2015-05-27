require "rails_helper"

RSpec.describe User, :type => :model do
	before :each do
		@email = 'test@tester.com'
	end

	it "counts number of users" do
		User.create!(email: 'jojo@test.com', password: 'password', password_confirmation: 'password')
		expect(User.count).to eq 1
	end

	it "should fail with no password confirmation" do
		user = User.create(email: @email, password: 'password', password_confirmation: '')
		expect(user.errors[:password_confirmation]).to include("doesn't match Password")
	end

	it "should fail if password is too short" do
		user = User.create(email: @email, password: 'pass', password_confirmation: 'pass')
		expect(user.errors[:password]).to include("is too short (minimum is 8 characters)") 
	end
end