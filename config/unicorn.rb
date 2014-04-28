root = "/home/deployer/apps/plussizeboutique/current"
working_directory root
pid "#{root}/tmp/pids/unicorn.pid"
stderr_path "#{root}/log/unicorn.log"
stdout_path "#{root}/log/unicorn.log"

listen "/tmp/unicorn.plussizeboutique.sock"
worker_processes 4
timeout 30