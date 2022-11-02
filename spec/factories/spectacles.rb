# frozen_string_literal: true

FactoryBot.define do
  factory :spectacle do
    name { "Romeo" }
    start_date { Date.today }
    end_date { Date.today + 4 }
  end
end