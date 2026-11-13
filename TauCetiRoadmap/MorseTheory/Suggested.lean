module

public import Mathlib
public import TauCeti.Geometry.Manifold.Morse.Basic
public import TauCeti.Geometry.Manifold.Morse.Index
public import TauCeti.Geometry.Manifold.Morse.CriticalPoints
public import TauCeti.Geometry.Manifold.Riemannian.Gradient.Basic

/-!
# Morse functions, sublevel topology and Morse–Bott attachments: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against the pinned Mathlib
and Tau Ceti, the roadmap's headline theorems that the pinned Tau Ceti does not already prove,
each admitted with `sorry`: the homeomorphism of the sublevel above a critical level with the
sublevel below it with one handle `D^λ × D^(m−λ)` attached along the boundary level for each
critical point on the level, as a `TopCat` pushout, and the CW model of a proper bounded-below
Morse function, whose `j`-cells are in bijection with the critical points of index `j`
(Layer 2); the strong Morse inequalities as a polynomial identity with a correction polynomial
of natural coefficients, stated coefficientwise (Layer 4); the recognition of the sphere from a
smooth function with exactly two critical points of arbitrary degeneracy, with its two inputs,
the two-Euclidean-open cover and the two-open-cell recognition of the sphere (Layer 4); and,
for an arbitrary forward
negative-gradient curve of a Morse function, convergence to a critical point when the curve is
trapped in a compact set and exponential decay of the Riemannian distance to its limit (Layer 6).
The statements use the pinned carriers `TauCeti.criticalPoints`, `TauCeti.criticalCount`,
`TauCeti.totalCriticalCount` and `TauCeti.Manifold.mgradient`. The definitions made here are
the handle `handle`, its attaching region `attachingRegion` and the inclusion
`attachingRegionIncl` of the attaching regions into the handles, products of the native unit
balls and spheres that state the handle theorem, and `bettiNumber`, since neither pin has a
Betti number of singular homology.

The other headline theorems of README.md are proved at the pinned Tau Ceti and are consumed by
the names the README's Tau Ceti contract lists, not restated: among them the normalized Morse
chart (`TauCeti.IsManifoldNondegenerateCriticalPoint.exists_normalized_morseChart`), compact
finiteness of critical sets (`TauCeti.IsMorse.finite_criticalPoints_inter`), the regular-level
embedding (`TauCeti.exists_regularFiber_smoothEmbedding`), the deformation across a compact
critical-free band (`TauCeti.exists_sublevelDeformation`), Milnor's cell attachment in relative
CW form (`TauCeti.IsMorse.exists_relCWComplex_sublevel_deformation`), Morse density in the strong
Whitney topology (`TauCeti.dense_setOf_isMorse_manifoldStrongWhitney`) and a proper Morse function
bounded below (`TauCeti.exists_isMorse_isProperMap_bddBelow`), the strong Morse inequalities in
alternating form (`TauCeti.IsMorse.sum_range_neg_one_pow_mul_finrank_singularHomology_le`), the
Lusternik–Schnirelmann bound for an arbitrary smooth function
(`TauCeti.lsCategoryCount_univ_le_totalCriticalCount`) with the minimal critical count
`TauCeti.minCriticalCount`, Reeb's theorem for Morse functions with two critical points
(`TauCeti.IsMorse.nonempty_homeomorph_sphere_of_totalCriticalCount_eq_two`), and the convergence
and exponential decay of maximal negative-gradient trajectories
(`TauCeti.exists_tendsto_maximalIntegralCurve_neg_mgradient`,
`TauCeti.exists_riemannianEDist_le_mul_exp_maximalIntegralCurve_neg_mgradient`).

Not stated: the comparison of the attachments built from different Morse charts, with coherent
dependence on a compact parameter space (README §2.3), whose statement quantifies over families
of charts with jointly continuous inverses and coordinate derivatives through order 2, over
homotopies of pairs of characteristic maps and over maps between fibrewise adjunction spaces
over the parameter space: a long ad hoc encoding, which this file does not carry. Not statable
at the pins, and therefore not
stated: the Morse–Bott negative-disc-bundle attachment, its relative Thom comparison and its
spectral sequence (README Layer 5), which lack a Morse–Bott predicate with its critical normal
bundle and the filtered attachment complex.
-/

@[expose] public section

noncomputable section

namespace TauCetiRoadmap.MorseTheory
open scoped Manifold ContDiff
open Set

universe u

variable {E H : Type*} {M : Type u} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [FiniteDimensional ℝ E] [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [T2Space M] [SecondCountableTopology M] [ChartedSpace H M]
  [IsManifold I ∞ M]

/-! ## Layer 2: compact-band deformation, handles and cells -/

/-- The handle `D^λ × D^(m−λ)` of index `λ` in dimension `m`: the product of the closed unit
balls of `EuclideanSpace ℝ (Fin λ)` and `EuclideanSpace ℝ (Fin (m − λ))` (README §2.2). -/
abbrev handle (l m : ℕ) : Type :=
  Metric.closedBall (0 : EuclideanSpace ℝ (Fin l)) 1 ×
    Metric.closedBall (0 : EuclideanSpace ℝ (Fin (m - l))) 1

/-- The attaching region `∂D^λ × D^(m−λ)` of the handle of index `λ` in dimension `m`, the
product of the unit sphere of `EuclideanSpace ℝ (Fin λ)` and the closed unit ball of
`EuclideanSpace ℝ (Fin (m − λ))`; it is empty for `λ = 0` (README §2.2). -/
abbrev attachingRegion (l m : ℕ) : Type :=
  Metric.sphere (0 : EuclideanSpace ℝ (Fin l)) 1 ×
    Metric.closedBall (0 : EuclideanSpace ℝ (Fin (m - l))) 1

/-- For a family of handles of indices `k i` in dimension `m`, the inclusion of the disjoint
union of their attaching regions into the disjoint union of the handles, summand by summand
(README §2.2). -/
def attachingRegionIncl {ι : Type*} (k : ι → ℕ) (m : ℕ) :
    C((i : ι) × attachingRegion (k i) m, (i : ι) × handle (k i) m) where
  toFun := Sigma.map id fun _ q ↦ (⟨q.1.1, Metric.sphere_subset_closedBall q.1.2⟩, q.2)
  continuous_toFun := continuous_sigma_map.mpr fun _ ↦ by fun_prop

/-- **Handle attachment across one critical level** (Nicolaescu, *An Invitation to Morse
Theory*, Theorem 2.2.3 and Remark 2.2.5, pp. 38–42, after Milnor, *Morse Theory*, §3): for a
Morse function `f` and a value `c` with a compact band `f⁻¹[c − δ, c + δ]`
there are `0 < ε ≤ δ` and a topological embedding `φ` of the disjoint union, over the critical
points `p` on the level `c`, of the attaching regions `∂D^(λ p) × D^(m − λ p)` into the level
`f⁻¹(c − ε)`, the boundary of the lower sublevel `{f ≤ c − ε}`, such that `{f ≤ c + ε}` is
homeomorphic to the `TopCat` pushout of `φ` and of the inclusion of the attaching regions into
the handles; here `λ p` is the Morse index of `p` and `m` the dimension (README §2.2). -/
theorem exists_homeomorph_pushout_handles (f : M → ℝ) (hf : TauCeti.IsMorse I f) {c δ : ℝ}
    (hδ : 0 < δ) (hcompact : IsCompact (f ⁻¹' Icc (c - δ) (c + δ))) :
    ∃ ε, 0 < ε ∧ ε ≤ δ ∧
      ∃ φ : C((p : ↥(TauCeti.criticalPoints I f ∩ f ⁻¹' {c})) ×
          attachingRegion (TauCeti.manifoldMorseIndex I f p) (Module.finrank ℝ E),
          {x : M // f x ≤ c - ε}),
        Topology.IsEmbedding φ ∧ (∀ q, f (φ q) = c - ε) ∧
        Nonempty ({x : M // f x ≤ c + ε} ≃ₜ
          ↑(CategoryTheory.Limits.pushout (TopCat.ofHom φ)
            (TopCat.ofHom (attachingRegionIncl
              (fun p : ↥(TauCeti.criticalPoints I f ∩ f ⁻¹' {c}) ↦
                TauCeti.manifoldMorseIndex I f p) (Module.finrank ℝ E))))) := by
  sorry

/-- **The Morse CW model** (Milnor, *Morse Theory*, Theorem 3.5, p. 20): a manifold carrying a
proper Morse function bounded below is homotopy equivalent to a Hausdorff CW complex `X` whose
`j`-cells correspond bijectively to the critical points of Morse index `j`, so that infinitely
many critical points of one index give infinitely many cells of that dimension (README §2.4). -/
theorem exists_cwComplex_homotopyEquiv (f : M → ℝ) (hf : TauCeti.IsMorse I f)
    (hp : IsProperMap f) (hlower : ∃ a : ℝ, ∀ x, a ≤ f x) :
    ∃ (X : Type*) (_ : TopologicalSpace X) (_ : T2Space X)
      (_ : Topology.CWComplex (Set.univ : Set X)),
      Nonempty (ContinuousMap.HomotopyEquiv M X) ∧
        ∀ j : ℕ, Nonempty (Topology.RelCWComplex.cell (Set.univ : Set X) j ≃
          {x : M // x ∈ TauCeti.criticalPoints I f ∧ TauCeti.manifoldMorseIndex I f x = j}) := by
  sorry

/-! ## Layer 4: strong inequalities and topology tests -/

/-- The `j`-th Betti number of `X` with coefficients in the field `k`: the dimension over `k` of
the `j`-th singular homology of `X` with coefficients in `k`, computed by Mathlib's singular
homology functor (README §4.1). -/
def bettiNumber (k : Type u) [Field k] (X : Type u) [TopologicalSpace X] (j : ℕ) : ℕ :=
  Module.finrank k
    (((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{u} k) j).obj
      (ModuleCat.of k k)).obj (TopCat.of X))

/-- **The strong Morse inequalities** as a polynomial identity (Cohen–Iga–Norbury, Corollary 5.11
and its proof, p. 42): for a Morse function on a compact manifold and a field `k` there is a
polynomial `Q` with natural coefficients such that `Σ c_j t^j = Σ b_j t^j + (1 + t) Q(t)`, where
`c_j` is the number of critical points of index `j` and `b_j` the `j`-th Betti number over `k`.
The identity is stated coefficientwise in `ℕ∞`; finiteness of every count is part of the claim
(README §4.1). -/
theorem morse_inequalities [CompactSpace M] (f : M → ℝ) (hf : TauCeti.IsMorse I f)
    (k : Type u) [Field k] :
    ∃ Q : Polynomial ℕ, ∀ j : ℕ,
      TauCeti.criticalCount I f j =
        ((bettiNumber k M j + ((1 + Polynomial.X) * Q).coeff j : ℕ) : ℕ∞) := by
  sorry

/-- A compact manifold of dimension `m` carrying a smooth function with exactly two critical
points, of arbitrary degeneracy, is the union of two open sets each homeomorphic to `ℝ^m`: a
chart ball at the maximum, and the preimage of a chart ball at the minimum under the negative
gradient flow at a large time; in dimension `0`, the two points (README §4.4). -/
theorem exists_twoEuclideanOpenCover_of_two_criticalPoints [CompactSpace M] (f : M → ℝ)
    (hf : ContMDiff I 𝓘(ℝ) ∞ f) (hcrit : TauCeti.totalCriticalCount I f = 2) :
    ∃ U V : TopologicalSpace.Opens M,
      (∀ x : M, x ∈ U ∨ x ∈ V) ∧
      Nonempty ({x : M // x ∈ U} ≃ₜ (Fin (Module.finrank ℝ E) → ℝ)) ∧
      Nonempty ({x : M // x ∈ V} ≃ₜ (Fin (Module.finrank ℝ E) → ℝ)) := by
  sorry

/-- The two-open-cell recognition of the sphere: a compact Hausdorff space covered by two open
sets, each homeomorphic to `ℝ^m` with `m > 0`, is homeomorphic to `S^m`. The proof bicollars a
coordinate sphere in the overlap by an open radial annulus and applies Brown's generalized
Schoenflies theorem (Brown 1960, Theorem 5, p. 76), consumed from GeometricTopology §2.2
(README §4.4; compare Milnor 1959, Corollary 1, p. 442, for covers by two open sets
diffeomorphic to `ℝ^m`). -/
theorem nonempty_homeomorph_sphere_of_two_euclidean_opens
    {X : Type*} [TopologicalSpace X] [T2Space X] [CompactSpace X]
    (m : ℕ) (hm : 0 < m) (U V : TopologicalSpace.Opens X)
    (hcover : ∀ x : X, x ∈ U ∨ x ∈ V)
    (hU : Nonempty ({x : X // x ∈ U} ≃ₜ (Fin m → ℝ)))
    (hV : Nonempty ({x : X // x ∈ V} ≃ₜ (Fin m → ℝ))) :
    Nonempty (X ≃ₜ Metric.sphere (0 : EuclideanSpace ℝ (Fin (m + 1))) 1) := by
  sorry

/-- A compact manifold of dimension `m` carrying a smooth function with exactly two critical
points is homeomorphic to `S^m`, with no nondegeneracy, connectedness or dimension hypothesis
(compare Milnor 1959, Theorem 1(3), p. 440, and Corollary 1, p. 442): for `m > 0` compose the
two preceding theorems, and for `m = 0` the manifold has exactly two points and is `S⁰`
(README §4.4). -/
theorem nonempty_homeomorph_sphere_of_two_criticalPoints [CompactSpace M] (f : M → ℝ)
    (hf : ContMDiff I 𝓘(ℝ) ∞ f) (hcrit : TauCeti.totalCriticalCount I f = 2) :
    Nonempty (M ≃ₜ Metric.sphere
      (0 : EuclideanSpace ℝ (Fin (Module.finrank ℝ E + 1))) 1) := by
  rcases Nat.eq_zero_or_pos (Module.finrank ℝ E) with hdim | hdim
  · sorry
  · obtain ⟨U, V, hcover, hU, hV⟩ :=
      exists_twoEuclideanOpenCover_of_two_criticalPoints (I := I) f hf hcrit
    exact nonempty_homeomorph_sphere_of_two_euclidean_opens
      (Module.finrank ℝ E) hdim U V hcover hU hV

/-! ## Layer 6: gradient convergence and exponential decay -/

section Gradient

open scoped Bundle

/-- A forward curve of the negative gradient of a Morse function for a smooth Riemannian metric,
given on `[0, ∞)` and trapped in a compact set `K`, converges to a critical point of `f` in `K`
(README §6.1; Cohen–Iga–Norbury, Theorem 4.6, pp. 27–29, for compact manifolds). -/
theorem tendsto_of_isMIntegralCurveOn_neg_mgradient
    [Bundle.RiemannianBundle (fun (x : M) ↦ TangentSpace I x)]
    [IsContMDiffRiemannianBundle I ∞ E (fun (x : M) ↦ TangentSpace I x)]
    (f : M → ℝ) (hf : TauCeti.IsMorse I f) (γ : ℝ → M)
    (hγ : IsMIntegralCurveOn γ (fun x ↦ -TauCeti.Manifold.mgradient I f x) (Set.Ici 0))
    {K : Set M} (hK : IsCompact K) (hmaps : Set.MapsTo γ (Set.Ici 0) K) :
    ∃ p ∈ K, p ∈ TauCeti.criticalPoints I f ∧ Filter.Tendsto γ Filter.atTop (nhds p) := by
  sorry

/-- A forward curve of the negative gradient of a Morse function for a smooth Riemannian metric
that converges to `p` does so exponentially for the intrinsic Riemannian extended distance
`Manifold.riemannianEDist` of the metric on `M`: the limit is a nondegenerate critical point, and
the finite entry time into the exponential regime is absorbed into `C` (README §6.1). -/
theorem exists_edist_le_exp_of_tendsto_neg_mgradient
    [Bundle.RiemannianBundle (fun (x : M) ↦ TangentSpace I x)]
    [IsContMDiffRiemannianBundle I ∞ E (fun (x : M) ↦ TangentSpace I x)]
    (f : M → ℝ) (hf : TauCeti.IsMorse I f) (γ : ℝ → M)
    (hγ : IsMIntegralCurveOn γ (fun x ↦ -TauCeti.Manifold.mgradient I f x) (Set.Ici 0))
    {p : M} (hp : Filter.Tendsto γ Filter.atTop (nhds p)) :
    ∃ C c : ℝ, 0 < c ∧ ∀ t : ℝ, 0 ≤ t →
      Manifold.riemannianEDist I (γ t) p ≤ ENNReal.ofReal (C * Real.exp (-c * t)) := by
  sorry

end Gradient

end TauCetiRoadmap.MorseTheory
