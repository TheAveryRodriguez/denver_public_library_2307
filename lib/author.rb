class Author
  attr_reader :first_name, :last_name, :books
  def initialize(author_info)
    @first_name = author_info[:first_name]
    @last_name = author_info[:last_name]
    @books = []
  end

  def name
    @first_name + " " + @last_name
  end

  def write(name, pub_date)
    novel = Book.new({author_first_name: @first_name, author_last_name: @last_name, title: name, publication_date: pub_date})
    @books << novel
    novel
  end
end
