# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  password_digest :string
#  session_token   :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do

  describe :User do
    subject(:user) do
      FactoryGirl.build(:user,
        email: "james@gmail.com",
        password: "password")
      end

    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_presence_of(:session_token) }
    # it { should have_many(:comments) }
    # it { should have_many(:goals) }
    it { should validate_length_of(:password).is_at_least(6) }

    describe ".find_by_credentials" do
      before { user.save! }
      it "returns user given good credentials" do
        expect(User.find_by_credentials("james@gmail.com","password")).to eq(user)
      end

      it "returns nil given bad credentials" do
        expect(User.find_by_credentials("james@gmail.com","wrong_password")).to eq(nil)
      end
    end


  end
end
