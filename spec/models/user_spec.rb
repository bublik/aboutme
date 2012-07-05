require 'spec_helper'

describe User do
  it 'should created user with out full_name' do
    user = User.create(
      # :full_name => Faker::Name.name + "#{num}",
      :email => Faker::Internet.email,
      :password => 'please',
      :password_confirmation => 'please'
    )
    user.valid?.should be_true
    user.errors[:full_name].should be_blank
  end
end
