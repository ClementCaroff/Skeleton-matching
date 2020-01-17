open Skeleton.Skeleton

(* exemple complémentaire 1 *)
let obj0_1 = create ();;
let obj0_1v1 = createv (1, (5., 0.), 1.);;
let obj0_1v2 = createv (2, (5., 3.), 1.);;
let obj0_1v3 = createv (3, (3., 5.), 1.);;
let obj0_1v4 = createv (4, (7., 5.), 1.);;
let obj0_1v5 = createv (5, (0., 10.), 1.);;
let obj0_1v6 = createv (6, (3., 10.), 1.);;
let obj0_1v7 = createv (7, (7., 10.), 1.);;
let obj0_1v8 = createv (8, (10., 10.), 1.);;
add_vertex obj0_1 obj0_1v1;;
add_vertex obj0_1 obj0_1v2;;
add_vertex obj0_1 obj0_1v3;;
add_vertex obj0_1 obj0_1v4;;
add_vertex obj0_1 obj0_1v5;;
add_vertex obj0_1 obj0_1v6;;
add_vertex obj0_1 obj0_1v7;;
add_vertex obj0_1 obj0_1v8;;
add_edge obj0_1 obj0_1v1 obj0_1v2;;
add_edge obj0_1 obj0_1v2 obj0_1v3;;
add_edge obj0_1 obj0_1v2 obj0_1v4;;
add_edge obj0_1 obj0_1v3 obj0_1v5;;
add_edge obj0_1 obj0_1v3 obj0_1v6;;
add_edge obj0_1 obj0_1v4 obj0_1v7;;
add_edge obj0_1 obj0_1v4 obj0_1v8;;

let obj0_2 = create ();;
let obj0_2v1 = createv (1, (5., 3.), 1.);;
let obj0_2v2 = createv (2, (3., 5.), 1.);;
let obj0_2v3 = createv (3, (7., 5.), 1.);;
let obj0_2v4 = createv (4, (0., 10.), 1.);;
let obj0_2v5 = createv (5, (3., 10.), 1.);;
let obj0_2v6 = createv (6, (7., 10.), 1.);;
let obj0_2v7 = createv (7, (10., 10.), 1.);;
add_vertex obj0_2 obj0_2v1;;
add_vertex obj0_2 obj0_2v2;;
add_vertex obj0_2 obj0_2v3;;
add_vertex obj0_2 obj0_2v4;;
add_vertex obj0_2 obj0_2v5;;
add_vertex obj0_2 obj0_2v6;;
add_vertex obj0_2 obj0_2v7;;
add_edge obj0_2 obj0_2v1 obj0_2v2;;
add_edge obj0_2 obj0_2v1 obj0_2v3;;
add_edge obj0_2 obj0_2v2 obj0_2v4;;
add_edge obj0_2 obj0_2v2 obj0_2v5;;
add_edge obj0_2 obj0_2v3 obj0_2v6;;
add_edge obj0_2 obj0_2v3 obj0_2v7;;



let obj1_1 = create ();;

let obj1_1v1 = createv (1, (133.428, 181.007), 84.4501);;
let obj1_1v2 = createv (2, (124.912, 170.701), 83.4899);;
let obj1_1v3 = createv (3, (130.204, 247.4), 67.333);;
let obj1_1v4 = createv (4, (83.8654, 279.236), 45.0139);;
let obj1_1v5 = createv (5, (127.368, 93.0455), 61.4003);;
let obj1_1v6 = createv (6, (208.077, 154.942), 41.3189);;
let obj1_1v7 = createv (7, (187.311, 306.349), 46.7316);;
let obj1_1v8 = createv (8, (95.9507, 38.783), 15.5488);;
let obj1_1v9 = createv (9, (45.6901, 142.508), 29.0844);;
let obj1_1v10 = createv (10, (201.641, 47.2272), 16.3265);;

add_vertex obj1_1 obj1_1v1;;
add_vertex obj1_1 obj1_1v2;;
add_vertex obj1_1 obj1_1v3;;
add_vertex obj1_1 obj1_1v4;;
add_vertex obj1_1 obj1_1v5;;
add_vertex obj1_1 obj1_1v6;;
add_vertex obj1_1 obj1_1v7;;
add_vertex obj1_1 obj1_1v8;;
add_vertex obj1_1 obj1_1v9;;
add_vertex obj1_1 obj1_1v10;;

add_edge obj1_1 obj1_1v4 obj1_1v3;;
add_edge obj1_1 obj1_1v6 obj1_1v1;;
add_edge obj1_1 obj1_1v7 obj1_1v3;;
add_edge obj1_1 obj1_1v8 obj1_1v5;;
add_edge obj1_1 obj1_1v9 obj1_1v2;;
add_edge obj1_1 obj1_1v10 obj1_1v5;;
add_edge obj1_1 obj1_1v3 obj1_1v1;;
add_edge obj1_1 obj1_1v1 obj1_1v2;;
add_edge obj1_1 obj1_1v5 obj1_1v2;;


let obj1_2 = create ();;

let obj1_2v1 = createv (1, (149.425, 174.044), 80.5401);;
let obj1_2v2 = createv (2, (146.487, 188.054), 79.3638);;
let obj1_2v3 = createv (3, (141.136, 144.511), 75.5958);;
let obj1_2v4 = createv (4, (158.893, 88.9202), 63.153);;
let obj1_2v5 = createv (5, (245.167, 139.985), 31.6502);;
let obj1_2v6 = createv (6, (62.7615, 222.437), 47.1114);;
let obj1_2v7 = createv (7, (225.197, 269.223), 38.751);;
let obj1_2v8 = createv (8, (110.563, 35.786), 11.0849);;
let obj1_2v9 = createv (9, (230.039, 73.8957), 10.2524);;
let obj1_2v10 = createv (10, (55.9403, 92.7936), 35.2936);;

add_vertex obj1_2 obj1_2v1;;
add_vertex obj1_2 obj1_2v2;;
add_vertex obj1_2 obj1_2v3;;
add_vertex obj1_2 obj1_2v4;;
add_vertex obj1_2 obj1_2v5;;
add_vertex obj1_2 obj1_2v6;;
add_vertex obj1_2 obj1_2v7;;
add_vertex obj1_2 obj1_2v8;;
add_vertex obj1_2 obj1_2v9;;
add_vertex obj1_2 obj1_2v10;;

add_edge obj1_2 obj1_2v5 obj1_2v1;;
add_edge obj1_2 obj1_2v6 obj1_2v2;;
add_edge obj1_2 obj1_2v7 obj1_2v2;;
add_edge obj1_2 obj1_2v8 obj1_2v4;;
add_edge obj1_2 obj1_2v9 obj1_2v4;;
add_edge obj1_2 obj1_2v10 obj1_2v3;;
add_edge obj1_2 obj1_2v1 obj1_2v2;;
add_edge obj1_2 obj1_2v1 obj1_2v3;;
add_edge obj1_2 obj1_2v4 obj1_2v3;;


let obj1_3 = create ();;

let obj1_3v1 = createv (1, (99.5717, 138.693), 67.0387);;
let obj1_3v2 = createv (2, (93.6906, 147.987), 67.1489);;
let obj1_3v3 = createv (3, (90.3155, 79.3408), 48.5233);;
let obj1_3v4 = createv (4, (100.552, 207.562), 55.3177);;
let obj1_3v5 = createv (5, (163.844, 100.795), 27.592);;
let obj1_3v6 = createv (6, (144.836, 238.79), 41.8873);;
let obj1_3v7 = createv (7, (29.5616, 121.498), 13.1236);;
let obj1_3v8 = createv (8, (40.3576, 62.7813), 7.1544);;
let obj1_3v9 = createv (9, (54.3813, 257.163), 32.7448);;
let obj1_3v10 = createv (10, (137.916, 22.2684), 11.4307);;

add_vertex obj1_3 obj1_3v1;;
add_vertex obj1_3 obj1_3v2;;
add_vertex obj1_3 obj1_3v3;;
add_vertex obj1_3 obj1_3v4;;
add_vertex obj1_3 obj1_3v5;;
add_vertex obj1_3 obj1_3v6;;
add_vertex obj1_3 obj1_3v7;;
add_vertex obj1_3 obj1_3v8;;
add_vertex obj1_3 obj1_3v9;;
add_vertex obj1_3 obj1_3v10;;

add_edge obj1_3 obj1_3v5 obj1_3v1;;
add_edge obj1_3 obj1_3v6 obj1_3v4;;
add_edge obj1_3 obj1_3v7 obj1_3v2;;
add_edge obj1_3 obj1_3v8 obj1_3v3;;
add_edge obj1_3 obj1_3v9 obj1_3v4;;
add_edge obj1_3 obj1_3v10 obj1_3v3;;
add_edge obj1_3 obj1_3v1 obj1_3v3;;
add_edge obj1_3 obj1_3v1 obj1_3v2;;
add_edge obj1_3 obj1_3v4 obj1_3v2;;


let obj2_1 = create ();;

let obj2_1v1 = createv (1, (169.627, 215.308), 18.5415);;
let obj2_1v2 = createv (2, (152.265, 243.188), 35.5085);;
let obj2_1v3 = createv (3, (124.741, 215.271), 17.8672);;
let obj2_1v4 = createv (4, (188.66, 43.2544), 12.2957);;
let obj2_1v5 = createv (5, (118.395, 589.139), 18.0941);;
let obj2_1v6 = createv (6, (239.023, 37.8518), 12.6601);;
let obj2_1v7 = createv (7, (135.303, 45.3576), 12.3478);;
let obj2_1v8 = createv (8, (74.3442, 43.9502), 12.4327);;

add_vertex obj2_1 obj2_1v1;;
add_vertex obj2_1 obj2_1v2;;
add_vertex obj2_1 obj2_1v3;;
add_vertex obj2_1 obj2_1v4;;
add_vertex obj2_1 obj2_1v5;;
add_vertex obj2_1 obj2_1v6;;
add_vertex obj2_1 obj2_1v7;;
add_vertex obj2_1 obj2_1v8;;

add_edge obj2_1 obj2_1v4 obj2_1v1;;
add_edge obj2_1 obj2_1v5 obj2_1v2;;
add_edge obj2_1 obj2_1v6 obj2_1v1;;
add_edge obj2_1 obj2_1v7 obj2_1v3;;
add_edge obj2_1 obj2_1v8 obj2_1v3;;
add_edge obj2_1 obj2_1v1 obj2_1v2;;
add_edge obj2_1 obj2_1v2 obj2_1v3;;


let obj2_2 = create ();;

let obj2_2v1 = createv (1, (55.5253, 125.841), 14.5714);;
let obj2_2v2 = createv (2, (94.4277, 139.935), 8.98847);;
let obj2_2v3 = createv (3, (116.635, 144.989), 16.0653);;
let obj2_2v4 = createv (4, (42.4601, 35.3283), 10.7252);;
let obj2_2v5 = createv (5, (74.1819, 25.6768), 7.41164);;
let obj2_2v6 = createv (6, (151.08, 36.7267), 17.7514);;
let obj2_2v7 = createv (7, (110.129, 24.8521), 7.44686);;
let obj2_2v8 = createv (8, (62.8991, 417.325), 7.83782);;

add_vertex obj2_2 obj2_2v1;;
add_vertex obj2_2 obj2_2v2;;
add_vertex obj2_2 obj2_2v3;;
add_vertex obj2_2 obj2_2v4;;
add_vertex obj2_2 obj2_2v5;;
add_vertex obj2_2 obj2_2v6;;
add_vertex obj2_2 obj2_2v7;;
add_vertex obj2_2 obj2_2v8;;

add_edge obj2_2 obj2_2v4 obj2_2v1;;
add_edge obj2_2 obj2_2v5 obj2_2v1;;
add_edge obj2_2 obj2_2v6 obj2_2v3;;
add_edge obj2_2 obj2_2v7 obj2_2v2;;
add_edge obj2_2 obj2_2v8 obj2_2v3;;
add_edge obj2_2 obj2_2v1 obj2_2v2;;
add_edge obj2_2 obj2_2v3 obj2_2v2;;


(* graphe possèdent un unique vertex *)
let obj3_1 = create ();;

let obj3_1v1 = createv (1, (10., 10.), 1.);;

add_vertex obj3_1 obj3_1v1;;


(* étoile à N branches *)
let obj4_1 = create ();;
let obj4_1v1 = (createv (1, (10., 10.), 1.));;
add_vertex obj4_1 obj4_1v1;;

let obj4_1_add1() =
    let new_vertex = (createv
        (
            (nb_vertex obj4_1) + 1,
            (10., 10. +. (float_of_int (nb_vertex obj4_1))),
            1.
        )
    )
    in add_vertex obj4_1 new_vertex;
        add_edge obj4_1 new_vertex obj4_1v1
;;
let obj4_1_add2() = obj4_1_add1(); obj4_1_add1();;
let obj4_1_add4() = obj4_1_add2(); obj4_1_add2();;
let obj4_1_add8() = obj4_1_add4(); obj4_1_add4();;
let obj4_1_add16() = obj4_1_add8(); obj4_1_add8();;
obj4_1_add8();;



(* très longue chaîne *)
let obj5_1 = create ();;
let obj5_1v1 = (createv (1, (10., 10.), 1.));;
add_vertex obj5_1 obj5_1v1;;

let obj5_1_add1() =
    let new_vertex = (createv
        (
            (nb_vertex obj5_1) + 1,
            (10., 10. +. (float_of_int (nb_vertex obj5_1))),
            1.
        )
    )
    and prev_vertex = List.nth (
        fold_vertex (fun v l -> if (Vertex.indice (V.label v) = nb_vertex obj5_1) then v::l else l) obj5_1 []
    ) 0
    in add_vertex obj5_1 new_vertex;
        add_edge
            obj5_1
            new_vertex
            prev_vertex
;;
let obj5_1_add2() = obj5_1_add1(); obj5_1_add1();;
let obj5_1_add4() = obj5_1_add2(); obj5_1_add2();;
let obj5_1_add8() = obj5_1_add4(); obj5_1_add4();;
let obj5_1_add16() = obj5_1_add8(); obj5_1_add8();;
obj5_1_add8();;
