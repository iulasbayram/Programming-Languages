;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname önemliödev) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))

(define listMaker ;this fuction create a new list.
  (lambda(l num)
    (cond((= num 20) l)
         ((< num 19)(listMaker (cons "x" l) (+ num 1)))
         ((= num 19)(listMaker (cons "z" l) (+ num 1))))))

(define listIterator ;listIterator works on for one position to delete this position from list.
  (lambda(source discard position now check)
    (cond((and (null? discard) (= position now) (= check 1)) source)
         ((and (not(null? discard)) (= position now) (= check 1)) (listIterator (cons (car discard) source) (cdr discard) position now 1))
         ((= position (+ now 1)) (listIterator (cons (car source) (cons "-" (cdr (cdr source)))) discard position (+ now 1) 1))
         ((> position now) (listIterator (cdr source) (cons (car source) discard) position (+ now 1) 0))
         ((= position now) (listIterator (cons "-" (cdr source)) discard position now 1)))))

(define positionLister ;positionLister works on to create list that keeps all positions that are under one position
  (lambda(position positionList increment)
    (cond((= position 20) (cons position positionList))
         ((> position 20) (positionLister (- position (- increment 1)) positionList 0))
         ((< position 20) (positionLister (+ position 5) (cons position positionList) (+ increment 5))))))

(define humanIter ;humanIter deletes all position from list using 2 previous function.
  (lambda(procedure list positionList check)
    (cond((and (null? positionList) (= check 1)) list)
         ((and (null? positionList) (= check 0)) (humanIter procedure list (positionLister (read) '() 0) 1))
         ((not(null? positionList)) (humanIter procedure (procedure list '() (car positionList) 1 0) (cdr positionList) 1)))))

(define reverseList ;reverseList reverses list.
  (lambda(rList)
    (cond((null? rList) rList)
         (else (append (reverse (cdr rList)) (list (car rList)))))))


(define computerIter ;computerIter deletes all position that computer selects.
  (lambda(list discard reverseCheck)
    (cond((= reverseCheck 2) list)
         ((and (= reverseCheck 3) (null? discard)) (computerIter (reverseList list) discard 2))
         ((and (= reverseCheck 3) (not (null? discard))) (computerIter (cons (car discard) list) (cdr discard) 3))
         ((= reverseCheck 0) (computerIter (reverseList list) discard 1))
         ((and (equal? (car list) "-") (= reverseCheck 1)) (computerIter (cdr list) (cons (car list) discard) 1))
         ((and (equal? (car list) "x") (= reverseCheck 1)) (computerIter (cons "-" (cdr list)) discard 3))
         ((and (equal? (car list) "z") (= reverseCheck 1)) (computerIter (cons "-" (cdr list)) discard 3)))))

(define displayL ;displayL displays list with specified order. Our list range 5 column and 4 row thanks to this function.
  (lambda(list discard check increment)
    (cond((and (not (null? list)) (= check 3)) (begin(display list) (display "\n")))
         ((and (not (null? discard)) (= check 2)) (displayL (cons (car discard) list) (cdr discard) 2 increment))
         ((and (null? discard) (= check 2))(displayL list discard 3 increment))
         ((null? list) (displayL list discard 2 increment))
         ((and (= check 1) (= increment 0)) (displayL (cdr list) (cons (car list) discard) 0 0))
         ((< increment 5) (displayL (cdr list) (cons (car list) discard) 0 (+ increment 1)))
         ((= increment 5) (displayL (cons "\n" list) discard 1 0)))))

(define whoStart ;whoStart determines who starts.
  (lambda(randomNum)
    (cond((= randomNum 1) "User")
         (else "Computer"))))

(define loseOneCheck ;loseOneCheck checks whether poisoned cookie is ate or not.
  (lambda(list)
    (cond((equal? (car list) "-") #f)
         (else #t))))

(define gameSimulation ;gameSimulation is responsible to simulate this game.
  (lambda(list whoStart string)
    (begin
      (displayL list '() 0 0)
      (cond((and (equal? (loseOneCheck list) #f) (equal? whoStart "Computer")) "Computer won!")
           ((and (equal? (loseOneCheck list) #f) (equal? whoStart "User")) "User won!")
           ((equal? whoStart "Computer") (gameSimulation (computerIter list '() 0) "User" (display "\nComputer Move\n")))
           ((equal? whoStart "User") (gameSimulation (humanIter listIterator list '() 0) "Computer" (display "\nHuman Move\n")))))))

(define l (listMaker '() 0))

(define main ;main keeps game simulation and game starts with this function.
  (lambda ()
    (begin
      (display "The game is ready\n")
      (gameSimulation l (whoStart (random 1 3)) ""))))

(main)




