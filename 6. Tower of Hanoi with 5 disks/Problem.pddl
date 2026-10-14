(define (problem Tower_of_Hanoi_5disk_problem)
    (:domain Tower_of_Hanoi_5disk)
    (:objects
        disk1 disk2 disk3 disk4 disk5
        tower1 tower2 tower3
    )

    (:init

        (on disk5 tower1)  ; disk5 on tower1
        (on disk4 disk5)    ; disk4 on disk5
        (on disk3 disk4)    ; disk3 on disk4
        (on disk2 disk3)    ; disk2 on disk3
        (on disk1 disk2)    ; disk1 on disk2
        (clear disk1)

        (clear tower2)
        (clear tower3)

        (smaller disk1 disk2)
        (smaller disk1 disk3)
        (smaller disk2 disk3)
        (smaller disk1 disk4)
        (smaller disk2 disk4)
        (smaller disk3 disk4)
        (smaller disk1 disk5)
        (smaller disk2 disk5)
        (smaller disk3 disk5)
        (smaller disk4 disk5)

        (smaller disk1 tower1)
        (smaller disk1 tower2)
        (smaller disk1 tower3)
        (smaller disk2 tower1)
        (smaller disk2 tower2)
        (smaller disk2 tower3)
        (smaller disk3 tower1)
        (smaller disk3 tower2)
        (smaller disk3 tower3)
        (smaller disk4 tower1)
        (smaller disk4 tower2)
        (smaller disk4 tower3)
        (smaller disk5 tower1)
        (smaller disk5 tower2)
        (smaller disk5 tower3)

    )

    (:goal (and
        (on disk5 tower3)
        (on disk4 disk5)
        (on disk3 disk4)
        (on disk2 disk3)
        (on disk1 disk2)
    ))
)
