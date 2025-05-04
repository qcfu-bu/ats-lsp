#include "srcgen2/HATS/xatsopt_sats.hats"
#include "srcgen2/HATS/xatsopt_dpre.hats"
#include "./../HATS/libxatsopt.hats"

#staload "./../SATS/lsp_bootstrap.sats"

fun range_of_loctn(loc: loctn) : range
fun diagnostics_of_d3ecl(ds: diagnostics, dcl: d3ecl) : void
fun diagnostics_of_d3eclist(ds: diagnostics, dcls: d3eclist) : void
fun diagnostics_of_d3eclistopt(ds: diagnostics, dopt: d3eclistopt) : void
fun diagnostics_of_d3parsed(ds: diagnostics, dpar: d3parsed) : void
fun ats_validator(diagnostics, url) : void