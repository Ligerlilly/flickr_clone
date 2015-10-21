FactoryGirl.define do
  factory :user do
    email 'test@example.com'
    password 'f4k3p455w0rd'
    username 'Steve'
  end

  factory :image do
    title 'Bogus Image'
    pic Rack::Test::UploadedFile.new("#{Rails.root}/public/system/images/pics/000/000/001/medium/14302299_N05.jpg", "image/jpg")
    # Other attributes
  end

  factory :tag do
  end
end
