import Mathlib
import TauCeti.Geometry.Manifold.Morse.Basic
import TauCeti.Geometry.Manifold.Morse.Index
import TauCeti.Geometry.Manifold.VectorBundle.Riemannian.Riesz

/-!
# Morse theory: target signatures

The roadmap is README.md; this file is not the roadmap. It states, against the pinned Mathlib
and Tau Ceti, the roadmap's headline theorems that the pinned Tau Ceti does not already prove:
the CW model of a proper bounded-below Morse function, with one cell per critical point in its
index dimension; the strong Morse inequalities as a polynomial identity with a correction
polynomial of natural coefficients; the recognition of the sphere from a smooth function with
exactly two critical points of arbitrary degeneracy, together with its two inputs (the
two-Euclidean-open cover and the two-open-cell recognition of the sphere, whose Schoenflies
input, Brown's theorem for a bicollared sphere, is GeometricTopology §2.2's and is not restated
here); and the convergence, with exponential decay of the Riemannian distance, of an arbitrary
forward negative-gradient curve of a Morse function trapped in a compact set. The critical set
appears as the zero set `{x | mvfderiv I f x = 0}` of the manifold derivative, which is the
defining body of `TauCeti.criticalPoints I f`.

The other headline theorems of README.md are proved at the pinned Tau Ceti and are consumed,
not restated: compact finiteness of critical sets (`TauCeti.IsMorse.finite_criticalPoints_inter`),
the normalized Morse chart
(`TauCeti.IsManifoldNondegenerateCriticalPoint.exists_normalized_morseChart`), the regular-level
embedding (`TauCeti.exists_regularFiber_smoothEmbedding`), the deformation across a critical-free
band (`TauCeti.exists_sublevelDeformation`), Milnor's cell attachment in CW form across a critical
level (`TauCeti.IsMorse.exists_relCWComplex_sublevel_deformation`), Morse density in the strong
Whitney topology `ContMDiffMap.manifoldStrongWhitneyTopology`
(`TauCeti.dense_setOf_isMorse_manifoldStrongWhitney`) and the existence of a proper Morse
function bounded below (`TauCeti.exists_isMorse_isProperMap_bddBelow`), the weak Morse
inequalities, the strong Morse inequalities in alternating form and Euler's equality on a compact
manifold (`TauCeti.IsMorse.finrank_singularHomology_le`,
`TauCeti.IsMorse.sum_range_neg_one_pow_mul_finrank_singularHomology_le`,
`TauCeti.IsMorse.sum_range_neg_one_pow_mul_finrank_singularHomology_eq`), the ambient
deformations across critical-free bands and degenerate critical levels
(`TauCeti.exists_ambientSublevelDeformation`, `TauCeti.exists_criticalLevelDeformation`), the
Lusternik–Schnirelmann bound for an arbitrary smooth function on a compact manifold
(`TauCeti.lsCategoryCount_univ_le_totalCriticalCount`), Reeb's theorem that a compact manifold
carrying a Morse function with exactly two critical points is homeomorphic to a sphere
(`TauCeti.IsMorse.nonempty_homeomorph_sphere_of_totalCriticalCount_eq_two`), and the
convergence of a maximal negative-gradient trajectory trapped in a compact set with finitely many
critical points, with exponential decay of the Riemannian distance to a nondegenerate limit
(`TauCeti.exists_tendsto_maximalIntegralCurve_neg_mgradient`,
`TauCeti.exists_riemannianEDist_le_mul_exp_maximalIntegralCurve_neg_mgradient`).

Not stated: the handle-attachment homeomorphism across a critical level and the comparison of
handle attachments for different Morse charts with coherent dependence on a compact parameter
space (README §2.2–§2.3), whose statements quantify over chart-dependent attaching maps of the
handles `D^λ × D^(m−λ)` and over families of adjunction spaces over the parameter space, a long
encoding that the pins supply no carrier for. Not statable at the pins, and therefore not stated:
the Morse–Bott negative-disc-bundle attachment, its relative Thom comparison and its spectral
sequence (README Layer 5), which lack a Morse–Bott predicate with its critical normal bundle and
the filtered attachment complex.
-/

universe u

noncomputable section

namespace TauCetiRoadmap.MorseTheory
open scoped Manifold ContDiff Bundle
open Set

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [hfd : FiniteDimensional ℝ E] [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H} [hbd : I.Boundaryless]
  [TopologicalSpace M] [ht2 : T2Space M] [ChartedSpace H M] [hsm : IsManifold I ∞ M]
  [hsc : SecondCountableTopology M]

include hfd hbd ht2 hsm hsc

/-! ## Layer 2: compact-band deformation, handles and cells -/

/-- **The Morse CW model** (Milnor, *Morse Theory*, Theorem 3.5, p. 20): a manifold carrying a
proper Morse function bounded below is homotopy equivalent to a Hausdorff CW complex whose
`j`-cells correspond bijectively to the critical points of Morse index `j` (README §2.4). -/
theorem exists_morseCWModel (f : M → ℝ) (hf : TauCeti.IsMorse I f)
    (hp : IsProperMap f) (hb : BddBelow (Set.range f)) :
    ∃ (X : Type _) (t : TopologicalSpace X),
      ∃ (_ : T2Space X) (cw : Topology.CWComplex (Set.univ : Set X)),
        Nonempty (ContinuousMap.HomotopyEquiv M X) ∧
        ∀ j : ℕ, Nonempty
          (Topology.RelCWComplex.cell (Set.univ : Set X) j ≃
            {x : M // mvfderiv I f x = 0 ∧ TauCeti.manifoldMorseIndex I f x = j}) := by
  sorry

/-! ## Layer 4: strong inequalities and topology tests -/

/-- The `j`-th Betti number of `X` with coefficients in the field `k`: the dimension over `k` of
the `j`-th singular homology of `X` with coefficients in `k`, computed by Mathlib's singular
homology functor. -/
noncomputable def bettiNumber (k : Type u) [Field k] (X : Type u)
    [TopologicalSpace X] (j : ℕ) : ℕ :=
  Module.finrank k
    (((AlgebraicTopology.singularHomologyFunctor.{u} (ModuleCat.{u} k) j).obj
      (ModuleCat.of k k)).obj (TopCat.of X))

/-- **The strong Morse inequalities** as a polynomial identity (Cohen–Iga–Norbury, Corollary 5.11,
p. 42): for a Morse function on a compact manifold of dimension `m` and a field `k`, with `c_j`
the number of critical points of index `j` and `b_j` the `j`-th Betti number over `k`, there is a
polynomial `Q` with natural coefficients such that `Σ_(j ≤ m) c_j t^j = Σ_(j ≤ m) b_j t^j + (1 + t) Q`
(README §4.1). -/
theorem strong_morse_inequalities [CompactSpace M] (k : Type _) [Field k]
    (f : M → ℝ) (hf : TauCeti.IsMorse I f) :
    ∃ Q : Polynomial ℕ,
      (∑ j ∈ Finset.range (Module.finrank ℝ E + 1),
        Polynomial.monomial j
          {x : M | mvfderiv I f x = 0 ∧ TauCeti.manifoldMorseIndex I f x = j}.ncard) =
      (∑ j ∈ Finset.range (Module.finrank ℝ E + 1),
        Polynomial.monomial j (bettiNumber k M j)) +
      (1 + Polynomial.X) * Q := by
  sorry

/-- A compact manifold of dimension `m` carrying a smooth function with exactly two critical
points, of arbitrary degeneracy, is the union of two open sets each homeomorphic to `ℝ^m`: a
chart ball at the maximum, and the preimage of a chart ball at the minimum under the negative
gradient flow at a large time (README §4.4). -/
theorem exists_twoEuclideanOpenCover_of_two_criticalPoints [CompactSpace M]
    (f : M → ℝ) (hf : ContMDiff I 𝓘(ℝ) ∞ f)
    (hcrit : {x : M | mvfderiv I f x = 0}.encard = 2) :
    ∃ U V : TopologicalSpace.Opens M,
      (∀ x : M, x ∈ U ∨ x ∈ V) ∧
      Nonempty ({x : M // x ∈ U} ≃ₜ (Fin (Module.finrank ℝ E) → ℝ)) ∧
      Nonempty ({x : M // x ∈ V} ≃ₜ (Fin (Module.finrank ℝ E) → ℝ)) := by
  sorry

omit hfd hbd ht2 hsm hsc in
/-- The two-open-cell recognition of the sphere: a compact Hausdorff space covered by two open
sets, each homeomorphic to `ℝ^m` with `m > 0`, is homeomorphic to `S^m`. The proof bicollars a
coordinate sphere in the overlap by an open radial annulus and applies Brown's generalized
Schoenflies theorem, consumed from GeometricTopology §2.2 (README §4.4; compare Milnor 1959,
Corollary 1, p. 442, for covers by two open sets diffeomorphic to `ℝ^m`). -/
theorem nonempty_homeomorph_sphere_of_two_euclidean_opens
    {X : Type*} [TopologicalSpace X] [T2Space X] [CompactSpace X]
    (m : ℕ) (hm : 0 < m) (U V : TopologicalSpace.Opens X)
    (hcover : ∀ x : X, x ∈ U ∨ x ∈ V)
    (hU : Nonempty ({x : X // x ∈ U} ≃ₜ (Fin m → ℝ)))
    (hV : Nonempty ({x : X // x ∈ V} ≃ₜ (Fin m → ℝ))) :
    Nonempty (X ≃ₜ Metric.sphere (0 : EuclideanSpace ℝ (Fin (m + 1))) 1) := by
  sorry

/-- A compact manifold of dimension `m` carrying a smooth function with exactly two critical
points is homeomorphic to `S^m`, with no nondegeneracy, connectedness or dimension
hypothesis: for `m > 0` compose the two-Euclidean-open cover with the two-open-cell
recognition (compare Milnor 1959, Theorem 1(3), p. 440, and Corollary 1, p. 442), and for
`m = 0` the manifold has exactly two points and is `S^0` (README §4.4). -/
theorem nonempty_homeomorph_sphere_of_two_criticalPoints [CompactSpace M]
    (f : M → ℝ) (hf : ContMDiff I 𝓘(ℝ) ∞ f)
    (hcrit : {x : M | mvfderiv I f x = 0}.encard = 2) :
    Nonempty (M ≃ₜ Metric.sphere
      (0 : EuclideanSpace ℝ (Fin (Module.finrank ℝ E + 1))) 1) := by
  sorry

/-! ## Layer 6: gradient convergence and exponential decay -/

/-- A forward curve of the negative gradient of a Morse function for a smooth Riemannian metric,
given on `[0, ∞)` and trapped in a compact set `K`, converges to a critical point `p ∈ K`, and its
Riemannian distance to `p` decays exponentially. The gradient is the fibrewise Riesz dual of the
manifold derivative (README §6.1; Cohen–Iga–Norbury, Theorem 4.6, pp. 27–29, for compact
manifolds). -/
theorem exists_compactTrapped_gradient_limit
    [Bundle.RiemannianBundle (fun x : M ↦ TangentSpace I x)]
    [IsContMDiffRiemannianBundle I ∞ E (fun x : M ↦ TangentSpace I x)]
    (f : M → ℝ) (hf : TauCeti.IsMorse I f) (γ : ℝ → M)
    (hγ : IsMIntegralCurveOn γ
      (fun x ↦ -Riemannian.Tensor.rieszDual (I := I) x (mvfderiv I f x))
      (Set.Ici 0))
    (K : Set M) (hK : IsCompact K) (htrap : Set.MapsTo γ (Set.Ici 0) K) :
    ∃ p ∈ K, mvfderiv I f p = 0 ∧ Filter.Tendsto γ Filter.atTop (nhds p) ∧
      ∃ C c T : ℝ, 0 < C ∧ 0 < c ∧ 0 ≤ T ∧
        ∀ t : ℝ, T ≤ t →
          Manifold.riemannianEDist I (γ t) p ≤ ENNReal.ofReal (C * Real.exp (-c * t)) := by
  sorry

end TauCetiRoadmap.MorseTheory
