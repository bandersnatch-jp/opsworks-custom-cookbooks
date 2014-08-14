include_recipe "td-agent"

#TODO nodeのincludeにtrueが入ってるの前提の動きしてる
template "/etc/td-agent/conf.d/unix-socket.conf" do
  owner "root"
  group "root"
  mode 0644
end
