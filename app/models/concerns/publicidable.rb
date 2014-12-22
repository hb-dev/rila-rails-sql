module Publicidable
  extend ActiveSupport::Concern

  included do
    before_create :set_public_id
  end

  protected

  def set_public_id
    self.public_id = loop do
      public_id = generate_public_id      
      break public_id unless self.class.exists?(public_id: public_id)
    end
  end

  def generate_public_id
    year = event.event_date.year.to_s.split(//).last(2).join
    random = rand(9**3).to_s.rjust(3,'0')
    self.public_id = "#{self.public_name}-#{year + random}"
  end

end