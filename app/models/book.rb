class Book
  @@last_id = 1

  def initialize(name, pages, rating = 0)
    @infos = {
      :id => @@last_id,
      :name => name,
      :pages => pages,
      :rating => rating,
    }

    @@last_id += 1
  end

  def get_infos
    return @infos
  end

  def update_infos(name, pages, rating)
    @infos = {
      :id => @infos[:id],
      :name => name,
      :pages => pages,
      :rating => rating,
    }
  end
end
