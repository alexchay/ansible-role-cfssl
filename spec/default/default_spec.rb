require_relative '../spec_helper.rb'

bin_dir = '/usr/local/bin'
binaries = [
  'cfssl',
  'cfssl-certinfo',
  'cfssl-newkey',
  'mkbundle',
  'cfssl-bundle',
  'cfssljson',
  'cfssl-scan',
  'multirootca'
]

binaries.each do |b|
  describe file("#{bin_dir}/#{b}") do
    it { should be_file }
    it { should be_mode 755 }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
  end
end
