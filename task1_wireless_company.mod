param blocchiTot;
set Blocco:=1.. blocchiTot;

param copertura{Blocco,Blocco} binary;
param Ricavo{Blocco} >=0;
param costo_fisso >=0;

var torre{Blocco} binary;
var y{Blocco} binary;


maximize Profitti: sum{i in Blocco} (Ricavo[i]*y[i]-costo_fisso*torre[i]);
subject to Constraint_copertura {i in Blocco}:sum{j in Blocco} copertura[i,j]*torre[j]>=y[i];

