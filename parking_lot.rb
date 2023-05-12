class ParkingLot
	attr_reader :slots

  def initialize(size)
    @slots = Array.new(size)
  end


  def available_slot
    slots.each_with_index do |slot, idx|
      return idx if slot.nil?
    end
    nil
  end

  def park(car, slot_num)
    slots[slot_num] = car
  end

  def get_reg_numbers_by_color(color)
    result = []
    slots.each do |slot|
      next unless slot
      result << slot.reg_no if slot.color == color
    end
    result
  end

  def get_slot_num_by_reg_no(reg_no)
    slots.each_with_index do |slot, idx|
      next unless slot
      result << "Slot No: #{(idx + 1).to_s} \t  Reg No: #{slot.reg_no} \t Color: #{slot.color}" if slot.reg_no == reg_no
    end
    nil
  end

  def get_slot_num_by_color(color)
    result = []
    slots.each_with_index do |slot, idx|
      next unless slot
      result << "Slot No: #{(idx + 1).to_s} \t  Reg No: #{slot.reg_no} \t Color: #{slot.color}" if slot.color == color
    end
    result
  end


end