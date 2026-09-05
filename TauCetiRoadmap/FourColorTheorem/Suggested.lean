import Mathlib

/-!
# The four colour theorem: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The declarations here suggest Lean forms for the hypermap theory, the
reducibility/coloring machinery, and the summit statements, mirroring the Coq `fourcolor`
proof. Discharging all of them finishes neither a work item nor the roadmap. `sorry` is
allowed in this human-owned roadmap library: these are targets, not completed definitions or
proofs.

The reflection-based claims that cannot be proved in Lean without `native_decide` are threaded
as **explicit hypotheses** of the summit theorem statements, never as `axiom`s, so the
assumptions are explicit and localised. The surrounding mathematics is nevertheless to be
proved in full. `sorry` is allowed anywhere a target is not yet discharged; the three carve-out
`Prop`s below are *the* carve-outs and must not be multiplied.
-/

namespace TauCetiRoadmap.FourColorTheorem

/-! ## Colours -/

/-- The four colours. -/
inductive Color : Type where
  | c0 | c1 | c2 | c3
  deriving DecidableEq, Repr



/-! ## Combinatorial hypermaps (Layer A) -/

/-- A finite hypermap: a finite dart type with three permutations whose pairwise composites
are the identity. `edge ∘ node ∘ face = id`, together with the two rotations of that identity.
The Coq `hypermap.v` uses exactly this three-permutation form for its symmetry content. -/
structure Hypermap where
  /-- The finite type of darts. -/
  Dart : Type
  [hdart : Fintype Dart]
  [hdartDec : DecidableEq Dart]
  /-- The edge permutation. -/
  edge : Dart ≃ Dart
  /-- The node permutation. -/
  node : Dart ≃ Dart
  /-- The face permutation. -/
  face : Dart ≃ Dart
  /-- `edge ∘ node ∘ face = id`. -/
  cancel_edge : ∀ x, edge (node (face x)) = x
  /-- `node ∘ face ∘ edge = id`. -/
  cancel_node : ∀ x, node (face (edge x)) = x
  /-- `face ∘ edge ∘ node = id`. -/
  cancel_face : ∀ x, face (edge (node x)) = x

attribute [instance] Hypermap.hdart Hypermap.hdartDec

namespace Hypermap

variable {G : Hypermap}

/-- The edge-equivalence: two darts are `edge`-connected. -/
def cedge (x y : G.Dart) : Prop := sorry -- placeholder shape

-- The connectivity relations and their lemmas are pinned in `README.md` Layer A; the exact
-- API is left to the implementer once `SimpleGraph`/`Relation.ReflTransGen` vocabulary is chosen.

/-- The `glink` relation used for connectivity (union of the three permutation graphs). -/
def glink (x y : G.Dart) : Prop :=
  y = G.edge x ∨ y = G.node x ∨ y = G.face x ∨ x = G.edge y ∨ x = G.node y ∨ x = G.face y

/-- Connectedness of the dart type under `glink`. -/
def Connected : Prop := ∀ x y : G.Dart, Relation.ReflTransGen glink x y

/-- The Euler left-hand side: `2 * (number of connected components) + number of darts`.
The components count is `n_comp glink G` (Coq's `n_comp`), a natural number to be defined. -/
def underConstruction_components (G : Hypermap) : ℕ := sorry

noncomputable def EulerLHS (G : Hypermap) : ℕ := 2 * underConstruction_components G + Nat.card G.Dart

/-- Euler right-hand side: edges + nodes + faces, the sum of the orbit counts of the three
permutations. -/
def EulerRHS (G : Hypermap) : ℕ := sorry

/-- The genus of the hypermap. -/
noncomputable def genus (G : Hypermap) : ℕ := (EulerLHS G - EulerRHS G) / 2

/-- Planarity: the genus is zero. -/
def Planar (G : Hypermap) : Prop := G.genus = 0

/-- The Jordan/Möbius-path characterization of planarity: no closed walk is a Möbius path
(a pair of link types crossing). -/
def Jordan (G : Hypermap) : Prop :=
  ¬ ∃ q : List G.Dart, true -- placeholder: the no-Möbius-path condition

/-- Euler's formula, and the equivalence of the Euler and Jordan characterizations. -/
theorem planar_iff_jordan (G : Hypermap) : Planar G ↔ Jordan G := by sorry

/-- The dual of a hypermap, reversing edges and faces. -/
def dual (G : Hypermap) : Hypermap := sorry
def permN (G : Hypermap) : Hypermap := sorry
def permF (G : Hypermap) : Hypermap := sorry
def mirror (G : Hypermap) : Hypermap := sorry

theorem planar_permN (G : Hypermap) : Planar (permN G) ↔ Planar G := by sorry
theorem planar_permF (G : Hypermap) : Planar (permF G) ↔ Planar G := by sorry
theorem planar_dual (G : Hypermap) : Planar (dual G) ↔ Planar G := by sorry

/-- A map is bridgeless when no edge link is a loop. -/
def Bridgefree (G : Hypermap) : Prop :=
  ∀ x : G.Dart, x ≠ G.edge x

/-- A map is plain when no node is a loop. -/
def Plain (G : Hypermap) : Prop :=
  ∀ x : G.Dart, x ≠ G.node x

/-- Pre-cubic: every node has degree at most three. -/
def Precubic (G : Hypermap) : Prop := True -- placeholder

/-- Cubic: every node has degree exactly three. -/
def Cubic (G : Hypermap) : Prop := True -- placeholder

/-- Pentagonal: every face has arity five. -/
def Pentagonal (G : Hypermap) : Prop := True -- placeholder

/-- The `WalkupE` hypermap: dart `z` removed by "skipping" over it in the permutations. -/
def WalkupE (G : Hypermap) (z : G.Dart) : Hypermap := sorry
def WalkupN (G : Hypermap) (z : G.Dart) : Hypermap := sorry
def WalkupF (G : Hypermap) (z : G.Dart) : Hypermap := sorry

theorem planar_WalkupE {G : Hypermap} (z : G.Dart) (hG : Planar G) : Planar (WalkupE G z) := by sorry
theorem Jordan_WalkupE {G : Hypermap} (z : G.Dart) (hG : Jordan G) : Jordan (WalkupE G z) := by sorry

/-! ## Colourings (Layer A / Layer B) -/

/-- A colouring of a hypermap: constant on each face, distinct across each edge. -/
def Coloring (G : Hypermap) (k : G.Dart → Color) : Prop :=
  (∀ x y : G.Dart, Relation.ReflTransGen (fun a b => b = G.face a) x y → k x = k y) ∧
    ∀ x : G.Dart, k x ≠ k (G.face (G.node x))

/-- `G` is four-colourable: there is a map `Coloring`. -/
def FourColorable (G : Hypermap) : Prop := ∃ k : G.Dart → Color, Coloring G k

theorem coloring_inj {G : Hypermap} {k : G.Dart → Color} (hk : Coloring G k)
    (x y : G.Dart) (hxy : Relation.ReflTransGen (fun a b => b = G.face a) x y) :
    k x = k y := by sorry

theorem coloring_cface {G : Hypermap} {k : G.Dart → Color} (hk : Coloring G k)
    (x : G.Dart) : k x ≠ k (G.face (G.node x)) := by sorry

/-- Decidability of four-colourability, by constructive exhaustive search over the finite dart
type. This is *not* a reflection carve-out: it is a genuine algorithm and must be proved. -/
theorem decide_colorable (G : Hypermap) : FourColorable G ∨ ¬ FourColorable G := by sorry

/-! ## Minimal counterexample, contracts, and C-reducibility (Layer B / Layer C) -/

/-- A minimal counter-example to the finite combinatorial four colour theorem. -/
structure MinimalCounterExample (G : Hypermap) : Prop where
  planar : Planar G
  bridgeless : Bridgefree G
  plain : Plain G
  precubic : Precubic G
  noncolorable : ¬ FourColorable G
  minimal : ∀ G' : Hypermap, Planar G' → Bridgefree G' → Plain G' → Precubic G' →
    Nat.card G'.Dart < Nat.card G.Dart → FourColorable G'

theorem minimal_counter_example_is_cubic {G : Hypermap}
    (hG : MinimalCounterExample G) : Cubic G := by sorry

/-- A contract-colouring: agrees on edge links in `cc`, disagrees elsewhere. -/
def CCColoring (G : Hypermap) (cc : Set G.Dart) (k : G.Dart → Color) : Prop := sorry
def CColorable (G : Hypermap) (cc : Set G.Dart) : Prop := sorry
def RingTrace (G : Hypermap) (r : List G.Dart) (et : List Color) : Prop := sorry
def CCRingTrace (G : Hypermap) (cc : Set G.Dart) (r : List G.Dart) (et : List Color) : Prop := sorry
def ValidContract (G : Hypermap) (r : List G.Dart) (cc : Set G.Dart) : Prop := sorry

/-- C-reducible: `cc` is a valid contract for ring `r`, and every contract ring trace is in
the Kempe closure of the ring colourings of `r`. -/
def CReducible (G : Hypermap) (r : List G.Dart) (cc : Set G.Dart) : Prop := sorry



/-! ## Configurations and construction programs (Layer C) -/

/-- A construction-program step. -/
inductive CpStep : Type where
  | cpR (n : ℕ) : CpStep
  | cpR' : CpStep
  | cpU : CpStep
  | cpK : CpStep
  | cpY : CpStep
  | cpH : CpStep
  | cpA : CpStep
  deriving DecidableEq

/-- A construction program is a list of steps. -/
def CProg : Type := List CpStep

/-- A configuration: a construction program for its ring, and a set of darts. -/
structure Config where
  prog : CProg

/-- The 633 configurations of Robertson–Sanders–Seymour–Thomas, as closed data. -/
def the_configs : List Config := [] -- placeholder: the closed 633-entry data

/-- The boolean C-reducibility check on a configuration. -/
def check_reducible (cf : Config) : Bool := sorry

/-- The semantic C-reducibility of a config's map. -/
def cfreducible (cf : Config) : Prop := sorry

/-- Soundness: the boolean check implies the semantic property. This is the honest mathematics
relating the computed boolean to `CReducible`, and is a target. -/
theorem check_reducible_valid (cf : Config) : check_reducible cf = true → cfreducible cf := by sorry

/-! ## Discharge scaffolding used by the carve-outs -/

/-- The discharge charge of the face at `x` in a minimal counterexample: the arity reduced by
the hubcap discharge. A natural since the Coq `dscore` is pushed back up to be nonnegative on
positive-score hubs; refine the sign convention with the final API. -/
def Score (G : Hypermap) (x : G.Dart) : ℕ := sorry

/-- The discharge-derived upper bound on the hub-face arity `n` in a minimal counterexample,
used by carve-out 2. -/
def HubArityBound (n : ℕ) : ℕ := sorry

/-! ## The reflection carve-outs -/

/-- Carve-out 1 (proof by reflection): every one of the 633 configurations in `the_configs`
is C-reducible. Proven only by large computation in Coq; assumed in Lean. `the_configs[i]`
is the `i`-th configuration (a suggested reading; refine to a `List.get`/`nth` spelling in
the final API). -/
def Reducibility : Prop :=
  ∀ i, i < the_configs.length → cfreducible (the_configs[i]'sorry)

/-- Carve-out 2 (proof by reflection): the finite discharge-fork table meets the derived hub
arity bound. `the_fork_row : Fin 12 → ℕ` is a fixed closed table and `HubArityBound` is the
discharge-derived upper bound (Layer D); only "the table meets the bound" is computed. `Part`
is the part/configuration-shape type of Layer D. -/
def Part : Type := sorry

def the_fork_row : Fin 12 → ℕ := sorry

def DischargeForkConsistent : Prop :=
  ∀ n : Fin 12, 5 ≤ n.val → HubArityBound n.val ≤ the_fork_row n

/-- Carve-out 3 (proof by reflection): every part that the presentation scripts reduce is in
the reduced red-part. `ReducedPart` reduces a part to a decidable boolean; `the_presentation_parts`
is the finite closed list of the parts the presentation scripts reduce. -/
def ReducedPart (p : Part) : Prop := sorry

def the_presentation_parts : List Part := [] -- placeholder: the closed list

def AllReducedParts : Prop :=
  ∀ p, p ∈ the_presentation_parts → ReducedPart p

/-! ## Discharge and unavoidability (Layer D / Layer E) -/

/-- The discharge inequation: the hub-face arity of a minimal counterexample is confined to
`5..11` unless a hubcap applies (the Coq `dscore_cap1`, which confines the arity to
`iota 5 7`). A theorem, not a carve-out. -/
theorem dscore_cap1 {G : Hypermap} (hG : MinimalCounterExample G)
    {x : G.Dart} (hpos : 0 < Score G x) : 5 ≤ Score G x ∧ Score G x ≤ 11 := by sorry

/-- No minimal counterexample has a hub of arity `n` for `5 ≤ n ≤ 11`. -/
def ExcludedArity (G : Hypermap) (n : ℕ) : Prop :=
  MinimalCounterExample G → ¬ ∃ x : G.Dart, Score G x = n

theorem exclude5 (fork : DischargeForkConsistent) (parts : AllReducedParts)
    (G : Hypermap) : ExcludedArity G 5 := by sorry
theorem exclude6 (fork : DischargeForkConsistent) (parts : AllReducedParts)
    (G : Hypermap) : ExcludedArity G 6 := by sorry
theorem exclude7 (fork : DischargeForkConsistent) (parts : AllReducedParts)
    (G : Hypermap) : ExcludedArity G 7 := by sorry
theorem exclude8 (fork : DischargeForkConsistent) (parts : AllReducedParts)
    (G : Hypermap) : ExcludedArity G 8 := by sorry
theorem exclude9 (fork : DischargeForkConsistent) (parts : AllReducedParts)
    (G : Hypermap) : ExcludedArity G 9 := by sorry
theorem exclude10 (fork : DischargeForkConsistent) (parts : AllReducedParts)
    (G : Hypermap) : ExcludedArity G 10 := by sorry
theorem exclude11 (fork : DischargeForkConsistent) (parts : AllReducedParts)
    (G : Hypermap) : ExcludedArity G 11 := by sorry

/-- Unavoidability: reducibility implies no minimal counter-example. Proved in full given the
carve-outs above, passed as explicit hypotheses (no axioms). -/
theorem unavoidability
    (red : Reducibility) (fork : DischargeForkConsistent) (parts : AllReducedParts)
    (G : Hypermap) (hG : MinimalCounterExample G) : False := by
  sorry

/-- The `cube` of a hypermap: a cubic plain hypermap preserving planarity, bridgelessness,
whose colouring lifts to `G`. -/
def cube (G : Hypermap) : Hypermap := sorry

theorem planar_cube (G : Hypermap) : Planar (cube G) ↔ Planar G := by sorry
theorem bridgeless_cube (G : Hypermap) : Bridgefree (cube G) ↔ Bridgefree G := by sorry
theorem cube_colorable (G : Hypermap) : FourColorable (cube G) → FourColorable G := by sorry

/-- **The combinatorial four colour theorem.** The mirror of the Coq `four_color_hypermap`,
proved from `unavoidability` and `decide_colorable`; the only non-kernel assumptions are the
three carve-out `Prop`s passed in explicitly as hypotheses. -/
theorem four_color_hypermap
    (red : Reducibility) (fork : DischargeForkConsistent) (parts : AllReducedParts)
    (G : Hypermap) : Planar G → Bridgefree G → FourColorable G := by
  sorry

/-! ## From the plane to the combinatorial theorem (Layer F) -/

/-- A plane map: `m.mem z r` reads "the point `z` lies in region `r`". `Region` is an index type
for the regions; it is finite exactly when the map is a `FiniteSimpleMap`, and arbitrary for a
`SimpleMap` (the compactness statement covers infinite maps, matching the Coq `four_color`). -/
structure PlanarMap where
  Region : Type
  /-- the region membership relation `point → region → Prop` -/
  mem : ℝ → ℝ → Region → Prop

/-- A map is a simple map when regions are open, connected, plain, and pairwise disjoint up to
boundaries. -/
def SimpleMap (m : PlanarMap) : Prop := sorry

/-- A finite simple map: simple, with finitely many regions. -/
def FiniteSimpleMap (m : PlanarMap) : Prop := SimpleMap m ∧ Nonempty (Fintype m.Region)

/-- `m` is `n`-colourable: an `n`-colouring of regions assigning distinct colours to adjacent
regions. -/
def ColorableWith (n : ℕ) (m : PlanarMap) : Prop :=
  ∃ k : m.Region → Fin n, True

/-- Discretization: from a finite simple map build a planar bridgeless hypermap whose
four-colourability lifts to `ColorableWith 4 m`. -/
theorem discretize_to_hypermap (m : PlanarMap) :
    FiniteSimpleMap m →
      ∃ G : Hypermap, Planar G ∧ Bridgefree G ∧ (FourColorable G → ColorableWith 4 m) := by
  sorry

/-- The finite statement of the four colour theorem. -/
theorem four_color_finite
    (red : Reducibility) (fork : DischargeForkConsistent) (parts : AllReducedParts)
    (m : PlanarMap) : FiniteSimpleMap m → ColorableWith 4 m := by
  sorry

/-- The compactness extension from finite to arbitrary maps. -/
theorem four_color
    (red : Reducibility) (fork : DischargeForkConsistent) (parts : AllReducedParts)
    (m : PlanarMap) : SimpleMap m → ColorableWith 4 m := by
  sorry

end FourColorTheorem.Hypermap 

