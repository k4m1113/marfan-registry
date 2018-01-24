import React, { Component } from 'react';
import PropTypes from 'prop-types';

export default class ScribbleButton extends Component {
  render() {
    return (
      <div className="modal" tabIndex="-1" role="dialog" aria-hidden="true" id={this.props.title + '_scribble_modal'}>
        <div className="modal-dialog modal-xl">
          <div className="modal-content scribble">
            <div className="form-inline">
              <div touch-action="none">
                <myscript-text-web
                  applicationkey={this.props.mskey}
                  hmackey={this.props.mshmac}
                  protocol="REST"
                  hideresult="true"
                  hidebuttons="true"
                  timeout="1000"
                  recognitioncandidates="3"
                  className="scribble"
                  id={this.props.title + '_scribble'}
                  language="en_US"
                />
              </div>
              <div className="btn-group-vertical">
                <button type="button" className="btn btn-primary accept">
                  <i className="fa fa-check" />
                </button>
                <button type="button" className="btn btn-primary undo">
                  <i className="fa fa-undo" />
                </button>
                <button type="button" className="btn btn-primary redo">
                  <i className="fa fa-repeat" />
                </button>
                <button type="button" className="btn btn-primary destroy">
                  <i className="fa fa-trash" />
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    );
  }
}

ScribbleButton.propTypes = {
  title: PropTypes.string.isRequired,
  mskey: PropTypes.string.isRequired,
  mshmac: PropTypes.string.isRequired,
};
