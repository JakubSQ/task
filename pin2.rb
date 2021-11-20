class Pin
  def initialize(position, instruction)
    @position = position
    @instruction = instruction
  end

  HASH = { 1 => { 1 => ['L', 'U'], 2 => ['L'], 4 => ['U'] }, 
         2 => { 1 => ['R'], 2 => ['U'], 3 => ['L'], 5 => ['U'] },
         3 => { 2 => ['R'], 3 => ['R', 'U'], 6 => ['U'] },
         4 => { 1 => ['D'], 4 => ['L'], 5 => ['L'], 7 => ['U'] },
         5 => { 2 => ['D'], 4 => ['R'], 6 => ['L'], 8 => ['U'] },
         6 => { 3 => ['D'], 5 => ['R'], 6 => ['R'], 9 => ['U'] },
         7 => { 4 => ['D'], 7 => ['D', 'L'], 8 => ['L'] },
         8 => { 5 => ['D'], 7 => ['R'], 8 => ['D'], 9 => ['L'] },
         9 => { 6 => ['D'], 8 => ['R'], 9 => ['R', 'D'] } }

  def string_instruction
    @instruction.split('')
  end

  def code_path
    string_instruction.each do |i|
      result = HASH.detect { |k,sh| k if sh.detect { |k,v| k == @position && v.detect { |el| el == i } } }.first
      @position = result
    end
    @position
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
        'LLRRDURRDLDULRDUDLRDRDRURULDU',
        'DULRRDRLRLUDLLURURLLRLRDLLDLLDRDUURL',
        'DUULULUUDUDLLRLRURULLDLRRLURDLLDUDUDDRURRLUDULULD'])
