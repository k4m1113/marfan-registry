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
  topic_type: "root category"
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
  topic_type: "root category"
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
  topic_type: "root category"
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
  topic_type: "root category"
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

cardio = Topic.create!(
  name: "cardiovascular",
  topic_type: "root category"
  )

## BEGIN AORTIC MEASUREMENTS (xls 126) ##
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
  topic_type: "morphology"
).move_to_child_of(cardio)
Topic.create!(
  name: "myxomatous mitral valve",
  topic_type: "morphology"
).move_to_child_of(cardio)
Topic.create!(
  name: "mitral regurgitation severity",
  topic_type: "measurement"
).move_to_child_of(cardio)
## END 1-DEPTH TOPICS (xls 140)##

## BEGIN SHALLOW TOPICS (xls 142) ##
aortic_valve_morph = Topic.create!(
  name: "aortic valve morphology",
  topic_type: "morphology"
).move_to_child_of(cardio)
Topic.create!(
  name: "tri-leaflet",
  topic_type: "morphology"
).move_to_child_of(aortic_valve_morph)
Topic.create!(
  name: "bicuspid",
  topic_type: "morphology"
).move_to_child_of(aortic_valve_morph)
Topic.create!(
  name: "unicuspid",
  topic_type: "morphology"
).move_to_child_of(aortic_valve_morph)

aortic_stenosis = Topic.create!(
  name: "aortic stenosis",
  topic_type: "morphology"
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
).move_to_child_of("mitral_valve_surgery")
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
).move_to_child_of("mitral_valve_surgery")
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
  name: "Bronchodilator response",
  topic_type: "measurement"
).move_to_child_of(pft_asthma)
## END SHALLOW PULMONARY (xls 233) ##

## BEGIN PNEUMOTHORAX (xls 234)##

## END PNEUMOTHORAX (xls 237) ##

## BEGIN SHALLOW PULMONARY LAST (xls 238) ##

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
## END SHALLOW ORTHOPEDIC (xls 263) ##

## BEGIN OSTEOPEROSIS (xls 265) ##
## END OSTEOPEROSIS (xls 274) ##

## BEGIN SYMPTOMS (xls 276) ##
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
)
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
  name: "ectopia lentis",
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

## BEGIN NEUROLOGIC MIGRAINES (xls 326) ##
neuro = Topic.create!(
  name: "neurologic",
  topic_type: "root category"
)
headache = Topic.create!(
  name: "headache",
  topic_type: "symptom"
).move_to_child_of(neuro)
common_migraine = Topic.new!(
  name: "common migraine",
  topic_type: "complication"
).move_to_child_of(headache)
Topic.create!(
  name: "triptans",
  topic_type: "medication"
).move_to_child_of(common_migraine)
prophylaxis_common = Topic.create!(
  name: "propylaxis",
  topic_type: "medication"
).move_to_child_of(common_migraine)
Topic.create!(
  name: "antiepileptics",
  topic_type: "medication"
).move_to_child_of(propylaxis_common)
Topic.create!(
  name: "Ca-blockers",
  topic_type: "medication"
).move_to_child_of(prophylaxis_common)
Topic.create!(
  name: "tricyclics",
  topic_type: "medication"
).move_to_child_of(prophylaxis_common)
classic_migraine = Topic.new!(
  name: "classic migraine",
  topic_type: "complication"
).move_to_child_of(neuro)
Topic.create!(
  name: "triptans",
  topic_type: "medication"
).move_to_child_of(classic_migraine)
prophylaxis_classic = Topic.create!(
  name: "propylaxis",
  topic_type: "medication"
).move_to_child_of(classic_migraine)
Topic.create!(
  name: "antiepileptics",
  topic_type: "medication"
).move_to_child_of(propylaxis_classic)
Topic.create!(
  name: "Ca-blockers",
  topic_type: "medication"
).move_to_child_of(prophylaxis_classic)
Topic.create!(
  name: "tricyclics",
  topic_type: "medication"
).move_to_child_of(prophylaxis_classic)
complex_migraine = Topic.new!(
  name: "complex migraine",
  topic_type: "complication"
).move_to_child_of(neuro)
Topic.create!(
  name: "triptans",
  topic_type: "medication"
).move_to_child_of(complex_migraine)
prophylaxis_complex = Topic.create!(
  name: "propylaxis",
  topic_type: "medication"
).move_to_child_of(complex_migraine)
Topic.create!(
  name: "antiepileptics",
  topic_type: "medication"
).move_to_child_of(propylaxis_complex)
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

## BEGIN SEEDED RELATIONSHIP TYPES ##
SeededRelationshipType.create!(
  ahnentafel_id: 1,
  generation: 0,
  name: "Sibling",
  gender: "N",
  name_camelcase: "sibling",
  name_underscore: "sibling",
  description: "sibling of",
)
SeededRelationshipType.create!(
  ahnentafel_id: 2,
  generation: 1,
  name: "Father",
  gender: "M",
  name_camelcase: "father",
  name_underscore: "father",
  description: "father of",
)
SeededRelationshipType.create!(
  ahnentafel_id: 3,
  generation: 1,
  name: "Mother",
  gender: "F",
  name_camelcase: "mother",
  name_underscore: "mother",
  description: "mother of",
)
SeededRelationshipType.create!(
  ahnentafel_id: 4,
  generation: 2,
  name: "Father's father",
  gender: "M",
  name_camelcase: "fatherFather",
  name_underscore: "father_father",
  description: "paternal grandfather of",
)
SeededRelationshipType.create!(
  ahnentafel_id: 5,
  generation: 2,
  name: "Father's mother",
  gender: "F",
  name_camelcase: "fatherMother",
  name_underscore: "father_mother",
  description: "paternal grandmother of",
)
SeededRelationshipType.create!(
  ahnentafel_id: 6,
  generation: 2,
  name: "Mother's father",
  gender: "M",
  name_camelcase: "motherFather",
  name_underscore: "mother_father",
  description: "maternal grandfather of",
)
SeededRelationshipType.create!(
  ahnentafel_id: 7,
  generation: 2,
  name: "Mother's mother",
  gender: "F",
  name_camelcase: "motherMother",
  name_underscore: "mother_mother",
  description: "maternal grandmother of",
)
SeededRelationshipType.create!(
  ahnentafel_id: 8,
  generation: 3,
  name: "Father's father's father",
  gender: "M",
  name_camelcase: "fatherFatherFather",
  name_underscore: "father_father_father",
  description: "father of paternal grandfather of",
)
SeededRelationshipType.create!(
  ahnentafel_id: 9,
  generation: 3,
  name: "Father's father's mother",
  gender: "F",
  name_camelcase: "fatherFatherMother",
  name_underscore: "father_father_mother",
  description: "mother of paternal grandfather of",
)
SeededRelationshipType.create!(
  ahnentafel_id: 10,
  generation: 3,
  name: "Father's mother's father",
  gender: "M",
  name_camelcase: "fatherMotherFather",
  name_underscore: "father_mother_father",
  description: "father of paternal grandmother of",
)
SeededRelationshipType.create!(
  ahnentafel_id: 11,
  generation: 3,
  name: "Father's mother's mother",
  gender: "F",
  name_camelcase: "fatherMotherMother",
  name_underscore: "father_mother_mother",
  description: "mother of paternal grandmother of",
)
SeededRelationshipType.create!(
  ahnentafel_id: 12,
  generation: 3,
  name: "Mother's father's father",
  gender: "M",
  name_camelcase: "motherFatherFather",
  name_underscore: "mother_father_father",
  description: "father of maternal grandfather of",
)
SeededRelationshipType.create!(
  ahnentafel_id: 13,
  generation: 3,
  name: "Mother's father's mother",
  gender: "F",
  name_camelcase: "motherFatherMother",
  name_underscore: "mother_father_mother",
  description: "mother of maternal grandfather of",
)
SeededRelationshipType.create!(
  ahnentafel_id: 14,
  generation: 3,
  name: "Mother's mother's father",
  gender: "M",
  name_camelcase: "motherMotherFather",
  name_underscore: "mother_mother_father",
  description: "father of maternal grandmother of",
)

SeededRelationshipType.create!(
  ahnentafel_id: 15,
  generation: 3,
  name: "Mother's mother's mother",
  gender: "F",
  name_camelcase: "motherMotherMother",
  name_underscore: "mother_mother_mother",
  description: "mother of maternal grandmother of",
)
SeededRelationshipType.create!(
  ahnentafel_id: 16,
  generation: -1,
  name: "child",
  gender: "N",
  name_camelcase: "child",
  name_underscore: "child",
  description: "child of",
)
SeededRelationshipType.create!(
  ahnentafel_id: 17,
  generation: -2,
  name: "grandchild",
  gender: "N", name_camelcase: "grandchild",
  name_underscore: "grandchild",
  description: "grandchild of",
)
## END SEEDED RELATIONSHIP TYPES ##

## BEGIN SEEDED SYMPTOMS ##
SeededSymptom.create!(
  name: "ascending aortic dilatation",
  complex_name: "ascending aortic dilatation",
  article: "an",
  plural: "ascending aortic dilatations",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Cardiovascular")

SeededSymptom.create!(
  name: "aortic dissection (ascending)",
  complex_name: "ascending aortic dissection",
  article: "an",
  plural: "ascending aortic dissections",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Cardiovascular")

SeededSymptom.create!(
  name: "aortic dissection (descending)",
  complex_name: "descending aortic dissection",
  article: "a",
  plural: "descending aortic dissections",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Cardiovascular")

SeededSymptom.create!(
  name: "aortic root dilatation (Z > 2)",
  complex_name: "aortic root dilatation",
  article: "an",
  plural: "aortic root dilatations",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Cardiovascular")

SeededSymptom.create!(
  name: "aortic valve regurgitation",
  complex_name: "aortic valve regurge",
  article: "an",
  plural: "aortic valve regurges",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Cardiovascular")

SeededSymptom.create!(
  name: "mitral valve prolapse (all types)",
  complex_name: "mitral valve prolapse",
  article: "a",
  plural: "mitral valve prolapses",
  ghent_value: 1,
  beighton_value: 0,
  systemic_category: "Cardiovascular")

SeededSymptom.create!(
  name: "mitral valve regurgitation",
  complex_name: "mitral valve regurge",
  article: "a",
  plural: "mitral valve regurges",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Cardiovascular")

SeededSymptom.create!(
  name: "calcification mitral annulus < 40 years",
  complex_name: "mitral annulus calcification",
  article: "a",
  plural: "mitral annulus calcifications",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Cardiovascular")

SeededSymptom.create!(
  name: "bicuspid aortic valve",
  complex_name: "bicuspid aortic valve",
  article: "a",
  plural: "bicuspid aortic valves",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Cardiovascular")

SeededSymptom.create!(
  name: "tortuosity of the aorta",
  complex_name: "aortic tortuosity",
  article: "an",
  plural: "aortic tortuosities",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Cardiovascular")

SeededSymptom.create!(
  name: "tortuosity of carotid arteries",
  complex_name: "carotid artery tortuosity",
  article: "a",
  plural: "carotid artery tortuosities",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Cardiovascular")

SeededSymptom.create!(
  name: "pulmonary artery dilatation in the absence of valvular or peripheral pulmonic stenosis < 40 years",
  complex_name: "pulmonary artery dilatation",
  article: "a",
  plural: "pulmonary artery dilatations",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Cardiovascular")

SeededSymptom.create!(
  name: "heart surgery",
  complex_name: "heart surgery",
  article: "a",
  plural: "heart surgeries",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Cardiovascular")

SeededSymptom.create!(
  name: "Lumbosacral dural ectasia",
  complex_name: "dural ectasia",
  article: "",
  plural: "dural ectasia",
  ghent_value: 2,
  beighton_value: 0,
  systemic_category: "Dural")

SeededSymptom.create!(
  name: "crumpled helix",
  complex_name: "crumpled helix",
  article: "a",
  plural: "crumpled helices",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Aural")

SeededSymptom.create!(
  name: "hearing loss",
  complex_name: "loss of hearing",
  article: "a",
  plural: "losses of hearing",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Aural")

SeededSymptom.create!(
  name: "ectopia lentis (right)",
  complex_name: "right dislocated lens",
  article: "a",
  plural: "right dislocated lenses",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Ocular")

SeededSymptom.create!(
  name: "ectopia lentis (left)",
  complex_name: "left dislocated lens",
  article: "a",
  plural: "left dislocated lenses",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Ocular")

SeededSymptom.create!(
  name: "ectopia lentis (bilateral)",
  complex_name: "bilateral dislocated lens",
  article: "a",
  plural: "bilateral dislocated lenses",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Ocular")

SeededSymptom.create!(
  name: "loss of crypt/furrows (iris)",
  complex_name: "loss of iris crypt/furrows",
  article: "a",
  plural: "losses of iris crypt/furrows",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Ocular")

SeededSymptom.create!(
  name: "lattice degeneration",
  complex_name: "degeneration of the lattice",
  article: "a",
  plural: "degenerations of the lattice",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Ocular")

SeededSymptom.create!(
  name: "iridodonesis",
  complex_name: "tremulous iris",
  article: "a",
  plural: "tremulous irises",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Ocular")

SeededSymptom.create!(
  name: "blue sclera",
  complex_name: "blue sclera",
  article: "a",
  plural: "blue sclerae",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Ocular")

SeededSymptom.create!(
  name: "hyperopia",
  complex_name: "abnormally flat cornea",
  article: "an",
  plural: "abnormally flat corneas",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Ocular")

SeededSymptom.create!(
  name: "(myopia) increased axial length globe (>3 diopters)",
  complex_name: "nearsightedness",
  article: "",
  plural: "myopias",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Ocular")

SeededSymptom.create!(
  name: "glaucoma",
  complex_name: "glaucoma",
  article: "",
  plural: "glaucomas",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Ocular")

SeededSymptom.create!(
  name: "retinal detachment",
  complex_name: "detached retina",
  article: "a",
  plural: "detached retinas",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Ocular")

SeededSymptom.create!(
  name: "spontaneous pneumothorax",
  complex_name: "collapsed lung",
  article: "a",
  plural: "collapsed lungs",
  ghent_value: 2,
  beighton_value: 0,
  systemic_category: "Pulmonary")

SeededSymptom.create!(
  name: "apical blebs (chest radiography)",
  complex_name: "apical blebs",
  article: "",
  plural: "apical blebs",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Pulmonary")

SeededSymptom.create!(
  name: "u""ateral recurrent or incisional hernia",
  complex_name: "u""ateral hernia",
  article: "a",
  plural: "u""ateral hernias",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Integumentary")

SeededSymptom.create!(
  name: "bilateral recurrent or incisional hernia",
  complex_name: "bilateral hernia",
  article: "an",
  plural: "bilateral hernias",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Integumentary")

SeededSymptom.create!(
  name: "striae atrophicae without cause",
  complex_name: "stretch marks",
  article: "",
  plural: "stretch marks",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Integumentary")

SeededSymptom.create!(
  name: "soft thin skin texture",
  complex_name: "soft thin skin texture",
  article: "a",
  plural: "soft thin skin textures",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Integumentary")

SeededSymptom.create!(
  name: "hyperextensible skin",
  complex_name: "hyperextensible skin",
  article: "",
  plural: "hyperextensible skin",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Integumentary")

SeededSymptom.create!(
  name: "venous chest pattern",
  complex_name: "venous chest pattern",
  article: "a",
  plural: "venous chest patterns",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Integumentary")

SeededSymptom.create!(
  name: "hypertrophic scar",
  complex_name: "raised scarring",
  article: "",
  plural: "raised scars",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Integumentary")

SeededSymptom.create!(
  name: "hypotrophic scar",
  complex_name: "sunken scarring",
  article: "",
  plural: "sunken scars",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Integumentary")

SeededSymptom.create!(
  name: "easy bruisability",
  complex_name: "easy bruisability",
  article: "",
  plural: "easy bruisings",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Integumentary")

SeededSymptom.create!(
  name: "decreased subcutaneous fat",
  complex_name: "decreased fat",
  article: "",
  plural: "decreased fat",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Integumentary")

SeededSymptom.create!(
  name: "dolichocephaly",
  complex_name: "long, narrow face and head",
  article: "a",
  plural: "long, narrow faces and heads",
  ghent_value: 1,
  beighton_value: 0,
  systemic_category: "Skeletal (Cranium)")

SeededSymptom.create!(
  name: "enophthalmos",
  complex_name: "prominent brow/deep set eyes",
  article: "a",
  plural: "prominent brows/deep set eyes",
  ghent_value: 1,
  beighton_value: 0,
  systemic_category: "Skeletal (Cranium)")

SeededSymptom.create!(
  name: "down/slanting palpebral fissure",
  complex_name: "downward-slanting eyes",
  article: "",
  plural: "downward-slanting eyes",
  ghent_value: 1,
  beighton_value: 0,
  systemic_category: "Skeletal (Cranium)")

SeededSymptom.create!(
  name: "retrognathia",
  complex_name: "underdeveloped mandible and/or maxilla",
  article: "an",
  plural: "underdeveloped mandibles and/or maxillae",
  ghent_value: 1,
  beighton_value: 0,
  systemic_category: "Skeletal (Cranium)")

SeededSymptom.create!(
  name: "hypertelorism",
  complex_name: "increased eye distance",
  article: "an",
  plural: "increased eye distances",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Cranium)")

SeededSymptom.create!(
  name: "malar hypoplasia",
  complex_name: "small cheek bones",
  article: "",
  plural: "small cheek bones",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Cranium)")

SeededSymptom.create!(
  name: "long, slender neck",
  complex_name: "long, slender neck",
  article: "a",
  plural: "long, slender necks",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Cranium)")

SeededSymptom.create!(
  name: "migraines",
  complex_name: "migraines",
  article: "",
  plural: "migraines",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Cranium)")

SeededSymptom.create!(
  name: "cleft palate/sub cleft",
  complex_name: "cleft palate",
  article: "a",
  plural: "cleft palates",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Cranium)")

SeededSymptom.create!(
  name: "bifid uvula",
  complex_name: "cleft uvula",
  article: "a",
  plural: "cleft uvulae",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Cranium)")

SeededSymptom.create!(
  name: "narrow palate",
  complex_name: "narrow palate",
  article: "a",
  plural: "narrow palates",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Cranium)")

SeededSymptom.create!(
  name: "high-arched palate",
  complex_name: "high-arched palate",
  article: "a",
  plural: "high-arched palates",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Cranium)")

SeededSymptom.create!(
  name: "dental crowding",
  complex_name: "crowded teeth",
  article: "",
  plural: "crowded teeth",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Cranium)")

  SeededSymptom.create!(
    name: "high-arched palate with dental crowding",
    complex_name: "high-arched palate with crowded teeth",
    article: "a",
    plural: "high-arched palates with crowded teeth",
    ghent_value: 0,
    beighton_value: 0,
    systemic_category: "Skeletal (Cranium)")

SeededSymptom.create!(
  name: "orthodontia",
  complex_name: "orthodontia",
  article: "",
  plural: "orthodontics",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Cranium)")

SeededSymptom.create!(
  name: "caries/enamel hypoplasia",
  complex_name: "incomplete enamel formation",
  article: "an",
  plural: "incomplete enamel formations",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Cranium)")

SeededSymptom.create!(
  name: "right pes planus",
  complex_name: "flat right foot",
  article: "a",
  plural: "flat right feet",
  ghent_value: 1,
  beighton_value: 0,
  systemic_category: "Skeletal (Feet & Legs)")

SeededSymptom.create!(
  name: "left pes planus",
  complex_name: "flat left foot",
  article: "a",
  plural: "flat left feet",
  ghent_value: 1,
  beighton_value: 0,
  systemic_category: "Skeletal (Feet & Legs)")

SeededSymptom.create!(
  name: "bilateral pes planus",
  complex_name: "flat feet",
  article: "",
  plural: "flat feet",
  ghent_value: 1,
  beighton_value: 0,
  systemic_category: "Skeletal (Feet & Legs)")

SeededSymptom.create!(
  name: "right pes cavus",
  complex_name: "high right instep",
  article: "a",
  plural: "high right insteps",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Feet & Legs)")

SeededSymptom.create!(
  name: "left pes cavus",
  complex_name: "high left instep",
  article: "a",
  plural: "high left insteps",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Feet & Legs)")

SeededSymptom.create!(
  name: "bilateral pes cavus",
  complex_name: "high insteps",
  article: "",
  plural: "high insteps",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Feet & Legs)")

SeededSymptom.create!(
  name: "right pronated arch",
  complex_name: "right arch pronation",
  article: "a",
  plural: "right arch pronations",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Feet & Legs)")

SeededSymptom.create!(
  name: "left pronated arch",
  complex_name: "left arch pronation",
  article: "a",
  plural: "left arch pronations",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Feet & Legs)")

SeededSymptom.create!(
  name: "bilateral pronated arches",
  complex_name: "pronated arches",
  article: "",
  plural: "pronated arches",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Feet & Legs)")

SeededSymptom.create!(
  name: "hammer toe (right)",
  complex_name: "right hammer toe",
  article: "a",
  plural: "right hammer toes",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Feet & Legs)")

SeededSymptom.create!(
  name: "hammer toe (left)",
  complex_name: "left hammer toe",
  article: "a",
  plural: "left hammer toes",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Feet & Legs)")

SeededSymptom.create!(
  name: "hammer toe (bilateral)",
  complex_name: "bilateral hammer toes",
  article: "a",
  plural: "bilateral hammer toes",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Feet & Legs)")

SeededSymptom.create!(
  name: "right long hallux",
  complex_name: "long right big toe",
  article: "a",
  plural: "long right big toes",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Feet & Legs)")

SeededSymptom.create!(
  name: "left long hallux" ,
  complex_name: "long left big toe",
  article: "a",
  plural: "long left big toes",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Feet & Legs)")

SeededSymptom.create!(
  name: "bilateral long halluces",
  complex_name: "long big toes",
  article: "",
  plural: "long big toes",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Feet & Legs)")

SeededSymptom.create!(
  name: "right genu recurvatum",
  complex_name: "backward bending right knee",
  article: "a",
  plural: "backward bending right knees",
  ghent_value: 0,
  beighton_value: 1,
  systemic_category: "Skeletal (Feet & Legs)")

SeededSymptom.create!(
  name: "left genu recurvatum",
  complex_name: "backward bending left knee",
  article: "a",
  plural: "backward bending left knees",
  ghent_value: 0,
  beighton_value: 1,
  systemic_category: "Skeletal (Feet & Legs)")

SeededSymptom.create!(
  name: "bilateral genu recurvatum",
  complex_name: "backward bending knees",
  article: "a",
  plural: "backward bending knees",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Feet & Legs)")

SeededSymptom.create!(
  name: "right contracture of knee",
  complex_name: "contracture of the right knee",
  article: "a",
  plural: "contractures of the right knee",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Feet & Legs)")

SeededSymptom.create!(
  name: "left contracture of knee",
  complex_name: "contracture of the left knee",
  article: "a",
  plural: "contractures of the left knee",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Feet & Legs)")

SeededSymptom.create!(
  name: "bilateral contracture of knees",
  complex_name: "contracture of the knees",
  article: "a",
  plural: "contractures of the knees",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Feet & Legs)")

SeededSymptom.create!(
  name: "right hindfoot deformity",
  complex_name: "right hindfoot deformity",
  article: "a",
  plural: "right hindfoot deformities",
  ghent_value: 2,
  beighton_value: 0,
  systemic_category: "Skeletal (Feet & Legs)")

SeededSymptom.create!(
  name: "left hindfoot deformity",
  complex_name: "left hindfoot deformity",
  article: "a",
  plural: "left hindfoot deformities",
  ghent_value: 2,
  beighton_value: 0,
  systemic_category: "Skeletal (Feet & Legs)")

SeededSymptom.create!(
  name: "bilateral hindfoot deformity",
  complex_name: "bilateral hindfoot deformity",
  article: "a",
  plural: "bilateral hindfoot deformities",
  ghent_value: 2,
  beighton_value: 0,
  systemic_category: "Skeletal (Feet & Legs)")

SeededSymptom.create!(
  name: "pectus carinatum",
  complex_name: "pigeon chest",
  article: "a",
  plural: "pigeon chests",
  ghent_value: 2,
  beighton_value: 0,
  systemic_category: "Skeletal (General)")

SeededSymptom.create!(
  name: "pectus excavatum or chest asymmetry",
  complex_name: "sunken chest or chest asymmetry",
  article: "a",
  plural: "sunken chests or chest asymmetries",
  ghent_value: 1,
  beighton_value: 0,
  systemic_category: "Skeletal (General)")

SeededSymptom.create!(
  name: "loss of lordosis",
  complex_name: "loss of inward spinal curve",
  article: "a",
  plural: "losses of inward spinal curve",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (General)")

SeededSymptom.create!(
  name: "scoliosis or thoracolumbar kyphosis",
  complex_name: "curvature of the spine",
  article: "a",
  plural: "curvatures of the spine",
  ghent_value: 1,
  beighton_value: 0,
  systemic_category: "Skeletal (General)")

SeededSymptom.create!(
  name: "protrusio acetabuli of any degree",
  complex_name: "deep hip socket",
  article: "a",
  plural: "deep hip sockets",
  ghent_value: 2,
  beighton_value: 0,
  systemic_category: "Skeletal (General)")

SeededSymptom.create!(
  name: "aesthenic body habitus",
  complex_name: "overall slender build",
  article: "an",
  plural: "overall slender builds",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (General)")

SeededSymptom.create!(
  name: "arachnodactyly",
  complex_name: "long fingers and toes",
  article: "",
  plural: "long fingers and toes",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Hands & Arms)")

SeededSymptom.create!(
  name: "wrist sign",
  complex_name: "wrist sign",
  article: "a",
  plural: "wrist signs",
  ghent_value: 1,
  beighton_value: 0,
  systemic_category: "Skeletal (Hands & Arms)")

SeededSymptom.create!(
  name: "thumb sign",
  complex_name: "thumb sign",
  article: "a",
  plural: "thumb signs",
  ghent_value: 1,
  beighton_value: 0,
  systemic_category: "Skeletal (Hands & Arms)")

SeededSymptom.create!(
  name: "wrist and thumb sign",
  complex_name: "wrist and thumb sign",
  article: "a",
  plural: "wrist and thumb signs",
  ghent_value: 3,
  beighton_value: 0,
  systemic_category: "Skeletal (Hands & Arms)")

SeededSymptom.create!(
  name: "thumb-to-arm sign (right)",
  complex_name: "right thumb-to-arm sign",
  article: "a",
  plural: "right thumb-to-arm signs",
  ghent_value: 0,
  beighton_value: 1,
  systemic_category: "Skeletal (Hands & Arms)")

SeededSymptom.create!(
  name: "thumb-to-arm sign (left)",
  complex_name: "left thumb-to-arm sign",
  article: "a",
  plural: "left thumb-to-arm signs",
  ghent_value: 0,
  beighton_value: 1,
  systemic_category: "Skeletal (Hands & Arms)")

SeededSymptom.create!(
  name: "f-distal hypermobile joints",
  complex_name: "f-distal hypermobile joints",
  article: "",
  plural: "f-distal hypermobile joints",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Hands & Arms)")

SeededSymptom.create!(
  name: "f-proximal hypermobile joints",
  complex_name: "f-proximal hypermobile joints",
  article: "",
  plural: "f-proximal hypermobile joints",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Hands & Arms)")

SeededSymptom.create!(
  name: "f-distal joint contracture",
  complex_name: "f-distal joint contracture",
  article: "",
  plural: "f-distal joint contractures",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Hands & Arms)")

SeededSymptom.create!(
  name: "f-proximal joint contracture",
  complex_name: "f-proximal joint contracture",
  article: "",
  plural: "f-proximal joint contractures",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Hands & Arms)")

SeededSymptom.create!(
  name: "cubitus valgus",
  complex_name: "angled forearm",
  article: "an",
  plural: "angled forearms",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Hands & Arms)")

SeededSymptom.create!(
  name: "hyperextensible elbow (right)",
  complex_name: "hyperextensible right elbow",
  article: "a",
  plural: "hyperextensible right elbows",
  ghent_value: 0,
  beighton_value: 1,
  systemic_category: "Skeletal (Hands & Arms)")

SeededSymptom.create!(
  name: "hyperextensible elbow (left)",
  complex_name: "hyperextensible left elbow",
  article: "a",
  plural: "hyperextensible left elbows",
  ghent_value: 0,
  beighton_value: 1,
  systemic_category: "Skeletal (Hands & Arms)")

SeededSymptom.create!(
  name: "reduced elbow extension",
  complex_name: "reduced elbow extension",
  article: "",
  plural: "reduced elbow extensions",
  ghent_value: 1,
  beighton_value: 0,
  systemic_category: "Skeletal (Hands & Arms)")

SeededSymptom.create!(
  name: "hypermobile shoulder",
  complex_name: "hypermobile shoulder",
  article: "a",
  plural: "hypermobile shoulders",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Hands & Arms)")

SeededSymptom.create!(
  name: "contracture of shoulder",
  complex_name: "contracture of shoulder",
  article: "a",
  plural: "contractures of the shoulder",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Hands & Arms)")

SeededSymptom.create!(
  name: "joint dislocation",
  complex_name: "joint dislocation",
  article: "",
  plural: "joint dislocations",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Hands & Arms)")

SeededSymptom.create!(
  name: "joint pain",
  complex_name: "joint pain",
  article: "",
  plural: "joint pains",
  ghent_value: 0,
  beighton_value: 0,
  systemic_category: "Skeletal (Hands & Arms)")

# SeededSymptom.create!(
#   name: ,
#   complex_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   complex_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   complex_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   complex_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   complex_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   complex_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   complex_name: ,
#   ghent_value: ,
#   systemic_category: )

# SeededSymptom.create!(
#   name: ,
#   complex_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   complex_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   complex_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   complex_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   complex_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   complex_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   complex_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   complex_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   complex_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   complex_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   complex_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   complex_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   complex_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   complex_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   complex_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   complex_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   complex_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   complex_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   complex_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   complex_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   complex_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   complex_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   complex_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   complex_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   complex_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   complex_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   complex_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   complex_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   complex_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   complex_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   complex_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   complex_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   complex_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   complex_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   complex_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   complex_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   complex_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   complex_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   complex_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   complex_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   complex_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   complex_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   complex_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   complex_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   complex_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   complex_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   complex_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   complex_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   complex_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   complex_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   complex_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   complex_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   complex_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   complex_name: ,
#   ghent_value: ,
#   systemic_category: )
#
# SeededSymptom.create!(
#   name: ,
#   complex_name: ,
#   ghent_value: ,
#   systemic_category: )
#
