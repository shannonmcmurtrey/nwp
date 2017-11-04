class Nwpadmin
  def self.matches?(request)
    request.env["warden"].user(:user).admin?  
  end
end