/-
Copyright (c) 2026 Kim Morrison. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Mathlib
public import TauCeti.Analysis.VonNeumannAlgebra.Adjoin

/-!
# Von Neumann algebras, factors, and modular theory: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems that are statable against the pinned Mathlib and Tau Ceti, each with `sorry`, together
with the few definitions (the amplifications `x ⊗ 1`, `1 ⊗ y` and the spatial tensor product on
the completed Hilbert tensor product, multiplication algebras, the left regular representation
and group von Neumann algebras of discrete groups) and predicates (central, abelian and finite
projections, normal functionals and normal semifinite traces, factor, finiteness, types II₁ and
II∞, type I₂ summands, projection comparison, cyclic and separating vectors, tracial states,
property Γ, injectivity and hyperfiniteness) that those statements need. Concrete von Neumann
algebras are Mathlib's `VonNeumannAlgebra H` on a complete complex Hilbert space `H`; the strong
and weak operator topologies are Mathlib's `H →Lₚₜ[ℂ] H` and `H →WOT[ℂ] H`. The completed
Hilbert tensor product `E ⊗̂ F` is `UniformSpace.Completion (E ⊗[ℂ] F)` of Mathlib's inner
product space `E ⊗[ℂ] F`, and `ℓ²(Γ)` of a discrete group is `L²(Γ)` for the counting measure.
The generated von Neumann algebras `spatialTensor`, `multiplicationAlgebra` and
`groupVonNeumannAlgebra` are Tau Ceti's `VonNeumannAlgebra.adjoin` of their generators, the
double commutant of the generators and their adjoints. The nondegeneracy clause of the Layer 0
representations is the body of Tau Ceti's `NonUnitalStarAlgHom.IsNondegenerate`, density of the
span of the vectors `π a ξ`, written out.

Headline theorems of the README that are not statable at the pins, and the carrier each lacks:

* Layer 1: the ultraweak and ultrastrong closure forms of the bicommutant and Kaplansky theorems,
  and the ultraweak form of the projection-closure theorem. Mathlib has no ultraweak or
  ultrastrong topology on `H →L[ℂ] H` (only the WOT and pointwise copies used below).
* Layer 4: the identification of the predual `M_*` with the ultraweakly continuous functionals
  and the agreement of normality with ultraweak continuity. Mathlib has no ultraweak topology on
  `H →L[ℂ] H`. Normality itself is stated below in its monotone-net form on Mathlib's strong
  operator topology, together with the characterization of normal positive functionals as sums
  of vector functionals. The existence of a Banach predual for a concrete von Neumann algebra and
  Sakai's theorem are statable through `WStarAlgebra`'s conjugate-linear predual and are stated
  below.
  The classification of abelian von Neumann algebras is stated below in its abstract form, with
  `L∞(X, μ)` realized as the von Neumann algebra of its multiplication operators on `L²(X, μ)`
  (Mathlib's `ContinuousLinearMap.holderL`), since `MeasureTheory.Lp` has no ring structure for
  `p = ∞`. Its spatial form with multiplicity, a unitary equivalence with a Hilbert sum of
  amplified multiplication algebras, is not stated: there is no direct sum of von Neumann
  algebras, and assembling one from `lp.mapCLM`, with a uniform-bound side condition on every
  operator family, would be a long ad hoc encoding.
* Layer 7: the coupling constant and the Jones index of a II₁ subfactor (no normal Hilbert
  modules over a II₁ factor and no coupling dimension).
* Layer 8: von Neumann crossed products and the Bernoulli factors. There is no von Neumann
  crossed product, and `L∞(X)` is not a C*-algebra at the pins (`MeasureTheory.Lp` has no ring
  structure for `p = ∞`); assembling `L∞(X) ⋊ Γ` from multiplication operators
  (`ContinuousLinearMap.holderL`), Koopman unitaries (`MeasureTheory.Lp.compMeasurePreservingₗᵢ`)
  and the completed tensor product would be a long ad hoc encoding. Group von Neumann algebras
  and their factoriality criterion are stated below.
* Layer 9: formal degrees of discrete series and the covolume formula (no square-integrable
  representation or formal degree, and the covolume formula is an identity between Layer 7
  coupling dimensions).
* Layer 10: the closed-operator form of Tomita–Takesaki theory (the Tomita operator
  `S = JΔ^{1/2}` and the imaginary powers `Δ^{it}` of the modular operator), the
  finite-dimensional identification `σ_t = Ad(h^{it})` and the Bost–Connes type III theorem.
  There is no closed antilinear operator `S`, no unbounded modular operator `Δ` and no modular
  automorphism group. Tomita's theorem `JMJ = M'` needs none of them and is stated below: the
  modular conjugation `J` is characterized on Mathlib's closed real subspaces. The KMS
  characterization of the modular group needs none of them in its existence-and-uniqueness
  form, which is stated below.
* Layer 11: weights, spatial derivatives, Connes cocycles, the continuous core, Takesaki duality,
  the invariants `S` and `T`, and the flow of weights (no modular automorphism group of a weight,
  on which each of these depends). The tensor commutation theorem `(M ⊗̄ N)′ = M′ ⊗̄ N′`, proved
  there through standard forms, needs none of them in its statement and is stated below.
* Layer 12: the tracial ultraproduct and `R_ω′ ∩ R^ω = R` for the hyperfinite II₁ factor `R`
  (no tracial ultraproduct). The two-projection theorem, in Halmos's form on `L ⊕ L`, property Γ
  of the hyperfinite II₁ factors and its failure for the free group factors (so that these are
  not `R`), the Mackey–Gleason–Bunce–Wright theorem and Dye's theorem are stated below.
  Normality of the Dye isomorphism is omitted there because it is automatic: a Jordan
  *-isomorphism is an order isomorphism, so it preserves suprema of bounded increasing nets.
* Layer 13: semidiscreteness and its equivalence with injectivity. Semidiscreteness is defined
  by completely positive maps through matrix algebras, and Mathlib's `CompletelyPositiveMap`
  needs `NonUnitalCStarAlgebra` and `StarOrderedRing` instances on its source, which the carrier
  `M.toStarSubalgebra` of a `VonNeumannAlgebra` does not have at the pin. Also not statable is the
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

@[expose] public section

open scoped ComplexOrder ENNReal NNReal TensorProduct

open Filter Topology

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

/-! ## Layer 2: Elementary algebra, corners, and tensors -/

/-- The amplification `x ⊗ 1` on the completed Hilbert tensor product `E ⊗̂ F`, the completion of
Mathlib's inner product space `E ⊗[ℂ] F`: the extension by continuity of
`ContinuousLinearMap.rTensor`, which sends `e ⊗ f` to `x e ⊗ f` (README, Layer 2). No
completeness of `E` or `F` is assumed, so that a corner of Layer 6, acting on a closed subspace,
can be amplified. -/
def rTensorCompletion {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℂ E]
    (F : Type*) [NormedAddCommGroup F] [InnerProductSpace ℂ F] (x : E →L[ℂ] E) :
    UniformSpace.Completion (E ⊗[ℂ] F) →L[ℂ] UniformSpace.Completion (E ⊗[ℂ] F) :=
  (x.rTensor F).completion

/-- The amplification `1 ⊗ y` on `E ⊗̂ F`: the extension by continuity of
`ContinuousLinearMap.lTensor`, which sends `e ⊗ f` to `e ⊗ y f` (README, Layer 2). -/
def lTensorCompletion (E : Type*) [NormedAddCommGroup E] [InnerProductSpace ℂ E]
    {F : Type*} [NormedAddCommGroup F] [InnerProductSpace ℂ F] (y : F →L[ℂ] F) :
    UniformSpace.Completion (E ⊗[ℂ] F) →L[ℂ] UniformSpace.Completion (E ⊗[ℂ] F) :=
  (y.lTensor E).completion

/-- The spatial tensor product: the von Neumann algebra on `E ⊗̂ F` generated by the operators
`x ⊗ 1` for `x ∈ A` and `1 ⊗ y` for `y ∈ B`, that is, the double commutant of these operators
and their adjoints, Tau Ceti's `VonNeumannAlgebra.adjoin` of them (README, Layer 2). For von
Neumann algebras `M` and `N` it is `M ⊗̄ N`: for instance `M_m(ℂ) ⊗̄ M_n(ℂ) = M_{mn}(ℂ)` on
`ℂ^m ⊗ ℂ^n`, and `B(H) ⊗̄ ℂ1 = B(H) ⊗ 1`, whose commutant is `1 ⊗ B(K)`. -/
def spatialTensor {E F : Type*} [NormedAddCommGroup E] [InnerProductSpace ℂ E]
    [NormedAddCommGroup F] [InnerProductSpace ℂ F] (A : Set (E →L[ℂ] E)) (B : Set (F →L[ℂ] F)) :
    VonNeumannAlgebra (UniformSpace.Completion (E ⊗[ℂ] F)) :=
  VonNeumannAlgebra.adjoin (rTensorCompletion F '' A ∪ lTensorCompletion E '' B)

/-! ## Layer 3: Type I and finite-dimensional algebras -/

/-- A central projection of `M`: a projection lying in `M` and in its commutant `M'`. -/
def IsCentralProjection (M : VonNeumannAlgebra H) (z : H →L[ℂ] H) : Prop :=
  IsStarProjection z ∧ z ∈ M ∧ z ∈ M.commutant

/-- An abelian projection of `M`: a projection `e ∈ M` whose corner `eMe` is commutative. -/
def IsAbelianProjection (M : VonNeumannAlgebra H) (e : H →L[ℂ] H) : Prop :=
  IsStarProjection e ∧ e ∈ M ∧
    ∀ x ∈ M, ∀ y ∈ M, (e * x * e) * (e * y * e) = (e * y * e) * (e * x * e)

/-- A finite projection of `M`: a projection `e ∈ M` equivalent in `M` to no proper
subprojection, that is, every `v ∈ M` with `v* v = e` and `v v* ≤ e` has `v v* = e`
(Peterson, §3.2, pp. 44–45). -/
def IsFiniteProjection (M : VonNeumannAlgebra H) (e : H →L[ℂ] H) : Prop :=
  IsStarProjection e ∧ e ∈ M ∧ ∀ v ∈ M, star v * v = e → v * star v ≤ e → v * star v = e

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

/-- A linear functional on `M` is normal: along every increasing net of `M` that converges in
the strong operator topology to some `y ∈ M`, its values converge to its value at `y`. By
Vigier's theorem the increasing nets converging strongly are the bounded increasing nets, with
their suprema as limits, so for a positive functional this is preservation of suprema of bounded
increasing nets (Anantharaman–Popa, Definition 2.5.1, p. 40). Index types in the universe of `H`
suffice, since an increasing net may be replaced by its range, a directed subset of `M`. -/
def IsNormalFunctional (M : VonNeumannAlgebra H) (τ : M.toStarSubalgebra →ₗ[ℂ] ℂ) : Prop :=
  ∀ (ι : Type u) [Preorder ι] [IsDirected ι (· ≤ ·)] [Nonempty ι]
    (x : ι → M.toStarSubalgebra) (y : M.toStarSubalgebra),
    Monotone (fun i ↦ (x i : H →L[ℂ] H)) →
    Tendsto (fun i ↦ ContinuousLinearMap.toPointwiseConvergenceCLM ℂ (RingHom.id ℂ) H H
      (x i : H →L[ℂ] H)) atTop
      (𝓝 (ContinuousLinearMap.toPointwiseConvergenceCLM ℂ (RingHom.id ℂ) H H (y : H →L[ℂ] H))) →
    Tendsto (fun i ↦ τ (x i)) atTop (𝓝 (τ y))

/-- **Normal positive functionals are sums of vector functionals.** A positive linear functional
`τ` on a concrete von Neumann algebra `M ⊆ B(H)` is normal exactly when
`τ(x) = Σₙ ⟪ξₙ, x ξₙ⟫` for a sequence of vectors with `Σₙ ‖ξₙ‖² < ∞`, the series converging
absolutely since `|⟪ξ, x ξ⟫| ≤ ‖x‖ ‖ξ‖²` (README, V4.Normality; Anantharaman–Popa, Theorem 2.5.5
and Remark 2.5.7, pp. 42–43; Peterson, Proposition 4.2.2, p. 60, in its trace-class form). No
separability of `H` is assumed: a positive trace-class density has countably many nonzero
eigenvalues. -/
theorem isNormalFunctional_iff_exists_tsum_inner {M : VonNeumannAlgebra H}
    (τ : M.toStarSubalgebra →ₗ[ℂ] ℂ) (hτ : ∀ x, 0 ≤ τ (star x * x)) :
    IsNormalFunctional M τ ↔
      ∃ ξ : ℕ → H, Summable (fun n ↦ ‖ξ n‖ ^ 2) ∧
        ∀ x : M.toStarSubalgebra, τ x = ∑' n, inner ℂ (ξ n) ((x : H →L[ℂ] H) (ξ n)) := by
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

/-- The multiplication algebra of a measure space `(X, μ)`: the von Neumann algebra on `L²(X, μ)`
generated by the operators of multiplication by `f ∈ L∞(X, μ)`, which are Mathlib's Hölder
products `ContinuousLinearMap.holderL` for the exponents `∞, 2, 2`; it is Tau Ceti's
`VonNeumannAlgebra.adjoin` of these operators (README, V4.AbelianClassification). For σ-finite
`μ` it consists of these multiplication operators and is star isomorphic to `L∞(X, μ)`. For the
counting measure on a two-point space it is the diagonal algebra `ℂ²` on `ℂ²`; for Lebesgue
measure on `[0, 1]` it is `L∞[0, 1]`, which has no minimal projection. -/
def multiplicationAlgebra {X : Type*} [MeasurableSpace X] (μ : MeasureTheory.Measure X) :
    VonNeumannAlgebra (MeasureTheory.Lp ℂ 2 μ) :=
  VonNeumannAlgebra.adjoin (Set.range ((ContinuousLinearMap.mul ℂ ℂ).holderL μ ∞ 2 2))

/-- **Abelian von Neumann algebras are `L∞` spaces.** An abelian von Neumann algebra on a nonzero
separable Hilbert space is star isomorphic to the multiplication algebra of a probability measure
on a standard Borel space: to `ℓ∞` of a finite or countable set, to `L∞[0, 1]`, or to their direct
sum (README, V4.AbelianClassification; Jones, the remark after EP10, p. 23). The zero algebra on
the zero space is excluded, since the multiplication algebra of a probability space contains
`1 ≠ 0`; without separability `ℓ∞(I)` for an uncountable `I` is a counterexample, having
uncountably many orthogonal minimal projections, while a probability measure has only countably
many atoms. -/
theorem exists_starAlgEquiv_multiplicationAlgebra [Nontrivial H]
    [TopologicalSpace.SeparableSpace H] {M : VonNeumannAlgebra H}
    (hM : ∀ x ∈ M, ∀ y ∈ M, x * y = y * x) :
    ∃ (X : Type) (_ : MeasurableSpace X) (_ : StandardBorelSpace X)
      (μ : MeasureTheory.Measure X) (_ : MeasureTheory.IsProbabilityMeasure μ),
      Nonempty (M.toStarSubalgebra ≃⋆ₐ[ℂ] (multiplicationAlgebra μ).toStarSubalgebra) := by
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

/-- **Uniqueness of the trace on a factor.** A factor has at most one tracial state. A tracial
state is norm continuous and unitarily invariant, so it is constant on the norm-closed convex hull
`K(x)` of the unitary conjugates of `x` and takes the value `α` at `x` whenever `α • 1 ∈ K(x)`;
such an `α` exists by Dixmier's averaging theorem (README, V5.Dixmier; Anantharaman–Popa, Theorem
6.4.1, p. 93). No normality is assumed. -/
theorem tracialState_unique {M : VonNeumannAlgebra H} (hM : IsFactor M)
    {τ₁ τ₂ : M.toStarSubalgebra →ₗ[ℂ] ℂ} (h₁ : IsTracialState M τ₁)
    (h₂ : IsTracialState M τ₂) : τ₁ = τ₂ := by
  sorry

/-- **Existence of the trace on a II₁ factor.** A type II₁ factor has a faithful normal tracial
state, the scalar form of the faithful normal centre-valued trace of a finite von Neumann algebra
(README, V5.Dixmier; Peterson, Theorem 4.7.10, p. 72; Anantharaman–Popa, Theorem 6.4.4, p. 95).
By `tracialState_unique` it is the only
tracial state, so every tracial state of a II₁ factor is normal and faithful. -/
theorem exists_faithful_tracialState {M : VonNeumannAlgebra H} (hM : IsTypeIIOne M) :
    ∃ τ : M.toStarSubalgebra →ₗ[ℂ] ℂ,
      IsTracialState M τ ∧ IsNormalFunctional M τ ∧ ∀ x, τ (star x * x) = 0 → x = 0 := by
  sorry

/-- **Algebraic simplicity of II₁ factors.** A type II₁ factor has no two-sided ideals other than
`0` and itself, with no closedness or star-invariance assumed on the ideal. -/
theorem isSimpleRing_of_isTypeIIOne {M : VonNeumannAlgebra H} (hM : IsTypeIIOne M) :
    IsSimpleRing M.toStarSubalgebra := by
  sorry

/-- **Finiteness is modularity of the projection lattice.** A projection `e` of `M` is finite
exactly when the interval `[0, e]` of the projection lattice of `M` is modular: for projections
`p ≤ r` and `q` of `M` below `e`, `p ∨ (q ∧ r) = (p ∨ q) ∧ r`. Projections are compared through
their ranges, `p ∧ q` being the projection onto `ran p ∩ ran q` and `p ∨ q` the projection onto
the closure of `ran p + ran q`; both lie in `M`. At `e = 1` this is the theorem that `M` is
finite exactly when its projection lattice is modular, since `IsFiniteProjection M 1` says that
every isometry of `M` is unitary. No separability is assumed (README, V5.LatticeFinite). In
`B(ℓ²)` the subspaces of V2.NonmodularProjectionLattice break the law, and `1` is infinite there
through the shift. -/
theorem isFiniteProjection_iff_modular {M : VonNeumannAlgebra H} {e : H →L[ℂ] H}
    (he : IsStarProjection e) (heM : e ∈ M) :
    IsFiniteProjection M e ↔
      ∀ p ∈ M, ∀ q ∈ M, ∀ r ∈ M, IsStarProjection p → IsStarProjection q → IsStarProjection r →
        p ≤ e → q ≤ e → r ≤ e → p ≤ r →
        (LinearMap.range (p : H →ₗ[ℂ] H) ⊔
            (LinearMap.range (q : H →ₗ[ℂ] H) ⊓
              LinearMap.range (r : H →ₗ[ℂ] H))).topologicalClosure =
          (LinearMap.range (p : H →ₗ[ℂ] H) ⊔
              LinearMap.range (q : H →ₗ[ℂ] H)).topologicalClosure ⊓
            LinearMap.range (r : H →ₗ[ℂ] H) := by
  sorry

/-! ## Layer 6: Tracial standard form and semifinite factors -/

/-- A normal semifinite trace on `M` (Anantharaman–Popa, Definition 8.3.1, pp. 124–125): a map
`τ` into `[0, ∞]`, of which only the values on the positive cone `M₊` matter, that is additive
and positively homogeneous on `M₊` (with `0 · ∞ = 0`), satisfies `τ(x* x) = τ(x x*)` for
`x ∈ M`, is semifinite (every nonzero `x ∈ M₊` dominates a nonzero `y ∈ M₊` with `τ(y) < ∞`) and
is normal: along every increasing net of `M₊` converging strongly to `y`, the values converge to
`τ(y)`, which by monotonicity of `τ` on `M₊` is `τ(sup xᵢ) = sup τ(xᵢ)`. Faithfulness is a
separate property. -/
def IsNormalSemifiniteTrace (M : VonNeumannAlgebra H) (τ : (H →L[ℂ] H) → ℝ≥0∞) : Prop :=
  (∀ x ∈ M, ∀ y ∈ M, 0 ≤ x → 0 ≤ y → τ (x + y) = τ x + τ y) ∧
  (∀ x ∈ M, 0 ≤ x → ∀ c : ℝ≥0, τ (((c : ℝ) : ℂ) • x) = c * τ x) ∧
  (∀ x ∈ M, τ (star x * x) = τ (x * star x)) ∧
  (∀ x ∈ M, 0 ≤ x → x ≠ 0 → ∃ y ∈ M, 0 ≤ y ∧ y ≤ x ∧ y ≠ 0 ∧ τ y < ⊤) ∧
  ∀ (ι : Type u) [Preorder ι] [IsDirected ι (· ≤ ·)] [Nonempty ι]
    (x : ι → H →L[ℂ] H) (y : H →L[ℂ] H), (∀ i, x i ∈ M ∧ 0 ≤ x i) → Monotone x →
    Tendsto (fun i ↦ ContinuousLinearMap.toPointwiseConvergenceCLM ℂ (RingHom.id ℂ) H H (x i))
      atTop (𝓝 (ContinuousLinearMap.toPointwiseConvergenceCLM ℂ (RingHom.id ℂ) H H y)) →
    Tendsto (fun i ↦ τ (x i)) atTop (𝓝 (τ y))

/-- **The trace of a semifinite factor.** A factor with a nonzero finite projection (for a
factor, the same as being semifinite) has a faithful normal semifinite trace `τ`, unique up to a
nonnegative scalar among all normal semifinite traces, and a projection of `M` is finite exactly
when its trace is finite (README, Layer 6; Peterson, Theorem 4.9.4, p. 78). On `B(ℓ²)` it is the
canonical trace, on a II₁ factor a multiple of the tracial state. -/
theorem exists_isNormalSemifiniteTrace_of_isFactor {M : VonNeumannAlgebra H} (hM : IsFactor M)
    (hf : ∃ p, IsFiniteProjection M p ∧ p ≠ 0) :
    ∃ τ : (H →L[ℂ] H) → ℝ≥0∞, IsNormalSemifiniteTrace M τ ∧
      (∀ x ∈ M, 0 ≤ x → τ x = 0 → x = 0) ∧
      (∀ p ∈ M, IsStarProjection p → (IsFiniteProjection M p ↔ τ p < ⊤)) ∧
      ∀ τ' : (H →L[ℂ] H) → ℝ≥0∞, IsNormalSemifiniteTrace M τ' →
        ∃ c : ℝ≥0, ∀ x ∈ M, 0 ≤ x → τ' x = c * τ x := by
  sorry

/-- **The tracial standard form.** Let `Ω` be a cyclic vector for `M` whose vector state is
tracial, `⟪Ω, x y Ω⟫ = ⟪Ω, y x Ω⟫` for `x, y ∈ M`. Then `Ω` is also separating, `(H, Ω)` is the
GNS space `L²(M, τ)` of the faithful normal tracial vector state `τ`, and the conjugation
`x Ω ↦ x* Ω`, isometric by the trace property, extends to a conjugate-linear isometric involution
`J` of `H` with `J M J = M'` (README, Layer 6; Anantharaman–Popa, Theorem 7.1.1, p. 99; Peterson,
Proposition 4.7.12, pp. 73–74). `M₂(ℂ)` on `ℂ²` has no such vector, its vector states being pure;
on the zero space `Ω = 0` and `J = 0`. -/
theorem exists_conj_commutant_eq_of_isCyclic {M : VonNeumannAlgebra H} {Ω : H}
    (hΩ : IsCyclic M Ω)
    (htr : ∀ x ∈ M, ∀ y ∈ M, inner ℂ Ω ((x * y) Ω) = inner ℂ Ω ((y * x) Ω)) :
    ∃ J : H ≃ₗᵢ⋆[ℂ] H, (∀ ξ, J (J ξ) = ξ) ∧ (∀ x ∈ M, J (x Ω) = (star x) Ω) ∧
      ∀ y : H →L[ℂ] H, y ∈ M.commutant ↔ ∃ x ∈ M, ∀ ξ, y ξ = J (x (J ξ)) := by
  sorry

/-- A type II∞ factor: an infinite factor with no minimal projection that has a nonzero finite
projection `p`, one that is equivalent to no proper subprojection (every `v ∈ M` with `v* v = p`
and `v v* ≤ p` has `v v* = p`). The finite projection makes `M` semifinite, which excludes type
III; the absence of minimal projections excludes type I∞, and infiniteness excludes type II₁. -/
def IsTypeIIInfinity (M : VonNeumannAlgebra H) : Prop :=
  IsFactor M ∧ ¬ IsFinite M ∧ (∃ p, IsFiniteProjection M p ∧ p ≠ 0) ∧
  ∀ p ∈ M, IsStarProjection p → p ≠ 0 →
    ∃ q ∈ M, IsStarProjection q ∧ q ≠ 0 ∧ q ≠ p ∧ q ≤ p

/-- **A II∞ factor is an amplification of a finite corner.** Let `M` be a type II∞ factor on a
separable Hilbert space and `E ≠ 0` a closed subspace whose orthogonal projection `p` is a finite
projection of `M`. Then `M` is star isomorphic to `pMp ⊗̄ B(ℓ²)`, where the corner `pMp` acts on
`E` by the compressions `x ↦ P_E x|_E` of the elements of `M`: a maximal family of mutually
orthogonal projections equivalent to `p` is countable by separability and infinite since `M` is,
it sums to a projection equivalent to `1`, and the partial isometries implementing the
equivalences form a system of matrix units (README, Layer 6; Jones, Definition 9.1.7 and
Proposition 9.1.8, p. 57). For `E = 0` the right side is `0` and the statement fails, which is why
`E ≠ 0` is assumed. -/
theorem nonempty_starAlgEquiv_spatialTensor_of_isTypeIIInfinity
    [TopologicalSpace.SeparableSpace H] {M : VonNeumannAlgebra H} (hM : IsTypeIIInfinity M)
    (E : Submodule ℂ H) [E.HasOrthogonalProjection]
    (hE : IsFiniteProjection M E.starProjection) (hE0 : E ≠ ⊥) :
    Nonempty (M.toStarSubalgebra ≃⋆ₐ[ℂ] (spatialTensor
      {y : E →L[ℂ] E | ∃ x ∈ M, y = E.orthogonalProjectionOnto ∘L x ∘L E.subtypeL}
      (Set.univ : Set (lp (fun _ : ℕ ↦ ℂ) 2 →L[ℂ] lp (fun _ : ℕ ↦ ℂ) 2))).toStarSubalgebra) := by
  sorry

/-- **The Murray–von Neumann type decomposition.** Every von Neumann algebra `M` has unique
pairwise orthogonal central projections `z 0, z 1, z 2, z 3` with sum `1` cutting it into its
type I, II₁, II∞ and III parts (README, Layer 6; Peterson, Theorem 3.3.1, p. 49, with the
projection types of §§3.2–3.3, pp. 44–49):
* type I: every nonzero projection of `M` below `z 0` has a nonzero abelian subprojection;
* type II₁: `z 1` is finite and has no nonzero abelian subprojection;
* type II∞: `z 2` has no nonzero abelian subprojection and no nonzero finite central
  subprojection, and every nonzero projection below it has a nonzero finite subprojection
  (semifiniteness);
* type III: `z 3` has no nonzero finite subprojection.
No separability or σ-finiteness is assumed; for the zero space all four are `0 = 1`. -/
theorem existsUnique_typeDecomposition (M : VonNeumannAlgebra H) :
    ∃! z : Fin 4 → (H →L[ℂ] H),
      (∀ i, IsCentralProjection M (z i)) ∧ (∀ i j, i ≠ j → z i * z j = 0) ∧ ∑ i, z i = 1 ∧
      (∀ q ∈ M, IsStarProjection q → q ≠ 0 → q ≤ z 0 →
        ∃ e, IsAbelianProjection M e ∧ e ≠ 0 ∧ e ≤ q) ∧
      (IsFiniteProjection M (z 1) ∧ ∀ e, IsAbelianProjection M e → e ≤ z 1 → e = 0) ∧
      ((∀ e, IsAbelianProjection M e → e ≤ z 2 → e = 0) ∧
        (∀ w, IsCentralProjection M w → w ≠ 0 → w ≤ z 2 → ¬ IsFiniteProjection M w) ∧
        (∀ q ∈ M, IsStarProjection q → q ≠ 0 → q ≤ z 2 →
          ∃ e, IsFiniteProjection M e ∧ e ≠ 0 ∧ e ≤ q)) ∧
      (∀ e, IsFiniteProjection M e → e ≤ z 3 → e = 0) := by
  sorry

/-! ## Layer 8: Group algebras, actions, and discrete crossed products -/

/-- The left regular representation of a discrete group `Γ` on `ℓ²(Γ)`, realized as `L²(Γ)` for
the counting measure on the discrete σ-algebra: `λ_g` sends `f` to `h ↦ f(g⁻¹ h)`, through
Mathlib's `MeasureTheory.Lp.compMeasurePreservingₗᵢ` and the left invariance of the counting
measure (README, Layer 8). On `ℓ²(ℤ/2) = ℂ²` the nontrivial element acts by the swap matrix. -/
def leftRegular (Γ : Type*) [Group Γ] [MeasurableSpace Γ] [DiscreteMeasurableSpace Γ] (g : Γ) :
    MeasureTheory.Lp ℂ 2 (MeasureTheory.Measure.count : MeasureTheory.Measure Γ) →L[ℂ]
      MeasureTheory.Lp ℂ 2 (MeasureTheory.Measure.count : MeasureTheory.Measure Γ) :=
  (MeasureTheory.Lp.compMeasurePreservingₗᵢ ℂ (fun h ↦ g⁻¹ * h)
    (MeasureTheory.measurePreserving_mul_left _ g⁻¹)).toContinuousLinearMap

/-- The group von Neumann algebra `L(Γ) = λ(Γ)''` of a discrete group, the von Neumann algebra on
`ℓ²(Γ)` generated by the left regular representation, Tau Ceti's `VonNeumannAlgebra.adjoin` of
its range (README, Layer 8; Peterson, Theorem 5.1.3, p. 83). `L(ℤ/2)` is the algebra of
circulant matrices `[[a, b], [b, a]]` on `ℂ²`, and `L(ℤ)` is `L∞(𝕋)` through the Fourier
transform. -/
def groupVonNeumannAlgebra (Γ : Type*) [Group Γ] [MeasurableSpace Γ]
    [DiscreteMeasurableSpace Γ] :
    VonNeumannAlgebra
      (MeasureTheory.Lp ℂ 2 (MeasureTheory.Measure.count : MeasureTheory.Measure Γ)) :=
  VonNeumannAlgebra.adjoin (Set.range (leftRegular Γ))

/-- **The ICC criterion** (Murray–von Neumann). The group von Neumann algebra of a discrete group
`Γ` is a factor exactly when every conjugacy class of `Γ` other than `{1}` is infinite (README,
Layer 8; Peterson, Theorem 5.1.6, p. 84). No countability of `Γ` is assumed. The trivial group
gives the factor `ℂ`; a nontrivial finite or abelian group has a finite nontrivial class and a
nonscalar centre; the free groups of rank at least two are ICC. -/
theorem isFactor_groupVonNeumannAlgebra_iff (Γ : Type*) [Group Γ] [MeasurableSpace Γ]
    [DiscreteMeasurableSpace Γ] :
    IsFactor (groupVonNeumannAlgebra Γ) ↔ ∀ g : Γ, g ≠ 1 → {h : Γ | IsConj g h}.Infinite := by
  sorry

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

/-! ## Layer 10: Affiliated operators and Tomita–Takesaki theory -/

open ClosedSubmodule in
/-- **Tomita's theorem** `JMJ = M'` for a cyclic and separating vector `Ω`. Let `K` be the closed
real span of the vectors `x Ω` with `x ∈ M` self-adjoint, for Mathlib's real inner product
`Re⟪·, ·⟫` scoped in `ClosedSubmodule`. The modular conjugation `J` of `K` is the only antiunitary
involution with `J(K) = K.symplComp` and `0 ≤ Re⟪ξ, J ξ⟫` for `ξ ∈ K`, and `J M J = M'`
(README, V10.StandardRealSubspaces and V10.ModularTheory; Rieffel–van Daele, Proposition 2.3,
pp. 190–191, and Theorem 4.2, p. 201). On `M₂(ℂ)` acting by left multiplication on its
Hilbert–Schmidt space with `Ω = h^{1/2}`, `J` is the adjoint `ξ ↦ ξ*`. Both hypotheses are
needed: for `B(ℂ²)` and its cyclic, non-separating vector `e₁`, `K` has real dimension 3 and
`K.symplComp` real dimension 1, so no isometry carries one onto the other. -/
theorem exists_conj_commutant_eq_of_isCyclic_of_isSeparating {M : VonNeumannAlgebra H} {Ω : H}
    (hc : IsCyclic M Ω) (hs : IsSeparating M Ω) :
    ∃ J : H ≃ₗᵢ⋆[ℂ] H, (∀ ξ, J (J ξ) = ξ) ∧
      (∀ ξ, ξ ∈ (Submodule.span ℝ {η | ∃ x ∈ M, IsSelfAdjoint x ∧ x Ω = η}).closure ↔
        J ξ ∈ (Submodule.span ℝ {η | ∃ x ∈ M, IsSelfAdjoint x ∧ x Ω = η}).closure.symplComp) ∧
      (∀ ξ ∈ (Submodule.span ℝ {η | ∃ x ∈ M, IsSelfAdjoint x ∧ x Ω = η}).closure,
        0 ≤ (inner ℂ ξ (J ξ)).re) ∧
      ∀ y : H →L[ℂ] H, y ∈ M.commutant ↔ ∃ x ∈ M, ∀ ξ, y ξ = J (x (J ξ)) := by
  sorry

/-- **The KMS characterization of the modular group** (Takesaki). A faithful normal state `φ` on
`M` has exactly one one-parameter group `σ` of star automorphisms of `M`, pointwise continuous in
the strong operator topology, for which `φ` satisfies the KMS condition at `β = -1`: for all
`x, y ∈ M` some function `F`, bounded and continuous on the strip `0 ≤ Im z ≤ 1` and holomorphic
inside it, has `F t = φ(σ_t(x) y)` and `F (t + i) = φ(y σ_t(x))` for real `t`. This group is the
modular group `σ_t(x) = Δ^{it} x Δ^{-it}` of `φ`. A weakly continuous automorphism group is
pointwise strongly continuous, so the uniqueness class is Takesaki's (README, V10.KMS; Hiai, §2.2
and Theorem 2.14, pp. 17–18). On `M₂(ℂ)` with `φ = Tr(h ·)` and `h = diag(2/3, 1/3)` it is
`Ad(h^{it})`; for a tracial `φ` it is the identity. -/
theorem existsUnique_isKMS_flow {M : VonNeumannAlgebra H}
    (φ : M.toStarSubalgebra →ₗ[ℂ] ℂ) (hφ1 : φ 1 = 1) (hφ : ∀ x, 0 ≤ φ (star x * x))
    (hφn : IsNormalFunctional M φ) (hφf : ∀ x, φ (star x * x) = 0 → x = 0) :
    ∃! σ : ℝ → (M.toStarSubalgebra ≃⋆ₐ[ℂ] M.toStarSubalgebra),
      (∀ s t, σ (s + t) = (σ t).trans (σ s)) ∧
      (∀ x, Continuous fun t ↦ ContinuousLinearMap.toPointwiseConvergenceCLM ℂ (RingHom.id ℂ) H H
        ((σ t x : M.toStarSubalgebra) : H →L[ℂ] H)) ∧
      ∀ x y, ∃ F : ℂ → ℂ, ContinuousOn F {z | 0 ≤ z.im ∧ z.im ≤ 1} ∧
        DifferentiableOn ℂ F {z | 0 < z.im ∧ z.im < 1} ∧
        Bornology.IsBounded (F '' {z | 0 ≤ z.im ∧ z.im ≤ 1}) ∧
        ∀ t : ℝ, F t = φ (σ t x * y) ∧ F (t + Complex.I) = φ (y * σ t x) := by
  sorry

/-! ## Layer 11: Weights, Connes invariants, and continuous cores -/

/-- **The tensor commutation theorem** (Tomita). For von Neumann algebras `M` on `H` and `N` on
`K`, the commutant of `M ⊗̄ N` on `H ⊗̂ K` is `M′ ⊗̄ N′` (README, Layer 11, proved through standard
forms; Anantharaman–Popa, §5.1, p. 66, footnote 1). The case `N = B(K)`, where the commutant of
`M ⊗̄ B(K)` is `M′ ⊗ 1`, is elementary and proved in Layer 2. For `M = B(H)` and `N = B(K)` both
sides are the scalars. -/
theorem commutant_spatialTensor {K : Type*} [NormedAddCommGroup K] [InnerProductSpace ℂ K]
    [CompleteSpace K] (M : VonNeumannAlgebra H) (N : VonNeumannAlgebra K) :
    (spatialTensor (M : Set (H →L[ℂ] H)) (N : Set (K →L[ℂ] K))).commutant =
      spatialTensor (M.commutant : Set (H →L[ℂ] H)) (N.commutant : Set (K →L[ℂ] K)) := by
  sorry

/-! ## Layer 12: Two projections, ultraproducts, and central sequences -/

/-- **Halmos's two-projection theorem.** Two projections `p` and `q` on `H` in general position,
meaning that `ran p ∩ ran q`, `ran p ∩ ker q`, `ker p ∩ ran q` and `ker p ∩ ker q` are all `0`, are
simultaneously unitarily equivalent to `diag(1, 0)` and
`[[b, √(b(1 − b))], [√(b(1 − b)), 1 − b]]` on `L ⊕ L`, for a positive contraction `b` on a Hilbert
space `L` with `ker b = ker (1 − b) = 0`; so the von Neumann algebra they generate is
`W*(b) ⊗ M₂(ℂ)` with `W*(b)` abelian (README, Layer 12; Jones, Exercises 7.3.2 and 7.3.8,
p. 47). The general-position part of an arbitrary pair, the complement of the four
intersections, is such a pair on a reducing subspace. On `ℂ²`, `p = diag(1, 0)` and the
projection onto the line through `(cos θ, sin θ)`, `0 < θ < π/2`, give `L = ℂ` and `b = cos² θ`. -/
theorem exists_linearIsometryEquiv_withLp_of_generalPosition {p q : H →L[ℂ] H}
    (hp : IsStarProjection p) (hq : IsStarProjection q)
    (h₁ : LinearMap.range (p : H →ₗ[ℂ] H) ⊓ LinearMap.range (q : H →ₗ[ℂ] H) = ⊥)
    (h₂ : LinearMap.range (p : H →ₗ[ℂ] H) ⊓ LinearMap.ker (q : H →ₗ[ℂ] H) = ⊥)
    (h₃ : LinearMap.ker (p : H →ₗ[ℂ] H) ⊓ LinearMap.range (q : H →ₗ[ℂ] H) = ⊥)
    (h₄ : LinearMap.ker (p : H →ₗ[ℂ] H) ⊓ LinearMap.ker (q : H →ₗ[ℂ] H) = ⊥) :
    ∃ (L : Type u) (_ : NormedAddCommGroup L) (_ : InnerProductSpace ℂ L) (_ : CompleteSpace L)
      (b : L →L[ℂ] L) (U : H ≃ₗᵢ[ℂ] WithLp 2 (L × L)),
      0 ≤ b ∧ b ≤ 1 ∧ LinearMap.ker (b : L →ₗ[ℂ] L) = ⊥ ∧
      LinearMap.ker ((1 - b : L →L[ℂ] L) : L →ₗ[ℂ] L) = ⊥ ∧
      ∀ ξ η : L,
        U (p (U.symm (WithLp.toLp 2 (ξ, η)))) = WithLp.toLp 2 (ξ, 0) ∧
        U (q (U.symm (WithLp.toLp 2 (ξ, η)))) =
          WithLp.toLp 2 (b ξ + CFC.sqrt (b * (1 - b)) η,
            CFC.sqrt (b * (1 - b)) ξ + (1 - b) η) := by
  sorry

/-- Property Γ of a II₁ factor in Dixmier's form: for a tracial state `τ` of `M` there is a
sequence of unitaries `u_n ∈ M` with `τ(u_n) = 0` that is asymptotically central in the trace
norm, `‖u_n y − y u_n‖₂ → 0` for every `y ∈ M`, where `‖z‖₂² = τ(z* z)` (README, Layer 12; the form
of Anantharaman–Popa, Theorem 15.2.3(iv), p. 262; Jones, Definition 16.1.1, p. 113, defines Γ
by a nontrivial central sequence; for separable II₁ factors the equivalence of the two, and
with the finite-set form, is a README target: Anantharaman–Popa, Theorem 15.2.3, p. 262, with
Remarks 15.2.2, p. 262). The predicate is meant for II₁ factors, whose
tracial state is unique. `M₂(ℂ)` does not have it: a limit point of such a sequence would be a
central unitary of trace `0`, while the central unitaries are scalars of modulus one. -/
def HasPropertyGamma (M : VonNeumannAlgebra H) : Prop :=
  ∃ τ : M.toStarSubalgebra →ₗ[ℂ] ℂ, IsTracialState M τ ∧
    ∃ u : ℕ → M.toStarSubalgebra,
      (∀ n, star (u n) * u n = 1 ∧ u n * star (u n) = 1 ∧ τ (u n) = 0) ∧
      ∀ y, Tendsto (fun n ↦ (τ (star (u n * y - y * u n) * (u n * y - y * u n))).re) atTop (𝓝 0)

/-- **The free group factors lack property Γ** (Murray–von Neumann). For a free group on a set of
at least two generators, `L(F)` does not have property Γ: with `Δ` the reduced words ending in a
nonzero power of a generator `g` and `h` a second generator, the estimate
`‖x − τ(x)1‖₂ ≤ 14 max(‖[x, u_g]‖₂, ‖[x, u_h]‖₂, ‖[x, u_{h⁻¹}]‖₂)` holds for all `x`, and a
trace-zero unitary has `‖x − τ(x)1‖₂ = 1` (README, Layer 12; Jones, Theorems 16.3.1 and 16.3.2,
pp. 114–115). The rank need not be finite. With `hasPropertyGamma_of_isHyperfinite` it shows
that these factors are not hyperfinite, hence not `R`. -/
theorem not_hasPropertyGamma_groupVonNeumannAlgebra_freeGroup (α : Type*) [Nontrivial α]
    [MeasurableSpace (FreeGroup α)] [DiscreteMeasurableSpace (FreeGroup α)] :
    ¬ HasPropertyGamma (groupVonNeumannAlgebra (FreeGroup α)) := by
  sorry

/-- `M` has a nonzero central summand of type I₂: a nonzero central projection `z = e + f` that is
the sum of two orthogonal equivalent projections `e ∼ f` of `M` with `eMe` commutative, so that
`zM ≅ M₂(eMe)` with `eMe` abelian. `M₂(ℂ)` and `M₂(ℂ) ⊕ M₃(ℂ)` have one; `M₃(ℂ)`, `M₄(ℂ)`, the
abelian algebras and the II₁ factors do not. -/
def HasTypeITwoSummand (M : VonNeumannAlgebra H) : Prop :=
  ∃ e f : H →L[ℂ] H, ProjectionEquivalent M e f ∧ e * f = 0 ∧ e + f ≠ 0 ∧
    e + f ∈ M.commutant ∧ IsAbelianProjection M e

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

/-- **Hyperfinite II₁ factors have property Γ.** If `M = (⋃ₙ Aₙ)''` for an increasing sequence of
finite-dimensional subalgebras, the relative commutant of each `Aₙ` in the II₁ factor `M`
contains a self-adjoint unitary `uₙ = 2eₙ − 1` with `τ(eₙ) = 1/2`, and these are asymptotically
central in the trace norm, exactly so on `⋃ₙ Aₙ` and by Kaplansky density on `M` (README, V13b
and Layer 12; Jones, §16.2, pp. 113–114, for the tensor model `R = ⊗ M₂(ℂ)`, where `uₙ` is
`diag(1, −1)` at the `n`-th site). -/
theorem hasPropertyGamma_of_isHyperfinite {M : VonNeumannAlgebra H} (hM : IsTypeIIOne M)
    (hR : IsHyperfinite M) : HasPropertyGamma M := by
  sorry

/-- **Connes's theorem: injective equals hyperfinite.** A von Neumann algebra with separable
predual, here acting on a separable Hilbert space, is injective exactly when it is hyperfinite
(README, V13b; Connes's theorem as recalled in Hiai, §1.8, p. 9, and in the Notes to Chapter 11
of Anantharaman–Popa, p. 189, with the classification-independent proof of Takesaki III, XVI.1.9
and XVI.1.22–1.23).
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
