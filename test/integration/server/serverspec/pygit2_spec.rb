require 'serverspec'

# Required by serverspec
set :backend, :exec

describe package('git') do
  it { should be_installed } 
end

describe command("python -c 'import pygit2'") do
  its(:exit_status) { should eq 0 }
end
