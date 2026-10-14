;; Two cities: Dhaka and Chittagong. Each has a post office and an airport.
;;  pkg1 : Dhaka post office      -> Chittagong post office
;;  pkg2 : Chittagong airport     -> Dhaka post office
(define (problem logistics-bd)
  (:domain logistics)

  (:objects
    dhaka chittagong        - city
    dhaka-po ctg-po         - location
    dhaka-airport ctg-airport - airport
    truck-dhaka truck-ctg   - truck
    plane1                  - airplane
    pkg1 pkg2               - package
  )

  (:init
    (in-city dhaka-po dhaka)  (in-city dhaka-airport dhaka)
    (in-city ctg-po chittagong) (in-city ctg-airport chittagong)

    (at truck-dhaka dhaka-po)
    (at truck-ctg ctg-airport)
    (at plane1 dhaka-airport)

    (at pkg1 dhaka-po)
    (at pkg2 ctg-airport)
  )

  (:goal (and (at pkg1 ctg-po)
              (at pkg2 dhaka-po)))
)
