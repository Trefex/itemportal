User.create(:email => 'trefex@gmail.com', :password => 'lcsblcsb', :password_confirmation => 'lcsblcsb')

Item.create!([
  {title: "Test 3478", text: "test test test", trainimage_file_name: nil, trainimage_content_type: nil, trainimage_file_size: nil, trainimage_updated_at: nil, trainimage_fingerprint: nil, sn: nil, brand: nil, inbox: nil, scale: nil, dateval: nil, sellprice: nil, selldate: nil}
])
