(ns program.core-test
  (:require [clojure.test :refer :all]
            [program.core :refer :all]))


(deftest test-read-file
  (is (= (read-file "test.txt") "1,2,3")))


(deftest test-to-int
  (is (= (to-int "123") 123))
  (is (= (to-int "456") 456)))
  ;(is (= (to-int "123\n") 123))) ; java.lang.NumberFormatException


; (deftest test-read-string
;   (is (= (read-string "123") 123))
;   (is (= (read-string "123") 123))


(deftest test-opcode->op
  (testing "Returns the right operation"
    (is (= (opcode->op "1") :sum))
    (is (= (opcode->op "2") :mult))
    (is (= (opcode->op "99") :halt))
    (is (= (opcode->op "LUL") :dunno))))


(deftest test-split-on-comma
  (is (= (split-on-comma "1,2,3") ["1" "2" "3"])))


(deftest test-input
  (is (= (input "test.txt") ["1" "2" "3"])))


(deftest test-numbers
  (is (= (numbers ["1" "2" "3"]) [1 2 3])))


; (deftest foo
;   (is (= (input "test.txt") [1 2 3])))

; (deftest test-sum
;   (is (= (sum 1 2) 3)))

; (deftest test-mult
;   (is (= (mult 1 2) 2)))

; (deftest test-halt
;   (testing "returns the altered output"
;     (is (= (halt "1,9,10,3,2,3,11,0,99,30,40,50") "3500,9,10,70,2,3,11,0,99,30,40,50"))))
