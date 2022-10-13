class InlineEditForm {
  constructor(event, element){
    this.testId = element.dataset.testId

    event.preventDefault()

    InlineEditForm.formInlineHandler(this.testId)
  }

  static formInlineHandler(testId) {
    let link = document.querySelector('.form-inline-link[data-test-id="'+testId+'"]')
    let $testTitle = $('.test-title[data-test-id="'+testId+'"]')
    let $formInline = $('.form-inline[data-test-id="'+testId+'"]')

    $testTitle.toggle()
    $formInline.toggle()

    if (link) {
      if ($testTitle.is(':visible')) {
        link.textContent = 'Edit'
      } else {
        link.textContent = 'Cancel'
      }
    }
  }
}

document.addEventListener('turbolinks:load', function() {
  $('.form-inline-link').on('click', function(event) {
    new InlineEditForm(event, this)
  })

  const errors = document.querySelector('.resource-errors')

  if (errors) {
    let resourceId = errors.dataset.resourceId
    InlineEditForm.formInlineHandler(resourceId)
  }
})

