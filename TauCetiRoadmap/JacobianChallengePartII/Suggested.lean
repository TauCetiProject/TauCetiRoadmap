import Mathlib
import TauCeti.AlgebraicGeometry.AbelianVariety.Albanese
import TauCeti.AlgebraicGeometry.LineBundle.Functoriality

/-!
# Relative Jacobians: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
This file states the roadmap's headline theorems against the pinned APIs; the README carries
the full specification, APIs and Checks.

The pointed square Picard comparison of §4.9 is stated over an arbitrary field, using Tau Ceti's
`AbelianVariety.IsAlbanese` to characterize the pointed Jacobian and `LineBundleClass` for actual
line-bundle classes. The two axis conditions of §4.8 have a real definition on the native scheme
fibre product. The theorem asserts unique extension of every axis-normalized class from the curve
square to the Jacobian square.

Finite-stage descent of invertible sheaves, their morphisms and finite families of equalities
(§0.0) is stated on qcqs scheme limits with affine transitions. The triangular isomorphism of
actual group-scheme fibre powers (§5.5), including arbitrary base change, uses native products
in `Over S`.

The following headline statements require geometric objects absent from the pinned libraries:
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
* Layer 5 outside §5.5: the geometric canonical Abel morphism and section-free difference, and multiplication
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

/-! ## Layer 0: Relative Picard degree components and torsors -/

/-- Every invertible sheaf on a cofiltered limit of qcqs schemes with affine transitions
comes from a finite stage (README §0.0; Stacks 01ZR and 0B8W). -/
theorem invertibleSheafDescends {I : Type u} [SmallCategory I] [IsCofiltered I]
    (F : I ⥤ Scheme.{u}) (c : Cone F) (hc : IsLimit c)
    (hqc : ∀ i, CompactSpace (F.obj i))
    (hqs : ∀ i, QuasiSeparatedSpace (F.obj i))
    (haff : ∀ (i j : I) (f : i ⟶ j), IsAffineHom (F.map f))
    (L : InvertibleSheaf c.pt) :
    ∃ (i : I) (M : InvertibleSheaf (F.obj i)),
      Nonempty ((InvertibleSheaf.pullback (c.π.app i)).obj M ≅ L) := by
  sorry

/-- A morphism of line bundles pulled back from one stage descends after refinement.
The equality uses the canonical composite-pullback comparisons (README §0.0; Stacks 01ZR). -/
theorem invertibleSheafHomDescends {I : Type u} [SmallCategory I] [IsCofiltered I]
    (F : I ⥤ Scheme.{u}) (c : Cone F) (hc : IsLimit c)
    (hqc : ∀ i, CompactSpace (F.obj i))
    (hqs : ∀ i, QuasiSeparatedSpace (F.obj i))
    (haff : ∀ (i j : I) (f : i ⟶ j), IsAffineHom (F.map f))
    (i : I) (M N : InvertibleSheaf (F.obj i))
    (a : (InvertibleSheaf.pullback (c.π.app i)).obj M ⟶
      (InvertibleSheaf.pullback (c.π.app i)).obj N) :
    ∃ (j : I) (f : j ⟶ i)
      (b : (InvertibleSheaf.pullback (F.map f)).obj M ⟶
        (InvertibleSheaf.pullback (F.map f)).obj N),
      let e := fun L : InvertibleSheaf (F.obj i) =>
        (InvertibleSheaf.pullbackComp (c.π.app j) (F.map f)).app L ≪≫
          eqToIso (congrArg (fun g => (InvertibleSheaf.pullback g).obj L) (c.w f))
      (e M).inv ≫ (InvertibleSheaf.pullback (c.π.app j)).map b ≫ (e N).hom = a := by
  sorry

/-- A finite family of equalities of line-bundle morphisms valid at the limit holds at
one common refinement, including the empty family (README §0.0; Stacks 01ZR). -/
theorem invertibleSheafEqualitiesDescend {I : Type u} [SmallCategory I] [IsCofiltered I]
    (F : I ⥤ Scheme.{u}) (c : Cone F) (hc : IsLimit c)
    (hqc : ∀ i, CompactSpace (F.obj i))
    (hqs : ∀ i, QuasiSeparatedSpace (F.obj i))
    (haff : ∀ (i j : I) (f : i ⟶ j), IsAffineHom (F.map f))
    (i : I) (r : ℕ) (M N : Fin r → InvertibleSheaf (F.obj i))
    (a b : ∀ k, M k ⟶ N k)
    (hab : ∀ k, (InvertibleSheaf.pullback (c.π.app i)).map (a k) =
      (InvertibleSheaf.pullback (c.π.app i)).map (b k)) :
    ∃ (j : I) (f : j ⟶ i), ∀ k,
      (InvertibleSheaf.pullback (F.map f)).map (a k) =
        (InvertibleSheaf.pullback (F.map f)).map (b k) := by
  sorry

/-! ## Layer 4: Actual Picard groups and autoduality pullbacks -/

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

/-! ## Layer 5: Fibre powers and shifted Faltings–Zhang maps -/

/-- The triangular morphism on a group scheme's fibre power keeps coordinate zero and
right-divides every other coordinate by it (README §5.5). -/
def triangularForward {S : Scheme.{u}} (A : Over S) [GrpObj A] (n : ℕ) :
    (∏ᶜ fun _ : Fin (n + 1) => A) ⟶ (∏ᶜ fun _ : Fin (n + 1) => A) :=
  Pi.lift fun i : Fin (n + 1) =>
    if i = 0 then Pi.π (fun _ : Fin (n + 1) => A) 0
    else Pi.π (fun _ : Fin (n + 1) => A) i / Pi.π (fun _ : Fin (n + 1) => A) 0

/-- The inverse triangular morphism keeps coordinate zero and right-multiplies every
other coordinate by it; no commutativity is assumed (README §5.5). -/
def triangularInverse {S : Scheme.{u}} (A : Over S) [GrpObj A] (n : ℕ) :
    (∏ᶜ fun _ : Fin (n + 1) => A) ⟶ (∏ᶜ fun _ : Fin (n + 1) => A) :=
  Pi.lift fun i : Fin (n + 1) =>
    if i = 0 then Pi.π (fun _ : Fin (n + 1) => A) 0
    else Pi.π (fun _ : Fin (n + 1) => A) i * Pi.π (fun _ : Fin (n + 1) => A) 0

/-- The triangular maps are the forward and inverse morphisms of an actual isomorphism
of fibre powers over the base scheme (README §5.5; Yuan, Theorem 4.17(5), p. 98). -/
theorem triangularIsomorphism {S : Scheme.{u}} (A : Over S) [GrpObj A] (n : ℕ) :
    ∃ R : (∏ᶜ fun _ : Fin (n + 1) => A) ≅ (∏ᶜ fun _ : Fin (n + 1) => A),
      R.hom = triangularForward A n ∧ R.inv = triangularInverse A n := by
  sorry

/-- Both directions of the triangular isomorphism commute with arbitrary base extension
through the canonical product comparison, using the pulled-back group law (README §5.5). -/
theorem triangularBaseChange {S S' : Scheme.{u}} (f : S' ⟶ S)
    (A : Over S) [GrpObj A] (n : ℕ) :
    let F := Over.pullback f
    letI : F.Monoidal := Functor.Monoidal.ofChosenFiniteProducts F
    letI : GrpObj (F.obj A) := Functor.grpObjObj
    let C := PreservesProduct.iso F (fun _ : Fin (n + 1) => A)
    (F.map (triangularForward A n) ≫ C.hom =
      C.hom ≫ triangularForward (F.obj A) n) ∧
    (F.map (triangularInverse A n) ≫ C.hom =
      C.hom ≫ triangularInverse (F.obj A) n) := by
  sorry

end RelativeJacobian

end

end TauCetiRoadmap.JacobianChallengePartII
