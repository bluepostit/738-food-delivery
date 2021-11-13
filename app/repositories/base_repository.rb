require 'csv'
require_relative '../models/customer'

class BaseRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @elements = []
    @next_id = 1
    load_csv if File.exist?(csv_file_path)
  end

  def all
    @elements
  end

  def find(id)
    @elements.find { |element| element.id == id }
  end

  def create(element)
    element.id = @next_id
    @next_id += 1
    @elements << element
    save_csv
  end

  private

  def load_csv
    csv_options = {
      headers: :first_row,
      header_converters: :symbol
    }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      element = build_element(row)
      @elements << element
    end
    @next_id = @elements.last.id + 1 unless @elements.empty?
  end

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      csv << csv_headers
      @elements.each do |element|
        csv << build_row(element)
      end
    end
  end
end
