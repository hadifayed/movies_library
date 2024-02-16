require 'csv'

module CsvImport
  class BaseService
    def initialize(file_name)
      @file_path = Rails.root.join(file_name)
    end
  
    def process_file
      file_content = CSV.parse(File.read(@file_path), headers: true)
      file_content.each do |row_data|
        process_row(row_data)
      end
    end
  end
end