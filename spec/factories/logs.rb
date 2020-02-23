FactoryBot.define do
  factory :log do
    practice_day { "2020/02/01" }
    serve        { "10" }
    smash        { "20" }
    volley       { "30" }
    stroke       { "40" }
    game         { "50" }
    created_at   { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    user
  end
end