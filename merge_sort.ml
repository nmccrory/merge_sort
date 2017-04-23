(*
 * Merge sort algorithm 
 *)
let rec split_at n l =
  match (n, l) with
  | (0, _)-> ([], l)
  | (_, [])-> ([], [])  
  | (n, h::t)-> let (l1, l2) = split_at (n-1) t in (h::l1, l2);;

let split_half l = split_at (List.length l / 2) l;;

let rec merge l r = 
	match l, r with
	| ([], _)-> r 
	| (_, [])-> l
	| (h1::t1, h2::_) when (h1 <= h2)-> let result = merge t1 r in h1::result
	| (h1::_, h2::t2)-> let result = merge l t2 in h2::result
	
let rec merge_sort l = 
	match l with
	| []-> l  
	| _::[]-> l 
	| _::_-> let (left, right) = split_half l in
				let sorted_left = merge_sort left in
				let sorted_right = merge_sort right in
				 merge sorted_left sorted_right 

let print_list l =
    List.iter (Printf.printf "%d\n") (merge_sort l);;





