module Report
  def generate_report(visit)
    @current_date = Time.now.strftime("%d %B %Y")

    @address = "#{visit.patient.address_line_1} \r\n
    #{visit.patient.address_line_2} \n
    #{visit.patient.city}, #{visit.patient.state}, #{visit.patient.postal_code} \n
    #{visit.patient.country}"

    @greeting = "To whom it may concern,\n"

    @sentence_1 = "I had the pleasure of seeing #{visit.patient.first_name} #{visit.patient.last_name} on #{visit.created_at.strftime("%A, %d %B %Y")} at Stanford Hospital."

    @sentence_2 = "#{visit.patient.first_name} came to us primarily #{visit.primary_reason}"
    if visit.secondary_reason
      @sentence_2 += ", but also #{visit.secondary_reason}."
    else
      @sentence_2 += "."
    end

    @paragraph_2 = ""
    visit.symptoms.each do |s|
      @seeded_info = SeededSymptom.where(id: s.seeded_symptom_id)[0]
      if s.presence == false
        @paragraph_2 += "I noted an absence of #{@seeded_info.common_name}. "
      elsif s.presence == true
        @paragraph_2 += "I noted a presence of #{@seeded_info.common_name}"
        if !s.measurement
          @paragraph_2 += ". "
        else
          @paragraph_2 += "with a measurement of #{s.measurement}."
        end
      end
    end


    @paragraph_1 = "#{@sentence_1} #{@sentence_2}"

    @report = "#{@current_date}\n" + "#{@address}\n\n #{@greeting}\n\n#{@paragraph_1}\n\n#{@paragraph_2}"
    return @report
  end
end
