#include "srcgen2/HATS/xatsopt_sats.hats"
#include "srcgen2/HATS/xatsopt_dpre.hats"
#include "./../HATS/libxatsopt.hats"

#staload "./../SATS/lsp_bootstrap.sats"

fun range_of_loctn(loctn) : range
fun diagnostics_of_d3exp(diagnostics, d3exp): void
fun diagnostics_of_f3arglst(diagnostics, f3arglst): void
fun diagnostics_of_d3valdclist(diagnostics, d3valdclist): void
fun diagnostics_of_d3vardclist(diagnostics, d3vardclist): void
fun diagnostics_of_d3fundclist(diagnostics, d3fundclist): void
fun diagnostics_of_d3ecl(diagnostics, d3ecl) : void
fun diagnostics_of_d3eclist(diagnostics, d3eclist) : void
fun diagnostics_of_d3eclistopt(diagnostics, d3eclistopt) : void
fun diagnostics_of_d3parsed(diagnostics, d3parsed) : void
fun ats_validator(diagnostics, url) : void