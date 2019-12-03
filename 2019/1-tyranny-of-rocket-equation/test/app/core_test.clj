(ns app.core-test
  (:require [clojure.test :refer :all]
            [app.core :refer :all]))

(deftest calc-fuel1
  (is (= (calc-fuel 12) 2)))

(deftest calc-fuel2
  (is (= (calc-fuel 14) 2)))

(deftest calc-fuel3
  (is (= (calc-fuel 1969) 654)))

(deftest calc-fuel4
  (is (= (calc-fuel 100756) 33583)))

(deftest test-get-fuels
  (is (= (count (get-fuels)) 100)))

(deftest accumulate-fuel1
  (is (= (accumulate-fuel 100756) 50346)))

(deftest accumulate-fuel2
  (is (= (accumulate-fuel 1969) 966)))

(deftest get-output
  (println "OUTPUT:")
  (println (get-calc-and-sum)))
