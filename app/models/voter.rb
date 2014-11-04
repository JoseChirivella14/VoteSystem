require 'securerandom'

class Voter < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  before_save : add_token

  def as_json(options)
    hash = {id: id,
            name: name,
            email: email}
    if options[:include_token]
      hash.merge!(token: token)
    end

    {person: hash}
  end

  private

  def add_token
    self.token  ||=SecureRandom.uuid
  end
end
