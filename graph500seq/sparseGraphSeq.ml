open GraphTypes

type t = (vertex * weight) list array

let create ~max_vertex_label =
  assert (max_vertex_label <= 1 lsl 60); (* More than 2^60 vertices seems a bit
                                            much. *)
  Array.init (max_vertex_label + 1) (fun _ -> [])

let max_vertex_label g =
  Array.length g - 1

let add_edge (s,e,w) g =
  g.(s) <- (e,w) :: g.(s)

let from s g =
  g.(s)

let num_vertices g = 
    Array.length g

(* Takes a sparse graph g and a vertex v and returns the next edgenode 
   res in the edgenode list of v and changes the state of g with res removed
   from the edgenode list of v. *)
let get_next_edgenode g v =
    let res = List.hd g.(v) |> fst in
    let rest_edgelist = List.tl g.(v) in
    g.(v) <- rest_edgelist;
    res

let has_no_edgenodes g v = 
    g.(v) = []

let rec sample_vertex g =
  let v = Random.int (Array.length g) in
  let outgoing = g.(v) in
  if outgoing <> [] then v else sample_vertex g

let print_edgelist el = 
    let rec aux str el = 
        match el with 
        | [] -> str ^ "NULL"
        | _ -> aux (str ^ (List.hd el |> fst |> string_of_int) ^ "->") (List.tl el)
    in 
    aux "" el

let print_sparse_graph g =
    for i = 0 to (Array.length g) -1 do
        print_endline ((string_of_int i) ^ ": " ^ (print_edgelist g.(i)));
    done

let gr = [|
    [1;3];
    [0];
    [3;4];
    [0;2];
    [2]
|]

let gr2 = [|
    [];
    [2;3;7;4;8];
    [1;6];
    [1;7];
    [1];
    [6];
    [2;5;8];
    [1;3];
    [1;6];
|]


let graph = 
    Array.map 
        (fun x -> 
            List.map (fun y -> (y, 0.)) x
        ) 
    gr

let graph2 = 
    Array.map 
        (fun x -> 
            List.map (fun y -> (y, 0.)) x
        ) 
    gr2


