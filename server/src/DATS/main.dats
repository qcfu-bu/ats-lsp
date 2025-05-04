#include "srcgen2/HATS/xatsopt_sats.hats"
#include "srcgen2/HATS/xatsopt_dpre.hats"
#include "./../HATS/libxatsopt.hats"

#abstype url <= p0tr
#extern fun url_to_path(uri: url) : string = $extnam()

#abstype severity <= p0tr
#extern fun severity_error$make() : severity = $extnam()
#extern fun severity_warn$make()  : severity = $extnam()
#extern fun severity_hint$make()  : severity = $extnam()
#extern fun severity_info$make()  : severity = $extnam()

#abstype position <= p0tr
#extern fun position_make(
  line: int,
  offs: int
) : position = $extnam()

#abstype diagnostic <= p0tr
#extern fun diagnostic_make(
  severity: severity,
  startpos: position,
  endpos: position,
  message: string,
  source: string
) : diagnostic = $extnam()

#abstype diagnostics <= p0tr
#extern fun diagnostics_push(
  ds: diagnostics, 
  d: diagnostic
) : void = $extnam() 
#symload push with diagnostics_push

#extern fun bootstrap_set_validator(f: (diagnostics, url) -> void) : void = $extnam()
#extern fun bootstrap_connect() : void = $extnam()

fun loctn_to_diagnostic(lvl: sint, loc0: loctn, msg: string) : diagnostic =
  let
    val lsrc0 = loc0.lsrc()
    val pbeg0 = loc0.pbeg()
    val pend0 = loc0.pend()
    val pbeg1 = position_make(pbeg0.nrow(), pbeg0.ncol()) 
    val pend1 = position_make(pend0.nrow(), pend0.ncol()) 
    val lsrc1 = 
      case lsrc0 of
      | LCSRCnone0() => "none"
      | LCSRCsome1(str) => str
      | LCSRCfpath(path) => path.fnm1()
  in
    diagnostic_make(
      severity_error$make(), 
      pbeg1, pend1, msg, lsrc1 
    )
  end

fun diagnostics_d3ecl(ds: diagnostics, dcl: d3ecl) : void =
  case+ dcl.node() of
  | D3Cerrck(lvl, d3cl) =>
    // auxmain(ds, dcl);
    if (lvl > 2) then () else let 
      val loc0 = dcl.lctn()
      val d = loctn_to_diagnostic(lvl, loc0, "hello")
    in ds.push(d)
    end
  | _ => ()

fun list_diagnostics{syn:tbox}(
  ds: diagnostics, ls: list(syn), 
  f: (diagnostics, syn) -> void
) : void = list_foritm<syn>(ls)
  where {
    #impltmp
    foritm$work<syn>(syn) = f(ds, syn)
  }

fun d3eclist_diagnostics(ds: diagnostics, dcls: d3eclist) : void =
  list_diagnostics(ds, dcls, diagnostics_d3ecl)

fun d3eclistopt_diagnostics(ds: diagnostics, dopt: d3eclistopt) : void = 
  case+ dopt of
  | optn_nil() => ()
  | optn_cons(d3cs) => d3eclist_diagnostics(ds: diagnostics, d3cs)

fun d3parsed_diagnostics(ds: diagnostics, dpar: d3parsed) : void = 
  let val nerror = dpar.nerror() in
    if (nerror > 0) then 
      let val parsed = d3parsed_get_parsed(dpar) 
      in d3eclistopt_diagnostics(ds, parsed)
      end
    else ()
  end

fun ats_validator(ds: diagnostics, uri: url) : void = 
  let 
    val path = url_to_path(uri)
    val dpar = d3parsed_of_fildats(path)
  in d3parsed_diagnostics(ds, dpar)
  end

// initialize the xatsopt environment
val _ = the_fxtyenv_pvsload()
val _ = the_tr12env_pvsl00d()
val () = xatsopt_flag$pvsadd0("--_XATSOPT_")
val () = xatsopt_flag$pvsadd0("--_SRCGEN2_XATSOPT_")

// boostrap the lsp server
val () = bootstrap_set_validator(ats_validator)
val () = bootstrap_connect()