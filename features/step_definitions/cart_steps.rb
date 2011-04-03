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

Given /^there is another wine$/ do
  @wine_2 = Factory.create(:wine)
  @wine_2.update_attribute(:title, "Wine 2")
end

When /^I select another wine to be bought$/ do
  visit wine_path(@wine_2)
  click_on "add to cart"
end

Then /^I should have both wines in the cart$/ do
  within "#cart" do
    page.should have_content(@wine.title)
    page.should have_content(@wine_2.title)
  end
end
