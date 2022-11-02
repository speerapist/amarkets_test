class SpectacleDateValidator < ActiveModel::Validator

  def validate(record)
    date_validity(record)
  end

  private

  def date_validity(record)
  	scope = Spectacle.all

  	if scope.where("? >= start_date AND end_date >= ?", record.end_date, record.start_date).exists?
  		record.errors.add(:date, "This date is booked, please select another date")
  	end
  end
end
