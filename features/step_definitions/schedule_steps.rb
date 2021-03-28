Then('I should see all the courses for the next semester') do
    expect(page).to have_content('Computer Vision II: Learning')
end

Then('I should not see courses for other semesters') do
    expect(page).to_not have_content('Spring')
  end  

Then /I should see "Add"/ do
    expect(page).to have_link('Add', href: add_schedule_path)
end

Then /I should see "Remove"/ do
    expect(page).to have_link('Remove', href: delete_schedule_path)
end

Given /the following courses_offerings exist/ do |courses_offerings_table|
    courses_offerings_table.hashes.each do |course|
        CoursesOffering.create course
    end
end

# And /^(?:|I ) don't have "([^"]*)" on my schedule$/ do |text|
#     if page.respond_to? :should
#       expect(page).to have_content(text)
#     else
#       assert page.has_content?(text)
#     end
# end