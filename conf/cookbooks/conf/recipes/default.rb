directory "#{ENV['HOME']}/local/bin" do
  recursive true
end

link "#{ENV['HOME']}/local/bin/conf" do
  to "#{ENV['PWD']}/../bin/conf"
end

directory "#{ENV['HOME']}/.completion.d" do
  recursive true
end

link "#{ENV['HOME']}/.completion.d/conf-completion" do
  to "#{ENV['PWD']}/../conf-completion"
end
