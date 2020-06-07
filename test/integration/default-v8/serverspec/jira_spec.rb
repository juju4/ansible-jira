require 'serverspec'

# Required by serverspec
set :backend, :exec

## Use Junit formatter output, supported by jenkins
#require 'yarjuf'
#RSpec.configure do |c|
#    c.formatter = 'JUnit'
#end

if (os[:family] == 'ubuntu' && os[:release] == '20.04')
  set java_version = '11.0'
else
  set java_version = '1.8'
end

describe service('jira') do
  it { should be_enabled }
  it { should be_running }
end  

describe command('java -version') do
  its(:stderr) { should match /#{java_version}/ }
  its(:exit_status) { should eq 0 }
end

describe process("java") do
  its(:user) { should eq "jira" }
  its(:args) { should match /-Djira.home=\/var\/atlassian\/application-data\/jira/ }
end

#describe port(8080) do
#  it { should be_listening.with('tcp') }
#end

describe file('/opt/atlassian/jira/atlassian-jira-core-8.5.5-standalone/conf/server.xml') do
  it { should be_file }
  its(:content) { should match /<Connector port="8080"/ }
end
