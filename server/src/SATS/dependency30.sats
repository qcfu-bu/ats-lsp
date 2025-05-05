#include "./../HATS/libxatsopt.hats"

#staload "./../SATS/lsp_bootstrap.sats"

// ----------------------------------------------------

#typedef dependency30_t(syn:tbox) = (depgraph, syn, stamp) -> void

// ----------------------------------------------------

fun list_dependency30_fnp{syn:tbox} 
  (depgraph, list(syn), stamp, dependency30_t(syn)): void
fun optn_dependency30_fnp{syn:tbox}
  (depgraph, optn(syn), stamp, dependency30_t(syn)): void

// ----------------------------------------------------

fun dependency30_d3exp(depgraph, d3exp, stamp): void
fun dependency30_d3explst(depgraph, d3explst, stamp): void

fun dependency30_d3ecl(depgraph, d3ecl, stamp): void
fun dependency30_d3eclist(depgraph, d3eclist, stamp): void
fun dependency30_d3eclistopt(depgraph, d3eclistopt, stamp): void

fun dependency30_d3parsed(depgraph, d3parsed, stamp): void