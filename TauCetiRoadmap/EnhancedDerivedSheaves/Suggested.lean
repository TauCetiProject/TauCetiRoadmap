module

public import Mathlib

/-!
# Enhanced derived sheaves: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap.

The statable headlines are the local smallness of the derived category of a Grothendieck
abelian category, which makes `HasDerivedCategory` a global instance in the universe of the
Grothendieck abelian structure; invertible objects of a monoidal category as the units of
Mathlib's skeleton monoid; the global projective-dimension bound for regular rings, both
implications of Kunz's theorem, radical/flat/idempotent Frobenius-root ideals, Tor independence
and homological bounds for perfect algebras (including the intrinsic Tor bound twice the
Krull dimension), finite freeness of bounded saturated valuation
lattices, cofinal invariance of pro-zero towers and composition of pro-isomorphisms, and the
telescope, classical-completeness and weak-Serre comparisons for derived-complete modules.

Design choice made explicit: Mathlib's `DerivedCategory` of a Grothendieck abelian category, in
particular of étale module sheaves `Sheaf X.smallEtaleTopology (ModuleCat.{u} Λ)`, uses the one
instance `IsGrothendieckAbelian.hasDerivedCategory`, whose morphisms lie in the universe of the
Grothendieck abelian structure; no statement assumes `HasDerivedCategory.standard` or a separately
chosen instance.

The following headline families are not statable at the pins:
* Layers E0, 0 and E1: dg-nerve stability, presentability and the enhanced sheaf comparisons
  lack the dg nerve, coherent mapping-space framework and enhanced ringed-site category D∞(O).
  The functorial K-flat replacement of étale module sheaves and the derived tensor product on
  their derived category lack K-flat complexes and a monoidal structure on Mathlib's
  `DerivedCategory`. Tensor–Hom, Koszul realization, perfect-scheme base change and
  algebraic-space perfect pushforward additionally need enhanced functors and
  quasicoherent/perfect subcategories.
* Layer E3: relative Kan-extension lifting, representability, adjoints and accessible
  localization lack the supplied coherent functor categories and presentability carriers.
* Layer E2:towers: multiplicative limit filtrations lack coherent stable towers and mapping
  spectra. Layer E2: slice and cover invariance, relative-tower epimorphisms and countable-product
  exactness lack the supplied repleteness predicate of SchemeAndStackFoundations §2.17 in the
  pinned libraries. Enhanced Postnikov convergence and hypercover/h-descent additionally lack
  D∞(O), sheaves of spaces and coherent hypercovers.
* Layer E4: sheaf completion and coefficient-system reconstruction lack local enhanced
  completion, completed tensor and coherent coefficient-system categories.
* Layers E5:abstract, E5:presentability and E5:descent: Barr–Beck–Lurie, Ind comparisons,
  dualizability and descendable module descent lack the supplied operadic/module categories,
  higher Ind and presentable-category tensor products.
* Layers E5:animation and E5:cotangent-export: animation, Frobenius, Witt vectors and cotangent
  comparisons lack animated rings, their modules and their coherent cotangent and power functors.
* Layer E5:spectra-comparison: Eilenberg–Mac Lane module and concrete-spectrum comparisons
  lack spectra, ring spectra and their enhanced module and tower categories.
-/

@[expose] public section

namespace TauCetiRoadmap.EnhancedDerivedSheaves

open CategoryTheory CategoryTheory.Limits Opposite
open scoped ZeroObject

universe u v w z

/-! ## Layer 0: Ringed-site enhancement and derived functors -/

section GrothendieckAbelian

variable (C : Type u) [Category.{v} C] [Abelian C] [IsGrothendieckAbelian.{w} C]

/-- **Small Hom types in the derived category**
(`IsGrothendieckAbelian.locallySmall_localization_quasiIso`, Section 0.1; Stacks 079P): in a
Grothendieck abelian category every complex has a K-injective replacement, so the localization of
cochain complexes at quasi-isomorphisms has `w`-small Hom types, where Mathlib's
`HasDerivedCategory.standard` only gives Hom types in `Type (max u v)`. -/
theorem IsGrothendieckAbelian.locallySmall_localization_quasiIso :
    LocallySmall.{w} (HomologicalComplex.quasiIso C (ComplexShape.up ℤ)).Localization := by
  sorry

/-- **The derived category of a Grothendieck abelian category**
(`IsGrothendieckAbelian.hasDerivedCategory`, Section 0.1): the global instance, with Hom types in
the universe `w` of the Grothendieck abelian structure. For étale module sheaves over
`X : Scheme.{u}` with coefficients in `Λ : Type u` these are `Type u`. -/
noncomputable instance IsGrothendieckAbelian.hasDerivedCategory : HasDerivedCategory.{w} C :=
  haveI := IsGrothendieckAbelian.locallySmall_localization_quasiIso C
  MorphismProperty.hasLocalizationOfLocallySmall (HomologicalComplex.quasiIso C (ComplexShape.up ℤ))
    (HomologicalComplex.quasiIso C (ComplexShape.up ℤ)).Q

end GrothendieckAbelian

section InvertibleObjects

variable {C : Type u} [Category.{v} C] [MonoidalCategory C]

/-- **Invertible objects** (`MonoidalCategory.IsInvertible`, Section 0.3): tensoring with `X` on
the left is an equivalence. Equivalently `X ⊗ Y ≅ 𝟙_ C ≅ Y ⊗ X` for some `Y`, and then tensoring
with `X` on the right is an equivalence too. -/
class MonoidalCategory.IsInvertible (X : C) : Prop where
  isEquivalence_tensorLeft : (MonoidalCategory.tensorLeft X).IsEquivalence

/-- Invertible objects are the units of Mathlib's monoid structure on the skeleton, through whose
group of units Mathlib defines `CommRing.Pic` for semimodules over a commutative semiring
(`MonoidalCategory.isInvertible_iff_isUnit_toSkeleton`, Section 0.3). -/
theorem MonoidalCategory.isInvertible_iff_isUnit_toSkeleton (X : C) :
    MonoidalCategory.IsInvertible X ↔ IsUnit (toSkeleton X) := by
  sorry

end InvertibleObjects

/-! ## Layer E1: Unbounded derived sheaves and presentability -/

section RegularRings

open IsLocalRing

/-- **Global dimension of regular rings** (`isRegularRing_projectiveDimension_le`, Section E1.6;
Stacks 00OE): over a regular ring of Krull dimension at most `d`, every module, finitely
generated or not, has projective dimension at most `d`. -/
theorem isRegularRing_projectiveDimension_le (R : Type u) [CommRing R] [IsRegularRing R] (d : ℕ)
    (hd : ringKrullDim R ≤ d) (M : ModuleCat.{u} R) : HasProjectiveDimensionLE M d := by
  sorry

/-- **Kunz's theorem, forward direction** (`frobenius_flat_of_isRegular`, Section E1.6; Stacks
0EC0): the absolute Frobenius of a regular ring of characteristic `p` is flat. -/
theorem frobenius_flat_of_isRegular (R : Type u) [CommRing R] (p : ℕ) [Fact p.Prime]
    [CharP R p] [IsRegularRing R] : (frobenius R p).Flat := by
  sorry

/-- **Kunz's theorem, converse** (`isRegular_of_frobenius_flat`, Section E1.6; BS17 Corollary
11.35): a Noetherian ring of characteristic `p` with flat Frobenius is regular. -/
theorem isRegular_of_frobenius_flat (R : Type u) [CommRing R] (p : ℕ) [Fact p.Prime]
    [CharP R p] [IsNoetherianRing R] (h : (frobenius R p).Flat) : IsRegularRing R := by
  sorry

end RegularRings

section PerfectRings

/-- **Frobenius-root ideals** (`frobeniusRootIdeal`, Section E1.6): the increasing union of the
ideals generated by the `p^n`-th roots of `f` in a perfect `𝔽_p`-algebra
(BS17, proof of Lemma 3.16). -/
noncomputable def frobeniusRootIdeal (R : Type u) [CommRing R] (p : ℕ) [Fact p.Prime] [CharP R p]
    [PerfectRing R p] (f : R) : Ideal R :=
  ⨆ n : ℕ, Ideal.span {(iterateFrobeniusEquiv R p n).symm f}

/-- The Frobenius-root ideal equals `√(f)` (`frobeniusRootIdeal_radical`, Section E1.6). -/
theorem frobeniusRootIdeal_radical (R : Type u) [CommRing R] (p : ℕ) [Fact p.Prime]
    [CharP R p] [PerfectRing R p] (f : R) :
    frobeniusRootIdeal R p f = (Ideal.span {f}).radical := by
  sorry

/-- **Flatness and idempotence of Frobenius-root ideals** (`frobeniusRootIdeal_flat`,
BS17 proof of Lemma 3.16). -/
theorem frobeniusRootIdeal_flat (R : Type u) [CommRing R] (p : ℕ) [Fact p.Prime] [CharP R p]
    [PerfectRing R p] (f : R) :
    Module.Flat R (frobeniusRootIdeal R p f) ∧
      frobeniusRootIdeal R p f * frobeniusRootIdeal R p f = frobeniusRootIdeal R p f := by
  sorry

/-- **Tor independence of perfect algebras** (`perfectRing_tor_eq_zero`, BS17 Lemma 3.16).
All three rings are perfect; the statement is false for arbitrary modules over a perfect ring
(the non-perfect quotient-module counterexample in README E1.6). -/
theorem perfectRing_tor_eq_zero (A B C : Type u) [CommRing A] [CommRing B] [CommRing C]
    [Algebra A B] [Algebra A C] (p : ℕ) [Fact p.Prime]
    [CharP A p] [CharP B p] [CharP C p]
    [PerfectRing A p] [PerfectRing B p] [PerfectRing C p] (i : ℕ) :
    IsZero (((CategoryTheory.Tor (ModuleCat.{u} A) (i + 1)).obj (ModuleCat.of A B)).obj
      (ModuleCat.of A C)) := by
  sorry

/-- The quotient of a perfect polynomial algebra by the radical of `m` equations has
Tor dimension at most `m` over the base (`perfectPresentation_torDimension_le`, README E1.6;
BS17 Proposition 11.29). -/
theorem perfectPresentation_torDimension_le (R : Type u) [CommRing R]
    (p : ℕ) [Fact p.Prime] [CharP R p] [PerfectRing R p]
    (n m : ℕ) (f : Fin m → MvPolynomial (Fin n) R) (M : ModuleCat.{u} R) (i : ℕ) :
    let P := PerfectClosure (MvPolynomial (Fin n) R) p
    letI : Algebra R P :=
      ((PerfectClosure.of (MvPolynomial (Fin n) R) p).comp MvPolynomial.C).toAlgebra
    let S := P ⧸ (Ideal.span (Set.range
      (fun j => PerfectClosure.of (MvPolynomial (Fin n) R) p (f j)))).radical
    IsZero (((CategoryTheory.Tor (ModuleCat.{u} R) (m + i + 1)).obj
      (ModuleCat.of R S)).obj M) := by
  sorry

/-- Every module over a perfect quotient of the perfection of a regular ring of
dimension at most `d` has projective dimension at most `d + 1`
(`perfect_projectiveDimension_le`, README E1.6; BS17 proof of Proposition 11.31). -/
theorem perfect_projectiveDimension_le (P₀ R : Type u) [CommRing P₀] [CommRing R]
    (p : ℕ) [Fact p.Prime] [CharP P₀ p] [CharP R p] [PerfectRing R p]
    [IsRegularRing P₀] (d : ℕ) (hd : ringKrullDim P₀ ≤ d)
    [Algebra (PerfectClosure P₀ p) R]
    (hsurj : Function.Surjective (algebraMap (PerfectClosure P₀ p) R))
    (M : ModuleCat.{u} R) : HasProjectiveDimensionLE M (d + 1) := by
  sorry

/-- Every module over a perfect quotient of the perfection of a finite-dimensional regular
ring has Tor dimension at most twice the quotient's Krull dimension
(`perfect_torDimension_le_two_mul_dim`, README E1.6; BS17 Remark 11.33, p. 49).
Here `d₀` bounds the dimension of the regular presentation, while `d` bounds that of `R`. -/
theorem perfect_torDimension_le_two_mul_dim
    (P₀ R : Type u) [CommRing P₀] [CommRing R]
    (p : ℕ) [Fact p.Prime] [CharP P₀ p] [CharP R p]
    [PerfectRing R p] [IsRegularRing P₀]
    (d₀ d : ℕ) (hP : ringKrullDim P₀ ≤ d₀)
    [Algebra (PerfectClosure P₀ p) R]
    (hsurj : Function.Surjective (algebraMap (PerfectClosure P₀ p) R))
    (hR : ringKrullDim R ≤ d) (M N : ModuleCat.{u} R) (i : ℕ) :
    IsZero (((CategoryTheory.Tor (ModuleCat.{u} R) (2 * d + i + 1)).obj M).obj N) := by
  sorry

end PerfectRings

section ValuationModules

/-- The multiplication map `M → Hom_V(𝔪, M)`, `x ↦ (a ↦ a • x)` (`valuationSaturationMap`,
Section E1.7). -/
def valuationSaturationMap (V : Type u) [CommRing V] (m : Ideal V)
    (M : Type v) [AddCommGroup M] [Module V M] : M →ₗ[V] (m →ₗ[V] M) where
  toFun x :=
    { toFun := fun a => (a : V) • x
      map_add' := fun a b => by simp [add_smul]
      map_smul' := fun c a => by simp [mul_smul] }
  map_add' x y := by ext a; simp [smul_add]
  map_smul' c x := by ext a; simp [smul_comm (a : V) c x]

/-- **`𝔪`-saturated modules** (`IsValuationSaturated`, Section E1.7, BS17 Lemma 6.14): the
multiplication map `M → Hom_V(𝔪, M)` is bijective. For a nonarchimedean field with
`|K×| = ℝ_{>0}`, a nonzero open ball of finite positive radius fails this, while a closed
ball satisfies it. An open ball with radius outside the value group can be saturated. -/
def IsValuationSaturated (V : Type u) [CommRing V] (m : Ideal V)
    (M : Type v) [AddCommGroup M] [Module V M] : Prop :=
  Function.Bijective (valuationSaturationMap V m M)

/-- A bounded saturated submodule of a finite-dimensional space over a spherically complete
nonarchimedean field with full positive-real value group is finite free over its valuation ring,
of rank at most the ambient dimension (BS17 Lemma 6.14, p. 26). The unit-ball identification
fixes the norm and valuation-ring compatibility. -/
theorem valuationSaturated_finite_free
    (K : Type u) [NontriviallyNormedField K] [CompleteSpace K]
    (hballs : ∀ S : Set (Set K), S.Nonempty → IsChain (· ⊆ ·) S →
      (∀ s ∈ S, ∃ x : K, ∃ r : ℝ, 0 ≤ r ∧ s = Metric.closedBall x r) →
      (⋂₀ S).Nonempty)
    (hvalues : ∀ r : ℝ, 0 < r → ∃ x : K, ‖x‖ = r)
    (V : ValuationSubring K) (hV : ∀ x : K, x ∈ V ↔ ‖x‖ ≤ 1)
    (r : ℕ) (M : Submodule V (Fin r → K))
    (hbounded : Bornology.IsBounded (M : Set (Fin r → K)))
    (hsat : IsValuationSaturated V (IsLocalRing.maximalIdeal V) M) :
    ∃ n : ℕ, n ≤ r ∧ Nonempty (M ≃ₗ[V] (Fin n → V)) := by
  sorry

end ValuationModules

/-! ## Layer E2:towers: Coherent towers and pro-towers -/

section ProTowers

/-- **Pro-zero towers** (`IsProZero`, Section E2:towers.2): every stage is killed by a later
transition map. This is a condition on transitions, not on the limit. -/
def IsProZero {A : Type u} [Category.{v} A] [HasZeroMorphisms A] (F : ℕᵒᵖ ⥤ A) : Prop :=
  ∀ n : ℕ, ∃ m : ℕ, ∃ h : n ≤ m, F.map (homOfLE h).op = 0

/-- Ordinary abelian pro-isomorphisms have pro-zero kernel and cokernel towers. This
predicate is distinct from the stable null-transition condition used for descendability. -/
def IsProIsomorphism {A : Type u} [Category.{v} A] [Abelian A]
    {F G : ℕᵒᵖ ⥤ A} (f : F ⟶ G) : Prop :=
  IsProZero (kernel f) ∧ IsProZero (cokernel f)

/-- Cofinal monotone reindexing preserves and reflects pro-zero towers
(`proZero_cofinal`, README E2:towers.2). -/
theorem proZero_cofinal {A : Type u} [Category.{v} A] [HasZeroMorphisms A]
    (F : ℕᵒᵖ ⥤ A) (φ : ℕ → ℕ) (hφ : Monotone φ)
    (hcofinal : ∀ n, ∃ m, n ≤ φ m) :
    IsProZero (hφ.functor.op ⋙ F) ↔ IsProZero F := by
  sorry

/-- Pro-isomorphisms compose (`proIso_comp`). -/
theorem proIso_comp {A : Type u} [Category.{v} A] [Abelian A]
    {F G H : ℕᵒᵖ ⥤ A} {f : F ⟶ G} {g : G ⟶ H}
    (hf : IsProIsomorphism f) (hg : IsProIsomorphism g) : IsProIsomorphism (f ≫ g) := by
  sorry

end ProTowers

/-! ## Layer E4: Derived completion of sheaves and coefficient reconstruction -/

section DerivedComplete

/-- The elementary point-site telescope criterion (`IsDerivedComplete`, Section E4.1).
For `f ∈ I` the derived limit of `M ←f M ←f ⋯` is the fibre of
`(x_n) ↦ (x_n - f • x_{n+1})` on `ℕ → M`; `M` is derived `I`-complete when this map is
bijective for every `f ∈ I`. -/
def IsDerivedComplete {R : Type u} [CommRing R] (I : Ideal R) (M : Type v) [AddCommGroup M]
    [Module R M] : Prop :=
  ∀ f ∈ I, Function.Bijective (fun x : ℕ → M => fun n => x n - f • x (n + 1))

/-- Telescope completeness agrees with the shifted-localization criterion of
`DerivedDeRham.derivedCompleteness` on `M[0]` (`isDerivedComplete_iff_derivedCompleteness`,
Section E4.1; BS-proet Lemma 3.4.7; Stacks 091P). -/
theorem isDerivedComplete_iff_derivedCompleteness (R : Type u) [CommRing R]
    (I : Ideal R) (hI : I.FG)
    (M : Type u) [AddCommGroup M] [Module R M] :
    IsDerivedComplete I M ↔ ∀ f ∈ I, ∀ n : ℤ,
      Subsingleton
        (((DerivedCategory.singleFunctor (ModuleCat.{u} R) 0).obj
          (ModuleCat.of R (Localization.Away f)))⟦n⟧ ⟶
          (DerivedCategory.singleFunctor (ModuleCat.{u} R) 0).obj (ModuleCat.of R M)) := by
  sorry

/-- **Classical and derived completeness** (`isAdicComplete_iff_derivedComplete_separated`,
BS-proet Proposition 3.4.2, point case): for a finitely generated ideal, a module is classically
`I`-adically complete exactly when it is derived `I`-complete and `I`-adically separated. -/
theorem isAdicComplete_iff_derivedComplete_separated {R : Type u} [CommRing R]
    (I : Ideal R) (hI : I.FG) (M : Type v) [AddCommGroup M] [Module R M] :
    IsAdicComplete I M ↔ IsDerivedComplete I M ∧ IsHausdorff I M := by
  sorry

/-- **Weak Serre closure** (`derivedCompleteModules_weakSerre`, point case): derived complete
modules are closed under kernels and cokernels of maps between derived complete modules. They
are not closed under submodules: `ℤ ⊆ ℤ_[p]`. -/
theorem derivedCompleteModules_weakSerre {R : Type u} [CommRing R] (I : Ideal R)
    {M N : Type v} [AddCommGroup M] [Module R M] [AddCommGroup N] [Module R N]
    (hM : IsDerivedComplete I M) (hN : IsDerivedComplete I N) (g : M →ₗ[R] N) :
    IsDerivedComplete I (LinearMap.ker g) ∧ IsDerivedComplete I (N ⧸ LinearMap.range g) := by
  sorry

end DerivedComplete

end TauCetiRoadmap.EnhancedDerivedSheaves
