require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it 'should make sure both password fields are filled in' do
      @user = User.new(name: 'Kenz B', email: 'test@test.ca')
      expect(@user.valid?).to be false
    end

    it 'should successfully create user' do
      @user = User.create!(name: 'Kenz B', email: 'test@test.ca', password: 'something')
      expect(@user.save).to be true
    end

    it 'should not validate a user with different password fields' do
      @user = User.new(name: 'Kenz B', email: 'test@test.ca', password: 'something', password_confirmation: 'somethingelse')
      expect(@user.save).to be false
    end

    it 'should not validate a user with existing email' do
      @user1 = User.create!(name: 'Some Guy', email: 'yo@yo.yo', password: 'heyooo')
      @user2 = User.new(name: 'Some Guy', email: 'yo@yo.yo', password: 'heyooo')
      expect(@user2.save).to be false
    end

    it 'should not validate a user with existing email case insensitive' do
      @user1 = User.create!(name: 'Some Guy', email: 'yo@yo.yo', password: 'heyooo')
      @user2 = User.new(name: 'Some Guy', email: 'YO@yo.yo', password: 'heyooo')
      expect(@user2.save).to be false
    end

    it 'should not validate user with password under 6 chars' do
      @user = User.new(name: 'Some Guy', email: 'yo@yo.yo', password: 'hey')
      expect(@user.valid?).to be false
    end

  end

  describe '.authenticate_with_credentials' do
    it 'should successfully authenticate with correct credentials' do
      user1 = User.create!(name: 'test test', email: 'thing@thing.thing', password: 'something')
      user = User.authenticate_with_credentials('thing@thing.thing', 'something')
      expect(user).to be_truthy
    end

    it 'should not login if password is incorrect' do
      user1 = User.create!(name: 'test test', email: 'thing@thing.thing', password: 'something')
      user = User.authenticate_with_credentials('thing@thing.thing', 'somethingelse')
      expect(user).to be nil
    end
    
    it 'should not authenticate if fields are blank' do
      user = User.authenticate_with_credentials('', '')
      expect(user).to be nil
    end

    it 'should allow spaces before/after email address and still authenticate' do
      user1 = User.create!(name: 'test test', email: 'thing@thing.thing', password: 'something')
      user = User.authenticate_with_credentials('  thing@thing.thing  ', 'something')
      expect(user).to be_truthy
    end

  end
end
