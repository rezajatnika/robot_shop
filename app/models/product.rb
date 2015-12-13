# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  image_url   :string
#  price       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Product < ActiveRecord::Base
  before_destroy :ensure_not_referenced_by_line_items
  has_many :line_items

  private

  def ensure_not_referenced_by_line_items
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Line items present.')
      return false
    end
  end
end
