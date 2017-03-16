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
  topic_type: "measurement",
  units_of_measurement: ["current", "past", "never"]
).move_to_child_of(lifestyle)
Topic.create!(
  name: "ETOH",
  topic_type: "measurement",
  units_of_measurement: ["drinks per day"]
).move_to_child_of(lifestyle)
Topic.create!(
  name: "exercise",
  topic_type: "measurement",
  units_of_measurement: ["none", "mild", "moderate", "strenuous", "competitive"]
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
  name: "propranolol",
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
  name: "betaxolol",
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
  name: "amlodipine",
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
  name: "enalapril",
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
  name: "trandolapril",
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
  topic_type: "stat",
  min_value: 0,
  max_value: 250,
  step: 1,
  units_of_measurement: ["mmHg"]
).move_to_child_of(vitals)
Topic.create!(
  name: "DBP",
  topic_type: "stat",
  min_value: 0,
  max_value: 250,
  step: 1,
  units_of_measurement: ["mmHg"]
).move_to_child_of(vitals)
Topic.create!(
  name: "heart rate",
  topic_type: "stat",
  min_value: 10,
  max_value: 200,
  step: 1,
  units_of_measurement: ["bpm"]
).move_to_child_of(vitals)
Topic.create!(
  name: "temperature",
  topic_type: "stat",
  min_value: 0.0,
  max_value: 120.0,
  step: 0.1,
  units_of_measurement: ["°C", "°F"]
).move_to_child_of(vitals)
## END VITALS (xls 66) ##

## BEGIN MORPHOLOGY (xls 68) ##
morphology = Topic.create!(
  name: "morphology/physical findings",
  topic_type: "root category"
)
Topic.create!(
  name: "weight",
  topic_type: "stat",
  min_value: 0,
  max_value: 500,
  step: 0.1,
  units_of_measurement: ["kg", "lb"]
).move_to_child_of(morphology)
Topic.create!(
  name: "height",
  topic_type: "stat",
  min_value: 0,
  max_value: 250,
  step: 0.01,
  units_of_measurement: ["m", "in"]
).move_to_child_of(morphology)
Topic.create!(
  name: "arm span",
  topic_type: "measurement",
  min_value: 0,
  max_value: 250,
  step: 0.01,
  units_of_measurement: ["m", "in"]
).move_to_child_of(morphology)
Topic.create!(
  name: "lower segment",
  topic_type: "measurement",
  min_value: 0,
  max_value: 250,
  step: 0.01,
  units_of_measurement: ["m", "in"]
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
  topic_type: "measurement",
  units_of_measurement: ["degrees"]
).move_to_child_of(thoracic_kypho)
lumbar_kypho = Topic.create!(
  name: "lumbar",
  topic_type: "complication"
).move_to_child_of(kypho)
Topic.create!(
  name: "degree",
  topic_type: "measurement",
  units_of_measurement: ["degrees"]
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
cardio_meas = Topic.create!(
  name: "aortic imaging",
  topic_type: "root category"
)
aortic_root_size = Topic.create!(
  name: "aortic root",
  topic_type: "heart_measurement"
).move_to_child_of(cardio_meas)
Topic.create!(
  name: "echo",
  topic_type: "heart_measurement",
  min_value: 1.0,
  max_value: 7.0,
  step: 0.1,
  units_of_measurement: "cm"
).move_to_child_of(aortic_root_size)
Topic.create!(
  name: "CT",
  topic_type: "heart_measurement",
  min_value: 1.0,
  max_value: 7.0,
  step: 0.1,
  units_of_measurement: "cm"
).move_to_child_of(aortic_root_size)
Topic.create!(
  name: "MRI",
  topic_type: "heart_measurement",
  min_value: 1.0,
  max_value: 7.0,
  step: 0.1,
  units_of_measurement: "cm"
).move_to_child_of(aortic_root_size)
ascending_aortic_size = Topic.create!(
  name: "ascending aortic",
  topic_type: "heart_measurement"
).move_to_child_of(cardio_meas)
Topic.create!(
  name: "echo",
  topic_type: "heart_measurement",
  min_value: 1.0,
  max_value: 6.0,
  step: 0.1,
  units_of_measurement: "cm"
).move_to_child_of(ascending_aortic_size)
Topic.create!(
  name: "CT",
  topic_type: "heart_measurement",
  min_value: 1.0,
  max_value: 6.0,
  step: 0.1,
  units_of_measurement: "cm"
).move_to_child_of(ascending_aortic_size)
Topic.create!(
  name: "MRI",
  topic_type: "heart_measurement",
  min_value: 1.0,
  max_value: 6.0,
  step: 0.1,
  units_of_measurement: "cm"
).move_to_child_of(ascending_aortic_size)
transverse_arch = Topic.create!(
  name: "transverse arch",
  topic_type: "heart_measurement"
).move_to_child_of(cardio_meas)
Topic.create!(
  name: "echo",
  topic_type: "heart_measurement",
  min_value: 1.0,
  max_value: 6.0,
  step: 0.1,
  units_of_measurement: "cm"
).move_to_child_of(transverse_arch)
Topic.create!(
  name: "CT",
  topic_type: "heart_measurement",
  min_value: 1.0,
  max_value: 6.0,
  step: 0.1,
  units_of_measurement: "cm"
).move_to_child_of(transverse_arch)
Topic.create!(
  name: "MRI",
  topic_type: "heart_measurement",
  min_value: 1.0,
  max_value: 6.0,
  step: 0.1,
  units_of_measurement: "cm"
).move_to_child_of(transverse_arch)
descending_thoracic_aorta = Topic.create!(
  name: "descending thoracic aorta",
  topic_type: "heart_measurement"
).move_to_child_of(cardio_meas)
Topic.create!(
  name: "echo",
  topic_type: "heart_measurement",
  min_value: 1.0,
  max_value: 6.0,
  step: 0.1,
  units_of_measurement: "cm"
).move_to_child_of(descending_thoracic_aorta)
Topic.create!(
  name: "CT",
  topic_type: "heart_measurement",
  min_value: 1.0,
  max_value: 6.0,
  step: 0.1,
  units_of_measurement: "cm"
).move_to_child_of(descending_thoracic_aorta)
Topic.create!(
  name: "MRI",
  topic_type: "heart_measurement",
  min_value: 1.0,
  max_value: 6.0,
  step: 0.1,
  units_of_measurement: "cm"
).move_to_child_of(descending_thoracic_aorta)
suprarenal_abdominal_aorta = Topic.create!(
  name: "suprarenal abdominal aorta",
  topic_type: "heart_measurement"
).move_to_child_of(cardio_meas)
Topic.create!(
  name: "echo",
  topic_type: "heart_measurement",
  min_value: 1.0,
  max_value: 6.0,
  step: 0.1,
  units_of_measurement: "cm"
).move_to_child_of(suprarenal_abdominal_aorta)
Topic.create!(
  name: "CT",
  topic_type: "heart_measurement",
  min_value: 1.0,
  max_value: 6.0,
  step: 0.1,
  units_of_measurement: "cm"
).move_to_child_of(suprarenal_abdominal_aorta)
Topic.create!(
  name: "MRI",
  topic_type: "heart_measurement",
  min_value: 1.0,
  max_value: 6.0,
  step: 0.1,
  units_of_measurement: "cm"
).move_to_child_of(suprarenal_abdominal_aorta)
infrarenal_abdominal_aorta = Topic.create!(
  name: "infrarenal abdominal aorta",
  topic_type: "heart_measurement"
).move_to_child_of(cardio_meas)
Topic.create!(
  name: "echo",
  topic_type: "heart_measurement",
  min_value: 1.0,
  max_value: 6.0,
  step: 0.1,
  units_of_measurement: "cm"
).move_to_child_of(infrarenal_abdominal_aorta)
Topic.create!(
  name: "CT",
  topic_type: "heart_measurement",
  min_value: 1.0,
  max_value: 6.0,
  step: 0.1,
  units_of_measurement: "cm"
).move_to_child_of(infrarenal_abdominal_aorta)
Topic.create!(
  name: "MRI",
  topic_type: "heart_measurement",
  min_value: 1.0,
  max_value: 6.0,
  step: 0.1,
  units_of_measurement: "cm"
).move_to_child_of(infrarenal_abdominal_aorta)
aortic_annulus = Topic.create!(
  name: "aortic annulus",
  topic_type: "heart_measurement"
).move_to_child_of(cardio_meas)
Topic.create!(
  name: "echo",
  topic_type: "heart_measurement",
  min_value: 1.0,
  max_value: 6.0,
  step: 0.1,
  units_of_measurement: "cm"
).move_to_child_of(aortic_annulus)
Topic.create!(
  name: "CT",
  topic_type: "heart_measurement",
  min_value: 1.0,
  max_value: 6.0,
  step: 0.1,
  units_of_measurement: "cm"
).move_to_child_of(aortic_annulus)
Topic.create!(
  name: "MRI",
  topic_type: "heart_measurement",
  min_value: 1.0,
  max_value: 6.0,
  step: 0.1,
  units_of_measurement: "cm"
).move_to_child_of(aortic_annulus)
## END AORTA MEASUREMENTS (xls 132) ##

cardio = Topic.create!(
  name: "cardiovascular",
  topic_type: "root category"
)
## BEGIN 1-DEPTH TOPICS (xls 134) ##
Topic.create!(
  name: "LVIDd",
  topic_type: "heart_measurement",
  min_value: 1.0,
  max_value: 10.0,
  step: 0.1,
  units_of_measurement: "cm"
).move_to_child_of(cardio_meas)
Topic.create!(
  name: "LVIDs",
  topic_type: "heart_measurement",
  min_value: 1.0,
  max_value: 8.0,
  step: 0.1,
  units_of_measurement: "cm"
).move_to_child_of(cardio_meas)
Topic.create!(
  name: "EF",
  topic_type: "heart_measurement",
  min_value: 20.0,
  max_value: 100.0,
  step: 1.0,
  units_of_measurement: "%"
).move_to_child_of(cardio_meas)
Topic.create!(
  name: "mitral valve prolapse",
  topic_type: "heart_measurement",
  min_value: 0,
  max_value: 1,
  step: 1,
  units_of_measurement: "presence"
).move_to_child_of(cardio_meas)
Topic.create!(
  name: "myxomatous mitral valve",
  topic_type: "heart_measurement",
  min_value: 0,
  max_value: 1,
  step: 1,
  units_of_measurement: "presence"
).move_to_child_of(cardio_meas)
Topic.create!(
  name: "mitral regurgitation severity",
  topic_type: "heart_measurement",
  min_value: 0,
  max_value: 100,
  step: 1,
  units_of_measurement: "%"
).move_to_child_of(cardio_meas)
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
).move_to_child_of(cardio_meas)
Topic.create!(
  name: "mean gradient",
  topic_type: "heart_measurement",
  min_value: 20,
  max_value: 100,
  step: 1,
  units_of_measurement: "mmHg"
).move_to_child_of(aortic_stenosis)
Topic.create!(
  name: "valve area",
  topic_type: "heart_measurement",
  min_value: 0.5,
  max_value: 3.0,
  step: 0.1,
  units_of_measurement: "cm2"
).move_to_child_of(aortic_stenosis)

Topic.create!(
  name: "aortic insufficiency severity",
  topic_type: "heart_measurement",
  min_value: 0,
  max_value: 100,
  step: 1,
  units_of_measurement: "%"
).move_to_child_of(cardio_meas)
Topic.create!(
  name: "tricuspid regurgitation severity",
  topic_type: "heart_measurement",
  min_value: 0,
  max_value: 100,
  step: 1,
  units_of_measurement: "%"
).move_to_child_of(cardio_meas)
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
  topic_type: "measurement",
  units_of_measurement: ["cm"]
).move_to_child_of(emphysema)
pft_emphysema = Topic.create!(
  name: "PFT",
  topic_type: "measurement",
  units_of_measurement: ["cm"]
).move_to_child_of(emphysema)
Topic.create!(
  name: "FEV1",
  topic_type: "measurement",
  units_of_measurement:[ "cm"]
).move_to_child_of(pft_emphysema)
restrictive_lung_disease = Topic.create!(
  name: "restrictive lung disease",
  topic_type: "complication"
).move_to_child_of(pulmonary)
pft_rld = Topic.create!(
  name: "PFT",
  topic_type: "measurement",
  units_of_measurement: ["cm"]
).move_to_child_of(restrictive_lung_disease)
Topic.create!(
  name: "FVC",
  topic_type: "measurement",
  units_of_measurement: ["cm"]
).move_to_child_of(pft_rld)
Topic.create!(
  name: "TLC",
  topic_type: "measurement",
  units_of_measurement: ["cm"]
).move_to_child_of(pft_rld)
asthma = Topic.create!(
  name: "asthma",
  topic_type: "complication"
).move_to_child_of(pulmonary)
pft_asthma = Topic.create!(
  name: "PFT",
  topic_type: "measurement",
  units_of_measurement: ["cm"]
).move_to_child_of(asthma)
Topic.create!(
  name: "FEV1",
  topic_type: "measurement",
  units_of_measurement: ["cm"]
).move_to_child_of(pft_asthma)
Topic.create!(
  name: "bronchodilator response",
  topic_type: "measurement",
  units_of_measurement: ["cm"]
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
  name: "foot",
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
  topic_type: "measurement",
  units_of_measurement: ["Z-Score", "T-Score"]
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
  topic_type: "measurement",
  units_of_measurement: ["diopters"]
).move_to_child_of(myopia)
Topic.create!(
  name: "globe length",
  topic_type: "measurement",
  units_of_measurement: ["mm"]
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
  topic_type: "measurement",
  units_of_measurement: ["left", "right", "both"]
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
  topic_type: "measurement",
  units_of_measurement: ["I", "II", "III", "IV"]
).move_to_child_of(chiari)
dural_ectasia = Topic.create!(
  name: "dural ectasia",
  topic_type: "symptom"
).move_to_child_of(low_icp)
Topic.create!(
  name: "MRI",
  topic_type: "measurement",
  units_of_measurement: ["scalloping", "dural sac ratio", "nerve root sleeve diameter", "sagittal dural sac width"]
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
