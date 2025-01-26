let dualsense
function request_open_dualsense() {
	navigator.hid.requestDevice({ filters: [{ vendorId: 0x054c, productId: 0x0ce6 }] })
    .then(devices => {
      dualsense = devices[0];
      return dualsense.open(); 
    })
}

function send(packet) {
  dualsense.sendReport(0x02, packet)
}

function is_opened() {
  return (dualsense != null && dualsense.opened);
}