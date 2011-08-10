class ApplicationController < ActionController::Base

  protect_from_forgery

  before_filter :find_account
  around_filter :select_shard

  private
  def find_account
    aid = session[:account_id]
    if aid && aid.to_i != 0
      begin
        @account = Account.find(Integer(aid))
	rescue ActiveRecord::RecordNotFound => e
	  RAILS_DEFAULT_LOGGER.warn "No such account #{aid}, skipping..."
      end
    end
    session[:account_id] = nil unless @account
  end

  def select_shard(&block)
    if @account
      DataFabric.activate_shard(:city => @account.shard, &block) 
    else
      yield
    end
  end

end
