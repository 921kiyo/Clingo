% L = 0
valid_move(D, T):- rule(0), dest(D), time(T).

% L = 1
valid_move(D, T):- rule(1), dest(D), time(T), cell(C), agent_at(C, T).
valid_move(D, T):- rule(2), dest(D), time(T), unlocked(D, T).

% L = 2
valid_move(D, T):- rule(3), dest(D), time(T), cell(C), agent_at(C, T), not wall(C, D).
valid_move(D, T):- rule(4), dest(D), time(T), cell(C), agent_at(C, T), adjacent(C, D).
valid_move(D, T):- rule(5), dest(D), time(T), cell(C), agent_at(C, T), link(C, D).
valid_move(D, T):- rule(6), dest(D), time(T), cell(C), agent_at(C, T), unlocked(C, T).

% L = 3
valid_move(D, T):- rule(7), dest(D), time(T), cell(C), agent_at(C, T), not wall(C, D), adjacent(C, D).
valid_move(D, T):- rule(8), dest(D), time(T), cell(C), agent_at(C, T), not wall(C, D), link(C, D).
valid_move(D, T):- rule(9), dest(D), time(T), cell(C), agent_at(C, T), not wall(C, D), unlocked(D, T).
valid_move(D, T):- rule(10), dest(D), time(T), cell(C), agent_at(C, T), adjacent(C, D), link(C, D).
valid_move(D, T):- rule(11), dest(D), time(T), cell(C), agent_at(C, T), adjacent(C, D), unlocked(D, T).
valid_move(D, T):- rule(12), dest(D), time(T), cell(C), agent_at(C, T), link(C, D), unlocked(D, T).


% L = 4
valid_move(D, T):- rule(13), dest(D), time(T), cell(C), agent_at(C, T), not wall(C, D), adjacent(C, D), link(C, D).
valid_move(D, T):- rule(14), dest(D), time(T), cell(C), agent_at(C, T), not wall(C, D), adjacent(C, D), unlocked(D, T).
valid_move(D, T):- rule(15), dest(D), time(T), cell(C), agent_at(C, T), not wall(C, D), link(C, D), unlocked(D, T).
valid_move(D, T):- rule(16), dest(D), time(T), cell(C), agent_at(C, T), adjacent(C, D), link(C, D), unlocked(D, T).

{rule(0..16)}.

#minimize[
  rule(0)=1,
  rule(1)=2,
  rule(2)=2,
  rule(3)=3,
  rule(4)=3,
  rule(5)=3,
  rule(6)=3,
  rule(7)=4,
  rule(8)=4,
  rule(9)=4,
  rule(10)=4,
  rule(11)=4,
  rule(12)=4,
  rule(13)=5,
  rule(14)=5,
  rule(15)=5,
  rule(16)=5].

goal:-  valid_move(cell(9, 1), 1),
        valid_move(cell(9, 10), 8),
        not valid_move(cell(1, 1), 1),
        not valid_move(cell(7, 1), 3),
        not valid_move(cell(4, 7), 12),
        not valid_move(cell(3, 5), 16).
:- not goal.

wall(cell(1,2),cell(2,2)).
wall(cell(1,3),cell(2,3)).
wall(cell(2,3),cell(2,4)).
wall(cell(3,2),cell(3,3)).
wall(cell(3,3),cell(4,3)).
wall(cell(3,4),cell(4,4)).
wall(cell(3,5),cell(4,5)).
wall(cell(3,6),cell(4,6)).

wall(cell(4,2),cell(5,2)).
wall(cell(4,3),cell(5,3)).
wall(cell(4,4),cell(5,4)).
wall(cell(4,5),cell(5,5)).
wall(cell(4,6),cell(5,6)).

wall(cell(5,2),cell(6,2)).
wall(cell(5,3),cell(6,3)).
wall(cell(5,4),cell(6,4)).
wall(cell(5,5),cell(6,5)).
wall(cell(5,6),cell(6,6)).

wall(cell(2,1),cell(2,2)).
wall(cell(3,1),cell(3,2)).
wall(cell(4,1),cell(4,2)).
wall(cell(5,1),cell(5,2)).

wall(cell(1,4),cell(1,5)).
wall(cell(2,4),cell(2,5)).
wall(cell(3,4),cell(3,5)).

wall(cell(1,8),cell(1,9)).
wall(cell(1,8),cell(2,8)).
wall(cell(1,7),cell(2,7)).
wall(cell(2,6),cell(2,7)).
wall(cell(3,6),cell(3,7)).
wall(cell(5,6),cell(5,7)).

wall(cell(3,8),cell(4,8)).
wall(cell(3,9),cell(4,9)).
wall(cell(3,10),cell(4,10)).

wall(cell(6,5),cell(7,5)).
wall(cell(6,6),cell(7,6)).
wall(cell(6,7),cell(7,7)).
wall(cell(6,8),cell(7,8)).
wall(cell(6,9),cell(7,9)).
wall(cell(6,10),cell(7,10)).

wall(cell(7,4),cell(7,5)).
wall(cell(8,4),cell(8,5)).

wall(cell(8,5),cell(9,5)).
wall(cell(8,6),cell(9,6)).
wall(cell(8,7),cell(9,7)).
wall(cell(9,7),cell(9,8)).
wall(cell(9,8),cell(10,8)).
wall(cell(9,9),cell(10,9)).
wall(cell(9,10),cell(10,10)).
wall(cell(10,9),cell(10,10)).

wall(cell(9,2),cell(9,3)).
wall(cell(10,2),cell(10,3)).

wall(cell(7,1),cell(8,1)).
wall(cell(7,2),cell(8,2)).
wall(cell(7,2),cell(7,3)).
wall(cell(6,2),cell(7,2)).
wall(cell(6,1),cell(7,1)).

locked(cell(1,10)).
locked(cell(3,5)).
locked(cell(4,7)).
locked(cell(7,6)).
locked(cell(8,6)).
locked(cell(8,2)).

key(cell(1,8),cell(1,10)).
key(cell(2,3),cell(3,5)).
key(cell(10,6),cell(4,7)).
key(cell(7,5),cell(7,6)).
key(cell(8,7),cell(8,6)).
key(cell(8,1),cell(8,2)).

link(cell(1,5),cell(3,10)).
link(cell(3,3),cell(3,5)).
link(cell(3,9),cell(8,10)).
link(cell(10,4),cell(10,10)).
link(cell(6,4),cell(9,10)).
link(cell(5,8),cell(2,4)).
link(cell(4,8),cell(9,6)).
link(cell(10,7),cell(6,7)).

dest(C) :- cell(C).
cell(cell(1..10, 1..10)).

adjacent(cell(X,Y),cell(X+1,Y)) :- cell(cell(X,Y)), cell(cell(X+1,Y)).
adjacent(cell(X+1,Y),cell(X,Y)) :- cell(cell(X,Y)), cell(cell(X+1,Y)).
adjacent(cell(X,Y+1),cell(X,Y)) :- cell(cell(X,Y)), cell(cell(X,Y+1)).
adjacent(cell(X,Y),cell(X,Y+1)) :- cell(cell(X,Y)), cell(cell(X,Y+1)).

agent_at(cell(10,1),1).
agent_at(cell(9,1),2).
agent_at(cell(8,1),3).
agent_at(cell(8,2),4).
agent_at(cell(8,3),5).
agent_at(cell(8,4),6).
agent_at(cell(7,4),7).
agent_at(cell(6,4),8).
agent_at(cell(6,5),9).
agent_at(cell(6,6),10).
agent_at(cell(6,7),11).
agent_at(cell(5,7),12).
agent_at(cell(5,8),13).
agent_at(cell(2,4),14).
agent_at(cell(3,4),15).
agent_at(cell(3,3),16).

wall(C1, C2) :- wall(C2, C1).

unlocked(C, T) :- cell(C), time(T), not locked(C).
unlocked(C, T) :- time(T), key(C2, C), agent_at(C2, T2), T > T2.

time(1..30).
