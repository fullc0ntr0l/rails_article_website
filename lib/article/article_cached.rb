# ArticleCached class
# This is an cached layer used over Article model object
class ArticleCached
  class << self
    def new(*args)
      Article.new(*args)
    end

    def all(*args)
      Rails.cache.fetch('article/all') { Article.all(*args) }
    end

    def find(*args)
      Rails.cache.fetch("article/#{args.first}") { Article.find(*args) }
    end

    def clear_cached_articles
      Rails.cache.delete_matched('article/*')
    end
  end
end
