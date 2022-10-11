document.addEventListener('turbolinks:load', function() {

  var passwordConfirmation = document.querySelector("input[name='user[password_confirmation]']")
  if (passwordConfirmation) {

    passwordConfirmation.addEventListener('input', function() {
      
      var container = document.querySelector('div.container')
      var password = document.querySelector("input[name='user[password]']")
      var paragraph = document.querySelector('p.flash')
      if (paragraph) { container.parentNode.removeChild(paragraph) }

      if (passwordConfirmation.value) {
        var paragraph = document.createElement('p')
  
        if ( password.value !== passwordConfirmation.value ) {
          var text = document.createTextNode("Passwords don't match!")
          paragraph.classList.add('flash', 'alert')
        } else {
          var text = document.createTextNode("Passwords match.")
          paragraph.classList.add('flash', 'notice')
        }
  
        paragraph.appendChild(text)
        container.parentNode.insertBefore(paragraph, container)
      } 
    })
  }
})

