class Post < ActiveRecord::Base
  has_state_machine %w(pending live archived deleted)

  def before_making_live
  	@before_making_live = true
  end

  def before_leaving_pending
  	@before_leaving_pending = true
  end
end