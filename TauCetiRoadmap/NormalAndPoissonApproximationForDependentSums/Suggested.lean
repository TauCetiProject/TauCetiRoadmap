import Mathlib
import TauCeti.MeasureTheory.OptimalTransport.Wasserstein.Basic

/-!
# Normal and Poisson approximation for sums with local dependence or couplings: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
definitions they need, all with real bodies: dependency graphs (`IsDependencyGraph`) and the count
of head runs (`headRunCount`), and four definitions copied verbatim from the roadmaps that own
them (`triangleCount` and `isolatedCount` from RandomGraphs, `occurrences` and `intensity` from
PoissonApproximation), since a roadmap's Lean file imports no other roadmap's module. Every
headline theorem of the README is statable at the pins and is stated here. The README's proof
routes and Checks are not restated.

The standard normal law is Mathlib's `ProbabilityTheory.gaussianReal 0 1` and the normal-side
distance is Tau Ceti's `TauCeti.wassersteinEDist 1`, with values in `[0, ∞]`. The Poisson law is
Mathlib's `ProbabilityTheory.poissonMeasure` and the Poisson-side distance is Mathlib's
`MeasureTheory.tvDist`, which on probability measures lies in `[0, 2]`: it is twice the total
variation distance of the half normalization, and every Poisson bound below carries that factor
`2`. Where a bound contains `(1 - exp (-λ)) / λ`, its value at `λ = 0` is Lean's `0`. The binomial
random graph `G(n, p)` is Mathlib's `SimpleGraph.binomialRandom (Fin n) p` with `p : unitInterval`.
With `unitInterval` open, `σ` is notation, so standard deviations are named `s`, and rates `lam`.
-/

noncomputable section

open MeasureTheory ProbabilityTheory
open scoped ENNReal NNReal unitInterval

namespace TauCetiRoadmap.NormalAndPoissonApproximationForDependentSums

/-! ## Layer 1: dependency graphs and the normal approximation in `W₁` -/

section DependencyGraphs

variable {Ω : Type*} [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
  {ι : Type*} [Fintype ι]

/-- 1.1 A dependency graph for a finite family of real random variables: neighbourhoods
`N i ∋ i`, symmetric (`j ∈ N i ↔ i ∈ N j`), such that any two subfamilies with no index of one in
the neighbourhood of an index of the other are independent. -/
def IsDependencyGraph (P : Measure Ω) (X : ι → Ω → ℝ) (N : ι → Finset ι) : Prop :=
  (∀ i, i ∈ N i) ∧ (∀ i j, j ∈ N i ↔ i ∈ N j) ∧
    ∀ A B : Finset ι, (∀ a ∈ A, ∀ b ∈ B, b ∉ N a) →
      IndepFun (fun ω (a : A) => X a ω) (fun ω (b : B) => X b ω) P

/-- 1.1 The variable model. If `Y v` are independent random variables and each `X i` is
measurable with respect to the variables `Y v` with `v ∈ vbl i`, then the neighbourhoods
`N i = {i} ∪ {j | vbl i ∩ vbl j ≠ ∅}` form a dependency graph. -/
theorem isDependencyGraph_of_measurable [DecidableEq ι] {V : Type*} [DecidableEq V]
    {β : V → Type*} [∀ v, MeasurableSpace (β v)] (Y : ∀ v, Ω → β v) (hY : ∀ v, Measurable (Y v))
    (hind : iIndepFun Y P) (vbl : ι → Finset V) (X : ι → Ω → ℝ)
    (hX : ∀ i, Measurable[⨆ v ∈ vbl i, MeasurableSpace.comap (Y v) inferInstance] (X i)) :
    IsDependencyGraph P X
      (fun i => insert i (Finset.univ.filter fun j => ¬ Disjoint (vbl i) (vbl j))) := by
  sorry

/-- 1.2 The normal approximation of a sum with a dependency graph, in terms of the largest
neighbourhood. Let `X i` be centred with finite fourth moments and a dependency graph `N` with
`|N i| ≤ D`, and let `s² = Var(∑ X i) > 0`. Then the law of `(∑ X i)/s` is within
`D² s⁻³ ∑ E|X i|³ + 4 D^(3/2) (√π s²)⁻¹ √(∑ E[X i ⁴])` of the standard normal law. -/
theorem wassersteinEDist_le_of_isDependencyGraph (X : ι → Ω → ℝ) (N : ι → Finset ι)
    (hN : IsDependencyGraph P X N) (h4 : ∀ i, MemLp (X i) 4 P) (h0 : ∀ i, ∫ ω, X i ω ∂P = 0)
    (s : ℝ) (hs : 0 < s) (hvar : variance (fun ω => ∑ i, X i ω) P = s ^ 2)
    (D : ℕ) (hD : ∀ i, (N i).card ≤ D) :
    TauCeti.wassersteinEDist 1 (P.map fun ω => (∑ i, X i ω) / s) (gaussianReal 0 1) ≤
      ENNReal.ofReal ((D : ℝ) ^ 2 / s ^ 3 * ∑ i, ∫ ω, |X i ω| ^ 3 ∂P +
        4 * (D : ℝ) ^ (3 / 2 : ℝ) / (√Real.pi * s ^ 2) * √(∑ i, ∫ ω, X i ω ^ 4 ∂P)) := by
  sorry

end DependencyGraphs

/-! ## Layer 2: couplings for the normal law in `W₁` -/

section Couplings

variable {Ω : Type*} [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]

/-- 2.1 Exchangeable pairs. Let `(W, W')` be exchangeable with `E[W' | W] = (1 - a) W` for some
`a > 0`, `W` integrable and `E|W' - W|³ < ∞`. Then the law of `W` is within
`√(2/π) E|1 - E[(W' - W)² | W] / (2a)| + E|W' - W|³ / (3a)` of the standard normal law. -/
theorem wassersteinEDist_le_of_steinPair (W W' : Ω → ℝ) (hW : Measurable W)
    (hW' : Measurable W')
    (hexch : P.map (fun ω => (W ω, W' ω)) = P.map (fun ω => (W' ω, W ω)))
    (a : ℝ) (ha : 0 < a)
    (hlin : P[W' | MeasurableSpace.comap W inferInstance] =ᵐ[P] fun ω => (1 - a) * W ω)
    (h1 : Integrable W P) (h3 : MemLp (fun ω => W' ω - W ω) 3 P) :
    TauCeti.wassersteinEDist 1 (P.map W) (gaussianReal 0 1) ≤
      ENNReal.ofReal (√(2 / Real.pi) * ∫ ω, |1 - (P[fun ω => (W' ω - W ω) ^ 2 |
          MeasurableSpace.comap W inferInstance]) ω / (2 * a)| ∂P +
        (∫ ω, |W' ω - W ω| ^ 3 ∂P) / (3 * a)) := by
  sorry

/-- 2.2 Size-bias couplings. Let `X ≥ 0` have mean `μ` and variance `s² > 0`, and let `Xs` satisfy
`E[X f(X)] = μ E[f(Xs)]` for every bounded measurable `f`, with `E(Xs - X)² < ∞`. Then the law of
`(X - μ)/s` is within `μ s⁻² √(2/π) √(Var E[Xs - X | X]) + μ s⁻³ E(Xs - X)²` of the standard
normal law. -/
theorem wassersteinEDist_le_of_sizeBias (X Xs : Ω → ℝ) (hX : Measurable X)
    (hXs : Measurable Xs) (hpos : ∀ᵐ ω ∂P, 0 ≤ X ω) (μ s : ℝ) (hμ : ∫ ω, X ω ∂P = μ)
    (hs : 0 < s) (hv : variance X P = s ^ 2)
    (hsb : ∀ f : ℝ → ℝ, Measurable f → (∃ C, ∀ x, |f x| ≤ C) →
      ∫ ω, X ω * f (X ω) ∂P = μ * ∫ ω, f (Xs ω) ∂P)
    (hd : MemLp (fun ω => Xs ω - X ω) 2 P) :
    TauCeti.wassersteinEDist 1 (P.map fun ω => (X ω - μ) / s) (gaussianReal 0 1) ≤
      ENNReal.ofReal (μ / s ^ 2 * √(2 / Real.pi) *
          √(variance (P[fun ω => Xs ω - X ω | MeasurableSpace.comap X inferInstance]) P) +
        μ / s ^ 3 * ∫ ω, (Xs ω - X ω) ^ 2 ∂P) := by
  sorry

end Couplings

/-! ## Layer 3: normal approximation of counts in `G(n, p)` -/

universe u v

section Graphs

variable {V : Type u} {W : Type v}

/-- 3.1 (copied verbatim from RandomGraphs 11.2) The number of triangles of a finite graph,
counted as three-element cliques. -/
noncomputable def triangleCount [Fintype V] (G : SimpleGraph V) : ℕ := by
  classical
  exact (G.cliqueFinset 3).card

/-- 3.2 (copied verbatim from RandomGraphs 11.3) The number of isolated vertices of a finite
graph. -/
noncomputable def isolatedCount [Fintype V] (G : SimpleGraph V) : ℕ := by
  classical
  exact (Finset.univ.filter (fun x => ∀ y, ¬ G.Adj x y)).card

end Graphs

/-- 3.1 Triangles in `G(n, p)`, normal approximation. For `n ≥ 3` and `0 < p < 1`, with `q = p³`
and `s² = C(n,3) q (1 - q + 3 (n - 3) p² (1 - p))`, the variance of the triangle count, the law
of `(T - C(n,3) q)/s` is within
`(3n - 8)² s⁻³ C(n,3) q (1 - q) ((1 - q)² + q²) +
4 (3n - 8)^(3/2) (√π s²)⁻¹ √(C(n,3) q (1 - q) ((1 - q)³ + q³))`
of the standard normal law. -/
theorem wassersteinEDist_triangleCount_le (n : ℕ) (hn : 3 ≤ n) (p : I) (hp0 : 0 < (p : ℝ))
    (hp1 : (p : ℝ) < 1) :
    let q : ℝ := (p : ℝ) ^ 3
    let s : ℝ := √((n.choose 3 : ℝ) * q * (1 - q + 3 * ((n : ℝ) - 3) * (p : ℝ) ^ 2 * (1 - p)))
    TauCeti.wassersteinEDist 1
        ((SimpleGraph.binomialRandom (Fin n) p).map
          fun G => ((triangleCount G : ℝ) - (n.choose 3 : ℝ) * q) / s) (gaussianReal 0 1) ≤
      ENNReal.ofReal ((3 * (n : ℝ) - 8) ^ 2 / s ^ 3 *
          ((n.choose 3 : ℝ) * q * (1 - q) * ((1 - q) ^ 2 + q ^ 2)) +
        4 * (3 * (n : ℝ) - 8) ^ (3 / 2 : ℝ) / (√Real.pi * s ^ 2) *
          √((n.choose 3 : ℝ) * q * (1 - q) * ((1 - q) ^ 3 + q ^ 3))) := by
  sorry

/-- 3.2 Isolated vertices in `G(n, p)`, normal approximation. For `n ≥ 2` and `0 < p < 1`, with
`r = 1 - p`, mean `μ = n r^(n-1)`, variance `s² = μ (1 + (n p - 1) r^(n-2))`,
`e₁ = (n - 1) p r^(n-2)`, `e₂ = e₁ + (n - 1)(n - 2) p² r^(2n-5)` and the variance of the number of
vertices of degree one,
`V₁ = n e₁ (1 - e₁) + n (n - 1) (p r^(2n-4) + (n - 2)² p² r^(2n-5) - e₁²)`,
the law of `(X - μ)/s`, with `X` the number of isolated vertices, is within
`μ s⁻² √(2/π) (√2 / n) √(V₁ + s²) + μ s⁻³ (e₂ + 2 e₁ + 1)` of the standard normal law. -/
theorem wassersteinEDist_isolatedCount_le (n : ℕ) (hn : 2 ≤ n) (p : I) (hp0 : 0 < (p : ℝ))
    (hp1 : (p : ℝ) < 1) :
    let r : ℝ := 1 - p
    let μ : ℝ := n * r ^ (n - 1)
    let s : ℝ := √(μ * (1 + (n * p - 1) * r ^ (n - 2)))
    let e₁ : ℝ := (n - 1) * p * r ^ (n - 2)
    let e₂ : ℝ := e₁ + (n - 1) * (n - 2) * p ^ 2 * r ^ (2 * n - 5)
    let V₁ : ℝ := n * e₁ * (1 - e₁) +
      n * (n - 1) * (p * r ^ (2 * n - 4) + (n - 2) ^ 2 * p ^ 2 * r ^ (2 * n - 5) - e₁ ^ 2)
    TauCeti.wassersteinEDist 1
        ((SimpleGraph.binomialRandom (Fin n) p).map
          fun G => ((isolatedCount G : ℝ) - μ) / s) (gaussianReal 0 1) ≤
      ENNReal.ofReal (μ / s ^ 2 * √(2 / Real.pi) * (√2 / n) * √(V₁ + s ^ 2) +
        μ / s ^ 3 * (e₂ + 2 * e₁ + 1)) := by
  sorry

/-! ## Layer 4: Poisson approximation beyond exact local independence -/

section Indicators

variable {ι : Type*} [Fintype ι]

/-- 4.1 (copied verbatim from PoissonApproximation 3.1) The number of indicators of
`x : ι → Bool` that are `true`. -/
def occurrences (x : ι → Bool) : ℕ :=
  (Finset.univ.filter fun i => x i = true).card

/-- 4.1 (copied verbatim from PoissonApproximation 3.1) The intensity of a law `ξ` of a family of
indicators: the sum over `i` of the probability that the `i`-th indicator is `true`, which is the
mean of `occurrences` under `ξ`. -/
def intensity (ξ : Measure (ι → Bool)) : ℝ≥0 :=
  ∑ i, (ξ.real {x | x i = true}).toNNReal

/-- 4.1 The theorem of Arratia, Goldstein and Gordon with the term `b₃`. Let `ξ` be the law of a
family of indicators and `N i ∋ i` neighbourhoods, with no independence assumed. With `λ` the
intensity, `b₁ = ∑ᵢ ∑_{j ∈ N i} pᵢ pⱼ`, `b₂ = ∑ᵢ ∑_{j ∈ N i, j ≠ i} P(xᵢ = xⱼ = true)` and
`b₃ = ∑ᵢ E|E[1{xᵢ = true} | (xⱼ)_{j ∉ N i}] - pᵢ|`, the law of the number of occurrences is
within `2 ((1 - e^(-λ))/λ · (b₁ + b₂) + min 1 (λ^(-1/2)) · b₃)` of `Po(λ)`. -/
theorem tvDist_le_of_neighbourhoods [DecidableEq ι] (ξ : Measure (ι → Bool))
    [IsProbabilityMeasure ξ] (N : ι → Finset ι) (hN : ∀ i, i ∈ N i) :
    tvDist (ξ.map occurrences) (poissonMeasure (intensity ξ)) ≤
      2 * (((1 - Real.exp (-(intensity ξ : ℝ))) / intensity ξ) *
          (∑ i, ∑ j ∈ N i, ξ.real {x | x i = true} * ξ.real {x | x j = true} +
            ∑ i, ∑ j ∈ (N i).erase i, ξ.real {x | x i = true ∧ x j = true}) +
        min 1 ((intensity ξ : ℝ) ^ (-(1 / 2 : ℝ))) *
          ∑ i, ∫ x, |(ξ[fun y : ι → Bool => if y i = true then (1 : ℝ) else 0 |
              MeasurableSpace.comap (fun (y : ι → Bool) (j : {j // j ∉ N i}) => y j)
                inferInstance]) x - ξ.real {y | y i = true}| ∂ξ) := by
  sorry

/-- 4.2 Increasing size-bias couplings. Suppose that for each `i` with `P(xᵢ = true) ≠ 0` there
is a coupling `γ` of `ξ` with `ξ` conditioned on `xᵢ = true` under which, almost surely, every
indicator other than the `i`-th of the first coordinate is at most the same indicator of the
second. Then the law of the number `W` of occurrences is within
`2 (1 - e^(-λ))/λ · (Var W - λ + 2 ∑ pᵢ²)` of `Po(λ)`. -/
theorem tvDist_le_of_increasingCoupling (ξ : Measure (ι → Bool)) [IsProbabilityMeasure ξ]
    (hc : ∀ i, ξ {x | x i = true} ≠ 0 → ∃ γ : Measure ((ι → Bool) × (ι → Bool)),
      TauCeti.IsCoupling γ ξ (ξ[|{x | x i = true}]) ∧
        ∀ᵐ z ∂γ, ∀ j, j ≠ i → z.1 j ≤ z.2 j) :
    tvDist (ξ.map occurrences) (poissonMeasure (intensity ξ)) ≤
      2 * ((1 - Real.exp (-(intensity ξ : ℝ))) / intensity ξ) *
        (variance (fun x => (occurrences x : ℝ)) ξ - intensity ξ +
          2 * ∑ i, ξ.real {x | x i = true} ^ 2) := by
  sorry

end Indicators

/-- 4.2 Size-bias couplings for the Poisson law. Let `W, Ws` be `ℕ`-valued with `E W = λ` and
`E[W f(W)] = λ E[f(Ws)]` for every bounded `f`, and `W + 1 - Ws` integrable. Then the law of `W`
is within `2 (1 - e^(-λ)) E|W + 1 - Ws|` of `Po(λ)`. -/
theorem tvDist_le_of_sizeBias {Ω : Type*} [MeasurableSpace Ω] {P : Measure Ω}
    [IsProbabilityMeasure P] (W Ws : Ω → ℕ) (hW : Measurable W) (hWs : Measurable Ws)
    (lam : ℝ≥0) (hmean : ∫ ω, (W ω : ℝ) ∂P = lam)
    (hsb : ∀ f : ℕ → ℝ, (∃ C, ∀ k, |f k| ≤ C) →
      ∫ ω, (W ω : ℝ) * f (W ω) ∂P = lam * ∫ ω, f (Ws ω) ∂P)
    (hd : Integrable (fun ω => (W ω : ℝ) + 1 - Ws ω) P) :
    tvDist (P.map W) (poissonMeasure lam) ≤
      2 * (1 - Real.exp (-(lam : ℝ))) * ∫ ω, |(W ω : ℝ) + 1 - Ws ω| ∂P := by
  sorry

/-! ## Layer 5: Poisson approximation of counts in random graphs and coin tossing -/

/-- 5.1 Triangles in `G(n, p)` in total variation. For every `n` and `p`, with `λ = C(n,3) p³`,
the law of the triangle count is within `2 (1 - e^(-λ)) (p³ + 3 (n - 3) p² (1 - p))` of
`Po(λ)`. -/
theorem tvDist_triangleCount_le (n : ℕ) (p : I) :
    tvDist ((SimpleGraph.binomialRandom (Fin n) p).map triangleCount)
        (poissonMeasure ((n.choose 3 : ℝ≥0) * unitInterval.toNNReal p ^ 3)) ≤
      2 * (1 - Real.exp (-((n.choose 3 : ℝ) * (p : ℝ) ^ 3))) *
        ((p : ℝ) ^ 3 + 3 * ((n : ℝ) - 3) * (p : ℝ) ^ 2 * (1 - p)) := by
  sorry

/-- 5.2 Isolated vertices in `G(n, p)` in total variation. For every `n` and `p`, with
`λ = n (1 - p)^(n-1)`, the law of the number of isolated vertices is within
`2 (1 - e^(-λ)) ((1 - p)^(n-1) + (n - 1) p (1 - p)^(n-2))` of `Po(λ)`. -/
theorem tvDist_isolatedCount_le (n : ℕ) (p : I) :
    tvDist ((SimpleGraph.binomialRandom (Fin n) p).map isolatedCount)
        (poissonMeasure ((n : ℝ≥0) * (1 - unitInterval.toNNReal p) ^ (n - 1))) ≤
      2 * (1 - Real.exp (-((n : ℝ) * (1 - (p : ℝ)) ^ (n - 1)))) *
        ((1 - (p : ℝ)) ^ (n - 1) + ((n : ℝ) - 1) * p * (1 - p) ^ (n - 2)) := by
  sorry

/-- 5.3 The number of head runs of length at least `k` in `y : Fin n → Bool`: the positions `i`
with `i + k ≤ n` at which `y` is `true` on `i, …, i + k - 1` and, if `i > 0`, `false` at `i - 1`. -/
def headRunCount (k : ℕ) {n : ℕ} (y : Fin n → Bool) : ℕ :=
  (Finset.univ.filter fun i : Fin n => (i : ℕ) + k ≤ n ∧
    (∀ j : Fin n, (i : ℕ) ≤ j → (j : ℕ) < i + k → y j = true) ∧
    ∀ j : Fin n, (j : ℕ) + 1 = i → y j = false).card

/-- 5.3 Head runs in coin tossing. Let `y` be `n` independent tosses with head probability `p`,
`1 ≤ k ≤ n`, `W` the number of head runs of length at least `k` and `λ = p^k ((n - k)(1 - p) + 1)`.
Then the law of `W` is within `2 (1 - e^(-λ)) (λ (2k + 1)/(n - k + 1) + 2 p^k)` of `Po(λ)`, and
the probability that no `k` consecutive tosses are heads is within half that bound of `e^(-λ)`. -/
theorem tvDist_headRunCount_le (n k : ℕ) (hk : 1 ≤ k) (hkn : k ≤ n) (p : I) :
    let lam : ℝ := (p : ℝ) ^ k * (((n : ℝ) - k) * (1 - p) + 1)
    let μ := Measure.pi fun _ : Fin n => bernoulliMeasure true false p
    tvDist (μ.map (headRunCount k)) (poissonMeasure lam.toNNReal) ≤
        2 * (1 - Real.exp (-lam)) * (lam * (2 * k + 1) / ((n : ℝ) - k + 1) + 2 * (p : ℝ) ^ k) ∧
      |μ.real {y | ∀ i : Fin n, (i : ℕ) + k ≤ n →
          ∃ j : Fin n, (i : ℕ) ≤ j ∧ (j : ℕ) < i + k ∧ y j = false} - Real.exp (-lam)| ≤
        (1 - Real.exp (-lam)) * (lam * (2 * k + 1) / ((n : ℝ) - k + 1) + 2 * (p : ℝ) ^ k) := by
  sorry

end TauCetiRoadmap.NormalAndPoissonApproximationForDependentSums
