const { PrayTime } = require('praytime');
 
const praytime = new PrayTime('Egypt');

const times = praytime.utcOffset(3).location([30.5868 , 31.5026]).format('12h').getTimes();

console.log(times)
