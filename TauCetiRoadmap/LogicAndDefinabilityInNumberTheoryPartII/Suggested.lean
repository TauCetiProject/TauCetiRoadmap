module

import Mathlib

/-!
# Logic and definability in number theory, Part II: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti APIs: Rumely's uniform valuation rings of
global fields, Pop's sentences fixing the Kronecker dimension, Poonen's characteristic sentence,
uniform prime field and uniform algebraic dependence (whose case of one variable is his uniform
constant field), the uniform definability of geometric prime divisors in every Kronecker
dimension (Dittmann–Pop for dimension at least three, Rumely and Pop below), uniform arithmetic
normalizations, the single sentence characterizing a finitely generated integral domain among
finitely generated rings (Aschenbrenner–Khélif–Naziazeno–Scanlon), and Dittmann–Pop's single
sentence characterizing a finitely generated field among finitely generated fields.

The following headline theorems are not statable at the pins:

* the bi-interpretability of every infinite finitely generated field with the ring `ℤ`
  (Dittmann–Pop, Theorem 1.2) and of every infinite finitely generated integral domain with `ℤ`
  (AKNS, Theorem 3.1): Mathlib and Tau Ceti have first-order syntax, semantics and definability
  but no interpretations, homotopies of interpretations or bi-interpretations;
* the cohomological local–global principles of Layer 1 (Kerz–Saito's principle with prime
  coefficients, the principle in characteristic two, Kato's two-dimensional principle): Galois
  cohomology and restriction exist at the pins (Mathlib's `continuousCohomology`, with
  `ContinuousCohomology.map` along `Field.absoluteGaloisGroup.map`), but the detection statements
  restrict to the henselization `K_w` of `K` at a discrete valuation, and the pins have no
  henselized valued field: Tau Ceti's `TauCeti.Henselization.algebra` henselizes a ring along an
  ideal and is not shown to be a domain when the ring is a discrete valuation ring. The twisted
  coefficients `ℤ/ℓ(d) ≅ μ_ℓ^{⊗d}`, for a prime `ℓ` invertible in `K`, exist at the pins as Tau
  Ceti's `TauCeti.ZModTwist (TauCeti.continuousLocalCyclotomicCharacter ℓ K ^ d) 1`; the pins lack
  Kato's groups of logarithmic differentials in characteristic two and the residue maps of Kato's
  complex;
* the characteristic-two cases of Kronecker dimension above three of the divisor theorem, the
  normalization theorem and the single-sentence theorem: their hypothesis, resolution of
  singularities above `𝔽₂`, asks for smooth projective compactifications with simple normal
  crossings boundary, and the pins have no simple normal crossings divisor on a scheme (Tau
  Ceti's `TauCeti.SmoothPair.AlgebraicChart` is a normal-crossings chart on a single ring). The
  unconditional cases, characteristic different from two or Kronecker dimension at most three,
  are stated below.
-/

namespace TauCetiRoadmap.LogicAndDefinabilityInNumberTheoryPartII

open FirstOrder FirstOrder.Language

universe u

/-! ## Layer 0: uniform arithmetic predicates in finitely generated fields -/

/-- The Kronecker dimension of a field: its transcendence degree over the prime subfield, plus one
in characteristic zero (Dittmann–Pop, §1, p. 1; Poonen, Definition 2.1). This restates the notion
of QuadraticFormInvariantsPartII §5.7 on pinned carriers (README §0.1). -/
noncomputable def kroneckerDimension (K : Type u) [Field K] : Cardinal.{u} :=
  Algebra.trdeg (⊥ : Subfield K) K + if ringChar K = 0 then 1 else 0

/-- A geometric prime divisor of a field `K`: a discrete valuation ring of `K` whose residue field
has the characteristic of `K` and Kronecker dimension one less than `K` (Dittmann–Pop, §1, p. 2;
README §0.2). -/
def IsGeometricPrimeDivisor {K : Type u} [Field K] (O : ValuationSubring K) : Prop :=
  IsDiscreteValuationRing O ∧
    ringChar (IsLocalRing.ResidueField O) = ringChar K ∧
    kroneckerDimension (IsLocalRing.ResidueField O) + 1 = kroneckerDimension K

/-- **Rumely's uniform valuation rings** (Rumely, Introduction and §2; Poonen, Theorem 2.2): there
are an arity `m` and a ring formula `φ(x; y₁, …, y_m)` such that, in every global field (a
finitely generated field of Kronecker dimension one), every fibre of `φ` is empty or a valuation
subring other than the field, and every such valuation subring, the ring of a nonarchimedean place,
is a fibre (README §0.7(1)). -/
theorem exists_formula_valuationSubring_ne_top :
    ∃ (m : ℕ) (φ : Language.ring.Formula (Fin (m + 1))),
      ∀ (K : Type u) [Field K] [Field.FG K] [FirstOrder.Ring.CompatibleRing K],
        kroneckerDimension K = 1 →
        (∀ y : Fin m → K, {x : K | φ.Realize (Fin.cons x y)} = ∅ ∨
          ∃ O : ValuationSubring K, O ≠ ⊤ ∧ {x : K | φ.Realize (Fin.cons x y)} = O) ∧
        ∀ O : ValuationSubring K, O ≠ ⊤ →
          ∃ y : Fin m → K, {x : K | φ.Realize (Fin.cons x y)} = O := by
  sorry

/-- **Fixed Kronecker dimension is first-order** (Pop 2002; Poonen, Theorem 2.3): for every `n`
there is a ring sentence that holds in a finitely generated field exactly when its Kronecker
dimension is `n` (README §0.8). -/
theorem exists_sentence_kroneckerDimension_eq (n : ℕ) :
    ∃ σ : Language.ring.Sentence,
      ∀ (K : Type u) [Field K] [Field.FG K] [FirstOrder.Ring.CompatibleRing K],
        (σ.Realize K ↔ kroneckerDimension K = n) := by
  sorry

/-- **The characteristic sentence** (Poonen, Theorem 1.1): some ring sentence holds in every
finitely generated field of characteristic zero and fails in every field of positive
characteristic (README §0.10). -/
theorem exists_sentence_charZero :
    ∃ σ : Language.ring.Sentence,
      (∀ (K : Type u) [Field K] [Field.FG K] [FirstOrder.Ring.CompatibleRing K], ringChar K = 0 →
        σ.Realize K) ∧
      ∀ (K : Type u) [Field K] [FirstOrder.Ring.CompatibleRing K], ringChar K ≠ 0 →
        ¬ σ.Realize K := by
  sorry

/-- **The uniform prime field** (Poonen, Theorem 1.2): one ring formula defines, in every
infinite finitely generated field, the prime subfield (README §0.13a). Finite fields are
excluded: no formula defines `𝔽_p` in `𝔽_{p²}` for every prime `p`. -/
theorem exists_formula_mem_primeField :
    ∃ φ : Language.ring.Formula (Fin 1), ∀ (K : Type u) [Field K] [Field.FG K] [Infinite K]
      [FirstOrder.Ring.CompatibleRing K],
      ∀ x : K, φ.Realize ![x] ↔ x ∈ (⊥ : Subfield K) := by
  sorry

/-- **Uniform algebraic dependence** (Poonen, Theorem 1.4): for every `n` one ring formula in `n`
variables defines, in every finitely generated field, the `n`-tuples that are algebraically
dependent over the prime field (README §0.14). For `n = 0` the formula is false; for `n = 1` it
defines the constant field, the elements algebraic over the prime field (Poonen, Theorem 1.3;
README §0.13). -/
theorem exists_formula_not_algebraicIndependent (n : ℕ) :
    ∃ φ : Language.ring.Formula (Fin n),
      ∀ (K : Type u) [Field K] [Field.FG K] [FirstOrder.Ring.CompatibleRing K],
        ∀ x : Fin n → K, φ.Realize x ↔ ¬ AlgebraicIndependent (⊥ : Subfield K) x := by
  sorry

/-! ## Layer 5: uniform formulas for geometric prime divisors -/

/-- **Uniform definability of geometric prime divisors** (Dittmann–Pop, Theorem 1.3 for `d ≥ 3`
and Remark 4.4 for `d ≤ 2`; Pop 2017, Theorem 1.2): for every `d` there are an arity `m` and a ring
formula `φ(x; y₁, …, y_m)` such that, in every finitely generated field of Kronecker dimension `d`
whose characteristic is not two or with `d ≤ 3`, every fibre of `φ` is empty or the ring of a
geometric prime divisor, and every geometric prime divisor ring is a fibre (README §5.7). -/
theorem exists_formula_isGeometricPrimeDivisor (d : ℕ) :
    ∃ (m : ℕ) (φ : Language.ring.Formula (Fin (m + 1))),
      ∀ (K : Type u) [Field K] [Field.FG K] [FirstOrder.Ring.CompatibleRing K],
        kroneckerDimension K = d →
        (ringChar K ≠ 2 ∨ d ≤ 3) →
        (∀ y : Fin m → K, {x : K | φ.Realize (Fin.cons x y)} = ∅ ∨
          ∃ O : ValuationSubring K, IsGeometricPrimeDivisor O ∧
            {x : K | φ.Realize (Fin.cons x y)} = O) ∧
        ∀ O : ValuationSubring K, IsGeometricPrimeDivisor O →
          ∃ y : Fin m → K, {x : K | φ.Realize (Fin.cons x y)} = O := by
  sorry

/-! ## Layer 6: definable finite normalizations -/

/-- **Uniform arithmetic normalization** (Dittmann–Pop, Proposition 5.1 and Remark 5.4):
for each fixed Kronecker dimension and basis length, one formula defines the integral closure
of the prime subring adjoined the basis in every finitely generated field of that dimension,
when the characteristic is not two or the dimension is at most three (README §6.9).
The basis is over the prime subfield; the integral closure equals the arithmetic normalization
formed using the constant field, including for inseparable finite extensions. -/
theorem exists_formula_arithmeticNormalization (d e : ℕ) :
    ∃ φ : Language.ring.Formula (Fin (e + 1)),
      ∀ (K : Type u) [Field K] [Field.FG K] [FirstOrder.Ring.CompatibleRing K],
        kroneckerDimension K = d → (ringChar K ≠ 2 ∨ d ≤ 3) →
        ∀ T : Fin e → K, IsTranscendenceBasis (⊥ : Subfield K) T →
        ∀ x : K, φ.Realize (Fin.cons x T) ↔
          IsIntegral (Subring.closure (Set.range T)) x := by
  sorry

/-! ## Layer 8: single sentences for finitely generated fields -/

/-- **One sentence for a finitely generated integral domain** (Aschenbrenner–Khélif–Naziazeno–
Scanlon, Corollary 3.2): for every finitely generated integral domain `B` some ring sentence holds
in a finitely generated commutative ring exactly when that ring is isomorphic to `B`
(README §8.4). -/
theorem exists_sentence_realize_iff_nonempty_ringEquiv_of_isDomain (B : Type u) [CommRing B]
    [IsDomain B] [Algebra.FiniteType ℤ B] :
    ∃ σ : Language.ring.Sentence, ∀ (S : Type u) [CommRing S] [Algebra.FiniteType ℤ S]
      [FirstOrder.Ring.CompatibleRing S],
      (σ.Realize S ↔ Nonempty (S ≃+* B)) := by
  sorry

/-- **A single field axiom** (Dittmann–Pop, Theorem 1.1): for every finitely generated field `K`
whose characteristic is not two, or whose Kronecker dimension is at most three, some ring sentence
holds in a finitely generated field `L` exactly when `L ≅ K`; the fields `L` carry no further
hypothesis (README §8.5). -/
theorem exists_sentence_realize_iff_nonempty_ringEquiv (K : Type u) [Field K] [Field.FG K]
    (hK : ringChar K ≠ 2 ∨ kroneckerDimension K ≤ 3) :
    ∃ σ : Language.ring.Sentence,
      ∀ (L : Type u) [Field L] [Field.FG L] [FirstOrder.Ring.CompatibleRing L],
        (σ.Realize L ↔ Nonempty (L ≃+* K)) := by
  sorry

end TauCetiRoadmap.LogicAndDefinabilityInNumberTheoryPartII
