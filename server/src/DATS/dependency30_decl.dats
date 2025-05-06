#include "srcgen2/HATS/xatsopt_sats.hats"
#include "srcgen2/HATS/xatsopt_dpre.hats"
#include "./../HATS/libxatsopt.hats"

#staload "./../SATS/lsp_bootstrap.sats"
#staload "./../SATS/dependency20.sats"
#staload "./../SATS/dependency30.sats"


#implfun dependency30_d3ecl(dp, d3cl, key0) =
  case+ d3cl.node() of
  | D3Clocal0(dcls1, dcls2) => let
      val () = dependency30_d3eclist(dp, dcls1, key0)
      val () = dependency30_d3eclist(dp, dcls2, key0)
    end
  | D3Cinclude(_, _, _, _, dopt) => (
    case+ dopt of
    | optn_nil() => ()
    | optn_cons(dcls) => dependency30_d3eclist(dp, dcls, key0))
  | D3Cstaload(stadyn, tok, src, fopt, s3opt) => (
    case+ fopt of
    | optn_cons(fpath) => let
        val key1 = fpath.fnm2()
        val () =
          if depgraph_has(dp, key1) then ()
          else dependency30_s3taloadopt(dp, s3opt, key1)
        val () = depgraph_add(dp, key1, key0)
      end
    | optn_nil() => ())
  | _ => ()

#implfun dependency30_s3taloadopt(dp, s3opt, key0) =
  case+ s3opt of
  | S3TALOADdpar(stadyn, dpar) => let
    val () = dependency30_d3parsed(dp, dpar, key0)
    end
  | S3TALOADnone(s2opt) => dependency20_s2taloadopt(dp, s2opt, key0)

#implfun dependency30_d3eclist(dp, dcls, key0) =
  list_dependency30_fnp(dp, dcls, key0, dependency30_d3ecl)