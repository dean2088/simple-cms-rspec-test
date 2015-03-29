require 'rails_helper'

describe Subject do
  it "is valid with a name, positon and visible" do
   subject = Subject.new(
      name: 'Maths',
      position: 1,
      visible: 1 )
   expect(subject).to be_valid
  end
  
  it "is invalid without a name" do
    subject = Subject.new(name: nil)
    subject.valid?
    expect(subject.errors[:name]).to include("can't be blank")
  end
  
  it "has a valid factory" do
    expect(FactoryGirl.build(:subject)).to be_valid 
  end
  
  it "is invalid without a name" do
    subject = FactoryGirl.build(:subject, name: nil) 
    subject.valid?
    expect(subject.errors[:name]).to include("can't be blank")
  end
end