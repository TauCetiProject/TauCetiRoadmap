import Mathlib

/-!
# Graph regularity, strong regularity, and arity-3 hypergraph complexes: suggested signatures

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
`Colored3Graph κ₃ V` with a **separate** pair palette `κ₂`; and top regularity is of the original
graph `H` **relative to** a complex's subpolyad decomposition.

This roadmap **consumes** the dense graph limits roadmap (graphons / cut norm / cut distance /
Frieze–Kannan) rather than redefining it; those adapters (Layer 3) live in `README.md` and are pinned
here only once that roadmap lands upstream, so this file imports only Mathlib.
-/

noncomputable section

open Finset

namespace TauCetiRoadmap.Regularity

variable {V : Type*} [Fintype V] [DecidableEq V]
variable {κ₂ κ₃ : Type*} [Fintype κ₂] [DecidableEq κ₂] [Fintype κ₃] [DecidableEq κ₃]

/-! ### Layer 0 — finite colored graph and 3-uniform vocabulary -/

/-- **Layer 0.** A finite `r`-uniform hypergraph: a finset of `r`-element edges. -/
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
**not** Jensen-monotone under arbitrary refinement (only inside its `increment` argument). -/
theorem weightedEnergy_mono_of_refines (G : SimpleGraph V) [DecidableRel G.Adj]
    {P Q : Finpartition (univ : Finset V)} (h : P ≤ Q) :
    weightedEnergy G Q ≤ weightedEnergy G P := sorry

/-! ### Layer 2 — Szemerédi graph regularity bridge -/

/-- **Layer 2.** `P` **almost-refines** `P₀` (up to a `δ`-remainder): each `P₀`-part `A` is covered,
up to `δ·|A|` leftover vertices, by `P`-parts **contained in `A`**. The containment clause
`∀ B ∈ T, B ⊆ A` is essential — without it `T = P.parts` makes the remainder empty vacuously. -/
def AlmostRefines (P P₀ : Finpartition (univ : Finset V)) (δ : ℝ) : Prop :=
  ∀ A ∈ P₀.parts, ∃ T ⊆ P.parts, (∀ B ∈ T, B ⊆ A) ∧
    ((A \ T.biUnion id).card : ℝ) ≤ δ * A.card

/-- **Layer 2.** The `V`-independent complexity bound for the refining-regularity theorem (explicit
value is a target). -/
def refiningRegularityBound (ε : ℝ) (l : ℕ) : ℕ := sorry

/-- **Layer 2 (bridge).** A regular equipartition **almost-refining** a given equipartition `P₀`, with
a `V`-independent complexity bound. `hP₀` (equipartition) and `hV` (`V` large enough) are **required**:
without them a singleton `P₀`-part cannot be covered up to `ε·|A|` by contained cells of a bounded
equipartition, and the statement is false. Consumes Mathlib's `szemeredi_regularity`; not reproved. -/
theorem exists_regular_equipartition_almost_refining (G : SimpleGraph V) [DecidableRel G.Adj]
    (P₀ : Finpartition (univ : Finset V)) (hP₀ : P₀.IsEquipartition) (ε : ℝ) (hε : 0 < ε)
    (hV : refiningRegularityBound ε P₀.parts.card ≤ Fintype.card V) :
    ∃ P : Finpartition (univ : Finset V),
      P.IsEquipartition ∧ P.IsUniform G ε ∧ AlmostRefines P P₀ ε ∧
        P.parts.card ≤ refiningRegularityBound ε P₀.parts.card := sorry

/-! ### Layer 4 — strong graph regularity -/

/-- **Layer 4.** The `V`-independent complexity bound for the fine partition (explicit value is a
target). -/
def strongGraphRegularityBound (ε : ℝ) (F : ℕ → ℝ) : ℕ := sorry

/-- **Layer 4.** A strong-regularity witness: a coarse `P` and fine `Q` (`Q ≤ P`, i.e. `Q` refines
`P`), both equipartitions, with `P` `ε`-uniform, `Q` `F(#P.parts)`-uniform, a small weighted-energy
gap, and a complexity bound on `Q`. The `boundedFine` field is essential — it prevents `⊥` (discrete)
from being the universal large-graph witness. -/
structure StrongRegular (G : SimpleGraph V) [DecidableRel G.Adj]
    (P Q : Finpartition (univ : Finset V)) (ε : ℝ) (F : ℕ → ℝ) : Prop where
  refines : Q ≤ P
  equitP : P.IsEquipartition
  equitQ : Q.IsEquipartition
  regP : P.IsUniform G ε
  regQ : Q.IsUniform G (F P.parts.card)
  energyClose : weightedEnergy G Q - weightedEnergy G P ≤ ε
  boundedFine : Q.parts.card ≤ strongGraphRegularityBound ε F

/-- **Layer 4 (summit).** Strong graph regularity: coarse/fine equipartitions with the properties
above exist for every error hierarchy `F`. -/
theorem exists_strong_regular (G : SimpleGraph V) [DecidableRel G.Adj]
    (ε : ℝ) (hε : 0 < ε) (F : ℕ → ℝ) (hF : ∀ n, 0 < F n) :
    ∃ P Q : Finpartition (univ : Finset V), StrongRegular G P Q ε F := sorry

/-! ### Layer 5 — hypergraph complexes; vertex cells and pair-color systems -/

/-- **Layer 5.** A down-closed `r`-dimensional complex: faces at each level `k ≤ r`, each a `k`-set,
closed under taking subsets. -/
structure HypergraphComplex (r : ℕ) (V : Type*) [DecidableEq V] where
  faces : ∀ k : ℕ, k ≤ r → Finset (Finset V)
  face_card : ∀ k (hk : k ≤ r), ∀ s ∈ faces k hk, s.card = k
  down_closed : ∀ k (hk : k ≤ r), ∀ s ∈ faces k hk, ∀ t ⊆ s,
    ∀ (htk : t.card ≤ r), t ∈ faces t.card htk

/-- **Layer 5.** An (ordered) pair-color system: a coloring of ordered vertex pairs into the pair
palette `κ₂`. -/
structure PairColorSystem (κ₂ : Type*) (V : Type*) where
  color : V → V → κ₂

/-- **Layer 5.** A cell pair `(s, t)` with distinguished large sub-cells `(s', t')` — structurally
four finsets with `s' ⊆ s` and `t' ⊆ t`. The intended use binds `s, t` to a skeleton's vertex cells
(and `s', t'` to sub-cells); that binding is a later invariant, not enforced by this structure.
Regularity is tested against these distinguished sub-cells rather than arbitrary subsets. -/
structure SubCellPair (V : Type*) where
  s : Finset V
  t : Finset V
  s' : Finset V
  t' : Finset V
  hs : s' ⊆ s
  ht : t' ⊆ t

/-- **Layer 5.** The density of pair-color `c` over the ordered cell pair `(s, t)`. -/
def pairColorDensity (S : PairColorSystem κ₂ V) (c : κ₂) (s t : Finset V) : ℚ :=
  (((s ×ˢ t).filter (fun p => S.color p.1 p.2 = c)).card : ℚ) / ((s.card * t.card : ℕ) : ℚ)

/-- **Layer 5.** A pair-color system is regular when, for every color and every sub-cell-pair with
large enough sub-cells, the per-color density is stable. Quantified over `SubCellPair`, not arbitrary
subsets. -/
def IsPairColorRegular (S : PairColorSystem κ₂ V) (ε : ℝ) : Prop :=
  ∀ (c : κ₂) (D : SubCellPair V),
    ε * (D.s.card : ℝ) ≤ D.s'.card → ε * (D.t.card : ℝ) ≤ D.t'.card →
      |(pairColorDensity S c D.s' D.t' : ℝ) - (pairColorDensity S c D.s D.t : ℝ)| ≤ ε

/-- **Layer 5.** The lower skeleton of a triadic complex: a vertex partition together with a
pair-color system. Built here — **not** on `TriadicComplex3`, which does not exist until Layer 8. -/
structure PairSkeleton3 (κ₂ : Type*) (V : Type*) [Fintype V] [DecidableEq V] where
  vertexPart : Finpartition (univ : Finset V)
  pairColors : PairColorSystem κ₂ V

/-- **Layer 5.** The lower skeleton is regular when its pair-color system is `F`-regular, with `F`
evaluated explicitly at the number of vertex cells (no hidden error-hierarchy choice). -/
def LowerSkeletonRegular (S : PairSkeleton3 κ₂ V) (F : ℕ → ℝ) : Prop :=
  IsPairColorRegular S.pairColors (F S.vertexPart.parts.card)

/-! ### Layer 6 — triads, polyads, subpolyads, relative densities -/

/-- **Layer 6.** A polyad over three vertex cells: the cells `c₀ c₁ c₂` and a support of
**role-ordered, injective** triples (each `Fin 3` coordinate a fixed role, injective ⇒ no diagonals),
each lying in the corresponding cells. Normalization to one representative per role-assignment (so
orderings are not overcounted) is a **later invariant**, not enforced by this structure — a
normalization field can be added when a counting milestone makes it load-bearing. -/
structure Polyad3 (V : Type*) [DecidableEq V] where
  c₀ : Finset V
  c₁ : Finset V
  c₂ : Finset V
  support : Finset {x : Fin 3 → V // Function.Injective x}
  mem_cells : ∀ x ∈ support, x.1 0 ∈ c₀ ∧ x.1 1 ∈ c₁ ∧ x.1 2 ∈ c₂

/-- **Layer 6.** A subpolyad of `P`: a sub-support of `P`'s support. Regularity is tested against
these lower-dimensional restrictions. -/
structure Subpolyad3 {V : Type*} [DecidableEq V] (P : Polyad3 V) where
  support : Finset {x : Fin 3 → V // Function.Injective x}
  sub : support ⊆ P.support

/-- **Layer 6.** A subpolyad viewed as a polyad (inheriting the cells and, from `sub`, the cell
membership). -/
def Subpolyad3.toPolyad {P : Polyad3 V} (Q : Subpolyad3 P) : Polyad3 V where
  c₀ := P.c₀
  c₁ := P.c₁
  c₂ := P.c₂
  support := Q.support
  mem_cells := fun x hx => P.mem_cells x (Q.sub hx)

/-- The underlying unordered triple of a role-ordered injective triple (a `3`-element finset). -/
def underlyingTriple (x : {x : Fin 3 → V // Function.Injective x}) : {s : Finset V // s.card = 3} :=
  ⟨univ.image x.1, by rw [Finset.card_image_of_injective _ x.2, Finset.card_univ, Fintype.card_fin]⟩

/-- **Layer 6.** The **color-indexed** relative density of top color `c` over a polyad: the fraction
of the polyad's support tuples whose **underlying unordered triple** has color `c`. Per-color, so
induced counting keeps control over complements/nonedges. -/
def relativeDensity (H : Colored3Graph κ₃ V) (c : κ₃) (P : Polyad3 V) : ℚ :=
  ((P.support.filter (fun x => H.color (underlyingTriple x) = c)).card : ℚ) / (P.support.card : ℚ)

/-! ### Layer 7 — top-layer regularity over polyads -/

/-- **Layer 7.** `H` is top-regular over the polyad `P` when, for every top color and every large
enough **subpolyad** (lower-skeleton restriction, not an arbitrary triple-subset), the relative
density is stable. -/
def IsTopRegularOverPolyad (H : Colored3Graph κ₃ V) (P : Polyad3 V) (ε : ℝ) : Prop :=
  ∀ (c : κ₃) (Q : Subpolyad3 P), ε * (P.support.card : ℝ) ≤ Q.support.card →
    |(relativeDensity H c Q.toPolyad : ℝ) - (relativeDensity H c P : ℝ)| ≤ ε

/-! ### Layer 8 — strong arity-3 regular approximation (summit) -/

/-- **Layer 8.** A triadic complex: the lower `skeleton`, the family of `polyads`, and a `complexity`
measure. -/
structure TriadicComplex3 (κ₂ κ₃ : Type*) (V : Type*) [Fintype V] [DecidableEq V] where
  skeleton : PairSkeleton3 κ₂ V
  polyads : Finset (Polyad3 V)
  complexity : ℕ

/-- **Layer 8.** The edit discrepancy between `H`'s coloring and the complex's induced top coloring
(normalized; explicit formula is a target). -/
def editDiscrepancy3 (H : Colored3Graph κ₃ V) (C : TriadicComplex3 κ₂ κ₃ V) : ℚ := sorry

/-- **Layer 8.** `C` approximates `H` to within `ε`. The clause tying `C` to `H` — without it the
regularity/complexity conjuncts below are satisfiable by a complex unrelated to `H`. -/
def Approximates3 (H : Colored3Graph κ₃ V) (C : TriadicComplex3 κ₂ κ₃ V) (ε : ℝ) : Prop :=
  (editDiscrepancy3 H C : ℝ) ≤ ε

open Classical in
/-- **Layer 8.** The support-weighted mass of `C`'s polyads over which `H` fails to be `η`-top-regular.
Top regularity is of the original `H` **relative to** `C`'s polyad decomposition (`IsTopRegularOverPolyad`
composes directly); counting is of `H`, and `C`↔`H` fidelity is `Approximates3`. **Convention:** with
no polyads or all-empty supports the denominator is `0` and the mass is `0` (Lean's `_ / 0 = 0`);
substantive statements assume positive total support. -/
def exceptionalPolyadMass (H : Colored3Graph κ₃ V) (C : TriadicComplex3 κ₂ κ₃ V) (η : ℝ) : ℝ :=
  (∑ P ∈ C.polyads, if IsTopRegularOverPolyad H P η then (0 : ℝ) else (P.support.card : ℝ)) /
    (∑ P ∈ C.polyads, (P.support.card : ℝ))

/-- **Layer 8.** `H` is top-regular over all but an `F`-fraction of `C`'s polyads, with `F` evaluated
at `C.complexity`. -/
def TopRegularOverMostPolyads (H : Colored3Graph κ₃ V) (C : TriadicComplex3 κ₂ κ₃ V)
    (F : ℕ → ℝ) : Prop :=
  exceptionalPolyadMass H C (F C.complexity) ≤ F C.complexity

/-- **Layer 8.** The complex's complexity is bounded by `b`. -/
def ComplexityBounded (C : TriadicComplex3 κ₂ κ₃ V) (b : ℕ) : Prop :=
  C.complexity ≤ b

/-- **Layer 8.** The `V`-independent complexity bound for the strong arity-3 approximation (explicit
value is a target). -/
def regularityBound3 (ε : ℝ) (F : ℕ → ℝ) : ℕ := sorry

/-- **Layer 8.** The strong arity-3 regular-approximation predicate: `C` approximates `H`, its lower
skeleton is regular, `H` is top-regular over most of its polyads, and its complexity is bounded. -/
def IsStrongRegularApproximation3 (H : Colored3Graph κ₃ V) (C : TriadicComplex3 κ₂ κ₃ V)
    (ε : ℝ) (F : ℕ → ℝ) : Prop :=
  Approximates3 H C ε ∧ LowerSkeletonRegular C.skeleton F ∧
    TopRegularOverMostPolyads H C F ∧ ComplexityBounded C (regularityBound3 ε F)

/-- **Layer 8 (summit).** Strong arity-3 regular approximation: every colored 3-graph has a
bounded-complexity regular approximation. -/
theorem exists_strong_regular_approximation3 (H : Colored3Graph κ₃ V)
    (ε : ℝ) (hε : 0 < ε) (F : ℕ → ℝ) (hF : ∀ n, 0 < F n) :
    ∃ C : TriadicComplex3 κ₂ κ₃ V, IsStrongRegularApproximation3 H C ε F := sorry

/-! ### Layer 9 — induced counting and embedding -/

/-- **Layer 9.** A finite colored 3-pattern: a colored 3-graph on `Fin k`. -/
structure FiniteColored3Pattern (κ₃ : Type*) where
  k : ℕ
  pattern : {s : Finset (Fin k) // s.card = 3} → κ₃

/-- **Layer 9.** The number of induced (part-respecting, color-matching) labeled copies of a pattern
in a colored 3-graph (explicit definition is a target). -/
def Colored3Graph.inducedCopyCount (H : Colored3Graph κ₃ V) (F₀ : FiniteColored3Pattern κ₃) : ℕ :=
  sorry

/-- **Layer 9.** The expected induced count predicted by a regular complex (explicit definition is a
target). -/
def expectedInducedCount (C : TriadicComplex3 κ₂ κ₃ V) (F₀ : FiniteColored3Pattern κ₃) : ℝ := sorry

/-- **Layer 9 (local counting summit).** Induced counting: the induced copy count of a fixed pattern
is close to the count predicted by a strong regular approximation. Induced-removal-style corollaries
are downstream consumers of this API, not part of the roadmap's summit. -/
theorem induced_counting_from_strong_regular_complex3 (H : Colored3Graph κ₃ V)
    (C : TriadicComplex3 κ₂ κ₃ V) (F₀ : FiniteColored3Pattern κ₃) (ε : ℝ) (hε : 0 < ε)
    (hreg : IsStrongRegularApproximation3 H C ε (fun _ => ε)) :
    |((H.inducedCopyCount F₀ : ℝ)) - expectedInducedCount C F₀| ≤ ε * (Fintype.card V : ℝ) ^ 3 :=
  sorry

end TauCetiRoadmap.Regularity
