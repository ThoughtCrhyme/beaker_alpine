beaker-hostgenerator windows2012r2-64default.a --hypervisor vmpooler > /module/spec/acceptance/nodesets/temp.yaml 
cd /module
bundle install --path .bundle/gems
bundle exec rake beaker