module
import Mathlib

/-!
# Refined trace methods, part II: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against the pinned Mathlib
and Tau Ceti, the headline theorems of the roadmap that are statable there, each with `sorry`,
together with the few definitions they need.

The statable headlines are the counting theorems that fix the sizes of the answers: the
cardinality of the cusp truncation set `S(a,b,r)` and Sylvester's count for its coprime part
`T(a,b,r)`, which is the length over `W(k)` of the cusp K-group `K_{2r}` for a perfect field `k`
(README §1.1), and the closed formula
for the number of words without cyclic repetitions, which gives the multiplicities in the
coordinate-axes formulas (README §1.4).

The following headline theorems are not statable at the pins, because Mathlib and Tau Ceti have
no higher or relative algebraic K-groups (Tau Ceti has Grothendieck groups only), no topological
Hochschild homology or topological cyclic homology, no cyclic homology (Tau Ceti has the cyclic
cohomology of cochains only), no big Witt vectors, no de Rham–Witt complex and no syntomic
complexes (perfectoid rings themselves are `TauCeti.Perfectoid.IsIntegralPerfectoid`):

* Hesselholt's formula for `K_q(k[x,y]/(xy),(x,y))` over a regular noetherian `𝔽_p`-algebra
  (README §5.2): it lacks relative algebraic K-groups and the de Rham–Witt complex.
* Speirs' formulas for the K-theory of the coordinate axes in affine `d`-space over perfect fields
  and over ind-smooth `ℚ`-algebras, and for the relative cyclic homology of the axes over
  `ℚ`-algebras (README §§5.3–5.4): they lack relative algebraic K-groups and cyclic homology.
* The Hesselholt–Nikolaus theorem `K_{2r}(k[x,y]/(y^a − x^b),(x,y)) ≅
  W_S(k)/(V_a W_{S/a}(k) + V_b W_{S/b}(k))` over perfect `𝔽_p`-algebras (README §6.2): it lacks
  relative algebraic K-groups and big Witt vectors.
* Riggenbach's theorem `K_{2r−1}(R[x]/x^e,(x);ℤ_p) ≅ W_{re}(R)/V_e W_r(R)` over perfectoid rings
  (README §7.2): it lacks relative algebraic K-groups and big Witt vectors.
* The Antieau–Krause–Nikolaus theorems on finite chain rings `O_K/ϖ^n`: the structure of the
  p-adic K-groups through syntomic cohomology, Angeltveit's order quotient, the vanishing of the
  even K-groups above the threshold and the nilpotence bound for `v₁` (README §§9.2, 9.3, 9.5,
  9.6): they lack higher algebraic K-groups and syntomic complexes.
* Prismatic cohomology relative to a δ-ring, its filtered variant and crystalline degeneration
  (README Layer 8): they lack δ-rings, prisms and prismatic cohomology.
-/

namespace TauCetiRoadmap.RefinedTraceMethodsPartII

/-! ## Layer 1: Indexing arithmetic and Witt bookkeeping -/

/-- The cusp counting function `ℓ(a,b,m)`: the number of pairs `(i,j)` of positive integers with
`a * i + b * j = m` (hn-cusp line 20). For positive `a` and `b` every such pair has `i, j ≤ m`. -/
def cuspCount (a b m : ℕ) : ℕ :=
  ((Finset.Icc 1 m ×ˢ Finset.Icc 1 m).filter (fun ij => a * ij.1 + b * ij.2 = m)).card

/-- The cusp truncation set `S(a,b,r) = {m ≥ 1 : ℓ(a,b,m) ≤ r}` (hesselholt-cusp-polytopes
line 384). -/
def cuspTruncationSet (a b r : ℕ) : Set ℕ :=
  {m | 1 ≤ m ∧ cuspCount a b m ≤ r}

/-- The coprime part `T(a,b,r) = {m ∈ S(a,b,r) : a ∤ m and b ∤ m}` of the cusp truncation set. -/
def cuspCoprimeSet (a b r : ℕ) : Set ℕ :=
  {m | m ∈ cuspTruncationSet a b r ∧ ¬ a ∣ m ∧ ¬ b ∣ m}

/-- For coprime `a, b ≥ 2` the cusp truncation set `S(a,b,r)` is finite of cardinality
`½(a+1)(b+1) − 1 + rab` (hesselholt-cusp-polytopes Corollary 1.6). Since `Set.ncard` vanishes on
infinite sets, the identity also asserts finiteness. -/
theorem ncard_cuspTruncationSet {a b : ℕ} (ha : 2 ≤ a) (hb : 2 ≤ b) (hab : Nat.Coprime a b)
    (r : ℕ) :
    2 * (cuspTruncationSet a b r).ncard + 2 = (a + 1) * (b + 1) + 2 * r * a * b := by
  sorry

/-- Sylvester's count: for coprime `a, b ≥ 2` the coprime part `T(a,b,r)` of the cusp truncation
set has `½(2r+1)(a−1)(b−1)` elements (hesselholt-cusp-polytopes Corollary 1.7). This is the length
over `W(k)` of `K_{2r}(k[x,y]/(y^a − x^b),(x,y))` for a perfect field `k` (hn-cusp Theorem A). -/
theorem ncard_cuspCoprimeSet {a b : ℕ} (ha : 2 ≤ a) (hb : 2 ≤ b) (hab : Nat.Coprime a b)
    (r : ℕ) :
    2 * (cuspCoprimeSet a b r).ncard = (2 * r + 1) * (a - 1) * (b - 1) := by
  sorry

/-- The number `A_d(m)` of words of length `m ≥ 1` in `d` letters with no cyclic repetition
(consecutive letters differ, and so do the last and the first) is `(d−1)^m + (−1)^m (d−1)`
(speirs-axes Lemma 33). -/
theorem card_noCyclicRepetition (d : ℕ) {m : ℕ} (hm : 1 ≤ m) :
    (((Finset.univ : Finset (Fin m → Fin d)).filter
        (fun w => ∀ i, w i ≠ w (finRotate m i))).card : ℤ) =
      ((d : ℤ) - 1) ^ m + (-1) ^ m * ((d : ℤ) - 1) := by
  sorry

end TauCetiRoadmap.RefinedTraceMethodsPartII
