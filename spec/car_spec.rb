require 'spec_helper'

RSpec.describe Car do
  let(:reg_no) { 'DLAQ92377' }
  let(:color) { 'gray' }
  subject(:car) { Car.new(reg_no, color) }

  it 'has proper attribute value' do
    expect(car.reg_no).to eq(reg_no)
    expect(car.color).to eq(color)
  end
end