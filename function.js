let dualsense
let on_open_callback
let on_error_callback
function request_open_dualsense() {
  navigator.hid.requestDevice({ filters: [{ vendorId: 0x054c, productId: 0x0ce6 }] })
    .then(devices => {
      dualsense = devices[0];
      return dualsense.open(); // Begin a session.
    })
}

function send(packet) {
  dualsense.sendReport(0x02, packet)
}

function is_opened() {
  return (dualsense != null && dualsense.opened);
}

// function on_error() {
//   dualsense.close()
//   dualsense = null
//   on_error_callback()
// }

// function set_hid_callback(on_open, on_error) {
//   on_open_callback = on_open
//   on_error_callback = on_error
//   navigator.hid.addEventListener("disconnect", event => {
//     dualsense = null
//     on_error()
//   });
// }