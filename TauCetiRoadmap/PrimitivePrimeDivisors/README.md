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
versions in a finite-group file. Native
[`Polynomial/Homogenize`](https://github.com/TauCetiProject/TauCeti/blob/d7dad3786f4cb95dbc0b2f5a2e47a989c1ebadad/TauCeti/Algebra/Polynomial/Homogenize.lean)
supplies `eval_homogenize_natDegree_of_card_roots`, giving the product of
`a-ζb` over complex roots without dividing by `b`. Reuse this for the bounds,
and the existing `TauCeti/Data/ZMod/OrderOf.lean` API for order comparisons.
Mathlib's `isRoot_cyclotomic_prime_pow_mul_iff_of_charP` supplies the
characteristic-`p` root criterion used in P1.

[Mathlib PR #28895](https://github.com/leanprover-community/mathlib4/pull/28895)
contains a full two-variable development, including a homogenized `cyclotomic₂`
and `Nat.exists_prime_orderOf_div_eq`; it closed without merging. Treat its interfaces as prior art; the integer
evaluation convention below fixes this roadmap's object and names. Adopt
Mathlib definitions if equivalent material is present. This proposal is a proof source,
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

Define the integer-valued `homogeneousCyclotomic n a b` as
`MvPolynomial.eval ![a,b] ((Polynomial.cyclotomic n ℤ).homogenize n.totient)`,
with `a,b : ℤ`, variable 0 the first input and variable 1 the second. Write
`Φ_n(a,b)` for this value. At `n=0` use `cyclotomic 0 = 1`.
For natural `a>b>0` prove positivity for `n≥1`; its natural value for
`padicValNat` is explicitly `Int.natAbs (Φ_n(a,b))`. Relate that value to
the integer evaluation before switching valuation types.

Prove evaluation at `(a,1)`, coefficient transport along ring homomorphisms,
and symmetry `Φ_n(b,a)=Φ_n(a,b)` for `n≥2`, with a minus sign for `n=1`.
Export the forms `a-b`, `a+b`, `a²+ab+b²`, `a²-ab+b²` for `n=1,2,3,6`,
and the geometric-sum form for prime powers. Prove
`a^n-b^n = ∏ d ∈ n.divisors, Φ_d(a,b)` for `n>0`, divisibility of each
factor, and coprimality of its prime divisors with `ab` for coprime inputs.

Homogenize Mathlib's expansion identities: for a prime `p` and `n≥1`,
`Φ_{np}(a,b)=Φ_n(a^p,b^p)` if `p∣n`, and
`Φ_{np}(a,b)Φ_n(a,b)=Φ_n(a^p,b^p)` otherwise. For positive `a>b`, prove
`(a-b)^φ(n)<Φ_n(a,b)` for `n≥2`,
`Φ_n(a,b)<(a+b)^φ(n)` for `n≥3`, and the non-strict upper bound for
all `n≥1`, by the root-product formula and Mathlib's evaluation bounds.

### P1: multiplicative orders and valuations

For `p` prime not dividing `a*b`, prove
`p ∣ a^k - b^k ↔ orderOf ((a : ZMod p) / b) ∣ k`.
Deduce that primitivity at `n > 0` is equivalent to this order being `n`, and
therefore `n ∣ p-1` and `n < p`. Prove the converse with the unit hypotheses.

Describe the nonprimitive primes dividing `Φ_n(a,b)`: their order is the
prime-to-`p` part of `n`, and `n` is that order times a power of `p`.
For `n ≥ 3`, prove a nonprimitive prime divisor of `Φ_n(a,b)` must be the
largest prime factor of `n` and has valuation exactly one.
For `p∤ab`, put `d=orderOf(a/b mod p)` and take `k>0`. Prove
`v_p(a^k-b^k)=0` if `d∤k`; for odd `p` and `d∣k` it equals
`v_p(a^d-b^d)+v_p(k)`. For `p=2` (so `a,b` odd), the values are
`v₂(a-b)` for odd `k`, and `v₂(a²-b²)+v₂(k)-1` for even `k`.
For `n≥1`, prove `v_p(Φ_n(a,b))` equals `v_p(a^d-b^d)` when `n=d`,
equals one when `n=d p^e`, `e≥1`, except `(p,n)=(2,2)` where it equals
`v₂(a+b)`, and is zero otherwise. Consume Mathlib's
`padicValNat.pow_sub_pow` and `pow_two_sub_pow` for the lifting steps;
prove the required natural/integer comparisons. These results are independent
of P2.

### P2: existence and exact exceptions

First prove `Φ_n(a,b) > P(n)` for `n ≥ 3`, except at `(a,b,n) = (2,1,6)`,
where `P(n)` is the largest prime factor of `n` and the cyclotomic value equals
three. This includes `a-b = 1`; the lower bound in P0 alone does not settle
that case. For `a-b≥2`, use `Φ_n>2^φ(n)≥2^{P(n)-1}≥P(n)`.
For consecutive inputs, analyze the only possible obstruction from P1:
if `Φ_n` has no primitive prime factor, write `n=p^e m`, where `p=P(n)`,
`e≥1`, `m` is the prime-to-`p` part and `m∣p-1`. This last divisibility
is justified by the residue order in P1, not asserted for arbitrary `n`.
If `e≥2`, expansion reduces to `Φ_{pm}(a^{p^{e-1}},b^{p^{e-1}})`,
whose base difference is at least three. If `e=1,m=1`, use the geometric
sum `Φ_p(a,b)=∑_{i<p}a^i b^{p-1-i}>p` (here `p≥3`). If `e=1,m≥2`,
the expansion quotient and P0 bounds give
`Φ_{pm}(a,b)>((a^p-b^p)/(a+b))^φ(m)`. Prove this exceeds `p` except
for `p=3,(a,b)=(2,1)`; `m∣p-1` then leaves `m=2`, the stated exception.
Discharge these inequalities, including the small `p=2` cases. P1 shows
that absence of primitive prime factors forces `Φ_n=P(n)`, contradicting
the estimates. For the unconditional bound at an index with a primitive
factor, use `p_primitive>n≥P(n)` and positivity/integrality.
Prove that a primitive prime divisor exists whenever neither exceptional case
holds, and prove nonexistence in each exception. Export the resulting iff
characterization of existence for all coprime `a > b > 0` and `n ≥ 2`.
Prove the exponent-one statement as well. The cyclotomic proof must discharge
its estimate and valuation prerequisites in P0–P1; a hypothesis saying that a
cyclotomic value has a primitive prime factor is not the existence theorem.

### P3: reusable corollaries

- Export the two-variable order form `∃ p, p.Prime ∧ p∤a*b ∧
  orderOf ((a : ZMod p)/b)=n` under P2's exact hypotheses.
- Specialize to `b = 1`, obtaining a prime of order exactly `n` for the residue
  of `a`, with the `n = 2` and `(a,n) = (2,6)` exceptions stated explicitly.
- Export existence for `a ≥ 3, n ≥ 3`, and for `a = 2, n ≥ 2, n ≠ 6`.
- If a prime has order `2n` on `a/b`, prove that it divides `a^n + b^n` and
  does not divide `a^k - b^k` for `0 < k < 2n`. Obtain existence by applying
  P2 at `2n` for `n>0`: the exceptions are `n=1` with `a+b` a power
  of two, and `(a,b,n)=(2,1,3)`. Do not infer order `2n` merely from
  divisibility of the sum.
- For a prime `p`, a positive base `q`, and `orderOf (q : ZMod p) = n`, prove
  `p ∣ q^k - 1 ↔ n ∣ k`. If additionally `0 < n` and `Even n`, prove
  `p ∣ q^k + 1 ↔ n/2 ∣ k ∧ ¬ n ∣ k`. First prove the equality
  criterion for any integral domain `K`: if `orderOf u=n`, `0<n`,
  and `Even n`, then `u^k=-1 ↔ n/2∣k ∧ ¬n∣k`. Derive the modular
  divisibility statement from it. Consume Mathlib's
  `orderOf_dvd_iff_pow_eq_one` and `MulEquiv.orderOf_eq` for the existing
  power-one and transport laws.


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
