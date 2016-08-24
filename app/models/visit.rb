class Visit < ActiveRecord::Base
  belongs_to :patient

  def generate_report(visit)
    @sentence_1 = "I had the pleasure of seeing #{visit.patient.first_name} #{visit.patient.last_name} on #{visit.created_at.strftime("%A, %d %B %Y")} at Stanford Hospital."
    @sentence_2 = "#{visit.patient.first_name} came to us primarily #{visit.primary_reason}"
    if visit.secondary_reason
      @sentence_2 += ", but also #{visit.secondary_reason}. "
    else
      @sentence_2 += ". "
    end
    @report = @sentence_1 + " " + @sentence_2
    puts @report
  end

  @all_symptoms = SeededSymptom.all
  @cardiovascular_symptoms = SeededSymptom.where(systemic_category: "Cardiovascular")
  @dural_symptoms = SeededSymptom.where(systemic_category: "Dural")
  @aural_symptoms = SeededSymptom.where(systemic_category: "Aural")
  @ocular_symptoms = SeededSymptom.where(systemic_category: "Ocular")
  @pulmonary_symptoms = SeededSymptom.where(systemic_category: "Pulmonary")
  @cranial_symptoms = SeededSymptom.where(systemic_category: "Skeletal (Cranium)")
  @feet_and_leg_symptoms = SeededSymptom.where(systemic_category: "Skeletal (Feet & Legs)")
  @general_skeletal_symptoms = SeededSymptom.where(systemic_category: "Skeletal (General)")
  @hand_and_arm_symptoms = SeededSymptom.where(systemic_category: "Skeletal (Hands & Arms)")

  validates :height, presence: true, numericality: true
  validates :weight, presence: true, numericality: true
  validates :patient, presence: true
  validates :z_score, presence: true, numericality: true
  validates :upper_segment, numericality: true
  validates :lower_segment, numericality: true
  validates :arm_span, numericality: true
end
