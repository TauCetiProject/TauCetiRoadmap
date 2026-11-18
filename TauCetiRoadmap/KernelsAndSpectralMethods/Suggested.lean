module

public import Mathlib
public import TauCeti.Analysis.PositiveDefinite.Kernel.MeanEmbedding
public import TauCeti.Analysis.Bochner.BochnerTheorem
public import TauCeti.Analysis.Bochner.Gaussian.Basic
public import TauCeti.Analysis.InnerProductSpace.KyFan
public import TauCeti.Analysis.InnerProductSpace.CourantFischer
public import TauCeti.Analysis.InnerProductSpace.Orthonormal.Procrustes
public import TauCeti.Analysis.Normed.Module.CoveringNumber
public import TauCeti.Probability.McDiarmid
public import TauCeti.Probability.Moments.Covariance
public import TauCeti.Probability.Process.EmpiricalMeasure
public import TauCeti.MeasureTheory.OptimalTransport.Wasserstein.KantorovichRubinstein
public import TauCeti.MeasureTheory.OptimalTransport.Wasserstein.BoundedLipschitz
public import TauCeti.MeasureTheory.Measure.FrechetMean.CATZero
public import TauCeti.MeasureTheory.Measure.FrechetMean.Empirical

/-!
# Kernels and spectral methods: target signatures

This file is not the roadmap: the roadmap is `README.md`, and this file is not an exhaustive
checklist. It states, against the pinned Mathlib and Tau Ceti and each with `sorry`, the
headlines of the README that carry a Lean name, each with every conclusion the README attaches
to it, together with the definitions their statements need. The README's other headlines are
targets of the same standing, stated there in prose with their locators or proof routes, and are
not stated here.

The conventions of the README are used throughout. A weighted graph on a finite type `V` is a
real matrix `W`, symmetric with nonnegative entries; loops are allowed unless a statement
excludes them. A kernel is a function `k : X → X → ℝ` with a proof `hk : Matrix.PosSemidef k`,
and its feature map and mean embedding are Tau Ceti's `Matrix.PosSemidef.kolmogorovFeature` and
`Matrix.PosSemidef.kernelMeanEmbedding`. Mean embeddings are Bochner integrals, so every
statement about the embedding of a measure carries the integrability of the feature map.
Samples of size `n` are points of `Fin n → X` under `Measure.pi`; infinite i.i.d. sequences are
points of `ℕ → X` under `Measure.infinitePi`.

Definitions owned by a roadmap on main appear as local copies with a docstring naming their
owner: the U-statistic (MathematicalStatisticsFoundations 2.4) and boundedness in probability
(MathematicalStatisticsFoundations 8.2). The implementation namespace of the README is
`TauCeti`; the prototypes live in this roadmap's namespace.
-/

@[expose] public section

noncomputable section

open MeasureTheory ProbabilityTheory Filter Set Topology
open scoped ENNReal NNReal Matrix InnerProductSpace BoundedContinuousFunction

namespace TauCetiRoadmap.KernelsAndSpectralMethods

attribute [local instance] Classical.propDecidable

/-! ## Local copies of vocabulary owned by roadmaps on main -/

section Foundations

/-- **Local copy** of the U-statistic of MathematicalStatisticsFoundations 2.4: the average of
`h` over the injective `m`-tuples of indices of a sample `x` of size `n`. -/
def uStatistic {E : Type*} (m n : ℕ) (h : (Fin m → E) → ℝ) (x : Fin n → E) : ℝ :=
  ((n.descFactorial m : ℕ) : ℝ)⁻¹ *
    ∑ f ∈ (Finset.univ : Finset (Fin m → Fin n)).filter Function.Injective, h (x ∘ f)

/-- **Local copy** of boundedness in probability, MathematicalStatisticsFoundations 8.2. -/
def IsBoundedInProbability {Ω E : Type*} [MeasurableSpace Ω] [SeminormedAddCommGroup E]
    (μ : Measure Ω) (X : ℕ → Ω → E) : Prop :=
  ∀ ε > 0, ∃ C > 0, ∀ᶠ n in atTop, μ.real {ω | C < ‖X n ω‖} ≤ ε

end Foundations

/-! ## Layer 1: weighted graphs and their Laplacians -/

section Graphs

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- **1.1** A weighted graph: a symmetric matrix with nonnegative entries. -/
structure IsWeightedGraph (W : Matrix V V ℝ) : Prop where
  symm : W.IsSymm
  nonneg : ∀ i j, 0 ≤ W i j

/-- **1.1** The weighted degree `dᵢ = ∑ⱼ Wᵢⱼ`; a loop counts once. -/
def degree (W : Matrix V V ℝ) (i : V) : ℝ := ∑ j, W i j

/-- **1.1** The combinatorial Laplacian `L = D - W`. -/
def laplacian (W : Matrix V V ℝ) : Matrix V V ℝ := Matrix.diagonal (degree W) - W

/-- **1.1** The normalized Laplacian `𝓛 = D^{-1/2} L D^{-1/2}`, with the convention
`0⁻¹ = 0`: a vertex of degree `0` gives a zero row and column. -/
def normalizedLaplacian (W : Matrix V V ℝ) : Matrix V V ℝ :=
  Matrix.diagonal (fun i ↦ (Real.sqrt (degree W i))⁻¹) * laplacian W *
    Matrix.diagonal (fun i ↦ (Real.sqrt (degree W i))⁻¹)

/-- **1.1** The random-walk Laplacian `L_rw = D⁻¹ L = I - P`. -/
def randomWalkLaplacian (W : Matrix V V ℝ) : Matrix V V ℝ :=
  Matrix.diagonal (fun i ↦ (degree W i)⁻¹) * laplacian W

/-- **1.1** The simple graph of the positive weights; loops are dropped. -/
def positiveGraph (W : Matrix V V ℝ) : SimpleGraph V :=
  SimpleGraph.fromRel fun i j ↦ 0 < W i j

/-- **1.1** For a simple graph, the weighted Laplacian of its adjacency matrix is Mathlib's
`SimpleGraph.lapMatrix`. -/
theorem laplacian_adjMatrix (G : SimpleGraph V) [DecidableRel G.Adj] :
    laplacian (G.adjMatrix ℝ) = G.lapMatrix ℝ := sorry

/-- **1.2** The quadratic form of the Laplacian, and positive semidefiniteness of `L` and `𝓛`. -/
theorem laplacian_quadForm {W : Matrix V V ℝ} (hW : IsWeightedGraph W) (f : V → ℝ) :
    f ⬝ᵥ (laplacian W *ᵥ f) = (1 / 2 : ℝ) * ∑ i, ∑ j, W i j * (f i - f j) ^ 2 ∧
      (laplacian W).PosSemidef ∧ (normalizedLaplacian W).PosSemidef := sorry

/-- **1.2** The normalized Laplacian of a symmetric weight matrix is symmetric. -/
theorem isHermitian_normalizedLaplacian {W : Matrix V V ℝ} (hW : W.IsSymm) :
    (normalizedLaplacian W).IsHermitian := sorry

/-- **1.3** The kernel of `L`: the functions constant on the connected components of the graph
of positive weights; its dimension is the number of components. -/
theorem finrank_ker_laplacian {W : Matrix V V ℝ} (hW : IsWeightedGraph W) :
    (∀ f : V → ℝ, laplacian W *ᵥ f = 0 ↔
      ∀ i j, (positiveGraph W).Reachable i j → f i = f j) ∧
    Module.finrank ℝ (LinearMap.ker (Matrix.toLin' (laplacian W))) =
      Fintype.card (positiveGraph W).ConnectedComponent := sorry

/-- **1.3** With positive degrees, the kernels of `𝓛` and `L_rw` are `D^{1/2} ker L` and
`ker L`; both have the number of components as dimension. -/
theorem finrank_ker_normalizedLaplacian {W : Matrix V V ℝ} (hW : IsWeightedGraph W)
    (hdeg : ∀ i, 0 < degree W i) :
    (∀ g : V → ℝ, normalizedLaplacian W *ᵥ g = 0 ↔
      ∀ i j, (positiveGraph W).Reachable i j →
        g i / Real.sqrt (degree W i) = g j / Real.sqrt (degree W j)) ∧
    Module.finrank ℝ (LinearMap.ker (Matrix.toLin' (normalizedLaplacian W))) =
      Fintype.card (positiveGraph W).ConnectedComponent ∧
    Module.finrank ℝ (LinearMap.ker (Matrix.toLin' (randomWalkLaplacian W))) =
      Fintype.card (positiveGraph W).ConnectedComponent := sorry

/-- **1.4** The eigenvalues of `𝓛` lie in `[0, 2]`; without loops, `2` is an eigenvalue exactly
when some connected component is bipartite. -/
theorem spectrum_normalizedLaplacian {W : Matrix V V ℝ} (hW : IsWeightedGraph W)
    (hdeg : ∀ i, 0 < degree W i) :
    (∀ μ, Module.End.HasEigenvalue (Matrix.toLin' (normalizedLaplacian W)) μ →
      0 ≤ μ ∧ μ ≤ 2) ∧
    ((∀ i, W i i = 0) →
      (Module.End.HasEigenvalue (Matrix.toLin' (normalizedLaplacian W)) 2 ↔
        ∃ c : (positiveGraph W).ConnectedComponent,
          ((positiveGraph W).induce c.supp).IsBipartite)) := sorry

end Graphs

/-! ## Layer 2: variational characterizations -/

section Variational

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- **2.1** The spectral gap of `𝓛`, as the infimum of the Rayleigh quotient
`gᵀ L g / ∑ dᵢ gᵢ²` over nonzero `g` with `∑ dᵢ gᵢ = 0`. The quotient is nonnegative for a
weighted graph, so the infimum is bounded below; for `card V = 1` the index set is empty and the
value is `0`. -/
def fiedlerValue (W : Matrix V V ℝ) : ℝ :=
  ⨅ g : {g : V → ℝ // g ≠ 0 ∧ ∑ i, degree W i * g i = 0},
    (g.1 ⬝ᵥ (laplacian W *ᵥ g.1)) / ∑ i, degree W i * g.1 i ^ 2

/-- **2.2** The volume `vol S = ∑_{i ∈ S} dᵢ`. -/
def graphVolume (W : Matrix V V ℝ) (S : Finset V) : ℝ := ∑ i ∈ S, degree W i

/-- **2.2** The weight of the cut between `S` and its complement. -/
def cutWeight (W : Matrix V V ℝ) (S : Finset V) : ℝ := ∑ i ∈ S, ∑ j ∈ Sᶜ, W i j

/-- **2.2** The normalized cut `cut(S) (1 / vol S + 1 / vol Sᶜ)`. -/
def normalizedCut (W : Matrix V V ℝ) (S : Finset V) : ℝ :=
  cutWeight W S * ((graphVolume W S)⁻¹ + (graphVolume W Sᶜ)⁻¹)

/-- **2.1–2.2** The spectral gap is an eigenvalue of `𝓛`, the least nonzero one; it is positive
exactly for a connected graph, at most `n / (n - 1)`, and at most every normalized cut. -/
theorem fiedlerValue_spec {W : Matrix V V ℝ} (hW : IsWeightedGraph W)
    (hdeg : ∀ i, 0 < degree W i) (hV : 2 ≤ Fintype.card V) :
    Module.End.HasEigenvalue (Matrix.toLin' (normalizedLaplacian W)) (fiedlerValue W) ∧
    (∀ μ, Module.End.HasEigenvalue (Matrix.toLin' (normalizedLaplacian W)) μ →
      μ < fiedlerValue W → μ = 0) ∧
    (0 < fiedlerValue W ↔ (positiveGraph W).Connected) ∧
    fiedlerValue W ≤ (Fintype.card V : ℝ) / (Fintype.card V - 1) ∧
    ∀ S : Finset V, S.Nonempty → S ≠ Finset.univ → fiedlerValue W ≤ normalizedCut W S := sorry

/-- **2.3** Laplacian eigenmaps: the least value of `∑ₐ Yₐᵀ L Yₐ` over `D`-orthonormal families
of `k` vectors is the sum of the `k` smallest eigenvalues of `𝓛`. -/
theorem isLeast_laplacianEigenmap {W : Matrix V V ℝ} (hW : IsWeightedGraph W)
    (hdeg : ∀ i, 0 < degree W i) {k : ℕ} (hk : k ≤ Fintype.card V) :
    IsLeast {t | ∃ Y : Fin k → V → ℝ,
        (∀ a b, ∑ i, degree W i * Y a i * Y b i = if a = b then 1 else 0) ∧
        t = ∑ a, Y a ⬝ᵥ (laplacian W *ᵥ Y a)}
      (∑ j : Fin k, (isHermitian_normalizedLaplacian hW.symm).eigenvalues₀
        (Fin.rev (Fin.castLE hk j))) := sorry

end Variational

/-! ## Layer 3: the Cheeger inequality -/

section Cheeger

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- **3.1** The conductance `cut(S) / min(vol S, vol Sᶜ)` of a vertex set. -/
def conductance (W : Matrix V V ℝ) (S : Finset V) : ℝ :=
  cutWeight W S / min (graphVolume W S) (graphVolume W Sᶜ)

/-- **3.1** The Cheeger constant: the least conductance of a nonempty proper vertex set. For
`card V = 1` the index set is empty and the value is `0`. -/
def cheegerConstant (W : Matrix V V ℝ) : ℝ :=
  ⨅ S : {S : Finset V // S.Nonempty ∧ S ≠ Finset.univ}, conductance W S.1

/-- **3.2** The Cheeger inequality for the normalized Laplacian. -/
theorem cheeger_inequality {W : Matrix V V ℝ} (hW : IsWeightedGraph W)
    (hdeg : ∀ i, 0 < degree W i) (hV : 2 ≤ Fintype.card V) :
    fiedlerValue W ≤ 2 * cheegerConstant W ∧
    cheegerConstant W ^ 2 / 2 ≤ fiedlerValue W ∧
    1 - Real.sqrt (1 - cheegerConstant W ^ 2) ≤ fiedlerValue W := sorry

end Cheeger

/-! ## Layer 4: random walks and diffusion distances -/

section Diffusion

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- **4.1** The transition matrix `P = D⁻¹ W` of the random walk. -/
def transitionMatrix (W : Matrix V V ℝ) : Matrix V V ℝ :=
  Matrix.diagonal (fun i ↦ (degree W i)⁻¹) * W

/-- **4.1** The stationary law `π = d / vol V`. -/
def stationary (W : Matrix V V ℝ) (i : V) : ℝ := degree W i / ∑ j, degree W j

/-- **4.2** The squared diffusion distance at time `t`. -/
def diffusionDistSq (W : Matrix V V ℝ) (t : ℕ) (x y : V) : ℝ :=
  ∑ z, ((transitionMatrix W ^ t) x z - (transitionMatrix W ^ t) y z) ^ 2 / stationary W z

/-- **4.1–4.2** `P` has an `L²(π)`-orthonormal eigenbasis with eigenvalues in `[-1, 1]` and the
corresponding spectral expansion; for every such eigenbasis the squared diffusion distance is
the squared Euclidean distance of the diffusion map `x ↦ (λⱼᵗ ψⱼ(x))ⱼ`. -/
theorem diffusionDistSq_eq {W : Matrix V V ℝ} (hW : IsWeightedGraph W)
    (hdeg : ∀ i, 0 < degree W i) :
    (∃ (lam : V → ℝ) (ψ : V → V → ℝ),
      (∀ j, transitionMatrix W *ᵥ ψ j = lam j • ψ j) ∧
      (∀ j l, ∑ z, stationary W z * ψ j z * ψ l z = if j = l then 1 else 0) ∧
      (∀ j, |lam j| ≤ 1) ∧
      (∀ x z, transitionMatrix W x z = ∑ j, lam j * ψ j x * (stationary W z * ψ j z))) ∧
    (∀ (lam : V → ℝ) (ψ : V → V → ℝ),
      (∀ j, transitionMatrix W *ᵥ ψ j = lam j • ψ j) →
      (∀ j l, ∑ z, stationary W z * ψ j z * ψ l z = if j = l then 1 else 0) →
      ∀ (t : ℕ) (x y : V),
        diffusionDistSq W t x y = ∑ j, lam j ^ (2 * t) * (ψ j x - ψ j y) ^ 2) := sorry

end Diffusion

/-! ## Layer 5: distance geometry -/

section DistanceGeometry

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

/-- **5.1** The centering matrix `H = I - n⁻¹ 𝟙 𝟙ᵀ`. -/
def centeringMatrix (ι : Type*) [Fintype ι] [DecidableEq ι] : Matrix ι ι ℝ :=
  1 - ((Fintype.card ι : ℝ)⁻¹) • Matrix.of fun _ _ ↦ 1

/-- **5.1** The doubly centred matrix `B = -½ H (Δ ∘ Δ) H` of a dissimilarity matrix `Δ`. -/
def doubleCenteredGram (Δ : Matrix ι ι ℝ) : Matrix ι ι ℝ :=
  (-(1 / 2 : ℝ)) • (centeringMatrix ι * Δ.map (· ^ 2) * centeringMatrix ι)

/-- **5.1** Classical scaling: a dissimilarity matrix is realized by points of `ℝᵖ` exactly when
its doubly centred matrix is positive semidefinite of rank at most `p`. -/
theorem exists_euclidean_realization_iff (Δ : Matrix ι ι ℝ) (hsymm : Δ.IsSymm)
    (hdiag : ∀ i, Δ i i = 0) (hnn : ∀ i j, 0 ≤ Δ i j) (p : ℕ) :
    (∃ x : ι → EuclideanSpace ℝ (Fin p), ∀ i j, Δ i j = dist (x i) (x j)) ↔
      (doubleCenteredGram Δ).PosSemidef ∧ (doubleCenteredGram Δ).rank ≤ p := sorry

/-- **5.2** Best positive semidefinite approximation of rank at most `k` in Frobenius norm:
the least squared error is `∑_{j<k} min(λⱼ, 0)² + ∑_{j≥k} λⱼ²` for the eigenvalues in
decreasing order. -/
theorem isLeast_posSemidef_rank_le {n : ℕ} {B : Matrix (Fin n) (Fin n) ℝ}
    (hB : B.IsHermitian) {k : ℕ} (hk : k ≤ n) :
    IsLeast {t | ∃ C : Matrix (Fin n) (Fin n) ℝ, C.PosSemidef ∧ C.rank ≤ k ∧
        t = ∑ i, ∑ j, (B i j - C i j) ^ 2}
      (∑ j : Fin (Fintype.card (Fin n)),
        if (j : ℕ) < k then (min (hB.eigenvalues₀ j) 0) ^ 2 else hB.eigenvalues₀ j ^ 2) := sorry

variable {M E : Type*} [MetricSpace M] [NormedAddCommGroup E]

/-- **5.3** The length of the walk `a, l₀, …, lₘ, b` measured in the embedding `ι`. -/
def walkLength (ι : M → E) (a b : M) (l : List M) : ℝ :=
  (((a :: l).zip (l ++ [b])).map fun p ↦ ‖ι p.1 - ι p.2‖).sum

/-- **5.3** The shortest-path distance of the `ε`-neighbourhood graph on a sample `S`, with
edges weighted by embedded length; `∞` when no walk exists. -/
def sampleGraphEDist (ι : M → E) (S : Set M) (ε : ℝ) (a b : M) : ℝ≥0∞ :=
  ⨅ (l : List M) (_ : (∀ u ∈ l, u ∈ S) ∧
      List.IsChain (fun u v ↦ ‖ι u - ι v‖ ≤ ε) (a :: l ++ [b])),
    ENNReal.ofReal (walkLength ι a b l)

/-- **5.3** Graph geodesics approximate intrinsic distances: the upper bound on a geodesic space
sampled by a `δ`-net, and the lower bound under a local chord–arc condition. -/
theorem sampleGraphEDist_bounds (ι : M → E) (hι : LipschitzWith 1 ι)
    (hgeod : ∀ x y : M, ∃ γ : ℝ → M, γ 0 = x ∧ γ (dist x y) = y ∧
      ∀ s ∈ Icc 0 (dist x y), ∀ t ∈ Icc 0 (dist x y), dist (γ s) (γ t) = |s - t|)
    (S : Set M) {δ ε : ℝ} (hδ : 0 ≤ δ) (hε : 4 * δ < ε)
    (hnet : ∀ x, ∃ s ∈ S, dist x s ≤ δ) {a b : M} (ha : a ∈ S) (hb : b ∈ S) :
    sampleGraphEDist ι S ε a b ≤ ENNReal.ofReal ((1 + 4 * δ / ε) * dist a b) ∧
    ∀ η : ℝ, 0 ≤ η → (∀ x y, ‖ι x - ι y‖ ≤ ε → dist x y ≤ (1 + η) * ‖ι x - ι y‖) →
      ENNReal.ofReal (dist a b) ≤ ENNReal.ofReal (1 + η) * sampleGraphEDist ι S ε a b :=
  sorry

/-- **5.4** Hausdorff estimation of a support under a small-ball lower bound: for an i.i.d.
sample from `P` carried by a compact `K` with `P (ball x r) ≥ c rᵈ` for `x ∈ K` and `r < r₀`,
the Hausdorff distance from the first `n` points to `K` is `O_P((log n / n)^{1/d})`. -/
theorem isBoundedInProbability_hausdorffDist {X : Type*} [MetricSpace X] [MeasurableSpace X]
    [BorelSpace X] [SecondCountableTopology X] (P : Measure X) [IsProbabilityMeasure P]
    {K : Set X} (hK : IsCompact K) (hPK : P K = 1) {d c r₀ : ℝ} (hd : 0 < d) (hc : 0 < c)
    (hr₀ : 0 < r₀)
    (hlower : ∀ x ∈ K, ∀ r ∈ Ioo 0 r₀, ENNReal.ofReal (c * r ^ d) ≤ P (Metric.ball x r)) :
    IsBoundedInProbability (Measure.infinitePi fun _ : ℕ ↦ P) (fun n ω ↦
      Metric.hausdorffDist (range fun i : Fin n ↦ ω i) K /
        (Real.log (n + 1) / n) ^ (1 / d)) := sorry

end DistanceGeometry

/-! ## Layer 6: shape -/

section Shape

variable {k m : ℕ}

/-- **6.1** A pre-shape: a centred configuration of `k` landmarks in `ℝᵐ` of unit size. -/
def IsPreshape (Z : Matrix (Fin k) (Fin m) ℝ) : Prop :=
  (∀ j, ∑ i, Z i j = 0) ∧ ∑ i, ∑ j, Z i j ^ 2 = 1

/-- **6.1** The Procrustes cosine `sup_{R ∈ SO(m)} tr(Z₂ᵀ Z₁ R)`; the supremum is over a compact
group of a continuous function. -/
def procrustesCos (Z₁ Z₂ : Matrix (Fin k) (Fin m) ℝ) : ℝ :=
  ⨆ R : Matrix.specialOrthogonalGroup (Fin m) ℝ, Matrix.trace (Z₂ᵀ * Z₁ * (R : Matrix _ _ ℝ))

/-- **6.2** The full Procrustes distance: the least Frobenius distance from `Z₂` to a rotated and
nonnegatively scaled `Z₁`. -/
def fullProcrustesDist (Z₁ Z₂ : Matrix (Fin k) (Fin m) ℝ) : ℝ :=
  ⨅ (β : {β : ℝ // 0 ≤ β}) (R : Matrix.specialOrthogonalGroup (Fin m) ℝ),
    Real.sqrt (∑ i, ∑ j,
      ((Z₂ - β.1 • (Z₁ * (R : Matrix (Fin m) (Fin m) ℝ)) : Matrix (Fin k) (Fin m) ℝ) i j) ^ 2)

/-- **6.2** The partial Procrustes distance: rotation only. -/
def partialProcrustesDist (Z₁ Z₂ : Matrix (Fin k) (Fin m) ℝ) : ℝ :=
  ⨅ R : Matrix.specialOrthogonalGroup (Fin m) ℝ,
    Real.sqrt (∑ i, ∑ j,
      ((Z₂ - Z₁ * (R : Matrix (Fin m) (Fin m) ℝ) : Matrix (Fin k) (Fin m) ℝ) i j) ^ 2)

/-- **6.1** Ordinary Procrustes analysis over `SO(m)`: the optimum is attained, and it is the
sum of the singular values of `A = Z₂ᵀ Z₁` with the smallest one counted negatively when
`det A < 0`; it is nonnegative for `m ≥ 2`. -/
theorem procrustesCos_eq (Z₁ Z₂ : Matrix (Fin k) (Fin m) ℝ) [NeZero m]
    (hA : ((Z₂ᵀ * Z₁)ᵀ * (Z₂ᵀ * Z₁)).IsHermitian) :
    (∃ R : Matrix.specialOrthogonalGroup (Fin m) ℝ,
      Matrix.trace (Z₂ᵀ * Z₁ * (R : Matrix _ _ ℝ)) = procrustesCos Z₁ Z₂) ∧
    procrustesCos Z₁ Z₂ = ∑ i, Real.sqrt (hA.eigenvalues i) -
      (if (Z₂ᵀ * Z₁).det < 0 then 2 * ⨅ i, Real.sqrt (hA.eigenvalues i) else 0) ∧
    (2 ≤ m → 0 ≤ procrustesCos Z₁ Z₂) := sorry

/-- **6.2** For pre-shapes in dimension `m ≥ 2`, the Procrustes distances in terms of the
Procrustes cosine `cos ρ`: `d_F = sin ρ` and `d_P = 2 sin (ρ / 2)`. -/
theorem procrustesDist_eq {Z₁ Z₂ : Matrix (Fin k) (Fin m) ℝ} (h₁ : IsPreshape Z₁)
    (h₂ : IsPreshape Z₂) (hm : 2 ≤ m) :
    procrustesCos Z₁ Z₂ ≤ 1 ∧
    fullProcrustesDist Z₁ Z₂ = Real.sqrt (1 - procrustesCos Z₁ Z₂ ^ 2) ∧
    partialProcrustesDist Z₁ Z₂ = Real.sqrt (2 - 2 * procrustesCos Z₁ Z₂) := sorry

/-- **6.3** The squared planar full Procrustes distance, with rotation and scaling written as
multiplication by a complex number. -/
def planarFullProcrustesDistSq (z w : EuclideanSpace ℂ (Fin k)) : ℝ :=
  ⨅ β : ℂ, ‖w - β • z‖ ^ 2

/-- **6.3** The planar full Procrustes mean: `d_F² = 1 - |⟪z, w⟫|²` for unit configurations, and
a unit `μ` minimizes the sum of squared distances to unit configurations `zᵢ` exactly when it is
an eigenvector of `S = ∑ zᵢ zᵢ*` for its largest eigenvalue. -/
theorem planarFullProcrustesMean {n : ℕ} (z : Fin n → EuclideanSpace ℂ (Fin k))
    (hz : ∀ i, ‖z i‖ = 1) :
    (∀ w, ‖w‖ = 1 → ∀ i, planarFullProcrustesDistSq (z i) w = 1 - ‖⟪z i, w⟫_ℂ‖ ^ 2) ∧
    ∀ μ, ‖μ‖ = 1 →
      (IsMinOn (fun w ↦ ∑ i, planarFullProcrustesDistSq (z i) w) (Metric.sphere 0 1) μ ↔
        ∃ c : ℝ, (∑ i, ⟪z i, μ⟫_ℂ • z i) = (c : ℂ) • μ ∧
          ∀ (c' : ℝ) (ν : EuclideanSpace ℂ (Fin k)), ν ≠ 0 →
            (∑ i, ⟪z i, ν⟫_ℂ • z i) = (c' : ℂ) • ν → c' ≤ c) := sorry

/-- **6.4** The extrinsic mean set of a law with finite second moment on a closed set `S` is the
set of nearest points of `S` to the Euclidean mean. -/
theorem extrinsicMean_iff {D : ℕ} (μ : Measure (EuclideanSpace ℝ (Fin D)))
    [IsProbabilityMeasure μ] (hμ : MemLp id 2 μ) {S : Set (EuclideanSpace ℝ (Fin D))}
    (hS : IsClosed S) (p : EuclideanSpace ℝ (Fin D)) (hp : p ∈ S) :
    (∀ q ∈ S, ∫ x, ‖x - p‖ ^ 2 ∂μ ≤ ∫ x, ‖x - q‖ ^ 2 ∂μ) ↔
      dist (∫ x, x ∂μ) p = Metric.infDist (∫ x, x ∂μ) S := sorry

/-- **6.4** Central limit theorem for the extrinsic sample mean: if the nearest-point map
`proj` of `S` is differentiable at the Euclidean mean `m` with derivative `Dproj`, then
`√n (proj(X̄ₙ) - proj(m))` converges in law to `Dproj Z` with `Z ~ N(0, Σ)`. -/
theorem tendstoInDistribution_extrinsicMean {D : ℕ} (μ : Measure (EuclideanSpace ℝ (Fin D)))
    [IsProbabilityMeasure μ] (hμ : MemLp id 2 μ) (S : Set (EuclideanSpace ℝ (Fin D)))
    (proj : EuclideanSpace ℝ (Fin D) → EuclideanSpace ℝ (Fin D)) (hprojm : Measurable proj)
    (hproj : ∀ᶠ x in 𝓝 (∫ x, x ∂μ), proj x ∈ S ∧ dist x (proj x) = Metric.infDist x S)
    (Dproj : EuclideanSpace ℝ (Fin D) →L[ℝ] EuclideanSpace ℝ (Fin D))
    (hd : HasFDerivAt proj Dproj (∫ x, x ∂μ))
    {Ω' : Type*} [MeasurableSpace Ω'] {μ' : Measure Ω'} [IsProbabilityMeasure μ']
    {Z : Ω' → EuclideanSpace ℝ (Fin D)}
    (hZ : HasLaw Z (multivariateGaussian 0 (TauCeti.covMatrix μ)) μ') :
    TendstoInDistribution (fun (n : ℕ) (ω : ℕ → EuclideanSpace ℝ (Fin D)) ↦
        Real.sqrt n • (proj ((n : ℝ)⁻¹ • ∑ i ∈ Finset.range n, ω i) - proj (∫ x, x ∂μ)))
      atTop (Dproj ∘ Z) (fun _ ↦ Measure.infinitePi fun _ : ℕ ↦ μ) μ' := sorry

end Shape

/-! ## Layer 7: mean embeddings and the maximum mean discrepancy -/

section MeanEmbedding

variable {X : Type*} [MeasurableSpace X] {k : X → X → ℝ}

/-- **7.2** The maximum mean discrepancy `‖m μ - m ν‖`. It is meaningful when the feature map is
integrable for both measures; every statement below carries that hypothesis. -/
def mmd (hk : Matrix.PosSemidef k) (μ ν : Measure X) : ℝ :=
  ‖hk.kernelMeanEmbedding μ - hk.kernelMeanEmbedding ν‖

/-- **7.1** The feature map of a bounded continuous kernel on a second-countable space is
integrable for every finite measure. -/
theorem integrable_kolmogorovFeature_of_le [TopologicalSpace X] [SecondCountableTopology X]
    [OpensMeasurableSpace X] (hk : Matrix.PosSemidef k) (hkc : Continuous (Function.uncurry k))
    {C : ℝ} (hC : ∀ x, k x x ≤ C) (μ : Measure X) [IsFiniteMeasure μ] :
    Integrable hk.kolmogorovFeature μ := sorry

/-- **7.2** The integral form of the embedding, the unit-ball supremum form of the MMD, the
witness function, and the normalized witness attaining the supremum. -/
theorem mmd_eq_iSup (hk : Matrix.PosSemidef k) {μ ν : Measure X}
    (hμ : Integrable hk.kolmogorovFeature μ) (hν : Integrable hk.kolmogorovFeature ν) :
    (∀ f : hk.KolmogorovSpace,
      ⟪f, hk.kernelMeanEmbedding μ⟫_ℝ = ∫ x, ⟪f, hk.kolmogorovFeature x⟫_ℝ ∂μ) ∧
    mmd hk μ ν = ⨆ f : {f : hk.KolmogorovSpace // ‖f‖ ≤ 1},
      (∫ x, ⟪f.1, hk.kolmogorovFeature x⟫_ℝ ∂μ - ∫ x, ⟪f.1, hk.kolmogorovFeature x⟫_ℝ ∂ν) ∧
    (∀ x, ⟪hk.kolmogorovFeature x, hk.kernelMeanEmbedding μ - hk.kernelMeanEmbedding ν⟫_ℝ =
      ∫ y, k x y ∂μ - ∫ y, k x y ∂ν) ∧
    (mmd hk μ ν ≠ 0 →
      ‖(mmd hk μ ν)⁻¹ • (hk.kernelMeanEmbedding μ - hk.kernelMeanEmbedding ν)‖ = 1 ∧
      ∫ x, ⟪(mmd hk μ ν)⁻¹ • (hk.kernelMeanEmbedding μ - hk.kernelMeanEmbedding ν),
          hk.kolmogorovFeature x⟫_ℝ ∂μ -
        ∫ x, ⟪(mmd hk μ ν)⁻¹ • (hk.kernelMeanEmbedding μ - hk.kernelMeanEmbedding ν),
          hk.kolmogorovFeature x⟫_ℝ ∂ν = mmd hk μ ν) := sorry

/-- **7.3** The empirical mean embedding: its mean squared error, and its deviation bound by the
bounded-differences inequality. -/
theorem kernelMeanEmbedding_empirical [TopologicalSpace X] [SecondCountableTopology X]
    [BorelSpace X] (hk : Matrix.PosSemidef k) (hkc : Continuous (Function.uncurry k))
    {C : ℝ} (hC : ∀ x, k x x ≤ C) (P : Measure X) [IsProbabilityMeasure P] {n : ℕ}
    (hn : 0 < n) :
    ∫ x, ‖hk.kernelMeanEmbedding (TauCeti.Probability.empiricalFiniteMeasure x : Measure X) -
        hk.kernelMeanEmbedding P‖ ^ 2 ∂(Measure.pi fun _ : Fin n ↦ P) =
      (∫ x, k x x ∂P - ‖hk.kernelMeanEmbedding P‖ ^ 2) / n ∧
    (∫ x, k x x ∂P - ‖hk.kernelMeanEmbedding P‖ ^ 2) / n ≤ C / n ∧
    ∀ t, 0 ≤ t → (Measure.pi fun _ : Fin n ↦ P).real
      {x | Real.sqrt (C / n) + t ≤
        ‖hk.kernelMeanEmbedding (TauCeti.Probability.empiricalFiniteMeasure x : Measure X) -
          hk.kernelMeanEmbedding P‖} ≤ Real.exp (-(n * t ^ 2) / (2 * C)) := sorry

end MeanEmbedding

/-! ## Layer 8: characteristic kernels -/

section Characteristic

variable {X : Type*} [MeasurableSpace X] {k : X → X → ℝ}

/-- **8.1** A kernel is characteristic when the mean embedding is injective on the probability
measures whose feature map is integrable. -/
def IsCharacteristic (hk : Matrix.PosSemidef k) : Prop :=
  ∀ μ ν : Measure X, IsProbabilityMeasure μ → IsProbabilityMeasure ν →
    Integrable hk.kolmogorovFeature μ → Integrable hk.kolmogorovFeature ν →
    hk.kernelMeanEmbedding μ = hk.kernelMeanEmbedding ν → μ = ν

variable {d : ℕ}

/-- **8.2** The Gaussian kernel `exp(-‖x - y‖² / (2σ²))`. -/
def gaussianKernel (σ : ℝ) (x y : EuclideanSpace ℝ (Fin d)) : ℝ :=
  Real.exp (-‖x - y‖ ^ 2 / (2 * σ ^ 2))

/-- **8.2** The Laplace kernel `exp(-‖x - y‖ / σ)`. -/
def laplaceKernel (σ : ℝ) (x y : EuclideanSpace ℝ (Fin d)) : ℝ :=
  Real.exp (-‖x - y‖ / σ)

/-- **8.2** The inverse multiquadric kernel `(c² + ‖x - y‖²)^(-β)`. -/
def imqKernel (c β : ℝ) (x y : EuclideanSpace ℝ (Fin d)) : ℝ :=
  (c ^ 2 + ‖x - y‖ ^ 2) ^ (-β)

/-- **8.2** The Gaussian kernel is positive semidefinite. -/
theorem posSemidef_gaussianKernel {σ : ℝ} (hσ : 0 < σ) :
    Matrix.PosSemidef (gaussianKernel (d := d) σ) := sorry

/-- **8.1** The squared MMD of a translation-invariant kernel with spectral measure `Λ` is the
`Λ`-integral of the squared difference of characteristic functions. -/
theorem mmd_sq_eq_integral_charFun {k : EuclideanSpace ℝ (Fin d) → EuclideanSpace ℝ (Fin d) → ℝ}
    (hk : Matrix.PosSemidef k) (Λ : Measure (EuclideanSpace ℝ (Fin d))) [IsFiniteMeasure Λ]
    (hΛ : ∀ x y, (k x y : ℂ) = ∫ q, TauCeti.fourierAtom (x - y) q ∂Λ)
    (μ ν : Measure (EuclideanSpace ℝ (Fin d))) [IsProbabilityMeasure μ]
    [IsProbabilityMeasure ν] :
    Integrable hk.kolmogorovFeature μ ∧ Integrable hk.kolmogorovFeature ν ∧
    mmd hk μ ν ^ 2 =
      ∫ q, ‖charFun μ ((2 * Real.pi) • q) - charFun ν ((2 * Real.pi) • q)‖ ^ 2 ∂Λ := sorry

/-- **8.1** A translation-invariant kernel on `ℝᵈ`, `d ≥ 1`, is characteristic exactly when its
spectral measure charges every nonempty open set. -/
theorem isCharacteristic_iff_isOpenPosMeasure
    {k : EuclideanSpace ℝ (Fin d) → EuclideanSpace ℝ (Fin d) → ℝ} (hd : 0 < d)
    (hk : Matrix.PosSemidef k) (Λ : Measure (EuclideanSpace ℝ (Fin d))) [IsFiniteMeasure Λ]
    (hΛ : ∀ x y, (k x y : ℂ) = ∫ q, TauCeti.fourierAtom (x - y) q ∂Λ) :
    IsCharacteristic hk ↔ Λ.IsOpenPosMeasure := sorry

/-- **8.2** Nonzero scale mixtures of Gaussians are positive semidefinite and characteristic;
in particular the Gaussian, Laplace and inverse multiquadric kernels. -/
theorem isCharacteristic_of_scaleMixture
    {k : EuclideanSpace ℝ (Fin d) → EuclideanSpace ℝ (Fin d) → ℝ} (ρ : Measure ℝ)
    [IsFiniteMeasure ρ] (hρ : ρ (Iic 0) = 0) (hρ0 : ρ ≠ 0)
    (hk : ∀ x y, k x y = ∫ t, Real.exp (-t * ‖x - y‖ ^ 2) ∂ρ) :
    (∃ hk : Matrix.PosSemidef k, IsCharacteristic hk) ∧
    (∀ {σ : ℝ} (hσ : 0 < σ), IsCharacteristic (posSemidef_gaussianKernel (d := d) hσ)) ∧
    (∀ σ : ℝ, 0 < σ → ∃ hk : Matrix.PosSemidef (laplaceKernel (d := d) σ), IsCharacteristic hk) ∧
    (∀ c β : ℝ, 0 < c → 0 < β →
      ∃ hk : Matrix.PosSemidef (imqKernel (d := d) c β), IsCharacteristic hk) := sorry

/-- **8.3** The quadratic polynomial kernel `(1 + ⟪x, y⟫)²` sees only first and second moments:
under finite second moments its MMD is `2 ‖m_μ - m_ν‖² + ‖S_μ - S_ν‖_F²`, for the means `m`
and second-moment matrices `S`. -/
theorem polynomialKernel_mmd_sq (μ ν : Measure (EuclideanSpace ℝ (Fin d)))
    [IsProbabilityMeasure μ] [IsProbabilityMeasure ν] (hμ : Integrable (fun x ↦ ‖x‖ ^ 2) μ)
    (hν : Integrable (fun x ↦ ‖x‖ ^ 2) ν) :
    ∃ hk : Matrix.PosSemidef
        (fun x y : EuclideanSpace ℝ (Fin d) ↦ (1 + ⟪x, y⟫_ℝ) ^ 2),
      Integrable hk.kolmogorovFeature μ ∧ Integrable hk.kolmogorovFeature ν ∧
      mmd hk μ ν ^ 2 = 2 * ‖∫ x, x ∂μ - ∫ x, x ∂ν‖ ^ 2 +
        ∑ i, ∑ j, (∫ x, x i * x j ∂μ - ∫ x, x i * x j ∂ν) ^ 2 := sorry

end Characteristic

/-! ## Layer 9: comparison of distances and metrization -/

section Comparison

variable {X : Type*} [PseudoMetricSpace X] [MeasurableSpace X] [BorelSpace X]
  {k : X → X → ℝ}

/-- **9.1** The MMD is bounded by the transport cost of every coupling for the feature distance,
by `L W₁` when the feature map is `L`-Lipschitz, and by `√C ‖μ - ν‖_TV` when `k(x, x) ≤ C`. -/
theorem mmd_le (hk : Matrix.PosSemidef k) {μ ν : Measure X} [IsProbabilityMeasure μ]
    [IsProbabilityMeasure ν] (hμ : Integrable hk.kolmogorovFeature μ)
    (hν : Integrable hk.kolmogorovFeature ν) :
    (∀ π : Measure (X × X), TauCeti.IsCoupling π μ ν →
      mmd hk μ ν ≤ ∫ z, ‖hk.kolmogorovFeature z.1 - hk.kolmogorovFeature z.2‖ ∂π) ∧
    (∀ L : ℝ≥0, (∀ x y, ‖hk.kolmogorovFeature x - hk.kolmogorovFeature y‖ ≤ L * dist x y) →
      ENNReal.ofReal (mmd hk μ ν) ≤ L * TauCeti.wassersteinEDist 1 μ ν) ∧
    (∀ C : ℝ, (∀ x, k x x ≤ C) → mmd hk μ ν ≤ Real.sqrt C * tvDist μ ν) := sorry

/-- **9.2** The Dudley bounded-Lipschitz distance: the supremum of `|∫ f dμ - ∫ f dν|` over `f`
with `sup |f| + Lip f ≤ 1`. -/
def dudleyDist (μ ν : Measure X) : ℝ≥0∞ :=
  ⨆ (f : X → ℝ) (a : ℝ≥0) (b : ℝ≥0) (_ : a + b ≤ 1) (_ : ∀ x, |f x| ≤ a)
    (_ : LipschitzWith b f), ENNReal.ofReal |∫ x, f x ∂μ - ∫ x, f x ∂ν|

/-- **9.2** `β ≤ W₁`, `β ≤ ‖μ - ν‖_TV`, and `W₁ ≤ diam · ‖μ - ν‖_TV / 2` on a bounded space. -/
theorem dudleyDist_le (μ ν : Measure X) [IsProbabilityMeasure μ] [IsProbabilityMeasure ν] :
    dudleyDist μ ν ≤ TauCeti.wassersteinEDist 1 μ ν ∧
    dudleyDist μ ν ≤ ENNReal.ofReal (tvDist μ ν) ∧
    ∀ D : ℝ, (∀ x y : X, dist x y ≤ D) →
      TauCeti.wassersteinEDist 1 μ ν ≤ ENNReal.ofReal (D * tvDist μ ν / 2) := sorry

/-- **9.2** On a Polish space the Dudley distance metrizes weak convergence. -/
theorem tendsto_iff_dudleyDist [PolishSpace X] {ι : Type*} {l : Filter ι}
    (μs : ι → ProbabilityMeasure X) (μ : ProbabilityMeasure X) :
    Tendsto μs l (𝓝 μ) ↔
      Tendsto (fun i ↦ dudleyDist (μs i : Measure X) (μ : Measure X)) l (𝓝 0) := sorry

/-- **9.3** For a bounded continuous kernel on a separable space, weak convergence implies
convergence in MMD; for a characteristic kernel, a tight sequence converging in MMD converges
weakly. -/
theorem tendsto_mmd_iff [SecondCountableTopology X] (hk : Matrix.PosSemidef k)
    (hkc : Continuous (Function.uncurry k)) {C : ℝ} (hC : ∀ x, k x x ≤ C)
    (μs : ℕ → ProbabilityMeasure X) (μ : ProbabilityMeasure X) :
    (Tendsto μs atTop (𝓝 μ) →
      Tendsto (fun n ↦ mmd hk (μs n) μ) atTop (𝓝 0)) ∧
    (IsCharacteristic hk → IsTightMeasureSet (range fun n ↦ (μs n : Measure X)) →
      Tendsto (fun n ↦ mmd hk (μs n) μ) atTop (𝓝 0) → Tendsto μs atTop (𝓝 μ)) := sorry

end Comparison

/-! ## Layer 10: two-sample and independence tests -/

section Tests

variable {X : Type*} [MeasurableSpace X] {k : X → X → ℝ}

/-- **10.1** The kernel `h(z, z') = k(x, x') + k(y, y') - k(x, y') - k(x', y)` on pairs
`z = (x, y)`. -/
def mmdKernel (k : X → X → ℝ) (z z' : X × X) : ℝ :=
  k z.1 z'.1 + k z.2 z'.2 - k z.1 z'.2 - k z'.1 z.2

/-- **10.1** The unbiased MMD statistic of `n` pairs: the U-statistic of `mmdKernel`. -/
def mmdU (k : X → X → ℝ) (n : ℕ) (z : Fin n → X × X) : ℝ :=
  uStatistic 2 n (fun w ↦ mmdKernel k (w 0) (w 1)) z

/-- **10.1** The biased MMD statistic of `n` pairs: the V-statistic of `mmdKernel`. -/
def mmdV (k : X → X → ℝ) (n : ℕ) (z : Fin n → X × X) : ℝ :=
  ((n : ℝ) ^ 2)⁻¹ * ∑ i, ∑ j, mmdKernel k (z i) (z j)

/-- **10.1** The doubly centred kernel `k̃` of `k` under `P`. -/
def centeredKernel (P : Measure X) (k : X → X → ℝ) (x y : X) : ℝ :=
  k x y - ∫ y', k x y' ∂P - ∫ x', k x' y ∂P + ∫ x', ∫ y', k x' y' ∂P ∂P

/-- **10.1** The biased statistic is the squared MMD of the two empirical measures. -/
theorem mmdV_eq_mmd_sq [MeasurableSingletonClass X] (hk : Matrix.PosSemidef k) {n : ℕ}
    (z : Fin n → X × X) :
    mmdV k n z = mmd hk (TauCeti.Probability.empiricalFiniteMeasure (fun i ↦ (z i).1))
      (TauCeti.Probability.empiricalFiniteMeasure (fun i ↦ (z i).2)) ^ 2 := sorry

/-- **10.2** Null limits: when both samples have law `P`, `n MMD_u² → ∑ 2λⱼ (Zⱼ² - 1)` and
`n MMD_b² → ∑ 2λⱼ (Zⱼ² - 1) + 2 ∫ k̃(x, x) dP`, for the eigenvalues `λⱼ` and orthonormal
eigenfunctions `φⱼ` of the centred kernel. -/
theorem tendstoInDistribution_mmd_null [TopologicalSpace X] [SecondCountableTopology X]
    [BorelSpace X] (hkc : Continuous (Function.uncurry k)) {C : ℝ} (hC : ∀ x y, |k x y| ≤ C)
    (hsymm : ∀ x y, k x y = k y x) (P : Measure X) [IsProbabilityMeasure P]
    (lam : ℕ → ℝ) (φ : ℕ → X → ℝ) (hφ : ∀ j, MemLp (φ j) 2 P)
    (horth : ∀ i j, lam i ≠ 0 → lam j ≠ 0 → ∫ x, φ i x * φ j x ∂P = if i = j then 1 else 0)
    (hexp : Tendsto (fun N ↦ eLpNorm (fun z : X × X ↦ centeredKernel P k z.1 z.2 -
      ∑ j ∈ Finset.range N, lam j * φ j z.1 * φ j z.2) 2 (P.prod P)) atTop (𝓝 0))
    {Ω' : Type*} [MeasurableSpace Ω'] {μ' : Measure Ω'} [IsProbabilityMeasure μ']
    (Zs : ℕ → Ω' → ℝ) (hZs : iIndepFun Zs μ') (hZlaw : ∀ j, HasLaw (Zs j) (gaussianReal 0 1) μ')
    (W : Ω' → ℝ) (hW : Tendsto (fun N ↦ eLpNorm (fun ω ↦
      W ω - ∑ j ∈ Finset.range N, 2 * lam j * (Zs j ω ^ 2 - 1)) 2 μ') atTop (𝓝 0)) :
    TendstoInDistribution (fun (n : ℕ) z ↦ (n : ℝ) * mmdU k n z) atTop W
      (fun n ↦ Measure.pi fun _ : Fin n ↦ P.prod P) μ' ∧
    TendstoInDistribution (fun (n : ℕ) z ↦ (n : ℝ) * mmdV k n z) atTop
      (fun ω ↦ W ω + 2 * ∫ x, centeredKernel P k x x ∂P)
      (fun n ↦ Measure.pi fun _ : Fin n ↦ P.prod P) μ' := sorry

/-- **10.2** Alternative limit: `√n (MMD_u² - MMD²) → N(0, 4 Var_P Δ(X) + 4 Var_Q Δ(Y))` for the
unnormalized witness `Δ = m_P - m_Q`. -/
theorem tendstoInDistribution_mmdU_alternative [TopologicalSpace X] [SecondCountableTopology X]
    [BorelSpace X] (hk : Matrix.PosSemidef k) (hkc : Continuous (Function.uncurry k))
    {C : ℝ} (hC : ∀ x, k x x ≤ C) (P Q : Measure X) [IsProbabilityMeasure P]
    [IsProbabilityMeasure Q]
    {Ω' : Type*} [MeasurableSpace Ω'] {μ' : Measure Ω'} [IsProbabilityMeasure μ'] {Z : Ω' → ℝ}
    (hZ : HasLaw Z (gaussianReal 0 (4 * (
      Var[fun x ↦ ⟪hk.kolmogorovFeature x,
        hk.kernelMeanEmbedding P - hk.kernelMeanEmbedding Q⟫_ℝ; P] +
      Var[fun x ↦ ⟪hk.kolmogorovFeature x,
        hk.kernelMeanEmbedding P - hk.kernelMeanEmbedding Q⟫_ℝ; Q])).toNNReal) μ') :
    TendstoInDistribution (fun (n : ℕ) z ↦ Real.sqrt n * (mmdU k n z - mmd hk P Q ^ 2)) atTop Z
      (fun n ↦ Measure.pi fun _ : Fin n ↦ P.prod Q) μ' := sorry

variable {d e : ℕ}

/-- **10.3** The distance-induced kernel `k₀(x, y) = (‖x‖ + ‖y‖ - ‖x - y‖) / 2`. -/
def distanceKernel (x y : EuclideanSpace ℝ (Fin d)) : ℝ := (‖x‖ + ‖y‖ - ‖x - y‖) / 2

/-- **10.3** The energy distance `2 E‖X - Y‖ - E‖X - X'‖ - E‖Y - Y'‖`. -/
def energyDist (μ ν : Measure (EuclideanSpace ℝ (Fin d))) : ℝ :=
  2 * ∫ x, ∫ y, ‖x - y‖ ∂ν ∂μ - ∫ x, ∫ x', ‖x - x'‖ ∂μ ∂μ - ∫ y, ∫ y', ‖y - y'‖ ∂ν ∂ν

/-- **10.3** The distance-induced kernel is positive semidefinite. -/
theorem posSemidef_distanceKernel : Matrix.PosSemidef (distanceKernel (d := d)) := sorry

/-- **10.3** Under finite first moments the energy distance is twice the squared MMD of the
distance-induced kernel; it is nonnegative and vanishes exactly for equal laws. -/
theorem energyDist_eq (μ ν : Measure (EuclideanSpace ℝ (Fin d))) [IsProbabilityMeasure μ]
    [IsProbabilityMeasure ν] (hμ : Integrable (fun x ↦ ‖x‖) μ)
    (hν : Integrable (fun x ↦ ‖x‖) ν) :
    Integrable (posSemidef_distanceKernel (d := d)).kolmogorovFeature μ ∧
    Integrable (posSemidef_distanceKernel (d := d)).kolmogorovFeature ν ∧
    energyDist μ ν = 2 * mmd posSemidef_distanceKernel μ ν ^ 2 ∧
    (energyDist μ ν = 0 ↔ μ = ν) := sorry

/-- **10.4** The product kernel `k ⊗ l` of two positive semidefinite kernels on arbitrary types is
positive semidefinite. -/
theorem posSemidef_kronecker {X Y : Type*} {k : Matrix X X ℝ} {l : Matrix Y Y ℝ}
    (hk : k.PosSemidef) (hl : l.PosSemidef) : (Matrix.kroneckerMap (· * ·) k l).PosSemidef :=
  sorry

/-- **10.4** The Hilbert–Schmidt independence criterion: the squared MMD between a joint law and
the product of its marginals for the product kernel. -/
def hsic {X Y : Type*} [MeasurableSpace X] [MeasurableSpace Y] {k : X → X → ℝ}
    {l : Y → Y → ℝ} (hk : Matrix.PosSemidef k) (hl : Matrix.PosSemidef l) (ρ : Measure (X × Y)) :
    ℝ :=
  mmd (posSemidef_kronecker hk hl) ρ (ρ.fst.prod ρ.snd) ^ 2

/-- **10.4** The squared distance covariance
`E‖X - X'‖‖Y - Y'‖ + E‖X - X'‖ E‖Y - Y'‖ - 2 E‖X - X'‖‖Y - Y''‖`. -/
def distanceCovarianceSq (ρ : Measure (EuclideanSpace ℝ (Fin d) × EuclideanSpace ℝ (Fin e))) :
    ℝ :=
  ∫ z, ∫ z', ‖z.1 - z'.1‖ * ‖z.2 - z'.2‖ ∂ρ ∂ρ +
    (∫ x, ∫ x', ‖x - x'‖ ∂ρ.fst ∂ρ.fst) * (∫ y, ∫ y', ‖y - y'‖ ∂ρ.snd ∂ρ.snd) -
    2 * ∫ z, ∫ x', ∫ y', ‖z.1 - x'‖ * ‖z.2 - y'‖ ∂ρ.snd ∂ρ.fst ∂ρ

/-- **10.4** Under finite second moments, distance covariance is four times the HSIC of the
distance-induced kernels; it vanishes exactly at independence. -/
theorem distanceCovarianceSq_eq
    (ρ : Measure (EuclideanSpace ℝ (Fin d) × EuclideanSpace ℝ (Fin e))) [IsProbabilityMeasure ρ]
    (hX : Integrable (fun z ↦ ‖z.1‖ ^ 2) ρ) (hY : Integrable (fun z ↦ ‖z.2‖ ^ 2) ρ) :
    distanceCovarianceSq ρ =
      4 * hsic (posSemidef_distanceKernel (d := d)) (posSemidef_distanceKernel (d := e)) ρ ∧
    (distanceCovarianceSq ρ = 0 ↔ ρ = ρ.fst.prod ρ.snd) := sorry

/-- **10.4** For Gaussian kernels on both coordinates, HSIC vanishes exactly at independence. -/
theorem hsic_gaussianKernel_eq_zero_iff {σ τ : ℝ} (hσ : 0 < σ) (hτ : 0 < τ)
    (ρ : Measure (EuclideanSpace ℝ (Fin d) × EuclideanSpace ℝ (Fin e))) [IsProbabilityMeasure ρ] :
    hsic (posSemidef_gaussianKernel hσ) (posSemidef_gaussianKernel hτ) ρ = 0 ↔
      ρ = ρ.fst.prod ρ.snd := sorry

/-- **10.4** The HSIC of an empirical joint law is the Gram-matrix statistic
`n⁻² tr(K H L H)`. -/
theorem hsic_empirical_eq_trace {X Y : Type*} [MeasurableSpace X] [MeasurableSpace Y]
    [MeasurableSingletonClass X] [MeasurableSingletonClass Y] {k : X → X → ℝ} {l : Y → Y → ℝ}
    (hk : Matrix.PosSemidef k) (hl : Matrix.PosSemidef l) {n : ℕ} (z : Fin n → X × Y) :
    hsic hk hl (TauCeti.Probability.empiricalFiniteMeasure z) =
      ((n : ℝ) ^ 2)⁻¹ * Matrix.trace (Matrix.of (fun i j ↦ k (z i).1 (z j).1) *
        centeringMatrix (Fin n) * Matrix.of (fun i j ↦ l (z i).2 (z j).2) *
        centeringMatrix (Fin n)) := sorry

/-- **10.5** The permutation p-value: the fraction of permutations `σ` with `T(z) ≤ T(z ∘ σ)`. -/
def permutationPValue {N : ℕ} (T : (Fin N → X) → ℝ) (z : Fin N → X) : ℝ :=
  ((Finset.univ.filter fun σ : Equiv.Perm (Fin N) ↦ T z ≤ T (z ∘ σ)).card : ℝ) /
    (Fintype.card (Equiv.Perm (Fin N)) : ℝ)

/-- **10.5** Under a permutation-invariant law, the permutation p-value is super-uniform: the
test rejecting when `p ≤ α` has level at most `α`. -/
theorem measureReal_permutationPValue_le {N : ℕ} (Q : Measure (Fin N → X))
    [IsProbabilityMeasure Q] (hQ : ∀ σ : Equiv.Perm (Fin N), Q.map (fun z ↦ z ∘ σ) = Q)
    (T : (Fin N → X) → ℝ) (hT : Measurable T) {α : ℝ} (hα : 0 ≤ α) :
    Q.real {z | permutationPValue T z ≤ α} ≤ α := sorry

end Tests

/-! ## Layer 11: Stein discrepancies, conditional embeddings and random features -/

section Stein

variable {d : ℕ}

local notation "E" => EuclideanSpace ℝ (Fin d)

/-- **11.1** The Langevin Stein kernel of `k` for the score `b`. -/
def steinKernel (k : E → E → ℝ) (b : E → E) (x y : E) : ℝ :=
  ⟪b x, b y⟫_ℝ * k x y + ⟪b x, gradient (k x) y⟫_ℝ + ⟪b y, gradient (fun x' ↦ k x' y) x⟫_ℝ +
    ∑ j, fderiv ℝ (fun x' ↦ fderiv ℝ (k x') y (EuclideanSpace.single j 1)) x
      (EuclideanSpace.single j 1)

/-- **11.1** The squared kernel Stein discrepancy `∫∫ k_P dμ dμ`. -/
def ksdSq (k : E → E → ℝ) (b : E → E) (μ : Measure E) : ℝ :=
  ∫ x, ∫ y, steinKernel k b x y ∂μ ∂μ

/-- **11.1** The Stein identity for the sections of the Stein kernel, and the identification of
the squared KSD with the squared MMD of the Stein kernel. The target `P` has the positive `C¹`
density `p` and score `b = ∇p / p`. -/
theorem steinKernel_spec (p : E → ℝ) (hp : ∀ x, 0 < p x) (hpC : ContDiff ℝ 1 p)
    (hp1 : ∫ x, p x = 1) (k : E → E → ℝ) (hk : Matrix.PosSemidef k)
    (hk2 : ContDiff ℝ 2 (Function.uncurry k)) {C : ℝ}
    (hbd : ∀ x y, |k x y| ≤ C ∧ ‖gradient (k x) y‖ ≤ C ∧
      ‖gradient (fun x' ↦ k x' y) x‖ ≤ C ∧
      |∑ j, fderiv ℝ (fun x' ↦ fderiv ℝ (k x') y (EuclideanSpace.single j 1)) x
        (EuclideanSpace.single j 1)| ≤ C)
    (hb : Integrable (fun x ↦ ‖(p x)⁻¹ • gradient p x‖)
      (volume.withDensity fun x ↦ ENNReal.ofReal (p x))) :
    (∀ y, ∫ x, steinKernel k (fun x ↦ (p x)⁻¹ • gradient p x) x y
      ∂(volume.withDensity fun x ↦ ENNReal.ofReal (p x)) = 0) ∧
    ∃ hkP : Matrix.PosSemidef (steinKernel k fun x ↦ (p x)⁻¹ • gradient p x),
      ∀ μ : Measure E, IsProbabilityMeasure μ →
        Integrable (fun x ↦ ‖(p x)⁻¹ • gradient p x‖) μ →
        Integrable hkP.kolmogorovFeature μ ∧
        ksdSq k (fun x ↦ (p x)⁻¹ • gradient p x) μ =
          mmd hkP μ (volume.withDensity fun x ↦ ENNReal.ofReal (p x)) ^ 2 := sorry

/-- **11.2** Convergence in `W₁` to the target forces the kernel Stein discrepancy to `0`, for a
Lipschitz score and a kernel with bounded derivatives. -/
theorem tendsto_ksdSq_of_tendsto_wassersteinEDist (p : E → ℝ) (hp : ∀ x, 0 < p x)
    (hpC : ContDiff ℝ 1 p) (hp1 : ∫ x, p x = 1)
    (hP1 : Integrable (fun x ↦ ‖x‖) (volume.withDensity fun x ↦ ENNReal.ofReal (p x)))
    {L : ℝ≥0} (hL : LipschitzWith L fun x ↦ (p x)⁻¹ • gradient p x)
    (k : E → E → ℝ) (hk : Matrix.PosSemidef k) (hk2 : ContDiff ℝ 2 (Function.uncurry k))
    {C : ℝ}
    (hbd : ∀ x y, |k x y| ≤ C ∧ ‖gradient (k x) y‖ ≤ C ∧
      ‖gradient (fun x' ↦ k x' y) x‖ ≤ C ∧
      |∑ j, fderiv ℝ (fun x' ↦ fderiv ℝ (k x') y (EuclideanSpace.single j 1)) x
        (EuclideanSpace.single j 1)| ≤ C)
    (μs : ℕ → Measure E) [∀ n, IsProbabilityMeasure (μs n)]
    (hW : Tendsto (fun n ↦ TauCeti.wassersteinEDist 1 (μs n)
      (volume.withDensity fun x ↦ ENNReal.ofReal (p x))) atTop (𝓝 0)) :
    Tendsto (fun n ↦ ksdSq k (fun x ↦ (p x)⁻¹ • gradient p x) (μs n)) atTop (𝓝 0) := sorry

end Stein

section ConditionalEmbedding

variable {X Y : Type*} [MeasurableSpace X] [MeasurableSpace Y] {k : X → X → ℝ}
  {l : Y → Y → ℝ}

/-- **11.3** The covariance identity behind conditional mean embeddings: if `f ∈ H` represents
`x ↦ E[g(Y) | X = x]`, then `C_XX f = C_XY g`. -/
theorem covariance_condExp_eq [StandardBorelSpace Y] [Nonempty Y]
    [TopologicalSpace X] [SecondCountableTopology X] [OpensMeasurableSpace X]
    [TopologicalSpace Y] [SecondCountableTopology Y] [OpensMeasurableSpace Y]
    (hk : Matrix.PosSemidef k) (hkc : Continuous (Function.uncurry k)) {C : ℝ}
    (hC : ∀ x, k x x ≤ C) (hl : Matrix.PosSemidef l) (hlc : Continuous (Function.uncurry l))
    (hC' : ∀ y, l y y ≤ C) (ρ : Measure (X × Y)) [IsProbabilityMeasure ρ]
    (g : hl.KolmogorovSpace) (f : hk.KolmogorovSpace)
    (hf : ∀ᵐ x ∂ρ.fst, ⟪f, hk.kolmogorovFeature x⟫_ℝ =
      ∫ y, ⟪g, hl.kolmogorovFeature y⟫_ℝ ∂(ρ.condKernel x)) :
    ∫ x, ⟪f, hk.kolmogorovFeature x⟫_ℝ • hk.kolmogorovFeature x ∂ρ.fst =
      ∫ z, ⟪g, hl.kolmogorovFeature z.2⟫_ℝ • hk.kolmogorovFeature z.1 ∂ρ := sorry

/-- **11.3** The weights `β(x) = (K + nλ I)⁻¹ (k(x, xᵢ))ᵢ` of the regularized conditional mean
embedding `Û_{Y|x} = ∑ᵢ βᵢ(x) l(yᵢ, ·)`. -/
def cmeWeights (k : X → X → ℝ) {n : ℕ} (xs : Fin n → X) (lam : ℝ) (x : X) : Fin n → ℝ :=
  (Matrix.of (fun i j ↦ k (xs i) (xs j)) + ((n : ℝ) * lam) • (1 : Matrix (Fin n) (Fin n) ℝ))⁻¹ *ᵥ
    fun i ↦ k x (xs i)

end ConditionalEmbedding

section RandomFeatures

variable {d : ℕ}

local notation "E" => EuclideanSpace ℝ (Fin d)

/-- **11.4** The uniform law on the phase interval `[0, 2π]`. -/
def uniformPhase : Measure ℝ :=
  (ENNReal.ofReal (2 * Real.pi))⁻¹ • volume.restrict (Icc 0 (2 * Real.pi))

/-- **11.4** The random Fourier feature kernel `z(x)ᵀ z(y)` of `D` frequency–phase pairs. -/
def rffKernel {D : ℕ} (s : Fin D → E × ℝ) (x y : E) : ℝ :=
  (D : ℝ)⁻¹ * ∑ j, 2 * Real.cos (⟪(s j).1, x⟫_ℝ + (s j).2) * Real.cos (⟪(s j).1, y⟫_ℝ + (s j).2)

/-- **11.4** Random Fourier features: unbiasedness, the pointwise Hoeffding bound, the uniform
bound over a compact set, and the resulting control of the squared MMD. -/
theorem rffKernel_spec {D : ℕ} (hD : 0 < D) (Λ : Measure E) [IsProbabilityMeasure Λ]
    (k : E → E → ℝ) (hk : ∀ x y, k x y = ∫ ω, Real.cos ⟪ω, x - y⟫_ℝ ∂Λ) :
    (∀ x y, ∫ s, rffKernel s x y ∂(Measure.pi fun _ : Fin D ↦ Λ.prod uniformPhase) = k x y) ∧
    (∀ x y, ∀ ε > 0, (Measure.pi fun _ : Fin D ↦ Λ.prod uniformPhase).real
      {s | ε ≤ |rffKernel s x y - k x y|} ≤ 2 * Real.exp (-(D * ε ^ 2) / 8)) ∧
    (MemLp id 2 Λ → ∀ M : Set E, IsCompact M → ∀ ε > 0,
      ε ≤ Real.sqrt (∫ ω, ‖ω‖ ^ 2 ∂Λ) * Metric.diam M →
      (Measure.pi fun _ : Fin D ↦ Λ.prod uniformPhase).real
        {s | ∃ x ∈ M, ∃ y ∈ M, ε ≤ |rffKernel s x y - k x y|} ≤
        98 * (Real.sqrt (∫ ω, ‖ω‖ ^ 2 ∂Λ) * Metric.diam M / ε) ^ 2 *
          Real.exp (-(D * ε ^ 2) / (32 * (d + 1)))) ∧
    (∀ (M : Set E) (s : Fin D → E × ℝ) (ε : ℝ),
      (∀ x ∈ M, ∀ y ∈ M, |rffKernel s x y - k x y| ≤ ε) →
      ∀ μ ν : Measure E, IsProbabilityMeasure μ → IsProbabilityMeasure ν →
        μ Mᶜ = 0 → ν Mᶜ = 0 →
        |(∫ x, ∫ y, rffKernel s x y ∂μ ∂μ - 2 * ∫ x, ∫ y, rffKernel s x y ∂ν ∂μ +
            ∫ x, ∫ y, rffKernel s x y ∂ν ∂ν) -
          (∫ x, ∫ y, k x y ∂μ ∂μ - 2 * ∫ x, ∫ y, k x y ∂ν ∂μ + ∫ x, ∫ y, k x y ∂ν ∂ν)| ≤
          4 * ε) := sorry

end RandomFeatures

/-! ## Supplier declarations named in the README -/

#check @SimpleGraph.lapMatrix
#check @SimpleGraph.degMatrix
#check @SimpleGraph.posSemidef_lapMatrix
#check @SimpleGraph.lapMatrix_mulVec_eq_zero_iff_forall_reachable
#check @SimpleGraph.card_connectedComponent_eq_finrank_ker_toLin'_lapMatrix
#check @SimpleGraph.IsBipartite
#check @SimpleGraph.induce
#check @Matrix.IsHermitian.eigenvalues
#check @Matrix.IsHermitian.eigenvalues₀
#check @Matrix.IsHermitian.eigenvalues₀_antitone
#check @Matrix.PosSemidef.kronecker
#check @Matrix.rank
#check @RKHS.kerFun
#check @MeasureTheory.charFun
#check @MeasureTheory.Measure.ext_of_charFun
#check @MeasureTheory.Measure.map
#check @MeasureTheory.tvDist
#check @MeasureTheory.IsTightMeasureSet
#check @isCompact_closure_of_isTightMeasureSet
#check @MeasureTheory.TendstoInDistribution
#check @ProbabilityTheory.HasLaw
#check @ProbabilityTheory.gaussianReal
#check @ProbabilityTheory.multivariateGaussian
#check @ProbabilityTheory.tendstoInDistribution_inv_sqrt_mul_sum_sub
#check @ProbabilityTheory.HasSubgaussianMGF.measure_ge_le
#check @ProbabilityTheory.HasSubgaussianMGF.measure_sum_ge_le_of_iIndepFun
#check @MeasureTheory.Measure.condKernel
#check @MeasureTheory.Measure.infinitePi
#check @Matrix.PosSemidef.KolmogorovSpace
#check @Matrix.PosSemidef.kolmogorovFeature
#check @Matrix.PosSemidef.inner_kolmogorovFeature
#check @Matrix.PosSemidef.norm_kolmogorovFeature_sub_sq
#check @Matrix.PosSemidef.continuous_kolmogorovFeature
#check @Matrix.PosSemidef.kernelMeanEmbedding
#check @Matrix.PosSemidef.inner_kolmogorovFeature_kernelMeanEmbedding
#check @Matrix.PosSemidef.inner_kernelMeanEmbedding
#check @Matrix.PosSemidef.norm_kernelMeanEmbedding_sub_sq
#check @Matrix.PosSemidef.integrable_kolmogorovFeature
#check @Matrix.PosSemidef.kernelMeanEmbedding_inj
#check @TauCeti.IsUniversalKernel
#check @TauCeti.bochner
#check @TauCeti.bochner_euclideanSpace
#check @TauCeti.fourierAtom
#check @TauCeti.posSemidef_cexp_neg_mul_sq_norm
#check @LinearMap.IsSymmetric.sum_re_inner_apply_self_le_sum_eigenvalues
#check @LinearMap.IsSymmetric.eigenvalues_eq_iSup_iInf_re_inner
#check @LinearMap.exists_linearIsometryEquiv_trace_comp_eq_kyFanSum
#check @TauCeti.exists_orthonormal_span_eq_sum_norm_sub_sq_le
#check @TauCeti.coveringNumber_le_of_subset_closedBall
#check @TauCeti.exists_finset_isCover_of_subset_closedBall
#check @TauCeti.Probability.hasSubgaussianMGF_of_bounded_differences
#check @TauCeti.covMatrix
#check @TauCeti.Probability.empiricalFiniteMeasure
#check @TauCeti.IsCoupling
#check @TauCeti.wassersteinEDist
#check @TauCeti.wassersteinEDist_one_eq_iSup
#check @TauCeti.tendsto_probabilityMeasure_iff_iSup_abs_integral_sub_integral_boundedLipschitz
#check @TauCeti.IsFrechetBarycenter
#check @TauCeti.exists_isFrechetBarycenter
#check @TauCeti.subsingleton_frechetBarycenters_two
#check @TauCeti.tendsto_of_isFrechetBarycenter_empiricalMeasure_ae
#check @Metric.hausdorffDist
#check @Projectivization

end TauCetiRoadmap.KernelsAndSpectralMethods
