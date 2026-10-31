import TauCeti.KnotTheory.BraidWord.PDCode
import Mathlib.Tactic

/-!
**This file is not the roadmap and is not exhaustive.**
The README is definitive. These are native braid and signed-DT finite inputs;
the source-convention adapter, planar realizations and isotopy certificates
are separate geometric targets. No table name is a knot-equivalence proof.
-/

namespace TauCetiRoadmap.GeometricTopology.Nonadditivity

open TauCeti

/-- Literal signed subscripts converted to zero-based native generator indices.
The comparison with the paper's drawing is a geometric README target. -/
def source : BraidWord 5 :=
  [(0,1),(3,-1),(1,1),(2,1),(2,1),(2,1),(1,1),(2,1),(1,1),(1,1),
   (3,1),(2,-1),(2,-1),(2,-1),(2,-1),(0,-1),(2,-1),(1,-1),(2,-1),(2,-1)]

def changed : BraidWord 5 :=
  [(0,-1),(3,1),(1,1),(2,1),(2,1),(2,1),(1,1),(2,1),(1,1),(1,1),
   (3,1),(2,-1),(2,-1),(2,-1),(2,-1),(0,-1),(2,-1),(1,-1),(2,-1),(2,-1)]

/-- A crossing sign switch at a specified word position, retaining its generator. -/
def switch (w : BraidWord 5) (j : ℕ) : BraidWord 5 :=
  w.modify j fun x => (x.1, -x.2)

theorem two_switches : switch (switch source 0) 1 = changed := by decide +kernel

def sourceClosure : OrientedPDCode 20 := source.closure

theorem exponent_sums :
    (source.map fun x => (x.2 : ℤ)).sum = 0 ∧
    (changed.map fun x => (x.2 : ℤ)).sum = 0 := by decide +kernel

/-- Compute the actual native permutation, rather than treating all five-strand
closures as knots. Its geometric component comparison is owned in Layer4.2. -/
theorem source_permutation :
    ∀ i : Fin 5, BraidGroup.permHom 5 source.toBraid i = (![4,3,1,0,2] : Fin 5 → Fin 5) i := by
  simp only [source, BraidWord.toBraid, List.map_cons, List.map_nil, List.prod_cons,
    List.prod_nil, map_mul, map_zpow, BraidGroup.permHom_sigma]
  decide +kernel

theorem changed_permutation :
    ∀ i : Fin 5, BraidGroup.permHom 5 changed.toBraid i = (![4,3,1,0,2] : Fin 5 → Fin 5) i := by
  simp only [changed, BraidWord.toBraid, List.map_cons, List.map_nil, List.prod_cons,
    List.prod_nil, map_mul, map_zpow, BraidGroup.permHom_sigma]
  decide +kernel

/-- The displayed permutation is a single five-cycle. -/
theorem permutation_orbit :
    List.ofFn (fun k : Fin 5 =>
      ((![4,3,1,0,2] : Fin 5 → Fin 5)^[k.val]) 0) = [0,4,2,1,3] := by
  decide +kernel

/-- Negate one signed-even DT entry; its sign is not an oriented crossing sign. -/
def dtSwitch (d : List ℤ) (j : ℕ) : List ℤ := d.modify j Neg.neg

def dA : List ℤ := [4,-16,24,26,18,20,28,22,-2,10,12,30,6,8,14]
def dBa : List ℤ := [-4,-16,24,26,18,20,28,22,-2,10,12,30,6,8,14]
def dBb : List ℤ := [4,12,-24,14,18,2,20,26,8,10,-28,-30,16,-6,-22]
def dC : List ℤ := [4,12,-24,14,18,2,-20,26,8,10,-28,-30,16,-6,-22]
def dU : List ℤ := [4,12,-24,14,18,2,-20,26,8,10,-28,-30,16,6,-22]

theorem dt_switch_chain :
    dtSwitch dA 0 = dBa ∧ dtSwitch dBb 6 = dC ∧ dtSwitch dC 13 = dU := by
  decide +kernel

/-- All five DT words use every even encounter exactly once. This does not
supply their missing signed planar completions or identify their realizations. -/
theorem dt_even_encounters :
    ∀ d ∈ [dA,dBa,dBb,dC,dU],
      (d.map Int.natAbs).Perm ((List.range 15).map fun i => 2 * (i + 1)) := by
  decide +kernel

def dTen : List ℤ := [12,14,-10,-20,-16,18,2,-8,4,-6]
def dTenChanged : List ℤ := [12,14,-10,-20,16,18,2,-8,4,-6]

theorem ten_switch : dtSwitch dTen 4 = dTenChanged := by decide +kernel

end TauCetiRoadmap.GeometricTopology.Nonadditivity
