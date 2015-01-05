set :application, "rayblocitoff"
set :scm, :git
set :repository, "https://github.com/raysango/blocitoff.git"
set :scm_passphrase, ""

set :whenever_environment, defer { production }
require "whenever/capistrano"

namespace :todo do
  desc "Delete items older than seven days"
  task delete_items: :environment do
    Item.where("created_at <= ?", Time.now - 7.days).destroy_all
  end

end