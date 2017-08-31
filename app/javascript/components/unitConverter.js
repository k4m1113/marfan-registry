export default {
  unitConverter(desiredUnit, amount) {
    amount = parseFloat(amount)
    let returnValue
    if (desiredUnit == '°F') {
      returnValue = (amount * (9 / 5)) + 32
    } else if (desiredUnit == '°C') {
      returnValue = (amount - 32) * (5 / 9)
    } else if (desiredUnit == 'kg') {
      returnValue = amount * 0.45359237
    } else if (desiredUnit == 'lb') {
      returnValue = amount * 2.20462262185
    } else if (desiredUnit == 'in') {
      returnValue = amount * 39.37007874
    } else if (desiredUnit == 'm') {
      returnValue = amount * 0.0254
    }
    return Math.round(returnValue * 100) / 100
  }
}
