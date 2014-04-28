#db_tasks = %w[db:migrate db:migrate:up db:migrate:down db:rollback db:forward]

#namespace :multishop do
 # db_tasks.each do |task_name|
  #  desc "Run #{task_name} for each shop"
   # task task_name => %w[environment db:load_config] do
    #  Shop.find_each do |shop|
     #   puts "Running #{task_name} for shop#{shop.id} (#{shop.name})"
      #  shop.scope_schema { Rake::Task[task_name].execute }
      #end
    #end
  #end
#end

#db_tasks.each do |task_name|
 # Rake::Task[task_name].enhance(["multishop:#{task_name}"])
#end