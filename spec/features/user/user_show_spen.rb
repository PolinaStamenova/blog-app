require "rails_helper"

RSpec.describe "User view", type: :feature do
  include Devise::Test::IntegrationHelpers
  describe "User show page" do
    let(:user) { User.create(name: "Polina", email: 'polina@example.com', password: 'password') }

    before do
      @user_one =  User.create(name: "Jordy", email: 'jordy@example.com', password: 'password', posts_counter: 3, bio: "This is my bio.")
      @user_two =  User.create(name: "Marina", email: 'marina@example.com', password: 'password')

      sign_in user
      visit user_path(@user_one)
    end

    # it "should be able see profile picture for each user" do
    #   # expect(page).to have_selector("img[src=testimonial-avatar-150x150]")
    #   # expect(find('img').each { |img| img[:src] == 'https://avatarfiles.alphacoders.com/892/89214.gif' }).to be_truthy
    # end

    it "should be able see user's username" do
      expect(page).to have_content("Jordy")
    end

    it "should be able see the number of posts the user has written." do
      expect(page).to have_content("Number of posts:3")
    end

    it "should be able see the user's bio." do
      expect(page).to have_content("This is my bio.")
    end

    it "should see a button that lets me view all of a user's posts." do
      expect(page).to have_content("See all posts")
    end

    # it "should redirects me to that post's show page, when click on a user`s" do
    #   find_link("user_#{@user_one.id}").click
    #   expect(current_path).to eq(user_path(@user_one.id))
    # end

    it "should redirects me to the user's post's index page, when click on a see all posts button" do
      find_link("see_all_#{@user_one.id}").click
      expect(current_path).to eq(user_posts_path(@user_one.id))
    end
  end
end