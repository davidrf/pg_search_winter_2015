class Article < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true

  include PgSearch
  pg_search_scope :search_by_title_and_body, against: [:title, :body]
  scope :search, -> (query) { search_by_title_and_body(query) if query.present? }
end
