import React, { Component } from 'react';
import { mount, render, shallow } from 'enzyme';
import { expect } from 'chai';
import Spongebob from './Spongebob';

global.__RWR_VIEW_HELPERS__ = {
  imagePaths: {
    'spongebob.png': 'spongebob-HASH.png',
  },
},

describe('<Spongebob />', () => {
  it('should render image tag', () => {
    const wrapper = shallow(<Spongebob />);
    expect(wrapper.find('img')).to.have.length(1);
  });

  it('allows to set props', () => {
    const wrapper = mount(<Spongebob alt="A" size="B" />);
    expect(wrapper.props().alt).to.equal('A');
    expect(wrapper.props().size).to.equal('B');
  });

  it('sets proper src attribute', () => {
    const wrapper = render(<Spongebob />);
    expect(wrapper.find('img').attr('src')).to.equal('spongebob-HASH.png');
  });
});
