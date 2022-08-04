let filename = try Sys.argv.(1) with _ -> ""

let sparse = FileHandler.from_file filename 


let _ = 
    if filename = "" then print_endline "You must provide a sparse graph file as input"
    else
        SparseGraphSeq.print_sparse_graph sparse
