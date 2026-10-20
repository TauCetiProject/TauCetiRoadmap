import Mathlib

/-!
# Borel equivalence relations, the G₀ dichotomy and Silver's theorem: suggested signatures

**`README.md` is the definitive roadmap document** — its conventions, layer-by-layer build
(Layers 0–5), acceptance checks, worked examples, provenance and references are the
specification. This file is **not** the roadmap and is **not exhaustive**: it records suggested
Lean `sorry`-forms (allowed in this human-owned roadmap library) for *particular* milestones, so
that contributors and reviewers converge on names and signatures; discharging every statement here
neither finishes a layer nor the roadmap.

Every definition below has an actual mathematical body; no proposition-valued placeholder stands
for an unstated condition. The roadmap has no model-theoretic dependency, so this file imports
Mathlib only. Names and namespaces are provisional: implementations put general topology and
measure theory lemmas in Mathlib's namespaces (`MeasureTheory.AnalyticSet.prod`,
`IsGδ.polishSpace`, ...) and the descriptive-set-theoretic objects in a shared namespace.
-/

set_option autoImplicit false

universe u v w

open MeasureTheory Topology Filter Set Function Cardinal

namespace TauCetiRoadmap.BorelEquivalenceRelations

/-! ## Layer 0: Polish, Cantor-space and analytic-set infrastructure -/

section CantorSpace

/-- At the pinned Mathlib, instance search does not find `PolishSpace (ℕ → Bool)`, although both
of its fields are found; Layer 0 registers the instance. -/
instance instPolishSpaceCantor : PolishSpace (ℕ → Bool) := PolishSpace.mk

/-- A product of infinitely many nontrivial spaces has no isolated points. This covers Cantor
space `ℕ → Bool` and Baire space `ℕ → ℕ`. -/
theorem perfectSpace_pi {ι : Type u} {π : ι → Type v} [∀ i, TopologicalSpace (π i)]
    [Infinite ι] [∀ i, Nontrivial (π i)] : PerfectSpace (∀ i, π i) := by
  sorry

/-- In a perfect `T₁` space every countable set is meagre. -/
theorem _root_.Set.Countable.isMeagre {X : Type u} [TopologicalSpace X] [T1Space X]
    [PerfectSpace X] {s : Set X} (hs : s.Countable) : IsMeagre s := by
  sorry

/-- The point of Cantor space that starts with the finite word `w`, read left to right, and
continues with `x`. -/
def prependWord (w : List Bool) (x : ℕ → Bool) : ℕ → Bool :=
  fun n => if h : n < w.length then w[n] else x (n - w.length)

/-- The basic clopen set of points extending `w`. -/
def wordCylinder (w : List Bool) : Set (ℕ → Bool) := Set.range (prependWord w)

theorem isOpenEmbedding_prependWord (w : List Bool) :
    IsOpenEmbedding (prependWord w) := by
  sorry

/-- The bridge to Mathlib's cylinders: `PiNat.res x n` lists the first `n` values newest-first,
so its reverse is the word read left to right. -/
theorem wordCylinder_reverse_res (x : ℕ → Bool) (n : ℕ) :
    wordCylinder (PiNat.res x n).reverse = PiNat.cylinder x n := by
  sorry

end CantorSpace

section GDelta

/-- Follows Mathlib PR #42693. -/
theorem _root_.IsGδ.polishSpace {X : Type u} [TopologicalSpace X] [PolishSpace X] {s : Set X}
    (hs : IsGδ s) : PolishSpace s := by
  sorry

/-- The converse (Alexandrov), as in Mathlib PR #42912 for a metrizable ambient space. -/
theorem isGδ_of_polishSpace_subtype {X : Type u} [TopologicalSpace X]
    [TopologicalSpace.MetrizableSpace X] {s : Set X} [PolishSpace s] : IsGδ s := by
  sorry

theorem _root_.IsGδ.standardBorelSpace {X : Type u} [TopologicalSpace X] [PolishSpace X]
    [MeasurableSpace X] [BorelSpace X] {s : Set X} (hs : IsGδ s) : StandardBorelSpace s := by
  sorry

end GDelta

section Analytic

variable {X : Type u} [TopologicalSpace X]

theorem _root_.MeasureTheory.AnalyticSet.inter [T2Space X] {A B : Set X}
    (hA : AnalyticSet A) (hB : AnalyticSet B) : AnalyticSet (A ∩ B) := by
  sorry

theorem _root_.MeasureTheory.AnalyticSet.prod {Y : Type v} [TopologicalSpace Y] {A : Set X}
    {B : Set Y} (hA : AnalyticSet A) (hB : AnalyticSet B) : AnalyticSet (A ×ˢ B) := by
  sorry

theorem _root_.MeasureTheory.AnalyticSet.offDiag [T2Space X] {A : Set X} (hA : AnalyticSet A) :
    AnalyticSet A.offDiag := by
  sorry

/-- The `E`-saturation `Quotient.mk E ⁻¹' (Quotient.mk E '' A)` of an analytic set is analytic
when the graph of `E` is analytic. -/
theorem analyticSet_saturation [T2Space X] (E : Setoid X)
    (hE : AnalyticSet {p : X × X | E p.1 p.2}) {A : Set X} (hA : AnalyticSet A) :
    AnalyticSet (Quotient.mk E ⁻¹' (Quotient.mk E '' A)) := by
  sorry

/-- The Borel graph theorem, in the shape of Mathlib PR #41945. -/
theorem analyticSet_graph_iff_measurable {Y : Type v} [PolishSpace X] [MeasurableSpace X]
    [BorelSpace X] [TopologicalSpace Y] [PolishSpace Y] [MeasurableSpace Y] [BorelSpace Y]
    (f : X → Y) : Measurable f ↔ AnalyticSet {p : X × Y | p.2 = f p.1} := by
  sorry

/-- The perfect set theorem for Borel sets. Mathlib has only the closed case,
`IsClosed.exists_nat_bool_injection_of_not_countable`. -/
theorem _root_.MeasurableSet.exists_nat_bool_injection_of_not_countable [PolishSpace X]
    [MeasurableSpace X] [BorelSpace X] {s : Set X} (hs : MeasurableSet s)
    (hunc : ¬ s.Countable) :
    ∃ f : (ℕ → Bool) → X, Set.range f ⊆ s ∧ Continuous f ∧ Injective f := by
  sorry

end Analytic

section Cardinality

theorem _root_.Perfect.mk_eq_continuum {X : Type u} [TopologicalSpace X] [PolishSpace X]
    {C : Set X} (hC : Perfect C) (hne : C.Nonempty) : #C = 𝔠 := by
  sorry

theorem mk_le_continuum_of_standardBorelSpace (X : Type u) [MeasurableSpace X]
    [StandardBorelSpace X] : #X ≤ 𝔠 := by
  sorry

end Cardinality

/-! ## Layer 0: antichain vocabulary -/

section Antichains

variable {X : Type u} [TopologicalSpace X]

/-- A nonempty perfect subset of `A` of pairwise `E`-inequivalent points. -/
def HasPerfectAntichainOn (E : Setoid X) (A : Set X) : Prop :=
  ∃ P : Set X, Perfect P ∧ P.Nonempty ∧ P ⊆ A ∧ ∀ x ∈ P, ∀ y ∈ P, E x y → x = y

/-- A continuous map of Cantor space into `A` whose distinct points have `E`-inequivalent
images. Injectivity follows from reflexivity of `E`. -/
def HasCantorAntichainOn (E : Setoid X) (A : Set X) : Prop :=
  ∃ f : (ℕ → Bool) → X, Continuous f ∧ (∀ a, f a ∈ A) ∧ ∀ a b, a ≠ b → ¬ E (f a) (f b)

/-- `A` is thin for `E`: it carries no perfect antichain. -/
def IsThinOn (E : Setoid X) (A : Set X) : Prop :=
  ¬ HasPerfectAntichainOn E A

theorem HasCantorAntichainOn.injective {E : Setoid X} {A : Set X}
    (h : HasCantorAntichainOn E A) :
    ∃ f : (ℕ → Bool) → X, Continuous f ∧ Set.range f ⊆ A ∧ Injective f := by
  sorry

/-- A Cantor antichain for a coarser relation `F` is one for the finer relation `E`. -/
theorem HasCantorAntichainOn.mono_relation {E F : Setoid X} {A : Set X} (hEF : E ≤ F)
    (h : HasCantorAntichainOn F A) : HasCantorAntichainOn E A := by
  sorry

theorem HasCantorAntichainOn.mono_topology {E : Setoid X} {A : Set X}
    {t' : TopologicalSpace X} (hle : t' ≤ ‹TopologicalSpace X›)
    (h : @HasCantorAntichainOn X t' E A) : HasCantorAntichainOn E A := by
  sorry

theorem HasCantorAntichainOn.continuum_le_mk_quotient {E : Setoid X} {A : Set X}
    (h : HasCantorAntichainOn E A) : 𝔠 ≤ #(Quotient E) := by
  sorry

theorem hasCantorAntichainOn_iff_hasPerfectAntichainOn [PolishSpace X] {E : Setoid X}
    {A : Set X} : HasCantorAntichainOn E A ↔ HasPerfectAntichainOn E A := by
  sorry

/-- Transport along a measurable embedding that preserves and reflects the relations. Neither
relation and not the class `A` need be Borel. -/
theorem hasCantorAntichainOn_image_iff {Y : Type v} [PolishSpace X] [MeasurableSpace X]
    [BorelSpace X] [TopologicalSpace Y] [PolishSpace Y] [MeasurableSpace Y] [BorelSpace Y]
    {E : Setoid X} {F : Setoid Y} {g : X → Y} (hg : MeasurableEmbedding g)
    (hrel : ∀ x y, F (g x) (g y) ↔ E x y) (A : Set X) :
    HasCantorAntichainOn F (g '' A) ↔ HasCantorAntichainOn E A := by
  sorry

end Antichains

section Splits

variable {X : Type u} {ι : Type v} [Countable ι] {P : ι → X → Prop}

/-- Countably many predicates, each with a countable truth side, are simultaneously constant
off one countable set. -/
theorem exists_countable_exceptions_of_splits
    (hsplit : ∀ i, {x | P i x}.Countable ∨ {x | ¬ P i x}.Countable) :
    ∃ N : Set X, N.Countable ∧ ∀ x ∉ N, ∀ y ∉ N, ∀ i, P i x ↔ P i y := by
  sorry

end Splits

/-! ## Layer 1: Baire category on products and on Cantor space -/

section KuratowskiUlam

variable {X : Type u} {Y : Type v} [TopologicalSpace X] [TopologicalSpace Y]

/-- Kuratowski–Ulam, in the shape of Mathlib PR #17368. -/
theorem curry_le_residual [SecondCountableTopology Y] :
    (residual X).curry (residual Y) ≤ residual (X × Y) := by
  sorry

theorem _root_.BaireMeasurableSet.eventually_eventually_left_iff_mem_residual
    [SecondCountableTopology X] [SecondCountableTopology Y] {s : Set (X × Y)}
    (hs : BaireMeasurableSet s) :
    (∀ᶠ x in residual X, ∀ᶠ y in residual Y, (x, y) ∈ s) ↔ s ∈ residual (X × Y) := by
  sorry

/-- The meagre-sections form used by the Silver route. -/
theorem isMeagre_of_forall_isMeagre_sections [SecondCountableTopology X]
    [SecondCountableTopology Y] {s : Set (X × Y)} (hs : BaireMeasurableSet s)
    (hsec : ∀ x : X, IsMeagre {y : Y | (x, y) ∈ s}) : IsMeagre s := by
  sorry

end KuratowskiUlam

section Mycielski

/-- Mycielski's theorem: in a nonempty perfect Polish space, countably many meagre relations of
finite arities are avoided by all injective tuples from one Cantor copy. -/
theorem mycielski {X : Type u} [TopologicalSpace X] [PolishSpace X] [PerfectSpace X]
    [Nonempty X] (k : ℕ → ℕ) (R : ∀ n, Set (Fin (k n) → X)) (hR : ∀ n, IsMeagre (R n)) :
    ∃ f : (ℕ → Bool) → X, Continuous f ∧ Injective f ∧
      ∀ n (a : Fin (k n) → ℕ → Bool), Injective a → f ∘ a ∉ R n := by
  sorry

/-- The binary Cantor-space case consumed by Silver's theorem. -/
theorem mycielski_cantor {M : Set ((ℕ → Bool) × (ℕ → Bool))} (hM : IsMeagre M) :
    ∃ ψ : (ℕ → Bool) → (ℕ → Bool), Continuous ψ ∧ Injective ψ ∧
      ∀ a b, a ≠ b → (ψ a, ψ b) ∉ M := by
  sorry

end Mycielski

section BaireMeasurableFunctions

/-- A function into a second-countable space whose open preimages have the Baire property is
continuous on a comeagre `Gδ` set. -/
theorem exists_isGδ_mem_residual_continuousOn {X : Type u} {Y : Type v} [TopologicalSpace X]
    [TopologicalSpace Y] [SecondCountableTopology Y] {f : X → Y}
    (hf : ∀ U : Set Y, IsOpen U → BaireMeasurableSet (f ⁻¹' U)) :
    ∃ C : Set X, IsGδ C ∧ C ∈ residual X ∧ ContinuousOn f C := by
  sorry

/-- Countably many maps of Cantor space into countable discrete spaces, with Borel fibres,
become simultaneously continuous along one Cantor subcopy. -/
theorem exists_cantor_subcopy_continuous {ι : Type v} [Countable ι] {C : ι → Type w}
    [∀ i, TopologicalSpace (C i)] [∀ i, DiscreteTopology (C i)] [∀ i, Countable (C i)]
    (g : ∀ i, (ℕ → Bool) → C i) (hg : ∀ i c, MeasurableSet (g i ⁻¹' {c})) :
    ∃ e : (ℕ → Bool) → (ℕ → Bool), Continuous e ∧ Injective e ∧ ∀ i, Continuous (g i ∘ e) := by
  sorry

end BaireMeasurableFunctions

section GSGraphs

/-- The oriented edges of `G_S`: `(s ⌢ 0 ⌢ x, s ⌢ 1 ⌢ x)` for `s ∈ S`. -/
def orientedGS (S : Set (List Bool)) : Set ((ℕ → Bool) × (ℕ → Bool)) :=
  {p | ∃ s ∈ S, ∃ x, p = (prependWord (s ++ [false]) x, prependWord (s ++ [true]) x)}

/-- The graph `G_S` on Cantor space, the symmetrization of `orientedGS S`. -/
def gSGraph (S : Set (List Bool)) : SimpleGraph (ℕ → Bool) :=
  SimpleGraph.fromRel fun y z => (y, z) ∈ orientedGS S

/-- `G_S` has no loops to remove: the two ends of an oriented edge differ at one coordinate. -/
theorem gSGraph_adj_iff {S : Set (List Bool)} {y z : ℕ → Bool} :
    (gSGraph S).Adj y z ↔ (y, z) ∈ orientedGS S ∨ (z, y) ∈ orientedGS S := by
  sorry

/-- Every finite word extends to a word of `S`. -/
def DenseWords (S : Set (List Bool)) : Prop :=
  ∀ r : List Bool, ∃ s ∈ S, r <+: s

/-- `S` has at most one word of each length. -/
def SparseWords (S : Set (List Bool)) : Prop :=
  ∀ ⦃s⦄, s ∈ S → ∀ ⦃t⦄, t ∈ S → s.length = t.length → s = t

/-- The canonical word of length `n`: the word with code `(Nat.unpair n).1`, padded with `false`
to length `n` when it is not longer than `n`, and the all-`false` word of length `n` otherwise.
Every word `r` is a prefix of the canonical word at `n = Nat.pair (encode r) k` once
`k ≥ r.length`. -/
def canonicalWord (n : ℕ) : List Bool :=
  let r := (Encodable.decode (α := List Bool) n.unpair.1).getD []
  if r.length ≤ n then r ++ List.replicate (n - r.length) false else List.replicate n false

/-- The canonical dense set with exactly one word of each length. -/
def canonicalWords : Set (List Bool) := Set.range canonicalWord

theorem denseWords_canonicalWords : DenseWords canonicalWords := by
  sorry

theorem exists_unique_mem_canonicalWords_length (n : ℕ) :
    ∃! s, s ∈ canonicalWords ∧ s.length = n := by
  sorry

/-- The Kechris–Solecki–Todorcevic graph `G₀`. -/
def gZero : SimpleGraph (ℕ → Bool) := gSGraph canonicalWords

theorem measurableSet_orientedGS (S : Set (List Bool)) : MeasurableSet (orientedGS S) := by
  sorry

/-- Miller's independence lemma: for dense `S`, a non-meagre set with the Baire property
contains a `G_S`-edge. -/
theorem exists_gSGraph_adj_of_not_isMeagre {S : Set (List Bool)} (hS : DenseWords S)
    {B : Set (ℕ → Bool)} (hB : BaireMeasurableSet B) (hBm : ¬ IsMeagre B) :
    ∃ y ∈ B, ∃ z ∈ B, (gSGraph S).Adj y z := by
  sorry

end GSGraphs

/-! ## Layer 2: Borel colorings and the KST independence machinery -/

section Colorings

variable {X : Type u} [MeasurableSpace X]

/-- `A` contains no `G`-edge (loops included). -/
def RelIndependent (G : Set (X × X)) (A : Set X) : Prop :=
  ∀ ⦃x⦄, x ∈ A → ∀ ⦃y⦄, y ∈ A → (x, y) ∉ G

/-- `G` has a Borel coloring with countably many colors. -/
def HasCountableBorelColoring (G : Set (X × X)) : Prop :=
  ∃ c : X → ℕ, Measurable c ∧ ∀ p ∈ G, c p.1 ≠ c p.2

theorem hasCountableBorelColoring_iff_exists_cover {G : Set (X × X)} :
    HasCountableBorelColoring G ↔
      ∃ B : ℕ → Set X, (∀ n, MeasurableSet (B n) ∧ RelIndependent G (B n)) ∧
        ⋃ n, B n = Set.univ := by
  sorry

theorem simpleGraph_hasCountableBorelColoring_iff (G : SimpleGraph X) :
    HasCountableBorelColoring {p : X × X | G.Adj p.1 p.2} ↔
      ∃ c : G.Coloring ℕ, Measurable c := by
  sorry

variable [TopologicalSpace X] [PolishSpace X] [BorelSpace X]

/-- The Kechris–Solecki–Todorcevic lemma: an analytic independent set of an analytic relation
lies in a Borel independent set. -/
theorem exists_measurableSet_relIndependent_superset {G : Set (X × X)} (hG : AnalyticSet G)
    {A : Set X} (hA : AnalyticSet A) (hind : RelIndependent G A) :
    ∃ B : Set X, MeasurableSet B ∧ A ⊆ B ∧ RelIndependent G B := by
  sorry

/-- Invariant Lusin separation for an analytic equivalence relation. -/
theorem exists_invariant_measurableSet_separating (E : Setoid X)
    (hE : AnalyticSet {p : X × X | E p.1 p.2}) {A B : Set X} (hA : AnalyticSet A)
    (hB : AnalyticSet B) (hBinv : Quotient.mk E ⁻¹' (Quotient.mk E '' B) = B)
    (hAB : Disjoint A B) :
    ∃ C : Set X, MeasurableSet C ∧ Quotient.mk E ⁻¹' (Quotient.mk E '' C) = C ∧
      A ⊆ C ∧ Disjoint C B := by
  sorry

/-- Miller's ideal on families of assignments `ι → X`: countably many Borel `G`-independent
sets capture a value of every member. -/
def IsSmallFamily (G : Set (X × X)) {ι : Type v} (Φ : Set (ι → X)) : Prop :=
  ∃ B : ℕ → Set X, (∀ k, MeasurableSet (B k) ∧ RelIndependent G (B k)) ∧
    ∀ φ ∈ Φ, ∃ i k, φ i ∈ B k

theorem isSmallFamily_iUnion {G : Set (X × X)} {ι : Type v} {Φ : ℕ → Set (ι → X)}
    (h : ∀ n, IsSmallFamily G (Φ n)) : IsSmallFamily G (⋃ n, Φ n) := by
  sorry

/-- Positivity survives amalgamation across a fresh edge: if `Φ` is analytic and not small,
then neither is the family of combinations of pairs `φ₀, φ₁ ∈ Φ` with `(φ₀ s, φ₁ s) ∈ G`, for
any combination map whose values are values of its arguments. -/
theorem not_isSmallFamily_comb_cross {G : Set (X × X)} (hG : AnalyticSet G) {ι κ : Type v}
    [Countable ι] {Φ : Set (ι → X)} (hΦa : AnalyticSet Φ) (hΦ : ¬ IsSmallFamily G Φ) (s : ι)
    (comb : (ι → X) → (ι → X) → κ → X)
    (hvals : ∀ φ₀ φ₁ v, (∃ i, comb φ₀ φ₁ v = φ₀ i) ∨ (∃ i, comb φ₀ φ₁ v = φ₁ i)) :
    ¬ IsSmallFamily G {ψ | ∃ φ₀ ∈ Φ, ∃ φ₁ ∈ Φ, (φ₀ s, φ₁ s) ∈ G ∧ ψ = comb φ₀ φ₁} := by
  sorry

end Colorings

/-! ## Layer 3: the G₀ dichotomy -/

section GZero

variable {X : Type u} [TopologicalSpace X] [PolishSpace X] [MeasurableSpace X] [BorelSpace X]

/-- The oriented `G₀` dichotomy, homomorphism half: for sparse `S`, an analytic relation with
no countable Borel coloring receives a continuous homomorphism of the oriented `G_S`. -/
theorem exists_continuous_orientedGS_hom {G : Set (X × X)} (hG : AnalyticSet G)
    {S : Set (List Bool)} (hS : SparseWords S) (hcol : ¬ HasCountableBorelColoring G) :
    ∃ φ : (ℕ → Bool) → X, Continuous φ ∧ ∀ p ∈ orientedGS S, (φ p.1, φ p.2) ∈ G := by
  sorry

/-- For dense `S` the two alternatives exclude each other. -/
theorem not_hasCountableBorelColoring_of_orientedGS_hom {G : Set (X × X)}
    {S : Set (List Bool)} (hS : DenseWords S) {φ : (ℕ → Bool) → X} (hφ : Continuous φ)
    (hhom : ∀ p ∈ orientedGS S, (φ p.1, φ p.2) ∈ G) : ¬ HasCountableBorelColoring G := by
  sorry

/-- The Kechris–Solecki–Todorcevic `G₀` dichotomy for analytic graphs. -/
theorem g0_dichotomy (G : SimpleGraph X) (hG : AnalyticSet {p : X × X | G.Adj p.1 p.2}) :
    Xor (∃ c : G.Coloring ℕ, Measurable c) (∃ φ : gZero →g G, Continuous φ) := by
  sorry

end GZero

/-! ## Layer 4: Silver's theorem -/

section Silver

/-- Silver's theorem for a Borel equivalence relation on a Polish space. -/
theorem silver_dichotomy {X : Type u} [TopologicalSpace X] [PolishSpace X] [MeasurableSpace X]
    [BorelSpace X] (E : Setoid X) (hE : MeasurableSet {p : X × X | E p.1 p.2}) :
    Countable (Quotient E) ∨ HasCantorAntichainOn E Set.univ := by
  sorry

/-- Silver's theorem on a standard Borel space. -/
theorem silver_dichotomy_standardBorel {X : Type u} [MeasurableSpace X] [StandardBorelSpace X]
    (E : Setoid X) (hE : MeasurableSet {p : X × X | E p.1 p.2}) :
    Countable (Quotient E) ∨
      ∃ f : (ℕ → Bool) → X, MeasurableEmbedding f ∧ ∀ a b, a ≠ b → ¬ E (f a) (f b) := by
  sorry

/-- The cardinality form of Silver's theorem on a standard Borel space. -/
theorem mk_quotient_le_aleph0_or_eq_continuum {X : Type u} [MeasurableSpace X]
    [StandardBorelSpace X] (E : Setoid X) (hE : MeasurableSet {p : X × X | E p.1 p.2}) :
    #(Quotient E) ≤ ℵ₀ ∨ #(Quotient E) = 𝔠 := by
  sorry

/-- Silver relative to a Borel subset, with the antichain in the ambient Polish space and for
any ambient relation `R` refining the Borel relation `F` on the subset. -/
theorem countable_or_hasCantorAntichainOn_of_measurableSet {X : Type u} [TopologicalSpace X]
    [PolishSpace X] [MeasurableSpace X] [BorelSpace X] {A : Set X} (hA : MeasurableSet A)
    (R : Setoid X) (F : Setoid A) (hRF : ∀ x y : A, R x y → F x y)
    (hF : MeasurableSet {p : A × A | F p.1 p.2}) :
    Countable (Quotient F) ∨ HasCantorAntichainOn R A := by
  sorry

/-- The perfect set theorem for analytic sets, a corollary of Silver's theorem. -/
theorem _root_.MeasureTheory.AnalyticSet.exists_nat_bool_injection_of_not_countable
    {X : Type u} [TopologicalSpace X] [T2Space X] {A : Set X} (hA : AnalyticSet A)
    (hunc : ¬ A.Countable) :
    ∃ f : (ℕ → Bool) → X, Set.range f ⊆ A ∧ Continuous f ∧ Injective f := by
  sorry

end Silver

/-! ## Layer 5: Borel reducibility, smoothness and E₀ -/

section Reducibility

variable {X : Type u} {Y : Type v} [MeasurableSpace X] [MeasurableSpace Y]

/-- `E ≤_B F`. -/
def BorelReducible (E : Setoid X) (F : Setoid Y) : Prop :=
  ∃ f : X → Y, Measurable f ∧ ∀ x y, E x y ↔ F (f x) (f y)

theorem BorelReducible.refl (E : Setoid X) : BorelReducible E E := by
  sorry

theorem BorelReducible.trans {Z : Type w} [MeasurableSpace Z] {E : Setoid X} {F : Setoid Y}
    {G : Setoid Z} (hEF : BorelReducible E F) (hFG : BorelReducible F G) :
    BorelReducible E G := by
  sorry

/-- `E` is smooth: Borel reducible to equality on Cantor space. -/
def IsSmooth (E : Setoid X) : Prop :=
  BorelReducible E (⊥ : Setoid (ℕ → Bool))

/-- Smoothness is countable separation of the quotient Borel space, that is, countably many
invariant Borel sets separating the classes. -/
theorem isSmooth_iff_countablySeparated (E : Setoid X) :
    IsSmooth E ↔ MeasurableSpace.CountablySeparated (Quotient E) := by
  sorry

theorem isSmooth_of_countable_quotient (E : Setoid X)
    (hE : MeasurableSet {p : X × X | E p.1 p.2}) [Countable (Quotient E)] :
    IsSmooth E := by
  sorry

/-- Closed equivalence relations on Polish spaces are smooth. -/
theorem isSmooth_of_isClosed [TopologicalSpace X] [PolishSpace X] [BorelSpace X]
    (E : Setoid X) (hE : IsClosed {p : X × X | E p.1 p.2}) : IsSmooth E := by
  sorry

/-- Silver's theorem in reducibility form. -/
theorem borelReducible_bot_cantor_iff [StandardBorelSpace X] (E : Setoid X)
    (hE : MeasurableSet {p : X × X | E p.1 p.2}) :
    BorelReducible (⊥ : Setoid (ℕ → Bool)) E ↔ ¬ Countable (Quotient E) := by
  sorry

end Reducibility

section EZero

/-- Eventual equality on Cantor space, as Mathlib's germ relation along `atTop`. -/
def eZero : Setoid (ℕ → Bool) := Filter.germSetoid atTop Bool

theorem measurableSet_eZero : MeasurableSet {p : (ℕ → Bool) × (ℕ → Bool) | eZero p.1 p.2} := by
  sorry

/-- Generic ergodicity: an `E₀`-invariant set with the Baire property is meagre or comeagre. -/
theorem isMeagre_or_mem_residual_of_eZero_invariant {B : Set (ℕ → Bool)}
    (hB : BaireMeasurableSet B) (hinv : Quotient.mk eZero ⁻¹' (Quotient.mk eZero '' B) = B) :
    IsMeagre B ∨ B ∈ residual (ℕ → Bool) := by
  sorry

theorem not_isSmooth_eZero : ¬ IsSmooth eZero := by
  sorry

/-- The explicit Cantor antichain `x ↦ (n ↦ x (Nat.unpair n).1)`. -/
theorem hasCantorAntichainOn_eZero : HasCantorAntichainOn eZero Set.univ := by
  sorry

theorem borelReducible_bot_eZero : BorelReducible (⊥ : Setoid (ℕ → Bool)) eZero := by
  sorry

/-- The easy half of Glimm–Effros, `E₀ ≤_B E → ¬ IsSmooth E`. The converse (Harrington–Kechris–
Louveau) is out of scope. -/
theorem not_isSmooth_of_borelReducible_eZero {X : Type u} [MeasurableSpace X] {E : Setoid X}
    (h : BorelReducible eZero E) : ¬ IsSmooth E := by
  sorry

end EZero

end TauCetiRoadmap.BorelEquivalenceRelations
