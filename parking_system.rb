require_relative './parking_lot'
require_relative './car'
class ParkingSystem

	attr_reader :parking_lot

	def print_data(slots)
    table_format = "Slot No.    Registration No    Colour\n"

    slots.each_with_index do |slot, idx|
      next unless slot

      table_format += (idx + 1).to_s + '           ' + slot.reg_no + '      ' + slot.color
      table_format += "\n"
    end

    puts table_format
  end

  def create_parking_lot(size)
    @parking_lot = ParkingLot.new(size.to_i)
    puts @parking_lot
    puts('Created a parking lot with ' + size + ' slots')
    return @parking_lot
  end

  def check_and_park(reg_no, color)
    slot_num = parking_lot.available_slot
    if slot_num
      park_process(reg_no, color, slot_num)
    else
      puts 'Sorry, parking lot is full'
    end
  end

  def park_process(reg_no, color, slot_num)
    park_on_slot(reg_no, color, slot_num)
    puts 'Allocated slot number: ' + (slot_num + 1).to_s
  end
  
  def park_on_slot(reg_no, color, slot_num)
    car = Car.new(reg_no, color)
    parking_lot.park(car, slot_num)
  end

  def registration_numbers_by_color(color)
    results = parking_lot.get_reg_numbers_by_color(color)
    dislay results
  end

  def slot_num_by_registration_number(reg_no)
    slot_num = parking_lot.get_slot_num_by_reg_no(reg_no)
    unless slot_num
    	'Not found'
    else
    	puts slot_num.to_s
    end
  end

  def slot_numbers_by_color(color)
    results = parking_lot.get_slot_num_by_color(color)
    dislay results
  end

  def call
    menu
    option  = gets.chomp.to_i
    if option == 0
      size =  user_input 'Enter parking lot of size'
      create_parking_lot(size)
      process_continue
    elsif option == 1
      reg_no =  user_input 'Enter The Car Registartion Number'
      color = user_input 'Enter The Car Color'
      check_and_park(reg_no, color)
      process_continue
    elsif option == 2
      color = user_input 'Enter The Car Color'
      registration_numbers_by_color(color)
      process_continue
    elsif option == 3
      reg_no =  user_input 'Enter The Car Registartion Number'
      slot_num_by_registration_number(reg_no)
      process_continue
    elsif option == 4
      reg_no =  user_input 'Enter The Car color'
      slot_numbers_by_color(reg_no)
      process_continue
    elsif option == 9
      exit(true)
    else
      puts 'invalid option'
      puts 'Choose Your Option'
      option  = gets.chomp.to_i
    end
  end

  def process_continue
    puts 'Do you want to continue? [Y/n] Abort.'
    choice  = gets.chomp
    if choice.casecmp('Y') == 0
      call
    elsif choice.casecmp('N') == 0
      exit(true)
    else
      process_continue
    end 
  end

  def user_input(message)
    puts message
    gets.chomp
  end

  def dislay results
  	results.each_with_index do |result, id|
   		puts "#{result}"
   	end
  end

  def menu
    puts("\n\n\n\n\n");
    puts("===================================================================")
    puts("===================    PARKING LOT MANAGEMENT    ====================")
    puts("===================================================================")
    puts '0. Create parking lot '
    puts '1. To park a car      '
    puts '2. Get cars registration number for the given car color '
    puts '3. Get slot number for the given registration number '
    puts '4. Get slot numbers for the given car color '
    puts '9. Exit '
  end
  
   ParkingSystem.new.call
  

end