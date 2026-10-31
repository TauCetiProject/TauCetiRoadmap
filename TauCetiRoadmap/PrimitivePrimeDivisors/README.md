# Roadmap: primitive prime divisors and the Bang–Zsigmondy theorem

For coprime natural numbers `a > b > 0`, a primitive prime divisor of `a^n - b^n`
is a prime dividing that difference and none of `a^k - b^k` for `0 < k < n`.
Develop the cyclotomic and valuation theory of these divisors, and prove the
Bang–Zsigmondy theorem with its exact exceptions. The principal applications are
multiplicative orders over finite fields and divisibility of finite linear-group
orders. The theorem is arithmetic and has no dependency on finite simple groups.

Suggested home: `TauCeti/NumberTheory/PrimitivePrimeDivisors/`, with polynomial
lemmas in `TauCeti/RingTheory/Polynomial/Cyclotomic/`.

## Starting points and ownership

Mathlib supplies `Polynomial.cyclotomic`, its factorization of `X^n - 1`,
`Polynomial.homogenize`, `MvPolynomial`, `padicValNat`, `padicValInt`, lifting the
exponent, `Nat.Coprime`, `Nat.ModEq`, `ZMod` and `orderOf`. Use these definitions.
Search their current APIs before adding a lemma; in particular use the existing
cyclotomic evaluation bounds and valuation lemmas rather than proving private
versions in a finite-group file.

[Mathlib PR #28895](https://github.com/leanprover-community/mathlib4/pull/28895)
contains a full two-variable development, including a homogenized `cyclotomic₂`
and `Nat.exists_prime_orderOf_div_eq`; it closed without merging. Follow its
mathematical interfaces and the current homogenization API, adopting Mathlib's
definitions if equivalent material is present. This proposal is a proof source,
not a reason to wait for another PR. The
[Zulip discussion](https://leanprover.zulipchat.com/#narrow/channel/217875-Is-there-code-for-X.3F/topic/Zsigmondy's.20theorem/with/535984787)
records that source. Coordinate with its author before adapting code, following
the repository's porting guidance.

This roadmap owns primitive divisors of differences of powers of coprime positive
integers, the corresponding order and valuation results, and the corollaries
below. It does not own the orders or recognition of groups of Lie type. Lucas
and Lehmer sequences beyond differences of powers are outside its scope.

## Conventions

Use `a b n p : ℕ`, `0 < b`, `b < a`, `a.Coprime b`, and `2 ≤ n` for the main
theorem. State primitivity directly as
`p.Prime ∧ p ∣ a^n - b^n ∧ ∀ k, 0 < k → k < n → ¬ p ∣ a^k - b^k`.
When using integers, state `p ∣ (a : ℤ)^n - (b : ℤ)^n`; transport to the natural
difference using `b ≤ a`. No truncated-subtraction identity is used without that
inequality. At primes not dividing `a*b`, use `orderOf ((a : ZMod p) / b)`;
record that both residues are units before invoking order lemmas.

The two exceptional cases for `n ≥ 2` are exactly:

1. `n = 2` and `a + b` is a power of two;
2. `(a, b, n) = (2, 1, 6)`.

The positive hypotheses force a power of two in case 1 to be at least four.
The exponent-one case is separate: a primitive prime divisor exists precisely
when `1 < a - b`. Do not confuse a prime primitive divisor with a primitive
prime-power divisor or with an arbitrary prime divisor of a cyclotomic value.

## Milestones

| Layer | Inputs | Deliverable |
| --- | --- | --- |
| P0 | Mathlib cyclotomic polynomials and homogenization | homogeneous cyclotomic evaluations and factorization |
| P1 | P0, finite fields, lifting the exponent | order and exact valuation criteria |
| P2 | P0–P1, cyclotomic evaluation bounds | Bang–Zsigmondy with both exceptions and their converses |
| P3 | P1–P2 | natural, integer, modular-order and finite-field corollaries |

### P0: homogeneous cyclotomic arithmetic

Construct the degree-`φ(n)` homogenization `Φ_n(X,Y)` of `Polynomial.cyclotomic n ℤ`
using Mathlib's homogenization; at `n = 0` use Mathlib's `cyclotomic 0 = 1`.
Prove its evaluation
at `(a,1)`, symmetry with the correct small-index signs, coefficient and base-change
formulas, and
`a^n - b^n = ∏ d ∈ n.divisors, Φ_d(a,b)` for `n > 0`.
Prove each factor divides the difference, and the coprimality of any prime divisor
of `Φ_n(a,b)` with `a*b` when `a` and `b` are coprime. For `a > b > 0`, prove
`(a-b)^φ(n) < Φ_n(a,b)` for `n ≥ 2`, and
`Φ_n(a,b) < (a+b)^φ(n)` for `n ≥ 3`, by homogenizing Mathlib's cyclotomic
evaluation bounds. Include `n = 1, 2, 3, 6` and powers of a prime. The estimate
for consecutive `a,b` needed by P2 is a separate target there.

### P1: multiplicative orders and valuations

For `p` prime not dividing `a*b`, prove
`p ∣ a^k - b^k ↔ orderOf ((a : ZMod p) / b) ∣ k`.
Deduce that primitivity at `n > 0` is equivalent to this order being `n`, and
therefore `n ∣ p-1` and `n < p`. Prove the converse with the unit hypotheses.

Describe the nonprimitive primes dividing `Φ_n(a,b)`: their order is the
prime-to-`p` part of `n`, and `n` is that order times a power of `p`.
For `n ≥ 3`, prove a nonprimitive prime divisor of `Φ_n(a,b)` must be the
largest prime factor of `n` and has valuation exactly one. Compute the other
valuations by lifting the exponent; separate `p = 2`, `n = 1,2`,
and higher powers of two. Supply exact valuation formulas, not only bounds,
and comparisons between natural and integer valuations. These results must be
usable independently of P2.

### P2: existence and exact exceptions

First prove `Φ_n(a,b) > P(n)` for `n ≥ 3`, except at `(a,b,n) = (2,1,6)`,
where `P(n)` is the largest prime factor of `n` and the cyclotomic value equals
three. This includes `a-b = 1`; the lower bound in P0 alone does not settle
that case. Prove the additional cyclotomic estimates and finite small-index
checks needed for this bound. P1 then shows that an absence of primitive
prime factors would force `Φ_n(a,b) = P(n)`, a contradiction.
Prove that a primitive prime divisor exists whenever neither exceptional case
holds, and prove nonexistence in each exception. Export the resulting iff
characterization of existence for all coprime `a > b > 0` and `n ≥ 2`.
Prove the exponent-one statement as well. The cyclotomic proof must discharge
its estimate and valuation prerequisites in P0–P1; a hypothesis saying that a
cyclotomic value has a primitive prime factor is not the existence theorem.

### P3: reusable corollaries

- Specialize to `b = 1`, obtaining a prime of order exactly `n` for the residue
  of `a`, with the `n = 2` and `(a,n) = (2,6)` exceptions stated explicitly.
- Export existence for `a ≥ 3, n ≥ 3`, and for `a = 2, n ≥ 2, n ≠ 6`.
- If a prime has order `2n` on `a/b`, prove that it divides `a^n + b^n` and
  does not divide `a^k - b^k` for `0 < k < 2n`. Obtain existence by applying
  P2 at `2n`, retaining its exceptions. Do not infer order `2n` merely from
  divisibility of the sum.
- For a prime `p`, a positive base `q`, and `orderOf (q : ZMod p) = n`, prove
  `p ∣ q^k - 1 ↔ n ∣ k`. If additionally `0 < n` and `Even n`, prove
  `p ∣ q^k + 1 ↔ n/2 ∣ k ∧ ¬ n ∣ k`. For a unit `u : (ZMod p)ˣ`, export
  the equivalent criterion `u^k = 1 ↔ orderOf u ∣ k`, and its `-1` analogue
  when the order is positive and even. Transport these equality statements
  along multiplicative group equivalences induced by field isomorphisms.
  Finite classical-group files consume these arithmetic exports.

## Checks

Include worked proofs of existence at `(a,b,n) = (3,1,3), (2,1,5), (3,2,6)`;
nonexistence at `(3,1,2), (7,1,2), (2,1,6)`; and the exponent-one contrast
between `(3,2)` and `(5,2)`. Verify the order of the supplied prime in each
positive example. These distinguish the actual exceptions and the natural
subtraction convention.

## References and provenance

- K. Zsigmondy, *Zur Theorie der Potenzreste*, Monatshefte für Mathematik und
  Physik 3 (1892), 265–284.
- A. S. Bang, *Taltheoretiske Undersøgelser*, Tidsskrift for Mathematik, series 5,
  4 (1886), 70–80, 130–137.
- [Mathlib #28895](https://github.com/leanprover-community/mathlib4/pull/28895),
  including its prerequisites and proposed natural-number order interfaces.
- Axiom's [general base at least three proof](https://github.com/AxiomMath/CFSG/blob/69cb972f587a3ecc035e092253167ff2e303c962/CFSG/LinearAlgebra/SL2MinimalFaithfulZsigmondy.lean#L150)
  and [base-two proof](https://github.com/AxiomMath/CFSG/blob/69cb972f587a3ecc035e092253167ff2e303c962/CFSG/Timmesfeld/Orders/Bang.lean#L230)
  prove the P3 specializations. They are secondary sources; P0–P3 specify the
  mathematics and its scope independently of those implementations.
