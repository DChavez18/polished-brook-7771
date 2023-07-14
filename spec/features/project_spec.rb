require "rails_helper"

RSpec.describe "project show page" do

  # User Story 1 of 3
  # As a visitor,
  # When I visit a project's show page ("/projects/:id"),
  # I see that project's name and material
  # And I also see the theme of the challenge that this project belongs to.
  # (e.g.    Litfit
  #     Material: Lamp Shade
  #   Challenge Theme: Apartment Furnishings)

  describe "when I visit a project's show page" do
    it "displays that projects name and material" do
      recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
      news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    
      visit "/projects/#{news_chic.id}"

      expect(page).to have_content(news_chic.name)
      expect(page).to have_content(news_chic.material)
    end
  end
end