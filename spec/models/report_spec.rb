require 'rails_helper'

describe Report do
  include Report
  context 'with visit' do
    let(:visit) { FactoryGirl.build :visit }

    describe '.header' do
      it 'begins with today\'s date' do
        expect(visit.header).to start_with "\n#{Date.today.strftime('%m %B %Y')}"
      end

      it 'returns full address' do
        expect(visit.header).to match /1500 Main Street/
        expect(visit.header).to match /Apartment 4/
        expect(visit.header).to match /San Francisco, CA USA/
        expect(visit.header).to match /1500 Main Street/
        expect(visit.header).to match /94123/
      end

      it 'ends with named greeting' do
        expect(visit.header).to match /To whom it may concern,/
        expect(visit.header).to end_with 'I had the pleasure of meeting Antoine in Atlanta at the 33rd annual Marfan Foundation Conference in Atlanta, GA on August 3rd and 4th, 2017 in clinic for a comprehensive patient assessment.'
      end
    end

    describe '.vitals_paragraph' do
      it 'returns \'no\' statement if empty' do
        expect(visit.vitals_paragraph).to eq 'Antoine had no vitals measured during this visit.'
      end

      it 'includes name of patient' do
        expect(visit.vitals_paragraph).to match /Antoine/
      end
    end

    describe '.family_paragraph' do
      it 'returns \'no\' statement if empty' do
        expect(visit.family_paragraph).to eq 'A family history was not completed for Antoine during his visit.'
      end

      it 'includes name of patient' do
        expect(visit.family_paragraph).to match visit.patient.first_name
      end
    end

    describe '.meds_paragraph' do
      it 'returns \'no\' statement if empty' do
        expect(visit.meds_paragraph).to eq 'I did not discuss any medications with Antoine during our visit.'
      end

      it 'includes name of patient' do
        expect(visit.meds_paragraph).to match visit.patient.first_name
      end
    end

    describe '.imagery_paragraph' do
      it 'returns \'no\' statement if empty' do
        expect(visit.imagery_paragraph).to eq 'No heart measurements were taken of Antoine as part of our visit.'
      end

      it 'includes name of patient' do
        expect(visit.imagery_paragraph).to match visit.patient.first_name
      end
    end

    describe '.concerns_body' do
      it 'returns \'no\' statement if empty' do
        expect(visit.concerns_body).to start_with "\n    \nAntoine reported no"
        expect(visit.concerns_body).to match ', nor'
      end

      it 'includes name of patient' do
        expect(visit.concerns_body).to match visit.patient.first_name
      end
    end

    describe '.recommendations' do
      it 'returns \'no\' statement if empty' do
        expect(visit.recommendations).to eq 'We have no recommendations for further care at this time.'
      end
    end

    describe '.signature' do
      it 'starts with gendered, named assurance' do
        expect(visit.signature).to start_with 'I have assured Antoine that the whole clinic team will be available to him'
      end

      it 'ends with clinician information' do
        expect(visit.signature).to end_with "\nSincerely,\n    \nDavid Liang\n    \nThe Center for Marfan Syndrome and Related Aortic Disorders at Stanford University Hospital"
      end
    end

    describe '.report' do
      it 'begins with header' do
        expect(visit.report).to start_with visit.header
      end

      it 'includes vitals' do
        expect(visit.report).to match visit.vitals_paragraph
      end

      it 'includes family history' do
        expect(visit.report).to match visit.family_paragraph
      end

      it 'includes medications' do
        expect(visit.report).to match visit.meds_paragraph
      end

      it 'includes imagery' do
        expect(visit.report).to match visit.imagery_paragraph
      end

      it 'includes concerns body' do
        expect(visit.report).to match visit.concerns_body
      end

      it 'includes recommendations' do
        expect(visit.report).to match visit.recommendations
      end

      it 'ends with signature' do
        expect(visit.report).to end_with visit.signature
      end
    end
  end
end
