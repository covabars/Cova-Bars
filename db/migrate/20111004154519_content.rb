class Content < ActiveRecord::Migration
  def self.up
    Page.create(:title => 'The Back Shed Bar', :permalink => 'home', :body => '<p>Welcome to the Back Shed Bar and Pizzeria opened in December 2000.</p>
<p>Entertaining regulars both young and old since opening, it has made its name as the most welcoming and friendly bar in Antrim.</p>
<p>The Back Shed is the ideal choice whether its an after work drink, dinner or a great night out we have something to offer everyone. With live entertainment every Friday and Saturday night and large Screen TVs perfect for all your sporting needs!</p>
')
    Page.create(:title => 'The Back Shed Pizzeria', :permalink => 'the_back_shed_pizzeria', :body => '<p>With friendly staff, efficient service and good quality food the Back Shed Pizzeria can cater for all your dining needs. We are family-friendly with a dedicated kids menu, crayons and colouring books to keep the young occupied while parents can relax and eat.</p>
<p>Bookings are for 8 or more but smaller parties are welcome to pop in and if a table is not immediately available you will be given an estimated waiting time and can relax in our bar downstairs with a pre-dinner drink until your table becomes free.</p>')
    Page.create(:title => 'The Cova Bar', :permalink => 'the_cova_bar', :body => '<p>A family run business since 1954 with an intimate &amp; cosy front bar and large spacious lounge, The Cova Inn is conveniently located just 30 seconds walking distance from the heart of Antrim Town. With ample car parking, it is the perfect place to unwind for a relaxed home cooked lunch or just somewhere to take the stress of your feet whilst shopping.</p>
<p>Entertainment:</p>
<p>Pool Table - Dart Boards - Wii - Wide Screen TVs</p>
<p>With Quiz nights every Thursday (occasionally charity events with proceeds going to local and national good causes), only &pound;1.00 entry per person and Karioke on the last Saturday of every month.</p>
<p>The Cova Bar is available for reservation for private parties. You can phone us for information or use the Contact Page to e-mail us for details.</p>
<p>Ask our friendly staff about out great value discount vouchers!</p>')
    Page.create(:title => 'The Store House', :permalink => 'the_store_house', :body => '<p>The Store House, a new addition to the Back Shed and Cova bar family was opened early this year - near the end of February.</p>
<p>It is a live venue bar, opening on Friday and Saturday nights.</p>
<p>We will enjoy bringing big live bands, tribute bands, comedy nights, salsa nights to Antrim and anything else that will give people of Antrim some great nights here on our own doorstep!</p>
<p>Check back here soon for more information on this exciting new live venue!</p>')
    Page.create(:title => 'Location', :permalink => 'location', :body => '<p>We are conveniently located in the heart of Antrim town. With ample car parking, the Back Shed and Cova Bar is the perfect place for a relaxed office lunch or just somewhere to take the stress off your feet while shopping.</p>')
    Page.create(:title => 'Contact', :permalink => 'the_store_house', :body => '<p style="text-align: center; ">Tel: 028 123 456 - Back Shed<br />Tel: 028 94 428249 - Cova<br />Tel: 02894 460338 - Pizzeria</p>
<p style="text-align: center; ">&nbsp;</p>
<p style="text-align: center; ">&nbsp;</p>
<p style="text-align: center; ">Please use the form below to send us any questions, queries and comments.</p>
')
    Page.create(:title => 'Drinks Promotions', :permalink => 'drinks_promotions', :body => 'content to follow')
    Page.create(:title => 'Functions', :permalink => 'functions', :body => 'content to follow')
  end

  def self.down
  end
end
