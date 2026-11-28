import Mathlib

/-!
# Paley graphs and character sums: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
few definitions they need; every definition has a real body. Every headline theorem of the README
is statable at the pins and is stated here. The README's remaining API lists and Checks are not
restated.

The carrier is a finite field `F` (`[Field F] [Finite F] [DecidableEq F]`, `q = Nat.card F`),
read as a `Fintype` through `Fintype.ofFinite`, a local instance; the index type of the sorted
eigenvalues is therefore `Fin (Fintype.card F)`, and `Fintype.card F = Nat.card F`.
The Paley graph is `SimpleGraph.fromRel` of the relation "`x - y` is a square", so that two
distinct elements are adjacent when `x - y` or `y - x` is a square. When `q % 4 = 1`, `-1` is a
square and this is the usual Paley graph; for every other finite field it is the complete graph.
The quadratic character is Mathlib's `quadraticChar F`, valued in `ℤ`, with value `0` at `0`. The
canonical additive character `stdAddChar F`, `x ↦ e(Tr_{F/𝔽_p}(x)/p)`, is copied verbatim from
CharacterSumsOverFiniteFields 0.1, and the sorted adjacency eigenvalues `adjEigenvalues` are
copied verbatim from SpectralGraphBounds 1.1; no roadmap module is imported. The Paley tournament
is a Mathlib `Digraph`, with an arc from `x` to `y` when `y - x` is a nonzero square.
-/

noncomputable section

open SimpleGraph Finset

namespace TauCetiRoadmap.PaleyGraphsAndCharacterSums

universe u

/-! ## Layer 1: the Paley graph -/

/-- **1.1** The Paley graph of a field `F`: distinct `x` and `y` are adjacent when `x - y` or
`y - x` is a square. For a finite field with `q % 4 = 1` this is "`x - y` is a nonzero square". -/
def paleyGraph (F : Type*) [Field F] : SimpleGraph F :=
  SimpleGraph.fromRel fun x y => IsSquare (x - y)

/-- **1.1** Adjacency in the Paley graph of a finite field is decidable. -/
instance instDecidableRelPaleyGraphAdj (F : Type*) [Field F] [Finite F] [DecidableEq F] :
    DecidableRel (paleyGraph F).Adj :=
  haveI := Fintype.ofFinite F
  fun x y => inferInstanceAs (Decidable (x ≠ y ∧ (IsSquare (x - y) ∨ IsSquare (y - x))))

variable {F : Type u} [Field F] [Finite F] [DecidableEq F]

attribute [local instance] Fintype.ofFinite

/-- **1.2** For `q % 4 = 1` the Paley graph is strongly regular with parameters
`(q, (q - 1)/2, (q - 5)/4, (q - 1)/4)`. -/
theorem paleyGraph_isSRGWith (hF : Nat.card F % 4 = 1) :
    (paleyGraph F).IsSRGWith (Nat.card F) ((Nat.card F - 1) / 2)
      ((Nat.card F - 5) / 4) ((Nat.card F - 1) / 4) := by
  sorry

omit [DecidableEq F] in
/-- **1.3** For `q % 4 = 1` multiplication by a non-square `c` is an isomorphism from the Paley
graph onto its complement. -/
theorem exists_iso_compl_mul (hF : Nat.card F % 4 = 1) {c : F} (hc : ¬ IsSquare c) :
    ∃ e : paleyGraph F ≃g (paleyGraph F)ᶜ, ∀ x, e x = c * x := by
  sorry

omit [DecidableEq F] in
/-- **1.4** The automorphisms of the Paley graph act transitively on ordered pairs of adjacent
vertices. -/
theorem exists_iso_apply_eq_apply_eq {u v u' v' : F} (h : (paleyGraph F).Adj u v)
    (h' : (paleyGraph F).Adj u' v') :
    ∃ e : paleyGraph F ≃g paleyGraph F, e u = u' ∧ e v = v' := by
  sorry

/-! ## Layer 2: the spectrum -/

section CharacterSumsOverFiniteFields

variable (F : Type u) [Field F] [Finite F]

/-- **2.1** The canonical additive character `ψ_F(x) = e(Tr_{F/𝔽_p}(x)/p)`, copied verbatim from
CharacterSumsOverFiniteFields 0.1. -/
def stdAddChar : AddChar F ℂ :=
  letI : Algebra (ZMod (ringChar F)) F := ZMod.algebra F (ringChar F)
  haveI : NeZero (ringChar F) := ⟨(CharP.char_is_prime F (ringChar F)).ne_zero⟩
  (ZMod.stdAddChar : AddChar (ZMod (ringChar F)) ℂ).compAddMonoidHom
    (Algebra.trace (ZMod (ringChar F)) F).toAddMonoidHom

end CharacterSumsOverFiniteFields

/-- **2.1** The sign `σ` of the quadratic Gauss sum `g(η) = σ √q` of a field with `q = p ^ f`
elements and `q % 4 = 1`: `(-1)^(f - 1)` when `p % 4 = 1`, and `(-1)^(f/2 + 1)` otherwise (then
`f` is even). -/
def paleySign (p f : ℕ) : ℤ :=
  if p % 4 = 1 then (-1) ^ (f - 1) else (-1) ^ (f / 2 + 1)

/-- **2.1** For `q = p ^ f ≡ 1 (mod 4)` and `a ≠ 0`, the additive character `x ↦ ψ_F(a x)` is an
eigenvector of the complex adjacency matrix of the Paley graph, with eigenvalue
`(η(a) σ √q − 1)/2`, where `η` is the quadratic character and `σ = paleySign p f`. -/
theorem adjMatrix_mulVec_stdAddChar (hF : Nat.card F % 4 = 1) {p f : ℕ} [Fact p.Prime]
    (hq : Nat.card F = p ^ f) {a : F} (ha : a ≠ 0) :
    ((paleyGraph F).adjMatrix ℂ).mulVec (fun x => stdAddChar F (a * x)) =
      ((((quadraticChar F a : ℤ) : ℂ) * (paleySign p f : ℂ) * Real.sqrt (Nat.card F) - 1) /
        2) • (fun x => stdAddChar F (a * x)) := by
  sorry

section SpectralGraphBounds

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- **2.2** The adjacency eigenvalues of `G`, with multiplicity, in nonincreasing order: index `0`
carries the largest one. Copied verbatim from SpectralGraphBounds 1.1. -/
def adjEigenvalues (G : SimpleGraph V) [DecidableRel G.Adj] : Fin (Fintype.card V) → ℝ :=
  (G.isHermitian_adjMatrix ℝ).eigenvalues₀

end SpectralGraphBounds

/-- **2.2** For `q % 4 = 1` the sorted adjacency eigenvalues of the Paley graph are `(q − 1)/2`
once, then `(√q − 1)/2` at the indices `1, …, (q − 1)/2`, then `−(√q + 1)/2` at the remaining
`(q − 1)/2` indices. -/
theorem adjEigenvalues_paleyGraph (hF : Nat.card F % 4 = 1) (i : Fin (Fintype.card F)) :
    adjEigenvalues (paleyGraph F) i =
      if (i : ℕ) = 0 then ((Nat.card F : ℝ) - 1) / 2
      else if (i : ℕ) ≤ (Nat.card F - 1) / 2 then (Real.sqrt (Nat.card F) - 1) / 2
      else -(Real.sqrt (Nat.card F) + 1) / 2 := by
  sorry

/-! ## Layer 3: cliques, independent sets and edge distribution -/

omit [DecidableEq F] in
/-- **3.1** For `q % 4 = 1` the independence number and the clique number of the Paley graph are
at most `√q`. -/
theorem indepNum_le_sqrt_and_cliqueNum_le_sqrt (hF : Nat.card F % 4 = 1) :
    ((paleyGraph F).indepNum : ℝ) ≤ Real.sqrt (Nat.card F) ∧
      ((paleyGraph F).cliqueNum : ℝ) ≤ Real.sqrt (Nat.card F) := by
  sorry

omit [DecidableEq F] in
/-- **3.2** If `q % 4 = 1` and `q = m²`, the independence number and the clique number of the
Paley graph are both `m`: the subfield with `m` elements is a clique. -/
theorem indepNum_eq_and_cliqueNum_eq_of_sq (hF : Nat.card F % 4 = 1) {m : ℕ}
    (hm : m ^ 2 = Nat.card F) :
    (paleyGraph F).indepNum = m ∧ (paleyGraph F).cliqueNum = m := by
  sorry

/-- **3.3** Edge distribution in the Paley graph, for `q % 4 = 1`: for all sets `S`, `T` of
vertices, the number `e(S, T)` of ordered adjacent pairs in `S × T` differs from `|S| |T| / 2` by
at most `(√q + 2) √(|S| |T|) / 2`. -/
theorem abs_card_interedges_paleyGraph_sub_le (hF : Nat.card F % 4 = 1) (S T : Finset F) :
    |(#((paleyGraph F).interedges S T) : ℝ) - #S * #T / 2| ≤
      (Real.sqrt (Nat.card F) + 2) * Real.sqrt (#S * #T) / 2 := by
  sorry

/-! ## Layer 4: prescribed character patterns -/

/-- **4.1** Let `F` have odd characteristic, `A ⊆ F` a set of `n` elements and `ε` a choice of
signs on `A`. The number `N` of `x ∉ A` with `η(x − a) = ε(a)` for every `a ∈ A` satisfies
`|2ⁿ N − q| ≤ (n 2ⁿ/2 − 2ⁿ + 1) √q + n 2ⁿ/2`. -/
theorem abs_two_pow_mul_card_sub_le (hF : ringChar F ≠ 2) (A : Finset F) (ε : F → ℤ)
    (hε : ∀ a ∈ A, ε a = 1 ∨ ε a = -1) :
    |(2 : ℝ) ^ #A * #{x | x ∉ A ∧ ∀ a ∈ A, quadraticChar F (x - a) = ε a} - Nat.card F| ≤
      ((#A : ℝ) * 2 ^ #A / 2 - 2 ^ #A + 1) * Real.sqrt (Nat.card F) +
        (#A : ℝ) * 2 ^ #A / 2 := by
  sorry

omit [DecidableEq F] in
/-- **4.2** The Paley graph is `n`-existentially closed once `q > n² 4^(n − 1)`, for
`q % 4 = 1`: for disjoint `A`, `B` with `|A| + |B| ≤ n` some vertex outside `A ∪ B` is adjacent
to every vertex of `A` and to no vertex of `B`. -/
theorem exists_adj_forall_of_card_le (hF : Nat.card F % 4 = 1) {n : ℕ}
    (hn : n ^ 2 * 4 ^ (n - 1) < Nat.card F) (A B : Finset F) (hAB : Disjoint A B)
    (hcard : #A + #B ≤ n) :
    ∃ z, z ∉ A ∧ z ∉ B ∧ (∀ a ∈ A, (paleyGraph F).Adj z a) ∧
      ∀ b ∈ B, ¬ (paleyGraph F).Adj z b := by
  sorry

omit [DecidableEq F] in
/-- **4.3** For `q % 4 = 1` and `q > n² 4^(n − 1)`, every graph on at most `n + 1` vertices is
an induced subgraph of the Paley graph. -/
theorem nonempty_embedding_paleyGraph (hF : Nat.card F % 4 = 1) {n : ℕ}
    (hn : n ^ 2 * 4 ^ (n - 1) < Nat.card F) {W : Type*} [Finite W] (H : SimpleGraph W)
    (hW : Nat.card W ≤ n + 1) :
    Nonempty (H ↪g paleyGraph F) := by
  sorry

/-- **4.4** The Paley tournament of a field: an arc from `x` to `y` when `y - x` is a nonzero
square. -/
def paleyTournament (F : Type*) [Field F] : Digraph F where
  Adj x y := x ≠ y ∧ IsSquare (y - x)

omit [DecidableEq F] in
/-- **4.4** For `q > n² 4^(n − 1)` the Paley tournament is `n`-existentially closed: for
disjoint `A`, `B` with `|A| + |B| ≤ n` some vertex outside `A ∪ B` has an arc to every vertex of
`A` and an arc from every vertex of `B`. It is a tournament exactly when `q % 4 = 3`. -/
theorem paleyTournament_exists_adj_forall_of_card_le {n : ℕ}
    (hn : n ^ 2 * 4 ^ (n - 1) < Nat.card F) (A B : Finset F) (hAB : Disjoint A B)
    (hcard : #A + #B ≤ n) :
    ∃ z, z ∉ A ∧ z ∉ B ∧ (∀ a ∈ A, (paleyTournament F).Adj z a) ∧
      ∀ b ∈ B, (paleyTournament F).Adj b z := by
  sorry

end TauCetiRoadmap.PaleyGraphsAndCharacterSums
