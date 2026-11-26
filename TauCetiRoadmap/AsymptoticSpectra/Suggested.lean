import Mathlib

/-!
# Asymptotic spectra: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib, each with `sorry`, together with the definitions
they need; every definition has a real body. Every headline theorem of the README is statable at
the pins and is stated here. The README's remaining targets, API lists and Checks are not
restated.

The abstract theory is stated for a relation `le` on a type with `0`, `1`, `+` and `*`, with no
semiring laws assumed: `IsStrassenPreorder le` asks for the commutative-semiring identities only
up to the equivalence `le a b ∧ le b a`, so that finite graphs and coordinate tensors, which form
a semiring only up to isomorphism, are instances without quotients. Natural numbers enter through
Mathlib's `Nat.unaryCast` and powers through `npowRec`. Powers in the asymptotic rank and subrank
run over exponents `n + 1`, never `0`.

Graphs are bundled as `FinGraph`, with the disjoint union `⊕g` as addition and the strong product
as multiplication, ordered by cohomomorphisms (graph homomorphisms between the complements).
The definitions `lovaszTheta`, `strongProd`, `strongPow` and `shannonCapacity` are copied
verbatim from LovaszThetaFunction (1.1, 3.1, 5.1), and `IsFractionalCover` from
ApproximationGuarantees 1.1. Tensors are coordinate arrays `CoordTensor F ι` over a field `F`
with a fixed finite set `ι` of parties: a dimension for each party and coordinates indexed by
`Fin`, as in Mathlib's holors, so that the sum and the Kronecker product act on dimensions by `+`
and `*`, and `Nat.unaryCast n` has the dimensions and coordinates of the unit tensor `⟨n⟩`. They
are ordered by restriction under Kronecker products of families of matrices; the tensor rank is
defined by CP decompositions, and its agreement with the rank for restriction is a theorem.
`CoordTensor.ofHolor` reads Mathlib's holors as tensors, and `tensorRank_ofHolor` relates
`tensorRank` to Mathlib's `Holor.cprank`.
-/

noncomputable section

open Filter Topology

namespace TauCetiRoadmap.AsymptoticSpectra

/-! ## Layer 1: Strassen preorders and the duality theorem -/

section Abstract

variable {R : Type*} [Zero R] [One R] [Add R] [Mul R]

/-- 1.1 A Strassen preorder on `R`: a preorder `le` for which the commutative-semiring identities
hold up to the equivalence `le a b ∧ le b a`, which is compatible with `+` and `*`, which orders
the natural numbers `Nat.unaryCast n` as `ℕ` does, and which is Archimedean: every `a` is below
`r * b` for some natural number `r` once `b` is not below `0`. For an ordered commutative
semiring the identities hold exactly (see `isStrassenPreorder_le_and_asymptoticSpectrum_eq`). -/
structure IsStrassenPreorder (le : R → R → Prop) : Prop where
  refl_le : ∀ a, le a a
  trans_le : ∀ a b c, le a b → le b c → le a c
  add_comm_le : ∀ a b, le (a + b) (b + a)
  add_assoc_equiv : ∀ a b c, le (a + b + c) (a + (b + c)) ∧ le (a + (b + c)) (a + b + c)
  zero_add_equiv : ∀ a, le (0 + a) a ∧ le a (0 + a)
  mul_comm_le : ∀ a b, le (a * b) (b * a)
  mul_assoc_equiv : ∀ a b c, le (a * b * c) (a * (b * c)) ∧ le (a * (b * c)) (a * b * c)
  one_mul_equiv : ∀ a, le (1 * a) a ∧ le a (1 * a)
  zero_mul_equiv : ∀ a, le (0 * a) 0 ∧ le 0 (0 * a)
  mul_add_equiv : ∀ a b c, le (a * (b + c)) (a * b + a * c) ∧ le (a * b + a * c) (a * (b + c))
  add_right_mono : ∀ a b c, le a b → le (a + c) (b + c)
  mul_right_mono : ∀ a b c, le a b → le (a * c) (b * c)
  unaryCast_le_iff : ∀ m n : ℕ, le (Nat.unaryCast m) (Nat.unaryCast n) ↔ m ≤ n
  exists_le_unaryCast_mul : ∀ a b, ¬ le b 0 → ∃ r : ℕ, le a (Nat.unaryCast r * b)

/-- 1.1 The asymptotic preorder of `le`: `a ≲ b` when `aⁿ ≤ 2^(f n) bⁿ` for every `n`, for some
`f : ℕ → ℕ` with `f n / n → 0`. -/
def asympLE (le : R → R → Prop) (a b : R) : Prop :=
  ∃ f : ℕ → ℕ, Tendsto (fun n => (f n : ℝ) / n) atTop (𝓝 0) ∧
    ∀ n, le (npowRec n a) (Nat.unaryCast (2 ^ f n) * npowRec n b)

/-- 1.2 The asymptotic spectrum of `le`: the maps `R → ℝ` that are additive, multiplicative,
monotone for `le` and send `1` to `1`. For an ordered commutative semiring these are the order
ring homomorphisms to `ℝ` (see `isStrassenPreorder_le_and_asymptoticSpectrum_eq`). -/
def asymptoticSpectrum (le : R → R → Prop) : Set (R → ℝ) :=
  {φ | (∀ a b, φ (a + b) = φ a + φ b) ∧ (∀ a b, φ (a * b) = φ a * φ b) ∧ φ 1 = 1 ∧
    ∀ a b, le a b → φ a ≤ φ b}

/-- 1.3 The rank of `a`: the least natural number `r` with `a ≤ r`. -/
def abstractRank (le : R → R → Prop) (a : R) : ℕ :=
  sInf {r : ℕ | le a (Nat.unaryCast r)}

/-- 1.3 The subrank of `a`: the largest natural number `s` with `s ≤ a`. -/
def abstractSubrank (le : R → R → Prop) (a : R) : ℕ :=
  sSup {s : ℕ | le (Nat.unaryCast s) a}

/-- 1.3 The asymptotic rank: the infimum over `n ≥ 1` of `R(aⁿ)^(1/n)`. -/
def asympRank (le : R → R → Prop) (a : R) : ℝ :=
  ⨅ n : ℕ, (abstractRank le (npowRec (n + 1) a) : ℝ) ^ ((1 : ℝ) / (n + 1))

/-- 1.3 The asymptotic subrank: the supremum over `n ≥ 1` of `Q(aⁿ)^(1/n)`. -/
def asympSubrank (le : R → R → Prop) (a : R) : ℝ :=
  ⨆ n : ℕ, (abstractSubrank le (npowRec (n + 1) a) : ℝ) ^ ((1 : ℝ) / (n + 1))

/-- 1.3 An element is gapped when some power of it is at least `2`, or some point of the
asymptotic spectrum takes the value `1` on it. -/
def IsGapped (le : R → R → Prop) (a : R) : Prop :=
  (∃ k : ℕ, le (Nat.unaryCast 2) (npowRec k a)) ∨ ∃ φ ∈ asymptoticSpectrum le, φ a = 1

/-- 1.1 For an ordered commutative semiring whose elements are all nonnegative and which is
Archimedean, the order is a Strassen preorder, and its asymptotic spectrum consists of the
order ring homomorphisms to `ℝ`. -/
theorem isStrassenPreorder_le_and_asymptoticSpectrum_eq {S : Type*} [CommSemiring S]
    [PartialOrder S] [IsStrictOrderedRing S] [Archimedean S] (h0 : ∀ a : S, 0 ≤ a) :
    IsStrassenPreorder (fun a b : S => a ≤ b) ∧
      asymptoticSpectrum (fun a b : S => a ≤ b) = Set.range (fun f : S →+*o ℝ => (f : S → ℝ)) := by
  sorry

/-- 1.1 The asymptotic preorder of a Strassen preorder is a Strassen preorder containing it, and
it is closed: its own asymptotic preorder is itself. -/
theorem isStrassenPreorder_asympLE {le : R → R → Prop} (hP : IsStrassenPreorder le) :
    IsStrassenPreorder (asympLE le) ∧ (∀ a b, le a b → asympLE le a b) ∧
      ∀ a b, asympLE (asympLE le) a b → asympLE le a b := by
  sorry

/-- 1.1 Cancellation in the asymptotic preorder: additive cancellation, multiplicative
cancellation by an element not below `0`, and the gap property. -/
theorem asympLE_cancel {le : R → R → Prop} (hP : IsStrassenPreorder le) {a b c : R} :
    (asympLE le (a + c) (b + c) → asympLE le a b) ∧
      (asympLE le (a * c) (b * c) → ¬ le c 0 → asympLE le a b) ∧
      ((∀ n : ℕ, asympLE le (Nat.unaryCast n * a) (Nat.unaryCast n * b + c)) →
        asympLE le a b) := by
  sorry

/-- 1.2 Strassen's duality theorem: `a ≲ b` if and only if `φ a ≤ φ b` for every point `φ` of
the asymptotic spectrum. -/
theorem asympLE_iff_forall_mem_asymptoticSpectrum {le : R → R → Prop}
    (hP : IsStrassenPreorder le) (a b : R) :
    asympLE le a b ↔ ∀ φ ∈ asymptoticSpectrum le, φ a ≤ φ b := by
  sorry

/-- 1.3 The asymptotic spectrum is compact in the product topology of `R → ℝ`. -/
theorem isCompact_asymptoticSpectrum {le : R → R → Prop} (hP : IsStrassenPreorder le) :
    IsCompact (asymptoticSpectrum le) := by
  sorry

/-- 1.3 For `a ≥ 1`, `R(aⁿ)^(1/n)` converges to the asymptotic rank, which is the largest value
of a point of the asymptotic spectrum at `a`. -/
theorem asympRank_spec {le : R → R → Prop} (hP : IsStrassenPreorder le) {a : R}
    (ha : le 1 a) :
    Tendsto (fun n : ℕ => (abstractRank le (npowRec n a) : ℝ) ^ ((1 : ℝ) / n)) atTop
        (𝓝 (asympRank le a)) ∧
      IsGreatest ((fun φ => φ a) '' asymptoticSpectrum le) (asympRank le a) := by
  sorry

/-- 1.3 For `a ≥ 1` gapped, `Q(aⁿ)^(1/n)` converges to the asymptotic subrank, which is the
least value of a point of the asymptotic spectrum at `a`. -/
theorem asympSubrank_spec {le : R → R → Prop} (hP : IsStrassenPreorder le) {a : R}
    (ha : le 1 a) (hg : IsGapped le a) :
    Tendsto (fun n : ℕ => (abstractSubrank le (npowRec n a) : ℝ) ^ ((1 : ℝ) / n)) atTop
        (𝓝 (asympSubrank le a)) ∧
      IsLeast ((fun φ => φ a) '' asymptoticSpectrum le) (asympSubrank le a) := by
  sorry

/-- 1.1 The natural numbers with their order satisfy every field of a Strassen preorder. -/
example : IsStrassenPreorder (fun a b : ℕ => a ≤ b) := by
  have hc : ∀ n : ℕ, (Nat.unaryCast n : ℕ) = n := by
    intro n
    induction n with
    | zero => rfl
    | succ n ih => simp [Nat.unaryCast, ih]
  refine ⟨fun a => le_refl a, fun a b c => le_trans, fun a b => (Nat.add_comm a b).le,
    fun a b c => ⟨(Nat.add_assoc a b c).le, (Nat.add_assoc a b c).ge⟩,
    fun a => ⟨(Nat.zero_add a).le, (Nat.zero_add a).ge⟩, fun a b => (Nat.mul_comm a b).le,
    fun a b c => ⟨(Nat.mul_assoc a b c).le, (Nat.mul_assoc a b c).ge⟩,
    fun a => ⟨(Nat.one_mul a).le, (Nat.one_mul a).ge⟩,
    fun a => ⟨(Nat.zero_mul a).le, (Nat.zero_mul a).ge⟩,
    fun a b c => ⟨(Nat.mul_add a b c).le, (Nat.mul_add a b c).ge⟩,
    fun a b c h => Nat.add_le_add_right h c, fun a b c h => Nat.mul_le_mul_right c h,
    fun m n => by rw [hc, hc], fun a b hb => ⟨a, ?_⟩⟩
  rw [hc]
  exact Nat.le_mul_of_pos_right a (Nat.pos_of_ne_zero (fun h => hb h.le))

end Abstract

/-! ## Layer 2: the asymptotic spectrum of graphs -/

section Copied

variable {V : Type*} [Fintype V]

/-- 2.2 (copied verbatim from LovaszThetaFunction 1.1) The Lovász theta function in its
semidefinite form: the supremum of the sum of the entries of `B` over positive semidefinite real
matrices `B` with trace `1` and `B i j = 0` whenever `i` and `j` are adjacent. -/
def lovaszTheta (G : SimpleGraph V) : ℝ :=
  sSup {s : ℝ | ∃ B : Matrix V V ℝ, B.PosSemidef ∧ B.trace = 1 ∧
    (∀ i j, G.Adj i j → B i j = 0) ∧ ∑ i, ∑ j, B i j = s}

/-- 2.1 (copied verbatim from LovaszThetaFunction 3.1) The strong product of `G` and `H`:
distinct pairs are adjacent when each coordinate is equal or adjacent. -/
def strongProd {W : Type*} (G : SimpleGraph V) (H : SimpleGraph W) : SimpleGraph (V × W) where
  Adj x y := x ≠ y ∧ (x.1 = y.1 ∨ G.Adj x.1 y.1) ∧ (x.2 = y.2 ∨ H.Adj x.2 y.2)
  symm.symm _ _ h := ⟨h.1.symm, h.2.1.imp Eq.symm (fun h' => h'.symm),
    h.2.2.imp Eq.symm (fun h' => h'.symm)⟩
  loopless.irrefl _ h := h.1 rfl

/-- 2.1 (copied verbatim from LovaszThetaFunction 3.1) The `k`-th strong power of `G`, on words
`Fin k → V`: distinct words are adjacent when in every coordinate the letters are equal or
adjacent. -/
def strongPow (G : SimpleGraph V) (k : ℕ) : SimpleGraph (Fin k → V) where
  Adj x y := x ≠ y ∧ ∀ i, x i = y i ∨ G.Adj (x i) (y i)
  symm.symm _ _ h := ⟨h.1.symm, fun i => (h.2 i).imp Eq.symm (fun h' => h'.symm)⟩
  loopless.irrefl _ h := h.1 rfl

/-- 2.1 (copied verbatim from LovaszThetaFunction 5.1) The Shannon capacity: the supremum over
`k ≥ 1` of `α(G^⊠k)^(1/k)`. -/
def shannonCapacity (G : SimpleGraph V) : ℝ :=
  ⨆ k : ℕ, ((strongPow G (k + 1)).indepNum : ℝ) ^ ((1 : ℝ) / (k + 1))

end Copied

section CopiedCover

variable {ι α : Type*}

/-- 2.3 (copied verbatim from ApproximationGuarantees 1.1) A fractional cover of the set system
`S`: nonnegative multipliers `x` on the sets such that, for every element `e` of a set of the
system, the multipliers of the sets containing `e` sum to at least `1`. -/
def IsFractionalCover [Fintype ι] [DecidableEq α] (S : ι → Finset α) (x : ι → ℝ) : Prop :=
  (∀ j, 0 ≤ x j) ∧ ∀ j, ∀ e ∈ S j, 1 ≤ ∑ i with e ∈ S i, x i

end CopiedCover

/-- 2.1 A finite simple graph bundled with its vertex type. -/
structure FinGraph where
  /-- The vertex type. -/
  V : Type
  [fintype : Fintype V]
  [decEq : DecidableEq V]
  /-- The graph. -/
  G : SimpleGraph V

attribute [instance] FinGraph.fintype FinGraph.decEq

namespace FinGraph

/-- 2.1 The zero graph: no vertex. -/
instance : Zero FinGraph := ⟨⟨Fin 0, ⊥⟩⟩

/-- 2.1 The unit graph: one vertex. -/
instance : One FinGraph := ⟨⟨Fin 1, ⊥⟩⟩

/-- 2.1 Addition is the disjoint union `⊕g`. -/
instance : Add FinGraph := ⟨fun G H => ⟨G.V ⊕ H.V, G.G ⊕g H.G⟩⟩

/-- 2.1 Multiplication is the strong product. -/
instance : Mul FinGraph := ⟨fun G H => ⟨G.V × H.V, strongProd G.G H.G⟩⟩

end FinGraph

/-- 2.1 The cohomomorphism preorder: `G ≤ H` when there is a graph homomorphism from the
complement of `G` to the complement of `H`, that is, a map of vertices sending distinct
nonadjacent vertices to distinct nonadjacent vertices. -/
def cohomLE (G H : FinGraph) : Prop :=
  Nonempty (G.Gᶜ →g H.Gᶜ)

/-- 2.1 Finite graphs with disjoint union, strong product and the cohomomorphism preorder form
a Strassen preorder. -/
theorem isStrassenPreorder_cohomLE : IsStrassenPreorder cohomLE := by
  sorry

/-- 2.1 The rank of a graph for the cohomomorphism preorder is its clique cover number, the
least `k` such that the complement is `k`-colourable, and its subrank is its independence
number. -/
theorem abstractRank_cohomLE_and_abstractSubrank (G : FinGraph) :
    IsLeast {k : ℕ | G.Gᶜ.Colorable k} (abstractRank cohomLE G) ∧
      abstractSubrank cohomLE G = G.G.indepNum := by
  sorry

/-- 2.1 Zuiddam's theorem: the Shannon capacity is the asymptotic subrank of a graph, and it is
the least value at the graph of a point of the asymptotic spectrum of graphs. -/
theorem shannonCapacity_eq_asympSubrank (G : FinGraph) :
    asympSubrank cohomLE G = shannonCapacity G.G ∧
      IsLeast ((fun φ => φ G) '' asymptoticSpectrum cohomLE) (shannonCapacity G.G) := by
  sorry

/-- 2.2 The theta function is additive under disjoint union: `ϑ(G ⊔ H) = ϑ(G) + ϑ(H)`. -/
theorem lovaszTheta_sum {V W : Type*} [Fintype V] [Fintype W] (G : SimpleGraph V)
    (H : SimpleGraph W) : lovaszTheta (G ⊕g H) = lovaszTheta G + lovaszTheta H := by
  sorry

/-- 2.2 The Lovász theta function is a point of the asymptotic spectrum of graphs; in particular
it is monotone under cohomomorphisms: a graph homomorphism from the complement of `G` to the
complement of `H` gives `ϑ(G) ≤ ϑ(H)`. Its additivity is `lovaszTheta_sum`, its multiplicativity
LovaszThetaFunction's `lovaszTheta_strongProd` (3.2), and its value `1` at the one-vertex graph
follows from that roadmap's `indepNum_le_lovaszTheta` and `lovaszTheta_le_of_colorable_compl`
(2.1). -/
theorem lovaszTheta_mem_asymptoticSpectrum :
    (fun G : FinGraph => lovaszTheta G.G) ∈ asymptoticSpectrum cohomLE := by
  sorry

/-- 2.3 The fractional clique cover number: the least total weight of nonnegative weights on
the cliques under which every vertex lies in cliques of total weight at least `1`. -/
def fracCliqueCover {V : Type*} [Fintype V] [DecidableEq V] (G : SimpleGraph V) : ℝ :=
  sInf {s : ℝ | ∃ x : Finset V → ℝ, IsFractionalCover (fun C => C) x ∧
    (∀ C, x C ≠ 0 → G.IsClique (C : Set V)) ∧ ∑ C, x C = s}

/-- 2.3 Linear-programming duality for the fractional clique cover number: the infimum is
attained, and it equals the largest total weight of nonnegative weights on the vertices under
which every clique has weight at most `1`. -/
theorem fracCliqueCover_spec {V : Type*} [Fintype V] [DecidableEq V] (G : SimpleGraph V) :
    IsLeast {s : ℝ | ∃ x : Finset V → ℝ, IsFractionalCover (fun C => C) x ∧
        (∀ C, x C ≠ 0 → G.IsClique (C : Set V)) ∧ ∑ C, x C = s} (fracCliqueCover G) ∧
      IsGreatest {s : ℝ | ∃ y : V → ℝ, (∀ v, 0 ≤ y v) ∧
        (∀ C : Finset V, G.IsClique (C : Set V) → ∑ v ∈ C, y v ≤ 1) ∧ ∑ v, y v = s}
        (fracCliqueCover G) := by
  sorry

/-- 2.3 The fractional clique cover number is a point of the asymptotic spectrum of graphs. -/
theorem fracCliqueCover_mem_asymptoticSpectrum :
    (fun G : FinGraph => fracCliqueCover G.G) ∈ asymptoticSpectrum cohomLE := by
  sorry

/-- 2.4 The asymptotic clique cover number is the fractional clique cover number (McEliece and
Posner), which is the largest value at the graph of a point of the asymptotic spectrum. -/
theorem asympRank_cohomLE (G : FinGraph) :
    asympRank cohomLE G = fracCliqueCover G.G ∧
      IsGreatest ((fun φ => φ G) '' asymptoticSpectrum cohomLE) (fracCliqueCover G.G) := by
  sorry

/-! ## Layer 3: the asymptotic spectrum of tensors -/

/-- 3.1 A coordinate tensor over `F` with parties `ι`: a format `dim`, giving the dimension of the
space of each party, and the array of coordinates, indexed as in Mathlib's holors by one
`Fin (dim p)` for each party. A dimension may be `0`; the array is then empty. -/
structure CoordTensor (F : Type*) (ι : Type*) where
  /-- The dimension of the space of each party. -/
  dim : ι → ℕ
  /-- The coordinates. -/
  coeff : (∀ p, Fin (dim p)) → F

namespace CoordTensor

variable {F : Type*} [Field F] {ι : Type*} [Fintype ι] [DecidableEq ι]

/-- 3.1 Zero: dimension `0` at every party. -/
instance : Zero (CoordTensor F ι) := ⟨⟨fun _ => 0, fun _ => 0⟩⟩

/-- 3.1 One: the unit tensor `⟨1⟩`, of dimension `1` at every party, with coordinate `1`. -/
instance : One (CoordTensor F ι) := ⟨⟨fun _ => 1, fun _ => 1⟩⟩

/-- 3.1 The direct sum: dimensions add, and an index `i < s.dim p` of `Fin (s.dim p + t.dim p)`
stands for `i` in `s`, an index `s.dim p + j` for `j` in `t`. The coordinates are those of `s` where
every index lies in `s`, those of `t` where every index lies in `t`, and `0` elsewhere; with no
party, the two scalars are added. -/
instance : Add (CoordTensor F ι) := ⟨fun s t => ⟨fun p => s.dim p + t.dim p, fun x =>
  (if h : ∀ p, (x p : ℕ) < s.dim p then s.coeff (fun p => ⟨x p, h p⟩) else 0) +
    (if h : ∀ p, s.dim p ≤ (x p : ℕ) then
      t.coeff (fun p => ⟨x p - s.dim p, Nat.sub_lt_left_of_lt_add (h p) (x p).isLt⟩) else 0)⟩⟩

/-- 3.1 The Kronecker product: dimensions multiply, and an index of `Fin (s.dim p * t.dim p)` is
read as a pair by `Fin.divNat` and `Fin.modNat`, the inverse of Mathlib's `finProdFinEquiv`, in the
order of `Matrix.kronecker`. -/
instance : Mul (CoordTensor F ι) := ⟨fun s t => ⟨fun p => s.dim p * t.dim p, fun x =>
  s.coeff (fun p => (x p).divNat) * t.coeff (fun p => (x p).modNat)⟩⟩

end CoordTensor

section Tensors

variable {F : Type*} [Field F] {ι : Type*} [Fintype ι] [DecidableEq ι]

/-- 3.1 Restriction: `s ≤ t` when, for some matrices `A p` from the dimensions of `t` to those of
`s`, the coordinates of `s` are the image of those of `t` under the Kronecker product of the
family `A`, the matrix with entries `∏ p, A p (x p) (y p)`. -/
def restrictLE (s t : CoordTensor F ι) : Prop :=
  ∃ A : ∀ p, Matrix (Fin (s.dim p)) (Fin (t.dim p)) F,
    s.coeff = (Matrix.of fun x y => ∏ p, A p (x p) (y p)).mulVec t.coeff

/-- 3.1 Tensor rank (CP rank): the least `r` for which there are factor matrices `A p` with `r`
columns, one for each party, with `t x = ∑ i, ∏ p, A p (x p) i` for every index `x`; that is, `t`
is the sum of the `r` products of the `i`-th columns of the `A p`. -/
def tensorRank (t : CoordTensor F ι) : ℕ :=
  sInf {r : ℕ | ∃ A : ∀ p, Matrix (Fin (t.dim p)) (Fin r) F,
    t.coeff = fun x => ∑ i, ∏ p, A p (x p) i}

/-- 3.2 The flattening rank at `S`: the rank of the matrix whose rows are indexed by the indices
of the parties in `S`, whose columns are indexed by those of the other parties, and whose entries
are the coordinates of `t`, the two halves of an index glued by `Equiv.piEquivPiSubtypeProd`. -/
def flatRank (S : Finset ι) (t : CoordTensor F ι) : ℕ :=
  (Matrix.of fun (x : ∀ p : {p // p ∈ S}, Fin (t.dim p)) (y : ∀ p : {p // p ∉ S}, Fin (t.dim p)) =>
    t.coeff ((Equiv.piEquivPiSubtypeProd (· ∈ S) (fun p => Fin (t.dim p))).symm (x, y))).rank

/-- 3.1 Restriction with direct sum, Kronecker product and unit tensors is a Strassen preorder
when there are at least two parties. -/
theorem isStrassenPreorder_restrictLE (hι : 2 ≤ Fintype.card ι) :
    IsStrassenPreorder (restrictLE (F := F) (ι := ι)) := by
  sorry

/-- 3.1 For any finite set of parties, the rank of a tensor for restriction is its tensor rank:
being a restriction of the unit tensor `⟨r⟩` is having a CP decomposition with `r` terms. -/
theorem abstractRank_restrictLE (t : CoordTensor F ι) :
    abstractRank restrictLE t = tensorRank t := by
  sorry

/-- 3.1 The coordinate tensor of a Mathlib holor `x : Holor F ds`: one party for each entry of the
list `ds`, of that dimension, with the entries of `x` as coordinates. -/
def CoordTensor.ofHolor {ds : List ℕ} (x : Holor F ds) : CoordTensor F (Fin ds.length) :=
  ⟨fun p => ds.get p, fun i =>
    x ⟨List.ofFn (fun p => (i p : ℕ)), List.forall₂_iff_get.2 ⟨by simp, fun j h₁ h₂ => by simp⟩⟩⟩

/-- 3.1 With at least one party, `tensorRank` is Mathlib's CP rank of holors (stated for a field
`F : Type`, the universe of `Holor.cprank`). -/
theorem tensorRank_ofHolor {F : Type} [Field F] {ds : List ℕ} (hds : ds ≠ []) (x : Holor F ds) :
    tensorRank (CoordTensor.ofHolor x) = x.cprank := by
  sorry

/-- 3.2 For `S` neither empty nor everything, the flattening rank at `S` is a point of the
asymptotic spectrum of tensors. -/
theorem flatRank_mem_asymptoticSpectrum {S : Finset ι} (hS : S.Nonempty)
    (hS' : S ≠ Finset.univ) :
    (fun t : CoordTensor F ι => (flatRank S t : ℝ)) ∈ asymptoticSpectrum restrictLE := by
  sorry

/-- 3.2 Matrices: for two parties the asymptotic spectrum consists of the matrix rank alone, and
restriction is comparison of ranks. -/
theorem asymptoticSpectrum_restrictLE_fin_two :
    asymptoticSpectrum (restrictLE (F := F) (ι := Fin 2)) =
        {fun t => (flatRank {0} t : ℝ)} ∧
      ∀ s t : CoordTensor F (Fin 2), restrictLE s t ↔ flatRank {0} s ≤ flatRank {0} t := by
  sorry

end Tensors

section MatrixMultiplication

variable (F : Type*) [Field F]

/-- 3.3 The matrix multiplication tensor `⟨n, n, n⟩` on three parties of dimension `n * n`, an
index being read as a pair `(i, j)` by `Fin.divNat` and `Fin.modNat`: the coordinate at
`((i, j), (j', k), (k', i'))` is `1` when `j = j'`, `k = k'` and `i = i'`, and `0` otherwise. -/
def mmTensor (n : ℕ) : CoordTensor F (Fin 3) :=
  ⟨fun _ => n * n, fun x =>
    if (x 0).modNat = (x 1).divNat ∧ (x 1).modNat = (x 2).divNat ∧ (x 2).modNat = (x 0).divNat
    then 1 else 0⟩

/-- 3.3 The exponent of matrix multiplication: the infimum of the `τ` with
`R(⟨n, n, n⟩) ≤ C nᵗ` for some `C` and every `n ≥ 1`. -/
def matMulExponent : ℝ :=
  sInf {τ : ℝ | ∃ C : ℝ, ∀ n : ℕ, 1 ≤ n → (tensorRank (mmTensor F n) : ℝ) ≤ C * (n : ℝ) ^ τ}

/-- 3.3 Strassen: the `2 × 2` matrix multiplication tensor has tensor rank at most `7`; the
exponent `ω` of matrix multiplication lies between `2` and `log₂ 7`; and `2 ^ ω` is the asymptotic
rank of the `2 × 2` matrix multiplication tensor. -/
theorem matMulExponent_spec :
    tensorRank (mmTensor F 2) ≤ 7 ∧ 2 ≤ matMulExponent F ∧ matMulExponent F ≤ Real.logb 2 7 ∧
      (2 : ℝ) ^ matMulExponent F = asympRank restrictLE (mmTensor F 2) := by
  sorry

end MatrixMultiplication

end TauCetiRoadmap.AsymptoticSpectra
