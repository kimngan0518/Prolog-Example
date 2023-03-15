%([Dad, Mom, Son, Daughter, Fisher, Boar])

%trang thai dich cua bai toan
goal([o, o, o, o, o, o]).

%chuyen nguoi Cha tu Trai sang Phai
move([x, Mom, Son, Daughter, Fisher, x],[o, Mom, Son, Daughter, Fisher, o]).
%chuyen nguoi Cha tu Phai sang Trai
move([o, Mom, Son, Daughter, Fisher, o],[x, Mom, Son, Daughter, Fisher, x]).
 
%chuyen nguoi Me tu Trai sang Phai
move([Dad, x, Son, Daughter, Fisher, x],[Dad, o, Son ,Daughter, Fisher, o]).
%chuyen nguoi Me tu Phai sang Trai
move([Dad, o, Son, Daughter, Fisher, o],[Dad, x, Son ,Daughter, Fisher, x]).

%chuyen hai nguoi con tu Trai sang Phai
move([Dad, Mom, x, x, Fisher, x],[Dad, Mom, o , o, Fisher, o]).
%chuyen hai nguoi con tu Phai sang Trai
move([Dad, Mom, o, o, Fisher, o],[Dad, Mom, x , x, Fisher, x]).

%chuyen nguoi con trai tu Trai sang Phai
move([Dad, Mom, x, Daughter, Fisher, x],[Dad, Mom, o ,Daughter, Fisher, o]).
%chuyen nguoi con trai tu Phai sang Trai
move([Dad, Mom, o, Daughter, Fisher, o],[Dad, Mom, x ,Daughter, Fisher, x]).

%chuyen nguoi con gai tu Trai sang Phai
move([Dad, Mom, Son, x, Fisher, x],[Dad, Mom, Son , o, Fisher, o]).
%chuyen nguoi con gai tu Phai sang Trai
move([Dad, Mom, Son, o, Fisher, o],[Dad, Mom, Son , x, Fisher, x]).

%chuyen nguoi danh ca tu Trai sang Phai
move([Dad, Mom, Son, Daughter, x, x],[Dad, Mom, Son ,Daughter, o, o]).

generateState(N, X) :- move(N, X).

%cay tim kiem DFS
dfs(CNode, CPath, [CNode | CPath]) :- goal(CNode), !.
dfs(CNode, CPath, FPath) :- generateState(CNode, X),
    X \= CNode, \+member(X, CPath), 
    dfs(X, [CNode | CPath], FPath).

try(P):- dfs([x, x, x, x, x, x], [], P).

