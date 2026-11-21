import Mathlib
import TauCeti.AlgebraicGeometry.VectorBundle.Rank
import TauCeti.AlgebraicGeometry.VectorBundle.Determinant.LocallyConstantRank
import TauCeti.AlgebraicGeometry.Modules.Pullback.Basic
import TauCeti.AlgebraicGeometry.Modules.Pullback.InternalHom.Basic
import TauCeti.AlgebraicGeometry.Modules.SymmetricPower.Pullback.Basic
import TauCeti.AlgebraicGeometry.Modules.ExteriorPower.Pullback.Basic
import TauCeti.AlgebraicGeometry.LineBundle.Class

/-!
# Algebraic vector bundles: target signatures

`README.md` is the roadmap; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, on the native carriers. A
morphism of ringed spaces is a continuous map `f` of `TopCat` with sheaves of commutative rings on
both sides and a morphism `φ` of sheaves of rings from the target's structure sheaf to the
pushforward of the source's; its module pullback is Mathlib's `SheafOfModules.pullback φ` with Tau
Ceti's oplax monoidal structure `TauCeti.SheafOfModules.pullbackOplaxMonoidal`, and its power
comparisons are Tau Ceti's `TauCeti.SheafOfModules.pullbackSymmetricPowerComparison` and
`TauCeti.SheafOfModules.pullbackExteriorPowerComparison`. A morphism of schemes `f` is the
instance `f.base`, `f.toRingCatSheafHom`, at which these are definitionally Tau Ceti's scheme-level
`Scheme.Modules.pullback f` and its comparisons. The existence of the left adjoint,
`(SheafOfModules.pushforward φ).IsRightAdjoint`, is carried as an instance argument: it holds for
every such `φ` by Mathlib's construction of `SheafOfModules.pullback`, but instance search does not
find it for a general continuous map. On schemes the internal-Hom base-change comparison is Tau
Ceti's `pullbackIhomComparison`, and the determinant and Picard group are Tau Ceti's
`FiniteLocallyFreeSheaf.det` and `LineBundleClass`.

The names `isFiniteLocallyFree`, `FiniteLocallyFreeSheaf`, `isFiniteLocallyFreeOfRank` and
`determinantObj` are Tau Ceti notions under this roadmap's namespace (the third is Tau Ceti's
`FiniteLocallyFreeSheaf.isConstantRank` read on `X.Modules`, the last is Tau Ceti's
`FiniteLocallyFreeSheaf.det`), kept because consumers build on them under these names.

Headline theorems of the roadmap that are not statable at the pins:

* flat base change of internal Hom from a finitely presented source along a morphism of ringed
  spaces (Layer 2): the base-change comparison `f^* Hom(M, N) → Hom(f^* M, f^* N)` exists at the
  pin only on schemes and for a quasi-coherent source, where it is built from the inverse of the
  tensor comparison; the scheme case is stated;
* the canonical isomorphism `det E′ ⊗ det E″ ≅ det E` of a short exact sequence of finite locally
  free sheaves, given locally by `e′ ⊗ ẽ″ ↦ e′ ∧ ẽ″` for lifts `ẽ″`, and its split case
  `det(E ⊕ F) ≅ det E ⊗ det F` with the swap of summands acting by `(−1)^(rank E · rank F)`
  (Layer 3): the isomorphism is data, and the sheaf-level exterior multiplication
  `∧ᵃ E ⊗ ∧ᵇ E → ∧ᵃ⁺ᵇ E` from which it is built is missing, so its local formula and its sign law
  have nothing to refer to; the equality of classes in the Picard group is stated;
* the identification, on `Spec A`, of the determinant of the sheaf of a finite projective module
  with the ring-level determinant as graded lines (Layer 3): graded lines and the ring-level
  determinant of finite projective modules are targets of PadicMeasuresIwasawaAlgebras §5.1, not
  declarations at the pins;
* the recognition of linear schemes as the module schemes over `𝔸¹_X` whose coordinate algebra
  is free in degree one (Layer 4): the grading of the coordinate algebra of an affine scheme over
  `X` induced by an action of the multiplicative monoid `𝔸¹_X`, and the category of such module
  schemes, are missing.
-/

namespace TauCetiRoadmap.AlgebraicVectorBundles

open CategoryTheory Limits MonoidalClosed TopologicalSpace
open TauCeti.AlgebraicGeometry AlgebraicGeometry

universe u

/-- Finite local freeness as a property of `𝒪_X`-modules: Tau Ceti's
`Scheme.Modules.isFiniteLocallyFree X`, locally free and of finite presentation. -/
abbrev isFiniteLocallyFree (X : Scheme.{u}) : ObjectProperty X.Modules :=
  Scheme.Modules.isFiniteLocallyFree X

/-- The full category of finite locally free sheaves on `X`: Tau Ceti's
`FiniteLocallyFreeSheaf X`. -/
abbrev FiniteLocallyFreeSheaf (X : Scheme.{u}) : Type _ :=
  TauCeti.AlgebraicGeometry.FiniteLocallyFreeSheaf X

/-- Finite locally free of constant rank `r`, as a property of `𝒪_X`-modules: Tau Ceti's
`FiniteLocallyFreeSheaf.isConstantRank X r` read on `X.Modules`, that is, finite locally free,
with Tau Ceti's bundled rank equal to `r` at every point. -/
def isFiniteLocallyFreeOfRank (X : Scheme.{u}) (r : ℕ) : ObjectProperty X.Modules :=
  fun E => ∃ h : isFiniteLocallyFree X E,
    ∀ x : X, FiniteLocallyFreeSheaf.rank (⟨E, h⟩ : FiniteLocallyFreeSheaf X) x = r

/-- The determinant `∧^(rank E) E` of a finite locally free sheaf, an invertible sheaf: Tau Ceti's
`FiniteLocallyFreeSheaf.det`, which over the clopen locus where `E` has rank `n` is the top
exterior power `∧ⁿ E`, of rank `C(n, n) = 1`, hence invertible by
`FiniteLocallyFreeSheaf.isInvertible_iff_forall_rank_eq_one` (Hartshorne, *Algebraic Geometry*, II,
Exercise 5.16). -/
noncomputable abbrev determinantObj {X : Scheme.{u}} (E : FiniteLocallyFreeSheaf X) :
    InvertibleSheaf X :=
  TauCeti.AlgebraicGeometry.FiniteLocallyFreeSheaf.det E

/-! ## Layer 1: pullback along morphisms of ringed spaces -/

/-- For every morphism of ringed spaces `(f, φ) : Y → X` and every pair of `𝒪_X`-modules, the
canonical oplax tensor comparison `f^* (E ⊗ F) → f^* E ⊗ f^* F` of module pullback is invertible,
without flatness or quasi-coherence assumptions (Stacks Project, Tag 01CD). For a morphism of
schemes this is the instance `f.base`, `f.toRingCatSheafHom`, where Tau Ceti proves it when one
factor is quasi-coherent (`Scheme.Modules.isIso_pullback_δ_of_isQuasicoherent`). Together with the
pinned unit isomorphism and symmetry law this makes pullback strong symmetric monoidal on all
module sheaves. The argument `(SheafOfModules.pushforward φ).IsRightAdjoint` is the existence of
the pullback, which holds for every `φ`. -/
theorem pullback_tensor_isIso {X Y : TopCat.{u}} (f : Y ⟶ X)
    {𝒪X : Sheaf (Opens.grothendieckTopology X) CommRingCat.{u}}
    {𝒪Y : Sheaf (Opens.grothendieckTopology Y) CommRingCat.{u}}
    (φ : TauCeti.SheafOfModules.ringCatSheaf 𝒪X ⟶
      ((Opens.map f).sheafPushforwardContinuous RingCat.{u} _ _).obj
        (TauCeti.SheafOfModules.ringCatSheaf 𝒪Y))
    [(SheafOfModules.pushforward.{u} φ).IsRightAdjoint]
    (E F : SheafOfModules.{u} (TauCeti.SheafOfModules.ringCatSheaf 𝒪X)) :
    IsIso (Functor.OplaxMonoidal.δ (SheafOfModules.pullback.{u} φ) E F) := by
  sorry

/-! ## Layer 2: flat pullback and base change of internal Hom -/

/-- Along a flat morphism of schemes `f : X ⟶ Y`, the canonical comparison
`f^* Hom(M, N) → Hom(f^* M, f^* N)` is an isomorphism for every finitely presented `M` and every
`𝒪_Y`-module `N`, quasi-coherent or not (Stacks Project, Tag 0C6I). Tau Ceti proves this for a
quasi-coherent target (`Scheme.Hom.isIso_pullbackIhomComparison_app`), and for a finite locally free
source and every target and morphism (`FiniteLocallyFreeSheaf.isIso_pullbackIhomComparison`). The
comparison is built on the quasi-coherence of `M`, which finite presentation implies; it is carried
as an instance argument because instance search does not derive it on `Y.Modules`. -/
theorem isIso_pullbackIhomComparison_app_of_flat {X Y : Scheme.{u}} (f : X ⟶ Y) [Flat f]
    (M N : Y.Modules) [M.IsFinitePresentation] [M.IsQuasicoherent] :
    IsIso ((pullbackIhomComparison M f).app N) := by
  sorry

/-! ## Layer 3: symmetric and exterior powers, determinant -/

/-- Symmetric powers commute with pullback on all module sheaves: for every morphism of ringed
spaces `(f, φ) : X → Y` and every `n`, Tau Ceti's canonical comparison
`f^* (Symⁿ M) → Symⁿ (f^* M)` for the pullback adjunction is a natural isomorphism, for every
`𝒪_Y`-module `M` (Stacks Project, Tag 01CI). For a morphism of schemes this is the instance
`f.base`, `f.toRingCatSheafHom`, which is `Scheme.Modules.pullbackSymmetricPowerComparison f n`;
Tau Ceti proves invertibility there at quasi-coherent `M`
(`isIso_pullbackSymmetricPowerComparison_app`) and in degree one. -/
theorem symmetricPower_pullback_isIso {X Y : TopCat.{u}} (f : X ⟶ Y)
    {𝒪X : Sheaf (Opens.grothendieckTopology X) CommRingCat.{u}}
    {𝒪Y : Sheaf (Opens.grothendieckTopology Y) CommRingCat.{u}}
    (φ : TauCeti.SheafOfModules.ringCatSheaf 𝒪Y ⟶
      ((Opens.map f).sheafPushforwardContinuous RingCat.{u} _ _).obj
        (TauCeti.SheafOfModules.ringCatSheaf 𝒪X))
    [(SheafOfModules.pushforward.{u} φ).IsRightAdjoint] (n : ℕ) :
    IsIso (TauCeti.SheafOfModules.pullbackSymmetricPowerComparison
      (SheafOfModules.pullbackPushforwardAdjunction.{u} φ) n) := by
  sorry

/-- Exterior powers commute with pullback on all module sheaves: for every morphism of ringed
spaces `(f, φ) : X → Y` and every `n`, Tau Ceti's canonical comparison
`f^* (∧ⁿ M) → ∧ⁿ (f^* M)` for the pullback adjunction is a natural isomorphism, for every
`𝒪_Y`-module `M` (Stacks Project, Tag 01CI). For a morphism of schemes this is the instance
`f.base`, `f.toRingCatSheafHom`, which is `Scheme.Modules.pullbackExteriorPowerComparison f n`;
Tau Ceti proves invertibility there at quasi-coherent `M`
(`isIso_pullbackExteriorPowerComparison_app`) and in degree one. -/
theorem exteriorPower_pullback_isIso {X Y : TopCat.{u}} (f : X ⟶ Y)
    {𝒪X : Sheaf (Opens.grothendieckTopology X) CommRingCat.{u}}
    {𝒪Y : Sheaf (Opens.grothendieckTopology Y) CommRingCat.{u}}
    (φ : TauCeti.SheafOfModules.ringCatSheaf 𝒪Y ⟶
      ((Opens.map f).sheafPushforwardContinuous RingCat.{u} _ _).obj
        (TauCeti.SheafOfModules.ringCatSheaf 𝒪X))
    [(SheafOfModules.pushforward.{u} φ).IsRightAdjoint] (n : ℕ) :
    IsIso (TauCeti.SheafOfModules.pullbackExteriorPowerComparison
      (SheafOfModules.pullbackPushforwardAdjunction.{u} φ) n) := by
  sorry

/-- The determinant is multiplicative on short exact sequences of vector bundles: for a short exact
sequence `0 → E′ → E → E″ → 0` of `𝒪_X`-modules whose three terms are finite locally free, the
class of `det E` in the Picard group `LineBundleClass X` is the product of the classes of `det E′`
and `det E″`. It is the class of the canonical isomorphism `det E′ ⊗ det E″ ≅ det E`, given
locally by `e′ ⊗ ẽ″ ↦ e′ ∧ ẽ″` for lifts `ẽ″` (Stacks Project, Tag 0FJB, for finite projective
modules), and it makes the determinant additive on the Grothendieck group of finite locally free
sheaves. -/
theorem mk_determinantObj_of_shortExact {X : Scheme.{u}} (S : ShortComplex X.Modules)
    (hS : S.ShortExact) (h₁ : isFiniteLocallyFree X S.X₁) (h₂ : isFiniteLocallyFree X S.X₂)
    (h₃ : isFiniteLocallyFree X S.X₃) :
    LineBundleClass.mk (determinantObj (⟨S.X₂, h₂⟩ : FiniteLocallyFreeSheaf X)) =
      LineBundleClass.mk (determinantObj (⟨S.X₁, h₁⟩ : FiniteLocallyFreeSheaf X)) *
        LineBundleClass.mk (determinantObj (⟨S.X₃, h₃⟩ : FiniteLocallyFreeSheaf X)) := by
  sorry

end TauCetiRoadmap.AlgebraicVectorBundles
