#include "./../HATS/libxatsopt.hats"

#staload "./../SATS/lsp_bootstrap.sats"

// ----------------------------------------------------

#define DIAGNOSTIC10_ERRVL 1
#typedef diagnostic10_t(syn:tbox) = (diagnostics, syn) -> void

// ----------------------------------------------------

fun diagnostic10_g1exp(diagnostics, g1exp): void
fun diagnostic10_g1explst(diagnostics, g1explst): void
fun diagnostic10_g1expopt(diagnostics, g1expopt): void

fun diagnostic10_sort1(diagnostics, sort1): void
fun diagnostic10_sort1lst(diagnostics, sort1lst): void
fun diagnostic10_sort1opt(diagnostics, sort1opt): void

fun diagnostic10_s1exp(diagnostics, s1exp): void
fun diagnostic10_s1explst(diagnostics, s1explst): void
fun diagnostic10_s1expopt(diagnostics, s1expopt): void

fun diagnostic10_wths1exp(diagnostics, wths1exp): void

fun diagnostic10_l1s1e(diagnostics, l1s1e): void
fun diagnostic10_l1s1elst(diagnostics, l1s1elst): void

fun diagnostic10_s1arg(diagnostics, s1arg): void
fun diagnostic10_s1arglst(diagnostics, s1arglst): void
fun diagnostic10_s1qualst(diagnostics, s1qualst): void

fun diagnostic10_s1mag(diagnostics, s1mag): void
fun diagnostic10_s1maglst(diagnostics, s1maglst): void
fun diagnostic10_t1mag(diagnostics, t1mag): void
fun diagnostic10_t1maglst(diagnostics, t1maglst): void

fun diagnostic10_s1tcn(diagnostics, s1tcn): void
fun diagnostic10_s1tcnlst(diagnostics, s1tcnlst): void

fun diagnostic10_d1arg(diagnostics, d1arg): void
fun diagnostic10_d1arglst(diagnostics, d1arglst): void

fun diagnostic10_q1arg(diagnostics, q1arg): void
fun diagnostic10_q1arglst(diagnostics, q1arglst): void

fun diagnostic10_teqd1exp(diagnostics, teqd1exp): void

fun diagnostic10_t1iag(diagnostics, t1iag): void
fun diagnostic10_t1arg(diagnostics, t1arg): void
fun diagnostic10_t1arglst(diagnostics, t1arglst): void

fun diagnostic10_a1tdf(diagnostics, a1tdf): void
fun diagnostic10_s1tdf(diagnostics, s1tdf): void

fun diagnostic10_d1pat(diagnostics, d1pat): void
fun diagnostic10_d1patlst(diagnostics, d1patlst): void

fun diagnostic10_l1d1e(diagnostics, l1d1e): void
fun diagnostic10_l1d1elst(diagnostics, l1d1elst): void

fun diagnostic10_l1d1p(diagnostics, l1d1p): void
fun diagnostic10_l1d1plst(diagnostics, l1d1plst): void

fun diagnostic10_f1arg(diagnostics, f1arg): void
fun diagnostic10_f1arglst(diagnostics, f1arglst): void

fun diagnostic10_s1res(diagnostics, s1res): void
fun diagnostic10_d1gua(diagnostics, d1gua): void
fun diagnostic10_d1gualst(diagnostics, d1gualst): void
fun diagnostic10_d1cls(diagnostics, d1cls): void
fun diagnostic10_d1clslst(diagnostics, d1clslst): void

fun diagnostic10_d1tst(diagnostics, d1tst): void
fun diagnostic10_d1tstlst(diagnostics, d1tstlst): void

fun diagnostic10_d1gpt(diagnostics, d1gpt): void

fun diagnostic10_s1qag(diagnostics, s1qag): void
fun diagnostic10_s1qaglst(diagnostics, s1qaglst): void

fun diagnostic10_t1qag(diagnostics, t1qag): void
fun diagnostic10_t1qaglst(diagnostics, t1qaglst): void
fun diagnostic10_t1iaglst(diagnostics, t1iaglst): void

fun diagnostic10_d1valdcl(diagnostics, d1valdcl): void
fun diagnostic10_d1valdclist(diagnostics, d1valdclist): void

fun diagnostic10_d1vardcl(diagnostics, d1vardcl): void
fun diagnostic10_d1vardclist(diagnostics, d1vardclist): void

fun diagnostic10_d1fundcl(diagnostics, d1fundcl): void
fun diagnostic10_d1fundclist(diagnostics, d1fundclist): void

fun diagnostic10_d1cstdcl(diagnostics, d1cstdcl): void
fun diagnostic10_d1cstdclist(diagnostics, d1cstdclist): void

fun diagnostic10_d1exp(diagnostics, d1exp): void
fun diagnostic10_d1explst(diagnostics, d1explst): void
fun diagnostic10_d1expopt(diagnostics, d1expopt): void

fun diagnostic10_d1ecl(diagnostics, d1ecl): void
fun diagnostic10_d1eclist(diagnostics, d1eclist): void
fun diagnostic10_d1eclistopt(diagnostics, d1eclistopt): void

fun diagnostic10_d1parsed(diagnostics, d1parsed): void