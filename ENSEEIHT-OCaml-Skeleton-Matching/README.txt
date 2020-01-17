# Rendu 1 projet - Benjamin Raymond



Pour compiler skeleton.cma, le charger, charger les fichiers et lancer les tests, vous pouvez utiliser le script 'autorun.sh' dans ce dossier. Son contenu:
# cd ./src;
# make;
# mv skeleton.cm* ../;
# cd ../;
# ledit ocaml -I ./ skeleton.cma -init main.ml;


        /!\ PREMIER RENDU /!\

Quelques remarques importantes sur le premier rendu du projet:
- Il faut lancer ocaml de cette manière:
        # ledit ocmal -I ./ skeleton.cma
    puis taper par exemple:
        # use "main.ml";;
    pour lancer les tests automatiquement, ou
        `# use "projet.ml";;
        # use "skeltest.ml";;
    pour tester les fonctions manuellement.
- Je travaille avec la dernière version d'OCaml (4.05.00)
    ainsi que ma version de skeleton.cma. Je n'ai donc pas inclus ce
    dernier dans l'archive rendue.
- Le code est largement documenté, vous trouverez les contrats des
    fonctions ainsi que des commentaires expliquant les choix
    effectués dans le traitement de ces fonctions.
- Les fonctions 'associate_for' et 'constract_for' sont destinées
    à factoriser les séquences d'opérations répétitives
    (associer deux vertex -> effectuer traitement -> séparer) et
    (contracter deux vertex -> effectuer traitement -> ré-insérer)
    Cela permet de conserver un style purement fonctionnel pour les
    fonctions complexes 'equals', 'distance' et 'distance_opti'
- J'ai adapté 'display.ml' pour afficher les nouveaux graphes
- J'ai ajouté quelques graphes 'test' complémentaires:
    obj0_1 (arbre binaire simple)
    obj0_2 (arbre binaire simple légèrement modifié (distance = 1))
    obj3_1 (1 seul vertex)
    obj4_1 (tous les vertex ormis le 1 ont pour seul predecesseur 1)
    obj5_1 (longue chaine)
    J'ai inclu des images de ces graphes au cas où
- Parfois, j'ai remarqué que faire CTRL+C au milieu d'une execution
    de 'distance' "casse" mes objets de tests, parce que des
    contractions ne sont pas ré-insérées. Je préconise de ré-inclure
        #use "skeltest.ml";;
    après chaque ctrl+c..




Si vous n'arrivez pas à lancer les tests pour une raison X ou Y,
Voici ce qui m'a été affiché dans le terminal:

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


