class TitleBracketsValidator < ActiveModel::Validator
  def validate(record)
    if !brackets_closed(record.title)
      record.errors[:base] << "Invalid title"
    end
  end

  private

  def brackets_closed(field)
    stack   = []
    symbols = { "(" => ")", "[" => "]", "{" => "}" }
    left    = symbols.keys
    right   = symbols.values

    field.each_char.with_index do |char, index|
      if left.include?(char)
        stack << [char, index]
      elsif right.include?(char)
        if stack.empty? || ((stack.last[1] + 1 != index) && (symbols[stack.pop[0]] != char))
          return false
        end
      end
    end

    stack.empty?
  end
end
