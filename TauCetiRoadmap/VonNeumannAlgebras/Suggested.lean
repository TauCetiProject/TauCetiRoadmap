/-
Copyright (c) 2026 Kim Morrison. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib

/-!
# Von Neumann algebras, factors, and modular theory: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems that are statable against the pinned Mathlib, each with `sorry`, together with the few
predicates (factor, finiteness, types II₁ and II∞, type I₂ summands, projection comparison, cyclic
and separating vectors, tracial states, injectivity and hyperfiniteness) that those statements
need. Concrete von Neumann algebras are Mathlib's `VonNeumannAlgebra H` on a complete complex
Hilbert space `H`; the strong and weak operator topologies are Mathlib's `H →Lₚₜ[ℂ] H` and
`H →WOT[ℂ] H`. The nondegeneracy clause of the Layer 0 representations is the body of Tau Ceti's
`NonUnitalStarAlgHom.IsNondegenerate`, written out so that the file imports only Mathlib.

Headline theorems of the README that are not statable at the pins, and the carrier each lacks:

* Layer 1: the ultraweak and ultrastrong closure forms of the bicommutant and Kaplansky theorems,
  and the ultraweak form of the projection-closure theorem. Mathlib has no ultraweak or
  ultrastrong topology on `H →L[ℂ] H` (only the WOT and pointwise copies used below).
* Layer 2: the completed spatial tensor product `M ⊗̄ N` and its commutation theorem. There is
  no completed Hilbert tensor product of von Neumann algebras.
* Layers 3 and 6: the type decomposition and the semifinite/standard-form classification. They
  need central decomposition, normal semifinite traces and the standard form, none of which
  exist.
* Layer 4: the identification of the predual with the normal (ultraweakly continuous)
  functionals and the equivalences of normality. Neither Mathlib nor Tau Ceti at the pins has
  normal functionals or an ultraweak topology; the same lack is why the trace theorems below omit
  normality. The existence of a Banach predual for a concrete von Neumann algebra and Sakai's
  theorem are statable through `WStarAlgebra`'s conjugate-linear predual and are stated below.
  The classification of abelian von Neumann algebras by `L∞` of a measure space with
  multiplicity is not statable: `MeasureTheory.Lp` has no ring structure for `p = ∞`, only the
  heterogeneous Hölder scalar action, and there is no direct integral of Hilbert spaces.
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
  `B ⊗̄ M₂(ℂ)`, which needs the completed tensor product), the tracial ultraproduct and
  `R_ω′ ∩ R^ω = R` for the hyperfinite II₁ factor `R` (no tracial ultraproduct), and the
  central-sequence theorems that `R` has property Γ while the free group factors lack it and so
  are not isomorphic to `R` (no group von Neumann algebra and no infinite tensor product model of
  `R`). The Mackey–Gleason–Bunce–Wright
  theorem and Dye's theorem are stated below; normality of the Dye isomorphism is omitted there
  because it is automatic: a Jordan *-isomorphism is an order isomorphism, so it preserves
  suprema of bounded increasing nets.
* Layer 13: semidiscreteness and its equivalence with injectivity (no normal completely positive
  map and no ultraweak topology, which the definition of semidiscreteness uses), and the
  classification of the injective factors of types IIIλ (0 < λ < 1), III₀ and III₁ (no Connes
  invariants `S` and `T` and no flow of weights, which separate these types). Injectivity versus
  hyperfiniteness and the uniqueness of the injective II₁ and II∞ factors are stated below.
  "Separable predual" is expressed there through a separable acting Hilbert space. Such an
  algebra is separable in the sense of Anantharaman–Popa (a faithful normal representation on a
  separable Hilbert space, Definition 2.6.6, p. 48), every algebra separable in that sense is
  isomorphic to one acting on a separable space, and the README proves these to be exactly the
  algebras with separable predual (V4.Core). Injectivity does not depend on the representation
  (Anantharaman–Popa, Proposition 10.2.2, p. 161).
-/

open scoped ComplexOrder

universe u

noncomputable section

namespace TauCetiRoadmap.VonNeumannAlgebras

variable {H : Type u} [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]

/-! ## Layer 0: C*-algebra and state prerequisites -/

/-- **Gelfand–Naimark.** Every C*-algebra `A`, possibly nonunital and nonseparable, has a faithful
nondegenerate representation on a complete complex Hilbert space in the universe of `A`: the
direct sum of the GNS representations of its states, nondegenerate because the classes `[ab]`,
which lie in the range, are dense in each summand (README, Layer 0; Peterson, Corollary 4.1.7,
p. 58). For a unital `A` nondegeneracy forces `π 1 = 1`, so the unital theorem is the special
case. For the zero algebra the Hilbert space is `0`, on which the zero representation is injective
and nondegenerate. -/
theorem exists_faithful_nondegenerate_representation (A : Type u) [NonUnitalCStarAlgebra A] :
    ∃ (K : Type u) (_ : NormedAddCommGroup K) (_ : InnerProductSpace ℂ K) (_ : CompleteSpace K)
      (π : A →⋆ₙₐ[ℂ] (K →L[ℂ] K)), Function.Injective π ∧
        Dense (Submodule.span ℂ (⋃ a, Set.range (π a)) : Set K) := by
  sorry

/-- **Separable faithful representation on `ℓ²`.** Every nonzero separable C*-algebra, possibly
nonunital, has a faithful nondegenerate representation on `ℓ²(ℕ)`: the GNS representation of the
faithful state `Σ 2^(-n-1) φ_n`, amplified countably many times and transported along a Hilbert
basis (README, V0.SeparableFaithful). For the zero algebra a nondegenerate representation on the
nonzero space `ℓ²(ℕ)` does not exist, so nontriviality is assumed. -/
theorem exists_injective_nondegenerate_representation_lp
    {A : Type*} [NonUnitalCStarAlgebra A] [TopologicalSpace.SeparableSpace A] [Nontrivial A] :
    ∃ π : A →⋆ₙₐ[ℂ] (lp (fun _ : ℕ ↦ ℂ) 2 →L[ℂ] lp (fun _ : ℕ ↦ ℂ) 2),
      Function.Injective π ∧
        Dense (Submodule.span ℂ (⋃ a, Set.range (π a)) : Set (lp (fun _ : ℕ ↦ ℂ) 2)) := by
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

/-- **The predual theorem.** A concrete von Neumann algebra `N` on `H` has a Banach predual in
Mathlib's sense: a Banach space `X` with a conjugate-linear isometric isomorphism
`StrongDual ℂ X ≃ₗᵢ⋆[ℂ] N`. `X` is the conjugate Banach space of the ultraweakly continuous
functionals `N_* = S₁(H)/N_⊥`, so that `N` satisfies the axiom of `WStarAlgebra`
(README, V4.Core; Jones, Theorem 8.1.15, p. 53). -/
theorem exists_predual (N : VonNeumannAlgebra H) :
    ∃ (X : Type u) (_ : NormedAddCommGroup X) (_ : NormedSpace ℂ X) (_ : CompleteSpace X),
      Nonempty (StrongDual ℂ X ≃ₗᵢ⋆[ℂ] N.toStarSubalgebra) := by
  sorry

/-- **Sakai's theorem.** Every abstract W*-algebra, a C*-algebra `M` with `WStarAlgebra M`, is
star-isomorphic to a concrete von Neumann algebra `N` on some complete complex Hilbert space: the
direct sum of the GNS representations of the states lying in the predual (README, V4.Core;
Peterson, Theorem 4.4.6, p. 66). -/
theorem exists_vonNeumannAlgebra_starAlgEquiv (M : Type u) [CStarAlgebra M] [WStarAlgebra M] :
    ∃ (K : Type u) (_ : NormedAddCommGroup K) (_ : InnerProductSpace ℂ K) (_ : CompleteSpace K)
      (N : VonNeumannAlgebra K), Nonempty (M ≃⋆ₐ[ℂ] N.toStarSubalgebra) := by
  sorry

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

/-! ## Layer 6: Tracial standard form and semifinite factors -/

/-- A type II∞ factor: an infinite factor with no minimal projection that has a nonzero finite
projection `p`, one that is equivalent to no proper subprojection (every `v ∈ M` with `v* v = p`
and `v v* ≤ p` has `v v* = p`). The finite projection makes `M` semifinite, which excludes type
III; the absence of minimal projections excludes type I∞, and infiniteness excludes type II₁. -/
def IsTypeIIInfinity (M : VonNeumannAlgebra H) : Prop :=
  IsFactor M ∧ ¬ IsFinite M ∧
  (∃ p ∈ M, IsStarProjection p ∧ p ≠ 0 ∧
    ∀ v ∈ M, star v * v = p → v * star v ≤ p → v * star v = p) ∧
  ∀ p ∈ M, IsStarProjection p → p ≠ 0 →
    ∃ q ∈ M, IsStarProjection q ∧ q ≠ 0 ∧ q ≠ p ∧ q ≤ p

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

/-! ## Layer 12: Two projections, ultraproducts, and central sequences -/

/-- `M` has a nonzero central summand of type I₂: a nonzero central projection `z = e + f` that is
the sum of two orthogonal equivalent projections `e ∼ f` of `M` with `eMe` commutative, so that
`zM ≅ M₂(eMe)` with `eMe` abelian. `M₂(ℂ)` and `M₂(ℂ) ⊕ M₃(ℂ)` have one; `M₃(ℂ)`, `M₄(ℂ)`, the
abelian algebras and the II₁ factors do not. -/
def HasTypeITwoSummand (M : VonNeumannAlgebra H) : Prop :=
  ∃ e f : H →L[ℂ] H, ProjectionEquivalent M e f ∧ e * f = 0 ∧ e + f ≠ 0 ∧
    e + f ∈ M.commutant ∧
    ∀ x ∈ M, ∀ y ∈ M, (e * x * e) * (e * y * e) = (e * y * e) * (e * x * e)

/-- **The Mackey–Gleason–Bunce–Wright theorem.** If `M` has no nonzero central summand of type
I₂, every bounded finitely additive complex measure `μ` on the projections of `M` (additive on
orthogonal pairs) is the restriction of a unique bounded complex-linear functional on `M`
(README, V12.J.Scalar; Bunce–Wright, Theorems A and B, p. 289). On `M₂(ℂ)` the conclusion
fails. -/
theorem exists_unique_extension_of_finitelyAdditive {M : VonNeumannAlgebra H}
    (hM : ¬ HasTypeITwoSummand M) (μ : (H →L[ℂ] H) → ℂ)
    (hμ : ∀ p ∈ M, ∀ q ∈ M, IsStarProjection p → IsStarProjection q → p * q = 0 →
      μ (p + q) = μ p + μ q)
    (hμb : ∃ C : ℝ, ∀ p ∈ M, IsStarProjection p → ‖μ p‖ ≤ C) :
    ∃! φ : M.toStarSubalgebra →L[ℂ] ℂ,
      ∀ p (hp : p ∈ M), IsStarProjection p → φ ⟨p, hp⟩ = μ p := by
  sorry

/-- **Dye's theorem.** If `M` has no nonzero central summand of type I₂, every bijection `α`
between the projections of `M` and those of `N` that preserves orthogonality in both directions
is the restriction of a unique Jordan *-isomorphism `Φ : M → N`, a complex-linear bijection
preserving adjoints and squares (README, V12.J.Dye; Dye's theorem as recalled in Hamhalter,
pp. 2–3, and its AW*-form, Theorem 4.3, p. 14). No hypothesis on `N` is needed. `Φ` is unital
because `α` preserves the top projection, and normal because it is an order isomorphism; these
conclusions are therefore not restated. -/
theorem dye {K : Type*} [NormedAddCommGroup K] [InnerProductSpace ℂ K] [CompleteSpace K]
    {M : VonNeumannAlgebra H} {N : VonNeumannAlgebra K} (hM : ¬ HasTypeITwoSummand M)
    (α : {p : H →L[ℂ] H // p ∈ M ∧ IsStarProjection p} ≃
      {q : K →L[ℂ] K // q ∈ N ∧ IsStarProjection q})
    (hα : ∀ p q : {p : H →L[ℂ] H // p ∈ M ∧ IsStarProjection p},
      (p : H →L[ℂ] H) * q = 0 ↔ (α p : K →L[ℂ] K) * α q = 0) :
    ∃! Φ : M.toStarSubalgebra ≃ₗ[ℂ] N.toStarSubalgebra,
      (∀ x, Φ (star x) = star (Φ x)) ∧ (∀ x, Φ (x * x) = Φ x * Φ x) ∧
        ∀ p : {p : H →L[ℂ] H // p ∈ M ∧ IsStarProjection p},
          (Φ ⟨p.1, p.2.1⟩ : K →L[ℂ] K) = α p := by
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

/-- `M` is injective: there is a contractive projection of `B(H)` onto `M`, a bounded linear map
with range in `M` fixing `M` pointwise and of norm at most one. For `M ≠ 0` such a map has norm
one and is a conditional expectation by Tomiyama's theorem, so this is injectivity in the given
representation, which does not depend on the representation (Anantharaman–Popa, Definition
10.2.1 and Proposition 10.2.2, p. 161). -/
def IsInjective (M : VonNeumannAlgebra H) : Prop :=
  ∃ P : (H →L[ℂ] H) →L[ℂ] (H →L[ℂ] H),
    (∀ x, P x ∈ M) ∧ (∀ x ∈ M, P x = x) ∧ ‖P‖ ≤ 1

/-- `M` is hyperfinite: it is generated as a von Neumann algebra by an increasing sequence of
finite-dimensional unital star subalgebras of `B(H)`, that is, the double commutant of their union
is `M` (each of them then lies in `M`). This is the sequential form used for algebras with
separable predual (Anantharaman–Popa, Theorem 11.2.2(3), p. 186). -/
def IsHyperfinite (M : VonNeumannAlgebra H) : Prop :=
  ∃ A : ℕ → StarSubalgebra ℂ (H →L[ℂ] H), Monotone A ∧
    (∀ n, FiniteDimensional ℂ (A n)) ∧
    Set.centralizer (Set.centralizer (⋃ n, (A n : Set (H →L[ℂ] H)))) = (M : Set (H →L[ℂ] H))

/-- **Connes's theorem: injective equals hyperfinite.** A von Neumann algebra with separable
predual, here acting on a separable Hilbert space, is injective exactly when it is hyperfinite
(README, V13b; Connes's theorem as recalled in the Notes to Chapter 10 of Anantharaman–Popa,
p. 171, with the classification-independent proof of Takesaki III, XVI.1.9 and XVI.1.22–1.23).
Anantharaman–Popa, Theorem 11.1.3, p. 173, is only the direction from injective to hyperfinite
for finite algebras, in a finite-set `L²` form, and Theorem 11.2.2, p. 186, the equivalence for
II₁ factors. Without separability the sequential form is too narrow. -/
theorem isInjective_iff_isHyperfinite [TopologicalSpace.SeparableSpace H]
    (M : VonNeumannAlgebra H) : IsInjective M ↔ IsHyperfinite M := by
  sorry

/-- **Uniqueness of the injective II₁ factor.** Any two injective II₁ factors with separable
predual are star isomorphic, both being the hyperfinite II₁ factor `R` (README, V13b;
Anantharaman–Popa, Theorem 11.2.2, p. 186). -/
theorem nonempty_starAlgEquiv_of_isTypeIIOne_of_isInjective [TopologicalSpace.SeparableSpace H]
    {K : Type*} [NormedAddCommGroup K] [InnerProductSpace ℂ K] [CompleteSpace K]
    [TopologicalSpace.SeparableSpace K] {M : VonNeumannAlgebra H} {N : VonNeumannAlgebra K}
    (hM : IsTypeIIOne M) (hN : IsTypeIIOne N) (hMi : IsInjective M) (hNi : IsInjective N) :
    Nonempty (M.toStarSubalgebra ≃⋆ₐ[ℂ] N.toStarSubalgebra) := by
  sorry

/-- **Uniqueness of the injective II∞ factor.** Any two injective II∞ factors with separable
predual are star isomorphic, both being `R ⊗̄ B(ℓ²)` (README, V13b; Anantharaman–Popa,
Corollary 11.2.4, p. 188, for the hyperfinite form). -/
theorem nonempty_starAlgEquiv_of_isTypeIIInfinity_of_isInjective
    [TopologicalSpace.SeparableSpace H]
    {K : Type*} [NormedAddCommGroup K] [InnerProductSpace ℂ K] [CompleteSpace K]
    [TopologicalSpace.SeparableSpace K] {M : VonNeumannAlgebra H} {N : VonNeumannAlgebra K}
    (hM : IsTypeIIInfinity M) (hN : IsTypeIIInfinity N) (hMi : IsInjective M)
    (hNi : IsInjective N) :
    Nonempty (M.toStarSubalgebra ≃⋆ₐ[ℂ] N.toStarSubalgebra) := by
  sorry

end TauCetiRoadmap.VonNeumannAlgebras
