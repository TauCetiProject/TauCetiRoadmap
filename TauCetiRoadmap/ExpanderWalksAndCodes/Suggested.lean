import Mathlib
import TauCeti.InformationTheory.Coding.Basic

/-!
# Expander walks and codes: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
few definitions they need; every definition has a real body. Every headline theorem of the README
is statable at the pins and is stated here.

A regular multigraph with loops is a rotation map `R : V × P → V × P`, involutive in the
theorems, with degree `Fintype.card P`; its spectral parameter `secondEigenvalue R` is the
two-sided `λ(R)` of the roadmap ExpanderConstructions. A walk of length `t` is a start vertex
together with `t` ports, so that the uniform random walk is the uniform law on
`V × (Fin t → P)`; probabilities are stated as counts of such pairs, multiplied out, so that they
hold also for empty vertex or port types. A bipartite multigraph is a map `R : V × P → U × P`
from right ports to left ports, as in the roadmap ExpanderCodes, whose edges `U × P` carry the
coordinates of a Tanner code.

Definitions of other roadmaps that the statements mention are copied verbatim, each with a
docstring naming its owner and section: from ExpanderConstructions `adjCount`, `normAdj` and
`secondEigenvalue`; from ExpanderCodes `biadjMatrix`, `secondSingularValue` and `tannerCode`;
from IharaZetaFunction `IsRamanujan`.
-/

noncomputable section

open Finset Matrix

namespace TauCetiRoadmap.ExpanderWalksAndCodes

/-! ## Definitions copied verbatim from ExpanderConstructions -/

section CopiedExpanderConstructions

variable {V P W Q : Type*} [Fintype V] [DecidableEq V] [Fintype P] [Fintype W] [DecidableEq W]
  [Fintype Q]

/-- 1.1 (copied verbatim from ExpanderConstructions 1.1): the number of edges from `v` to `w`:
the number of ports `i` at `v` with `(R (v, i)).1 = w`. A port fixed by `R` is a half-loop and
counts once on the diagonal; two ports at `v` exchanged by `R` form a loop and count twice. -/
def adjCount (R : V × P → V × P) (v w : V) : ℕ :=
  #{i : P | (R (v, i)).1 = w}

/-- 1.1 (copied verbatim from ExpanderConstructions 1.1): the normalized adjacency matrix: the
adjacency counts divided by the degree `Fintype.card P` (the zero matrix when there are no
ports). -/
def normAdj (R : V × P → V × P) : Matrix V V ℝ :=
  fun v w => (adjCount R v w : ℝ) / Fintype.card P

/-- 1.1 (copied verbatim from ExpanderConstructions 1.2): the spectral parameter `λ(R)`: the
supremum of `|xᵀ M x|` over vectors `x` with coordinate sum `0` and `xᵀ x ≤ 1`, for
`M = normAdj R`. For an involutive `R` on at least two vertices this is the largest absolute
value of an eigenvalue of `M` on the orthogonal complement of the constant vectors; on at most
one vertex it is `0`. -/
def secondEigenvalue (R : V × P → V × P) : ℝ :=
  sSup {r : ℝ | ∃ x : V → ℝ, ∑ v, x v = 0 ∧ x ⬝ᵥ x ≤ 1 ∧ r = |x ⬝ᵥ (normAdj R *ᵥ x)|}

end CopiedExpanderConstructions

/-! ## Definitions copied verbatim from ExpanderCodes -/

section CopiedExpanderCodes

variable {U V P : Type*} [Fintype U] [DecidableEq U] [Fintype V] [DecidableEq V] [Fintype P]

/-- 1.2 (copied verbatim from ExpanderCodes 1.1): the biadjacency matrix of `R : V × P → U × P`:
the entry at `(u, v)` is the number of ports `j` of `v` whose edge `R (v, j)` has left end `u`. -/
def biadjMatrix (R : V × P → U × P) : Matrix U V ℝ :=
  fun u v => (#{j : P | (R (v, j)).1 = u} : ℝ)

/-- 1.2 (copied verbatim from ExpanderCodes 1.1): the spectral parameter of `R`: the second
singular value of its biadjacency matrix (Mathlib's singular values are indexed from `0`). -/
def secondSingularValue (R : V × P → U × P) : ℝ :=
  (Matrix.toEuclideanLin (biadjMatrix R)).singularValues 1

/-- 3.1 (copied verbatim from ExpanderCodes 2.1): the Tanner code of `R` with inner code `C₀`:
the words `x : U × P → F` on the edges such that, at every left vertex `u` and at every right
vertex `v`, the word read along the ports, `i ↦ x (u, i)` and `j ↦ x (R (v, j))`, lies in
`C₀`. -/
def tannerCode {F : Type*} [Field F] (R : V × P → U × P) (C₀ : TauCeti.LinearCode F P) :
    TauCeti.LinearCode F (U × P) :=
  (⨅ u : U, C₀.comap (LinearMap.funLeft F F fun i : P => (u, i))) ⊓
    ⨅ v : V, C₀.comap (LinearMap.funLeft F F fun j : P => R (v, j))

end CopiedExpanderCodes

/-! ## Definition copied verbatim from IharaZetaFunction -/

section CopiedIharaZetaFunction

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- 1.2 (copied verbatim from IharaZetaFunction 5.3): the Ramanujan property: every adjacency
eigenvalue `λ` with `|λ| ≠ q + 1` has `|λ| ≤ 2√q`. -/
def IsRamanujan (q : ℕ) (G : SimpleGraph V) [DecidableRel G.Adj] : Prop :=
  ∀ v, |(G.isHermitian_adjMatrix ℝ).eigenvalues v| ≠ q + 1 →
    |(G.isHermitian_adjMatrix ℝ).eigenvalues v| ≤ 2 * Real.sqrt q

end CopiedIharaZetaFunction

variable {U V P : Type*} [Fintype U] [DecidableEq U] [Fintype V] [DecidableEq V] [Fintype P]

/-! ## Layer 1: the spectral parameters and Ramanujan graphs -/

/-- 1.2 From the Ramanujan property to `λ`: if a connected simple graph `G` that is not bipartite
and has `IsRamanujan q G` is realized by a rotation map `R` with `d` ports, then
`d λ(R) ≤ 2√q`. -/
theorem card_mul_secondEigenvalue_le_of_isRamanujan {q : ℕ} (G : SimpleGraph V)
    [DecidableRel G.Adj] (hconn : G.Connected) (hbip : ¬ G.IsBipartite) (hRam : IsRamanujan q G)
    {R : V × P → V × P} (hA : ∀ v w, (adjCount R v w : ℝ) = G.adjMatrix ℝ v w) :
    (Fintype.card P : ℝ) * secondEigenvalue R ≤ 2 * Real.sqrt q := by
  sorry

/-- 1.2 From the Ramanujan property to `σ₂`: if a connected simple graph `G` on `U ⊕ V` with no
edge inside `U` or inside `V` and with `IsRamanujan q G` has its edges between the two sides
counted by `biadjMatrix R`, then `σ₂(R) ≤ 2√q`. -/
theorem secondSingularValue_le_of_isRamanujan {q : ℕ} (G : SimpleGraph (U ⊕ V))
    [DecidableRel G.Adj] (hconn : G.Connected) (hRam : IsRamanujan q G)
    (hU : ∀ a b, ¬ G.Adj (Sum.inl a) (Sum.inl b)) (hV : ∀ a b, ¬ G.Adj (Sum.inr a) (Sum.inr b))
    {R : V × P → U × P} (hB : ∀ u v, biadjMatrix R u v = G.adjMatrix ℝ (Sum.inl u) (Sum.inr v)) :
    secondSingularValue R ≤ 2 * Real.sqrt q := by
  sorry

/-! ## Layer 2: walks: hitting, concentration, neighbourhoods and connections -/

/-- 2.1 The walk of length `t` from `v` along the ports `k 0, …, k (t - 1)`: the vertices
`v = v₀, v₁, …, v_t`, where `v_(i+1)` is the end of the edge at port `k i` of `v_i`. -/
def walk (R : V × P → V × P) : (t : ℕ) → V → (Fin t → P) → Fin (t + 1) → V
  | 0, v, _ => fun _ => v
  | t + 1, v, k => Fin.cons v (walk R t (R (v, k 0)).1 (Fin.tail k))

/-- 2.2 The hitting property. For an involutive `R` with `λ(R) ≤ λ`, a set `B` of density
`μ = |B| / n` and a nonempty set `K` of times, the number of walks of length `t` that lie in `B`
at every time of `K` is at most `μ (μ + λ (1 - μ))^(|K| - 1) n dᵗ`. -/
theorem card_walk_mem_le {R : V × P → V × P} (hR : Function.Involutive R) {lam : ℝ}
    (hlam : secondEigenvalue R ≤ lam) (t : ℕ) (B : Finset V) (K : Finset (Fin (t + 1)))
    (hK : K.Nonempty) :
    (#{x : V × (Fin t → P) | ∀ i ∈ K, walk R t x.1 x.2 i ∈ B} : ℝ) ≤
      (#B / Fintype.card V) *
          (#B / Fintype.card V + lam * (1 - #B / Fintype.card V)) ^ (#K - 1) *
        (Fintype.card V * Fintype.card P ^ t) := by
  sorry

/-- 2.2 The hitting property for a sequence of sets. For an involutive `R` with `λ(R) ≤ λ` and
sets `B 0, …, B t` of densities `μ i`, the number of walks of length `t` with `v_i ∈ B i` for
every `i` is at most `√(μ 0 μ t) ∏_(i < t) (√(μ i μ (i+1)) + λ) n dᵗ`. -/
theorem card_walk_mem_seq_le {R : V × P → V × P} (hR : Function.Involutive R) {lam : ℝ}
    (hlam : secondEigenvalue R ≤ lam) (t : ℕ) (B : Fin (t + 1) → Finset V) :
    (#{x : V × (Fin t → P) | ∀ i, walk R t x.1 x.2 i ∈ B i} : ℝ) ≤
      Real.sqrt (#(B 0) / Fintype.card V * (#(B (Fin.last t)) / Fintype.card V)) *
          (∏ i : Fin t, (Real.sqrt (#(B i.castSucc) / Fintype.card V *
            (#(B i.succ) / Fintype.card V)) + lam)) *
        (Fintype.card V * Fintype.card P ^ t) := by
  sorry

/-- 2.3 The Chernoff bound for expander walks (Healy). For an involutive `R` with `λ(R) ≤ λ`,
functions `f 0, …, f t : V → [0, 1]` with means `μ i` and `ε ≥ 0`, with `k = t + 1`: at most
`exp (-ε² (1 - λ) k / 36) n dᵗ` walks have `∑ (f i (v_i) - μ i) ≥ ε k`, and at most twice that
number have `|∑ (f i (v_i) - μ i)| ≥ ε k`. -/
theorem card_walk_sum_sub_ge_le {R : V × P → V × P} (hR : Function.Involutive R) {lam : ℝ}
    (hlam : secondEigenvalue R ≤ lam) (t : ℕ) (f : Fin (t + 1) → V → ℝ)
    (hf : ∀ i v, f i v ∈ Set.Icc (0 : ℝ) 1) {ε : ℝ} (hε : 0 ≤ ε) :
    (#{x : V × (Fin t → P) | ε * (t + 1) ≤
        ∑ i, (f i (walk R t x.1 x.2 i) - (∑ v, f i v) / Fintype.card V)} : ℝ) ≤
        Real.exp (-(ε ^ 2 * (1 - lam) * (t + 1) / 36)) *
          (Fintype.card V * Fintype.card P ^ t) ∧
      (#{x : V × (Fin t → P) | ε * (t + 1) ≤
        |∑ i, (f i (walk R t x.1 x.2 i) - (∑ v, f i v) / Fintype.card V)|} : ℝ) ≤
        2 * Real.exp (-(ε ^ 2 * (1 - lam) * (t + 1) / 36)) *
          (Fintype.card V * Fintype.card P ^ t) := by
  sorry

/-- 2.4 Tanner's vertex expansion. For an involutive `R` with ports and `λ(R) ≤ λ`, every set
`S` of vertices has `|S| ≤ |N(S)| (λ² + (1 - λ²) |S| / n)`, where `N(S)` is the set of ends of
the edges at `S`. -/
theorem card_le_card_image_mul {R : V × P → V × P} [Nonempty P] (hR : Function.Involutive R)
    {lam : ℝ} (hlam : secondEigenvalue R ≤ lam) (S : Finset V) :
    (#S : ℝ) ≤ #((S ×ˢ univ).image fun p => (R p).1) *
      (lam ^ 2 + (1 - lam ^ 2) * #S / Fintype.card V) := by
  sorry

/-- 2.4 Walks between any two vertices (Chung). For an involutive `R` with ports and
`λ(R) ≤ λ`, if `(n - 1) λᵐ < 1` then any two vertices are joined by a walk of length exactly
`m`. -/
theorem exists_walk_eq_of_mul_pow_lt_one {R : V × P → V × P} [Nonempty P]
    (hR : Function.Involutive R) {lam : ℝ} (hlam : secondEigenvalue R ≤ lam) {m : ℕ}
    (hm : ((Fintype.card V : ℝ) - 1) * lam ^ m < 1) (v w : V) :
    ∃ k : Fin m → P, walk R m v k (Fin.last m) = w := by
  sorry

/-! ## Layer 3: distance and decoding of spectral Tanner codes -/

/-- 3.1 The bipartite expander mixing lemma with the factors `(1 - |S|/n)(1 - |T|/n)`: for a
bijective `R` with `D` ports, `n` left vertices and second singular value `σ₂`,
`|e(S, T) - D |S| |T| / n| ≤ σ₂ √(|S| (1 - |S|/n) |T| (1 - |T|/n))`. -/
theorem abs_card_edges_sub_le_sqrt {R : V × P → U × P} (hR : Function.Bijective R)
    (S : Finset U) (T : Finset V) :
    |(#{p : V × P | (R p).1 ∈ S ∧ p.1 ∈ T} : ℝ) - Fintype.card P * #S * #T / Fintype.card U| ≤
      secondSingularValue R *
        Real.sqrt (#S * (1 - #S / Fintype.card U) * (#T * (1 - #T / Fintype.card U))) := by
  sorry

/-- 3.1 The distance bound with the factor `1 - ε`: let `R` be bijective with `D` ports and `n`
left vertices, let every nonzero word of `C₀` have weight at least `δ₀ D` with `δ₀ ≥ 0`, and let
`σ₂ ≤ ε D` with `ε ≤ 1`. Then every nonzero word `x` of the Tanner code has
`δ₀ (δ₀ - ε) D n ≤ (1 - ε) |x|`. -/
theorem mul_le_one_sub_mul_hammingNorm {F : Type*} [Field F] [DecidableEq F]
    {R : V × P → U × P} (hR : Function.Bijective R) {C₀ : TauCeti.LinearCode F P} {δ₀ ε : ℝ}
    (hδ₀ : 0 ≤ δ₀) (hC₀ : ∀ c ∈ C₀, c ≠ 0 → δ₀ * Fintype.card P ≤ hammingNorm c)
    (hσ : secondSingularValue R ≤ ε * Fintype.card P) (hε : ε ≤ 1)
    {x : U × P → F} (hx : x ∈ tannerCode R C₀) (hx0 : x ≠ 0) :
    δ₀ * (δ₀ - ε) * Fintype.card P * Fintype.card U ≤ (1 - ε) * hammingNorm x := by
  sorry

/-- 3.2 The correction at the left vertices: at every left vertex `u`, the word read along the
ports is replaced by its image under `g`. -/
def leftCorrection {F : Type*} (g : (P → F) → (P → F)) (x : U × P → F) : U × P → F :=
  fun e => g (fun i => x (e.1, i)) e.2

/-- 3.2 The correction at the right vertices: the edge `e = R (v, j)` receives the `j`-th letter
of the image under `g` of the word `j' ↦ x (R (v, j'))` read at `v`. -/
def rightCorrection {F : Type*} (R : V × P ≃ U × P) (g : (P → F) → (P → F)) (x : U × P → F) :
    U × P → F :=
  fun e => g (fun j => x (R ((R.symm e).1, j))) (R.symm e).2

/-- 3.2 The alternating corrections: `m` corrections, at the left vertices first, then at the
right vertices, and so on. -/
def alternatingCorrection {F : Type*} (R : V × P ≃ U × P) (g : (P → F) → (P → F)) :
    ℕ → (U × P → F) → (U × P → F)
  | 0, x => x
  | m + 1, x =>
      if m % 2 = 0 then leftCorrection g (alternatingCorrection R g m x)
      else rightCorrection R g (alternatingCorrection R g m x)

/-- 3.2 Decoding spectral Tanner codes. Let `R` be a bijection with `D` ports and `n` left
vertices, `δ₀ > 0`, `σ₂ ≤ ε D` and `ε ≤ δ₀ / 3`, and let `g` return the inner codeword `c` on
every word `w` with `2 d(w, c) < δ₀ D`. If `c` lies in the Tanner code and
`d(y, c) ≤ δ₀² D n / 18`, then for every `j` with `(3/4)ʲ δ₀ n / 9 < 1`, the alternating
corrections send `y` to `c` after `j + 1` steps and leave it there. -/
theorem alternatingCorrection_eq {F : Type*} [Field F] [DecidableEq F]
    (R : V × P ≃ U × P) {C₀ : TauCeti.LinearCode F P} {δ₀ ε : ℝ} (hδ₀ : 0 < δ₀)
    (hσ : secondSingularValue ⇑R ≤ ε * Fintype.card P) (hε : ε ≤ δ₀ / 3)
    {g : (P → F) → (P → F)}
    (hg : ∀ c ∈ C₀, ∀ w : P → F, 2 * (hammingDist w c : ℝ) < δ₀ * Fintype.card P → g w = c)
    {c : U × P → F} (hc : c ∈ tannerCode ⇑R C₀) {y : U × P → F}
    (hy : (hammingDist y c : ℝ) ≤ δ₀ ^ 2 * Fintype.card P * Fintype.card U / 18)
    {j : ℕ} (hj : (3 / 4 : ℝ) ^ j * (δ₀ * Fintype.card U / 9) < 1) :
    ∀ m, j + 1 ≤ m → alternatingCorrection R g m y = c := by
  sorry

end TauCetiRoadmap.ExpanderWalksAndCodes
