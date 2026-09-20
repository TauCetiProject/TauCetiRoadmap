# Elliptic-curve factorization: Montgomery arithmetic and ECM

Develop the algebraic correctness theory of Lenstra's elliptic-curve method (ECM),
through Montgomery stage 1 and a baby-step/giant-step stage 2, with a correspondence
proof for the Hex executable. The reusable contribution is arithmetic on the
Montgomery Kummer line, reduction modulo a divisor, and conditional factor detection.

There is no expected-runtime claim. Smooth-number estimates, distributions of curve
orders, success probabilities, asymptotic complexity, ECPP, and polynomial/FFT stage-2
extensions are outside this roadmap. Bounds here describe finite computations.

## Foundations and boundaries

Use Mathlib's `WeierstrassCurve`, `WeierstrassCurve.IsElliptic`, and
`W.toAffine.Point` with its existing additive group, together with `ZMod`, `Nat.gcd`,
`addOrderOf`, projective space, finite products, and finite-group order theorems.
Do not introduce a second elliptic-curve group law or a private notion of divisibility.
Tau Ceti's
[`PointCount.lean`](https://github.com/TauCetiProject/TauCeti/blob/main/TauCeti/AlgebraicGeometry/EllipticCurve/PointCount.lean)
provides `WeierstrassCurve.pointCount` and its comparison with `Nat.card` of the point
group; consume that API for the group-order corollaries.

The [elliptic-curves roadmap](../EllipticCurves/README.md) owns abstract elliptic-curve
theory, including Hasse in Layer 3 and the quadratic degree form in Layer 1. Hasse is
not a dependency of any milestone here: finite-group divisibility gives the required
conditional statements. No addition to that roadmap is required for ECM.

Suggested homes are `TauCeti/AlgebraicGeometry/EllipticCurve/Montgomery/` for the curve
and Kummer API, and `TauCeti/NumberTheory/Factorization/ECM/` for modular algorithms.
The concrete Hex comparison belongs in Hex's Mathlib bridge, where both the executable
and Tau Ceti can be imported; it is a required downstream deliverable of milestone 12.
Tau Ceti itself must not acquire a dependency on Hex.

## Conventions

- Work with `B y² = x³ + A x² + x`, with `2`, `B`, and `A² − 4` nonzero over a
  field. Polynomial formulas also live over commutative rings, without silently
  assigning them elliptic-curve semantics over a composite modulus.
- Convert to the monic Weierstrass equation by `x' = Bx`, `y' = B²y`:
  `y'² = x'³ + AB x'² + B²x'`. Thus the coefficients are
  `(a₁,a₂,a₃,a₄,a₆) = (0,AB,0,B²,0)` and the discriminant is
  `16 B⁶ (A² − 4)`.
- Write a raw coordinate pair as `(X,Z)`, representing `x = X/Z`, with infinity
  `(1,0)`. A pair denotes a point of the projective line only when it is nonzero.
  `(0,0)` is invalid, never infinity. Scaling invariance over a field requires a
  nonzero scale; over a ring require a unit when asserting projective equivalence.
- Use `A24 = (A+2)/4`. The scaled executable carries `N,D` with `N/D = A24`.
  Keep this convention fixed; the `(A−2)/4` formulas have a different doubling term.
- A stage bound means `M(B₁) = lcm(1,…,B₁)`, with empty lcm `1`. Equivalently it is
  the product of the largest prime powers at most `B₁`. “Smooth enough” means
  `addOrderOf P ∣ M(B₁)`, not merely that its prime divisors are at most `B₁`.
- The algorithm has three distinct gcd outcomes: `1`, a proper factor, and `n`.
  Exhausting a bounded search proves nothing about primality or the absence of factors.

## Milestones

### 1. Montgomery models and nonsingularity

Define the model above and its affine/projective equations. Prove the discriminant
identity and the nonsingularity criterion in odd characteristic. Provide coefficient
extensionality, ring-map compatibility, and the basic equation and discriminant API.
The assumptions `B ≠ 0` and `A² ≠ 4` must occur in geometric theorems; polynomial
identities need neither. Supply examples of a nonsingular and a singular model.

### 2. Comparison with Weierstrass points

Construct the coordinate conversion above and its inverse over fields with `B ≠ 0`,
including infinity. Prove preservation/reflection of the equation and nonsingularity,
and identify the Montgomery point group with the existing Weierstrass point group.
Define its operations by transport, prove the coordinate formulas, and prove the
comparison commutes with field embeddings. No square root of `B` is needed.

### 3. The Kummer line and the x-coordinate map

Construct the map sending a curve point to `(x:1)` and infinity to `(1:0)` in
`Projectivization K (Fin 2 → K)`. Prove its fibres are exactly `{P,−P}` and its
compatibility with scalar multiplication and field embeddings. Identify the quotient
by sign with its image; do not assert that every `K`-rational projective-line point
lifts to this particular curve over `K`. Give the affine-chart, infinity,
cross-product-equality, and change-of-representative lemmas. Use scalar extension
when a geometric quotient statement requires an algebraically closed field.

### 4. Differential addition and doubling

Define the following polynomial operations on raw pairs, and prove homogeneity and
compatibility with ring maps. For doubling put `U=(X+Z)²`, `V=(X−Z)²`, `C=U−V`:

```
xDBL(X,Z) = (D U V, C (D V + N C)).
```

For pairs `P,Q,R` representing points with `R=P−Q`, put
`a=(X_P+Z_P)(X_Q−Z_Q)` and `b=(X_P−Z_P)(X_Q+Z_Q)`:

```
xADD(P,Q,R) = (Z_R (a+b)², X_R (a−b)²).
```

Prove these represent doubling and addition when the output pair is nonzero,
with `D ≠ 0` and `N/D=(A+2)/4` for doubling. Establish the exact vanishing locus
of each output on valid inputs. In particular differential addition is not a total
operation at a zero or order-two difference. Provide explicit exceptional-case lemmas
and a checked interface reporting an invalid pair, rather than quotienting `(0,0)`.
The cleared-coordinate identities, including degenerate outputs, are separate lemmas.

### 5. Montgomery ladder

Define a finite binary ladder maintaining the pair `([k]P,[k+1]P)` and fixed
difference `P`, with explicit zero and one cases. Prove the bit-step invariant and
termination, then the scalar-multiplication theorem on regular traces: every pair
used as a projective point is nonzero and the differential-addition hypotheses of
milestone 4 hold. Define regularity from those concrete intermediate tests, not as
an opaque proposition asserting the desired answer. Prove an alternative theorem
that a failed checked trace identifies a precise exceptional step. Establish usable
sufficient conditions and dedicated infinity/order-two cases, so the regularity
hypothesis is not left as an unexamined assumption. The raw ladder used by Hex is
related to this checked ladder on regular traces in milestone 12.

### 6. Suyama parameterization

For a parameter `σ`, set

```
u = σ²−5,  v = 4σ,
x = u³/v³,
c = (v−u)³(3u+v),  d = 4u³v,
A = c/d − 2,  B = x³ + A x² + x.
```

Prove that `(x,1)` is on `B y² = x³ + A x² + x`, and `(u³:v³)` is its
Kummer coordinate whenever the denominators are nonzero. Derive the explicit
polynomial exceptional conditions on `σ` for `uvB(A²−4)=0`, including small odd
characteristics, and prove ellipticity outside them. Relate `N=c`, `D=4d` to the
scaled doubling convention. Distinguish denominator invertibility from nonsingularity:
`gcd(d,n)=1` alone does not certify an elliptic reduction. Prove these statements
without assuming a rational square root exists or that every parameter is admissible.
Torsion-distribution and probability claims about this family are outside the scope.

### 7. Reduction modulo a prime divisor

For `p.Prime` and `p ∣ n`, construct/use the canonical map `ZMod n →+* ZMod p`.
Prove that setup expressions, raw pair operations, ladder traces and finite products
commute with this map. Connect reduced natural-number representatives with residues,
including modular subtraction. Attach geometric meaning only at a prime where the
curve is nonsingular and the trace is regular. Keep `n > 1`, odd `p`, and denominator
conditions visible; no field instance on `ZMod n` is allowed without primality.

### 8. Denominators and factor extraction

Develop the reusable gcd classification API. For an integer or natural representative
`t`, prove `p ∣ gcd(t,n)` iff `t=0` modulo `p` when `p ∣ n`. Prove a gcd is a proper
factor under the explicit conditions `1 < gcd(t,n)` and `gcd(t,n) < n`; a useful
sufficient condition is vanishing modulo one prime divisor and nonvanishing modulo
another. Include prime powers and repeated factors without claiming that reduction
modulo primes detects all their multiplicities. Apply this to setup denominators,
discriminant/exception tests, and final `Z` coordinates. If an exceptional test gives
`gcd=n`, the outcome is inconclusive, not a factor.

### 9. Conditional stage-1 detection

Prove the prime-power-product expression for `M(B₁)` and its divisibility API, then
prove the sequential prime-power ladder computes `[M(B₁)]P` on regular traces.
Derive `[M(B₁)]P=0` from `addOrderOf P ∣ M(B₁)`, and the corollary using
`#E(F_p) ∣ M(B₁)` from finite-group order divisibility. Conclude that the final
`Z` vanishes modulo `p`; conclude a proper factor only with the gcd condition in
milestone 8. Also account for a checked trace that stops at an exceptional step.
No statement may turn “all prime factors of the order are small” into the stronger
prime-power divisibility assumption, or turn annihilation modulo every factor into
a proper-factor guarantee.

### 10. Baby-step/giant-step stage 2

Fix finite bounds `B₁ < B₂`, a positive even stride `D`, and a finite schedule
covering every prime `q` in `(B₁,B₂]`: either handle `q ∣ D` directly, or produce
indices `i,j` with `q=iD+j` or `q=iD−j` and `0<j≤D/2`. Construct that schedule
and prove coverage; handle signs in integers before interpreting scalar multiples.
For `Q=[M(B₁)]P`, build baby points `[j]Q` and giant points `[iD]Q` using the
proved ladder/recurrences, with the same regularity and exceptional-case accounting.

Prove that if `[q]Q=0` then the pair has equal Kummer coordinates, hence
`X_i Z_j − X_j Z_i=0`. Prove the converse as the disjunction
`[iD−j]Q=0 ∨ [iD+j]Q=0`, on valid pairs. Treat infinity explicitly. Multiply
these cross differences and the direct-case denominators. Prove detection when
`addOrderOf P ∣ M(B₁)*q` for a covered prime `q`, with `Q ≠ 0` for a genuine
stage-2 continuation; stage 1 accounts for `Q=0`. Give the corresponding
curve-order corollary. These are algebraic detection theorems, with the proper-factor
qualification from milestone 8, not unconditional search-success theorems.

### 11. Batched gcd and recovery

For a finite list of residues, define product accumulation modulo `n` and a balanced
product tree retaining the leaves. Prove equality with the full product and
`p ∣ product ↔ ∃ leaf, p ∣ leaf` for prime `p ∣ n`, including the empty list.
Define terminating recursive recovery: prune gcd-one nodes, return proper gcds,
and split gcd-`n` nodes; a gcd-`n` leaf is inconclusive. Prove soundness and that
recovery finds a proper factor whenever some leaf has a proper gcd. Do not claim
that a root gcd of `n` ensures recovery: a singleton zero residue is a counterexample.
Prove the detection theorem survives batching and record the exact failure cases.
This API should also support Pollard `p−1` stage 2 without elliptic-curve assumptions.

### 12. Hex correspondence and acceptance examples

Give Tau Ceti executable reference definitions for the setup, ladder, stage-1 schedule,
stage-2 schedule, and recovery just specified. In Hex's Mathlib bridge, import those
definitions and compare them to the actual executable functions, including the natural
backend, machine-word Montgomery representation, encoding/decoding, reducedness bounds,
and backend fallback. Prove arithmetic refinement before geometric correctness.
If an internal executable is private, expose a small stable interface in Hex rather
than copy it into a theorem and call the copy a correspondence proof.

Prove the stage-1 comparison with Hex's effective bound (including its prime-table
cap), deterministic parameter schedule and all three result constructors. Instantiate
the conditional geometric theorems at admissible parameters and regular traces;
preserve the existing unconditional theorem that every returned factor is a proper
divisor even for singular parameters or exceptional traces. The stage-2 deliverable
includes the executable Hex continuation and its bridge, consuming milestones 10–11.
The roadmap therefore does not silently assume that a Hex stage-2 function exists.

Require kernel-checked worked examples covering: a nonsingular Suyama setup; a
setup factor; a regular stage-1 annihilation yielding a proper factor; a genuine
stage-2 extra-prime detection; `gcd=1`; `gcd=n`; recovery of a factor hidden by a
whole-modulus batch; an unrecoverable zero leaf; a singular parameter with invertible
setup denominator; and an invalid differential-addition pair. Show both backend
comparisons on overlapping supported inputs, and the natural route beyond the word
range. These examples supplement the universal theorems; they do not replace them.

## Dependencies and references

Milestones 1–6 construct the geometric API; 7–8 connect it to arithmetic modulo a
composite; 9 and 10 give conditional detection; 11 is independent generic gcd theory;
12 integrates the results. Stage 2 uses 9's scalar-multiplication theory but does not
assume that stage 1 found a factor.

- H. W. Lenstra Jr., [Factoring integers with elliptic curves](https://annals.math.princeton.edu/1987/126-3/p09),
  *Annals of Mathematics* 126 (1987), 649–673: the algebraic method.
- P. L. Montgomery, [Speeding the Pollard and elliptic curve methods of factorization](https://doi.org/10.1090/S0025-5718-1987-0866113-7),
  *Mathematics of Computation* 48 (1987), 243–264: Montgomery arithmetic and continuation.
- D. J. Bernstein and T. Lange, [Explicit-Formulas Database: Montgomery curves](https://www.hyperelliptic.org/EFD/g1p/auto-montgom-xz.html):
  coordinate formulas and their hypotheses.
- [GMP-ECM](https://gitlab.inria.fr/zimmerma/ecm): Suyama parameterization and practical
  stage-2 conventions; a reference for mathematics and design, not code to copy.
- [Hex ECM stage 1](https://github.com/kim-em/hex-dev/blob/main/HexIntFactor/Ecm.lean):
  the downstream executable and existing dynamically checked factor theorem.

### Mathlib alignment

The [elliptic-curve point-coordinate PR](https://github.com/leanprover-community/mathlib4/pull/26078)
and [scalar-multiplication formula PR](https://github.com/leanprover-community/mathlib4/pull/13782)
are relevant API precedents. Match their coordinate and scalar-multiplication interfaces
where applicable; build needed bridges in Tau Ceti and replace duplicates with imports
when Mathlib supplies them. The scheme development is not needed for these point-level
statements. The Montgomery model and its arithmetic are owned by this roadmap;
the abstract curve and finite-group theories are consumed, not redefined.
