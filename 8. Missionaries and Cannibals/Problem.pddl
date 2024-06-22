(define (problem missionaries_cannibals_problem) 
    (:domain missionaries_cannibals_domain)
    (:requirements :strips :negative-preconditions :fluents :durative-actions)
    (:objects 
        side1 side2             ;sides
        miss1 miss2 miss3       ; three missinaries
        cann1 cann2 cann3       ; three cannibals
        missionaries_in_side1 cannibals_in_side1
    )

    (:init
        (boat side1)            ;boat is at side 1
        (is_side1 side1)
        (is_side2 side2)

        (missionary miss1)
        (missionary miss2)
        (missionary miss3)

        (cannibal cann1)
        (cannibal cann2)
        (cannibal cann3)

        (stayed miss1 side1)
        (stayed miss2 side1)
        (stayed miss3 side1)
        (stayed cann1 side1)
        (stayed cann2 side1)
        (stayed cann3 side1)

        (value3 missionaries_in_side1)     ; three missionaries at side 1
        (value3 cannibals_in_side1)     ; three cannibals at side 1

        (missionary missionaries_in_side1)
        (cannibal cannibals_in_side1)

        (transfer cann1 cann2)
        (transfer cann1 cann3)
        (transfer cann2 cann1)
        (transfer cann2 cann3)
        (transfer cann3 cann1)
        (transfer cann3 cann2)

        (transfer miss1 miss2)
        (transfer miss1 miss3)
        (transfer miss2 miss1)
        (transfer miss2 miss3)
        (transfer miss3 miss1)
        (transfer miss3 miss2)
       

    )

    (:goal (and
        (boat side2)

        (stayed miss1 side2)
        (stayed miss2 side2)
        (stayed miss3 side2)

        (stayed cann1 side2)
        (stayed cann2 side2)
        (stayed cann3 side2)
    ))
)
