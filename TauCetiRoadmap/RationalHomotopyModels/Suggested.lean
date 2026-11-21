module

public import Mathlib
public import TauCeti.Algebra.Homology.DG.Algebra.Hom.Cohomology
public import TauCeti.Algebra.Homology.DG.Algebra.BaseChange

/-!
# Rational homotopy models: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, with only the definitions
their statements need. Every DG algebra is Tau Ceti's `TauCeti.IsDGAlgebra` on an internally
`ℤ`-graded algebra, its morphisms are `TauCeti.DGAlgHom`, and quasi-isomorphisms are morphisms
whose `TauCeti.DGAlgHom.cohomologyMap` is bijective. Graded commutativity of a DG algebra is
DerivedDeRhamCohomology §2.21's predicate; it is not at the pins, so its defining identity
`a * b = (p * q).negOnePow • (b * a)` on homogeneous `a ∈ Aᵖ`, `b ∈ A^q` is written in place
as a hypothesis wherever a statement needs it.

Definitions (README Layer 1 and 7.1): `positivePart`, `ExponentVector`, `standardMonomial`,
`IsFreeGradedCommutative` (a free graded-commutative algebra `ΛV` presented by homogeneous
generators), `IsSullivanAlgebra`, `IsMinimalSullivanAlgebra` and `IsFormal`.

Headline theorems stated here:

* README 1.1, `IsFreeGradedCommutative.existsUnique_algHom`: the universal property of `ΛV`.
* README 1.2, `IsSullivanAlgebra.isMinimal_iff`: a Sullivan algebra is minimal exactly when its
  differential induces zero on the indecomposables `A⁺ / A⁺ · A⁺`.
* README 1.3, `IsFreeGradedCommutative.exists_dgAlgHom_iff`: an algebra map out of `ΛV` is a DG
  map exactly when it commutes with the differentials on the generators.
* README 2.2, `IsSullivanAlgebra.exists_lift`: the lifting lemma through a surjective
  quasi-isomorphism.
* README 3.1, `exists_minimalModel`: every connected commutative DG algebra has a minimal
  Sullivan model.
* README 3.2, `exists_iMinimalModel`: `i`-minimal models, `1`-minimal models among them.
* README 3.3, `IsMinimalSullivanAlgebra.bijective_of_bijective_cohomologyMap`: a
  quasi-isomorphism between minimal Sullivan algebras is an isomorphism.
* README 3.4, `exists_iso_of_minimalModels`: two minimal models of the same algebra are isomorphic.
* README 3.5, `IsMinimalSullivanAlgebra.baseChange`: minimality is preserved by extension of
  scalars.
* README 3.5, `exists_baseChange_quasiIso`: the base change of a quasi-isomorphism is a
  quasi-isomorphism.
* README 3.5, `exists_baseChange_iMinimal`: the base change of a map with the cohomology conditions
  of an `i`-minimal model has them.
* README 7.2, `IsMinimalSullivanAlgebra.isFormal_of_complement`: the Deligne–Griffiths–Morgan–
  Sullivan sufficient criterion for formality of a minimal Sullivan algebra.
* README 7.3, `isFormal_of_ddc`: a commutative DG algebra satisfying the `ddᶜ`-lemma is formal.

Not stated: README 2.1, 2.3 and 2.4 (polynomial homotopies, the square `Λ(t, dt) ⊗ Λ(t, dt)` and the
bijection `[M, A] ≅ [M, B]`), lacking the polynomial interval `Λ(t, dt)` as a `ℤ`-graded
`GradedAlgebra` on which `TauCeti.isDGAlgebra_gradedTensorGrading` could form `A ⊗ Λ(t, dt)`; for
the same reason, the statements up to homotopy of README 3.4 (compatibility and uniqueness of the
isomorphism, and the lifting of automorphisms); README 2.5, the model structure, and the
characterisation of cofibrant objects in README 3.1, lacking that interval and the commutative DG
algebras as a category. Not stated: README Layer 4 (polynomial forms `A_PL` and the polynomial de
Rham theorem), lacking the simplicial commutative DG algebra
`Λ(t₀, …, tₙ, dt₀, …, dtₙ)/(∑ tᵢ − 1, ∑ dtᵢ)` on a pinned carrier and the cohomology ring of a
simplicial set; README Layer 5, lacking a differential graded Lie algebra with Koszul signs on a
pinned carrier (Mathlib's `GradedLieAlgebra` has no signs), the Chevalley–Eilenberg cochains of a
graded Lie algebra and cocommutative DG coalgebras; README Layer 6, lacking Layer 4, the spatial
realization and, for Quillen's functor `λ` and equivalence (README 6.4, 6.5), the Kan loop group,
complete Hopf algebras and simplicial Lie algebras; README 7.4, compact Kähler manifolds, lacking
compact Kähler manifolds on a pinned carrier and the graded ring structure on
`⨁ₖ TauCeti.SmoothForm I M ℝ k` that makes it a `TauCeti.IsDGAlgebra`, itself a target of README
7.4.

Conventions (README §Conventions): cohomological grading, differentials of degree `+1`;
generators of Sullivan algebras have degree `≥ 1`; the ground field has characteristic zero
wherever a theorem needs it.
-/

@[expose] public section

namespace TauCetiRoadmap.RationalHomotopyModels

open TauCeti TensorProduct

universe u v w

/-! ## Layer 1: free graded-commutative algebras and Sullivan algebras -/

section Layer1

variable {K : Type u} [Field K] {A : Type v} [Ring A] [Algebra K A]
  (𝒜 : ℤ → Submodule K A) [GradedAlgebra 𝒜]

/-- The positive part `A⁺ = ⨁_{p > 0} Aᵖ` of an internally `ℤ`-graded algebra (README 1.2). -/
def positivePart : Submodule K A :=
  ⨆ (p : ℤ) (_ : 0 < p), 𝒜 p

/-- Exponent vectors of standard monomials in generators of degrees `deg`: finitely supported,
with every generator of odd degree occurring at most once (README 1.1). -/
def ExponentVector {ι : Type w} (deg : ι → ℕ) : Type w :=
  {f : ι →₀ ℕ // ∀ i, Odd (deg i) → f i ≤ 1}

variable {𝒜}

/-- The standard monomial `x_{i₁}^{f i₁} ⋯ x_{i_k}^{f i_k}`, `i₁ < ⋯ < i_k`, of an exponent
vector `f` (README 1.1). -/
def standardMonomial {ι : Type w} [LinearOrder ι] (x : ι → A) (f : ι →₀ ℕ) : A :=
  ((f.support.sort (· ≤ ·)).map fun i => x i ^ f i).prod

variable (𝒜)

/-- `A` is the free graded-commutative algebra `ΛV` on the homogeneous generators `x i` of
degrees `deg i`: the generators commute up to the Koszul sign, and the standard monomials form a
basis of `A` (README 1.1). -/
structure IsFreeGradedCommutative {ι : Type w} [LinearOrder ι] (x : ι → A) (deg : ι → ℕ) :
    Prop where
  /-- Each generator is homogeneous of its degree. -/
  mem : ∀ i, x i ∈ 𝒜 (deg i)
  /-- The generators commute up to the Koszul sign. -/
  mul_comm : ∀ i j, x i * x j = (((deg i : ℤ) * deg j).negOnePow) • (x j * x i)
  /-- The standard monomials are linearly independent. -/
  linearIndependent : LinearIndependent K fun f : ExponentVector deg => standardMonomial x f.1
  /-- The standard monomials span. -/
  span_eq_top :
    Submodule.span K (Set.range fun f : ExponentVector deg => standardMonomial x f.1) = ⊤

/-- A Sullivan algebra `(ΛV, d)`: `ΛV` free graded-commutative on well-ordered generators of
positive degree, with the differential of each generator in the subalgebra generated by the
earlier ones (README 1.2). -/
structure IsSullivanAlgebra (d : A →ₗ[K] A) {ι : Type w} [LinearOrder ι] [WellFoundedLT ι]
    (x : ι → A) (deg : ι → ℕ) : Prop extends IsFreeGradedCommutative 𝒜 x deg where
  /-- Every generator has positive degree. -/
  deg_pos : ∀ i, 0 < deg i
  /-- The differential of a generator lies in the subalgebra generated by the earlier ones. -/
  d_mem_adjoin : ∀ i, d (x i) ∈ Algebra.adjoin K (x '' Set.Iio i)

/-- A minimal Sullivan algebra: the differential of every generator is decomposable, in
`A⁺ · A⁺` (README 1.2). -/
structure IsMinimalSullivanAlgebra (d : A →ₗ[K] A) {ι : Type w} [LinearOrder ι]
    [WellFoundedLT ι] (x : ι → A) (deg : ι → ℕ) : Prop extends IsSullivanAlgebra 𝒜 d x deg where
  /-- The differential of each generator is decomposable. -/
  d_mem_mul : ∀ i, d (x i) ∈ positivePart 𝒜 * positivePart 𝒜

variable {𝒜} {ι : Type w} [LinearOrder ι] {x : ι → A} {deg : ι → ℕ}

/-- README 1.1. Universal property of `ΛV`: for a graded-commutative `B` and elements
`b i ∈ B^{deg i}` there is a unique algebra map `ΛV → B` sending `x i` to `b i` (Félix–Halperin–
Thomas, §3; Hess, §1, before Definition 1.10). -/
theorem IsFreeGradedCommutative.existsUnique_algHom [CharZero K]
    (hx : IsFreeGradedCommutative 𝒜 x deg) {B : Type*} [Ring B] [Algebra K B]
    (ℬ : ℤ → Submodule K B) [GradedAlgebra ℬ]
    (hB : ∀ {p q : ℤ} {a b : B}, a ∈ ℬ p → b ∈ ℬ q → a * b = (p * q).negOnePow • (b * a))
    (b : ι → B) (hb : ∀ i, b i ∈ ℬ (deg i)) :
    ∃! φ : A →ₐ[K] B, ∀ i, φ (x i) = b i := sorry

/-- README 1.3. An algebra map out of `ΛV` sending each generator to an element of its degree is
a morphism of DG algebras exactly when it commutes with the differentials on the generators
(Morgan, Definition 5.1 and the note after it). -/
theorem IsFreeGradedCommutative.exists_dgAlgHom_iff {d : A →ₗ[K] A} (hA : IsDGAlgebra 𝒜 d)
    (hx : IsFreeGradedCommutative 𝒜 x deg) {B : Type*} [Ring B] [Algebra K B]
    {ℬ : ℤ → Submodule K B} [GradedAlgebra ℬ] {dB : B →ₗ[K] B} (hB : IsDGAlgebra ℬ dB)
    (φ : A →ₐ[K] B) (hφ : ∀ i, φ (x i) ∈ ℬ (deg i)) :
    (∃ f : DGAlgHom hA hB, ∀ a, f a = φ a) ↔ ∀ i, dB (φ (x i)) = φ (d (x i)) := sorry

/-- README 1.2. A Sullivan algebra is minimal exactly when `d (A⁺) ⊆ A⁺ · A⁺`, that is, when the
differential induced on the indecomposables `A⁺ / A⁺ · A⁺` is zero (Morgan, Definition 5.2 and
the note after it). -/
theorem IsSullivanAlgebra.isMinimal_iff [WellFoundedLT ι] {d : A →ₗ[K] A}
    (hA : IsDGAlgebra 𝒜 d) (hx : IsSullivanAlgebra 𝒜 d x deg) :
    IsMinimalSullivanAlgebra 𝒜 d x deg ↔
      (positivePart 𝒜).map d ≤ positivePart 𝒜 * positivePart 𝒜 := sorry

end Layer1

/-! ## Layer 2: homotopy and lifting -/

section Layer2

variable {K : Type u} [Field K] [CharZero K] {A : Type v} [Ring A] [Algebra K A]
  {𝒜 : ℤ → Submodule K A} [GradedAlgebra 𝒜] {d : A →ₗ[K] A}
  {ι : Type w} [LinearOrder ι] [WellFoundedLT ι] {x : ι → A} {deg : ι → ℕ}

/-- README 2.2. The lifting lemma: a morphism from a Sullivan algebra lifts through every
surjective quasi-isomorphism of DG algebras whose source is graded-commutative (Hess,
Proposition 1.13; Sullivan, Proposition (3.5) for lifting up to homotopy). -/
theorem IsSullivanAlgebra.exists_lift (hA : IsDGAlgebra 𝒜 d) (hx : IsSullivanAlgebra 𝒜 d x deg)
    {B : Type*} [Ring B] [Algebra K B] {ℬ : ℤ → Submodule K B} [GradedAlgebra ℬ]
    {dB : B →ₗ[K] B} (hB : IsDGAlgebra ℬ dB)
    (hBc : ∀ {p q : ℤ} {a b : B}, a ∈ ℬ p → b ∈ ℬ q → a * b = (p * q).negOnePow • (b * a))
    {C : Type*} [Ring C] [Algebra K C] {𝒞 : ℤ → Submodule K C} [GradedAlgebra 𝒞]
    {dC : C →ₗ[K] C} (hC : IsDGAlgebra 𝒞 dC) (π : DGAlgHom hB hC)
    (hπ : Function.Surjective π) (hπq : Function.Bijective π.cohomologyMap)
    (g : DGAlgHom hA hC) :
    ∃ h : DGAlgHom hA hB, π.comp h = g := sorry

end Layer2

/-! ## Layer 3: minimal models -/

section Layer3

variable {K : Type u} [Field K] [CharZero K] {A : Type v} [Ring A] [Algebra K A]
  {𝒜 : ℤ → Submodule K A} [GradedAlgebra 𝒜] {d : A →ₗ[K] A}

/-- README 3.1. A commutative DG algebra concentrated in nonnegative degrees with `H⁰ = K` has a
minimal Sullivan model: a minimal Sullivan algebra with a quasi-isomorphism to it (Morgan,
Theorem 5.6 with `i = ∞`; Sullivan, §5). -/
theorem exists_minimalModel (hA : IsDGAlgebra 𝒜 d)
    (hAc : ∀ {p q : ℤ} {a b : A}, a ∈ 𝒜 p → b ∈ 𝒜 q → a * b = (p * q).negOnePow • (b * a))
    (hneg : ∀ p < 0, 𝒜 p = ⊥) (hconn : Module.finrank K (hA.cohomologyGrading 0) = 1) :
    ∃ (M : Type (max u v)) (_ : Ring M) (_ : Algebra K M) (ℳ : ℤ → Submodule K M)
      (_ : GradedAlgebra ℳ) (dM : M →ₗ[K] M) (hM : IsDGAlgebra ℳ dM) (ι : Type (max u v))
      (_ : LinearOrder ι) (_ : WellFoundedLT ι) (x : ι → M) (deg : ι → ℕ),
      IsMinimalSullivanAlgebra ℳ dM x deg ∧
        ∃ f : DGAlgHom hM hA, Function.Bijective f.cohomologyMap := sorry

/-- README 3.2. For every `i`, the same algebra has an `i`-minimal model: a minimal Sullivan
algebra generated in degrees `≤ i` with a morphism inducing isomorphisms on cohomology in degrees
`≤ i` and an injection in degree `i + 1` (Morgan, Definition 5.3 and Theorem 5.6). -/
theorem exists_iMinimalModel (hA : IsDGAlgebra 𝒜 d)
    (hAc : ∀ {p q : ℤ} {a b : A}, a ∈ 𝒜 p → b ∈ 𝒜 q → a * b = (p * q).negOnePow • (b * a))
    (hneg : ∀ p < 0, 𝒜 p = ⊥) (hconn : Module.finrank K (hA.cohomologyGrading 0) = 1)
    (i : ℕ) :
    ∃ (M : Type (max u v)) (_ : Ring M) (_ : Algebra K M) (ℳ : ℤ → Submodule K M)
      (_ : GradedAlgebra ℳ) (dM : M →ₗ[K] M) (hM : IsDGAlgebra ℳ dM) (ι : Type (max u v))
      (_ : LinearOrder ι) (_ : WellFoundedLT ι) (x : ι → M) (deg : ι → ℕ),
      IsMinimalSullivanAlgebra ℳ dM x deg ∧ (∀ j, deg j ≤ i) ∧
        ∃ f : DGAlgHom hM hA,
          (∀ p : ℤ, p ≤ i →
            Set.BijOn f.cohomologyMap (hM.cohomologyGrading p) (hA.cohomologyGrading p)) ∧
          Set.InjOn f.cohomologyMap (hM.cohomologyGrading (i + 1)) := sorry

/-- README 3.3. A quasi-isomorphism between minimal Sullivan algebras is an isomorphism (Morgan,
Proposition 5.9 with `i = ∞`; Hess, Proposition 1.18 for the relative form; Sullivan,
Corollary (4.2) for the twisted-coefficient form without the ordering condition). -/
theorem IsMinimalSullivanAlgebra.bijective_of_bijective_cohomologyMap
    {ι : Type w} [LinearOrder ι] [WellFoundedLT ι] {x : ι → A} {deg : ι → ℕ}
    (hA : IsDGAlgebra 𝒜 d) (hx : IsMinimalSullivanAlgebra 𝒜 d x deg)
    {B : Type*} [Ring B] [Algebra K B] {ℬ : ℤ → Submodule K B} [GradedAlgebra ℬ]
    {dB : B →ₗ[K] B} (hB : IsDGAlgebra ℬ dB) {κ : Type*} [LinearOrder κ] [WellFoundedLT κ]
    {y : κ → B} {deg' : κ → ℕ} (hy : IsMinimalSullivanAlgebra ℬ dB y deg')
    (f : DGAlgHom hA hB) (hf : Function.Bijective f.cohomologyMap) :
    Function.Bijective f := sorry

/-- README 3.4. Two minimal Sullivan models of the same commutative DG algebra are isomorphic
(Morgan, Theorem 5.6; Hess, Proposition 1.18). -/
theorem exists_iso_of_minimalModels (hA : IsDGAlgebra 𝒜 d)
    (hAc : ∀ {p q : ℤ} {a b : A}, a ∈ 𝒜 p → b ∈ 𝒜 q → a * b = (p * q).negOnePow • (b * a))
    (hneg : ∀ p < 0, 𝒜 p = ⊥) {M : Type*} [Ring M] [Algebra K M] {ℳ : ℤ → Submodule K M}
    [GradedAlgebra ℳ]
    {dM : M →ₗ[K] M} (hM : IsDGAlgebra ℳ dM) {ι : Type*} [LinearOrder ι] [WellFoundedLT ι]
    {x : ι → M} {deg : ι → ℕ} (hx : IsMinimalSullivanAlgebra ℳ dM x deg)
    {N : Type*} [Ring N] [Algebra K N] {𝒩 : ℤ → Submodule K N} [GradedAlgebra 𝒩]
    {dN : N →ₗ[K] N} (hN : IsDGAlgebra 𝒩 dN) {κ : Type*} [LinearOrder κ] [WellFoundedLT κ]
    {y : κ → N} {deg' : κ → ℕ} (hy : IsMinimalSullivanAlgebra 𝒩 dN y deg')
    (f : DGAlgHom hM hA) (hf : Function.Bijective f.cohomologyMap)
    (g : DGAlgHom hN hA) (hg : Function.Bijective g.cohomologyMap) :
    ∃ e : DGAlgHom hM hN, Function.Bijective e := sorry

/-- README 3.5. Extension of scalars along a field extension `K → L` carries a minimal Sullivan
algebra `(ΛV, d)` to the minimal Sullivan algebra `(Λ(L ⊗ V), 1 ⊗ d)` on the same generators
(the conditions of Morgan, Definition 5.3, which are preserved because `L ⊗_K −` is exact). -/
theorem IsMinimalSullivanAlgebra.baseChange {ι : Type w} [LinearOrder ι] [WellFoundedLT ι]
    {x : ι → A} {deg : ι → ℕ} (hx : IsMinimalSullivanAlgebra 𝒜 d x deg)
    (L : Type*) [Field L] [Algebra K L] :
    IsMinimalSullivanAlgebra (fun p ↦ (𝒜 p).baseChange L) (d.baseChange L)
      (fun i ↦ (1 : L) ⊗ₜ[K] x i) deg := sorry

/-- README 3.5. The base change `L ⊗_K M → L ⊗_K A` of a quasi-isomorphism `f : M → A` along a
field extension `K → L` is a quasi-isomorphism, so the base change of a minimal model is a minimal
model (the conditions of Morgan, Definition 5.3, which are preserved because `L ⊗_K −` is
exact). -/
theorem exists_baseChange_quasiIso (hA : IsDGAlgebra 𝒜 d)
    {M : Type*} [Ring M] [Algebra K M] {ℳ : ℤ → Submodule K M} [GradedAlgebra ℳ]
    {dM : M →ₗ[K] M} (hM : IsDGAlgebra ℳ dM)
    (f : DGAlgHom hM hA) (hf : Function.Bijective f.cohomologyMap)
    (L : Type*) [Field L] [Algebra K L] :
    ∃ F : DGAlgHom (hM.baseChange L) (hA.baseChange L),
      (∀ m : M, F ((1 : L) ⊗ₜ[K] m) = (1 : L) ⊗ₜ[K] f m) ∧
        Function.Bijective F.cohomologyMap := sorry

/-- README 3.5. The base change `L ⊗_K M → L ⊗_K A` of a map `f : M → A` inducing isomorphisms on
cohomology in degrees `≤ i` and an injection in degree `i + 1` has the same property, so the base
change of an `i`-minimal model is an `i`-minimal model (the conditions of Morgan, Definition 5.3,
which are preserved because `L ⊗_K −` is exact). -/
theorem exists_baseChange_iMinimal (hA : IsDGAlgebra 𝒜 d)
    {M : Type*} [Ring M] [Algebra K M] {ℳ : ℤ → Submodule K M} [GradedAlgebra ℳ]
    {dM : M →ₗ[K] M} (hM : IsDGAlgebra ℳ dM) (f : DGAlgHom hM hA) (i : ℕ)
    (hbij : ∀ p : ℤ, p ≤ i →
      Set.BijOn f.cohomologyMap (hM.cohomologyGrading p) (hA.cohomologyGrading p))
    (hinj : Set.InjOn f.cohomologyMap (hM.cohomologyGrading (i + 1)))
    (L : Type*) [Field L] [Algebra K L] :
    ∃ F : DGAlgHom (hM.baseChange L) (hA.baseChange L),
      (∀ m : M, F ((1 : L) ⊗ₜ[K] m) = (1 : L) ⊗ₜ[K] f m) ∧
        (∀ p : ℤ, p ≤ i → Set.BijOn F.cohomologyMap ((hM.baseChange L).cohomologyGrading p)
          ((hA.baseChange L).cohomologyGrading p)) ∧
        Set.InjOn F.cohomologyMap ((hM.baseChange L).cohomologyGrading (i + 1)) := sorry

end Layer3

/-! ## Layer 7: formality -/

section Layer7

variable {K : Type u} [Field K] {A : Type v} [Ring A] [Algebra K A]
  {𝒜 : ℤ → Submodule K A} [GradedAlgebra 𝒜] {d : A →ₗ[K] A}

/-- A DG algebra is formal when a graded-commutative DG algebra maps to it and to its cohomology
algebra, with zero differential, by quasi-isomorphisms (README 7.1; Deligne–Griffiths–Morgan–
Sullivan, §4, Definition; Hess, Definition 2.1). -/
def IsFormal (hA : IsDGAlgebra 𝒜 d) : Prop :=
  ∃ (M : Type (max u v)) (_ : Ring M) (_ : Algebra K M) (ℳ : ℤ → Submodule K M)
    (_ : GradedAlgebra ℳ) (dM : M →ₗ[K] M) (hM : IsDGAlgebra ℳ dM),
    (∀ {p q : ℤ} {a b : M}, a ∈ ℳ p → b ∈ ℳ q → a * b = (p * q).negOnePow • (b * a)) ∧
    (∃ f : DGAlgHom hM hA, Function.Bijective f.cohomologyMap) ∧
    ∃ g : DGAlgHom hM (isDGAlgebra_zero hA.cohomologyGrading),
      Function.Bijective g.cohomologyMap

/-- README 7.2. A minimal Sullivan algebra is formal when, in every degree, the span of the
generators has a complement to its closed elements such that every closed element of the ideal
generated by the complements is exact (Deligne–Griffiths–Morgan–Sullivan, Theorem 4.1, the "if"
half). -/
theorem IsMinimalSullivanAlgebra.isFormal_of_complement [CharZero K] {ι : Type w}
    [LinearOrder ι] [WellFoundedLT ι] {x : ι → A} {deg : ι → ℕ} (hA : IsDGAlgebra 𝒜 d)
    (hx : IsMinimalSullivanAlgebra 𝒜 d x deg) (N : ℕ → Submodule K A)
    (hN : ∀ p, N p ⊓ (Submodule.span K (x '' {i | deg i = p}) ⊓ LinearMap.ker d) = ⊥ ∧
      N p ⊔ (Submodule.span K (x '' {i | deg i = p}) ⊓ LinearMap.ker d) =
        Submodule.span K (x '' {i | deg i = p}))
    (hexact : ∀ a ∈ Ideal.span (⋃ p, (N p : Set A)), d a = 0 → a ∈ LinearMap.range d) :
    IsFormal hA := sorry

/-- README 7.3. A graded-commutative DG algebra with a second differential `dᶜ` of degree `+1`
anticommuting with `d` and satisfying the `ddᶜ`-lemma is formal (Deligne–Griffiths–Morgan–
Sullivan, §6, the `dᶜ`-diagram method in the proof of the Main Theorem). -/
theorem isFormal_of_ddc [CharZero K] (hA : IsDGAlgebra 𝒜 d)
    (hAc : ∀ {p q : ℤ} {a b : A}, a ∈ 𝒜 p → b ∈ 𝒜 q → a * b = (p * q).negOnePow • (b * a))
    (dc : A →ₗ[K] A) (hdc : IsDGAlgebra 𝒜 dc) (hanti : ∀ a, d (dc a) = -dc (d a))
    (hddc : ∀ a, d a = 0 → dc a = 0 → ((∃ b, a = d b) ∨ ∃ c, a = dc c) → ∃ e, a = d (dc e)) :
    IsFormal hA := sorry

end Layer7

end TauCetiRoadmap.RationalHomotopyModels
