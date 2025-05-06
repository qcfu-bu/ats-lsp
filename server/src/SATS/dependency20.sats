#include "./../HATS/libxatsopt.hats"

#staload "./../SATS/lsp_bootstrap.sats"

// ----------------------------------------------------

#typedef dependency20_t(syn:tbox) = (depgraph, syn, sym_t) -> void

// ----------------------------------------------------

fun list_dependency20_fnp{syn:tbox} 
  (depgraph, list(syn), sym_t, dependency20_t(syn)): void
fun optn_dependency20_fnp{syn:tbox}
  (depgraph, optn(syn), sym_t, dependency20_t(syn)): void

// ----------------------------------------------------

fun dependency20_d2exp(depgraph, d2exp, sym_t): void
fun dependency20_d2explst(depgraph, d2explst, sym_t): void

fun dependency20_d2ecl(depgraph, d2ecl, sym_t): void
fun dependency20_d2eclist(depgraph, d2eclist, sym_t): void
fun dependency20_d2eclistopt(depgraph, d2eclistopt, sym_t): void

fun dependency20_d2parsed(depgraph, d2parsed, sym_t): void
fun dependency20_s2taloadopt(depgraph, s2taloadopt, sym_t): void