#include "srcgen2/HATS/xatsopt_sats.hats"
#include "srcgen2/HATS/xatsopt_dpre.hats"
#include "./../HATS/libxatsopt.hats"

#staload "./../SATS/lsp_bootstrap.sats"
#staload "./../SATS/dependency30.sats"

#implfun list_dependency30_fnp{syn:tx}(out, lst, key, fpr) =
  list_foritm<syn>(lst) 
  where {
    #impltmp foritm$work<syn>(syn) = fpr(out, syn, key)
  }

#implfun optn_dependency30_fnp{syn:tx}(out, opt, key, fpr) =
  optn_foritm<syn>(opt) 
  where {
    #impltmp foritm$work<syn>(syn) = fpr(out, syn, key)
  }

#implfun dependency30_d3parsed(dp, dpar, key) = let
    val parsed = d3parsed_get_parsed(dpar)
    val () = dependency30_d3eclistopt(dp, parsed, key)
  end

#implfun dependency30_d3eclistopt(out, dopt, key) =
  case+ dopt of
  | optn_nil() => ()
  | optn_cons(d3cs) => dependency30_d3eclist(out, d3cs, key)