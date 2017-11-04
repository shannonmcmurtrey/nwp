class Nwpadmin
  def self.matches?(request)
    request.env["warden"].user(:user).super_user?  
  end
end