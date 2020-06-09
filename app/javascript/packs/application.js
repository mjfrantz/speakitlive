import "bootstrap";
import { homeworkSubmission } from '../components/submit_homeworks'
// import { homeworkSubmission } from '../components/navbar';

homeworkSubmission();

// CREATING MISTAKES ON TIME TRIAL PAGE
const logMistake = (event) => {
  // pronunciation or voice mistake
  if (event.key === "p") {
    console.log('p clicked')
    submitMistakeForm('pronunciation');
    // grammar mistake
  } else if (event.key === "g") {
    submitMistakeForm('grammar');
    // content mistake
  } else if (event.key === "c") {
    submitMistakeForm('content');
    // word mistake
  } else if (event.key === "w") {
    submitMistakeForm('word choice');
    // silence mistake
  } else if (event.key === "s") {
    submitMistakeForm('silence');
  } else if (event.key === "i") {
    submitMistakeForm('incorrect answer');
  }
};

document.addEventListener("keyup", logMistake);
const submitMistakeForm = (category) => {
  const form = document.querySelector('#time-trial-mistake');
  console.log(form);
  document.querySelector('#mistake_category').value = category;
  form.querySelector('button').click();
};
// END OF CREATING MISTAKES ON TIME TRIAL PAGE









