require 'rake'
class Item < ActiveRecord::Base
  require 'rake'
  belongs_to :list
  def days_left
      (DateTime.now.to_date - created_at.to_date).to_i
   end
#   def self.run_rake(task_name)
#     load File.join(Rails.root, 'lib', 'tasks', 'todo.rake')
#     Rake::Task[task_name].invoke
#   end
end
