FactoryGirl.define do
  factory :comment do
    post nil
    commenter_type "MyString"
    commenter_id 1
    comment "MyText"
  end
end
