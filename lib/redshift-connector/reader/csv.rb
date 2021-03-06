require 'redshift-connector/reader/abstract'
require 'redshift-connector/reader/exception'
require 'csv'

module RedshiftConnector
  # Parses (standard) CSV files.
  # For UNLOAD-generated CSV, use RedshiftCSV class.
  class Reader::CSV < Reader::Abstract
    declare_reader :csv

    def self.data_object?(obj)
      /\.csv(?:\.|\z)/ =~ File.basename(obj.key)
    end

    def initialize(f)
      @f = f
    end

    def each(&block)
      csv = CSV.new(@f)
      csv.each(&block)
    end
  end
end
