FactoryGirl.define do 
  
  factory :subject do
    sequence(:name) { |n| "Subject#{n}"}
    position 1
    visible true 
    
    factory :invalid_subject do
      name nil
    end
  end  
end
