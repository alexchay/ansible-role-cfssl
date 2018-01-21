require_relative '../spec_helper.rb'

cfssl_root_dir = '/etc/cfssl'
ca_dirs = [
  'conf',
  'root',
  'ca',
  'ocsp'
]

describe file(cfssl_root_dir) do
  it { should be_directory }
  it { should be_mode 644 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end

ca_dirs.each do |d|
  describe file("#{cfssl_root_dir}/#{d}") do
    it { should be_directory }
    it { should be_mode 400 }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
  end
end

describe file('/etc/systemd/system/cfssl.service') do
  it { should be_file }
  it { should be_mode 755 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end

describe service('cfssl') do
  it { should be_running }
end

describe port (8888) do
  it { should be_listening }
end

describe file('/etc/systemd/system/cfssl-ocsp.service') do
  it { should be_file }
  it { should be_mode 755 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end

describe service('cfssl-ocsp') do
  it { should be_running }
end

describe port (8889) do
  it { should be_listening }
end
