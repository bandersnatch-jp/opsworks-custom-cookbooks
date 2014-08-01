case node[:platform]
when 'debian','ubuntu'
include_recipe "apt"
when 'centos','redhat','fedora','amazon'
include_recipe "yum"
end
