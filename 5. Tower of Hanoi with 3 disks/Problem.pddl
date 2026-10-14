(define (problem Tower_of_Hanoi_3disk_problem)
    (:domain Tower_of_Hanoi_3disk)
    (:objects
        disk1 disk2 disk3
        tower1 tower2 tower3
    )

    (:init

        (on disk3 tower1)  ; disk3 on tower1
        (on disk2 disk3)    ; disk2 on disk3
        (on disk1 disk2)    ; disk1 on disk2
        (clear disk1)

        (clear tower2)
        (clear tower3)

        (smaller disk1 disk2)
        (smaller disk1 disk3)
        (smaller disk2 disk3)

        (smaller disk1 tower1)
        (smaller disk1 tower2)
        (smaller disk1 tower3)
        (smaller disk2 tower1)
        (smaller disk2 tower2)
        (smaller disk2 tower3)
        (smaller disk3 tower1)
        (smaller disk3 tower2)
        (smaller disk3 tower3)

    )

    (:goal (and
        (on disk3 tower3)
        (on disk2 disk3)
        (on disk1 disk2)
    ))
)
