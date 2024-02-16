require 'csv'

module CsvImport
  class BaseService
    def initialize(file_path)
      @file_path = file_path
    end
  
    def process_file
      file_content = CSV.parse(File.read(@file_path), headers: true)
      file_content.each do |row_data|
        process_row(row_data)
      end
    end
  end
end