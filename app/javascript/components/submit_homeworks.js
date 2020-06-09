
const homeworkSubmission = () => {
  const homeworkSubmit = document.querySelector('#homework-submit-all');

  if (homeworkSubmit) {
    homeworkSubmit.addEventListener('click', function() {
      document.querySelectorAll('.edit_homework').forEach((form) => {
        form.querySelector('button').click()
        console.log(form);
      })
    })
  }
}


export { homeworkSubmission };
