class Short < ActiveRecord::Base
   
   attr_accessible :long, :desc
   attr_accessor :desc

  validates :long,
		:presence => true,
		:format => {
		:with => %r{^http://},
		:message => "Only HTTP links allowed!"
		}

  def to_param
    
    if self.desc.nil?
      s36_id
       else

      "#{s36_id}/#{self.desc.parameterize}"
    end

  end

  def s36_id
  
    self.id.to_i.to_s(36)
  end
end
