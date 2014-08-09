#
# Author:: Eisuke Kozu (<eisuke@bandersnatch.jp>)
# Recipe:: webmin::default
#
# Copyright 2014, Bandersnatch
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

group "#{node['apache']['group']}" do
  action :create
end

user "#{node['apache']['user']}" do
  gid "#{node['apache']['group']}"
  comment "apache2 user"
  system true
  action :create
end


#TODO EBSをブートデバイスにするとコレだと順番によって上手く行かなくなるので一度削除


#service "apache2" do
#  action :stop
#end
#service "php5-fpm" do
#  action :stop
#end

directory "/home/#{node['apache']['user']}" do
owner node['apache']['user']
group node['apache']['group']
mode 0755
recursive true
action :create
not_if do
File.exists?("/home/#{node['apache']['user']}")
end
end

user "#{node['apache']['user']}" do
  home "/home/#{node['apache']['user']}"
  shell "/bin/bash"
  action   :modify
end

#service "apache2" do
#  action :start
#end
#service "php5-fpm" do
#  action :start
#end
