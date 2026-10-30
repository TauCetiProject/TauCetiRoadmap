import Mathlib
import TauCeti.AlgebraicGeometry.VectorBundle.Rank
import TauCeti.AlgebraicGeometry.VectorBundle.Dual.Basic
import TauCeti.AlgebraicGeometry.RelativeSpec.Functor
import TauCeti.Algebra.Category.ModuleCat.Sheaf.SymmetricPower
import TauCeti.Algebra.Category.ModuleCat.Sheaf.ExteriorPower

/-!
# Algebraic vector bundles: target signatures

`README.md` is the roadmap; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, on the native carriers:
Tau Ceti's `QuasicoherentSheaf`, `FiniteLocallyFreeSheaf` with its bundled rank,
`SheafOfModules.symmetricPower` and `SheafOfModules.exteriorPower`, `QuasicoherentAlgebra`,
`AffineSchemeOver` and `relativeSpec`, with the canonical symmetric monoidal structure
`Scheme.Modules.instMonoidalCategory` on `X.Modules`.

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

open CategoryTheory TauCeti.AlgebraicGeometry AlgebraicGeometry

universe u

/-! ## Layer 2: quasi-coherent and finite locally free sheaves -/

/-- A quasi-coherent sheaf is finite locally free exactly when it has a dual in the symmetric
monoidal category of quasi-coherent sheaves. A dual there is a dual in `X.Modules`, which by
Stacks Project, Tag 0FNU, makes the sheaf finitely presented and flat, hence finite locally free
on affine opens by Tag 00NX; the converse direction is Tau Ceti's
`QuasicoherentSheaf.nonempty_hasLeftDual_of_isFiniteLocallyFree`. -/
theorem isFiniteLocallyFree_iff_nonempty_hasLeftDual {X : Scheme.{u}}
    (E : QuasicoherentSheaf X) :
    Scheme.Modules.isFiniteLocallyFree X E.obj ↔ Nonempty (HasLeftDual E) := by
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

/-! ## Layer 5: the relative-Spec anti-equivalence -/

/-- Relative Spec is an anti-equivalence between quasi-coherent commutative `𝒪_X`-algebras and
schemes affine over `X`, with all `X`-morphisms between the latter (Stacks Project, Tag 01SA,
with the functor of Tag 01LQ). -/
theorem relativeSpec_isEquivalence (X : Scheme.{u}) : (relativeSpec X).IsEquivalence := by
  sorry

end TauCetiRoadmap.AlgebraicVectorBundles
