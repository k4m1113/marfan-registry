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
import 'select2/dist/js/select2.full.js'
import tether from 'tether'
global.Tether = tether;
import 'virtual-keyboard/dist/js/jquery.keyboard.js'
import 'whatwg-fetch'

import 'bootstrap'
import 'bootstrap-switch/dist/js/bootstrap-switch.js'
import 'font-awesome-webpack'
import '../components/epicMeds'
import '../components/medMapper'
import '../components/addKeyboard'
import '../components/row_form_pieces/RowForm'
// import 'myscript/dist/myscript.js'

require('expose-loader?parseMed!../components/parseMed');

// ROW FORM TYPES
require('expose-loader?AssembledDiagnosisForm!../components/row_form_pieces/AssembledDiagnosisForm.jsx');
require('expose-loader?AssembledDissectionForm!../components/row_form_pieces/AssembledDissectionForm.jsx');
require('expose-loader?AssembledHospitalizationForm!../components/row_form_pieces/AssembledHospitalizationForm.jsx');
require('expose-loader?AssembledMeasurementForm!../components/row_form_pieces/AssembledMeasurementForm.jsx');
require('expose-loader?AssembledMedicationForm!../components/row_form_pieces/AssembledMedicationForm.jsx');
require('expose-loader?AssembledProcedureForm!../components/row_form_pieces/AssembledProcedureForm.jsx');
require('expose-loader?renderByTopicType!../components/renderByTopicType.js');


// EXPOSING JS TO BE USED IN RAILS
// require('../../stylesheet/application.scss');
require('expose-loader?addKeyboard!../components/addKeyboard.js');
require('expose-loader?initializeRow!../components/initializeRow.js');
require('expose-loader?ScribbleButton!../components/row_form_pieces/ScribbleButton.jsx');
require('expose-loader?medMapper!../components/medMapper.js');
require('expose-loader?epicMeds!../components/epicMeds.js');
require('expose-loader?RowForm!../components/row_form_pieces/RowForm');
require('expose-loader?ReasonForVisitHeader!../components/ReasonForVisitHeader.jsx');
require('expose-loader?unitConverter!../components/unitConverter');

// require('expose-loader?MyScript!myscript/dist/myscript.js');
require('expose-loader?$!expose-loader?jQuery!jquery');
