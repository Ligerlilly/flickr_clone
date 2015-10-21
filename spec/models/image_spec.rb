require 'rails_helper'

describe Image do
  it { should validate_presence_of :pic }
  it { should belong_to :user }
end
