module HeartImaging
  def self.root
    Topic.where(name: 'aortic root')[0]
  end

  def self.asc
    Topic.where(name: 'ascending aortic')[0]
  end

  def self.transv
    Topic.where(name: 'transverse arch')[0]
  end

  def self.desc
    Topic.where(name: 'descending thoracic aorta')[0]
  end

  def self.supra
    Topic.where(name: 'suprarenal abdominal aorta')[0]
  end

  def self.infra
    Topic.where(name: 'infrarenal abdominal aorta')[0]
  end

  def self.annulus
    Topic.where(name: 'aortic annulus')[0]
  end

  def self.lvidd
    Topic.where(name: 'LVIDd')[0]
  end

  def self.lvids
    Topic.where(name: 'LVIDs')[0]
  end

  def self.mitral_regurge
    Topic.where(name: 'mitral regurgitation severity')[0]
  end

  def self.tricuspid_regurge
    Topic.where(name: 'tricuspid regurgitation severity')[0]
  end

  def self.mean_gradient
    Topic.where(name: 'mean gradient')[0]
  end

  def self.valve_area
    Topic.where(name: 'valve area')[0]
  end

  def self.ais
    Topic.where(name: 'aortic insufficiency severity')[0]
  end

  def self.avm
    Topic.where(name: 'aortic valve morphology')[0]
  end

  def self.mvm
    Topic.where(name: 'mitral valve morphology')[0]
  end

  def self.regurge
    Topic.where(name: 'regurgitation')[0]
  end

  def self.fs
    Topic.where(name: 'FS')[0]
  end

  def self.ef
    Topic.where(name: 'EF')[0]
  end

  def self.systol
    Topic.where(name: 'systolic function')[0]
  end

  def self.locations
    [root, asc, transv, desc, supra, infra, annulus, lvidd, lvids, mitral_regurge, tricuspid_regurge, mean_gradient, valve_area, ais, avm, mvm, regurge, fs, ef, systol]
  end
end
