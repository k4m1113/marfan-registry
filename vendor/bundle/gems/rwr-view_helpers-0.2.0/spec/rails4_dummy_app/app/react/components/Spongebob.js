import React, { Component } from 'react';
import { imagePath } from 'rwr-view-helpers';

const Spongebob = ({ alt, size }) => {
  const sizePostfix = size > 1 ? `@${size}x` : '';
  return <img alt={alt} src={imagePath(`spongebob${sizePostfix}.png`)} />
};

export default Spongebob;
