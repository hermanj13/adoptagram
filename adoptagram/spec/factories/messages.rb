FactoryGirl.define do
  factory :message do
    agency nil
    user nil
    animal nil
    read false
    subject "MyString"
    message "MyText"
  end
end
