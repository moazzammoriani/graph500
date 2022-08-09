
let from_file filename =
  let in_ = open_in filename in
  let res : 'a = Marshal.from_channel in_ in
  close_in in_;
  res

let x = "edges.data"

let y = from_file x 
