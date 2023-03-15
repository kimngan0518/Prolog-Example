find :- path([3,3,left],[0,0,right],[[3,3,left]],_).

%print
output([]) :- nl, nl.
output([[A,B]|T]) :-
   output(T),
   write(B), write(' -> '), write(A), nl.

path([A,B,C],[A,B,C],_,MoveList):-
   nl,nl,output(MoveList).
% tim duong di tu [A, B, C] den [D, E, F] 
% Traversed la diem da di qua dung o hien tai
% moves diem di chuyen den
path([A,B,C],[D,E,F],Traversed,Moves) :-
   move([A,B,C],[I,J,K]),
   safe([I,J,K]),
   not(member([I,J,K],Traversed)),
   path([I,J,K],[D,E,F],[[I,J,K]|Traversed],[ [[I,J,K],[A,B,C]] | Moves ]).

move([A,B,left],[C,B,right]) :- A > 0, C is A - 1. %move 1 missionary 
move([A,B,left],[C,B,right]) :- A > 1, C is A - 2. %move 2 missionary
move([A,B,left],[C,D,right]) :- A > 0, B > 0, C is A - 1, D is B - 1. %move 1 missionary and 1 cannibal
move([A,B,left],[A,D,right]) :- B > 0, D is B - 1. %move 1 cannibal
move([A,B,left],[A,D,right]) :- B > 1, D is B - 2. %move 2 cannibal

move([A,B,right],[C,B,left]) :- A < 3, C is A + 1. %move 1 missionary again
move([A,B,right],[C,B,left]) :- A < 2, C is A + 2. %move 2 missionary again
move([A,B,right],[C,D,left]) :- A < 3, B < 3, C is A + 1, D is B + 1. %move 1 missionary and 1 cannibal again
move([A,B,right],[A,D,left]) :- B < 3, D is B + 1. %move 1 cannibal again
move([A,B,right],[A,D,left]) :- B < 2, D is B + 2. %move 2 cannibal again

% dieu kien an toan
safe([B,A,_]) :-
  (A =< B ; B = 0),
   C is 3-A, D is 3-B,
  (C =< D; D = 0).
