(~ size
  (line (seq 300 10000)
    (rv 3 10)))

(sci2
    playbuf2
    (st 0.01)
    :buf (st 0)
    :start (st 0)
    :loopsize (st 10000)
    :dur (st 2.0)
    :rate (ch 10000.0)
    :pos (rv -1 1)
    :amp (st 1.0))