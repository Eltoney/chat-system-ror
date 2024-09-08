class Message < ApplicationRecord
  belongs_to :chat

  before_create :set_number

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  settings do
    mappings dynamic: false do
      indexes :body, type: :text
    end
  end

  private

  def set_number
    self.number = (chat.messages.maximum(:number) || 0) + 1
  end
end
