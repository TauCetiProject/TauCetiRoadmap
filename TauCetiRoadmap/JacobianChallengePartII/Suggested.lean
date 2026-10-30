import Mathlib
import TauCeti.AlgebraicGeometry.AbelianVariety.Albanese
import TauCeti.AlgebraicGeometry.LineBundle.Functoriality

/-!
# Relative Jacobians: headline target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
These are suggested Lean forms for particular milestones; discharging them finishes neither a
layer nor the roadmap.

The pointed square Picard comparison of §4.9 is stated over an arbitrary field, using Tau Ceti's
`AbelianVariety.IsAlbanese` to characterize the pointed Jacobian and `LineBundleClass` for actual
line-bundle classes. The two axis conditions of §4.8 have a real definition on the native scheme
fibre product. The theorem asserts unique extension of every axis-normalized class from the curve
square to the Jacobian square.

The other headline statements require geometric objects absent from the pinned libraries:
* Layers 0–1: the relative Picard sheaf, its degree components and representing scheme, abelian
  schemes and their duals, and polarizations. These are needed for Picard representability, the
  relative Jacobian and its canonical principal polarization. The curve determinant also needs
  relative derived pushforward and perfect cohomology complexes.
* Layers 2–3: the relative Picard torsors and Abel morphisms, the theta divisor for an arbitrary
  degree-one divisor, the dual Jacobian and its universal Poincaré bundle. These are needed for the
  Abel immersion and finiteness theorems, the theta pullbacks, the curve-square and diagonal
  identities, and relative ampleness of canonical twice-theta.
* Layer 4 outside §4.9: intrinsic algebraic equivalence of line bundles and the relative Picard
  identity components. These are needed to state relative autoduality and the actual and bi-zero
  Picard pullback torsion-cokernel theorems in their family generality.
* Layer 5: the geometric canonical Abel morphism and section-free difference, and multiplication
  isogenies on abelian schemes. The shifted-power factorization with its finite locally free tail
  isogeny uses these objects; arbitrary group-law coordinate identities do not express that result.
* Layers 6–7: the semi-abelian relative Picard scheme of a stable family, relative dualizing sheaves
  and coherent higher pushforward, and full symplectic level structures. These are needed for the
  curve–Jacobian Hodge bundle and determinant comparisons and the level-family statements.
-/

namespace TauCetiRoadmap.JacobianChallengePartII

open CategoryTheory CategoryTheory.Limits AlgebraicGeometry
open TauCeti.AlgebraicGeometry
open scoped CategoryTheory.MonObj

noncomputable section

open CategoryTheory.MonoidalCategory CategoryTheory.CartesianMonoidalCategory

namespace RelativeJacobian

universe u

/-- The underlying set of actual line-bundle classes on a pointed square whose two axis
restrictions are trivial. Membership specifies no choice of trivializations (README §4.8). -/
def AxisNormalizedPicard {S : Scheme.{u}} {Y : Over S}
    (y₀ : 𝟙_ (Over S) ⟶ Y) : Set (LineBundleClass (Y ⨯ Y).left) :=
  {L | LineBundleClass.pullback (prod.lift (𝟙 Y) (toUnit Y ≫ y₀)).left L = 1 ∧
    LineBundleClass.pullback (prod.lift (toUnit Y ≫ y₀) (𝟙 Y)).left L = 1}

/-- Pullback along the square of the pointed Abel morphism is a bijection on actual
axis-normalized Picard classes (README §4.9; Yuan, §A.3, p. 108).

The native Albanese property identifies `J` with the curve's Jacobian. Its positive dimension
expresses positive genus. A smooth proper curve over a field is projective. -/
theorem pointedSquarePicardIsomorphism {K : Type u} [Field K]
    {C : Over (Spec (.of K))} [IsProper C.hom]
    [SmoothOfRelativeDimension 1 C.hom] [GeometricallyConnected C.hom]
    (x₀ : 𝟙_ (Over (Spec (.of K))) ⟶ C)
    (J : AbelianVariety K) (i : C ⟶ J.toOver)
    (hAlbanese : AbelianVariety.IsAlbanese x₀ i) (hgenus : 0 < J.dim)
    (L : LineBundleClass (C ⨯ C).left) (hL : L ∈ AxisNormalizedPicard x₀) :
    ∃! M : LineBundleClass (J.toOver ⨯ J.toOver).left,
      M ∈ AxisNormalizedPicard (η[J.toOver]) ∧
        LineBundleClass.pullback (prod.map i i).left M = L := by
  sorry

end RelativeJacobian

end

end TauCetiRoadmap.JacobianChallengePartII
