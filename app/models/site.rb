class Site

  URL_REGEXP = /((http:\/\/|https:\/\/)(www.)?(([a-zA-Z0-9-]){2,}\.){1,4}([a-zA-Z]){2,6}(\/([a-zA-Z-_\/\.0-9#:?=&;,]*)?)?)/

  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :user

  field :name
  field :url

  validates :url, uniqueness: true, presence: true, format: { with: URL_REGEXP }
  validate :ensure_existence

  private

  def ensure_existence
    HTTParty.get(url).code == 200
  rescue
    errors.add :url, I18n.t('.errors.does_not_exist')
  end

end