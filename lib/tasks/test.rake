desc "Run tests"
task :test do
  paths =
    if explicit_list = ENV['run']
      explicit_list.split(',')
    else
      Dir['spec/**/*_spec.rb'].shuffle!
    end
  run_specs paths
end