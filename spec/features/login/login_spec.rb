require 'rails_helper'

RSpec.describe User, type: :feature do
  describe 'Log in session' do

    before :each do
      visit new_user_session_path
      @user = User.create(name: "Polina", email: 'user@example.com', password: 'password')
    end

    it "should display username and password inputs and submit button" do
      @input_type = ["email", "password", "submit"]
      @input_type.each do |type|
        expect(page).to have_selector("input[type=#{type}]")
      end
      # expect(page).to have_selector("input[type=password]")

      # SAME AS:
      # expect(page.has_field?('user[email]')).to be_truthy
      # expect(page.has_field?('user[password]')).to be_truthy
      # expect(page).to have_content("Log in")

    end

    describe 'After submit ' do
      context 'with variations of data' do
        it 'should get detailed error' do
          click_button 'Log in'
          expect(page).to have_content("Invalid Email or password")
        end

        it 'should get detailed error' do
          fill_in 'user_email', with: "example@mail.com"
          fill_in 'user_password', with: 'password'
          click_button 'Log in'
          expect(page).to have_content("Invalid Email or password")
        end

        it 'should get detailed error' do
          fill_in 'user_email', with: @user.email # I use 'user_email instead Email, because i do NOT have id = 'Email, after installing device. Because my devise Model is User  => 'user_email' Same for password!
          fill_in 'user_password', with: @user.password
          click_button 'Log in'
          expect(page).to have_content("Signed in successfully")
        end
      end
    end
  end
end
