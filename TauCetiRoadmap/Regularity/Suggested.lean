import Mathlib

/-!
# Graph regularity, finite weak regularity, and arity-3 hypergraph complexes: suggested signatures

**`README.md` is the definitive roadmap document** — its conventions, layer plan, consumed-Mathlib
inventory, acceptance gates, and references are the specification. This file is **not** the roadmap
and is **not exhaustive**: it records suggested Lean `sorry`-forms for *particular* milestones, so
contributors and reviewers converge on names and signatures. Discharging every statement here neither
finishes a layer nor the roadmap.

The pinned choices, at a glance: finite graphs use Mathlib's `SimpleGraph` and partitions use
`Finpartition (univ)` (`P ≤ Q` means *P refines Q*); the graph-side energy is the **size-weighted**
`weightedEnergy` (the `L²`-of-block-average energy, monotone under refinement), **not** Mathlib's
unweighted `Finpartition.energy`; hypergraphs are unordered (`UniformHypergraph`) with ordered
injective-tuple views for counting; top relations are a **total, unordered** coloring
`Colored3Graph κ₃ V`, and pair colors use a **separate** palette (`κ₂` for the generic lower-skeleton
API; the regular-approximation theorem chooses `Fin C.pairColorCount`). A polyad is genuinely built over a lower skeleton
(cells + the three pair colors); a subpolyad selects **arbitrary subgraphs of the parent polyad's
three pair graphs** (the vertex-subcell restriction is only a constructor), and top regularity is
the NRS-style rank-`r` test against unions of at most `r` subpolyads. The regular-approximation theorem quantifies an
**explicit approximant** `H'` within a pinned edit discrepancy of the original `H`: top regularity
is of `H'` relative to the complex's polyad decomposition, and counting is performed on `H'` — via
an intrinsic placed-count formula — and transferred back to `H` through the edit bound.

The finite roadmap is **self-contained**: Layer 3 is finite weak regularity (`steppedCount`,
`cutDiscrepancy`, a direct finite Frieze–Kannan theorem), owned here with no graphon imports —
finite-facing analytic comparison adapters are separate non-gating interfaces owned here (see
*Interoperability adapters* in `README.md`). Much
of Layers 1–4, and Boolean precursors of Layers 5–8, is proved in the prior formalization
[`cameronfreer/regularity-lemmata`](https://github.com/cameronfreer/regularity-lemmata) (see *Prior
formalization* in `README.md`); docstrings below point at the proved counterparts and record shape
deviations. This file imports only Mathlib.
-/

noncomputable section

open Finset

namespace TauCetiRoadmap.Regularity

variable {V : Type*} [Fintype V] [DecidableEq V]
variable {κ₂ κ₃ : Type*} [Fintype κ₂] [DecidableEq κ₂] [Fintype κ₃] [DecidableEq κ₃]

/-! ### Layer 0 — finite colored graph and 3-uniform vocabulary -/

/-- **Layer 0.** A finite `r`-uniform hypergraph: a finset of `r`-element edges. This is the public
representation for every layer above, because the densities and counts they state need finiteness
that Mathlib's set-based `Hypergraph` does not carry; `toHypergraph` relates the two. -/
structure UniformHypergraph (r : ℕ) (V : Type*) [DecidableEq V] where
  edges : Finset (Finset V)
  edge_card : ∀ e ∈ edges, e.card = r

/-- **Layer 0.** The bridge to Mathlib's set-based carrier: the whole host as the vertex set, and the
finite edges coerced to sets. -/
def UniformHypergraph.toHypergraph {r : ℕ} (H : UniformHypergraph r V) : Hypergraph V := sorry

/-- **Layer 0.** The bridge keeps the whole host as its vertex set. -/
theorem UniformHypergraph.toHypergraph_vertexSet {r : ℕ} (H : UniformHypergraph r V) :
    H.toHypergraph.vertexSet = (Set.univ : Set V) := sorry

/-- **Layer 0.** The bridge's edges are exactly the coercions of the finite edges — the agreement
statement that makes the two representations interchangeable as carriers. -/
theorem UniformHypergraph.toHypergraph_edgeSet {r : ℕ} (H : UniformHypergraph r V) :
    H.toHypergraph.edgeSet = {e : Set V | ∃ f ∈ H.edges, (f : Set V) = e} := sorry

/-- **Layer 0.** Edge density of an `r`-uniform hypergraph. Convention: the density is `0` when
`Fintype.card V < r` (`Nat.choose` is then `0`, and `_ / 0 = 0`); substantive lemmas assume
`r ≤ Fintype.card V`. -/
def UniformHypergraph.edgeDensity {r : ℕ} (H : UniformHypergraph r V) : ℚ :=
  (H.edges.card : ℚ) / ((Fintype.card V).choose r : ℚ)

/-- **Layer 0.** The top-coloring carrier: a **total** coloring of **unordered** triples into the top
palette `κ₃` (symmetric by construction — matching the unordered-hypergraph convention — so every
triple has exactly one color). A non-edge/complement, if needed, is one of the palette values. -/
structure Colored3Graph (κ₃ : Type*) (V : Type*) [DecidableEq V] where
  color : {s : Finset V // s.card = 3} → κ₃

/-! ### Layer 1 — partitions, block densities, refinement, energy -/

/-- **Layer 1.** Density of a hypergraph's edges inside a vertex set `s`. -/
def UniformHypergraph.blockDensity {r : ℕ} (H : UniformHypergraph r V) (s : Finset V) : ℚ :=
  ((H.edges.filter (· ⊆ s)).card : ℚ) / (s.card.choose r : ℚ)

/-- **Layer 1.** The **size-weighted** partition energy: the `L²` norm of the block-average step
function, `∑ᵢⱼ (|Aᵢ||Aⱼ|/n²)·d(Aᵢ,Aⱼ)²`. Casts precede division (no `Nat`-division leakage), and it
**includes** the diagonal blocks `i = j` — the full `L²`-of-block-average energy, deliberately **not**
Mathlib's `offDiag`-based `Finpartition.energy`. -/
def weightedEnergy (G : SimpleGraph V) [DecidableRel G.Adj]
    (P : Finpartition (univ : Finset V)) : ℝ :=
  ∑ A ∈ P.parts, ∑ B ∈ P.parts,
    ((A.card : ℝ) * (B.card : ℝ) / (Fintype.card V : ℝ) ^ 2) * ((G.edgeDensity A B : ℝ)) ^ 2

/-- **Layer 1.** Weighted energy is monotone under refinement (`P ≤ Q` = `P` finer, so more energy) —
true by `L²`-Pythagoras. This is the reusable input; Mathlib's unweighted `Finpartition.energy` is
**not** Jensen-monotone under arbitrary refinement (only inside its `increment` argument).
Proved counterparts in `regularity-lemmata` (`Partition/Energy.lean`): `energy` with `energy_mono`
and `energy_le_one`, in greater generality (directed relations on an arbitrary `Finset` host). -/
theorem weightedEnergy_mono_of_refines (G : SimpleGraph V) [DecidableRel G.Adj]
    {P Q : Finpartition (univ : Finset V)} (h : P ≤ Q) :
    weightedEnergy G Q ≤ weightedEnergy G P := sorry

/-! ### Layer 2 — Szemerédi graph regularity: a construction over Mathlib

`szemeredi_regularity` takes no seed and relates its output to nothing, and the seed cannot be
reintroduced afterwards: uniformity is not hereditary, so post-refinement is invalid, and common
refinement destroys equitability. Mathlib still supplies the analytic content — its exported
increment exactly refines its input, keeps equitability, and carries the gain and the bound. Two
pieces are built here over it: an initial equitable partition almost-refining the seed, and seeded
execution of the energy induction. -/

/-- **Layer 2.** `P` almost-refines `P₀`: each `P₀`-part is covered, up to a `δ`-fraction, by
`P`-parts contained in it. -/
def AlmostRefines (P P₀ : Finpartition (univ : Finset V)) (δ : ℝ) : Prop :=
  ∀ A ∈ P₀.parts, ∃ T ⊆ P.parts, (∀ B ∈ T, B ⊆ A) ∧
    ((A \ T.biUnion id).card : ℝ) ≤ δ * A.card

/-- **Layer 2.** The `V`-independent complexity bound for the refining-regularity theorem: it bounds
a partition that is simultaneously regular, equitable, and almost-refining. The prior
formalization's `regularityBound ⌈1/ε⁵⌉ #P₀.parts` bounds only its intermediate exact refinement, so
the value here is established at this layer. -/
def refiningRegularityBound (ε : ℝ) (l : ℕ) : ℕ := sorry

/-- **Layer 2.** A regular equipartition almost-refining `P₀`, with a host-independent complexity
bound and an explicit large-host hypothesis. -/
theorem exists_regular_equipartition_almost_refining (G : SimpleGraph V) [DecidableRel G.Adj]
    (P₀ : Finpartition (univ : Finset V)) (hP₀ : P₀.IsEquipartition) (ε : ℝ) (hε : 0 < ε)
    (hV : refiningRegularityBound ε P₀.parts.card ≤ Fintype.card V) :
    ∃ P : Finpartition (univ : Finset V),
      P.IsEquipartition ∧ P.IsUniform G ε ∧ AlmostRefines P P₀ ε ∧
        P.parts.card ≤ refiningRegularityBound ε P₀.parts.card := sorry

/-! ### Layer 3 — finite weak regularity -/

/-- **Layer 3.** The count predicted by the `P`-stepped graph on the test rectangle `(A, B)`: each
cell pair contributes its edge density times the trace masses `|A ∩ C|·|B ∩ D|`. Count-scaled
throughout — this layer is self-contained finite combinatorics, with no graphon imports (the
finite-facing analytic comparison adapters are separate non-gating interfaces; see `README.md`).
Proved counterpart:
`RegularityLemmata.steppedCount` (for directed relations). -/
def steppedCount (G : SimpleGraph V) [DecidableRel G.Adj]
    (P : Finpartition (univ : Finset V)) (A B : Finset V) : ℝ :=
  ∑ p ∈ P.parts ×ˢ P.parts,
    (G.edgeDensity p.1 p.2 : ℝ) * ((A ∩ p.1).card : ℝ) * ((B ∩ p.2).card : ℝ)

/-- **Layer 3.** The cut discrepancy of `G` against the `P`-stepped approximation: the maximum
rectangle deviation between the true interedge count and the stepped prediction. Deliberately
**count-scaled** (`|V|²`-sized, not normalized) and deliberately *not* called a "cut norm" — the
analytic cut norm is the graphon roadmap's independent object. Proved counterpart:
`RegularityLemmata.cutDiscrepancy`. -/
def cutDiscrepancy (G : SimpleGraph V) [DecidableRel G.Adj]
    (P : Finpartition (univ : Finset V)) : ℝ :=
  ((univ : Finset V).powerset ×ˢ (univ : Finset V).powerset).sup'
    (Finset.Nonempty.product ⟨∅, Finset.empty_mem_powerset _⟩
      ⟨∅, Finset.empty_mem_powerset _⟩)
    fun p => |((G.interedges p.1 p.2).card : ℝ) - steppedCount G P p.1 p.2|

/-- **Layer 3.** Elimination API: bounding the cut discrepancy is exactly the quantified rectangle
bound. Over the `univ` carrier, rectangles are bare `A B : Finset V` — no redundant `⊆ univ`
hypotheses. -/
theorem cutDiscrepancy_le_iff {G : SimpleGraph V} [DecidableRel G.Adj]
    {P : Finpartition (univ : Finset V)} {c : ℝ} :
    cutDiscrepancy G P ≤ c ↔ ∀ A B : Finset V,
      |((G.interedges A B).card : ℝ) - steppedCount G P A B| ≤ c := by
  rw [cutDiscrepancy, Finset.sup'_le_iff]
  constructor
  · intro h A B
    exact h (A, B) (Finset.mem_product.mpr
      ⟨Finset.mem_powerset.mpr A.subset_univ, Finset.mem_powerset.mpr B.subset_univ⟩)
  · rintro h ⟨A, B⟩ _
    exact h A B

/-- **Layer 3 (endpoint).** The finite Frieze–Kannan weak regularity theorem, with the rectangle
conclusion quantified (the directly usable form) and the explicit single-exponential bound. Proved
in `regularity-lemmata` (`frieze_kannan`, `Graph/FriezeKannan.lean`) by direct energy increment,
with **no analytic prerequisites**; the target here is its `SimpleGraph` specialization. -/
theorem frieze_kannan (G : SimpleGraph V) [DecidableRel G.Adj] (ε : ℝ) (hε : 0 < ε) :
    ∃ P : Finpartition (univ : Finset V), P.parts.card ≤ 4 ^ (⌈1 / ε ^ 2⌉₊ + 1) ∧
      ∀ A B : Finset V,
        |((G.interedges A B).card : ℝ) - steppedCount G P A B| ≤
          ε * (Fintype.card V : ℝ) ^ 2 := sorry

/-- **Layer 3.** The supremum form: the cut discrepancy itself is at most `ε·|V|²`, obtained from the
rectangle-quantified statement through `cutDiscrepancy_le_iff`. Proved counterpart:
`RegularityLemmata.frieze_kannan_cutDiscrepancy`. -/
theorem frieze_kannan_cutDiscrepancy (G : SimpleGraph V) [DecidableRel G.Adj] (ε : ℝ)
    (hε : 0 < ε) :
    ∃ P : Finpartition (univ : Finset V), P.parts.card ≤ 4 ^ (⌈1 / ε ^ 2⌉₊ + 1) ∧
      cutDiscrepancy G P ≤ ε * (Fintype.card V : ℝ) ^ 2 := by
  obtain ⟨P, hcard, hreg⟩ := frieze_kannan G ε hε
  exact ⟨P, hcard, cutDiscrepancy_le_iff.mpr hreg⟩

/-! ### Layer 4 — strong graph regularity -/

/-- **Layer 4.** The `V`-independent complexity bound for the fine partition, as a function of the
error, the schedule, and the **starting complexity** `l₀` (the larger of the requested minimum part
count and the input partition's size) — a bound in `ε, F` alone cannot dominate an arbitrary
starting partition (explicit value is a target). -/
def strongGraphRegularityBound (ε : ℝ) (F : ℕ → ℝ) (l₀ : ℕ) : ℕ := sorry

/-- **Layer 4.** The complexity bound for nested equitabilisation (explicit value is a target). -/
def nestedRefinementBound (δ : ℝ) (l : ℕ) : ℕ := sorry

/-- **Layer 4.** An equipartition has an exact refining regular equipartition of bounded
complexity. -/
theorem exists_regular_exact_refining_equipartition (G : SimpleGraph V) [DecidableRel G.Adj]
    (P : Finpartition (univ : Finset V)) (hP : P.IsEquipartition)
    (δ : ℝ) (hδ : 0 < δ) (hV : nestedRefinementBound δ P.parts.card ≤ Fintype.card V) :
    ∃ Q : Finpartition (univ : Finset V), Q ≤ P ∧ Q.IsEquipartition ∧
      Q.IsUniform G δ ∧ Q.parts.card ≤ nestedRefinementBound δ P.parts.card := sorry

/-- **Layer 4.** A strong-regularity witness: a coarse `P` and fine `Q` (`Q ≤ P`, i.e. `Q` refines
`P`), both equipartitions, with `P` `ε`-uniform, `Q` `F(#P.parts)`-uniform, a small weighted-energy
gap, and a complexity bound on `Q` in terms of the starting complexity `l₀`. The `boundedFine`
field is essential — it prevents `⊥` (discrete) from being the universal large-graph witness. The
proved counterpart (`RegularityLemmata.StrongWitness`) deviates: it has **no equipartition fields
and no coarse-partition regularity** (so `regP` has no proved analogue), bundles the error schedule
with its positivity (`ErrorSchedule`), and keeps the complexity bound in the theorem conclusion
rather than as a field. -/
structure StrongRegular (G : SimpleGraph V) [DecidableRel G.Adj]
    (P Q : Finpartition (univ : Finset V)) (ε : ℝ) (F : ℕ → ℝ) (l₀ : ℕ) : Prop where
  refines : Q ≤ P
  equitP : P.IsEquipartition
  equitQ : Q.IsEquipartition
  regP : P.IsUniform G ε
  regQ : Q.IsUniform G (F P.parts.card)
  energyClose : weightedEnergy G Q - weightedEnergy G P ≤ ε
  boundedFine : Q.parts.card ≤ strongGraphRegularityBound ε F l₀

/-- **Layer 4 (endpoint).** Strong graph regularity, **compositional form**: against a starting
equipartition `P₀` and a requested minimum complexity `l`, coarse/fine equipartitions with the
`StrongRegular` properties exist, with the coarse partition **almost-refining** `P₀` (the chosen
Layer-2 wrapper guarantees only almost-refinement of the *input* partition; the exact nesting
provided by `exists_regular_exact_refining_equipartition` holds between the partitions the iteration
itself constructs) and at least `l` parts —
the starting-partition and lower-bound parameters required by counting applications. -/
theorem exists_strong_regular (G : SimpleGraph V) [DecidableRel G.Adj]
    (P₀ : Finpartition (univ : Finset V)) (hP₀ : P₀.IsEquipartition) (l : ℕ)
    (ε : ℝ) (hε : 0 < ε) (F : ℕ → ℝ) (hF : ∀ n, 0 < F n)
    (hV : strongGraphRegularityBound ε F (max l P₀.parts.card) ≤ Fintype.card V) :
    ∃ P Q : Finpartition (univ : Finset V),
      StrongRegular G P Q ε F (max l P₀.parts.card) ∧ AlmostRefines P P₀ ε ∧
        l ≤ P.parts.card := sorry

/-! ### Layer 5 — hypergraph complexes; vertex cells and pair-color systems -/

/-- **Layer 5.** A down-closed `r`-dimensional complex: faces at each level `k ≤ r`, each a `k`-set,
closed under taking subsets. -/
structure HypergraphComplex (r : ℕ) (V : Type*) [DecidableEq V] where
  faces : ∀ k : ℕ, k ≤ r → Finset (Finset V)
  face_card : ∀ k (hk : k ≤ r), ∀ s ∈ faces k hk, s.card = k
  down_closed : ∀ k (hk : k ≤ r), ∀ s ∈ faces k hk, ∀ t ⊆ s,
    ∀ (htk : t.card ≤ r), t ∈ faces t.card htk

/-- Reversal of an ordered distinct pair. -/
def reversePair {V : Type*} (p : {p : V × V // p.1 ≠ p.2}) : {p : V × V // p.1 ≠ p.2} :=
  ⟨(p.1.2, p.1.1), p.2.symm⟩

/-- **Layer 5.** A pair-color system: a coloring of ordered **distinct** vertex pairs into the pair
palette `κ₂`, with an involutive reversal `rev` relating the two orientations. Diagonals `(v, v)`
are excluded, matching the injective top supports (no loops in the lower skeleton while the top
layer forbids them).

Polyad support (Layer 6) reads coordinate pairs at both orientations, while the route budget
(Layer 9) allots one color per **unordered** pattern pair; the shared involution is what
reconciles them, since canonical-orientation data determines polyad support only when `rev` is
common to the systems compared. Symmetric palettes (`rev = id`) and fixed-point-free ones both
instantiate this. -/
structure PairColorSystem (κ₂ : Type*) (V : Type*) where
  color : {p : V × V // p.1 ≠ p.2} → κ₂
  /-- The palette's reversal operation. -/
  rev : κ₂ → κ₂
  /-- Reversal is an involution. -/
  rev_involutive : Function.Involutive rev
  /-- Reversing a pair applies `rev` to its color. -/
  color_rev : ∀ p, color (reversePair p) = rev (color p)

/-- The pair color of an ordered pair, as an `Option` (`none` on the diagonal). This total form lets
densities and polyad conditions be stated without threading an `≠` proof. -/
def PairColorSystem.colorOfPair (S : PairColorSystem κ₂ V) (u v : V) : Option κ₂ :=
  if h : u ≠ v then some (S.color ⟨(u, v), h⟩) else none

/-- The reversal law at the `Option` level. -/
theorem PairColorSystem.colorOfPair_swap (S : PairColorSystem κ₂ V) (u v : V) :
    S.colorOfPair v u = (S.colorOfPair u v).map S.rev := by
  rw [PairColorSystem.colorOfPair, PairColorSystem.colorOfPair]
  by_cases h : u ≠ v
  · rw [dif_pos h, dif_pos (Ne.symm h), Option.map_some]
    exact congrArg some (S.color_rev ⟨(u, v), h⟩)
  · rw [dif_neg h, dif_neg (fun hn => h (Ne.symm hn)), Option.map_none]

/-- **Layer 5.** A raw directed coloring induces a coherent coloring on `κ₂ × κ₂`; the resulting
palette cardinality is squared in complexity and route bounds. -/
def PairColorSystem.ofRaw {κ₂ : Type*} {V : Type*} (color : {p : V × V // p.1 ≠ p.2} → κ₂) :
    PairColorSystem (κ₂ × κ₂) V where
  color p := (color p, color (reversePair p))
  rev := Prod.swap
  rev_involutive := Prod.swap_swap
  color_rev _ := rfl

/-- **Layer 5.** The density of pair-color `c` over the ordered cell pair `(s, t)`, among the
**distinct** ordered pairs. Convention: the density is `0` when there are no distinct pairs
(`_ / 0 = 0`); substantive lemmas assume a positive denominator. -/
def pairColorDensity (S : PairColorSystem κ₂ V) (c : κ₂) (s t : Finset V) : ℚ :=
  (((s ×ˢ t).filter (fun p => S.colorOfPair p.1 p.2 = some c)).card : ℚ) /
    (((s ×ˢ t).filter (fun p => p.1 ≠ p.2)).card : ℚ)

/-- **Layer 5.** The lower skeleton of a triadic complex: a vertex partition together with a
pair-color system. A standalone Layer-5 structure rather than a projection out of Layer 8's
`TriadicComplex3`, keeping Layer 5 independent of Layer 8. -/
structure PairSkeleton3 (κ₂ : Type*) (V : Type*) [Fintype V] [DecidableEq V] where
  vertexPart : Finpartition (univ : Finset V)
  pairColors : PairColorSystem κ₂ V

/-- **Layer 5.** The lower skeleton is `ε`-regular: **skeleton-relative** — for every color and every
ordered pair of **vertex cells** `A, B ∈ S.vertexPart.parts`, the per-color pair density is stable on
large enough sub-cells `A' ⊆ A`, `B' ⊆ B`. Quantifying over the actual cells (not arbitrary finsets)
is what ties pair regularity to the skeleton. -/
def IsPairColorRegular (S : PairSkeleton3 κ₂ V) (ε : ℝ) : Prop :=
  ∀ (c : κ₂), ∀ A ∈ S.vertexPart.parts, ∀ B ∈ S.vertexPart.parts, ∀ A' ⊆ A, ∀ B' ⊆ B,
    ε * (A.card : ℝ) ≤ A'.card → ε * (B.card : ℝ) ≤ B'.card →
      |(pairColorDensity S.pairColors c A' B' : ℝ) - (pairColorDensity S.pairColors c A B : ℝ)| ≤ ε

/-- **Layer 5.** Lower-skeleton regularity at the complexity given by vertex cells plus pair
colors. -/
def LowerSkeletonRegular (S : PairSkeleton3 κ₂ V) (F : ℕ → ℝ) : Prop :=
  IsPairColorRegular S (F (S.vertexPart.parts.card + Fintype.card κ₂))

/-! ### Layer 6 — triads, polyads, subpolyads, relative densities -/

/-- **Layer 6.** A polyad over a lower skeleton `S`: three vertex cells (each a part of `S`), the
three pair colors `color₀₁ / color₀₂ / color₁₂` on the coordinate pairs, and the support — the
role-ordered injective triples whose vertices lie in the three cells **and** whose three coordinate
pairs carry exactly those pair colors. So a polyad is determined by its cells and pair colors, not by
an arbitrary support finset, and the support is a definition. -/
structure Polyad3 (S : PairSkeleton3 κ₂ V) where
  c₀ : Finset V
  c₁ : Finset V
  c₂ : Finset V
  hc₀ : c₀ ∈ S.vertexPart.parts
  hc₁ : c₁ ∈ S.vertexPart.parts
  hc₂ : c₂ ∈ S.vertexPart.parts
  color₀₁ : κ₂
  color₀₂ : κ₂
  color₁₂ : κ₂

/-- **Layer 6.** The support determined by cells and pair colors. -/
def polyadSupport (C : PairColorSystem κ₂ V) (c₀ c₁ c₂ : Finset V) (k₀₁ k₀₂ k₁₂ : κ₂) :
    Finset {x : Fin 3 → V // Function.Injective x} :=
  univ.filter fun x => x.1 0 ∈ c₀ ∧ x.1 1 ∈ c₁ ∧ x.1 2 ∈ c₂ ∧
    C.colorOfPair (x.1 0) (x.1 1) = some k₀₁ ∧
    C.colorOfPair (x.1 0) (x.1 2) = some k₀₂ ∧
    C.colorOfPair (x.1 1) (x.1 2) = some k₁₂

theorem mem_polyadSupport {C : PairColorSystem κ₂ V} {c₀ c₁ c₂ : Finset V} {k₀₁ k₀₂ k₁₂ : κ₂}
    {x : {x : Fin 3 → V // Function.Injective x}} :
    x ∈ polyadSupport C c₀ c₁ c₂ k₀₁ k₀₂ k₁₂ ↔
      x.1 0 ∈ c₀ ∧ x.1 1 ∈ c₁ ∧ x.1 2 ∈ c₂ ∧
        C.colorOfPair (x.1 0) (x.1 1) = some k₀₁ ∧
        C.colorOfPair (x.1 0) (x.1 2) = some k₀₂ ∧
        C.colorOfPair (x.1 1) (x.1 2) = some k₁₂ := by
  simp [polyadSupport]

/-- **Layer 6.** A polyad's support. -/
def Polyad3.support {S : PairSkeleton3 κ₂ V} (P : Polyad3 S) :
    Finset {x : Fin 3 → V // Function.Injective x} :=
  polyadSupport S.pairColors P.c₀ P.c₁ P.c₂ P.color₀₁ P.color₀₂ P.color₁₂

theorem Polyad3.mem_support {S : PairSkeleton3 κ₂ V} (P : Polyad3 S)
    (x : {x : Fin 3 → V // Function.Injective x}) :
    x ∈ P.support ↔
      x.1 0 ∈ P.c₀ ∧ x.1 1 ∈ P.c₁ ∧ x.1 2 ∈ P.c₂ ∧
        S.pairColors.colorOfPair (x.1 0) (x.1 1) = some P.color₀₁ ∧
        S.pairColors.colorOfPair (x.1 0) (x.1 2) = some P.color₀₂ ∧
        S.pairColors.colorOfPair (x.1 1) (x.1 2) = some P.color₁₂ :=
  mem_polyadSupport

/-- **Layer 6.** A polyad is its six data fields. -/
theorem Polyad3.ext_data {S : PairSkeleton3 κ₂ V} {P Q : Polyad3 S}
    (h₀ : P.c₀ = Q.c₀) (h₁ : P.c₁ = Q.c₁) (h₂ : P.c₂ = Q.c₂)
    (k₀₁ : P.color₀₁ = Q.color₀₁) (k₀₂ : P.color₀₂ = Q.color₀₂)
    (k₁₂ : P.color₁₂ = Q.color₁₂) : P = Q := by
  obtain ⟨a₀, a₁, a₂, ha₀, ha₁, ha₂, x₀, x₁, x₂⟩ := P
  obtain ⟨b₀, b₁, b₂, hb₀, hb₁, hb₂, y₀, y₁, y₂⟩ := Q
  simp only at h₀ h₁ h₂ k₀₁ k₀₂ k₁₂
  subst h₀; subst h₁; subst h₂; subst k₀₁; subst k₀₂; subst k₁₂
  rfl

/-- The forgetful map onto the data, through the parts subtype. -/
def Polyad3.partData {S : PairSkeleton3 κ₂ V} (P : Polyad3 S) :
    (↥S.vertexPart.parts × ↥S.vertexPart.parts × ↥S.vertexPart.parts) × κ₂ × κ₂ × κ₂ :=
  ((⟨P.c₀, P.hc₀⟩, ⟨P.c₁, P.hc₁⟩, ⟨P.c₂, P.hc₂⟩), (P.color₀₁, P.color₀₂, P.color₁₂))

theorem Polyad3.partData_injective (S : PairSkeleton3 κ₂ V) :
    Function.Injective (Polyad3.partData (S := S)) := by
  intro P Q h
  simp only [Polyad3.partData, Prod.mk.injEq, Subtype.mk.injEq] at h
  exact Polyad3.ext_data h.1.1 h.1.2.1 h.1.2.2 h.2.1 h.2.2.1 h.2.2.2

/-- Decidable equality and finiteness, as `TriadicComplex3.polyads : Finset (Polyad3 _)` needs. -/
instance {S : PairSkeleton3 κ₂ V} [DecidableEq κ₂] : DecidableEq (Polyad3 S) :=
  (Polyad3.partData_injective S).decidableEq

noncomputable instance {S : PairSkeleton3 κ₂ V} [Fintype κ₂] : Fintype (Polyad3 S) :=
  Fintype.ofInjective _ (Polyad3.partData_injective S)

/-- **Layer 6.** The enumeration bound behind the complexity count. -/
theorem card_polyad3_le (S : PairSkeleton3 κ₂ V) [Fintype κ₂] :
    Fintype.card (Polyad3 S) ≤ S.vertexPart.parts.card ^ 3 * Fintype.card κ₂ ^ 3 := by
  have h := Fintype.card_le_of_injective _ (Polyad3.partData_injective S)
  simp only [Fintype.card_prod, Fintype.card_coe] at h
  calc Fintype.card (Polyad3 S)
      ≤ S.vertexPart.parts.card * (S.vertexPart.parts.card * S.vertexPart.parts.card) *
        (Fintype.card κ₂ * (Fintype.card κ₂ * Fintype.card κ₂)) := h
    _ = S.vertexPart.parts.card ^ 3 * Fintype.card κ₂ ^ 3 := by ring

/-- **Layer 6.** The polyad determined by cells and pair colors. -/
def Polyad3.ofData {S : PairSkeleton3 κ₂ V} (c₀ c₁ c₂ : Finset V)
    (h₀ : c₀ ∈ S.vertexPart.parts) (h₁ : c₁ ∈ S.vertexPart.parts) (h₂ : c₂ ∈ S.vertexPart.parts)
    (k₀₁ k₀₂ k₁₂ : κ₂) : Polyad3 S where
  c₀ := c₀
  c₁ := c₁
  c₂ := c₂
  hc₀ := h₀
  hc₁ := h₁
  hc₂ := h₂
  color₀₁ := k₀₁
  color₀₂ := k₀₂
  color₁₂ := k₁₂

/-- **Layer 6.** The adapter key dictionary for `regularity-lemmata`'s `polyadBlock`, which keys a
face by the coordinate it **omits** while `Polyad3` keys a role pair: the translation is
index-reversed. -/
def faceKey (k₀₁ k₀₂ k₁₂ : κ₂) : Fin 3 → κ₂ := ![k₁₂, k₀₂, k₀₁]

@[simp] theorem faceKey_zero (k₀₁ k₀₂ k₁₂ : κ₂) : faceKey k₀₁ k₀₂ k₁₂ 0 = k₁₂ := rfl

@[simp] theorem faceKey_one (k₀₁ k₀₂ k₁₂ : κ₂) : faceKey k₀₁ k₀₂ k₁₂ 1 = k₀₂ := rfl

@[simp] theorem faceKey_two (k₀₁ k₀₂ k₁₂ : κ₂) : faceKey k₀₁ k₀₂ k₁₂ 2 = k₀₁ := rfl

/-- **Layer 6.** The ordered coordinate pair of an injective triple at two distinct roles, as a
distinct pair. -/
def coordPair (x : {x : Fin 3 → V // Function.Injective x}) (i j : Fin 3) (hij : i ≠ j) :
    {p : V × V // p.1 ≠ p.2} :=
  ⟨(x.1 i, x.1 j), fun h => hij (x.2 h)⟩

/-- **Layer 6.** The pair graph of a polyad on roles `0, 1`: the distinct ordered pairs from
`c₀ × c₁` carrying pair color `color₀₁`. Subpolyads select **arbitrary subgraphs** of the three
pair graphs — the counting-ready test surface, not just vertex boxes. -/
def Polyad3.pairSupport₀₁ {S : PairSkeleton3 κ₂ V} (P : Polyad3 S) :
    Finset {p : V × V // p.1 ≠ p.2} :=
  univ.filter fun p => p.1.1 ∈ P.c₀ ∧ p.1.2 ∈ P.c₁ ∧ S.pairColors.color p = P.color₀₁

/-- **Layer 6.** The pair graph of a polyad on roles `0, 2`. -/
def Polyad3.pairSupport₀₂ {S : PairSkeleton3 κ₂ V} (P : Polyad3 S) :
    Finset {p : V × V // p.1 ≠ p.2} :=
  univ.filter fun p => p.1.1 ∈ P.c₀ ∧ p.1.2 ∈ P.c₂ ∧ S.pairColors.color p = P.color₀₂

/-- **Layer 6.** The pair graph of a polyad on roles `1, 2`. -/
def Polyad3.pairSupport₁₂ {S : PairSkeleton3 κ₂ V} (P : Polyad3 S) :
    Finset {p : V × V // p.1 ≠ p.2} :=
  univ.filter fun p => p.1.1 ∈ P.c₁ ∧ p.1.2 ∈ P.c₂ ∧ S.pairColors.color p = P.color₁₂

/-- **Layer 6.** A subpolyad of `P`, in the counting-ready Rödl–Schacht/NRS form: **arbitrary
subgraphs** of the parent's three pair graphs, with the support pinned to the parent tuples whose
three coordinate pairs land in the selected subgraphs. Shrinking only the vertex cells
(`Subpolyad3.ofSubcells`) is a special case, not the general test — vertex-box discrepancy alone is
not the strength the cited hypergraph counting machinery uses. -/
structure Subpolyad3 {S : PairSkeleton3 κ₂ V} (P : Polyad3 S) where
  pair₀₁ : Finset {p : V × V // p.1 ≠ p.2}
  pair₀₂ : Finset {p : V × V // p.1 ≠ p.2}
  pair₁₂ : Finset {p : V × V // p.1 ≠ p.2}
  pair₀₁_sub : pair₀₁ ⊆ P.pairSupport₀₁
  pair₀₂_sub : pair₀₂ ⊆ P.pairSupport₀₂
  pair₁₂_sub : pair₁₂ ⊆ P.pairSupport₁₂

/-- **Layer 6.** The subpolyad support — computed, like `polyadSupport`. -/
def subpolyadSupport {S : PairSkeleton3 κ₂ V} (P : Polyad3 S)
    (q₀₁ q₀₂ q₁₂ : Finset {p : V × V // p.1 ≠ p.2}) :
    Finset {x : Fin 3 → V // Function.Injective x} :=
  P.support.filter fun x =>
    coordPair x 0 1 (by decide) ∈ q₀₁ ∧ coordPair x 0 2 (by decide) ∈ q₀₂ ∧
      coordPair x 1 2 (by decide) ∈ q₁₂

theorem mem_subpolyadSupport {S : PairSkeleton3 κ₂ V} {P : Polyad3 S}
    {q₀₁ q₀₂ q₁₂ : Finset {p : V × V // p.1 ≠ p.2}}
    {x : {x : Fin 3 → V // Function.Injective x}} :
    x ∈ subpolyadSupport P q₀₁ q₀₂ q₁₂ ↔ x ∈ P.support ∧
      coordPair x 0 1 (by decide) ∈ q₀₁ ∧ coordPair x 0 2 (by decide) ∈ q₀₂ ∧
        coordPair x 1 2 (by decide) ∈ q₁₂ := by
  simp [subpolyadSupport]

/-- **Layer 6.** A subpolyad's support. -/
def Subpolyad3.support {S : PairSkeleton3 κ₂ V} {P : Polyad3 S} (Q : Subpolyad3 P) :
    Finset {x : Fin 3 → V // Function.Injective x} :=
  subpolyadSupport P Q.pair₀₁ Q.pair₀₂ Q.pair₁₂

/-- **Layer 6.** A subpolyad is its three selected pair graphs. -/
theorem Subpolyad3.ext_data {S : PairSkeleton3 κ₂ V} {P : Polyad3 S} {Q R : Subpolyad3 P}
    (h₀₁ : Q.pair₀₁ = R.pair₀₁) (h₀₂ : Q.pair₀₂ = R.pair₀₂) (h₁₂ : Q.pair₁₂ = R.pair₁₂) :
    Q = R := by
  obtain ⟨a, b, c, ha, hb, hc⟩ := Q
  obtain ⟨a', b', c', ha', hb', hc'⟩ := R
  simp only at h₀₁ h₀₂ h₁₂
  subst h₀₁; subst h₀₂; subst h₁₂
  rfl

theorem Subpolyad3.pairData_injective {S : PairSkeleton3 κ₂ V} (P : Polyad3 S) :
    Function.Injective (fun Q : Subpolyad3 P => (Q.pair₀₁, Q.pair₀₂, Q.pair₁₂)) := by
  intro Q R h
  simp only [Prod.mk.injEq] at h
  exact Subpolyad3.ext_data h.1 h.2.1 h.2.2

instance {S : PairSkeleton3 κ₂ V} (P : Polyad3 S) : DecidableEq (Subpolyad3 P) :=
  (Subpolyad3.pairData_injective P).decidableEq

noncomputable instance {S : PairSkeleton3 κ₂ V} (P : Polyad3 S) : Fintype (Subpolyad3 P) :=
  Fintype.ofInjective _ (Subpolyad3.pairData_injective P)

theorem coordPair_mem_pairSupport₀₁ {S : PairSkeleton3 κ₂ V} {P : Polyad3 S}
    {x : {x : Fin 3 → V // Function.Injective x}} (hx : x ∈ P.support) :
    coordPair x 0 1 (by decide) ∈ P.pairSupport₀₁ := by
  rw [P.mem_support] at hx
  obtain ⟨h₀, h₁, -, hk, -, -⟩ := hx
  have hne : x.1 0 ≠ x.1 1 := fun h => (by decide : (0 : Fin 3) ≠ 1) (x.2 h)
  rw [PairColorSystem.colorOfPair, dif_pos hne] at hk
  exact Finset.mem_filter.mpr ⟨Finset.mem_univ _, h₀, h₁, Option.some_injective _ hk⟩

theorem coordPair_mem_pairSupport₀₂ {S : PairSkeleton3 κ₂ V} {P : Polyad3 S}
    {x : {x : Fin 3 → V // Function.Injective x}} (hx : x ∈ P.support) :
    coordPair x 0 2 (by decide) ∈ P.pairSupport₀₂ := by
  rw [P.mem_support] at hx
  obtain ⟨h₀, -, h₂, -, hk, -⟩ := hx
  have hne : x.1 0 ≠ x.1 2 := fun h => (by decide : (0 : Fin 3) ≠ 2) (x.2 h)
  rw [PairColorSystem.colorOfPair, dif_pos hne] at hk
  exact Finset.mem_filter.mpr ⟨Finset.mem_univ _, h₀, h₂, Option.some_injective _ hk⟩

theorem coordPair_mem_pairSupport₁₂ {S : PairSkeleton3 κ₂ V} {P : Polyad3 S}
    {x : {x : Fin 3 → V // Function.Injective x}} (hx : x ∈ P.support) :
    coordPair x 1 2 (by decide) ∈ P.pairSupport₁₂ := by
  rw [P.mem_support] at hx
  obtain ⟨-, h₁, h₂, -, -, hk⟩ := hx
  have hne : x.1 1 ≠ x.1 2 := fun h => (by decide : (1 : Fin 3) ≠ 2) (x.2 h)
  rw [PairColorSystem.colorOfPair, dif_pos hne] at hk
  exact Finset.mem_filter.mpr ⟨Finset.mem_univ _, h₁, h₂, Option.some_injective _ hk⟩

/-- **Layer 6.** The vertex-subcell restriction, as a subpolyad; characterized by
`mem_ofSubcells_support`. -/
def Subpolyad3.ofSubcells {S : PairSkeleton3 κ₂ V} (P : Polyad3 S)
    (c₀' c₁' c₂' : Finset V) (_h₀ : c₀' ⊆ P.c₀) (_h₁ : c₁' ⊆ P.c₁) (_h₂ : c₂' ⊆ P.c₂) :
    Subpolyad3 P where
  pair₀₁ := P.pairSupport₀₁.filter fun p => p.1.1 ∈ c₀' ∧ p.1.2 ∈ c₁'
  pair₀₂ := P.pairSupport₀₂.filter fun p => p.1.1 ∈ c₀' ∧ p.1.2 ∈ c₂'
  pair₁₂ := P.pairSupport₁₂.filter fun p => p.1.1 ∈ c₁' ∧ p.1.2 ∈ c₂'
  pair₀₁_sub := Finset.filter_subset _ _
  pair₀₂_sub := Finset.filter_subset _ _
  pair₁₂_sub := Finset.filter_subset _ _

/-- **Layer 6.** The subcell restriction's support is the parent tuples landing in the sub-cells. -/
theorem Subpolyad3.mem_ofSubcells_support {S : PairSkeleton3 κ₂ V} {P : Polyad3 S}
    {c₀' c₁' c₂' : Finset V} (h₀ : c₀' ⊆ P.c₀) (h₁ : c₁' ⊆ P.c₁) (h₂ : c₂' ⊆ P.c₂)
    (x : {x : Fin 3 → V // Function.Injective x}) :
    x ∈ (Subpolyad3.ofSubcells P c₀' c₁' c₂' h₀ h₁ h₂).support ↔
      x ∈ P.support ∧ x.1 0 ∈ c₀' ∧ x.1 1 ∈ c₁' ∧ x.1 2 ∈ c₂' := by
  simp only [Subpolyad3.support, Subpolyad3.ofSubcells]
  rw [mem_subpolyadSupport]
  constructor
  · rintro ⟨hP, h01, h02, -⟩
    rw [Finset.mem_filter] at h01 h02
    exact ⟨hP, h01.2.1, h01.2.2, h02.2.2⟩
  · rintro ⟨hP, hx0, hx1, hx2⟩
    exact ⟨hP,
      Finset.mem_filter.mpr ⟨coordPair_mem_pairSupport₀₁ hP, hx0, hx1⟩,
      Finset.mem_filter.mpr ⟨coordPair_mem_pairSupport₀₂ hP, hx0, hx2⟩,
      Finset.mem_filter.mpr ⟨coordPair_mem_pairSupport₁₂ hP, hx1, hx2⟩⟩

/-- The underlying unordered triple of a role-ordered injective triple (a `3`-element finset). -/
def underlyingTriple (x : {x : Fin 3 → V // Function.Injective x}) : {s : Finset V // s.card = 3} :=
  ⟨univ.image x.1, by rw [Finset.card_image_of_injective _ x.2, Finset.card_univ, Fintype.card_fin]⟩

/-- **Layer 6.** The relative density of top color `c` over a support of injective triples: the
fraction whose **underlying unordered triple** has color `c`. Per-color, so induced counting keeps
control over complements/nonedges. Convention: `0` on the empty support (`_ / 0 = 0`). -/
def relDensityOn (H : Colored3Graph κ₃ V) (c : κ₃)
    (supp : Finset {x : Fin 3 → V // Function.Injective x}) : ℚ :=
  ((supp.filter (fun x => H.color (underlyingTriple x) = c)).card : ℚ) / (supp.card : ℚ)

/-- **Layer 6.** The relative density of top color `c` over a polyad — `relDensityOn` on its support. -/
def relativeDensity (H : Colored3Graph κ₃ V) (c : κ₃) {S : PairSkeleton3 κ₂ V}
    (P : Polyad3 S) : ℚ := relDensityOn H c P.support

/-! ### Layer 7 — top-layer regularity over polyads -/

/-- **Layer 7.** The union of the supports of a finite family of subpolyads — the NRS-style rank-`r`
test set. -/
def unionSupport {S : PairSkeleton3 κ₂ V} {P : Polyad3 S} {r : ℕ}
    (Q : Fin r → Subpolyad3 P) : Finset {x : Fin 3 → V // Function.Injective x} :=
  univ.biUnion fun i => (Q i).support

/-- **Layer 7.** `H` is `(δ, r)`-top-regular over the polyad `P`: for every top color and every
union of at most `r` **subpolyads** (arbitrary subgraphs of the parent pair graphs — the
Rödl–Schacht/Nagle–Rödl–Schacht test surface) carrying a `δ`-fraction of the parent support, the
relative density is stable. `r = 1` is the disc-regular form ("disc-regular" is descriptive
shorthand; NRS write `(δ, r)`-regular, so this is their `(δ, 1)`-regular case); Layer 9 pins the
rank the counting theorem needs from the pattern size. Prior-formalization correspondence:
`IsDiscRegularAt` (`r = 1`) and `IsPolyadRegularAt … r`. -/
def IsTopRegularOverPolyad (H : Colored3Graph κ₃ V) {S : PairSkeleton3 κ₂ V}
    (P : Polyad3 S) (δ : ℝ) (r : ℕ) : Prop :=
  ∀ (c : κ₃) (Q : Fin r → Subpolyad3 P),
    δ * (P.support.card : ℝ) ≤ ((unionSupport Q).card : ℝ) →
      |(relDensityOn H c (unionSupport Q) : ℝ) - (relativeDensity H c P : ℝ)| ≤ δ

/-- **Layer 7.** The honest **weaker** predicate: density stability on vertex-box restrictions only
(shrink the three cells, keep the full pair graphs). Useful as an intermediate target and for the
`r = 2` shadow gate — but **not** the predicate the induced-counting theorem consumes: vertex-box
discrepancy alone is generally not counting-ready strength. -/
def IsVertexBoxRegularOverPolyad (H : Colored3Graph κ₃ V) {S : PairSkeleton3 κ₂ V}
    (P : Polyad3 S) (ε : ℝ) : Prop :=
  ∀ (c : κ₃), ∀ c₀' ⊆ P.c₀, ∀ c₁' ⊆ P.c₁, ∀ c₂' ⊆ P.c₂,
    ε * (P.support.card : ℝ) ≤
        ((P.support.filter fun x => x.1 0 ∈ c₀' ∧ x.1 1 ∈ c₁' ∧ x.1 2 ∈ c₂').card : ℝ) →
      |(relDensityOn H c
            (P.support.filter fun x => x.1 0 ∈ c₀' ∧ x.1 1 ∈ c₁' ∧ x.1 2 ∈ c₂') : ℝ)
          - (relDensityOn H c P.support : ℝ)| ≤ ε

/-! ### Layer 8 — strong arity-3 regular approximation -/

/-- **Layer 8.** A triadic complex: it **chooses** the lower pair palette (`Fin pairColorCount`), a
lower `skeleton` over that palette, and a family of `polyads` **over that skeleton**. Bundling
`pairColorCount` here lets the regular-approximation theorem's complexity bound control the lower color system rather than
fixing an arbitrary ambient palette. -/
structure TriadicComplex3 (κ₃ : Type*) (V : Type*) [Fintype V] [DecidableEq V] where
  pairColorCount : ℕ
  skeleton : PairSkeleton3 (Fin pairColorCount) V
  polyads : Finset (Polyad3 skeleton)

/-- **Layer 8.** The complexity of a triadic complex: a **computed** structural measure — vertex
cells + pair colors + polyads — so `ComplexityBounded` and the local parameter `F C.complexity`
genuinely control the structure. (A free stored field could be set to `0` and would control
nothing.) Each component is individually bounded by it. -/
def TriadicComplex3.complexity (C : TriadicComplex3 κ₃ V) : ℕ :=
  C.skeleton.vertexPart.parts.card + C.pairColorCount + C.polyads.card

/-- **Layer 8.** The triadic complex as a generic down-closed complex. -/
def TriadicComplex3.toHypergraphComplex (C : TriadicComplex3 κ₃ V) : HypergraphComplex 3 V :=
  sorry

/-- **Layer 8.** The vertex partition is an equipartition with at least `t₀` cells. -/
def VertexCellsControlled (C : TriadicComplex3 κ₃ V) (t₀ : ℕ) : Prop :=
  C.skeleton.vertexPart.IsEquipartition ∧ t₀ ≤ C.skeleton.vertexPart.parts.card

/-- **Layer 8.** Six times the fraction of unordered triples on which `H` and `H'` disagree,
normalized by `|V|³`. -/
def editDiscrepancy3 (H H' : Colored3Graph κ₃ V) : ℚ :=
  (6 * ((univ.filter fun s : {s : Finset V // s.card = 3} => H.color s ≠ H'.color s).card : ℚ)) /
    ((Fintype.card V : ℚ) ^ 3)

/-- **Layer 8.** `H'` approximates `H` to within `ε`. -/
def Approximates3 (H H' : Colored3Graph κ₃ V) (ε : ℝ) : Prop :=
  (editDiscrepancy3 H H' : ℝ) ≤ ε

/-- **Layer 8.** The polyad supports are pairwise disjoint and cover every injective triple. -/
def IsPolyadDecomposition (C : TriadicComplex3 κ₃ V) : Prop :=
  (∀ P ∈ C.polyads, ∀ Q ∈ C.polyads, P ≠ Q → Disjoint P.support Q.support) ∧
    (∀ x : {x : Fin 3 → V // Function.Injective x}, ∃ P ∈ C.polyads, x ∈ P.support)

open Classical in
/-- **Layer 8.** The support-weighted mass of `C`'s polyads over which the coloring `H` fails to be
`η`-top-regular, relative to `C`'s polyad decomposition (`IsTopRegularOverPolyad` composes
directly). The coloring argument is generic; in the regular-approximation theorem it is applied to the **approximant**
`H'`, whose fidelity to the original is `Approximates3`. **Convention:** with no polyads or
all-empty supports the denominator is `0` and the mass is `0` (Lean's `_ / 0 = 0`); substantive
statements assume positive total support. -/
def exceptionalPolyadMass (H : Colored3Graph κ₃ V) (C : TriadicComplex3 κ₃ V)
    (η : ℝ) (r : ℕ) : ℝ :=
  (∑ P ∈ C.polyads, if IsTopRegularOverPolyad H P η r then (0 : ℝ) else (P.support.card : ℝ)) /
    (∑ P ∈ C.polyads, (P.support.card : ℝ))

/-- **Layer 8.** `H` is `(η, r)`-top-regular over all but an `ε`-fraction of `C`'s polyads. The
roles are separate: `η` (a value of `F` at the complexity) is the local top-regularity parameter,
`r` the NRS rank, and `ε` bounds the allowed exceptional mass. -/
def TopRegularOverMostPolyads (H : Colored3Graph κ₃ V) (C : TriadicComplex3 κ₃ V)
    (η ε : ℝ) (r : ℕ) : Prop :=
  exceptionalPolyadMass H C η r ≤ ε

/-- **Layer 8.** The complex's complexity is bounded by `b`. -/
def ComplexityBounded (C : TriadicComplex3 κ₃ V) (b : ℕ) : Prop :=
  C.complexity ≤ b

/-- **Layer 8.** The host-independent complexity bound, depending on the top palette, error
hierarchy, NRS rank, and requested vertex-complexity floor. -/
def regularityBound3 (q₃ : ℕ) (ε : ℝ) (F : ℕ → ℝ) (r t₀ : ℕ) : ℕ := sorry

/-- **Layer 8.** The strong arity-3 regular-approximation predicate, with an **explicit
approximant**: `H'` is within `ε` edit discrepancy of `H`, `C`'s polyads decompose the injective
triples, `C`'s lower skeleton is regular, the **approximant `H'`** is `(F C.complexity, r)`-top-
regular over most polyads (exceptional mass `ε`), and `C`'s complexity is bounded (by a bound
depending on the top palette size, the rank, and the vertex floor `t₀`). Counting happens on `H'`
and transfers to `H` through the edit bound (Layer 9). -/
def IsStrongRegularApproximation3 (H H' : Colored3Graph κ₃ V) (C : TriadicComplex3 κ₃ V)
    (ε : ℝ) (F : ℕ → ℝ) (r t₀ : ℕ) : Prop :=
  Approximates3 H H' ε ∧ IsPolyadDecomposition C ∧ LowerSkeletonRegular C.skeleton F ∧
    TopRegularOverMostPolyads H' C (F C.complexity) ε r ∧
    ComplexityBounded C (regularityBound3 (Fintype.card κ₃) ε F r t₀)

/-- **Layer 8 (endpoint).** Strong arity-3 regular approximation: for every requested NRS rank `r`
and vertex-complexity floor `t₀` (with `V` large enough to house it), every colored 3-graph has an
**explicit approximant** `H'` within `ε` edit discrepancy, together with a bounded-complexity
complex with **controlled vertex cells** (equitable, at least `t₀` of them — the diagonal-gate
input Layer 9 consumes) over which `H'` is `(·, r)`-regular. The complex **chooses** its own lower
pair palette (`Fin C.pairColorCount`), so the theorem does not assume an arbitrary fixed pair
palette works. Boolean precursors proved in `regularity-lemmata`: the weak endpoint
`exists_goodColoring` and the edited endpoint `exists_triadic_regular_approximation`, whose
deletion-only edited hypergraph is the Boolean specialization precedent for this
explicit-approximant architecture (the full shapes still differ; see the Layers 5–8 note in
`README.md`). -/
theorem exists_strong_regular_approximation3 (H : Colored3Graph κ₃ V)
    (ε : ℝ) (hε : 0 < ε) (F : ℕ → ℝ) (hF : ∀ n, 0 < F n) (r t₀ : ℕ)
    (hV : regularityBound3 (Fintype.card κ₃) ε F r t₀ ≤ Fintype.card V) :
    ∃ (H' : Colored3Graph κ₃ V) (C : TriadicComplex3 κ₃ V),
      VertexCellsControlled C t₀ ∧ IsStrongRegularApproximation3 H H' C ε F r t₀ := sorry

/-! ### Layer 9 — induced counting and embedding -/

/-- **Layer 9.** A finite colored 3-pattern: a colored 3-graph on `Fin k`. -/
structure FiniteColored3Pattern (κ₃ : Type*) where
  k : ℕ
  pattern : {s : Finset (Fin k) // s.card = 3} → κ₃

/-- **Layer 9.** The number of induced copies of a pattern in a colored 3-graph: labeled injective,
color-matching copies (explicit definition is a target). "Part-respecting" is reserved for the finer
local counting statement over placements into the polyads — this global count has no partition or
placement argument. -/
def Colored3Graph.inducedCopyCount (H : Colored3Graph κ₃ V) (F₀ : FiniteColored3Pattern κ₃) : ℕ :=
  sorry

/-- **Layer 9.** A placement of the pattern's vertices into the complex's vertex cells (cells may
repeat — the diagonal gate controls the repeated-cell mass). -/
structure PatternPlacement3 (C : TriadicComplex3 κ₃ V) (F₀ : FiniteColored3Pattern κ₃) where
  /-- The vertex cell assigned to each pattern vertex. -/
  vertexCell : Fin F₀.k → Finset V
  /-- Each assigned cell is a cell of the complex's vertex partition. -/
  vertexCell_mem : ∀ i, vertexCell i ∈ C.skeleton.vertexPart.parts

/-- **Layer 9.** The placement is transversal: the assigned vertex cells are pairwise distinct.
The placed counting theorem is stated for transversal placements; the diagonal gate bounds the
omitted repeated-cell placements. -/
def PatternPlacement3.Transversal {C : TriadicComplex3 κ₃ V} {F₀ : FiniteColored3Pattern κ₃}
    (φ : PatternPlacement3 C F₀) : Prop :=
  Function.Injective φ.vertexCell

/-- **Layer 9.** A lower-color route: one pair color for each canonical pair `i < j`, with every
induced pattern polyad belonging to `C`. -/
structure PairColorPlacement3 (C : TriadicComplex3 κ₃ V) (F₀ : FiniteColored3Pattern κ₃)
    (φ : PatternPlacement3 C F₀) where
  /-- The pair color assigned to each canonically oriented (`i < j`) pattern pair. -/
  pairColor : {p : Fin F₀.k × Fin F₀.k // p.1 < p.2} → Fin C.pairColorCount
  /-- Every pattern triple's induced polyad (in canonical orientation) belongs to the complex. -/
  polyad_mem : ∀ (i j l : Fin F₀.k) (hij : i < j) (hjl : j < l),
    Polyad3.ofData (φ.vertexCell i) (φ.vertexCell j) (φ.vertexCell l)
      (φ.vertexCell_mem i) (φ.vertexCell_mem j) (φ.vertexCell_mem l)
      (pairColor ⟨(i, j), hij⟩) (pairColor ⟨(i, l), hij.trans hjl⟩) (pairColor ⟨(j, l), hjl⟩)
      ∈ C.polyads

/-- **Layer 9.** The polyad a route induces at a pattern triple `i < j < l`. -/
def PairColorPlacement3.polyad {C : TriadicComplex3 κ₃ V} {F₀ : FiniteColored3Pattern κ₃}
    {φ : PatternPlacement3 C F₀} (ψ : PairColorPlacement3 C F₀ φ)
    (i j l : Fin F₀.k) (hij : i < j) (hjl : j < l) : Polyad3 C.skeleton :=
  Polyad3.ofData (φ.vertexCell i) (φ.vertexCell j) (φ.vertexCell l)
    (φ.vertexCell_mem i) (φ.vertexCell_mem j) (φ.vertexCell_mem l)
    (ψ.pairColor ⟨(i, j), hij⟩) (ψ.pairColor ⟨(i, l), hij.trans hjl⟩)
    (ψ.pairColor ⟨(j, l), hjl⟩)

/-- **Layer 9.** Every pattern triple's induced polyad is `(η, r)`-top-regular for `H'`. -/
def PairColorPlacement3.IsTopRegularRoute {C : TriadicComplex3 κ₃ V}
    {F₀ : FiniteColored3Pattern κ₃} {φ : PatternPlacement3 C F₀}
    (ψ : PairColorPlacement3 C F₀ φ) (H' : Colored3Graph κ₃ V) (η : ℝ) (r : ℕ) : Prop :=
  ∀ (i j l : Fin F₀.k) (hij : i < j) (hjl : j < l),
    IsTopRegularOverPolyad H' (ψ.polyad i j l hij hjl) η r

/-- **Layer 9.** The labeled injective copies realizing a fixed placement and lower-color route. -/
def placedInducedCopyCount (H : Colored3Graph κ₃ V) {C : TriadicComplex3 κ₃ V}
    {F₀ : FiniteColored3Pattern κ₃} (φ : PatternPlacement3 C F₀)
    (ψ : PairColorPlacement3 C F₀ φ) : ℕ := sorry

/-- **Layer 9.** The predicted count for `φ` and `ψ`: the injection-corrected cell-size factor,
times the pair-color densities over canonical pairs, times the required relative top-color
densities over induced polyads. -/
def expectedInducedCountAt (H' : Colored3Graph κ₃ V) (C : TriadicComplex3 κ₃ V)
    (F₀ : FiniteColored3Pattern κ₃) (φ : PatternPlacement3 C F₀)
    (ψ : PairColorPlacement3 C F₀ φ) : ℝ := sorry

/-- **Layer 9.** The sum of `expectedInducedCountAt` over all placements and routes. -/
def expectedInducedCount (H' : Colored3Graph κ₃ V) (C : TriadicComplex3 κ₃ V)
    (F₀ : FiniteColored3Pattern κ₃) : ℝ := sorry

/-- **Layer 9.** The host-independent edit and exceptional-mass parameter for induced counting. -/
def inducedCountingParameter3 (q₃ k : ℕ) (ε : ℝ) : ℝ := sorry

/-- **Layer 9.** Positivity of the counting parameter (part of the target). -/
theorem inducedCountingParameter3_pos (q₃ k : ℕ) (ε : ℝ) (hε : 0 < ε) :
    0 < inducedCountingParameter3 q₃ k ε := sorry

/-- **Layer 9.** The host-independent NRS rank used for induced counting. -/
def inducedCountingRank3 (q₃ k : ℕ) (ε : ℝ) : ℕ := sorry

/-- **Layer 9.** The counting rank is at least one. -/
theorem one_le_inducedCountingRank3 (q₃ k : ℕ) (ε : ℝ) (hε : 0 < ε) :
    1 ≤ inducedCountingRank3 q₃ k ε := sorry

/-- **Layer 9.** The host-independent local regularity schedule, indexed by complexity. -/
def inducedCountingSchedule3 (q₃ k : ℕ) (ε : ℝ) : ℕ → ℝ := sorry

/-- **Layer 9.** Positivity of the local regularity schedule. -/
theorem inducedCountingSchedule3_pos (q₃ k : ℕ) (ε : ℝ) (hε : 0 < ε) (n : ℕ) :
    0 < inducedCountingSchedule3 q₃ k ε n := sorry

/-- **Layer 9.** The global parameter fits each of its `ε/6` error charges. -/
theorem inducedCountingParameter3_charge (q₃ k : ℕ) (ε : ℝ) (hε : 0 < ε) :
    (k : ℝ) ^ 3 * inducedCountingParameter3 q₃ k ε ≤ ε / 6 := sorry

/-- **Layer 9.** The per-route output slack for discarded-route predictions, indexed by lower
complexity and separate from the input regularity schedule. -/
def exceptionalPredictionSlack3 (q₃ k : ℕ) (ε : ℝ) : ℕ → ℝ := sorry

/-- **Layer 9 (discarded predictions).** Positivity of the output slack (part of the target). -/
theorem exceptionalPredictionSlack3_pos (q₃ k : ℕ) (ε : ℝ) (hε : 0 < ε) (n : ℕ) :
    0 < exceptionalPredictionSlack3 q₃ k ε n := sorry

/-- **Layer 9.** The discarded-prediction slack, including route multiplicity, fits its `ε/6`
charge. -/
theorem exceptionalPredictionSlack3_charge (q₃ k : ℕ) (ε : ℝ) (hε : 0 < ε) (ℓ : ℕ) :
    (k : ℝ) ^ 3 * (ℓ : ℝ) ^ Nat.choose k 2 * (2 * exceptionalPredictionSlack3 q₃ k ε ℓ) ≤
      ε / 6 := sorry

/-- **Layer 9.** The vertex-complexity floor used by the diagonal-cell estimate. -/
def diagonalControl3 (k : ℕ) (ε : ℝ) : ℕ := sorry

/-- **Layer 9.** The per-route error budget, including the route-count divisor. -/
def routeBudget3 (C : TriadicComplex3 κ₃ V) (k : ℕ) (ε : ℝ) : ℝ :=
  ε / max 1 ((C.pairColorCount : ℝ) ^ Nat.choose k 2)

/-! #### Layer 9 — lower-route counting -/

open Classical in
/-- **Layer 9.** The injective maps realizing the cells and pair colors of a route, with no top-color
constraint. -/
def lowerRouteCountAt {C : TriadicComplex3 κ₃ V} {F₀ : FiniteColored3Pattern κ₃}
    (φ : PatternPlacement3 C F₀) (ψ : PairColorPlacement3 C F₀ φ) : ℕ :=
  (univ.filter fun g : Fin F₀.k → V => Function.Injective g ∧ (∀ i, g i ∈ φ.vertexCell i) ∧
    ∀ p : {p : Fin F₀.k × Fin F₀.k // p.1 < p.2},
      C.skeleton.pairColors.colorOfPair (g p.1.1) (g p.1.2) = some (ψ.pairColor p)).card

/-- **Layer 9.** The cell-size product times the route's pair-color densities. -/
def expectedLowerRouteCountAt (C : TriadicComplex3 κ₃ V) (F₀ : FiniteColored3Pattern κ₃)
    (φ : PatternPlacement3 C F₀) (ψ : PairColorPlacement3 C F₀ φ) : ℝ :=
  (∏ i, ((φ.vertexCell i).card : ℝ)) *
    ∏ p : {p : Fin F₀.k × Fin F₀.k // p.1 < p.2},
      (pairColorDensity C.skeleton.pairColors (ψ.pairColor p)
        (φ.vertexCell p.1.1) (φ.vertexCell p.1.2) : ℝ)

/-- **Layer 9.** A route is sparse at floor `ρ` when one of its pair densities is below `ρ`. -/
def PairColorPlacement3.IsSparseRoute {C : TriadicComplex3 κ₃ V}
    {F₀ : FiniteColored3Pattern κ₃} {φ : PatternPlacement3 C F₀}
    (ψ : PairColorPlacement3 C F₀ φ) (ρ : ℝ) : Prop :=
  ∃ p : {p : Fin F₀.k × Fin F₀.k // p.1 < p.2},
    (pairColorDensity C.skeleton.pairColors (ψ.pairColor p)
      (φ.vertexCell p.1.1) (φ.vertexCell p.1.2) : ℝ) < ρ

/-- **Layer 9 (lower-route bridge, sparse).** Sparse routes self-bound on the actual side, with
**no regularity input**: the sparse pair's colored-pair count caps the whole route count at `ρ`
times the placement scale. -/
theorem lowerRouteCountAt_le_of_sparseRoute {C : TriadicComplex3 κ₃ V}
    {F₀ : FiniteColored3Pattern κ₃} {φ : PatternPlacement3 C F₀}
    (ψ : PairColorPlacement3 C F₀ φ) {ρ : ℝ} (hρ : 0 ≤ ρ) (hsparse : ψ.IsSparseRoute ρ) :
    (lowerRouteCountAt φ ψ : ℝ) ≤ ρ * ∏ i, ((φ.vertexCell i).card : ℝ) := sorry

/-- **Layer 9 (lower-route bridge, sparse).** Sparse routes self-bound on the predicted side:
every pair-density factor lies in `[0, 1]`, so the sparse factor caps the product. -/
theorem expectedLowerRouteCountAt_le_of_sparseRoute {C : TriadicComplex3 κ₃ V}
    {F₀ : FiniteColored3Pattern κ₃} {φ : PatternPlacement3 C F₀}
    (ψ : PairColorPlacement3 C F₀ φ) {ρ : ℝ} (hρ : 0 ≤ ρ) (hsparse : ψ.IsSparseRoute ρ) :
    expectedLowerRouteCountAt C F₀ φ ψ ≤ ρ * ∏ i, ((φ.vertexCell i).card : ℝ) := sorry

/-- **Layer 9 (lower-route bridge).** The placed induced count refines the lower-route count —
the top-color constraint only restricts. Pins the relationship between the target
`placedInducedCopyCount` and the concrete `lowerRouteCountAt`. -/
theorem placedInducedCopyCount_le_lowerRouteCountAt (H' : Colored3Graph κ₃ V)
    {C : TriadicComplex3 κ₃ V} {F₀ : FiniteColored3Pattern κ₃}
    (φ : PatternPlacement3 C F₀) (ψ : PairColorPlacement3 C F₀ φ) :
    placedInducedCopyCount H' φ ψ ≤ lowerRouteCountAt φ ψ := sorry

/-- **Layer 9 (lower-route bridge).** The intrinsic prediction refines the lower prediction: its
cell factor is at most the plain product (falling-factorial-corrected) and its top factors lie in
`[0, 1]`. -/
theorem expectedInducedCountAt_le_expectedLowerRouteCountAt (H' : Colored3Graph κ₃ V)
    (C : TriadicComplex3 κ₃ V) (F₀ : FiniteColored3Pattern κ₃)
    (φ : PatternPlacement3 C F₀) (ψ : PairColorPlacement3 C F₀ φ) :
    expectedInducedCountAt H' C F₀ φ ψ ≤ expectedLowerRouteCountAt C F₀ φ ψ := sorry

/-- **Layer 9 (lower-route bridge).** The intrinsic prediction is nonnegative — a product of
counts and densities; needed for the sparse case's two-sided bound. -/
theorem expectedInducedCountAt_nonneg (H' : Colored3Graph κ₃ V) (C : TriadicComplex3 κ₃ V)
    (F₀ : FiniteColored3Pattern κ₃) (φ : PatternPlacement3 C F₀)
    (ψ : PairColorPlacement3 C F₀ φ) :
    0 ≤ expectedInducedCountAt H' C F₀ φ ψ := sorry

/-- **Layer 9.** The placed actual and predicted counts on a sparse route differ by at most the
sparse-route bound. -/
theorem placed_induced_counting3_of_sparseRoute (H' : Colored3Graph κ₃ V)
    {C : TriadicComplex3 κ₃ V} {F₀ : FiniteColored3Pattern κ₃}
    (φ : PatternPlacement3 C F₀) (ψ : PairColorPlacement3 C F₀ φ) {ρ : ℝ} (hρ : 0 ≤ ρ)
    (hsparse : ψ.IsSparseRoute ρ) :
    |((placedInducedCopyCount H' φ ψ : ℝ)) - expectedInducedCountAt H' C F₀ φ ψ| ≤
      ρ * ∏ i, ((φ.vertexCell i).card : ℝ) := sorry

/-- **Layer 9.** The pair-regularity input strength for dense-route counting with density floor `ρ`
and output error `δ`. -/
def pairRouteRegularityThreshold3 (k : ℕ) (ρ δ : ℝ) : ℝ := sorry

/-- **Layer 9 (lower-route bridge).** Positivity of the threshold: dense counting demands an
achievable input strength (part of the target). -/
theorem pairRouteRegularityThreshold3_pos (k : ℕ) (ρ δ : ℝ) (hρ : 0 < ρ) (hδ : 0 < δ) :
    0 < pairRouteRegularityThreshold3 k ρ δ := sorry

/-- **Layer 9 (lower-route bridge).** Pair regularity is monotone in its parameter: sub-cells
large at the weaker scale are large at the stronger one, and the stronger deviation bound implies
the weaker — the glue letting `LowerSkeletonRegular` at the schedule supply `IsPairColorRegular`
at the threshold through the calibration below. -/
theorem IsPairColorRegular.mono {S : PairSkeleton3 κ₂ V} {ε ε' : ℝ}
    (h : IsPairColorRegular S ε) (hle : ε ≤ ε') : IsPairColorRegular S ε' := sorry

/-- **Layer 9.** Dense lower routes at a transversal placement are counted within `δ` at the
placement scale. -/
theorem lowerRoute_counting3 {C : TriadicComplex3 κ₃ V} {F₀ : FiniteColored3Pattern κ₃}
    (φ : PatternPlacement3 C F₀) (hφ : φ.Transversal) (ψ : PairColorPlacement3 C F₀ φ)
    {ρ δ : ℝ} (hρ : 0 < ρ) (hδ : 0 < δ) (hδρ : δ ≤ ρ) (hdense : ¬ ψ.IsSparseRoute ρ)
    (hreg : IsPairColorRegular C.skeleton (pairRouteRegularityThreshold3 F₀.k ρ δ)) :
    |((lowerRouteCountAt φ ψ : ℝ)) - expectedLowerRouteCountAt C F₀ φ ψ| ≤
      δ * ∏ i, ((φ.vertexCell i).card : ℝ) := sorry

/-- **Layer 9.** The NRS rank required for a pattern of size `k` at output error `δ`. -/
def requiredTopCountingRank3 (k : ℕ) (δ : ℝ) : ℕ := sorry

/-- **Layer 9.** The required top-counting rank is at least one. -/
theorem one_le_requiredTopCountingRank3 (k : ℕ) (δ : ℝ) (hδ : 0 < δ) :
    1 ≤ requiredTopCountingRank3 k δ := sorry

/-- **Layer 9.** On complexity-bounded complexes, the global counting rank supplies the local
rank required at the route budget. -/
theorem requiredTopCountingRank3_le_inducedCountingRank3 (q₃ : ℕ) (ε : ℝ) (hε : 0 < ε)
    (C : TriadicComplex3 κ₃ V) (F₀ : FiniteColored3Pattern κ₃) (t₀ : ℕ)
    (hC : ComplexityBounded C
      (regularityBound3 q₃ (inducedCountingParameter3 q₃ F₀.k ε)
        (inducedCountingSchedule3 q₃ F₀.k ε) (inducedCountingRank3 q₃ F₀.k ε) t₀)) :
    requiredTopCountingRank3 F₀.k (routeBudget3 C F₀.k (ε / 12)) ≤
      inducedCountingRank3 q₃ F₀.k ε := sorry

/-- **Layer 9.** Dense lower-route control and route-local top regularity give placed counting with
error `(δ + k³η)` at the placement scale. -/
theorem placed_induced_counting3_of_denseRoute (H' : Colored3Graph κ₃ V)
    {C : TriadicComplex3 κ₃ V} {F₀ : FiniteColored3Pattern κ₃}
    (φ : PatternPlacement3 C F₀) (hφ : φ.Transversal) (ψ : PairColorPlacement3 C F₀ φ)
    {ρ δ η : ℝ} {r : ℕ} (hρ : 0 < ρ) (hδ : 0 < δ) (hη : 0 < η)
    (hr : requiredTopCountingRank3 F₀.k δ ≤ r)
    (hδρ : δ ≤ ρ) (hηδ : (F₀.k : ℝ) ^ 3 * η ≤ δ) (hdense : ¬ ψ.IsSparseRoute ρ)
    (hreg : IsPairColorRegular C.skeleton (pairRouteRegularityThreshold3 F₀.k ρ δ))
    (hroute : ψ.IsTopRegularRoute H' η r) :
    |((placedInducedCopyCount H' φ ψ : ℝ)) - expectedInducedCountAt H' C F₀ φ ψ| ≤
      (δ + (F₀.k : ℝ) ^ 3 * η) * ∏ i, ((φ.vertexCell i).card : ℝ) := sorry

/-- **Layer 9.** The local schedule supplies the pair-regularity threshold at the route budget. -/
theorem inducedCountingSchedule3_le_pairRouteRegularityThreshold3 (q₃ : ℕ) (ε : ℝ)
    (hε : 0 < ε) (C : TriadicComplex3 κ₃ V) (F₀ : FiniteColored3Pattern κ₃) :
    inducedCountingSchedule3 q₃ F₀.k ε
        (C.skeleton.vertexPart.parts.card + C.pairColorCount) ≤
      pairRouteRegularityThreshold3 F₀.k (routeBudget3 C F₀.k (ε / 6))
        (routeBudget3 C F₀.k (ε / 12)) := sorry

/-- **Layer 9.** The top-regularity slack fits half of the placed-counting charge. -/
theorem inducedCountingSchedule3_top_le_routeBudget3 (q₃ : ℕ) (ε : ℝ) (hε : 0 < ε)
    (C : TriadicComplex3 κ₃ V) (F₀ : FiniteColored3Pattern κ₃) :
    (F₀.k : ℝ) ^ 3 * inducedCountingSchedule3 q₃ F₀.k ε C.complexity ≤
      routeBudget3 C F₀.k (ε / 12) := sorry

/-- **Layer 9.** The schedule supplies the threshold used for discarded-route predictions. -/
theorem inducedCountingSchedule3_le_exceptionalPredictionThreshold (q₃ k : ℕ) (ε : ℝ)
    (hε : 0 < ε) (ℓ : ℕ) :
    inducedCountingSchedule3 q₃ k ε ℓ ≤
      pairRouteRegularityThreshold3 k (exceptionalPredictionSlack3 q₃ k ε ℓ)
        (exceptionalPredictionSlack3 q₃ k ε ℓ) := sorry

/-- **Layer 9.** At a transversal placement with a top-regular route, adequate lower regularity,
and adequate rank, the placed count in `H'` is within the per-route `ε/6` budget of its intrinsic
prediction. -/
theorem placed_induced_counting3 (H' : Colored3Graph κ₃ V) (C : TriadicComplex3 κ₃ V)
    (F₀ : FiniteColored3Pattern κ₃) (φ : PatternPlacement3 C F₀) (hφ : φ.Transversal)
    (ψ : PairColorPlacement3 C F₀ φ) (ε : ℝ) (hε : 0 < ε)
    (hlower : LowerSkeletonRegular C.skeleton
      (inducedCountingSchedule3 (Fintype.card κ₃) F₀.k ε))
    (hrank : requiredTopCountingRank3 F₀.k (routeBudget3 C F₀.k (ε / 12)) ≤
      inducedCountingRank3 (Fintype.card κ₃) F₀.k ε)
    (hroute : ψ.IsTopRegularRoute H'
      (inducedCountingSchedule3 (Fintype.card κ₃) F₀.k ε C.complexity)
      (inducedCountingRank3 (Fintype.card κ₃) F₀.k ε)) :
    |((placedInducedCopyCount H' φ ψ : ℝ)) - expectedInducedCountAt H' C F₀ φ ψ| ≤
      routeBudget3 C F₀.k (ε / 6) * ∏ i, ((φ.vertexCell i).card : ℝ) := sorry

open Classical in
/-- **Layer 9.** The actual mass of routes meeting an exceptional polyad is bounded by
`k³ · exceptionalPolyadMass · |V|^k`. -/
theorem exceptional_route_mass_le (H' : Colored3Graph κ₃ V) (C : TriadicComplex3 κ₃ V)
    (F₀ : FiniteColored3Pattern κ₃) (η : ℝ) (r : ℕ) (hdecomp : IsPolyadDecomposition C) :
    ((univ.filter fun g : Fin F₀.k → V => Function.Injective g ∧
        ∃ P ∈ C.polyads, ¬ IsTopRegularOverPolyad H' P η r ∧
          ∃ x : {x : Fin 3 → V // Function.Injective x}, x ∈ P.support ∧
            ∃ i j l : Fin F₀.k, i < j ∧ j < l ∧
              x.1 0 = g i ∧ x.1 1 = g j ∧ x.1 2 = g l).card : ℝ) ≤
      (F₀.k : ℝ) ^ 3 * exceptionalPolyadMass H' C η r * (Fintype.card V : ℝ) ^ F₀.k := sorry

/-- **Layer 9.** The predicted contribution of non-top-regular routes among transversal
placements. -/
def exceptionalPredictedMass3 (H' : Colored3Graph κ₃ V) (C : TriadicComplex3 κ₃ V)
    (F₀ : FiniteColored3Pattern κ₃) (η : ℝ) (r : ℕ) : ℝ := sorry

/-- **Layer 9.** The predicted mass of exceptional transversal routes is controlled by the
exceptional mass and the route-counted output slack `δ + ρ`. -/
theorem exceptional_route_prediction_mass_le (H' : Colored3Graph κ₃ V)
    (C : TriadicComplex3 κ₃ V) (F₀ : FiniteColored3Pattern κ₃) (η εmass ρ δ : ℝ) (r : ℕ)
    (hdecomp : IsPolyadDecomposition C) (hρ : 0 < ρ) (hδ : 0 < δ) (hδρ : δ ≤ ρ)
    (hlower : IsPairColorRegular C.skeleton (pairRouteRegularityThreshold3 F₀.k ρ δ))
    (hmost : TopRegularOverMostPolyads H' C η εmass r) :
    exceptionalPredictedMass3 H' C F₀ η r ≤
      (F₀.k : ℝ) ^ 3 *
        (εmass + (C.pairColorCount : ℝ) ^ Nat.choose F₀.k 2 * (δ + ρ)) *
        (Fintype.card V : ℝ) ^ F₀.k := sorry

/-- **Layer 9.** The total **predicted** contribution of nontransversal placements: the sum of
`expectedInducedCountAt` over all placements with a repeated cell and all their routes (explicit
definition is a target — the companion of `exceptionalPredictedMass3` on the diagonal side). -/
def nontransversalPredictedMass3 (H' : Colored3Graph κ₃ V) (C : TriadicComplex3 κ₃ V)
    (F₀ : FiniteColored3Pattern κ₃) : ℝ := sorry

/-- **Layer 9.** Controlled vertex cells bound the combined actual and predicted nontransversal
mass by the diagonal `ε/6` charge. -/
theorem nontransversal_actual_and_predicted_mass_le (H' : Colored3Graph κ₃ V)
    (C : TriadicComplex3 κ₃ V) (F₀ : FiniteColored3Pattern κ₃) (ε : ℝ) (hε : 0 < ε)
    (hcells : VertexCellsControlled C (diagonalControl3 F₀.k ε)) :
    ((univ.filter fun g : Fin F₀.k → V => Function.Injective g ∧
        ∃ i j : Fin F₀.k, i ≠ j ∧
          ∃ A ∈ C.skeleton.vertexPart.parts, g i ∈ A ∧ g j ∈ A).card : ℝ)
      + nontransversalPredictedMass3 H' C F₀ ≤
      ε / 6 * (Fintype.card V : ℝ) ^ F₀.k := sorry

/-- **Layer 9.** The global induced-copy counts differ by at most
`k³ · editDiscrepancy3 H H' · |V|^k`. -/
theorem inducedCopyCount_edit_transfer (H H' : Colored3Graph κ₃ V)
    (F₀ : FiniteColored3Pattern κ₃) :
    |((H.inducedCopyCount F₀ : ℝ)) - (H'.inducedCopyCount F₀ : ℝ)| ≤
      (F₀.k : ℝ) ^ 3 * (editDiscrepancy3 H H' : ℝ) * (Fintype.card V : ℝ) ^ F₀.k := sorry

/-! #### Layer 9 — assembly discipline: the fibration identity and the six-charge arithmetic -/

/-- **Layer 9 (assembly).** Placements over a complex form a finite type — a subtype of
`Fin F₀.k → Finset V` (explicit construction is a target; needed to state the fibration and
predicted-sum identities as sums). -/
noncomputable instance instFintypePatternPlacement3 (C : TriadicComplex3 κ₃ V)
    (F₀ : FiniteColored3Pattern κ₃) : Fintype (PatternPlacement3 C F₀) := sorry

/-- **Layer 9 (assembly).** Routes over a placement form a finite type (explicit construction is
a target). -/
noncomputable instance instFintypePairColorPlacement3 (C : TriadicComplex3 κ₃ V)
    (F₀ : FiniteColored3Pattern κ₃) (φ : PatternPlacement3 C F₀) :
    Fintype (PairColorPlacement3 C F₀ φ) := sorry

/-- **Layer 9.** Under a polyad decomposition, the induced-copy count is the sum of the placed
counts over all placements and routes. -/
theorem inducedCopyCount_eq_sum_placed (H' : Colored3Graph κ₃ V) (C : TriadicComplex3 κ₃ V)
    (F₀ : FiniteColored3Pattern κ₃) (hdecomp : IsPolyadDecomposition C) :
    H'.inducedCopyCount F₀ =
      ∑ φ : PatternPlacement3 C F₀, ∑ ψ : PairColorPlacement3 C F₀ φ,
        placedInducedCopyCount H' φ ψ := sorry

/-- **Layer 9 (assembly).** The predicted mirror of the fibration identity: the global prediction
is the sum of the per-placement predictions — pinning `expectedInducedCount`'s definitional
docstring as a named identity, using the preceding `Fintype` instances. -/
theorem expectedInducedCount_eq_sum (H' : Colored3Graph κ₃ V) (C : TriadicComplex3 κ₃ V)
    (F₀ : FiniteColored3Pattern κ₃) :
    expectedInducedCount H' C F₀ =
      ∑ φ : PatternPlacement3 C F₀, ∑ ψ : PairColorPlacement3 C F₀ φ,
        expectedInducedCountAt H' C F₀ φ ψ := sorry

/-- **Layer 9.** Six error terms bounded by `εN/6` have total at most `εN`. -/
theorem sixCharge_assembly {x y e₁ e₂ e₃ e₄ e₅ e₆ N ε : ℝ}
    (hsplit : |x - y| ≤ e₁ + e₂ + e₃ + e₄ + e₅ + e₆)
    (h₁ : e₁ ≤ ε / 6 * N) (h₂ : e₂ ≤ ε / 6 * N) (h₃ : e₃ ≤ ε / 6 * N)
    (h₄ : e₄ ≤ ε / 6 * N) (h₅ : e₅ ≤ ε / 6 * N) (h₆ : e₆ ≤ ε / 6 * N) :
    |x - y| ≤ ε * N := by linarith

/-- **Layer 9 (endpoint).** A strong regular approximation with controlled vertex cells predicts
the induced copy count in `H` within `ε · |V|^k`. -/
theorem induced_counting_from_strong_regular_complex3 (H H' : Colored3Graph κ₃ V)
    (C : TriadicComplex3 κ₃ V) (F₀ : FiniteColored3Pattern κ₃) (ε : ℝ) (hε : 0 < ε)
    (hcells : VertexCellsControlled C (diagonalControl3 F₀.k ε))
    (hreg : IsStrongRegularApproximation3 H H' C
      (inducedCountingParameter3 (Fintype.card κ₃) F₀.k ε)
      (inducedCountingSchedule3 (Fintype.card κ₃) F₀.k ε)
      (inducedCountingRank3 (Fintype.card κ₃) F₀.k ε)
      (diagonalControl3 F₀.k ε)) :
    |((H.inducedCopyCount F₀ : ℝ)) - expectedInducedCount H' C F₀| ≤
      ε * (Fintype.card V : ℝ) ^ F₀.k :=
  sorry

end TauCetiRoadmap.Regularity
