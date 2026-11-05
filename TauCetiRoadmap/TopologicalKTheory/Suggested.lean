import Mathlib
import TauCeti.RingTheory.PowerSeries.Log
import TauCeti.CategoryTheory.GrothendieckGroup.Monoidal.Basic

/-!
# Topological K-theory: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against the pinned
Mathlib and Tau Ceti, those targets of the roadmap that are statable now, each with
`sorry` as a mathematical target, together with the few definitions they need.

The roadmap's headline theorems are not statable at the pins, and nothing is stated in
their place:

* complex Bott periodicity `K(X) ⊕ K(X) ≃ K(X × S²)` and the sphere ring
  `K(S²) ≃ ℤ[β]/(β²)` (T4): the pinned libraries have no K-group of a space, since the
  category of finite-rank vector bundles over a space, whose `TauCeti.SplitK0` would be
  that group, does not exist at the pins;
* the complex Thom isomorphism (T5.3): no K-group and no Thom class of a vector bundle;
* the equivariant Thom isomorphism and the representation Bott theorem
  `R(G) ≃ K_(G,c)(V)` (T6): no equivariant K-group of a `G`-space;
* real Bott periodicity with coefficient ring `ℤ[η,a,b,b⁻¹]/(2η,η³,ηa,a²−4b)` (T7.1):
  no KO-group of a space.

What is stated: the small cocycle model of a variable-rank bundle and the K-group carrier
of a bundle category (T1), the finite trivial embedding over a compact base (T1.3), the
finite Grassmannian carrier with its frame-span topology (T1.5), the finite-subset gap
colouring of a partition of unity (T1.6a), the integral λ-series Adams values (T2.5),
relative symbols (T3) and the spectral projection of a finite matrix family (T4.4).
-/

noncomputable section
open Topology
open scoped Matrix.Norms.Operator
namespace TauCetiRoadmap.TopologicalKTheory

universe u v

/-! ## T1: continuous finite-rank bundles as a category -/

/-- A small variable-rank atlas using the existing cocycle construction: a locally
constant rank and, on each rank stratum, a `VectorBundleCore` indexed by the points of
the stratum. T1 proves its comparison with arbitrary topological-module fibre
universes. -/
structure FiniteRankAtlas (X : Type u) [TopologicalSpace X] where
  rank : LocallyConstant X ℕ
  charts : ∀ n : ℕ, VectorBundleCore ℂ {x : X // rank x = n} (Fin n → ℂ)
    {x : X // rank x = n}

section Presentation
open CategoryTheory CategoryTheory.Limits

/-- The K-group carrier of a bundle category: T1 supplies the genuine bundle category,
Whitney biproducts and essential smallness, and the K-group is the existing split
presentation `TauCeti.SplitK0`, with no arbitrary sum operation or new relation
engine. -/
abbrev BundleCategoryK0 (C : Type*) [Category C] [HasZeroMorphisms C]
    [HasBinaryBiproducts C] [EssentiallySmall.{u} C] : Type u :=
  TauCeti.SplitK0.{u} C

/-- The monoidal and braided hypotheses on the bundle category give the K-ring
structure on the same carrier. -/
example {C : Type*} [Category C] [Preadditive C] [HasZeroObject C]
    [HasBinaryBiproducts C] [EssentiallySmall.{u} C] [MonoidalCategory C]
    [MonoidalPreadditive C] [BraidedCategory C] : CommRing (BundleCategoryK0 C) :=
  inferInstance
end Presentation

/-! ## T1.3: finite trivial embedding over a compact base -/

section FiniteEmbedding
variable {X : Type u} [TopologicalSpace X]
  {F₁ : Type v} [NormedAddCommGroup F₁] [NormedSpace ℂ F₁]
  {E₁ : X → Type v}
  [∀ x, AddCommGroup (E₁ x)] [∀ x, Module ℂ (E₁ x)]
  [∀ x, TopologicalSpace (E₁ x)] [∀ x, IsTopologicalAddGroup (E₁ x)]
  [∀ x, ContinuousSMul ℂ (E₁ x)]
  [TopologicalSpace (Bundle.TotalSpace F₁ E₁)]
  [FiberBundle F₁ E₁] [VectorBundle ℂ F₁ E₁]

/-- Every finite-rank complex vector bundle over a compact Hausdorff base embeds, by a
continuous fibrewise injective linear map, into one finite trivial bundle: the
fibrewise injection constructed in the proof of Hatcher, Vector Bundles and K-Theory,
Proposition 1.4, p. 13, whose complement statement T1.3 derives from it. -/
theorem exists_finite_trivial_embedding [CompactSpace X] [T2Space X]
    [FiniteDimensional ℂ F₁] :
    ∃ (N : ℕ) (j : ∀ x, E₁ x →L[ℂ] (Fin N → ℂ)),
      Continuous (fun p : Bundle.TotalSpace F₁ E₁ ↦ (p.proj, j p.proj p.2)) ∧
      ∀ x, Function.Injective (j x) := by
  sorry
end FiniteEmbedding

/-! ## T1.5: the single finite real/complex Grassmannian and frame-span topology -/

/-- The finite Grassmannian of `r`-dimensional subspaces of `𝕜^N`, as the subtype of
`Submodule 𝕜 (Fin N → 𝕜)` cut out by `finrank = r`. The comparison with Mathlib's
`Module.Grassmannian`, whose convention fixes the rank of the quotient, is a README
target of T1.5. -/
abbrev finiteGrassmannian (𝕜 : Type*) [RCLike 𝕜] (r N : ℕ) :=
  {V : Submodule 𝕜 (Fin N → 𝕜) // Module.finrank 𝕜 V = r}

/-- Full-rank frames: linearly independent `r`-tuples of vectors of `𝕜^N`, with the
coordinate topology inherited from `Fin r → (Fin N → 𝕜)`. -/
abbrev finiteFullRankFrame (𝕜 : Type*) [RCLike 𝕜] (r N : ℕ) :=
  {f : Fin r → (Fin N → 𝕜) // LinearIndependent 𝕜 f}

/-- The span of a full-rank frame, with its dimension `r` computed from linear
independence. -/
def finiteGrassmannianFrameSpan (𝕜 : Type*) [RCLike 𝕜] (r N : ℕ)
    (f : finiteFullRankFrame 𝕜 r N) : finiteGrassmannian 𝕜 r N :=
  ⟨Submodule.span 𝕜 (Set.range f.1), by rw [finrank_span_eq_card f.2]; simp⟩

/-- The topology of the finite Grassmannian: the quotient topology of the frame-span map
from the space of full-rank frames. -/
instance finiteGrassmannianTopology (𝕜 : Type*) [RCLike 𝕜] (r N : ℕ) :
    TopologicalSpace (finiteGrassmannian 𝕜 r N) :=
  TopologicalSpace.coinduced (finiteGrassmannianFrameSpan 𝕜 r N) inferInstance

/-- Every `r`-dimensional subspace of `𝕜^N` is the span of a full-rank frame, so the
frame-span map is surjective and the coinduced topology is a quotient topology. -/
theorem finiteGrassmannianFrameSpan_surjective (𝕜 : Type*) [RCLike 𝕜] (r N : ℕ) :
    Function.Surjective (finiteGrassmannianFrameSpan 𝕜 r N) := by
  sorry

/-- Orthonormal frames: `r`-tuples of vectors of `𝕜^N` orthonormal for the Euclidean
coordinate inner product, transported through `WithLp.toLp 2`, not the sup norm. -/
abbrev finiteOrthonormalFrame (𝕜 : Type*) [RCLike 𝕜] (r N : ℕ) :=
  {f : Fin r → (Fin N → 𝕜) // Orthonormal 𝕜 (fun j => WithLp.toLp 2 (f j))}

/-- The span of an orthonormal frame, with its dimension `r` computed from the linear
independence that orthonormality gives. -/
def finiteGrassmannianOrthonormalSpan (𝕜 : Type*) [RCLike 𝕜] (r N : ℕ)
    (f : finiteOrthonormalFrame 𝕜 r N) : finiteGrassmannian 𝕜 r N :=
  ⟨Submodule.span 𝕜 (Set.range f.1), by
    have h : LinearIndependent 𝕜 f.1 :=
      LinearIndependent.of_comp (WithLp.linearEquiv 2 𝕜 (Fin N → 𝕜)).symm.toLinearMap
        f.2.linearIndependent
    rw [finrank_span_eq_card h]; simp⟩

/-- Gram–Schmidt: the orthonormal-frame span map is a quotient map for the same
frame-span topology, so the Grassmannian is also the quotient of the compact space of
orthonormal frames. -/
theorem finiteGrassmannianOrthonormalSpan_isQuotientMap
    (𝕜 : Type*) [RCLike 𝕜] (r N : ℕ) :
    Topology.IsQuotientMap (finiteGrassmannianOrthonormalSpan 𝕜 r N) := by
  sorry

/-! ## T1.6a: the finite-subset gap colouring of a partition of unity -/

section NumerableClassifierColours
variable {X : Type u} [TopologicalSpace X] {ι : Type v}

/-- The finite-subset gap `q_E = max(0, min_{j∈E} t_j − sup_{j∉E} t_j)` of a native
partition of unity `(t_j)`. Empty `E` has zero gap, and an empty complement of `E` has
supremum zero. -/
noncomputable def partitionGap (P : PartitionOfUnity ι X Set.univ)
    (E : Finset ι) (x : X) : ℝ := by
  classical
  exact if hE : E.Nonempty then
    max 0 (sInf (Set.range fun i : {j // j ∈ E} => P i.1 x) -
      if hOutside : ∃ j, j ∉ E then
        sSup (Set.range fun i : {j // j ∉ E} => P i.1 x)
      else 0)
  else 0

/-- Local finiteness of the partition reduces each gap near a point to finite continuous
minima and maxima, including the zero outside value, so each gap is continuous. -/
theorem continuous_partitionGap (P : PartitionOfUnity ι X Set.univ)
    (E : Finset ι) : Continuous (partitionGap P E) := by
  sorry

/-- At a point, only subsets of the finite active chart family can have nonzero gap:
the support of `E ↦ q_E(x)` is finite even when `ι` is uncountable. -/
theorem finite_support_partitionGap (P : PartitionOfUnity ι X Set.univ) (x : X) :
    (Function.support (fun E : Finset ι => partitionGap P E x)).Finite := by
  sorry

/-- The colour weight of size `n+1`: `(n+1)` times the sum of the gaps of the subsets of
cardinality `n+1`. Native `finsum` is used; finite support, not an extra summability
hypothesis, controls it. -/
noncomputable def prescribedPartitionColourWeight
    (P : PartitionOfUnity ι X Set.univ) (n : ℕ) (x : X) : ℝ :=
  (n + 1 : ℝ) * ∑ᶠ E : {F : Finset ι // F.card = n + 1}, partitionGap P E.1 x

/-- The sorted positive-weight gap identity `Σ_E |E| q_E(x) = 1`, including ties and
zero entries: sorting the active weights `a₁ ≥ ⋯ ≥ a_m > 0`, only the top-`n` initial
segments have positive gap `a_n − a_(n+1)`, and the weighted sum telescopes. -/
theorem sum_card_mul_partitionGap (P : PartitionOfUnity ι X Set.univ) (x : X) :
    (∑ᶠ E : Finset ι, (E.card : ℝ) * partitionGap P E x) = 1 := by
  sorry

/-- Original chart subordination is retained wherever a gap is positive: a positive gap
of `E` at `x` puts `x` in every chart of `E`. No subordination of an output weight to its
own positive set is assumed. -/
theorem partitionGap_pos_imp_chart_mem
    (P : PartitionOfUnity ι X Set.univ) (U : ι → Set X)
    (hsub : P.IsSubordinate U) (E : Finset ι) (x : X)
    (hgap : 0 < partitionGap P E x) : ∀ i ∈ E, x ∈ U i := by
  sorry

/-- A native countable partition of unity whose weights are the prescribed colour
weights. Continuity, nonnegativity, finite-sum normalization and local finiteness are
the fields of `PartitionOfUnity`, not a parallel partition record. -/
structure CountablePartitionColouring (P : PartitionOfUnity ι X Set.univ) where
  partition : PartitionOfUnity ℕ X Set.univ
  weight_eq : ∀ n x, partition n x = prescribedPartitionColourWeight P n x

/-- The finite-subset gap construction on the native carrier: every partition of unity,
with no countability assumption on `ι` and no separation axiom, has a countable
colouring. -/
theorem countablePartitionColouring (P : PartitionOfUnity ι X Set.univ) :
    Nonempty (CountablePartitionColouring P) := by
  sorry
end NumerableClassifierColours

/-! ## T2.5: integral Adams values of a λ-series -/

/-- The integral logarithmic-derivative coefficient of a unit λ-series: index `n` gives
`ψ^(n+1)` through `Σ_(k≥1) (−1)^(k−1) ψᵏ t^(k−1) = λ'_t · λ_t⁻¹`; no rational logarithm
or division is involved. -/
def adamsValueOfLambdaSeries {R : Type*} [CommRing R]
    (lambdaSeries : (PowerSeries R)ˣ) (n : ℕ) : R :=
  (-1 : R) ^ n * PowerSeries.coeff n
    (PowerSeries.derivative (lambdaSeries : PowerSeries R) *
      (↑(lambdaSeries⁻¹) : PowerSeries R))

/-- The signed derivative coefficient is additive on products of unit series, which is
the additivity of the Adams operations under the exterior-power sum law. T2.5 compares
it with the integral Newton definition. -/
theorem adamsValueOfLambdaSeries_mul {R : Type*} [CommRing R]
    (a b : (PowerSeries R)ˣ) (n : ℕ) :
    adamsValueOfLambdaSeries (a * b) n =
      adamsValueOfLambdaSeries a n + adamsValueOfLambdaSeries b n := by
  have hd : PowerSeries.derivative ((a : PowerSeries R) * (b : PowerSeries R)) *
      (((↑(b⁻¹) : PowerSeries R) : PowerSeries R) * (↑(a⁻¹) : PowerSeries R)) =
      PowerSeries.derivative (a : PowerSeries R) * (↑(a⁻¹) : PowerSeries R) +
        PowerSeries.derivative (b : PowerSeries R) * (↑(b⁻¹) : PowerSeries R) := by
    simp only [Derivation.leibniz, smul_eq_mul]
    calc
      _ = (PowerSeries.derivative (a : PowerSeries R) * (↑(a⁻¹) : PowerSeries R)) *
          ((b : PowerSeries R) * (↑(b⁻¹) : PowerSeries R)) +
        (PowerSeries.derivative (b : PowerSeries R) * (↑(b⁻¹) : PowerSeries R)) *
          ((a : PowerSeries R) * (↑(a⁻¹) : PowerSeries R)) := by ring
      _ = _ := by simp
  unfold adamsValueOfLambdaSeries
  simp only [mul_inv_rev, Units.val_mul]
  rw [hd, map_add, mul_add]

/-- On a `ℚ`-algebra the integral unit-derivative expression agrees with Tau Ceti's
rational logarithmic derivative `PowerSeries.logDeriv` of a constant-coefficient-one
series. -/
theorem adamsValueOfLambdaSeries_eq_coeff_logDeriv
    {A : Type*} [CommRing A] [Algebra ℚ A]
    (a : (PowerSeries A)ˣ) (ha : PowerSeries.constantCoeff (a : PowerSeries A) = 1)
    (n : ℕ) :
    adamsValueOfLambdaSeries a n =
      (-1 : A) ^ n * PowerSeries.coeff n (PowerSeries.logDeriv (a : PowerSeries A)) := by
  unfold adamsValueOfLambdaSeries
  have hd := PowerSeries.logDeriv_mul (a : PowerSeries A) ha
  have h := congrArg (fun f : PowerSeries A => f * ↑(a⁻¹)) hd
  simpa [mul_assoc] using congrArg
    (fun f : PowerSeries A => (-1 : A) ^ n * PowerSeries.coeff n f) h.symm

/-! ## T3: relative symbols -/

section RelativeSymbols
variable {X : Type u} [TopologicalSpace X]
  {F₁ F₂ : Type v} [NormedAddCommGroup F₁] [NormedSpace ℂ F₁]
  [NormedAddCommGroup F₂] [NormedSpace ℂ F₂]
  {E₁ E₂ : X → Type v}
  [∀ x, AddCommGroup (E₁ x)] [∀ x, Module ℂ (E₁ x)]
  [∀ x, TopologicalSpace (E₁ x)] [∀ x, IsTopologicalAddGroup (E₁ x)]
  [∀ x, ContinuousSMul ℂ (E₁ x)]
  [∀ x, AddCommGroup (E₂ x)] [∀ x, Module ℂ (E₂ x)]
  [∀ x, TopologicalSpace (E₂ x)] [∀ x, IsTopologicalAddGroup (E₂ x)]
  [∀ x, ContinuousSMul ℂ (E₂ x)]
  [TopologicalSpace (Bundle.TotalSpace F₁ E₁)]
  [TopologicalSpace (Bundle.TotalSpace F₂ E₂)]

/-- A relative symbol on the pair `(X, Y)`: a global bundle morphism `E₁ → E₂`,
continuous on total spaces and linear on fibres, invertible over `Y`. T3 constructs the
extension/comparison with maps defined only on `Y`. -/
structure RelativeSymbol (Y : Set X)
    [finiteDimensionalSource : FiniteDimensional ℂ F₁]
    [finiteDimensionalTarget : FiniteDimensional ℂ F₂]
    [sourceBundle : FiberBundle F₁ E₁]
    [targetBundle : FiberBundle F₂ E₂]
    [sourceVectorBundle : VectorBundle ℂ F₁ E₁]
    [targetVectorBundle : VectorBundle ℂ F₂ E₂] where
  toLinear : ∀ x, E₁ x →L[ℂ] E₂ x
  continuous_total : Continuous (fun p : Bundle.TotalSpace F₁ E₁ ↦
    (⟨p.proj, toLinear p.proj p.2⟩ : Bundle.TotalSpace F₂ E₂))
  invertible_on : ∀ x ∈ Y, Function.Bijective (toLinear x)
end RelativeSymbols

/-! ## T4.4: spectral splitting of a finite matrix family -/

section SpectralSplitting
variable {X : Type*} [TopologicalSpace X] [CompactSpace X] {n : ℕ}

/-- The spectral projection of a continuous family of finite matrices with no eigenvalue
on the unit circle: a continuous idempotent family commuting with `B`, equal to the
identity on the generalized eigenvectors of eigenvalues inside the circle and to zero on
those outside. The matrices are not assumed self-adjoint; the generalized-eigenvector
condition fixes which spectral subspace is selected, in addition to idempotence. -/
theorem exists_continuous_inside_projection (B : C(X, Matrix (Fin n) (Fin n) ℂ))
    (hcircle : ∀ (x : X) (z : ℂ), ‖z‖ = 1 → IsUnit (z • (1 : Matrix (Fin n) (Fin n) ℂ) - B x)) :
    ∃ P : C(X, Matrix (Fin n) (Fin n) ℂ),
      (∀ x, P x * P x = P x) ∧
      (∀ x, P x * B x = B x * P x) ∧
      ∀ (x : X) (z : ℂ) (k : ℕ) (v : Fin n → ℂ),
        Matrix.mulVec ((B x - z • (1 : Matrix (Fin n) (Fin n) ℂ)) ^ k) v = 0 →
          Matrix.mulVec (P x) v = if ‖z‖ < 1 then v else 0 := by
  sorry
end SpectralSplitting

end TauCetiRoadmap.TopologicalKTheory
