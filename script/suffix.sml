
local
  structure Sys = SMLofNJ.SysInfo
in
fun cmLibDirName () = let
  val arch = String.map Char.toLower (Sys.getArchName())
  val opsys =
    case Sys.getOSKind()
      of Sys.UNIX => "unix"
       | Sys.WIN32 => "win32"
in
  arch ^ "-" ^ opsys
end
val () = TextIO.output(TextIO.stdErr, cmLibDirName())
end (* local *)
