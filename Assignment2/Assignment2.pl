/*>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  MAIN PART  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/	
main(X, Y) :-
	not(X = 0), not(Y = 0), Counter is 1, X > 0, Y > 0,    /* main for positive x and positive y */
	extended(X, Y, GCD, X, Y, P, S, _, _, _, _, Counter),
	write('P,S and GCD values of given numbers are at below: '),nl,
	write('P = '), write(P),nl,write('S = '),write(S),nl,write('GCD = '),write(GCD).

main(X, Y) :-
	not(X = 0), not(Y = 0), Counter is 1, X < 0, Y > 0,		/* main for negative x and positive y */
	New_X is -1 * X,
	extended( X, Y, GCD, New_X , Y, P, S, _, _, _, _, Counter),
	write('P,S and GCD values of given numbers are at below:'),nl,
	write('P = '), write(P),nl,write('S = '),write(S),nl,write('GCD = '),write(GCD).	

main(X, Y) :-
	not(X = 0), not(Y = 0), Counter is 1, X > 0, Y < 0,		/* main for positive x and negative y */
	New_Y is -1 * Y,										/* I convert negative y to positive to calculate related p and s, and then helper3 method updates negative of s and p */
	extended( X, Y , GCD, X, New_Y , P, S, _, _, _, _, Counter),
	write('P,S and GCD values of given numbers are at below:'),nl,
	write('P = '), write(P),nl,write('S = '),write(S),nl,write('GCD = '),write(GCD).

main(X, Y) :-
	not(X = 0), not(Y = 0), Counter is 1, X < 0, Y < 0,		/* main for negative x and negative y */
	New_Y is -1 * Y, 										/* I convert negative x and y to positive to calculate related p and s, and then helper3 method finds correct values of s and p */
	New_X is -1 * X,	
	extended( X, Y , GCD, New_X, New_Y , P, S, _, _, _, _, Counter),
	write('P,S and GCD values of given numbers are at below:'),nl,
	write('P = '), write(P),nl,write('S = '),write(S),nl,write('GCD = '),write(GCD).

/*>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> BASE CASES PART  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/

extended(First, Second, GCD, X, Y, P, S, P0, P1, Q0, _, _) :-   /* BASE CASE FOR POSITIVE X AND POSITIVE Y and mod of numbers is not zero*/
	Y = 0, not(X = Second), ((First > 0, Second > 0) ; (First < 0, Second > 0)),
	helper1(First, Second, GCD, X, P, S, P0, P1, Q0).
 
extended(_, Second, GCD, X, Y, P, S, _, _, _, _, _) :-  /* BASE CASE FOR mod(X,Y) = 0 or mod(Y,X) = 0 */
	Y = 0, X = Second,									
	S is 1, GCD is Second, P is 0.						/* if mod(X,Y) = 0 or mod(Y,X)=0, P is always zero and S is always 1 */

extended(First, Second, GCD, X, Y, P, S, P0, P1, Q0, _, _) :-   /* BASE CASE FOR NEGATIVE Y AND POSITIVE X  or BOTH of THEM NEGATIVE */
	Y = 0, not(X = Second),((Second < 0, First > 0);(First < 0, Second < 0)), 	/* helper3 calculates minus s and according to formula: */
	helper2(First, Second, GCD, X, P, S, P0, P1, Q0).							/*	pX + sY = gcd(X,Y) calculates related P */
																				
/*>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> ExTENDED EUCLIDIAN OPERATIONS PART >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/
extended(First, Second, GCD, X, Y, P, S, P0, P1, Q0, Q1, Counter) :-  
	not(Y = 0),  Counter = 1,  Counter1 is 2,
	P0 is 0,	/* at the first loop, p0 = 0 */
	Q0 is X // Y,
	New_Y is mod(X,Y), 
	extended(First, Second, GCD, Y, New_Y, P, S, P0, P1, Q0, Q1, Counter1).  

extended(First, Second, GCD, X, Y, P, S, P0, P1, Q0, Q1, Counter) :- 
	not(Y = 0),  Counter = 2, Counter2 is 3,
	P1 is 1, 	/* at the first loop, p1 = 1 and we are passing to third step and we know p0 and p1, at every step these p0 and p1 will be updated */
	Q1 is X // Y,
	New_Y is mod(X,Y), 
	extended(First, Second, GCD, Y, New_Y, P, S, P0, P1, Q0, Q1, Counter2). 

extended(First, Second, GCD, X, Y, P, S, P0, P1, Q0, Q1, Counter) :- 
	not(Y = 0), Counter > 2,	/* this rule updates p0,p1,q0 and q1 at every step until Second given number becomes 0 */	
	New_P0 is P1,				/* then we go to helper methods to find final values of s and p respectively */
	New_Q0 is Q1,
	New_P1 is P0 - (P1 * Q0),
	New_Q1 is X // Y,
	New_Y is mod(X,Y),
	extended(First, Second, GCD, Y, New_Y, P, S, New_P0, New_P1, New_Q0, New_Q1, Counter).

/*>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> HELPER RULES TO FIND FINAL P AND S >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/

helper1(First, Second, GCD, X, P, S, P0, P1, Q0) :-    /* helper for if two given numbers are positive */
	S is P0 - (P1 * Q0),
	GCD is X,
	P is (GCD - (S * Second)) / First.					

helper2(First, Second, GCD, X, P, S, P0, P1, Q0) :- /* Helper for if first given number is negative */ 
	S is -1 * (P0 - (P1 * Q0)),						/* S is calculated like two given numbers are positive, then s is the -1 times normal s */
	GCD is X,
	P is (GCD - (S * Second)) / First.				/* and after s is calculated, according to pX + sY = gcd(X,Y) formula p is calculated */


/* ?- main(86,57). */