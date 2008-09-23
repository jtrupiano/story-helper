class ActionController::TestCase
  extend StoryAccessors::Methods  # this probably isn't the right thing to do....
  
  # allows us to use the self.log_in function to log in a certain user
  @@scoped_session = {}
  
  # Used as a directive at the top of a functional test (to blanket log in this user)
  # def self.log_in(user)
  #     #puts "logging in #{user.email}"
  #     @@scoped_session.merge!({:user_id => user.id})
  #   end
  
  # invoke in setup (or within a specific test to override the setup method)
  def log_in(user)
    @@scoped_session[:user_id] = user.id
  end
  
  def log_out
    @@scoped_session.delete(:user_id)
  end
  
  # Used within a test to log in a specific user for a single test
  # def log_in(user)
  #     old_user_id = @@scoped_session[:user_id]
  #     @@scoped_session[:user_id] = user.id
  #     yield
  #   ensure
  #     @@scoped_session[:user_id] = old_user_id
  #   end
  
  [:get, :post, :put, :delete].each do |meth|
    src = <<-END_OF_SRC
      def #{meth.to_s}(action, parameters = nil, session = {}, flash = nil)
        super(action, parameters, session.merge(@@scoped_session || {}), flash)
      end
    END_OF_SRC
    class_eval src, __FILE__, __LINE__
  end

  def xhr(request_method, action, parameters = nil, session = {}, flash = nil)
    super(request_method, action, parameters, session.merge(@@scoped_session || {}), flash)
  end
  
end
