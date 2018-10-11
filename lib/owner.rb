class Owner
	attr_accessor(:name, :pets)
	attr_reader(:species)

	@@all = []

	def initialize(species)
		@species = species
		@pets = {:fishes => [], :dogs => [], :cats => []}
		@@all.push(self)
	end

	def say_species
		"I am a #{@species}."
	end

	def buy_fish(name)
		fish = Fish.new(name)
		@pets[:fishes].push(fish)
	end

	def feed_fish
		@pets[:fishes].map {|fish| fish.mood = "happy"}
	end

	def buy_cat(name)
		cat = Cat.new(name)
		@pets[:cats].push(cat)
	end

	def play_with_cats
		@pets[:cats].map {|cat| cat.mood = "happy"}
	end

	def buy_dog(name)
		dog = Dog.new(name)
		@pets[:dogs].push(dog)
	end

	def walk_dogs
		@pets[:dogs].map {|dog| dog.mood = "happy"}
	end

	def list_pets
		pets_str = "I have #{@pets[:fishes].count} fish, #{@pets[:dogs].count} dog(s), and #{@pets[:cats].count} cat(s)."
	end

	def sell_pets
		@pets.keys.each {|pet_kind|
			@pets[pet_kind].map {|pet| pet.mood = "nervous"}
		}
		@pets = {:fishes => [], :dogs => [], :cats => []}
	end

	def self.count
		@@all.count
	end

	def self.all
		@@all
	end

	def self.reset_all
		@@all.clear
	end

end