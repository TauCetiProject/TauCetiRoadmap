module

public import Mathlib
public import TauCeti.Geometry.RealAlgebraic.Semialgebraic.Basic

/-!
# LogicAndDefinabilityInNumberTheory: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs: eventual Ax–Kochen transfer,
Igusa–Poincaré rationality at every prime, MRDP, universal definability of the
integers in ℚ, Diophantine rational nonintegers, the integer
definition with one universal variable, Diophantine nonpowers over number fields, Koenigsmann's explicit
two-universal-variable integer formula,
Hilbert’s tenth problem over ℤ, universal-existential rational undecidability,
and parameter-uniform rational and bounded-degree counting.

Relative Denef–Pas elimination, general AKE and the transfer of Denef–Pas
sentences with coefficients lack three-sorted ac-valued structures and their
syntax adapter. Cluckers–Loeser integration, specialization
and integral transfer lack constructible motivic functions and graded pushforwards.
Dual Néron volumes lack gauge measures on Néron models;
the normic zero-cycle headline lacks normic compactifications and Brauer–Manin
pairings. Definable Chow lacks definable complex analytic spaces.
The André–Oort and CM-pair reductions lack A_g with special subvarieties and
uniformization; the mixed André–Oort reduction lacks the corresponding mixed
Shimura carriers. The period-codimension consequence lacks Hodge–Deligne systems
and their period-domain carriers. These headlines are specified in README.md.
-/

@[expose] public section

namespace TauCetiRoadmap.LogicAndDefinabilityInNumberTheory

open MvPolynomial

/-! ## Layer 1: valued-field languages and transfer -/

/-- A fixed ring sentence has the same truth in ℚ_p and 𝔽_p((t)) at all
sufficiently large primes; the bound depends on the sentence (§1.5(a), the
coefficient-free case over ℤ). The ring-language structures are any structures
compatible with the field operations; the ring language has no relation
symbols, so each is the one `FirstOrder.Ring.compatibleRingOfRing` builds. -/
theorem ax_kochen_ring (φ : FirstOrder.Language.ring.Sentence) :
    ∃ N : ℕ, ∀ (p : ℕ) [Fact p.Prime] [FirstOrder.Ring.CompatibleRing ℚ_[p]]
      [FirstOrder.Ring.CompatibleRing (LaurentSeries (ZMod p))], N < p →
      (φ.Realize ℚ_[p] ↔ φ.Realize (LaurentSeries (ZMod p))) := by sorry

/-! ## Layer 2: local constructible integration and geometric measure -/

/-- For a characteristic-zero DVR finite over ℤ_p, the congruence-counting series
of every polynomial over that DVR is rational (§2.6, Denef 1984, Theorems 1.1–1.2).
The maximal-ideal power at n=0 gives the one-element quotient. -/
theorem igusa_poincare_rationality (p : ℕ) [Fact p.Prime]
    (O : Type*) [CommRing O] [IsDomain O] [CharZero O]
    [IsDiscreteValuationRing O] [Algebra ℤ_[p] O] [Module.Finite ℤ_[p] O]
    (m : ℕ) (f : MvPolynomial (Fin m) O) :
    ∃ P Q : Polynomial ℚ, Q ≠ 0 ∧
      (Q : PowerSeries ℚ) * PowerSeries.mk (fun n =>
        (Nat.card {x : Fin m → O ⧸ (IsLocalRing.maximalIdeal O) ^ n //
          eval₂ (Ideal.Quotient.mk ((IsLocalRing.maximalIdeal O) ^ n)) x f = 0} : ℚ)) =
        (P : PowerSeries ℚ) := by sorry

/-! ## Layer 4: Diophantine normal forms and arithmetic definability -/

namespace Diophantine

/-- MRDP in the native semidecidability and Diophantine vocabulary, for finite
tuples with their existing computable encoding (Davis, §8, Theorem 8.1, p.264). -/
theorem mrdp {n : ℕ} (S : Set (Fin n → ℕ)) :
    REPred (fun x => x ∈ S) ↔ Dioph S := by sorry

end Diophantine

/-- One fixed integer-polynomial family has noncomputable integer solvability
as a predicate of its integer parameter (§4.16; Poonen, author-copy p.3). -/
theorem hilbert_tenth_integers :
    ∃ (n : ℕ) (p : MvPolynomial (Fin (n + 1)) ℤ),
      ¬ ComputablePred (fun a : ℤ =>
        ∃ x : Fin n → ℤ, eval (Fin.cons a x) p = 0) := by sorry

/-- Unary rational Diophantine sets in one-equation normal form. This reduction
of finite systems uses formal reality of ℚ and is not a convention over ℂ. -/
def rationalDiophantine (S : Set ℚ) : Prop :=
  ∃ (m : ℕ) (p : MvPolynomial (Fin (m + 1)) ℚ),
    ∀ x, x ∈ S ↔ ∃ y : Fin m → ℚ, eval (Fin.cons x y) p = 0

/-- Koenigsmann's universal integer definition: the integers, as the image of
`ℤ → ℚ`, are cut out by one universal formula with rational quantified
assignments and integer coefficients (§4.24; Koenigsmann, Theorem 1, p.74, and
Proposition 18, p.86). -/
theorem universal_integers :
    ∃ (n : ℕ) (p : MvPolynomial (Fin (n + 1)) ℤ),
      ∀ t : ℚ, t ∈ Set.range ((↑) : ℤ → ℚ) ↔
        ∀ y : Fin n → ℚ, eval₂ (Int.castRingHom ℚ) (Fin.cons t y) p ≠ 0 := by sorry

/-- Negation of the universal definition gives a Diophantine noninteger set. -/
theorem rational_nonintegers_diophantine :
    rationalDiophantine (Set.range ((↑) : ℤ → ℚ))ᶜ := by sorry

/-- One fixed universal-existential polynomial family over ℚ has a
noncomputable truth predicate on natural parameters (§4.25; Koenigsmann,
Corollaries 3 and 3′, p.74, with the one-parameter MRDP reduction). -/
theorem forall_exists_rational_undecidable :
    ∃ (k l : ℕ) (q : MvPolynomial (Fin (1 + k + l)) ℤ),
      ¬ ComputablePred (fun a : ℕ => ∀ x : Fin k → ℚ, ∃ y : Fin l → ℚ,
        eval₂ (Int.castRingHom ℚ)
          (Fin.append (Fin.append ![(a : ℚ)] x) y) q = 0) := by sorry

/-- Exactly one universal rational variable, followed by a fixed finite
existential block (Koenigsmann, Corollary 22, pp.90–91). -/
theorem one_universal_variable :
    ∃ (m : ℕ) (p : MvPolynomial (Fin (m + 2)) ℤ),
      ∀ t : ℚ, t ∈ Set.range ((↑) : ℤ → ℚ) ↔
        ∀ x : ℚ, ∃ y : Fin m → ℚ,
          eval₂ (Int.castRingHom ℚ) (Fin.cons t (Fin.cons x y)) p = 0 := by sorry

/-- Koenigsmann's explicit polynomial in two universal parameters a, b, the
rational t and seven existential coordinates (§4.33), with zero-based indices:
`(a + A)(b + A)((u₀² − B − 1)² + ((t − 2u₀)² − 4C − 4)²)`, where `A = Σ uᵢ²`,
`B = a u₁² + b u₂² − ab u₃²` and `C = a v₀² + b v₁² − ab v₂²`. -/
def twoUniversalIntegerPolynomial (a b t : ℚ) (u : Fin 4 → ℚ) (v : Fin 3 → ℚ) : ℚ :=
  let A := ∑ i, u i ^ 2
  let B := a * u 1 ^ 2 + b * u 2 ^ 2 - a * b * u 3 ^ 2
  let C := a * v 0 ^ 2 + b * v 1 ^ 2 - a * b * v 2 ^ 2
  (a + A) * (b + A) * ((u 0 ^ 2 - B - 1) ^ 2 + ((t - 2 * u 0) ^ 2 - 4 * C - 4) ^ 2)

/-- Two universal and seven existential rational variables define ℤ in ℚ by
Koenigsmann's explicit polynomial (§4.33; Koenigsmann, Step 1, p.79). -/
theorem two_universal_integer_formula (t : ℚ) :
    t ∈ Set.range ((↑) : ℤ → ℚ) ↔
      ∀ a b : ℚ, ∃ (u : Fin 4 → ℚ) (v : Fin 3 → ℚ),
        twoUniversalIntegerPolynomial a b t u v = 0 := by sorry

/-- Over every number field, the nonzero elements that are not r-th powers,
for r>1, form a Diophantine set in finite-system normal form (§4.30;
Colliot-Thélène–Van Geel, Theorem 4.3, arXiv v1, pp.16–17). -/
theorem nonpowers_diophantine (k : Type*) [Field k] [NumberField k]
    (r : ℕ) (hr : 1 < r) :
    ∃ (m s : ℕ) (p : Fin s → MvPolynomial (Fin (m + 1)) k),
      ∀ x : k, (x ≠ 0 ∧ ¬ ∃ y : k, y ^ r = x) ↔
        ∃ y : Fin m → k, ∀ j, eval (Fin.cons x y) (p j) = 0 := by sorry

/-! ## Layer 6: o-minimal geometry and counting -/

/-- An expansion of the real ordered field up to definability: order, addition
and multiplication are definable, and every definable unary set has finite
topological boundary (Mathlib `frontier`, closure minus interior). All real parameters are allowed (§6.1). -/
def IsOMinimalExpansion (L : FirstOrder.Language) [L.Structure ℝ] : Prop :=
  (Set.univ : Set ℝ).Definable L {x : Fin 2 → ℝ | x 0 < x 1} ∧
  (Set.univ : Set ℝ).Definable L {x : Fin 3 → ℝ | x 0 + x 1 = x 2} ∧
  (Set.univ : Set ℝ).Definable L {x : Fin 3 → ℝ | x 0 * x 1 = x 2} ∧
  ∀ s : Set (Fin 1 → ℝ), (Set.univ : Set ℝ).Definable L s →
    (frontier {x : ℝ | (fun _ : Fin 1 => x) ∈ s}).Finite

/-- The union of connected positive-dimensional semialgebraic subsets of X
(§6.11). A connected semialgebraic set has positive dimension precisely when
it contains two distinct points. -/
def algebraicPart {n : ℕ} (X : Set (Fin n → ℝ)) : Set (Fin n → ℝ) :=
  {x | ∃ S : Set (Fin n → ℝ), S ⊆ X ∧ TauCeti.IsSemialgebraic S ∧
    IsConnected S ∧ ¬ S.Subsingleton ∧ x ∈ S}

/-- Pila–Wilkie (§6.14): the number of rational points outside a definable
fibre's algebraic part whose coordinates all have multiplicative height at most T
is at most C T^ε, uniformly in the parameter and in T≥1 (Pila–Wilkie,
Theorems 1.8 and 1.10). On ℚ, Mathlib's `Height.mulHeight₁` is the height
max(|a|, b) of a reduced fraction a/b with b>0 (`Rat.mulHeight₁_eq_max`). -/
theorem pila_wilkie (L : FirstOrder.Language) [L.Structure ℝ]
    (hL : IsOMinimalExpansion L) (n m : ℕ)
    (X : Set (Fin (n + m) → ℝ))
    (hX : (Set.univ : Set ℝ).Definable L X)
    (ε : ℝ) (hε : 0 < ε) :
    ∃ C : ℝ, 0 < C ∧ ∀ (t : Fin m → ℝ) (T : ℝ), 1 ≤ T →
      let Xt : Set (Fin n → ℝ) := {x | Fin.append x t ∈ X}
      (({x : Fin n → ℚ | (fun i => (x i : ℝ)) ∈ Xt ∧
          (fun i => (x i : ℝ)) ∉ algebraicPart Xt ∧
          ∀ i, Height.mulHeight₁ (x i) ≤ T} : Set (Fin n → ℚ)).ncard : ℝ)
        ≤ C * T ^ ε := by sorry

/-- Algebraic points of coordinatewise degree at most k and absolute
multiplicative height at most T outside each definable fibre's algebraic part
satisfy C T^ε uniformly in the parameter and T≥1 (§6.16; Pila 2009,
Theorems 1.6 and 5.3). Explicit algebraicity excludes total-function junk values. -/
theorem bounded_degree_counting (L : FirstOrder.Language) [L.Structure ℝ]
    (hL : IsOMinimalExpansion L) (n m : ℕ)
    (X : Set (Fin (n + m) → ℝ))
    (hX : (Set.univ : Set ℝ).Definable L X)
    (k : ℕ) (hk : 1 ≤ k) (ε : ℝ) (hε : 0 < ε) :
    ∃ C : ℝ, 0 < C ∧ ∀ (t : Fin m → ℝ) (T : ℝ), 1 ≤ T →
      let Xt : Set (Fin n → ℝ) := {x | Fin.append x t ∈ X}
      (({x : Fin n → ℝ | x ∈ Xt ∧ x ∉ algebraicPart Xt ∧
          ∀ i, IsAlgebraic ℚ (x i) ∧ (minpoly ℚ (x i)).natDegree ≤ k ∧
            NumberField.absMulHeight₁ (x i) ≤ T} : Set (Fin n → ℝ)).ncard : ℝ)
        ≤ C * T ^ ε := by sorry

end TauCetiRoadmap.LogicAndDefinabilityInNumberTheory
