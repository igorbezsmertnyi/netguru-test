require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { is_expected.to allow_value("Hello world").for(:text) }
  it { is_expected.not_to allow_value("").for(:text) }
end
