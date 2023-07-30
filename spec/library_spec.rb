require "./lib/library"
require "./lib/author"
require "./lib/book"

describe Library do
  describe "#initialize" do
    it "is a library" do
      @dpl = Library.new("Denver Public Library")

      expect(@dpl.name).to eq("Denver Public Library")
      expect(@dpl.books).to eq([])
      expect(@dpl.authors).to eq([])
    end
  end

  describe "add_author" do
    it "can add an author" do
      @dpl = Library.new("Denver Public Library")
      @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
      @harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})

      @dpl.add_author(@charlotte_bronte)
      @dpl.add_author(@harper_lee)

      expect(@dpl.authors).to eq([@charlotte_bronte, @harper_lee])
    end
  end

  describe "books" do
    it "shows us all books from all authors in library collection" do
      @dpl = Library.new("Denver Public Library")
      @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
      @jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      @professor = @charlotte_bronte.write("The Professor", "1857")
      @villette = @charlotte_bronte.write("Villette", "1853")
      @harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
      @mockingbird = @harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

      expect(@dpl.books).to eq([])

      @dpl.add_author(@charlotte_bronte)

      expect(@dpl.books).to eq([@jane_eyre, @professor, @villette])

      @dpl.add_author(@harper_lee)
      expect(@dpl.books).to eq([@jane_eyre, @professor, @villette, @mockingbird])
    end
  end

  describe "publication_time_frame_for" do
    it "shows us the year of authors first publication to their last year of publication" do
      @dpl = Library.new("Denver Public Library")
      @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
      @jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      @professor = @charlotte_bronte.write("The Professor", "1857")
      @villette = @charlotte_bronte.write("Villette", "1853")

      @dpl.add_author(@charlotte_bronte)

      expect(@dpl.publication_time_frame_for(@charlotte_bronte)).to eq({start: "1847", end: "1857"})
    end
  end
end
