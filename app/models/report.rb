module Report
  def generate_report(visit)
    @sentence_1 = "I had the pleasure of seeing #{visit.patient.first_name} #{visit.patient.last_name} on #{visit.created_at.strftime("%A, %d %B %Y")} at Stanford Hospital."
    @sentence_2 = "#{visit.patient.first_name} came to us primarily #{visit.primary_reason}"
    if visit.secondary_reason
      @sentence_2 += ", but also #{visit.secondary_reason}. "
    else
      @sentence_2 += ". "
    end
    @report = @sentence_1 + " " + @sentence_2
    return @report
  end
end
