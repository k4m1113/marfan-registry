// require webpack-bundle

/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// layout file, like app/views/layouts/application.html.erb
// import React, { Component } from 'react'
// import { render } from 'react-dom'
// import ReactOne from '../components/react_one.jsx'
// RWR.registerComponent('ReactOne', ReactOne);
window.$ = require('jquery')

import 'jquery-ujs'
import 'jquery-ui/ui/core.js'
import 'jquery-ui/ui/position.js'
import 'jquery-ui/ui/widgets/tabs.js'
import tether from 'tether'
global.Tether = tether;
import 'virtual-keyboard/dist/js/jquery.keyboard.js'

import 'bootstrap'
import 'bootstrap-switch/dist/js/bootstrap-switch.js'
import 'font-awesome-webpack'
import 'webcomponentsjs/webcomponents-lite.js'
import '../components/epicMeds'
import '../components/medMapper'
import '../components/addKeyboard'
import '../components/nestedList'
import '../components/row_form_pieces/rowForm'
// import 'myscript-text-web/myscript-text-web.html'

require('expose-loader?parseMed!../components/parseMed');

// ROW FORM TYPES
require('expose-loader?renderProcedureForm!../components/row_form_pieces/assembledProcedureForm.js');
require('expose-loader?renderDiagnosisForm!../components/row_form_pieces/assembledDiagnosisForm.js');
require('expose-loader?renderDissectionForm!../components/row_form_pieces/assembledDissectionForm.js');
require('expose-loader?renderHospitalizationForm!../components/row_form_pieces/assembledHospitalizationForm.js');
require('expose-loader?renderMedicationForm!../components/row_form_pieces/assembledMedicationForm.js');

// EXPOSING JS TO BE USED IN RAILS
require('../../stylesheet/application.scss');
require('expose-loader?addKeyboard!../components/addKeyboard.js');
require('expose-loader?renderScribbleButton!../components/row_form_pieces/handwritingAttachmentButton.js');
require('expose-loader?mapMed!../components/medMapper.js');
require('expose-loader?splitNoParen!../components/epicMeds.js');
require('expose-loader?nestedList!../components/nestedList');
require('expose-loader?renderRowForm!../components/row_form_pieces/rowForm');
require('expose-loader?renderDiagnosisHeader!../components/visitHeader.js');
require('expose-loader?renderReasonForVisitHeader!../components/reasonForVisit.js');
require('expose-loader?unitConverter!../components/unitConverter');

require('expose-loader?$!expose-loader?jQuery!jquery');
