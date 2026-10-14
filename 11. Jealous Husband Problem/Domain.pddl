(define (domain Jealous_Husband)
    (:requirements :strips :typing :equality :negative-preconditions :disjunctive-preconditions
                   :universal-preconditions :existential-preconditions)

    (:types person side)

    (:predicates
        (husband ?m - person ?w - person)   ; m is the husband of w
        (man ?p - person)                   ; p is a man
        (woman ?p - person)                 ; p is a woman
        (at ?p - person ?s - side)          ; p is at side s
        (boat_side ?s - side)               ; boat is at side s
    )

    ; Safety rule: a wife may not be with another man unless her own husband is also there.
    ; Each condition below is checked on the state AFTER the move:
    ;   on side1 : people at side1 except the people in the boat
    ;   on side2 : people at side2 plus the people in the boat

    (:action move_two
        :parameters (?person1 ?person2 - person ?side1 ?side2 - side)
        :precondition (and
            (not (= ?side1 ?side2))
            (not (= ?person1 ?person2))
            (boat_side ?side1)
            (at ?person1 ?side1)
            (at ?person2 ?side1)

            ; the boat itself must be safe: two men, two women, or a married couple
            (or (and (man ?person1) (man ?person2))
                (and (woman ?person1) (woman ?person2))
                (husband ?person1 ?person2)
                (husband ?person2 ?person1))

            ; side1 condition
            (forall (?w ?m - person)
                (imply (and (woman ?w) (man ?m) (not (husband ?m ?w))
                            (at ?w ?side1) (not (= ?w ?person1)) (not (= ?w ?person2))
                            (at ?m ?side1) (not (= ?m ?person1)) (not (= ?m ?person2)))
                    (exists (?h - person)
                        (and (husband ?h ?w)
                             (at ?h ?side1) (not (= ?h ?person1)) (not (= ?h ?person2))))))

            ; side2 condition
            (forall (?w ?m - person)
                (imply (and (woman ?w) (man ?m) (not (husband ?m ?w))
                            (or (at ?w ?side2) (= ?w ?person1) (= ?w ?person2))
                            (or (at ?m ?side2) (= ?m ?person1) (= ?m ?person2)))
                    (exists (?h - person)
                        (and (husband ?h ?w)
                             (or (at ?h ?side2) (= ?h ?person1) (= ?h ?person2))))))
        )
        :effect (and
            (not (at ?person1 ?side1))
            (not (at ?person2 ?side1))
            (at ?person1 ?side2)
            (at ?person2 ?side2)
            (not (boat_side ?side1))
            (boat_side ?side2)
        )
    )

    (:action move_one
        :parameters (?person1 - person ?side1 ?side2 - side)
        :precondition (and
            (not (= ?side1 ?side2))
            (boat_side ?side1)
            (at ?person1 ?side1)

            ; side1 condition
            (forall (?w ?m - person)
                (imply (and (woman ?w) (man ?m) (not (husband ?m ?w))
                            (at ?w ?side1) (not (= ?w ?person1))
                            (at ?m ?side1) (not (= ?m ?person1)))
                    (exists (?h - person)
                        (and (husband ?h ?w)
                             (at ?h ?side1) (not (= ?h ?person1))))))

            ; side2 condition
            (forall (?w ?m - person)
                (imply (and (woman ?w) (man ?m) (not (husband ?m ?w))
                            (or (at ?w ?side2) (= ?w ?person1))
                            (or (at ?m ?side2) (= ?m ?person1)))
                    (exists (?h - person)
                        (and (husband ?h ?w)
                             (or (at ?h ?side2) (= ?h ?person1))))))
        )
        :effect (and
            (not (at ?person1 ?side1))
            (at ?person1 ?side2)
            (not (boat_side ?side1))
            (boat_side ?side2)
        )
    )
)
