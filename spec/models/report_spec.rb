require 'rails_helper'

describe Report do
  include Report
  visit = FactoryGirl.create(:visit)

  describe '.header' do
    header = visit.header
    it 'begins with today\'s date' do
      expect(header).to start_with "\n#{Date.today.strftime('%m %B %Y')}"
    end
    it 'returns full address' do
      expect(header).to match /1500 Main Street/
      expect(header).to match /Apartment 4/
      expect(header).to match /San Francisco, CA USA/
      expect(header).to match /1500 Main Street/
      expect(header).to match /94123/
    end

    it 'ends with named greeting' do
      expect(header).to match /To whom it may concern,/
      expect(header).to end_with 'I had the pleasure of meeting Antoine in Atlanta at the 33rd annual Marfan Foundation Conference in Atlanta, GA on August 3rd and 4th, 2017 in clinic for a comprehensive patient assessment.'
    end
  end

  describe '.vitals_paragraph' do
    vitals = visit.vitals_paragraph
    it 'returns \'no\' statement if empty' do
      expect(vitals).to eq 'Antoine had no vitals measured during this visit.'
    end
    it 'includes name of patient' do
      expect(vitals).to match /Antoine/
    end
  end

  describe '.family_paragraph' do
    fam = visit.family_paragraph
    it 'returns \'no\' statement if empty' do
      expect(fam).to eq 'A family history was not completed for Antoine during his visit.'
    end
    it 'includes name of patient' do
      expect(fam).to match visit.patient.first_name
    end
  end

  describe '.meds_paragraph' do
    medications = visit.meds_paragraph
    it 'returns \'no\' statement if empty' do
      expect(medications).to eq 'I did not discuss any medications with Antoine during our visit.'
    end
    it 'includes name of patient' do
      expect(medications).to match visit.patient.first_name
    end
  end

  describe '.imagery_paragraph' do
    imagery = visit.imagery_paragraph

    it 'returns \'no\' statement if empty' do
      expect(imagery).to eq 'No heart measurements were taken of Antoine as part of our visit.'
    end

    it 'includes name of patient' do
      expect(imagery).to match visit.patient.first_name
    end
  end

  describe '.concerns_body' do
    cons = visit.concerns_body

    it 'returns \'no\' statement if empty' do
      expect(cons).to start_with "\n    \nAntoine reported no"
      expect(cons).to match ', nor'
    end

    it 'includes name of patient' do
      expect(cons).to match visit.patient.first_name
    end
  end

  describe '.recommendations' do
    recs = visit.recommendations

    it 'returns \'no\' statement if empty' do
      expect(recs).to eq 'We have no recommendations for further care at this time.'
    end
  end

  describe '.signature' do
    sig = visit.signature

    it 'starts with gendered, named assurance' do
      expect(sig).to start_with 'I have assured Antoine that the whole clinic team will be available to him'
    end

    it 'ends with clinician information' do
      expect(sig).to end_with "\nSincerely,\n    \nDavid Liang\n    \nThe Center for Marfan Syndrome and Related Aortic Disorders at Stanford University Hospital"
    end
  end

  describe '.report' do
    report = visit.report

    it 'begins with header' do
      expect(report).to start_with visit.header
    end

    it 'includes vitals' do
      expect(report).to match visit.vitals_paragraph
    end

    it 'includes family history' do
      expect(report).to match visit.family_paragraph
    end

    it 'includes medications' do
      expect(report).to match visit.meds_paragraph
    end

    it 'includes imagery' do
      expect(report).to match visit.imagery_paragraph
    end

    it 'includes concerns body' do
      expect(report).to match visit.concerns_body
    end

    it 'includes recommendations' do
      expect(report).to match visit.recommendations
    end

    it 'ends with signature' do
      expect(report).to end_with visit.signature
    end
  end
end
