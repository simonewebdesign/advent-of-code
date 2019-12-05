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


(defn input
  [name]
  (->
    name
    read-file
    split-on-comma))


(defn numbers
  [list]
  (map to-int list))


; CONTINUE FROM HERE
; (defn process
;   [seq idx]
;   (let [
;     op (first seq)
;     ]
;     (case op
;       "1" (let [
;         in1-pos (nth seq (+ 1 idx))
;         in2-pos (nth seq (+ 2 idx))
;         out-pos (nth seq (+ 3 idx))
;         in1-val (nth seq in1-pos)
;         in2-val (nth seq in2-pos)
;         out-new-val (+ in1-val in2-val)
;         new-seq (assoc seq out-pos out-new-val)
;       ]
;       (process new-seq (+ 4 idx)))
;       "2" (let [
;         in1-pos (nth seq (+ 1 idx))
;         in2-pos (nth seq (+ 2 idx))
;         out-pos (nth seq (+ 3 idx))
;         in1-val (nth seq in1-pos)
;         in2-val (nth seq in2-pos)
;         out-new-val (* in1-val in2-val)
;         new-seq (assoc seq out-pos out-new-val)
;       ]
;       (process new-seq (+ 4 idx)))
;       "99" seq)))

; (println "OUTPUT:")
; (println (process list 0))

      ; "1" (let [
      ;     new-val (+ (nth seq (+ 1 idx)) (nth seq (+ 2 idx)))
      ;     new-idx (nth seq (+ 3 idx))
      ;     new-seq (assoc seq idx new-idx)
      ;   ]
      ;   (process seq (+ 4 idx)))
      ; "2" (let [
      ;     new-val (* (nth seq (+ 1 idx)) (nth seq (+ 2 idx)))
      ;     new-idx (nth seq (+ 3 idx))
      ;     new-seq (assoc seq idx new-idx)
      ;   ]
      ;   (process seq (+ 4 idx)))
      ;   )))

; (defn op->result
;   [val op]
;   (case op
;     :sum val +))

; useful functions:
; nth seq idx
; update

; 0 1 2 3

; 1 5 6 0

; case
;   sum:
;     newVal = seq[currIdx+1] + seq[currIdx+2]
;     newIdx = seq[currIdx+3]
;     seq[newIdx] = newVal

;     process(seq, currIdx+4)

;   mult:
;     ...

;   halt:
;     return seq
