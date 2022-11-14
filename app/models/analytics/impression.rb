# frozen_string_literal: true

class Analytics::Impression < ApplicationRecord
  belongs_to :event
  belongs_to :impressionable, polymorphic: true

  has_one :visit, through: :event
end
