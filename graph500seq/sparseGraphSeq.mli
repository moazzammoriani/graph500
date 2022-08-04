open GraphTypes

type t

(** Create a sparse graph representation able to contain vertices with labels
    lesser than or equal to [max_vertex_label]. *)
val create : max_vertex_label:int -> t

val add_edge : edge -> t -> unit

val from : vertex -> t -> (vertex * weight) list

val max_vertex_label : t -> vertex

val num_vertices : t -> int

val get_next_edgenode : t -> vertex -> vertex

val has_no_edgenodes : t -> vertex -> bool

val graph : t

val graph2 : t

(** Return a random vertex from the graph of degree at least 1. *)
val sample_vertex : t -> vertex
