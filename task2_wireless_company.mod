param blocchiTot;
set Blocco:=1.. blocchiTot;

param copertura{Blocco,Blocco} binary;
param Ricavo{Blocco} >=0;
param costo_fisso >=0;

var torre{Blocco} binary;
var y{Blocco} binary;


minimize Costi:sum{i in Blocco} (costo_fisso*torre[i]);
subject to Constraint_copertura{i in Blocco}:sum{j in Blocco}copertura[i,j]*torre[j]>=y[i];

#constraint per il punto 3 - garantire il servizio wireless a tutti i blocchi
subject to servizio_totale:sum{i in Blocco} y[i]=blocchiTot;