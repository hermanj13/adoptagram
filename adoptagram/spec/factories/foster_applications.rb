FactoryGirl.define do
  factory :foster_application do
    animal nil
    agency nil
    user nil
    comments "MyText"
    contacted false
    interviewed false
    approved false
    accepted false
  end
end
