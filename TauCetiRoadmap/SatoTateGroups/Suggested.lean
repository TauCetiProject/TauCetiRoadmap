module

import Mathlib
import TauCeti.RepresentationTheory.Compact.Haar
import TauCeti.Topology.Algebra.UnitaryGroup
import TauCeti.Analysis.Matrix.UnitaryGroup.Torus
import TauCeti.RepresentationTheory.SU2.Borel
import TauCeti.AlgebraicGeometry.AbelianVariety.End.BaseChange
import TauCeti.Probability.Process.EmpiricalMeasure
import TauCeti.AlgebraicGeometry.EllipticCurve.Isogeny.Hom.Ring
import TauCeti.NumberTheory.NumberField.Global.HeckeCharacter.Ideal

/-!
# Sato–Tate groups: target signatures

**This file is not the roadmap.** The roadmap is `README.md`, which carries every target with its
API and Checks; this file states the roadmap's headline theorems against the pinned Mathlib and
Tau Ceti, each with `sorry`, together with the few definitions those statements need. It is the
acceptance test of the finished roadmap, not an API catalogue: the API lemmas, the computed
invariants of individual groups and the LMFDB's irrational families `μ(n)`, `SU(2)[C_n]` and
`U(1)[D_n]` are README targets and Checks and are not restated here.

**Stated here.** Torus conjugacy and conjugacy classes in `USp(2g)` (0.5) and the identification
`USp(2) = SU(2)` carrying Haar to Haar (0.2); the openness of the identity component and the
finiteness of the component group of a closed subgroup of `U(d)` (1.2); the axioms with their
first consequences: `−1 ∈ G⁰` in odd weight, integrality of every mixed moment, rationality of
connected groups, failure of the Hodge condition for finite groups (2.2, 2.5); the trace moments
as `a_1` moments and the vanishing of odd moments (3.2–3.3); Serre's component-counting theorem
(3.5); the Weyl integration formula for `USp(2g)` (4.2), the binomial-convolution law of block
products (4.3) and the `USp(4)` moment formulas (4.5); the classification in degree `2`
(5.2–5.3); the fifty-seven groups of degree `4` as explicit closed subgroups, the identity-component
theorem, the classification theorem and distinctness (6.3–6.4, 6.6–6.8); the finiteness theorem
(7.2) and the connected groups of degree `6` (7.3); the real geometric endomorphism algebras of
abelian surfaces (8.4); the Weyl criterion for the semicircle law (10.1), Hecke
equidistribution with the no-norm-power hypothesis (10.4), and the Sato–Tate theorem for CM
elliptic curves over every number field, in the form of the equidistribution of the normalized
Frobenius traces for the trace law of `U(1)` resp. `N(U(1))` (10.5–10.6). Serre's L-function
criterion is ModularityAndLanglandsExtensions §4.25 and is not restated; 10.2 is its
specialisation to closed subgroups of `U(d)`.

**Not statable at the pins.** The Galois action on `End(A_k̄)`, the endomorphism field and the
Galois endomorphism type of an abelian variety (8.1–8.2, 8.7) need the transport of an
endomorphism of `A_k̄` along the base change of `A_k̄` by `σ ∈ Gal(k̄/k)`, which Tau Ceti's
`AbelianVariety.baseChange` does not provide. The Sato–Tate group `ST(A)` of an abelian variety and
everything built on it (9.3–9.8, 9.11–9.12), the elliptic-curve trichotomy `U(1)`, `N(U(1))`,
`SU(2)` of 9.9, the Banaszak–Kedlaya theorem for `g ≤ 3` (9.10), the Sato–Tate conjecture (10.3)
and the product cases (10.8) need the Zariski closure of the `ℓ`-adic image as an algebraic group
over `ℚ_ℓ`, its similitude kernel and a maximal compact subgroup of its complex points
(ReductiveGroups Layer 3, ArithmeticLocallySymmetricSpaces ALS.F.1), none at the pin; `ST(f)` for
a newform (9.9) needs the Galois representation of a newform (ModularForms). The real dimension (1.3) rests on the closed-subgroup theorem (LieGroups
Layer 2) and is a README target. The degree-six completeness and arithmetic realization
headlines (7.4, 9.8) require the concrete normalizer-subgroup families and their arithmetic
realization data, not present at the pins and not expressible by a few simple definitions;
no bounded surrogate is stated. The rational and real endomorphism lattices and the
minimal splitting fields require the Galois action above. Section 10.7 cites supplier results.

The carrier is a **closed subgroup of `U(d) = Matrix.unitaryGroup (Fin d) ℂ`**, Mathlib's
`ClosedSubgroup (U d)`, with the Borel σ-algebra declared once for every subgroup of `U d` and
the Haar probability measure `TauCeti.haarProb` of Tau Ceti's compact-group library. Being a
Sato–Tate group is the predicate `IsSatoTateGroup H G`, the conjunction of the three axioms
`IsSelfDual`, `HodgeCondition` and `IsRational`; every statistic is defined for every closed
subgroup.

Conventions visible in the signatures (`README.md`, *Conventions*): the symplectic form
is `Ω d = [[0, I], [−I, 0]]` and `USp d = {g | gᵀ Ω g = Ω}`; `coeff g i` is the coefficient of
`T^i` in `Matrix.charpolyRev g = det (1 − T g)`, so `coeff g 1 = −trace g` by Mathlib's
`Matrix.coeff_charpolyRev_eq_neg_trace`; moments are Bochner integrals against `haar G`, event
probabilities are `Measure.real`; the component measure of a coset is `c • (haar G).restrict coset`
with `c` the number of components; Hodge numbers are a function `Fin (w+1) → ℕ`; the torus of
`USp(2g)` is `diag(u, ū)` through `uSpTorusHom`; the block embedding `blockProd` interlaces the
coordinates `(x, x', y, y')`; the groups of degree `4` are written in these coordinates, with
`Z = {diag(A, Ā)}` through `zEmbed`; the normalized Frobenius trace of an elliptic curve at a prime
is read off Mathlib's `WeierstrassCurve.localPolynomial` of its minimal model over the completion;
equidistribution of `x : ℕ → X` for `μ : ProbabilityMeasure X` is
`Tendsto (TauCeti.Probability.empiricalMeasure x) atTop (𝓝 μ)`, the defining formula of
`AsympEquidistributed` (ProbabilisticAndMetricNumberTheory §2.1), with no second predicate
declared here, and `conjLaw G` is a `ProbabilityMeasure` for that reason. Jordan's theorem (7.1)
is `FiniteGroupInvariants` 10.5 and is not restated.

Definitions below have real bodies. Their subgroup and embedding laws are proved;
closedness and normalization statements used in the headline carriers are stated explicitly.
The normalizer trace law is bundled as a probability measure using its elementary mass sum.
-/

open Matrix MeasureTheory Polynomial Topology Filter
open scoped ENNReal TensorProduct Kronecker nonZeroDivisors

universe u

noncomputable section

namespace TauCetiRoadmap.SatoTateGroups

/-! ## Layer 0: ambient groups and the coefficient map -/

/-- The ambient unitary group `U(d)` (`README.md`, Layer 0, 0.1). -/
abbrev U (d : ℕ) : Type := Matrix.unitaryGroup (Fin d) ℂ

variable {d : ℕ}

/-- Every subgroup of `U(d)` carries the Borel σ-algebra (`README.md`, Layer 0, 0.1). -/
instance instMeasurableSpaceSubgroup (G : Subgroup (U d)) : MeasurableSpace G := borel G

/-- The subgroup measurable space is its Borel space (README 0.1). -/
instance instBorelSpaceSubgroup (G : Subgroup (U d)) : BorelSpace G := ⟨rfl⟩

/-- A closed subgroup of the compact group `U(d)` is compact (`README.md`, Layer 0, 0.1);
bridge check: `IsClosed.isCompact` and `isCompact_iff_compactSpace`. -/
instance instCompactSpaceClosedSubgroup (G : ClosedSubgroup (U d)) : CompactSpace G.toSubgroup :=
  isCompact_iff_compactSpace.mp G.isClosed'.isCompact

/-- The Haar probability measure of a closed subgroup of `U(d)`, Tau Ceti's `haarProb`
(`README.md`, Layer 0, 0.1). -/
abbrev haar (G : ClosedSubgroup (U d)) : Measure G.toSubgroup := TauCeti.haarProb G.toSubgroup


/-- The pinned symplectic form `Ω_d = [[0, I], [−I, 0]]` (`README.md`, Layer 0, 0.2). -/
def Ω (d : ℕ) : Matrix (Fin d) (Fin d) ℂ :=
  Matrix.of fun i j =>
    if (j : ℕ) = i + d / 2 then 1 else if (i : ℕ) = j + d / 2 then -1 else 0

/-- The unitary symplectic group `USp(d) = {g ∈ U(d) | gᵀ Ω g = Ω}` (`README.md`, Layer 0, 0.2).
The subgroup laws are proved outright. -/
def USp (d : ℕ) : Subgroup (U d) where
  carrier := {g | (g : Matrix (Fin d) (Fin d) ℂ)ᵀ * Ω d * g = Ω d}
  one_mem' := by simp
  mul_mem' := by
    intro g h hg hh
    simp only [Set.mem_ofPred_eq] at hg hh ⊢
    calc ((g * h : U d) : Matrix (Fin d) (Fin d) ℂ)ᵀ * Ω d * (g * h : U d)
        = (h : Matrix (Fin d) (Fin d) ℂ)ᵀ * ((g : Matrix (Fin d) (Fin d) ℂ)ᵀ * Ω d * g) * h := by
          rw [Submonoid.coe_mul, Matrix.transpose_mul]; simp only [Matrix.mul_assoc]
      _ = Ω d := by rw [hg, hh]
  inv_mem' := by
    intro g hg
    simp only [Set.mem_ofPred_eq] at hg ⊢
    set gi : Matrix (Fin d) (Fin d) ℂ := ((g⁻¹ : U d) : Matrix (Fin d) (Fin d) ℂ) with hgi
    have h1 : (g : Matrix (Fin d) (Fin d) ℂ) * gi = 1 := by
      rw [hgi, ← Submonoid.coe_mul, mul_inv_cancel, OneMemClass.coe_one]
    calc giᵀ * Ω d * gi
        = giᵀ * ((g : Matrix (Fin d) (Fin d) ℂ)ᵀ * Ω d * g) * gi := by rw [hg]
      _ = ((g : Matrix (Fin d) (Fin d) ℂ) * gi)ᵀ * Ω d * ((g : Matrix (Fin d) (Fin d) ℂ) * gi) := by
          rw [Matrix.transpose_mul]; simp only [Matrix.mul_assoc]
      _ = Ω d := by rw [h1]; simp

/-- `USp d` is closed in `U(d)` (`README.md`, Layer 0, 0.2). -/
theorem isClosed_USp (d : ℕ) : IsClosed (USp d : Set (U d)) := sorry

/-- `USp d` as a closed subgroup (`README.md`, Layer 0, 0.2). -/
def uSpClosed (d : ℕ) : ClosedSubgroup (U d) where
  toSubgroup := USp d
  isClosed' := isClosed_USp d

/-- `USp 2` is the determinant-one subgroup of `U(2)` (`README.md`, Layer 0, 0.2): for a
`2 × 2` matrix, `gᵀ Ω g = det g • Ω`. -/
theorem mem_USp_two_iff (g : U 2) : g ∈ USp 2 ↔ (g : Matrix (Fin 2) (Fin 2) ℂ).det = 1 := by
  have key : (g : Matrix (Fin 2) (Fin 2) ℂ)ᵀ * Ω 2 * g =
      (g : Matrix (Fin 2) (Fin 2) ℂ).det • Ω 2 := by
    ext i j
    fin_cases i <;> fin_cases j <;>
      simp [Matrix.mul_apply, Fin.sum_univ_two, Ω, Matrix.det_fin_two] <;> ring
  change _ = _ ↔ _
  rw [key]
  constructor
  · intro h
    simpa [Ω] using congrFun (congrFun h 0) 1
  · intro h
    rw [h, one_smul]

/-- The identification `USp 2 ≃ₜ* SU(2)` with Tau Ceti's `SU2`, the identity on matrices, along
which every degree-`2` statement is transported (`README.md`, Layer 0, 0.2). -/
def uSpTwoEquivSU2 : (USp 2) ≃ₜ* TauCeti.SU2 where
  toFun g := ⟨((g : U 2) : Matrix (Fin 2) (Fin 2) ℂ),
    Matrix.mem_specialUnitaryGroup_iff.mpr ⟨(g : U 2).2, (mem_USp_two_iff (g : U 2)).mp g.2⟩⟩
  invFun x := ⟨⟨x, (Matrix.mem_specialUnitaryGroup_iff.mp x.2).1⟩,
    (mem_USp_two_iff _).mpr (Matrix.mem_specialUnitaryGroup_iff.mp x.2).2⟩
  left_inv _ := rfl
  right_inv _ := rfl
  map_mul' _ _ := rfl
  continuous_toFun := (continuous_subtype_val.comp continuous_subtype_val).subtype_mk _
  continuous_invFun := (continuous_subtype_val.subtype_mk _).subtype_mk _

/-- The identification carries Haar to Haar (`README.md`, Layer 0, 0.2). -/
theorem map_haar_uSpTwoEquivSU2 :
    (haar (uSpClosed 2)).map uSpTwoEquivSU2 = TauCeti.haarProb TauCeti.SU2 := sorry

/-- The orthogonal group `O(d)`, the real points of `U(d)` (`README.md`, Layer 0, 0.3). The
subgroup laws are proved outright. -/
def Od (d : ℕ) : Subgroup (U d) where
  carrier := {g | ∀ i j, ((g : Matrix (Fin d) (Fin d) ℂ) i j).im = 0}
  one_mem' := by
    intro i j
    by_cases h : i = j <;> simp [h]
  mul_mem' := by
    intro g h hg hh i j
    simp only [Set.mem_ofPred_eq] at hg hh
    simp [Matrix.mul_apply, Complex.im_sum, Complex.mul_im, hg, hh]
  inv_mem' := by
    intro g hg i j
    simp only [Set.mem_ofPred_eq] at hg
    rw [← Unitary.star_eq_inv, Unitary.coe_star, Matrix.star_eq_conjTranspose,
      Matrix.conjTranspose_apply, Complex.star_def, Complex.conj_im, hg, neg_zero]

/-- `Od d` is closed in `U(d)` (`README.md`, Layer 0, 0.3). -/
theorem isClosed_Od (d : ℕ) : IsClosed (Od d : Set (U d)) := sorry

/-- The ambient group of a weight: `USp d` in odd weight, `Od d` in even weight
(`README.md`, Layer 0, 0.3). -/
def ambient (w d : ℕ) : Subgroup (U d) := if Odd w then USp d else Od d

/-- `a_i(g)`, the coefficient of `T^i` in the reversed characteristic polynomial `det (1 − T g)`
(`README.md`, Layer 0, 0.4). -/
def coeff (g : U d) (i : ℕ) : ℂ := ((g : Matrix (Fin d) (Fin d) ℂ).charpolyRev).coeff i

/-- The trace random variable `t = tr g` (`README.md`, Layer 0, 0.4). -/
def trace (g : U d) : ℂ := Matrix.trace (g : Matrix (Fin d) (Fin d) ℂ)

/-- The interlaced circle parameters `(u_1, …, u_g, ū_1, …, ū_g)` of the pinned torus
(`README.md`, Layer 0, 0.5). -/
def uSpTorusFun (g : ℕ) (u : Fin g → Circle) : Fin (2 * g) → Circle := fun i =>
  if h : (i : ℕ) < g then u ⟨i, h⟩ else (u ⟨(i : ℕ) - g, by have := i.isLt; omega⟩)⁻¹

/-- The diagonal torus of `USp(2g)`, `u ↦ diag(u_1, …, u_g, ū_1, …, ū_g)`, through Tau Ceti's
`unitaryTorusHom` (`README.md`, Layer 0, 0.5). -/
def uSpTorusHom (g : ℕ) : (Fin g → Circle) →* U (2 * g) where
  toFun u := TauCeti.unitaryTorusHom (Fin (2 * g)) (uSpTorusFun g u)
  map_one' := by
    have h : uSpTorusFun g 1 = 1 := by
      funext i; unfold uSpTorusFun; split_ifs <;> simp
    rw [h, map_one]
  map_mul' u v := by
    have h : uSpTorusFun g (u * v) = uSpTorusFun g u * uSpTorusFun g v := by
      funext i; by_cases hi : (i : ℕ) < g <;> simp [uSpTorusFun, hi, mul_comm]
    rw [h, map_mul]

/-- The torus `uSpTorus g ≤ USp(2g)` (`README.md`, Layer 0, 0.5). -/
def uSpTorus (g : ℕ) : Subgroup (U (2 * g)) := (uSpTorusHom g).range


/-- Every element of `USp(2g)` is conjugate **in `USp(2g)`** into the torus
(`README.md`, Layer 0, 0.5). -/
theorem exists_conj_mem_uSpTorus {g : ℕ} {x : U (2 * g)} (hx : x ∈ USp (2 * g)) :
    ∃ h ∈ USp (2 * g), h * x * h⁻¹ ∈ uSpTorus g := sorry

/-- Conjugacy in `USp(2g)` is detected by the characteristic polynomial
(`README.md`, Layer 0, 0.5). -/
theorem isConj_USp_iff_charpolyRev_eq {g : ℕ} {x y : U (2 * g)} (hx : x ∈ USp (2 * g))
    (hy : y ∈ USp (2 * g)) :
    (∃ h ∈ USp (2 * g), h * x * h⁻¹ = y) ↔
      (x : Matrix (Fin (2 * g)) (Fin (2 * g)) ℂ).charpolyRev =
        (y : Matrix (Fin (2 * g)) (Fin (2 * g)) ℂ).charpolyRev := sorry

/-! ## Layer 1: identity component, components, real dimension, Haar on components -/

/-- The identity component `G⁰`, Mathlib's `Subgroup.connectedComponentOfOne`
(`README.md`, Layer 1, 1.1). -/
abbrev identityComponent (G : Subgroup (U d)) : Subgroup G := Subgroup.connectedComponentOfOne G

/-- The component group `G ⧸ G⁰`; its group structure uses Tau Ceti's normality instance
(`README.md`, Layer 1, 1.1). -/
abbrev componentGroup (G : Subgroup (U d)) : Type := G ⧸ identityComponent G

/-- The number of components `c = #(G ⧸ G⁰)` (`README.md`, Layer 1, 1.2). -/
def numComponents (G : Subgroup (U d)) : ℕ := Nat.card (componentGroup G)

/-- The identity component of a closed subgroup of `U(d)` is open (`README.md`, Layer 1, 1.2). -/
theorem isOpen_identityComponent (G : ClosedSubgroup (U d)) :
    IsOpen (identityComponent G.toSubgroup : Set G.toSubgroup) := sorry

/-- The component group of a closed subgroup of `U(d)` is finite (`README.md`, Layer 1, 1.2). -/
theorem finite_componentGroup (G : ClosedSubgroup (U d)) : Finite (componentGroup G.toSubgroup) :=
  sorry


/-- The coset of `G` indexed by a component (`README.md`, Layer 1, 1.4). -/
def componentCoset (G : Subgroup (U d)) (H : componentGroup G) : Set G :=
  {g | (QuotientGroup.mk g : componentGroup G) = H}

/-- The component measure `μ_H = c • (haar G)|_{C_H}` (`README.md`, Layer 1, 1.4). -/
def componentMeasure (G : ClosedSubgroup (U d)) (H : componentGroup G.toSubgroup) :
    Measure G.toSubgroup :=
  (numComponents G.toSubgroup : ℝ≥0∞) • (haar G).restrict (componentCoset G.toSubgroup H)

/-! ## Layer 2: the Sato–Tate axioms -/

/-- Hodge numbers `h p = h^{p, w−p}` of weight `w` and degree `d` (`README.md`, Layer 2, 2.1). -/
structure HodgeNumbers (w d : ℕ) where
  /-- `h p = h^{p, w - p}`. -/
  h : Fin (w + 1) → ℕ
  sum_eq : ∑ p, h p = d
  symm : Odd w → ∀ p, h p = h (Fin.rev p)

namespace HodgeNumbers

/-- The abelian-variety Hodge numbers `(g, g)` in weight `1`; non-vacuity constructor
(`README.md`, Layer 2, 2.1). -/
def weightOne (g : ℕ) : HodgeNumbers 1 (2 * g) where
  h := ![g, g]
  sum_eq := by simp [Fin.sum_univ_two]; ring
  symm := fun _ p => by fin_cases p <;> rfl

end HodgeNumbers

/-- A Hodge circle: a continuous homomorphism `Circle → G` into `G⁰` whose value at `u` has
eigenvalues `u^{2p − w}` with multiplicity `h p` (`README.md`, Layer 2, 2.2). -/
structure IsHodgeCircle {w : ℕ} (H : HodgeNumbers w d) (G : Subgroup (U d))
    (θ : ContinuousMonoidHom Circle G) : Prop where
  mem_identityComponent : ∀ u, θ u ∈ identityComponent G
  charpoly_eq : ∀ u, Matrix.charpoly ((θ u : U d) : Matrix (Fin d) (Fin d) ℂ) =
    ∏ p : Fin (w + 1), (X - C ((u ^ (2 * ((p : ℕ) : ℤ) - (w : ℤ)) : Circle) : ℂ)) ^ H.h p

/-- The Hodge condition (ST2): a Hodge circle exists and the Hodge circles generate a dense
subgroup of `G⁰` (`README.md`, Layer 2, 2.2). -/
def HodgeCondition {w : ℕ} (H : HodgeNumbers w d) (G : Subgroup (U d)) : Prop :=
  (∃ θ : ContinuousMonoidHom Circle G, IsHodgeCircle H G θ) ∧
    closure (Subgroup.closure
      (⋃ θ : {θ : ContinuousMonoidHom Circle G // IsHodgeCircle H G θ}, Set.range θ.1) : Set G) =
      (identityComponent G : Set G)

/-- A finite subgroup fails the Hodge condition as soon as some Hodge number `h p ≠ 0` sits off
the middle `2p = w` (so in every odd weight with `d ≥ 1`); with all weight in the middle the
trivial homomorphism is a Hodge circle and finite groups pass, as the roots of unity `μ(n) ≤ U(1)`
do in weight `0` (`README.md`, Layer 2, 2.2; Layer 5, 5.6). -/
theorem not_hodgeCondition_of_finite {w : ℕ} (H : HodgeNumbers w d)
    (hH : ∃ p : Fin (w + 1), H.h p ≠ 0 ∧ 2 * (p : ℕ) ≠ w) (G : Subgroup (U d)) [Finite G] :
    ¬ HodgeCondition H G := sorry

/-- The rationality condition (ST3): every mixed moment on every component is an integer
(`README.md`, Layer 2, 2.3). -/
def IsRational (G : ClosedSubgroup (U d)) : Prop :=
  ∀ (H : componentGroup G.toSubgroup) (n : Fin (d + 1) → ℕ),
    ∃ z : ℤ, ∫ g, ∏ i : Fin (d + 1), coeff (g : U d) i ^ n i ∂componentMeasure G H = z

/-- Self-duality (ST1): `G` lies in the ambient group of the weight (`README.md`, Layer 2, 2.4). -/
def IsSelfDual (w : ℕ) (G : ClosedSubgroup (U d)) : Prop := G.toSubgroup ≤ ambient w d

/-- **The Sato–Tate predicate** `IsSatoTateGroup H G`: ST1 ∧ ST2 ∧ ST3
(`README.md`, Layer 2, 2.4). The LMFDB's `rational` column is the field `rational`. -/
structure IsSatoTateGroup {w : ℕ} (H : HodgeNumbers w d) (G : ClosedSubgroup (U d)) : Prop where
  selfDual : IsSelfDual w G
  hodge : HodgeCondition H G.toSubgroup
  rational : IsRational G

/-- The Lefschetz condition (ST4): the elements of `USp d` commuting with the commutant of `G⁰`
are exactly `G⁰` (`README.md`, Layer 2, 2.4). -/
def IsLefschetz (G : ClosedSubgroup (U d)) : Prop :=
  ∀ g ∈ USp d,
    (∀ X : Matrix (Fin d) (Fin d) ℂ,
      (∀ h : G.toSubgroup, h ∈ identityComponent G.toSubgroup →
        ((h : U d) : Matrix (Fin d) (Fin d) ℂ) * X = X * (h : U d)) →
      (g : Matrix (Fin d) (Fin d) ℂ) * X = X * g) →
    ∃ h ∈ identityComponent G.toSubgroup, (h : U d) = g

/-- In odd weight, `−1 ∈ G⁰` under the Hodge condition (`README.md`, Layer 2, 2.5(a)). -/
theorem neg_one_mem_identityComponent {w : ℕ} (H : HodgeNumbers w d) (hw : Odd w)
    (G : Subgroup (U d)) (hG : HodgeCondition H G) :
    ∃ m ∈ identityComponent G, ((m : U d) : Matrix (Fin d) (Fin d) ℂ) = -1 := sorry

/-- Every mixed moment over the whole group is an integer (`README.md`, Layer 2, 2.5(d)). -/
theorem exists_int_integral_prod_coeff (G : ClosedSubgroup (U d)) (n : Fin (d + 1) → ℕ) :
    ∃ z : ℤ, ∫ g, ∏ i : Fin (d + 1), coeff (g : U d) i ^ n i ∂haar G = z := sorry

/-- Connected groups are rational (`README.md`, Layer 2, 2.5(c)). -/
theorem isRational_of_connectedSpace (G : ClosedSubgroup (U d)) [ConnectedSpace G.toSubgroup] :
    IsRational G := sorry

/-! ## Layer 3: moments, event probabilities, and the stored statistics -/

/-- The mixed moment `E[∏ a_i^{n_i}]` (`README.md`, Layer 3, 3.1). -/
def coeffMoment (G : ClosedSubgroup (U d)) (n : Fin (d + 1) → ℕ) : ℂ :=
  ∫ g, ∏ i : Fin (d + 1), coeff (g : U d) i ^ n i ∂haar G

/-- The moment sequence of `a_i`, `m ↦ E[a_i^m]`, for every index `i : ℕ` (`a_i = 0` beyond the
degree, so `aMoment G i m = 0` there for `m ≥ 1`); for `i ≤ d` it is `coeffMoment G (Pi.single i m)`
(`README.md`, Layer 3, 3.1). -/
def aMoment (G : ClosedSubgroup (U d)) (i m : ℕ) : ℂ := ∫ g, coeff (g : U d) i ^ m ∂haar G

/-- The trace moment `E[t^m]` (`README.md`, Layer 3, 3.1). -/
def traceMoment (G : ClosedSubgroup (U d)) (m : ℕ) : ℂ := ∫ g, trace (g : U d) ^ m ∂haar G

/-- In odd weight the trace moments are the `a_1` moments (`README.md`, Layer 3, 3.2). -/
theorem traceMoment_eq_aMoment_one {w : ℕ} (H : HodgeNumbers w d) (hw : Odd w)
    (G : ClosedSubgroup (U d)) (hG : HodgeCondition H G.toSubgroup) (m : ℕ) :
    traceMoment G m = aMoment G 1 m := sorry

/-- In odd weight the odd mixed moments vanish (`README.md`, Layer 3, 3.3). -/
theorem coeffMoment_eq_zero_of_odd {w : ℕ} (H : HodgeNumbers w d) (hw : Odd w)
    (G : ClosedSubgroup (U d)) (hG : HodgeCondition H G.toSubgroup) (n : Fin (d + 1) → ℕ)
    (hn : Odd (∑ i : Fin (d + 1), (i : ℕ) * n i)) : coeffMoment G n = 0 := sorry

/-- The event probability `Pr[a_i = x]` (`README.md`, Layer 3, 3.4). -/
def coeffProb (G : ClosedSubgroup (U d)) (i : ℕ) (x : ℂ) : ℝ :=
  (haar G).real {g | coeff (g : U d) i = x}

/-- The event probability on a component (`README.md`, Layer 3, 3.4). -/
def componentProb (G : ClosedSubgroup (U d)) (H : componentGroup G.toSubgroup) (i : ℕ) (x : ℂ) :
    ℝ :=
  (componentMeasure G H).real {g | coeff (g : U d) i = x}

/-- **Serre's component-counting theorem**: on a component, `a_i` is constant or its level sets
are null (`README.md`, Layer 3, 3.5). -/
theorem componentProb_eq_zero_or_one (G : ClosedSubgroup (U d)) (H : componentGroup G.toSubgroup)
    (i : ℕ) (x : ℂ) : componentProb G H i x = 0 ∨ componentProb G H i x = 1 := sorry

/-- The probability is `1` exactly when `a_i ≡ x` on the component (`README.md`, Layer 3, 3.5). -/
theorem componentProb_eq_one_iff (G : ClosedSubgroup (U d)) (H : componentGroup G.toSubgroup)
    (i : ℕ) (x : ℂ) :
    componentProb G H i x = 1 ↔ ∀ g ∈ componentCoset G.toSubgroup H, coeff (g : U d) i = x :=
  sorry

/-- The `z`-count: the number of components on which `a_i ≡ x` (`README.md`, Layer 3, 3.5). -/
def zCount (G : ClosedSubgroup (U d)) (i : ℕ) (x : ℂ) : ℕ :=
  Nat.card {H : componentGroup G.toSubgroup //
    ∀ g ∈ componentCoset G.toSubgroup H, coeff (g : U d) i = x}

/-- `Pr[a_i = x] = z / c` (`README.md`, Layer 3, 3.5). -/
theorem coeffProb_eq_zCount_div (G : ClosedSubgroup (U d)) (i : ℕ) (x : ℂ) :
    coeffProb G i x = (zCount G i x : ℝ) / numComponents G.toSubgroup := sorry

/-! ## Layer 4: Weyl integration for the connected groups -/

/-- **The Weyl integration formula for `USp(2g)`** (`README.md`, Layer 4, 4.2), with the pinned
density `2^{g²}/(g! π^g) · ∏_{j<k} (cos θ_j − cos θ_k)² ∏_j sin² θ_j` on `[0, π]^g`. -/
theorem weyl_integration_USp (g : ℕ) (f : U (2 * g) → ℂ) (hf : Continuous f)
    (hconj : ∀ x ∈ USp (2 * g), ∀ y ∈ USp (2 * g), f (x * y * x⁻¹) = f y) :
    ∫ x, f (x : U (2 * g)) ∂haar (uSpClosed (2 * g)) =
      ((2 : ℂ) ^ (g ^ 2) / (Nat.factorial g * (Real.pi : ℂ) ^ g)) *
        ∫ θ in Set.pi Set.univ (fun _ : Fin g => Set.Icc (0 : ℝ) Real.pi),
          f (uSpTorusHom g fun j => Circle.exp (θ j)) *
            ((∏ j, Real.sin (θ j) ^ 2 : ℝ) : ℂ) *
            ((∏ j, ∏ k ∈ Finset.univ.filter (fun k => j < k),
              (Real.cos (θ j) - Real.cos (θ k)) ^ 2 : ℝ) : ℂ) := sorry


/-- The block-diagonal map `(A, B) ↦ diag(A, B)` on unitary groups, reindexed along `e`
(`README.md`, Layer 4, 4.3). -/
def blockDiagHom {m n p : Type*} [Fintype m] [Fintype n] [Fintype p] [DecidableEq m]
    [DecidableEq n] [DecidableEq p] (e : m ⊕ n ≃ p) :
    unitaryGroup m ℂ × unitaryGroup n ℂ →* unitaryGroup p ℂ where
  toFun x := ⟨(fromBlocks (x.1 : Matrix m m ℂ) 0 0 (x.2 : Matrix n n ℂ)).submatrix e.symm e.symm, by
    rw [mem_unitaryGroup_iff, star_eq_conjTranspose, conjTranspose_submatrix,
      submatrix_mul_equiv, fromBlocks_conjTranspose, fromBlocks_multiply]
    simp only [conjTranspose_zero, Matrix.mul_zero, Matrix.zero_mul, add_zero, zero_add]
    rw [← star_eq_conjTranspose, ← star_eq_conjTranspose, mem_unitaryGroup_iff.mp x.1.2,
      mem_unitaryGroup_iff.mp x.2.2, fromBlocks_one, submatrix_one_equiv]⟩
  map_one' := Subtype.ext <| by
    change (fromBlocks (1 : Matrix m m ℂ) 0 0 1).submatrix e.symm e.symm = 1
    rw [fromBlocks_one, submatrix_one_equiv]
  map_mul' x y := by
    ext : 1
    simp [submatrix_mul_equiv, fromBlocks_multiply]

/-- The splitting `Fin (2g) ≃ Fin g ⊕ Fin g` into the coordinates `x_1…x_g` and `y_1…y_g` of the
pinned form `Ω` (`README.md`, Conventions). -/
def finTwoMulEquiv (g : ℕ) : Fin (2 * g) ≃ Fin g ⊕ Fin g :=
  (finCongr (two_mul g)).trans finSumFinEquiv.symm

/-- The interlacing `(x, y) ⊕ (x', y') ↦ (x, x', y, y')` of the pinned block embedding
(`README.md`, Conventions). -/
def interlaceEquiv (g₁ g₂ : ℕ) : Fin (2 * g₁) ⊕ Fin (2 * g₂) ≃ Fin (2 * (g₁ + g₂)) :=
  ((Equiv.sumCongr (finTwoMulEquiv g₁) (finTwoMulEquiv g₂)).trans
    ((Equiv.sumSumSumComm _ _ _ _).trans
      (Equiv.sumCongr finSumFinEquiv finSumFinEquiv))).trans (finTwoMulEquiv (g₁ + g₂)).symm

/-- The pinned block embedding `USp(2g₁) × USp(2g₂) → USp(2(g₁+g₂))` by interlacing coordinates
(`README.md`, Layer 4, 4.3; Conventions). -/
def blockProd (g₁ g₂ : ℕ) : U (2 * g₁) × U (2 * g₂) →* U (2 * (g₁ + g₂)) :=
  blockDiagHom (interlaceEquiv g₁ g₂)

/-- The block product of two closed subgroups is closed, the image of a compact group
(`README.md`, Layer 4, 4.3). -/
theorem isClosed_map_blockProd {g₁ g₂ : ℕ} (G₁ : ClosedSubgroup (U (2 * g₁)))
    (G₂ : ClosedSubgroup (U (2 * g₂))) :
    IsClosed ((G₁.toSubgroup.prod G₂.toSubgroup).map (blockProd g₁ g₂) : Set (U (2 * (g₁ + g₂)))) :=
  sorry

/-- The block product of two closed subgroups (`README.md`, Layer 4, 4.3). -/
def prodClosed {g₁ g₂ : ℕ} (G₁ : ClosedSubgroup (U (2 * g₁))) (G₂ : ClosedSubgroup (U (2 * g₂))) :
    ClosedSubgroup (U (2 * (g₁ + g₂))) where
  toSubgroup := (G₁.toSubgroup.prod G₂.toSubgroup).map (blockProd g₁ g₂)
  isClosed' := isClosed_map_blockProd G₁ G₂

/-- The binomial-convolution law for `a_1` of a block product, from the independence of the two
coefficient variables (`README.md`, Layer 4, 4.3). -/
theorem aMoment_one_prodClosed {g₁ g₂ : ℕ} (G₁ : ClosedSubgroup (U (2 * g₁)))
    (G₂ : ClosedSubgroup (U (2 * g₂))) (m : ℕ) :
    aMoment (prodClosed G₁ G₂) 1 m =
      ∑ j ∈ Finset.range (m + 1), (m.choose j : ℂ) * aMoment G₁ 1 j * aMoment G₂ 1 (m - j) := sorry

/-- The diagonal copy `U(1)_g = {diag(u I_g, ū I_g)} ≤ USp(2g)` (`README.md`, Layer 4, 4.3). -/
def u1Diag (g : ℕ) : Subgroup (U (2 * g)) :=
  ((uSpTorusHom g).comp (MonoidHom.pi fun _ : Fin g => MonoidHom.id Circle)).range

/-- The diagonal embedding `SU(2) → USp(2g)`, `[[a, b], [c, d]] ↦ [[a I, b I], [c I, d I]]`, the
Kronecker product `x ⊗ I_g` with rows indexed by `finProdFinEquiv` (`README.md`, Layer 4, 4.3). -/
def su2DiagHom (g : ℕ) : TauCeti.SU2 →* U (2 * g) where
  toFun x := ⟨((x : Matrix (Fin 2) (Fin 2) ℂ) ⊗ₖ (1 : Matrix (Fin g) (Fin g) ℂ)).submatrix
      finProdFinEquiv.symm finProdFinEquiv.symm, by
    rw [mem_unitaryGroup_iff, star_eq_conjTranspose, conjTranspose_submatrix,
      submatrix_mul_equiv, conjTranspose_kronecker, ← mul_kronecker_mul, conjTranspose_one,
      Matrix.mul_one, ← star_eq_conjTranspose,
      mem_unitaryGroup_iff.mp (Matrix.specialUnitaryGroup_le_unitaryGroup x.2),
      one_kronecker_one, submatrix_one_equiv]⟩
  map_one' := Subtype.ext <| by
    change ((1 : Matrix (Fin 2) (Fin 2) ℂ) ⊗ₖ (1 : Matrix (Fin g) (Fin g) ℂ)).submatrix
      finProdFinEquiv.symm finProdFinEquiv.symm = 1
    rw [one_kronecker_one, submatrix_one_equiv]
  map_mul' x y := Subtype.ext <| by
    change ((x * y : Matrix (Fin 2) (Fin 2) ℂ) ⊗ₖ (1 : Matrix (Fin g) (Fin g) ℂ)).submatrix
        finProdFinEquiv.symm finProdFinEquiv.symm =
      ((x : Matrix (Fin 2) (Fin 2) ℂ) ⊗ₖ (1 : Matrix (Fin g) (Fin g) ℂ)).submatrix
          finProdFinEquiv.symm finProdFinEquiv.symm *
        ((y : Matrix (Fin 2) (Fin 2) ℂ) ⊗ₖ (1 : Matrix (Fin g) (Fin g) ℂ)).submatrix
          finProdFinEquiv.symm finProdFinEquiv.symm
    rw [submatrix_mul_equiv, ← mul_kronecker_mul, Matrix.mul_one]

/-- The diagonal copy `SU(2)_g ≤ USp(2g)` (`README.md`, Layer 4, 4.3). -/
def su2Diag (g : ℕ) : Subgroup (U (2 * g)) := (su2DiagHom g).range

/-- Entrywise complex conjugation `A ↦ Ā` on a unitary group (`README.md`, Layer 4, 4.7). -/
def conjHom (n : Type*) [Fintype n] [DecidableEq n] : unitaryGroup n ℂ →* unitaryGroup n ℂ where
  toFun x := ⟨(x : Matrix n n ℂ).map (starRingEnd ℂ), by
    rw [mem_unitaryGroup_iff, star_eq_conjTranspose]
    have h := congrArg (fun M : Matrix n n ℂ => M.map (starRingEnd ℂ))
      (mem_unitaryGroup_iff.mp x.2)
    simp only [star_eq_conjTranspose, Matrix.map_mul, Matrix.map_one, map_zero, map_one] at h
    convert h using 2
    ext i j
    simp [conjTranspose_apply]⟩
  map_one' := Subtype.ext <| by exact Matrix.map_one (starRingEnd ℂ) (map_zero _) (map_one _)
  map_mul' x y := Subtype.ext <| by exact Matrix.map_mul

/-- The embedding `U(g) → USp(2g)`, `A ↦ diag(A, Ā)` (`README.md`, Layer 4, 4.7). -/
def unitaryDiagHom (g : ℕ) : U g →* U (2 * g) :=
  (blockDiagHom (finTwoMulEquiv g).symm).comp ((MonoidHom.id _).prod (conjHom (Fin g)))

/-- The FKRS sequence `b_n = [X^n](X² + 1)^n` (`README.md`, Layer 4, 4.4). -/
def bSeq (n : ℕ) : ℕ := if Even n then n.choose (n / 2) else 0

/-- The FKRS sequence `c_n = b_n / (n/2 + 1)` (`README.md`, Layer 4, 4.4). -/
def cSeq (n : ℕ) : ℕ := bSeq n / (n / 2 + 1)

/-- The `a_1` moments of `USp(4)`: `E[a_1^n] = c_n c_{n+4} − c_{n+2}²`, so `1, 3, 14, 84, 594`
for `n = 2, 4, …, 10` (`README.md`, Layer 4, 4.5). -/
theorem aMoment_one_uSp4 (n : ℕ) :
    aMoment (uSpClosed 4) 1 n = (cSeq n * cSeq (n + 4) : ℂ) - (cSeq (n + 2) : ℂ) ^ 2 := sorry

/-- The `a_2` moments of `USp(4)`: `E[a_2^n] = ∑_k C(n,k) 2^{n−k} (c_k c_{k+2} − c_{k+1}²)`, so
`1, 2, 4, 10, 27` for `n = 1, …, 5` (`README.md`, Layer 4, 4.5). -/
theorem aMoment_two_uSp4 (n : ℕ) :
    aMoment (uSpClosed 4) 2 n = ∑ k ∈ Finset.range (n + 1),
      (n.choose k : ℂ) * 2 ^ (n - k) * ((cSeq k * cSeq (k + 2) : ℂ) - (cSeq (k + 1) : ℂ) ^ 2) :=
  sorry

/-! ## Layer 5: degree `2` -/

/-- The quarter turn `J = [[0, 1], [−1, 0]]` (`README.md`, Layer 5, 5.1). -/
def J : U 2 := ⟨!![0, 1; -1, 0], by
  rw [mem_unitaryGroup_iff]
  ext i j
  fin_cases i <;> fin_cases j <;> simp [Matrix.mul_apply, Fin.sum_univ_two, Matrix.star_apply]⟩

/-- The diagonal copy `U(1)_g` is closed, the image of the compact `Circle`
(`README.md`, Layer 4, 4.3). -/
theorem isClosed_u1Diag (g : ℕ) : IsClosed (u1Diag g : Set (U (2 * g))) := sorry

/-- `U(1) = {diag(u, ū)} ≤ SU(2)` (`README.md`, Layer 5, 5.1). -/
def u1 : ClosedSubgroup (U 2) where
  toSubgroup := u1Diag 1
  isClosed' := isClosed_u1Diag 1

/-- `U(1) ∪ J·U(1)` is closed, a union of two cosets of `U(1)` (`README.md`, Layer 5, 5.1). -/
theorem isClosed_nu1 : IsClosed ((u1Diag 1 ⊔ Subgroup.zpowers J : Subgroup (U 2)) : Set (U 2)) :=
  sorry

/-- `N(U(1)) = U(1) ∪ J·U(1)` (`README.md`, Layer 5, 5.1). -/
def nu1 : ClosedSubgroup (U 2) where
  toSubgroup := u1Diag 1 ⊔ Subgroup.zpowers J
  isClosed' := isClosed_nu1

/-- `SU(2) = USp(2)` (`README.md`, Layer 5, 5.1). -/
abbrev su2 : ClosedSubgroup (U 2) := uSpClosed 2


/-- The three groups are Sato–Tate groups for `weightOne 1` (`README.md`, Layer 5, 5.2). -/
theorem isSatoTateGroup_degree2 :
    IsSatoTateGroup (HodgeNumbers.weightOne 1) u1 ∧ IsSatoTateGroup (HodgeNumbers.weightOne 1) nu1 ∧
      IsSatoTateGroup (HodgeNumbers.weightOne 1) su2 := sorry

/-- Conjugacy of subgroups of `U(d)` by an element of a given subgroup `S`
(`README.md`, Conventions). -/
def IsConjIn (S : Subgroup (U d)) (G₁ G₂ : Subgroup (U d)) : Prop :=
  ∃ s ∈ S, G₁.map (MulAut.conj s).toMonoidHom = G₂

/-- **The classification in degree `2`**: a closed subgroup of `SU(2)` with the Hodge condition
is conjugate to `U(1)`, `N(U(1))` or `SU(2)`; rationality plays no role
(`README.md`, Layer 5, 5.3). -/
theorem degree2_classification (G : ClosedSubgroup (U 2)) (h1 : IsSelfDual 1 G)
    (h2 : HodgeCondition (HodgeNumbers.weightOne 1) G.toSubgroup) :
    IsConjIn (USp 2) G.toSubgroup u1.toSubgroup ∨ IsConjIn (USp 2) G.toSubgroup nu1.toSubgroup ∨
      IsConjIn (USp 2) G.toSubgroup su2.toSubgroup := sorry

/-- The diagonal matrix `diag(a, b) ∈ U(2)` (`README.md`, Layer 5, 5.5; Layer 6, 6.3). -/
def diagU (a b : Circle) : U 2 := TauCeti.unitaryTorusHom (Fin 2) ![a, b]

/-! ## Layer 6: degree `4` -/

/-- The seven connected groups of degree `4` in the pinned coordinates: `U(1)_2`, `SU(2)_2`,
`U(1)×U(1)`, `U(1)×SU(2)`, `SU(2)×SU(2)`, `USp(4)`, and `diag(U(2), conjugate U(2))`
(`README.md`, Layer 4, 4.6). -/
def degree4Connected : Fin 7 → Subgroup (U 4) :=
  ![u1Diag 2, su2Diag 2, ((u1Diag 1).prod (u1Diag 1)).map (blockProd 1 1),
    ((u1Diag 1).prod (USp 2)).map (blockProd 1 1), ((USp 2).prod (USp 2)).map (blockProd 1 1),
    USp 4, (unitaryDiagHom 2).range]

/-- The identity component of a self-dual group with the Hodge condition in degree `4` is
conjugate to one of the seven (`README.md`, Layer 6, 6.4). -/
theorem degree4_identityComponent (G : ClosedSubgroup (U 4))
    (hG : HodgeCondition (HodgeNumbers.weightOne 2) G.toSubgroup) (hS : IsSelfDual 1 G) :
    ∃ i : Fin 7, IsConjIn (USp 4) ((identityComponent G.toSubgroup).map G.toSubgroup.subtype)
      (degree4Connected i) := sorry

/-- FKRS's embedding `Z : U(2) → USp(4)`, `A ↦ diag(A, Ā)` in the pinned coordinates, whose image is
the centralizer of `U(1)_2` in `USp(4)` (FKRS (3.1); `README.md`, Layer 6, 6.1). The quaternion
embedding of 6.1 is its restriction to `SU(2)`. -/
abbrev zEmbed : U 2 →* U 4 := unitaryDiagHom 2

/-- FKRS's copy `SU(2)_2 = {diag(A, Ā) | A ∈ SU(2)} ≤ Z` used throughout Layer 6, conjugate in
`USp(4)` to `su2Diag 2` (`README.md`, Layer 6, 6.1). -/
def fkrsSU2 : Subgroup (U 4) := (USp 2).map zEmbed

/-- The unit quaternion `cos(π/n) + sin(π/n) i`, the matrix `diag(e^{πi/n}, e^{−πi/n}) ∈ SU(2)`:
FKRS's `ζ_{2n}`, the `ζ_n` of `README.md` 6.3 (`README.md`, Layer 6, 6.3). -/
def quatZeta (n : ℕ) : U 2 := diagU (Circle.exp (Real.pi / n)) (Circle.exp (Real.pi / n))⁻¹

/-- The unit quaternion `ω = ½(1 + i + j + k)`, which with `i = quatZeta 2` and `j = J` generates
the binary tetrahedral group `2T` (`README.md`, Layer 6, 6.2). -/
def quatOmega : U 2 :=
  ⟨!![(1 + Complex.I) / 2, (1 + Complex.I) / 2; (-1 + Complex.I) / 2, (1 - Complex.I) / 2], by
    rw [mem_unitaryGroup_iff]
    ext i j
    fin_cases i <;> fin_cases j <;>
      simp [Matrix.mul_apply, Fin.sum_univ_two, Matrix.star_apply, Complex.ext_iff, Complex.div_re,
        Complex.div_im] <;> norm_num⟩

/-- The scalar `e^{πi/n}` of `Z ≅ U(2)`, the matrix `diag(ζ, ζ, ζ̄, ζ̄) ∈ U(1)_2` with
`ζ = e^{πi/n}` (`README.md`, Layer 6, 6.3). -/
def scalarZ (n : ℕ) : U 4 := zEmbed (diagU (Circle.exp (Real.pi / n)) (Circle.exp (Real.pi / n)))

/-- FKRS's `J = [[0, J_2], [−J_2, 0]]`, the generator of `N ∖ Z`, written as the product of
`c = diag(J_2, J_2) = zEmbed J` and `ab = blockProd 1 1 (J, J) = [[0, I], [−I, 0]]`
(`README.md`, Layer 6, 6.1). -/
def Jfour : U 4 := zEmbed J * blockProd 1 1 (J, J)

/-- The closed subgroup `⟨G⁰, S⟩` generated by a subgroup and a finite list of matrices, taken as
the topological closure of the subgroup they generate (`README.md`, Layer 6, 6.3); for the groups
of 6.3 the generated subgroup is already closed, a finite union of cosets of `G⁰`. -/
def generatedClosed (G₀ : Subgroup (U d)) (S : List (U d)) : ClosedSubgroup (U d) where
  toSubgroup := (G₀ ⊔ Subgroup.closure {g | g ∈ S}).topologicalClosure
  isClosed' := Subgroup.isClosed_topologicalClosure _

/-- The fifty-seven groups of degree `4` by identity component and generators, the first fifty-five in the order of FKRS
Table 8 (`README.md`, Layer 6, 6.3): `C_1, …, C_6, D_2, …, D_6, T, O`, their `J(·)`, then
`C_{2,1}, C_{4,1}, C_{6,1}, D_{2,1}, D_{4,1}, D_{6,1}, D_{3,2}, D_{4,2}, D_{6,2}, O_1` (indices
`0`–`31`, `G⁰ = U(1)_2`); `E_1, …, E_6, J(E_1), …, J(E_6)` (`32`–`41`, `G⁰ = SU(2)_2`);
`F, F_a, F_c, F_{ab}, F_{ac}, F_{a,b}, F_{ab,c}, F_{a,b,c}` (`42`–`49`, `G⁰ = U(1) × U(1)`);
`G_{1,3}, N(G_{1,3})` (`50`–`51`); `G_{3,3}, N(G_{3,3})` (`52`–`53`); `USp(4)` (`54`), followed by `Z(U(2))` and its normalizer (`55`, `56`). The
generators are the quaternions `ζ_n = quatZeta n`, `j = J`, `ω` of `2T` and `ζ_4 = (1 + i)/√2`
of `2O ∖ 2T` through `zEmbed`, the scalars `e^{πi/n}`, `J`, and `a = blockProd 1 1 (J, 1)`,
`b = blockProd 1 1 (1, J)`, `c = zEmbed J` (FKRS §§3.4–3.6 in the pinned coordinates). -/
def degree4Gens : Fin 57 → Subgroup (U 4) × List (U 4) :=
  let ζ : ℕ → U 4 := fun n => zEmbed (quatZeta n)
  let j : U 4 := zEmbed J
  let ω : U 4 := zEmbed quatOmega
  let a : U 4 := blockProd 1 1 (J, 1)
  let b : U 4 := blockProd 1 1 (1, J)
  let c : U 4 := zEmbed J
  let F : Subgroup (U 4) := ((u1Diag 1).prod (u1Diag 1)).map (blockProd 1 1)
  let G13 : Subgroup (U 4) := ((u1Diag 1).prod (USp 2)).map (blockProd 1 1)
  let G33 : Subgroup (U 4) := ((USp 2).prod (USp 2)).map (blockProd 1 1)
  ![(u1Diag 2, []), (u1Diag 2, [ζ 2]), (u1Diag 2, [ζ 3]), (u1Diag 2, [ζ 4]), (u1Diag 2, [ζ 6]),
    (u1Diag 2, [ζ 2, j]), (u1Diag 2, [ζ 3, j]), (u1Diag 2, [ζ 4, j]), (u1Diag 2, [ζ 6, j]),
    (u1Diag 2, [ζ 2, j, ω]), (u1Diag 2, [ζ 2, j, ω, ζ 4]),
    (u1Diag 2, [Jfour]), (u1Diag 2, [ζ 2, Jfour]), (u1Diag 2, [ζ 3, Jfour]),
    (u1Diag 2, [ζ 4, Jfour]), (u1Diag 2, [ζ 6, Jfour]),
    (u1Diag 2, [ζ 2, j, Jfour]), (u1Diag 2, [ζ 3, j, Jfour]), (u1Diag 2, [ζ 4, j, Jfour]),
    (u1Diag 2, [ζ 6, j, Jfour]),
    (u1Diag 2, [ζ 2, j, ω, Jfour]), (u1Diag 2, [ζ 2, j, ω, ζ 4, Jfour]),
    (u1Diag 2, [Jfour * ζ 2]), (u1Diag 2, [Jfour * ζ 4]), (u1Diag 2, [Jfour * ζ 6]),
    (u1Diag 2, [Jfour * ζ 2, j]), (u1Diag 2, [Jfour * ζ 4, j]), (u1Diag 2, [Jfour * ζ 6, j]),
    (u1Diag 2, [ζ 3, Jfour * j]), (u1Diag 2, [ζ 4, Jfour * j]), (u1Diag 2, [ζ 6, Jfour * j]),
    (u1Diag 2, [ζ 2, j, ω, Jfour * ζ 4]),
    (fkrsSU2, [scalarZ 1]), (fkrsSU2, [scalarZ 2]), (fkrsSU2, [scalarZ 3]), (fkrsSU2, [scalarZ 4]),
    (fkrsSU2, [scalarZ 6]),
    (fkrsSU2, [scalarZ 1, Jfour]), (fkrsSU2, [scalarZ 2, Jfour]), (fkrsSU2, [scalarZ 3, Jfour]),
    (fkrsSU2, [scalarZ 4, Jfour]), (fkrsSU2, [scalarZ 6, Jfour]),
    (F, []), (F, [a]), (F, [c]), (F, [a * b]), (F, [a * c]), (F, [a, b]), (F, [a * b, c]),
    (F, [a, b, c]),
    (G13, []), (G13, [a]),
    (G33, []), (G33, [Jfour]),
    (USp 4, []), ((unitaryDiagHom 2).range, []), ((unitaryDiagHom 2).range, [Jfour])]

/-- **The fifty-seven groups** `degree4Group i = ⟨G⁰, S⟩` extending the list of FKRS Table 8
by `Z(U(2))` and its normalizer (`README.md`, Layer 6, 6.3). -/
def degree4Group (i : Fin 57) : ClosedSubgroup (U 4) :=
  generatedClosed (degree4Gens i).1 (degree4Gens i).2

/-- Each of the fifty-seven satisfies the axioms for `weightOne 2`: self-dual by construction,
the Hodge condition through `G⁰`, rationality by the component engine (`README.md`, Layer 6,
6.7). -/
theorem isSatoTateGroup_degree4Group (i : Fin 57) :
    IsSatoTateGroup (HodgeNumbers.weightOne 2) (degree4Group i) := sorry

/-- **The classification in degree `4`** for the all-circles Hodge predicate: a closed subgroup of `U(4)` satisfying
the Sato–Tate axioms for `weightOne 2` is conjugate in `USp(4)` to one of the fifty-seven
(`README.md`, Layer 6, 6.6). -/
theorem degree4_classification (G : ClosedSubgroup (U 4))
    (hG : IsSatoTateGroup (HodgeNumbers.weightOne 2) G) :
    ∃ i : Fin 57, IsConjIn (USp 4) G.toSubgroup (degree4Group i).toSubgroup := sorry

/-- **Distinctness**: no two of the fifty-seven are conjugate in `U(4)`, the tuple of real
dimension, number of components, `z`-counts and `E[a_2]` separating them (`README.md`, Layer 6,
6.8). -/
theorem degree4_pairwise_not_conj (i j : Fin 57) (hij : i ≠ j) :
    ¬ IsConjIn ⊤ (degree4Group i).toSubgroup (degree4Group j).toSubgroup := sorry

/-! ## Layer 7: finiteness and the connected groups of degree `6`

Jordan's theorem (7.1) is consumed from `FiniteGroupInvariants` 10.5. -/

/-- **Finiteness**: for fixed Hodge numbers, finitely many conjugacy classes of groups satisfy the
axioms (`README.md`, Layer 7, 7.2). -/
theorem finite_satoTateGroups {w : ℕ} (H : HodgeNumbers w d) :
    ∃ L : Finset (ClosedSubgroup (U d)), ∀ G : ClosedSubgroup (U d), IsSatoTateGroup H G →
      ∃ G' ∈ L, IsConjIn ⊤ G.toSubgroup G'.toSubgroup := sorry

/-- The sixteen connected groups of degree `6` extending FKS Table 9, in the pinned coordinates and the
order of `README.md`, Layer 4, 4.7: `U(1)_3`, `SU(2)_3`, `U(1) × U(1)_2`, `SU(2) × U(1)_2`,
`U(1) × SU(2)_2`, `SU(2) × SU(2)_2`, `U(1)³`, `U(1)² × SU(2)`, `U(1) × SU(2)²`, `SU(2)³`,
`U(1) × USp(4)`, `SU(2) × USp(4)`, `U(3)`, `USp(6)`, and the two block products
`U(2) × U(1)`, `U(2) × SU(2)`. The last two are required by the all-circles predicate.  -/
def degree6Connected : Fin 16 → Subgroup (U 6) :=
  ![u1Diag 3, su2Diag 3,
    ((u1Diag 1).prod (u1Diag 2)).map (blockProd 1 2),
    ((USp 2).prod (u1Diag 2)).map (blockProd 1 2),
    ((u1Diag 1).prod (su2Diag 2)).map (blockProd 1 2),
    ((USp 2).prod (su2Diag 2)).map (blockProd 1 2),
    ((u1Diag 1).prod (((u1Diag 1).prod (u1Diag 1)).map (blockProd 1 1))).map (blockProd 1 2),
    ((u1Diag 1).prod (((u1Diag 1).prod (USp 2)).map (blockProd 1 1))).map (blockProd 1 2),
    ((u1Diag 1).prod (((USp 2).prod (USp 2)).map (blockProd 1 1))).map (blockProd 1 2),
    ((USp 2).prod (((USp 2).prod (USp 2)).map (blockProd 1 1))).map (blockProd 1 2),
    ((u1Diag 1).prod (USp 4)).map (blockProd 1 2),
    ((USp 2).prod (USp 4)).map (blockProd 1 2),
    (unitaryDiagHom 3).range,
    USp 6,
    (((unitaryDiagHom 2).range).prod (u1Diag 1)).map (blockProd 2 1),
    (((unitaryDiagHom 2).range).prod (USp 2)).map (blockProd 2 1)]

/-- The identity component of a closed subgroup of `USp(6)` satisfying the weight-one Hodge
condition and the Lefschetz condition is one of the sixteen; rationality is not assumed
(`README.md`, Layer 7, 7.3). -/
theorem degree6_identityComponent (G : ClosedSubgroup (U 6)) (hS : IsSelfDual 1 G)
    (hH : HodgeCondition (HodgeNumbers.weightOne 3) G.toSubgroup) (hL : IsLefschetz G) :
    ∃ i : Fin 16, IsConjIn (USp 6) ((identityComponent G.toSubgroup).map G.toSubgroup.subtype)
      (degree6Connected i) := sorry

/-! ## Layer 8: endomorphism algebras and Galois endomorphism types -/

section Arithmetic

open TauCeti.AlgebraicGeometry

variable {k : Type u} [Field k] [CharZero k]

/-- The geometric endomorphism ring `End(A_k̄)` (`README.md`, Layer 8, 8.1). -/
abbrev geomEnd {k : Type u} [Field k] [CharZero k] (A : AbelianVariety k) : Type u :=
  AbelianVariety.End (A.baseChange (AlgebraicClosure k))

/-- The real geometric endomorphism algebra `End(A_k̄) ⊗ ℝ`, the LMFDB's `real_geom_end_alg`
(`README.md`, Layer 8, 8.1). -/
abbrev realGeomEnd {k : Type u} [Field k] [CharZero k] (A : AbelianVariety k) := ℝ ⊗[ℤ] geomEnd A

/-- An abelian surface has one of the six real types, and `ℍ` does not occur
(`README.md`, Layer 8, 8.4). -/
theorem realGeomEnd_surface (A : AbelianVariety k) (hA : A.dim = 2) :
    Nonempty (realGeomEnd A ≃ₐ[ℝ] ℝ) ∨ Nonempty (realGeomEnd A ≃ₐ[ℝ] ℝ × ℝ) ∨
      Nonempty (realGeomEnd A ≃ₐ[ℝ] ℂ × ℝ) ∨ Nonempty (realGeomEnd A ≃ₐ[ℝ] ℂ × ℂ) ∨
      Nonempty (realGeomEnd A ≃ₐ[ℝ] Matrix (Fin 2) (Fin 2) ℝ) ∨
      Nonempty (realGeomEnd A ≃ₐ[ℝ] Matrix (Fin 2) (Fin 2) ℂ) := sorry

end Arithmetic

/-! ## Layer 10: equidistribution -/

/-- The semicircle law on eigenangles, `(2/π) sin²θ dθ` on `[0, π]` (`README.md`, Layer 4, 4.4). -/
def semicircleAngle : Measure ℝ :=
  (volume.restrict (Set.Icc (0 : ℝ) Real.pi)).withDensity fun θ =>
    ENNReal.ofReal (2 / Real.pi * Real.sin θ ^ 2)

/-- The semicircle law has total mass one, the `n = 0` case of the 4.4 integral
`(2/π) ∫_0^π (2 cos θ)^{2n} sin²θ dθ = catalan n` (`README.md`, Layer 4, 4.4). -/
theorem isProbabilityMeasure_semicircleAngle : IsProbabilityMeasure semicircleAngle := sorry

/-- The Weyl criterion for `SU(2)` through Tau Ceti's Chebyshev characters: eigenangles are
equidistributed for the semicircle law iff the Cesàro means of every `U_m(cos θ)`, `m ≥ 1`,
tend to `0` (`README.md`, Layer 10, 10.1). -/
theorem tendsto_empiricalMeasure_semicircleAngle_iff (θ : ℕ → ℝ)
    (hθ : ∀ n, θ n ∈ Set.Icc 0 Real.pi) :
    Tendsto (TauCeti.Probability.empiricalMeasure θ) atTop
        (𝓝 ⟨semicircleAngle, isProbabilityMeasure_semicircleAngle⟩) ↔
      ∀ m : ℕ, 1 ≤ m → Tendsto (fun N : ℕ => (N : ℝ)⁻¹ *
        ∑ n ∈ Finset.range N, (Polynomial.Chebyshev.U ℝ (m : ℤ)).eval (Real.cos (θ n))) atTop
        (𝓝 0) := sorry

/-- The quotient topology on conjugacy classes (`README.md`, Layer 1, 1.5). -/
instance instTopologicalSpaceConjClasses (G : Type*) [Group G] [TopologicalSpace G] :
    TopologicalSpace (ConjClasses G) :=
  inferInstanceAs (TopologicalSpace (Quotient _))

/-- Conjugacy classes carry the Borel sigma-algebra of the quotient topology (README 1.5). -/
instance instMeasurableSpaceConjClasses (G : Type*) [Group G] [TopologicalSpace G] :
    MeasurableSpace (ConjClasses G) := borel _

/-- The conjugacy-class measurable space is Borel (README 1.5). -/
instance instBorelSpaceConjClasses (G : Type*) [Group G] [TopologicalSpace G] :
    BorelSpace (ConjClasses G) := ⟨rfl⟩

/-- The pushforward of Haar measure to conjugacy classes, as a probability measure
(`README.md`, Layer 1, 1.5). -/
def conjLaw (G : ClosedSubgroup (U d)) : ProbabilityMeasure (ConjClasses G.toSubgroup) :=
  ProbabilityMeasure.map ⟨haar G, inferInstance⟩ ConjClasses.mk

section Equidistribution

open IsDedekindDomain NumberField

variable {k : Type*} [Field k] [NumberField k]

/-- **Hecke equidistribution**: the ideal values of a unitary Hecke character whose
nonzero powers are never pure imaginary norm characters are Haar-equidistributed on the
circle, after any finite set containing the conductor primes is deleted (README 10.4).
The ideal representatives are required to have precisely the indicated underlying prime. -/
theorem hecke_equidistribution (χ : TauCeti.GlobalNumberFields.HeckeCharacter k)
    (hunit : ∀ c, ‖(χ c : ℂ)‖ = 1)
    (hpower : ∀ a : ℤ, a ≠ 0 → ∀ t : ℝ,
      χ ^ a ≠ TauCeti.GlobalNumberFields.HeckeCharacter.normCharacter k t)
    (S : Finset (HeightOneSpectrum (𝓞 k)))
    (hS : ∀ 𝔭 : HeightOneSpectrum (𝓞 k), χ.finiteConductor ≤ 𝔭.asIdeal → 𝔭 ∈ S)
    (I : {𝔭 : HeightOneSpectrum (𝓞 k) // 𝔭 ∉ S} →
      TauCeti.GlobalNumberFields.idealsPrimeTo
        ⟨χ.finiteConductor, χ.finiteConductor_ne_bot, ∅⟩)
    (hI : ∀ 𝔭, (((I 𝔭 : (FractionalIdeal (𝓞 k)⁰ k)ˣ) :
      FractionalIdeal (𝓞 k)⁰ k)) = 𝔭.1.asIdeal)
    (e : ℕ ≃ {𝔭 : HeightOneSpectrum (𝓞 k) // 𝔭 ∉ S})
    (he : Monotone fun n => Ideal.absNorm (e n).1.asIdeal) :
    Tendsto (TauCeti.Probability.empiricalMeasure fun n => (χ.idealCharacter (I (e n)) : ℂ))
      atTop (𝓝 (ProbabilityMeasure.map ⟨TauCeti.haarProb Circle, inferInstance⟩
        fun z : Circle => (z : ℂ))) := sorry

/-- `𝔭` is a prime of good reduction of the Weierstrass curve `W` over `k`: the minimal model of
`W` over the completion `k_𝔭` has good reduction, Mathlib's `WeierstrassCurve.HasGoodReduction`
(`README.md`, Layer 9, 9.6). -/
def HasGoodReductionAt (W : WeierstrassCurve k) (𝔭 : HeightOneSpectrum (𝓞 k)) : Prop :=
  ((W.baseChange (𝔭.adicCompletion k)).minimal (𝔭.adicCompletionIntegers k)).HasGoodReduction
    (𝔭.adicCompletionIntegers k)

/-- The normalized Frobenius trace `a_𝔭 / √q` of `W` at `𝔭`, with `q` the residue cardinality and
`a_𝔭 = q + 1 − #W̃(𝔽_𝔭)` read off Mathlib's local polynomial `1 − a_𝔭 T + q T²` of the minimal
model over `k_𝔭` (`README.md`, Layer 9, 9.6). -/
def normalizedTrace (W : WeierstrassCurve k) (𝔭 : HeightOneSpectrum (𝓞 k)) : ℝ :=
  -((((W.baseChange (𝔭.adicCompletion k)).localPolynomial (𝔭.adicCompletionIntegers k)).coeff 1 :
    ℤ) : ℝ) / Real.sqrt (Nat.card (IsLocalRing.ResidueField (𝔭.adicCompletionIntegers k)))

/-- The arcsine law on `[−2, 2]`, the trace law of `U(1)`: the image of Mathlib's
`betaMeasure (1/2) (1/2)` (StandardDistributions §10.20's arcsine law on `[0, 1]`) under
`y ↦ 4y − 2`; its density is `dz / (π √(4 − z²))` (`README.md`, Layer 4, 4.4). -/
def arcsineLaw : Measure ℝ :=
  (ProbabilityTheory.betaMeasure (1 / 2) (1 / 2)).map fun y => 4 * y - 2

/-- The arcsine law is a probability measure: the image of a probability measure
(`README.md`, Layer 4, 4.4). -/
instance isProbabilityMeasure_arcsineLaw : IsProbabilityMeasure arcsineLaw := by
  have := ProbabilityTheory.isProbabilityMeasureBeta (α := (1 / 2 : ℝ)) (β := (1 / 2 : ℝ))
    (by norm_num) (by norm_num)
  unfold arcsineLaw
  infer_instance

/-- The trace law `½ δ_0 + ½ arcsine` of `N(U(1))` (`README.md`, Layer 5, 5.4). -/
def nu1TraceLaw : ProbabilityMeasure ℝ :=
  ⟨(2⁻¹ : ℝ≥0∞) • Measure.dirac 0 + (2⁻¹ : ℝ≥0∞) • arcsineLaw, by
    simp [isProbabilityMeasure_iff, isProbabilityMeasure_arcsineLaw.measure_univ,
      ENNReal.inv_two_add_inv_two]⟩

/-- **Sato–Tate for CM elliptic curves over a field containing the CM field** (`README.md`, Layer
10, 10.5): if the endomorphism ring of the elliptic curve `W` over the number field `k` itself is
larger than `ℤ` (its complex multiplication is defined over `k`, so `k` contains the CM field),
then the normalized Frobenius traces at the primes of good reduction, enumerated with
nondecreasing norm, are equidistributed for the arcsine law, the trace law of `ST(W) = U(1)`. -/
theorem satoTate_cm_of_endomorphisms_over_base [DecidableEq k] (W : WeierstrassCurve k)
    [W.IsElliptic]
    (hCM : ¬ Function.Surjective (Int.castRingHom (TauCeti.Isogeny.Hom W.toAffine W.toAffine)))
    (e : ℕ ≃ {𝔭 : HeightOneSpectrum (𝓞 k) // HasGoodReductionAt W 𝔭})
    (he : Monotone fun n => Ideal.absNorm (e n).1.asIdeal) :
    Tendsto (TauCeti.Probability.empiricalMeasure fun n => normalizedTrace W (e n).1) atTop
      (𝓝 ⟨arcsineLaw, isProbabilityMeasure_arcsineLaw⟩) := sorry

/-- **Sato–Tate for CM elliptic curves over a field not containing the CM field** (`README.md`,
Layer 10, 10.6): if `W` over `k` has only the endomorphisms `ℤ` over `k` but complex
multiplication over `k̄`, then the normalized Frobenius traces at the primes of good reduction,
enumerated with nondecreasing norm, are equidistributed for `½ δ_0 + ½ arcsine`, the trace law of
`ST(W) = N(U(1))`: the inert primes of the CM field contribute the trace `0`. -/
theorem satoTate_cm_of_endomorphisms_not_over_base [DecidableEq k]
    [DecidableEq (AlgebraicClosure k)] (W : WeierstrassCurve k) [W.IsElliptic]
    (hk : Function.Surjective (Int.castRingHom (TauCeti.Isogeny.Hom W.toAffine W.toAffine)))
    (hCM : ¬ Function.Surjective (Int.castRingHom (TauCeti.Isogeny.Hom
      (W.baseChange (AlgebraicClosure k)).toAffine (W.baseChange (AlgebraicClosure k)).toAffine)))
    (e : ℕ ≃ {𝔭 : HeightOneSpectrum (𝓞 k) // HasGoodReductionAt W 𝔭})
    (he : Monotone fun n => Ideal.absNorm (e n).1.asIdeal) :
    Tendsto (TauCeti.Probability.empiricalMeasure fun n => normalizedTrace W (e n).1) atTop
      (𝓝 nu1TraceLaw) := sorry

end Equidistribution

end TauCetiRoadmap.SatoTateGroups

end
