server '13.112.13.148', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/User/yizumi.ssh/id_rsa'
