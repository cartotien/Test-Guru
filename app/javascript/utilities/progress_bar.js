class ProgressBar{
  constructor(progress){
    this.progress = progress
    this.currenQuestionNumber = this.progress.dataset.currentQuestionNumber
    this.numberOfQuestions = this.progress.dataset.numberOfQuestions

    this.createProgressBar()
  }

  createProgressBar() {
    let progressBar = document.createElement('progress')
    progressBar.setAttribute('max', this.numberOfQuestions)
    progressBar.setAttribute('value', this.currenQuestionNumber)
    this.progress.appendChild(progressBar)
  }
}

document.addEventListener('turbolinks:load', function() { 
  const progress = document.querySelector('.progress-bar')

  if (progress) new ProgressBar(progress)
})
