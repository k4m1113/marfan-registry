import expect from 'expect';
import { imagePath } from '../src/index';

global.__RWR_VIEW_HELPERS__ = {
  imagePaths: {},
};

describe('RWR View Helpers', function () {
  it('should be a function', function () {
    expect(imagePath).toBeA('function');
  });

  it('should return passed path when asset is not found', function() {
    expect(imagePath('spongebob.png')).toBe('spongebob.png');
  });

  it('should return fullpath when asset is found', () => {
    global.__RWR_VIEW_HELPERS__ = {
      imagePaths: {
        'spongebob.png': 'spongebob-HASH.png',
      },
    };

    expect(imagePath('spongebob.png')).toBe('spongebob-HASH.png');
  });
});
