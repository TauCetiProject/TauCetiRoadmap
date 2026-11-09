/-
Copyright (c) 2026 Kim Morrison. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib

/-!
# Von Neumann algebras, factors, and modular theory: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems that are statable against the pinned Mathlib, each with `sorry`, together with the few
predicates (factor, finiteness, type II₁, projection comparison, cyclic and separating vectors,
tracial states) that those statements need. Concrete von Neumann algebras are Mathlib's
`VonNeumannAlgebra H` on a complete complex Hilbert space `H`; the strong and weak operator
topologies are Mathlib's `H →Lₚₜ[ℂ] H` and `H →WOT[ℂ] H`.

Headline theorems of the README that are not statable at the pins, and the carrier each lacks:

* Layer 1: the ultraweak and ultrastrong closure forms of the bicommutant and Kaplansky theorems,
  and the ultraweak form of the projection-closure theorem. Mathlib has no ultraweak or
  ultrastrong topology on `H →L[ℂ] H` (only the WOT and pointwise copies used below).
* Layer 2: the completed spatial tensor product `M ⊗̄ N`, its commutation theorem and the
  classification of abelian von Neumann algebras by `L∞` of a measure space with multiplicity.
  There is no completed Hilbert tensor product of von Neumann algebras and no direct integral.
* Layers 3 and 6: the type decomposition and the semifinite/standard-form classification. They
  need central decomposition, normal semifinite traces and the standard form, none of which
  exist.
* Layer 4: the predual theorem (a von Neumann algebra is the dual of its normal functionals) and
  the equivalences of normality. Mathlib's `WStarAlgebra` records an abstract predual, but there
  is no normal functional, ultraweak topology or comparison with concrete algebras. The same
  lack is why the trace theorems below omit normality.
* Layers 5 and 7: projection modularity versus finiteness (no lattice structure on the
  projections of a von Neumann algebra), the coupling constant and the Jones index of a II₁
  subfactor (no normal Hilbert modules over a II₁ factor and no coupling dimension).
* Layer 8: group von Neumann algebras, crossed products and the Bernoulli factors (no group
  von Neumann algebra or von Neumann crossed product).
* Layer 9: formal degrees of discrete series and the covolume formula (no square-integrable
  representation or formal degree).
* Layer 10: Tomita–Takesaki theory, the KMS characterization of the modular group, the
  finite-dimensional identification `σ_t = Ad(h^{it})` and the Bost–Connes type III theorem.
  There is no closed antilinear operator `S`, modular operator `Δ`, modular conjugation `J` or
  modular automorphism group.
* Layer 11: weights, spatial derivatives, Connes cocycles, the continuous core, Takesaki duality,
  the invariants `S` and `T`, and the flow of weights (no normal weights and no modular theory).
* Layer 12: the two-projection structure theorem (it identifies the general-position part with
  `B ⊗̄ M₂(ℂ)`, which needs the completed tensor product), tracial ultraproducts, central
  sequences, property Γ, the Mackey–Gleason–Bunce–Wright theorem and Dye's theorem (no tracial
  ultraproduct, no normal Jordan map or finitely additive projection measure on a von Neumann
  algebra).
* Layer 13: injectivity versus semidiscreteness, hyperfiniteness, and the classification of
  injective factors of types II₁, II∞, IIIλ, III₀ and III₁ (no conditional expectation onto a von
  Neumann subalgebra, no completely positive approximation of the identity in the point-ultraweak
  topology, and no Connes invariants).
-/

open scoped ComplexOrder

noncomputable section

namespace TauCetiRoadmap.VonNeumannAlgebras

variable {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]

/-! ## Layer 0: C*-algebra and state prerequisites -/

/-- **Separable faithful representation on `ℓ²`.** Every nonzero separable C*-algebra, possibly
nonunital, has a faithful nondegenerate representation on `ℓ²(ℕ)`: the GNS representation of the
faithful state `Σ 2^(-n-1) φ_n`, amplified countably many times and transported along a Hilbert
basis (README, V0.SeparableFaithful). For the zero algebra a nondegenerate representation on the
nonzero space `ℓ²(ℕ)` does not exist, so nontriviality is assumed. -/
theorem exists_injective_nondegenerate_representation_lp
    {A : Type*} [NonUnitalCStarAlgebra A] [TopologicalSpace.SeparableSpace A] [Nontrivial A] :
    ∃ π : A →⋆ₙₐ[ℂ] (lp (fun _ : ℕ ↦ ℂ) 2 →L[ℂ] lp (fun _ : ℕ ↦ ℂ) 2),
      Function.Injective π ∧
        Dense (Submodule.span ℂ {ξ | ∃ a η, π a η = ξ} : Set (lp (fun _ : ℕ ↦ ℂ) 2)) := by
  sorry

/-! ## Layer 1: Operator topologies and the bicommutant theorem -/

/-- **Von Neumann's bicommutant theorem.** A unital star subalgebra of `B(H)` equals its double
commutant exactly when it is closed in the weak operator topology (Mathlib's WOT copy). -/
theorem double_commutant_iff_isClosed_image_ofCLM
    (A : StarSubalgebra ℂ (H →L[ℂ] H)) :
    Set.centralizer (Set.centralizer (A : Set (H →L[ℂ] H))) = A ↔
      IsClosed (ContinuousLinearMapWOT.ofCLM '' (A : Set (H →L[ℂ] H))) := by
  sorry

/-- **Kaplansky density.** For a unital star subalgebra `A` of `B(H)`, the strong operator closure
of the closed unit ball of `A` is the closed unit ball of its double commutant `A''`. The inclusion
`⊆` is the norm lower semicontinuity of strong limits; `⊇` is Kaplansky's theorem. -/
theorem closure_unitBall_eq_unitBall_double_centralizer
    (A : StarSubalgebra ℂ (H →L[ℂ] H)) :
    closure (ContinuousLinearMap.toPointwiseConvergenceCLM ℂ (RingHom.id ℂ) H H ''
        {x | x ∈ A ∧ ‖x‖ ≤ 1}) =
      ContinuousLinearMap.toPointwiseConvergenceCLM ℂ (RingHom.id ℂ) H H ''
        {x | x ∈ Set.centralizer (Set.centralizer (A : Set (H →L[ℂ] H))) ∧ ‖x‖ ≤ 1} := by
  sorry

/-- **Weak limits of projections.** On an infinite-dimensional Hilbert space the weak operator
closure of the orthogonal projections is the set of positive contractions `0 ≤ A ≤ 1`. In finite
dimension the projections are already closed, so the dimension hypothesis is needed. -/
theorem closure_isStarProjection_eq_positive_contractions (hH : ¬ FiniteDimensional ℂ H) :
    closure {A : H →WOT[ℂ] H | IsStarProjection A.toCLM} =
      {A : H →WOT[ℂ] H | 0 ≤ A.toCLM ∧ A.toCLM ≤ 1} := by
  sorry

/-! ## Layer 4: Preduals, normality, and normal representations -/

/-- A vector `ξ` is cyclic for `M` when the orbit `Mξ` is dense; no separability is assumed. -/
def IsCyclic (M : VonNeumannAlgebra H) (ξ : H) : Prop :=
  Dense (Set.range (fun x : M ↦ (x : H →L[ℂ] H) ξ))

/-- A vector `ξ` is separating for `M` when `xξ = 0` forces `x = 0` for `x ∈ M`. -/
def IsSeparating (M : VonNeumannAlgebra H) (ξ : H) : Prop :=
  ∀ x : M, (x : H →L[ℂ] H) ξ = 0 → x = 0

/-- **Cyclic versus separating.** A vector is cyclic for `M` exactly when it is separating for the
commutant `M'`. -/
theorem isCyclic_iff_isSeparating_commutant (M : VonNeumannAlgebra H) (ξ : H) :
    IsCyclic M ξ ↔ IsSeparating M.commutant ξ := by
  sorry

/-! ## Layer 5: Projection comparison and finite factors -/

/-- Murray–von Neumann equivalence `p ∼ q` in `M`, oriented from initial to final projection:
some `v ∈ M` has `v* v = p` and `v v* = q`. -/
def ProjectionEquivalent (M : VonNeumannAlgebra H) (p q : H →L[ℂ] H) : Prop :=
  IsStarProjection p ∧ IsStarProjection q ∧ p ∈ M ∧ q ∈ M ∧
  ∃ v : H →L[ℂ] H, v ∈ M ∧ star v * v = p ∧ v * star v = q

/-- Murray–von Neumann subequivalence `p ≼ q` in `M`: some `v ∈ M` has `v* v = p` and
`v v* ≤ q` in the positive-operator order. -/
def ProjectionSubequivalent (M : VonNeumannAlgebra H) (p q : H →L[ℂ] H) : Prop :=
  IsStarProjection p ∧ IsStarProjection q ∧ p ∈ M ∧ q ∈ M ∧
  ∃ v : H →L[ℂ] H, v ∈ M ∧ star v * v = p ∧ v * star v ≤ q

/-- **Projection Schröder–Bernstein.** Subequivalence is antisymmetric up to equivalence:
`p ≼ q` and `q ≼ p` give `p ∼ q` (the projections themselves need not be equal). -/
theorem equivalent_of_subequivalent {M : VonNeumannAlgebra H}
    {p q : H →L[ℂ] H} (hpq : ProjectionSubequivalent M p q)
    (hqp : ProjectionSubequivalent M q p) : ProjectionEquivalent M p q := by
  sorry

/-- A factor: the identity of `H` is nonzero and every central element of `M` is a scalar. -/
def IsFactor (M : VonNeumannAlgebra H) : Prop :=
  (1 : H →L[ℂ] H) ≠ 0 ∧
  ∀ x : H →L[ℂ] H, x ∈ M → x ∈ M.commutant → ∃ c : ℂ, x = c • (1 : H →L[ℂ] H)

/-- `M` is finite: every isometry of `M` is a unitary. -/
def IsFinite (M : VonNeumannAlgebra H) : Prop :=
  ∀ v ∈ M, star v * v = 1 → v * star v = 1

/-- A type II₁ factor: a finite factor with no minimal projection, that is, every nonzero
projection of `M` has a nonzero proper subprojection in `M`. -/
def IsTypeIIOne (M : VonNeumannAlgebra H) : Prop :=
  IsFactor M ∧ IsFinite M ∧
  ∀ p ∈ M, IsStarProjection p → p ≠ 0 →
    ∃ q ∈ M, IsStarProjection q ∧ q ≠ 0 ∧ q ≠ p ∧ q ≤ p

/-- A tracial state on `M`: a linear functional with `τ(1) = 1`, `τ(x* x) ≥ 0` and
`τ(xy) = τ(yx)`. Continuity is automatic from positivity. -/
def IsTracialState (M : VonNeumannAlgebra H) (τ : M.toStarSubalgebra →ₗ[ℂ] ℂ) : Prop :=
  τ 1 = 1 ∧ (∀ x, 0 ≤ τ (star x * x)) ∧ ∀ x y, τ (x * y) = τ (y * x)

/-- **Uniqueness of the trace on a factor.** A factor has at most one tracial state: on a finite
factor by the Dixmier approximation theorem, and an infinite factor has none since `1` is the sum
of two projections equivalent to `1` (README, V5.Dixmier). No normality is assumed. -/
theorem tracialState_unique {M : VonNeumannAlgebra H} (hM : IsFactor M)
    {τ₁ τ₂ : M.toStarSubalgebra →ₗ[ℂ] ℂ} (h₁ : IsTracialState M τ₁)
    (h₂ : IsTracialState M τ₂) : τ₁ = τ₂ := by
  sorry

/-- **Existence of the trace on a II₁ factor.** A type II₁ factor has a faithful tracial state,
constructed from the Dixmier centre-valued trace (README, V5.Dixmier). The README's trace is also
normal; normality of a functional has no carrier at the pins and is omitted here. -/
theorem exists_faithful_tracialState {M : VonNeumannAlgebra H} (hM : IsTypeIIOne M) :
    ∃ τ : M.toStarSubalgebra →ₗ[ℂ] ℂ,
      IsTracialState M τ ∧ ∀ x, τ (star x * x) = 0 → x = 0 := by
  sorry

/-- **Algebraic simplicity of II₁ factors.** A type II₁ factor has no two-sided ideals other than
`0` and itself, with no closedness or star-invariance assumed on the ideal. -/
theorem isSimpleRing_of_isTypeIIOne {M : VonNeumannAlgebra H} (hM : IsTypeIIOne M) :
    IsSimpleRing M.toStarSubalgebra := by
  sorry

/-! ## Layer 8: Group algebras, actions, and discrete crossed products -/

/-- **Dense translations are ergodic.** Left translation by a countable dense subgroup of a
locally compact Hausdorff group is ergodic for a regular Haar measure, with no compactness,
metrizability or finite-measure hypothesis (README, V8.DenseTranslations). -/
theorem ergodicSMul_dense_subgroup
    {G : Type*} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [T2Space G] [LocallyCompactSpace G] [MeasurableSpace G] [BorelSpace G]
    (μ : MeasureTheory.Measure G) [μ.IsHaarMeasure] [μ.Regular]
    (Γ : Subgroup G) [Countable Γ] (hd : Dense (Γ : Set G)) :
    ErgodicSMul Γ G μ := by
  sorry

/-! ## Layer 13: Hyperfiniteness and injective classification -/

/-- **Tomiyama's theorem.** A norm-one projection of a possibly nonunital complex C*-algebra
onto a star subalgebra is positive, bimodular over its range, and completely positive.
Range containment and pointwise fixing specify the projection without a conditional-expectation
carrier; they also imply its range is closed (Hiai, Theorem 6.5, pp. 55–56). -/
theorem tomiyama
    {A : Type*} [NonUnitalCStarAlgebra A] [PartialOrder A] [StarOrderedRing A]
    (S : NonUnitalStarSubalgebra ℂ A) (P : A →L[ℂ] A)
    (h_range : ∀ x, P x ∈ S) (h_fix : ∀ x ∈ S, P x = x) (h_norm : ‖P‖ = 1) :
    (∀ x, 0 ≤ x → 0 ≤ P x) ∧
      (∀ a ∈ S, ∀ b ∈ S, ∀ x, P (a * x * b) = a * P x * b) ∧
      ∃ Φ : CompletelyPositiveMap A A, Φ.toLinearMap = P.toLinearMap := by
  sorry

end TauCetiRoadmap.VonNeumannAlgebras
