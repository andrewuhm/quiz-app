require 'spec_helper'

describe "StaticPages" do

	describe "Home page" do
		it "should have the content Study Guide Quizzes" do
			visit '/static_pages/home'
			expect(page).to have_content('Study Guide Quizzes')
		end

		it "should have the base title" do
			visit '/static_pages/home'
			expect(page).to have_title("Study Guide Quizzes")
		end

		it "should not have a custom page title" do
			visit '/static_pages/home'
			expect(page).not_to have_title('| Home')
		end
	end

	describe "Help page" do
		it "should have the content 'Help'" do
			visit '/static_pages/help'
			expect(page).to have_content('Help')
		end

		it "should have the title 'Help'" do
			visit '/static_pages/help' 
			expect(page).to have_title("Study Guide Quizzes | Help")
		end
	end
end
