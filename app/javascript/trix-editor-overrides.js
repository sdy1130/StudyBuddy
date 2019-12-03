// Prevent all files from uploading
window.addEventListener("trix-file-accept", function(event) {
  event.preventDefault()
  alert("File attachment not supported!")
})

// Prevent all files except jpeg and png
// window.addEventListener("trix-file-accept", function(event) {
//     const acceptedTypes = ['image/jpeg', 'image/png']
//     if (!acceptedTypes.includes(event.file.type)) {
//       event.preventDefault()
//       alert("Only support attachment of jpeg or png files")
//     }
//   })