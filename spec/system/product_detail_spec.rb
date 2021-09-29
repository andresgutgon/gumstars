require "rails_helper"

RSpec.describe "Product detail page", :type => :system do
  let!(:product) { create(:product) }
  let(:product_detail_page) { product_path(product) }

  before do
    driven_by(:selenium_chrome_headless)
    visit product_detail_page
  end

  it "shows product title" do
    title = page.find('h1[data-test="product.title"]')
    expect(title).to have_text("Gumroad is awesome")
  end

  it "does not show average number with 0 reviews" do
    average_number = begin
      page.find('div[data-test="product.average.number"]')
    rescue Capybara::ElementNotFound
      nil
    end
    expect(average_number).to be_nil
  end

  it "does not show reviews when 0 reviews" do
    review_title, review_list = begin
      [
        page.find('div[data-test="product.review.title"]'),
        page.find('ul[data-test="product.review.list"]')
      ]
    rescue Capybara::ElementNotFound
      []
    end
    expect(review_title).to be_nil
    expect(review_list).to be_nil
  end

  it 'can add new review' do
    # Open create review modal
    add_review_button = page.find('[data-test="product.add_review_button"]')
    add_review_button.click

    # Check 3.5 stars
    stars = page.find('label[data-test="product.review_rating_35"]')
    stars.click

    # Add review comment
    comment = page.find('textarea[data-test="product.review.comment"]')
    comment.send_keys('This is an awesome review!')

    # Save review
    submit_button = page.find('[data-test="product.review.submit_button"]')
    submit_button.click

    review_title = page.find('h2[data-test="product.reviews.title"]')
    expect(review_title).to have_text('Reviews')

    # Avarage is updated
    average_number = page.find('div[data-test="product.average.number"]')
    expect(average_number).to have_text('3.5')

    # Review is shown in the page
    review_comment = find("span[data-test=\"product.review_#{Review.last.id}.comment\"]")
    expect(review_comment).to have_text('This is an awesome review!')
  end
end
