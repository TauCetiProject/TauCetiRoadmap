import Mathlib
import TauCeti.AlgebraicGeometry.VectorBundle.Rank
import TauCeti.AlgebraicGeometry.VectorBundle.Determinant.LocallyConstantRank
import TauCeti.AlgebraicGeometry.Modules.Pullback.Basic
import TauCeti.AlgebraicGeometry.Modules.Pullback.InternalHom.Basic
import TauCeti.AlgebraicGeometry.Modules.SymmetricPower.Pullback.Basic
import TauCeti.AlgebraicGeometry.Modules.ExteriorPower.Pullback.Basic

/-!
# Algebraic vector bundles: target signatures

`README.md` is the roadmap; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, on the native carriers:
`X.Modules` with its canonical symmetric monoidal closed structure, Tau Ceti's oplax monoidal
module pullback, its internal-Hom base-change comparison `pullbackIhomComparison`, and its
power-pullback comparisons `Scheme.Modules.pullbackSymmetricPowerComparison` and
`Scheme.Modules.pullbackExteriorPowerComparison`. Each headline removes a quasi-coherence
hypothesis under which Tau Ceti already proves the statement.

The following are Tau Ceti declarations at the pin and are consumed, not restated: the
dualizability criterion `QuasicoherentSheaf.nonempty_hasLeftDual_iff_isFiniteLocallyFree`, on every
scheme; quasi-coherence of internal Hom `isQuasicoherent_ihom_of_isFinitePresentation`; the ranks
of powers `FiniteLocallyFreeSheaf.rank_symmetricPower_apply` and
`FiniteLocallyFreeSheaf.rank_exteriorPower_apply`; the determinant `FiniteLocallyFreeSheaf.det`;
the relative-Spec anti-equivalence `relativeSpecEquiv` and its base change
`relativeSpecBaseChangeIso`; the linear-scheme equivalence `linearSpecEquiv`; the geometric-bundle
equivalence `totalSpaceEquiv`; and the section-valued universal property `totalSpaceHomEquiv`.

The names `isFiniteLocallyFree`, `FiniteLocallyFreeSheaf`, `isFiniteLocallyFreeOfRank` and
`determinantObj` are Tau Ceti notions under this roadmap's namespace (the last is Tau Ceti's
`FiniteLocallyFreeSheaf.det`), kept because consumers build on them under these names.

Headline theorems of the roadmap that are not statable at the pins:

* the determinant of a direct sum, `det(E ⊕ F) ≅ det E ⊗ det F` with the swap of summands acting
  by `(−1)^(rank E · rank F)` (Layer 3): the isomorphism is data, and the sheaf-level exterior
  multiplication `∧ᵃ E ⊗ ∧ᵇ F → ∧ᵃ⁺ᵇ (E ⊕ F)` from which it is built is missing, so its sign law
  has nothing to refer to;
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

open CategoryTheory Limits MonoidalClosed TauCeti.AlgebraicGeometry AlgebraicGeometry

universe u

/-- Finite local freeness as a property of `𝒪_X`-modules: Tau Ceti's
`Scheme.Modules.isFiniteLocallyFree X`, locally free and of finite presentation. -/
abbrev isFiniteLocallyFree (X : Scheme.{u}) : ObjectProperty X.Modules :=
  Scheme.Modules.isFiniteLocallyFree X

/-- The full category of finite locally free sheaves on `X`: Tau Ceti's
`FiniteLocallyFreeSheaf X`. -/
abbrev FiniteLocallyFreeSheaf (X : Scheme.{u}) : Type _ :=
  TauCeti.AlgebraicGeometry.FiniteLocallyFreeSheaf X

/-- Finite locally free of constant rank `r`, as a property of `𝒪_X`-modules: finite locally
free, with Tau Ceti's bundled rank equal to `r` at every point. -/
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

/-! ## Layer 1: strong monoidal pullback -/

/-- The canonical oplax tensor comparison `f^* (E ⊗ F) → f^* E ⊗ f^* F` of module pullback is
invertible for every scheme morphism and every pair of module sheaves, without flatness or
quasi-coherence assumptions (Stacks Project, Tag 01CD). Tau Ceti proves this when one factor is
quasi-coherent (`Scheme.Modules.isIso_pullback_δ_of_isQuasicoherent`). Together with the pinned
unit isomorphism and symmetry law this makes pullback strong symmetric monoidal on all of
`X.Modules`. -/
theorem pullback_tensor_isIso {X Y : Scheme.{u}} (f : Y ⟶ X)
    (E F : X.Modules) :
    IsIso (Functor.OplaxMonoidal.δ (Scheme.Modules.pullback f) E F) := by
  sorry

/-! ## Layer 2: flat base change of internal Hom -/

/-- Along a flat morphism `f : X ⟶ Y`, the canonical comparison
`f^* Hom(M, N) → Hom(f^* M, f^* N)` is an isomorphism for every finitely presented `M` and every
`𝒪_Y`-module `N`, quasi-coherent or not (Stacks Project, Tag 0C6I). Tau Ceti proves this for a
quasi-coherent target (`Scheme.Hom.isIso_pullbackIhomComparison_app`), and for a finite locally free
source and every target and morphism (`FiniteLocallyFreeSheaf.isIso_pullbackIhomComparison`). The
comparison is built on
the quasi-coherence of `M`, which finite presentation implies; it is carried as an instance
argument because instance search does not derive it on `Y.Modules`. -/
theorem isIso_pullbackIhomComparison_app_of_flat {X Y : Scheme.{u}} (f : X ⟶ Y) [Flat f]
    (M N : Y.Modules) [M.IsFinitePresentation] [M.IsQuasicoherent] :
    IsIso ((pullbackIhomComparison M f).app N) := by
  sorry

/-! ## Layer 3: symmetric and exterior powers, determinant -/

/-- Symmetric powers commute with pullback on all module sheaves: for every `f : X ⟶ Y` and every
`n`, Tau Ceti's canonical comparison `f^* (Symⁿ M) → Symⁿ (f^* M)` is a natural isomorphism, for
every `𝒪_Y`-module `M` (Stacks Project, Tag 01CI). Tau Ceti proves invertibility at quasi-coherent
`M` (`isIso_pullbackSymmetricPowerComparison_app`) and in degree one. -/
theorem symmetricPower_pullback_isIso {X Y : Scheme.{u}} (f : X ⟶ Y) (n : ℕ) :
    IsIso (Scheme.Modules.pullbackSymmetricPowerComparison f n) := by
  sorry

/-- Exterior powers commute with pullback on all module sheaves: for every `f : X ⟶ Y` and every
`n`, Tau Ceti's canonical comparison `f^* (∧ⁿ M) → ∧ⁿ (f^* M)` is a natural isomorphism, for every
`𝒪_Y`-module `M` (Stacks Project, Tag 01CI). Tau Ceti proves invertibility at quasi-coherent `M`
(`isIso_pullbackExteriorPowerComparison_app`) and in degree one. -/
theorem exteriorPower_pullback_isIso {X Y : Scheme.{u}} (f : X ⟶ Y) (n : ℕ) :
    IsIso (Scheme.Modules.pullbackExteriorPowerComparison f n) := by
  sorry

end TauCetiRoadmap.AlgebraicVectorBundles
