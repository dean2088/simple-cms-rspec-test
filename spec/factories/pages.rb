FactoryGirl.define do 
  
  factory :page do
    association :subject
    sequence(:name) { |n| "Page#{n}"}
    sequence(:permalink) { |n| "permalink#{n}"}   
    position 1
    visible 1 
  end 
  
end
