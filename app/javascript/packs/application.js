// require webpack-bundle

/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
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
import 'font-awesome-webpack'
import '../components/epicMeds.js'
import '../components/medMapper.js'
import '../components/rowForm.js'

require('../../stylesheet/application.scss')
require('expose-loader?$!expose-loader?jQuery!jquery');
$(document).ready(function() {
    $('body').addKeyboard();
});
