require 'rails_helper'

RSpec.describe User, type: :model do

  it "has a working factory" do
    expect(build(:user)).to be_valid
  end
  it "requires a email,first_name,last_name" do
    expect(build(:user,email:'',first_name:'',last_name:'')).to_not be_valid
  end
  it "requires an unique email" do
    user = create(:user)
    expect(build(:user,email:user.email)).to_not be_valid
  end

end