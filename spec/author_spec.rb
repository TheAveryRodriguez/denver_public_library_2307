require "./lib/book"
require "./lib/author"

describe Author do
  describe "#initialize" do
    it "it is an author" do
      charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

      expect(charlotte_bronte.name).to eq("Charlotte Bronte")

      expect(charlotte_bronte.books).to eq([])
    end
  end

  describe "#write" do
    it "writes a novel" do
      charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})

      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")

      expect(jane_eyre.class).to be(Book)

      expect(jane_eyre.title).to eq("Jane Eyre")

      villette = charlotte_bronte.write("Villette", "1853")

      expect(charlotte_bronte.books).to eq([jane_eyre, villette])
    end
  end
end
