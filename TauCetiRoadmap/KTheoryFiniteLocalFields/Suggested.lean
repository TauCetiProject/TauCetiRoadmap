import Mathlib

/-!
# K-theory of finite and local fields: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones; discharging
all of them finishes neither a layer nor the roadmap.

The stated results are Izhboldin's characteristic-`p` torsion theorem (§3.0), Moore's
intrinsic local K₂ structure theorem (§3.5), the Cohen–Witt coefficient embedding for
complete mixed-characteristic DVRs with arbitrary perfect residue field (§5.2), and
uncountability and higher unique divisibility of local Milnor groups (§6.10). The degreewise
Milnor groups are concrete integral tensor powers of additive field units modulo adjacent
Steinberg relations. In degree two this is the Matsumoto presentation, identified with
Quillen K₂ by the supplied comparison. The maximal divisible subgroup is defined on
Mathlib's additive subgroups.

The remaining headline statements require carriers absent from the pins. The completed KU
and finite-field refinements require KU spectra, Adams operations and the Brauer fibre;
henselian rigidity, higher local K-groups and their arithmetic completion maps require
higher algebraic K-theory and its coefficient and completion spectra. The normalized
norm-residue identification in Moore's theorem requires the full local norm-residue symbol.
Bloch–Gabber–Kato requires Cartier and logarithmic Witt differentials; motivic comparison
and étale descent require cycle complexes, Milnor products and norms, and twisted étale
cohomology. The logarithmic trace, Witt–Bott comparison
and nilpotent-thickening calculations require cyclotomic spectra and absolute logarithmic
de Rham–Witt complexes. The big Witt comparison `bigWittPowerSeriesComparison` (§5.16a)
requires the general coordinate big Witt group and identifies its addition with power-series
multiplication. The local homotopy splitting additionally requires height-one
localization and stable unitary spaces; the perfect-characteristic-two and dyadic comparisons
require Poincaré GW/L spectra and their homotopy fixed points. The finite-rank symplectic
Chern comparison requires the Lang classifying comparison and higher étale Chern maps.
These statements are deferred until their mathematical objects are available.
-/

namespace TauCetiRoadmap.KTheoryFiniteLocalFields

namespace Divisible

/-- The supremum of the divisible additive subgroups of an abelian group. -/
def maxDivisible (A : Type*) [AddCommGroup A] : AddSubgroup A :=
  sSup {D : AddSubgroup A | ∀ n : ℕ, n ≠ 0 → ∀ x : D, ∃ y : D, n • y = x}

end Divisible

/-- The Steinberg relations in an integral tensor power of additive field units. -/
def steinbergRelations (F : Type*) [Field F] (n : ℕ) :
    Submodule ℤ (PiTensorProduct ℤ (fun _ : Fin n => Additive Fˣ)) :=
  Submodule.span ℤ {x | ∃ a : Fin n → Fˣ,
    (∃ i j : Fin n, j.val = i.val + 1 ∧ (a i : F) + (a j : F) = 1) ∧
    x = PiTensorProduct.tprod ℤ (fun i => Additive.ofMul (a i))}

/-- Milnor Kₙ as the integral tensor power modulo adjacent Steinberg relations. -/
abbrev milnorK (F : Type*) [Field F] (n : ℕ) :=
  PiTensorProduct ℤ (fun _ : Fin n => Additive Fˣ) ⧸ steinbergRelations F n

/-- §3.0, Izhboldin's theorem: Milnor K-theory of a characteristic-`p` field has no
`p`-torsion, in every degree and without a perfectness hypothesis. -/
theorem milnor_no_p_torsion (F : Type*) [Field F] (p : ℕ) [Fact p.Prime]
    [CharP F p] (n : ℕ) :
    Function.Injective (nsmulAddMonoidHom (α := milnorK F n) p) := by
  sorry

/-- §3.5, Moore's theorem: the maximal divisible subgroup of local K₂ is uncountable and
uniquely divisible, with the torsion subgroup as its internal complement. That torsion is
isomorphic to the full group of roots of unity, including the wild roots. -/
theorem moore_localK2 (E : Type*) [Field E] [ValuativeRel E] [TopologicalSpace E]
    [IsNonarchimedeanLocalField E] :
    Uncountable (Divisible.maxDivisible (milnorK E 2)) ∧
    (∀ n : ℕ, n ≠ 0 → Function.Bijective
      (nsmulAddMonoidHom (α := Divisible.maxDivisible (milnorK E 2)) n)) ∧
    IsCompl (Divisible.maxDivisible (milnorK E 2)) (AddCommGroup.torsion (milnorK E 2)) ∧
    Nonempty (AddCommGroup.torsion (milnorK E 2) ≃+
      Additive (CommGroup.torsion Eˣ)) ∧
    Divisible.maxDivisible (milnorK E 2) =
      (nsmulAddMonoidHom (α := milnorK E 2) (Nat.card (CommGroup.torsion Eˣ))).range ∧
    Divisible.maxDivisible (milnorK E 2) =
      ⨅ n : {n : ℕ // 0 < n}, (nsmulAddMonoidHom (α := milnorK E 2) n.val).range := by
  sorry

/-- §5.2, Cohen–Witt: a complete mixed-characteristic DVR with perfect residue field
receives an injective Witt-vector coefficient map lifting the residue identity. -/
theorem exists_wittVector_coefficientEmbedding (p : ℕ) [Fact p.Prime]
    (A : Type*) [CommRing A] [IsDomain A] [IsDiscreteValuationRing A] [CharZero A]
    [IsAdicComplete (IsLocalRing.maximalIdeal A) A]
    [CharP (IsLocalRing.ResidueField A) p] [PerfectRing (IsLocalRing.ResidueField A) p] :
    ∃ f : WittVector p (IsLocalRing.ResidueField A) →+* A, Function.Injective f ∧
      (IsLocalRing.residue A).comp f = WittVector.constantCoeff := by
  sorry

/-- §6.10: every positive-degree algebraic Milnor group of a nonarchimedean local field
is uncountable, including in equal characteristic. -/
theorem localMilnor_uncountable (E : Type*) [Field E] [ValuativeRel E]
    [TopologicalSpace E] [IsNonarchimedeanLocalField E] (n : ℕ) (hn : 1 ≤ n) :
    Uncountable (milnorK E n) := by
  sorry

/-- §6.10: local Milnor groups are uniquely divisible in every degree at least three. -/
theorem localMilnor_uniqueDivisible (E : Type*) [Field E] [ValuativeRel E]
    [TopologicalSpace E] [IsNonarchimedeanLocalField E] (n : ℕ) (hn : 3 ≤ n) :
    ∀ m : ℕ, m ≠ 0 → Function.Bijective (nsmulAddMonoidHom (α := milnorK E n) m) := by
  sorry

end TauCetiRoadmap.KTheoryFiniteLocalFields
