(define (problem missionaries_cannibals_problem)
    (:domain missionaries_cannibals_domain)
    (:objects
        side1 side2         - side  ; river sides
        n0 n1 n2 n3         - num   ; numbers 0 to 3
    )

    (:init
        (boat side1)                ; boat is at side1
        (opposite side1 side2)
        (opposite side2 side1)

        (missionaries side1 n3)     ; three missionaries at side1
        (cannibals side1 n3)        ; three cannibals at side1
        (missionaries side2 n0)
        (cannibals side2 n0)

        (plus1 n0 n1)
        (plus1 n1 n2)
        (plus1 n2 n3)
        (plus2 n0 n2)
        (plus2 n1 n3)

        (safe n0 n0) (safe n0 n1) (safe n0 n2) (safe n0 n3)     ; no missionaries
        (safe n1 n0) (safe n1 n1)                               ; missionaries >= cannibals
        (safe n2 n0) (safe n2 n1) (safe n2 n2)
        (safe n3 n0) (safe n3 n1) (safe n3 n2) (safe n3 n3)
    )

    (:goal (and
        (missionaries side2 n3)
        (cannibals side2 n3)
    ))
)
