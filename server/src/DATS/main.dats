#include "prelude/HATS/prelude_dats.hats"
#include "prelude/HATS/prelude_JS_dats.hats"

#abstype diagnostic_severity <= p0tr
#extern fun diagnostic_severity$error() : diagnostic_severity = $extnam()
#extern fun diagnostic_severity$warn()  : diagnostic_severity = $extnam()
#extern fun diagnostic_severity$hint()  : diagnostic_severity = $extnam()
#extern fun diagnostic_severity$info()  : diagnostic_severity = $extnam()

#abstype position <= p0tr
#extern fun position$mk(
  line: int,
  offs: int
) : position = $extnam()

#abstype diagnostic <= p0tr
#extern fun diagnostic$mk(
  severity: diagnostic_severity,
  startpos: position,
  endpos: position,
  message: string,
  source: string
) : diagnostic = $extnam()

#extern fun bootstrap$validator(f: string -> a0rf(diagnostic)) : void = $extnam()
#extern fun bootstrap$connect() : void = $extnam()

fun ats_validator(uri: string) : a0rf(diagnostic) = 
  let val p1 = position$mk(0, 0)
      val p2 = position$mk(0, 1)
      val diagnostic = diagnostic$mk(
        diagnostic_severity$error(), p1, p2, "hello", uri
      )
  in a0rf_make_1val(diagnostic)
  end

val () = bootstrap$validator(ats_validator)
val () = bootstrap$connect()