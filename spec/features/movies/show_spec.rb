require 'rails_helper'

RSpec.describe 'movies index page' do
  before do
    @user = User.create!(name: "Haewon Jeon", email: "haewon201@gmail.com")

    visit user_discover_index_path(@user)
  end

  it 'displays top 40 movie titles and vote average' do
    VCR.use_cassette('popular_movies') do
      click_button "Find Top Rated Movies"
      within('#movie-0') do
        click_link
      end
    end
    VCR.use_cassette('find_movie') do
      expect(current_path).to eq(user_movie_path(@user))
    end
  end
end