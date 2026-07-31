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
analytic comparison adapters are owned downstream (see *Interoperability adapters* in `README.md`). Much
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

/-- **Layer 0.** A finite `r`-uniform hypergraph: a finset of `r`-element edges. A deliberately
finite computational representation: Mathlib master now carries a general set-based `Hypergraph`
(absent at the current Tau Ceti Mathlib pin), and this layer owes a `toHypergraph` bridge with an
agreement statement once the pin includes it (see *Layer 0 — migration boundary* in `README.md`). -/
structure UniformHypergraph (r : ℕ) (V : Type*) [DecidableEq V] where
  edges : Finset (Finset V)
  edge_card : ∀ e ∈ edges, e.card = r

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

/-! ### Layer 2 — Szemerédi graph regularity bridge -/

/-- **Layer 2.** `P` **almost-refines** `P₀` (up to a `δ`-remainder): each `P₀`-part `A` is covered,
up to `δ·|A|` leftover vertices, by `P`-parts **contained in `A`**. The containment clause
`∀ B ∈ T, B ⊆ A` is essential — without it `T = P.parts` makes the remainder empty vacuously.
`regularity-lemmata` proves a **global**-mass variant (`AlmostRefines`: exceptional mass `≤ ε·|s|`,
from the per-parent count form `AlmostRefinesAt`), which does not imply this per-part form; the two
shapes must be reconciled at implementation time. -/
def AlmostRefines (P P₀ : Finpartition (univ : Finset V)) (δ : ℝ) : Prop :=
  ∀ A ∈ P₀.parts, ∃ T ⊆ P.parts, (∀ B ∈ T, B ⊆ A) ∧
    ((A \ T.biUnion id).card : ℝ) ≤ δ * A.card

/-- **Layer 2.** The `V`-independent complexity bound for the refining-regularity theorem (explicit
value is a target — bounding a partition that is simultaneously regular, equitable, and
almost-refining remains open; the prior formalization's `regularityBound ⌈1/ε⁵⌉ #P₀.parts` bounds
only its intermediate exact refinement). -/
def refiningRegularityBound (ε : ℝ) (l : ℕ) : ℕ := sorry

/-- **Layer 2 (bridge).** A regular equipartition **almost-refining** a given equipartition `P₀`, with
a `V`-independent complexity bound. `hP₀` (equipartition) and `hV` (`V` large enough) are **required**:
without them a singleton `P₀`-part cannot be covered up to `ε·|A|` by contained cells of a bounded
equipartition, and the statement is false. Bridge to Mathlib's `szemeredi_regularity` — don't
duplicate its `SimpleGraph` statement. `regularity-lemmata` proves the two-partition intermediate
(`exists_regular_refinement_and_almostRefining_equipartition`: a regular exact refinement plus a
separate, not-itself-regular almost-refining equipartition); this self-regular form is its explicitly
deferred endpoint. -/
theorem exists_regular_equipartition_almost_refining (G : SimpleGraph V) [DecidableRel G.Adj]
    (P₀ : Finpartition (univ : Finset V)) (hP₀ : P₀.IsEquipartition) (ε : ℝ) (hε : 0 < ε)
    (hV : refiningRegularityBound ε P₀.parts.card ≤ Fintype.card V) :
    ∃ P : Finpartition (univ : Finset V),
      P.IsEquipartition ∧ P.IsUniform G ε ∧ AlmostRefines P P₀ ε ∧
        P.parts.card ≤ refiningRegularityBound ε P₀.parts.card := sorry

/-! ### Layer 3 — finite weak regularity -/

/-- **Layer 3.** The count predicted by the `P`-stepped graph on the test rectangle `(A, B)`: each
cell pair contributes its edge density times the trace masses `|A ∩ C|·|B ∩ D|`. Count-scaled
throughout — this layer is self-contained finite combinatorics, with no graphon imports (analytic
comparison adapters are out of scope; see `README.md`). Proved counterpart:
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

/-- **Layer 3.** The supremum form, derived — not a second `sorry`: the cut discrepancy itself is at
most `ε·|V|²`. Proved counterpart: `RegularityLemmata.frieze_kannan_cutDiscrepancy`. -/
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

/-- **Layer 4 (bridge from Layer 2).** Nested equitabilisation: an equipartition admits an **exact**
refining equipartition that is regular, with bounded complexity. This is the named cleanup step
turning Layer 2's *almost*-refining output into the exact `Q ≤ P` nesting `StrongRegular` iterates
on — without it there is a hidden gap between the two layers. Mathlib's
`SzemerediRegularity.increment` (which subdivides within parts) is the **alignment point / proof
template**, not a consumed theorem: it is stated for Mathlib's unweighted energy. -/
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
the starting-partition/lower-bound parameters counting applications need, mirrored from the prior
formalization's `exists_strongWitness` (proved there with host-independent bounds on **both**
partitions via iterated `monoStepBound`, but for its weaker witness shape; this statement remains
open). -/
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

/-- **Layer 5.** A pair-color system: a coloring of ordered **distinct** vertex pairs into the pair
palette `κ₂`. Diagonals `(v, v)` are excluded, matching the injective top supports (no loops in the
lower skeleton while the top layer forbids them). -/
structure PairColorSystem (κ₂ : Type*) (V : Type*) where
  color : {p : V × V // p.1 ≠ p.2} → κ₂

/-- The pair color of an ordered pair, as an `Option` (`none` on the diagonal). This total form lets
densities and polyad conditions be stated without threading an `≠` proof. -/
def PairColorSystem.colorOfPair (S : PairColorSystem κ₂ V) (u v : V) : Option κ₂ :=
  if h : u ≠ v then some (S.color ⟨(u, v), h⟩) else none

/-- **Layer 5.** The density of pair-color `c` over the ordered cell pair `(s, t)`, among the
**distinct** ordered pairs. Convention: the density is `0` when there are no distinct pairs
(`_ / 0 = 0`); substantive lemmas assume a positive denominator. -/
def pairColorDensity (S : PairColorSystem κ₂ V) (c : κ₂) (s t : Finset V) : ℚ :=
  (((s ×ˢ t).filter (fun p => S.colorOfPair p.1 p.2 = some c)).card : ℚ) /
    (((s ×ˢ t).filter (fun p => p.1 ≠ p.2)).card : ℚ)

/-- **Layer 5.** The lower skeleton of a triadic complex: a vertex partition together with a
pair-color system. Built here — **not** on `TriadicComplex3`, which does not exist until Layer 8. -/
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

/-- **Layer 5.** The lower skeleton is regular when it is `F`-regular, with `F` evaluated
explicitly at the **lower complexity** — vertex cells **plus pair colors** (no hidden
error-hierarchy choice). Evaluating at the cell count alone is too weak: pair-level counting
strength must depend on the pair-palette size, matching the published decomposition architecture's
lower error function evaluated at the pairs-partition complexity `ℓ`. -/
def LowerSkeletonRegular (S : PairSkeleton3 κ₂ V) (F : ℕ → ℝ) : Prop :=
  IsPairColorRegular S (F (S.vertexPart.parts.card + Fintype.card κ₂))

/-! ### Layer 6 — triads, polyads, subpolyads, relative densities -/

/-- **Layer 6.** A polyad over a lower skeleton `S`: three vertex cells (each a part of `S`), the
three pair colors `color₀₁ / color₀₂ / color₁₂` on the coordinate pairs, and the support — the
role-ordered injective triples whose vertices lie in the three cells **and** whose three coordinate
pairs carry exactly those pair colors. So a polyad is determined by its cells and pair colors, not by
an arbitrary support finset. -/
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
  support : Finset {x : Fin 3 → V // Function.Injective x}
  mem_support_iff : ∀ x, x ∈ support ↔
    x.1 0 ∈ c₀ ∧ x.1 1 ∈ c₁ ∧ x.1 2 ∈ c₂ ∧
      S.pairColors.colorOfPair (x.1 0) (x.1 1) = some color₀₁ ∧
      S.pairColors.colorOfPair (x.1 0) (x.1 2) = some color₀₂ ∧
      S.pairColors.colorOfPair (x.1 1) (x.1 2) = some color₁₂

/-- **Layer 6.** The polyad determined by cells and pair colors — its support pinned
definitionally. The constructor `PairColorPlacement3` (Layer 9) and worked examples use it. -/
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
  support := univ.filter fun x => x.1 0 ∈ c₀ ∧ x.1 1 ∈ c₁ ∧ x.1 2 ∈ c₂ ∧
    S.pairColors.colorOfPair (x.1 0) (x.1 1) = some k₀₁ ∧
    S.pairColors.colorOfPair (x.1 0) (x.1 2) = some k₀₂ ∧
    S.pairColors.colorOfPair (x.1 1) (x.1 2) = some k₁₂
  mem_support_iff := fun x => by simp [Finset.mem_filter]

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
  support : Finset {x : Fin 3 → V // Function.Injective x}
  mem_support_iff : ∀ x, x ∈ support ↔ x ∈ P.support ∧
    coordPair x 0 1 (by decide) ∈ pair₀₁ ∧
    coordPair x 0 2 (by decide) ∈ pair₀₂ ∧
    coordPair x 1 2 (by decide) ∈ pair₁₂

/-- **Layer 6.** The vertex-subcell restriction, as a subpolyad — the convenient constructor
(select in each pair graph the pairs landing in the sub-cells); realizing it, with its
`mem_support_iff`, is a target. -/
def Subpolyad3.ofSubcells {S : PairSkeleton3 κ₂ V} (P : Polyad3 S)
    (c₀' c₁' c₂' : Finset V) (h₀ : c₀' ⊆ P.c₀) (h₁ : c₁' ⊆ P.c₁) (h₂ : c₂' ⊆ P.c₂) :
    Subpolyad3 P := sorry

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

/-- **Layer 8.** The triadic complex as a generic down-closed complex — vertices, the pairs carrying
a pair color used by some polyad, the polyads' underlying triples (explicit construction is a
target). This is the bridge that keeps `HypergraphComplex` consumed rather than ornamental. -/
def TriadicComplex3.toHypergraphComplex (C : TriadicComplex3 κ₃ V) : HypergraphComplex 3 V :=
  sorry

/-- **Layer 8.** The vertex cells are controlled: the vertex partition is an **equipartition** with
at least `t₀` cells. This is the load-bearing input of the diagonal-cell gate — without
equitability and a complexity floor, the transversal-to-global counting step has no bound on the
nontransversal (repeated-cell) mass, and the promised diagonal-gate proof route has a hidden
bridge. -/
def VertexCellsControlled (C : TriadicComplex3 κ₃ V) (t₀ : ℕ) : Prop :=
  C.skeleton.vertexPart.IsEquipartition ∧ t₀ ≤ C.skeleton.vertexPart.parts.card

/-- **Layer 8.** The edit discrepancy between two total top colorings: `6·`(number of unordered
triples where they disagree)`/|V|³` — the ordered edit mass at the ordered normalization
(`x / 0 = 0` on tiny `V`), the colored analogue of the Boolean convention proved in
`regularity-lemmata` (unordered symmetric-difference count with the **proved** factor-6 ordered
identity, normalized by `|V|³`). A real definition, not a target: the comparison is between `H` and
an **explicit approximant** `H'`, so no induced coloring from the complex is needed. -/
def editDiscrepancy3 (H H' : Colored3Graph κ₃ V) : ℚ :=
  (6 * ((univ.filter fun s : {s : Finset V // s.card = 3} => H.color s ≠ H'.color s).card : ℚ)) /
    ((Fintype.card V : ℚ) ^ 3)

/-- **Layer 8.** `H'` approximates `H` to within `ε` — the clause tying the regular approximant back
to the original coloring; without it the regularity/complexity conjuncts below are satisfiable by
data unrelated to `H`. -/
def Approximates3 (H H' : Colored3Graph κ₃ V) (ε : ℝ) : Prop :=
  (editDiscrepancy3 H H' : ℝ) ≤ ε

/-- **Layer 8.** `C`'s polyads form a genuine decomposition: their supports are pairwise disjoint and
together cover every injective triple. Without this, `exceptionalPolyadMass` could be made meaningless
by an empty or irrelevant polyad family. (v1 states coverage over all injective triples; restricting
to distinct-cell triads is a later refinement.) -/
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

/-- **Layer 8.** The `V`-independent complexity bound for the strong arity-3 approximation,
depending on the **top palette size** `q₃`, the error hierarchy, the NRS rank `r`, and the
**vertex-complexity floor** `t₀` (explicit value is a target). `t₀` must feed the bound: the theorem
demands both `t₀ ≤ #vertex-cells ≤ C.complexity` and `C.complexity ≤ regularityBound3 …`, so a
bound independent of `t₀` makes the statement false for `t₀` above it (mirroring Layer 4's starting
complexity `l₀`). Caution from the proved Boolean precursor: its `triadRegularityBound` iterates
a `cutBound` recurrence of shape `K ↦ K·2^{O(K³)}` per round — **not** a single exponential. -/
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

/-- **Layer 9.** A lower-color route for a placed pattern: **one pair color per canonically
oriented pattern pair `i < j`** — not per ordered pair. Assigning both orientations independently
and multiplying both marginal densities would assume an unproved independence:
`IsPairColorRegular` controls each orientation's marginal but not their joint correlation (reverse
colors could always equal forward colors, making a route that demands opposite colors have actual
count zero against a positive product of marginals). One oriented bigraph per role pair is also the
primary-source triad shape. The `polyad_mem` clause (for `i < j < l`, via `Polyad3.ofData`) keeps
every pattern triple's induced polyad inside `C`'s decomposition. -/
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

/-- **Layer 9.** The route is **top-regular**: every pattern triple's induced polyad is one over
which the given coloring is `(η, r)`-top-regular. `IsStrongRegularApproximation3` guarantees top
regularity only over **most** polyads, so a route through an exceptional polyad has no counting
control — the placed theorem requires this predicate, and the global assembly bounds the routes
that lack it by the exceptional-polyad mass (`exceptional_route_mass_le`). -/
def PairColorPlacement3.IsTopRegularRoute {C : TriadicComplex3 κ₃ V}
    {F₀ : FiniteColored3Pattern κ₃} {φ : PatternPlacement3 C F₀}
    (ψ : PairColorPlacement3 C F₀ φ) (H' : Colored3Graph κ₃ V) (η : ℝ) (r : ℕ) : Prop :=
  ∀ (i j l : Fin F₀.k) (hij : i < j) (hjl : j < l),
    IsTopRegularOverPolyad H' (ψ.polyad i j l hij hjl) η r

/-- **Layer 9.** The number of induced copies, **in a given coloring**, realizing a fixed placement
and lower-color route: labeled injective maps `g` with `g i` in the assigned cell, every
canonically oriented coordinate pair carrying `ψ`'s pair color, and every triple's top color
matching the pattern (explicit definition is a target). The placed theorem applies it to the
**approximant** `H'`; the global theorem transfers to `H` through the named edit-transfer lemma. -/
def placedInducedCopyCount (H : Colored3Graph κ₃ V) {C : TriadicComplex3 κ₃ V}
    {F₀ : FiniteColored3Pattern κ₃} (φ : PatternPlacement3 C F₀)
    (ψ : PairColorPlacement3 C F₀ φ) : ℕ := sorry

/-- **Layer 9.** The predicted count at a fixed placement `φ` and lower-color route `ψ` (explicit
formula is a target, but its **shape is pinned**): the product of (i) the injection/cell-size
factor from the assigned cells (falling-factorial-corrected when cells repeat), (ii) over each
**canonically oriented** pattern pair `i < j` — one orientation per pair, never both marginals —
the `pairColorDensity` of `ψ.pairColor` between the assigned cells, and (iii) over each pattern
triple, the relative density in the approximant `H'` of the required top color `F₀.pattern s` over
the polyad `ψ` induces (each unordered triple entering once — the six ordered representatives are
identified here, not in the support). It is **never** defined through
`Colored3Graph.inducedCopyCount` — that would hide the counting theorem inside the definition. -/
def expectedInducedCountAt (H' : Colored3Graph κ₃ V) (C : TriadicComplex3 κ₃ V)
    (F₀ : FiniteColored3Pattern κ₃) (φ : PatternPlacement3 C F₀)
    (ψ : PairColorPlacement3 C F₀ φ) : ℝ := sorry

/-- **Layer 9.** The induced count of `F₀` predicted from the regular **approximant** `H'` and the
complex `C`: the sum of `expectedInducedCountAt` over all placements `φ` and lower-color routes
`ψ` — an intrinsic formula in the polyad densities and pair-color densities, **never** defined
through `inducedCopyCount` (explicit definition is a target). -/
def expectedInducedCount (H' : Colored3Graph κ₃ V) (C : TriadicComplex3 κ₃ V)
    (F₀ : FiniteColored3Pattern κ₃) : ℝ := sorry

/-- **Layer 9.** The **global** edit/exceptional parameter for induced counting: the bound demanded
of the edit discrepancy and of the exceptional-polyad mass (the `ε`-slot of
`IsStrongRegularApproximation3`), as a function of the top palette size `q₃`, the pattern size `k`,
and the target counting error `ε` — manifestly independent of `V` (explicit value is a target).
The **local** regularity strengths are the separate `inducedCountingSchedule3`; the counting error
and this parameter cannot be the same `ε`, and its `ε/6` charges are pinned by
`inducedCountingParameter3_charge`. -/
def inducedCountingParameter3 (q₃ k : ℕ) (ε : ℝ) : ℝ := sorry

/-- **Layer 9.** Positivity of the counting parameter (part of the target). -/
theorem inducedCountingParameter3_pos (q₃ k : ℕ) (ε : ℝ) (hε : 0 < ε) :
    0 < inducedCountingParameter3 q₃ k ε := sorry

/-- **Layer 9.** The NRS rank that induced counting demands of the top-regularity test, as a
function of the top palette size, the pattern size, and the counting error (explicit value is a
target — `V`-independent). -/
def inducedCountingRank3 (q₃ k : ℕ) (ε : ℝ) : ℕ := sorry

/-- **Layer 9.** The counting rank is at least one — at rank `0` the top-regularity test is
vacuous on nonempty polyads (part of the target). -/
theorem one_le_inducedCountingRank3 (q₃ k : ℕ) (ε : ℝ) (hε : 0 < ε) :
    1 ≤ inducedCountingRank3 q₃ k ε := sorry

/-- **Layer 9.** The lower error **schedule** counting demands — a genuine function of the
complexity, not a constant: pair-level counting strength must depend on the pair-partition
complexity, exactly why `LowerSkeletonRegular` evaluates its schedule at the lower complexity and
`TopRegularOverMostPolyads` at `C.complexity` (the published decomposition architecture evaluates
the lower error at the pairs complexity `ℓ`). Deliberately **separate** from the global
edit/exceptional parameter `inducedCountingParameter3` — one is a local schedule, the other a
global mass bound (explicit value is a target). -/
def inducedCountingSchedule3 (q₃ k : ℕ) (ε : ℝ) : ℕ → ℝ := sorry

/-- **Layer 9.** Positivity of the schedule everywhere — required to instantiate the Layer-8
regular-approximation theorem's `hF` with it (part of the target). -/
theorem inducedCountingSchedule3_pos (q₃ k : ℕ) (ε : ℝ) (hε : 0 < ε) (n : ℕ) :
    0 < inducedCountingSchedule3 q₃ k ε n := sorry

/-- **Layer 9 (charge pinning).** The global parameter fits its `ε/6` charges: the edit-transfer,
actual-discarded, and predicted-discarded-**mass** contributions to the global error are each at
most `k³ · inducedCountingParameter3 · |V|^k`, so this single inequality closes those three
charges (part of the target — without pinned inequalities like this, the four-step assembly's
charges would not visibly fit inside the final `ε`). -/
theorem inducedCountingParameter3_charge (q₃ k : ℕ) (ε : ℝ) (hε : 0 < ε) :
    (k : ℝ) ^ 3 * inducedCountingParameter3 q₃ k ε ≤ ε / 6 := sorry

/-- **Layer 9 (discarded predictions — the output slack).** The per-route **output** error for
the discarded-route prediction bound, as a function of the lower complexity. Deliberately a
separate function from the **input** schedule `inducedCountingSchedule3`: the discarded-side
statement must not feed the same function in as regularity strength and out as conclusion slack —
that shape bakes a linear regularity-to-counting modulus into the statement. The two are tied
only through `pairRouteRegularityThreshold3` by the calibration
`inducedCountingSchedule3_le_exceptionalPredictionThreshold` (explicit value is a target;
`V`-independent). Used as floor and error alike — `ρ = δ = exceptionalPredictionSlack3 … ℓ`
satisfies the bridge's `δ ≤ ρ`. -/
def exceptionalPredictionSlack3 (q₃ k : ℕ) (ε : ℝ) : ℕ → ℝ := sorry

/-- **Layer 9 (discarded predictions).** Positivity of the output slack (part of the target). -/
theorem exceptionalPredictionSlack3_pos (q₃ k : ℕ) (ε : ℝ) (hε : 0 < ε) (n : ℕ) :
    0 < exceptionalPredictionSlack3 q₃ k ε n := sorry

/-- **Layer 9 (charge pinning).** The discarded-prediction slack fits its `ε/6` charge
**including the route-count factor**: per-route slack `δ + ρ = 2 · slack(ℓ)` accumulates over up
to `q₂^(k choose 2) ≤ ℓ^(k choose 2)` routes (with `ℓ` the lower complexity), so the slack must
beat that growth at every complexity (part of the target). This is an inequality about the
**output** slack, not the input schedule — the schedule is constrained only through the threshold
calibration. -/
theorem exceptionalPredictionSlack3_charge (q₃ k : ℕ) (ε : ℝ) (hε : 0 < ε) (ℓ : ℕ) :
    (k : ℝ) ^ 3 * (ℓ : ℝ) ^ Nat.choose k 2 * (2 * exceptionalPredictionSlack3 q₃ k ε ℓ) ≤
      ε / 6 := sorry

/-- **Layer 9.** The vertex-complexity floor the diagonal-cell gate demands: with an equitable
vertex partition of at least this many cells, the nontransversal (repeated-cell) placement mass is
below its **`ε/6` charge** of the counting error (explicit value is a target — `V`-independent). -/
def diagonalControl3 (k : ℕ) (ε : ℝ) : ℕ := sorry

/-- **Layer 9.** The per-route error budget. A placement admits up to
`pairColorCount ^ (k choose 2)` lower-color routes, so a per-route error of `ε · ∏ᵢ|cellᵢ|` would
sum to `ε · q₂^(k choose 2) · |V|^k` — **not** the claimed global `ε · |V|^k`. The placed theorem's
budget therefore carries the route-count factor explicitly. -/
def routeBudget3 (C : TriadicComplex3 κ₃ V) (k : ℕ) (ε : ℝ) : ℝ :=
  ε / max 1 ((C.pairColorCount : ℝ) ^ Nat.choose k 2)

/-! #### Layer 9 — the lower-route counting bridge (sparse/dense split)

The named sublayer between pair regularity and placed induced counting. It works at the
**placement scale** `∏ᵢ |cellᵢ|` — deliberately distinct from the triad-support scale
(`k³ · mass · |V|^k`) of `exceptional_route_mass_le`: that union bound controls whole-host masses
of discarded routes, this bridge controls a single kept route, and the two meet only in the global
assembly. -/

open Classical in
/-- **Layer 9 (lower-route bridge).** The actual count at a placement and route constrained by the
**lower layers only**: injective maps landing in the assigned cells whose canonically oriented
coordinate pairs carry the route's pair colors — no top-color constraint. A concrete definition,
unlike the target `placedInducedCopyCount` it caps
(`placedInducedCopyCount_le_lowerRouteCountAt`). -/
def lowerRouteCountAt {C : TriadicComplex3 κ₃ V} {F₀ : FiniteColored3Pattern κ₃}
    (φ : PatternPlacement3 C F₀) (ψ : PairColorPlacement3 C F₀ φ) : ℕ :=
  (univ.filter fun g : Fin F₀.k → V => Function.Injective g ∧ (∀ i, g i ∈ φ.vertexCell i) ∧
    ∀ p : {p : Fin F₀.k × Fin F₀.k // p.1 < p.2},
      C.skeleton.pairColors.colorOfPair (g p.1.1) (g p.1.2) = some (ψ.pairColor p)).card

/-- **Layer 9 (lower-route bridge).** The lower-layer prediction at a placement and route: the
plain cell-size factor times the product, over canonically oriented pattern pairs, of the route's
pair-color densities between the assigned cells. Concrete (unlike `expectedInducedCountAt`, whose
repeated-cell correction and top factors make its explicit formula a target): the bridge theorems
are stated at transversal placements, where the plain product is the right injection scale. -/
def expectedLowerRouteCountAt (C : TriadicComplex3 κ₃ V) (F₀ : FiniteColored3Pattern κ₃)
    (φ : PatternPlacement3 C F₀) (ψ : PairColorPlacement3 C F₀ φ) : ℝ :=
  (∏ i, ((φ.vertexCell i).card : ℝ)) *
    ∏ p : {p : Fin F₀.k × Fin F₀.k // p.1 < p.2},
      (pairColorDensity C.skeleton.pairColors (ψ.pairColor p)
        (φ.vertexCell p.1.1) (φ.vertexCell p.1.2) : ℝ)

/-- **Layer 9 (lower-route bridge).** The route is **sparse at floor `ρ`**: some canonically
oriented pattern pair's route color has density below `ρ` between its assigned cells. Sparse is an
**easy local case, not a failure of regularity**: it is deliberately neither a seventh global
charge nor folded into Layer 8's exceptional polyads — conflating near-empty pair support with
top-irregularity would obscure the mass bookkeeping. -/
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

/-- **Layer 9 (lower-route bridge, sparse).** Placed counting closes on sparse routes with **no
counting lemma**: both the actual and the predicted count lie in `[0, ρ · ∏ᵢ |cellᵢ|]`, so their
difference does too. The instantiation `ρ := routeBudget3 C F₀.k (ε/6)` closes the sparse branch
of `placed_induced_counting3` exactly at its charge. -/
theorem placed_induced_counting3_of_sparseRoute (H' : Colored3Graph κ₃ V)
    {C : TriadicComplex3 κ₃ V} {F₀ : FiniteColored3Pattern κ₃}
    (φ : PatternPlacement3 C F₀) (ψ : PairColorPlacement3 C F₀ φ) {ρ : ℝ} (hρ : 0 ≤ ρ)
    (hsparse : ψ.IsSparseRoute ρ) :
    |((placedInducedCopyCount H' φ ψ : ℝ)) - expectedInducedCountAt H' C F₀ φ ψ| ≤
      ρ * ∏ i, ((φ.vertexCell i).card : ℝ) := sorry

/-- **Layer 9 (lower-route bridge).** The pair-regularity **input-strength threshold** for dense
lower-route counting: regularity at `pairRouteRegularityThreshold3 k ρ δ` suffices to count routes
whose pair densities all reach the floor `ρ`, with output error `δ` at the placement scale
(`lowerRoute_counting3`). Input strength and output slack are **deliberately decoupled**: a linear
conversion (`≈ δ/C(k)`, as in the classical triangle counting lemma against regular pairs) and a
power-loss conversion (`≈ (δ/C(k))⁴`) both instantiate this definition, so the targets do not
silently bet on the linear modulus (explicit value is a target). The dense counting theorem
`lowerRoute_counting3` is what gives the threshold its mathematical meaning — it must genuinely
suffice for dense counting; `pairRouteRegularityThreshold3_pos` makes it admissible to the
approximation theorem, and the calibration theorems ensure the chosen schedule is strong enough
to supply it. -/
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

/-- **Layer 9 (lower-route bridge, dense — the regularity-to-counting theorem).** At a transversal
placement, a route none of whose pair densities falls below the floor `ρ` is counted by the lower
prediction within `δ` at the placement scale, given pair regularity at the threshold. This is the
one place regularity strength converts into counting error, and the conversion's modulus lives
entirely inside `pairRouteRegularityThreshold3` — the statement is agnostic between a linear and a
power-loss conversion. -/
theorem lowerRoute_counting3 {C : TriadicComplex3 κ₃ V} {F₀ : FiniteColored3Pattern κ₃}
    (φ : PatternPlacement3 C F₀) (hφ : φ.Transversal) (ψ : PairColorPlacement3 C F₀ φ)
    {ρ δ : ℝ} (hρ : 0 < ρ) (hδ : 0 < δ) (hδρ : δ ≤ ρ) (hdense : ¬ ψ.IsSparseRoute ρ)
    (hreg : IsPairColorRegular C.skeleton (pairRouteRegularityThreshold3 F₀.k ρ δ)) :
    |((lowerRouteCountAt φ ψ : ℝ)) - expectedLowerRouteCountAt C F₀ φ ψ| ≤
      δ * ∏ i, ((φ.vertexCell i).card : ℝ) := sorry

/-- **Layer 9 (lower-route bridge, dense — the rank requirement).** The NRS rank the dense
conversion genuinely needs, as a function of the pattern size and the dense output error
(explicit value is a target). The NRS counting architecture chooses its integer rank **after**
the pattern and density parameters (NRS, *The counting lemma for regular k-uniform hypergraphs*,
Theorem 1.5); rank `1` does not suffice for `k`-vertex counting, so the conversion must not
assert the result for every positive rank — that would make the pattern-dependent
`inducedCountingRank3` ornamental. -/
def requiredTopCountingRank3 (k : ℕ) (δ : ℝ) : ℕ := sorry

/-- **Layer 9 (lower-route bridge, dense).** The required rank is at least one — the rank-`0`
test is vacuous on nonempty polyads (part of the target). -/
theorem one_le_requiredTopCountingRank3 (k : ℕ) (δ : ℝ) (hδ : 0 < δ) :
    1 ≤ requiredTopCountingRank3 k δ := sorry

/-- **Layer 9 (lower-route bridge, calibration — the rank decision point).** The global rank
supplies the conversion's requirement at the global instantiation
(`δ = routeBudget3 C F₀.k (ε/12)`), **for complexity-bounded complexes**. The `hC` hypothesis is
essential: over arbitrary complexes the route budget shrinks with an unbounded
`C.pairColorCount`, and no fixed rank could dominate the requirement at arbitrarily small
errors. With the bound in hand the statement is the fixed-point form the architecture needs —
the rank being calibrated appears inside the complexity bound itself, the wellfounded parameter
choice of the published architecture. If no such fixed point exists, the rank must instead
become a schedule `ℕ → ℕ` evaluated at the complexity, mirroring the NRS regularity lemma's
`r : ℕ → ℕ` — either resolution changes this statement visibly rather than silently (part of
the target). -/
theorem requiredTopCountingRank3_le_inducedCountingRank3 (q₃ : ℕ) (ε : ℝ) (hε : 0 < ε)
    (C : TriadicComplex3 κ₃ V) (F₀ : FiniteColored3Pattern κ₃) (t₀ : ℕ)
    (hC : ComplexityBounded C
      (regularityBound3 q₃ (inducedCountingParameter3 q₃ F₀.k ε)
        (inducedCountingSchedule3 q₃ F₀.k ε) (inducedCountingRank3 q₃ F₀.k ε) t₀)) :
    requiredTopCountingRank3 F₀.k (routeBudget3 C F₀.k (ε / 12)) ≤
      inducedCountingRank3 q₃ F₀.k ε := sorry

/-- **Layer 9 (lower-route bridge, dense — the conversion).** Lower-route control plus route-local
top regularity yields placed induced counting: the top factors are read off the route's polyads at
relative error `η` per pattern triple against the lower-route mass, so the placed count meets the
intrinsic prediction within `δ + k³·η` at the placement scale. The rank hypothesis is a genuine
pattern/error-dependent lower bound `requiredTopCountingRank3 F₀.k δ ≤ r`, not a bare `1 ≤ r` —
NRS choose the rank after the pattern and density parameters, and rank `1` is not counting-ready
strength for a `k`-vertex pattern. The parameter inequalities `δ ≤ ρ` and `k³·η ≤ δ` are the
explicit smallness the derivation needs, in exactly the scaled form the calibration theorems
supply (`inducedCountingSchedule3_top_le_routeBudget3` gives `k³·η ≤ δ` directly; the unscaled
`η ≤ δ` would not follow from it at `k = 0`, where the empty pattern makes the statement
degenerate anyway). -/
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

/-- **Layer 9 (lower-route bridge, calibration).** The schedule supplies the dense threshold at
the route-budgeted charge: at the lower complexity (the evaluation point `LowerSkeletonRegular`
actually provides), the schedule is at least as strong as the threshold at floor
`routeBudget3 C k (ε/6)` and output error `routeBudget3 C k (ε/12)` — half the placed-counting
charge, the other half absorbing the top slack (`inducedCountingSchedule3_top_le_routeBudget3`).
The threshold's meaning comes from `lowerRoute_counting3`, which it must genuinely suffice for;
this calibration ensures the chosen schedule is strong enough to supply it (part of the
target). -/
theorem inducedCountingSchedule3_le_pairRouteRegularityThreshold3 (q₃ : ℕ) (ε : ℝ)
    (hε : 0 < ε) (C : TriadicComplex3 κ₃ V) (F₀ : FiniteColored3Pattern κ₃) :
    inducedCountingSchedule3 q₃ F₀.k ε
        (C.skeleton.vertexPart.parts.card + C.pairColorCount) ≤
      pairRouteRegularityThreshold3 F₀.k (routeBudget3 C F₀.k (ε / 6))
        (routeBudget3 C F₀.k (ε / 12)) := sorry

/-- **Layer 9 (lower-route bridge, calibration).** The top slack fits the other half of the
placed charge: `k³` times the schedule at the complexity (the strength `IsTopRegularRoute` runs
at) is at most `routeBudget3 C k (ε/12)`, so the dense conversion's `δ + k³·η` lands inside
`routeBudget3 C k (ε/6)` — the sparse and dense branches then close the localized
`placed_induced_counting3` at the same charge (part of the target). -/
theorem inducedCountingSchedule3_top_le_routeBudget3 (q₃ : ℕ) (ε : ℝ) (hε : 0 < ε)
    (C : TriadicComplex3 κ₃ V) (F₀ : FiniteColored3Pattern κ₃) :
    (F₀.k : ℝ) ^ 3 * inducedCountingSchedule3 q₃ F₀.k ε C.complexity ≤
      routeBudget3 C F₀.k (ε / 12) := sorry

/-- **Layer 9 (lower-route bridge, calibration — discarded side).** The schedule supplies the
threshold at the discarded-prediction slack pair (`ρ = δ = exceptionalPredictionSlack3 … ℓ`), at
every complexity: this is the only link between the input schedule and the discarded-side output
slack, so `exceptional_route_prediction_mass_le` never feeds the schedule in as strength and out
as slack (part of the target). -/
theorem inducedCountingSchedule3_le_exceptionalPredictionThreshold (q₃ k : ℕ) (ε : ℝ)
    (hε : 0 < ε) (ℓ : ℕ) :
    inducedCountingSchedule3 q₃ k ε ℓ ≤
      pairRouteRegularityThreshold3 k (exceptionalPredictionSlack3 q₃ k ε ℓ)
        (exceptionalPredictionSlack3 q₃ k ε ℓ) := sorry

/-- **Layer 9 (placed local counting — the real counting lemma).** At a fixed **transversal**
placement `φ` (distinct assigned cells — repeated-cell placements are the diagonal gate's job, not
this lemma's) and a **top-regular route** `ψ` (`hroute` — the strong approximation controls only
most polyads, so a route through an exceptional polyad has no counting control and is excluded
here, its mass bounded separately by `exceptional_route_mass_le`), the placed induced count **in
the approximant `H'`** is within the per-route budget of the intrinsic prediction. The hypotheses
are exactly the **local contract** — transversality, lower-skeleton regularity at the schedule,
route-local top regularity, and rank adequacy (`hrank`, which the global theorem extracts from
`hreg`'s complexity bound through the rank calibration
`requiredTopCountingRank3_le_inducedCountingRank3`) — never the full
`IsStrongRegularApproximation3` bundle: the original `H`, the edit bound, the exceptional mass,
and the complexity control are global data this local lemma does not consume (the global theorem
extracts the local hypotheses from its `hreg`). Counting here must be in `H'`, not `H`: a small *global* edit discrepancy can be
concentrated entirely inside one placement, so it yields no per-placement bound — the `H'`-to-`H`
transfer is global, through `inducedCopyCount_edit_transfer`. The error is the **per-route budget
at the `ε/6` placed-counting charge** `routeBudget3 C F₀.k (ε/6)` — not a bare `ε`, for two
stacked reasons: a placement admits up to `q₂^(k choose 2)` routes (so per-route errors carry the
route-count divisor), and the global `ε` splits into **six explicit `ε/6` charges** (placed
counting; actual discarded mass; predicted discarded mass; predicted lower-route slack; diagonal;
edit transfer) — allocating the full `ε` here would exhaust the budget before the other steps
contribute. Proof route through the lower-route bridge: split on
`IsSparseRoute (routeBudget3 C F₀.k (ε/6))` — sparse routes self-bound
(`placed_induced_counting3_of_sparseRoute`); dense routes run the threshold counting theorem and
the conversion (`lowerRoute_counting3`, `placed_induced_counting3_of_denseRoute`), instantiated
through the calibration theorems and `IsPairColorRegular.mono`, with the conversion's rank
requirement met by `hrank`. -/
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
/-- **Layer 9 (exceptional routes — the step-2 union bound).** The named lemma making step 2 of
the global assembly explicit rather than a hidden bridge: the number of injective `k`-tuples one
of whose coordinate triples lands in the support of an exceptional (non-`(η, r)`-top-regular)
polyad is at most `k³` times the exceptional-polyad mass times `|V|^k` — pattern-local: under the
decomposition hypothesis each unit of exceptional support meets at most `k³ · |V|^{k−3}` tuples,
and the total support is at most `|V|³`. -/
theorem exceptional_route_mass_le (H' : Colored3Graph κ₃ V) (C : TriadicComplex3 κ₃ V)
    (F₀ : FiniteColored3Pattern κ₃) (η : ℝ) (r : ℕ) (hdecomp : IsPolyadDecomposition C) :
    ((univ.filter fun g : Fin F₀.k → V => Function.Injective g ∧
        ∃ P ∈ C.polyads, ¬ IsTopRegularOverPolyad H' P η r ∧
          ∃ x : {x : Fin 3 → V // Function.Injective x}, x ∈ P.support ∧
            ∃ i j l : Fin F₀.k, i < j ∧ j < l ∧
              x.1 0 = g i ∧ x.1 1 = g j ∧ x.1 2 = g l).card : ℝ) ≤
      (F₀.k : ℝ) ^ 3 * exceptionalPolyadMass H' C η r * (Fintype.card V : ℝ) ^ F₀.k := sorry

/-- **Layer 9.** The total **predicted** contribution of discarded routes **among transversal
placements**: the sum of `expectedInducedCountAt` over all transversal placements and all their
routes that are **not** `(η, r)`-top-regular (explicit definition is a target — the sum over the
placement structures, once their `Fintype` instances are set up). Transversal-only by design:
the lower-route bridge that bounds this mass requires transversality, and the nontransversal
(repeated-cell) predicted side is owned by `nontransversalPredictedMass3` under the diagonal
gate — the six-charge split stays overlap-free, with no hidden repeated-cell counting lemma.
The global absolute-difference argument must bound this **alongside** the actual discarded mass
(`exceptional_route_mass_le`): `expectedInducedCount` sums predictions over *all* routes,
including the discarded ones. -/
def exceptionalPredictedMass3 (H' : Colored3Graph κ₃ V) (C : TriadicComplex3 κ₃ V)
    (F₀ : FiniteColored3Pattern κ₃) (η : ℝ) (r : ℕ) : ℝ := sorry

/-- **Layer 9 (discarded routes, predicted side).** Companion to `exceptional_route_mass_le`,
**through the lower-route bridge**: sparse routes' predictions self-bound at the floor `ρ`, dense
routes' predictions tie to their polyads' actual supports within `δ` by threshold regularity, so
predictions concentrated on exceptional polyads inherit the exceptional-mass bound up to a
per-route slack `δ + ρ` — accumulated over the **route-count factor** `q₂^(k choose 2)`. The
mass is **transversal-only** (see `exceptionalPredictedMass3`) — exactly what lets the bridge,
whose dense theorem requires transversality, apply per placement; the repeated-cell predicted
side is the diagonal gate's. Three
deliberate signature choices: input regularity is at the **threshold**
`pairRouteRegularityThreshold3` while the conclusion slack is the **separate output pair**
`(ρ, δ)` — never the same function in as strength and out as slack, which would bake a linear
regularity-to-counting modulus into the statement (the global instantiation takes
`ρ = δ = exceptionalPredictionSlack3 … ℓ` at the lower complexity `ℓ`, supplied from the schedule
via `inducedCountingSchedule3_le_exceptionalPredictionThreshold` and `IsPairColorRegular.mono`,
and fits its `ε/6` charge by `exceptionalPredictionSlack3_charge`); the exceptional-mass
parameter `εmass` is separate from the counting slack (the global theorem supplies it at
`inducedCountingParameter3` — a single shared `ε` could not be instantiated without an unpinned
comparison); and the slack carries the route-count factor — per-route errors accumulate over that
many routes. Without this lemma the global assembly would bound only the actual side of the
discarded routes. -/
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

/-- **Layer 9 (diagonal gate — the pinned `ε/6` charge).** The theorem `VertexCellsControlled` is
*for*: under an equitable vertex partition with at least `diagonalControl3 F₀.k ε` cells, the
**sum of both sides omitted by transversal counting** — the actual injective tuples with two
coordinates in a common cell, plus the predicted mass of nontransversal placements — is at most
`ε/6 · |V|^k`. Each cell holds roughly `|V|/t` vertices, so repeated-cell tuples number about
`k²·|V|^k/t`; the floor makes that (and its predicted mirror) fit the charge. Without this pinned
target the diagonal charge would be asserted only in prose, unlike the other five. -/
theorem nontransversal_actual_and_predicted_mass_le (H' : Colored3Graph κ₃ V)
    (C : TriadicComplex3 κ₃ V) (F₀ : FiniteColored3Pattern κ₃) (ε : ℝ) (hε : 0 < ε)
    (hcells : VertexCellsControlled C (diagonalControl3 F₀.k ε)) :
    ((univ.filter fun g : Fin F₀.k → V => Function.Injective g ∧
        ∃ i j : Fin F₀.k, i ≠ j ∧
          ∃ A ∈ C.skeleton.vertexPart.parts, g i ∈ A ∧ g j ∈ A).card : ℝ)
      + nontransversalPredictedMass3 H' C F₀ ≤
      ε / 6 * (Fintype.card V : ℝ) ^ F₀.k := sorry

/-- **Layer 9 (edit transfer).** The named global transfer lemma: two colorings' induced copy
counts differ by at most the edit mass times the number of placements meeting a fixed triple —
`k³ · editDiscrepancy3 · |V|^k` is a safe explicit form. This is the **only** place the `H`/`H'`
difference enters the counting chain; it is global by nature (per-placement transfer is false under
edit concentration). -/
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

/-- **Layer 9 (assembly — the fibration identity).** Under a polyad decomposition, the
approximant's induced copy count is **exactly** the sum of placed counts over all placements and
routes: each actual copy lands its vertices in unique cells (its placement) and its coordinate
pairs in unique colors (its route), and the induced polyads lie in `C` automatically — the
decomposition's covering polyad at each triple is determined by the triple's cells and pair
colors. Without this named identity the global theorem's step 1 would rest on an unstated
bijection. -/
theorem inducedCopyCount_eq_sum_placed (H' : Colored3Graph κ₃ V) (C : TriadicComplex3 κ₃ V)
    (F₀ : FiniteColored3Pattern κ₃) (hdecomp : IsPolyadDecomposition C) :
    H'.inducedCopyCount F₀ =
      ∑ φ : PatternPlacement3 C F₀, ∑ ψ : PairColorPlacement3 C F₀ φ,
        placedInducedCopyCount H' φ ψ := sorry

/-- **Layer 9 (assembly).** The predicted mirror of the fibration identity: the global prediction
is the sum of the per-placement predictions — pinning `expectedInducedCount`'s definitional
docstring as a named identity once the `Fintype` instances exist. -/
theorem expectedInducedCount_eq_sum (H' : Colored3Graph κ₃ V) (C : TriadicComplex3 κ₃ V)
    (F₀ : FiniteColored3Pattern κ₃) :
    expectedInducedCount H' C F₀ =
      ∑ φ : PatternPlacement3 C F₀, ∑ ψ : PairColorPlacement3 C F₀ φ,
        expectedInducedCountAt H' C F₀ φ ψ := sorry

/-- **Layer 9 (assembly — the six-charge arithmetic, proved).** If the actual-vs-predicted
difference splits into six contributions and each fits its `ε/6` charge at scale `N`, the total
fits `ε · N`. Proved here, not a target: the assembly arithmetic is machine-checked now, so the
global theorem's remaining depth is exactly the six charge bounds and the split itself. -/
theorem sixCharge_assembly {x y e₁ e₂ e₃ e₄ e₅ e₆ N ε : ℝ}
    (hsplit : |x - y| ≤ e₁ + e₂ + e₃ + e₄ + e₅ + e₆)
    (h₁ : e₁ ≤ ε / 6 * N) (h₂ : e₂ ≤ ε / 6 * N) (h₃ : e₃ ≤ ε / 6 * N)
    (h₄ : e₄ ≤ ε / 6 * N) (h₅ : e₅ ≤ ε / 6 * N) (h₆ : e₆ ≤ ε / 6 * N) :
    |x - y| ≤ ε * N := by linarith

/-- **Layer 9 (global counting theorem).** Induced counting: if `(H', C)` is a strong regular
approximation of `H` at the (`V`-independent) parameter `inducedCountingParameter3 q₃ F₀.k ε` and
rank `inducedCountingRank3 q₃ F₀.k ε`, **and** the vertex cells are controlled at the diagonal
floor `diagonalControl3 F₀.k ε` (equitable, enough cells — so the nontransversal placement mass is
below the error), then the induced copy count **in the original `H`** of the fixed pattern `F₀` on
`k` vertices is within `ε · |V|^k` of the intrinsic prediction from the approximant. The final `ε`
splits into **six explicit `ε/6` charges** across four steps, each charge closed by a pinned
target: (1) `placed_induced_counting3` summed over transversal placements with **top-regular
routes** — the per-route `routeBudget3 _ _ (ε/6)` sums back to `ε/6` across the up to
`q₂^(k choose 2)` routes per placement; (2) the discarded routes bounded on **both** sides —
actual mass by `exceptional_route_mass_le` and predicted mass **among transversal placements**
(two charges: exceptional mass +
lower-route slack) by `exceptional_route_prediction_mass_le` — instantiated at
`ρ = δ = exceptionalPredictionSlack3 … ℓ` through the discarded-side calibration — their fits
pinned by `inducedCountingParameter3_charge` and `exceptionalPredictionSlack3_charge`; (3) the
diagonal gate
bounding the omitted nontransversal placements — actual **and** predicted — at its `ε/6` charge,
pinned by `nontransversal_actual_and_predicted_mass_le`; (4)
`inducedCopyCount_edit_transfer` moving the `H'`-count to the `H`-count (the transfer is global —
never per placement), its fit again `inducedCountingParameter3_charge`. The regularity hypothesis
runs at the genuine schedule `inducedCountingSchedule3` with the global edit/exceptional mass at
the separate `inducedCountingParameter3`. Assembly discipline: step 1's sum runs through the
fibration identity `inducedCopyCount_eq_sum_placed` and its predicted mirror
`expectedInducedCount_eq_sum`, the local hypotheses of `placed_induced_counting3` are extracted
from `hreg`, and the final arithmetic is the **proved** `sixCharge_assembly`.
Induced-removal-style corollaries are downstream
consumers, not part of the roadmap's endpoints. Architectural blueprint: the binary-palette counting
phase of `regularity-lemmata` — transversal counting first, then the diagonal-cell gate. -/
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
