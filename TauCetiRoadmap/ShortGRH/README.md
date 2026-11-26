# Riemann hypothesis for Dirichlet L-functions: the route of the shorter formal proof

A family of roadmaps whose end theorem is the generalized Riemann hypothesis (GRH), that is, the
Riemann hypothesis for Dirichlet L-functions: for every modulus `N ≥ 1`, every Dirichlet character
`χ` modulo `N` and every `s` with `Re s > 1/2`, `L(s, χ) ≠ 0` unless `χ` is principal and `s = 1`;
with the functional equation, every zero of `L(s, χ)` with `0 < Re s < 1` then lies on the line
`Re s = 1/2`. For the trivial character this is the Riemann hypothesis for the Riemann zeta
function, Mathlib's `RiemannHypothesis`.

The family states the route of a formal Lean proof of these theorems, cited in its roadmaps as
`[ShortProof]`: the folder `grh` of the repository <https://github.com/lsernau/grh-lean> at commit
`72fead102f663d5c7a407964a13dc0cf9d977207`
([the Lean source at that commit](https://github.com/lsernau/grh-lean/tree/72fead102f663d5c7a407964a13dc0cf9d977207/grh)).
The roadmaps name its files by their path under `grh/src/` (for example
`New/Reduction/MainInequality.lean`; some roadmaps omit the extension `.lean`), with the declarations
in parentheses. Its README describes it
as a rewriting, by the same method, of the formal proof whose route the family
[RiemannHypothesisForDirichletLFunctions](../RiemannHypothesisForDirichletLFunctions/README.md)
states ([announcement](https://alpo.ge/remark.pdf)), with many steps proved by other arguments; it
has about 300,000 lines of Lean, is distributed under the Apache 2.0 licence, and proves the same
five theorems: Mathlib's `RiemannHypothesis`; the same statement written out, every zero `s ≠ 1` of
`ζ` other than `−2, −4, …` has real part `1/2`; `L(s, χ) ≠ 0` for every Dirichlet character `χ` and
every `s` with `Re s > 1/2`, except at `s = 1` for a principal character; every zero of `L(s, χ)`
with `0 < Re s < 1` has real part `1/2`; and the case of primitive `χ` of the last.

The family shares with RiemannHypothesisForDirichletLFunctions its end theorems and its general
method, an upper bound for a sum over primes obtained by comparing the sizes and the divisibility of
theta lifts between unitary groups, and departs from it in the set-up. Its end theorems are those of
GeneralizedRiemannHypothesisFromWindowBounds §§5.1–5.3, the roadmap of that family that states them
(the five theorems above are its §5.2 and the value and strip forms of its §5.3).
OneSidedPrimeSumBoundsAndAdmissibleData §§6.3 and 6.4 state them as the targets that this route
reaches: the value form, the predicate form `χ.GeneralizedRiemannHypothesis`, the strip form, and
Mathlib's `RiemannHypothesis`. The further forms and consequences that
GeneralizedRiemannHypothesisFromWindowBounds draws from them stay there. Where a section of
RiemannHypothesisForDirichletLFunctions or of a general roadmap of the library states a result that
this route uses, the roadmaps of this family cite that section rather than state the result again.
Among the differences of set-up: the analytic reduction asks for an upper bound for one weighted
sum over primes at all large values of its length, where the reduction of
RiemannHypothesisForDirichletLFunctions asks for bounds on windows `[Y, Y^λ]`; and the bound is read
off from an upper and a lower bound for one covolume of a lattice of theta lifts.

Each subdirectory is a roadmap of its own, with a definitive `README.md`; some have a
`Suggested.lean` for target signatures. This page is the index of the family. Citations between the
roadmaps are by section number, `<Roadmap> §k.n`, so the number of a section is part of its
statement: a section keeps its number.

## The proof in outline

The proof bounds one weighted sum over primes from above. An analytic criterion turns that bound
into the theorem; the bound itself comes from an inequality between an upper and a lower bound for
the size of integral automorphic forms.

### A one-sided criterion

Fix a modulus `q₀` and a prime `d ≡ 7 (mod 8)` prime to `q₀`, and let `χ_K = (·/d)` be the
quadratic character of `K = ℚ(√−d)`. Put `λ(n) = Λ(n)·(1 − χ_K(n))` for `n ≡ 1 (mod q₀)` and
`λ(n) = 0` otherwise, with `Λ` the von Mangoldt function. This weight is nonnegative: on the
integers `n ≡ 1 (mod q₀)` it is `2 log p` at the odd powers of a prime `p` inert in `K`, `log d` at
the powers of `d`, and `0` at the others. The remainder
`R_{q₀}(x) = Σ_{n ≤ x} λ(n)·(1/n − 1/x) − log x/φ(q₀) − c`
is the smoothed count of these prime powers less its main term, with the constant `c` for which
`R_{q₀}(x) → 0`. By orthogonality of characters, the transform `∫₀^∞ R_{q₀}(e^v)·e^{(1−s)v} dv`
continues to `Re s > 0` with at most simple poles. A zero of some `L(s, ψ)`, `ψ` modulo `q₀`, gives
a pole whose residue at a real point is positive; a zero of some twist `L(s, ψ·χ_K)` gives one of
the opposite sign.

The criterion: let `q₀` be a multiple of `8`, let `d₀ ≡ 7 (mod 8)` be prime to `q₀`, and let
`β > 1/2`. If for every prime `d ≡ d₀ (mod q₀)` the bound `R_{q₀}(x) ≤ x^{β−1}` holds for all
large `x`, then no `L(s, ψ)` with `ψ` modulo `q₀` vanishes at a point `ρ ≠ 1` with `Re ρ > β`. For
such a `ρ` one chooses `d` in the class so that no twist `L(s, ψ·χ_K)` vanishes in the box
`Re s ≥ β`, `|Im s| ≤ |Im ρ|`; such primes exist by a zero-density count for quadratic twists,
which `[ShortProof]` proves with theta series and the Pólya–Vinogradov inequality. In that box the
residues at real points are nonnegative, and Landau's lemma, applied to the transform of a function
bounded on one side, shows that the residue at `ρ` vanishes, so that `ρ` is not a zero of any
`L(s, ψ)`. Only an upper bound for `R_{q₀}` is used.

### The prime sums at one length

Fix a small `ε > 0`. To bound `R_{q₀}(x)` at a large integer `x`, the proof builds data that grow
with `x`. The field is
`E = K(ζ)`, with `ζ` a root of unity of an order `q₁` that is a multiple of `q₀` and grows like a
power of `x`. It is a CM field, abelian over `ℚ`, and its infinite places form a group isomorphic
to `Gal(E/K) ≅ (ℤ/q₁)ˣ`; an integer `n` prime to `q₁` moves a place `τ` to a place `nτ`. There are
scales `x ≤ x₁ ≤ b` with `x^{10⁶} ≤ x₁`, `x₁^{10⁶} ≤ b` and `log b ≤ 2x^ε`, and the order
`a = x·b`. Two sets of places carry the argument: the `a`-places, those congruent to `1` modulo
`q₀`, and a sparse set of `b`-places congruent to `−1` modulo `q₀`, built after Behrend's
construction. Every place `σ` has a weight `κ(σ)`, equal to `b` at the `b`-places and to `a/x₁`
elsewhere. For an order `y` and a place `τ` the prime sum is
`s_fin(y, τ) = Σ_{n ≤ a} Λ(n)·(1 − χ_K(n))·(y/n − κ(−nτ))₊`,
where `z₊ = max(z, 0)`. At an `a`-place `τ` and `y = a`, a prime power `n` is counted up to `x` when
`−nτ` is a `b`-place, which requires `n ≡ 1 (mod q₀)`, and up to `x₁` otherwise. The mean of these
sums over the set `Φ_a` of `a`-places has the expected value `s_main = a·(log(a/κ̄) + c₁)`, where
`κ̄` is the geometric mean of the weights and `c₁ = −1 − γ + Re (L′/L)(1, χ_K)`, with `γ` Euler's
constant. The excess, summed over `Φ_a`, is
`rem = Σ_{τ ∈ Φ_a} (s_fin(a, τ) − s_main) = a·(#Φ_b·(R_{q₀}(x) − R_{q₀}(x₁)) + #Φ_a·R₁(x₁))`,
with `Φ_b` the set of `b`-places and `R₁` the remainder for the modulus `1`. The prime number
theorem in progressions, with a saving of every power of the logarithm, makes the terms at `x₁`
negligible, so an upper bound for `rem` is an upper bound for `R_{q₀}(x)`.

### The main inequality

The data also fix the number `m` of theta lifts, a power of `2` between `√x` and `2√x`, and the
ranks `r`, of size about `x⁵`, and `k = r + 1 − m` of the Hermitian spaces. The main inequality is
`m·rem ≤ f·a·(log b)⁵`, with `f` the number of infinite places of `E`. Dividing by `m·a·#Φ_b`, with
`#Φ_a ≤ #Φ_b·log b`, `m ≥ √x` and the prime number theorem at `x₁`, gives
`R_{q₀}(x) ≤ (64φ(q₀) + 3)·x^{−1/2+6ε}` for all large integers `x`: the exponent `−1/2` comes from
the length `m ≥ √x` of the chain of lifts.

The inequality compares two bounds for one quantity. The target forms are automorphic forms on the
unitary group of an indefinite Hermitian space `Y₀` over `E` of rank `r`, of a fixed type at the
infinite places and of principal level at chosen places above two auxiliary primes `p₀` and `p₁`,
cut out by an idempotent of the group algebra of the finite group `Ḡ = ∏ GL_r(𝔽_w)` over those
places. For a twist `ϑ`, an anticyclotomic character tamely ramified at the finitely many places of
its modulus, a chain `Θ_ϑ` of `m` theta lifts carries them to algebraic modular forms on the unitary
group of a definite space `Y_m`, which have integral structures. A target form is called integral
at a prime `ℓ` when its images under the chains `Θ_ϑ` are integral at `ℓ` for every twist `ϑ`
whose first `m` powers are again twists and whose modulus has norm prime to `ℓ`. This makes the
target forms a twisted lattice: a family of target forms has an index, which measures how far it is
from being integral at each prime, and a covolume, a bound for the logarithm of the Gram
determinant of its untwisted lifts. For a family of `n` independent target forms that spans almost
all of the target, of dimension `d`, the covolume plus twice the index is bounded above, by
Theorems A and B and Hadamard's inequality, by about `n·(main − m·rem)`, and below, by Theorem C,
by about `d·main`. The main amount
`main = m·k·Σ_σ (s_∞(κ(σ)) − s_fin(κ(σ), σ))`,
summed over all infinite places, appears in both bounds and cancels. Here
`s_∞(j) = log j! + j·log(M/Ω)` is the logarithmic size charged to a derivative of order `j`, with
`M = p₀p₁` and `Ω = e^{γ − Re (L′/L)(1, χ_K)}·2π/rd_E`, where `rd_E` is the root discriminant of
`E`; `s_fin` measures the divisibility of that derivative.

### The upper bound: Theorems A and B

The source forms are algebraic modular forms on the unitary group of a definite Hermitian space
`X₀` of rank `k`, of large weight at the `a`-places. A Poincaré series carries them to forms on
`U(Y₀)`, and the idempotent, after a translate by an element of `Ḡ`, to target forms. An iterated
seesaw identity shows that the chain `Θ_ϑ` applied to the Poincaré series of a ramified source form
is a nonzero constant, the same for all twists, times a composite lift: a finite combination of
chains of `m` theta lifts between definite spaces `X₀, …, X_m`, restricted to a definite subspace
`Y_m` of `X_m`. Through the theta kernels these chains are written with derivatives at the origin of
theta functions of lattices with complex multiplication by `K`, whose sizes are bounded through
`s_∞`. At a prime `p` that does not split in `K`, the composite lift is divisible, on a sublattice
of integral source forms of controlled colength, by `p` to an exponent, the gain, less a controlled
loss. The gain times `2 log p` is `m` times the part at `p` (the terms `n = p^e`) of
`Σ_{τ ∈ Φ_a} s_fin(a, τ) + k·Σ_σ s_fin(κ(σ), σ)`: each lift contributes the prime sums at order `a`
at the `a`-places and, `k` times, at order `κ(σ)` at every place `σ`. Multiplying by the inverse of
the guaranteed divisibility, a rational number, keeps the forms integral and makes them shorter.
Each lift is charged `s_∞(a)` for its derivative of order `a`, which exceeds the expected value
`s_main` by about `a·log(κ̄·M·rd_E/2π)`: the constant `γ − Re (L′/L)(1, χ_K)` in `Ω` cancels against
`c₁`, and the level `N`, a prime, is chosen so that `a·log N` compensates the excesses of the `m`
lifts.

Theorem A says that the source is spanned by integral forms whose normalised images have lifts of
squared norm at most `exp(main − m·rem + f·a·(log b)⁴)` for every translate by an element of `Ḡ`
and at every conjugate, and that the images of integral source forms under a set of translates have
index at most a multiple of the number of translates. The more prime powers there are compared with
their expected number, the shorter these forms.

Theorem B says that the images of the source under few translates by elements of `Ḡ` span all but
a share `4/b²` of the target. It comes from a second moment of the Poincaré map `𝒫`: after
the idempotent, `𝒫` (suitably scaled) is nearly an isometry in mean square, and `d` times the mean
over `s ∈ Ḡ` of the squared Hilbert–Schmidt norm of `𝒫*·s·𝒫` is at most `(1 + 9/b⁴)` times the
square of the dimension of the source. Together these force the translates to spread over the
target, and few of them to span almost all of it.

### The lower bound: Theorem C

Theorem C says that integral target forms are long: for `n ≥ (1 − 4/b²)·d` independent target
forms, the covolume plus twice the index is at least `d·(main − 3f·a·(log b)⁴)`. It is a
product-formula argument. The sizes of a family are read at the trivial twist; its valuations at a
prime `ℓ` are read at a twist `ξ_ι` whose modulus has norm prime to `ℓ`, one for each prime `ℓ` and
each isomorphism `ι : ℂ ≅ ℚ̄_ℓ`. After the family is completed to a basis by auxiliary forms of
controlled size and denominators, the product formula bounds the covolume plus twice the index from
below by minus a bound for the height of the family of numbers `Z(1)/Z(ξ_ι)`, less the cost of the
completion; here `Z(ϑ)` is the determinant `det(Θ_ϑ*·Θ_ϑ)` on the target. This determinant factors
into the determinants of the `m` single lifts of the chain, times a power of the norm of the
modulus and ratios of Hecke L-values. For a suitable family of twists, the ratio of the untwisted
to the twisted determinant of each single lift has height at most
`d·(f·a·(log b)⁴/m − k·Σ_σ (s_∞(κ(σ)) − s_fin(κ(σ), σ)))`, so that the `m` lifts together give
back the main amount. The single lifts are controlled through a formula of Rallis type for their
norms, in which the twist enters through ratios of Hecke L-values, and through congruences:
the twist for `ℓ` is chosen so that the projections of integral forms onto the lifts have small
denominators at `ℓ`, and the existence of such twists rests on the Galois representations of the
lifts, Ribet's method and anticyclotomic twists with small Selmer groups.

### The end

For `q₀` a multiple of `18480` and a prime `d ≡ q₀/2 − 1 (mod q₀)`, the main inequality and the
prime number theorem give, for every `ε > 0`, the one-sided bound `R_{q₀}(x) ≤ x^{−1/2+ε}` for all
large real `x`. For a character `χ` modulo `q`, the criterion applies with `q₀ = 18480·q` and
`d₀ = q₀/2 − 1` to the character modulo `q₀` induced by `χ`; its L-function is `L(s, χ)` times
finitely many Euler factors, so `L(s, χ) ≠ 0` for `Re s > 1/2` and `s ≠ 1`, and the point `s = 1`
for a non-principal `χ` is the classical non-vanishing of `L(1, χ)`. The symmetry `s ↦ 1 − s` of
the zeros, from the functional equation, then places the zeros in the critical strip on the line
`Re s = 1/2` and gives the Riemann hypothesis for `ζ`.

## Origin and method of each statement

Every section of a roadmap of the family that states something to prove carries two labels under
its heading and, after its statement, a `*Needs:*` line and a pointer to `[ShortProof]`.

- `*Origin:*` says where the statement comes from, in one of five forms: `published:`, with the
  source; `adapted from` a published result, with the source or, where none is given, the published
  theory in words, and with what is changed; `particular to this proof:`, for a statement that
  `[ShortProof]` introduces; `this roadmap's own formulation:`, for a statement that is neither
  published nor a statement of `[ShortProof]`; and `definitions and conventions`.
- `*Method of the formal proof:*` says in a few sentences how `[ShortProof]` proves the statement:
  the ideas of its route, not its Lean.
- `*Needs:*` names the sections that the statement rests on: bare ids for sections of the same
  roadmap, `<Roadmap> §k.n` for a section of another roadmap of this family, of
  RiemannHypothesisForDirichletLFunctions or of another area. An entry `ShortGRH background (…)`
  names, in words, a published result that `[ShortProof]` proves among its background results (its
  folder `src/Lib`) and that no roadmap section states yet in the form used; the words in the
  parenthesis say which form. Such an entry is a result still to be stated as a numbered target, in
  an existing roadmap of the library or in a background roadmap of this family; it creates no
  dependency in the umbrella until then.
- The pointer, `[ShortProof], <file> (<declarations>)`, names where `[ShortProof]` proves the
  statement. A statement may be more general than the one `[ShortProof]` proves; it then says in a
  closing sentence which case `[ShortProof]` proves.

## A route, not a source of code

`[ShortProof]` is the route that this family follows, not a source of code. Its Lean code is not
copied into the library: contributors prove the statements of the roadmaps themselves, and are
free, as everywhere in Tau Ceti, to state a result in greater generality, to arrange it differently
and to prove it by another route. The names and encodings of `[ShortProof]` appear in the roadmaps
only in the pointers, which say where it proves a statement.

## When a roadmap is wrong

The purpose of this family is to bring the mathematics of `[ShortProof]` into Tau Ceti as library
mathematics. The roadmaps are the plan and they are followed, as in any other area.

The roadmaps state the route of `[ShortProof]`, and they may contain mistakes. This section is about
one situation only: a roadmap of this family is demonstrably wrong at some point, in its
`README.md` or its `Suggested.lean` (a statement is false or inconsistent as written, a hypothesis
or a convention does not fit, or a step that the argument needs is missing), and `[ShortProof]`
shows what is right.

For those who write and those who review pull requests that carry out these roadmaps:

- In that situation a contribution may correct the statement, or supply the missing step, in a
  form consistent with `[ShortProof]`. Its description says what is wrong with the roadmap (the
  reason, or a counterexample) and names the file and declaration of `[ShortProof]` that settles
  it. The corrected statement may still be more general than the one in `[ShortProof]`.
- A review does not block or delay such a contribution on the ground that it departs from the
  roadmap, or that it proves something the roadmap does not list. What it checks is that the roadmap
  is indeed wrong or incomplete at that point, that the correction agrees with `[ShortProof]` there
  (the declaration named exists in `[ShortProof]` at the commit cited above and supports it), and
  the usual standards of the library.
- The roadmap is then corrected. The correction may follow the contribution; it need not come
  first.

This is not a licence to replace a roadmap's statement by the one of `[ShortProof]` wherever the
two differ in form: where the roadmap is right, it is followed. It does not cover a departure that
agrees with neither the roadmap nor `[ShortProof]`, and it does not change the roadmaps of other
areas that this family cites.

## The roadmaps

The roadmaps are listed in the order of the argument: the reduction and the data, the
divisibility of derivatives of theta functions, the upper bound, the spanning theorem, and the
lower bound.

- [**One-sided prime sum bounds and admissible data**](OneSidedPrimeSumBoundsAndAdmissibleData/README.md):
  the one-sided criterion for a zero-free half-plane; colengths, heights and twisted lattices; the
  admissible data (fields, places, sizes, level and twists) and their existence; the prime sums;
  the statements of Theorems A, B and C; the main inequality, the one-sided bound and the passage
  from it to the end theorems.
- [**Divisibility of derivatives of theta functions of CM lattices**](DivisibilityOfThetaDerivatives/README.md):
  the field `E` and its characters; the formal group and the exponential factor of the theta
  function of a CM elliptic curve; the divisibility of jets of theta functions of CM lattices,
  which counts primes; the integral vacuum vector; and the sharpness of the bound.
- [**Theta lift chains and the seesaw identity**](ThetaLiftChainsAndTheSeesawIdentity/README.md):
  the first half of the upper bound: theta kernels between definite spaces; the main objects of
  the argument, source forms, target forms and chains of theta lifts; and the seesaw identity.
- [**Composite theta lifts and short forms**](CompositeThetaLiftsAndShortForms/README.md):
  the second half of the upper bound, Theorem A: elementary divisors of a Hecke operator, the
  divisibility of the composite lift at each prime, its size, and the short source forms.
- [**Second moments of Poincaré series**](SecondMomentsOfPoincareSeries/README.md):
  the first part of the spanning theorem, Theorem B: the second moment and the spanning theorem,
  equality of multiplicities, measures and Bessel functions at the real places, and the unfolding
  of the second moment with the proof of the moment bounds.
- [**Remaining and main terms of second moments**](RemainingAndMainTermsOfSecondMoments/README.md):
  the second part of the spanning theorem: the bound for the remaining terms of the second moment,
  and its main term, through Kloosterman sums, one-sided Poisson summation and a sieve over all
  places.
- [**Pairs of frames at one place**](PairsOfFramesAtOnePlace/README.md):
  the local estimates of the spanning theorem, at a real place and at the finite places: place
  data and the measures of the floors, the forms of two frames and their decay, the finite Bessel
  vector, the density at the last entry, and groups that fix given vectors; with a supplement on
  discrete series with a large gap (steep parameters, periods by Laplace's method). It covers the
  folders `New/Spanning/Frames` and `New/Appendix/DiscreteSeries` of `[ShortProof]`.
- [**Determinants of theta lift chains**](DeterminantsOfThetaLiftChains/README.md):
  the first half of the lower bound: a twist for each prime, norms of theta lifts, the exchange
  identity, the norm of a chain of lifts and its two determinants, auxiliary forms, and Theorem C,
  integral forms are long.
- [**Norms of theta lifts and exchange identities for one lift**](NormsOfThetaLiftsAndExchangeIdentities/README.md):
  one lift of the lower bound: false lifts and denominators of projections, Hecke L-values as
  squared norms of lifts from `U(1)` and their heights, the three exchanges, the comparison
  operator, and the cost of one lift. It covers the folder `New/OneLift` of `[ShortProof]`.
- [**Congruences of twisted theta lifts**](CongruencesOfTwistedThetaLifts/README.md):
  the first half of the congruences of the lower bound: congruences and the choice of twists,
  congruences and Galois representations, and congruences to first order by Ribet's method.
- [**Selmer bounds for anticyclotomic twists**](SelmerBoundsForAnticyclotomicTwists/README.md):
  the second half of the congruences of the lower bound: anticyclotomic twists with small Selmer
  groups, the local loss, and the lifting of crystalline extension classes in large weight.
