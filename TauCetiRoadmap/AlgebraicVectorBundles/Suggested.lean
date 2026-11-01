import Mathlib
import TauCeti.AlgebraicGeometry.VectorBundle.Rank
import TauCeti.AlgebraicGeometry.VectorBundle.Dual.Basic
import TauCeti.AlgebraicGeometry.LineBundle.Basic
import TauCeti.AlgebraicGeometry.Modules.TensorProduct
import TauCeti.AlgebraicGeometry.RelativeSpec.Functor
import TauCeti.Algebra.Category.ModuleCat.Sheaf.SymmetricPower
import TauCeti.Algebra.Category.ModuleCat.Sheaf.ExteriorPower

/-!
# Algebraic vector bundles: target signatures

`README.md` is the roadmap; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, on the native carriers:
Tau Ceti's `QuasicoherentSheaf`, `FiniteLocallyFreeSheaf` with its bundled rank and rank loci,
`SheafOfModules.symmetricPower` and `SheafOfModules.exteriorPower`, `InvertibleSheaf`,
`QuasicoherentAlgebra`, `AffineSchemeOver` and `relativeSpec`, with the canonical symmetric
monoidal closed structure `Scheme.Modules.instMonoidalCategory` on `X.Modules`.

The determinant of a finite locally free sheaf is defined here with a real body, as the product
over `n` of the exterior powers `∧ⁿ E` restricted to the clopen rank loci and pushed forward
again; that it is invertible is the Layer 3 headline `isInvertible_determinantModule`, and
`determinantObj` packages it as an object of `InvertibleSheaf X`. The names `isFiniteLocallyFree`,
`FiniteLocallyFreeSheaf` and `isFiniteLocallyFreeOfRank` are the Tau Ceti notions under this
roadmap's namespace, kept because consumers build on them under these names.

Headline theorems of the roadmap that are not statable at the pins:

* the base-change isomorphism `Y ×_X Spec_X(A) ≅ Spec_Y(f^* A)` of Layer 5: pulling back a
  quasi-coherent algebra needs a monoidal structure on `Scheme.Modules.pullback`, which neither
  library has;
* the linear-scheme equivalence `QCoh(X)ᵒᵖ ≌ LinearSch(X)` of Layer 6: the sheaf symmetric
  algebra `Sym_{𝒪_X}(F)` as a quasi-coherent commutative algebra, the category of nonnegatively
  graded quasi-coherent algebras and the category of linear schemes are all missing;
* the equivalence `FinLocFree(X) ≌ GeomVB(X)` of Layer 7 and the universal property
  `Hom_X(T, V(E)) ≃ Γ(T, f^* E)` of the geometric total space: the total space
  `V(E) = Spec_X Sym(E^∨)` needs the same missing sheaf symmetric algebra, and the category of
  geometric vector bundles is built on the missing linear schemes.
-/

namespace TauCetiRoadmap.AlgebraicVectorBundles

open CategoryTheory Limits MonoidalClosed TauCeti.AlgebraicGeometry AlgebraicGeometry

universe u

/-! ## Layer 2: quasi-coherent and finite locally free sheaves -/

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

/-- A quasi-coherent sheaf is finite locally free exactly when it has a dual in the symmetric
monoidal category of quasi-coherent sheaves. A dual there is a dual in `X.Modules`, which by
Stacks Project, Tag 0FNU, makes the sheaf finitely presented and flat, hence finite locally free
on affine opens by Tag 00NX; the converse direction is Tau Ceti's
`QuasicoherentSheaf.nonempty_hasLeftDual_of_isFiniteLocallyFree`, and the affine case is Tau
Ceti's `QuasicoherentSheaf.nonempty_hasLeftDual_iff_isFiniteLocallyFree`. -/
theorem isFiniteLocallyFree_iff_nonempty_hasLeftDual {X : Scheme.{u}}
    (E : QuasicoherentSheaf X) :
    Scheme.Modules.isFiniteLocallyFree X E.obj ↔ Nonempty (HasLeftDual E) := by
  sorry

/-- The internal Hom `Hom(E, F)` of the closed structure on `X.Modules` is quasi-coherent when
`E` is finitely presented and `F` is quasi-coherent: locally it is the kernel of a map between
finite direct sums of copies of `F` (Stacks Project, Tag 01CQ), and kernels of maps of
quasi-coherent sheaves on a scheme are quasi-coherent (Stacks Project, Tag 01LB). -/
theorem ihom_isQuasicoherent {X : Scheme.{u}} (E F : X.Modules)
    [E.IsFinitePresentation] [F.IsQuasicoherent] :
    ((ihom E).obj F).IsQuasicoherent := by
  sorry

/-! ## Layer 3: symmetric and exterior powers, determinant -/

/-- The `n`-th symmetric power of a finite locally free sheaf is finite locally free, and at
each point its rank is the number `multichoose r n = C(r + n - 1, n)` of monomials of degree `n`
in `r` variables, where `r` is the rank of the sheaf at that point. Local freeness is Stacks
Project, Tag 01CK (6); the rank counts the monomial basis of the symmetric power of a free
module. -/
theorem symmetricPower_isFiniteLocallyFree_rank {X : Scheme.{u}}
    (E : FiniteLocallyFreeSheaf X) (n : ℕ) :
    ∃ h : Scheme.Modules.isFiniteLocallyFree X
        ((SheafOfModules.symmetricPower X.sheaf n).obj E.obj),
      ∀ x : X, FiniteLocallyFreeSheaf.rank
        (⟨(SheafOfModules.symmetricPower X.sheaf n).obj E.obj, h⟩ : FiniteLocallyFreeSheaf X) x =
          Nat.multichoose (FiniteLocallyFreeSheaf.rank E x) n := by
  sorry

/-- The `n`-th exterior power of a finite locally free sheaf is finite locally free, and at each
point its rank is `C(r, n)`, where `r` is the rank of the sheaf at that point. With `n = r` on
the locus of rank `r` this makes the determinant an invertible sheaf. Local freeness is Stacks
Project, Tag 01CK (6); the rank counts Mathlib's basis `Module.Basis.exteriorPower`, indexed by the
`n`-element subsets of a basis. -/
theorem exteriorPower_isFiniteLocallyFree_rank {X : Scheme.{u}}
    (E : FiniteLocallyFreeSheaf X) (n : ℕ) :
    ∃ h : Scheme.Modules.isFiniteLocallyFree X
        ((SheafOfModules.exteriorPower X.sheaf n).obj E.obj),
      ∀ x : X, FiniteLocallyFreeSheaf.rank
        (⟨(SheafOfModules.exteriorPower X.sheaf n).obj E.obj, h⟩ : FiniteLocallyFreeSheaf X) x =
          (FiniteLocallyFreeSheaf.rank E x).choose n := by
  sorry

/-- The determinant of a finite locally free sheaf `E` as an `𝒪_X`-module: the product over
`n : ℕ` of the exterior power `∧ⁿ E` restricted to the clopen rank locus `U_n` of `E` (as an open
subscheme, through `TopologicalSpace.Clopens.toOpens` and `Scheme.Opens.ι`) and pushed forward
to `X` again. Over an open `V` its sections are the tuples of sections of `∧ⁿ E` over `V ∩ U_n`,
so on `U_r` only the factor `n = r` has nonzero sections and the product is `∧ʳ E` there
(Hartshorne, *Algebraic Geometry*, II, Exercise 5.16). -/
noncomputable def determinantModule {X : Scheme.{u}} (E : FiniteLocallyFreeSheaf X) :
    X.Modules :=
  ∏ᶜ fun n : ULift.{u} ℕ =>
    (Scheme.Modules.pushforward (Scheme.Opens.ι (E.rankLocus n.down).toOpens)).obj
      ((Scheme.Modules.pullback (Scheme.Opens.ι (E.rankLocus n.down).toOpens)).obj
        ((SheafOfModules.exteriorPower X.sheaf n.down).obj E.obj))

/-- The determinant of a finite locally free sheaf is an invertible sheaf: on the rank locus
`U_r` it is `∧ʳ E`, locally free of rank `C(r, r) = 1` (Stacks Project, Tag 01CL for local
freeness of the exterior power; Tau Ceti's
`FiniteLocallyFreeSheaf.isInvertible_iff_forall_rank_eq_one` for rank one). -/
theorem isInvertible_determinantModule {X : Scheme.{u}} (E : FiniteLocallyFreeSheaf X) :
    SheafOfModules.isInvertible X (determinantModule E) := by
  sorry

/-- The determinant of a finite locally free sheaf as an object of `InvertibleSheaf X`. -/
noncomputable def determinantObj {X : Scheme.{u}} (E : FiniteLocallyFreeSheaf X) :
    InvertibleSheaf X :=
  ⟨determinantModule E, isInvertible_determinantModule E⟩

/-- On the rank locus `U_r` of `E` the determinant restricts to the exterior power `∧ʳ E`: the
factors of the product with `n ≠ r` have no nonzero sections over opens of `U_r`. -/
theorem determinantModule_restrict_rankLocus {X : Scheme.{u}} (E : FiniteLocallyFreeSheaf X)
    (r : ℕ) :
    Nonempty ((Scheme.Modules.pullback (Scheme.Opens.ι (E.rankLocus r).toOpens)).obj
        (determinantModule E) ≅
      (Scheme.Modules.pullback (Scheme.Opens.ι (E.rankLocus r).toOpens)).obj
        ((SheafOfModules.exteriorPower X.sheaf r).obj E.obj)) := by
  sorry

/-! ## Layer 5: the relative-Spec anti-equivalence -/

/-- Relative Spec is an anti-equivalence between quasi-coherent commutative `𝒪_X`-algebras and
schemes affine over `X`, with all `X`-morphisms between the latter (Stacks Project, Tag 01SA,
with the functor of Tag 01LQ). -/
theorem relativeSpec_isEquivalence (X : Scheme.{u}) : (relativeSpec X).IsEquivalence := by
  sorry

end TauCetiRoadmap.AlgebraicVectorBundles
