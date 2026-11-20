import Mathlib
import TauCeti.Algebra.Homology.TotallyAcyclic.Abelian.Singularity
import TauCeti.RingTheory.IwanagaGorenstein
import TauCeti.RingTheory.GlobalDimension
import TauCeti.Algebra.Homology.Periodic.Compression.Derived
import TauCeti.Algebra.Homology.Periodic.ProjectiveReplacement
import TauCeti.Algebra.Homology.Curved.Module.Right.SecondKind
import TauCeti.Algebra.Homology.Curved.Module.Right.Graded
import TauCeti.Algebra.Category.GradedModuleCat.Coproducts.Basic
import TauCeti.Algebra.Category.GradedModuleCat.Products
import TauCeti.CommutativeAlgebra.MatrixFactorization.Cokernel.GorensteinProjective

/-!
# Stable, periodic, and curved homological algebra: target signatures

This file is not the roadmap. The roadmap is `README.md`, which carries every target, its API
and its Checks. This file states the roadmap's headline theorems against the pinned Mathlib and
Tau Ceti, each with `sorry`, as the acceptance test of the finished roadmap.

Right modules over a ring `R` are left `Rᵐᵒᵖ`-modules, so the category of finitely generated
right `R`-modules is `FGModuleCat.{u} Rᵐᵒᵖ`, in the universe of `R`.

The headline theorems stated here:

* Buchweitz's theorem (Layer 2): over an Iwanaga–Gorenstein ring, Chen's functor from the
  stable category of finitely generated Gorenstein-projective right modules to the singularity
  category is an equivalence.
* Stai's Lemma 3.12 and Theorem 4.3 (Layer 4): for a finite-dimensional algebra of finite global
  dimension, the orbit functor `Dᵇ(mod-Λ)/[n] ⥤ Dₙ(mod-Λ)` is fully faithful, and its essential
  image generates `Dₙ(mod-Λ)` under shifts and cones; with the same hypotheses,
  `Dₙ(mod-Λ) ≃ Kₙ(proj-Λ)`.
* Positselski's Theorems 7.8(a), 7.8(b), 7.9(a) and 7.9(b) (Layer 6), for right curved DG
  modules.
* Eisenbud's comparison (Layer 7): over a regular local ring, the cokernel functor from the
  homotopy category of matrix factorizations to the stable category of Gorenstein-projective
  modules over the hypersurface is an equivalence.

Headline theorems of the README that are not statable at the pins:

* Keller–Vossieck's theorem (Layer 2): the pins have no bounded derived category of a Quillen
  exact category, so neither `Dᵇ(E)` nor its quotient by `Kᵇ(ProjInj E)` exists.
* Orlov's theorem (Layer 7): the pins have no functor from the homotopy category of matrix
  factorizations to `TauCeti.SingularityCategory`; the cokernel functor lands in the stable
  category of `TauCeti.GorensteinProjectiveModuleCat`, while Chen's functor starts from the stable
  category of `CategoryTheory.GorensteinProjective`, and the pins have no comparison between the
  two.
* Eisenbud's eventual two-periodicity of minimal free resolutions over a hypersurface (Layer 4):
  the pins have no minimal free resolution of a module of infinite projective dimension.
* The comparison of the triangulated hull of Keller's DG orbit category with `Dₙ(mod-Λ)`
  (Layer 4): the pins have no DG orbit category.
-/

namespace TauCetiRoadmap.StablePeriodicCurved

open CategoryTheory Limits TauCeti

universe w u

/-! ## Layer 2: self-injective modules, total acyclicity, and singularities -/

/-- **Buchweitz's theorem.** Let `R` be an Iwanaga–Gorenstein ring: left and right noetherian,
with finite self-injective dimension on both sides. Then Chen's functor from the stable category
of finitely generated Gorenstein-projective right `R`-modules to the singularity category
`Dᵇ(mod-R)/Kᵇ(proj-R)`, which places a module in degree zero, is an equivalence (Buchweitz,
Theorem 4.4.1). -/
theorem buchweitz_isEquivalence (R : Type u) [Ring R] [IsIwanagaGorenstein R]
    [HasDerivedCategory.{w} (FGModuleCat.{u} Rᵐᵒᵖ)] :
    (GorensteinProjective.toSingularityCategory (FGModuleCat.{u} Rᵐᵒᵖ)).IsEquivalence := by
  sorry

/-! ## Layer 4: compression, periodic resolutions, and relative projectives -/

/-- **Stai, Lemma 3.12.** Let `Λ` be a finite-dimensional algebra over a field `k` of finite
global dimension, stated as a bound on the projective dimension of every right `Λ`-module in the
universe of `Λ`, and let `n ≥ 1`. Then the orbit functor `Dᵇ(mod-Λ)/[n] ⥤ Dₙ(mod-Λ)`, the descent
of compression to the orbit category, is full and faithful. (The noetherian instance on `Λᵐᵒᵖ`
follows from finite-dimensionality.) -/
theorem stai_orbitDerivedCompressionFunctor_full_faithful (k : Type*) {Λ : Type u} [Field k]
    [Ring Λ] [Algebra k Λ] [FiniteDimensional k Λ] [IsNoetherianRing Λᵐᵒᵖ]
    [HasDerivedCategory.{w} (FGModuleCat.{u} Λᵐᵒᵖ)] (d : ℕ)
    (hΛ : globalDimension.{u} Λᵐᵒᵖ ≤ d) (n : ℕ) [NeZero n] :
    (PeriodicComplex.orbitDerivedCompressionFunctor (C := FGModuleCat.{u} Λᵐᵒᵖ) n).Full ∧
      (PeriodicComplex.orbitDerivedCompressionFunctor (C := FGModuleCat.{u} Λᵐᵒᵖ) n).Faithful := by
  sorry

/-- **Stai, Theorem 4.3.** Under the hypotheses of Lemma 3.12, every isomorphism-closed
triangulated subcategory of `Dₙ(mod-Λ)` containing the essential image of the orbit functor is
all of `Dₙ(mod-Λ)`: the image generates under shifts and cones alone, without retracts. Together
with Lemma 3.12 this says that `Dₙ(mod-Λ)` is the triangulated hull of the orbit category. -/
theorem stai_eq_top_of_essImage_le (k : Type*) {Λ : Type u} [Field k] [Ring Λ] [Algebra k Λ]
    [FiniteDimensional k Λ] [IsNoetherianRing Λᵐᵒᵖ]
    [HasDerivedCategory.{w} (FGModuleCat.{u} Λᵐᵒᵖ)] (d : ℕ)
    (hΛ : globalDimension.{u} Λᵐᵒᵖ ≤ d) (n : ℕ) [NeZero n]
    (Q : ObjectProperty (PeriodicComplex.DerivedCategory (FGModuleCat.{u} Λᵐᵒᵖ) n))
    [Q.IsTriangulated] [Q.IsClosedUnderIsomorphisms]
    (hQ : (PeriodicComplex.orbitDerivedCompressionFunctor
      (C := FGModuleCat.{u} Λᵐᵒᵖ) n).essImage ≤ Q) :
    Q = ⊤ := by
  sorry

/-- **Stai's projective model of `Dₙ(mod-Λ)`.** Under the hypotheses of Lemma 3.12, the periodic
Verdier localization restricts to an equivalence from the full subcategory `Kₙ(proj-Λ)` of the
periodic homotopy category on the periodic complexes of finitely generated projective right
`Λ`-modules to `Dₙ(mod-Λ)` (Stai, §3). -/
theorem stai_projective_isEquivalence (k : Type*) {Λ : Type u} [Field k] [Ring Λ]
    [Algebra k Λ] [FiniteDimensional k Λ] [IsNoetherianRing Λᵐᵒᵖ] (d : ℕ)
    (hΛ : globalDimension.{u} Λᵐᵒᵖ ≤ d) (n : ℕ) [NeZero n] :
    ((PeriodicComplex.subcategoryDegreewiseProjective (FGModuleCat.{u} Λᵐᵒᵖ) n).ι ⋙
      PeriodicComplex.DerivedCategory.Qh (FGModuleCat.{u} Λᵐᵒᵖ) n).IsEquivalence := by
  sorry

/-! ## Layer 6: curved acyclicity and derived categories of the second kind -/

section Positselski

variable {R A : Type u} [CommRing R] [Ring A] [Algebra R A] {𝒜 : ℤ → Submodule R A}
  [GradedAlgebra 𝒜] {d : A →ₗ[R] A} {w : A}

/-- The objects of the curved homotopy category represented by a curved module whose underlying
graded right module is injective. -/
def gradedInjective (h : IsCurvedDGAlgebra 𝒜 d w) :
    ObjectProperty (DGHomotopyCategory R (CurvedDGRightModuleCat.{u, u, u} h)) :=
  fun X ↦ ∃ M : CurvedDGRightModuleCat.{u, u, u} h,
    Injective (CurvedDGRightModuleCat.toGradedModuleCat M) ∧
      Nonempty (DGHomotopyCategory.of R M ≅ X)

/-- The objects of the curved homotopy category represented by a curved module whose underlying
graded right module is projective. -/
def gradedProjective (h : IsCurvedDGAlgebra 𝒜 d w) :
    ObjectProperty (DGHomotopyCategory R (CurvedDGRightModuleCat.{u, u, u} h)) :=
  fun X ↦ ∃ M : CurvedDGRightModuleCat.{u, u, u} h,
    Projective (CurvedDGRightModuleCat.toGradedModuleCat M) ∧
      Nonempty (DGHomotopyCategory.of R M ≅ X)

/-- The objects of the curved homotopy category represented by a module whose differential is
exact, `ker d = im d`. This is acyclicity in the ordinary sense, meaningful at curvature zero,
where `d² = 0`. -/
def acyclic (h : IsCurvedDGAlgebra 𝒜 d w) :
    ObjectProperty (DGHomotopyCategory R (CurvedDGRightModuleCat.{u, u, u} h)) :=
  fun X ↦ ∃ M : CurvedDGRightModuleCat.{u, u, u} h,
    Function.Exact M.differential M.differential ∧ Nonempty (DGHomotopyCategory.of R M ≅ X)

/-- **Positselski, Theorem 7.8(a)**, for right modules. If every graded right module over the
underlying graded ring of `A` has projective dimension at most `e`, the absolutely acyclic,
coacyclic and contraacyclic curved right modules coincide. -/
theorem positselski_7_8a (h : IsCurvedDGAlgebra 𝒜 d w) (e : ℕ)
    (he : ∀ M : GradedModuleCat.{u} (InternalGrading.ofDecomposition 𝒜).opposite.piece,
      HasProjectiveDimensionLE M e) :
    CurvedDGRightModuleCat.absolutelyAcyclic R h = CurvedDGRightModuleCat.coacyclic R h ∧
      CurvedDGRightModuleCat.absolutelyAcyclic R h =
        CurvedDGRightModuleCat.contraacyclic R h := by
  sorry

/-- **Positselski, Theorem 7.8(b)**, for right modules. At curvature zero, assume that every
graded right module over `A` has projective dimension at most `e`, and that either `A` vanishes
in positive degrees, or `A` vanishes in negative degrees and in degree one with `A⁰` classically
semisimple. Then the acyclic modules are exactly the absolutely acyclic, the coacyclic and the
contraacyclic ones. -/
theorem positselski_7_8b (h : IsCurvedDGAlgebra 𝒜 d 0) (e : ℕ)
    (he : ∀ M : GradedModuleCat.{u} (InternalGrading.ofDecomposition 𝒜).opposite.piece,
      HasProjectiveDimensionLE M e)
    (hA : (∀ p : ℤ, 0 < p → 𝒜 p = ⊥) ∨
      ((∀ p : ℤ, p < 0 → 𝒜 p = ⊥) ∧ IsSemisimpleRing (𝒜 0) ∧ 𝒜 1 = ⊥)) :
    acyclic h = CurvedDGRightModuleCat.absolutelyAcyclic R h ∧
      acyclic h = CurvedDGRightModuleCat.coacyclic R h ∧
        acyclic h = CurvedDGRightModuleCat.contraacyclic R h := by
  sorry

/-- **Positselski, Theorem 7.9(a)**, for right modules. If one bound `e` controls the injective
dimension of every countable direct sum of injective graded right modules over `A` (indexed by
a countable type in the universe of `A`), then the
homotopy category of curved modules with injective underlying graded module maps by an
equivalence onto the coderived category. -/
theorem positselski_7_9a (h : IsCurvedDGAlgebra 𝒜 d w) (e : ℕ)
    (he : ∀ (ι : Type u) [Countable ι]
      (J : ι → GradedModuleCat.{u} (InternalGrading.ofDecomposition 𝒜).opposite.piece),
      (∀ i, Injective (J i)) → HasInjectiveDimensionLE (∐ J) e) :
    ((gradedInjective h).ι ⋙ CurvedDGRightModuleCat.CoderivedCategory.Q R h).IsEquivalence := by
  sorry

/-- **Positselski, Theorem 7.9(b)**, for right modules. If one bound `e` controls the projective
dimension of every countable product of projective graded right modules over `A` (indexed by a
countable type in the universe of `A`), then the
homotopy category of curved modules with projective underlying graded module maps by an
equivalence onto the contraderived category. (The graded-monoid instance on the internal grading
built from `𝒜` follows from `[GradedAlgebra 𝒜]`; it is the form in which the products of graded
modules are found.) -/
theorem positselski_7_9b [SetLike.GradedMonoid (InternalGrading.ofDecomposition 𝒜).piece]
    (h : IsCurvedDGAlgebra 𝒜 d w) (e : ℕ)
    (he : ∀ (ι : Type u) [Countable ι]
      (P : ι → GradedModuleCat.{u} (InternalGrading.ofDecomposition 𝒜).opposite.piece),
      (∀ i, Projective (P i)) → HasProjectiveDimensionLE (∏ᶜ P) e) :
    ((gradedProjective h).ι ⋙
      CurvedDGRightModuleCat.ContraderivedCategory.Q R h).IsEquivalence := by
  sorry

end Positselski

/-! ## Layer 7: matrix factorizations -/

/-- **Eisenbud's comparison.** Let `S` be a regular local ring and `w` a nonzero element of its
maximal ideal (a non-zero-divisor, since `S` is a domain). Then the cokernel functor from the
homotopy category of finitely generated projective (equivalently, free) matrix factorizations of
`w` to the stable category of finitely generated Gorenstein-projective `S/(w)`-modules is an
equivalence (Eisenbud, §5 and Theorem 6.1, with Buchweitz, §4). -/
theorem eisenbud_isEquivalence {S : Type u} [CommRing S] [IsRegularLocalRing S] {w : S}
    (hw : w ∈ nonZeroDivisors S) (hw𝔪 : w ∈ IsLocalRing.maximalIdeal S) :
    (MatrixFactorization.HomotopyCategory.quotientGorensteinProjectiveStableCokernel
      hw).IsEquivalence := by
  sorry

end TauCetiRoadmap.StablePeriodicCurved
