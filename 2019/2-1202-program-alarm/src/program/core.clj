(ns program.core)
(require '[clojure.string :as str])


(defn read-file
  [name]
  (slurp name))


(defn to-int
  [x]
  (Integer/valueOf x))


(defn opcode->op
  [code]
  (case code
    "1" :sum
    "2" :mult
    "99" :halt
    :dunno))


(defn split-on-comma
  [in]
  (str/split in #","))


(defn numbers
  [list]
  (mapv to-int list))


(defn numbers-restored
  [list]
  (->
    list
    (assoc 1 12)
    (assoc 2 2)))


(defn input
  [name]
  (->
    name
    read-file
    split-on-comma
    numbers))


(defn process
  [seq idx]
  (let [op (nth seq idx)]
    (case op
      1 (let [
        in1-pos (nth seq (+ 1 idx))
        in2-pos (nth seq (+ 2 idx))
        out-pos (nth seq (+ 3 idx))
        in1-val (nth seq in1-pos)
        in2-val (nth seq in2-pos)
        out-new-val (+ in1-val in2-val)
        new-seq (assoc seq out-pos out-new-val)
      ]
        (process new-seq (+ 4 idx)))
      2 (let [
        in1-pos (nth seq (+ 1 idx))
        in2-pos (nth seq (+ 2 idx))
        out-pos (nth seq (+ 3 idx))
        in1-val (nth seq in1-pos)
        in2-val (nth seq in2-pos)
        out-new-val (* in1-val in2-val)
        new-seq (assoc seq out-pos out-new-val)
      ]
        (process new-seq (+ 4 idx)))
      99 seq
      seq)))


(println "OUTPUT:")
(println
  (process
    (numbers-restored
      (input "input.txt")) 0))
