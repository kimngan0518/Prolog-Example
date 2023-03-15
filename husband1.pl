goal([e,e ,e,e ,e,e]).

%move any hus
move([w,W1 ,H2,W2 ,H3,W3], [e,W1 ,H2,W2 ,H3,W3]).
move([e,W1 ,H2,W2 ,H3,W3], [w,W1 ,H2,W2 ,H3,W3]).
move([H1,W1 ,w,W2 ,H3,W3], [H1,W1 ,e,W2 ,H3,W3]).
move([H1,W1 ,e,W2 ,H3,W3], [H1,W1 ,w,W2 ,H3,W3]).
move([H1,W1 ,H2,W2 ,w,W3], [H1,W1 ,H2,W2 ,e,W3]).
move([H1,W1 ,H2,W2 ,e,W3], [H1,W1 ,H2,W2 ,w,W3]).
%move any wife 
move([H1,w ,H2,W2 ,H3,W3], [H1,e ,H2,W2 ,H3,W3]).
move([H1,e ,H2,W2 ,H3,W3], [H1,w ,H2,W2 ,H3,W3]).
move([H1,W1 ,H2,w ,H3,W3], [H1,W1 ,H2,e ,H3,W3]).
move([H1,W1 ,H2,e ,H3,W3], [H1,W1 ,H2,w ,H3,W3]).
move([H1,W1 ,H2,W2 ,H3,w], [H1,W1 ,H2,W2 ,H3,e]).
move([H1,W1 ,H2,W2 ,H3,e], [H1,W1 ,H2,W2 ,H3,w]).
%move any couple
move([w,w ,H2,W2 ,H3,W3], [e,e ,H2,W2 ,H3,W3]).
move([e,e ,H2,W2 ,H3,W3], [w,w ,H2,W2 ,H3,W3]).
move([H1,W1 ,w,w ,H3,W3], [H1,W1 ,e,e ,H3,W3]).
move([H1,W1 ,e,e ,H3,W3], [H1,W1 ,w,w ,H3,W3]).
move([H1,W1 ,H2,W2 ,w,w], [H1,W1 ,H2,W2 ,e,e]).
move([H1,W1 ,H2,W2 ,e,e], [H1,W1 ,H2,W2 ,w,w]).
%mova any 2 wife 
move([H1,w ,H2,w ,H3,W3], [H1,e ,H2,e ,H3,W3]).
move([H1,e ,H2,e ,H3,W3], [H1,w ,H2,w ,H3,W3]).
move([H1,w ,H2,W2 ,H3,w], [H1,e ,H2,W2 ,H3,e]).
move([H1,e ,H2,W2 ,H3,e], [H1,w ,H2,W2 ,H3,w]).
move([H1,W1 ,H2,w ,H3,w], [H1,W1 ,H2,e ,H3,e]).
move([H1,W1 ,H2,e ,H3,e], [H1,W1 ,H2,w ,H3,w]).
%move any 2 hus
move([w,W1 ,w,W2 ,H3,W3], [e,W1 ,e,W2 ,H3,W3]).
move([e,W1 ,e,W2 ,H3,W3], [w,W1 ,w,W2 ,H3,W3]).
move([w,W1 ,H2,W2 ,w,W3], [e,W1 ,H2,W2 ,e,W3]).
move([e,W1 ,H2,W2 ,e,W3], [w,W1 ,H2,W2 ,w,W3]).
move([H1,W1 ,w,W2 ,w,W3], [H1,W1 ,e,W2 ,e,W3]).
move([H1,W1 ,e,W2 ,e,W3], [H1,W1 ,w,W2 ,w,W3]).

generateState(X,Y) :- move(X,Y).

%warring cont
warring([w,e ,e,_ ,_,_]).
warring([e,w ,w,_ ,_,_]).
warring([w,e, _,_ ,e,_]).
warring([e,w ,_,_ ,w,_]).
warring([e,_ ,w,e ,_,_]).
warring([w,_ ,e,w ,_,_]).
warring([_,_ ,w,e ,e,_]).
warring([_,_ ,e,w ,w,_]).
warring([e,_ ,_,_ ,w,e]).
warring([w,_ ,_,_ ,e,w]).
warring([_,_ ,e,_ ,w,e]).
warring([_,_ ,w,_ ,e,w]).

dfs(CNode, CPath, [CNode | CPath]) :- goal(CNode), !.
dfs(CNode, CPath, FPath) :- generateState(CNode, X), X \= CNode, \+member(X, CPath),\+ warring(X), dfs(X, [CNode | CPath], FPath).

try(P):- dfs([w,w,w,w,w,w], [], P).
