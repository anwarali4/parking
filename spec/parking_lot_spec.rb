require 'spec_helper'

RSpec.describe ParkingLot do
  let(:slots_size) { Random.rand(3..10) }
  subject(:parking_lot) { ParkingLot.new slots_size }

  describe '#initialize and attr_accessor' do
    it 'receives size' do
      parking_lot = ParkingLot.new slots_size
      expect(parking_lot.slots.size).to eq(slots_size)
    end
  end

  describe '#available_slot' do
    context 'empty slot available' do
      it 'returns the index of the first found empty slot' do
        slots = ['a', nil, 'b', 'c']

        allow(parking_lot).to receive(:slots).and_return(slots)

        expect(parking_lot.available_slot).to eq(1)
      end
    end
  end
  
end