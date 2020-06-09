
  const logMistake = (event) => {
    // pronunciation or voice mistake
    if (event.key === "p") {
      console.log('p clicked')
      submitMistakeForm('pronunciation');
      // grammar mistake
    } else if (event.key === "g") {
      submitMistakeForm(2);
      // content mistake
    } else if (event.key === "c") {
      submitMistakeForm(2);
      // word mistake
    } else if (event.key === "w") {
      submitMistakeForm(2);
      // silence mistake
    } else if (event.key === "s") {
      submitMistakeForm(2);
    } else if (event.key === "i") {
      submitMistakeForm(2);
  };

  document.addEventListener("keyup", logMistake);

  const submitMistakeForm = (category) => {
    const form = document.querySelector('#time-trial-mistake');
    console.log(form);
    document.querySelector('#mistake_category').value = category;
    form.querySelector('button').click();
  };
