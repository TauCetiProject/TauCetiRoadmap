import Mathlib

/-!
# NoncommutativeAndEquivariantIwasawa: representative target signatures

This file is not the roadmap and it is not exhaustive. The roadmap is `README.md`, which is
definitive; references of the form §k.n are to its subsections. The file records the light
definitions and the theorem signatures that can be stated against the pinned Mathlib and Tau Ceti,
with `example` checks of the kept definitions. The README also specifies the arithmetic and
localization milestones whose required carriers and comparison APIs are formalisation targets.

Design choices made explicit here:

* Tau Ceti provides the completed group algebra `Λ(G) = ℤ_p[[G]]`. Its noncommutative
  localization, relative K-theory, determinant functors and the arithmetic complexes needed here
  lack the required pinned APIs, so their statements remain README targets. The canonical set is
  defined for an arbitrary ring `A` that is a module over a ring `B` compatibly with left
  multiplication (§1.1); for `A = Λ(G)` and `B = Λ(H)` it is the set of Coates–Fukaya–Kato–
  Sujatha–Venjakob. Its one-variable case is stated on `PowerSeries ℤ_[p] ≅ Λ(ℤ_p)`.
* The carry cocycle of the twisted group ring presentation (§6.7) is recorded through its
  integer exponent: representatives `0 ≤ a < q` of `Γ/Γ^q` multiply with carry `γ^(q · carry)`.
* `Γ*(j)` (§7.15) is `Γ(j)` for `j > 0` and the residue of `Γ` at `j` for `j ≤ 0`.
-/

namespace TauCeti.NoncommIwasawa

/-! ## Layer 0: Uniform groups and Iwasawa homological foundations -/

section Augmentation

variable (p : ℕ) [Fact p.Prime] {Δ : Type*} [Group Δ]

/-- The base step of the induction showing that the augmentation ideal of `𝔽_p[Δ]` is nilpotent
for a finite `p`-group `Δ` (§§0.4, 1.8): for `z` with `z ^ p = 1`, `(z - 1) ^ p = 0` in
`𝔽_p[Δ]`. Over `ℤ_p` the same element is not nilpotent. -/
theorem of_sub_one_pow_char (z : Δ) (hz : z ^ p = 1) :
    (MonoidAlgebra.of (ZMod p) Δ z - 1) ^ p = 0 := by
  have : CharP (MonoidAlgebra (ZMod p) Δ) p :=
    charP_of_injective_algebraMap (algebraMap (ZMod p) (MonoidAlgebra (ZMod p) Δ)).injective p
  rw [sub_pow_char_of_commute p (Commute.one_right _), ← map_pow, hz, map_one, one_pow, sub_self]

end Augmentation

/-! ## Layer 1: Canonical Ore localization and torsion categories -/

section Canonical

universe u v

variable (A : Type u) (B : Type v) [Ring A] [Ring B] [Module B A] [IsScalarTower B A A]

/-- The canonical set (§1.1): the elements `f` with `A ⧸ A f` finitely generated over `B`.
For `A = Λ(G)` and `B = Λ(H)` this is the canonical Ore set `S` of CFKSV. -/
def canonicalSet : Set A :=
  {f | Module.Finite B (A ⧸ Submodule.span A ({f} : Set A))}

/-- The `π`-saturation `S* = ⋃ₙ πⁿ S` of the canonical set (§1.10). The definition makes sense
for every `π`; the Ore property of §1.10 uses `π` central (in the Iwasawa case `π = p`). -/
def saturatedSet (π : A) : Set A :=
  {f | ∃ n : ℕ, ∃ s ∈ canonicalSet A B, f = π ^ n * s}

/-- `1` lies in the canonical set: `A ⧸ A·1` is zero. -/
theorem one_mem_canonicalSet : (1 : A) ∈ canonicalSet A B := by
  show Module.Finite B (A ⧸ Submodule.span A ({1} : Set A))
  rw [show Submodule.span A ({1} : Set A) = ⊤ from Ideal.span_singleton_one]
  infer_instance

/-- The canonical set is closed under multiplication (§1.7, first step): `A s t ⊆ A t`, and
`A t ⧸ A s t` is a quotient of `A ⧸ A s`, so `A ⧸ A s t` is an extension of finitely generated
`B`-modules. No noetherian or group hypothesis is needed for this step. -/
theorem mul_mem_canonicalSet {s t : A} (hs : s ∈ canonicalSet A B) (ht : t ∈ canonicalSet A B) :
    s * t ∈ canonicalSet A B := by
  sorry

/-- The degenerate case `B = A`: every element, including `0`, lies in the canonical set; the
statement that `S` consists of nonzero divisors needs the group hypotheses of §1.7. -/
example : (0 : A) ∈ canonicalSet A A := by
  show Module.Finite A (A ⧸ Submodule.span A ({0} : Set A))
  infer_instance

/-- In `ℤ_p[[T]]` the element `p` lies in the saturation `S*`, as `p ^ 1 * 1`; by
`mem_canonicalSet_powerSeries_iff` it does not lie in `S`, so `S* ≠ S` (§1.10). -/
example (p : ℕ) [Fact p.Prime] :
    PowerSeries.C (p : ℤ_[p]) ∈
      saturatedSet (PowerSeries ℤ_[p]) ℤ_[p] (PowerSeries.C (p : ℤ_[p])) := by
  refine ⟨1, 1, ?_, by simp⟩
  show Module.Finite ℤ_[p] (PowerSeries ℤ_[p] ⧸ Submodule.span (PowerSeries ℤ_[p]) ({1} : Set _))
  have h : Submodule.span (PowerSeries ℤ_[p]) ({1} : Set (PowerSeries ℤ_[p])) = ⊤ :=
    Ideal.span_singleton_one
  rw [h]
  infer_instance

/-- The canonical set in the one-variable case `Λ(ℤ_p) ≅ ℤ_p[[T]]`, `H = 1` (§1.1, Worked
examples, example 1): `ℤ_p[[T]] ⧸ (f)` is finitely generated over `ℤ_p` exactly when `p` does not
divide `f`. In particular `T ∈ S` and `p ∉ S`, and `S` is not the set of nonzero elements. -/
theorem mem_canonicalSet_powerSeries_iff (p : ℕ) [Fact p.Prime] (f : PowerSeries ℤ_[p]) :
    f ∈ canonicalSet (PowerSeries ℤ_[p]) ℤ_[p] ↔ ¬ (PowerSeries.C (p : ℤ_[p])) ∣ f := by
  sorry

/-- In the residual one-variable algebra, the canonical denominators are exactly the nonzero
series (§1.1): a nonzero series is a unit times a power of `X`, whose quotient is finite over
`ZMod p`; the quotient by zero is infinite-dimensional. -/
theorem mem_canonicalSet_residualPowerSeries_iff (p : ℕ) [Fact p.Prime]
    (f : PowerSeries (ZMod p)) :
    f ∈ canonicalSet (PowerSeries (ZMod p)) (ZMod p) ↔ f ≠ 0 := by
  sorry

/-- In the rational polynomial algebra, the canonical denominators are exactly the nonzero
polynomials (§1.1): division gives a finite basis for their quotients, whereas the quotient by
zero retains all monomials. -/
theorem mem_canonicalSet_ratPolynomial_iff (f : Polynomial ℚ) :
    f ∈ canonicalSet (Polynomial ℚ) ℚ ↔ f ≠ 0 := by
  sorry

/-- The cyclotomic parameter is a canonical denominator: its quotient is `ℤ_p` (§1.1). -/
theorem X_mem_canonicalSet_powerSeries (p : ℕ) [Fact p.Prime] :
    PowerSeries.X ∈ canonicalSet (PowerSeries ℤ_[p]) ℤ_[p] := by
  sorry

/-- The coefficient prime is not a canonical denominator: its quotient is `𝔽_p[[T]]` (§1.1). -/
theorem prime_not_mem_canonicalSet_powerSeries (p : ℕ) [Fact p.Prime] :
    PowerSeries.C (p : ℤ_[p]) ∉ canonicalSet (PowerSeries ℤ_[p]) ℤ_[p] := by
  sorry

/-- Saturating by the coefficient prime strictly enlarges the canonical denominator set (§1.10). -/
theorem canonicalSet_ne_saturatedSet_powerSeries (p : ℕ) [Fact p.Prime] :
    canonicalSet (PowerSeries ℤ_[p]) ℤ_[p] ≠
      saturatedSet (PowerSeries ℤ_[p]) ℤ_[p] (PowerSeries.C (p : ℤ_[p])) := by
  sorry

end Canonical

/-! ## Layer 6: The main theorems for totally real fields -/

section Carry

/-- The carry exponent of the twisted group ring presentation (§6.7): for representatives
`a, b` of `Γ/Γ^q` taken in `[0, q)`, the product of the representatives of `a` and `b` is the
representative of `a + b` times `γ ^ (q * carryExponent q a b)`. -/
def carryExponent (q a b : ℕ) : ℕ :=
  (a % q + b % q) / q

/-- The carry satisfies the 2-cocycle identity on `ℤ/q` with values in `ℕ` (§6.7); it is symmetric
and vanishes when an argument is `0`, directly from the definition. -/
theorem carryExponent_cocycle (q a b c : ℕ) (hq : 0 < q) :
    carryExponent q a b + carryExponent q (a + b) c =
      carryExponent q b c + carryExponent q a (b + c) := by
  sorry

/-- The inverse pair carries once: `τ(γ̄, γ̄⁻¹) = γ^q ≠ 1` for `q = 9` (Worked examples,
example 4); a basis inverse needs this central factor. -/
example : carryExponent 9 1 8 = 1 := by decide

/-- Normalization at the identity: the representative `0` never carries. -/
example : carryExponent 9 0 8 = 0 := by decide

end Carry

/-! ## Layer 7: Descent, leading terms and Fitting invariants -/

section GammaStar

/-- `Γ*(j)` (§7.15): `(j - 1)!` for `j > 0` and the residue `(-1)^(-j) / (-j)!` of the Gamma
function at `j ≤ 0`. -/
def gammaStar (j : ℤ) : ℚ :=
  if 0 < j then ((j - 1).toNat.factorial : ℚ)
  else (-1 : ℚ) ^ (-j).toNat / ((-j).toNat.factorial : ℚ)

/-- For positive `j`, `Γ*(j)` is the value of the Gamma function. -/
theorem gammaStar_eq_Gamma (j : ℕ) (hj : 0 < j) :
    ((gammaStar j : ℚ) : ℂ) = Complex.Gamma j := by
  sorry

/-- For `j ≤ 0`, `Γ*(j)` is the residue of the Gamma function at `j`; this indexing corrects the
display in Burns–Venjakob §6.1. -/
theorem gammaStar_eq_residue (n : ℕ) :
    Filter.Tendsto (fun s : ℂ => (s + n) * Complex.Gamma s) (nhdsWithin (-(n : ℂ)) {-(n : ℂ)}ᶜ)
      (nhds ((gammaStar (-(n : ℤ)) : ℚ) : ℂ)) := by
  sorry

/-- The positive Gamma value and the even negative residue retain their distinct normalizations. -/
example : gammaStar 3 = 2 ∧ gammaStar (-2) = 1 / 2 := by
  norm_num [gammaStar, Int.toNat, Nat.factorial]

/-- At `j = -1` the residue is `-1`: this detects loss of the alternating residue sign. -/
example : gammaStar (-1) = -1 := by norm_num [gammaStar, Int.toNat, Nat.factorial]

end GammaStar

/-
The following definitions and constructions remain in the README, with their APIs and checks,
because their required carriers or comparisons are absent from the pinned APIs:

Layer 0: the compact analytic group model and its analytic structure (0.2), ordered coordinates
(0.6), finite-rank p-valuations, their saturation and the explicit valuation of a uniform group (0.7),
integral and rational ordered series (0.8), diagonal twists (0.14), and the rational and twisted
comparisons of compact group homology (0.15).
Layer 1: the finite-level algebra V (1.3), canonical Ore localization (1.11), the category
𝔐_H(G) (1.13), and localization-acyclic perfect complexes (1.14). The canonical and saturated
sets (1.1, 1.10) have real-bodied ring-level definitions above; saturatedSet_oreSet is the
README-only Ore theorem of 1.10, which requires the analytic-group and localization APIs.
Layer 2: the noncommutative determinant of perfect complexes and localized K₁ (2.7), relative
perfect-complex classes and the Ore perfect localization (2.8, 2.9), the boundary (2.10), and
characteristic elements (2.12).
Layer 3: the twist homomorphism (3.1), Artin evaluation (3.3), Akashi series (3.4), the
integrality-conjecture proposition (3.10), SK₁ and K′₁ (3.11), and the total quotient (3.12).
Layer 4: the dual Selmer module (4.1), the torsion-conjecture propositions (4.2), admissibility
and μ=0 with weak-Leopoldt overfield vanishing (4.4), the dual Galois complex (4.5), and compact-support complexes (4.6).
Layer 5: the GL₂ L-function and main-conjecture propositions (5.1, 5.2), the totally real
main-conjecture proposition (5.5), and normalized interpolation contracts (5.6).
Layer 6: twisted group rings (6.7; their carry exponent is defined above), congruence groups
(6.8), additive trace maps and ψ (6.9), relative and integral logarithms (6.11, 6.12), partial
zeta and smoothed values (6.19), and the Ritter–Weiss logarithmic pseudomeasure (6.27).
Layer 7: the Bockstein (7.1), semisimplicity and order (7.2), its trivialization (7.3), leading
terms (7.4), the global zeta proposition and fundamental line (7.9), the p-adic Stark proposition
(7.11) with Greenberg's p-adic Artin L-functions, the cyclotomic height (7.17), local epsilon maps and their conjecture (7.15; gammaStar is defined above), the
Dabrowski–Panchishkin condition and Selmer complexes (7.16), Fitting orders (7.19), integrality
rings and denominator ideals (7.20), and maximal Fitting invariants (7.21).

The homological, localization, arithmetic and main-theorem milestones on these objects likewise
remain README targets. No substitute carrier is introduced for them here.
-/

end TauCeti.NoncommIwasawa
