ADMINISTRATION_METHODS = ['orally', 'intravenously', 'intramuscularly', 'subcutaneously', 'sublingually', 'buccally', 'rectally', 'vaginally', 'by the ocular route', 'by the otic route', 'nasally', 'by nebulization', 'cutaneously', 'transdermally', 'intrathecally'].freeze
DOSAGE_FORMS = ['tablet', 'capsule', 'pill', 'liquid solution', 'inhaler', 'cream', 'drops', 'suppository'].freeze

TIME_SCALES = %w[seconds minutes hours days weeks months years].freeze

FREQUENCY_SCALES = ['day', 'hour', 'week', 'month', 'year', 'as needed'].freeze

DURATION_SCALES = TIME_SCALES

DOSE_UNITS_OF_MEASUREMENT = %w[mcg mg mL mm g L IU].freeze

REASONS_FOR_VISIT = {
  'Cardiovascular': {},
  'Pulmonary': [],
  'Opthamologic': {},
  'Gynecologic': {},
  'Obstetric': {},
  'Neurologic': {},
  'Gastrointestinal': {}
}.freeze

CAUSES_OF_DEATH = ['', 'aortic dissection', 'heart attack', 'stroke', 'cancer', 'old age', 'Alzheimer\'s', 'dementia'].freeze
