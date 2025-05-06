#include "srcgen2/HATS/xatsopt_sats.hats"
#include "srcgen2/HATS/xatsopt_dpre.hats"
#include "./../HATS/libxatsopt.hats"

#staload "./../SATS/lsp_bootstrap.sats"
#staload "./../SATS/dependency20.sats"

#implfun list_dependency20_fnp{syn:tx}(out, lst, key, fpr) =
  list_foritm<syn>(lst) 
  where {
    #impltmp foritm$work<syn>(syn) = fpr(out, syn, key)
  }

#implfun optn_dependency20_fnp{syn:tx}(out, opt, key, fpr) =
  optn_foritm<syn>(opt) 
  where {
    #impltmp foritm$work<syn>(syn) = fpr(out, syn, key)
  }

#implfun dependency20_d2parsed(dp, dpar, key) = let
    val parsed = d2parsed_get_parsed(dpar)
    val () = dependency20_d2eclistopt(dp, parsed, key)
  end

#implfun dependency20_d2eclistopt(out, dopt, key) =
  case+ dopt of
  | optn_nil() => ()
  | optn_cons(d2cs) => dependency20_d2eclist(out, d2cs, key)