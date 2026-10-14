(define (problem Jealous_Husband_prob)
    (:domain Jealous_Husband)
    (:objects
        man1 man2 man3          - person
        woman1 woman2 woman3    - person
        side1 side2             - side
    )

    (:init
        (husband man1 woman1)
        (husband man2 woman2)
        (husband man3 woman3)

        (man man1)
        (man man2)
        (man man3)
        (woman woman1)
        (woman woman2)
        (woman woman3)

        (boat_side side1)
        (at man1 side1)
        (at man2 side1)
        (at man3 side1)
        (at woman1 side1)
        (at woman2 side1)
        (at woman3 side1)
    )

    (:goal (and
        (boat_side side2)
        (at man1 side2)
        (at man2 side2)
        (at man3 side2)
        (at woman1 side2)
        (at woman2 side2)
        (at woman3 side2)
    ))
)
