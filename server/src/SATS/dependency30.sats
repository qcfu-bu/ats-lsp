#include "./../HATS/libxatsopt.hats"

#staload "./../SATS/lsp_bootstrap.sats"

// ----------------------------------------------------

#typedef dependency30_t(syn:tbox) = (depgraph, syn, sym_t) -> void

// ----------------------------------------------------

fun list_dependency30_fnp{syn:tbox} 
  (depgraph, list(syn), sym_t, dependency30_t(syn)): void
fun optn_dependency30_fnp{syn:tbox}
  (depgraph, optn(syn), sym_t, dependency30_t(syn)): void

// ----------------------------------------------------

fun dependency30_d3exp(depgraph, d3exp, sym_t): void
fun dependency30_d3explst(depgraph, d3explst, sym_t): void

fun dependency30_d3ecl(depgraph, d3ecl, sym_t): void
fun dependency30_d3eclist(depgraph, d3eclist, sym_t): void
fun dependency30_d3eclistopt(depgraph, d3eclistopt, sym_t): void

fun dependency30_d3parsed(depgraph, d3parsed, sym_t): void
fun dependency30_s3taloadopt(depgraph, s3taloadopt, sym_t): void