pain_descriptors = [
  'burning',
  'aching',
  'stinging',
  'throbbing',
  'itching',
  'numbing',
  'pins and needles',
  'pulling',
  'sharp',
  'jabbing',
  'shooting',
  'electric',
  'mechanical',
  'thermal',
  'abrupt',
  'increasing',
  'decreasing',
  'with exercise',
  'with movement'
]
family_history = Topic.create!(
  name: 'family history',
  topic_type: 'root category'
)
Topic.create!(
  name: 'parent',
  topic_type: 'family member'
).move_to_child_of(family_history)
Topic.create!(
  name: 'sibling',
  topic_type: 'family member'
).move_to_child_of(family_history)
Topic.create!(
  name: 'child',
  topic_type: 'family member'
).move_to_child_of(family_history)
Topic.create!(
  name: 'grandparent',
  topic_type: 'family member'
).move_to_child_of(family_history)
Topic.create!(
  name: 'grandchild',
  topic_type: 'family member'
).move_to_child_of(family_history)
## END FAMILY HISTORY (xls 11) ##

## BEGIN LIFESTYLE ##
lifestyle = Topic.create!(
  name: 'lifestyle',
  topic_type: 'root category'
)
Topic.create!(
  name: 'tobacco',
  topic_type: 'measurement',
  units_of_measurement: %w[current past never]
).move_to_child_of(lifestyle)
Topic.create!(
  name: 'ETOH',
  topic_type: 'measurement',
  units_of_measurement: ['drinks per day']
).move_to_child_of(lifestyle)
Topic.create!(
  name: 'exercise',
  topic_type: 'measurement',
  units_of_measurement: %w[none mild moderate strenuous competitive]
).move_to_child_of(lifestyle)
## END LIFESTYLE ##

## BEGIN GENETICS (xls 13) ##
genetics = Topic.create!(
  name: 'genetics',
  topic_type: 'root category'
)
clinical_diagnosis = Topic.create!(
  name: 'clinical diagnosis',
  topic_type: 'genetic test'
).move_to_child_of(genetics)
mutation = Topic.create!(
  name: 'mutation',
  topic_type: 'genetic test'
).move_to_child_of(genetics)
fbn1 = Topic.create!(
  name: 'FBN1',
  topic_type: 'genetic test'
).move_to_child_of(mutation)
Topic.create!(
  name: 'TGFBR1',
  topic_type: 'genetic test'
).move_to_child_of(mutation)
Topic.create!(
  name: 'TGFBR2',
  topic_type: 'genetic test'
).move_to_child_of(mutation)
Topic.create!(
  name: 'SMAD3',
  topic_type: 'genetic test'
).move_to_child_of(mutation)
Topic.create!(
  name: 'TGFB2',
  topic_type: 'genetic test'
).move_to_child_of(mutation)
Topic.create!(
  name: 'ACTA2',
  topic_type: 'genetic test'
).move_to_child_of(mutation)
Topic.create!(
  name: 'PRKG1',
  topic_type: 'genetic test'
).move_to_child_of(mutation)
Topic.create!(
  name: 'MYH11',
  topic_type: 'genetic test'
).move_to_child_of(mutation)
Topic.create!(
  name: 'MYLK',
  topic_type: 'genetic test'
).move_to_child_of(mutation)
Topic.create!(
  name: 'FBLN4',
  topic_type: 'genetic test'
).move_to_child_of(mutation)
Topic.create!(
  name: 'COL3A1',
  topic_type: 'genetic test'
).move_to_child_of(mutation)
## END GENETICS (xls 28) ##

## BEGIN MEDICATIONS (xls 41) ##
meds = Topic.create!(
  name: 'medication',
  topic_type: 'root category'
)
triptans = Topic.create!(
  name: 'triptans',
  topic_type: 'medication'
).move_to_child_of(meds)
prophylaxis = Topic.create!(
  name: 'prophylaxis',
  topic_type: 'medication'
).move_to_child_of(meds)
antiepileptics = Topic.create!(
  name: 'antiepileptics',
  topic_type: 'medication'
).move_to_child_of(prophylaxis)
calcium_channel_blocker = Topic.create!(
  name: 'Ca-blockers',
  topic_type: 'medication'
).move_to_child_of(prophylaxis)
tricyclics = Topic.create!(
  name: 'tricyclics',
  topic_type: 'medication'
).move_to_child_of(prophylaxis)
beta_blockers = Topic.create!(
  name: 'beta-blockers',
  topic_type: 'medication'
).move_to_child_of(meds)
Topic.create!(
  name: 'atenolol',
  topic_type: 'medication'
).move_to_child_of(beta_blockers)
Topic.create!(
  name: 'metoprolol',
  topic_type: 'medication'
).move_to_child_of(beta_blockers)
Topic.create!(
  name: 'propranolol',
  topic_type: 'medication'
).move_to_child_of(beta_blockers)
other_beta = Topic.create!(
  name: 'other',
  topic_type: 'medication'
).move_to_child_of(beta_blockers)
Topic.create!(
  name: 'carvedilol',
  topic_type: 'medication'
).move_to_child_of(other_beta)
Topic.create!(
  name: 'betaxolol',
  topic_type: 'medication'
).move_to_child_of(other_beta)
Topic.create!(
  name: 'labetalol',
  topic_type: 'medication'
).move_to_child_of(other_beta)
arb = Topic.create!(
  name: 'ARB',
  topic_type: 'medication'
).move_to_child_of(meds)
Topic.create!(
  name: 'losartan',
  topic_type: 'medication'
).move_to_child_of(arb)
Topic.create!(
  name: 'valsartan',
  topic_type: 'medication'
).move_to_child_of(arb)
Topic.create!(
  name: 'irbesartan',
  topic_type: 'medication'
).move_to_child_of(arb)
Topic.create!(
  name: 'telmisartan',
  topic_type: 'medication'
).move_to_child_of(arb)
Topic.create!(
  name: 'candesartan',
  topic_type: 'medication'
).move_to_child_of(arb)
other_arb = Topic.create!(
  name: 'other',
  topic_type: 'medication'
).move_to_child_of(arb)
calcium_channel_blocker = Topic.create!(
  name: 'calcium channel blocker',
  topic_type: 'medication'
).move_to_child_of(meds)
Topic.create!(
  name: 'verapamil',
  topic_type: 'medication'
).move_to_child_of(calcium_channel_blocker)
Topic.create!(
  name: 'diltiazem',
  topic_type: 'medication'
).move_to_child_of(calcium_channel_blocker)
Topic.create!(
  name: 'amlodipine',
  topic_type: 'medication'
).move_to_child_of(calcium_channel_blocker)
Topic.create!(
  name: 'nifedipine',
  topic_type: 'medication'
).move_to_child_of(calcium_channel_blocker)
other_calcium_channel_blocker = Topic.create!(
  name: 'other',
  topic_type: 'medication'
).move_to_child_of(calcium_channel_blocker)
ace_inhibitor = Topic.create!(
  name: 'ACE-inhibitor',
  topic_type: 'medication'
).move_to_child_of(meds)
Topic.create!(
  name: 'lisinopril',
  topic_type: 'medication'
).move_to_child_of(ace_inhibitor)
Topic.create!(
  name: 'enalapril',
  topic_type: 'medication'
).move_to_child_of(ace_inhibitor)
Topic.create!(
  name: 'captopril',
  topic_type: 'medication'
).move_to_child_of(ace_inhibitor)
other_ace = Topic.create!(
  name: 'other',
  topic_type: 'medication'
).move_to_child_of(ace_inhibitor)
Topic.create!(
  name: 'accupril',
  topic_type: 'medication'
).move_to_child_of(other_ace)
Topic.create!(
  name: 'perindopril',
  topic_type: 'medication'
).move_to_child_of(other_ace)
Topic.create!(
  name: 'trandolapril',
  topic_type: 'medication'
).move_to_child_of(other_ace)
## END MEDICATIONS (xls 61)

## BEGIN VITALS (xls 63) ##
vitals = Topic.create!(
  name: 'vitals',
  topic_type: 'root category'
)
Topic.create!(
  name: 'weight',
  topic_type: 'vital',
  min_value: 0,
  max_value: 500,
  step: 0.1,
  units_of_measurement: %w[kg lb]
).move_to_child_of(vitals)
Topic.create!(
  name: 'height',
  topic_type: 'vital',
  min_value: 0,
  max_value: 250,
  step: 0.01,
  units_of_measurement: %w[m in]
).move_to_child_of(vitals)
Topic.create!(
  name: 'blood pressure',
  topic_type: 'vital',
  min_value: 0,
  max_value: 250,
  step: 1,
  units_of_measurement: %w[mmHg]
).move_to_child_of(vitals)
Topic.create!(
  name: 'heart rate',
  topic_type: 'vital',
  min_value: 10,
  max_value: 200,
  step: 1,
  units_of_measurement: %w[bpm]
).move_to_child_of(vitals)
Topic.create!(
  name: 'temperature',
  topic_type: 'vital',
  min_value: 0.0,
  max_value: 120.0,
  step: 0.1,
  units_of_measurement: %w[°C °F]
).move_to_child_of(vitals)
## END VITALS (xls 66) ##

## BEGIN MORPHOLOGY (xls 68) ##
morphology = Topic.create!(
  name: 'morphology/physical findings',
  topic_type: 'root category'
)
Topic.create!(
  name: 'arm span',
  topic_type: 'measurement',
  min_value: 0,
  max_value: 250,
  step: 0.01,
  units_of_measurement: %w[m in]
).move_to_child_of(morphology)
Topic.create!(
  name: 'lower segment',
  topic_type: 'measurement',
  min_value: 0,
  max_value: 250,
  step: 0.01,
  units_of_measurement: %w[m in]
).move_to_child_of(morphology)
Topic.create!(
  name: 'iridodenesis',
  topic_type: 'diagnosis'
).move_to_child_of(morphology)
Topic.create!(
  name: 'blue sclera',
  topic_type: 'diagnosis'
).move_to_child_of(morphology)
Topic.create!(
  name: 'sunken eyes',
  topic_type: 'diagnosis'
).move_to_child_of(morphology)
Topic.create!(
  name: 'hypertelorism',
  topic_type: 'diagnosis'
).move_to_child_of(morphology)
Topic.create!(
  name: 'dolichocephaly',
  topic_type: 'diagnosis'
).move_to_child_of(morphology)
Topic.create!(
  name: 'malar hypoplasia',
  topic_type: 'diagnosis'
).move_to_child_of(morphology)
Topic.create!(
  name: 'retrognathia',
  topic_type: 'diagnosis'
).move_to_child_of(morphology)
high_arched_palate = Topic.create!(
  name: 'high arched palate',
  topic_type: 'diagnosis',
  descriptors: ['palate spreader', 'no palate spreader']
).move_to_child_of(morphology)
narrow_palate = Topic.create!(
  name: 'narrow palate',
  topic_type: 'diagnosis',
  descriptors: ['repaired', 'not repaired']
).move_to_child_of(morphology)
cleft_palate = Topic.create!(
  name: 'cleft palate',
  topic_type: 'diagnosis',
  descriptors: ['repaired', 'not repaired']
).move_to_child_of(morphology)
Topic.create!(
  name: 'bifid uvula',
  topic_type: 'diagnosis'
).move_to_child_of(morphology)
Topic.create!(
  name: 'broad uvula',
  topic_type: 'diagnosis'
).move_to_child_of(morphology)
dental_crowding = Topic.create!(
  name: 'dental crowding',
  topic_type: 'diagnosis'
).move_to_child_of(morphology)
Topic.create!(
  name: 'orthodontia',
  topic_type: 'procedure'
).move_to_child_of(morphology)
Topic.create!(
  name: 'teeth extraction',
  topic_type: 'procedure'
).move_to_child_of(morphology)
Topic.create!(
  name: 'craniosynostosis',
  topic_type: 'diagnosis'
).move_to_child_of(morphology)

pe_morph = Topic.create!(
  name: 'pectus excavatum',
  topic_type: 'diagnosis'
).move_to_child_of(morphology)
pc_morph = Topic.create!(
  name: 'pectus carinatum',
  topic_type: 'diagnosis'
).move_to_child_of(morphology)
ap_morph = Topic.create!(
  name: 'asymmetric pectus',
  topic_type: 'diagnosis'
).move_to_child_of(morphology)
kypho = Topic.create!(
  name: 'lumbar kyphoscoliosis',
  topic_type: 'measurement',
  units_of_measurement: %w[degrees]
).move_to_child_of(morphology)
thoracic_kypho = Topic.create!(
  name: 'thoracic kyphoscoliosis',
  topic_type: 'diagnosis',
  units_of_measurement: %w[degrees]
).move_to_child_of(kypho)
Topic.create!(
  name: 'spondylolisthesis',
  topic_type: 'diagnosis'
).move_to_child_of(morphology)
Topic.create!(
  name: 'loss of lumbar lordosis',
  topic_type: 'diagnosis'
).move_to_child_of(morphology)

Topic.create!(
  name: 'thumb sign',
  topic_type: 'diagnosis'
).move_to_child_of(morphology)
Topic.create!(
  name: 'wrist sign',
  topic_type: 'diagnosis'
).move_to_child_of(morphology)
Topic.create!(
  name: 'small joint hypermobility',
  topic_type: 'diagnosis'
).move_to_child_of(morphology)
Topic.create!(
  name: 'arachnodactyly',
  topic_type: 'diagnosis'
).move_to_child_of(morphology)
Topic.create!(
  name: 'cubitus valgus',
  topic_type: 'diagnosis'
).move_to_child_of(morphology)
Topic.create!(
  name: 'elbow contracture',
  topic_type: 'diagnosis'
).move_to_child_of(morphology)
## END MORPHOLOGY (xls 123) ##

## BEGIN AORTIC MEASUREMENTS (xls 126) ##
cardio_meas = Topic.create!(
  name: 'aortic imaging',
  topic_type: 'root category'
)
Topic.create!(
  name: 'aortic root',
  topic_type: 'heart_measurement',
  min_value: 1.0,
  max_value: 7.0,
  step: 0.1,
  units_of_measurement: %w[cm]
).move_to_child_of(cardio_meas)
Topic.create!(
  name: 'ascending aortic',
  topic_type: 'heart_measurement',
  min_value: 1.0,
  max_value: 7.0,
  step: 0.1,
  units_of_measurement: %w[cm]
).move_to_child_of(cardio_meas)
Topic.create!(
  name: 'transverse arch',
  topic_type: 'heart_measurement',
  min_value: 1.0,
  max_value: 7.0,
  step: 0.1,
  units_of_measurement: %w[cm]
).move_to_child_of(cardio_meas)
Topic.create!(
  name: 'descending thoracic aorta',
  topic_type: 'heart_measurement',
  min_value: 1.0,
  max_value: 7.0,
  step: 0.1,
  units_of_measurement: %w[cm]
).move_to_child_of(cardio_meas)
Topic.create!(
  name: 'suprarenal abdominal aorta',
  topic_type: 'heart_measurement',
  min_value: 1.0,
  max_value: 7.0,
  step: 0.1,
  units_of_measurement: %w[cm]
).move_to_child_of(cardio_meas)
Topic.create!(
  name: 'infrarenal abdominal aorta',
  topic_type: 'heart_measurement',
  min_value: 1.0,
  max_value: 7.0,
  step: 0.1,
  units_of_measurement: %w[cm]
).move_to_child_of(cardio_meas)
Topic.create!(
  name: 'aortic annulus',
  topic_type: 'heart_measurement',
  min_value: 1.0,
  max_value: 7.0,
  step: 0.1,
  units_of_measurement: %w[cm]
).move_to_child_of(cardio_meas)
## END AORTA MEASUREMENTS (xls 132) ##

cardio = Topic.create!(
  name: 'cardiovascular',
  topic_type: 'root category'
)
## BEGIN 1-DEPTH TOPICS (xls 134) ##
Topic.create!(
  name: 'systolic function',
  topic_type: 'heart_measurement',
  units_of_measurement: %w[normal mild moderate severe]
).move_to_child_of(cardio_meas)
Topic.create!(
  name: 'LVIDd',
  topic_type: 'heart_measurement',
  min_value: 1.0,
  max_value: 10.0,
  step: 0.1,
  units_of_measurement: %w[cm],
  descriptors: %w[normal enlarged]
).move_to_child_of(cardio_meas)
Topic.create!(
  name: 'LVIDs',
  topic_type: 'heart_measurement',
  min_value: 1.0,
  max_value: 8.0,
  step: 0.1,
  units_of_measurement: %w[cm],
  descriptors: %w[normal enlarged]
).move_to_child_of(cardio_meas)
Topic.create!(
  name: 'EF',
  topic_type: 'heart_measurement',
  min_value: 20.0,
  max_value: 100.0,
  step: 1.0,
  units_of_measurement: %w[%],
  descriptors: %w[normal enlarged]
).move_to_child_of(cardio_meas)
Topic.create!(
  name: 'FS',
  topic_type: 'heart_measurement',
  min_value: 0.0,
  max_value: 100.0,
  step: 1.0,
  units_of_measurement: %w[%],
  descriptors: %w[normal enlarged]
).move_to_child_of(cardio_meas)
Topic.create!(
  name: 'mitral valve morphology',
  topic_type: 'heart_measurement',
  units_of_measurement: ['prolapse (anterior)', 'prolapse (posterior)', 'myxomatous']
).move_to_child_of(cardio_meas)
Topic.create!(
  name: 'mitral regurgitation severity',
  topic_type: 'heart_measurement',
  min_value: 0,
  max_value: 100,
  step: 1,
  units_of_measurement: %w[%]
).move_to_child_of(cardio_meas)
## END 1-DEPTH TOPICS (xls 140)##

## BEGIN SHALLOW TOPICS (xls 142) ##
aortic_valve_morph = Topic.create!(
  name: 'aortic valve morphology',
  topic_type: 'heart_measurement',
  units_of_measurement: %w[trileaflet bicuspid unicuspid Sievers-0 Sievers-1 Sievers-2]
).move_to_child_of(cardio)

Topic.create!(
  name: 'regurgitation',
  topic_type: 'heart_measurement',
  units_of_measurement: %w[none mild moderate severe]
).move_to_child_of(aortic_valve_morph)

aortic_stenosis = Topic.create!(
  name: 'aortic stenosis',
  topic_type: 'heart_measurement',
  units_of_measurement: %w[none mild moderate severe]
).move_to_child_of(cardio_meas)
Topic.create!(
  name: 'mean gradient',
  topic_type: 'heart_measurement',
  min_value: 20,
  max_value: 100,
  step: 1,
  units_of_measurement: %w[mmHg]
).move_to_child_of(aortic_stenosis)
Topic.create!(
  name: 'valve area',
  topic_type: 'heart_measurement',
  min_value: 0.5,
  max_value: 3.0,
  step: 0.1,
  units_of_measurement: %w[cm2]
).move_to_child_of(aortic_stenosis)

Topic.create!(
  name: 'aortic insufficiency severity',
  topic_type: 'heart_measurement',
  min_value: 0,
  max_value: 100,
  step: 1,
  units_of_measurement: %w[%]
).move_to_child_of(cardio_meas)
Topic.create!(
  name: 'tricuspid regurgitation severity',
  topic_type: 'heart_measurement',
  min_value: 0,
  max_value: 100,
  step: 1,
  units_of_measurement: %w[%]
).move_to_child_of(cardio_meas)
## END SHALLOW TOPICS (xls 147) %>

## BEGIN SHALLOW DISSECTIONS (xls 149) ##
# aortic_dissection = Topic.create!(
#   name: 'aortic dissection',
#   topic_type: 'diagnosis'
# ).move_to_child_of(cardio)
# Topic.create!(
#   name: 'aortic root',
#   topic_type: 'diagnosis'
# ).move_to_child_of(aortic_dissection)
# Topic.create!(
#   name: 'ascending aorta',
#   topic_type: 'diagnosis'
# ).move_to_child_of(aortic_dissection)
# Topic.create!(
#   name: 'arch',
#   topic_type: 'diagnosis'
# ).move_to_child_of(aortic_dissection)
# Topic.create!(
#   name: 'descending thoracic',
#   topic_type: 'diagnosis'
# ).move_to_child_of(aortic_dissection)
# Topic.create!(
#   name: 'suprarenal abdominal',
#   topic_type: 'diagnosis'
# ).move_to_child_of(aortic_dissection)
# Topic.create!(
#   name: 'infrarenal abdominal',
#   topic_type: 'diagnosis'
# ).move_to_child_of(aortic_dissection)
# ## END SHALLOW DISSECTIONS (xls 154) ##
#
# iliac = Topic.create!(
#   name: 'iliac',
#   topic_type: 'diagnosis'
# ).move_to_child_of(aortic_dissection)
#
# Topic.create!(
#   name: 'right',
#   topic_type: 'diagnosis'
# ).move_to_child_of(iliac)
#
# Topic.create!(
#   name: 'left',
#   topic_type: 'diagnosis'
# ).move_to_child_of(iliac)
#
# renal = Topic.create!(
#   name: 'renal',
#   topic_type: 'diagnosis'
# ).move_to_child_of(aortic_dissection)
#
# Topic.create!(
#   name: 'right',
#   topic_type: 'diagnosis'
# ).move_to_child_of(renal)
#
# Topic.create!(
#   name: 'left',
#   topic_type: 'diagnosis'
# ).move_to_child_of(renal)
#
# ## BEGIN SMA DISSECTION (xls 161) ##
# sma = Topic.create!(
#   name: 'SMA',
#   topic_type: 'diagnosis'
# ).move_to_child_of(aortic_dissection)
#
# celiac = Topic.create!(
#   name: 'celiac',
#   topic_type: 'diagnosis'
# ).move_to_child_of(aortic_dissection)
#
# innominate = Topic.create!(
#   name: 'innominate',
#   topic_type: 'diagnosis'
# ).move_to_child_of(aortic_dissection)
#
#
# left_carotid = Topic.create!(
#   name: 'left carotid',
#   topic_type: 'diagnosis'
# ).move_to_child_of(aortic_dissection)
#
# left_subclavian = Topic.create!(
#   name: 'left subclavian',
#   topic_type: 'diagnosis'
# ).move_to_child_of(aortic_dissection)
dissection = Topic.create!(
  name: 'dissection',
  topic_type: 'dissection'
).move_to_child_of(cardio)
## BEGIN ROOT REPLACEMENT (xls 177) ##
aortic_surgery = Topic.create!(
  name: 'aortic surgery',
  topic_type: 'procedure'
).move_to_child_of(cardio)
root_replacement = Topic.create!(
  name: 'root replacement',
  topic_type: 'procedure'
).move_to_child_of(aortic_surgery)
cvg = Topic.create!(
  name: 'CVG',
  topic_type: 'procedure',
  descriptors: ['mechanical prosthesis', 'bioprosthesis']
).move_to_child_of(root_replacement)
valve_sparing = Topic.create!(
  name: 'valve sparing',
  topic_type: 'procedure',
  descriptors: ['Tirone-David', 'TD-V Smod', 'Valsalva Graft', 'Yacoub']
).move_to_child_of(root_replacement)
Topic.create!(
  name: 'supracoronary',
  topic_type: 'procedure'
).move_to_child_of(root_replacement)
Topic.create!(
  name: 'honograft',
  topic_type: 'procedure'
).move_to_child_of(root_replacement)
Topic.create!(
  name: 'freestyle prosthesis',
  topic_type: 'procedure'
).move_to_child_of(root_replacement)
## END ROOT REPLACEMENT (xls 184) ##

## BEGIN ASCENDING REPLACEMENT (xls 185) ##
asc_repl = Topic.create!(
  name: 'ascending replacement',
  topic_type: 'procedure',
  descriptors: ['clamped', 'open distal anstomosis']
).move_to_child_of(aortic_surgery)
Topic.create!(
  name: 'clamped',
  topic_type: 'procedure'
).move_to_child_of(asc_repl)
Topic.create!(
  name: 'open distal anstomosis',
  topic_type: 'procedure'
).move_to_child_of(asc_repl)
## END ASCENDING REPLACEMENT (xls 186) ##

## BEGIN ARCH REPLACEMENT (xls 187) ##
arch_repl = Topic.create!(
  name: 'arch replacement',
  topic_type: 'procedure'
).move_to_child_of(aortic_surgery)
## END ARCH REPLACEMENT (xls 189) ##

## BEGIN SHALLOW REPLACEMENTS (xls 187) ##
Topic.create!(
  name: 'descending thoracic aorta replacement',
  topic_type: 'procedure'
).move_to_child_of(aortic_surgery)
Topic.create!(
  name: 'suprarenal aorta replacement',
  topic_type: 'procedure'
).move_to_child_of(aortic_surgery)
Topic.create!(
  name: 'infrarenal aorta replacement',
  topic_type: 'procedure'
).move_to_child_of(aortic_surgery)
## END SHALLOW REPLACEMENTS (xls 189) ##


## BEGIN STENT GRAFT (xls 194) ##
Topic.create!(
  name: 'stent graft',
  topic_type: 'procedure',
  descriptors: ['thoracic', 'endoleak', 'suprarenal', 'infrarenal', 'right iliac', 'left iliac', 'right subclavian', 'left sublcavian']
).move_to_child_of(cardio)
## END STENT GRAFT (xls 200) ##

## BEGIN MITRAL VALVE SURGERY (xls 202) ##
mitral_valve_surgery = Topic.create!(
  name: 'mitral valve surgery',
  topic_type: 'procedure'
).move_to_child_of(cardio)
mitral_valve_repair = Topic.create!(
  name: 'mitral valve repair',
  topic_type: 'procedure',
  descriptors: ['ring only', 'leaflet repair']
).move_to_child_of(mitral_valve_surgery)
mitral_valve_replacement = Topic.create!(
  name: 'mitral valve replacement',
  topic_type: 'procedure',
  descriptors: ['mechanical prosthesis', 'bioprosthetic']
).move_to_child_of(mitral_valve_surgery)
## END MITRAL VALVE SURGERY (xls 205) ##

Topic.create!(
  name: 'arrhythmia',
  topic_type: 'diagnosis',
  descriptors: ['PVC', 'PAC', 'afib/aflutter', 'VT/VF', 'sudden death', 'AICD']
).move_to_child_of(cardio)

## BEGIN VARICOSE VEINS (xls 214) ##
legs = Topic.create!(
  name: 'legs',
  topic_type: 'middle'
).move_to_child_of(cardio)
varicose = Topic.create!(
  name: 'varicose veins',
  topic_type: 'diagnosis'
).move_to_child_of(legs)
Topic.create!(
  name: 'edema',
  topic_type: 'diagnosis'
).move_to_child_of(legs)
Topic.create!(
  name: 'sclerotherapy/stripping',
  topic_type: 'procedure'
).move_to_child_of(legs)
## END VARICOSE VEINS (xls 215) ##


## BEGIN CORONARY DISEASE (xls 217) ##
coronary_disease = Topic.create!(
  name: 'coronary disease',
  topic_type: 'diagnosis'
).move_to_child_of(cardio)
Topic.create!(
  name: 'angina',
  topic_type: 'diagnosis'
).move_to_child_of(coronary_disease)
Topic.create!(
  name: 'myocardial infarction',
  topic_type: 'diagnosis'
).move_to_child_of(coronary_disease)
Topic.create!(
  name: 'angioplasty/stent',
  topic_type: 'procedure'
).move_to_child_of(coronary_disease)
Topic.create!(
  name: 'CABG',
  topic_type: 'procedure'
).move_to_child_of(coronary_disease)
## END CORONARY DISEASE (xls 220) ##


## BEGIN SYMPTOMS (xls 222) ##
symptoms = Topic.create!(
  name: 'symptoms',
  topic_type: 'diagnosis'
).move_to_child_of(cardio)
Topic.create!(
  name: 'chest pain',
  topic_type: 'diagnosis',
  descriptors: pain_descriptors
).move_to_child_of(symptoms)
Topic.create!(
  name: 'dyspnea on exertion',
  topic_type: 'diagnosis'
).move_to_child_of(symptoms)
Topic.create!(
  name: 'palpitations',
  topic_type: 'diagnosis',
  descriptors: ['lightheaded', 'shortness of breath', 'syncope', 'skipped beats', 'strong beats', 'heart racing', 'extra beats', 'constant', 'fainting']
).move_to_child_of(symptoms)
Topic.create!(
  name: 'lightheadedness',
  topic_type: 'diagnosis'
).move_to_child_of(symptoms)
Topic.create!(
  name: 'edema',
  topic_type: 'diagnosis',
  descriptors: ['at night', 'left leg', 'right leg', 'left arm', 'right arm', 'face', 'better in AM', 'provoked by salt', 'provoked by dependence']
).move_to_child_of(symptoms)
## END SYMPTOMS (xls 226) ##

## BEGIN SHALLOW PULMONARY (xls 228) ##
pulmonary = Topic.create!(
  name: 'pulmonary',
  topic_type: 'root category'
)
Topic.create!(
  name: 'shortness of breath',
  topic_type: 'diagnosis',
  descriptors: ['at rest', 'walking', 'running', 'up stairs', 'fainting', 'cough', 'wheezing']
).move_to_child_of(pulmonary)
Topic.create!(
  name: 'emphysema',
  topic_type: 'diagnosis'
).move_to_child_of(pulmonary)
Topic.create!(
  name: 'CT/CXR',
  topic_type: 'measurement',
  units_of_measurement: %w[cm]
).move_to_child_of(pulmonary)
Topic.create!(
  name: 'TLC',
  topic_type: 'measurement',
  units_of_measurement: %w[cm]
).move_to_child_of(pulmonary)
Topic.create!(
  name: 'PFT',
  topic_type: 'measurement',
  units_of_measurement: %w[cm]
).move_to_child_of(pulmonary)
Topic.create!(
  name: 'FEV1',
  topic_type: 'measurement',
  units_of_measurement: %w[cm]
).move_to_child_of(pulmonary)
Topic.create!(
  name: 'restrictive lung disease',
  topic_type: 'diagnosis'
).move_to_child_of(pulmonary)
Topic.create!(
  name: 'asthma',
  topic_type: 'diagnosis'
).move_to_child_of(pulmonary)
Topic.create!(
  name: 'bronchodilator response',
  topic_type: 'measurement',
  units_of_measurement: %w[cm]
).move_to_child_of(pulmonary)
## END SHALLOW PULMONARY (xls 233) ##

## BEGIN PNEUMOTHORAX (xls 234)##
pneumothorax = Topic.create!(
  name: 'pneumothorax',
  topic_type: 'procedure',
  descriptors: ['chest tube', 'pleurodesis', 'VATS']
).move_to_child_of(pulmonary)
Topic.create!(
  name: 'blebs',
  topic_type: 'diagnosis'
).move_to_child_of(pneumothorax)
## END PNEUMOTHORAX (xls 237) ##

## BEGIN SHALLOW PULMONARY LAST (xls 238) ##
sleep_apnea = Topic.create!(
  name: 'sleep apnea',
  topic_type: 'diagnosis'
).move_to_child_of(pulmonary)
Topic.create!(
  name: 'CPAP',
  topic_type: 'medication'
).move_to_child_of(pulmonary)
Topic.create!(
  name: 'bronchodilators',
  topic_type: 'medication'
).move_to_child_of(pulmonary)
Topic.create!(
  name: 'inhaled steroids',
  topic_type: 'medication'
).move_to_child_of(pulmonary)
Topic.create!(
  name: 'systemic steroids',
  topic_type: 'medication'
).move_to_child_of(pulmonary)
## END SHALLOW PULMONARY LAST (xls 243) ##

## BEGIN ORTHOPEDIC BACK (xls 245) ##
ortho = Topic.create!(
  name: 'orthopedic',
  topic_type: 'root category'
)
back = Topic.create!(
  name: 'back',
  topic_type: 'middle'
).move_to_child_of(ortho)
scolio = Topic.create!(
  name: 'scoliosis',
  topic_type: 'middle'
).move_to_child_of(back)
Topic.create!(
  name: 'spondylolisthesis',
  topic_type: 'diagnosis'
).move_to_child_of(back)
Topic.create!(
  name: 'thoracic scoliosis',
  topic_type: 'diagnosis'
).move_to_child_of(scolio)
Topic.create!(
  name: 'lumbar scoliosis',
  topic_type: 'diagnosis'
).move_to_child_of(scolio)
bracing = Topic.create!(
  name: 'bracing',
  topic_type: 'procedure'
).move_to_child_of(back)
harr = Topic.create!(
  name: 'Harrington Rods',
  topic_type: 'procedure'
).move_to_child_of(back)
physio = Topic.create!(
  name: 'physical therapy',
  topic_type: 'procedure'
).move_to_child_of(back)
fusion = Topic.create!(
  name: 'fusion',
  topic_type: 'procedure'
).move_to_child_of(back)
## END ORTHOPEDIC BACK (xls 253) ##

## BEGIN PECTUS (xls 254) ##
pectus = Topic.create!(
  name: 'pectus',
  topic_type: 'middle'
).move_to_child_of(ortho)
Topic.create!(
  name: 'pectus excavatum',
  topic_type: 'diagnosis'
).move_to_child_of(pectus)
Topic.create!(
  name: 'pectus carinatum',
  topic_type: 'diagnosis'
).move_to_child_of(pectus)
Topic.create!(
  name: 'asymmetric pectus',
  topic_type: 'diagnosis'
).move_to_child_of(pectus)
ravitch = Topic.create!(
  name: 'Ravitch procedure',
  topic_type: 'procedure'
).move_to_child_of(ortho)
nuss = Topic.create!(
  name: 'Nuss Bar',
  topic_type: 'procedure'
).move_to_child_of(ortho)
## END PECTUS (xls 256) ##

## BEGIN SHALLOW ORTHOPEDIC (xls 258) ##
hip = Topic.create!(
  name: 'hip',
  topic_type: 'diagnosis'
).move_to_child_of(ortho)
Topic.create!(
  name: 'protrusio acetabulae',
  topic_type: 'diagnosis'
).move_to_child_of(hip)
Topic.create!(
  name: 'hip replacement',
  topic_type: 'procedure'
).move_to_child_of(hip)

foot = Topic.create!(
  name: 'foot',
  topic_type: 'diagnosis'
).move_to_child_of(ortho)
pes_planus = Topic.create!(
  name: 'pes planus',
  topic_type: 'diagnosis'
).move_to_child_of(foot)
Topic.create!(
  name: 'orthotics',
  topic_type: 'medication'
).move_to_child_of(pes_planus)
hind_foot = Topic.create!(
  name: 'hind foot deformity',
  topic_type: 'diagnosis'
).move_to_child_of(foot)
Topic.create!(
  name: 'fusion',
  topic_type: 'procedure'
).move_to_child_of(hind_foot)
hammer_toes = Topic.create!(
  name: 'hammer toes',
  topic_type: 'diagnosis'
).move_to_child_of(foot)
Topic.create!(
  name: 'release',
  topic_type: 'procedure'
).move_to_child_of(hammer_toes)
## END SHALLOW ORTHOPEDIC (xls 263) ##

## BEGIN OSTEOPEROSIS (xls 265) ##
osteoporosis = Topic.create!(
  name: 'osteoporosis',
  topic_type: 'diagnosis'
).move_to_child_of(ortho)
Topic.create!(
  name: 'bone mineral density',
  topic_type: 'measurement',
  units_of_measurement: %w[Z-Score T-Score]
).move_to_child_of(osteoporosis)
Topic.create!(
  name: 'compression fractures',
  topic_type: 'diagnosis'
).move_to_child_of(osteoporosis)
Topic.create!(
  name: 'hip fractures',
  topic_type: 'diagnosis'
).move_to_child_of(osteoporosis)
Topic.create!(
  name: 'wrist fractures',
  topic_type: 'diagnosis'
).move_to_child_of(osteoporosis)
osteo_treatment = Topic.create!(
  name: 'treatment',
  topic_type: 'medication'
).move_to_child_of(osteoporosis)
Topic.create!(
  name: 'calcium',
  topic_type: 'medication'
).move_to_child_of(osteo_treatment)
Topic.create!(
  name: 'vitamin D',
  topic_type: 'medication'
).move_to_child_of(osteo_treatment)
Topic.create!(
  name: 'biophosphonates',
  topic_type: 'medication'
).move_to_child_of(osteo_treatment)
Topic.create!(
  name: 'calcitonin',
  topic_type: 'medication'
).move_to_child_of(osteo_treatment)
Topic.create!(
  name: 'estrogen/analogue',
  topic_type: 'medication'
).move_to_child_of(osteo_treatment)
Topic.create!(
  name: 'forteo',
  topic_type: 'medication'
).move_to_child_of(osteo_treatment)
## END OSTEOPEROSIS (xls 274) ##

## BEGIN SYMPTOMS (xls 276) ##
ortho_symptoms = Topic.create!(
  name: 'symptoms',
  topic_type: 'diagnosis'
).move_to_child_of(ortho)
ortho_pain = Topic.create!(
  name: 'pain',
  topic_type: 'middle'
).move_to_child_of(ortho_symptoms)
Topic.create!(
  name: 'upper back pain ',
  topic_type: 'diagnosis',
  descriptors: pain_descriptors
).move_to_child_of(ortho_pain)
Topic.create!(
  name: 'lower back pain',
  topic_type: 'diagnosis',
  descriptors: pain_descriptors
).move_to_child_of(ortho_pain)
Topic.create!(
  name: 'hip',
  topic_type: 'diagnosis',
  descriptors: ['osteoarthritis', 'deep socket', 'dysplasia']
).move_to_child_of(ortho_pain)
Topic.create!(
  name: 'knee',
  topic_type: 'diagnosis',
  descriptors: ['osteoarthritis', 'patellar instability', 'dysplasia', 'subluxation']
).move_to_child_of(ortho_pain)
Topic.create!(
  name: 'ankle',
  topic_type: 'diagnosis',
  descriptors: %w[osteoarthritis dislocation subluxation instability]
).move_to_child_of(ortho_pain)
Topic.create!(
  name: 'foot',
  topic_type: 'diagnosis',
  descriptors: %w[osteoarthritis dislocation subluxation instability]
).move_to_child_of(ortho_pain)
Topic.create!(
  name: 'sciataca',
  topic_type: 'diagnosis'
).move_to_child_of(ortho_symptoms)
Topic.create!(
  name: 'activity limitation',
  topic_type: 'diagnosis'
).move_to_child_of(ortho_symptoms)
## END SYMPTOMS (xls 283) ##

## BEGIN OPHTHALMOLOGIC (xls 285) ##
ophthalmo = Topic.create!(
  name: 'ophthalmologic',
  topic_type: 'root category'
)
phak = Topic.create!(
  name: 'phakectomy',
  topic_type: 'procedure',
  descriptors: %w[left right both]
).move_to_child_of(ophthalmo)
iol = Topic.create!(
  name: 'IOL',
  topic_type: 'procedure',
  descriptors: %w[left right both]
).move_to_child_of(ophthalmo)
irido = Topic.create!(
  name: 'iridodensis',
  topic_type: 'measurement',
  units_of_measurement: %w[mm],
  descriptors: %w[left right both]
).move_to_child_of(ophthalmo)
myopia = Topic.create!(
  name: 'myopia',
  topic_type: 'measurement',
  units_of_measurement: %w[diopters],
  descriptors: %w[left right both]
).move_to_child_of(ophthalmo)
Topic.create!(
  name: 'globe length',
  topic_type: 'measurement',
  units_of_measurement: %w[mm]
).move_to_child_of(myopia)
Topic.create!(
  name: 'amblyopia',
  topic_type: 'diagnosis',
  descriptors: %w[left right both]
).move_to_child_of(ophthalmo)
ectopia_lentis = Topic.create!(
  name: 'ectopia lentis',
  topic_type: 'diagnosis',
  descriptors: %w[left right both]
).move_to_child_of(ophthalmo)
cataract = Topic.create!(
  name: 'cataract',
  topic_type: 'diagnosis',
  descriptors: %w[left right both]
).move_to_child_of(ophthalmo)
Topic.create!(
  name: 'glaucoma',
  topic_type: 'diagnosis',
  descriptors: %w[left right both]
).move_to_child_of(ophthalmo)
Topic.create!(
  name: 'retinal thinning/holes',
  topic_type: 'diagnosis',
  descriptors: %w[left right both]
).move_to_child_of(ophthalmo)
retinal_detachment = Topic.create!(
  name: 'retinal detachment',
  topic_type: 'diagnosis',
  descriptors: %w[buckle laser]
).move_to_child_of(ophthalmo)
## END OPHTHALMOLOGIC (xls 297) ##

## BEGIN GYNECOLOGIC/UROLOGIC (xls 299) ##
gyno = Topic.create!(
  name: 'gynecologic/urologic',
  topic_type: 'root category'
)
Topic.create!(
  name: 'pelvic floor weakness',
  topic_type: 'diagnosis',
  descriptors: ['Kegel exercises']
).move_to_child_of(gyno)
Topic.create!(
  name: 'bladder prolapse',
  topic_type: 'diagnosis'
).move_to_child_of(gyno)
Topic.create!(
  name: 'uterine prolapse',
  topic_type: 'diagnosis'
).move_to_child_of(gyno)
## END GYNECOLOGIC/UROLOGIC (xls 302) ##

## BEGIN OBSTETRIC (xls 304) ##
pregnancy = Topic.create!(
  name: 'obstetric (pregnancy)',
  topic_type: 'root category'
)
preg_method = Topic.create!(
  name: 'method',
  topic_type: 'procedure'
).move_to_child_of(pregnancy)
Topic.create!(
  name: 'spontaneous',
  topic_type: 'diagnosis'
).move_to_child_of(preg_method)
Topic.create!(
  name: 'IVF',
  topic_type: 'diagnosis'
).move_to_child_of(preg_method)
Topic.create!(
  name: 'PGD',
  topic_type: 'diagnosis'
).move_to_child_of(preg_method)
Topic.create!(
  name: 'surrogate',
  topic_type: 'diagnosis'
).move_to_child_of(preg_method)

preg_outcome = Topic.create!(
  name: 'outcome',
  topic_type: 'diagnosis'
).move_to_child_of(pregnancy)
Topic.create!(
  name: 'term',
  topic_type: 'diagnosis'
).move_to_child_of(preg_outcome)
Topic.create!(
  name: 'premature',
  topic_type: 'diagnosis'
).move_to_child_of(preg_outcome)
abortion = Topic.create!(
  name: 'abortion',
  topic_type: 'procedure'
).move_to_child_of(preg_outcome)
Topic.create!(
  name: 'spontaneous',
  topic_type: 'diagnosis'
).move_to_child_of(abortion)
Topic.create!(
  name: 'therapeutic',
  topic_type: 'diagnosis'
).move_to_child_of(abortion)
preg_delivery = Topic.create!(
  name: 'delivery',
  topic_type: 'procedure'
).move_to_child_of(pregnancy)
vaginal = Topic.create!(
  name: 'vaginal',
  topic_type: 'procedure'
).move_to_child_of(preg_delivery)
Topic.create!(
  name: 'assisted',
  topic_type: 'procedure'
).move_to_child_of(vaginal)
Topic.create!(
  name: 'induced - Pitocin',
  topic_type: 'procedure'
).move_to_child_of(vaginal)
Topic.create!(
  name: 'Caesarean',
  topic_type: 'procedure'
).move_to_child_of(preg_delivery)
preg_anesthesia = Topic.create!(
  name: 'anesthesia',
  topic_type: 'medication'
).move_to_child_of(pregnancy)
Topic.create!(
  name: 'epidural',
  topic_type: 'medication',
).move_to_child_of(preg_anesthesia)
Topic.create!(
  name: 'general',
  topic_type: 'medication',
).move_to_child_of(preg_anesthesia)
Topic.create!(
  name: 'none',
  topic_type: 'medication',
).move_to_child_of(preg_anesthesia)

preg_diagnosiss = Topic.create!(
  name: 'diagnosis',
  topic_type: 'medication'
).move_to_child_of(pregnancy)
Topic.create!(
  name: 'uterine rupture',
  topic_type: 'diagnosis',
).move_to_child_of(preg_diagnosiss)
Topic.create!(
  name: 'bleeding',
  topic_type: 'diagnosis',
).move_to_child_of(preg_diagnosiss)
Topic.create!(
  name: 'laceration',
  topic_type: 'diagnosis',
).move_to_child_of(preg_diagnosiss)
Topic.create!(
  name: 'lactation',
  topic_type: 'diagnosis'
).move_to_child_of(pregnancy)
## END OBSTETRIC (xls 304) ##

## BEGIN NEUROLOGIC MIGRAINES (xls 326) ##
neuro = Topic.create!(
  name: 'neurologic',
  topic_type: 'root category'
)
headache = Topic.create!(
  name: 'headache',
  topic_type: 'diagnosis'
).move_to_child_of(neuro)
common_migraine = Topic.create!(
  name: 'common migraine',
  topic_type: 'diagnosis'
).move_to_child_of(headache)
classic_migraine = Topic.create!(
  name: 'classic migraine',
  topic_type: 'diagnosis'
).move_to_child_of(neuro)

complex_migraine = Topic.create!(
  name: 'complex migraine',
  topic_type: 'diagnosis'
).move_to_child_of(neuro)
## END NEUROLOGIC MIGRAINES (xls 329) ##

## BEGIN NEUROLOGIC LOW ICP (xls 330) ##
low_icp = Topic.create!(
  name: 'low ICP',
  topic_type: 'diagnosis'
).move_to_child_of(headache)
chiari = Topic.create!(
  name: 'Chiari malformation',
  topic_type: 'diagnosis'
).move_to_child_of(low_icp)
Topic.create!(
  name: 'MRI for Chiari Malformation',
  topic_type: 'measurement',
  units_of_measurement: %w[I II III IV]
).move_to_child_of(neuro)
dural_ectasia = Topic.create!(
  name: 'dural ectasia',
  topic_type: 'diagnosis',
  descriptors: %w[chronic acute]
).move_to_child_of(low_icp)
Topic.create!(
  name: 'MRI for dural ectasia',
  topic_type: 'measurement',
  units_of_measurement: ['scalloping', 'dural sac ratio', 'nerve root sleeve diameter', 'sagittal dural sac width']
).move_to_child_of(neuro)
blood_patch = Topic.create!(
  name: 'blood patch',
  topic_type: 'procedure'
).move_to_child_of(dural_ectasia)
fibrin = Topic.create!(
  name: 'fibrin glue',
  topic_type: 'procedure'
).move_to_child_of(dural_ectasia)
## END NEUROLOGIC LOW ICP (xls 333) ##

## BEGIN NEUROLOGIC SHALLOW (xls 335) ##
Topic.create!(
  name: 'peripheral neuropathy',
  topic_type: 'diagnosis'
).move_to_child_of(neuro)
Topic.create!(
  name: 'intracranial aneurysm',
  topic_type: 'diagnosis'
).move_to_child_of(neuro)
Topic.create!(
  name: 'carotid dissection',
  topic_type: 'diagnosis'
).move_to_child_of(neuro)
Topic.create!(
  name: 'vertebral artery dissection',
  topic_type: 'diagnosis'
).move_to_child_of(neuro)
Topic.create!(
  name: 'cervical vascular tortuosity',
  topic_type: 'diagnosis'
).move_to_child_of(neuro)
## END NEUROLOGIC SHALLOW (xls 341) ##

## BEGIN GASTROINTESTINAL (xls 343) ##
gastrointestinal = Topic.create!(
  name: 'gastrointestinal',
  topic_type: 'root category'
)
Topic.create!(
  name: 'ulcerative colitis',
  topic_type: 'diagnosis'
).move_to_child_of(gastrointestinal)
Topic.create!(
  name: 'eosinophilic esophagitis',
  topic_type: 'diagnosis'
).move_to_child_of(gastrointestinal)
Topic.create!(
  name: 'diaphragmattic hernia',
  topic_type: 'diagnosis'
).move_to_child_of(gastrointestinal)
Topic.create!(
  name: 'intestinal rupture',
  topic_type: 'diagnosis'
).move_to_child_of(gastrointestinal)
## END GASTROINTESTINAL (xls 348) ##

## RELATED TOPICS
dural_ectasia.update(
  related: [
    blood_patch.id,
    fibrin.id,
    headache.id
  ]
)
dissection.update(related: [root_replacement.id])
classic_migraine.update(
  related: [
    triptans.id,
    antiepileptics.id,
    calcium_channel_blocker.id,
    tricyclics.id
  ]
)
complex_migraine.update(
  related: [
    triptans.id,
    antiepileptics.id,
    calcium_channel_blocker.id,
    tricyclics.id
  ]
)
common_migraine.update(
  related: [
    triptans.id,
    antiepileptics.id,
    calcium_channel_blocker.id,
    tricyclics.id
  ]
)
cataract.update(
  related: [
    phak.id,
    iol.id
  ]
)
ectopia_lentis.update(
  related: [
    phak.id,
    iol.id,
    irido.id
  ]
)
kypho.update(
  related: [
    fusion.id,
    harr.id,
    bracing.id,
    physio.id
  ]
)
thoracic_kypho.update(
  related: [
    fusion.id,
    harr.id,
    bracing.id,
    physio.id
  ]
)
pc_morph.update(
  related: [
    ravitch.id,
    nuss.id
  ]
)
pe_morph.update(
  related: [
    ravitch.id,
    nuss.id
  ]
)
ap_morph.update(
  related: [
    ravitch.id,
    nuss.id
  ]
)
Topic.all.each do |topic|
  parents = topic.ancestors.reject { |t| t.topic_type == 'root category' }.map(&:id)
  aunts = topic.aunts.map(&:id)
  fam = (parents + aunts).uniq
  if topic.related
    topic.related += fam
    topic.related_will_change!
  else
    topic.update(related: fam)
  end
end

puts "#{Topic.count} topics seeded."
