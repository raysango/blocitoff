set :application, "rayblocitoff"
set :scm, :git
set :repository, "https://github.com/raysango/blocitoff.git"
set :scm_passphrase, ""

set :whenever_environment, defer { production }
require "whenever/capistrano"
