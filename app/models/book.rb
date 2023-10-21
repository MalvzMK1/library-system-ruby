class Book
  def initialize(name, pages, rating, id)
    @infos = {
      :id => id,
      :name => name,
      :pages => pages,
      :rating => rating,
    }
  end

  def get_infos
    return @infos
  end

  def update_infos(name, pages, rating)
    @infos = {
      :id => id,
      :name => name,
      :pages => pages,
      :rating => rating,
    }
  end
end
