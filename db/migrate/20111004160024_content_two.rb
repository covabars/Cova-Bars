class ContentTwo < ActiveRecord::Migration
  def self.up
    Food.create(:title => 'Pizza Menu', :permalink => 'pizzamenu', :body => '<p>Welcome to the Back Shed Bar and Pizzeria opened in December 2000.</p>', :opening => 'Serving from 5pm-11pm')
  end

  def self.down
  end
end
