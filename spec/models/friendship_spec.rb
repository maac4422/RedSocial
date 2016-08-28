# == Schema Information
#
# Table name: friendships
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  friend_id  :integer
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Friendship, type: :model do
  it {should belong_to :user}
  it {should belong_to :friend}

  it "should validate uniqueness of user with friend" do
  	user = User.create(email: "miguel@hotmail.com",password:"1234",username:"1miguel")
  	friend = User.create(email: "nico@hotmail.com",password:"1234",username:"1nico")

  	Friendship.create(user: user, friend: friend)


  	amistad_duplicada = Friendship.create(user: user, friend: friend)


  	expect(amistad_duplicada.valid?).to be_falsy
  end
end
