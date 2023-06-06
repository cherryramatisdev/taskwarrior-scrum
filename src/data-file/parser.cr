module DataFile
  def self.parse(data : String) : Array(Hash(String, String))
    result = Array(Hash(String, String)).new

    data.each_line do |line|
      line = line.gsub(/\[|\]/, "")
      hash = Hash(String, String).new

      line.scan(/(\w+):"(.*?)"/) do |match|
        key = match[1]
        value = match[2]
        hash[key] = value
      end

      result << hash
    end

    result
  end
end
