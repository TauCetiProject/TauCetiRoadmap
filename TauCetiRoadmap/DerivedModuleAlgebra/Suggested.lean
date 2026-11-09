module

public import Mathlib
public import TauCeti.Algebra.Module.Injective.Envelope.Basic
public import TauCeti.Algebra.Homology.SpectralSequence.Bicomplex
public import TauCeti.Algebra.Category.ModuleCat.Tower.DerivedLimit
public import TauCeti.AlgebraicTopology.SimplicialObject.AlexanderWhitney
public import TauCeti.AlgebraicTopology.SimplicialObject.Bisimplicial
public import TauCeti.RingTheory.DividedPowerAlgebra.Homogeneous
public import TauCeti.Algebra.Category.ModuleCat.SymmetricPower.Basic

/-!
# DerivedModuleAlgebra: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline theorems
against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the few real-bodied
definitions those statements need. The README carries every target, API list and Check.

Headline results that the pinned Tau Ceti already provides are not restated: Roby representability
and the augmentation theory of §§0.DP.1–0.DP.3 (`DividedPowerAlgebra.homogeneousLawEquiv`,
`DividedPowerAlgebra.augmentationIdeal_eq_span`,
`DividedPowerAlgebra.map_algebraMap_inf_augmentationIdeal_eq_mul`); the Koszul complex of §0.K.1
with its functoriality, tensor decomposition, homotopy, zeroth homology and acyclicity for weakly
regular sequences (`TauCeti.koszulComplex`, `TauCeti.koszulComplex.map`,
`TauCeti.koszulComplex.tensorIso`, `TauCeti.koszulComplex.tensorIsoAppend`,
`TauCeti.koszulComplex.smulHomotopy`, `TauCeti.koszulComplex.homologyZeroEquivSpan`,
`TauCeti.koszulComplex.exactAt_of_isWeaklyRegular`); the module K-injective replacement of §0.I.1
(`CochainComplex.exists_quasiIso_isKInjective`, `TauCeti.kInjectiveReplacement`); the K-flat
replacement of §0.2 with flat terms (`CochainComplex.kFlatResolution` with its instances
`CochainComplex.kFlatResolution.quasiIso_π`, `CochainComplex.isKFlat_kFlatResolution` and
`CochainComplex.preservesFiniteLimits_tensorLeft_kFlatResolution_X`); Lazard's theorem of §0.2.1
(`TauCeti.flatModuleFilteredFree`); the natural Alexander–Whitney maps of §0.2.2
(`CategoryTheory.SimplicialObject.alexanderWhitney`,
`CategoryTheory.SimplicialObject.diagAlexanderWhitney`); the convergence of the spectral sequence
of a first-quadrant bicomplex to the homology of its total complex in §S.1
(`HomologicalComplex₂.columnFiltrationAbutmentIso`,
`HomologicalComplex₂.rowFiltrationSpectralSequencePageXIsoEInfty`); the derived limit of §1.1 with
its localization comparison and shift isomorphisms (`TauCeti.ModuleTower.derivedLimit`); the derived
Hom of §1.1.1 with the identification of its cohomology with morphisms in `D(R)`
(`TauCeti.derivedHom`, `TauCeti.derivedHomHomologyLinearEquiv`); complete flatness of flat modules
for every ideal in §1.7 (`ModuleCat.isZero_Tor_succ_of_flat` with Mathlib's `Module.Flat.baseChange`); and
the injective hulls, completion action, finite-length biduality and Artinian criterion of §1.M.2
(`TauCeti.exists_isInjectiveEnvelope`, `TauCeti.AdicCompletion.torsionModule`,
`TauCeti.IsInjectiveEnvelope.bijective_applyₗ`,
`TauCeti.IsInjectiveEnvelope.isArtinian_of_finite_adicCompletion_linearMap`).

Headline theorems that are not statable at the pins, and the carrier each lacks:

* the unbounded module derived tensor `⊗^L` on `D(R)` (§0.2), the
  derived scalar extension and restriction functors with their adjunction, and the preservation of
  perfection by derived scalar extension along a map of commutative rings (§1.E.0): no derived
  tensor bifunctor or derived extension of scalars on `DerivedCategory (ModuleCat R)` exists at
  the pin;
* the cohomological first-quadrant spectral sequence, its edge morphisms and the five-term and
  extended exact sequences (§S.1): the pinned spectral sequence of a bicomplex is the homological
  one of `HomologicalComplex₂ C (down ℕ) (down ℕ)`, no column filtration of the total complex of a
  cochain bicomplex is constructed to feed the pinned filtered-complex spectral sequence, and no
  edge morphism from the second page to the abutment is constructed; the identification of the
  classical second page in the homological form is stated below;
* the cotangent complex and its deformation theory (§§0.1, 0.4–0.13 and 0.25): the simplicial
  polynomial resolution and the full complex `L_(B/A)` are constructions of §§0.1 and 0.4;
* the derived functors `LF`, `L∧ⁿ`, `LSymⁿ` and `LΓⁿ` on `D^(≤0)` with their base change and
  graded multiplications, the filtration of `L∧ⁿ` of a fibre sequence, and the décalage
  equivalences `LSymⁿ(M[1]) ≃ (L∧ⁿM)[n]` and `L∧ⁿ(M[1]) ≃ (LΓⁿM)[n]` for a connective complex `M`
  (§§0.3 and 0.14–0.17): these functors are constructions of §§0.3 and 0.14–0.16; the resolution
  independence that makes `LF` well defined (§0.3) and both décalage equivalences for a flat
  module in degree zero (§0.17) are stated below;
* the tensor–Hom adjunction of §1.1.1: it pairs the pinned derived Hom with the derived tensor
  above; the exactness of the pinned derived limit (§1.1) is stated below;
* derived Nakayama (§1.3), the Koszul completion tower (§1.4) and the ordinary-quotient comparison
  (§1.5): each statement contains `M ⊗^L_A A/I` or `M ⊗^L_A K(f)`; the existence of the completion
  reflector of §1.3 is stated below;
* completion of simplicial commutative algebras (§1.6): the localized category of simplicial
  commutative algebras with its underlying-module functor to `D(A)` is a construction of §1.6;
* complete flatness of complexes, complete Tor-amplitude and complete faithful-flat descent
  (§§1.7–1.9): built from `⊗^L`; the module form of the bounded-torsion criterion of §1.8 is
  stated below;
* compatible finite-free models, strict-tower limits and perfect inverse-system effectivity
  (§§1.E.0–1.E.1): their statements mention derived scalar extension.

Derived categories of modules are `DerivedCategory (ModuleCat.{u} R)` with the standard instance
`HasDerivedCategory.{u+1}`; towers are indexed by `ℕ` with transitions from `n + 1` to `n`.
-/

@[expose] public section

namespace TauCetiRoadmap.DerivedModuleAlgebra

open CategoryTheory CategoryTheory.Limits CategoryTheory.Pretriangulated
open TensorProduct Polynomial
open scoped TensorProduct BigOperators Simplicial

noncomputable section
universe u v w w'

/-! ## Layer 1: replacements, tensor products and simplicial comparisons -/

namespace DerivedDeRham

/-- **The second page of a first-quadrant bicomplex** (README S.1, homological form; NSW,
Proposition 2.1.1). Let `K` be a first-quadrant bicomplex with homological differentials in an
abelian category, `K.X p` its columns. In the spectral sequence of its column filtration, whose
page numbered `2` is the vertical homology, with `H_k(K.X p)` at `(-k - 2p, p)`, the page numbered
`3`, the classical `E²`, has at that position the horizontal homology `H_p(H_k^II(K))` of the
complex `t ↦ H_k(K.X t)` of vertical homologies. -/
theorem nonempty_bicomplexSecondPageIso {C : Type u} [Category.{v} C] [Abelian C]
    (K : HomologicalComplex₂ C (ComplexShape.down ℕ) (ComplexShape.down ℕ)) (p k : ℕ) :
    Nonempty ((K.columnFiltrationSpectralSequence.page 3).X (-(k : ℤ) - 2 * p, p) ≅
      (((HomologicalComplex.homologyFunctor C (ComplexShape.down ℕ) k).mapHomologicalComplex
        (ComplexShape.down ℕ)).obj K).homology p) := by
  sorry

open CategoryTheory.MonoidalCategory in
/-- **Eilenberg–Zilber theorem for simplicial modules** (README 0.2.2; Dold–Puppe, §2, Satz 2.9
and Satz 2.15). For simplicial modules `X, Y` over a commutative ring there is a family of chain
homotopy equivalences between the tensor product of the alternating face complexes and the
alternating face complex of the degreewise tensor product, natural in both variables, whose
inverse is Tau Ceti's Alexander–Whitney map and whose forward map, the shuffle map, is the identity
in degree zero and the signed sum of the two shuffles in bidegree `(1,1)`. No flatness is
assumed. -/
theorem simplicialTensorComparison (R : Type u) [CommRing R] :
    let s := AlgebraicTopology.alternatingFaceMapComplex (ModuleCat.{u} R)
    ∃ e : ∀ X Y : SimplicialObject (ModuleCat.{u} R),
        HomotopyEquiv (HomologicalComplex.tensorObj (s.obj X) (s.obj Y))
          (s.obj (X ⊗ Y)),
      (∀ (X Y X' Y' : SimplicialObject (ModuleCat.{u} R)) (f : X ⟶ X') (g : Y ⟶ Y'),
        HomologicalComplex.tensorHom (s.map f) (s.map g) ≫ (e X' Y').hom =
          (e X Y).hom ≫ s.map (f ⊗ₘ g)) ∧
      (∀ X Y : SimplicialObject (ModuleCat.{u} R),
        (e X Y).inv = SimplicialObject.alexanderWhitney X Y) ∧
      (∀ X Y : SimplicialObject (ModuleCat.{u} R),
        HomologicalComplex.ιTensorObj (s.obj X) (s.obj Y) 0 0 0 rfl ≫
          (e X Y).hom.f 0 = 𝟙 _) ∧
      (∀ X Y : SimplicialObject (ModuleCat.{u} R),
        HomologicalComplex.ιTensorObj (s.obj X) (s.obj Y) 1 1 2 rfl ≫
          (e X Y).hom.f 2 = (X.σ 1 ⊗ₘ Y.σ 0) - (X.σ 0 ⊗ₘ Y.σ 1)) := by
  sorry

/-- **Generalized Eilenberg–Zilber theorem** (README 0.2.2; Dold–Puppe, §2, Satz 2.15). For every
bisimplicial module `Z` over a commutative ring, Tau Ceti's Alexander–Whitney map from the
alternating face complex of the diagonal `n ↦ Z_(n,n)` to the total complex of the double complex
of `Z`, with total differential `d₁ + (-1)^p d₂`, is a chain homotopy equivalence. No flatness is
assumed. -/
theorem bisimplicialDiagonalComparison (R : Type u) [CommRing R]
    (Z : SimplicialObject (SimplicialObject (ModuleCat.{u} R))) :
    ∃ e : HomotopyEquiv
        ((AlgebraicTopology.alternatingFaceMapComplex (ModuleCat.{u} R)).obj
          ((SimplicialObject.diag (ModuleCat.{u} R)).obj Z))
        (((SimplicialObject.doubleComplex (ModuleCat.{u} R)).obj Z).total (ComplexShape.down ℕ)),
      e.hom = SimplicialObject.diagAlexanderWhitney Z := by
  sorry

/-- **Levelwise functors preserve weak equivalences of projective simplicial modules**
(README 0.3; Dold–Puppe, Satz 1.15, p. 209, Satz 3.31, p. 225, and 4.4–4.6, p. 228). Let `F` be
an arbitrary functor from `R`-modules to `R′`-modules, not necessarily additive, and `f : X ⟶ Y` a
map of simplicial `R`-modules that are projective in every simplicial degree. If `f` induces a
quasi-isomorphism of alternating face complexes, then so does the levelwise map `F(f)`. This is
the resolution independence that makes the derived functor `LF` of §0.3 well defined. Projectivity
of the target is needed: the augmentation of the Dold–Kan object of `[ℤ --2→ ℤ]` to the constant
`ℤ/2` is a quasi-isomorphism, but under `F(V) = V ⊗ V` its first homology is `ℤ/2` against `0`. -/
theorem quasiIso_whiskering_of_projective (R : Type u) [Ring R] (R' : Type v) [Ring R']
    (F : ModuleCat.{w} R ⥤ ModuleCat.{w'} R') {X Y : SimplicialObject (ModuleCat.{w} R)}
    [∀ n : ℕ, Projective (X _⦋n⦌)] [∀ n : ℕ, Projective (Y _⦋n⦌)] (f : X ⟶ Y)
    [QuasiIso ((AlgebraicTopology.alternatingFaceMapComplex (ModuleCat.{w} R)).map f)] :
    QuasiIso ((AlgebraicTopology.alternatingFaceMapComplex (ModuleCat.{w'} R')).map
      (((SimplicialObject.whiskering (ModuleCat.{w} R) (ModuleCat.{w'} R')).obj F).map f)) := by
  sorry

end DerivedDeRham

/-! ## Layer 2: cotangent calculus, integral powers and deformations -/

namespace DerivedDeRham

/-- **Illusie's décalage for exterior powers of a flat module** (README 0.17; [SAG],
Proposition 25.2.4.2, p. 1704, read with the alternating exterior power of README 0.14, and
Proposition 25.2.3.4, p. 1703, for flat modules). Let `N` be a flat module over a commutative ring
`R` and `X = Γ₀(N[1])` the Dold–Kan simplicial module of `N` placed in homological degree one. The
alternating face complex of the levelwise exterior power `⋀ⁿ X` has homology the degree-`n`
divided power `Γⁿ_R(N)` in degree `n` and zero in every other degree, that is
`L∧ⁿ(N[1]) ≃ Γⁿ(N)[n]`. Over `𝔽₂` with `N = 𝔽₂` and `n = 2` the homology is `Γ²(𝔽₂) ∋ γ₂(1)`
although `⋀²𝔽₂ = 0`. Flatness is needed: for `N = ℤ/2` over `ℤ` and `n = 2` the degree-two
homology is `ℤ/2`, while `Γ²_ℤ(ℤ/2) ≅ ℤ/4`. -/
theorem exteriorPower_decalage (R : Type u) [CommRing R] (N : ModuleCat.{u} R)
    [Module.Flat R N] (n : ℕ) :
    let X := (AlgebraicTopology.DoldKan.Γ₀ (C := ModuleCat.{u} R)).obj
      ((HomologicalComplex.single (ModuleCat.{u} R) (ComplexShape.down ℕ) 1).obj N)
    let K := (AlgebraicTopology.alternatingFaceMapComplex (ModuleCat.{u} R)).obj
      (((SimplicialObject.whiskering (ModuleCat.{u} R) (ModuleCat.{u} R)).obj
        (ModuleCat.exteriorPower.functor.{u} R n)).obj X)
    (∀ k : ℕ, k ≠ n → IsZero (K.homology k)) ∧
      Nonempty (K.homology n ≅
        ModuleCat.of R (DividedPowerAlgebra.homogeneousSubmodule (R := R) (M := N) n)) := by
  sorry

/-- **Illusie's décalage for symmetric powers of a flat module** (README 0.17; [SAG],
Proposition 25.2.4.2, p. 1704, and Proposition 25.2.3.4, p. 1703, for flat modules). Let `N` be a
flat module over a commutative ring `R` and `X = Γ₀(N[1])` as above. The alternating face complex
of the levelwise symmetric power `Symⁿ X` has homology the exterior power `⋀ⁿ_R N` in degree `n`
and zero in every other degree, that is `LSymⁿ(N[1]) ≃ (⋀ⁿN)[n]`. For `N = R` and `n = 2` it is
acyclic, although `Sym²R = R` is nonzero in simplicial degree one. -/
theorem symmetricPower_decalage (R : Type u) [CommRing R] (N : ModuleCat.{u} R)
    [Module.Flat R N] (n : ℕ) :
    let X := (AlgebraicTopology.DoldKan.Γ₀ (C := ModuleCat.{u} R)).obj
      ((HomologicalComplex.single (ModuleCat.{u} R) (ComplexShape.down ℕ) 1).obj N)
    let K := (AlgebraicTopology.alternatingFaceMapComplex (ModuleCat.{u} R)).obj
      (((SimplicialObject.whiskering (ModuleCat.{u} R) (ModuleCat.{u} R)).obj
        (ModuleCat.symmetricPower.functor.{u} R n)).obj X)
    (∀ k : ℕ, k ≠ n → IsZero (K.homology k)) ∧ Nonempty (K.homology n ≅ N.exteriorPower n) := by
  sorry

end DerivedDeRham

/-! ## Layer 3: derived limits, Hom and completion -/

namespace DerivedDeRham

/-- **The derived limit is exact** (README 1.1; Stacks, Lemma 15.89.1, Tag 091D, for `Rlim` as the
right derived functor of `lim`, and Lemma 15.89.3, Tag 0CQD, for its homotopy-limit model). For
every associative unital ring `R`, Tau Ceti's derived limit functor `D(ℕᵒᵖ ⥤ ModuleCat R) ⥤ D(R)`,
induced by the homotopy limit `Cone(δ)[-1]` and equipped with the shift isomorphisms of that cone,
is a triangulated functor: it sends distinguished triangles of the derived category of strict
towers, with their global connecting morphisms, to distinguished triangles. -/
theorem derivedLimit_isTriangulated (R : Type u) [Ring R]
    [HasDerivedCategory.{w} (TauCeti.ModuleTower.{u} R)]
    [HasDerivedCategory.{w'} (ModuleCat.{u} R)] :
    (TauCeti.ModuleTower.derivedLimit R).IsTriangulated := by
  sorry

/-- The standard derived-category instance for modules over `R`, local to these signatures. -/
local instance moduleDerived (R : Type u) [Ring R] :
    HasDerivedCategory.{u+1} (ModuleCat.{u} R) :=
  HasDerivedCategory.standard _

/-- The derived category `D(R)` of `R`-modules. -/
abbrev D (R : Type u) [Ring R] := DerivedCategory (ModuleCat.{u} R)

/-- A module placed in cohomological degree zero. -/
abbrev mod0 (R : Type u) [Ring R] (M : ModuleCat.{u} R) : D R :=
  (DerivedCategory.singleFunctor (ModuleCat R) 0).obj M

/-- Cohomology in the indicated cohomological degree. -/
abbrev H (R : Type u) [Ring R] (n : ℤ) (M : D R) : ModuleCat.{u} R :=
  (DerivedCategory.homologyFunctor (ModuleCat R) n).obj M

/-- **Derived `I`-completeness** of `M ∈ D(A)`: every morphism from a shifted localization
`A[1/f][n]`, `f ∈ I`, to `M` is zero (Stacks, Lemma 15.93.1, Tag 091P, and Definition 15.93.4,
Tag 091S). This is a homotopical condition, not classical separatedness. -/
def derivedCompleteness (A : Type u) [CommRing A] (I : Ideal A) (M : D A) : Prop :=
  ∀ f ∈ I, ∀ n : ℤ,
    Subsingleton ((mod0 A (ModuleCat.of A (Localization.Away f)))⟦n⟧ ⟶ M)

/-- **Completeness is tested on a finite generating set** (README 1.2; Stacks, Lemma 15.93.1,
Tag 091P, with Lemma 15.93.2, Tag 091Q). -/
theorem isDerivedCompleteGenerators (A : Type u) [CommRing A] (I : Ideal A) (M : D A)
    (s : Finset A) (hs : Ideal.span (s : Set A) = I) :
    derivedCompleteness A I M ↔ ∀ f ∈ s, ∀ n : ℤ,
      Subsingleton ((mod0 A (ModuleCat.of A (Localization.Away f)))⟦n⟧ ⟶ M) := by
  sorry

/-- **Completeness depends only on the radical** (README 1.2; Stacks, Lemma 15.93.2, Tag 091Q):
the elements `f` with all `Hom(A[1/f][n], M) = 0` form a radical ideal, so ideals with the same
radical have the same complete objects. No finite generation is needed. -/
theorem isDerivedCompleteRadical (A : Type u) [CommRing A] (I J : Ideal A)
    (h : I.radical = J.radical) (M : D A) :
    derivedCompleteness A I M ↔ derivedCompleteness A J M := by
  sorry

/-- **`M` is derived complete iff every cohomology module is** (README 1.2; Stacks, Lemma 15.93.1,
Tag 091P, parts (3) and (4), and Lemma 15.93.6, Tag 091U), for an arbitrary ideal. -/
theorem isDerivedCompleteCohomology (A : Type u) [CommRing A] (I : Ideal A) (M : D A) :
    derivedCompleteness A I M ↔ ∀ j : ℤ, derivedCompleteness A I (mod0 A (H A j M)) := by
  sorry

/-- **Derived complete objects are closed under shifts and triangles** (README 1.2; Stacks,
Lemma 15.93.6, Tag 091U): including every integer shift; the README also asks for products and derived limits. -/
theorem isDerivedComplete_triangle (A : Type u) [CommRing A] (I : Ideal A)
    (T : Pretriangulated.Triangle (D A)) (hT : T ∈ distTriang (D A))
    (h₁ : derivedCompleteness A I T.obj₁) (h₂ : derivedCompleteness A I T.obj₂) :
    derivedCompleteness A I T.obj₃ ∧ ∀ n : ℤ, derivedCompleteness A I (T.obj₁⟦n⟧) := by
  sorry

/-- **Derived completion is a reflector** (README 1.3; Stacks, Lemma 15.93.10, Tag 091V). For a
finitely generated ideal `I`, the inclusion of the full subcategory of derived `I`-complete objects
into `D(A)` has a left adjoint, the derived completion. -/
theorem derivedCompleteness_isRightAdjoint (A : Type u) [CommRing A] (I : Ideal A) (hI : I.FG) :
    (ObjectProperty.ι (derivedCompleteness A I)).IsRightAdjoint := by
  sorry

/-- **Complete flatness of a module** (README 1.7). A module `M` is `I`-completely flat when its
derived reduction `M ⊗^L_A A/I` is a flat `A/I`-module in degree zero: the higher `Tor_n^A(M, A/I)`
vanish and `A/I ⊗_A M` is flat over `A/I`. The predicate does not require `M` to be complete
([BMS19], Definition 4.1, p. 220, for `I = (p)`; the same definition applies to any ideal). -/
def IsCompletelyFlatModule (A : Type u) [CommRing A] (I : Ideal A) (M : ModuleCat.{u} A) : Prop :=
  (∀ n : ℕ, 0 < n →
      IsZero (((CategoryTheory.Tor (ModuleCat.{u} A) n).obj M).obj (ModuleCat.of A (A ⧸ I)))) ∧
    Module.Flat (A ⧸ I) ((A ⧸ I) ⊗[A] M)

/-- **A derived complete, completely flat module has flat reductions and bounded torsion**
(README 1.8; [BMS19], Lemma 4.7(1), pp. 221–222). Let `A` have bounded `p`-power torsion and let
`M` be an `A`-module that is derived `p`-complete and `p`-completely flat. Then `M` is classically
`p`-adically complete, has bounded `p`-power torsion, and for every `n ≥ 1` its reduction
`M/pⁿM` is flat over `A/pⁿ` and the multiplication map `M ⊗_A A[pⁿ] → M`, `m ⊗ a ↦ a • m`, is
injective with image `M[pⁿ]`. -/
theorem isAdicComplete_of_isCompletelyFlatModule (A : Type u) [CommRing A] (p : ℕ) (hp : p.Prime)
    (hA : ∃ c : ℕ, ∀ (a : A) (n : ℕ), (p : A) ^ n * a = 0 → (p : A) ^ c * a = 0)
    (M : ModuleCat.{u} A) (hc : derivedCompleteness A (Ideal.span {(p : A)}) (mod0 A M))
    (hM : IsCompletelyFlatModule A (Ideal.span {(p : A)}) M) :
    IsAdicComplete (Ideal.span {(p : A)}) M ∧
      (∃ c : ℕ, ∀ (x : M) (n : ℕ), (p : A) ^ n • x = 0 → (p : A) ^ c • x = 0) ∧
      ∀ n : ℕ, 0 < n →
        Module.Flat (A ⧸ Ideal.span {(p : A) ^ n}) ((A ⧸ Ideal.span {(p : A) ^ n}) ⊗[A] M) ∧
        Function.Injective (TensorProduct.lift ((LinearMap.lsmul A M).flip.compl₂
          (Submodule.torsionBy A A ((p : A) ^ n)).subtype)) ∧
        LinearMap.range (TensorProduct.lift ((LinearMap.lsmul A M).flip.compl₂
          (Submodule.torsionBy A A ((p : A) ^ n)).subtype)) =
          Submodule.torsionBy A M ((p : A) ^ n) := by
  sorry

/-- **Flat reductions and bounded torsion give complete flatness** (README 1.8; [BMS19],
Lemma 4.7(2), p. 222). Let `A` have bounded `p`-power torsion and let `M` be a classically
`p`-adically complete `A`-module with bounded `p`-power torsion whose reductions `M/pⁿM` are flat
over `A/pⁿ` for all `n ≥ 1`. Then `M` is `p`-completely flat. -/
theorem isCompletelyFlatModule_of_isAdicComplete (A : Type u) [CommRing A] (p : ℕ) (hp : p.Prime)
    (hA : ∃ c : ℕ, ∀ (a : A) (n : ℕ), (p : A) ^ n * a = 0 → (p : A) ^ c * a = 0)
    (M : ModuleCat.{u} A) [IsAdicComplete (Ideal.span {(p : A)}) M]
    (hM : ∃ c : ℕ, ∀ (x : M) (n : ℕ), (p : A) ^ n • x = 0 → (p : A) ^ c • x = 0)
    (hflat : ∀ n : ℕ, 0 < n →
      Module.Flat (A ⧸ Ideal.span {(p : A) ^ n}) ((A ⧸ Ideal.span {(p : A) ^ n}) ⊗[A] M)) :
    IsCompletelyFlatModule A (Ideal.span {(p : A)}) M := by
  sorry

/-! ## Layer 4: perfect complexes, finite models and effectivity -/

/-- Ordinary scalar extension applied to every term and differential of a complex. -/
abbrev complexBaseChange {R S : Type u} [CommRing R] [CommRing S] (f : R →+* S) :
    CochainComplex (ModuleCat.{u} R) ℤ ⥤ CochainComplex (ModuleCat.{u} S) ℤ :=
  (ModuleCat.extendScalars f).mapHomologicalComplex (ComplexShape.up ℤ)

/-- A finite-free complex with a specified upper bound, allowing an infinite left tail. -/
def IsFiniteFreeModel (R : Type u) [Ring R]
    (P : CochainComplex (ModuleCat.{u} R) ℤ) (b : ℤ) : Prop :=
  ∀ i, Module.Free R (P.X i) ∧ Module.Finite R (P.X i) ∧ (b < i → IsZero (P.X i))

/-- Perfection over a unital ring means a bounded finite-projective left-module representative
(README 1.E.0; Stacks, Definition 15.76.1, Tag 0657, for commutative rings). -/
def IsPerfect (R : Type u) [Ring R] (K : D R) : Prop :=
  ∃ (P : CochainComplex (ModuleCat.{u} R) ℤ) (a b : ℤ),
    (∀ i, Module.Projective R (P.X i) ∧ Module.Finite R (P.X i) ∧
      (i < a ∨ b < i → IsZero (P.X i))) ∧
    Nonempty ((DerivedCategory.Q (C := ModuleCat R)).obj P ≅ K)

/-- Pseudo-coherence over a ring means a bounded-above finite-free representative
(README 1.E.0; Stacks, Definition 15.66.1, Tag 064Q). -/
def IsPseudoCoherent (R : Type u) [Ring R] (K : D R) : Prop :=
  ∃ (P : CochainComplex (ModuleCat.{u} R) ℤ) (b : ℤ), IsFiniteFreeModel R P b ∧
    Nonempty ((DerivedCategory.Q (C := ModuleCat R)).obj P ≅ K)

/-- **Retracts of perfect complexes are perfect** (README 1.E.0; Stacks, Lemma 15.76.5, Tag 066S,
for commutative rings), over every unital ring. -/
theorem isPerfect_retract (R : Type u) [Ring R] {K L : D R}
    (i : K ⟶ L) (r : L ⟶ K) (h : i ≫ r = 𝟙 K) (hL : IsPerfect R L) :
    IsPerfect R K := by
  sorry

/-- Perfect complexes are closed under cohomological shifts (README 1.E.0). -/
theorem isPerfect_shift (R : Type u) [Ring R] (K : D R) (hK : IsPerfect R K) (n : ℤ) :
    IsPerfect R (K⟦n⟧) := by
  sorry

/-- **The third vertex of a distinguished triangle of perfect complexes is perfect**
(README 1.E.0; Stacks, Lemma 15.76.4, Tag 066R, for commutative rings), over every unital ring. -/
theorem isPerfect_triangle (R : Type u) [Ring R] (T : Triangle (D R))
    (hT : T ∈ distTriang (D R)) (h₁ : IsPerfect R T.obj₁) (h₂ : IsPerfect R T.obj₂) :
    IsPerfect R T.obj₃ := by
  sorry

/-- **Perfect complexes are pseudo-coherent** (README 1.E.0; Stacks, Lemma 15.76.2, Tag 0658):
a bounded finite-projective complex has a bounded-above finite-free representative. -/
theorem isPerfect_isPseudoCoherent (R : Type u) [Ring R] (K : D R)
    (hK : IsPerfect R K) : IsPseudoCoherent R K := by
  sorry

/-- Compatible ring projections exhibit `R` as the inverse limit of the ring tower. -/
def IsRingTowerLimit {A : ℕ → Type u} [∀ n, CommRing (A n)]
    (τ : ∀ n, A (n + 1) →+* A n) (R : Type u) [CommRing R] (π : ∀ n, R →+* A n) : Prop :=
  (∀ n, (τ n).comp (π (n + 1)) = π n) ∧
    ∀ x : ∀ n, A n, (∀ n, τ n (x (n + 1)) = x n) → ∃! r : R, ∀ n, π n r = x n

/-- **Unit reflection from the first stage** (README 1.E.0): in a surjective ring tower with
locally nilpotent transition kernels, an element of the limit whose image in `A₀` is a unit is a
unit, so `ker(R → A₀)` lies in the Jacobson radical. -/
theorem ringTowerLimit_jacobson {A : ℕ → Type u} [∀ n, CommRing (A n)]
    (τ : ∀ n, A (n + 1) →+* A n) (hsurj : ∀ n, Function.Surjective (τ n))
    (hnil : ∀ n x, τ n x = 0 → IsNilpotent x)
    (R : Type u) [CommRing R] (π : ∀ n, R →+* A n) (hlim : IsRingTowerLimit τ R π) :
    ∀ r : R, IsUnit (π 0 r) → IsUnit r := by
  sorry

/-- **Residue-field Tor criterion** (README 1.E.0; Stacks, Lemma 15.79.2, Tag 068V, with
Lemma 15.76.2, Tag 0658). Let `P` be a bounded-above finite-free complex over `R`. If for every
surjection `f : R → k` onto a field (so `k` is a residue field at a maximal ideal) the termwise
reduction `P ⊗_R k`, which computes `P ⊗^L_R k` because `P` is termwise free, has cohomology only
in degrees `[a, b]`, then `P` is quasi-isomorphic to a complex of finite projective `R`-modules
supported in `[a, b]`. -/
theorem pseudoCoherent_residueCriterion (R : Type u) [CommRing R]
    (P : CochainComplex (ModuleCat.{u} R) ℤ) (c : ℤ) (hP : IsFiniteFreeModel R P c) (a b : ℤ)
    (hfib : ∀ (k : Type u) [Field k] (f : R →+* k), Function.Surjective f →
      ∀ i : ℤ, i < a ∨ b < i →
        IsZero (H k i ((DerivedCategory.Q (C := ModuleCat k)).obj
          ((complexBaseChange f).obj P)))) :
    ∃ E : CochainComplex (ModuleCat.{u} R) ℤ,
      (∀ i, Module.Projective R (E.X i) ∧ Module.Finite R (E.X i) ∧
        (i < a ∨ b < i → IsZero (E.X i))) ∧
      Nonempty ((DerivedCategory.Q (C := ModuleCat R)).obj E ≅
        (DerivedCategory.Q (C := ModuleCat R)).obj P) := by
  sorry

end DerivedDeRham

/-! ## Layer 5: Matlis duality -/

namespace Matlis

/-- **Matlis duality, finite side** (README 1.M.1–1.M.2; Stacks, Proposition 47.7.8, Tag 08Z9).
Let `R` be a Noetherian local ring complete for its maximal ideal and `e : κ → E` an injective
envelope of its residue field. For a finite `R`-module `M`, the Matlis dual `Hom_R(M, E)` is
Artinian and the evaluation map `M → Hom_R(Hom_R(M, E), E)` is bijective. No finiteness of the
residue field is assumed. -/
theorem biduality_of_finite (R : Type u) [CommRing R] [IsLocalRing R] [IsNoetherianRing R]
    [IsAdicComplete (IsLocalRing.maximalIdeal R) R]
    (E : Type u) [AddCommGroup E] [Module R E] (e : IsLocalRing.ResidueField R →ₗ[R] E)
    (he : TauCeti.IsInjectiveEnvelope e)
    (M : Type u) [AddCommGroup M] [Module R M] [Module.Finite R M] :
    IsArtinian R (M →ₗ[R] E) ∧
      Function.Bijective (LinearMap.applyₗ : M →ₗ[R] (M →ₗ[R] E) →ₗ[R] E) := by
  sorry

/-- **Matlis duality, Artinian side** (README 1.M.1–1.M.2; Stacks, Proposition 47.7.8, Tag 08Z9).
Under the same hypotheses, for an Artinian `R`-module `M` the Matlis dual `Hom_R(M, E)` is a finite
`R`-module and the evaluation map `M → Hom_R(Hom_R(M, E), E)` is bijective. Completeness of `R` is
needed: for a non-complete discrete valuation ring the dual of `E` is the completion. -/
theorem biduality_of_artinian (R : Type u) [CommRing R] [IsLocalRing R] [IsNoetherianRing R]
    [IsAdicComplete (IsLocalRing.maximalIdeal R) R]
    (E : Type u) [AddCommGroup E] [Module R E] (e : IsLocalRing.ResidueField R →ₗ[R] E)
    (he : TauCeti.IsInjectiveEnvelope e)
    (M : Type u) [AddCommGroup M] [Module R M] [IsArtinian R M] :
    Module.Finite R (M →ₗ[R] E) ∧
      Function.Bijective (LinearMap.applyₗ : M →ₗ[R] (M →ₗ[R] E) →ₗ[R] E) := by
  sorry

end Matlis

end

end TauCetiRoadmap.DerivedModuleAlgebra
