module.exports =
  increase: (n) -> type: 'INCR', amount: n
  decrease: (n) -> type: 'DECR', amount: n
