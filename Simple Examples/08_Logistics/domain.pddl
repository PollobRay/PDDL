;; =============================================================
;; Problem 8 : Logistics
;; Level     : Intermediate / Medium
;; Trucks carry packages inside a city; airplanes fly packages
;; between airports of different cities.
;; =============================================================
(define (domain logistics)
  (:requirements :strips :typing)

  (:types
    city location locatable - object
    airport        - location     ; an airport is a special location
    package vehicle - locatable    ; things that can be "at" a location
    truck airplane  - vehicle
  )

  (:predicates
    (at ?x - locatable ?l - location)   ; package/vehicle ?x is at ?l
    (in ?p - package ?v - vehicle)      ; package ?p is inside vehicle ?v
    (in-city ?l - location ?c - city)   ; location ?l belongs to city ?c
  )

  ;; Load a package into any vehicle at the same location
  (:action load
    :parameters (?p - package ?v - vehicle ?l - location)
    :precondition (and (at ?p ?l) (at ?v ?l))
    :effect (and (in ?p ?v) (not (at ?p ?l)))
  )

  ;; Unload a package from a vehicle
  (:action unload
    :parameters (?p - package ?v - vehicle ?l - location)
    :precondition (and (in ?p ?v) (at ?v ?l))
    :effect (and (at ?p ?l) (not (in ?p ?v)))
  )

  ;; A truck drives between two locations of the SAME city
  (:action drive-truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and (at ?t ?from)
                       (in-city ?from ?c) (in-city ?to ?c))
    :effect (and (at ?t ?to) (not (at ?t ?from)))
  )

  ;; An airplane flies between two airports (any cities)
  (:action fly-airplane
    :parameters (?a - airplane ?from - airport ?to - airport)
    :precondition (at ?a ?from)
    :effect (and (at ?a ?to) (not (at ?a ?from)))
  )
)
