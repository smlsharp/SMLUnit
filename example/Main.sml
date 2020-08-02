
structure Main =
struct
  (*
      Sample session:
        - TextUITestRunner.runTest () (TestDictionary.suite ());
        ....F
        tests = 5, failures = 1, errors = 0
        val it = () : unit
  *)
  fun main (_: string, _: string list) =
    (
      SMLUnit.TextUITestRunner.runTest
              {output = TextIO.stdOut}
              (TestDictionary.suite ());
      OS.Process.success
    )

  fun main' () =
    main (CommandLine.name(), CommandLine.arguments())
end

