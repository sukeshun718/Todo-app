class Board < ApplicationRecord
    validates :name, presence: true
    validates :description, presence: true

    belongs_to :user
    has_many :tasks, dependent: :destroy

    def display_created_at 
        I18n.l(self.created_at, format: :default)
    end 
end
