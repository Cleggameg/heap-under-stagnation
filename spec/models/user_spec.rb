require 'rails_helper'
require 'database_cleaner'

describe User do
  let(:user1) {User.new(username: "paul", email: "paul@paul.com", password: "12345")}
  let(:user2) {User.new}

  it "should have a username" do
    expect(user1.username).to eq("paul")
  end

  it "should have a email" do
    expect(user1.email).to eq("paul@paul.com")
  end

  describe "#validations" do
    it "should not validate without a username" do
      user2.email = "sara@sara.com"
      user2.password = "12345"
      user2.save
      expect(user2.id).to eq(nil)
    end

    it "should not validate without an email" do
      user2.username = "sara"
      user2.password = "12345"
      user2.save
      expect(user2.id).to eq(nil)
    end

    it "should only except unique username" do
      user1.save
      user3 = User.new(username: "paul", email: "me@me.com", password: "12345")
      user3.save
      expect(user3.id).to be(nil)
    end

    it "should only except unique email" do
      user1.save
      user3 = User.new(username: "me", email: "paul@paul.com", password: "12345")
      user3.save
      expect(user3.id).to be(nil)
    end

    it "should only except valid emails" do
      user3 = User.new(username: "me", email: "mememe", password: "12345")
      user3.save
      expect(user3.id).to be(nil)
    end



  end
end
