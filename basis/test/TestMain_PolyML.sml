(**
 * entry point of the test suite of SML Basis library.
 * @author Takayuki Goto
 * @copyright 2020, Takayuki Goto.
 *)
structure TestMain_PolyML =
struct

  local
    open SMLUnit.Test
  in
  fun test () =
      let
        val tests =
            TestList
                (TestRequiredModules.tests () @ TestOptionalModules_PolyML.tests ())
      in SMLUnit.TextUITestRunner.runTest {output = TextIO.stdOut} tests
      end
  end

end
