Patient.create!(
  first_name: "Antoine",
  middle_name: "Louis",
  last_name: "Marfan",
  address_line_1: "22 Cours de Republique",
  city: "Paris",
  state: "TX",
  country: "USA",
  postal_code: 75460,
  sex: "M",
  date_of_birth: DateTime.new(1858,7,5),
  deceased: false,
  phone_1: 3333333333,
  email: "antoine@marfan.org"
)
Clinician.create!(
  first_name: "David",
  last_name: "Liang",
  practice_name: "The Stanford University Center for Marfan Syndrome and Aortic Disorders",
  address_line_1: "Stanford University Medical Center Cardiology Clinic, 2nd Floor of Main Hospital",
  address_line_2: "300 Pasteur Drive",
  address_line_3: "H2157",
  city: "Stanford",
  state: "CA",
  country: "USA",
  postal_code: 94305
)
## BEGIN FAMILY HISTORY (xls 6) ##
family_history = Topic.create!(
  name: "family history",
  topic_type: "root category"
)
Topic.create!(
  name: "parent",
  topic_type: "family member"
).move_to_child_of(family_history)
Topic.create!(
  name: "sibling",
  topic_type: "family member"
).move_to_child_of(family_history)
Topic.create!(
  name: "child",
  topic_type: "family member"
).move_to_child_of(family_history)
Topic.create!(
  name: "grandparent",
  topic_type: "family member"
).move_to_child_of(family_history)
Topic.create!(
  name: "grandchild",
  topic_type: "family member"
).move_to_child_of(family_history)
## END FAMILY HISTORY (xls 11) ##

## BEGIN LIFESTYLE ##
lifestyle = Topic.create!(
  name: "lifestyle",
  topic_type: "root category"
)
Topic.create!(
  name: "tobacco",
  topic_type: "stat"
).move_to_child_of(lifestyle)
Topic.create!(
  name: "ETOH",
  topic_type: "stat"
).move_to_child_of(lifestyle)
Topic.create!(
  name: "exercise",
  topic_type: "stat"
).move_to_child_of(lifestyle)
## END LIFESTYLE ##

## BEGIN GENETICS (xls 13) ##
genetics = Topic.create!(
  name: "genetics",
  topic_type: "root category"
)
clinical_diagnosis = Topic.create!(
  name: "clinical diagnosis",
  topic_type: "complication"
).move_to_child_of(genetics)
mutation = Topic.create!(
  name: "mutation",
  topic_type: "diagnosis"
).move_to_child_of(genetics)
fbn1 = Topic.create!(
  name: "FBN1",
  topic_type: "diagnosis"
).move_to_child_of(genetics)
Topic.create!(
  name: "pathogenic",
  topic_type: "diagnosis"
).move_to_child_of(fbn1)
Topic.create!(
  name: "VUS",
  topic_type: "diagnosis"
).move_to_child_of(fbn1)
Topic.create!(
  name: "benign",
  topic_type: "diagnosis"
).move_to_child_of(fbn1)
tgfbr1 = Topic.create!(
  name: "TGFBR1",
  topic_type: "diagnosis"
).move_to_child_of(genetics)
Topic.create!(
  name: "pathogenic",
  topic_type: "diagnosis"
).move_to_child_of(tgfbr1)
Topic.create!(
  name: "VUS",
  topic_type: "diagnosis"
).move_to_child_of(tgfbr1)
Topic.create!(
  name: "benign",
  topic_type: "diagnosis"
).move_to_child_of(tgfbr1)
tgfbr2 = Topic.create!(
  name: "TGFBR2",
  topic_type: "diagnosis"
).move_to_child_of(genetics)
Topic.create!(
  name: "pathogenic",
  topic_type: "diagnosis"
).move_to_child_of(tgfbr2)
Topic.create!(
  name: "VUS",
  topic_type: "diagnosis"
).move_to_child_of(tgfbr2)
Topic.create!(
  name: "benign",
  topic_type: "diagnosis"
).move_to_child_of(tgfbr2)
smad3 = Topic.create!(
  name: "SMAD3",
  topic_type: "diagnosis"
).move_to_child_of(genetics)
Topic.create!(
  name: "pathogenic",
  topic_type: "diagnosis"
).move_to_child_of(smad3)
Topic.create!(
  name: "VUS",
  topic_type: "diagnosis"
).move_to_child_of(smad3)
Topic.create!(
  name: "benign",
  topic_type: "diagnosis"
).move_to_child_of(smad3)
tgfb2 = Topic.create!(
  name: "TGFB2",
  topic_type: "diagnosis"
).move_to_child_of(genetics)
Topic.create!(
  name: "pathogenic",
  topic_type: "diagnosis"
).move_to_child_of(tgfb2)
Topic.create!(
  name: "VUS",
  topic_type: "diagnosis"
).move_to_child_of(tgfb2)
Topic.create!(
  name: "benign",
  topic_type: "diagnosis"
).move_to_child_of(tgfb2)
prkg1 = Topic.create!(
  name: "prkg1",
  topic_type: "diagnosis"
).move_to_child_of(genetics)
Topic.create!(
  name: "pathogenic",
  topic_type: "diagnosis"
).move_to_child_of(prkg1)
Topic.create!(
  name: "VUS",
  topic_type: "diagnosis"
).move_to_child_of(prkg1)
Topic.create!(
  name: "benign",
  topic_type: "diagnosis"
).move_to_child_of(prkg1)
acta2 = Topic.create!(
  name: "ACTA2",
  topic_type: "diagnosis"
).move_to_child_of(genetics)
Topic.create!(
  name: "pathogenic",
  topic_type: "diagnosis"
).move_to_child_of(acta2)
Topic.create!(
  name: "VUS",
  topic_type: "diagnosis"
).move_to_child_of(acta2)
Topic.create!(
  name: "benign",
  topic_type: "diagnosis"
).move_to_child_of(acta2)
prkg1 = Topic.create!(
  name: "PRKG1",
  topic_type: "diagnosis"
).move_to_child_of(genetics)
Topic.create!(
  name: "pathogenic",
  topic_type: "diagnosis"
).move_to_child_of(prkg1)
Topic.create!(
  name: "VUS",
  topic_type: "diagnosis"
).move_to_child_of(prkg1)
Topic.create!(
  name: "benign",
  topic_type: "diagnosis"
).move_to_child_of(prkg1)
myh11 = Topic.create!(
  name: "MYH11",
  topic_type: "diagnosis"
).move_to_child_of(genetics)
Topic.create!(
  name: "pathogenic",
  topic_type: "diagnosis"
).move_to_child_of(myh11)
Topic.create!(
  name: "VUS",
  topic_type: "diagnosis"
).move_to_child_of(myh11)
Topic.create!(
  name: "benign",
  topic_type: "diagnosis"
).move_to_child_of(myh11)
mylk = Topic.create!(
  name: "MYLK",
  topic_type: "diagnosis"
).move_to_child_of(genetics)
Topic.create!(
  name: "pathogenic",
  topic_type: "diagnosis"
).move_to_child_of(mylk)
Topic.create!(
  name: "VUS",
  topic_type: "diagnosis"
).move_to_child_of(mylk)
Topic.create!(
  name: "benign",
  topic_type: "diagnosis"
).move_to_child_of(mylk)
col3a1 = Topic.create!(
  name: "col3a1",
  topic_type: "diagnosis"
).move_to_child_of(genetics)
Topic.create!(
  name: "pathogenic",
  topic_type: "diagnosis"
).move_to_child_of(col3a1)
Topic.create!(
  name: "VUS",
  topic_type: "diagnosis"
).move_to_child_of(col3a1)
Topic.create!(
  name: "benign",
  topic_type: "diagnosis"
).move_to_child_of(col3a1)
fbln4 = Topic.create!(
  name: "FBLN4",
  topic_type: "diagnosis"
).move_to_child_of(genetics)
Topic.create!(
  name: "pathogenic",
  topic_type: "diagnosis"
).move_to_child_of(fbln4)
Topic.create!(
  name: "VUS",
  topic_type: "diagnosis"
).move_to_child_of(fbln4)
Topic.create!(
  name: "benign",
  topic_type: "diagnosis"
).move_to_child_of(fbln4)
col3a1 = Topic.create!(
  name: "COL3A1",
  topic_type: "diagnosis"
).move_to_child_of(genetics)
Topic.create!(
  name: "pathogenic",
  topic_type: "diagnosis"
).move_to_child_of(col3a1)
Topic.create!(
  name: "VUS",
  topic_type: "diagnosis"
).move_to_child_of(col3a1)
Topic.create!(
  name: "benign",
  topic_type: "diagnosis"
).move_to_child_of(col3a1)
## END GENETICS (xls 28) ##

## BEGIN MEDICATIONS (xls 41) ##
meds = Topic.create!(
  name: "medication",
  topic_type: "root category"
)
beta_blockers = Topic.create!(
  name: "beta-blockers",
  topic_type: "medication"
).move_to_child_of(meds)
Topic.create!(
  name: "atenolol",
  topic_type: "medication"
).move_to_child_of(beta_blockers)
Topic.create!(
  name: "metoprolol",
  topic_type: "medication"
).move_to_child_of(beta_blockers)
Topic.create!(
  name: "propanolol",
  topic_type: "medication"
).move_to_child_of(beta_blockers)
other_beta = Topic.create!(
  name: "other",
  topic_type: "medication"
).move_to_child_of(beta_blockers)
Topic.create!(
  name: "carvedilol",
  topic_type: "medication"
).move_to_child_of(other_beta)
Topic.create!(
  name: "betaxalol",
  topic_type: "medication"
).move_to_child_of(other_beta)
Topic.create!(
  name: "labetalol",
  topic_type: "medication"
).move_to_child_of(other_beta)
arb = Topic.create!(
  name: "ARB",
  topic_type: "medication"
).move_to_child_of(meds)
Topic.create!(
  name: "losartan",
  topic_type: "medication"
).move_to_child_of(arb)
Topic.create!(
  name: "valsartan",
  topic_type: "medication"
).move_to_child_of(arb)
Topic.create!(
  name: "irbesartan",
  topic_type: "medication"
).move_to_child_of(arb)
Topic.create!(
  name: "telmisartan",
  topic_type: "medication"
).move_to_child_of(arb)
Topic.create!(
  name: "candesartan",
  topic_type: "medication"
).move_to_child_of(arb)
other_arb = Topic.create!(
  name: "other",
  topic_type: "medication"
).move_to_child_of(arb)
calcium_channel_blocker = Topic.create!(
  name: "calcium channel blocker",
  topic_type: "medication"
).move_to_child_of(meds)
Topic.create!(
  name: "verapamil",
  topic_type: "medication"
).move_to_child_of(calcium_channel_blocker)
Topic.create!(
  name: "diltiazem",
  topic_type: "medication"
).move_to_child_of(calcium_channel_blocker)
Topic.create!(
  name: "amplodipine",
  topic_type: "medication"
).move_to_child_of(calcium_channel_blocker)
Topic.create!(
  name: "nifedipine",
  topic_type: "medication"
).move_to_child_of(calcium_channel_blocker)
other_calcium_channel_blocker = Topic.create!(
  name: "other",
  topic_type: "medication"
).move_to_child_of(calcium_channel_blocker)
ace_inhibitor = Topic.create!(
  name: "ACE-inhibitor",
  topic_type: "medication"
).move_to_child_of(meds)
Topic.create!(
  name: "lisinopril",
  topic_type: "medication"
).move_to_child_of(ace_inhibitor)
Topic.create!(
  name: "elanapril",
  topic_type: "medication"
).move_to_child_of(ace_inhibitor)
Topic.create!(
  name: "captopril",
  topic_type: "medication"
).move_to_child_of(ace_inhibitor)
other_ace = Topic.create!(
  name: "other",
  topic_type: "medication"
).move_to_child_of(ace_inhibitor)
Topic.create!(
  name: "accupril",
  topic_type: "medication"
).move_to_child_of(other_ace)
Topic.create!(
  name: "perindopril",
  topic_type: "medication"
).move_to_child_of(other_ace)
Topic.create!(
  name: "drandolapril",
  topic_type: "medication"
).move_to_child_of(other_ace)
## END MEDICATIONS (xls 61)

## BEGIN VITALS (xls 63) ##
vitals = Topic.create!(
  name: "vitals",
  topic_type: "root category"
)
Topic.create!(
  name: "SBP",
  topic_type: "stat"
).move_to_child_of(vitals)
Topic.create!(
  name: "DBP",
  topic_type: "stat"
).move_to_child_of(vitals)
Topic.create!(
  name: "HR",
  topic_type: "stat"
).move_to_child_of(vitals)
## END VITALS (xls 66) ##

## BEGIN MORPHOLOGY (xls 68) ##
morphology = Topic.create!(
  name: "morphology/physical findings",
  topic_type: "root category"
)
Topic.create!(
  name: "weight",
  topic_type: "stat"
).move_to_child_of(morphology)
Topic.create!(
  name: "height",
  topic_type: "stat"
).move_to_child_of(morphology)
Topic.create!(
  name: "arm span",
  topic_type: "measurement"
).move_to_child_of(morphology)
Topic.create!(
  name: "lower segment",
  topic_type: "measurement"
).move_to_child_of(morphology)
Topic.create!(
  name: "iridodenesis",
  topic_type: "complication"
).move_to_child_of(morphology)
Topic.create!(
  name: "blue sclera",
  topic_type: "complication"
).move_to_child_of(morphology)
Topic.create!(
  name: "sunken eyes",
  topic_type: "complication"
).move_to_child_of(morphology)
Topic.create!(
  name: "hypertelorism",
  topic_type: "complication"
).move_to_child_of(morphology)
Topic.create!(
  name: "dolichocephaly",
  topic_type: "complication"
).move_to_child_of(morphology)
Topic.create!(
  name: "malar hypoplasia",
  topic_type: "complication"
).move_to_child_of(morphology)
Topic.create!(
  name: "retrognathia",
  topic_type: "complication"
).move_to_child_of(morphology)
high_arched_palate = Topic.create!(
  name: "high arched palate",
  topic_type: "complication"
).move_to_child_of(morphology)
Topic.create!(
  name: "palate spreader",
  topic_type: "procedure"
).move_to_child_of(high_arched_palate)
Topic.create!(
  name: "no palate spreader",
  topic_type: "complication"
).move_to_child_of(high_arched_palate)
narrow_palate = Topic.create!(
  name: "narrow palate",
  topic_type: "complication"
).move_to_child_of(morphology)
Topic.create!(
  name: "repaired",
  topic_type: "procedure"
).move_to_child_of(narrow_palate)
Topic.create!(
  name: "not repaired",
  topic_type: "complication"
).move_to_child_of(narrow_palate)
cleft_palate = Topic.create!(
  name: "cleft palate",
  topic_type: "complication"
).move_to_child_of(morphology)
Topic.create!(
  name: "repaired",
  topic_type: "procedure"
).move_to_child_of(cleft_palate)
Topic.create!(
  name: "not repaired",
  topic_type: "complication"
).move_to_child_of(cleft_palate)
Topic.create!(
  name: "bifid uvula",
  topic_type: "complication"
).move_to_child_of(morphology)
Topic.create!(
  name: "broad uvula",
  topic_type: "complication"
).move_to_child_of(morphology)
dental_crowding = Topic.create!(
  name: "dental crowding",
  topic_type: "complication"
).move_to_child_of(morphology)
Topic.create!(
  name: "orthodontia",
  topic_type: "procedure"
).move_to_child_of(dental_crowding)
Topic.create!(
  name: "teeth extraction",
  topic_type: "procedure"
).move_to_child_of(dental_crowding)
Topic.create!(
  name: "craniosynostosis",
  topic_type: "complication"
).move_to_child_of(morphology)

Topic.create!(
  name: "pectus excavatum",
  topic_type: "complication"
).move_to_child_of(morphology)
Topic.create!(
  name: "pectus carinatum",
  topic_type: "complication"
).move_to_child_of(morphology)
Topic.create!(
  name: "asymmetric pectus",
  topic_type: "complication"
).move_to_child_of(morphology)
Topic.create!(
  name: "pectus surgery",
  topic_type: "procedure"
).move_to_child_of(morphology)
kypho = Topic.create!(
  name: "kyphoscoliosis",
  topic_type: "complication"
).move_to_child_of(morphology)
thoracic_kypho = Topic.create!(
  name: "thoracic",
  topic_type: "complication"
).move_to_child_of(kypho)
Topic.create!(
  name: "degree",
  topic_type: "measurement"
).move_to_child_of(thoracic_kypho)
lumbar_kypho = Topic.create!(
  name: "lumbar",
  topic_type: "complication"
).move_to_child_of(kypho)
Topic.create!(
  name: "degree",
  topic_type: "measurement"
).move_to_child_of(lumbar_kypho)
Topic.create!(
  name: "spondylolisthesis",
  topic_type: "complication"
).move_to_child_of(morphology)
Topic.create!(
  name: "loss of lumbar lordosis",
  topic_type: "complication"
).move_to_child_of(morphology)

Topic.create!(
  name: "thumb sign",
  topic_type: "complication"
).move_to_child_of(morphology)
Topic.create!(
  name: "wrist sign",
  topic_type: "complication"
).move_to_child_of(morphology)
Topic.create!(
  name: "small joint hypermobility",
  topic_type: "complication"
).move_to_child_of(morphology)
Topic.create!(
  name: "arachnodactyly",
  topic_type: "complication"
).move_to_child_of(morphology)
Topic.create!(
  name: "cubitus valgus",
  topic_type: "complication"
).move_to_child_of(morphology)
Topic.create!(
  name: "elbow contracture",
  topic_type: "complication"
).move_to_child_of(morphology)
## END MORPHOLOGY (xls 123) ##

## BEGIN AORTIC MEASUREMENTS (xls 126) ##
cardio = Topic.create!(
  name: "cardiovascular",
  topic_type: "root category"
)
aortic_root_size = Topic.create!(
  name: "aortic root",
  topic_type: "measurement"
).move_to_child_of(cardio)
Topic.create!(
  name: "echo",
  topic_type: "measurement"
).move_to_child_of(aortic_root_size)
Topic.create!(
  name: "CT",
  topic_type: "measurement"
).move_to_child_of(aortic_root_size)
Topic.create!(
  name: "MRI",
  topic_type: "measurement"
).move_to_child_of(aortic_root_size)
ascending_aortic_size = Topic.create!(
  name: "ascending aortic",
  topic_type: "measurement"
).move_to_child_of(cardio)
Topic.create!(
  name: "echo",
  topic_type: "measurement"
).move_to_child_of(ascending_aortic_size)
Topic.create!(
  name: "CT",
  topic_type: "measurement"
).move_to_child_of(ascending_aortic_size)
Topic.create!(
  name: "MRI",
  topic_type: "measurement"
).move_to_child_of(ascending_aortic_size)
transverse_arch = Topic.create!(
  name: "transverse arch",
  topic_type: "measurement"
).move_to_child_of(cardio)
Topic.create!(
  name: "echo",
  topic_type: "measurement"
).move_to_child_of(transverse_arch)
Topic.create!(
  name: "CT",
  topic_type: "measurement"
).move_to_child_of(transverse_arch)
Topic.create!(
  name: "MRI",
  topic_type: "measurement"
).move_to_child_of(transverse_arch)
descending_thoracic_aorta = Topic.create!(
  name: "descending thoracic aorta",
  topic_type: "measurement"
).move_to_child_of(cardio)
Topic.create!(
  name: "echo",
  topic_type: "measurement"
).move_to_child_of(descending_thoracic_aorta)
Topic.create!(
  name: "CT",
  topic_type: "measurement"
).move_to_child_of(descending_thoracic_aorta)
Topic.create!(
  name: "MRI",
  topic_type: "measurement"
).move_to_child_of(descending_thoracic_aorta)
suprarenal_abdominal_aorta = Topic.create!(
  name: "suprarenal abdominal aorta",
  topic_type: "measurement"
).move_to_child_of(cardio)
Topic.create!(
  name: "echo",
  topic_type: "measurement"
).move_to_child_of(suprarenal_abdominal_aorta)
Topic.create!(
  name: "CT",
  topic_type: "measurement"
).move_to_child_of(suprarenal_abdominal_aorta)
Topic.create!(
  name: "MRI",
  topic_type: "measurement"
).move_to_child_of(suprarenal_abdominal_aorta)
infrarenal_abdominal_aorta = Topic.create!(
  name: "infrarenal abdominal aorta",
  topic_type: "measurement"
).move_to_child_of(cardio)
Topic.create!(
  name: "echo",
  topic_type: "measurement"
).move_to_child_of(infrarenal_abdominal_aorta)
Topic.create!(
  name: "CT",
  topic_type: "measurement"
).move_to_child_of(infrarenal_abdominal_aorta)
Topic.create!(
  name: "MRI",
  topic_type: "measurement"
).move_to_child_of(infrarenal_abdominal_aorta)
aortic_annulus = Topic.create!(
  name: "aortic annulus",
  topic_type: "measurement"
).move_to_child_of(cardio)
Topic.create!(
  name: "echo",
  topic_type: "measurement"
).move_to_child_of(aortic_annulus)
Topic.create!(
  name: "CT",
  topic_type: "measurement"
).move_to_child_of(aortic_annulus)
Topic.create!(
  name: "MRI",
  topic_type: "measurement"
).move_to_child_of(aortic_annulus)
## END AORTA MEASUREMENTS (xls 132) ##

## BEGIN 1-DEPTH TOPICS (xls 134) ##
Topic.create!(
  name: "LVIDd",
  topic_type: "measurement"
).move_to_child_of(cardio)
Topic.create!(
  name: "LVIDs",
  topic_type: "measurement"
).move_to_child_of(cardio)
Topic.create!(
  name: "EF",
  topic_type: "measurement"
).move_to_child_of(cardio)
Topic.create!(
  name: "mitral valve prolapse",
  topic_type: "complication"
).move_to_child_of(cardio)
Topic.create!(
  name: "myxomatous mitral valve",
  topic_type: "complication"
).move_to_child_of(cardio)
Topic.create!(
  name: "mitral regurgitation severity",
  topic_type: "measurement"
).move_to_child_of(cardio)
## END 1-DEPTH TOPICS (xls 140)##

## BEGIN SHALLOW TOPICS (xls 142) ##
aortic_valve_morph = Topic.create!(
  name: "aortic valve morphology",
  topic_type: "complication"
).move_to_child_of(cardio)
Topic.create!(
  name: "tri-leaflet",
  topic_type: "complication"
).move_to_child_of(aortic_valve_morph)
Topic.create!(
  name: "bicuspid",
  topic_type: "complication"
).move_to_child_of(aortic_valve_morph)
Topic.create!(
  name: "unicuspid",
  topic_type: "complication"
).move_to_child_of(aortic_valve_morph)

aortic_stenosis = Topic.create!(
  name: "aortic stenosis",
  topic_type: "complication"
).move_to_child_of(cardio)
Topic.create!(
  name: "mean gradient",
  topic_type: "measurement"
).move_to_child_of(aortic_stenosis)
Topic.create!(
  name: "valve area",
  topic_type: "measurement"
).move_to_child_of(aortic_stenosis)

Topic.create!(
  name: "aortic insufficiency severity",
  topic_type: "measurement"
).move_to_child_of(cardio)
Topic.create!(
  name: "tricuspid regurgitation severity",
  topic_type: "measurement"
).move_to_child_of(cardio)
## END SHALLOW TOPICS (xls 147) %>

## BEGIN SHALLOW DISSECTIONS (xls 149) ##
aortic_dissection = Topic.create!(
  name: "aortic dissection",
  topic_type: "complication"
).move_to_child_of(cardio)
Topic.create!(
  name: "aortic root",
  topic_type: "complication"
).move_to_child_of(aortic_dissection)
Topic.create!(
  name: "ascending aorta",
  topic_type: "complication"
).move_to_child_of(aortic_dissection)
Topic.create!(
  name: "arch",
  topic_type: "complication"
).move_to_child_of(aortic_dissection)
Topic.create!(
  name: "descending thoracic",
  topic_type: "complication"
).move_to_child_of(aortic_dissection)
Topic.create!(
  name: "suprarenal abdominal",
  topic_type: "complication"
).move_to_child_of(aortic_dissection)
Topic.create!(
  name: "infrarenal abdominal",
  topic_type: "complication"
).move_to_child_of(aortic_dissection)
## END SHALLOW DISSECTIONS (xls 154) ##

## BEGIN RIGHT ILIAC DISSECTION (155) ##
iliac = Topic.create!(
  name: "iliac",
  topic_type: "complication"
).move_to_child_of(aortic_dissection)
right_iliac = Topic.create!(
  name: "right",
  topic_type: "complication"
).move_to_child_of(iliac)
Topic.create!(
  name: "dissected",
  topic_type: "complication"
).move_to_child_of(right_iliac)
right_iliac_true_lumen = Topic.create!(
  name: "true lumen",
  topic_type: "complication"
).move_to_child_of(right_iliac)
Topic.create!(
  name: "perfused",
  topic_type: "complication"
).move_to_child_of(right_iliac_true_lumen)
Topic.create!(
  name: "ischemic",
  topic_type: "complication"
).move_to_child_of(right_iliac_true_lumen)
right_iliac_false_lumen = Topic.create!(
  name: "true lumen",
  topic_type: "complication"
).move_to_child_of(right_iliac)
Topic.create!(
  name: "perfused",
  topic_type: "complication"
).move_to_child_of(right_iliac_false_lumen)
Topic.create!(
  name: "ischemic",
  topic_type: "complication"
).move_to_child_of(right_iliac_false_lumen)
## END RIGHT ILIAC DISSECTION (xls 155) ##

## BEGIN LEFT ILIAC DISSECTION (xls 156) ##
left_iliac = Topic.create!(
  name: "right",
  topic_type: "complication"
).move_to_child_of(iliac)
Topic.create!(
  name: "dissected",
  topic_type: "complication"
).move_to_child_of(left_iliac)
left_iliac_true_lumen = Topic.create!(
  name: "true lumen",
  topic_type: "complication"
).move_to_child_of(left_iliac)
Topic.create!(
  name: "perfused",
  topic_type: "complication"
).move_to_child_of(left_iliac_true_lumen)
Topic.create!(
  name: "ischemic",
  topic_type: "complication"
).move_to_child_of(left_iliac_true_lumen)
left_iliac_false_lumen = Topic.create!(
  name: "true lumen",
  topic_type: "complication"
).move_to_child_of(left_iliac)
Topic.create!(
  name: "perfused",
  topic_type: "complication"
).move_to_child_of(left_iliac_false_lumen)
Topic.create!(
  name: "ischemic",
  topic_type: "complication"
).move_to_child_of(left_iliac_false_lumen)
## END LEFT ILIAC DISSECTION (xls 156) ##

## BEGIN RIGHT RENAL DISSECTION (xls 158) ##
renal = Topic.create!(
  name: "renal",
  topic_type: "complication"
).move_to_child_of(aortic_dissection)
right_renal = Topic.create!(
  name: "right",
  topic_type: "complication"
).move_to_child_of(renal)
Topic.create!(
  name: "dissected",
  topic_type: "complication"
).move_to_child_of(right_renal)
right_renal_dissected = Topic.create!(
  name: "dissected",
  topic_type: "complication"
).move_to_child_of(right_renal)
Topic.create!(
  name: "perfused",
  topic_type: "complication"
).move_to_child_of(right_renal_dissected)
Topic.create!(
  name: "ischemic",
  topic_type: "complication"
).move_to_child_of(right_renal_dissected)
right_renal_true_lumen = Topic.create!(
  name: "true lumen",
  topic_type: "complication"
).move_to_child_of(right_renal)
Topic.create!(
  name: "perfused",
  topic_type: "complication"
).move_to_child_of(right_renal_true_lumen)
Topic.create!(
  name: "ischemic",
  topic_type: "complication"
).move_to_child_of(right_renal_true_lumen)
right_renal_false_lumen = Topic.create!(
  name: "false lumen",
  topic_type: "complication"
).move_to_child_of(right_renal)
Topic.create!(
  name: "perfused",
  topic_type: "complication"
).move_to_child_of(right_renal_false_lumen)
Topic.create!(
  name: "ischemic",
  topic_type: "complication"
).move_to_child_of(right_renal_false_lumen)
## END RIGHT RENAL DISSECTION (xls 158) ##

## BEGIN LEFT RENAL DISSECTION (xls 159) ##
true_lumen_sma = Topic.create!(
  name: "right",
  topic_type: "complication"
).move_to_child_of(renal)
true_lumen_sma_dissected = Topic.create!(
  name: "dissected",
  topic_type: "complication"
).move_to_child_of(true_lumen_sma)
Topic.create!(
  name: "perfused",
  topic_type: "complication"
).move_to_child_of(true_lumen_sma_dissected)
Topic.create!(
  name: "ischemic",
  topic_type: "complication"
).move_to_child_of(true_lumen_sma_dissected)
true_lumen_sma_true_lumen = Topic.create!(
  name: "true lumen",
  topic_type: "complication"
  ).move_to_child_of(true_lumen_sma)
Topic.create!(
  name: "perfused",
  topic_type: "complication"
).move_to_child_of(true_lumen_sma_true_lumen)
Topic.create!(
  name: "ischemic",
  topic_type: "complication"
).move_to_child_of(true_lumen_sma_true_lumen)
true_lumen_sma_false_lumen = Topic.create!(
  name: "false lumen",
  topic_type: "complication"
  ).move_to_child_of(true_lumen_sma)
Topic.create!(
  name: "perfused",
  topic_type: "complication"
).move_to_child_of(true_lumen_sma_false_lumen)
Topic.create!(
  name: "ischemic",
  topic_type: "complication"
).move_to_child_of(true_lumen_sma_false_lumen)
## END RIGHT RENAL DISSECTION (xls 159) ##

## BEGIN SMA DISSECTION (xls 161) ##
sma = Topic.create!(
  name: "SMA",
  topic_type: "complication"
).move_to_child_of(aortic_dissection)
true_lumen_sma = Topic.create(
  name: "true lumen",
  topic_type: "complication"
).move_to_child_of(sma)
Topic.create!(
  name: "perfused",
  topic_type: "complication"
).move_to_child_of(true_lumen_sma)
Topic.create!(
  name: "ischemic",
  topic_type: "complication"
).move_to_child_of(true_lumen_sma)
false_lumen_sma = Topic.create(
  name: "false lumen",
  topic_type: "complication"
).move_to_child_of(sma)
Topic.create!(
  name: "perfused",
  topic_type: "complication"
).move_to_child_of(false_lumen_sma)
Topic.create!(
  name: "ischemic",
  topic_type: "complication"
).move_to_child_of(false_lumen_sma)
sma_dissected = Topic.create!(
  name: "dissected",
  topic_type: "complication"
).move_to_child_of(sma)
Topic.create!(
  name: "perfused",
  topic_type: "complication"
).move_to_child_of(sma_dissected)
Topic.create!(
  name: "ischemic",
  topic_type: "complication"
).move_to_child_of(true_lumen_sma_dissected)
## END SMA DISSECTION (xls 163) ##

## BEGIN CELIAC DISSECTION (xls 164) ##
celiac = Topic.create!(
  name: "SMA",
  topic_type: "complication"
).move_to_child_of(aortic_dissection)
true_lumen_sma = Topic.create(
  name: "true lumen",
  topic_type: "complication"
).move_to_child_of(sma)
Topic.create!(
  name: "perfused",
  topic_type: "complication"
).move_to_child_of(true_lumen_sma)
Topic.create!(
  name: "ischemic",
  topic_type: "complication"
).move_to_child_of(true_lumen_sma)
false_lumen_sma = Topic.create(
  name: "false lumen",
  topic_type: "complication"
).move_to_child_of(sma)
Topic.create!(
  name: "perfused",
  topic_type: "complication"
).move_to_child_of(false_lumen_sma)
Topic.create!(
  name: "ischemic",
  topic_type: "complication"
).move_to_child_of(false_lumen_sma)
sma_dissected = Topic.create!(
  name: "dissected",
  topic_type: "complication"
).move_to_child_of(sma)
Topic.create!(
  name: "perfused",
  topic_type: "complication"
).move_to_child_of(sma_dissected)
Topic.create!(
  name: "ischemic",
  topic_type: "complication"
).move_to_child_of(true_lumen_sma_dissected)
## END CELIAC DISSECTION (xls 166) ##

## BEGIN INNOMINATE DISSECTION (xls 167) ##
innominate = Topic.create!(
  name: "innominate",
  topic_type: "complication"
).move_to_child_of(aortic_dissection)
true_lumen_innominate = Topic.create(
  name: "true lumen",
  topic_type: "complication"
).move_to_child_of(innominate)
Topic.create!(
  name: "perfused",
  topic_type: "complication"
).move_to_child_of(true_lumen_innominate)
Topic.create!(
  name: "ischemic",
  topic_type: "complication"
).move_to_child_of(true_lumen_innominate)
false_lumen_innominate = Topic.create(
  name: "false lumen",
  topic_type: "complication"
).move_to_child_of(innominate)
Topic.create!(
  name: "perfused",
  topic_type: "complication"
).move_to_child_of(false_lumen_innominate)
Topic.create!(
  name: "ischemic",
  topic_type: "complication"
).move_to_child_of(false_lumen_innominate)
innominate_dissected = Topic.create!(
  name: "dissected",
  topic_type: "complication"
).move_to_child_of(innominate)
Topic.create!(
  name: "perfused",
  topic_type: "complication"
).move_to_child_of(innominate_dissected)
Topic.create!(
  name: "ischemic",
  topic_type: "complication"
).move_to_child_of(innominate_dissected)
## END INNOMINATE DISSECTION (xls 169)

## BEGIN LEFT CAROTID DISSECTION (xls 170) ##
left_carotid = Topic.create!(
  name: "left carotid",
  topic_type: "complication"
).move_to_child_of(aortic_dissection)
true_lumen_left_carotid = Topic.create(
  name: "true lumen",
  topic_type: "complication"
).move_to_child_of(left_carotid)
Topic.create!(
  name: "perfused",
  topic_type: "complication"
).move_to_child_of(true_lumen_left_carotid)
Topic.create!(
  name: "ischemic",
  topic_type: "complication"
).move_to_child_of(true_lumen_left_carotid)
false_lumen_left_carotid = Topic.create(
  name: "false lumen",
  topic_type: "complication"
).move_to_child_of(left_carotid)
Topic.create!(
  name: "perfused",
  topic_type: "complication"
).move_to_child_of(false_lumen_left_carotid)
Topic.create!(
  name: "ischemic",
  topic_type: "complication"
).move_to_child_of(false_lumen_left_carotid)
left_carotid_dissected = Topic.create!(
  name: "dissected",
  topic_type: "complication"
).move_to_child_of(left_carotid)
Topic.create!(
  name: "perfused",
  topic_type: "complication"
).move_to_child_of(left_carotid_dissected)
Topic.create!(
  name: "ischemic",
  topic_type: "complication"
).move_to_child_of(left_carotid_dissected)
## LEFT CAROTID DISSECTION (xls 172) ##

## BEGIN LEFT SUBCLAVIAN DISSECTION (xls 173) ##
left_subclavian = Topic.create!(
  name: "left subclavian",
  topic_type: "complication"
).move_to_child_of(aortic_dissection)
true_lumen_left_subclavian = Topic.create(
  name: "true lumen",
  topic_type: "complication"
).move_to_child_of(left_subclavian)
Topic.create!(
  name: "perfused",
  topic_type: "complication"
).move_to_child_of(true_lumen_left_subclavian)
Topic.create!(
  name: "ischemic",
  topic_type: "complication"
).move_to_child_of(true_lumen_left_subclavian)
false_lumen_left_subclavian = Topic.create(
  name: "false lumen",
  topic_type: "complication"
).move_to_child_of(left_subclavian)
Topic.create!(
  name: "perfused",
  topic_type: "complication"
).move_to_child_of(false_lumen_left_subclavian)
Topic.create!(
  name: "ischemic",
  topic_type: "complication"
).move_to_child_of(false_lumen_left_subclavian)
left_subclavian_dissected = Topic.create!(
  name: "dissected",
  topic_type: "complication"
).move_to_child_of(left_subclavian)
Topic.create!(
  name: "perfused",
  topic_type: "complication"
).move_to_child_of(left_subclavian_dissected)
Topic.create!(
  name: "ischemic",
  topic_type: "complication"
).move_to_child_of(left_subclavian_dissected)
## END LEFT SUBCLAVIAN DISSECTION (xls 176)

## BEGIN ROOT REPLACEMENT (xls 177) ##
aortic_surgery = Topic.create!(
  name: "aortic surgery",
  topic_type: "procedure"
).move_to_child_of(cardio)
root_replacement = Topic.create!(
  name: "root replacement",
  topic_type: "procedure"
).move_to_child_of(aortic_surgery)
cvg = Topic.create!(
  name: "CVG",
  topic_type: "procedure"
).move_to_child_of(root_replacement)
Topic.create!(
  name: "mechanical prosthesis",
  topic_type: "procedure"
).move_to_child_of(cvg)
Topic.create!(
  name: "bioprosthesis",
  topic_type: "procedure"
).move_to_child_of(cvg)
valve_sparing = Topic.create!(
  name: "valve sparing",
  topic_type: "procedure"
).move_to_child_of(root_replacement)
tirone_david = Topic.create!(
  name: "Tirone-David",
  topic_type: "procedure"
).move_to_child_of(valve_sparing)
Topic.create!(
  name: "TD-V Smod",
  topic_type: "procedure"
).move_to_child_of(tirone_david)
Topic.create!(
  name: "Valsalva Graft",
  topic_type: "procedure"
).move_to_child_of(tirone_david)
Topic.create!(
  name: "Yacoub",
  topic_type: "procedure"
).move_to_child_of(valve_sparing)
Topic.create!(
  name: "supracoronary",
  topic_type: "procedure"
).move_to_child_of(root_replacement)
Topic.create!(
  name: "honograft",
  topic_type: "procedure"
).move_to_child_of(root_replacement)
Topic.create!(
  name: "freestyle prosthesis",
  topic_type: "procedure"
).move_to_child_of(root_replacement)
## END ROOT REPLACEMENT (xls 184) ##

## BEGIN ASCENDING REPLACEMENT (xls 185) ##
asc_repl = Topic.create!(
  name: "ascending replacement",
  topic_type: "procedure"
).move_to_child_of(aortic_surgery)
Topic.create!(
  name: "clamped",
  topic_type: "procedure"
).move_to_child_of(asc_repl)
Topic.create!(
  name: "open distal anstomosis",
  topic_type: "procedure"
).move_to_child_of(asc_repl)
## END ASCENDING REPLACEMENT (xls 186) ##

## BEGIN ARCH REPLACEMENT (xls 187) ##
arch_repl = Topic.create!(
  name: "arch replacement",
  topic_type: "procedure"
).move_to_child_of(aortic_surgery)
## END ARCH REPLACEMENT (xls 189) ##

## BEGIN SHALLOW REPLACEMENTS (xls 187) ##
Topic.create!(
  name: "descending thoracic aorta replacement",
  topic_type: "procedure"
).move_to_child_of(aortic_surgery)
Topic.create!(
  name: "suprarenal aorta replacement",
  topic_type: "procedure"
).move_to_child_of(aortic_surgery)
Topic.create!(
  name: "infrarenal aorta replacement",
  topic_type: "procedure"
).move_to_child_of(aortic_surgery)
## END SHALLOW REPLACEMENTS (xls 189) ##


## BEGIN STENT GRAFT (xls 194) ##
stent_graft = Topic.create!(
  name: "stent graft",
  topic_type: "procedure"
).move_to_child_of(cardio)
thoracic_stent = Topic.create!(
  name: "thoracic",
  topic_type: "procedure"
).move_to_child_of(stent_graft)
Topic.create!(
  name: "endoleak",
  topic_type: "procedure"
).move_to_child_of(thoracic_stent)
Topic.create!(
  name: "suprarenal",
  topic_type: "procedure"
).move_to_child_of(stent_graft)
Topic.create!(
  name: "infrarenal",
  topic_type: "procedure"
).move_to_child_of(stent_graft)
iliac_stent = Topic.create!(
  name: "iliac",
  topic_type: "procedure"
).move_to_child_of(stent_graft)
Topic.create!(
  name: "right",
  topic_type: "procedure"
).move_to_child_of(iliac_stent)
Topic.create!(
  name: "left",
  topic_type: "procedure"
).move_to_child_of(iliac_stent)
subclavian_stent = Topic.create!(
  name: "subclavian",
  topic_type: "procedure"
).move_to_child_of(stent_graft)
Topic.create!(
  name: "right",
  topic_type: "procedure"
).move_to_child_of(subclavian_stent)
Topic.create!(
  name: "left",
  topic_type: "procedure"
).move_to_child_of(subclavian_stent)
## END STENT GRAFT (xls 200) ##

## BEGIN MITRAL VALVE SURGERY (xls 202) ##
mitral_valve_surgery = Topic.create!(
  name: "mitral valve surgery",
  topic_type: "procedure"
).move_to_child_of(cardio)
mitral_valve_repair = Topic.create!(
  name: "mitral valve repair",
  topic_type: "procedure"
).move_to_child_of(mitral_valve_surgery)
Topic.create!(
  name: "ring only",
  topic_type: "procedure"
).move_to_child_of(mitral_valve_repair)
Topic.create!(
  name: "leaflet repair",
  topic_type: "procedure"
).move_to_child_of(mitral_valve_repair)
mitral_valve_replacement = Topic.create!(
  name: "mitral valve replacement",
  topic_type: "procedure"
).move_to_child_of(mitral_valve_surgery)
Topic.create!(
  name: "mechanical prosthesis",
  topic_type: "procedure"
).move_to_child_of(mitral_valve_replacement)
Topic.create!(
  name: "bioprosthetic",
  topic_type: "procedure"
).move_to_child_of(mitral_valve_replacement)
## END MITRAL VALVE SURGERY (xls 205) ##


## BEGIN ARRHYTHMIA (xls 207) ##
arrhythmia = Topic.create!(
  name: "arrhythmia",
  topic_type: "complication"
).move_to_child_of(cardio)
Topic.create!(
  name: "PVC",
  topic_type: "complication"
).move_to_child_of(arrhythmia)
Topic.create!(
  name: "PAC",
  topic_type: "complication"
).move_to_child_of(arrhythmia)
Topic.create!(
  name: "afib/aflutter",
  topic_type: "complication"
).move_to_child_of(arrhythmia)
Topic.create!(
  name: "VT/VF",
  topic_type: "complication"
).move_to_child_of(arrhythmia)
Topic.create!(
  name: "sudden death",
  topic_type: "complication"
).move_to_child_of(arrhythmia)
Topic.create!(
  name: "AICD",
  topic_type: "complication"
).move_to_child_of(arrhythmia)
## END ARRHYTHMIA (xls 212) ##


## BEGIN VARICOSE VEINS (xls 214) ##
varicose = Topic.create!(
  name: "varicose veins",
  topic_type: "complication"
).move_to_child_of(cardio)
Topic.create!(
  name: "edema",
  topic_type: "complication"
).move_to_child_of(varicose)
Topic.create!(
  name: "sclerotherapy/stripping",
  topic_type: "procedure"
).move_to_child_of(varicose)
## END VARICOSE VEINS (xls 215) ##


## BEGIN CORONARY DISEASE (xls 217) ##
coronary_disease = Topic.create!(
  name: "coronary disease",
  topic_type: "complication"
).move_to_child_of(cardio)
Topic.create!(
  name: "angina",
  topic_type: "complication"
).move_to_child_of(coronary_disease)
Topic.create!(
  name: "myocardial infarction",
  topic_type: "complication"
).move_to_child_of(coronary_disease)
Topic.create!(
  name: "angioplasty/stent",
  topic_type: "procedure"
).move_to_child_of(coronary_disease)
Topic.create!(
  name: "CABG",
  topic_type: "procedure"
).move_to_child_of(coronary_disease)
## END CORONARY DISEASE (xls 220) ##


## BEGIN SYMPTOMS (xls 222) ##
symptoms = Topic.create!(
  name: "symptoms",
  topic_type: "symptom"
).move_to_child_of(cardio)
Topic.create!(
  name: "chest pain",
  topic_type: "symptom"
).move_to_child_of(symptoms)
Topic.create!(
  name: "dyspnea on exertion",
  topic_type: "symptom"
).move_to_child_of(symptoms)
Topic.create!(
  name: "palpitations",
  topic_type: "symptom"
).move_to_child_of(symptoms)
Topic.create!(
  name: "lightheadedness",
  topic_type: "symptom"
).move_to_child_of(symptoms)
Topic.create!(
  name: "edema",
  topic_type: "symptom"
).move_to_child_of(symptoms)
## END SYMPTOMS (xls 226) ##

## BEGIN SHALLOW PULMONARY (xls 228) ##
pulmonary = Topic.create!(
  name: "pulmonary",
  topic_type: "root category"
)
emphysema = Topic.create!(
  name: "emphysema",
  topic_type: "complication"
).move_to_child_of(pulmonary)
Topic.create!(
  name: "CT/CXR",
  topic_type: "measurement"
).move_to_child_of(emphysema)
pft_emphysema = Topic.create!(
  name: "PFT",
  topic_type: "measurement"
).move_to_child_of(emphysema)
Topic.create!(
  name: "FEV1",
  topic_type: "measurement"
).move_to_child_of(pft_emphysema)
restrictive_lung_disease = Topic.create!(
  name: "restrictive lung disease",
  topic_type: "complication"
).move_to_child_of(pulmonary)
pft_rld = Topic.create!(
  name: "PFT",
  topic_type: "measurement"
).move_to_child_of(restrictive_lung_disease)
Topic.create!(
  name: "FVC",
  topic_type: "measurement"
).move_to_child_of(pft_rld)
Topic.create!(
  name: "TLC",
  topic_type: "measurement"
).move_to_child_of(pft_rld)
asthma = Topic.create!(
  name: "asthma",
  topic_type: "complication"
).move_to_child_of(pulmonary)
pft_asthma = Topic.create!(
  name: "PFT",
  topic_type: "measurement"
).move_to_child_of(asthma)
Topic.create!(
  name: "FEV1",
  topic_type: "measurement"
).move_to_child_of(pft_asthma)
Topic.create!(
  name: "bronchodilator response",
  topic_type: "measurement"
).move_to_child_of(pft_asthma)
## END SHALLOW PULMONARY (xls 233) ##

## BEGIN PNEUMOTHORAX (xls 234)##
pneumothorax = Topic.create!(
  name: "pneumothorax",
  topic_type: "complication"
).move_to_child_of(pulmonary)
Topic.create!(
  name: "blebs",
  topic_type: "complication"
).move_to_child_of(pneumothorax)
pneumo_treatment = Topic.create!(
  name: "treatment",
  topic_type: "procedure"
).move_to_child_of(pneumothorax)
Topic.create!(
  name: "chest tube",
  topic_type: "procedure"
).move_to_child_of(pneumo_treatment)
Topic.create!(
  name: "pleurodesis",
  topic_type: "procedure"
).move_to_child_of(pneumo_treatment)
Topic.create!(
  name: "VATS",
  topic_type: "procedure"
).move_to_child_of(pneumo_treatment)
## END PNEUMOTHORAX (xls 237) ##

## BEGIN SHALLOW PULMONARY LAST (xls 238) ##
sleep_apnea = Topic.create!(
  name: "sleep apnea",
  topic_type: "complication"
).move_to_child_of(pulmonary)
s_a_treatment = Topic.create!(
  name: "treatment",
  topic_type: "procedure"
).move_to_child_of(sleep_apnea)
Topic.create!(
  name: "CPAP",
  topic_type: "medication"
).move_to_child_of(s_a_treatment)
Topic.create!(
  name: "surgery",
  topic_type: "procedure"
).move_to_child_of(s_a_treatment)
pulm_meds = Topic.create!(
  name: "medications",
  topic_type: "complication"
).move_to_child_of(pulmonary)
Topic.create!(
  name: "bronchodilators",
  topic_type: "medication"
).move_to_child_of(pulm_meds)
Topic.create!(
  name: "inhaled steroids",
  topic_type: "medication"
).move_to_child_of(pulm_meds)
Topic.create!(
  name: "systemic steroids",
  topic_type: "medication"
).move_to_child_of(pulm_meds)
## END SHALLOW PULMONARY LAST (xls 243) ##

## BEGIN ORTHOPEDIC BACK (xls 245) ##
ortho = Topic.create!(
  name: "orthopedic",
  topic_type: "root category"
)
back = Topic.create!(
  name: "back",
  topic_type: "symptom"
).move_to_child_of(ortho)
scoliosis = Topic.create!(
  name: "scoliosis",
  topic_type: "complication"
).move_to_child_of(back)
thoracic = Topic.create!(
  name: "thoracic",
  topic_type: "complication"
).move_to_child_of(scoliosis)
Topic.create!(
  name: "bracing",
  topic_type: "procedure"
).move_to_child_of(thoracic)
Topic.create!(
  name: "Harrington rods",
  topic_type: "procedure"
).move_to_child_of(thoracic)
Topic.create!(
  name: "physical therapy",
  topic_type: "procedure"
).move_to_child_of(thoracic)
Topic.create!(
  name: "fusion",
  topic_type: "procedure"
).move_to_child_of(thoracic)
lumbar = Topic.create!(
  name: "lumbar",
  topic_type: "complication"
).move_to_child_of(scoliosis)
Topic.create!(
  name: "bracing",
  topic_type: "procedure"
).move_to_child_of(lumbar)
Topic.create!(
  name: "Harrington rods",
  topic_type: "procedure"
).move_to_child_of(lumbar)
Topic.create!(
  name: "physical therapy",
  topic_type: "procedure"
).move_to_child_of(lumbar)
Topic.create!(
  name: "fusion",
  topic_type: "procedure"
).move_to_child_of(lumbar)

dural_ectasia = Topic.create!(
  name: "dural ectasia",
  topic_type: "complication"
).move_to_child_of(back)
Topic.create!(
  name: "blood patch",
  topic_type: "procedure"
).move_to_child_of(dural_ectasia)
## END ORTHOPEDIC BACK (xls 253) ##

## BEGIN PECTUS (xls 254) ##
pectus = Topic.create!(
  name: "pectus",
  topic_type: "complication"
).move_to_child_of(ortho)
excavatum = Topic.create!(
  name: "excavatum",
  topic_type: "complication"
).move_to_child_of(pectus)
Topic.create!(
  name: "Ravitch procedure",
  topic_type: "procedure"
).move_to_child_of(excavatum)
Topic.create!(
  name: "Nuss bar",
  topic_type: "procedure"
).move_to_child_of(excavatum)
carinatum = Topic.create!(
  name: "carinatum",
  topic_type: "complication"
).move_to_child_of(pectus)
Topic.create!(
  name: "Ravitch procedure",
  topic_type: "procedure"
).move_to_child_of(carinatum)
Topic.create!(
  name: "Nuss bar",
  topic_type: "procedure"
).move_to_child_of(carinatum)
asymmetric_pectus = Topic.create!(
  name: "asymmetric",
  topic_type: "complication"
).move_to_child_of(pectus)
Topic.create!(
  name: "Ravitch procedure",
  topic_type: "procedure"
).move_to_child_of(asymmetric_pectus)
Topic.create!(
  name: "Nuss bar",
  topic_type: "procedure"
).move_to_child_of(asymmetric_pectus)
## END PECTUS (xls 256) ##

## BEGIN SHALLOW ORTHOPEDIC (xls 258) ##
hip = Topic.create!(
  name: "hip",
  topic_type: "complication"
).move_to_child_of(ortho)
Topic.create!(
  name: "protrusio acetabulae",
  topic_type: "complication"
).move_to_child_of(hip)
Topic.create!(
  name: "hip replacement",
  topic_type: "procedure"
).move_to_child_of(hip)

foot = Topic.create!(
  name: "fot",
  topic_type: "complication"
).move_to_child_of(ortho)
pes_planus = Topic.create!(
  name: "pes planus",
  topic_type: "complication"
).move_to_child_of(foot)
Topic.create!(
  name: "orthotics",
  topic_type: "medication"
).move_to_child_of(pes_planus)
hind_foot = Topic.create!(
  name: "hind foot deformity",
  topic_type: "complication"
).move_to_child_of(foot)
Topic.create!(
  name: "fusion",
  topic_type: "procedure"
).move_to_child_of(hind_foot)
hammer_toes = Topic.create!(
  name: "hammer toes",
  topic_type: "complication"
).move_to_child_of(foot)
Topic.create!(
  name: "release",
  topic_type: "procedure"
).move_to_child_of(hammer_toes)
## END SHALLOW ORTHOPEDIC (xls 263) ##

## BEGIN OSTEOPEROSIS (xls 265) ##
osteoporosis = Topic.create!(
  name: "Osteoporosis",
  topic_type: "complication"
).move_to_child_of(ortho)
Topic.create!(
  name: "bone mineral density",
  topic_type: "measurement"
).move_to_child_of(osteoporosis)
Topic.create!(
  name: "compression fractures",
  topic_type: "complication"
).move_to_child_of(osteoporosis)
Topic.create!(
  name: "hip fractures",
  topic_type: "complication"
).move_to_child_of(osteoporosis)
Topic.create!(
  name: "wrist fractures",
  topic_type: "complication"
).move_to_child_of(osteoporosis)
osteo_treatment = Topic.create!(
  name: "treatment",
  topic_type: "medication"
).move_to_child_of(osteoporosis)
Topic.create!(
  name: "calcium",
  topic_type: "medication"
).move_to_child_of(osteo_treatment)
Topic.create!(
  name: "vitamin D",
  topic_type: "medication"
).move_to_child_of(osteo_treatment)
Topic.create!(
  name: "biophosphonates",
  topic_type: "medication"
).move_to_child_of(osteo_treatment)
Topic.create!(
  name: "calcitonin",
  topic_type: "medication"
).move_to_child_of(osteo_treatment)
Topic.create!(
  name: "estrogen/analogue",
  topic_type: "medication"
).move_to_child_of(osteo_treatment)
Topic.create!(
  name: "forteo",
  topic_type: "medication"
).move_to_child_of(osteo_treatment)
## END OSTEOPEROSIS (xls 274) ##

## BEGIN SYMPTOMS (xls 276) ##
ortho_symptoms = Topic.create!(
  name: "symptoms",
  topic_type: "complication"
).move_to_child_of(ortho)
ortho_pain = Topic.create!(
  name: "pain",
  topic_type: "complication"
).move_to_child_of(ortho_symptoms)
Topic.create!(
  name: "upper back",
  topic_type: "complication"
).move_to_child_of(ortho_pain)
Topic.create!(
  name: "lower back",
  topic_type: "complication"
).move_to_child_of(ortho_pain)
Topic.create!(
  name: "hip",
  topic_type: "complication"
).move_to_child_of(ortho_pain)
Topic.create!(
  name: "knee",
  topic_type: "complication"
).move_to_child_of(ortho_pain)
Topic.create!(
  name: "ankle",
  topic_type: "complication"
).move_to_child_of(ortho_pain)
Topic.create!(
  name: "foot",
  topic_type: "complication"
).move_to_child_of(ortho_pain)
Topic.create!(
  name: "sciataca",
  topic_type: "complication"
).move_to_child_of(ortho_symptoms)
Topic.create!(
  name: "activity limitation",
  topic_type: "complication"
).move_to_child_of(ortho_symptoms)
## END SYMPTOMS (xls 283) ##

## BEGIN OPHTHALMOLOGIC (xls 285) ##
opthalmo = Topic.create!(
  name: "ophthalmologic",
  topic_type: "root category"
)
myopia = Topic.create!(
  name: "myopia",
  topic_type: "complication"
).move_to_child_of(opthalmo)
Topic.create!(
  name: "severity",
  topic_type: "measurement"
).move_to_child_of(myopia)
Topic.create!(
  name: "globe length",
  topic_type: "measurement"
).move_to_child_of(myopia)
Topic.create!(
  name: "amblyopia",
  topic_type: "complication"
).move_to_child_of(opthalmo)
ectopia_lentis = Topic.create!(
  name: "ectopia lentis",
  topic_type: "complication"
).move_to_child_of(opthalmo)
Topic.create!(
  name: "iridodensis",
  topic_type: "measurement"
).move_to_child_of(ectopia_lentis)
Topic.create!(
  name: "phakectomy",
  topic_type: "procedure"
).move_to_child_of(ectopia_lentis)
iol_ectopia = Topic.create!(
  name: "IOL",
  topic_type: "procedure"
).move_to_child_of(ectopia_lentis)
Topic.create!(
  name: "type",
  topic_type: "procedure"
).move_to_child_of(iol_ectopia)
cataract = Topic.create!(
  name: "cataract",
  topic_type: "complication"
).move_to_child_of(opthalmo)
Topic.create!(
  name: "IOL",
  topic_type: "procedure"
).move_to_child_of(cataract)
Topic.create!(
  name: "phakectomy",
  topic_type: "procedure"
).move_to_child_of(cataract)
Topic.create!(
  name: "glaucoma",
  topic_type: "complication"
).move_to_child_of(opthalmo)
Topic.create!(
  name: "retinal thinning/holes",
  topic_type: "complication"
).move_to_child_of(opthalmo)
retinal_detachment = Topic.create!(
  name: "retinal detachment",
  topic_type: "complication"
).move_to_child_of(opthalmo)
Topic.create!(
  name: "buckle",
  topic_type: "procedure"
).move_to_child_of(retinal_detachment)
Topic.create!(
  name: "laser",
  topic_type: "procedure"
).move_to_child_of(retinal_detachment)
## END OPHTHALMOLOGIC (xls 297) ##

## BEGIN GYNECOLOGIC/UROLOGIC (xls 299) ##
gyno = Topic.create!(
  name: "gynecologic/urologic",
  topic_type: "root category"
)
pelvic = Topic.create!(
  name: "pelvic floor weakness",
  topic_type: "complication"
).move_to_child_of(gyno)
Topic.create!(
  name: "treatment",
  topic_type: "procedure"
).move_to_child_of(pelvic)
Topic.create!(
  name: "bladder prolapse",
  topic_type: "complication"
).move_to_child_of(gyno)
Topic.create!(
  name: "uterine prolapse",
  topic_type: "complication"
).move_to_child_of(gyno)
## END GYNECOLOGIC/UROLOGIC (xls 302) ##

## BEGIN OBSTETRIC (xls 304) ##
pregnancy = Topic.create!(
  name: "obstetric (pregnancy)",
  topic_type: "root category"
)
preg_method = Topic.create!(
  name: "method",
  topic_type: "procedure"
).move_to_child_of(pregnancy)
Topic.create!(
  name: "spontaneous",
  topic_type: "complication"
).move_to_child_of(preg_method)
Topic.create!(
  name: "IVF",
  topic_type: "complication"
).move_to_child_of(preg_method)
Topic.create!(
  name: "PGD",
  topic_type: "complication"
).move_to_child_of(preg_method)
Topic.create!(
  name: "surrogate",
  topic_type: "complication"
).move_to_child_of(preg_method)

preg_outcome = Topic.create!(
  name: "outcome",
  topic_type: "diagnosis"
).move_to_child_of(pregnancy)
Topic.create!(
  name: "term",
  topic_type: "diagnosis"
).move_to_child_of(preg_outcome)
Topic.create!(
  name: "premature",
  topic_type: "complication"
).move_to_child_of(preg_outcome)
abortion = Topic.create!(
  name: "abortion",
  topic_type: "procedure"
).move_to_child_of(preg_outcome)
Topic.create!(
  name: "spontaneous",
  topic_type: "complication"
).move_to_child_of(abortion)
Topic.create!(
  name: "therapeutic",
  topic_type: "complication"
).move_to_child_of(abortion)
preg_delivery = Topic.create!(
  name: "delivery",
  topic_type: "procedure"
).move_to_child_of(pregnancy)
vaginal = Topic.create!(
  name: "vaginal",
  topic_type: "procedure"
).move_to_child_of(preg_delivery)
Topic.create!(
  name: "assisted",
  topic_type: "procedure"
).move_to_child_of(vaginal)
Topic.create!(
  name: "induced - Pitocin",
  topic_type: "procedure"
).move_to_child_of(vaginal)
Topic.create!(
  name: "Caesarean",
  topic_type: "procedure"
).move_to_child_of(preg_delivery)
preg_anesthesia = Topic.create!(
  name: "anesthesia",
  topic_type: "medication"
).move_to_child_of(pregnancy)
Topic.create!(
  name: "epidural",
  topic_type: "medication",
).move_to_child_of(preg_anesthesia)
Topic.create!(
  name: "general",
  topic_type: "medication",
).move_to_child_of(preg_anesthesia)
Topic.create!(
  name: "none",
  topic_type: "medication",
).move_to_child_of(preg_anesthesia)

preg_complications = Topic.create!(
  name: "complications",
  topic_type: "medication"
).move_to_child_of(pregnancy)
Topic.create!(
  name: "uterine rupture",
  topic_type: "complication",
).move_to_child_of(preg_complications)
Topic.create!(
  name: "bleeding",
  topic_type: "complication",
).move_to_child_of(preg_complications)
Topic.create!(
  name: "laceration",
  topic_type: "complication",
).move_to_child_of(preg_complications)
Topic.create!(
  name: "lactation",
  topic_type: "complication"
).move_to_child_of(pregnancy)
## END OBSTETRIC (xls 304) ##

## BEGIN NEUROLOGIC MIGRAINES (xls 326) ##
neuro = Topic.create!(
  name: "neurologic",
  topic_type: "root category"
)
headache = Topic.create!(
  name: "headache",
  topic_type: "symptom"
).move_to_child_of(neuro)
common_migraine = Topic.create!(
  name: "common migraine",
  topic_type: "complication"
).move_to_child_of(headache)
Topic.create!(
  name: "triptans",
  topic_type: "medication"
).move_to_child_of(common_migraine)
prophylaxis_common = Topic.create!(
  name: "prophylaxis",
  topic_type: "medication"
).move_to_child_of(common_migraine)
Topic.create!(
  name: "antiepileptics",
  topic_type: "medication"
).move_to_child_of(prophylaxis_common)
Topic.create!(
  name: "Ca-blockers",
  topic_type: "medication"
).move_to_child_of(prophylaxis_common)
Topic.create!(
  name: "tricyclics",
  topic_type: "medication"
).move_to_child_of(prophylaxis_common)
classic_migraine = Topic.create!(
  name: "classic migraine",
  topic_type: "complication"
).move_to_child_of(neuro)
Topic.create!(
  name: "triptans",
  topic_type: "medication"
).move_to_child_of(classic_migraine)
prophylaxis_classic = Topic.create!(
  name: "prophylaxis",
  topic_type: "medication"
).move_to_child_of(classic_migraine)
Topic.create!(
  name: "antiepileptics",
  topic_type: "medication"
).move_to_child_of(prophylaxis_classic)
Topic.create!(
  name: "Ca-blockers",
  topic_type: "medication"
).move_to_child_of(prophylaxis_classic)
Topic.create!(
  name: "tricyclics",
  topic_type: "medication"
).move_to_child_of(prophylaxis_classic)
complex_migraine = Topic.create!(
  name: "complex migraine",
  topic_type: "complication"
).move_to_child_of(neuro)
Topic.create!(
  name: "triptans",
  topic_type: "medication"
).move_to_child_of(complex_migraine)
prophylaxis_complex = Topic.create!(
  name: "prophylaxis",
  topic_type: "medication"
).move_to_child_of(complex_migraine)
Topic.create!(
  name: "antiepileptics",
  topic_type: "medication"
).move_to_child_of(prophylaxis_complex)
Topic.create!(
  name: "Ca-blockers",
  topic_type: "medication"
).move_to_child_of(prophylaxis_complex)
Topic.create!(
  name: "tricyclics",
  topic_type: "medication"
).move_to_child_of(prophylaxis_complex)
## END NEUROLOGIC MIGRAINES (xls 329) ##

## BEGIN NEUROLOGIC LOW ICP (xls 330) ##
low_icp = Topic.create!(
  name: "low ICP",
  topic_type: "complication"
).move_to_child_of(headache)
chiari = Topic.create!(
  name: "Chiari malformation",
  topic_type: "symptom"
).move_to_child_of(low_icp)
Topic.create!(
  name: "MRI",
  topic_type: "measurement"
).move_to_child_of(chiari)
dural_ectasia = Topic.create!(
  name: "dural ectasia",
  topic_type: "symptom"
).move_to_child_of(low_icp)
Topic.create!(
  name: "MRI",
  topic_type: "measurement"
).move_to_child_of(dural_ectasia)
Topic.create!(
  name: "acute",
  topic_type: "complication"
).move_to_child_of(dural_ectasia)
Topic.create!(
  name: "chronic",
  topic_type: "complication"
).move_to_child_of(dural_ectasia)
Topic.create!(
  name: "blood patch",
  topic_type: "procedure"
).move_to_child_of(dural_ectasia)
Topic.create!(
  name: "blood patch",
  topic_type: "procedure"
).move_to_child_of(dural_ectasia)
## END NEUROLOGIC LOW ICP (xls 333) ##

## BEGIN NEUROLOGIC SHALLOW (xls 335) ##
Topic.create!(
  name: "peripheral neuropathy",
  topic_type: "complication"
).move_to_child_of(neuro)
Topic.create!(
  name: "intracranial aneurysm",
  topic_type: "complication"
).move_to_child_of(neuro)
Topic.create!(
  name: "carotid dissection",
  topic_type: "complication"
).move_to_child_of(neuro)
Topic.create!(
  name: "vertebral artery dissection",
  topic_type: "complication"
).move_to_child_of(neuro)
Topic.create!(
  name: "cervical vascular tortuosity",
  topic_type: "diagnosis"
).move_to_child_of(neuro)
## END NEUROLOGIC SHALLOW (xls 341) ##

## BEGIN GASTROINTESTINAL (xls 343) ##
gastrointestinal = Topic.create!(
  name: "gastrointestinal",
  topic_type: "root category"
)
Topic.create!(
  name: "ulcerative colitis",
  topic_type: "complication"
).move_to_child_of(gastrointestinal)
Topic.create!(
  name: "eosinophilic esophagitis",
  topic_type: "complication"
).move_to_child_of(gastrointestinal)
Topic.create!(
  name: "diaphragmattic hernia",
  topic_type: "complication"
).move_to_child_of(gastrointestinal)
Topic.create!(
  name: "intestinal rupture",
  topic_type: "complication"
).move_to_child_of(gastrointestinal)
## END GASTROINTESTINAL (xls 348) ##

## BEGIN SEEDED SYMPTOMS ##
SeededSymptom.create!(
  name: "ascending aortic dilatation",
  common_name: "ascending aortic dilatation",
  article: "an",
  plural: "ascending aortic dilatations",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Cardiovascular")

SeededSymptom.create!(
  name: "aortic dissection (ascending)",
  common_name: "ascending aortic dissection",
  article: "an",
  plural: "ascending aortic dissections",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Cardiovascular")

SeededSymptom.create!(
  name: "aortic dissection (descending)",
  common_name: "descending aortic dissection",
  article: "a",
  plural: "descending aortic dissections",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Cardiovascular")

SeededSymptom.create!(
  name: "aortic root dilatation (Z > 2)",
  common_name: "aortic root dilatation",
  article: "an",
  plural: "aortic root dilatations",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Cardiovascular")

SeededSymptom.create!(
  name: "aortic valve regurgitation",
  common_name: "aortic valve regurge",
  article: "an",
  plural: "aortic valve regurges",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Cardiovascular")

SeededSymptom.create!(
  name: "mitral valve prolapse (all types)",
  common_name: "mitral valve prolapse",
  article: "a",
  plural: "mitral valve prolapses",
  ghent_value: 1,
  beighton_value: 0,
  systemic_category: "Cardiovascular")

SeededSymptom.create!(
  name: "mitral valve regurgitation",
  common_name: "mitral valve regurge",
  article: "a",
  plural: "mitral valve regurges",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Cardiovascular")

SeededSymptom.create!(
  name: "calcification mitral annulus < 40 years",
  common_name: "mitral annulus calcification",
  article: "a",
  plural: "mitral annulus calcifications",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Cardiovascular")

SeededSymptom.create!(
  name: "bicuspid aortic valve",
  common_name: "bicuspid aortic valve",
  article: "a",
  plural: "bicuspid aortic valves",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Cardiovascular")

SeededSymptom.create!(
  name: "tortuosity of the aorta",
  common_name: "aortic tortuosity",
  article: "an",
  plural: "aortic tortuosities",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Cardiovascular")

SeededSymptom.create!(
  name: "tortuosity of carotid arteries",
  common_name: "carotid artery tortuosity",
  article: "a",
  plural: "carotid artery tortuosities",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Cardiovascular")

SeededSymptom.create!(
  name: "pulmonary artery dilatation in the absence of valvular or peripheral pulmonic stenosis < 40 years",
  common_name: "pulmonary artery dilatation",
  article: "a",
  plural: "pulmonary artery dilatations",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Cardiovascular")

SeededSymptom.create!(
  name: "heart surgery",
  common_name: "heart surgery",
  article: "a",
  plural: "heart surgeries",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Cardiovascular")

SeededSymptom.create!(
  name: "Lumbosacral dural ectasia",
  common_name: "dural ectasia",
  article: "",
  plural: "dural ectasia",
  ghent_value: 2,
  beighton_value: 0,
  systemic_category: "Dural")

SeededSymptom.create!(
  name: "crumpled helix",
  common_name: "crumpled helix",
  article: "a",
  plural: "crumpled helices",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Aural")

SeededSymptom.create!(
  name: "hearing loss",
  common_name: "loss of hearing",
  article: "a",
  plural: "losses of hearing",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Aural")

SeededSymptom.create!(
  name: "ectopia lentis (right)",
  common_name: "right dislocated lens",
  article: "a",
  plural: "right dislocated lenses",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Ocular")

SeededSymptom.create!(
  name: "ectopia lentis (left)",
  common_name: "left dislocated lens",
  article: "a",
  plural: "left dislocated lenses",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Ocular")

SeededSymptom.create!(
  name: "ectopia lentis (bilateral)",
  common_name: "bilateral dislocated lens",
  article: "a",
  plural: "bilateral dislocated lenses",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Ocular")

SeededSymptom.create!(
  name: "loss of crypt/furrows (iris)",
  common_name: "loss of iris crypt/furrows",
  article: "a",
  plural: "losses of iris crypt/furrows",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Ocular")

SeededSymptom.create!(
  name: "lattice degeneration",
  common_name: "degeneration of the lattice",
  article: "a",
  plural: "degenerations of the lattice",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Ocular")

SeededSymptom.create!(
  name: "iridodonesis",
  common_name: "tremulous iris",
  article: "a",
  plural: "tremulous irises",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Ocular")

SeededSymptom.create!(
  name: "blue sclera",
  common_name: "blue sclera",
  article: "a",
  plural: "blue sclerae",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Ocular")

SeededSymptom.create!(
  name: "hyperopia",
  common_name: "abnormally flat cornea",
  article: "an",
  plural: "abnormally flat corneas",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Ocular")

SeededSymptom.create!(
  name: "(myopia) increased axial length globe (>3 diopters)",
  common_name: "nearsightedness",
  article: "",
  plural: "myopias",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Ocular")

SeededSymptom.create!(
  name: "glaucoma",
  common_name: "glaucoma",
  article: "",
  plural: "glaucomas",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Ocular")

SeededSymptom.create!(
  name: "retinal detachment",
  common_name: "detached retina",
  article: "a",
  plural: "detached retinas",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Ocular")

SeededSymptom.create!(
  name: "spontaneous pneumothorax",
  common_name: "collapsed lung",
  article: "a",
  plural: "collapsed lungs",
  ghent_value: 2,
  beighton_value: 0,
  systemic_category: "Pulmonary")

SeededSymptom.create!(
  name: "apical blebs (chest radiography)",
  common_name: "apical blebs",
  article: "",
  plural: "apical blebs",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Pulmonary")

SeededSymptom.create!(
  name: "u""ateral recurrent or incisional hernia",
  common_name: "u""ateral hernia",
  article: "a",
  plural: "u""ateral hernias",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Integumentary")

SeededSymptom.create!(
  name: "bilateral recurrent or incisional hernia",
  common_name: "bilateral hernia",
  article: "an",
  plural: "bilateral hernias",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Integumentary")

SeededSymptom.create!(
  name: "striae atrophicae without cause",
  common_name: "stretch marks",
  article: "",
  plural: "stretch marks",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Integumentary")

SeededSymptom.create!(
  name: "soft thin skin texture",
  common_name: "soft thin skin texture",
  article: "a",
  plural: "soft thin skin textures",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Integumentary")

SeededSymptom.create!(
  name: "hyperextensible skin",
  common_name: "hyperextensible skin",
  article: "",
  plural: "hyperextensible skin",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Integumentary")

SeededSymptom.create!(
  name: "venous chest pattern",
  common_name: "venous chest pattern",
  article: "a",
  plural: "venous chest patterns",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Integumentary")

SeededSymptom.create!(
  name: "hypertrophic scar",
  common_name: "raised scarring",
  article: "",
  plural: "raised scars",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Integumentary")

SeededSymptom.create!(
  name: "hypotrophic scar",
  common_name: "sunken scarring",
  article: "",
  plural: "sunken scars",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Integumentary")

SeededSymptom.create!(
  name: "easy bruisability",
  common_name: "easy bruisability",
  article: "",
  plural: "easy bruisings",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Integumentary")

SeededSymptom.create!(
  name: "decreased subcutaneous fat",
  common_name: "decreased fat",
  article: "",
  plural: "decreased fat",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Integumentary")

SeededSymptom.create!(
  name: "dolichocephaly",
  common_name: "long, narrow face and head",
  article: "a",
  plural: "long, narrow faces and heads",
  ghent_value: 1,
  beighton_value: 0,
  systemic_category: "Skeletal (Cranium)")

SeededSymptom.create!(
  name: "enophthalmos",
  common_name: "prominent brow/deep set eyes",
  article: "a",
  plural: "prominent brows/deep set eyes",
  ghent_value: 1,
  beighton_value: 0,
  systemic_category: "Skeletal (Cranium)")

SeededSymptom.create!(
  name: "down/slanting palpebral fissure",
  common_name: "downward-slanting eyes",
  article: "",
  plural: "downward-slanting eyes",
  ghent_value: 1,
  beighton_value: 0,
  systemic_category: "Skeletal (Cranium)")

SeededSymptom.create!(
  name: "retrognathia",
  common_name: "underdeveloped mandible and/or maxilla",
  article: "an",
  plural: "underdeveloped mandibles and/or maxillae",
  ghent_value: 1,
  beighton_value: 0,
  systemic_category: "Skeletal (Cranium)")

SeededSymptom.create!(
  name: "hypertelorism",
  common_name: "increased eye distance",
  article: "an",
  plural: "increased eye distances",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Cranium)")

SeededSymptom.create!(
  name: "malar hypoplasia",
  common_name: "small cheek bones",
  article: "",
  plural: "small cheek bones",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Cranium)")

SeededSymptom.create!(
  name: "long, slender neck",
  common_name: "long, slender neck",
  article: "a",
  plural: "long, slender necks",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Cranium)")

SeededSymptom.create!(
  name: "migraines",
  common_name: "migraines",
  article: "",
  plural: "migraines",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Cranium)")

SeededSymptom.create!(
  name: "cleft palate/sub cleft",
  common_name: "cleft palate",
  article: "a",
  plural: "cleft palates",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Cranium)")

SeededSymptom.create!(
  name: "bifid uvula",
  common_name: "cleft uvula",
  article: "a",
  plural: "cleft uvulae",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Cranium)")

SeededSymptom.create!(
  name: "narrow palate",
  common_name: "narrow palate",
  article: "a",
  plural: "narrow palates",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Cranium)")

SeededSymptom.create!(
  name: "high-arched palate",
  common_name: "high-arched palate",
  article: "a",
  plural: "high-arched palates",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Cranium)")

SeededSymptom.create!(
  name: "dental crowding",
  common_name: "crowded teeth",
  article: "",
  plural: "crowded teeth",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Cranium)")

  SeededSymptom.create!(
    name: "high-arched palate with dental crowding",
    common_name: "high-arched palate with crowded teeth",
    article: "a",
    plural: "high-arched palates with crowded teeth",
    ghent_value: 0,
    beighton_value: 0,
    systemic_category: "Skeletal (Cranium)")

SeededSymptom.create!(
  name: "orthodontia",
  common_name: "orthodontia",
  article: "",
  plural: "orthodontics",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Cranium)")

SeededSymptom.create!(
  name: "caries/enamel hypoplasia",
  common_name: "incomplete enamel formation",
  article: "an",
  plural: "incomplete enamel formations",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Cranium)")

SeededSymptom.create!(
  name: "right pes planus",
  common_name: "flat right foot",
  article: "a",
  plural: "flat right feet",
  ghent_value: 1,
  beighton_value: 0,
  systemic_category: "Skeletal (Feet & Legs)")

SeededSymptom.create!(
  name: "left pes planus",
  common_name: "flat left foot",
  article: "a",
  plural: "flat left feet",
  ghent_value: 1,
  beighton_value: 0,
  systemic_category: "Skeletal (Feet & Legs)")

SeededSymptom.create!(
  name: "bilateral pes planus",
  common_name: "flat feet",
  article: "",
  plural: "flat feet",
  ghent_value: 1,
  beighton_value: 0,
  systemic_category: "Skeletal (Feet & Legs)")

SeededSymptom.create!(
  name: "right pes cavus",
  common_name: "high right instep",
  article: "a",
  plural: "high right insteps",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Feet & Legs)")

SeededSymptom.create!(
  name: "left pes cavus",
  common_name: "high left instep",
  article: "a",
  plural: "high left insteps",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Feet & Legs)")

SeededSymptom.create!(
  name: "bilateral pes cavus",
  common_name: "high insteps",
  article: "",
  plural: "high insteps",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Feet & Legs)")

SeededSymptom.create!(
  name: "right pronated arch",
  common_name: "right arch pronation",
  article: "a",
  plural: "right arch pronations",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Feet & Legs)")

SeededSymptom.create!(
  name: "left pronated arch",
  common_name: "left arch pronation",
  article: "a",
  plural: "left arch pronations",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Feet & Legs)")

SeededSymptom.create!(
  name: "bilateral pronated arches",
  common_name: "pronated arches",
  article: "",
  plural: "pronated arches",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Feet & Legs)")

SeededSymptom.create!(
  name: "hammer toe (right)",
  common_name: "right hammer toe",
  article: "a",
  plural: "right hammer toes",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Feet & Legs)")

SeededSymptom.create!(
  name: "hammer toe (left)",
  common_name: "left hammer toe",
  article: "a",
  plural: "left hammer toes",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Feet & Legs)")

SeededSymptom.create!(
  name: "hammer toe (bilateral)",
  common_name: "bilateral hammer toes",
  article: "a",
  plural: "bilateral hammer toes",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Feet & Legs)")

SeededSymptom.create!(
  name: "right long hallux",
  common_name: "long right big toe",
  article: "a",
  plural: "long right big toes",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Feet & Legs)")

SeededSymptom.create!(
  name: "left long hallux" ,
  common_name: "long left big toe",
  article: "a",
  plural: "long left big toes",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Feet & Legs)")

SeededSymptom.create!(
  name: "bilateral long halluces",
  common_name: "long big toes",
  article: "",
  plural: "long big toes",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Feet & Legs)")

SeededSymptom.create!(
  name: "right genu recurvatum",
  common_name: "backward bending right knee",
  article: "a",
  plural: "backward bending right knees",
  ghent_value: 0,
  beighton_value: 1,
  systemic_category: "Skeletal (Feet & Legs)")

SeededSymptom.create!(
  name: "left genu recurvatum",
  common_name: "backward bending left knee",
  article: "a",
  plural: "backward bending left knees",
  ghent_value: 0,
  beighton_value: 1,
  systemic_category: "Skeletal (Feet & Legs)")

SeededSymptom.create!(
  name: "bilateral genu recurvatum",
  common_name: "backward bending knees",
  article: "a",
  plural: "backward bending knees",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Feet & Legs)")

SeededSymptom.create!(
  name: "right contracture of knee",
  common_name: "contracture of the right knee",
  article: "a",
  plural: "contractures of the right knee",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Feet & Legs)")

SeededSymptom.create!(
  name: "left contracture of knee",
  common_name: "contracture of the left knee",
  article: "a",
  plural: "contractures of the left knee",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Feet & Legs)")

SeededSymptom.create!(
  name: "bilateral contracture of knees",
  common_name: "contracture of the knees",
  article: "a",
  plural: "contractures of the knees",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Feet & Legs)")

SeededSymptom.create!(
  name: "right hindfoot deformity",
  common_name: "right hindfoot deformity",
  article: "a",
  plural: "right hindfoot deformities",
  ghent_value: 2,
  beighton_value: 0,
  systemic_category: "Skeletal (Feet & Legs)")

SeededSymptom.create!(
  name: "left hindfoot deformity",
  common_name: "left hindfoot deformity",
  article: "a",
  plural: "left hindfoot deformities",
  ghent_value: 2,
  beighton_value: 0,
  systemic_category: "Skeletal (Feet & Legs)")

SeededSymptom.create!(
  name: "bilateral hindfoot deformity",
  common_name: "bilateral hindfoot deformity",
  article: "a",
  plural: "bilateral hindfoot deformities",
  ghent_value: 2,
  beighton_value: 0,
  systemic_category: "Skeletal (Feet & Legs)")

SeededSymptom.create!(
  name: "pectus carinatum",
  common_name: "pigeon chest",
  article: "a",
  plural: "pigeon chests",
  ghent_value: 2,
  beighton_value: 0,
  systemic_category: "Skeletal (General)")

SeededSymptom.create!(
  name: "pectus excavatum or chest asymmetry",
  common_name: "sunken chest or chest asymmetry",
  article: "a",
  plural: "sunken chests or chest asymmetries",
  ghent_value: 1,
  beighton_value: 0,
  systemic_category: "Skeletal (General)")

SeededSymptom.create!(
  name: "loss of lordosis",
  common_name: "loss of inward spinal curve",
  article: "a",
  plural: "losses of inward spinal curve",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (General)")

SeededSymptom.create!(
  name: "scoliosis or thoracolumbar kyphosis",
  common_name: "curvature of the spine",
  article: "a",
  plural: "curvatures of the spine",
  ghent_value: 1,
  beighton_value: 0,
  systemic_category: "Skeletal (General)")

SeededSymptom.create!(
  name: "protrusio acetabuli of any degree",
  common_name: "deep hip socket",
  article: "a",
  plural: "deep hip sockets",
  ghent_value: 2,
  beighton_value: 0,
  systemic_category: "Skeletal (General)")

SeededSymptom.create!(
  name: "aesthenic body habitus",
  common_name: "overall slender build",
  article: "an",
  plural: "overall slender builds",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (General)")

SeededSymptom.create!(
  name: "arachnodactyly",
  common_name: "long fingers and toes",
  article: "",
  plural: "long fingers and toes",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Hands & Arms)")

SeededSymptom.create!(
  name: "wrist sign",
  common_name: "wrist sign",
  article: "a",
  plural: "wrist signs",
  ghent_value: 1,
  beighton_value: 0,
  systemic_category: "Skeletal (Hands & Arms)")

SeededSymptom.create!(
  name: "thumb sign",
  common_name: "thumb sign",
  article: "a",
  plural: "thumb signs",
  ghent_value: 1,
  beighton_value: 0,
  systemic_category: "Skeletal (Hands & Arms)")

SeededSymptom.create!(
  name: "wrist and thumb sign",
  common_name: "wrist and thumb sign",
  article: "a",
  plural: "wrist and thumb signs",
  ghent_value: 3,
  beighton_value: 0,
  systemic_category: "Skeletal (Hands & Arms)")

SeededSymptom.create!(
  name: "thumb-to-arm sign (right)",
  common_name: "right thumb-to-arm sign",
  article: "a",
  plural: "right thumb-to-arm signs",
  ghent_value: 0,
  beighton_value: 1,
  systemic_category: "Skeletal (Hands & Arms)")

SeededSymptom.create!(
  name: "thumb-to-arm sign (left)",
  common_name: "left thumb-to-arm sign",
  article: "a",
  plural: "left thumb-to-arm signs",
  ghent_value: 0,
  beighton_value: 1,
  systemic_category: "Skeletal (Hands & Arms)")

SeededSymptom.create!(
  name: "f-distal hypermobile joints",
  common_name: "f-distal hypermobile joints",
  article: "",
  plural: "f-distal hypermobile joints",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Hands & Arms)")

SeededSymptom.create!(
  name: "f-proximal hypermobile joints",
  common_name: "f-proximal hypermobile joints",
  article: "",
  plural: "f-proximal hypermobile joints",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Hands & Arms)")

SeededSymptom.create!(
  name: "f-distal joint contracture",
  common_name: "f-distal joint contracture",
  article: "",
  plural: "f-distal joint contractures",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Hands & Arms)")

SeededSymptom.create!(
  name: "f-proximal joint contracture",
  common_name: "f-proximal joint contracture",
  article: "",
  plural: "f-proximal joint contractures",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Hands & Arms)")

SeededSymptom.create!(
  name: "cubitus valgus",
  common_name: "angled forearm",
  article: "an",
  plural: "angled forearms",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Hands & Arms)")

SeededSymptom.create!(
  name: "hyperextensible elbow (right)",
  common_name: "hyperextensible right elbow",
  article: "a",
  plural: "hyperextensible right elbows",
  ghent_value: 0,
  beighton_value: 1,
  systemic_category: "Skeletal (Hands & Arms)")

SeededSymptom.create!(
  name: "hyperextensible elbow (left)",
  common_name: "hyperextensible left elbow",
  article: "a",
  plural: "hyperextensible left elbows",
  ghent_value: 0,
  beighton_value: 1,
  systemic_category: "Skeletal (Hands & Arms)")

SeededSymptom.create!(
  name: "reduced elbow extension",
  common_name: "reduced elbow extension",
  article: "",
  plural: "reduced elbow extensions",
  ghent_value: 1,
  beighton_value: 0,
  systemic_category: "Skeletal (Hands & Arms)")

SeededSymptom.create!(
  name: "hypermobile shoulder",
  common_name: "hypermobile shoulder",
  article: "a",
  plural: "hypermobile shoulders",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Hands & Arms)")

SeededSymptom.create!(
  name: "contracture of shoulder",
  common_name: "contracture of shoulder",
  article: "a",
  plural: "contractures of the shoulder",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Hands & Arms)")

SeededSymptom.create!(
  name: "joint dislocation",
  common_name: "joint dislocation",
  article: "",
  plural: "joint dislocations",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Hands & Arms)")

SeededSymptom.create!(
  name: "joint pain",
  common_name: "joint pain",
  article: "",
  plural: "joint pains",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Hands & Arms)")

# SeededSymptom.create!(
#   name: ,
#   common_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   common_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   common_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   common_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   common_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   common_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   common_name: ,
#   ghent_value: ,
#   systemic_category: )

# SeededSymptom.create!(
#   name: ,
#   common_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   common_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   common_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   common_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   common_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   common_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   common_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   common_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   common_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   common_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   common_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   common_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   common_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   common_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   common_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   common_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   common_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   common_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   common_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   common_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   common_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   common_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   common_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   common_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   common_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   common_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   common_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   common_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   common_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   common_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   common_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   common_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   common_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   common_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   common_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   common_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   common_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   common_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   common_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   common_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   common_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   common_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   common_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   common_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   common_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   common_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   common_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   common_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   common_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   common_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   common_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   common_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   common_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   common_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   common_name: ,
#   ghent_value: ,
#   systemic_category: )
#
