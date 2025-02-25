def read_numbers_from_file(filename)
  File.readlines(filename).map(&:chomp).reject(&:empty?)
end

def find_longest_sequence(numbers, max_depth = 20)
  longest_sequence = []

  def dfs(current_sequence, remaining_numbers, depth, longest_sequence, max_depth)
    if current_sequence.length > longest_sequence.length
      longest_sequence.replace(current_sequence)
    end

    return if depth >= max_depth

    remaining_numbers.each_with_index do |num, index|
      if current_sequence.empty? || current_sequence.last[-2..-1] == num[0..1]
        new_sequence = current_sequence.dup
        new_sequence << num
        new_remaining = remaining_numbers.dup
        new_remaining.delete_at(index)
        dfs(new_sequence, new_remaining, depth + 1, longest_sequence, max_depth)
      end
    end
  end

  dfs([], numbers, 0, longest_sequence, max_depth)
  longest_sequence.join
end

filename = 'data/source.txt'
numbers = read_numbers_from_file(filename)

result = find_longest_sequence(numbers)
puts "The longest chain: #{result}"
puts "Chain length: #{result.length}"