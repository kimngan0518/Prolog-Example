change(e,w).
change(w,e).

%move wolf
move([X,X,Groose,Cabbage],wolf,[Y,Y,Groose,Cabbage]) :- change(X,Y).
%move groose
move([X,Wolf,X,Cabbage],groose,[Y,Wolf,Y,Cabbage]) :- change(X,Y).
%move cabbage
move([X,Wolf,Groose,X],cabbage,[Y,Wolf,Groose,Y]) :- change(X,Y).
%farmer
move([X,Wolf,Groose,Cabbage],nothing,[Y,Wolf,Groose,Cabbage]) :- change(X,Y).

%save cont
% 1. groose with farmer
% 2. both wolf and cabbage with farmer
safe([X,_,X,_]).
safe([X,X,_,X]).

not_member(_, []) :- !.
not_member(X, [Head|Tail]) :-
    X \= Head,
    not_member(X, Tail).
%sol(X)
sol(AnsPath) :- sol([[w,w,w,w]], AnsPath).
sol([S|_], [S]) :- S = [e,e,e,e], !.
sol([S|Path], [S|AnsPath]) :-
    move(S, _, NextState), safe(NextState),
    not_member(NextState, [S|Path]),
    sol([NextState, S|Path], AnsPath).
