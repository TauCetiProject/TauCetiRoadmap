import Mathlib
import TauCeti.AlgebraicGeometry.AbelianVariety.Hom.Basic
import TauCeti.AlgebraicGeometry.Cohomology.Genus

/-!
# Heights, rational points and obstructions: headline target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. These statements suggest Lean forms for headline milestones; discharging them
finishes neither a layer nor the roadmap.

The statements are Mordell–Weil (§1.7), Mordell finiteness (§§4.6, 5.12, 6.4), Siegel
finiteness (§4.8), characteristic-zero Manin–Mumford (§5.6), and finite-rank Mordell–Lang
(§5.13), together with the genus-zero Hasse principle (§6.2). Number-field rational-point
coset finiteness (§5.9) follows from Mordell–Weil and finite-rank Mordell–Lang. Points and
abelian-variety embeddings use the native over-Hom and homomorphism carriers. Over an
algebraically closed field, a Zariski-closed support specifies its unique reduced closed
subscheme; the two closure statements use these supports.
Finite rank means finite rational dimension, without finite generation. Siegel uses native
S-integer subalgebras spanning the affine coordinate algebra and counts boundary points after
extension to the algebraic closure. The Hasse principle uses every native finite and infinite
completion. The native genus requires finite-dimensional H¹(𝒪).

The other headlines need objects absent from Mathlib `6b7abb3` and Tau Ceti `a91d3aa`.
The generalized Weil machine and general abelian canonical heights need generalized global
fields, polarized function-field heights and the line-bundle height machine; the native
canonical height is elliptic. Lang–Néron and the function-field height kernel need the K/k-trace.
The Brauer–Manin pairing, Harari's formal lemma, descent comparisons, genus-one sufficiency
and the statistical obstruction theorems need scheme Brauer evaluation, geometric adelic
spaces, torsors and their Selmer/Picard interfaces. Field Brauer groups and discrete-module
cohomology do not provide those objects. Parshin's implication needs the good-reduction and
Kodaira–Parshin cover interfaces; the function-field curve theorem needs constant-model,
isotriviality and geometric-normalization interfaces.

Positive-characteristic Manin–Mumford needs the geometric trace and finite-field constant
factors. The curve Vojta and Mumford inequalities need the Jacobian's theta-normalized general
abelian height pairing. Arithmetic Hilbert–Samuel, Nakai and minima need arithmetic cycle
classes, adelic metrized bundles and section lattices. Bogomolov and equidistribution need the
general abelian canonical heights and canonical curvature measures from that arithmetic
geometry. The remaining genus and conjectural interfaces need these same height, Brauer,
Picard and Sha objects. No substitute predicates for them are introduced here.
-/

noncomputable section
namespace TauCetiRoadmap.HeightsRationalPointsAndObstructions
universe u
open CategoryTheory _root_.AlgebraicGeometry
open scoped CategoryTheory.MonObj TensorProduct

/-- The native additive group of L-points of an abelian variety over K. -/
abbrev AbelianVariety.Points {K : Type u} [Field K]
    (A : TauCeti.AlgebraicGeometry.AbelianVariety K)
    (L : Type u) [Field L] [Algebra K L] : Type u :=
  Additive (Over.mk (Spec.map (CommRingCat.ofHom (algebraMap K L))) ⟶ A.toOver)

/-- Mordell–Weil (§1.7): the point group of every abelian variety over a number field
is finitely generated. -/
theorem AbelianVariety.fg_points {K : Type u} [Field K] [NumberField K]
    (A : TauCeti.AlgebraicGeometry.AbelianVariety K) :
    AddGroup.FG (AbelianVariety.Points A K) := by
  sorry

/-- Mordell finiteness (§§4.6, 5.12, 6.4): a smooth proper geometrically connected curve of genus
at least two over a number field has finitely many rational points. -/
theorem mordell_finite (K : Type u) [Field K] [NumberField K]
    (C : Scheme.{u}) [C.Over (Spec (.of K))]
    [Smooth (C ↘ Spec (.of K))] [IsProper (C ↘ Spec (.of K))]
    [GeometricallyConnected (C ↘ Spec (.of K))]
    [FiniteDimensional K (TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology
      (TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial C).obj 1)]
    (hdim : topologicalKrullDim C = 1) (hg : 2 ≤ C.genus K) :
    Finite (Over.mk (𝟙 (Spec (.of K))) ⟶ Over.mk (C ↘ Spec (.of K))) := by sorry

/-- Siegel (§4.8): every finite-type S-integer model of a smooth affine curve has finitely
many integral points if its completion has positive genus or at least three geometric
boundary points. Here `R` is the native ring of S-integers and `A₀` is the model algebra. -/
theorem siegel_finite (K : Type u) [Field K] [NumberField K]
    (S : Finset (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers K)))
    (A : Type u) [CommRing A] [Algebra K A] [Algebra.FiniteType K A]
    (C : Scheme.{u}) [C.Over (Spec (.of K))]
    [Smooth (C ↘ Spec (.of K))] [IsProper (C ↘ Spec (.of K))]
    [GeometricallyConnected (C ↘ Spec (.of K))]
    [FiniteDimensional K (TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology
      (TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial C).obj 1)]
    (hdim : topologicalKrullDim C = 1)
    (j : Over.mk (Spec.map (CommRingCat.ofHom (algebraMap K A))) ⟶
      Over.mk (C ↘ Spec (.of K))) [IsOpenImmersion j.left]
    (hhyper : 1 ≤ C.genus K ∨
      3 ≤ (Set.range (((Over.pullback (Spec.map (CommRingCat.ofHom
        (algebraMap K (AlgebraicClosure K))))).map j).left))ᶜ.ncard) :
    let R := (S : Set (IsDedekindDomain.HeightOneSpectrum
      (NumberField.RingOfIntegers K))).integer K
    ∀ (A₀ : Subalgebra R A) (_ : Algebra.FiniteType R A₀),
      Algebra.adjoin K (A₀ : Set A) = ⊤ → Finite (A₀ →ₐ[R] R) := by
  sorry

/-- Finite rational rank, allowing infinite torsion and division groups (§5.5). -/
def HasFiniteRank (G : Type u) [AddCommGroup G] : Prop :=
  FiniteDimensional ℚ (ℚ ⊗[ℤ] G)

namespace AbelianVariety

/-- The underlying scheme point of a native rational point. -/
def point {K : Type u} [Field K] {A : TauCeti.AlgebraicGeometry.AbelianVariety K}
    (P : Points A K) : A.toScheme :=
  P.toMul.left (IsLocalRing.closedPoint K)

/-- The reduced closed support of a translate of an abelian homomorphism's image (§5.1).
The closure is Zariski closure in the native scheme; the headline statements require the
homomorphism to be a closed immersion. -/
def cosetSupport {K : Type u} [Field K] [IsAlgClosed K]
    {A B : TauCeti.AlgebraicGeometry.AbelianVariety K}
    (i : B ⟶ A) (a : Points A K) : Set A.toScheme :=
  closure (Set.range fun P : Points B K =>
    point (a + Additive.ofMul (P.toMul ≫
      TauCeti.AlgebraicGeometry.AbelianVariety.Hom.toOverHom i)))

end AbelianVariety

open AbelianVariety

/-- Manin–Mumford (§5.6): the reduced torsion closure in any closed subvariety is a finite
union of torsion translates of abelian subvarieties, in characteristic zero. -/
theorem torsionClosure_isTorsionSubvariety (K : Type u) [Field K] [IsAlgClosed K] [CharZero K]
    (A : TauCeti.AlgebraicGeometry.AbelianVariety K)
    (X : TopologicalSpace.Closeds A.toScheme) :
    ∃ (n : ℕ) (B : Fin n → TauCeti.AlgebraicGeometry.AbelianVariety K)
      (i : ∀ j, B j ⟶ A) (a : Fin n → Points A K),
      (∀ j, IsClosedImmersion
        (TauCeti.AlgebraicGeometry.AbelianVariety.Hom.toSchemeHom (i j))) ∧
      (∀ j, IsOfFinAddOrder (a j)) ∧
      closure (point '' {P : Points A K | point P ∈ X ∧ IsOfFinAddOrder P}) =
        ⋃ j, cosetSupport (i j) (a j) := by
  sorry

/-- Finite-rank Mordell–Lang (§5.13): the reduced closure of the intersection with a
finite-rank subgroup is a finite union of abelian cosets centred in that subgroup. -/
theorem finiteRank_mordellLang (K : Type u) [Field K] [IsAlgClosed K] [CharZero K]
    (A : TauCeti.AlgebraicGeometry.AbelianVariety K)
    (Γ : AddSubgroup (Points A K)) (hΓ : HasFiniteRank Γ)
    (X : TopologicalSpace.Closeds A.toScheme) :
    ∃ (n : ℕ) (B : Fin n → TauCeti.AlgebraicGeometry.AbelianVariety K)
      (i : ∀ j, B j ⟶ A) (a : Fin n → Γ),
      (∀ j, IsClosedImmersion
        (TauCeti.AlgebraicGeometry.AbelianVariety.Hom.toSchemeHom (i j))) ∧
      closure (point '' {P : Points A K | point P ∈ X ∧ P ∈ Γ}) =
        ⋃ j, cosetSupport (i j) (a j) := by
  sorry

/-- The Hasse principle for genus-zero curves (§6.2): points over every finite and infinite
completion imply a rational point, over any number field. -/
theorem genusZero_hassePrinciple (K : Type u) [Field K] [NumberField K]
    (C : Scheme.{u}) [C.Over (Spec (.of K))]
    [Smooth (C ↘ Spec (.of K))] [IsProper (C ↘ Spec (.of K))]
    [GeometricallyConnected (C ↘ Spec (.of K))]
    [FiniteDimensional K (TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology
      (TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial C).obj 1)]
    (hdim : topologicalKrullDim C = 1) (hg : C.genus K = 0)
    (hfinite : ∀ v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers K),
      Nonempty (Over.mk (Spec.map (CommRingCat.ofHom
        (algebraMap K (v.adicCompletion K)))) ⟶ Over.mk (C ↘ Spec (.of K))))
    (hinfinite : ∀ v : NumberField.InfinitePlace K,
      Nonempty (Over.mk (Spec.map (CommRingCat.ofHom
        (algebraMap K v.Completion))) ⟶ Over.mk (C ↘ Spec (.of K)))) :
    Nonempty (Over.mk (𝟙 (Spec (.of K))) ⟶ Over.mk (C ↘ Spec (.of K))) := by
  sorry

end TauCetiRoadmap.HeightsRationalPointsAndObstructions
