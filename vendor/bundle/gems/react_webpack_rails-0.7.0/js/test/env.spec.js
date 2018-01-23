import expect from 'expect';
import subject from '../src/env';

describe('env', function () {
  context('when global config does not exist', function () {
    it('sets empty object', function () {
      expect(subject).toEqual({});
    });
  });
});
