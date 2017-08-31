import selectConstructor from './selectConstructor'
const options = ['second(s)', 'minute(s)', 'hour(s)', 'day(s)', 'week(s)', 'month(s)', 'year(s)']

export default {
  timeAgoField(topic, parameterizedPlural, rowID = rowID) {
    let absoluteTime = ''
    switch (topic.topic_type) {
      case 'test':
        absoluteTime = 'absolute_start_date'
        break;
      case 'hospitalization':
        absoluteTime = 'admission_date'
        break;
      default:
        absoluteTime = 'absolute_start_date'
    }
    const selectTitle = 'time_ago_scale'
    const returnStatement = `<input type="checkbox" class="time_ago_toggle" id="time_ago_${rowID}_toggle" checked>
    <br />
    <div class="approximate" >
      <div class='form-inline'>
        <input type='number' name='visit[${parameterizedPlural}_attributes][${rowID}][time_ago_amount]' id='visit_${parameterizedPlural}_attributes_${rowID}_time_ago_amount' class='form-control calculator' placeholder='time ago'>
        <button class='btn btn-secondary calculator' type='button' id='${parameterizedPlural}_${rowID}_time_calc_button'><i class='fa fa-calculator'></i></button>
        ${selectConstructor(options, 'time ago', false, 'time_ago_scale', parameterizedPlural, rowID)}
      </div>
    </div>
    <div class="exact" style="display: none">
      <input type='date' name='visit[${parameterizedPlural}_attributes][${rowID}][${absoluteTime}]' id='visit_${parameterizedPlural}_attributes_${rowID}_${absoluteTime}' class='form-control'>
    </div>`;
    return returnStatement;
  }
}
