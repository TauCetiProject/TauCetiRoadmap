module

public import Mathlib
public import TauCeti.FieldTheory.Galois.AbsoluteGaloisGroup.ProP
public import TauCeti.Topology.Algebra.Group.Profinite.ProP.CohomologicalDimension

/-!
# Local anabelian geometry, Part II: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
These statements suggest Lean forms for a few milestones; discharging them finishes neither a
layer nor the roadmap.

Stated here, against the pinned Mathlib and Tau Ceti:

* the index set `ℤ(p)` of Abrashkin's generators (conventions);
* the truncated Magnus algebra `R⟨X⟩ / 𝒥ⁿ`, the finite level of the profinite Magnus algebra
  of README 0.1;
* the class-two Campbell–Hausdorff law `x ∘ y = x + y + ½⁅x, y⁆` and its associativity on a
  Lie algebra of nilpotency class two (README 0.3);
* `cd_p Γ_K(p) ≤ 1` for a field of characteristic `p` (README 1.1), from which Tau Ceti's pointed
  Serre theorem gives that `Γ_K(p)` is free pro-`p` on a basis converging to `1`;
* the ring and module of Deligne's truncated triple `Tr_e(F)` (README 10.1).

Not stated here:

* the profinite Magnus algebra itself (README 0.1) and Lazard's isomorphism (0.2): the inverse
  limit over finite sets of variables and truncation degrees is data, specified in `README.md`;
* every statement involving the upper filtration of `Γ_K(p)` or `G_K` (Layers 2–9, 11): the
  absolute upper filtration of ClassFieldTheory Layer 7 and the filtered groups of
  FilteredLocalGaloisGroups have no declaration at the pins;
* the liftings `O_M(L)` and the Magnus embedding `ψ_f` (README 1.2–1.6), which need the
  profinite Magnus algebra over `O(K(p))`;
* the field of norms (Layer 6 and README 9.2), which FieldOfNorms owns and which has no
  declaration at the pins;
* Deligne's categories `(ext F)^e` and `(ext Tr_e F)^e` and the equivalence `T` (README
  10.2–10.4): their morphisms are classes of morphisms, specified in `README.md`.

Suggested home: `TauCeti/NumberTheory/LocalField/Anabelian/Abrashkin/`, with Layer 0 in
`TauCeti/Topology/Algebra/Group/Profinite/Free/Magnus/` and Layer 10 in
`TauCeti/NumberTheory/LocalField/Deligne/`.
-/

@[expose] public section

namespace TauCetiRoadmap.LocalAnabelianGeometryPartII

/-! ## Conventions: the index set `ℤ(p)` -/

/-- `ℤ(p)`, the positive integers prime to `p`: the indices `a` of Abrashkin's generators
`D_{an}` [Abrashkin 2010, §1.2; Abrashkin 2000, §2.1]. -/
def primeToP (p : ℕ) : Set ℕ := {a | 0 < a ∧ p.Coprime a}

/-! ## Layer 0.1: the truncated Magnus algebra -/

section Magnus

variable (R : Type*) [CommRing R] (X : Type*)

/-- The relation killing every word of length `n` in the free associative algebra `R⟨X⟩`. -/
def truncRel (n : ℕ) : FreeAlgebra R X → FreeAlgebra R X → Prop :=
  fun a b => (∃ w : List X, w.length = n ∧ a = (w.map (FreeAlgebra.ι R)).prod) ∧ b = 0

/-- The **truncated Magnus algebra** `R⟨X⟩ / 𝒥ⁿ`: noncommuting variables `X`, words of length
`≥ n` killed. For finite `X` and `R = W_M(k)` it is Abrashkin's level `𝒜_{CMk} mod 𝒥ⁿ`
[Abrashkin 2010, §1.2]; the profinite Magnus algebra of README 0.1 is the inverse limit over
finite subsets of variables, `n` and, for `R = W(k)`, `p`-adic truncations. -/
abbrev TruncatedMagnus (n : ℕ) : Type _ :=
  RingQuot (truncRel R X n)

end Magnus

/-! ## Layer 0.3: the class-two group law -/

section ClassTwo

variable (R : Type*) [CommRing R] [Invertible (2 : R)] {L : Type*} [LieRing L] [LieAlgebra R L]

/-- The **class-two Campbell–Hausdorff product** `x ∘ y = x + y + ½⁅x, y⁆`. On a Lie algebra of
nilpotency class two over a ring in which `2` is invertible it is a group law with identity `0`
and inverse `x ↦ -x`, the group `G(L)` of [Abrashkin 2000, §3.1] in class two. -/
def classTwoMul (x y : L) : L := x + y + (⅟2 : R) • ⁅x, y⁆

/-- The product `classTwoMul` is **associative** when `L` has nilpotency class two. -/
theorem classTwoMul_assoc (hL : ∀ x y z : L, ⁅x, ⁅y, z⁆⁆ = 0) (x y z : L) :
    classTwoMul R x (classTwoMul R y z) = classTwoMul R (classTwoMul R x y) z :=
  sorry

end ClassTwo

/-! ## Layer 1.1: Witt's theorem in characteristic `p` -/

section Witt

open TauCeti

/-- **Witt's theorem** [Serre, *Galois Cohomology*, II §2.2]: for a field `K` of characteristic
`p`, the maximal pro-`p` quotient `Γ_K(p)` of `G_K` has `p`-cohomological dimension at most `1`.
With Tau Ceti's pointed Serre theorem
`exists_convergesToOne_continuousMulEquiv_presentation_of_cohomologicalDimensionAt_le_one` this
makes `Γ_K(p)` free pro-`p` on a basis converging to `1` [Abrashkin 2010, proof of Prop. 1.2]. -/
theorem cohomologicalDimensionAt_absoluteGaloisGroupProP_le_one_of_charP (p : ℕ) [Fact p.Prime]
    (K : Type) [Field K] [CharP K p] :
    cohomologicalDimensionAt.{0} p (absoluteGaloisGroupProP p K) ≤ 1 :=
  sorry

end Witt

/-! ## Layer 10.1: Deligne's truncated triple -/

section Deligne

open ValuativeRel IsLocalRing

variable (F : Type*) [Field F] [ValuativeRel F] [TopologicalSpace F]
  [IsNonarchimedeanLocalField F]

/-- The ring of **Deligne's triple** `Tr_e(F) = (𝒪_F/𝔪^e, 𝔪/𝔪^{e+1}, ε)`: the truncated
valuation ring `𝒪_F/𝔪^e`, of length `e` [Deligne 1984, 1.2]. -/
abbrev deligneRing (e : ℕ) : Type _ := 𝒪[F] ⧸ 𝓂[F] ^ e

/-- The module of **Deligne's triple** `Tr_e(F)`: `𝔪/𝔪^{e+1}`, free of rank one over
`deligneRing F e`, with `ε : 𝔪/𝔪^{e+1} → 𝔪/𝔪^e` the projection onto the maximal ideal of
`deligneRing F e` [Deligne 1984, 1.2]. -/
abbrev deligneModule (e : ℕ) : Type _ :=
  ↥𝓂[F] ⧸ Submodule.comap (Submodule.subtype 𝓂[F]) (𝓂[F] ^ (e + 1) : Ideal 𝒪[F])

end Deligne

end TauCetiRoadmap.LocalAnabelianGeometryPartII
