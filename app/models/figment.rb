class Figment < ActiveRecord::Base
  data_fabric :shard_by => 'city', :replicated => true, :prefix => 'fiveruns'
  belongs_to :account
end
