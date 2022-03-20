class TextAnalyzer
  def process
    file = File.open('text.txt')
    puts yield(file.read)
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| "#{text.split(/\n\n/).count} paragraphs" }
analyzer.process { |text| "#{text.split(/\n/).count} lines" }
analyzer.process { |text| "#{text.split(' ').count} words" }