import Mathlib
import TauCeti.Geometry.RealAlgebraic.Semialgebraic.Dimension.Basic

/-!
# Shimura varieties and canonical models: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones;
discharging them finishes neither a layer nor the roadmap.

Sections 3.4b–3.4e develop o-minimal structures on a linearly ordered type `R`,
with definable subsets of `Fin n → R`, coordinate `0` as the fibre coordinate of
a cylinder (`Fin.cons`, `Fin.tail`) and graphs, products and fibres read through
`Fin.append`. The statements cover the passage from sets definable with
parameters in a first-order language, the semialgebraic structure on `ℝ`,
monotonicity, cells and cell decomposition, uniform finiteness, definable
dimension with its decomposition, union, image, product, fibre and frontier laws,
its agreement with `TauCeti.semialgebraicDim` on `ℝ`, definable choice and curve
selection.

Section 5.1's reflex-field theorems are stated for arbitrary nonempty finite
products of CM number fields: the trace-generated reflex field is a CM number
field, and it is the exact field of realization of the type-trace character,
with uniqueness up to module isomorphism. The definitions use Mathlib's ring
maps to `ℂ`, conjugate embeddings, intermediate fields and linear-map trace.

The other headline signatures are deferred for lack of their mathematical
objects at the pins:

* Layers 0–1's component decomposition, abelianized component formula and
  analytic tower require pure Shimura data, their Hermitian domains and the
  effective arithmetic analytic quotients.
* Layers 2–3's Baily–Borel compactification, finite generation, Koecher principle
  and Borel algebraicity require those quotients, the admissible automorphic
  section ring, complex analytic spaces and scheme analytification. The
  period-map and definable-Chow route also needs polarized variations, the
  specified analytic structures and the structure `R_an,exp` of Section 3.5a.
* Layer 4's disjoint special reflex fields, translation descent and uniqueness
  require special torus data, cocharacter reflex norms and the canonical-model
  condition with its complex comparison.
* Layer 5's main CM theorem and Siegel canonical model require CM actions on
  abelian varieties with their Tate realizations, polarizations, reflex norms
  and Siegel moduli comparison. The pinned abelian-variety carrier alone does
  not provide these objects.
* Layers 6–7's abelian-type and general canonical existence, connected/full
  reconstruction and marked conjugation require canonical towers with their
  completed symmetry and the Serre/Taniyama torsors.
* Layer 8's arithmetic component reciprocity, modular comparisons and
  reflex-field minimal compactifications require the actual canonical models,
  their analytic comparisons and boundary constructions, including the
  broader finite-domain auxiliary data.

-/

namespace TauCetiRoadmap.ShimuraVarieties

open Set

/-! ## O-minimal structures and definable maps (Section 3.4b) -/

/-- An o-minimal structure on a linearly ordered type `R` (Section 3.4b; van den Dries,
*Tame Topology and o-minimal Structures*, Chapter 1, §§2–3). For each `n` it singles out the
definable subsets of `Fin n → R`; coordinate `0` is the fibre coordinate of a cylinder. The
one-variable condition makes every point definable, so definability is with parameters. -/
structure OMinimalStructure (R : Type*) [LinearOrder R] where
  /-- The definable subsets of `Fin n → R`. -/
  Definable : (n : ℕ) → Set (Fin n → R) → Prop
  /-- The definable subsets of each `Fin n → R` form an algebra of sets. -/
  isSetAlgebra (n : ℕ) : MeasureTheory.IsSetAlgebra {s | Definable n s}
  /-- The cylinder `R × A`, with the new coordinate `0`, over a definable `A` is definable. -/
  definable_setOf_tail_mem {n : ℕ} {s : Set (Fin n → R)} :
    Definable n s → Definable (n + 1) {x | Fin.tail x ∈ s}
  /-- The cylinder `A × R`, with the new last coordinate, over a definable `A` is definable. -/
  definable_setOf_init_mem {n : ℕ} {s : Set (Fin n → R)} :
    Definable n s → Definable (n + 1) {x | Fin.init x ∈ s}
  /-- Every diagonal is definable. -/
  definable_setOf_eq (n : ℕ) (i j : Fin n) : Definable n {x | x i = x j}
  /-- The strict order is definable. -/
  definable_setOf_lt : Definable 2 {x | x 0 < x 1}
  /-- Forgetting coordinate `0` maps definable sets to definable sets. -/
  definable_image_tail {n : ℕ} {s : Set (Fin (n + 1) → R)} :
    Definable (n + 1) s → Definable n (Fin.tail '' s)
  /-- The definable subsets of `Fin 1 → R` are exactly the finite unions of points and open
  intervals with endpoints in `R ∪ {−∞}` and `R ∪ {+∞}`. -/
  definable_one_iff {s : Set (Fin 1 → R)} :
    Definable 1 s ↔ ∃ (F : Finset R) (J : Finset (WithBot R × WithTop R)),
      s = {x | x 0 ∈ F ∨ ∃ p ∈ J, p.1 < (x 0 : WithBot R) ∧ (x 0 : WithTop R) < p.2}

namespace OMinimalStructure

section Defs

variable {R : Type*} [LinearOrder R] (S : OMinimalStructure R)

/-- A map `f : Rᵐ → Rᵏ` is definable on `A` when its graph `{Fin.append x (f x) | x ∈ A}` is a
definable subset of `Rᵐ⁺ᵏ`. -/
def DefinableMapOn {m k : ℕ} (f : (Fin m → R) → Fin k → R) (A : Set (Fin m → R)) : Prop :=
  S.Definable (m + k) ((fun x => Fin.append x (f x)) '' A)

/-- An `R`-valued function is definable on `A` when its graph is a definable subset
of `Rᵐ⁺¹`. -/
def DefinableFunOn {m : ℕ} (f : (Fin m → R) → R) (A : Set (Fin m → R)) : Prop :=
  S.DefinableMapOn (fun x (_ : Fin 1) => f x) A

end Defs

end OMinimalStructure

/-- Section 3.4b: if the strict order is definable with parameters in a first-order structure on
`R`, and every subset of `Fin 1 → R` definable with parameters is a finite union of points and
open intervals, then the sets definable with parameters are the definable sets of an o-minimal
structure. -/
theorem exists_oMinimalStructure_definable_iff {R : Type*} [LinearOrder R]
    (L : FirstOrder.Language) [L.Structure R]
    (hlt : (univ : Set R).Definable L {x : Fin 2 → R | x 0 < x 1})
    (hone : ∀ s : Set (Fin 1 → R), (univ : Set R).Definable L s →
      ∃ (F : Finset R) (J : Finset (WithBot R × WithTop R)),
        s = {x | x 0 ∈ F ∨ ∃ p ∈ J, p.1 < (x 0 : WithBot R) ∧ (x 0 : WithTop R) < p.2}) :
    ∃ S : OMinimalStructure R, ∀ (n : ℕ) (s : Set (Fin n → R)),
      S.Definable n s ↔ (univ : Set R).Definable L s := by
  sorry

/-- Section 3.4b: the semialgebraic sets are the definable sets of an o-minimal structure
on `ℝ` (van den Dries, Chapter 2). -/
theorem exists_oMinimalStructure_isSemialgebraic :
    ∃ S : OMinimalStructure ℝ, ∀ (n : ℕ) (s : Set (Fin n → ℝ)),
      S.Definable n s ↔ TauCeti.IsSemialgebraic s := by
  sorry

/-- Section 3.4b: over a linearly ordered commutative ring, an o-minimal structure containing
the graphs of addition and multiplication contains every semialgebraic set. -/
theorem OMinimalStructure.definable_of_isSemialgebraic {R : Type*} [CommRing R] [LinearOrder R]
    (S : OMinimalStructure R) (hadd : S.Definable 3 {x | x 2 = x 0 + x 1})
    (hmul : S.Definable 3 {x | x 2 = x 0 * x 1}) {n : ℕ} {s : Set (Fin n → R)}
    (hs : TauCeti.IsSemialgebraic s) : S.Definable n s := by
  sorry

/-! ## Monotonicity and cell decomposition (Section 3.4c) -/

namespace OMinimalStructure

section Cells

variable {R : Type*} [LinearOrder R] [TopologicalSpace R]

/-- Section 3.4c: `IsCell S n d C` says that `C ⊆ Rⁿ` is a cell of dimension `d`. A cell of
`Rⁿ⁺¹` lies over a cell `D` of `Rⁿ`, and is either the graph of a continuous definable function
on `D` or the band between two such functions, each of which may be absent (the bound `−∞`,
resp. `+∞`). Continuity is read in the given topology of `R`. -/
inductive IsCell (S : OMinimalStructure R) : (n : ℕ) → ℕ → Set (Fin n → R) → Prop
  | zero : IsCell S 0 0 univ
  | graph {n d : ℕ} {D : Set (Fin n → R)} (f : (Fin n → R) → R) :
      IsCell S n d D → S.DefinableFunOn f D → ContinuousOn f D →
      IsCell S (n + 1) d {x | Fin.tail x ∈ D ∧ x 0 = f (Fin.tail x)}
  | band {n d : ℕ} {D : Set (Fin n → R)} (l u : Option ((Fin n → R) → R)) :
      IsCell S n d D →
      (∀ f ∈ l, S.DefinableFunOn f D ∧ ContinuousOn f D) →
      (∀ g ∈ u, S.DefinableFunOn g D ∧ ContinuousOn g D) →
      (∀ f ∈ l, ∀ g ∈ u, ∀ y ∈ D, f y < g y) →
      IsCell S (n + 1) (d + 1)
        {x | Fin.tail x ∈ D ∧ (∀ f ∈ l, f (Fin.tail x) < x 0) ∧ (∀ g ∈ u, x 0 < g (Fin.tail x))}

/-- Section 3.4c: a cell decomposition of `Rⁿ`. The decomposition of `R⁰` is `{R⁰}`; one of
`Rⁿ⁺¹` is a finite partition into cells whose images under `Fin.tail` form a cell decomposition
of `Rⁿ`. -/
inductive IsCellDecomposition (S : OMinimalStructure R) :
    (n : ℕ) → Set (Set (Fin n → R)) → Prop
  | zero : IsCellDecomposition S 0 {univ}
  | succ {n : ℕ} {𝒟 : Set (Set (Fin (n + 1) → R))} :
      𝒟.Finite → Setoid.IsPartition 𝒟 → (∀ C ∈ 𝒟, ∃ d, IsCell S (n + 1) d C) →
      IsCellDecomposition S n (image Fin.tail '' 𝒟) → IsCellDecomposition S (n + 1) 𝒟

/-- Section 3.4c: cells are definable. -/
theorem IsCell.definable {S : OMinimalStructure R} {n d : ℕ} {C : Set (Fin n → R)}
    (h : S.IsCell n d C) : S.Definable n C := by
  sorry

variable [Nonempty R] [DenselyOrdered R] [NoMinOrder R] [NoMaxOrder R] [OrderTopology R]

/-- Section 3.4c, the monotonicity theorem: a function `R → R` with definable graph is, on each
order-connected set avoiding finitely many points, continuous and either strictly monotone,
strictly antitone or constant (van den Dries, Chapter 3, (1.2)). -/
theorem monotonicity (S : OMinimalStructure R) {f : R → R}
    (hf : S.Definable 2 {x | x 1 = f (x 0)}) :
    ∃ F : Finset R, ∀ I ⊆ (F : Set R)ᶜ, I.OrdConnected →
      ContinuousOn f I ∧ (StrictMonoOn f I ∨ StrictAntiOn f I ∨ ∃ c, ∀ x ∈ I, f x = c) := by
  sorry

/-- Section 3.4c: cells are nonempty. -/
theorem IsCell.nonempty {S : OMinimalStructure R} {n d : ℕ} {C : Set (Fin n → R)}
    (h : S.IsCell n d C) : C.Nonempty := by
  sorry

/-- Section 3.4c: cells are locally closed. -/
theorem IsCell.isLocallyClosed {S : OMinimalStructure R} {n d : ℕ} {C : Set (Fin n → R)}
    (h : S.IsCell n d C) : IsLocallyClosed C := by
  sorry

/-- Section 3.4c: a set is a cell of at most one dimension. -/
theorem IsCell.unique {S : OMinimalStructure R} {n d d' : ℕ} {C : Set (Fin n → R)}
    (h : S.IsCell n d C) (h' : S.IsCell n d' C) : d = d' := by
  sorry

/-- Section 3.4c, the cell decomposition theorem, part (I): finitely many definable sets are
partitioned by one cell decomposition (van den Dries, Chapter 3, (2.11)). -/
theorem exists_isCellDecomposition (S : OMinimalStructure R) {n : ℕ} {ι : Type*} [Finite ι]
    {A : ι → Set (Fin n → R)} (hA : ∀ i, S.Definable n (A i)) :
    ∃ 𝒟, S.IsCellDecomposition n 𝒟 ∧ ∀ C ∈ 𝒟, ∀ i, C ⊆ A i ∨ Disjoint C (A i) := by
  sorry

/-- Section 3.4c, the cell decomposition theorem, part (II), for maps: a map definable on `B`
is continuous on every cell inside `B` of some decomposition partitioning `B` and finitely many
given definable sets (van den Dries, Chapter 3, (2.11)). -/
theorem exists_isCellDecomposition_continuousOn (S : OMinimalStructure R) {n k : ℕ}
    {ι : Type*} [Finite ι] {A : ι → Set (Fin n → R)} (hA : ∀ i, S.Definable n (A i))
    {B : Set (Fin n → R)} {f : (Fin n → R) → Fin k → R} (hf : S.DefinableMapOn f B) :
    ∃ 𝒟, S.IsCellDecomposition n 𝒟 ∧
      (∀ C ∈ 𝒟, (C ⊆ B ∨ Disjoint C B) ∧ ∀ i, C ⊆ A i ∨ Disjoint C (A i)) ∧
      ∀ C ∈ 𝒟, C ⊆ B → ContinuousOn f C := by
  sorry

/-- Section 3.4c, uniform finiteness: if every fibre of a definable subset of `Rⁿ⁺¹` over `Rⁿ`
is finite, the fibres have bounded cardinality (van den Dries, Chapter 3, §2). -/
theorem exists_ncard_le (S : OMinimalStructure R) {n : ℕ} {A : Set (Fin (n + 1) → R)}
    (hA : S.Definable (n + 1) A) (hfin : ∀ x : Fin n → R, {t : R | Fin.cons t x ∈ A}.Finite) :
    ∃ N : ℕ, ∀ x : Fin n → R, {t : R | Fin.cons t x ∈ A}.ncard ≤ N := by
  sorry

end Cells

/-- Section 3.4c: for an o-minimal structure on `ℝ` containing addition and multiplication,
every cylindrical algebraic decomposition is a cell decomposition. -/
theorem isCellDecomposition_of_isCAD (S : OMinimalStructure ℝ)
    (hadd : S.Definable 3 {x | x 2 = x 0 + x 1}) (hmul : S.Definable 3 {x | x 2 = x 0 * x 1})
    {n : ℕ} {𝒞 : Set (Set (Fin n → ℝ))} (h : TauCeti.IsCAD n 𝒞) :
    S.IsCellDecomposition n 𝒞 := by
  sorry

/-! ## Definable dimension (Section 3.4d) -/

section Dimension

variable {R : Type*} [LinearOrder R] [TopologicalSpace R]

/-- Section 3.4d: the dimension of `A ⊆ Rⁿ`, the supremum of the dimensions of the cells
contained in `A`; the empty set has dimension `⊥` (van den Dries, Chapter 4, §1). -/
noncomputable def dim (S : OMinimalStructure R) {n : ℕ} (A : Set (Fin n → R)) : WithBot ℕ∞ :=
  ⨆ (d : ℕ) (C : Set (Fin n → R)) (_ : C ⊆ A) (_ : S.IsCell n d C), (d : WithBot ℕ∞)

variable [Nonempty R] [DenselyOrdered R] [NoMinOrder R] [NoMaxOrder R] [OrderTopology R]
  (S : OMinimalStructure R)

/-- Section 3.4d: the dimension of a set partitioned by a cell decomposition is the largest
dimension of the cells of the decomposition contained in it. -/
theorem dim_eq_iSup_of_isCellDecomposition {n : ℕ} {𝒟 : Set (Set (Fin n → R))}
    (h𝒟 : S.IsCellDecomposition n 𝒟) {A : Set (Fin n → R)}
    (hA : ∀ C ∈ 𝒟, C ⊆ A ∨ Disjoint C A) :
    S.dim A = ⨆ (C ∈ 𝒟) (_ : C ⊆ A) (d : ℕ) (_ : S.IsCell n d C), (d : WithBot ℕ∞) := by
  sorry

/-- Section 3.4d: a subset of `Rⁿ` has dimension at most `n`. -/
theorem dim_le {n : ℕ} (A : Set (Fin n → R)) : S.dim A ≤ n := by
  sorry

/-- Section 3.4d: the dimension of a union of two definable sets is the larger dimension. -/
theorem dim_union {n : ℕ} {A B : Set (Fin n → R)} (hA : S.Definable n A)
    (hB : S.Definable n B) : S.dim (A ∪ B) = max (S.dim A) (S.dim B) := by
  sorry

/-- Section 3.4d: a definable map injective on `A` preserves the dimension of `A`. -/
theorem dim_image_of_injOn {m n : ℕ} {f : (Fin m → R) → Fin n → R} {A : Set (Fin m → R)}
    (hf : S.DefinableMapOn f A) (hinj : InjOn f A) : S.dim (f '' A) = S.dim A := by
  sorry

/-- Section 3.4d: a definable map does not raise dimension. -/
theorem dim_image_le {m n : ℕ} {f : (Fin m → R) → Fin n → R} {A : Set (Fin m → R)}
    (hf : S.DefinableMapOn f A) : S.dim (f '' A) ≤ S.dim A := by
  sorry

/-- Section 3.4d: the dimension of a product of definable sets, in concatenated coordinates,
is the sum of their dimensions. -/
theorem dim_image_appendEquiv_prod {m n : ℕ} {A : Set (Fin m → R)} {B : Set (Fin n → R)}
    (hA : S.Definable m A) (hB : S.Definable n B) :
    S.dim (Fin.appendEquiv m n '' A ×ˢ B) = S.dim A + S.dim B := by
  sorry

/-- Section 3.4d: for a definable `A ⊆ Rᵐ⁺ⁿ`, the set of `x ∈ Rᵐ` whose fibre
`{y | Fin.append x y ∈ A}` has a prescribed dimension is definable. -/
theorem definable_setOf_dim_fibre_eq {m n : ℕ} {A : Set (Fin (m + n) → R)}
    (hA : S.Definable (m + n) A) (d : WithBot ℕ∞) :
    S.Definable m {x | S.dim {y : Fin n → R | Fin.append x y ∈ A} = d} := by
  sorry

/-- Section 3.4d: the part of a definable `A ⊆ Rᵐ⁺ⁿ` lying over the points whose fibre has
dimension `d` has dimension the dimension of that locus plus `d`. -/
theorem dim_inter_setOf_dim_fibre_eq {m n : ℕ} {A : Set (Fin (m + n) → R)}
    (hA : S.Definable (m + n) A) (d : WithBot ℕ∞) :
    S.dim {z ∈ A | S.dim {y : Fin n → R |
        Fin.append ((Fin.appendEquiv m n).symm z).1 y ∈ A} = d} =
      S.dim {x | S.dim {y : Fin n → R | Fin.append x y ∈ A} = d} + d := by
  sorry

/-- Section 3.4d, the frontier inequality: the points of the closure of a nonempty definable set
outside it form a set of smaller dimension. -/
theorem dim_closure_diff_lt {n : ℕ} {A : Set (Fin n → R)} (hA : S.Definable n A)
    (hne : A.Nonempty) : S.dim (closure A \ A) < S.dim A := by
  sorry

end Dimension

/-- Section 3.4d: on `ℝ`, the dimension of a set definable in any o-minimal structure is its
topological dimension `TauCeti.semialgebraicDim`. -/
theorem dim_eq_semialgebraicDim (S : OMinimalStructure ℝ) {n : ℕ} {A : Set (Fin n → ℝ)}
    (hA : S.Definable n A) : S.dim A = TauCeti.semialgebraicDim A := by
  sorry

/-! ## Definable choice and curve selection (Section 3.4e) -/

section Choice

variable {R : Type*} [AddCommGroup R] [LinearOrder R] [IsOrderedAddMonoid R]

/-- Section 3.4e, definable choice: in an o-minimal expansion of an ordered abelian group, a
definable family has a definable section over its projection (van den Dries, Chapter 6,
(1.2)). -/
theorem exists_definableMapOn_section (S : OMinimalStructure R)
    (hadd : S.Definable 3 {x | x 2 = x 0 + x 1}) {m n : ℕ} {A : Set (Fin (m + n) → R)}
    (hA : S.Definable (m + n) A) :
    ∃ f : (Fin m → R) → Fin n → R, S.DefinableMapOn f {x | ∃ y, Fin.append x y ∈ A} ∧
      ∀ x, (∃ y, Fin.append x y ∈ A) → Fin.append x (f x) ∈ A := by
  sorry

/-- Section 3.4e, curve selection: in an o-minimal expansion of a nontrivial ordered abelian
group, a point in the closure of a definable set is the limit at `0⁺` of a continuous definable
curve in the set (van den Dries, Chapter 6, (1.5)). -/
theorem exists_tendsto_of_mem_closure [Nontrivial R] [TopologicalSpace R] [OrderTopology R]
    (S : OMinimalStructure R) (hadd : S.Definable 3 {x | x 2 = x 0 + x 1}) {n : ℕ}
    {A : Set (Fin n → R)} (hA : S.Definable n A) {a : Fin n → R} (ha : a ∈ closure A) :
    ∃ ε > 0, ∃ γ : R → Fin n → R,
      S.DefinableMapOn (fun t : Fin 1 → R => γ (t 0)) {t : Fin 1 → R | t 0 ∈ Ioo 0 ε} ∧
        ContinuousOn γ (Ioo 0 ε) ∧
        MapsTo γ (Ioo 0 ε) A ∧ Filter.Tendsto γ (nhdsWithin 0 (Ioi 0)) (nhds a) := by
  sorry

end Choice

end OMinimalStructure

/-! ## CM types and reflex fields (Section 5.1) -/

open scoped ComplexConjugate

/-- A set of complex embeddings selecting exactly one from each conjugate pair.
The theorems apply this partition to nonempty finite products of CM number fields
(Section 5.1; Milne, *Complex Multiplication*, Definition 1.8). -/
structure CMType (E : Type*) [CommRing E] where
  /-- The selected complex embeddings. -/
  toSet : Set (E →+* ℂ)
  star_mem_iff : ∀ φ : E →+* ℂ, star φ ∈ toSet ↔ φ ∉ toSet

namespace CMType
variable {E : Type*} [CommRing E]

/-- The type trace `a ↦ ∑_{φ ∈ Φ} φ a`. -/
noncomputable def typeTrace (Φ : CMType E) (a : E) : ℂ :=
  ∑ᶠ φ ∈ Φ.toSet, φ a

/-- The reflex field: the subfield of `ℂ` generated by the type traces (Milne,
*Complex Multiplication*, Proposition 1.16 and Definition 1.17). -/
noncomputable def reflexField (Φ : CMType E) : IntermediateField ℚ ℂ :=
  IntermediateField.adjoin ℚ (Set.range Φ.typeTrace)

/-- Section 5.1: the reflex field of any CM algebra with a CM type is a CM number
field (Milne, *Complex Multiplication*, Proposition 1.18(a), p.14). -/
theorem reflexField_isCMField {ι : Type*} [Fintype ι] [Nonempty ι]
    (F : ι → Type*) [∀ i, Field (F i)] [∀ i, NumberField (F i)]
    [∀ i, NumberField.IsCMField (F i)] (Φ : CMType (∀ i, F i)) :
    NumberField Φ.reflexField ∧ NumberField.IsCMField Φ.reflexField := by
  sorry

/-- Section 5.1: the type-trace character has a finite-dimensional realization over
`k` exactly when `k` contains the reflex field; that realization is unique up to
isomorphism (Milne, *Complex Multiplication*, Proposition 1.21, p.15, and Corollary
1.22, pp.15–16). A `k`-linear action of the CM algebra is equivalently a module over
its tensor product with `k`. Choosing a basis writes every such module as `kⁿ`;
the intertwining linear equivalence retains its full module structure. This is
the module-existence theorem used to construct the determinant reflex norm. -/
theorem reflexField_representation {ι : Type*} [Fintype ι] [Nonempty ι]
    (F : ι → Type*) [∀ i, Field (F i)] [∀ i, NumberField (F i)]
    [∀ i, NumberField.IsCMField (F i)] (Φ : CMType (∀ i, F i))
    (k : IntermediateField ℚ ℂ) [NumberField k] :
    (∃ (n : ℕ) (ρ : (∀ i, F i) →ₐ[ℚ] Module.End k (Fin n → k)),
      (∀ a, (LinearMap.trace k (Fin n → k) (ρ a) : ℂ) = Φ.typeTrace a) ∧
      ∀ (m : ℕ) (ρ' : (∀ i, F i) →ₐ[ℚ] Module.End k (Fin m → k)),
        (∀ a, (LinearMap.trace k (Fin m → k) (ρ' a) : ℂ) = Φ.typeTrace a) →
        ∃ e : (Fin n → k) ≃ₗ[k] (Fin m → k),
          ∀ a v, e (ρ a v) = ρ' a (e v)) ↔
      Φ.reflexField ≤ k := by
  sorry

end CMType

end TauCetiRoadmap.ShimuraVarieties
