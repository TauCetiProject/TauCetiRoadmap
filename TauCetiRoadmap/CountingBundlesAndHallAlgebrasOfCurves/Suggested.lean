import Mathlib
import TauCeti.AlgebraicGeometry.VectorBundle.FixedRank
import TauCeti.AlgebraicGeometry.Cohomology.EulerCharacteristic
import TauCeti.AlgebraicGeometry.LineBundle.Basic

/-!
# Counting bundles and Hall algebras of curves: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs: the finite-field nilpotent matrix
count and degree independence of the absolute
indecomposable bundle count. It uses
native fixed-rank sheaves, coherent Euler characteristics and indecomposability.

The other headlines are not statable at the pins:
* The nilpotent-pair exponential identity and Jordan fibre masses lack the coherent
  rank-degree and Harder–Narasimhan groupoids of an actual curve.
* Green's bialgebra theorem and spherical HN membership lack the curve Hall algebra
  and its support completion.
* The generic spherical form and universal counting theorem lack that Hall carrier
  and reciprocal-invariant specialization.
* Schiffmann's partition generating and residue formulas lack the compatible complete
  Adams-series calculus, ordered residue kernels and universal counts.
* The origin constant formula lacks the universal count and its regular extension to
  the paired affine cone.
* Stable canonical Higgs geometry and its Bialynicki-Birula strata lack the coarse
  Higgs scheme and the affine-bundle strata of a torus action.
* The all-characteristic coprime Higgs count lacks canonical stable coarse moduli;
  its absolute bundle-count side is defined below.
* Higgs purity and the compact Poincare formula lack the actual Higgs carrier and its
  Frobenius compact cohomology and complex comparison.
* The nilpotent-cone reciprocal trace and component formula lack the stable reduced Hitchin
  zero fibre, its cohomology and the universal count.
* Mellit's Laurent integrality lacks the plethystic logarithm on its rational
  coefficient series. The scalar degree-independence consequence is stated below;
  its universal coefficient-ring identification lacks curve specialization.
* Positivity in every degree lacks the universal bundle-count invariant.
* Parabolic and slope-cut universality lack their curve-count carriers and specialization.
* The constructible spherical Hall Hopf and primitive Lie algebra theorem lacks
  constructible Euler pushforward on coherent moduli correspondences and the Hall carrier.

Layer 11 also formulates four conjectures; it does not assert their proofs.
-/

namespace TauCetiRoadmap.CountingBundlesAndHallAlgebrasOfCurves

open CategoryTheory CategoryTheory.Limits AlgebraicGeometry TauCeti.AlgebraicGeometry

universe u

/-! ## Layer 0: universal coefficients, absolute counts and residues -/

/-- The fixed-rank specialization of the Riemann--Roch degree:
`chi(E) - r * chi(O_X)`, with both Euler characteristics truncated above degree one.
It is the usual bundle degree on a smooth proper geometrically connected curve. -/
noncomputable def bundleDegree (k : Type u) [Field k] (X : Scheme.{u})
    [X.Over (Spec (.of k))] {r : ℕ} (E : FiniteLocallyFreeSheaf.FixedRank X r) : ℤ :=
  Scheme.Modules.eulerCharBelow k X E.obj.obj 2 -
    (r : ℤ) * Scheme.Modules.eulerCharBelow k X (InvertibleSheaf.trivial X).obj 2

/-- A bundle is absolutely indecomposable if its pullback to the algebraic closure
is nonzero and cannot be split as a biproduct of two nonzero sheaves. -/
def IsAbsolutelyIndecomposable (k : Type u) [Field k] (X : Scheme.{u})
    [X.Over (Spec (.of k))] {r : ℕ} (E : FiniteLocallyFreeSheaf.FixedRank X r) : Prop :=
  Indecomposable
    ((FiniteLocallyFreeSheaf.FixedRank.pullback
      (pullback.fst (X ↘ Spec (.of k))
        (Spec.map (CommRingCat.ofHom (algebraMap k (AlgebraicClosure k)))))).obj E).obj.obj

/-- The number of isomorphism classes of absolutely indecomposable rank-r,
degree-d bundles. On the finite-field curves of the headline this skeleton is finite. -/
noncomputable def absIndecCount (k : Type u) [Field k] (X : Scheme.{u})
    [X.Over (Spec (.of k))] (r : ℕ) (d : ℤ) : ℕ :=
  Nat.card (Skeleton (ObjectProperty.FullSubcategory
    (fun E : FiniteLocallyFreeSheaf.FixedRank X r =>
      bundleDegree k X E = d ∧ IsAbsolutelyIndecomposable k X E)))

/-! ## Layer 1: coherent decomposition and finite-field enumeration -/

/-- Over every finite field K, the number of nilpotent n-by-n matrices is
`(Nat.card K) ^ (n * (n - 1))`, including the unique empty matrix at n = 0
(Schiffmann, Corollary 2.5, p. 309; Fine--Herstein, Theorem 1, p. 499). -/
theorem nilpotent_matrix_count (K : Type u) [Field K] [Finite K] (n : ℕ) :
    Nat.card { A : Matrix (Fin n) (Fin n) K // IsNilpotent A } =
      (Nat.card K) ^ (n * (n - 1)) := by
  sorry

/-! ## Layer 10: Mellit integrality and degree independence -/

/-- Over every finite field, the number of absolutely indecomposable bundles of
fixed rank on a smooth proper geometrically connected curve is independent of degree
(Mellit, Theorem 1.1, pp. 302--303). Rank zero has no indecomposable bundles. -/
theorem absIndecCount_eq_of_degree (k : Type u) [Field k] (X : Scheme.{u})
    [X.Over (Spec (.of k))] [Finite k] [IsProper (X ↘ Spec (.of k))]
    [SmoothOfRelativeDimension 1 (X ↘ Spec (.of k))]
    [GeometricallyConnected (X ↘ Spec (.of k))] (r : ℕ) (d d' : ℤ) :
    absIndecCount k X r d = absIndecCount k X r d' := by
  sorry

end TauCetiRoadmap.CountingBundlesAndHallAlgebrasOfCurves
