import Mathlib
import TauCeti.RepresentationTheory.Compact.Haar
import TauCeti.Topology.Algebra.UnitaryGroup
import TauCeti.Topology.Algebra.OrthogonalGroup
import TauCeti.Topology.Algebra.Group.Connected
import TauCeti.Analysis.Matrix.UnitaryGroup.Torus
import TauCeti.RepresentationTheory.SU2.Weyl.Basic
import TauCeti.RepresentationTheory.SU2.Weyl.Integration
import TauCeti.RepresentationTheory.SU2.TorusConjugacy
import TauCeti.AlgebraicGeometry.AbelianVariety.End.BaseChange
import TauCeti.Probability.Process.EmpiricalMeasure

/-!
# Sato–Tate groups: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive specification is
`README.md`. This file states only what can be stated over Mathlib and the pinned Tau Ceti: the
carrier, the ambient groups, the coefficient map, the identity component and its Haar measure,
the Fité–Kedlaya–Rotger–Sutherland axioms, the moments and event probabilities, the
Weyl-integration engine, the degree-`2` classification, the connected groups of degrees `4` and
`6` with the identity-component theorems, the endomorphism algebras and the Galois endomorphism
type as a structure, and the Weyl criterion with the law on conjugacy classes. The other targets
— the computed record of a group (3.6), the fifty-five groups of degree `4` with their stored
data and lattice (6.3, 6.6–6.9), the degree-`6` list and certificate (7.4), the Galois action on
geometric endomorphisms, the endomorphism field, the classifiers of the endomorphism types and
the Galois endomorphism type of a variety (8.1–8.2, 8.4–8.5, 8.7), the Sato–Tate group of an
abelian variety and everything of Layer 9, the ordering of primes and the Sato–Tate conjecture
(10.3, 10.5–10.6) — are specified, with their definitions and Checks, in `README.md` only.
Discharging every declaration here would finish neither a layer nor the roadmap. `sorry` is
permitted in proofs in this human-owned repository: these are targets, not implementations.

The carrier is a **closed subgroup of `U(d) = Matrix.unitaryGroup (Fin d) ℂ`**, Mathlib's
`ClosedSubgroup (U d)`, with the Borel σ-algebra declared once for every subgroup of `U d` and
the Haar probability measure `TauCeti.haarProb` of Tau Ceti's compact-group library. Being a
Sato–Tate group is the predicate `IsSatoTateGroup H G`, the conjunction of the three axioms
`IsSelfDual`, `HodgeCondition` and `IsRational`; every statistic is defined for every closed
subgroup, and the LMFDB's irrational groups (`mu n`, `nu1Mu n`) are first-class elements of the
carrier that fail an axiom.

Conventions visible in the signatures (`README.md`, *Pinned conventions*): the symplectic form
is `Ω d = [[0, I], [−I, 0]]` and `USp d = {g | gᵀ Ω g = Ω}`; `coeff g i` is the coefficient of
`T^i` in `Matrix.charpolyRev g = det (1 − T g)`, so `coeff g 1 = −trace g`; moments are Bochner
integrals against `haar G`, event probabilities are `Measure.real`; the component measure of a
coset is `c • (haar G).restrict coset` with `c` the number of components; Hodge numbers are a
function `Fin (w+1) → ℕ`; the torus of `USp(2g)` is `diag(u, ū)` through `uSpTorusHom`; the
block embedding `blockProd` interlaces the coordinates `(x, x', y, y')`; equidistribution of `x : ℕ → X` for `μ : ProbabilityMeasure X` is
`Tendsto (TauCeti.Probability.empiricalMeasure x) atTop (𝓝 μ)`, the defining formula of
`AsympEquidistributed` (ProbabilisticAndMetricNumberTheory §2.1), with no second predicate
declared here, and `conjLaw G` is a `ProbabilityMeasure` for that reason. Jordan's theorem (7.1)
is `FiniteGroupInvariants` 10.5 and is not restated.

Every proof below is `sorry` except the bridge checks, which are real proof terms so that the
elaborator verifies the instance lists the README promises: the compactness of a closed subgroup
of `U d` and the probability-measure and invariance instances of its Haar measure (0.1);
`coeff g 1 = −trace g` from `Matrix.coeff_charpolyRev_eq_neg_trace` (0.4); torus conjugacy in
`U d` from `TauCeti.exists_conj_mem_unitaryTorus` (0.5); an open subgroup contains the identity
component, from `Subgroup.connectedComponentOfOne_le_of_isOpen` (1.2); the normalizer of the
torus of `SU(2)`, torus conjugacy in `SU(2)` and the Weyl integration formula for `SU(2)`, from
`TauCeti.SU2` (4.4, 5.1, 5.3); the subgroup laws of `USp d` and `Od d`, `USp 2 = SU(2)` and
the identification `uSpTwoEquivSU2`, the torus homomorphism `uSpTorusHom`, the embeddings
`blockProd`, `su2DiagHom` and `unitaryDiagHom`, the quarter turn `J`, the Hodge-number
constructors `weightOne`, `artin` and `newform`, and the scalar closure of the Lie algebra, which
are proved outright. The remaining proof obligations inside definitions are named theorems:
closure of the Lie algebra under addition (`exp_smul_add_mem`) and closedness of `u1`, `nu1`,
`nu1Mu n`, `mu n` and block products.
-/

open Matrix MeasureTheory Polynomial Topology Filter
open scoped ENNReal TensorProduct Kronecker

universe u

noncomputable section

namespace TauCetiRoadmap.SatoTateGroups

/-! ## Layer 0: ambient groups and the coefficient map -/

/-- The ambient unitary group `U(d)` (`README.md`, Layer 0, 0.1). -/
abbrev U (d : ℕ) : Type := Matrix.unitaryGroup (Fin d) ℂ

variable {d : ℕ}

/-- Every subgroup of `U(d)` carries the Borel σ-algebra (`README.md`, Layer 0, 0.1). -/
instance instMeasurableSpaceSubgroup (G : Subgroup (U d)) : MeasurableSpace G := borel G

instance instBorelSpaceSubgroup (G : Subgroup (U d)) : BorelSpace G := ⟨rfl⟩

/-- A closed subgroup of the compact group `U(d)` is compact (`README.md`, Layer 0, 0.1);
bridge check: `IsClosed.isCompact` and `isCompact_iff_compactSpace`. -/
instance instCompactSpaceClosedSubgroup (G : ClosedSubgroup (U d)) : CompactSpace G.toSubgroup :=
  isCompact_iff_compactSpace.mp G.isClosed'.isCompact

/-- The Haar probability measure of a closed subgroup of `U(d)`, Tau Ceti's `haarProb`
(`README.md`, Layer 0, 0.1). -/
abbrev haar (G : ClosedSubgroup (U d)) : Measure G.toSubgroup := TauCeti.haarProb G.toSubgroup

/-- Bridge check (0.1): the Haar measure is a probability measure, by Tau Ceti's instance. -/
example (G : ClosedSubgroup (U d)) : IsProbabilityMeasure (haar G) := inferInstance

/-- Bridge check (0.1): `haar G` is left-invariant, right-invariant and inversion-invariant. -/
example (G : ClosedSubgroup (U d)) :
    (haar G).IsMulLeftInvariant ∧ (haar G).IsMulRightInvariant ∧ (haar G).IsInvInvariant :=
  ⟨inferInstance, inferInstance, inferInstance⟩

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

/-- Membership in `USp d` is the pinned matrix identity (`README.md`, Layer 0, 0.2). -/
theorem mem_USp_iff {g : U d} :
    g ∈ USp d ↔ (g : Matrix (Fin d) (Fin d) ℂ)ᵀ * Ω d * g = Ω d := Iff.rfl

/-- `USp d` is closed in `U(d)` (`README.md`, Layer 0, 0.2). -/
theorem isClosed_USp (d : ℕ) : IsClosed (USp d : Set (U d)) := sorry

/-- `USp d` as a closed subgroup (`README.md`, Layer 0, 0.2). -/
def uSpClosed (d : ℕ) : ClosedSubgroup (U d) where
  toSubgroup := USp d
  isClosed' := isClosed_USp d

/-- Elements of `USp d` have determinant `1` (`README.md`, Layer 0, 0.2). -/
theorem det_eq_one_of_mem_USp {g : U d} (hg : g ∈ USp d) :
    (g : Matrix (Fin d) (Fin d) ℂ).det = 1 := sorry

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

/-- `Od d` is the image of Mathlib's `Matrix.orthogonalGroup (Fin d) ℝ` under entrywise
`Complex.ofReal` (`README.md`, Layer 0, 0.3). -/
theorem mem_Od_iff_exists_orthogonal (g : U d) :
    g ∈ Od d ↔ ∃ O : Matrix.orthogonalGroup (Fin d) ℝ,
      (g : Matrix (Fin d) (Fin d) ℂ) = (O : Matrix (Fin d) (Fin d) ℝ).map Complex.ofReal := sorry

/-- The ambient group of a weight: `USp d` in odd weight, `Od d` in even weight
(`README.md`, Layer 0, 0.3). -/
def ambient (w d : ℕ) : Subgroup (U d) := if Odd w then USp d else Od d

/-- `a_i(g)`, the coefficient of `T^i` in the reversed characteristic polynomial `det (1 − T g)`
(`README.md`, Layer 0, 0.4). -/
def coeff (g : U d) (i : ℕ) : ℂ := ((g : Matrix (Fin d) (Fin d) ℂ).charpolyRev).coeff i

/-- The trace random variable `t = tr g` (`README.md`, Layer 0, 0.4). -/
def trace (g : U d) : ℂ := Matrix.trace (g : Matrix (Fin d) (Fin d) ℂ)

/-- Bridge check (0.4): `a_1 = −tr`, Mathlib's `Matrix.coeff_charpolyRev_eq_neg_trace`. -/
theorem coeff_one_eq_neg_trace (g : U d) : coeff g 1 = -trace g :=
  Matrix.coeff_charpolyRev_eq_neg_trace _

/-- `a_0 = 1` (`README.md`, Layer 0, 0.4). -/
theorem coeff_zero (g : U d) : coeff g 0 = 1 := sorry

/-- `a_i = 0` beyond the degree (`README.md`, Layer 0, 0.4). -/
theorem coeff_eq_zero_of_lt (g : U d) {i : ℕ} (hi : d < i) : coeff g i = 0 := sorry

/-- `a_d = (−1)^d det g` (`README.md`, Layer 0, 0.4). -/
theorem coeff_degree (g : U d) : coeff g d = (-1) ^ d * (g : Matrix (Fin d) (Fin d) ℂ).det := sorry

/-- Each `a_i` is continuous on `U(d)` (`README.md`, Layer 0, 0.4). -/
theorem continuous_coeff (i : ℕ) : Continuous fun g : U d => coeff g i := sorry

/-- Each `a_i` is a class function (`README.md`, Layer 0, 0.4). -/
theorem coeff_conj (g h : U d) (i : ℕ) : coeff (h * g * h⁻¹) i = coeff g i := sorry

/-- On `USp d` the coefficients are real (`README.md`, Layer 0, 0.4). -/
theorem coeff_im_eq_zero_of_mem_USp {g : U d} (hg : g ∈ USp d) (i : ℕ) : (coeff g i).im = 0 :=
  sorry

/-- On `USp d` the coefficient sequence is palindromic (`README.md`, Layer 0, 0.4). -/
theorem coeff_sub_of_mem_USp {g : U d} (hg : g ∈ USp d) {i : ℕ} (hi : i ≤ d) :
    coeff g (d - i) = coeff g i := sorry

/-- On `Od d` the reversed polynomial is `(−1)^d det g` times itself (`README.md`, Layer 0, 0.4). -/
theorem charpolyRev_reverse_of_mem_Od {g : U d} (hg : g ∈ Od d) :
    ((g : Matrix (Fin d) (Fin d) ℂ).charpolyRev).reverse =
      ((-1) ^ d * (g : Matrix (Fin d) (Fin d) ℂ).det) • (g : Matrix (Fin d) (Fin d) ℂ).charpolyRev :=
  sorry

/-- The coefficient vector `(a_0, …, a_d)` (`README.md`, Layer 0, 0.4). -/
def coeffVec (g : U d) : Fin (d + 1) → ℂ := fun i => coeff g i

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

/-- The torus lies in `USp(2g)` (`README.md`, Layer 0, 0.5). -/
theorem uSpTorus_le_USp (g : ℕ) : uSpTorus g ≤ USp (2 * g) := sorry

/-- Bridge check (0.5): unitary diagonalization, Tau Ceti's `exists_conj_mem_unitaryTorus`. -/
example (x : U d) : ∃ u : U d, u * x * u⁻¹ ∈ TauCeti.unitaryTorus (Fin d) :=
  TauCeti.exists_conj_mem_unitaryTorus x

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

/-- Bridge check (1.2): an open subgroup contains the identity component, Tau Ceti's
`Subgroup.connectedComponentOfOne_le_of_isOpen`. -/
example (G : Subgroup (U d)) (H : Subgroup G) (hH : IsOpen (H : Set G)) :
    identityComponent G ≤ H :=
  Subgroup.connectedComponentOfOne_le_of_isOpen hH

/-- `{X | ∀ t, exp (t X) ∈ G}` is closed under addition: the Lie–Trotter formula of the
closed-subgroup theorem, consumed from LieGroups Layer 2 (`README.md`, Layer 1, 1.3). For a
non-closed `G` it holds because the subgroup generated by the two one-parameter subgroups is
path-connected, hence an analytic subgroup (Yamabe). -/
theorem exp_smul_add_mem (G : Subgroup (U d)) {X Y : Matrix (Fin d) (Fin d) ℂ}
    (hX : ∀ t : ℝ, ∃ h : NormedSpace.exp (t • X) ∈ Matrix.unitaryGroup (Fin d) ℂ,
      (⟨_, h⟩ : U d) ∈ G)
    (hY : ∀ t : ℝ, ∃ h : NormedSpace.exp (t • Y) ∈ Matrix.unitaryGroup (Fin d) ℂ,
      (⟨_, h⟩ : U d) ∈ G) (t : ℝ) :
    ∃ h : NormedSpace.exp (t • (X + Y)) ∈ Matrix.unitaryGroup (Fin d) ℂ, (⟨_, h⟩ : U d) ∈ G :=
  sorry

/-- The Lie algebra `{X | ∀ t, exp (t X) ∈ G}` of a subgroup of `U(d)`; closure under addition
is `exp_smul_add_mem` (`README.md`, Layer 1, 1.3). -/
def lieAlgebra (G : Subgroup (U d)) : Submodule ℝ (Matrix (Fin d) (Fin d) ℂ) where
  carrier := {X | ∀ t : ℝ, ∃ h : NormedSpace.exp (t • X) ∈ Matrix.unitaryGroup (Fin d) ℂ,
    (⟨_, h⟩ : U d) ∈ G}
  zero_mem' := fun t => by
    simp only [smul_zero, NormedSpace.exp_zero]
    exact ⟨one_mem _, G.one_mem⟩
  add_mem' := fun hX hY t => exp_smul_add_mem G hX hY t
  smul_mem' := fun c X hX t => by simpa [smul_smul] using hX (t * c)

/-- The real dimension `dim_ℝ Lie(G)` (`README.md`, Layer 1, 1.3). -/
def realDimension (G : Subgroup (U d)) : ℕ := Module.finrank ℝ (lieAlgebra G)

/-- `dim USp(2g) = g(2g+1)` (`README.md`, Layer 1, 1.3). -/
theorem realDimension_USp (g : ℕ) : realDimension (USp (2 * g)) = g * (2 * g + 1) := sorry

/-- `dim O(d) = d(d−1)/2` (`README.md`, Layer 1, 1.3). -/
theorem realDimension_Od (d : ℕ) : realDimension (Od d) = d * (d - 1) / 2 := sorry

/-- The Lie algebra sees only the identity component (`README.md`, Layer 1, 1.3). -/
theorem lieAlgebra_identityComponent (G : ClosedSubgroup (U d)) :
    lieAlgebra ((identityComponent G.toSubgroup).map G.toSubgroup.subtype) =
      lieAlgebra G.toSubgroup := sorry

/-- A closed subgroup has real dimension `0` iff it is finite (`README.md`, Layer 1, 1.3). -/
theorem realDimension_eq_zero_iff (G : ClosedSubgroup (U d)) :
    realDimension G.toSubgroup = 0 ↔ Finite G.toSubgroup := sorry

/-- The coset of `G` indexed by a component (`README.md`, Layer 1, 1.4). -/
def componentCoset (G : Subgroup (U d)) (H : componentGroup G) : Set G :=
  {g | (QuotientGroup.mk g : componentGroup G) = H}

/-- The component measure `μ_H = c • (haar G)|_{C_H}` (`README.md`, Layer 1, 1.4). -/
def componentMeasure (G : ClosedSubgroup (U d)) (H : componentGroup G.toSubgroup) :
    Measure G.toSubgroup :=
  (numComponents G.toSubgroup : ℝ≥0∞) • (haar G).restrict (componentCoset G.toSubgroup H)

/-- `μ_H` is a probability measure on its coset (`README.md`, Layer 1, 1.4). -/
theorem componentMeasure_coset (G : ClosedSubgroup (U d)) (H : componentGroup G.toSubgroup) :
    componentMeasure G H (componentCoset G.toSubgroup H) = 1 := sorry

/-- Haar measure is the average of the component measures (`README.md`, Layer 1, 1.4). -/
theorem haar_eq_sum_componentMeasure (G : ClosedSubgroup (U d))
    [Fintype (componentGroup G.toSubgroup)] :
    haar G = (numComponents G.toSubgroup : ℝ≥0∞)⁻¹ •
      ∑ H : componentGroup G.toSubgroup, componentMeasure G H := sorry

/-- The coefficient law, the pushforward of Haar measure to coefficient vectors — the LMFDB's
"pushforward of Haar measure to characteristic polynomials" (`README.md`, Layer 1, 1.5). -/
def coeffLaw (G : ClosedSubgroup (U d)) : Measure (Fin (d + 1) → ℂ) :=
  (haar G).map fun g : G.toSubgroup => coeffVec (g : U d)

/-- The trace law (`README.md`, Layer 1, 1.5). -/
def traceLaw (G : ClosedSubgroup (U d)) : Measure ℂ :=
  (haar G).map fun g : G.toSubgroup => trace (g : U d)

/-- The coefficient law is a probability measure (`README.md`, Layer 1, 1.5). -/
theorem isProbabilityMeasure_coeffLaw (G : ClosedSubgroup (U d)) :
    IsProbabilityMeasure (coeffLaw G) := sorry

/-- The trace law is the image of the coefficient law under `a ↦ −a_1`
(`README.md`, Layer 1, 1.5). -/
theorem traceLaw_eq_map_coeffLaw (G : ClosedSubgroup (U d)) :
    traceLaw G = (coeffLaw G).map fun a => -a 1 := sorry

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

/-- The weight-`0` Hodge numbers `h^{0,0} = d` of an Artin motive (`README.md`, Layer 2, 2.1). -/
def artin (d : ℕ) : HodgeNumbers 0 d where
  h := fun _ => d
  sum_eq := by simp
  symm := fun hw => absurd hw (by decide)

/-- The Hodge numbers `(1, 0, …, 0, 1)` of a newform of weight `k ≥ 2`, in weight `k − 1`
(`README.md`, Layer 2, 2.1). -/
def newform (k : ℕ) (hk : 2 ≤ k) : HodgeNumbers (k - 1) 2 where
  h := fun p => if (p : ℕ) = 0 ∨ (p : ℕ) = k - 1 then 1 else 0
  sum_eq := by
    rw [Finset.sum_boole]
    have hne : (0 : Fin (k - 1 + 1)) ≠ Fin.last (k - 1) := by
      simp only [ne_eq, Fin.ext_iff, Fin.val_zero, Fin.val_last]
      omega
    have hs : (Finset.univ.filter fun p : Fin (k - 1 + 1) => (p : ℕ) = 0 ∨ (p : ℕ) = k - 1) =
        {0, Fin.last (k - 1)} := by
      ext p
      simp only [Finset.mem_filter, Finset.mem_univ, true_and, Finset.mem_insert,
        Finset.mem_singleton, Fin.ext_iff, Fin.val_zero, Fin.val_last]
    rw [hs, Finset.card_pair hne]
    rfl
  symm := by
    intro _ p
    have := p.isLt
    simp only [Fin.val_rev]
    split_ifs <;> first | rfl | omega

/-- In odd weight the degree is even (`README.md`, Layer 2, 2.1). -/
theorem even_degree {w d : ℕ} (H : HodgeNumbers w d) (hw : Odd w) : Even d := sorry

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
trivial homomorphism is a Hodge circle and finite groups pass, as `mu n` does for `artin 1`
(`README.md`, Layer 2, 2.2). -/
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

/-- The moment sequence of `a_i`, `m ↦ E[a_i^m]` (`README.md`, Layer 3, 3.1). -/
def aMoment (G : ClosedSubgroup (U d)) (i : Fin (d + 1)) (m : ℕ) : ℂ :=
  coeffMoment G (Pi.single i m)

/-- The trace moment `E[t^m]` (`README.md`, Layer 3, 3.1). -/
def traceMoment (G : ClosedSubgroup (U d)) (m : ℕ) : ℂ := ∫ g, trace (g : U d) ^ m ∂haar G

/-- Every mixed moment is an integer (`README.md`, Layer 3, 3.1). -/
theorem exists_int_coeffMoment (G : ClosedSubgroup (U d)) (n : Fin (d + 1) → ℕ) :
    ∃ z : ℤ, coeffMoment G n = z := sorry

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

/-- The trace zero density `Pr[t = 0]` (`README.md`, Layer 3, 3.4). -/
def traceZeroDensity (G : ClosedSubgroup (U d)) : ℝ := (haar G).real {g | trace (g : U d) = 0}

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

/-- The LMFDB row of a group minus the label, name, generators, lattice and histogram
(`README.md`, Layer 3, 3.6). -/
structure STRecord where
  weight : ℕ
  degree : ℕ
  realDimension : ℕ
  components : ℕ
  rational : Bool
  traceZeroDensity : ℚ
  /-- The trace-moment row `E[t^m]`, `m = 0, …, 12`. -/
  traceMoments : List ℤ
  /-- The `a_2` moments `E[a_2^m]`, `m = 0, …, 6`. -/
  a2Moments : List ℤ
  /-- The `a_3` moments, empty below degree `6`. -/
  a3Moments : List ℤ
  /-- For each `i`, the pairs `(x, Pr[a_i = x])` with nonzero probability. -/
  counts : List (ℕ × List (ℤ × ℚ))
  /-- `z_1` and the `z_{2,n}` of the component-counting theorem. -/
  zVector : List ℕ
  characterDiagonal : List ℤ

/-- Generators: a finite set `S ⊆ G` with `⟨G⁰, S⟩ = G` (`README.md`, Pinned conventions). -/
def IsGeneratingSet (G : Subgroup (U d)) (S : Finset (U d)) : Prop :=
  (S : Set (U d)) ⊆ G ∧ (identityComponent G).map G.subtype ⊔ Subgroup.closure (S : Set (U d)) = G

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

/-- Bridge check (4.4): the `g = 1` case is Tau Ceti's `SU2.weyl_integration_formula`, with the
same constant `(2π)⁻¹ · 4 sin²θ`. -/
example (f : TauCeti.SU2 → ℂ) (hf : Continuous f)
    (hconj : ∀ u g : TauCeti.SU2, f (u * g * u⁻¹) = f g) :
    ∫ g, f g ∂TauCeti.haarProb TauCeti.SU2 = (1 / (2 * Real.pi) : ℂ) *
      ∫ θ in (0 : ℝ)..Real.pi, f (TauCeti.SU2.torusExp θ) * ((4 * Real.sin θ ^ 2 : ℝ) : ℂ) :=
  TauCeti.SU2.weyl_integration_formula hf hconj

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
pinned form `Ω` (`README.md`, Pinned conventions). -/
def finTwoMulEquiv (g : ℕ) : Fin (2 * g) ≃ Fin g ⊕ Fin g :=
  (finCongr (two_mul g)).trans finSumFinEquiv.symm

/-- The interlacing `(x, y) ⊕ (x', y') ↦ (x, x', y, y')` of the pinned block embedding
(`README.md`, Pinned conventions). -/
def interlaceEquiv (g₁ g₂ : ℕ) : Fin (2 * g₁) ⊕ Fin (2 * g₂) ≃ Fin (2 * (g₁ + g₂)) :=
  ((Equiv.sumCongr (finTwoMulEquiv g₁) (finTwoMulEquiv g₂)).trans
    ((Equiv.sumSumSumComm _ _ _ _).trans
      (Equiv.sumCongr finSumFinEquiv finSumFinEquiv))).trans (finTwoMulEquiv (g₁ + g₂)).symm

/-- The pinned block embedding `USp(2g₁) × USp(2g₂) → USp(2(g₁+g₂))` by interlacing coordinates
(`README.md`, Layer 4, 4.3; Pinned conventions). -/
def blockProd (g₁ g₂ : ℕ) : U (2 * g₁) × U (2 * g₂) →* U (2 * (g₁ + g₂)) :=
  blockDiagHom (interlaceEquiv g₁ g₂)

/-- The block product preserves `Ω` (`README.md`, Layer 4, 4.3). -/
theorem blockProd_mem_USp (g₁ g₂ : ℕ) (x : U (2 * g₁) × U (2 * g₂)) (h₁ : x.1 ∈ USp (2 * g₁))
    (h₂ : x.2 ∈ USp (2 * g₂)) : blockProd g₁ g₂ x ∈ USp (2 * (g₁ + g₂)) := sorry

/-- The characteristic polynomial of a block product is the product of the factors'
(`README.md`, Layer 4, 4.3). -/
theorem charpolyRev_blockProd (g₁ g₂ : ℕ) (x : U (2 * g₁) × U (2 * g₂)) :
    ((blockProd g₁ g₂ x : U (2 * (g₁ + g₂))) :
        Matrix (Fin (2 * (g₁ + g₂))) (Fin (2 * (g₁ + g₂))) ℂ).charpolyRev =
      (x.1 : Matrix (Fin (2 * g₁)) (Fin (2 * g₁)) ℂ).charpolyRev *
        (x.2 : Matrix (Fin (2 * g₂)) (Fin (2 * g₂)) ℂ).charpolyRev := sorry

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

/-- On a diagonal copy the reversed polynomial is the `g`-th power (`README.md`, Layer 4, 4.3). -/
theorem charpolyRev_su2DiagHom (g : ℕ) (x : TauCeti.SU2) :
    ((su2DiagHom g x : U (2 * g)) : Matrix (Fin (2 * g)) (Fin (2 * g)) ℂ).charpolyRev =
      ((x : Matrix (Fin 2) (Fin 2) ℂ).charpolyRev) ^ g := sorry

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

/-- `b_{2n} = C(2n, n)` and `c_{2n} = catalan n` (`README.md`, Layer 4, 4.4). -/
theorem bSeq_two_mul (n : ℕ) : bSeq (2 * n) = Nat.centralBinom n ∧ cSeq (2 * n) = catalan n := sorry

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

/-- `dim USp(4) = 10` (`README.md`, Layer 4, 4.5). -/
theorem realDimension_uSp4 : realDimension (USp 4) = 10 := sorry

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

/-- Bridge check (5.1): the normalizer of the torus of `SU(2)` is generated by the torus and the
quarter turn, Tau Ceti's `SU2.normalizer_torus`. -/
example : Subgroup.normalizer (TauCeti.SU2.torus : Set TauCeti.SU2) =
    TauCeti.SU2.torus ⊔ Subgroup.zpowers TauCeti.SU2.weylElement :=
  TauCeti.SU2.normalizer_torus

/-- Bridge check (5.3): every element of `SU(2)` is conjugate into the torus, Tau Ceti's
`SU2.exists_conj_mem_torus`. -/
example (g : TauCeti.SU2) : ∃ u : TauCeti.SU2, u * g * u⁻¹ ∈ TauCeti.SU2.torus :=
  TauCeti.SU2.exists_conj_mem_torus g

/-- The component counts `1, 2, 1` and real dimensions `1, 1, 3` (`README.md`, Layer 5, 5.1). -/
theorem degree2_invariants :
    numComponents u1.toSubgroup = 1 ∧ numComponents nu1.toSubgroup = 2 ∧
      numComponents su2.toSubgroup = 1 ∧ realDimension u1.toSubgroup = 1 ∧
      realDimension nu1.toSubgroup = 1 ∧ realDimension su2.toSubgroup = 3 := sorry

/-- The three groups are Sato–Tate groups for `weightOne 1` (`README.md`, Layer 5, 5.2). -/
theorem isSatoTateGroup_degree2 :
    IsSatoTateGroup (HodgeNumbers.weightOne 1) u1 ∧ IsSatoTateGroup (HodgeNumbers.weightOne 1) nu1 ∧
      IsSatoTateGroup (HodgeNumbers.weightOne 1) su2 := sorry

/-- Conjugacy of subgroups of `U(d)` by an element of a given subgroup `S`
(`README.md`, Pinned conventions). -/
def IsConjIn (S : Subgroup (U d)) (G₁ G₂ : Subgroup (U d)) : Prop :=
  ∃ s ∈ S, G₁.map (MulAut.conj s).toMonoidHom = G₂

/-- **The classification in degree `2`**: a closed subgroup of `SU(2)` with the Hodge condition
is conjugate to `U(1)`, `N(U(1))` or `SU(2)`; rationality plays no role
(`README.md`, Layer 5, 5.3). -/
theorem degree2_classification (G : ClosedSubgroup (U 2)) (h1 : IsSelfDual 1 G)
    (h2 : HodgeCondition (HodgeNumbers.weightOne 1) G.toSubgroup) :
    IsConjIn (USp 2) G.toSubgroup u1.toSubgroup ∨ IsConjIn (USp 2) G.toSubgroup nu1.toSubgroup ∨
      IsConjIn (USp 2) G.toSubgroup su2.toSubgroup := sorry

/-- The semicircle moments `E[t^{2n}] = catalan n` of `SU(2)`, odd moments `0`
(`README.md`, Layer 4, 4.4; Layer 5, 5.4). -/
theorem traceMoment_su2 (n : ℕ) :
    traceMoment su2 (2 * n) = catalan n ∧ traceMoment su2 (2 * n + 1) = 0 := sorry

/-- The arcsine moments `E[t^{2n}] = C(2n, n)` of `U(1)`, odd moments `0`
(`README.md`, Layer 4, 4.4; Layer 5, 5.4). -/
theorem traceMoment_u1 (n : ℕ) :
    traceMoment u1 (2 * n) = Nat.centralBinom n ∧ traceMoment u1 (2 * n + 1) = 0 := sorry

/-- The `N(U(1))` moments are half the `U(1)` moments for `m ≥ 1` (`README.md`, Layer 5, 5.4). -/
theorem traceMoment_nu1 (n : ℕ) (hn : 1 ≤ n) :
    traceMoment nu1 (2 * n) = (Nat.centralBinom n : ℂ) / 2 ∧ traceMoment nu1 (2 * n + 1) = 0 :=
  sorry

/-- Trace zero densities `0, 0, 1/2` (`README.md`, Layer 5, 5.4). -/
theorem traceZeroDensity_degree2 :
    traceZeroDensity su2 = 0 ∧ traceZeroDensity u1 = 0 ∧ traceZeroDensity nu1 = 1 / 2 := sorry

/-- The point `e^{2πi/n}` of the circle (`README.md`, Layer 5, 5.5). -/
def zetaCircle (n : ℕ) : Circle := Circle.exp (2 * Real.pi / n)

/-- The diagonal matrix `diag(a, b) ∈ U(2)` (`README.md`, Layer 5, 5.5). -/
def diagU (a b : Circle) : U 2 := TauCeti.unitaryTorusHom (Fin 2) ![a, b]

/-- `⟨U(1), J, diag(1, ζ_n)⟩` is closed, a finite union of cosets of `U(1)`
(`README.md`, Layer 5, 5.5). -/
theorem isClosed_nu1Mu (n : ℕ) :
    IsClosed ((u1Diag 1 ⊔ Subgroup.zpowers J ⊔ Subgroup.zpowers (diagU 1 (zetaCircle n)) :
      Subgroup (U 2)) : Set (U 2)) := sorry

/-- `U(1)[D_n] = ⟨U(1), J, diag(1, ζ_n)⟩` (the LMFDB's name), the Sato–Tate group of a CM newform
with nebentypus of order `n` when `χ_F ∉ ⟨χ⟩`; `nu1Mu 1 = nu1`. Its component group is abelian,
`C_n × C_2`, not dihedral (`README.md`, Layer 5, 5.5). -/
def nu1Mu (n : ℕ) : ClosedSubgroup (U 2) where
  toSubgroup := u1Diag 1 ⊔ Subgroup.zpowers J ⊔ Subgroup.zpowers (diagU 1 (zetaCircle n))
  isClosed' := isClosed_nu1Mu n

/-- `nu1Mu 1 = nu1` (`README.md`, Layer 5, 5.5). -/
theorem nu1Mu_one : (nu1Mu 1).toSubgroup = nu1.toSubgroup := sorry

/-- `U(1)[D_n]` has `2n` components, is rational iff `n ≤ 2`, is self-dual iff the weight is odd
and `n = 1` (in even weight it never lies in `Od 2`, though `nu1Mu 1` is `U(2)`-conjugate to it),
and has trace zero density `1/2` (`README.md`, Layer 5, 5.5). -/
theorem nu1Mu_invariants (n : ℕ) (hn : 1 ≤ n) (w : ℕ) :
    numComponents (nu1Mu n).toSubgroup = 2 * n ∧ (IsRational (nu1Mu n) ↔ n ≤ 2) ∧
      (IsSelfDual w (nu1Mu n) ↔ Odd w ∧ n = 1) ∧ traceZeroDensity (nu1Mu n) = 1 / 2 := sorry

/-- The component group of `U(1)[D_n]` is abelian: `J` and `diag(1, ζ_n)` commute modulo `U(1)`,
since `J diag(1, ζ_n) J⁻¹ = diag(1, ζ_n) · diag(ζ_n, ζ̄_n)` (`README.md`, Layer 5, 5.5). -/
theorem isMulCommutative_componentGroup_nu1Mu (n : ℕ) :
    IsMulCommutative (componentGroup (nu1Mu n).toSubgroup) := sorry

/-- The group generated by `e^{2πi/n}` is finite, hence closed (`README.md`, Layer 5, 5.6). -/
theorem isClosed_mu (n : ℕ) :
    IsClosed ((Subgroup.zpowers (TauCeti.unitaryTorusHom (Fin 1) fun _ => zetaCircle n) :
      Subgroup (U 1)) : Set (U 1)) := sorry

/-- `μ(n) ≤ U(1)`, the `n`-th roots of unity (`README.md`, Layer 5, 5.6). -/
def mu (n : ℕ) : ClosedSubgroup (U 1) where
  toSubgroup := Subgroup.zpowers (TauCeti.unitaryTorusHom (Fin 1) fun _ => zetaCircle n)
  isClosed' := isClosed_mu n

/-- `μ(n)` satisfies the Hodge condition for `artin 1`, is self-dual in weight `0` iff `n ≤ 2`, and
is rational iff `n ≤ 2`; for `n > 2` it is an LMFDB "irrational" group (`README.md`, Layer 5,
5.6). -/
theorem mu_invariants (n : ℕ) (hn : 1 ≤ n) :
    HodgeCondition (HodgeNumbers.artin 1) (mu n).toSubgroup ∧ (IsSelfDual 0 (mu n) ↔ n ≤ 2) ∧
      (IsRational (mu n) ↔ n ≤ 2) ∧ numComponents (mu n).toSubgroup = n := sorry

/-! ## Layer 6: degree `4` -/

/-- The six connected groups of degree `4` in the pinned coordinates: `U(1)_2`, `SU(2)_2`,
`U(1)×U(1)`, `U(1)×SU(2)`, `SU(2)×SU(2)`, `USp(4)` (`README.md`, Layer 4, 4.6). -/
def degree4Connected : Fin 6 → Subgroup (U 4) :=
  ![u1Diag 2, su2Diag 2, ((u1Diag 1).prod (u1Diag 1)).map (blockProd 1 1),
    ((u1Diag 1).prod (USp 2)).map (blockProd 1 1), ((USp 2).prod (USp 2)).map (blockProd 1 1),
    USp 4]

/-- Their real dimensions `1, 3, 2, 4, 6, 10` (`README.md`, Layer 4, 4.6). -/
theorem realDimension_degree4Connected (i : Fin 6) :
    realDimension (degree4Connected i) = ![1, 3, 2, 4, 6, 10] i := sorry

/-- The identity component of a self-dual group with the Hodge condition in degree `4` is
conjugate to one of the six (`README.md`, Layer 6, 6.4). -/
theorem degree4_identityComponent (G : ClosedSubgroup (U 4))
    (hG : HodgeCondition (HodgeNumbers.weightOne 2) G.toSubgroup) (hS : IsSelfDual 1 G) :
    ∃ i : Fin 6, IsConjIn (USp 4) ((identityComponent G.toSubgroup).map G.toSubgroup.subtype)
      (degree4Connected i) := sorry

/-- The real-place condition: an element `γ` with `γ² = −1`, `tr γ = 0`, inverting a Hodge circle
(`README.md`, Layer 6, 6.10). -/
def HasRealPlaceCondition {w : ℕ} (H : HodgeNumbers w d) (G : Subgroup (U d)) : Prop :=
  ∃ (θ : ContinuousMonoidHom Circle G) (γ : G), IsHodgeCircle H G θ ∧
    ((γ : U d) : Matrix (Fin d) (Fin d) ℂ) ^ 2 = -1 ∧ trace (γ : U d) = 0 ∧
    ∀ u, γ * θ u * γ⁻¹ = θ u⁻¹

/-! ## Layer 7: finiteness and the connected groups of degree `6`

Jordan's theorem (7.1) is consumed from `FiniteGroupInvariants` 10.5. -/

/-- **Finiteness**: for fixed Hodge numbers, finitely many conjugacy classes of groups satisfy the
axioms (`README.md`, Layer 7, 7.2). -/
theorem finite_satoTateGroups {w : ℕ} (H : HodgeNumbers w d) :
    ∃ L : Finset (ClosedSubgroup (U d)), ∀ G : ClosedSubgroup (U d), IsSatoTateGroup H G →
      ∃ G' ∈ L, IsConjIn ⊤ G.toSubgroup G'.toSubgroup := sorry

/-- The fourteen connected groups of degree `6` of FKS Table 9, in the pinned coordinates and the
order of `README.md`, Layer 4, 4.7: `U(1)_3`, `SU(2)_3`, `U(1) × U(1)_2`, `SU(2) × U(1)_2`,
`U(1) × SU(2)_2`, `SU(2) × SU(2)_2`, `U(1)³`, `U(1)² × SU(2)`, `U(1) × SU(2)²`, `SU(2)³`,
`U(1) × USp(4)`, `SU(2) × USp(4)`, `U(3)`, `USp(6)`. -/
def degree6Connected : Fin 14 → Subgroup (U 6) :=
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
    USp 6]

/-- Their real dimensions `1, 3, 2, 4, 4, 6, 3, 5, 7, 9, 11, 13, 9, 21` (`README.md`, Layer 4, 4.7). -/
theorem realDimension_degree6Connected (i : Fin 14) :
    realDimension (degree6Connected i) = ![1, 3, 2, 4, 4, 6, 3, 5, 7, 9, 11, 13, 9, 21] i := sorry

/-- The identity component of a Lefschetz Sato–Tate group of degree `6` is one of the fourteen
(`README.md`, Layer 7, 7.3). -/
theorem degree6_identityComponent (G : ClosedSubgroup (U 6))
    (hG : IsSatoTateGroup (HodgeNumbers.weightOne 3) G) (hL : IsLefschetz G) :
    ∃ i : Fin 14, IsConjIn (USp 6) ((identityComponent G.toSubgroup).map G.toSubgroup.subtype)
      (degree6Connected i) := sorry

/-! ## Layer 8: endomorphism algebras and Galois endomorphism types -/

section Arithmetic

open TauCeti.AlgebraicGeometry

variable {k : Type u} [Field k] [CharZero k]

/-- The rational endomorphism algebra `End⁰ A = ℚ ⊗ End A`, the LMFDB's `end_alg`
(`README.md`, Layer 8, 8.1). -/
abbrev End₀ (A : AbelianVariety k) := ℚ ⊗[ℤ] AbelianVariety.End A

/-- The geometric endomorphism ring `End(A_k̄)` (`README.md`, Layer 8, 8.1). -/
abbrev geomEnd (A : AbelianVariety k) : Type u :=
  AbelianVariety.End (A.baseChange (AlgebraicClosure k))

/-- `End⁰(A_k̄)`, the LMFDB's `geom_end_alg` (`README.md`, Layer 8, 8.1). -/
abbrev geomEnd₀ (A : AbelianVariety k) := ℚ ⊗[ℤ] geomEnd A

/-- The real geometric endomorphism algebra `End(A_k̄) ⊗ ℝ`, the LMFDB's `real_geom_end_alg`
(`README.md`, Layer 8, 8.1). -/
abbrev realGeomEnd (A : AbelianVariety k) := ℝ ⊗[ℤ] geomEnd A

/-- The six real geometric endomorphism algebras of an abelian surface, named by the LMFDB's
`real_geom_end_alg` strings (`README.md`, Layer 8, 8.4). -/
inductive RealEndTypeSurface
  | M2C | M2R | CxC | CxR | RxR | R
  deriving DecidableEq

/-- An abelian surface has one of the six real types, and `ℍ` does not occur
(`README.md`, Layer 8, 8.4). -/
theorem realGeomEnd_surface (A : AbelianVariety k) (hA : A.dim = 2) :
    Nonempty (realGeomEnd A ≃ₐ[ℝ] ℝ) ∨ Nonempty (realGeomEnd A ≃ₐ[ℝ] ℝ × ℝ) ∨
      Nonempty (realGeomEnd A ≃ₐ[ℝ] ℂ × ℝ) ∨ Nonempty (realGeomEnd A ≃ₐ[ℝ] ℂ × ℂ) ∨
      Nonempty (realGeomEnd A ≃ₐ[ℝ] Matrix (Fin 2) (Fin 2) ℝ) ∨
      Nonempty (realGeomEnd A ≃ₐ[ℝ] Matrix (Fin 2) (Fin 2) ℂ) := sorry

/-- The nine geometric endomorphism algebras of an abelian surface, the knowl `g2c.geom_end_alg`
(`README.md`, Layer 8, 8.5). -/
inductive GeomEndAlgSurface
  | Q | RM | CM | QM | QxQ | CMxQ | CMxCM | M2Q | M2CM
  deriving DecidableEq

/-- The five endomorphism algebras of an abelian surface over `ℚ`, the knowl `g2c.end_alg`
(`README.md`, Layer 8, 8.5). -/
inductive EndAlgSurfaceQ
  | Q | RM | CM | QxQ | M2Q
  deriving DecidableEq

/-- A Galois endomorphism type: a finite group acting on a finite-dimensional real algebra
(`README.md`, Layer 8, 8.7). -/
structure GaloisEndType where
  /-- The group. -/
  Γ : Type u
  [grp : Group Γ]
  [fin : Finite Γ]
  /-- The algebra. -/
  E : Type u
  [ring : Ring E]
  [alg : Algebra ℝ E]
  [fd : FiniteDimensional ℝ E]
  /-- The action. -/
  act : Γ →* (E ≃ₐ[ℝ] E)

attribute [instance] GaloisEndType.grp GaloisEndType.fin GaloisEndType.ring GaloisEndType.alg
  GaloisEndType.fd

/-- Non-vacuity: the type `[C_1, ℝ]` of a non-CM elliptic curve (`README.md`, Layer 8, 8.7). -/
example : GaloisEndType.{0} where
  Γ := Unit
  E := ℝ
  act := 1

/-- Isomorphism of Galois endomorphism types: a group isomorphism with an equivariant algebra
isomorphism (`README.md`, Layer 8, 8.7). -/
def GaloisEndType.IsIsomorphic (T₁ T₂ : GaloisEndType.{u}) : Prop :=
  ∃ (e : T₁.Γ ≃* T₂.Γ) (φ : T₁.E ≃ₐ[ℝ] T₂.E), ∀ γ x, φ (T₁.act γ x) = T₂.act (e γ) (φ x)

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

instance instMeasurableSpaceConjClasses (G : Type*) [Group G] [TopologicalSpace G] :
    MeasurableSpace (ConjClasses G) := borel _

instance instBorelSpaceConjClasses (G : Type*) [Group G] [TopologicalSpace G] :
    BorelSpace (ConjClasses G) := ⟨rfl⟩

/-- The pushforward of Haar measure to conjugacy classes, as a probability measure
(`README.md`, Layer 1, 1.5). -/
def conjLaw (G : ClosedSubgroup (U d)) : ProbabilityMeasure (ConjClasses G.toSubgroup) :=
  ProbabilityMeasure.map ⟨haar G, inferInstance⟩ ConjClasses.mk

end TauCetiRoadmap.SatoTateGroups

end
