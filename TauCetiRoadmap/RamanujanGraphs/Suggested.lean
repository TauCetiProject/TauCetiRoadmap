import Mathlib
import TauCeti.Analysis.Matrix.SpectralMeasure

/-!
# Ramanujan graphs: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here.

Graphs are Mathlib's `SimpleGraph V` on a `Fintype` with decidable equality and decidable
adjacency. A signing is a function `s : G.edgeSet → ℤˣ`, and its signed adjacency matrix is the
one of the roadmap MatchingPolynomial; the 2-lift of `G` along `s` lives on `V × Bool`. A real
polynomial is real-rooted when it splits over `ℝ` (`Polynomial.Splits`), and statements about the
largest root are written as "every root is at most some root", which needs no junk value for a
polynomial without roots. Real stability is stated for multivariate polynomials with real
coefficients evaluated on the open upper half-plane in every variable. Ramanujan graphs, the
Riemann hypothesis for the Ihara zeta function and the counts of closed non-backtracking walks
are those of the roadmap IharaZetaFunction; sorted adjacency eigenvalues are those of the roadmap
SpectralGraphBounds. The empirical spectral measure of a graph is Tau Ceti's
`Matrix.spectralMeasure` of its real adjacency matrix, and weak convergence is stated through
bounded continuous test functions.

Definitions of other roadmaps that the statements mention are copied verbatim, each with a
docstring naming its owner and section: from MatchingPolynomial `matchingCount`,
`matchingPolynomial` and `signedAdjMatrix`; from IharaZetaFunction `hashimotoMatrix`,
`IsNonBacktrackingCycle`, `closedNonBacktrackingCount`, `IsRamanujan` and
`SatisfiesRiemannHypothesis`; from SpectralGraphBounds `adjEigenvalues`.
-/

noncomputable section

open Polynomial Finset Filter Topology MeasureTheory

namespace TauCetiRoadmap.RamanujanGraphs

/-! ## Definitions copied verbatim from MatchingPolynomial -/

section CopiedFromMatchingPolynomial

variable {V : Type*}

/-- 3.2 (copied verbatim from MatchingPolynomial 1.1): the number `m_k` of matchings of `G` with
exactly `k` edges, a matching being a subgraph `M` with `M.IsMatching`. On a finite vertex type
the set is finite; `m_0 = 1` (the empty subgraph). -/
noncomputable def matchingCount (G : SimpleGraph V) (k : ℕ) : ℕ :=
  {M : G.Subgraph | M.IsMatching ∧ M.edgeSet.ncard = k}.ncard

/-- 3.2 (copied verbatim from MatchingPolynomial 1.1): the matching polynomial
`μ(G, x) = Σ_(0 ≤ k ≤ n/2) (−1)^k m_k x^(n − 2k)` of a graph on a finite vertex type with `n`
vertices. It is monic of degree `n`, and `μ = 1` on the empty type. -/
noncomputable def matchingPolynomial [Finite V] (G : SimpleGraph V) : ℤ[X] :=
  ∑ k ∈ Finset.range (Nat.card V / 2 + 1),
    C ((-1) ^ k * (matchingCount G k : ℤ)) * X ^ (Nat.card V - 2 * k)

/-- 3.1 (copied verbatim from MatchingPolynomial 2.1): the signed adjacency matrix of a signing
`s` of the edges of `G`: the entry at `(i, j)` is `s` of the edge `ij` when `i ~ j`, and `0`
otherwise. -/
def signedAdjMatrix [DecidableEq V] (G : SimpleGraph V) [DecidableRel G.Adj]
    (s : G.edgeSet → ℤˣ) : Matrix V V ℤ :=
  Matrix.of fun i j =>
    if h : G.Adj i j then ((s ⟨s(i, j), (SimpleGraph.mem_edgeSet G).2 h⟩ : ℤˣ) : ℤ) else 0

end CopiedFromMatchingPolynomial

/-! ## Definitions copied verbatim from IharaZetaFunction -/

section CopiedFromIharaZetaFunction

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- 3.3 (copied verbatim from IharaZetaFunction 1.1): the Hashimoto (non-backtracking edge)
matrix on darts: the entry at `(a, b)` is `1` when `a` ends where `b` starts and `b` is not the
reversal of `a`, and `0` otherwise. -/
def hashimotoMatrix (R : Type*) [Zero R] [One R] (G : SimpleGraph V) [DecidableRel G.Adj] :
    Matrix G.Dart G.Dart R :=
  Matrix.of fun a b => if a.snd = b.fst ∧ b ≠ a.symm then 1 else 0

/-- 4.1 (copied verbatim from IharaZetaFunction 1.2): a closed walk is a non-backtracking cycle
when no dart of `p.darts ++ p.darts.take 1` is followed by its reversal: no backtracking and no
tail. -/
def IsNonBacktrackingCycle {G : SimpleGraph V} {u : V} (p : G.Walk u u) : Prop :=
  (p.darts ++ p.darts.take 1).IsChain fun d d' => d' ≠ d.symm

/-- 4.1 (copied verbatim from IharaZetaFunction 1.2): the number `N_m` of closed
non-backtracking cycles of length `m`, each counted with its starting vertex. -/
def closedNonBacktrackingCount (G : SimpleGraph V) (m : ℕ) : ℕ :=
  Nat.card {c : Σ u : V, G.Walk u u // c.2.length = m ∧ IsNonBacktrackingCycle c.2}

/-- 3.3 (copied verbatim from IharaZetaFunction 5.3): the Ramanujan property: every adjacency
eigenvalue `λ` with `|λ| ≠ q + 1` has `|λ| ≤ 2√q`. -/
def IsRamanujan (q : ℕ) (G : SimpleGraph V) [DecidableRel G.Adj] : Prop :=
  ∀ v, |(G.isHermitian_adjMatrix ℝ).eigenvalues v| ≠ q + 1 →
    |(G.isHermitian_adjMatrix ℝ).eigenvalues v| ≤ 2 * Real.sqrt q

/-- 3.3 (copied verbatim from IharaZetaFunction 5.3): the Riemann hypothesis for `ζ(q^(−s))`:
every `s` with `0 < Re s < 1` and `det(1 − q^(−s) B) = 0` has `Re s = 1/2`. -/
def SatisfiesRiemannHypothesis (q : ℕ) (G : SimpleGraph V) [DecidableRel G.Adj] : Prop :=
  ∀ s : ℂ, 0 < s.re → s.re < 1 →
    Matrix.det (1 - (q : ℂ) ^ (-s) • hashimotoMatrix ℂ G) = 0 → s.re = 1 / 2

end CopiedFromIharaZetaFunction

/-! ## Definition copied verbatim from SpectralGraphBounds -/

section CopiedFromSpectralGraphBounds

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- 5.4 (copied verbatim from SpectralGraphBounds 1.1): the adjacency eigenvalues of `G`, with
multiplicity, in nonincreasing order: index `0` carries the largest one. -/
def adjEigenvalues (G : SimpleGraph V) [DecidableRel G.Adj] : Fin (Fintype.card V) → ℝ :=
  (G.isHermitian_adjMatrix ℝ).eigenvalues₀

end CopiedFromSpectralGraphBounds

/-! ## Layer 1: interlacing families of polynomials -/

/-- 1.1 The real roots of a real polynomial, with multiplicity, in nonincreasing order. -/
def sortedRoots (p : ℝ[X]) : List ℝ :=
  p.roots.sort (· ≥ ·)

/-- 1.1 Common interlacing: every member is real-rooted, and for all members `f i`, `f i'` and
every `j` with `j + 1 < deg (f i)`, the `(j + 2)`-nd largest root of `f i` is at most the
`(j + 1)`-st largest root of `f i'`. For real-rooted polynomials of one degree this is the
existence of a common interlacing polynomial. -/
def CommonlyInterlaced {ι : Type*} (f : ι → ℝ[X]) : Prop :=
  (∀ i, (f i).Splits) ∧
    ∀ i i' (j : ℕ), j + 1 < (f i).natDegree →
      (sortedRoots (f i)).getD (j + 1) 0 ≤ (sortedRoots (f i')).getD j 0

/-- 1.1 The partial sum `f_(τ|k)`: the sum of `f σ` over the assignments `σ` that agree with `τ`
at every index below `k`. -/
def partialSum {m : ℕ} {S : Fin m → Type*} [∀ k, Fintype (S k)] [∀ k, DecidableEq (S k)]
    (f : (∀ k, S k) → ℝ[X]) (k : ℕ) (τ : ∀ k, S k) : ℝ[X] :=
  ∑ σ ∈ univ.filter (fun σ : ∀ k, S k => ∀ i : Fin m, (i : ℕ) < k → σ i = τ i), f σ

/-- 1.1 An interlacing family: for every index `k` and every assignment `τ`, the partial sums
obtained by fixing the values below `k` as in `τ` and letting the value at `k` vary are commonly
interlaced. -/
def IsInterlacingFamily {m : ℕ} {S : Fin m → Type*} [∀ k, Fintype (S k)]
    [∀ k, DecidableEq (S k)] (f : (∀ k, S k) → ℝ[X]) : Prop :=
  ∀ (k : Fin m) (τ : ∀ k, S k),
    CommonlyInterlaced fun t : S k => partialSum f ((k : ℕ) + 1) (Function.update τ k t)

/-- 1.1 Interlacing families: if the members have positive leading coefficients and form an
interlacing family, some member has every root at most some root of the sum of all members. -/
theorem exists_isRoot_le_of_isInterlacingFamily {m : ℕ} {S : Fin m → Type*}
    [∀ k, Fintype (S k)] [∀ k, DecidableEq (S k)] [∀ k, Nonempty (S k)]
    (f : (∀ k, S k) → ℝ[X]) (hlc : ∀ σ, 0 < (f σ).leadingCoeff)
    (hf : IsInterlacingFamily f) :
    ∃ σ, ∀ x : ℝ, (f σ).IsRoot x → ∃ y : ℝ, (∑ σ', f σ').IsRoot y ∧ x ≤ y := by
  sorry

/-- 1.2 Two real-rooted polynomials of one degree with positive leading coefficients are
commonly interlaced if and only if every convex combination of them is real-rooted. -/
theorem commonlyInterlaced_pair_iff {f g : ℝ[X]} (hf : f.Splits) (hg : g.Splits)
    (hdeg : f.natDegree = g.natDegree) (hfl : 0 < f.leadingCoeff) (hgl : 0 < g.leadingCoeff) :
    CommonlyInterlaced ![f, g] ↔ ∀ t ∈ Set.Icc (0 : ℝ) 1, (C t * f + C (1 - t) * g).Splits := by
  sorry

/-! ## Layer 2: real stability -/

/-- 2.1 Real stability: `p` does not vanish when every variable lies in the open upper
half-plane. The zero polynomial is not real stable in this sense. -/
def IsRealStable {σ : Type*} (p : MvPolynomial σ ℝ) : Prop :=
  ∀ z : σ → ℂ, (∀ i, 0 < (z i).im) → MvPolynomial.aeval z p ≠ 0

/-- 2.1 Determinantal polynomials: for a real symmetric `D` and real vectors `a i`, the
polynomial `det(x I + D + Σ_i y_i a_i a_iᵀ)` in the variables `x = X none` and
`y_i = X (some i)` is real stable. -/
theorem isRealStable_det {n ι : Type*} [Fintype n] [DecidableEq n] [Fintype ι]
    (D : Matrix n n ℝ) (hD : D.IsSymm) (a : ι → n → ℝ) :
    IsRealStable (Matrix.det
      ((MvPolynomial.X none : MvPolynomial (Option ι) ℝ) •
          (1 : Matrix n n (MvPolynomial (Option ι) ℝ)) +
        D.map MvPolynomial.C +
        ∑ i, (MvPolynomial.X (some i) : MvPolynomial (Option ι) ℝ) •
          (Matrix.vecMulVec (a i) (a i)).map MvPolynomial.C)) := by
  sorry

/-- 2.1 Directional derivatives: if `p` is real stable and `α, β ≥ 0`, then
`p + α ∂p/∂z_j + β ∂p/∂z_k` is real stable. -/
theorem IsRealStable.add_pderiv {σ : Type*} {p : MvPolynomial σ ℝ} (hp : IsRealStable p)
    (j k : σ) {α β : ℝ} (hα : 0 ≤ α) (hβ : 0 ≤ β) :
    IsRealStable (p + MvPolynomial.C α * MvPolynomial.pderiv j p +
      MvPolynomial.C β * MvPolynomial.pderiv k p) := by
  sorry

/-- 2.1 Real specialisation: if `p` in the variables `x = X none` and `y_t = X (some t)` is real
stable and monic as a polynomial in `x`, then setting every `y_t` to a real number `c t` leaves
a real-rooted polynomial in `x`. -/
theorem IsRealStable.splits_map_eval {τ : Type*} {p : MvPolynomial (Option τ) ℝ}
    (hp : IsRealStable p) (hmon : (MvPolynomial.optionEquivLeft ℝ τ p).Monic) (c : τ → ℝ) :
    ((MvPolynomial.optionEquivLeft ℝ τ p).map (MvPolynomial.eval c)).Splits := by
  sorry

/-- 2.2 Expected characteristic polynomials of rank-one updates: for a real symmetric `D`, real
vectors `a i`, `b i` and probabilities `p i ∈ [0, 1]`, the polynomial
`Σ_S (Π_(i ∈ S) p_i)(Π_(i ∉ S) (1 − p_i)) det(x I + D + Σ_(i ∈ S) a_i a_iᵀ + Σ_(i ∉ S) b_i b_iᵀ)`
is real-rooted. -/
theorem splits_sum_prod_charpoly {n ι : Type*} [Fintype n] [DecidableEq n] [Fintype ι]
    [DecidableEq ι] (D : Matrix n n ℝ) (hD : D.IsSymm) (a b : ι → n → ℝ) (p : ι → ℝ)
    (hp : ∀ i, p i ∈ Set.Icc (0 : ℝ) 1) :
    (∑ S : Finset ι, C ((∏ i ∈ S, p i) * ∏ i ∈ Sᶜ, (1 - p i)) *
      (-(D + ∑ i ∈ S, Matrix.vecMulVec (a i) (a i) +
        ∑ i ∈ Sᶜ, Matrix.vecMulVec (b i) (b i))).charpoly).Splits := by
  sorry

/-! ## Layer 3: 2-lifts and bipartite Ramanujan graphs -/

section Lifts

variable {V : Type*}

/-- 3.1 The 2-lift of `G` along a signing `s`, on `V × Bool`: an edge `uv` with `s(uv) = 1`
lifts to `(u, b) ~ (v, b)`, and one with `s(uv) = −1` lifts to `(u, b) ~ (v, !b)`. -/
def twoLift (G : SimpleGraph V) (s : G.edgeSet → ℤˣ) : SimpleGraph (V × Bool) :=
  SimpleGraph.fromRel fun x y =>
    ∃ h : G.Adj x.1 y.1, (s ⟨s(x.1, y.1), (SimpleGraph.mem_edgeSet G).2 h⟩ = 1 ↔ x.2 = y.2)

/-- 3.1 Adjacency in a 2-lift is decidable when adjacency in `G` is. -/
instance [DecidableEq V] (G : SimpleGraph V) [DecidableRel G.Adj] (s : G.edgeSet → ℤˣ) :
    DecidableRel (twoLift G s).Adj := fun x y => by
  unfold twoLift
  rw [SimpleGraph.fromRel_adj]
  infer_instance

/-- 3.1 Bilu–Linial: the characteristic polynomial of a 2-lift is the product of those of the
adjacency matrix and of the signed adjacency matrix. -/
theorem charpoly_adjMatrix_twoLift [Fintype V] [DecidableEq V] (G : SimpleGraph V)
    [DecidableRel G.Adj] (s : G.edgeSet → ℤˣ) :
    ((twoLift G s).adjMatrix ℤ).charpoly =
      (G.adjMatrix ℤ).charpoly * (signedAdjMatrix G s).charpoly := by
  sorry

/-- 3.2 Marcus–Spielman–Srivastava: if each edge is signed `+1` independently with probability
`p e ∈ [0, 1]`, the expected characteristic polynomial of the signed adjacency matrix is
real-rooted. -/
theorem splits_sum_prod_charpoly_signedAdjMatrix [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] (p : G.edgeSet → ℝ)
    (hp : ∀ e, p e ∈ Set.Icc (0 : ℝ) 1) :
    (∑ s : G.edgeSet → ℤˣ, C (∏ e, if s e = 1 then p e else 1 - p e) *
      (signedAdjMatrix G s).charpoly.map (Int.castRingHom ℝ)).Splits := by
  sorry

/-- 3.2 Marcus–Spielman–Srivastava: every finite graph has a signing whose signed adjacency
matrix has every eigenvalue at most some root of the matching polynomial. -/
theorem exists_signedAdjMatrix_isRoot_le [Fintype V] [DecidableEq V] (G : SimpleGraph V)
    [DecidableRel G.Adj] :
    ∃ s : G.edgeSet → ℤˣ, ∀ x : ℝ,
      ((signedAdjMatrix G s).charpoly.map (Int.castRingHom ℝ)).IsRoot x →
        ∃ y : ℝ, ((matchingPolynomial G).map (Int.castRingHom ℝ)).IsRoot y ∧ x ≤ y := by
  sorry

end Lifts

/-- 3.3 Marcus–Spielman–Srivastava: for every `d ≥ 3` and `k` there is a connected bipartite
`d`-regular Ramanujan graph on `2d · 2^k` vertices; its Ihara zeta function satisfies the Riemann
hypothesis. -/
theorem exists_connected_isBipartite_isRamanujan {d : ℕ} (hd : 3 ≤ d) (k : ℕ) :
    ∃ G : SimpleGraph (Fin (2 * d * 2 ^ k)), ∃ _ : DecidableRel G.Adj,
      G.IsRegularOfDegree d ∧ G.IsBipartite ∧ G.Connected ∧ IsRamanujan (d - 1) G ∧
        SatisfiesRiemannHypothesis (d - 1) G := by
  sorry

/-! ## Layer 4: the Ramanujan property as a square-root error term -/

section Ihara

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- 4.1 The counts `N_m` of closed non-backtracking walks of a `(q + 1)`-regular graph, `q ≥ 1`,
are a main term `M_m` built from the edge count and the multiplicities `κ`, `β` of the
eigenvalues `q + 1` and `−(q + 1)`, plus an error. The graph is Ramanujan if and only if the
error is `O(q^(m/2))`, and then it is at most `2 (n − κ − β) q^(m/2)`. -/
theorem abs_closedNonBacktrackingCount_sub_le (G : SimpleGraph V) [DecidableRel G.Adj] {q : ℕ}
    (hq : 1 ≤ q) (hG : G.IsRegularOfDegree (q + 1)) :
    let κ : ℕ := #{v | (G.isHermitian_adjMatrix ℝ).eigenvalues v = q + 1}
    let β : ℕ := #{v | (G.isHermitian_adjMatrix ℝ).eigenvalues v = -(q + 1)}
    let M : ℕ → ℝ := fun m =>
      ((#G.edgeFinset : ℝ) - Fintype.card V) * (1 + (-1) ^ m) + κ * ((q : ℝ) ^ m + 1) +
        β * ((-(q : ℝ)) ^ m + (-1) ^ m)
    (IsRamanujan q G → ∀ m, 1 ≤ m →
        |(closedNonBacktrackingCount G m : ℝ) - M m| ≤
          2 * ((Fintype.card V : ℝ) - κ - β) * Real.sqrt q ^ m) ∧
      (IsRamanujan q G ↔ ∃ c : ℝ, ∀ m, 1 ≤ m →
        |(closedNonBacktrackingCount G m : ℝ) - M m| ≤ c * Real.sqrt q ^ m) := by
  sorry

end Ihara

/-! ## Layer 5: the regular tree and the spectra of large regular graphs -/

/-- 5.1 Weighted counts of walks in the `d`-regular tree from its root: `treeWalkCount d ℓ h` is
the number of walks of length `ℓ` from the root that end at distance `h` from it, summed over
the vertices at distance `h`. A step away from the root has `d` choices at the root and `d − 1`
elsewhere; a step towards it has one. The tree numbers are `t_ℓ = treeWalkCount d ℓ 0`. -/
def treeWalkCount (d : ℕ) : ℕ → ℕ → ℕ
  | 0, h => if h = 0 then 1 else 0
  | ℓ + 1, 0 => treeWalkCount d ℓ 1
  | ℓ + 1, h + 1 => (if h = 0 then d else d - 1) * treeWalkCount d ℓ h + treeWalkCount d ℓ (h + 2)

section Regular

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- 5.1 In a `d`-regular graph the number of closed walks of length `ℓ` at a vertex `v` is at
least the tree number `t_ℓ`, with equality when the vertices at distance at most `ℓ / 2` from
`v` induce an acyclic graph. -/
theorem treeWalkCount_le_adjMatrix_pow_apply (G : SimpleGraph V) [DecidableRel G.Adj] {d : ℕ}
    (hd : G.IsRegularOfDegree d) (v : V) (ℓ : ℕ) :
    treeWalkCount d ℓ 0 ≤ (G.adjMatrix ℕ ^ ℓ) v v ∧
      ((G.induce {w | G.edist v w ≤ ((ℓ / 2 : ℕ) : ℕ∞)}).IsAcyclic →
        (G.adjMatrix ℕ ^ ℓ) v v = treeWalkCount d ℓ 0) := by
  sorry

end Regular

/-- 5.2 The Kesten–McKay measure of degree `d`, with density
`d √(4(d − 1) − x²) / (2π (d² − x²))` on `|x| ≤ 2√(d − 1)` and `0` elsewhere (the square root of
a negative number being `0`). For `d ≥ 2` it is a probability measure. -/
def kestenMcKay (d : ℕ) : Measure ℝ :=
  volume.withDensity fun x =>
    ENNReal.ofReal ((d : ℝ) * Real.sqrt (4 * ((d : ℝ) - 1) - x ^ 2) /
      (2 * Real.pi * ((d : ℝ) ^ 2 - x ^ 2)))

/-- 5.2 For `d ≥ 2` the Kesten–McKay measure is a probability measure carried by
`[−2√(d − 1), 2√(d − 1)]`, and its moments are the tree numbers. -/
theorem kestenMcKay_moments {d : ℕ} (hd : 2 ≤ d) :
    IsProbabilityMeasure (kestenMcKay d) ∧
      kestenMcKay d (Set.Icc (-(2 * Real.sqrt ((d : ℝ) - 1))) (2 * Real.sqrt ((d : ℝ) - 1)))ᶜ =
        0 ∧
      ∀ ℓ : ℕ, ∫ x, x ^ ℓ ∂(kestenMcKay d) = treeWalkCount d ℓ 0 := by
  sorry

open Classical in
/-- 5.3 McKay's theorem: if `G j` are `d`-regular graphs, `d ≥ 2`, and for every `k` the
proportion of vertices lying on a cycle of length `k` tends to `0`, then the empirical spectral
measures of their adjacency matrices converge weakly to the Kesten–McKay measure. -/
theorem tendsto_integral_spectralMeasure_kestenMcKay {d : ℕ} (hd : 2 ≤ d) {V : ℕ → Type*}
    [∀ j, Fintype (V j)] [∀ j, DecidableEq (V j)] [∀ j, Nonempty (V j)]
    (G : ∀ j, SimpleGraph (V j)) [∀ j, DecidableRel (G j).Adj]
    (hreg : ∀ j, (G j).IsRegularOfDegree d)
    (hcyc : ∀ k : ℕ, Tendsto (fun j =>
      (#{v | ∃ p : (G j).Walk v v, p.IsCycle ∧ p.length = k} : ℝ) / Fintype.card (V j))
        atTop (𝓝 0))
    (f : BoundedContinuousFunction ℝ ℝ) :
    Tendsto (fun j => ∫ x, f x ∂(((G j).adjMatrix ℝ).spectralMeasure
        ((G j).isHermitian_adjMatrix ℝ) : Measure ℝ)) atTop
      (𝓝 (∫ x, f x ∂(kestenMcKay d))) := by
  sorry

/-- 5.4 Serre's theorem: for every `d` and `ε > 0` there is `c > 0` such that every `d`-regular
graph on `n` vertices has at least `c n` adjacency eigenvalues greater than
`2√(d − 1) − ε`. -/
theorem exists_pos_mul_le_card_lt_adjEigenvalues (d : ℕ) {ε : ℝ} (hε : 0 < ε) :
    ∃ c : ℝ, 0 < c ∧ ∀ (n : ℕ) (G : SimpleGraph (Fin n)) [DecidableRel G.Adj],
      G.IsRegularOfDegree d →
        c * n ≤ #{i | 2 * Real.sqrt ((d : ℝ) - 1) - ε < adjEigenvalues G i} := by
  sorry

end TauCetiRoadmap.RamanujanGraphs
