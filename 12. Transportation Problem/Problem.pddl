(define (problem Transport_problem)
    (:domain Transport)
    (:objects
        A1 A2                   - airplane
        T1 T2 T3                - truck
        AP1 AP2 AP3             - location  ; airports
        A B C D E F G H         - location
        P1 P2 P3 P4 P5 P6 P7 P8 - package
        n0 n1 n2 n3             - num
    )

    (:init
        (next n0 n1)
        (next n1 n2)
        (next n2 n3)

        (capacity A1 n3)    ; airplane capacity is 3 packages
        (capacity A2 n3)    ; airplane capacity is 3 packages
        (capacity T1 n1)    ; truck capacity is 1 package
        (capacity T2 n1)    ; truck capacity is 1 package
        (capacity T3 n1)    ; truck capacity is 1 package

        (movable A1 AP1 AP2)
        (movable A1 AP1 AP3)
        (movable A1 AP2 AP1)
        (movable A1 AP2 AP3)
        (movable A1 AP3 AP1)
        (movable A1 AP3 AP2)
        (movable A2 AP1 AP2)
        (movable A2 AP1 AP3)
        (movable A2 AP2 AP1)
        (movable A2 AP2 AP3)
        (movable A2 AP3 AP1)
        (movable A2 AP3 AP2)

        (movable T1 A B)
        (movable T1 A C)
        (movable T1 B C)
        (movable T1 B A)
        (movable T1 C A)
        (movable T1 C B)
        (movable T1 A AP1)
        (movable T1 B AP1)
        (movable T1 C AP1)
        (movable T1 AP1 A)
        (movable T1 AP1 B)
        (movable T1 AP1 C)
        (movable T2 D E)
        (movable T2 D F)
        (movable T2 E D)
        (movable T2 E F)
        (movable T2 F D)
        (movable T2 F E)
        (movable T2 D AP2)
        (movable T2 E AP2)
        (movable T2 F AP2)
        (movable T2 AP2 D)
        (movable T2 AP2 E)
        (movable T2 AP2 F)
        (movable T3 G H)
        (movable T3 H G)
        (movable T3 G AP3)
        (movable T3 H AP3)
        (movable T3 AP3 G)
        (movable T3 AP3 H)

        (at A1 AP1)
        (at A2 AP3)
        (at T1 A)
        (at T2 F)
        (at T3 H)
        (at P1 A)
        (at P2 B)
        (at P3 C)
        (at P4 D)
        (at P5 E)
        (at P6 F)
        (at P7 G)
        (at P8 H)
    )

    (:goal (and
        (at P1 D)
        (at P2 G)
        (at P3 E)
        (at P4 F)
        (at P5 H)
        (at P6 C)
        (at P7 B)
        (at P8 A)
    ))
)
