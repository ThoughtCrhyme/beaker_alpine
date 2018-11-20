beaker-hostgenerator windows2008r2-64default.a --hypervisor vmpooler > /module/spec/acceptance/nodesets/temp.yaml 
cd /module
bundle install --path .bundle/gems
bundle exec rake beaker