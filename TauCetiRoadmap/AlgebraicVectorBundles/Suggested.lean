import Mathlib
import TauCeti.AlgebraicGeometry.VectorBundle.Rank
import TauCeti.AlgebraicGeometry.VectorBundle.Determinant.LocallyConstantRank
import TauCeti.AlgebraicGeometry.LineBundle.TensorProduct
import TauCeti.AlgebraicGeometry.Modules.TensorProduct
import TauCeti.AlgebraicGeometry.Modules.Pullback.Basic
import TauCeti.AlgebraicGeometry.Modules.SymmetricPower.Pullback.Basic
import TauCeti.AlgebraicGeometry.Modules.ExteriorPower.Pullback.Basic

/-!
# Algebraic vector bundles: target signatures

`README.md` is the roadmap; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, on the native carriers:
`X.Modules` with its canonical symmetric monoidal structure, `Scheme.Modules.pullback` with its
oplax monoidal structure, the power comparisons `Scheme.Modules.pullbackSymmetricPowerComparison`
and `Scheme.Modules.pullbackExteriorPowerComparison`, Tau Ceti's `FiniteLocallyFreeSheaf` with
its bundled rank, its determinant `FiniteLocallyFreeSheaf.det`, and `InvertibleSheaf` with
`InvertibleSheaf.tensorProduct`.

The pinned Tau Ceti already proves the dualizability criterion, quasi-coherence and base change
of internal Hom, the rank formulas and pullback isomorphisms of symmetric and exterior powers of
finite locally free sheaves, the determinant and its pullback, the relative-Spec anti-equivalence
with its universal property and base change, graded quasi-coherent algebras, the linear-scheme
equivalence, the geometric-bundle equivalence and the section-valued universal property of the
total space; `README.md` lists these as consumed, and none is restated here. The headlines below
are the statements the library makes only for quasi-coherent, respectively finite locally free,
sheaves, in their general form, and the determinant of a direct sum.

The names `isFiniteLocallyFree`, `FiniteLocallyFreeSheaf`, `isFiniteLocallyFreeOfRank` and
`determinantObj` are the Tau Ceti notions under this roadmap's namespace, kept because consumers
build on them under these names.

Headline theorems of the roadmap that are not statable at the pins:

* the affine comparison of Layer 2 between the determinant sheaf and the ring-level determinant
  of a finite projective module as graded lines: the ring-level determinant and the graded lines
  are targets of PadicMeasuresIwasawaAlgebras §5.1, not declarations at the pins;
* the Koszul-sign compatibility of the direct-sum isomorphism of the determinant with the swap of
  summands: it is stated on the same graded lines.
-/

namespace TauCetiRoadmap.AlgebraicVectorBundles

open CategoryTheory Limits TauCeti.AlgebraicGeometry AlgebraicGeometry

universe u

/-! ## Layer 1: strong monoidal pullback -/

/-- The canonical oplax tensor comparison of module pullback is invertible for every scheme
morphism and every pair of module sheaves, without flatness or quasi-coherence assumptions
(Stacks Project, Tag 01CD). The pinned library proves it when one factor is quasi-coherent;
together with the pinned unit isomorphism and symmetry law this makes pullback strong symmetric
monoidal on all `𝒪_X`-modules. -/
theorem pullback_tensor_isIso {X Y : Scheme.{u}} (f : Y ⟶ X)
    (E F : X.Modules) :
    IsIso (Functor.OplaxMonoidal.δ (Scheme.Modules.pullback f) E F) := by
  sorry

/-! ## Layer 2: powers and the determinant -/

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

/-- The canonical comparison `f^* Symⁿ(E) ⟶ Symⁿ(f^* E)` is invertible for every scheme
morphism, every degree and every `𝒪_X`-module `E` (Stacks Project, Tag 01CI, on homogeneous
components). The pinned library proves it for quasi-coherent `E` and in degree one. -/
theorem symmetricPower_pullback_isIso {X Y : Scheme.{u}} (f : Y ⟶ X) (n : ℕ) :
    IsIso (Scheme.Modules.pullbackSymmetricPowerComparison f n) := by
  sorry

/-- The canonical comparison `f^* ∧ⁿ(E) ⟶ ∧ⁿ(f^* E)` is invertible for every scheme morphism,
every degree and every `𝒪_X`-module `E` (Stacks Project, Tag 01CI, on homogeneous components).
The pinned library proves it for quasi-coherent `E` and in degree one. -/
theorem exteriorPower_pullback_isIso {X Y : Scheme.{u}} (f : Y ⟶ X) (n : ℕ) :
    IsIso (Scheme.Modules.pullbackExteriorPowerComparison f n) := by
  sorry

/-- The determinant of a finite locally free sheaf as an object of `InvertibleSheaf X`: Tau
Ceti's `FiniteLocallyFreeSheaf.det`, the exterior power of `E` in the locally constant degree
`rank E`, under this roadmap's name. -/
noncomputable abbrev determinantObj {X : Scheme.{u}} (E : FiniteLocallyFreeSheaf X) :
    InvertibleSheaf X :=
  TauCeti.AlgebraicGeometry.FiniteLocallyFreeSheaf.det E

/-- The determinant of a direct sum of finite locally free sheaves is the tensor product of the
determinants: on the clopen locus where `E` has rank `r` and `F` has rank `s`, the top exterior
power `∧^{r+s}(E ⊕ F)` is `∧^r E ⊗ ∧^s F` (Hartshorne, *Algebraic Geometry*, II, Exercise
5.16(d)). The isomorphism is natural in isomorphisms of `E` and `F`, compatible with pullback,
and intertwines the swap of summands with the symmetry of `InvertibleSheaf.tensorProduct` up to
the sign `(−1)^{rs}` on that locus. -/
theorem determinant_biprod {X : Scheme.{u}} (E F : FiniteLocallyFreeSheaf X) :
    Nonempty (determinantObj (biprod E F) ≅
      InvertibleSheaf.tensorProduct (determinantObj E) (determinantObj F)) := by
  sorry

end TauCetiRoadmap.AlgebraicVectorBundles
