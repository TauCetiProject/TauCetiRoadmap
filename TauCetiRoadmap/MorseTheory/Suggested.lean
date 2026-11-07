import Mathlib
import TauCeti.Geometry.Manifold.Morse.Basic
import TauCeti.Geometry.Manifold.Morse.Index
import TauCeti.Geometry.Manifold.VectorBundle.Riemannian.Riesz

/-!
# Morse theory: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs: normalized Morse charts, regular
levels, compact-band deformation, the Morse CW model, Morse exhaustion existence, strong Morse
inequalities, the categorical-cover form of the arbitrary-function Lusternik–Schnirelmann
bound, the recognition of the sphere from a smooth function with exactly two critical points
of arbitrary degeneracy together with its inputs (the two-Euclidean-open cover, Brown's
generalized Schoenflies theorem and the two-open-cell recognition of the sphere), and
compact-trapped gradient convergence with intrinsic exponential decay.

The full relative handle/CW comparison with coherent parameter families lacks
its constructed handle attachment and comparison carriers. Strong smooth Morse
approximation lacks the specified strong smooth topology on smooth maps.
Morse–Bott attachment and its spectral sequence lack the critical-normal-bundle
splitting and filtered attachment complex. These headlines remain targets in README.md; no substitute
carrier is introduced here. The LS numerical invariant belongs to AlgebraicTopology;
the finite categorical-cover output below states the same finite-critical-set bound
using native open sets and nullhomotopies.
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

/-! ## Layer 1: critical Hessians, indices and usable normal forms -/

/-- The critical set uses the native manifold derivative. -/
def criticalPoints (f : M → ℝ) : Set M :=
  {x | mvfderiv I f x = 0}

/-- Extended count of critical points of a specified native Morse index. -/
def criticalCount (f : M → ℝ) (j : ℕ) : ℕ∞ :=
  {x | x ∈ criticalPoints (I := I) f ∧ TauCeti.manifoldMorseIndex I f x = j}.encard

/-- A smooth Morse function has only finitely many critical points in each compact subset. -/
theorem finite_criticalPoints_inter (f : M → ℝ) (hf : TauCeti.IsMorse I f)
    {K : Set M} (hK : IsCompact K) :
    (criticalPoints (I := I) f ∩ K).Finite := by
  sorry

/-- The normalized chart uses the native Morse index and has an actual smooth inverse. -/
theorem exists_normalized_morseChart (f : M → ℝ)
    (hf : ContMDiff I 𝓘(ℝ) ∞ f) (x : M)
    (hx : TauCeti.IsManifoldNondegenerateCriticalPoint I f x) :
    ∃ ψ : PartialDiffeomorph I
        𝓘(ℝ, EuclideanSpace ℝ (Fin (Module.finrank ℝ E))) M
        (EuclideanSpace ℝ (Fin (Module.finrank ℝ E))) ∞,
      x ∈ ψ.source ∧ ψ x = 0 ∧
      ∀ y ∈ ψ.source,
        f y = f x + ∑ i : Fin (Module.finrank ℝ E),
          (if i.val < TauCeti.manifoldMorseIndex I f x then -1 else 1) * (ψ y i) ^ 2 := by
  sorry

/-! ## Layer 2: compact-band deformation, handles and cells -/

/-- A regular scalar level has a smooth embedded atlas whose tangent image is the derivative kernel. -/
theorem exists_scalarRegularLevelData (f : M → ℝ) (c : ℝ)
    (hf : ContMDiff I 𝓘(ℝ) ∞ f)
    (hregular : ∀ x, f x = c → Function.Surjective (mfderiv I 𝓘(ℝ) f x)) :
    ∃ cs : ChartedSpace (Fin (Module.finrank ℝ E - 1) → ℝ) {x : M // f x = c},
      IsManifold 𝓘(ℝ, Fin (Module.finrank ℝ E - 1) → ℝ) ∞ {x : M // f x = c} ∧
        Manifold.IsSmoothEmbedding
          𝓘(ℝ, Fin (Module.finrank ℝ E - 1) → ℝ) I ∞
          (Subtype.val : {x : M // f x = c} → M) ∧
        ∀ z : {x : M // f x = c},
          (mfderiv 𝓘(ℝ, Fin (Module.finrank ℝ E - 1) → ℝ) I Subtype.val z).range =
            (mfderiv I 𝓘(ℝ) f z.1).ker := by
  sorry

/-- The continuous inclusion of a lower closed sublevel into a higher one. -/
def sublevelInclusion (f : M → ℝ) (a b : ℝ) (hab : a ≤ b) :
    ContinuousMap {x : M | f x ≤ a} {x : M | f x ≤ b} :=
  ⟨fun x ↦ ⟨x.val, le_trans x.property hab⟩,
    continuous_subtype_val.subtype_mk _⟩

/-- The actual deformation homotopy is fixed on the entire lower sublevel. -/
theorem exists_sublevelDeformation
    (f : M → ℝ) (hf : ContMDiff I 𝓘(ℝ) ∞ f)
    (a b : ℝ) (hab : a < b) (hcompact : IsCompact (f ⁻¹' Icc a b))
    (hnocrit : ∀ x, a ≤ f x → f x ≤ b → x ∉ criticalPoints (I := I) f) :
    ∃ r : ContinuousMap {x : M | f x ≤ b} {x : M | f x ≤ a},
      (∀ x, r (sublevelInclusion f a b hab.le x) = x) ∧
      Nonempty (ContinuousMap.HomotopyRel
        ((sublevelInclusion f a b hab.le).comp r) (ContinuousMap.id _)
        {x : {x : M | f x ≤ b} | f x ≤ a}) := by
  sorry

/-- A proper bounded-below Morse function has a Hausdorff CW model with one cell for each
critical point, in its Morse-index dimension (Milnor, Theorem 3.5, p. 20). -/
theorem exists_morseCWModel (f : M → ℝ) (hf : TauCeti.IsMorse I f)
    (hp : IsProperMap f) (hb : BddBelow (Set.range f)) :
    ∃ (X : Type _) (t : TopologicalSpace X),
      ∃ (_ : T2Space X) (cw : Topology.CWComplex (Set.univ : Set X)),
        Nonempty (ContinuousMap.HomotopyEquiv M X) ∧
        ∀ j : ℕ, Nonempty
          (Topology.RelCWComplex.cell (Set.univ : Set X) j ≃
            {x : M // x ∈ criticalPoints (I := I) f ∧
              TauCeti.manifoldMorseIndex I f x = j}) := by
  sorry

/-! ## Layer 3: approximation and proper Morse exhaustions -/

/-- Every second-countable manifold in the standing scope has a proper Morse function bounded below,
including the empty manifold. -/
theorem exists_proper_boundedBelow_morse :
    ∃ f : M → ℝ, TauCeti.IsMorse I f ∧ IsProperMap f ∧ BddBelow (Set.range f) := by
  sorry

/-! ## Layer 4: strong inequalities and topology tests -/

/-- Betti number of actual singular homology with coefficients in a field. -/
noncomputable def bettiNumber (k : Type u) [Field k] (X : Type u)
    [TopologicalSpace X] (j : ℕ) : ℕ :=
  Module.finrank k
    (((AlgebraicTopology.singularHomologyFunctor.{u} (ModuleCat.{u} k) j).obj
      (ModuleCat.of k k)).obj (TopCat.of X))

/-- The full Morse polynomial identity over any field, with a nonnegative correction polynomial. -/
theorem strong_morse_inequalities [CompactSpace M] (k : Type _) [Field k]
    (f : M → ℝ) (hf : TauCeti.IsMorse I f) :
    ∃ Q : Polynomial ℕ,
      (∑ j ∈ Finset.range (Module.finrank ℝ E + 1),
        Polynomial.monomial j (criticalCount (I := I) f j).toNat) =
      (∑ j ∈ Finset.range (Module.finrank ℝ E + 1),
        Polynomial.monomial j (bettiNumber k M j)) +
      (1 + Polynomial.X) * Q := by
  sorry

/-- This deformation uses a critical-value isolation band and no Morse hypothesis. -/
theorem exists_degenerateCriticalLevelDeformation [CompactSpace M]
    (f : M → ℝ) (hf : ContMDiff I 𝓘(ℝ) ∞ f)
    (c δ : ℝ) (hδ : 0 < δ)
    (hfinite : (criticalPoints (I := I) f ∩ {x | f x = c}).Finite)
    (hisolated : ∀ x ∈ criticalPoints (I := I) f,
      |f x - c| ≤ δ → f x = c)
    (U : TopologicalSpace.Opens M)
    (hU : criticalPoints (I := I) f ∩ {x | f x = c} ⊆ U) :
    ∃ ε : ℝ, 0 < ε ∧ ε < δ ∧ ∃ Φ : C(unitInterval × M, M),
      (∀ x, Φ (0, x) = x) ∧
      (∀ t x, f (Φ (t, x)) ≤ f x) ∧
      (∀ x, f x ≤ c + ε → f (Φ (1, x)) < c - ε ∨ Φ (1, x) ∈ U) := by
  sorry

/-- Ambient/open-sublevel cutoff version needed in the categorical argument. -/
theorem exists_noCriticalOpenSublevelDeformation [CompactSpace M]
    (f : M → ℝ) (hf : ContMDiff I 𝓘(ℝ) ∞ f)
    (a b δ : ℝ) (hab : a < b) (hδ : 0 < δ)
    (hnocrit : ∀ x, a - δ ≤ f x → f x ≤ b + δ →
      x ∉ criticalPoints (I := I) f) :
    ∃ Φ : C(unitInterval × M, M),
      (∀ x, Φ (0, x) = x) ∧
      (∀ t x, f (Φ (t, x)) ≤ f x) ∧
      (∀ x, f x ≤ b → f (Φ (1, x)) < a) := by
  sorry

/-- Actual finite categorical cover, not a Prop asserting its future availability. -/
theorem exists_criticalCategoricalCover [CompactSpace M]
    (f : M → ℝ) (hf : ContMDiff I 𝓘(ℝ) ∞ f)
    (hfinite : (criticalPoints (I := I) f).Finite) :
    ∃ U : Fin hfinite.toFinset.card → TopologicalSpace.Opens M,
      (∀ i, (⟨Subtype.val, continuous_subtype_val⟩ :
        C({x : M // x ∈ U i}, M)).Nullhomotopic) ∧
      (∀ x : M, ∃ i, x ∈ U i) := by
  sorry

/-- A compact manifold of dimension `m` carrying a smooth function with exactly two critical
points, of arbitrary degeneracy, is the union of two open sets each homeomorphic to `ℝ^m`: a
chart ball at the maximum, and the preimage of a chart ball at the minimum under the negative
gradient flow at a large time (README §4.4). -/
theorem exists_twoEuclideanOpenCover_of_two_criticalPoints [CompactSpace M]
    (f : M → ℝ) (hf : ContMDiff I 𝓘(ℝ) ∞ f)
    (hcrit : (criticalPoints (I := I) f).encard = 2) :
    ∃ U V : TopologicalSpace.Opens M,
      (∀ x : M, x ∈ U ∨ x ∈ V) ∧
      Nonempty ({x : M // x ∈ U} ≃ₜ (Fin (Module.finrank ℝ E) → ℝ)) ∧
      Nonempty ({x : M // x ∈ V} ≃ₜ (Fin (Module.finrank ℝ E) → ℝ)) := by
  sorry

omit hfd hbd ht2 hsm hsc in
/-- Brown's generalized Schoenflies theorem (Brown 1960, Theorem 5, p. 76): for a topological
embedding `β` of `S^(m-1) × [-1, 1]` into `S^m`, the complement of the middle sphere
`Σ = β(S^(m-1) × {0})` is the union of two disjoint connected open sets, and the closure of
each is homeomorphic to the closed unit `m`-ball by a homeomorphism carrying `Σ` exactly onto
the unit sphere. -/
theorem exists_closedBall_homeomorph_closure_of_bicollar (m : ℕ)
    (β : Metric.sphere (0 : EuclideanSpace ℝ (Fin m)) 1 × Set.Icc (-1 : ℝ) 1 →
      Metric.sphere (0 : EuclideanSpace ℝ (Fin (m + 1))) 1)
    (hβ : Topology.IsEmbedding β) :
    ∃ A B : Set (Metric.sphere (0 : EuclideanSpace ℝ (Fin (m + 1))) 1),
      IsOpen A ∧ IsOpen B ∧ IsConnected A ∧ IsConnected B ∧ Disjoint A B ∧
      A ∪ B = (Set.range fun x ↦ β (x, ⟨0, by norm_num, by norm_num⟩))ᶜ ∧
      (∃ e : closure A ≃ₜ Metric.closedBall (0 : EuclideanSpace ℝ (Fin m)) 1,
        ∀ y : closure A, (y : Metric.sphere (0 : EuclideanSpace ℝ (Fin (m + 1))) 1) ∈
            Set.range (fun x ↦ β (x, ⟨0, by norm_num, by norm_num⟩)) ↔
          ‖(e y : EuclideanSpace ℝ (Fin m))‖ = 1) ∧
      (∃ e : closure B ≃ₜ Metric.closedBall (0 : EuclideanSpace ℝ (Fin m)) 1,
        ∀ y : closure B, (y : Metric.sphere (0 : EuclideanSpace ℝ (Fin (m + 1))) 1) ∈
            Set.range (fun x ↦ β (x, ⟨0, by norm_num, by norm_num⟩)) ↔
          ‖(e y : EuclideanSpace ℝ (Fin m))‖ = 1) := by
  sorry

omit hfd hbd ht2 hsm hsc in
/-- The two-open-cell recognition of the sphere: a compact Hausdorff space covered by two open
sets, each homeomorphic to `ℝ^m` with `m > 0`, is homeomorphic to `S^m`. The proof bicollars a
coordinate sphere in the overlap and applies Brown's generalized Schoenflies theorem
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
points is homeomorphic to `S^m`, with no nondegeneracy, connectedness or dimension
hypothesis: for `m > 0` compose the two-Euclidean-open cover with the two-open-cell
recognition (compare Milnor 1959, Theorem 1(3) and Corollary 1, p. 442), and for `m = 0`
the manifold has exactly two points and is `S^0`. -/
theorem nonempty_homeomorph_sphere_of_two_criticalPoints [CompactSpace M]
    (f : M → ℝ) (hf : ContMDiff I 𝓘(ℝ) ∞ f)
    (hcrit : (criticalPoints (I := I) f).encard = 2) :
    Nonempty (M ≃ₜ Metric.sphere
      (0 : EuclideanSpace ℝ (Fin (Module.finrank ℝ E + 1))) 1) := by
  sorry

/-! ## Layer 6: gradient convergence and exponential decay -/

/-- A forward negative-gradient curve for a smooth metric, trapped in a compact set,
converges to a critical point of a Morse function with exponential Riemannian-distance decay. -/
theorem exists_compactTrapped_gradient_limit
    [Bundle.RiemannianBundle (fun x : M ↦ TangentSpace I x)]
    [IsContMDiffRiemannianBundle I ∞ E (fun x : M ↦ TangentSpace I x)]
    (f : M → ℝ) (hf : TauCeti.IsMorse I f) (γ : ℝ → M)
    (hγ : IsMIntegralCurveOn γ
      (fun x ↦ -Riemannian.Tensor.rieszDual (I := I) x (mfderiv I 𝓘(ℝ) f x))
      (Set.Ici 0))
    (K : Set M) (hK : IsCompact K) (htrap : Set.MapsTo γ (Set.Ici 0) K) :
    ∃ p ∈ K, mvfderiv I f p = 0 ∧ Filter.Tendsto γ Filter.atTop (nhds p) ∧
      ∃ C c T : ℝ, 0 < C ∧ 0 < c ∧ 0 ≤ T ∧
        ∀ t : ℝ, T ≤ t →
          Manifold.riemannianEDist I (γ t) p ≤ ENNReal.ofReal (C * Real.exp (-c * t)) := by
  sorry

end TauCetiRoadmap.MorseTheory
