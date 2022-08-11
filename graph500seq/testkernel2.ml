let () = 
    let samples = FileHandler.from_file "sample_array.data" in
    Printf.printf "first sample = %d" samples.(0);

