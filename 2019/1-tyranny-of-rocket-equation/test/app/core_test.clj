(ns app.core-test
  (:require [clojure.test :refer :all]
            [app.core :refer :all]))

; (deftest a-test
;   (testing "FIXME, I fail."
;     (is (= 1 1))))

; (deftest find-fuel1
;   (is (= (find-fuel 12) 2)))

; (deftest find-fuel2
;   (is (= (find-fuel 14) 2)))

; (deftest find-fuel3
;   (is (= (find-fuel 1969) 654)))

; (deftest find-fuel4
;   (is (= (find-fuel 100756) 33583)))

; (deftest test-get-fuels
;   (is (= (get-fuels) [123 456])))

; (deftest test-sum-fuels
;   (is (= (sum-fuels) (+ 123 456))))

(deftest test-get-calc-and-sum
  (is (= (get-calc-and-sum) (+ 33583 654 2 2))))

(deftest get-output
  (println "OUTPUT:")
  (println (get-calc-and-sum)))
