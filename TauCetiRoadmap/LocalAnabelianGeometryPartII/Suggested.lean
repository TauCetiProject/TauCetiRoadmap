module

public import Mathlib
public import TauCeti.FieldTheory.Galois.AbsoluteGaloisGroup.ProP
public import TauCeti.NumberTheory.LocalField.FiniteExtension.IntermediateField
public import TauCeti.NumberTheory.LocalField.Herbrand.Basic
public import TauCeti.Topology.Algebra.Group.Profinite.ProP.CohomologicalDimension

/-!
# Local anabelian geometry, Part II: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
These statements suggest Lean forms for a few milestones; discharging them finishes neither a
layer nor the roadmap.

Stated here, against the pinned Mathlib and Tau Ceti:

* the absolute upper ramification filtration `G_K(v)` of a local field, a copy of
  ClassFieldTheory's one local definition `localAbsoluteUpperRamificationGroup` (the infimum over
  finite Galois subextensions of the preimages of Tau Ceti's `upperRamificationGroup`);
* **Theorem A** [Abrashkin 2010] (README 5.4 and 6.4): a filtered isomorphism of maximal pro-`p`
  quotients `Γ_K(p) ≃ₜ* Γ_{K'}(p)` is induced by conjugation with an isomorphism of algebraic
  closures carrying `K` onto `K'`, for every `p`, in both characteristics;
* **the absolute form** (README 6.5; [Abrashkin 2000, Thm. A′] for `p ≠ 2`): the same for
  `G_K ≃ₜ* G_{K'}`, for every `p`;
* the class-two Campbell–Hausdorff law `x ∘ y = x + y + ½⁅x, y⁆` (README 0.3), with its
  associativity proved as a check on the definition;
* `cd_p Γ_K(p) ≤ 1` for a field of characteristic `p` (README 1.1), from which Tau Ceti's pointed
  Serre theorem gives that `Γ_K(p)` is free pro-`p` on a basis converging to `1`.

Not stated here:

* the profinite Magnus algebra (README 0.1) and Lazard's isomorphism (0.2): the inverse limit
  over finite sets of variables and truncation degrees is data, specified in `README.md`. Its
  finite levels are GeometricTopology §4.12.1's truncated Magnus algebra;
* the class-two identification `F/C₃(F) ≅ G(L₂)` of README 0.3, which goes through
  `x_i ↦ exp(X_i)` in the profinite Magnus algebra;
* the ramification ideals and Theorems B and B′ of [Abrashkin 2010] (Layer 2), the systems of
  Layers 3–4 and the Main Lemma (Layer 8): they live in the profinite Magnus algebra or in
  quotients of it;
* the liftings `O_M(L)` and the Magnus embedding `ψ_f` (README 1.2–1.6), which need the
  profinite Magnus algebra over `O(K(p))`;
* the field of norms (Layer 6), which FieldOfNorms owns and which has no
  declaration at the pins;
* Deligne's triples, the categories `(ext F)^e` and `(ext Tr_e F)^e` and the equivalence of
  [Deligne 1984, Thm. 2.8] (README Layer 10), and Theorem B of [Abrashkin 2000] (Layer 11): their
  morphisms are classes of morphisms and the filtrations are quotient filtrations, specified in
  `README.md`.

Suggested home: `TauCeti/NumberTheory/LocalField/Anabelian/Abrashkin/`, with Layer 0 in
`TauCeti/Topology/Algebra/Group/Profinite/Free/Magnus/` and Layer 10 in
`TauCeti/NumberTheory/LocalField/Deligne/`.
-/

@[expose] public section

namespace TauCetiRoadmap.LocalAnabelianGeometryPartII

open TauCeti
open scoped ValuativeRel

/-! ## Conventions: the absolute upper filtration -/

section Filtration

/-- **The absolute upper ramification group** `G_K(v)` of a local field, in Serre's numbering:
an absolute Galois automorphism lies in it when its restriction to every finite Galois
subextension lies in that subextension's upper group [Serre, *Local Fields*, IV §3,
Proposition 14]. A copy of ClassFieldTheory's `localAbsoluteUpperRamificationGroup`; the
README's `F_K` of FilteredLocalGaloisGroups 2.1 is this filtration. -/
noncomputable def localAbsoluteUpperRamificationGroup
    (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (v : LocalFieldsRamification.RamificationIndexDomain) :
    Subgroup (Field.absoluteGaloisGroup K) :=
  ⨅ M : FiniteGaloisIntermediateField K (AlgebraicClosure K),
    letI := finiteIntermediateFieldValuativeRel K (AlgebraicClosure K) M.toIntermediateField
    letI := finiteIntermediateFieldTopology K (AlgebraicClosure K) M.toIntermediateField
    letI := finiteIntermediateField_isNonarchimedeanLocalField K (AlgebraicClosure K)
      M.toIntermediateField
    letI := finiteIntermediateField_valuativeExtension K (AlgebraicClosure K) M.toIntermediateField
    (LocalFieldsRamification.upperRamificationGroup K M v).comap (AlgEquiv.restrictNormalHom M)

end Filtration

/-! ## Layers 5 and 6: Theorem A and its absolute form -/

section TheoremA

variable (p : ℕ) [Fact p.Prime]
  (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
  [CharP 𝓀[K] p]
  (K' : Type) [Field K'] [ValuativeRel K'] [TopologicalSpace K'] [IsNonarchimedeanLocalField K']
  [CharP 𝓀[K'] p]

/-- **Theorem A** [Abrashkin 2010, Thm. A] (README 5.4, 6.4). For every prime `p`, `p = 2`
included, and local fields `K`, `K'` of residue characteristic `p` in either characteristic,
every isomorphism `g : Γ_K(p) ≃ₜ* Γ_{K'}(p)` carrying the image of `G_K(v)` onto that of
`G_{K'}(v)` for every `v ≥ 0` is induced by conjugation with a ring isomorphism
`e : K̄ ≃ K̄'` that restricts to a continuous isomorphism `K ≃ K'`. The README's `μ : K(p) ≃ K'(p)`
is the restriction of `e`; it is unique (README 5.5), while `e` is not. -/
theorem exists_ringEquiv_conj_of_filtered_absoluteGaloisGroupProP
    (g : absoluteGaloisGroupProP p K ≃ₜ* absoluteGaloisGroupProP p K')
    (hg : ∀ v : LocalFieldsRamification.RamificationIndexDomain, 0 ≤ (v : ℝ) →
      ((localAbsoluteUpperRamificationGroup K v).map
          (absoluteGaloisGroupProPQuotientMap p K).toMonoidHom).map g.toMulEquiv.toMonoidHom =
        (localAbsoluteUpperRamificationGroup K' v).map
          (absoluteGaloisGroupProPQuotientMap p K').toMonoidHom) :
    ∃ (e : AlgebraicClosure K ≃+* AlgebraicClosure K') (e₀ : K ≃+* K'),
      Continuous e₀ ∧
      (∀ x : K, e (algebraMap K (AlgebraicClosure K) x) =
        algebraMap K' (AlgebraicClosure K') (e₀ x)) ∧
      ∀ τ : Field.absoluteGaloisGroup K, ∃ τ' : Field.absoluteGaloisGroup K',
        (∀ y, (show AlgebraicClosure K' ≃ₐ[K'] AlgebraicClosure K' from τ') y =
          e ((show AlgebraicClosure K ≃ₐ[K] AlgebraicClosure K from τ) (e.symm y))) ∧
        g (absoluteGaloisGroupProPQuotientMap p K τ) = absoluteGaloisGroupProPQuotientMap p K' τ' :=
  sorry

/-- **The absolute form of Theorem A** (README 6.5, 9.2). For every prime `p`, `p = 2` included,
and local fields `K`, `K'` of residue characteristic `p`, every isomorphism
`G : G_K ≃ₜ* G_{K'}` carrying `G_K(v)` onto `G_{K'}(v)` for every `v ≥ 0` is `τ ↦ e ∘ τ ∘ e⁻¹`
for a ring isomorphism `e : K̄ ≃ K̄'` that restricts to a continuous isomorphism `K ≃ K'`.
[Abrashkin 2000, Thm. A′, p. 139] proves it for `p ≠ 2`; the README deduces it from Theorem A
and the uniqueness of README 5.5. The signature carries no hypothesis on the residue
characteristics: a filtered isomorphism forces them to be equal, since for `v > 0` the group
`G_K(v)` is a nontrivial closed subgroup of wild inertia, hence a nontrivial pro-`p` group, so the
wider statement adds only vacuous cases. -/
theorem exists_ringEquiv_conj_of_filtered_absoluteGaloisGroup
    (G : Field.absoluteGaloisGroup K ≃ₜ* Field.absoluteGaloisGroup K')
    (hG : ∀ v : LocalFieldsRamification.RamificationIndexDomain, 0 ≤ (v : ℝ) →
      (localAbsoluteUpperRamificationGroup K v).map G.toMulEquiv.toMonoidHom =
        localAbsoluteUpperRamificationGroup K' v) :
    ∃ (e : AlgebraicClosure K ≃+* AlgebraicClosure K') (e₀ : K ≃+* K'),
      Continuous e₀ ∧
      (∀ x : K, e (algebraMap K (AlgebraicClosure K) x) =
        algebraMap K' (AlgebraicClosure K') (e₀ x)) ∧
      ∀ (τ : Field.absoluteGaloisGroup K) (y : AlgebraicClosure K'),
        (show AlgebraicClosure K' ≃ₐ[K'] AlgebraicClosure K' from G τ) y =
          e ((show AlgebraicClosure K ≃ₐ[K] AlgebraicClosure K from τ) (e.symm y)) :=
  sorry

end TheoremA

/-! ## Layer 0.3: the class-two group law -/

section ClassTwo

variable (R : Type*) [CommRing R] [Invertible (2 : R)] {L : Type*} [LieRing L] [LieAlgebra R L]

/-- The **class-two Campbell–Hausdorff product** `x ∘ y = x + y + ½⁅x, y⁆`. On a Lie algebra of
nilpotency class two over a ring in which `2` is invertible it is a group law with identity `0`
and inverse `x ↦ -x`, the group `G(L)` of [Abrashkin 2000, §3.1] in class two. -/
def classTwoMul (x y : L) : L := x + y + (⅟2 : R) • ⁅x, y⁆

/-- `classTwoMul` is **associative** when `L` has nilpotency class two. This is a check on the
definition, proved here, not a milestone; the content of README 0.3 is the identification
`F/C₃(F) ≅ G(L₂)`, which is not stated in this file. -/
theorem classTwoMul_assoc (hL : ∀ x y z : L, ⁅x, ⁅y, z⁆⁆ = 0) (x y z : L) :
    classTwoMul R x (classTwoMul R y z) = classTwoMul R (classTwoMul R x y) z := by
  simp [classTwoMul, hL, add_assoc, add_comm, add_left_comm]

end ClassTwo

/-! ## Layer 1.1: Witt's theorem in characteristic `p` -/

section Witt

/-- **Witt's theorem** [Serre, *Galois Cohomology*, II §2.2]: for a field `K` of characteristic
`p`, the maximal pro-`p` quotient `Γ_K(p)` of `G_K` has `p`-cohomological dimension at most `1`.
With Tau Ceti's pointed Serre theorem
`IsProP.exists_convergesToOne_continuousMulEquiv_presentation_of_cohomologicalDimensionAt_le_one`
this makes `Γ_K(p)` free pro-`p` on a basis converging to `1` [Abrashkin 2010, proof of
Prop. 1.2]. -/
theorem cohomologicalDimensionAt_absoluteGaloisGroupProP_le_one_of_charP (p : ℕ) [Fact p.Prime]
    (K : Type) [Field K] [CharP K p] :
    cohomologicalDimensionAt.{0} p (absoluteGaloisGroupProP p K) ≤ 1 :=
  sorry

end Witt

end TauCetiRoadmap.LocalAnabelianGeometryPartII
