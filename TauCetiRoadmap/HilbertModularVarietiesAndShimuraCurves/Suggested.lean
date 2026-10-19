import Mathlib
import TauCeti.NumberTheory.NumberField.TotallyPositive

/-!
# HilbertModularVarietiesAndShimuraCurves: representative target signatures

The roadmap is `README.md`. This file records the definitions and theorem signatures that can be
stated against the pinned Mathlib and Tau Ceti; it is not exhaustive. Every definition has a real
body, and the theorems are the layer milestones whose carriers exist at the pins.

Design choices made explicit here:
* the polarization lattice `L_c` is a submodule of `F × F` built from Mathlib's fractional ideals
  and `FractionalIdeal.dual`, with no generator of `c` chosen;
* the trace forms are a family indexed by the parameter `a`, rational-valued on `F × F`, with
  integrality on `L_c` a theorem;
* the unit-square quotients `Δ(M)` are quotients of an arbitrary subgroup `P` of the integer units,
  specialized to Tau Ceti's totally positive integer units;
* the full-level action is `α ↦ α ∘ adj(γ)`, a left action because adjugation reverses products;
* the Taylor–Wiles diamond factor is the quotient by `N`-torsion, not by `N`-th powers;
* the residual Hecke ideal specializes the shared universal anemic Hecke presentation of
  AutomorphicFormsOnReductiveGroups §§5.8, 7.3; descent to an acting quotient is a theorem
  under an explicit relation hypothesis.

The Hilbert and quaternionic moduli spaces, their integral models, formal Drinfeld spaces,
adelic quaternionic form spaces and their étale cohomological Galois realizations need carriers
beyond those at the pins; their theorems are README targets. In particular,
the Hilbert quotient-stack/free-locus torsors, coefficient extension groups and finite-level
Kodaira–Spencer determinant descent are specified in the README, not by stand-in propositions here.
-/

open scoped NumberField nonZeroDivisors

namespace TauCetiRoadmap.HilbertModularVarietiesAndShimuraCurves

/-! ## Layer H0: integral Hilbert data and trace lattices -/

section Lattices

variable (F : Type*) [Field F] [NumberField F]

/-- Fractional ideals of the ring of integers of `F`. -/
abbrev HilbertFractionalIdeal := FractionalIdeal (𝓞 F)⁰ F

/-- The trace dual `𝔡⁻¹` of `𝓞 F`, as Mathlib's `FractionalIdeal.dual`. -/
noncomputable abbrev inverseDifferent : HilbertFractionalIdeal F :=
  FractionalIdeal.dual ℤ ℚ (1 : HilbertFractionalIdeal F)

/-- The polarization lattice `L_c = O ⊕ c⁻¹𝔡⁻¹ ⊂ F × F`, in the row convention.
No generator of `c` is chosen, so the definition applies to nonprincipal `c`. -/
noncomputable def polarizationLattice (c : HilbertFractionalIdeal F) :
    Submodule (𝓞 F) (F × F) :=
  ((1 : HilbertFractionalIdeal F) : Submodule (𝓞 F) F).prod
    ((c⁻¹ * inverseDifferent F : HilbertFractionalIdeal F) : Submodule (𝓞 F) F)

/-- `L_c` is projective of rank two over `O` and free of rank `2g` over `ℤ`. -/
theorem polarizationLattice_rank (c : HilbertFractionalIdeal F) (hc : c ≠ 0) :
    Module.Projective (𝓞 F) (polarizationLattice F c) ∧
      Module.Free ℤ (polarizationLattice F c) ∧
      Module.finrank ℤ (polarizationLattice F c) = 2 * Module.finrank ℚ F := by
  sorry

/-- The trace forms `ψ_a(x, y) = Tr_{F/ℚ}(a (x₁ y₂ − x₂ y₁))` on `F × F`. Their restriction
to `L_c` is `ℤ`-valued for `a ∈ c` (`integralTraceFamily_integral`); they form a family
parametrized by `a`, not a single canonical symplectic form. -/
noncomputable def integralTraceFamily (a : F) (x y : F × F) : ℚ :=
  Algebra.trace ℚ F (a * (x.1 * y.2 - x.2 * y.1))

/-- The trace family is alternating for every parameter (H0.4). -/
theorem integralTraceFamily_alternating (a : F) (x : F × F) :
    integralTraceFamily F a x x = 0 := by
  sorry

/-- Integrality on the polarization lattice for parameters in `c`. -/
theorem integralTraceFamily_integral (c : HilbertFractionalIdeal F) (hc : c ≠ 0) (a : F)
    (ha : a ∈ c) (x y : F × F) (hx : x ∈ polarizationLattice F c)
    (hy : y ∈ polarizationLattice F c) :
    ∃ n : ℤ, integralTraceFamily F a x y = n := by
  sorry

/-- The rational trace family is nondegenerate exactly for nonzero parameters (H0.4). -/
theorem integralTraceFamily_nondegenerate (a : F) :
    (∀ x : F × F, (∀ y : F × F, integralTraceFamily F a x y = 0) → x = 0) ↔ a ≠ 0 := by
  sorry

/-- The trace-alternating dual of an `O`-lattice in `F × F`, as a set. -/
def traceAlternatingDual (L : Submodule (𝓞 F) (F × F)) : Set (F × F) :=
  {x | ∀ y ∈ L, ∃ z : ℤ, Algebra.trace ℚ F (x.1 * y.2 - x.2 * y.1) = z}

/-- Layer H0 milestone: the dual of `L_c` for `ψ_{c,1}` is `c ⊕ 𝔡⁻¹ = c L_c`. -/
theorem lattice_duality (c : HilbertFractionalIdeal F) (hc : c ≠ 0) :
    traceAlternatingDual F (polarizationLattice F c) =
      (((c : Submodule (𝓞 F) F).prod
        ((inverseDifferent F : HilbertFractionalIdeal F) : Submodule (𝓞 F) F) :
          Submodule (𝓞 F) (F × F)) : Set (F × F)) := by
  sorry

end Lattices

-- H0.0's C = diag(1, -1) sends the owner's positive trace form to its negative.
example (x y : ℚ × ℚ) :
    integralTraceFamily ℚ 1 (x.1, -x.2) (y.1, -y.2) =
      -integralTraceFamily ℚ 1 x y := by
  unfold integralTraceFamily
  rw [show (1 : ℚ) * (x.1 * -y.2 - -x.2 * y.1) =
    -(1 * (x.1 * y.2 - x.2 * y.1)) by ring, map_neg]

/-! ## Layer H3: polarization quotients and Hilbert Hecke maps -/

section Units

variable (F : Type*) [Field F] [NumberField F]

/-- `U_M`: the units congruent to `1` modulo the ideal `M`. -/
def congruenceUnits (M : Ideal (𝓞 F)) : Subgroup (𝓞 F)ˣ :=
  (Units.map (Ideal.Quotient.mk M).toMonoidHom).ker

/-- Membership in the congruence-unit kernel is the integral congruence (H3.1). -/
theorem mem_congruenceUnits (M : Ideal (𝓞 F)) (u : (𝓞 F)ˣ) :
    u ∈ congruenceUnits F M ↔ (u : 𝓞 F) - 1 ∈ M := by
  sorry

/-- The level ideal `M O` of a natural number `M`. -/
abbrev integerLevelIdeal (M : ℕ) : Ideal (𝓞 F) := Ideal.span {(M : 𝓞 F)}

variable (P : Subgroup (𝓞 F)ˣ)

/-- `S_M ∩ P`: squares of units congruent to `1` modulo `M`, inside a subgroup `P`
(in the Hilbert case `P = U⁺`). Square roots need not lie in `P`. -/
def congruenceUnitSquares (M : ℕ) : Subgroup P :=
  ((congruenceUnits F (integerLevelIdeal F M)).map (powMonoidHom 2)).subgroupOf P

/-- The tame polarization group `Δ(M) = P / S_M`. -/
abbrev TamePolarizationGroup (M : ℕ) := P ⧸ congruenceUnitSquares F P M

/-- The quotient map `P → Δ(M)`. -/
def tameDelta_mk (M : ℕ) : P →* TamePolarizationGroup F P M :=
  QuotientGroup.mk' _

/-- Two units in `P` have the same polarization class exactly when their ratio is a
congruence-unit square (H3.4). -/
theorem tameDelta_eq (M : ℕ) (u v : P) :
    tameDelta_mk F P M u = tameDelta_mk F P M v ↔
      ∃ η : (𝓞 F)ˣ, η ∈ congruenceUnits F (integerLevelIdeal F M) ∧
        (u : (𝓞 F)ˣ) * (v : (𝓞 F)ˣ)⁻¹ = η ^ 2 := by
  sorry

/-- Homomorphisms killing the congruence-unit squares descend uniquely to the polarization
quotient (H3.4). -/
theorem tameDelta_lift (M : ℕ) {J : Type*} [Group J] (f : P →* J)
    (hf : ∀ u ∈ congruenceUnitSquares F P M, f u = 1) :
    ∃! fbar : TamePolarizationGroup F P M →* J, fbar.comp (tameDelta_mk F P M) = f := by
  sorry

/-- Layer H3 milestone: `Δ(M)` is finite for `M ≥ 1`. At `M = 0` it is the whole of `P`.
If `F` has positive unit rank, the full unit group gives an infinite quotient; for a totally
real field of positive unit rank the totally positive unit group does too. -/
theorem tamePolarizationGroup_finite (M : ℕ) (hM : 1 ≤ M) :
    Finite (TamePolarizationGroup F P M) := by
  sorry

/-- The Hilbert case `P = U⁺`, with Tau Ceti's totally positive integer units. -/
abbrev HilbertTamePolarizationGroup (M : ℕ) :=
  TamePolarizationGroup F (NumberField.totallyPositiveIntegerUnits (K := F)) M

/-! ## Layer H4: full levels, effective actions and connected limits -/

/-- `U_{p^n} ∩ P`, the units of the connected unit tower at `p^n`. -/
def connectedCongruenceUnits (p n : ℕ) : Subgroup P :=
  (congruenceUnits F (integerLevelIdeal F (p ^ n))).subgroupOf P

/-- The denominator `S_{p^n N}` inside the connected units. -/
def connectedSquareDenominator (p n N : ℕ) : Subgroup (connectedCongruenceUnits F P p n) :=
  (congruenceUnitSquares F P (p ^ n * N)).comap (connectedCongruenceUnits F P p n).subtype

/-- `Δ_n(N) = (U_{p^n} ∩ P) / S_{p^n N}`. -/
abbrev ConnectedPolarizationGroup (p n N : ℕ) :=
  connectedCongruenceUnits F P p n ⧸ connectedSquareDenominator F P p n N

/-- Equality in the connected polarization quotient is detected by a tame-and-wild
congruence square root (H4.10). -/
theorem connectedDelta_eq (p n N : ℕ) (u v : connectedCongruenceUnits F P p n) :
    (QuotientGroup.mk u : ConnectedPolarizationGroup F P p n N) = QuotientGroup.mk v ↔
      ∃ η : (𝓞 F)ˣ, η ∈ congruenceUnits F (integerLevelIdeal F (p ^ n * N)) ∧
        ((u : P) : (𝓞 F)ˣ) * ((v : P) : (𝓞 F)ˣ)⁻¹ = η ^ 2 := by
  sorry

/-- The residue ring `O / p^n O` of the finite levels. -/
abbrev HilbertResidueRing (p n : ℕ) := (𝓞 F) ⧸ integerLevelIdeal F (p ^ n)

/-- The finite `Γ₀(p^m)` level inside `GL₂(O / p^n)`: lower-left entry divisible by `p^m`. -/
def HilbertFiniteGamma0 (p m n : ℕ) :
    Subgroup (Matrix.GeneralLinearGroup (Fin 2) (HilbertResidueRing F p n)) where
  carrier := {γ | (γ : Matrix (Fin 2) (Fin 2) (HilbertResidueRing F p n)) 1 0 ∈
    Ideal.span {((p ^ m : ℕ) : HilbertResidueRing F p n)}}
  one_mem' := by simp
  mul_mem' := by
    intro a b ha hb
    change (↑(a * b) : Matrix (Fin 2) (Fin 2) (HilbertResidueRing F p n)) 1 0 ∈ Ideal.span {((p ^ m : ℕ) : HilbertResidueRing F p n)}
    change (a : Matrix (Fin 2) (Fin 2) (HilbertResidueRing F p n)) 1 0 ∈ Ideal.span {((p ^ m : ℕ) : HilbertResidueRing F p n)} at ha
    change (b : Matrix (Fin 2) (Fin 2) (HilbertResidueRing F p n)) 1 0 ∈ Ideal.span {((p ^ m : ℕ) : HilbertResidueRing F p n)} at hb
    rw [Matrix.GeneralLinearGroup.coe_mul, Matrix.mul_apply, Fin.sum_univ_two]
    exact Ideal.add_mem _ (Ideal.mul_mem_right _ _ ha) (Ideal.mul_mem_left _ _ hb)
  inv_mem' := by
    intro a ha
    change (↑(a⁻¹) : Matrix (Fin 2) (Fin 2) (HilbertResidueRing F p n)) 1 0 ∈ Ideal.span {((p ^ m : ℕ) : HilbertResidueRing F p n)}
    change (a : Matrix (Fin 2) (Fin 2) (HilbertResidueRing F p n)) 1 0 ∈ Ideal.span {((p ^ m : ℕ) : HilbertResidueRing F p n)} at ha
    rw [Matrix.coe_units_inv, Matrix.inv_def, Matrix.smul_apply, Matrix.adjugate_fin_two]
    simp only [Matrix.of_apply, Matrix.cons_val_one, Matrix.cons_val_zero,
      smul_eq_mul]
    exact Ideal.mul_mem_left _ _ (neg_mem ha)

end Units

/-- A congruent unit square need not be a square of a congruence unit (H3.2). -/
theorem congruenceUnitSquares_missingRoot (F : Type*) [Field F] [NumberField F] (s : 𝓞 F) (hs : s ^ 2 = 2)
    (ε : (𝓞 F)ˣ) (hε : (ε : 𝓞 F) = 1 + s) :
    ε ^ 8 ∈ congruenceUnits F (integerLevelIdeal F 12) ∧
    ε ^ 4 ∉ congruenceUnits F (integerLevelIdeal F 12) ∧
    -(ε ^ 4) ∉ congruenceUnits F (integerLevelIdeal F 12) ∧
    ¬ ∃ η : (𝓞 F)ˣ, η ∈ congruenceUnits F (integerLevelIdeal F 12) ∧ η ^ 2 = ε ^ 8 := by
  sorry

section AdjugateAction

variable {R : Type*} [CommRing R] {M : Type*} [AddCommGroup M] [Module R M]

/-- The full-level action `γ · α = α ∘ adj(γ)` on frames `α : R² → M`. -/
def adjugateFrameAction (γ : Matrix.GeneralLinearGroup (Fin 2) R)
    (α : (Fin 2 → R) →ₗ[R] M) : (Fin 2 → R) →ₗ[R] M :=
  α.comp (Matrix.mulVecLin (Matrix.adjugate (γ : Matrix (Fin 2) (Fin 2) R)))

/-- Adjugation reverses products, so this is a left action. -/
theorem adjugate_level_action (γ δ : Matrix.GeneralLinearGroup (Fin 2) R)
    (α : (Fin 2 → R) →ₗ[R] M) :
    adjugateFrameAction γ (adjugateFrameAction δ α) = adjugateFrameAction (γ * δ) α := by
  sorry

/-- The identity matrix fixes every dual-level frame (H4.4). -/
theorem adjugateFrameAction_one (α : (Fin 2 → R) →ₗ[R] M) :
    adjugateFrameAction 1 α = α := by
  sorry

/-- Scalars act through multiplication by the scalar. -/
theorem adjugateFrameAction_scalar (u : Rˣ) (α : (Fin 2 → R) →ₗ[R] M) :
    adjugateFrameAction (Matrix.GeneralLinearGroup.scalar (Fin 2) u) α = (u : R) • α := by
  sorry

end AdjugateAction

/-! ## Layer R18.5, part 1: local Drinfeld geometry and auxiliary PEL factors -/

section Drinfeld

open scoped LinearAlgebra.Projectivization

/-- The `C`-points `P¹(C) ∖ P¹(K)` of the Drinfeld half-plane `Ω_K`. Only the point set is
typed here; the rigid analytic open and its affinoid exhaustion are README targets. -/
def DrinfeldHalfPlane.points (K C : Type*) [Field K] [Field C] [Algebra K C] :
    Set (ℙ C (Fin 2 → C)) :=
  {x | ∀ (v : Fin 2 → K) (hv : (fun i => algebraMap K C (v i)) ≠ 0),
    x ≠ Projectivization.mk C (fun i => algebraMap K C (v i)) hv}

/-- In the affine chart the points of `Ω_K` are the elements of `C` outside `K`. -/
theorem DrinfeldHalfPlane.affineChart (K C : Type*) [Field K] [Field C] [Algebra K C] (z : C)
    (h : (![z, 1] : Fin 2 → C) ≠ 0) :
    Projectivization.mk C ![z, 1] h ∈ DrinfeldHalfPlane.points K C ↔
      z ∉ Set.range (algebraMap K C) := by
  sorry

/-- The rational point at infinity is excluded from the Drinfeld half-plane (R18.5.1). -/
theorem DrinfeldHalfPlane.infinity (K C : Type*) [Field K] [Field C] [Algebra K C] (h : (![1, 0] : Fin 2 → C) ≠ 0) :
    Projectivization.mk C ![1, 0] h ∉ DrinfeldHalfPlane.points K C := by
  sorry

end Drinfeld

/-- The paired half-height labels `Λ = {(a, b) ∈ ℤ² : 2 ∣ a + b}` of the auxiliary PEL local
factor: neither all of `ℤ²` nor only the diagonal. -/
def PelHeightLattice : AddSubgroup (ℤ × ℤ) where
  carrier := {p | (2 : ℤ) ∣ p.1 + p.2}
  zero_mem' := by
    change (2 : ℤ) ∣ 0 + 0
    omega
  add_mem' := by
    rintro ⟨a, b⟩ ⟨c, d⟩ h₁ h₂
    change (2 : ℤ) ∣ a + b at h₁
    change (2 : ℤ) ∣ c + d at h₂
    change (2 : ℤ) ∣ (a + c) + (b + d)
    omega
  neg_mem' := by
    rintro ⟨a, b⟩ h
    change (2 : ℤ) ∣ a + b at h
    change (2 : ℤ) ∣ -a + -b
    omega

namespace PelHeightLattice

/-- Membership in the PEL height lattice is the parity condition (R18.5.8). -/
theorem mem (p : ℤ × ℤ) : p ∈ PelHeightLattice ↔ (2 : ℤ) ∣ p.1 + p.2 := Iff.rfl

/-- The quaternionic heights embed diagonally. -/
def diagonal (m : ℤ) : ℤ × ℤ := (m, m)

/-- The difference character `(a, b) ↦ (a − b) / 2`, used only on labels in `Λ`. -/
def difference (p : ℤ × ℤ) : ℤ := (p.1 - p.2) / 2

/-- `Λ` modulo the diagonal is one copy of `ℤ`, through the difference character. -/
theorem difference_contract :
    (∀ a b : ℤ × ℤ, a ∈ PelHeightLattice → b ∈ PelHeightLattice →
      difference (a + b) = difference a + difference b) ∧
      Function.Surjective (fun p : {p : ℤ × ℤ // p ∈ PelHeightLattice} => difference p.1) ∧
      (∀ p : ℤ × ℤ, p ∈ PelHeightLattice → (difference p = 0 ↔ p.1 = p.2)) ∧
      (∀ m : ℤ, diagonal m ∈ PelHeightLattice) ∧ Function.Injective diagonal := by
  sorry

-- `PelHeightLattice.oddPair`: an unconstrained pair is not a label.
example : (1, 0) ∉ PelHeightLattice := by
  rw [mem]; decide

-- `PelHeightLattice.oppositePair`: a label off the diagonal, with difference one.
example : (1, -1) ∈ PelHeightLattice ∧ difference (1, -1) = 1 := by
  refine ⟨by rw [mem]; decide, by decide⟩

end PelHeightLattice

/-- Strict separation of vertex charts for an actual group action: every nonidentity element
moves every vertex a distance greater than two. -/
def VeryFreeChartAction (G V : Type*) [Group G] [MulAction G V] (d : V → V → ℕ) : Prop :=
  ∀ g : G, g ≠ 1 → ∀ v : V, 2 < d v (g • v)

namespace VeryFreeChartAction

/-- The integer translation action with displacement `step * n`. -/
abbrev integerTranslationAction (step : ℤ) : MulAction (Multiplicative ℤ) ℤ where
  smul n v := v + step * n.toAdd
  one_smul v := by
    change v + step * (0 : ℤ) = v
    ring
  mul_smul m n v := by
    change v + step * (m.toAdd + n.toAdd) = (v + step * n.toAdd) + step * m.toAdd
    ring

-- `VeryFreeChartAction.translationThree`: translation by three on the integer line.
example : letI := integerTranslationAction 3
    VeryFreeChartAction (Multiplicative ℤ) ℤ (fun v w => (v - w).natAbs) := by
  let := integerTranslationAction 3
  intro g hg v
  have hn : g.toAdd ≠ 0 := hg
  have hpos : 0 < g.toAdd.natAbs := Int.natAbs_pos.mpr hn
  change 2 < (v - (v + 3 * g.toAdd)).natAbs
  rw [show v - (v + 3 * g.toAdd) = -(3 * g.toAdd) by ring]
  simp only [Int.natAbs_neg, Int.natAbs_mul]
  change 2 < 3 * g.toAdd.natAbs
  omega

-- `VeryFreeChartAction.translationTwo`: free on vertices, but charts are not separated.
example : letI := integerTranslationAction 2
    ¬ VeryFreeChartAction (Multiplicative ℤ) ℤ (fun v w => (v - w).natAbs) := by
  let := integerTranslationAction 2
  intro h
  have hmove := h (Multiplicative.ofAdd 1) (by decide) 0
  change 2 < (0 - (0 + 2 * (1 : ℤ))).natAbs at hmove
  norm_num at hmove

end VeryFreeChartAction

/-! ## Layer R18.2, part 2: integral quaternionic models and Hodge comparisons -/

/-- The archimedean norm `‖dz‖ = 2 Im z` of the quaternionic Hodge line at `z ∈ ℍ`. -/
def QuaternionHodgeLine.metric (z : ℂ) : ℝ := 2 * z.im

/-! ## Layer R18.3, part 1: definite forms, transfer and auxiliary levels -/

/-- Inverting a left representation supplies the right coefficient action used by the
fixed-central-character adapter to QuaternionicModularForms. -/
theorem definiteCoefficient_rightAction {O G W : Type*} [CommRing O] [Group G]
    [AddCommGroup W] [Module O W] (τ : Representation O G W) (u v : G) (w : W) :
    τ ((u * v)⁻¹) w = τ (v⁻¹) (τ (u⁻¹) w) := by
  simp only [mul_inv_rev, map_mul, Module.End.mul_apply]

section Weights

/-- `Sym^{k−2}(O²)` as homogeneous polynomials of degree `k − 2` in two variables. -/
abbrev SymWeight (O : Type*) [CommRing O] (k : ℕ) : Submodule O (MvPolynomial (Fin 2) O) :=
  MvPolynomial.homogeneousSubmodule (Fin 2) O (k - 2)

/-- The underlying module of parallel weight `k` over `d` embeddings, `⨂ Sym^{k−2}(O²)`. -/
abbrev QuaternionWeight (O : Type*) [CommRing O] (d k : ℕ) : Type _ :=
  PiTensorProduct O (fun _ : Fin d => SymWeight O k)

/-- The parallel-weight coefficient module has rank `(k − 1)^d` for `k ≥ 2` (R18.3.2). -/
theorem QuaternionWeight.rank (O : Type*) [CommRing O] [Nontrivial O] (d k : ℕ) (hk : 2 ≤ k) :
    Module.finrank O (QuaternionWeight O d k) = (k - 1) ^ d := by
  sorry

end Weights

/-- The value at division valuation `n` of a parity character, once a central-compatible root
`r` with `r² = ψ(Nrd Π)⁻¹` has been chosen. -/
def divisionCharacterValue {R : Type*} [CommRing R] (r : Rˣ) (n : ℤ) : Rˣ := r ^ n

-- `DivisionParityCharacter.scalarUniformiser`: both signs act trivially at even valuation.
example (n : ℤ) : divisionCharacterValue (1 : ℤˣ) (2 * n) = 1 ∧
    divisionCharacterValue (-1 : ℤˣ) (2 * n) = 1 := by
  simp [divisionCharacterValue, zpow_mul]

/-- The `N`-torsion subgroup of a finite abelian diamond factor `Δ′`. -/
def QuaternionTWLevel.torsionSubgroup (Δ' : Type*) [CommGroup Δ'] (N : ℕ) : Subgroup Δ' :=
  (powMonoidHom N : Δ' →* Δ').ker

/-- The diamond factor `Δ′ / Δ′[N]`: the quotient by `N`-torsion, not by `N`-th powers. -/
abbrev QuaternionTWLevel.diamondFactor (Δ' : Type*) [CommGroup Δ'] (N : ℕ) :=
  Δ' ⧸ QuaternionTWLevel.torsionSubgroup Δ' N

/-- The strict exponent inequality forces the diagonal ratio into the squares (written
additively in `ZMod (2^a)`). -/
theorem twDiagonalTorsion_isSquare (a b : ℕ) (h : b < a) :
    ∀ x : ZMod (2 ^ a), (2 ^ b) • x = 0 → ∃ y : ZMod (2 ^ a), y + y = x := by
  sorry

section ResidualKernel

-- V is the good-place index {v ∉ S} in the shared anemic Hecke presentation (R18.3.15).
variable {V O k : Type*} [CommRing O] [Field k]

/-- Residual evaluation on the shared universal anemic Hecke presentation, with good-place
index `V`: `T_v ↦ tr v` and `S_v ↦ q_v⁻¹ det v` in arithmetic Frobenius normalization. -/
noncomputable def residualEvaluation (red : O →+* k) (q : V → kˣ) (tr det : V → k) :
    MvPolynomial (V × Fin 2) O →+* k :=
  MvPolynomial.eval₂Hom red (fun i => if i.2 = 0 then tr i.1 else ((q i.1)⁻¹ : kˣ) * det i.1)

/-- The residual eigen-ideal in the shared polynomial presentation, before descent to the
faithful Hecke image of a quaternionic realization (R18.3.15). -/
noncomputable def ResidualHeckeIdeal (red : O →+* k) (q : V → kˣ) (tr det : V → k) :
    Ideal (MvPolynomial (V × Fin 2) O) :=
  RingHom.ker (residualEvaluation red q tr det)

/-- Surjective coefficient reduction makes the residual evaluation kernel maximal (R18.3.15). -/
theorem ResidualHeckeIdeal.maximal (red : O →+* k) (hred : Function.Surjective red)
    (q : V → kˣ) (tr det : V → k) : (ResidualHeckeIdeal red q tr det).IsMaximal := by
  sorry

/-- The residual eigensystem descends uniquely to an acting quotient of the shared presentation
when its relations lie in the residual eigen-ideal (R18.3.15). -/
theorem ResidualHeckeIdeal.actingFactor (red : O →+* k) (q : V → kˣ) (tr det : V → k)
    (I : Ideal (MvPolynomial (V × Fin 2) O)) (hI : I ≤ ResidualHeckeIdeal red q tr det) :
    ∃! f : (MvPolynomial (V × Fin 2) O ⧸ I) →+* k,
      f.comp (Ideal.Quotient.mk I) = residualEvaluation red q tr det := by
  sorry

end ResidualKernel

/-- The image of integral invariants under a reduction map; it can be smaller than the
residual invariants. -/
noncomputable def liftableResidueImage {O Γ W V : Type*} [CommRing O] [Group Γ]
    [AddCommGroup W] [Module O W] [AddCommGroup V]
    (ρ : Representation O Γ W) (red : W →+ V) : AddSubgroup V :=
  ρ.invariants.toAddSubgroup.map red

/-- A vector is liftable exactly when it is the reduction of an integral invariant (R18.3.23). -/
theorem mem_liftableResidueImage {O Γ W V : Type*} [CommRing O] [Group Γ]
    [AddCommGroup W] [Module O W] [AddCommGroup V]
    (ρ : Representation O Γ W) (red : W →+ V) (v : V) :
    v ∈ liftableResidueImage ρ red ↔ ∃ w : W, w ∈ ρ.invariants ∧ red w = v := by
  sorry

/-- Integral invariants are saturated: division by a nonzero scalar preserves invariance,
giving injective reduction of the invariant lattice (R18.3.23). -/
theorem LiftableReductionImage.reductionInjective {O Γ W : Type*} [CommRing O] [IsDomain O]
    [Group Γ] [AddCommGroup W] [Module O W] [Module.IsTorsionFree O W]
    (ρ : Representation O Γ W) (a : O) (ha : a ≠ 0) (w : ρ.invariants) :
    (∃ y : W, (w : W) = a • y) ↔ ∃ y : ρ.invariants, (w : W) = a • (y : W) := by
  sorry

/-- Averaging lifts every invariant through an equivariant surjection when the finite
stabilizer order is invertible; the liftable image is then all invariants (R18.3.23). -/
theorem LiftableReductionImage.unitIsotropy {O Γ W V : Type*} [CommRing O] [Group Γ]
    [Fintype Γ] [Invertible (Fintype.card Γ : O)]
    [AddCommGroup W] [Module O W] [AddCommGroup V] [Module O V]
    (ρ : Representation O Γ W) (σ : Representation O Γ V) (red : W →ₗ[O] V)
    (hred : Function.Surjective red) (hequiv : ∀ g w, red (ρ g w) = σ g (red w)) :
    ∀ v : V, v ∈ liftableResidueImage ρ red.toAddMonoidHom ↔ v ∈ σ.invariants := by
  sorry

/-- For the trivial/sign representation, only the first residual coordinate has an invariant lift
(R18.3.23). -/
theorem LiftableReductionImage.directSum (ρ : Representation ℤ (Multiplicative (ZMod 2)) (ℤ × ℤ))
    (hρ : ∀ a b : ℤ, ρ (Multiplicative.ofAdd (1 : ZMod 2)) (a, b) = (a, -b)) :
    (∀ v : ZMod 2 × ZMod 2,
      v ∈ liftableResidueImage ρ
        ((Int.castAddHom (ZMod 2)).prodMap (Int.castAddHom (ZMod 2))) ↔ v.2 = 0) ∧
    (∀ v : ZMod 2 × ZMod 2, (v.1, -v.2) = v) := by
  sorry

/-- The cyclic coordinate-permutation representation of C₃ on triples over a commutative ring. -/
def LiftableReductionImage.cyclicPermutation (R : Type*) [CommRing R] :
    Representation R (Multiplicative (ZMod 3)) (ZMod 3 → R) where
  toFun g :=
    { toFun := fun w i => w (i + g.toAdd)
      map_add' := by intros; rfl
      map_smul' := by intros; rfl }
  map_one' := by ext w i; simp
  map_mul' g h := by
    apply LinearMap.ext
    intro w
    funext i
    change w (i + (g.toAdd + h.toAdd)) = w ((i + g.toAdd) + h.toAdd)
    rw [add_assoc]

/-- Integral and residual cyclic-permutation invariants are diagonal, and every residual invariant
has an integral invariant lift (R18.3.23). -/
theorem LiftableReductionImage.oddIsotropy :
    let ρ : Representation ℤ (Multiplicative (ZMod 3)) (ZMod 3 → ℤ) :=
      LiftableReductionImage.cyclicPermutation ℤ
    let σ : Representation (ZMod 2) (Multiplicative (ZMod 3)) (ZMod 3 → ZMod 2) :=
      LiftableReductionImage.cyclicPermutation (ZMod 2)
    let red : (ZMod 3 → ℤ) →+ (ZMod 3 → ZMod 2) :=
      { toFun := fun w i => (w i : ZMod 2)
        map_zero' := rfl
        map_add' := by intros; ext i; simp }
    (∀ w : ZMod 3 → ℤ, w ∈ ρ.invariants ↔ ∃ a : ℤ, w = fun _ => a) ∧
      (∀ v : ZMod 3 → ZMod 2,
        (∀ g, σ g v = v) ↔ ∃ a : ZMod 2, v = fun _ => a) ∧
      (∀ v : ZMod 3 → ZMod 2,
        v ∈ liftableResidueImage ρ red ↔ ∀ g, σ g v = v) := by
  sorry

/-- The pointwise norm twist `f ↦ (χ ∘ ν) · f` on coefficient functions. -/
def normTwist {G A O W : Type*} [Group G] [CommGroup A] [CommRing O]
    [AddCommGroup W] [Module O W] (ν : G →* A) (χ : A →* Oˣ) (f : G → W) : G → W :=
  fun g => (χ (ν g) : O) • f g

/-- A quadratic reduced-norm character gives an involutive twist (R18.3.26). -/
theorem normTwist_involutive {G A O W : Type*} [Group G] [CommGroup A] [CommRing O]
    [AddCommGroup W] [Module O W] (ν : G →* A) (χ : A →* Oˣ)
    (hχ : ∀ a, χ a * χ a = 1) : Function.Involutive (normTwist (W := W) ν χ) := by
  sorry

-- `DyadicNormTwist.scalar`: a quadratic character is trivial on the square norm of a scalar.
example {G A O W : Type*} [Group G] [CommGroup A] [CommRing O]
    [AddCommGroup W] [Module O W] (ν : G →* A) (χ : A →* Oˣ)
    (hχ : ∀ a, χ a * χ a = 1) (f : G → W) (z : G) (a : A) (hz : ν z = a ^ 2) :
    normTwist ν χ f z = f z := by
  simp [normTwist, hz, pow_two, hχ]

/-! ## Layer R18.4: coefficient cohomology, Ihara's lemma and finite-level comparisons -/

section Components

variable (A C : Type*) [CommRing A] [CommGroup C]

/-- Right translation on functions on the finite component torsor. -/
def componentTranslation (c : C) : (C → A) →ₗ[A] (C → A) where
  toFun f x := f (x * c)
  map_add' _ _ := rfl
  map_smul' _ _ := rfl

/-- `T_v` on components: `q_v + 1` times translation by the norm class `c_v`. -/
def componentT (q : ℕ) (c : C) : (C → A) →ₗ[A] (C → A) :=
  ((q + 1 : ℕ) : A) • componentTranslation A C c

/-- `S_v` on components: translation by `c_v²`. -/
def componentS (c : C) : (C → A) →ₗ[A] (C → A) :=
  componentTranslation A C (c * c)

/-- The component Hecke operator has eigenvalue `(q + 1)χ(c)` on a character (R18.4.7). -/
theorem components_character (q : ℕ) (c : C) (χ : C →* Aˣ) :
    componentT A C q c (fun x => (χ x : A)) =
      (((q + 1 : ℕ) : A) * (χ c : A)) • (fun x => (χ x : A)) := by
  sorry

end Components

section Gram

variable (A M : Type*) [CommRing A] [AddCommGroup M] [Module A M]

/-- The Gram operator of the two degeneracy maps, `[[q+1, S⁻¹T], [T, q+1]]`. -/
def degeneracyGram (q : ℕ) (T : A) (S : Aˣ) : (M × M) →ₗ[A] (M × M) :=
  LinearMap.prod
    (((q + 1 : ℕ) : A) • LinearMap.fst A M M + ((↑(S⁻¹) : A) * T) • LinearMap.snd A M M)
    (T • LinearMap.fst A M M + ((q + 1 : ℕ) : A) • LinearMap.snd A M M)

/-- Its scalar determinant `(q+1)² − S⁻¹T²`. -/
def degeneracyDiscriminant (q : ℕ) (T : A) (S : Aˣ) : A :=
  ((q + 1 : ℕ) : A) ^ 2 - (↑(S⁻¹) : A) * T ^ 2

/-- The adjugate of the Gram operator. -/
def degeneracyAdjugate (q : ℕ) (T : A) (S : Aˣ) : (M × M) →ₗ[A] (M × M) :=
  LinearMap.prod
    (((q + 1 : ℕ) : A) • LinearMap.fst A M M - ((↑(S⁻¹) : A) * T) • LinearMap.snd A M M)
    (-T • LinearMap.fst A M M + ((q + 1 : ℕ) : A) • LinearMap.snd A M M)

/-- The Gram adjugate composes with the Gram operator to give its discriminant (R18.4.14). -/
theorem gram_adjugate (q : ℕ) (T : A) (S : Aˣ) :
    (degeneracyAdjugate A M q T S).comp (degeneracyGram A M q T S) =
      degeneracyDiscriminant A q T S • LinearMap.id := by
  sorry

/-- Algebraic milestone behind the unit-discriminant oldspace splitting. -/
theorem oldspace_split (N : Type*) [AddCommGroup N] [Module A N]
    (δ : (M × M) →ₗ[A] N) (trace : N →ₗ[A] (M × M)) (q : ℕ) (T : A) (S : Aˣ)
    (hGram : trace.comp δ = degeneracyGram A M q T S)
    (hUnit : IsUnit (degeneracyDiscriminant A q T S)) :
    ∃ r : N →ₗ[A] (M × M), r.comp δ = LinearMap.id := by
  sorry

end Gram

section Saturation

variable (O M N : Type*) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
  [AddCommGroup M] [Module O M] [Module.Finite O M] [Module.Free O M]
  [AddCommGroup N] [Module O N] [Module.Finite O N] [Module.Free O N]

/-- Injectivity after reduction modulo a uniformizer gives a saturated injection. -/
theorem residual_injectivity_saturation (varpi : O) (hvarpi : Irreducible varpi)
    (f : M →ₗ[O] N)
    (hResidual : ∀ x : M, (∃ y : N, f x = varpi • y) → ∃ z : M, x = varpi • z) :
    Function.Injective f ∧ Module.IsTorsionFree O (N ⧸ LinearMap.range f) ∧
      Module.Free O (N ⧸ LinearMap.range f) := by
  sorry

/-- Layer R18.4 algebraic milestone: a saturated injection of finite free DVR modules splits;
tensoring the splitting keeps injectivity modulo every `ϖⁿ`. -/
theorem integral_ihara_split (varpi : O) (hvarpi : Irreducible varpi)
    (f : M →ₗ[O] N)
    (hResidual : ∀ x : M, (∃ y : N, f x = varpi • y) → ∃ z : M, x = varpi • z) :
    ∃ r : N →ₗ[O] M, r.comp f = LinearMap.id := by
  sorry

end Saturation

/-!
The remaining targets need carriers that the pins do not provide: the Hilbert and quaternionic
moduli problems and their integral models (H1–H2, R18.1–R18.2), Hecke correspondences on them (H3),
the full and integral levels as group schemes (H4), cusps, Hodge lines and weights (H5), the paired
torsion twists (H6), the analytic and formal Drinfeld spaces and their quotients (R18.5),
the definite class-set graph `DefiniteClassSetGraph` (R18.5.17a), the two-place torsion realization
`ShimuraJacobianTorsionDatum` (R18.5.18), adelic quaternionic forms and the quaternionic transfer (R18.3), and the étale coefficient cohomology of
the curves with the Ihara lemma (R18.4). They are stated in `README.md` with their intended names. Further README-only APIs are
`polarizationLattice_rescale` (§H0.3), `mem_rapoportLocus` (§H2.5), the scalar-action checks
`diagonal_Q`, `diagonal_square`, `diagonal_notLinear` (§H3.3),
`ResidualHeckeIdeal.actingFactor_unique` (§R18.3.15), and `components_ext`,
`components_translation_comp`, `components_linearAction`, `components_coeffMap` (§R18.4.7).
The valuation-character API `divisionCharacterValue_add` remains in §R18.3.17.
The README-only basic APIs also include `mem_polarizationLattice` (§H0.3),
`integralTraceFamily_apply`, `integralTraceFamily_parameter_add`, `integralTraceFamily_balance`
(§H0.4), `congruenceUnits_mono`, `mem_congruenceUnitSquares`, `congruenceUnitSquares_mono`
(§H3.1), and `components_T`, `components_S` (§R18.4.7).
The basic lattice, trace, congruence, finite-level, chart-action and component APIs are specified
in their README subsections; the retained theorems give their layer milestones.
-/

end TauCetiRoadmap.HilbertModularVarietiesAndShimuraCurves
