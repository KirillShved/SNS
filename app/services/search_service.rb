class SearchService

  attr_reader :query

  def initialize(query)
    @query = query
  end

  def search
    search_tags + search_users
  end

  private

  def search_tags
    Tag.search_by_text(query).first(5)
  end

  def search_users
    User.search_by_full_name(query).first(5)
  end
end
