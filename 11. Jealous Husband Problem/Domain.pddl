(define (domain Jealous_Husband)
    (:requirements :strips  :equality :disjunctive-preconditions :universal-preconditions :typing)
    (:predicates
        (pair ?p1 ?p2)              ;p1 & p2 is pair
        (movable ?p1 ?p2)        ; p1 & p2 is movable or not
        (boat_side ?side)        ; boat at which side
        (at ?x ?side)               ; x at side
        (men ?p)                    ; x is men
        (women ?p)                  ; x is women
        (side ?s)
    )
    
    (:action move_two
        :parameters (?person1 ?person2 ?side1 ?side2)
        :precondition (and 
                (not (= ?side1 ?side2))
                (movable ?person1 ?person2)
                (boat_side ?side1)
                (at ?person1 ?side1)
                (at ?person2 ?side1)
                (side ?side1)
                (side ?side2)

                ;for side1 condition
                (or 
                   (forall (?p1) ;for all women in side 1 there exits their partner
                        (imply (and (women ?p1) (at ?p1 ?side1) (not (= ?p1 ?person1)) (not (= ?p1 ?person2)))     ;if p1 is women at side 1
                            (exists (?p2)                      ; then exits a p2
                                (and
                                    (not (= ?p2 ?person1)) 
                                    (not (= ?p2 ?person2))
                                    (men ?p2)                       ;who is men and at side1 also pair with p1
                                    (at ?p2 ?side1)
                                    (pair ?p2 ?p1)
                                )
                             )
                        )
                    )
                   
                   (forall (?p1)     ; all mens exits
                        (imply (and (at ?p1 ?side1) (not (= ?p1 ?person1)) (not (= ?p1 ?person2)) )
                            (men ?p1)
                        ) 
                     )
                   
                    (forall (?p1)     ; all womens exits
                        (imply (and (at ?p1 ?side1) (not (= ?p1 ?person1)) (not (= ?p1 ?person2)) )
                            (women ?p1)
                        )
                    )
                     
                )

                ;for side2 condition
                (or 
                   (forall (?p1 ) ;for all women with person1 person2 in side2 there exits their partner
                        (imply (and (women ?p1) (or (at ?p1 ?side1)  (= ?p1 ?person1)  (= ?p1 ?person2)) )    
                            (exists (?p2)                      ; then exits a p2
                                (and
                                    (or (at ?p2 ?side1) (= ?p2 ?person1) (= ?p2 ?person2) ) 
                                    (men ?p2)                       ;who is men and at side1 also pair with p1
                                    (pair ?p2 ?p1)
                                )
                             )
                        )
                    )
                   
                   (forall (?p1)     ; all mens exits
                        (imply (or (at ?p1 ?side1) (= ?p1 ?person1) (= ?p1 ?person2) )
                            (men ?p1)
                        ) 
                     )
                   
                    (forall (?p1)     ; all womens exits
                        (imply (or (at ?p1 ?side1) (= ?p1 ?person1) (= ?p1 ?person2))
                            (women ?p1)
                        )
                    )
                     
                )

        )
        :effect (and 
            (not (at ?person1 ?side1))
            (not (at ?person2 ?side1))
            (at ?person1 ?side2)
            (at ?person2 ?side2)
            (boat_side ?side2)
            (not (boat_side ?side1))
        )
    )

     (:action move_one
        :parameters (?person1 ?side1 ?side2)
        :precondition (and 
                (not (= ?side1 ?side2))
                (boat_side ?side1)
                (at ?person1 ?side1)
                (side ?side1)
                (side ?side2)

                ;for side1 condition
                (or 
                   (forall (?p1) ;for all women in side 1 there exits their partner
                        (imply (and (women ?p1) (at ?p1 ?side1) (not (= ?p1 ?person1)))     ;if p1 is women at side 1
                            (exists (?p2)                      ; then exits a p2
                                (and
                                    (not (= ?p2 ?person1)) 
                                    (men ?p2)                       ;who is men and at side1 also pair with p1
                                    (at ?p2 ?side1)
                                    (pair ?p2 ?p1)
                                )
                             )
                        )
                    )
                   
                   (forall (?p1)     ; all mens exits
                        (imply (and (at ?p1 ?side1) (not (= ?p1 ?person1)) )
                            (men ?p1)
                        ) 
                     )
                   
                    (forall (?p1)     ; all womens exits
                        (imply (and (at ?p1 ?side1) (not (= ?p1 ?person1)) )
                            (women ?p1)
                        )
                    )
                     
                )

                ;for side2 condition
                (or 
                   (forall (?p1 ) ;for all women with person1 person2 in side2 there exits their partner
                        (imply (and (women ?p1) (or (at ?p1 ?side1)  (= ?p1 ?person1)) )    
                            (exists (?p2)                      ; then exits a p2
                                (and
                                    (or (at ?p2 ?side1) (= ?p2 ?person1)) 
                                    (men ?p2)                       ;who is men and at side1 also pair with p1
                                    (pair ?p2 ?p1)
                                )
                             )
                        )
                    )
                   
                   (forall (?p1)     ; all mens exits
                        (imply (or (at ?p1 ?side1) (= ?p1 ?person1) )
                            (men ?p1)
                        ) 
                     )
                   
                    (forall (?p1)     ; all womens exits
                        (imply (or (at ?p1 ?side1) (= ?p1 ?person1))
                            (women ?p1)
                        )
                    )
                     
                )

        )
        :effect (and 
            (not (at ?person1 ?side1))
            (at ?person1 ?side2)
            (boat_side ?side2)
            (not (boat_side ?side1))
        )
    )
)
