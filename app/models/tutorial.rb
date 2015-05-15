class Tutorial < ActiveRecord::Base
    belongs_to :user
    has_many :comments
    has_many :lessons
    accepts_nested_attributes_for :lessons
    validates :name, :description  presence: true
end
