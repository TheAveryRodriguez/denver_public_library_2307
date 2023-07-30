class Library
  attr_reader :name, :books, :authors
  def initialize(name)
    @name = name
    @books = []
    @authors = []
  end

  def add_author(author)
    @authors << author
    author.books.map do |book|
      @books << book
      @authors
    end
  end

  def publication_time_frame_for(author)
    first_book = author.books.min_by do |book|
      book.publication_year
    end
    last_book = author.books.max_by do |book|
      book.publication_year
    end
    {start: first_book.publication_year, end: last_book.publication_year}
  end
end
