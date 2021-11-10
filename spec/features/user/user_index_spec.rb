require "rails_helper"

RSpec.describe "User view", type: :feature do
  include Devise::Test::IntegrationHelpers
  describe "User" do
    let(:user) { User.create(name: "Polina", email: 'polina@example.com', password: 'password') }

    before do
      @user_one =  User.create(name: "Jordy", email: 'jordy@example.com', password: 'password', posts_counter: 3)
      @user_two =  User.create(name: "Marina", email: 'marina@example.com', password: 'password')

      sign_in user
      visit users_path
    end

    it "should be able see the username of all other users." do
      expect(page).to have_content("Marina")
      expect(page).to have_content("Jordy")
    end

    # it "should be able see profile picture for each user" do
    #   # expect(page).to have_selector("img[src=testimonial-avatar-150x150]")
    #   # expect(find('img').each { |img| img[:src] == 'https://avatarfiles.alphacoders.com/892/89214.gif' }).to be_truthy
    # end

    it "should be able see the number of posts each user has written." do
      expect(page).to have_content("Number of posts:3")
    end

    it "should redirected to that user's show page, when click on a user" do
      find_link("user_#{@user_one.id}").click
      expect(current_path).to eq(user_path(@user_one.id))
    end
  end
end