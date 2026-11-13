module

import Mathlib
import TauCeti.NumberTheory.NumberField.Global.HeckeCharacter.Ideal
import TauCeti.NumberTheory.NumberField.Global.HeckeCharacter.FiniteComponent

/-!
# Nonordinary CM special values: target signatures

**This file is not the roadmap.** The roadmap is `README.md`; this file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
few definitions they need.

Stated here:

* §6.5, with the forced zeros of §1.5: the parity dichotomy for central values in the
  `p`-anticyclotomic family at an inert prime `p` (`centralValue_parity_dichotomy`). Values of
  the wrong conductor parity vanish (root-number zeros), and all but finitely many values of the
  right parity are nonzero (Jia's arbitrary-class-number theorem, §6.4). The root number is not a
  pinned carrier, so the sign is an existential `ε`; it is determined, because both parities of
  the conductor exponent occur infinitely often in the family (§0.2).
* §6.1: Rohrlich's two lattice-point bounds for `p`-adic directions (`rohrlichCount_eq_zero`,
  `rohrlichCount_lt`).

Not statable at the pins:

* The BKO unit theorem (§5.4: almost every normalised value `Ω⁻¹ L_f(φ̄ν, 1)` is a `p`-adic unit)
  and the nontrivial unit witness (§5.5): the CM elliptic curve over the Hilbert class field
  attached to a Hecke character (its Frobenius or Tate-module comparison), its Néron differential,
  the comparison of a Weierstrass model over a number field with its complex period lattice
  (Mathlib's `PeriodPair` gives the invariants `g₂`, `g₃` of a lattice, with no curve attached),
  Hecke `L`-functions of non-finite-order characters and the algebraicity of their normalised
  values with a `p`-adic avatar are missing.
* Finis's theorem in weight one (§4.6): in addition, theta functions on CM lattices, Shintani
  operators, integral theta functions and Finis's local invariant `b_ℓ` are missing.
* Kato's reciprocity law for CM characters (§2.6, Kato 2004, Proposition 15.9), the height-one
  explicit reciprocity law (§2.5) and the integral BKO class (§2.7): canonical CM pairs over ray
  class fields, Iwasawa cohomology of `O_{K'}[1/p]` with the CM coefficients `T_φ^∨(1)`,
  Bloch–Kato dual exponentials and Kato's de Rham period map `per_ψ` are missing.
* Torsion-field disjointness, semilocal splitting, the inert Frobenius and the CM Lubin–Tate
  comparison (§§3.2–3.5): ring class fields are native (`TauCeti.ClassFieldTheory.ringClassField`),
  but the CM curve attached to `φ`, its torsion fields `H(E[p^{n+1}])` and Lubin–Tate formal modules
  are missing.
* The root-number formulas (§§1.1–1.4: `W(φ) = (2/D)` for a canonical character with `D` odd,
  `W(φν) = W(φ)`, the local Fröhlich–Queyrut theorem `ε(1/2, χ, ψ_E) = χ(Δ)` and
  `W(φνχ) = (−1)^c W(φν)`): local epsilon factors of quasi-characters of local fields and global
  root numbers of Hecke characters are missing.
* Jia's Galois-average limit (§6.2) and the Galois stability of central vanishing (§6.3): the action
  of `Aut(ℂ/K)` on algebraic Hecke characters is missing.
-/

open IsDedekindDomain NumberField TauCeti.GlobalNumberFields
open scoped nonZeroDivisors

namespace TauCetiRoadmap.NonordinaryCMSpecialValues

/-! ## Layer 0: characters, Euler factors and central values -/

section CentralValues

variable {K : Type*} [Field K] [NumberField K]

/-- The modulus given by the finite conductor of a Hecke character, with no real places. -/
noncomputable def conductorModulus (χ : HeckeCharacter K) : Modulus K :=
  ⟨χ.finiteConductor, χ.finiteConductor_ne_bot, ∅⟩

/-- A Hecke character `χ` of an imaginary quadratic field is *anticyclotomic* when its ideal
character inverts under complex conjugation: `χ(ā) = χ(a)⁻¹` for every fractional ideal `a`
prime to the conductor. The membership equivalence says that `b` is the conjugate of `a`. For
characters of odd finite order this is the class of ring class characters. -/
def IsAnticyclotomic [IsCMField K] (χ : HeckeCharacter K) : Prop :=
  ∀ a b : idealsPrimeTo (conductorModulus χ),
    (∀ x : K, x ∈ ((a : (FractionalIdeal (𝓞 K)⁰ K)ˣ) : FractionalIdeal (𝓞 K)⁰ K) ↔
      IsCMField.complexConj K x ∈ ((b : (FractionalIdeal (𝓞 K)⁰ K)ˣ) : FractionalIdeal (𝓞 K)⁰ K)) →
    χ.idealCharacter b = (χ.idealCharacter a)⁻¹

/-- A Hecke character `φ` of an imaginary quadratic field `K` is *conjugation-equivariant of
ideal infinity type `(1,0)`* for the embedding `ι : K → ℂ` when `φ((x)) = ι(x)` for every
`x ≡ 1` modulo its conductor, and `φ(ā) = conj φ(a)` for every ideal `a` prime to the conductor.
Equivalently (Jia, Property 1), `φ((n)) = κ_K(n) n` on rational integers prime to the conductor. -/
def IsEquivariantTypeOneZero [IsCMField K] (ι : K →+* ℂ) (φ : HeckeCharacter K) : Prop :=
  (∀ (x : Kˣ) (hx : IsCongrOne (conductorModulus φ) x),
      (φ.idealCharacter ⟨toPrincipalIdeal (𝓞 K) K x, hx.toPrincipalIdeal_mem_idealsPrimeTo⟩ : ℂ) =
        ι x) ∧
    ∀ a b : idealsPrimeTo (conductorModulus φ),
      (∀ x : K, x ∈ ((a : (FractionalIdeal (𝓞 K)⁰ K)ˣ) : FractionalIdeal (𝓞 K)⁰ K) ↔
        IsCMField.complexConj K x ∈ ((b : (FractionalIdeal (𝓞 K)⁰ K)ˣ) : FractionalIdeal (𝓞 K)⁰ K)) →
      (φ.idealCharacter b : ℂ) = star (φ.idealCharacter a : ℂ)

/-- A character of the `p`-anticyclotomic family at the prime `v`: of finite `p`-power order,
anticyclotomic, and unramified at every finite prime other than `v`. -/
def IsPAnticyclotomic [IsCMField K] (p : ℕ) (v : HeightOneSpectrum (𝓞 K))
    (χ : HeckeCharacter K) : Prop :=
  χ.IsFiniteOrder ∧ (∃ n : ℕ, orderOf χ = p ^ n) ∧ IsAnticyclotomic χ ∧
    ∀ w : HeightOneSpectrum (𝓞 K), w ≠ v → χ.conductorExponent w = 0

/-- The local factor of the primitive Hecke `L`-function at the finite prime `v`, computed with
the uniformizer `ϖ v`: `(1 − η(v) N(v)^{−s})⁻¹` if `η` is unramified at `v`, and `1` otherwise. -/
noncomputable def eulerFactor (η : HeckeCharacter K)
    (ϖ : (v : HeightOneSpectrum (𝓞 K)) → (v.adicCompletion K)ˣ)
    (v : HeightOneSpectrum (𝓞 K)) (s : ℂ) : ℂ :=
  if η.conductorExponent v = 0 then
    (1 - (η.finiteComponent v (ϖ v) : ℂ) * (Ideal.absNorm v.asIdeal : ℂ) ^ (-s))⁻¹
  else 1

/-- `z` is the central value `L(η, 1)` of a Hecke character `η` of weight one: the Euler product
of `η` converges to an entire function on `Re s > 3/2`, and that function takes the value `z`
at `s = 1`. By uniqueness of continuation, `z` is then determined by `η`. -/
def HasCentralValue (η : HeckeCharacter K)
    (ϖ : (v : HeightOneSpectrum (𝓞 K)) → (v.adicCompletion K)ˣ) (z : ℂ) : Prop :=
  ∃ F : ℂ → ℂ, Differentiable ℂ F ∧
    (∀ s : ℂ, 3 / 2 < s.re → HasProd (fun v => eulerFactor η ϖ v s) (F s)) ∧ F 1 = z

end CentralValues

/-! ## Layer 6: nonvanishing of central values -/

/-! ### Rohrlich's lattice-point bounds (§6.1) -/

section Rohrlich

/-- Elements of `Nat.Primes` are prime, so `ℤ_[p]` makes sense for them. -/
local instance factPrime (p : Nat.Primes) : Fact (p : ℕ).Prime := ⟨p.prop⟩

/-- Rohrlich's count `M(q, t)`: the number of integer pairs `(u, v)` with `|u|, |v| ≤ t` such
that, for every `p ∈ P`, `u β_p − v α_p` is nonzero and divisible by `q` in `ℤ_p`. -/
noncomputable def rohrlichCount (P : Finset Nat.Primes) (α β : (p : Nat.Primes) → ℤ_[p])
    (q : ℕ) (t : ℝ) : ℕ :=
  Set.ncard {x : ℤ × ℤ | ((|x.1| : ℤ) : ℝ) ≤ t ∧ ((|x.2| : ℤ) : ℝ) ≤ t ∧
    ∀ p ∈ P, ((x.1 : ℤ_[p]) * β p - (x.2 : ℤ_[p]) * α p) ∈ Ideal.span {(q : ℤ_[p])} ∧
      (x.1 : ℤ_[p]) * β p - (x.2 : ℤ_[p]) * α p ≠ 0}

/-- **Rohrlich's vanishing count** (Rohrlich 1984, §3, Proposition 1). For algebraic `p`-adic
directions `(α_p, β_p)`, not both zero, and every `c < 1/2`, the count `M(q, q^c)` vanishes for
all sufficiently large `q` divisible only by primes of `P`. -/
theorem rohrlichCount_eq_zero (P : Finset Nat.Primes) (α β : (p : Nat.Primes) → ℤ_[p])
    (hα : ∀ p ∈ P, IsAlgebraic ℚ (α p : ℚ_[p])) (hβ : ∀ p ∈ P, IsAlgebraic ℚ (β p : ℚ_[p]))
    (hne : ∀ p ∈ P, α p ≠ 0 ∨ β p ≠ 0) (c : ℝ) (hc : c < 1 / 2) :
    ∃ Q : ℕ, ∀ q : ℕ, Q ≤ q → (∀ r : ℕ, r.Prime → r ∣ q → ∃ p ∈ P, (p : ℕ) = r) →
      rohrlichCount P α β q ((q : ℝ) ^ c) = 0 := by
  sorry

/-- **Rohrlich's power-saving count** (Rohrlich 1984, §3, Proposition 2 and its proof). For
`1/2 < d < 3/5` and `5d/2 − 1 < s < 1/2`, `M(q, q^d) < q^s` for all sufficiently large `q`
divisible only by primes of `P`. -/
theorem rohrlichCount_lt (P : Finset Nat.Primes) (α β : (p : Nat.Primes) → ℤ_[p])
    (hα : ∀ p ∈ P, IsAlgebraic ℚ (α p : ℚ_[p])) (hβ : ∀ p ∈ P, IsAlgebraic ℚ (β p : ℚ_[p]))
    (hne : ∀ p ∈ P, α p ≠ 0 ∨ β p ≠ 0) (d s : ℝ) (hd : 1 / 2 < d) (hd' : d < 3 / 5)
    (hs : 5 * d / 2 - 1 < s) (hs' : s < 1 / 2) :
    ∃ Q : ℕ, ∀ q : ℕ, Q ≤ q → (∀ r : ℕ, r.Prime → r ∣ q → ∃ p ∈ P, (p : ℕ) = r) →
      (rohrlichCount P α β q ((q : ℝ) ^ d) : ℝ) < (q : ℝ) ^ s := by
  sorry

end Rohrlich

/-! ### The parity dichotomy (§6.5) -/

section ParityDichotomy

variable {K : Type*} [Field K] [NumberField K]

/-- **Parity dichotomy at an inert prime** (§6.5; the zeros come from §§1.4–1.5, with
Greenberg's conductor parity and the local Fröhlich–Queyrut theorem of §1.3, and the nonvanishing
from Jia's theorem (§6.4), which generalises Rohrlich's class-number-one theorem). Let `K` be
imaginary quadratic, `φ` a
conjugation-equivariant Hecke character of ideal type `(1,0)` unramified at the odd inert prime
`p`, and `ν` an anticyclotomic character of odd finite order unramified at `p`. There is a sign
`ε` (the root number of `φν`) such that, for `χ` in the `p`-anticyclotomic family with conductor
exponent `c(χ)` at `p`: if `(−1)^{c(χ)} = −ε` then `L(φνχ, 1) = 0`, and all but finitely many
`χ` with `(−1)^{c(χ)} = ε` have `L(φνχ, 1) ≠ 0`. Since `L(φ̄νχ, s) = L(φν⁻¹χ⁻¹, s)`, this is
the statement for the characters `φ̄νχ` of BKO §3 and §6. -/
theorem centralValue_parity_dichotomy [IsCMField K] [Algebra.IsQuadraticExtension ℚ K]
    (ι : K →+* ℂ) (φ ν : HeckeCharacter K) (p : ℕ) [Fact p.Prime] (hp : p ≠ 2)
    (v : HeightOneSpectrum (𝓞 K)) (hv : v.asIdeal = Ideal.span {(p : 𝓞 K)})
    (hφ : IsEquivariantTypeOneZero ι φ) (hφv : φ.conductorExponent v = 0)
    (hν : ν.IsFiniteOrder) (hνodd : Odd (orderOf ν)) (hνac : IsAnticyclotomic ν)
    (hνv : ν.conductorExponent v = 0)
    (ϖ : (w : HeightOneSpectrum (𝓞 K)) → (w.adicCompletion K)ˣ)
    (hϖ : ∀ w, Valued.v (ϖ w : w.adicCompletion K) = WithZero.exp (-1 : ℤ)) :
    ∃ ε : ℤ, (ε = 1 ∨ ε = -1) ∧
      (∀ χ : HeckeCharacter K, IsPAnticyclotomic p v χ →
        (-1 : ℤ) ^ χ.conductorExponent v = -ε → HasCentralValue (φ * ν * χ) ϖ 0) ∧
      {χ : HeckeCharacter K | IsPAnticyclotomic p v χ ∧
        (-1 : ℤ) ^ χ.conductorExponent v = ε ∧
        ¬ ∃ z : ℂ, z ≠ 0 ∧ HasCentralValue (φ * ν * χ) ϖ z}.Finite := by
  sorry

end ParityDichotomy

end TauCetiRoadmap.NonordinaryCMSpecialValues
