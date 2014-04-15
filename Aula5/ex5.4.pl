%% Ex 5.4
%% Implementar fatorial em Prolog.

%% Exemplo de query:
%% ?- fat(10, X)

fat(0, 1).
fat(N, NF) :-
 	K is N - 1,
 	fat(K, KF),	 	
  	NF is N*KF.
 

  

