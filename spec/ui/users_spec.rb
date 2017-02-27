require 'spec_helper'

feature 'UI/User' do
  background do
    @user = create(:user)
    @article = create(:article, user_id: @user)
  end

  context 'in user show page' do
    scenario 'has the user full_name in header' do
      visit(user_path(@user))
      expect(page).to have_content(@user.full_name)
    end
  end
end

