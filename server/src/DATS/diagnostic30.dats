#include "srcgen2/HATS/xatsopt_sats.hats"
#include "srcgen2/HATS/xatsopt_dpre.hats"
#include "./../HATS/libxatsopt.hats"

#staload "./../SATS/lsp_bootstrap.sats"
#staload "./../SATS/diagnostic30.sats"

#staload "./../DATS/lsp_bootstrap.dats"

#implfun list_diagnostic30_fnp{syn:tx}(out, lst, fpr) =
  list_foritm<syn>(lst) 
  where {
    #impltmp foritm$work<syn>(syn) = fpr(out, syn)
  }

#implfun optn_diagnostic30_fnp{syn:tx}(out, opt, fpr) =
  optn_foritm<syn>(opt) 
  where {
    #impltmp foritm$work<syn>(syn) = fpr(out, syn)
  }

#implfun diagnostic30_d3parsed(out, dpar) = let
    val nerror = d3parsed_get_nerror(dpar)
  in
    if (nerror > 0) then let 
        val parsed = d3parsed_get_parsed(dpar)
      in diagnostic30_d3eclistopt(out, parsed) 
      end 
    else ()
  end

#implfun diagnostic30_d3explstopt(out, dopt) =
  case+ dopt of
  | optn_nil() => ()
  | optn_cons(d3es) => diagnostic30_d3explst(out, d3es)

#implfun diagnostic30_d3eclistopt(out, dopt) =
  case+ dopt of
  | optn_nil() => ()
  | optn_cons(d3cs) => diagnostic30_d3eclist(out, d3cs)