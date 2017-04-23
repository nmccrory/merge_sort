open OUnit2;;

(* Test using an empty list *)
let test_empty test_ctxt = assert_equal [] (Merge_sort.merge_sort []);;

(* Test using a single-element list *)
let test_single test_ctxt = assert_equal [1] (Merge_sort.merge_sort [1]);;

(* Test using unordered unique integers *)
let unique_ints = [5; 6; 2; 4; 1; 8; 3];;
let expected_for_unique_ints = [1; 2; 3; 4; 5; 6; 8]
let test_unique_ints test_ctxt = assert_equal expected_for_unique_ints (Merge_sort.merge_sort unique_ints);;

(* Test using unordered non-unique integers *)
let non_unique_ints = [2; 2; 4; 1; 4; 2; 3; 4; 4];;
let expected_for_non_unique_ints = [1; 2; 2; 2; 3; 4; 4; 4; 4]
let test_non_unique_ints test_ctxt = assert_equal expected_for_non_unique_ints (Merge_sort.merge_sort non_unique_ints);;

let suite =
"suite">:::
 ["test_empty">:: test_empty;
  "test_single">:: test_single;
  "test_unique_ints">:: test_unique_ints;
  "test_non_unique_ints">:: test_non_unique_ints]
;;

let () = 
	run_test_tt_main suite
;;