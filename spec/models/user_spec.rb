require 'rails_helper'

RSpec.describe User, type: :model do

  it "is valid with valid information" do
    user = User.new(name: "newUser", email: "test@test.com", password: "password", password_confirmation: "password")
    expect(user).to be_valid
    end

  it "is not valid without a password confirmation field" do
    user = User.new(name: "newUser", email: "test@test.com", password: "password", password_confirmation: "")
    expect(user).to_not be_valid
    end

  it "is not valid without a password" do
    user = User.new(name: "newUser", email: "test@test.com", password: "", password_confirmation: "password")
    expect(user).to_not be_valid
    end

  it "is not valid without a matching password and password confirmation" do
    user = User.new(name: "newUser", email: "test@test.com", password: "word", password_confirmation: "pass")
    expect(user).to_not be_valid
  end

  it "is not valid if the email already exists in the database" do
      user1 = User.new(name: "newUser1", email: "TEST@TEST.COM", password: "password", password_confirmation: "password")
      user2 = User.new(name: "newUser2", email: "test@test.com", password: "password", password_confirmation: "password")
      expect(user2).to_not be_valid
  end




end
