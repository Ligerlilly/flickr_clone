FactoryGirl.define do
  factory :user do
    email 'test@example.com'
    password 'f4k3p455w0rd'
    username 'Steve'
  end

  factory :image do
    title 'Bogus Image'
    pic Rack::Test::UploadedFile.new("#{Rails.root}/spec/fixtures/images/test.jpg", "image/jpg")
  end

  factory :tag do
  end

  factory :album do
    name 'Tito'
  end
end
