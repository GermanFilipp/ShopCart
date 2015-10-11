require 'rails_helper'

module ShopCart
  feature 'Add book' do
    given(:customer) {FactoryGirl.create(:customer)}

    given!(:book) {FactoryGirl.create(:book,id:1,price: 10)}


    scenario 'Customer without any order' do
      expect(page).to have_content("Get started shopping!")
    end


    scenario 'Customer can see order in progress' do

      click_button 'Add to Cart'
      visit orders_path

      expect(page).not_to have_content("Get started shopping!")
      expect(page).to have_content("#{book.title}")
      expect(page).to have_content("#{book.price}")
    end

  end

end
