Then('I should see all the courses for the next semester') do
    expect(page).to have_content('Computer Vision II: Learning')
end

Then('I should not see courses for other semesters') do
    expect(page).to_not have_content('Spring')
  end  

# Then /I should see "Add"/ do
#     expect(page).to have_link('Add', href: add_schedule_path)
# end

# Then /I should see "Remove"/ do
#     expect(page).to have_link('Remove', href: delete_schedule_path)
# end

Given /the following courses_offerings exist/ do |courses_offerings_table|
    courses_offerings_table.hashes.each do |course|
        CoursesOffering.create course
    end
end

Given /the following schedules exist/ do |schedules_table|
    schedules_table.hashes.each do |schedule|
        Schedule.create schedule
    end
end

When /^(?:|I )don't have "([^"]*)" on my schedule$/ do |text|
    if page.respond_to? :should
        expect(page).to have_no_content(text)
    end
end

When /^(?:|I )have "([^"]*)" on my schedule$/ do |text|
    expect(page).to have_content(text)
end


Then /^(?:|I )should not see "([^"]*)" on the calendar$/ do |text|
    expect(page).to have_no_content(text)
end

Then /^(?:|I )should see "([^"]*)" on the calendar$/ do |text|
    expect(page).to have_content(text)
end

When /I click on "Add" for "ANALYSIS OF ALGORITHMS I"/ do
    Schedule.create(:student_id => 2, :courses_offering_id => 2)
    visit schedule_path
end

When /I click on "Remove" for "Computer Vision II: Learning"/ do
    Schedule.delete_all
    visit schedule_path
end