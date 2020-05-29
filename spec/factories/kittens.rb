FactoryBot.define do
    
	factory :kitten do
		sequence(:name) { |n| "Kitten - #{n}"}
		age {rand(1..15)}
        cuteness {["too cute", "ok", "nice", "wtf"].sample}
        softness {Faker::numerify('#.#')}
    end

end