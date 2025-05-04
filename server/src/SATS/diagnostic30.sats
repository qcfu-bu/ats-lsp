#include "srcgen2/HATS/xatsopt_sats.hats"
#include "srcgen2/HATS/xatsopt_dpre.hats"
#include "./../HATS/libxatsopt.hats"

#staload "./../SATS/lsp_bootstrap.sats"

// ----------------------------------------------------

#define DIAGNOSTIC30_ERRVL 2
#typedef diagnostic30_t(syn:tbox) = (diagnostics, syn) -> void

// ----------------------------------------------------

fun list_diagnostic30_fnp{syn:tbox} 
  (diagnostics, list(syn), diagnostic30_t(syn)): void
fun optn_diagnostic30_fnp{syn:tbox}
  (diagnostics, optn(syn), diagnostic30_t(syn)): void

// ----------------------------------------------------

fun diagnostic30_s2typ(FILR, s2typ): void

// ----------------------------------------------------
// QCFU: diagnostic30 for dynamics
// ----------------------------------------------------

fun diagnostic30_d3pat(diagnostics, d3pat): void
fun diagnostic30_d3exp(diagnostics, d3exp): void

fun diagnostic30_l3d3p(diagnostics, l3d3p): void
fun diagnostic30_l3d3e(diagnostics, l3d3e): void

fun diagnostic30_f3arg(diagnostics, f3arg): void

fun diagnostic30_d3gua(diagnostics, d3gua): void
fun diagnostic30_d3gpt(diagnostics, d3gpt): void
fun diagnostic30_d3cls(diagnostics, d3cls): void

fun diagnostic30_d3ecl(diagnostics, d3ecl): void

fun diagnostic30_s2typlst(diagnostics, s2typlst): void

fun diagnostic30_d3patlst(diagnostics, d3patlst): void
fun diagnostic30_d3patopt(diagnostics, d3patopt): void

fun diagnostic30_d3explst(diagnostics, d3explst): void
fun diagnostic30_d3expopt(diagnostics, d3expopt): void

fun diagnostic30_l3d3plst(diagnostics, l3d3plst): void
fun diagnostic30_l3d3elst(diagnostics, l3d3elst): void

fun diagnostic30_f3arglst(diagnostics, f3arglst): void

fun diagnostic30_d3gualst(diagnostics, d3gualst): void
fun diagnostic30_d3clslst(diagnostics, d3clslst): void

fun diagnostic30_d3eclist(diagnostics, d3eclist): void

fun diagnostic30_teqd3exp(diagnostics, teqd3exp): void

fun diagnostic30_d3valdcl(diagnostics, d3valdcl): void
fun diagnostic30_d3vardcl(diagnostics, d3vardcl): void
fun diagnostic30_d3fundcl(diagnostics, d3fundcl): void

fun diagnostic30_d3valdclist(diagnostics, d3valdclist): void

fun diagnostic30_d3vardclist(diagnostics, d3vardclist): void
fun diagnostic30_d3fundclist(diagnostics, d3fundclist): void
fun diagnostic30_d3parsed(diagnostics, d3parsed ): void
fun diagnostic30_d3explstopt(diagnostics, d3explstopt): void
fun diagnostic30_d3eclistopt(diagnostics, d3eclistopt): void