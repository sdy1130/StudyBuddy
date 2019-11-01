require 'test_helper'

class UserTest < ActiveSupport::TestCase
    test 'valid user' do
        user = User.new(name: 'Admin',age: 40, email: 'admin@example.com',password:"123456",password_confirmation:"123456")
        assert user.valid?
    end

    test 'invalid user' do
        user = User.new(name: 'fail1',age: 500, email: 'failexample.com',password:"123456",password_confirmation:"1234564")
        assert user.valid?
    end
end
