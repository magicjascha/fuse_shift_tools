module DataManipulation
  extend self
  
  def to_csv(data)
    headers = data.first.keys
    CSV.generate(headers: true) do |csv|
      csv << headers
      data.each { |attributes| csv << attributes } 
    end
  end
end