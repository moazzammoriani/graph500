let rec run_dijkstra g v intree parents distance =
    match (is_tree_complete intree v) with 
    | true -> (parents, distance)
    | false -> begin 
        match (has_no_edgenodes g v) with
        | true -> begin 
            let min_edge = get_min_edgenode intree parents distance in
            let next_vertex = get_vertex min_edge in
            set_intree intree next_vertex;
            run_dijkstra g next_vertex intree parents distance
        end
        | false -> begin 
            let edgenode = get_next_edgenode g v in 
            if ((not is_intree intree edgenode) &&
                is_shortest_dist_edge distance edgenode) then 
                set_parent parents v edgenode;
                set_distance distance v edgnode;
                run_dikstra g v intree parents distance
            else
                run_dijkstra g v intree parents distance
        end
    end

let dijkstra g start = 
    let nvertices = Array.length in
    let distance = Array.init nvertices (fun _ -> Float.infinity) in
    let intree = Array.init nvertices (fun _ -> false) in
    let gcopy = Array.copy g in
    run_dijkstra gcopy start intree parents distance 

let kernel3 g root =
    dijkstra g root
