require 'rails_helper'

describe Topic, type: :model do
  topic = Topic.all[101]

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(topic).to be_valid
    end
  end

  describe 'Nested Sets' do
    it 'belongs to a root' do
      root = topic.root
      expect(root).to be_valid
    end
    it 'has a depth' do
      expect(topic.depth).to be_a_kind_of(Fixnum)
    end
    it 'has a children count' do
      expect(topic.children_count).to be_a_kind_of(Fixnum)
    end
  end

  describe '.keyify' do
    it 'pluralizes morphology' do
      keyed = Topic.roots.where(name: 'morphology/physical findings')[0].keyify
      expect(/s$/).to match(keyed)
    end

    it 'pluralizes vitals' do
      keyed = Topic.roots.where(name: 'vitals')[0].keyify
      expect(/s$/).to match(keyed)
    end

    it 'removes spaces' do
      keyed = Topic.first.keyify
      expect(/\s/).to_not match(keyed)
    end

  end
end
