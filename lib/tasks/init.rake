desc 'Add an initial internal user'
task :adduser => :environment do 
    User.create(:username => 'admin', :password => 'admin', :internal => true, :name => "Administrator", :email_address => 'admin@nowhere.com', :administrator => true)
end
