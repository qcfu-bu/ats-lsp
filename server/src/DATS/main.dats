#include "./../HATS/libxatsopt.hats"
#include "prelude/HATS/prelude_dats.hats"
#include "prelude/HATS/prelude_JS_dats.hats"

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
#extern fun diagnostics_make() : diagnostics = $extnam() 
#extern fun diagnostics_push(
  ds: diagnostics, 
  d: diagnostic
) : void = $extnam() 
#symload push with diagnostics_push

#extern fun bootstrap_set_validator(f: url -> diagnostics) : void = $extnam()
#extern fun bootstrap_connect() : void = $extnam()

fun ats_validator(uri: url) : diagnostics = 
  let val path = url_to_path(uri)
      val dpar = d2parsed_of_fildats(path)
      val ds = diagnostics_make()
      val p1 = position_make(0, 0)
      val p2 = position_make(0, 1)
      val d = diagnostic_make(
        severity_error$make(), p1, p2, "hello", path
      )
      val () = ds.push(d)
   in ds
  end

val () = bootstrap_set_validator(ats_validator)
val () = bootstrap_connect()