FactoryBot.define do
  factory :game do
    mode { %i(pvp pve both).sample }
    release_data { "2023-04-11" }
    developer { Faker::Company.name }
    system_requirement
  end
end
