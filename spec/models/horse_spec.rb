RSpec.describe Horse do 
  describe "Class Methods" do
    describe ".total_winnings" do
      it "returns total winnings for all horses" do
        Horse.create(name: "Phil", age: 22, total_winnings: 3)
        Horse.create(name: "Penelope", age: 24, total_winnings: 4)

        result = Horse.total_winnings

        expect(result).to eq(7)
      end
    end

    describe ".average winnings" do
      it "returns the average of multiple winnings" do
        Horse.create(name: "Phil", age: 22, total_winnings: 4)
        Horse.create(name: "Penelope", age: 24, total_winnings: 6)

        result = Horse.average_winnings

        expect(result).to eq(5)
      end
    end
  end

  describe "Instance Methods" do
    describe "#age_in_months" do
      it "multiplies age by twelve" do
        horse = Horse.new(name: "Phil", age: 5, total_winnings: 4)

        result = horse.age_in_months

        expect(result).to eq(60)
      end
    end
  end

  describe "Validations" do
    it "is invalid without a name" do
      horse = Horse.new(age: 20, total_winnings: 10)

      expect(horse).to_not be_valid
    end

    it "is invalid without total winnings" do
      horse = Horse.new(age: 20, name: "Bob")

      expect(horse).to_not be_valid
    end

    it "is invalid without age" do
      horse = Horse.new(name: "Bob", total_winnings: 1234)

      expect(horse).to_not be_valid
    end
  end
end
