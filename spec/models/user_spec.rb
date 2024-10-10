require 'rails_helper'
require 'cancan/matchers'
require 'sidekiq/testing'  # Add this line to include Sidekiq's testing module


RSpec.describe User, type: :model do

    describe "A guest user" do
        let(:user) { nil } 
        subject { Ability.new(user) } 
        it "can read all" do
            expect(subject).to be_able_to(:read, :all) 
        end
        it "can create User" do
            expect(subject).to be_able_to(:create, User)
        end
        it "can confirm User" do
            expect(subject).to be_able_to(:confirm, User)
        end
        it "cannot update Posts" do
            expect(subject).not_to be_able_to(:update, Post.new)
        end
        it "cannot destroy Posts" do
            expect(subject).not_to be_able_to(:destroy, Post.new)
        end
    end

    describe "A regular user" do
        let(:user) { create(:user) }  # Assuming you have a factory for User
        let(:post) { Post.new(user_id: user.id) }
        subject { Ability.new(user) }

        it "can read post" do
            expect(subject).to be_able_to(:read, Post) 
        end
        it "can create Post" do
            expect(subject).to be_able_to(:create, post)
        end
        it "can update Posts" do
            expect(subject).to be_able_to(:update, post)
        end
        it "can destroy Posts" do
            expect(subject).to be_able_to(:destroy, post)
        end
        it "can confirm User" do
            expect(subject).to be_able_to(:confirm, user)
        end
    end
    
    describe "An admin" do
        let(:admin) { create(:user, role: "admin") } 
        let(:post) { Post.new(user_id: admin.id) } 
        subject { Ability.new(admin) } 
        it "can manage Posts" do
            expect(subject).to be_able_to(:manage, post) 
        end
    end
end
