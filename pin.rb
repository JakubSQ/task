class Pin
  def initialize(position, instruction)
    @position = position
    @instruction = instruction
  end

  def string_instruction
    @instruction.split('')
  end

  def code_path
    string_instruction.each do |i|
      conditionals(i) 
    end
    @position
  end

  private

  def conditionals(i)
    return @position = 1 if (@position == 1 || @position == 2) && i == 'L'
    return @position = 1 if (@position == 1 || @position == 4) && i == 'U'
    return @position = 2 if (@position == 2 || @position == 5) && i == 'U'
    return @position = 2 if @position == 3 && i == 'L'
    return @position = 2 if @position == 1 && i == 'R'
    return @position = 3 if (@position == 3 || @position == 2) && i == 'R'
    return @position = 3 if (@position == 3 || @position == 6) && i == 'U'
    return @position = 4 if (@position == 4 || @position == 5) && i == 'L'
    return @position = 4 if @position == 7 && i == 'U'
    return @position = 4 if @position == 1 && i == 'D'
    return @position = 5 if @position == 6 && i == 'L'
    return @position = 5 if @position == 4 && i == 'R'
    return @position = 5 if @position == 8 && i == 'U'
    return @position = 5 if @position == 2 && i == 'D'
    return @position = 6 if (@position == 6 || @position == 5) && i == 'R'
    return @position = 6 if @position == 9 && i == 'U'
    return @position = 6 if @position == 3 && i == 'D'
    return @position = 7 if (@position == 7 || @position == 8) && i == 'L'
    return @position = 7 if (@position == 7 || @position == 4) && i == 'D'
    return @position = 8 if (@position == 8 || @position == 5) && i == 'D'
    return @position = 8 if @position == 9 && i == 'L'
    return @position = 8 if @position == 7 && i == 'R'
    return @position = 9 if (@position == 8 || @position == 9) && i == 'R'
    return @position = 9 if (@position == 6 || @position == 9) && i == 'D'
  end
end

def code(full_instruction)
  a = full_instruction.length
  pin_code = []
  position = 5
  a.times do |i|
    part_pin = Pin.new(position, full_instruction[i]).code_path
    pin_code << part_pin
    position = part_pin
  end
  pin_code.join.to_i
end

p code(['RLRLLLULULULUUDUULULRDDLURURDDLDUUDDLRDDUUUDD',
        'LDLRLDDDLUDRDRRUDUURLRULLUDDRLURLUULDLLRLLUDLRLRUDLULRLRRL',
        'LLRRDURRDLDULRDUDLRDRDRURULDU', 'DULRRDRLRLUDLLURURLLRLRDLLDLLDRDUURL',
        'DUULULUUDUDLLRLRURULLDLRRLURDLLDUDUDDRURRLUDULULD'])
