// var Timer = require('easytimer.js').Timer;
// var timerInstance = new easytimer.Timer();
// var timer = new Timer();


import Timer from 'easytimer.js';

var timer = new Timer();
let defaultTime;

const timerForm = document.querySelector('#time-trial-seconds')

if (timerForm) {
  const secondUpdateForm = document.querySelector('#time-trial-update-seconds')

  const secondsGoal = parseInt(document.querySelector('#seconds-goal').innerHTML, 10)

  document.querySelector('.startButton').addEventListener('click', function (event) {
    const defaultTimeValue = document.querySelector('#time-trial-current-time').value
    if (defaultTimeValue === "") {
      defaultTime = 0
    } else {
      defaultTime = parseInt(defaultTimeValue, 10)
    }
    console.log('clicked')
    timer.start({ precision: 'secondTenths', startValues: { seconds: defaultTime }, target: { seconds: secondsGoal } });
    // TODO: Does this form need submitted anymore?
    // document.querySelector('#time-trial-start button').click();
    event.currentTarget.style = 'display:none'
    document.querySelector('.stopButton').style = 'display:block'
  });

  // $('#chronoExample .pauseButton').click(function () {
  //     timer.pause();
  // });
  $('#chronoExample .stopButton').click(function () {
    timer.stop();
    secondUpdateForm.querySelector('button').click();
  });
  // $('#chronoExample .resetButton').click(function () {
  //     timer.reset();
  // });
  timer.addEventListener('secondTenthsUpdated', function (e) {
    // 1. get the seconds input (by id?)
    // document.querySelector('.values') - not doing anything
    // 2. set the seconds input value to current seconds ellapsed
    $('#chronoExample .values').html(timer.getTimeValues().toString(['minutes', 'seconds', 'secondTenths']));
    // TODO: This next line gets updated when the recording is submitted, right?
    timerForm.querySelector('#time_trial_seconds').value = timer.getTotalTimeValues().seconds
    // TODO: What was this line doing?
    secondUpdateForm.querySelector('#time_trial_seconds').value = timer.getTotalTimeValues().seconds
  });
  timer.addEventListener('started', function (e) {
    $('#chronoExample .values').html(timer.getTimeValues().toString());
  });
  // timer.addEventListener('reset', function (e) {
  //     $('#chronoExample .values').html(timer.getTimeValues().toString());
  // });
  timer.addEventListener('targetAchieved', function (e) {
    $('.progress_bar').html('COMPLETE!!');
  });

}

