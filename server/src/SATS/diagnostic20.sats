#include "./../HATS/libxatsopt.hats"

#staload "./../SATS/lsp_bootstrap.sats"

// ----------------------------------------------------

#define DIAGNOSTIC20_ERRVL 2
#typedef diagnostic20_t(syn:tbox) = (diagnostics, syn) -> void

// ----------------------------------------------------

fun list_diagnostic20_fnp{syn:tbox}
  (diagnostics, list(syn), diagnostic20_t(syn)): void
fun optn_diagnostic20_fnp{syn:tbox}
  (diagnostics, optn(syn), diagnostic20_t(syn)): void

// ----------------------------------------------------

fun diagnostic20_d2pat(diagnostics, d2pat): void
fun diagnostic20_d2exp(diagnostics, d2exp): void

fun diagnostic20_l2d2p(diagnostics, l2d2p): void
fun diagnostic20_l2d2e(diagnostics, l2d2e): void

fun diagnostic20_f2arg(diagnostics, f2arg): void

fun diagnostic20_d2gua(diagnostics, d2gua): void
fun diagnostic20_d2gpt(diagnostics, d2gpt): void
fun diagnostic20_d2cls(diagnostics, d2cls): void

fun diagnostic20_d2ecl(diagnostics, d2ecl): void

fun diagnostic20_d2patlst(diagnostics, d2patlst): void
fun diagnostic20_d2patopt(diagnostics, d2patopt): void

fun diagnostic20_d2explst(diagnostics, d2explst): void
fun diagnostic20_d2expopt(diagnostics, d2expopt): void

fun diagnostic20_l2d2plst(diagnostics, l2d2plst): void
fun diagnostic20_l2d2elst(diagnostics, l2d2elst): void

fun diagnostic20_f2arglst(diagnostics, f2arglst): void

fun diagnostic20_d2gualst(diagnostics, d2gualst): void
fun diagnostic20_d2clslst(diagnostics, d2clslst): void

fun diagnostic20_d2eclist(diagnostics, d2eclist): void

fun diagnostic20_teqd2exp(diagnostics, teqd2exp): void

fun diagnostic20_d2valdcl(diagnostics, d2valdcl): void
fun diagnostic20_d2vardcl(diagnostics, d2vardcl): void
fun diagnostic20_d2fundcl(diagnostics, d2fundcl): void

fun diagnostic20_d2valdclist(diagnostics, d2valdclist): void

fun diagnostic20_d2vardclist(diagnostics, d2vardclist): void

fun diagnostic20_d2fundclist(diagnostics, d2fundclist): void

fun diagnostic20_d2parsed(diagnostics, d2parsed ): void

fun diagnostic20_d2explstopt(diagnostics, d2explstopt): void
fun diagnostic20_d2eclistopt(diagnostics, d2eclistopt): void