#include "srcgen2/HATS/xatsopt_sats.hats"
#include "srcgen2/HATS/xatsopt_dpre.hats"
#include "./../HATS/libxatsopt.hats"

#staload "./../SATS/lsp_bootstrap.sats"
#staload "./../SATS/server.sats"
#staload "./../DATS/lsp_bootstrap.dats"

#implfun range_of_loctn(loc0) =
  let
    val lsrc0 = loc0.lsrc()
    val pbeg0 = loc0.pbeg()
    val pend0 = loc0.pend()
    val pbeg1 = position_make(pbeg0.nrow(), pbeg0.ncol()) 
    val pend1 = position_make(pend0.nrow(), pend0.ncol()) 
  in range_make(pbeg1, pend1)
  end

// TODO:
#implfun diagnostics_of_d3exp(ds, dexp) = ()
#implfun diagnostics_of_f3arglst(ds, args) = ()
#implfun diagnostics_of_d3valdclist(ds, d3vs) = ()
#implfun diagnostics_of_d3vardclist(ds, d3vs) = ()
#implfun diagnostics_of_d3fundclist(ds, d3fs) = ()

local
    fun auxmain(ds: diagnostics, dcl0: d3ecl) : void =
      case+ dcl0.node() of
      | D3Cstatic(tknd, dcl1) => 
        diagnostics_of_d3ecl(ds, dcl1)
      | D3Cextern(tknd, dcl1) => 
        diagnostics_of_d3ecl(ds, dcl1)
      | D3Cdclst0(dcls) => 
        diagnostics_of_d3eclist(ds, dcls)
      | D3Clocal0(dcs1, dcs2) => let 
          val () = diagnostics_of_d3eclist(ds, dcs1)
          val () = diagnostics_of_d3eclist(ds, dcs2)
        endlet
      | D3Cinclude(knd0, tknd, gsrc, fopt, dopt) =>
        diagnostics_of_d3eclistopt(ds, dopt)
      | D3Cstaload(knd0, tknd, gsrc, fopt, dopt) => 
        // TODO: implement traversal for statics
        // diagnostics_of_d3eclistopt(ds, dopt)
        ()
      | D3Cvaldclst(tknd, d3vs) => 
        diagnostics_of_d3valdclist(ds, d3vs)
      | D3Cvardclst(tknd, d3vs) =>
        diagnostics_of_d3vardclist(ds, d3vs)
      | D3Cfundclst(tknd, tqas, d2cs, d3fs) => 
        diagnostics_of_d3fundclist(ds, d3fs)
      | D3Cimplmnt0(tknd, stmp, sqas, tqas, dimp, tias, f3as, sres, dexp) => let 
          val () = diagnostics_of_f3arglst(ds, f3as)
          val () = diagnostics_of_d3exp(ds, dexp)
        endlet
      | D3Cnone0 _ => ()
      | D3Cnone1(d2cl) => 
        // TODO: implement traverse for d2ecl
        () 
      | D3Cnone2(d3cl) => 
        diagnostics_of_d3ecl(ds, d3cl)
      | D3Cerrck(lvl1, dcl1) => 
        diagnostics_of_d3ecl(ds, dcl0)
      | _ =>
        let 
          val loc0 = dcl0.lctn()
          val lsrc = 
            case loc0.lsrc() of
            | LCSRCnone0() => "none"
            | LCSRCsome1(str) => str
            | LCSRCfpath(path) => path.fnm1()
          val d = diagnostic_make(
            severity_error$make(), 
            range_of_loctn(loc0), 
            "hello", lsrc
          )
        in ds.push(d)
        end
in
#implfun diagnostics_of_d3ecl(ds, dcl) =
  case+ dcl.node() of
  | D3Cerrck(lvl, d3cl) =>
    let val () = auxmain(ds, d3cl) in
    if (lvl > 2) then () else let 
      val loc0 = dcl.lctn()
      val lsrc = 
        case loc0.lsrc() of
        | LCSRCnone0() => "none"
        | LCSRCsome1(str) => str
        | LCSRCfpath(path) => path.fnm1()
      val d = diagnostic_make(
        severity_error$make(), 
        range_of_loctn(loc0), 
        "hello", lsrc
      )
    in ds.push(d)
    end
    end
  | _ => ()
end

#implfun diagnostics_of_d3eclist(ds, dcls) = 
  list_foritm<d3ecl>(dcls)
  where {
    #impltmp
    foritm$work<d3ecl>(dcl) = diagnostics_of_d3ecl(ds, dcl)
  }

#implfun diagnostics_of_d3eclistopt(ds, dopt) = 
  case+ dopt of
  | optn_nil() => ()
  | optn_cons(d3cs) => diagnostics_of_d3eclist(ds, d3cs)

#implfun diagnostics_of_d3parsed(ds, dpar) = 
  let val nerror = dpar.nerror() in
    if (nerror > 0) then 
      let val parsed = d3parsed_get_parsed(dpar) 
      in diagnostics_of_d3eclistopt(ds, parsed)
      end
    else ()
  end

#implfun validator(ds, uri) = 
  let 
    val path = url_to_path(uri)
    val dpar = d3parsed_of_fildats(path)
    // debug logging
    val () = prerrln(path)
    val () = prerrln(dpar)
    val () = fperr30_d3parsed(g_stderr(), dpar)
  in diagnostics_of_d3parsed(ds, dpar)
  end

// initialize the xatsopt environment
val _ = the_fxtyenv_pvsload()
val _ = the_tr12env_pvsl00d()
val () = xatsopt_flag$pvsadd0("--_XATSOPT_")
val () = xatsopt_flag$pvsadd0("--_SRCGEN2_XATSOPT_")

// boostrap the lsp server
val () = set_validator(validator)
val () = connect()