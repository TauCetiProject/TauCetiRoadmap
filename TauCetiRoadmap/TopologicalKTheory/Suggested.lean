module

public import Mathlib

/-!
# Topological K-theory of vector bundles: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems that are statable against the pinned Mathlib and Tau Ceti, each with `sorry`, with the
few definitions they need: the finite Grassmannian carrier and its frame-span topology (T1.5),
the finite-subset gap weights of a partition of unity (T1.6a), and the relative-symbol record
(T3.1). The finite-rank atlas (T1.1) and the split K-group carrier (T2.0) are README targets:
no headline stated here mentions them.

Not statable at the pins, and therefore not stated here:
complex Bott periodicity `K(X)⊕K(X)≃K(X×S²)` (T4) and the Thom isomorphism `K_c(X)≃K_c(E)`
(T5.3), which need the K-group of the finite-rank bundle category over a base, the carrier
T1–T2 construct; representation Bott `R(G)≃K_(G,c)(V)` (T6.7), which needs the equivariant
bundle category and its K-group; real periodicity with the coefficient ring
`ℤ[η,a,b,b⁻¹]/(2η,η³,ηa,a²−4b)` (T7.1), which needs the KO carrier and its graded theory; and
numerable `BU(n)`/`BO(n)` classification (T1.6a), which needs the stable Grassmannian colimit
carriers `Gr_k∞(𝕜)`, `BO` and `BU`.
-/

@[expose] public section

noncomputable section
open Topology
open scoped Matrix.Norms.Operator
namespace TauCetiRoadmap.TopologicalKTheory

universe u v

section NumerableClassifierColours
variable {X : Type u} [TopologicalSpace X] {ι : Type v}

/-- The finite-subset gap of a native partition of unity. Empty `E` has
zero gap, and an empty outside index set has supremum zero. -/
noncomputable def partitionGap (P : PartitionOfUnity ι X Set.univ)
    (E : Finset ι) (x : X) : ℝ := by
  classical
  exact if hE : E.Nonempty then
    max 0 (sInf (Set.range fun i : {j // j ∈ E} => P i.1 x) -
      if hOutside : ∃ j, j ∉ E then
        sSup (Set.range fun i : {j // j ∉ E} => P i.1 x)
      else 0)
  else 0

/-- Local finiteness of the input reduces each gap to finite continuous
minima and maxima, including the zero outside value. -/
theorem continuous_partitionGap (P : PartitionOfUnity ι X Set.univ)
    (E : Finset ι) : Continuous (partitionGap P E) := by
  sorry

/-- At a point, only subsets of the finite active chart family can have
nonzero gap. This is finite support even when `ι` is uncountable. -/
theorem finite_support_partitionGap (P : PartitionOfUnity ι X Set.univ) (x : X) :
    (Function.support (fun E : Finset ι => partitionGap P E x)).Finite := by
  sorry

/-- The prescribed colour indexed by `n : ℕ` has size `n+1`. Native `finsum`
is used; finite support, not an extra summability hypothesis, controls it. -/
noncomputable def prescribedPartitionColourWeight
    (P : PartitionOfUnity ι X Set.univ) (n : ℕ) (x : X) : ℝ :=
  (n + 1 : ℝ) * ∑ᶠ E : {F : Finset ι // F.card = n + 1}, partitionGap P E.1 x

/-- The sorted positive-weight gap identity, including ties and zero entries. -/
theorem sum_card_mul_partitionGap (P : PartitionOfUnity ι X Set.univ) (x : X) :
    (∑ᶠ E : Finset ι, (E.card : ℝ) * partitionGap P E x) = 1 := by
  sorry

/-- Original native chart subordination is retained wherever a gap is positive.
No subordination of an output weight to its own positive set is assumed. -/
theorem partitionGap_pos_imp_chart_mem
    (P : PartitionOfUnity ι X Set.univ) (U : ι → Set X)
    (hsub : P.IsSubordinate U) (E : Finset ι) (x : X)
    (hgap : 0 < partitionGap P E x) : ∀ i ∈ E, x ∈ U i := by
  sorry

/-- A native countable partition with the prescribed finite-subset gap formula.
Continuity, nonnegativity, finite-sum normalization and local finiteness are the
fields of `PartitionOfUnity`, not a parallel partition record. -/
structure CountablePartitionColouring (P : PartitionOfUnity ι X Set.univ) where
  partition : PartitionOfUnity ℕ X Set.univ
  weight_eq : ∀ n x, partition n x = prescribedPartitionColourWeight P n x

/-- The finite-subset gap construction on the native carrier. It needs no
countability assumption on `ι` and no separation axiom once `P` is supplied. -/
theorem countablePartitionColouring (P : PartitionOfUnity ι X Set.univ) :
    Nonempty (CountablePartitionColouring P) := by
  sorry
end NumerableClassifierColours

section Bundles
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
  [FiberBundle F₁ E₁] [FiberBundle F₂ E₂]
  [VectorBundle ℂ F₁ E₁] [VectorBundle ℂ F₂ E₂]

/-- A relative symbol represented by a global morphism invertible on the relative set.
T3 also constructs the extension/comparison with maps initially defined only on Y. -/
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

/-- A compact base permits one finite trivial embedding, with fibre injectivity. -/
theorem exists_finite_trivial_embedding [CompactSpace X] [T2Space X]
    [FiniteDimensional ℂ F₁] :
    ∃ (N : ℕ) (j : ∀ x, E₁ x →L[ℂ] (Fin N → ℂ)),
      Continuous (fun p : Bundle.TotalSpace F₁ E₁ ↦ (p.proj, j p.proj p.2)) ∧
      ∀ x, Function.Injective (j x) := by
  sorry
end Bundles

section SpectralSplitting
variable {X : Type*} [TopologicalSpace X] [CompactSpace X] {n : ℕ}

/-- The actual spectral projection for an arbitrary finite matrix family.
This does not assume the matrices are self-adjoint. The generalized-eigenvector
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

/-- Uniform Laurent approximation preserves invertibility along the straight segment. -/
theorem isUnit_segment_of_uniform_inverse_bound
    (u : (Matrix (Fin n) (Fin n) ℂ)ˣ) (B : Matrix (Fin n) (Fin n) ℂ)
    (hsmall : ‖(↑(u⁻¹) : Matrix (Fin n) (Fin n) ℂ) * (B - ↑u)‖ < 1)
    (t : unitInterval) :
    IsUnit ((1 - (t : ℝ)) • (↑u : Matrix (Fin n) (Fin n) ℂ) + (t : ℝ) • B) := by
  sorry
end SpectralSplitting

/-! ### T1.5: the single finite real/complex Grassmannian and frame-span topology -/

abbrev finiteGrassmannian (𝕜 : Type*) [RCLike 𝕜] (r N : ℕ) :=
  {V : Submodule 𝕜 (Fin N → 𝕜) // Module.finrank 𝕜 V = r}

abbrev finiteFullRankFrame (𝕜 : Type*) [RCLike 𝕜] (r N : ℕ) :=
  {f : Fin r → (Fin N → 𝕜) // LinearIndependent 𝕜 f}

/-- Span of the actual coordinate columns, with its dimension proved from independence. -/
def finiteGrassmannianFrameSpan (𝕜 : Type*) [RCLike 𝕜] (r N : ℕ)
    (f : finiteFullRankFrame 𝕜 r N) : finiteGrassmannian 𝕜 r N :=
  ⟨Submodule.span 𝕜 (Set.range f.1), by rw [finrank_span_eq_card f.2]; simp⟩

instance finiteGrassmannianTopology (𝕜 : Type*) [RCLike 𝕜] (r N : ℕ) :
    TopologicalSpace (finiteGrassmannian 𝕜 r N) :=
  TopologicalSpace.coinduced (finiteGrassmannianFrameSpan 𝕜 r N) inferInstance

theorem finiteGrassmannianFrameSpan_surjective (𝕜 : Type*) [RCLike 𝕜] (r N : ℕ) :
    Function.Surjective (finiteGrassmannianFrameSpan 𝕜 r N) := by
  sorry

/-- Orthonormality uses the native Euclidean coordinate inner product, not the sup norm. -/
abbrev finiteOrthonormalFrame (𝕜 : Type*) [RCLike 𝕜] (r N : ℕ) :=
  {f : Fin r → (Fin N → 𝕜) // Orthonormal 𝕜 (fun j => WithLp.toLp 2 (f j))}

/-- Span of an orthonormal frame; its dimension comes from the independence of the
orthonormal family, transported along the coordinate identification `WithLp.linearEquiv`. -/
def finiteGrassmannianOrthonormalSpan (𝕜 : Type*) [RCLike 𝕜] (r N : ℕ)
    (f : finiteOrthonormalFrame 𝕜 r N) : finiteGrassmannian 𝕜 r N :=
  ⟨Submodule.span 𝕜 (Set.range f.1), by
    have h : LinearIndependent 𝕜 f.1 :=
      LinearIndependent.of_comp (WithLp.linearEquiv 2 𝕜 (Fin N → 𝕜)).symm.toLinearMap
        f.2.linearIndependent
    rw [finrank_span_eq_card h]; simp⟩

/-- Gram–Schmidt compares this quotient with the same full-rank-frame span topology. -/
theorem finiteGrassmannianOrthonormalSpan_isQuotientMap
    (𝕜 : Type*) [RCLike 𝕜] (r N : ℕ) :
    Topology.IsQuotientMap (finiteGrassmannianOrthonormalSpan 𝕜 r N) := by
  sorry

/-- Field subspaces recover Mathlib's quotient-rank convention on the same submodule: a
subspace of dimension `r` of `𝕜^N` has quotient of dimension `N − r`, which is free, hence
finite and projective with constant rank at every prime of the field. -/
def finiteGrassmannianQuotientConventionEquiv (𝕜 : Type*) [RCLike 𝕜]
    (r N : ℕ) (hr : r ≤ N) :
    finiteGrassmannian 𝕜 r N ≃ Module.Grassmannian 𝕜 (Fin N → 𝕜) (N - r) where
  toFun V :=
    { toSubmodule := V.1
      finite_quotient := inferInstance
      projective_quotient := inferInstance
      rankAtStalk_eq := fun p => by
        have h := Submodule.finrank_quotient_add_finrank V.1
        rw [V.2, Module.finrank_fin_fun] at h
        simp only [Module.rankAtStalk_eq_finrank_of_free, Pi.natCast_apply, Nat.cast_id]
        omega }
  invFun W := ⟨W.toSubmodule, by
    have h := Submodule.finrank_quotient_add_finrank W.toSubmodule
    have h2 := W.rankAtStalk_eq (Classical.arbitrary (PrimeSpectrum 𝕜))
    simp only [Module.rankAtStalk_eq_finrank_of_free, Pi.natCast_apply, Nat.cast_id] at h2
    rw [Module.finrank_fin_fun] at h
    omega⟩
  left_inv V := Subtype.ext rfl
  right_inv W := Module.Grassmannian.ext rfl

end TauCetiRoadmap.TopologicalKTheory
