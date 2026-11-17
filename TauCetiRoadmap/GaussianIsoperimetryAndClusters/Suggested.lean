module

import Mathlib
import TauCeti.Analysis.BoundedVariation.ReducedBoundary
import TauCeti.Analysis.BoundedVariation.TotalVariation
import TauCeti.Analysis.BoundedVariation.VariationMeasure
import TauCeti.Analysis.Distribution.TestFunction.Divergence
import TauCeti.MeasureTheory.Covering.EssentialBoundary
import TauCeti.Probability.Quantile

/-!
# Weighted perimeter, Gaussian isoperimetry and clusters: target signatures

The roadmap is `README.md`; this file is not the roadmap. It is the roadmap's acceptance test: it
states, against the pinned Mathlib and Tau Ceti, the headline theorems that the finished roadmap
proves, each with `sorry`, together with the few simple definitions those statements need.

Stated here:

* Layer 2: the weighted variation of a positive `C¹` density `e^{−W}` is the integral of `e^{−W}`
  against Tau Ceti's variation measure, and the weighted perimeter of a set of locally finite
  perimeter is the `e^{−W}`-weighted Hausdorff measure of its reduced boundary and of its
  essential boundary (§2.2); the weighted Gauss–Green formula (§2.5); the weighted coarea
  formula (§2.6);
* Layer 3: existence of isoperimetric minimizing `q`-clusters, in dimension at least one, for
  every probability density `e^{−W}` with `W` of class `C¹` and every prescribed measure vector
  (§3.5);
* Layer 4: the measure map of the Gaussian model simplicial clusters is a smooth bijection onto
  the open simplex with derivative `−L_A/√2`, invertible because every model interface area is
  positive (§4.3); the model profile satisfies `∇I_m = Ψ⁻¹/√2` and `∇²I_m = −L_A⁻¹` (§4.6); and
  for `q ≤ n + 1` it bounds the isoperimetric profile of `q`-clusters on the open simplex
  (§4.7);
* Layer 6: Ehrhard symmetrisation does not increase Gaussian perimeter (§6.6);
* Layer 7: the Gaussian isoperimetric theorem with its equality case (§7.3), and its two-cell
  cluster form: the profile identity and the characterization of minimizing `2`-clusters (§7.4);
* Layer 8: the Borell–Sudakov–Tsirelson inequality for the standard Gaussian and for every
  Gaussian law on a Euclidean space (§8.1), the Minkowski-content form (§8.2), Bobkov's
  functional inequality (§8.3), concentration of Lipschitz functions about a median (§8.4) and
  of maxima of Gaussian vectors (§8.5);
* Layer 9: Ehrhard's inequality for convex sets, and convexity of the closed Gaussian symmetrals
  of convex sets (§9.5).

Every headline theorem of the roadmap is statable at the pins; none is omitted for want of a
carrier.
-/

namespace TauCetiRoadmap.GaussianIsoperimetryAndClusters

open MeasureTheory ProbabilityTheory TopologicalSpace Filter Set Metric TestFunction
open scoped ENNReal NNReal Topology RealInnerProductSpace Distributions Pointwise MatrixOrder

/-! ## Layer 1: the standard Gaussian on the line and on Euclidean spaces -/

/-- The **Gaussian isoperimetric function** `I(v) = φ(Φ⁻¹(v))` for `0 < v < 1`, where `φ` is the
standard normal density and `Φ⁻¹(v)` the quantile of the standard normal law at level `v`, and
`I(v) = 0` otherwise (MilmanNeeman2022, Section 1.2, the formula `φ ∘ Φ⁻¹` just before
equation (1.1), which is the equation `I″ = −1/I`; Ledoux1999, (1.4)). The endpoints are set
apart because the quantile takes the junk value `0` at levels `0` and `1`. -/
noncomputable def gaussianIsoperimetricProfile (v : ℝ) : ℝ :=
  if 0 < v ∧ v < 1 then gaussianPDFReal 0 1 ((gaussianReal 0 1).quantile v) else 0

/-! ## Layer 2: weighted variation and perimeter -/

section Weighted

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  [MeasurableSpace E] [BorelSpace E]

/-- The **weighted variation** `V_μ(u; Ω)` of `u` on the open set `Ω` for the density `e^{−W}`:
the supremum of `∫ u (div X − ⟨∇W, X⟩) e^{−W} dx` over test vector fields `X ∈ 𝓓(Ω, E)` with
`‖X‖ ≤ 1` everywhere. Here `div X − ⟨∇W, X⟩` is the weighted divergence, written with the
derivative `DW(x)(X x) = ⟨∇W(x), X x⟩` (MilmanNeeman2022, Section 3; CianchiFuscoMaggiPratelli2011,
(2.5)). For `W = 0` it is Tau Ceti's `TauCeti.totalVariationOn volume Ω u`. -/
noncomputable def weightedVariation (W : E → ℝ) (Ω : Opens E) (u : E → ℝ) : ℝ≥0∞ :=
  ⨆ (X : 𝓓(Ω, E)) (_ : ∀ x, ‖X x‖ ≤ 1),
    ENNReal.ofReal (∫ x, u x * (divergenceCLM X x - fderiv ℝ W x (X x)) * Real.exp (-W x))

/-- The **weighted perimeter** `P_μ(U; Ω)` of `U` in `Ω`: the weighted variation of its
indicator. -/
noncomputable def weightedPerimeter (W : E → ℝ) (Ω : Opens E) (U : Set E) : ℝ≥0∞ :=
  weightedVariation W Ω (U.indicator 1)

/-- The measure `μ = e^{−W} · volume` of the weight `W`. -/
noncomputable def weightedMeasure (W : E → ℝ) : Measure E :=
  volume.withDensity fun x => ENNReal.ofReal (Real.exp (-W x))

variable (E) in
/-- The **Gaussian weight** `W(x) = ‖x‖²/2 + (n/2) log 2π`, `n = dim E`, so that `e^{−W}` is the
density `(2π)^{−n/2} e^{−‖x‖²/2}` of `stdGaussian E` against `volume`
(`TauCeti.Probability.stdGaussian_eq_withDensity_norm`) and `∇W(x) = x`. -/
noncomputable def gaussianWeight (x : E) : ℝ :=
  ‖x‖ ^ 2 / 2 + (Module.finrank ℝ E : ℝ) / 2 * Real.log (2 * Real.pi)

/-- The **Gaussian perimeter** `P_γ(U)` of `U` in the whole space: the weighted perimeter for the
Gaussian weight. A half-space at distance `s` from the origin has Gaussian perimeter `φ(s)`. -/
noncomputable def gaussianPerimeter (U : Set E) : ℝ≥0∞ :=
  weightedPerimeter (gaussianWeight E) ⊤ U

/-- **Weighted variation is the weighted variation measure** (§2.2). For a weight `W` of class
`C¹` and `u` locally integrable on the open set `Ω` with locally finite Euclidean variation there,
`V_μ(u; Ω) = ∫_Ω e^{−W} d|Du|`, where `|Du|` is Tau Ceti's variation measure (MilmanNeeman2022,
Section 3, for `C^∞` weights; CianchiFuscoMaggiPratelli2011, (2.3)–(2.5), for the Gaussian). -/
theorem weightedVariation_eq_lintegral_variationMeasure {W : E → ℝ} (hW : ContDiff ℝ 1 W)
    {Ω : Opens E} {u : E → ℝ} (hu : LocallyIntegrableOn u Ω volume)
    (hfin : ∀ K, IsCompact K → K ⊆ Ω →
      ∃ U : Opens E, K ⊆ (U : Set E) ∧ TauCeti.totalVariationOn volume U u ≠ ⊤) :
    weightedVariation W Ω u =
      ∫⁻ x, ENNReal.ofReal (Real.exp (-W x)) ∂TauCeti.variationMeasure volume Ω u := by
  sorry

/-- **Weighted perimeter is the weighted measure of the reduced and of the essential
boundary** (§2.2). For `n = dim E ≥ 1`, a weight of class `C¹` and a set `U` of locally finite
perimeter in the open set `Ω`, `P_μ(U; Ω) = μ^{n−1}(∂*U) = μ^{n−1}(∂^M U ∩ Ω)` with
`μ^{n−1} = e^{−W} μHE[n−1]` (MilmanNeeman2022, Section 3, for `C^∞` weights; Maggi2012,
Theorem 15.9). -/
theorem weightedPerimeter_eq_lintegral_reducedBoundary (hn : 0 < Module.finrank ℝ E)
    {W : E → ℝ} (hW : ContDiff ℝ 1 W) {Ω : Opens E} {U : Set E}
    (hU : LocallyIntegrableOn (U.indicator (1 : E → ℝ)) Ω volume)
    (hfin : ∀ K, IsCompact K → K ⊆ Ω →
      ∃ V : Opens E, K ⊆ (V : Set E) ∧ TauCeti.totalVariationOn volume V (U.indicator 1) ≠ ⊤) :
    weightedPerimeter W Ω U =
        ∫⁻ x in TauCeti.reducedBoundary volume Ω U, ENNReal.ofReal (Real.exp (-W x))
          ∂μHE[Module.finrank ℝ E - 1] ∧
      weightedPerimeter W Ω U =
        ∫⁻ x in TauCeti.essentialBoundary volume U ∩ Ω, ENNReal.ofReal (Real.exp (-W x))
          ∂μHE[Module.finrank ℝ E - 1] := by
  sorry

/-- **The weighted Gauss–Green formula** (§2.5). For `n ≥ 1`, a weight of class `C¹`, a set `U`
of locally finite perimeter in the open set `Ω` and a `C¹` vector field `X` with compact support
in `Ω`, `∫_U div_μ X dμ = ∫_{∂*U} ⟨X, ν_U⟩ dμ^{n−1}`, with Tau Ceti's outer normal `ν_U`
(MilmanNeeman2022, equations (3.1) and (3.3), for `C^∞` weights). -/
theorem integral_weightedDivergence_eq_integral_reducedBoundary (hn : 0 < Module.finrank ℝ E)
    {W : E → ℝ} (hW : ContDiff ℝ 1 W) {Ω : Opens E} {U : Set E}
    (hU : LocallyIntegrableOn (U.indicator (1 : E → ℝ)) Ω volume)
    (hfin : ∀ K, IsCompact K → K ⊆ Ω →
      ∃ V : Opens E, K ⊆ (V : Set E) ∧ TauCeti.totalVariationOn volume V (U.indicator 1) ≠ ⊤)
    {X : E → E} (hX : ContDiff ℝ 1 X) (hc : HasCompactSupport X) (hs : tsupport X ⊆ Ω) :
    ∫ x in U, (LinearMap.trace ℝ E (fderiv ℝ X x : E →ₗ[ℝ] E) - fderiv ℝ W x (X x)) *
        Real.exp (-W x) =
      ∫ x in TauCeti.reducedBoundary volume Ω U,
        ⟪X x, TauCeti.outerNormal volume Ω U x⟫ * Real.exp (-W x)
          ∂μHE[Module.finrank ℝ E - 1] := by
  sorry

/-- **The weighted coarea formula** (§2.6). For a weight of class `C¹` and `u` locally integrable
on the open set `Ω`, `V_μ(u; Ω) = ∫_ℝ P_μ({u > t}; Ω) dt` in `[0, ∞]` (Maggi2012, Section 13.1). -/
theorem weightedVariation_eq_lintegral_weightedPerimeter {W : E → ℝ} (hW : ContDiff ℝ 1 W)
    {Ω : Opens E} {u : E → ℝ} (hu : LocallyIntegrableOn u Ω volume) :
    weightedVariation W Ω u = ∫⁻ t, weightedPerimeter W Ω {x | t < u x} := by
  sorry

end Weighted

/-! ## Layer 3: clusters and their interfaces -/

section Clusters

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  [MeasurableSpace E] [BorelSpace E]

/-- A **`q`-cluster** for the weight `W`: `q` Lebesgue-measurable cells, pairwise disjoint,
covering `E` up to a null set (for `volume`, equivalently for `e^{−W} · volume`, the density being
positive), each of finite weighted perimeter. Cells may be empty or disconnected
(MilmanNeeman2022, Sections 1 and 3, for `q ≥ 2`). For `q = 1` the only cluster is `E` up to a
null set, of total perimeter `0`; there are no `0`-clusters. -/
structure Cluster (W : E → ℝ) (q : ℕ) where
  /-- The cells `Ω_1, …, Ω_q`. -/
  cell : Fin q → Set E
  /-- Every cell is Lebesgue measurable. -/
  nullMeasurableSet_cell : ∀ i, NullMeasurableSet (cell i) volume
  /-- The cells are pairwise disjoint. -/
  pairwise_disjoint : Pairwise fun i j => Disjoint (cell i) (cell j)
  /-- The cells cover `E` up to a null set. -/
  volume_compl_iUnion : volume (⋃ i, cell i)ᶜ = 0
  /-- Every cell has finite weighted perimeter. -/
  weightedPerimeter_lt_top : ∀ i, weightedPerimeter W ⊤ (cell i) < ⊤

/-- The **total perimeter** `P_μ(Ω) = ½ Σ_i P_μ(Ω_i)` of a cluster, each interface counted once. -/
noncomputable def Cluster.perimeter {W : E → ℝ} {q : ℕ} (Ω : Cluster W q) : ℝ≥0∞ :=
  (∑ i, weightedPerimeter W ⊤ (Ω.cell i)) / 2

/-- The **isoperimetric profile** `I_μ^{(q−1)}(v)`: the infimum of the total perimeters of the
`q`-clusters whose cells have the measures `v_1, …, v_q` for `μ = e^{−W} · volume`
(MilmanNeeman2022, Section 1). -/
noncomputable def isoperimetricProfile (W : E → ℝ) (q : ℕ) (v : Fin q → ℝ) : ℝ≥0∞ :=
  ⨅ (Ω : Cluster W q) (_ : ∀ i, weightedMeasure W (Ω.cell i) = ENNReal.ofReal (v i)),
    Ω.perimeter

/-- **Existence of isoperimetric minimizing clusters** (§3.5). For `n = dim E ≥ 1`, a weight `W`
of class `C¹` with `∫ e^{−W} = 1`, every `q` and every `v` in the probability simplex
`Δ^{(q−1)}`, some `q`-cluster with measure vector `v` attains the isoperimetric profile at `v`
(MilmanNeeman2022, Theorem 4.1 (i), stated there for `W ∈ C^∞` and `q ≥ 2`; its argument needs
only lower semicontinuity and compactness, which hold for `C¹` weights). -/
theorem exists_cluster_perimeter_eq_isoperimetricProfile [Nontrivial E] {W : E → ℝ}
    (hW : ContDiff ℝ 1 W) (hμ : IsProbabilityMeasure (weightedMeasure W)) {q : ℕ}
    {v : Fin q → ℝ} (hv : ∀ i, 0 ≤ v i) (hsum : ∑ i, v i = 1) :
    ∃ Ω : Cluster W q, (∀ i, weightedMeasure W (Ω.cell i) = ENNReal.ofReal (v i)) ∧
      Ω.perimeter = isoperimetricProfile W q v := by
  sorry

end Clusters

/-! ## Layer 4: model simplicial clusters and the model profile -/

section Model

/-- The tangent space `E^{(q−1)} = {x ∈ ℝ^q : Σ x_i = 0}` of the probability simplex, with the
Euclidean structure of `EuclideanSpace ℝ (Fin q)`. -/
def simplexTangent (q : ℕ) : Submodule ℝ (EuclideanSpace ℝ (Fin q)) where
  carrier := {x | ∑ i, x i = 0}
  add_mem' {x y} hx hy := by
    simp only [mem_ofPred_eq, PiLp.add_apply, Finset.sum_add_distrib] at hx hy ⊢
    rw [hx, hy, add_zero]
  zero_mem' := by simp
  smul_mem' c x hx := by
    simp only [mem_ofPred_eq, PiLp.smul_apply, smul_eq_mul, ← Finset.mul_sum] at hx ⊢
    rw [hx, mul_zero]

/-- The **model cell** `Ω^m_i = {x ∈ E^{(q−1)} : x_i > x_j for all j ≠ i}` (MilmanNeeman2022,
Section 2). -/
def modelCell (q : ℕ) (i : Fin q) : Set (simplexTangent q) :=
  {x | ∀ j, j ≠ i → (x : EuclideanSpace ℝ (Fin q)) j < (x : EuclideanSpace ℝ (Fin q)) i}

/-- The **measure map** `Ψ(x) = γ(x + Ω^m)` of the translated model clusters, with `γ` the standard
Gaussian measure of `E^{(q−1)}` (MilmanNeeman2022, Lemma 2.1). -/
noncomputable def modelMeasureMap (q : ℕ) (x : simplexTangent q) : EuclideanSpace ℝ (Fin q) :=
  WithLp.toLp 2 fun i => (stdGaussian (simplexTangent q) {y | y - x ∈ modelCell q i}).toReal

/-- The **model interface area** `A^m_ij(x) = ∫_{x + Σ^m_ij} e^{−W} dμHE[q−2]`, where
`Σ^m_ij = {y : y_i = y_j ≥ y_k for all k}` is the closed model interface and `e^{−W}` the
Gaussian density of `E^{(q−1)}` (MilmanNeeman2022, Section 2). -/
noncomputable def modelInterfaceArea (q : ℕ) (i j : Fin q) (x : simplexTangent q) : ℝ :=
  ∫ y in {y : simplexTangent q | (y - x : EuclideanSpace ℝ (Fin q)) i =
      (y - x : EuclideanSpace ℝ (Fin q)) j ∧
      ∀ k, (y - x : EuclideanSpace ℝ (Fin q)) k ≤ (y - x : EuclideanSpace ℝ (Fin q)) i},
    Real.exp (-gaussianWeight (simplexTangent q) y) ∂μHE[q - 2]

/-- The **interface operator** `L_A = Σ_{i<j} A_ij (e_i − e_j)(e_i − e_j)ᵀ` of nonnegative
numbers `A_ij`, as a linear map of `EuclideanSpace ℝ (Fin q)`. -/
noncomputable def interfaceOperator (q : ℕ) (A : Fin q → Fin q → ℝ) :
    EuclideanSpace ℝ (Fin q) →L[ℝ] EuclideanSpace ℝ (Fin q) :=
  ∑ i : Fin q, ∑ j : Fin q, if i < j then
    A i j • (innerSL ℝ (EuclideanSpace.single i 1 - EuclideanSpace.single j 1 :
      EuclideanSpace ℝ (Fin q))).smulRight
        (EuclideanSpace.single i 1 - EuclideanSpace.single j 1 : EuclideanSpace ℝ (Fin q))
  else 0

open scoped Classical in
/-- The **model profile** `I_m^{(q−1)}(v) = Σ_{i<j} A^m_ij(Ψ⁻¹(v))` for `v` in the open simplex,
the range of `Ψ`, and `0` elsewhere (MilmanNeeman2022, Definition 2.2). -/
noncomputable def modelProfile (q : ℕ) (v : EuclideanSpace ℝ (Fin q)) : ℝ :=
  if h : ∃ x, modelMeasureMap q x = v then
    ∑ i : Fin q, ∑ j : Fin q, if i < j then modelInterfaceArea q i j h.choose else 0
  else 0

/-- **The measure map is a diffeomorphism onto the open simplex** (§4.3). For `q ≥ 2`, `Ψ` is
injective and `C^∞`, its range is the open simplex `{v : v_i > 0, Σ v_i = 1}`, its derivative
at `x` is `−L_{A^m(x)}/√2` on `E^{(q−1)}`, and every model interface area `A^m_ij(x)` with `i ≠ j`
is positive, so that `L_{A^m(x)}` is positive definite on `E^{(q−1)}` and the derivative is
invertible (MilmanNeeman2022, Lemma 2.1). -/
theorem modelMeasureMap_diffeomorph {q : ℕ} (hq : 2 ≤ q) :
    Function.Injective (modelMeasureMap q) ∧
      range (modelMeasureMap q) = {v | (∀ i, 0 < v i) ∧ ∑ i, v i = 1} ∧
      ContDiff ℝ ((⊤ : ℕ∞) : WithTop ℕ∞) (modelMeasureMap q) ∧
      (∀ x, HasFDerivAt (modelMeasureMap q)
        (-(Real.sqrt 2)⁻¹ •
          (interfaceOperator q fun i j => modelInterfaceArea q i j x).comp
            (simplexTangent q).subtypeL) x) ∧
      ∀ (x : simplexTangent q) (i j : Fin q), i ≠ j → 0 < modelInterfaceArea q i j x := by
  sorry

/-- **The differential identities of the model profile** (§4.6). For `q ≥ 2` and `x ∈ E^{(q−1)}`,
put `g(w) = I_m(Ψ(x) + w)` on `E^{(q−1)}`. Then `∇g(0) = x/√2`, that is `∇I_m = Ψ⁻¹/√2`, and the
second derivative `H` of `g` at `0` satisfies `H(L_A u, b) = −⟨u, b⟩` for `A = A^m(x)`, that is
`∇²I_m = −L_A⁻¹` on `E^{(q−1)}` (MilmanNeeman2022, Proposition 2.4). -/
theorem modelProfile_hessian {q : ℕ} (hq : 2 ≤ q) (x : simplexTangent q) :
    HasFDerivAt (fun w : simplexTangent q => modelProfile q (modelMeasureMap q x + w))
        ((Real.sqrt 2)⁻¹ • innerSL ℝ x) 0 ∧
      ∃ H : simplexTangent q →L[ℝ] simplexTangent q →L[ℝ] ℝ,
        HasFDerivAt
          (fderiv ℝ fun w : simplexTangent q => modelProfile q (modelMeasureMap q x + w)) H 0 ∧
        ∀ u a b : simplexTangent q,
          (a : EuclideanSpace ℝ (Fin q)) =
              interfaceOperator q (fun i j => modelInterfaceArea q i j x) u →
            H a b = -⟪u, b⟫ := by
  sorry

/-- **The model profile bounds the isoperimetric profile** (§4.7). For `1 ≤ q ≤ n + 1`,
`n = dim E`, and `v` in the open simplex, `I^{(q−1)}(v) ≤ I_m^{(q−1)}(v)` for the Gaussian
measure of `E`: for `q ≥ 2` a simplicial `q`-cluster of `E` with measure vector `v` is a
competitor, and for `q = 1` both sides vanish (MilmanNeeman2022, Section 2, after Lemma 2.3). -/
theorem isoperimetricProfile_le_modelProfile {E : Type*} [NormedAddCommGroup E]
    [InnerProductSpace ℝ E] [FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E] {q : ℕ}
    (hqn : q ≤ Module.finrank ℝ E + 1) {v : Fin q → ℝ} (hv : ∀ i, 0 < v i)
    (hsum : ∑ i, v i = 1) :
    isoperimetricProfile (gaussianWeight E) q v ≤
      ENNReal.ofReal (modelProfile q (WithLp.toLp 2 v)) := by
  sorry

end Model

/-! ## Layer 6: Gaussian symmetrisation of sets of finite Gaussian perimeter -/

section Symmetrisation

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  [MeasurableSpace E] [BorelSpace E]

/-- The **Gaussian symmetral** `S_{F,u}(U)` of `U` for a subspace `F` and a unit vector `u ∈ F`:
the points `x` with `Φ(⟨x, u⟩) < γ_F(U_x)`, where `U_x = {y ∈ F : P_{F^⊥} x + y ∈ U}` is the section
of `U` over the projection of `x` to `F^⊥`. Each section of Gaussian measure `v` becomes the
sublevel half-space `{⟨y, u⟩ < Φ⁻¹(v)}` of the same measure. For `F = ℝ e` and `u = e` it is the
Ehrhard symmetral `S_e(U)` (CianchiFuscoMaggiPratelli2011, Section 4.1; Ehrhard1983,
Définition 1.1, in the mirrored superlevel convention). -/
noncomputable def gaussianSymmetral (F : Submodule ℝ E) (u : E) (U : Set E) : Set E :=
  {x | cdf (gaussianReal 0 1) ⟪x, u⟫ <
    (stdGaussian F {y : F | x - F.starProjection x + (y : E) ∈ U}).toReal}

/-- **Ehrhard symmetrisation does not increase Gaussian perimeter** (§6.6). For a unit vector `e`
and a Lebesgue-measurable `U`, the Ehrhard symmetral of `U` in direction `e` has Gaussian
perimeter at most that of `U`, trivially when `P_γ(U) = ∞` (CianchiFuscoMaggiPratelli2011,
Theorem 4.3). -/
theorem gaussianPerimeter_gaussianSymmetral_le {e : E} (he : ‖e‖ = 1) {U : Set E}
    (hU : NullMeasurableSet U volume) :
    gaussianPerimeter (gaussianSymmetral (ℝ ∙ e) e U) ≤ gaussianPerimeter U := by
  sorry

/-! ## Layer 7: the Gaussian isoperimetric theorem -/

/-- **The Gaussian isoperimetric theorem with equality** (§7.3). Every Lebesgue-measurable `U`
satisfies `P_γ(U) ≥ I(γ(U))`, and equality holds exactly when `γ(U) ∈ {0, 1}` or `U` agrees almost
everywhere with a half-space `{⟨x, ν⟩ < s}` for a unit vector `ν` (SudakovTsirelson1974,
Theorem 1; Borell1975, Theorem 3.1; CianchiFuscoMaggiPratelli2011, Theorem 4.1 and
Proposition 3.1; CarlenKerce2001, Theorem 1). -/
theorem gaussian_isoperimetric {U : Set E} (hU : NullMeasurableSet U volume) :
    ENNReal.ofReal (gaussianIsoperimetricProfile (stdGaussian E U).toReal) ≤
        gaussianPerimeter U ∧
      (gaussianPerimeter U =
          ENNReal.ofReal (gaussianIsoperimetricProfile (stdGaussian E U).toReal) ↔
        stdGaussian E U = 0 ∨ stdGaussian E U = 1 ∨
          ∃ ν : E, ‖ν‖ = 1 ∧ ∃ s : ℝ, U =ᵐ[volume] {x | ⟪x, ν⟫ < s}) := by
  sorry

/-- **The two-cell profile** (§7.4). For `n ≥ 1` and every `v` in the simplex `Δ^{(1)}`, the
Gaussian isoperimetric profile of `2`-clusters is `I(v_1)` (MilmanNeeman2022, Theorem 1.1 for
`q = 2`). -/
theorem isoperimetricProfile_two_eq [Nontrivial E] {v : Fin 2 → ℝ} (hv : ∀ i, 0 ≤ v i)
    (hsum : v 0 + v 1 = 1) :
    isoperimetricProfile (gaussianWeight E) 2 v =
      ENNReal.ofReal (gaussianIsoperimetricProfile (v 0)) := by
  sorry

/-- **Minimizing `2`-clusters are simplicial** (§7.4). For `n ≥ 1`, a Gaussian `2`-cluster whose
cells both have positive measure attains the profile exactly when its cells agree almost
everywhere with two complementary open half-spaces (MilmanNeeman2022, Theorem 1.2 for
`q = 2`). -/
theorem Cluster.perimeter_eq_iff_halfSpaces [Nontrivial E] (Ω : Cluster (gaussianWeight E) 2)
    (h0 : 0 < stdGaussian E (Ω.cell 0)) (h1 : 0 < stdGaussian E (Ω.cell 1)) :
    Ω.perimeter = ENNReal.ofReal (gaussianIsoperimetricProfile (stdGaussian E (Ω.cell 0)).toReal) ↔
      ∃ ν : E, ‖ν‖ = 1 ∧ ∃ s : ℝ, Ω.cell 0 =ᵐ[volume] {x | ⟪x, ν⟫ < s} ∧
        Ω.cell 1 =ᵐ[volume] {x | s < ⟪x, ν⟫} := by
  sorry

/-! ## Layer 8: integrated, functional and concentration forms -/

/-- **The Borell–Sudakov–Tsirelson inequality** (§8.1). For every set `A ⊆ E` (its Gaussian
measure being the outer measure), every real `a` with `Φ(a) ≤ γ(A)` and every `r > 0`, the open
`r`-thickening of `A` has Gaussian measure at least `Φ(a + r)` (Borell1975, Theorem 3.1;
SudakovTsirelson1974, Theorem 1; Ledoux1999, (1.5); Ehrhard1983, Théorème 2.4). -/
theorem borell_sudakov_tsirelson (A : Set E) {a : ℝ}
    (ha : ENNReal.ofReal (cdf (gaussianReal 0 1) a) ≤ stdGaussian E A) {r : ℝ} (hr : 0 < r) :
    ENNReal.ofReal (cdf (gaussianReal 0 1) (a + r)) ≤ stdGaussian E (thickening r A) := by
  sorry

/-- **The Borell–Sudakov–Tsirelson inequality for Gaussian laws on a Euclidean space** (§8.1).
For the law `multivariateGaussian m S` with `K = √S`, every set `A`, every real `a` with
`Φ(a) ≤ γ_{m,S}(A)` and every `r > 0`, the enlargement `A + r K(ball(0, 1))` has measure at least
`Φ(a + r)` (Ledoux1999, (1.7), for centred laws; the mean `m` is a translation). -/
theorem borell_sudakov_tsirelson_multivariateGaussian {ι : Type*} [Fintype ι] [DecidableEq ι]
    (m : EuclideanSpace ℝ ι) (S : Matrix ι ι ℝ) (A : Set (EuclideanSpace ℝ ι)) {a : ℝ}
    (ha : ENNReal.ofReal (cdf (gaussianReal 0 1) a) ≤ multivariateGaussian m S A) {r : ℝ}
    (hr : 0 < r) :
    ENNReal.ofReal (cdf (gaussianReal 0 1) (a + r)) ≤
      multivariateGaussian m S
        (A + (fun y => r • Matrix.toEuclideanCLM (𝕜 := ℝ) (CFC.sqrt S) y) '' ball 0 1) := by
  sorry

/-- **The Minkowski-content form** (§8.2). For every `A ⊆ E` (its Gaussian measure being the outer
measure), the lower Minkowski content of `A` for `γ` is at least `I(γ(A))`:
`liminf_{r → 0⁺} (γ(A_r) − γ(A))/r ≥ I(γ(A))` with `A_r` the open `r`-thickening, which contains `A`
for `r > 0` (Ledoux1999, (1.3)–(1.4)). -/
theorem gaussian_minkowskiContent_ge (A : Set E) :
    ENNReal.ofReal (gaussianIsoperimetricProfile (stdGaussian E A).toReal) ≤
      liminf (fun r : ℝ => (stdGaussian E (thickening r A) - stdGaussian E A) /
        ENNReal.ofReal r) (𝓝[>] 0) := by
  sorry

/-- **Bobkov's inequality** (§8.3). For every locally Lipschitz `f : E → [0, 1]`,
`I(∫ f dγ) ≤ ∫ √(I(f)² + ‖∇f‖²) dγ` (Bobkov1997, Corollary 1, inequality (10); Ledoux1999,
(1.11)). -/
theorem bobkov_inequality {f : E → ℝ} (hf : LocallyLipschitz f) (hf01 : ∀ x, f x ∈ Icc 0 1) :
    ENNReal.ofReal (gaussianIsoperimetricProfile (∫ x, f x ∂stdGaussian E)) ≤
      ∫⁻ x, ENNReal.ofReal
        (Real.sqrt (gaussianIsoperimetricProfile (f x) ^ 2 + ‖fderiv ℝ f x‖ ^ 2))
        ∂stdGaussian E := by
  sorry

/-- **Concentration of Lipschitz functions about a median** (§8.4). For an `L`-Lipschitz
`f : E → ℝ` and a real `m` with `γ({f ≤ m}) ≥ 1/2`, `γ({f > m + L r}) ≤ 1 − Φ(r)` for every
`r ≥ 0` (Ledoux1993, inequality (10); Ledoux1999, (1.6), stated there for sets and applied to
`{f ≤ m}`). -/
theorem gaussian_concentration_median {L : ℝ≥0} {f : E → ℝ} (hf : LipschitzWith L f) {m : ℝ}
    (hm : 2⁻¹ ≤ stdGaussian E {x | f x ≤ m}) {r : ℝ} (hr : 0 ≤ r) :
    stdGaussian E {x | m + L * r < f x} ≤ ENNReal.ofReal (1 - cdf (gaussianReal 0 1) r) := by
  sorry

/-- **Concentration of the maximum of a Gaussian vector about a median** (§8.5). For a nonempty
finite `ι`, a square matrix `S`, `σ = max_i √(S_ii)` and a real `m` with
`γ_{0,S}({max_i x_i ≤ m}) ≥ 1/2`, `γ_{0,S}({max_i x_i > m + σ r}) ≤ 1 − Φ(r)` for every `r ≥ 0`
(Ledoux1999, the derivation of (1.8) from (1.7) with `a = 0`; (1.8) itself states only the weaker
tail `e^{−r²/2}`). -/
theorem gaussian_max_concentration {ι : Type*} [Fintype ι] [DecidableEq ι] [Nonempty ι]
    (S : Matrix ι ι ℝ) {m : ℝ} (hm : 2⁻¹ ≤ multivariateGaussian 0 S {x | ∀ i, x i ≤ m})
    {r : ℝ} (hr : 0 ≤ r) :
    multivariateGaussian 0 S {x | ∃ i, m + (⨆ j, Real.sqrt (S j j)) * r < x i} ≤
      ENNReal.ofReal (1 - cdf (gaussianReal 0 1) r) := by
  sorry

/-! ## Layer 9: Gaussian symmetrisation of closed sets and Ehrhard's inequality -/

/-- The **closed Gaussian symmetral** `S̄_{F,u}(C)`: the points `x` with `Φ(⟨x, u⟩) ≤ γ_F(C_x)`,
`C_x` the section of `C` over the projection of `x` to `F^⊥`. For closed `C` it is closed and has
the Gaussian measure of `C` (Ehrhard1983, Définition 1.1, in the mirrored superlevel
convention). -/
noncomputable def closedGaussianSymmetral (F : Submodule ℝ E) (u : E) (C : Set E) : Set E :=
  {x | cdf (gaussianReal 0 1) ⟪x, u⟫ ≤
    (stdGaussian F {y : F | x - F.starProjection x + (y : E) ∈ C}).toReal}

/-- **Ehrhard's inequality for convex sets** (§9.5). For convex `A, B ⊆ E`, `0 ≤ θ ≤ 1` and reals
`a, b` with `Φ(a) ≤ γ(A)` and `Φ(b) ≤ γ(B)`, `γ(θA + (1 − θ)B) ≥ Φ(θa + (1 − θ)b)`; equivalently
`Φ⁻¹ ∘ γ` is concave along Minkowski combinations of convex sets (Ehrhard1983, Théorème 3.2). -/
theorem ehrhard_inequality_convex {A B : Set E} (hA : Convex ℝ A) (hB : Convex ℝ B) {θ : ℝ}
    (hθ₀ : 0 ≤ θ) (hθ₁ : θ ≤ 1) {a b : ℝ}
    (ha : ENNReal.ofReal (cdf (gaussianReal 0 1) a) ≤ stdGaussian E A)
    (hb : ENNReal.ofReal (cdf (gaussianReal 0 1) b) ≤ stdGaussian E B) :
    ENNReal.ofReal (cdf (gaussianReal 0 1) (θ * a + (1 - θ) * b)) ≤
      stdGaussian E (θ • A + (1 - θ) • B) := by
  sorry

/-- **Gaussian symmetrisation preserves convexity** (§9.5). For a subspace `F`, a unit vector
`u ∈ F` and a convex `C ⊆ E`, with no topological assumption, the closed Gaussian symmetral
`S̄_{F,u}(C)` is convex (Ehrhard1983, Théorème 3.1, for closed `C`; the general case follows from
Ehrhard's inequality in `F` applied to the sections of `C`). -/
theorem convex_closedGaussianSymmetral {F : Submodule ℝ E} {u : E} (hu : u ∈ F) (hu1 : ‖u‖ = 1)
    {C : Set E} (hconv : Convex ℝ C) :
    Convex ℝ (closedGaussianSymmetral F u C) := by
  sorry

end Symmetrisation

end TauCetiRoadmap.GaussianIsoperimetryAndClusters
