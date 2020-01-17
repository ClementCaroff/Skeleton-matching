#!/usr/bin/env bash
cd ./src;
make;
mv skeleton.cm* ../;
cd ../;
echo "";
echo "=========================================================";
echo " Veuillez patienter, les tests sont en cours d'execution";
echo "=========================================================";
echo "";
ledit ocaml -I ./ skeleton.cma -init main.ml;
