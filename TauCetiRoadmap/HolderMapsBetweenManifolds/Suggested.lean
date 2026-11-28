module

public import Mathlib
public import TauCeti.Geometry.Diffeomorphism.Group
public import TauCeti.Geometry.Manifold.Riemannian.Geodesic.Normal.Basic

/-!
# Hölder maps between manifolds: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, with the definitions they need.

Stated here: the class `C^{k,α}` of maps between manifolds with corners, at a point, on a set and
globally (§2.1), its comparison with `C^k` and `C^{k+1}` (§2.1 item 1), chart independence over
the maximal atlases (§2.2), composition (§2.3 items 1 and 2) and the tangent map (§2.4); Hölder
diffeomorphisms (§3.1) with the regularity of the inverse of a `C^k` diffeomorphism that is
`C^{k,α}`, the local inverse function theorem (§3.2 item 1), the group `Diff^{k,α}(M)` as a
subgroup of `TauCeti.Diff I M k` (§3.3) and the uniform Hölder estimates in exponential charts
(§3.4); the Hölder chart tests (§4.1) and the two topologies on `Diff^{k,α}(M)`, with the failure
of the group property for the `C^{k,α}` topology (§4.3) and the group property for the lower
Hölder topology (§4.4).

The definitions accept every `k` and `α`; the theorems assume `0 < α ≤ 1`, and `1 ≤ k` where the
README does.

Not statable at the pins: the Banach space `C^{k,α}(M, F)` of a compact manifold (§2.2), and the
theorems of Layer 5 about it and about the finite-atlas `C^k` spaces (inclusions and their
compactness, the real-index scale, the Riemannian description of `C^{0,α}(M)`, pullback and
smoothing). These spaces are constructions of §2.2: the pinned Tau Ceti has the compact chart
`C^k` seminorms of vector-valued maps but no normed space of `C^k` or `C^{k,α}` maps on a compact
manifold, and a normed structure cannot be stated without its proofs.
-/

@[expose] public section

noncomputable section

namespace TauCetiRoadmap.HolderMapsBetweenManifolds

open Set
open scoped Manifold ContDiff NNReal ENNReal Topology

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {M : Type*} [TopologicalSpace M] [ChartedSpace H M]
  {E' : Type*} [NormedAddCommGroup E'] [NormedSpace ℝ E'] [FiniteDimensional ℝ E']
  {H' : Type*} [TopologicalSpace H'] {J : ModelWithCorners ℝ E' H'}
  {N : Type*} [TopologicalSpace N] [ChartedSpace H' N]
  {E'' : Type*} [NormedAddCommGroup E''] [NormedSpace ℝ E''] [FiniteDimensional ℝ E'']
  {H'' : Type*} [TopologicalSpace H''] {K : ModelWithCorners ℝ E'' H''}
  {P : Type*} [TopologicalSpace P] [ChartedSpace H'' P]

/-! ## Layer 2: `C^{k,α}` maps between manifolds -/

section Class

/-- §2.1. `f` is `C^{k,α}` at `x`: continuous at `x`, and on a relative ball around
`extChartAt I x x` inside the domain of its representative, the representative is `C^k` with
`α`-Hölder `k`th derivative. -/
def ContMDiffHolderAt (I : ModelWithCorners ℝ E H) (J : ModelWithCorners ℝ E' H')
    (k : ℕ) (α : ℝ≥0) (f : M → N) (x : M) : Prop :=
  ContinuousAt f x ∧ ∃ r > (0 : ℝ), ∃ C : ℝ≥0,
    let s := range I ∩ Metric.ball (extChartAt I x x) r
    s ⊆ (extChartAt I x).target ∩ (extChartAt I x).symm ⁻¹' (f ⁻¹' (extChartAt J (f x)).source) ∧
    ContDiffOn ℝ k (writtenInExtChartAt I J x f) s ∧
    HolderOnWith C α (iteratedFDerivWithin ℝ k (writtenInExtChartAt I J x f) s) s

/-- §2.1. `f` is `C^{k,α}` at every point of `s`; on an open `s` this is the local class
`C^{k,α}_loc(s, N)`. -/
def ContMDiffHolderOn (I : ModelWithCorners ℝ E H) (J : ModelWithCorners ℝ E' H')
    (k : ℕ) (α : ℝ≥0) (f : M → N) (s : Set M) : Prop :=
  ∀ x ∈ s, ContMDiffHolderAt I J k α f x

/-- §2.1. `f` is `C^{k,α}`. On a noncompact `M` this is the local class, with no global bound. -/
def ContMDiffHolder (I : ModelWithCorners ℝ E H) (J : ModelWithCorners ℝ E' H')
    (k : ℕ) (α : ℝ≥0) (f : M → N) : Prop :=
  ∀ x, ContMDiffHolderAt I J k α f x

variable [IsManifold I ∞ M] [IsManifold J ∞ N] [IsManifold K ∞ P]
  {k : ℕ} {α β γ : ℝ≥0} {f : M → N} {g : N → P}

/-- §2.1 item 1: `C^{k,α}` maps are `C^k`. -/
theorem ContMDiffHolder.contMDiff (hf : ContMDiffHolder I J k α f) : ContMDiff I J k f :=
  sorry

/-- §2.1 item 1: `C^{k+1}` maps are `C^{k,1}`. -/
theorem _root_.ContMDiff.contMDiffHolder_one (hf : ContMDiff I J (k + 1) f) :
    ContMDiffHolder I J k 1 f :=
  sorry

/-- §2.2: chart independence. Membership in `C^{k,α}` can be tested in every pair of charts of
the maximal atlases, with Hölder bounds on compact subsets of the chart domains. -/
theorem contMDiffHolder_iff_maximalAtlas (hα₀ : 0 < α) (hα₁ : α ≤ 1) :
    ContMDiffHolder I J k α f ↔ Continuous f ∧
      ∀ e ∈ IsManifold.maximalAtlas I ∞ M, ∀ e' ∈ IsManifold.maximalAtlas J ∞ N,
        let U := e.extend I '' (e.source ∩ f ⁻¹' e'.source)
        ContDiffOn ℝ k (e'.extend J ∘ f ∘ (e.extend I).symm) U ∧
          ∀ L ⊆ U, IsCompact L → ∃ C : ℝ≥0,
            HolderOnWith C α (iteratedFDerivWithin ℝ k (e'.extend J ∘ f ∘ (e.extend I).symm) U)
              L :=
  sorry

/-- §2.3 item 1: composition in positive order. -/
theorem ContMDiffHolder.comp (hk : 1 ≤ k) (hα₀ : 0 < α) (hα₁ : α ≤ 1)
    (hg : ContMDiffHolder J K k α g) (hf : ContMDiffHolder I J k α f) :
    ContMDiffHolder I K k α (g ∘ f) :=
  sorry

/-- §2.3 item 2: in order zero the exponents multiply. -/
theorem ContMDiffHolder.comp_zero (hβ₀ : 0 < β) (hβ₁ : β ≤ 1) (hγ₀ : 0 < γ) (hγ₁ : γ ≤ 1)
    (hg : ContMDiffHolder J K 0 γ g) (hf : ContMDiffHolder I J 0 β f) :
    ContMDiffHolder I K 0 (β * γ) (g ∘ f) :=
  sorry

/-- §2.4: for `1 ≤ k`, the tangent map of a `C^{k,α}` map is `C^{k-1,α}` for the charts of the
tangent bundles, the Hölder analogue of `ContMDiff.contMDiff_tangentMap`. -/
theorem ContMDiffHolder.contMDiffHolder_tangentMap (hk : 1 ≤ k) (hα₀ : 0 < α) (hα₁ : α ≤ 1)
    (hf : ContMDiffHolder I J k α f) :
    ContMDiffHolder I.tangent J.tangent (k - 1) α (tangentMap I J f) :=
  sorry

end Class

/-! ## Layer 3: Hölder diffeomorphisms and the group `Diff^{k,α}(M)` -/

section Diffeomorph

/-- §3.1. A `C^{k,α}` diffeomorphism: a `C^k` diffeomorphism that is `C^{k,α}` with `C^{k,α}`
inverse. A `C^{1+α}` diffeomorphism is a `HolderDiffeomorph I J M N 1 α`. -/
structure HolderDiffeomorph (I : ModelWithCorners ℝ E H) (J : ModelWithCorners ℝ E' H')
    (M N : Type*) [TopologicalSpace M] [ChartedSpace H M] [TopologicalSpace N]
    [ChartedSpace H' N] (k : ℕ) (α : ℝ≥0) extends Diffeomorph I J M N k where
  contMDiffHolder_toFun : ContMDiffHolder I J k α toFun
  contMDiffHolder_invFun : ContMDiffHolder J I k α invFun

variable [IsManifold I ∞ M] [IsManifold J ∞ N] {k : ℕ} {α : ℝ≥0} {f : M → N}

/-- §3.1: the inverse of a `C^k` diffeomorphism that is `C^{k,α}` is `C^{k,α}`, with boundary
and corners allowed. -/
theorem _root_.Diffeomorph.contMDiffHolder_symm (hk : 1 ≤ k) (hα₀ : 0 < α) (hα₁ : α ≤ 1)
    (f : Diffeomorph I J M N k) (hf : ContMDiffHolder I J k α f) :
    ContMDiffHolder J I k α f.symm :=
  sorry

/-- §3.2 item 1: the local inverse function theorem. If `f` is `C^{k,α}` on an open set `s`,
`x ∈ s` is an interior point and the differential of `f` at `x` is a continuous linear
equivalence, then `f` agrees near `x` with a `C^k` partial diffeomorphism whose inverse is
`C^{k,α}` on its domain. -/
theorem exists_partialDiffeomorph_contMDiffHolderOn_symm (hk : 1 ≤ k) (hα₀ : 0 < α)
    (hα₁ : α ≤ 1) {s : Set M} (hs : IsOpen s) (hf : ContMDiffHolderOn I J k α f s) {x : M}
    (hx : x ∈ s) (hIx : I.IsInteriorPoint x)
    {e : TangentSpace I x ≃L[ℝ] TangentSpace J (f x)}
    (he : (e : TangentSpace I x →L[ℝ] TangentSpace J (f x)) = mfderiv I J f x) :
    ∃ Φ : PartialDiffeomorph I J M N k, x ∈ Φ.source ∧ EqOn f Φ Φ.source ∧
      ContMDiffHolderOn J I k α Φ.symm Φ.target :=
  sorry

variable (I M k α) in
/-- §3.3. The group `Diff^{k,α}(M)`: the subgroup of the `C^k` diffeomorphism group
`TauCeti.Diff I M k` generated by the diffeomorphisms that are `C^{k,α}` with `C^{k,α}` inverse.
By `coe_holderDiff` it consists of exactly these diffeomorphisms when `1 ≤ k` and
`0 < α ≤ 1`. -/
def HolderDiff : Subgroup (TauCeti.Diff I M k) :=
  Subgroup.closure
    {f : TauCeti.Diff I M k | ContMDiffHolder I I k α f ∧ ContMDiffHolder I I k α f.symm}

/-- §3.3: for `1 ≤ k` and `0 < α ≤ 1` the `C^k` diffeomorphisms that are `C^{k,α}` with
`C^{k,α}` inverse form a subgroup of `TauCeti.Diff I M k`; by `Diffeomorph.contMDiffHolder_symm`
the second condition follows from the first. -/
theorem coe_holderDiff (hk : 1 ≤ k) (hα₀ : 0 < α) (hα₁ : α ≤ 1) :
    (HolderDiff I M k α : Set (TauCeti.Diff I M k)) =
      {f : TauCeti.Diff I M k | ContMDiffHolder I I k α f ∧ ContMDiffHolder I I k α f.symm} :=
  sorry

open Bundle TauCeti.Manifold in
/-- §3.4 (DKRH (2.2)): uniform Hölder estimates in exponential charts. Let `M` be compact and
boundaryless with a smooth Riemannian metric, `0 < α ≤ 1` and `f` a `C^{1,α}` diffeomorphism of
`M`. There are radii `0 < ρ ≤ r` and a constant `C` such that the ball of radius `r` in every
tangent space is a normal domain and, for every `p`, the map
`f̂_p = riemannianLog (f p) (ball 0 r) ∘ f ∘ riemannianExp p` sends the ball of radius `ρ` of
`T_p M` into the ball of radius `r` of `T_{f p} M`, is `C^1` there with invertible derivative,
and its derivative and the inverse of its derivative are `α`-Hölder with constant `C`, the norms
being those of the metric. -/
theorem exists_holder_riemannianExp_chart [T2Space M] [CompactSpace M] [BoundarylessManifold I M]
    [RiemannianBundle (fun x : M ↦ TangentSpace I x)]
    [IsContMDiffRiemannianBundle I ∞ E (fun x : M ↦ TangentSpace I x)]
    (hα₀ : 0 < α) (hα₁ : α ≤ 1) (f : HolderDiffeomorph I I M M 1 α) :
    ∃ ρ r C : ℝ, 0 < ρ ∧ ρ ≤ r ∧
      (∀ q : M, IsNormalDomain I M q (Metric.ball (0 : TangentSpace I q) r)) ∧
      ∀ p : M,
        let fp : TangentSpace I p → TangentSpace I (f.toDiffeomorph p) :=
          riemannianLog I M (f.toDiffeomorph p) (Metric.ball 0 r) ∘ f.toDiffeomorph ∘
            riemannianExp I M p
        MapsTo fp (Metric.ball 0 ρ) (Metric.ball 0 r) ∧ ContDiffOn ℝ 1 fp (Metric.ball 0 ρ) ∧
          ∀ z₁ ∈ Metric.ball (0 : TangentSpace I p) ρ, ∀ z₂ ∈ Metric.ball (0 : TangentSpace I p) ρ,
            (fderiv ℝ fp z₁).IsInvertible ∧
              ‖fderiv ℝ fp z₁ - fderiv ℝ fp z₂‖ ≤ C * ‖z₁ - z₂‖ ^ (α : ℝ) ∧
              ‖(fderiv ℝ fp z₁).inverse - (fderiv ℝ fp z₂).inverse‖ ≤ C * ‖z₁ - z₂‖ ^ (α : ℝ) :=
  sorry

end Diffeomorph

/-! ## Layer 4: topologies -/

section Topology

variable (I J) in
/-- §4.1. The Hölder chart test of order `(k, α)` at the chart pair `(x, y)`, on `L ⊆ E`, around
`φ : E → E'`, with radius `ε`: the maps `g : M → N` sending `(extChartAt I x).symm '' L` into
`(extChartAt J y).source` whose representative `ĝ = extChartAt J y ∘ g ∘ (extChartAt I x).symm`
satisfies `max_{m ≤ k} sup_L ‖D^m (ĝ - φ)‖ + [D^k (ĝ - φ)]_{α, L} < ε`, the derivatives being
taken within `range I`. -/
def holderTest (k : ℕ) (α : ℝ≥0) (x : M) (y : N) (L : Set E) (φ : E → E') (ε : ℝ≥0) :
    Set (M → N) :=
  {g | MapsTo g ((extChartAt I x).symm '' L) (extChartAt J y).source ∧
    (⨆ m ≤ k, ⨆ z ∈ L,
        ‖iteratedFDerivWithin ℝ m (extChartAt J y ∘ g ∘ (extChartAt I x).symm - φ) (range I) z‖ₑ) +
      eHolderNorm α (L.domRestrict
        (iteratedFDerivWithin ℝ k (extChartAt J y ∘ g ∘ (extChartAt I x).symm - φ) (range I))) <
      ε}

variable (I J) in
/-- §4.1. The topology on maps `M → N` generated by the Hölder chart tests of order `(k, α)` on
compact subsets of the targets of extended charts, around maps that are `C^k` within `range I`,
with positive radius. Restricted to the `C^{k,α}` maps it is the `C^{k,α}` topology. -/
@[instance_reducible]
def holderMapTopology (k : ℕ) (α : ℝ≥0) : TopologicalSpace (M → N) :=
  .generateFrom {S | ∃ (x : M) (y : N) (L : Set E) (φ : E → E') (ε : ℝ≥0), IsCompact L ∧
    L ⊆ (extChartAt I x).target ∧ ContDiffOn ℝ k φ (range I) ∧ 0 < ε ∧
    S = holderTest I J k α x y L φ ε}

variable (I M) in
/-- §4.3. The `C^{k,α}` topology on `Diff^{k,α}(M)`, induced from `holderMapTopology` by the
underlying maps. -/
@[instance_reducible]
def holderTopology (k : ℕ) (α : ℝ≥0) : TopologicalSpace (HolderDiff I M k α) :=
  .induced (fun f ↦ ((f : TauCeti.Diff I M k) : M → M)) (holderMapTopology I I k α)

variable (I M) in
/-- §4.4. The lower Hölder topology on `Diff^{k,α}(M)`: the coarsest topology finer than the
topologies induced from the `C^{k,β}` topologies for `0 < β < α` (their infimum in Mathlib's order
on topologies), in which a filter converges exactly when it converges in every one of them. -/
@[instance_reducible]
def lowerHolderTopology (k : ℕ) (α : ℝ≥0) : TopologicalSpace (HolderDiff I M k α) :=
  ⨅ β ∈ Ioo (0 : ℝ≥0) α,
    .induced (fun f ↦ ((f : TauCeti.Diff I M k) : M → M)) (holderMapTopology I I k β)

variable [IsManifold I ∞ M] {k : ℕ} {α : ℝ≥0}

/-- §4.3. For a nonempty compact boundaryless `M` of positive dimension, `1 ≤ k` and
`0 < α ≤ 1`, `Diff^{k,α}(M)` with the `C^{k,α}` topology is not a topological group: left
multiplication by a suitable element is not continuous at the identity. -/
theorem not_isTopologicalGroup_holderTopology [T2Space M] [CompactSpace M]
    [BoundarylessManifold I M] [Nonempty M] [Nontrivial E] (hk : 1 ≤ k) (hα₀ : 0 < α)
    (hα₁ : α ≤ 1) :
    ¬ @IsTopologicalGroup (HolderDiff I M k α) (holderTopology I M k α) _ :=
  sorry

/-- §4.4. For a compact `M`, with boundary and corners allowed, `1 ≤ k` and `0 < α ≤ 1`,
`Diff^{k,α}(M)` with the lower Hölder topology is a topological group. -/
theorem isTopologicalGroup_lowerHolderTopology [T2Space M] [CompactSpace M] (hk : 1 ≤ k)
    (hα₀ : 0 < α) (hα₁ : α ≤ 1) :
    @IsTopologicalGroup (HolderDiff I M k α) (lowerHolderTopology I M k α) _ :=
  sorry

end Topology

end TauCetiRoadmap.HolderMapsBetweenManifolds
