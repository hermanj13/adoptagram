FactoryGirl.define do
  factory :family_info do
    user nil
    adults 1
    children 1
    home_type "MyString"
    description "MyString"
    landlord "MyString"
    phone "MyString"
    allergies "MyText"
    agreement false
    time false
  end
end
