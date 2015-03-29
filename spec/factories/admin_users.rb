FactoryGirl.define do 
  
  factory :admin_user do
  
      first_name 'Jason'
      last_name 'Smith'
      email 'devmian@gmail.com'
      username 'admin12345'
      password_digest 'admin'
      
  end
  
end