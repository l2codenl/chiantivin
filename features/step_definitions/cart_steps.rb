Given /^there is a wine$/ do
  @wine = Factory.create(:wine)
end

When /^I select a wine to be bought$/ do
  visit wine_path(@wine)
  #save_and_open_page
  click_on "add to cart"
end

Then /^I should have the wine in my cart$/ do
  page.should have_content("#{@wine.title} has been added to your cart")
  within "#cart" do
    page.should have_content(@wine.title)
  end
end
