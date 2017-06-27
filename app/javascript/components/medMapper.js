// maps parsed epic med strings to preexisting database 'topics' (i.e. meds that we want to be gathering data on)
// returns:
//  (1)'topic id' integer or
//  (2) nil
module.exports = function medMapper(name, commonName, medsObj) {
  if (!!(name.match(/metoprolol/gi) || commonName.match(/toprol/gi) || commonName.match(/lopressor/) || commonName.match(/metoprolol/gi))) {
    return medsObj["metoprolol"]
  }
  else if (!!(name.match(/atenolol/gi) || commonName.match(/tenormin/gi) || name.match(/tenormin/gi) || commonName.match(/tenormin/gi))) {
    return medsObj["atenolol"]
  }
  else if (!!(name.match(/propranolol/gi) || commonName.match(/hemangeol/gi) || commonName.match(/inderal/gi) || commonName.match(/innopran/gi) || commonName.match(/propranolol/gi))) {
    return medsObj["propranolol"]
  }
  else if (!!(name.match(/carvedilol/gi) || commonName.match(/coreg/gi) || name.match(/coreg/gi) || commonName.match(/carvedilol/gi))) {
    return medsObj["carvedilol"]
  }
  else if (!!(name.match(/betaxolol/gi) || commonName.match(/kerlone/gi) || commonName.match(/kerlone/gi))) {
    return medsObj["betaxolol"]
  }
  else if (!!(name.match(/labetalol/gi) || commonName.match(/trandate/gi) || commonName.match(/normodyne/gi) || commonName.match(/labetalol/gi))) {
    return medsObj["labetalol"]
  }
  else if (!!(name.match(/losartan/gi) || commonName.match(/losartan/gi) || name.match(/cozaar/gi) || commonName.match(/cozaar/gi))) {
    return medsObj["losartan"]
  }
  else if (!!(name.match(/valsartan/gi) || commonName.match(/valsartan/gi) || name.match(/diovan/gi) || commonName.match(/diovan/gi))) {
    return medsObj["valsartan"]
  }
  else if (!!(name.match(/irbesartan/gi) || commonName.match(/irbesartan/gi) || name.match(/avapro/gi) || commonName.match(/avapro/gi))) {
    return medsObj["irbesartan"]
  }
  else if (!!(name.match(/telmisartan/gi) || commonName.match(/telmisartan/gi) || name.match(/micardis/gi) || commonName.match(/micardis/gi))) {
    return medsObj["telmisartan"]
  }
  else if (!!(name.match(/candesartan/gi) || commonName.match(/candesartan/gi) || name.match(/atacand/gi) || commonName.match(/atacand/gi))) {
    return medsObj["candesartan"]
  }
  else if (!!(name.match(/verapamil/gi) || commonName.match(/verapamil/gi) || commonName.match(/calan/gi) || commonName.match(/isoptin/gi) || commonName.match(/verelan/gi) || commonName.match(/covera/gi))) {
    return medsObj["verapamil"]
  }
  else if (!!(name.match(/diltiazem/gi) || commonName.match(/diltiazem/gi) || commonName.match(/cartia/gi) || commonName.match(/dilacor/gi) || commonName.match(/dilt/gi) || commonName.match(/matzim/gi) || commonName.match(/taztia/gi) || commonName.match(/tiazac/gi))) {
    return medsObj["diltiazem"]
  }
  else if (!!(name.match(/amlodipine/gi) || commonName.match(/amlodipine/gi) || name.match(/norvasc/gi) || commonName.match(/norvasc/gi))) {
    return medsObj["amlodipine"]
  }
  else if (!!(name.match(/nifedipine/gi) || commonName.match(/adalat/gi) || commonName.match(/afeditab/gi) || commonName.match(/nifediac/gi)|| commonName.match(/nifedical/gi) || commonName.match(/procardia/gi))) {
    return medsObj["nifedipine"]
  }
  else if (!!(name.match(/lisinopril/gi) || commonName.match(/prinivil/gi) || commonName.match(/qbrelis/gi) || commonName.match(/zestril/gi))) {
    return medsObj["lisinopril"]
  }
  else if (!!(name.match(/enalapril/gi) || commonName.match(/epaned/gi) || commonName.match(/vasotec/gi))) {
    return medsObj["enalapril"]
  }
  else if (!!(name.match(/captopril/gi) || commonName.match(/capoten/gi))) {
    return medsObj["captopril"]
  }
  else if (!!(name.match(/quinapril/gi) || commonName.match(/quinapril/gi) || name.match(/accupril/gi) || commonName.match(/accupril/gi))) {
    return medsObj["accupril"]
  }
  else if (!!(name.match(/perindopril/gi) || commonName.match(/perindopril/gi) || name.match(/aceon/gi) || commonName.match(/aceon/gi))) {
    return medsObj["perindopril"]
  }
  else if (!!(name.match(/trandolapril/gi) || commonName.match(/trandolapril/gi) || name.match(/mavik/gi) || commonName.match(/mavik/gi))) {
    return medsObj["trandolapril"]
  }
  // else if (!!(true)) {
  //   return medsObj["CPAP"]
  // }
  // else if (!!(true)) {
  //   return medsObj["bronchodilators"]
  // }
  // else if (!!(true)) {
  //   return medsObj["inhaled steroids"]
  // }
  // else if (!!(true)) {
  //   return medsObj["systemic steroids"]
  // }
  // else if (!!(true)) {
  //   return medsObj["orthotics"]
  // }
  else if (!!(name.match(/^calcium/gi) || commonName.match(/^calcium/gi))) {
    return medsObj["calcium"]
  }
  else if (!!(name.match(/vitamin d/gi) || commonName.match(/vitamin d/gi) || name.match(/ergocalciferol/gi))) {
    return medsObj["vitamin d"]
  }
  else if (!!(name.match(/calcitonin/gi) || commonName.match(/calcitonin/gi) || commonName.match(/fortical/gi) || commonName.match(/miacalcin/gi))) {
    return medsObj["calcitonin"]
  }
  else if (!!(name.match(/alendronate/gi) || name.match(/etidronate/gi) || name.match(/zoledronic/gi) || name.match(/ibandronate/gi) || name.match(/risedronate/gi) || name.match(/pamidronate/gi) || name.match(/tiludronate/gi) || commonName.match(/fosamax/gi) || commonName.match(/didronel/gi) || commonName.match(/zometa/gi) || commonName.match(/reclast/gi) ||commonName.match(/boniva/gi) || commonName.match(/aclasta/gi) || commonName.match(/atelvia/gi) || commonName.match(/actonel/gi) || commonName.match(/aredia/gi) || commonName.match(/binosto/gi) || commonName.match(/skelid/gi))) {
    return medsObj["biophosphonates"]
  }
  else if (!!(name.match(/estropipate/gi) || name.match(/estrogen/gi) || name.match(/estradiol/gi) || commonName.match(/cenestin/gi) || commonName.match(/femtrace/gi) || commonName.match(/ogen/gi) || commonName.match(/vivelle/gi) || commonName.match(/menest/gi) || commonName.match(/elestrin/gi) || commonName.match(/femring/gi) || commonName.match(/premarin/gi) || commonName.match(/evamist/gi) || commonName.match(/vagifem/gi) || commonName.match(/estrace/gi) || commonName.match(/minivelle/gi) || commonName.match(/climara/gi) || commonName.match(/divigel/gi) || commonName.match(/enjuvia/gi)|| commonName.match(/estrasorb/gi) || commonName.match(/estring/gi) || commonName.match(/estraderm/gi) || commonName.match(/estradiol/gi) || commonName.match(/yuvafem/gi) || commonName.match(/alora/gi) || commonName.match(/delestrogen/gi) || commonName.match(/esclim/gi) || commonName.match(/estradot/gi) || commonName.match(/estrogel/gi) || commonName.match(/gynodiol/gi) || commonName.match(/menostar/gi)|| commonName.match(/oesclim/gi) || commonName.match(/ogen/gi) || commonName.match(/ortho-est/gi))) {
    return medsObj["estrogen/analogue"]
  }
  else if (!!(name.match(/forteo/gi) || commonName.match(/forteo/gi) || name.match(/teriparatide/gi) || commonName.match(/teriparatide/gi))) {
    return medsObj["forteo"]
  }
  // else if (!!(true)) {
  //   return medsObj["epidural"]
  // }
  else if (!!(name.match(/triptan/gi) || commonName.match(/imitrex/gi) || commonName.match(/zomig/gi) || commonName.match(/maxalt/gi) || commonName.match(/relpax/gi) ||commonName.match(/treximet/gi) || commonName.match(/amerge/gi) || commonName.match(/frova/gi) || commonName.match(/axert/gi) || commonName.match(/sumavel/gi) || commonName.match(/zecurity/gi))) {
    return medsObj["triptans"]
  }
  else if (!!(name.match(/acetazolamide/gi) || name.match(/carbamazepine/gi) || name.match(/clobazam/gi) || name.match(/clonazepam/gi) || name.match(/eslicarbazepine/gi) || name.match(/ethosuximide/gi) || name.match(/gabapentin/gi) || name.match(/lacosamide/gi) || name.match(/lamotrigine/gi) || name.match(/levetiracetam/gi) || name.match(/nitrazepam/gi) || name.match(/oxcarbazepine/gi) || name.match(/perampanel/gi) || name.match(/piracetam/gi) || name.match(/phenobarbital/gi) || name.match(/phenytoin/gi) || name.match(/pregabalin/gi) || name.match(/primidone/gi)|| name.match(/retigabine/gi) || name.match(/rufinamide/gi) || name.match(/valproate/gi) || name.match(/stiripentol/gi) || name.match(/tiagabine/gi) || name.match(/topiramate/gi) || name.match(/vigabatrin/gi) || name.match(/zonisamide/gi) || commonName.match(/carbogen/gi) || commonName.match(/convulex/gi) || commonName.match(/desitrend/gi) || commonName.match(/diacomit/gi) || commonName.match(/diamox/gi) || commonName.match(/emeside/gi) || commonName.match(/epanutin/gi) || commonName.match(/epilim/gi) || commonName.match(/episenta/gi) || commonName.match(/epival/gi) || commonName.match(/frisium/gi) || commonName.match(/fycompa/gi) || commonName.match(/gabitril/gi) || commonName.match(/inovelon/gi) || commonName.match(/keppra/gi) || commonName.match(/lamictal/gi) || commonName.match(/lyrica/gi) || commonName.match(/neurontin/gi) || commonName.match(/nootropil/gi) || commonName.match(/phenytoin/gi) || commonName.match(/rivotril/gi) || commonName.match(/sabril/gi) || commonName.match(/tapclob/gi) || commonName.match(/tegretol/gi) || commonName.match(/topamax/gi) || commonName.match(/trileptal/gi) || commonName.match(/trobalt/gi) || commonName.match(/vimpat/gi) || commonName.match(/zarontin/gi) || commonName.match(/zebinix/gi) || commonName.match(/zonegran/gi))) {
    return medsObj["antiepileptics"]
  }
  else if (!!(name.match(/nimodipine/gi) || name.match(/isradipine/gi) || name.match(/felodipine/gi) || name.match(/nicardipine/gi) || name.match(/nisoldipine/gi) || name.match(/clevidipine/gi) || commonName.match(/nimotop/gi) || commonName.match(/dynacirc/gi) || commonName.match(/plendil/gi) || commonName.match(/cardene/gi) || commonName.match(/sular/gi) || commonName.match(/cleviprex/gi) || commonName.match(/nymalize/gi) )) {
    return medsObj["ca-blockers"]
  }
  else if (!!(name.match(/amoxapine/gi) || name.match(/desipramine/gi) || name.match(/clomipramine/gi) || name.match(/trimipramine/gi) || name.match(/amitriptyline/gi) || name.match(/nortriptyline/gi) || name.match(/imipramine/gi) || name.match(/protriptyline/gi) || name.match(/doxepin/gi) ||  commonName.match(/asendin/gi) || commonName.match(/norpramin/gi) || commonName.match(/sinequan/gi) || commonName.match(/anafranil/gi) || commonName.match(/surmontil/gi) || commonName.match(/elavil/gi) || commonName.match(/tofranil/gi) || commonName.match(/silenor/gi) || commonName.match(/pamelor/gi) || commonName.match(/vivactil/gi) || commonName.match(/vanatrip/gi) || commonName.match(/aventyl/gi))) {
    return medsObj["tricyclics"]
  }
  else {
    return medsObj["medication"]
  }
};
