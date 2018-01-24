require 'rails_helper'
include CommonContent

describe FamilyMember, type: :model do
  context 'with valid attributes' do
    let!(:family_member) { FactoryBot.create :family_member }
    let!(:bio) { family_member.generate_summary }

    describe 'Validations' do
      it 'is valid with valid attributes' do
        expect(family_member).to be_valid
      end

      it 'is valid without visit' do
        family_member.visit_id = nil
        expect(family_member).to be_valid
      end

      it 'is valid with family member topic' do
        family_member.common_content

        expect(family_member.family_member_ids).to include family_member.topic_id
      end

      it 'is invalid without family member topic' do
        family_member.topic_id = nil
        expect(family_member).to_not be_valid
      end
    end

    describe 'Associations' do
      it { should belong_to :topic }
      it { should belong_to :visit }
      it { should belong_to :patient }
    end

    describe '.generate_summary' do
      it 'begins with name of family member' do
        expect(bio).to start_with 'Anna Banana'
      end
    end
  end
end
