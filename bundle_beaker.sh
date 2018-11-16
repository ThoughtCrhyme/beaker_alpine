cd /module
bundle exec beaker-hostgenerator windows2008r2-64default.a --hypervisor vmpooler > spec/acceptance/nodesets/temp.yaml 
bundle exec rake beaker