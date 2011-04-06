When /^I checkout my cart$/ do
  click_link 'checkout'
end

When /^I accept$/ do
  click_on "continue"
end

Then /^I should see Checkout$/ do 
  page.should have_content("Checkout")
end

When /^I fill in the following:$/ do |fields|
  @fields = fields
  fields.rows_hash.each do |name, value|
    fill_in(name, :with => value)
  end
end

When /^I submit the checkout$/ do
  click_button "Submit"
end

