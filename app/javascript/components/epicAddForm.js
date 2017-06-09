module.exports = function renderEpicAddForm() {
  const returnStatement = `<div class="row">
    <div class="col-sm">
      <div class="input-group">
          <input type="text" class="form-control" id="epicMed" placeholder="Epic users: .MEDSCURRENT"/>
          <span class="input-group-btn">
            <button type="button" class="btn btn-primary" data-animation="false" data-toggle="modal" data-target="#medModal" onclick="parseMed($('#epicMed').val());">
              Add Medication
            </button>
          </span>
      </div>
    </div>
  </div>
  <div id="invisible" data-rubyvar="<%= @all_meds.map{|t| [t.name.downcase, t.id]}.to_h.to_json %>"></div>

  <!-- Modal -->
  <div class="modal fade" id="medModal" tabindex="-1" role="dialog" aria-labelledby="medModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="medModalLabel">Add Medication</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <%= f.fields_for :medications, @nested_scope.medications.build do |ff| %>
          <div class="modal-body">
            <%= render 'medications/med_form_body', ff: ff %>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            <%= ff.submit "Add Medications", class: "btn btn-primary" %>
          </div>
        <% end %>
      </div>
    </div>
  </div>`;
}
function parseMed(str) {
  var medsArr = str.split("•  ");
  medsArr.shift();
  var medsJSON = []
  for (var i = 0; i < medsArr.length; i++) {
    commas = splitNoParen(medsArr[i])
    commas = commas.map(function(x) { return x.trim() });
    console.log(commas)
    if (commas[0].includes('(')) {
      firstParen = commas[0].indexOf('(')
      secondParen = commas[0].indexOf(')')
      doseSpace = commas[1].indexOf(' ')
      lastSpace = commas[1].indexOf(' ', doseSpace + 1)
      medsJSON.push(
        {
          "name": commas[0].slice(0, firstParen - 1),
          "commonName": commas[0].slice(firstParen + 1, secondParen),
          "dose": commas[1].slice(0, doseSpace),
          "doseUnitOfMeas": commas[1].slice(doseSpace + 1, lastSpace),
          "dosageForm": commas[1].slice(lastSpace + 1, commas[0].length),
          "ingestionMethod": commas[2],
          "topicID": mapMed(commas[0].slice(0, firstParen - 1), commas[0].slice(firstParen + 1, secondParen), $('#invisible').data('rubyvar'))
        }
      )
    }
    else {
      medsJSON.push(
        {
          "medicationFormat": commas[0],
          "ingestionMethod": commas[1],
          "topicID": mapMed(commas[0], commas[0], $('#invisible').data('rubyvar'))
        }
      )
    }
  }
  for (var i = 0; i < medsJSON.length; i++) {
    if (medsJSON[i]['medicationFormat']) {
      $('#unParsedMedsTable').append(
        `<tr>
          <td>
            <input value="${medsJSON[i]["medicationFormat"]}" class="form-control" type="text" name="visit[medications_attributes][${i}][name]" id="visit_medications_attributes_${i}_name" />
          </td>
          <td>
            <input value="${medsJSON[i]["ingestionMethod"]}" class="form-control" type="text" name="visit[medications_attributes][${i}][ingestion_method]" id="visit_medications_attributes_${i}_ingestion_method" />
          </td>
          <td>
            <div class="form-check form-check-inline">
              <label class="form-check-label">
                <input class="form-check-input" type="radio" name="visit[medications_attributes][${i}][current]" id="visit_medications_attributes_${i}_current_true" value="true"> Continue
              </label>
            </div>
            <div class="form-check form-check-inline">
              <label class="form-check-label">
                <input class="form-check-input" type="radio" name="visit[medications_attributes][${i}][current]" id="visit_medications_attributes_${i}_current_false" value="false"> Discontinue
              </label>
            </div>
            <input value="<%= @visit.id %>" class="form-control" type="hidden" name="visit[medications_attributes][${i}][visit_id]" id="visit_medications_attributes_${i}_visit_id" />
            <input value="<%= @patient.id %>" class="form-control" type="hidden" name="visit[medications_attributes][${i}][patient_id]" id="visit_medications_attributes_${i}_visit_id" />
            <input value="${medsJSON[i]["topicID"]}" class="form-control" type="hidden" name="visit[medications_attributes][${i}][topic_id]" id="visit_medications_attributes_${i}_topic_id" />
          </td>
        </tr>`
      )
    }
    else {
      $('#parsedMedsTable').append(
        `<tr>
          <td>
            <div class="form-inline">
              <input value="${medsJSON[i]["name"]}" class="form-control" type="text" name="visit[medications_attributes][${i}][name]" id="visit_medications_attributes_${i}_name" style=
              "max-width:8em;" />
              <input value="${medsJSON[i]["commonName"]}" class="form-control" type="text" name="visit[medications_attributes][${i}][common_name]" id="visit_medications_attributes_${i}_common_name" style=
              "max-width:8em;" />
            </div>
          </td>
          <td>
            <div class="form-inline">
              <input value="${medsJSON[i]["dose"]}" class="form-control" style="max-width:6em;" type="number" name="visit[medications_attributes][${i}][dose]" id="visit_medications_attributes_${i}_dose" />
              <input value="${medsJSON[i]["doseUnitOfMeas"]}" class="form-control" style="max-width:6em;" type="text" name="visit[medications_attributes][${i}][dose_unit_of_measurement]" id="visit_medications_attributes_${i}_dose_unit_of_measurement" />
              <input value="${medsJSON[i]["dosageForm"]}" class="form-control" type="text" name="visit[medications_attributes][${i}][dosage_form]" id="visit_medications_attributes_${i}_dosage_form" />
            </div>
          </td>
          <td>
            <input value="${medsJSON[i]["ingestionMethod"]}" class="form-control" type="text" name="visit[medications_attributes][${i}][ingestion_method]" id="visit_medications_attributes_${i}_ingestion_method" />
          </td>
          <td>
            <div class="form-check form-check-inline">
              <label class="form-check-label">
                <input class="form-check-input" type="radio" name="visit[medications_attributes][${i}][current]" id="visit_medications_attributes_${i}_current_true" value="true"> Continue
              </label>
            </div>
            <div class="form-check form-check-inline">
              <label class="form-check-label">
                <input class="form-check-input" type="radio" name="visit[medications_attributes][${i}][current]" id="visit_medications_attributes_${i}_current_false" value="false"> Discontinue
              </label>
            </div>
            <input value="<%= @visit.id %>" class="form-control" type="hidden" name="visit[medications_attributes][${i}][visit_id]" id="visit_medications_attributes_${i}_visit_id" />
            <input value="<%= @patient.id %>" class="form-control" type="hidden" name="visit[medications_attributes][${i}][patient_id]" id="visit_medications_attributes_${i}_visit_id" />
            <input value="${medsJSON[i]["topicID"]}" class="form-control" type="hidden" name="visit[medications_attributes][${i}][topic_id]" id="visit_medications_attributes_${i}_topic_id" />
          </td>
        </tr>`
      );
    }
  }
};

// Current Outpatient Prescriptions:
// •  acetaminophen (TYLENOL) 500 mg tablet, take 500 mg by mouth every 6 hours as needed (migraine headaches), Disp: , Rfl:
// •  aspirin 81 mg enteric coated tablet, take 81 mg by mouth daily, Disp: , Rfl:
// •  atenolol (TENORMIN) 25 mg tablet, take 12.5 mg by mouth 2 times a day Currently pt is taking 1/4 tab BID due to low BP., Disp: , Rfl:
// •  BIOFLAVONOIDS PO, take 1,000 mg by mouth 2 times per week, Disp: , Rfl:
// •  cranberry juice LIQD, take by mouth every day, Disp: , Rfl:
// •  docusate (COLACE) 100 mg CAPS, take 1 Cap by mouth every day, Disp: , Rfl:
// •  fluorouracil (EFUDEX) 5 % cream, by Topical route 2 times a day To affected area as directed, Disp: , Rfl:
// •  warfarin (COUMADIN) 5 mg tablet, take 5 mg by mouth daily Adjust per INR results., Disp: , Rfl:


// Current Outpatient Prescriptions:
// •  aspirin 81 mg enteric coated tablet, TAKE 1 TABLET BY MOUTH EVERY DAY, Disp: 100 Tab, Rfl: 3
// •  COSOPT OP, 1 Drop by Ophthalmic route 2 times a day. 1 drop to each eye., Disp: , Rfl:
// •  hydrochlorothiazide (HYDRODIURIL) 12.5 mg tablet, take 12.5 mg by mouth Every Day, Disp: , Rfl:
// •  levothyroxine (SYNTHROID) 50 mcg tablet, take 50 mcg by mouth every morning before breakfast, Disp: , Rfl:
// •  metoprolol (TOPROL XL) 25 mg sustained release tablet, TAKE 1 TABLET BY MOUTH EVERY MORNING, Disp: 90 Tab, Rfl: 3
// •  pantoprazole (PROTONIX) 40 mg delayed release tablet, take 1 Tab by mouth daily, Disp: 90 Tab, Rfl: 3
// •  rosuvastatin (CRESTOR) 10 mg tablet, take 1 Tab by mouth Daily at night, Disp: 90 Tab, Rfl: 3
// •  Sodium Bicarb-Sodium Chloride (NEILMED NASAFLO) PACK, by Nasal route Every Day., Disp: , Rfl:
// •  valsartan (DIOVAN) 160 mg tablet, take 1 Tab by mouth daily, Disp: 90 Tab, Rfl: 3
// •  ZYRTEC 10 mg TABS, take by mouth every morning. , Disp: , Rfl:
//
// Current Outpatient Prescriptions:
// •  azithromycin (ZITHROMAX) 500 mg tablet, take 500 mg by mouth daily as needed (bronchiectasis exacerbations) Azithromycin 500 mg Daily x 3 days as needed for bronchiectasis exacerbations., Disp: , Rfl:
// •  estradiol (ESTRADERM) 0.1 mg/24 hr twice-weekly patch, apply 1 Patch to skin, Disp: , Rfl:
// •  Progesterone 200 mg SUPP, insert 200 mg into the vagina, Disp: , Rfl:
// •  Travoprost (TRAVATAN Z) 0.004 % Drop, 1 Drop by Ophthalmic route every bedtime, Disp: , Rfl:


// Current Outpatient Prescriptions:
// •  aspirin 81 mg enteric coated tablet, take 81 mg by mouth daily.  , Disp: , Rfl:
// •  atorvastatin (LIPITOR) 40 mg tablet, take 1 Tab by mouth daily, Disp: 90 Tab, Rfl: 3
// •  clopidogrel (PLAVIX) 75 mg tablet, take 1 Tab by mouth daily, Disp: 90 Tab, Rfl: 3
// •  fluticasone (FLONASE) 50 mcg/actuation SpSn spray, 2 Sprays by Nasal route daily, Disp: 16 g, Rfl: 11
// •  lansoprazole (PREVACID) 30 mg delayed release capsule, take 1 Cap by mouth 2 times a day, Disp: 180 Cap, Rfl: 11
// •  lisinopril (PRINIVIL, ZESTRIL) 5 mg tablet, take 1 Tab by mouth daily, Disp: 90 Tab, Rfl: 3
// •  metoprolol (LOPRESSOR) 25 mg tablet, take 0.5 Tabs by mouth 2 times a day, Disp: 90 Tab, Rfl: 3
// •  mometasone (NASONEX) 50 mcg/actuation nasal spray, 2 Sprays by Nasal route daily (Patient taking differently: 2 Sprays by Nasal route daily as needed ), Disp: 1 Bottle, Rfl: 11
// •  nitroglycerin (NITROSTAT) 0.4 mg sublingual tablet, PLACE 1 TABLET UNDER THE TONGUE AND LET DISSOLVE AS NEEDED, Disp: 25 Tab, Rfl: 6
// •  ranitidine (ZANTAC) 300 mg tablet, take 300 mg by mouth Evening, Disp: 60 Tab, Rfl: 6
