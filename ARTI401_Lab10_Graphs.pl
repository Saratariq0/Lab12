
% ARTI 401 - Lab 10: Graphs
% Task 1: Finding paths between Saudi cities

% Directed graph - city connections

edge('Madinah', 'Makkah').
edge('Makkah', 'Madinah').

edge('Madinah', 'Taif').
edge('Madinah', 'Tabuk').

edge('Makkah', 'Riyadh').

edge('Tabuk', 'Taif').
edge('Taif', 'Tabuk').

edge('Taif', 'Dammam').

edge('Riyadh', 'Dammam').
edge('Dammam', 'Riyadh').

edge('Dammam', 'Al-Qatif').
edge('Al-Qatif', 'Dammam').

edge('Al-Qatif', 'Madinah').

% Find a path between two cities
travel(From, To, Path) :-
    path(From, To, [From], ReversePath),
    reverse(ReversePath, Path).

% Base case: destination reached
path(To, To, Visited, Visited).

% Recursive case: visit the next city
path(From, To, Visited, Path) :-
    edge(From, Next),
    \+ member(Next, Visited),
    path(Next, To, [Next|Visited], Path).
