class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

  accepts_nested_attributes_for :categories

  # Make sure we don't create multiple categories with the same name
  # We are overwritting this method
  def categories_attributes=(attributes)
    attributes.values.each do |attr|
      if attr[:name].present?
        self.categories << Category.find_or_create_by(attr)
      end
    end
  end
end
