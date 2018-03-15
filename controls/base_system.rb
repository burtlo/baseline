
describe yum.repo('c7-media') do
  it { should exist }
  it { should_not be_enabled }
  its('baseurl') { should match 'file://media/CentOS/, file:///media/cdrom/' }
end

describe http('docs.inspec.io') do
  its('status') { should eq 301 }
end

describe crontab('chef').where({ 'hour' => '0' }) do
  its('entries.count') { should eq 2 }
end

describe package('git') do
  it { should be_installed }
  its('version') { should cmp '1.8.3.1-12.e17_4' }
end
