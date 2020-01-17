#use "projet.ml";;
#use "display.ml";;
#use "skeltest.ml";;


(**

Résultat affiché dans le terminal (OCaml version 4.05.0):

    ===============================================================
    Comparaison           : distance_opti: obj0_1v1 / obj0_2v1
    Distance              : 1
    Associations          : (1,1) -> (3,2) -> (5,4) -> (6,5) -> (4,3) -> (7,6) -> (8,7)
    Contractions gauche   : (1,2)
    Contractions droite   :
    ===============================================================
    ===============================================================
    Comparaison           : distance_opti: obj1_1v5 / obj1_2v4
    Distance              : 0
    Associations          : (5,4) -> (10,9) -> (8,8) -> (2,3) -> (9,10) -> (1,1) -> (3,2) -> (4,6) -> (7,7) -> (6,5)
    Contractions gauche   :
    Contractions droite   :
    ===============================================================
    ===============================================================
    Comparaison           : distance_opti: obj1_1v5 / obj1_3v3
    Distance              : 2
    Associations          : (5,3) -> (10,10) -> (8,8) -> (2,1) -> (9,7) -> (3,4) -> (4,9) -> (7,6) -> (6,5)
    Contractions gauche   : (2,1)
    Contractions droite   : (1,2)
    ===============================================================
    ===============================================================
    Comparaison           : distance_opti: obj2_1v3 / obj2_2v1
    Distance              : 2
    Associations          : (3,1) -> (7,5) -> (8,4) -> (2,2) -> (1,3) -> (6,8) -> (4,6)
    Contractions gauche   : (2,5)
    Contractions droite   : (2,7)
    ===============================================================
    ===============================================================
    Comparaison           : distance_opti: obj4_1v1 / obj5_1v1
    Distance              : 14
    Associations          : (1,1) -> (2,9)
    Contractions gauche   : (1,9) -> (1,8) -> (1,7) -> (1,6) -> (1,5) -> (1,4) -> (1,3)
    Contractions droite   : (1,2) -> (1,3) -> (1,4) -> (1,5) -> (1,6) -> (1,7) -> (1,8)
    ===============================================================
    --------------------- TESTS -------------------------
    [ OK  ]: associate
    [ OK  ]: separate
    [ OK  ]: contract
    [ OK  ]: insert
    [ OK  ]: associate_for
    [ OK  ]: contract_for
    [ OK  ]: unmarked
    [ OK  ]: equals
    [ OK  ]: distance
    [ OK  ]: distance_opti[test 1/2]
    [ OK  ]: distance_opti[test 2/2]
    --------------------- TESTS -------------------------
    Scrollez plus haut dans le terminal pour voir le détail des executions
*)


(*Utilitaire*)

(* Fonction de test manuel de la fonction distance *)
(* Elle affiche d'une manière lisible le résultat de son éxecution *)
let distance_verbose name (cost, l0, l1, l2) =
    let rec list_detail l =
        match l with
        | [] -> ""
        | h::tail ->
            let (a, b) = h in
                String.concat
                    ""
                    ([
                        "(";
                        string_of_int (Vertex.indice (V.label a));
                        ",";
                        string_of_int (Vertex.indice (V.label b));
                        ")"
                    ] @ (if tail = [] then [] else [" -> "]) @ [list_detail tail])
    in
        print_string(
            String.concat
                ""
                ([
                    "===============================================================\n";
                    "Comparaison           : "; name; "\n";
                    "Distance              : "; string_of_int cost; "\n";
                    "Associations          : " ] @ [list_detail l0] @ [ "\n";
                    "Contractions gauche   : " ] @ [list_detail l1] @ [ "\n";
                    "Contractions droite   : " ] @ [list_detail l2] @ [ "\n";
                    "===============================================================\n"
                ])
        )
;;

(* Applique une liste de contractions effectuées depuis un renvoi de distance *)
let apply_contractions g contractions =
    List.iter
        (fun (v1, v2) ->
            contract g v1 v2;
            ()
        ) (List.rev contractions)
;;

(* Renseigne de la durée d'execution d'une fonction *)
let benchmark job =
    let t1 = Sys.time() in
    job();
    Sys.time() -. t1
;;

(* Renseigne de la durée d'execution dont la signature est la même que celle de distance_% *)
(* Pour appeler: benchmark_dist distance obj1_1 obj1_1v5 obj1_3 obj1_3v3 *)
let benchmark_dist g1 v1 g2 v2 =
    let delta1 = benchmark (fun () -> distance g1 v1 g2 v2)
    and delta2 = benchmark (fun () -> distance_opti g1 v1 g2 v2) in
    delta1 /. delta2
;;


(*Tests*)
let associate_test =
    associate obj1_1v3 obj1_3v2;
    if (Mark.get obj1_1v3 = Vertex.indice (V.label obj1_3v2)
        && Mark.get obj1_3v2 = Vertex.indice (V.label obj1_1v3)
        && Mark.get obj1_1v3 = 2
        && Mark.get obj1_3v2 = 3) then (true, "associate")
    else (false, "associate")
;;

let separate_test =
    associate obj1_2v1 obj1_1v1;
    separate obj1_2v1 obj1_1v1;
    (Mark.get obj1_2v1 = 0 && Mark.get obj1_1v1 = 0, "separate")
;;

let old_succ_1 = contract obj1_1 obj1_1v2 obj1_1v1;;
let old_succ_2 = contract obj2_2 obj2_2v1 obj2_2v5;;
let contract_test =
    let check =
        List.length old_succ_1 = 2 (* 6 et 3 *)
        && List.exists (fun v -> v = obj1_1v6) old_succ_1 (* 6 *)
        && List.exists (fun v -> v = obj1_1v3) old_succ_1 (* 3 *)
        && List.length old_succ_2 = 0 (* 5 n'a pas de successeurs a part 1 *)
    in
        (check, "contract")
;;

let insert_test =
    insert obj1_1 obj1_1v2 obj1_1v1 old_succ_1;
    insert obj2_2 obj2_2v1 obj2_2v5 old_succ_2;
    let succ_1 = succ obj1_1 obj1_1v1 in
    let succ_2 = succ obj2_2 obj2_2v5 in
    let check =
        List.length succ_1 = 3 (* 1 a récupéré ses succ. *)
        && List.exists (fun v -> v = obj1_1v2) succ_1
        && List.exists (fun v -> v = obj1_1v3) succ_1
        && List.exists (fun v -> v = obj1_1v6) succ_1
        && List.length succ_2 = 1
        && List.exists (fun v -> v = obj2_2v1) succ_2
    in (check, "insert")
;;

let associate_for_test =
    associate_for (fun v -> ()) obj1_1v2 obj1_2v3;
    (Mark.get obj1_1v2 = 0 && Mark.get obj1_2v3 = 0, "associate_for")
;;

let contract_for_test =
    contract_for (fun v -> ()) obj1_1 obj1_1v1 obj1_1v3;
    let succ_1 = succ obj1_1 obj1_1v3 in
    let check =
        List.length succ_1 = 3 (* '3' a récupéré ses 3 succ. *)
        && List.exists (fun v -> v = obj1_1v1) succ_1 (* 1 *)
        && List.exists (fun v -> v = obj1_1v4) succ_1 (* 4 *)
        && List.exists (fun v -> v = obj1_1v7) succ_1 (* 7 *)
    in (check, "contract_for")
;;

let get_all_vertex g = fold_vertex (fun a l -> a::l) g [];;
let unmarked_test =
    Mark.clear obj1_1;
    Mark.set obj1_1v1 2;
    let check =
        not (List.exists
                (fun v -> v = obj1_1v1)
                (unmarked (get_all_vertex obj1_1)))
    in (check, "unmarked")
;;

let equals_test =
    let (eq1_b, _) = equals obj1_1 obj1_1v5 obj1_2 obj1_2v4
    and (eq2_b, _) = equals obj1_1 obj1_1v4 obj1_2 obj1_2v4
    and (eq3_b, _) = equals obj1_1 obj1_1v5 obj1_3 obj1_3v3 in
    let check =
        eq1_b
        && not eq2_b
        && not eq3_b
    in (check, "equals")
;;


(* De nombreux tests ont été effectués ici:
    - j'ai vérifié manuellement que la solution donnée était bien la solution optimale pour tous les exemples
        du sujet ainsi que 3 supplémentaires (objets obj0_1, obj0_2, obj4_1, obj5_1)
        (fonction 'distance_verbose')
    - j'ai vérifié que les données étaient cohérentes (nombre d'éléments dans l0, l1, l2)
        c'est à dire que (nb de contractions dans g1 + nb d'assocations = length(l0)+length(l1) = nb vertex dans g1)
    - j'ai vérifié que les arbres obtenus en appliquant les contractions obtenues par 'distance'
        étaient bien égaux.
        (fonction distance_test_equals g1 v1 g2 v2)
*)
(* calcule la distance - applique les contractions - vérifie l'égalité *)
(* ne vérifie pas l'optimalité par conséquent *)
let distance_test_equals g1 v1 g2 v2 =
    let g1_copy = copy g1
    and g2_copy = copy g2 in
    let v1_copy = List.hd (fold_vertex (fun v l -> if V.label v = V.label v1 then v::l else l) g1_copy [])
    and v2_copy = List.hd (fold_vertex (fun v l -> if V.label v = V.label v2 then v::l else l) g2_copy []) in
    let (c, l0, l1, l2) = distance_opti g1_copy v1_copy g2_copy v2_copy in
    apply_contractions g1_copy l1;
    apply_contractions g2_copy l2;
    let (are_equals, a) = equals g1_copy v1_copy g2_copy v2_copy in
    are_equals
;;

print_string
    (String.concat
        "" [
            "\n\n\n\n\n\n\n";
            "=================================================================\n";
            "Veuillez patienter, les tests suivants peuvent prendre du temps..\n";
            "=================================================================\n";
            "\n\n\n\n"
        ]);;

(* j'ai commenté quelques tests pour que cela ne dure pas trop longtemps.. *)
let distance_test =
    (*let (d0_c, d0_l0, d0_l1, d0_l2) = distance obj0_1 obj0_1v1 obj0_2 obj0_2v1 in
    let (d1_c, d1_l0, d1_l1, d1_l2) = distance obj1_1 obj1_1v5 obj1_2 obj1_2v4 in*)
    let (d2_c, d2_l0, d2_l1, d2_l2) = distance obj1_1 obj1_1v5 obj1_3 obj1_3v3 in
    let (d3_c, d3_l0, d3_l1, d3_l2) = distance obj2_1 obj2_1v3 obj2_2 obj2_2v1 in
    let check =
        (*
        d0_c = 1
            && (nb_vertex obj0_1) = List.length d0_l0 + List.length d0_l1
            && (nb_vertex obj0_2) = List.length d0_l0 + List.length d0_l2
        && d1_c = 0
            && (nb_vertex obj1_1) = List.length d1_l0 + List.length d1_l1
            && (nb_vertex obj1_2) = List.length d1_l0 + List.length d1_l2
        && *) d2_c = 2
            && (nb_vertex obj1_1) = List.length d2_l0 + List.length d2_l1
            && (nb_vertex obj1_3) = List.length d2_l0 + List.length d2_l2
        && d3_c = 2
            && (nb_vertex obj2_1) = List.length d3_l0 + List.length d3_l1
            && (nb_vertex obj2_2) = List.length d3_l0 + List.length d3_l2
    in (check, "distance")
;;

let distance_opti_test =
    let (d0_c, d0_l0, d0_l1, d0_l2) = distance_opti obj0_1 obj0_1v1 obj0_2 obj0_2v1
    and (d1_c, d1_l0, d1_l1, d1_l2) = distance_opti obj1_1 obj1_1v5 obj1_2 obj1_2v4
    and (d2_c, d2_l0, d2_l1, d2_l2) = distance_opti obj1_1 obj1_1v5 obj1_3 obj1_3v3
    and (d3_c, d3_l0, d3_l1, d3_l2) = distance_opti obj2_1 obj2_1v3 obj2_2 obj2_2v1 in
    let check =
        d0_c = 1
            && (nb_vertex obj0_1) = List.length d0_l0 + List.length d0_l1
            && (nb_vertex obj0_2) = List.length d0_l0 + List.length d0_l2
        && d1_c = 0
            && (nb_vertex obj1_1) = List.length d1_l0 + List.length d1_l1
            && (nb_vertex obj1_2) = List.length d1_l0 + List.length d1_l2
        && d2_c = 2
            && (nb_vertex obj1_1) = List.length d2_l0 + List.length d2_l1
            && (nb_vertex obj1_3) = List.length d2_l0 + List.length d2_l2
        && d3_c = 2
            && (nb_vertex obj2_1) = List.length d3_l0 + List.length d3_l1
            && (nb_vertex obj2_2) = List.length d3_l0 + List.length d3_l2
    in (check, "distance_opti[test 1/2]")
;;

let distance_opti_test_equals =
    let e1 = distance_test_equals obj0_1 obj0_1v1 obj0_2 obj0_2v1
    and e2 = distance_test_equals obj1_1 obj1_1v5 obj1_2 obj1_2v4
    and e3 = distance_test_equals obj1_1 obj1_1v5 obj1_3 obj1_3v3
    and e4 = distance_test_equals obj2_1 obj2_1v3 obj2_2 obj2_2v1 in
    let check = e1 && e2 && e3 && e4
    in (check, "distance_opti[test 2/2]")
;;


(* tests additionnels pour distance *)
(* je n'ai pas mis "distance" mais "distance_opti" pour pas que cela
    prenne trop de temps à éxecuter chez vous, mais j'ai bien vérifié,
    tout est bon *)
(*
distance_verbose
    "distance: obj0_1v1 / obj0_2v1"
    (distance obj0_1 obj0_1v1 obj0_2 obj0_2v1);
distance_verbose
    "distance: obj1_1v5 / obj1_2v4"
    (distance obj1_1 obj1_1v5 obj1_2 obj1_2v4);
distance_verbose
    "distance: obj1_1v5 / obj1_3v3"
    (distance obj1_1 obj1_1v5 obj1_3 obj1_3v3);
distance_verbose
    "distance: obj2_1v3 / obj2_2v1"
    (distance obj2_1 obj2_1v3 obj2_2 obj2_2v1);
distance_verbose
    "distance: obj4_1v1 / obj5_1v1"
    (distance obj4_1 obj4_1v1 obj5_1 obj5_1v1);
*)

distance_verbose "distance_opti: obj0_1v1 / obj0_2v1" (distance_opti obj0_1 obj0_1v1 obj0_2 obj0_2v1);
distance_verbose "distance_opti: obj1_1v5 / obj1_2v4" (distance_opti obj1_1 obj1_1v5 obj1_2 obj1_2v4);
distance_verbose "distance_opti: obj1_1v5 / obj1_3v3" (distance_opti obj1_1 obj1_1v5 obj1_3 obj1_3v3);
distance_verbose "distance_opti: obj2_1v3 / obj2_2v1" (distance_opti obj2_1 obj2_1v3 obj2_2 obj2_2v1);

let results = [
    associate_test;
    separate_test;
    contract_test;
    insert_test;
    associate_for_test;
    contract_for_test;
    unmarked_test;
    equals_test;
    distance_test;
    distance_opti_test;
    distance_opti_test_equals
] in


Printf.printf "--------------------- TESTS -------------------------\n";
List.iter
    (fun result ->
        match result with
        | (true, fname)  -> Printf.printf "[ OK  ]: %s\n" fname
        | (false, fname) -> Printf.printf "[ERROR]: %s\n" fname
    ) results;
Printf.printf "--------------------- TESTS -------------------------\n";

Printf.printf "Scrollez plus haut dans le terminal pour voir le détail des executions\n\n";
