module CalculatesValues
  extend ActiveSupport::Concern
  included do
    after_validation :calculate_values

    def calculate_values
    end

    def ms_to_time(ms)
      Time.at(ms/1000)
    end

    def ms_field_to_datetime_field(ms_field, date_field=nil)
      date_field ||= ms_field.to_s.gsub('_ms', '').to_sym
      ms = read_attribute(ms_field) || 0
      if ms == 0
        write_attribute(date_field, DateTime.now)
      else
        write_attribute(date_field, Time.at(ms/1000))
      end
    end

  end

end
