#include "srcgen2/HATS/xatsopt_sats.hats"
#include "srcgen2/HATS/xatsopt_dpre.hats"
#include "./../HATS/libxatsopt.hats"

#staload "./../SATS/lsp_bootstrap.sats"
#staload "./../SATS/diagnostic20.sats"

#implfun list_diagnostic20_fnp{syn:tx}(out, lst, fpr) =
  list_foritm<syn>(lst) 
  where {
    #impltmp foritm$work<syn>(syn) = fpr(out, syn)
  }

#implfun optn_diagnostic20_fnp{syn:tx}(out, opt, fpr) =
  optn_foritm<syn>(opt) 
  where {
    #impltmp foritm$work<syn>(syn) = fpr(out, syn)
  }

#implfun diagnostic20_d2parsed(out, dpar) = let
    val nerror = d2parsed_get_nerror(dpar)
  in
    if (nerror > 0) then let
        val parsed = d2parsed_get_parsed(dpar)
      in diagnostic20_d2eclistopt(out, parsed) 
      end 
    else ()
  end

#implfun diagnostic20_d2explstopt(out, dopt) =
  case+ dopt of
  | optn_nil() => ()
  | optn_cons(d2es) => diagnostic20_d2explst(out, d2es)

#implfun diagnostic20_d2eclistopt(out, dopt) =
  case+ dopt of
  | optn_nil() => ((*void*))
  | optn_cons(d2cs) => diagnostic20_d2eclist(out, d2cs)