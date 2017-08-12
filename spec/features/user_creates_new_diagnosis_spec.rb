require 'rails_helper'
require 'spec_helper'

feature 'user adds diagnosis through visit', type: :feature do
  background do
    visit '/patients'
    click_button 'New Visit', match: :first
  end

  scenario 'neurologic diagnosis of Chiari Malformation', js: true do
    # open 'neurologic' pane from side menu
    expect(page).to have_link 'neurologic'
    click_link 'neurologic'

    # open 'diagnosis' sub-pane
    expect(page).to have_button 'diagnosis'
    expect(page).to_not have_button 'dissection'
    click_button 'diagnosis'
    expect(page.find("button[data-target='neurologic_diagnosis']")['class']).to include 'active'

    # find row and topic ID
    td = page.find('td', text: 'Chiari malformation')
    expect(td).to be_visible
    tr = td.find(:xpath, './parent::tr')
    id = tr.find('input.topic_id', visible: false).value.to_i

    # Chiari row form should be visible upon 'present' click, others should not
    tr.find('label.btn', match: :first).click
    row_form = page.find("tr.row_form#row_#{id}")
    expect(row_form).to be_visible

    # show/hide row form on pres/abs value
    tr.all('label.btn').last.click
    expect(row_form).to_not be_visible

    # reopen form and activate bootstrap-switch date toggle
    tr.find('label.btn', match: :first).click
    approx_fields = row_form.find('div.approximate')
    row_form.find('div.bootstrap-switch-wrapper').click
    exact_fields = row_form.find('div.exact')
    expect(approx_fields).to_not be_visible
    expect(exact_fields).to be_visible

    # fill in duration fields using calculator keyboard button
    random = Random.new.rand(30)
    duration_field = row_form.first("input[type='number']")
    row_form.find("input[type='date']").set '2016-01-02'
    row_form.first('button.calculator').click
    duration_calc = page.find("div#visit_diagnoses_attributes_#{id}_duration_amount_keyboard")
    expect(duration_calc).to be_visible
    duration_calc.find("input[type='text']").set random
    duration_calc.find("button[data-action='accept']").click
    expect(duration_field.value.to_i).to eq random
    row_form.first('select').find(:option, 'year(s)').select_option

    # fill in note field using text recognition

    # add attachment

    # floppy should turn blue upon new concerns added
    save_button = page.find('button#floppy')
    expect(save_button['class']).to include 'text-primary'
    save_button.click

    # expect flash[:success] of concerns added
    expect(page).to have_selector 'div.alert-success'
  end
end
