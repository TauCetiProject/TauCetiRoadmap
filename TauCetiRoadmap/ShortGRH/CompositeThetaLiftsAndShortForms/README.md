# Roadmap: composite theta lifts and short forms

**Summary.** This roadmap proves the second half of the upper bound of the argument: the divisibility and
the size of the composite theta lift on source forms, which together give Theorem A of
`OneSidedPrimeSumBoundsAndAdmissibleData`. The argument bounds a one-sided sum over primes, and a one-sided
bound of the right size for such sums gives a zero-free half-plane for the L-functions involved. The bound
for the prime sum is read off from the covolume of a lattice of theta lifts of target forms, for which the
argument has an upper and a lower bound. The upper bound uses source forms: the seesaw identity of
`ThetaLiftChainsAndTheSeesawIdentity` writes the chain of `m` lifts, from `Y₀` to `Y_m`, of the Poincaré series
of a ramified source form `φ` as a nonzero constant times the composite lift `B_ϑ φ`, a finite combination of
chains of `m` theta lifts between definite unitary groups `U(X₀) → ⋯ → U(X_m)`, restricted to `Y_m`. This
roadmap shows that `B_ϑ φ` is divisible by many primes and is not large.

The headline theorems are these. (1) *Divisibility at each prime* (4.9). There are numbers `err(p) ≥ 0`,
zero unless `p` is the level prime `N` or `p < x₁` does not split in `K`, with `Σ_p err(p)·log p ≤ f·a·(log b)³`
over every finite set of primes, such that for every prime `p` and every embedding `ι : ℂ → ℂ_p` the module of
integral ramified source forms has a submodule `S` of colength at most `err(p)·dim` on which every composite
lift `B_ϑ` with a twist `ϑ` of modulus prime to `p` has `ι`-adic valuation at least `gain(p) − err(p)`; the
gain `gain(p) = m(Σ_{τ∈Φ_a} s_p(a, τ) + k·F(p))` is the divisibility that the jets of the theta kernels
predict. At the exceptional primes `p < x₁` (2.1 (f): the inert primes `p ≢ ±1 (mod m)` for which the order
`o₀(p)` of `−p` modulo `q₀` is odd and at most `𝔯(p)`, so that the partner `(−p^e)τ` of every a-place `τ` is an
a-place already at the exponent `e = o₀(p)`) the sublattice is the
image of the `m`-th power of a product of scaled Hecke operators above `p`, enlarged by a power of `p`; its
colength comes from a theorem on the elementary divisors of an edge Hecke operator over a Frobenius cycle
(1.14). (2) *Size* (5.4). For the trivial twist, if all Galois conjugates of the values of `φ` have squared
norm at most `exp B`, those of `B_1 φ` have squared norm at most `exp(B + h_main − m·rem + 2Σ_p gain(p) log p +
f a (log b)³)`. (3) *Short forms* (5.7). The ramified source forms are spanned by forms that are integral at
every prime and whose values have all conjugates of squared norm at most `exp(f a (log b)³)`.

The roadmap builds on `OneSidedPrimeSumBoundsAndAdmissibleData`, which fixes the data (fields, places,
scales, level, twists), the colength of modules and the prime sums, and which states Theorem A that this
roadmap supplies; on `ThetaLiftChainsAndTheSeesawIdentity`, which supplies the definite spaces, the theta
kernels, the chain data, the composite lift, the restriction to `Y_m`, the operator `Up` at the level prime
and the lower chain on target forms; and on `DivisibilityOfThetaDerivatives`, which supplies the predicted
divisibility of jets of theta functions at non-split primes and the standard data.

Layer 1 is self-contained algebra over a Frobenius cycle: the root lemma with Stepanov's count, deep forms,
the Schur algebra of a Levi subgroup and an invariant average, edges and halfway lattices, the Pieri cone,
and the theorem on elementary divisors of the edge Hecke operator. Layer 2 defines, on the data, the local
prime sums, the gain, the loss, exceptional primes, marked sets of primes, the scaled Hecke operators and the
ramified source forms. Layer 3 bounds the valuation of the chain of lifts at a prime other than `N`, moving
Hecke operators through the lifts. Layer 4 applies Layer 1 to the scaled Hecke operator, treats the level
prime, and proves the divisibility at each prime. Layer 5 bounds the archimedean size of the composite lift
and shows that short forms span.

## Conventions and notation

**Labels.** Under each section heading, `*Origin:*` says where the statement comes from and
`*Method of the formal proof:*` how [ShortProof] proves it. The pointer `[ShortProof]` names the file and
declarations of the shorter formal proof (under its directory `src/`) where the statement is proved; its
hypotheses, ranges and constants are recorded in the statement. Where a statement here is wider than the
formal proof's, its last sentence says which case the formal proof proves.

**Data.** `D` denotes admissible data in the sense of OneSidedPrimeSumBoundsAndAdmissibleData §3.2; the
symbols below are those of that roadmap, recalled here in words. "The size inequalities" are the bounds
between the scales of the data stated in OneSidedPrimeSumBoundsAndAdmissibleData §3.3 (among them
`(log b)^{100} ≤ x`, `x^{10⁶} ≤ x₁`, `x₁^{10⁶} ≤ b`, `(log x₁)⁶ ≤ log b`), and the logarithmic bounds that
follow from them for products and sums of the parameters; statements below that say "by the size
inequalities" use only these.

**Gauges and integrality.** Fix a prime `p` and a ring homomorphism `ι : ℂ → ℂ_p`; `𝒪_ι` is the ring of
complex numbers `z` with `|ι(z)|_p ≤ 1`. An algebraic form `φ` on the finite adelic points `G_f` of a definite
unitary group takes values in a Weyl module with its standard integral basis. The *gauge* of a value `v` at a
point `g` is the largest `p`-adic absolute value of a coordinate of `g⁻¹·ι(v)`, where `g⁻¹` acts on the Weyl
module, at the infinite place `τ`, through the `p`-adic embedding `x ↦ ι(τ(x̄))` (so through the component of
`g` at the conjugate `w̄_τ` of the prime `w_τ` induced by `ι∘τ`, 2.4 (a)). A form has *gauge at most `c` at
the base point `d`* if `φ(g)` has gauge at most `c` at `g·d` for every `g`; it is *integral* at `ι` if its
gauge is at most `1` at the base point `1`, and has *valuation at least `v`* if its gauge is at most `p^{−v}`
at the base point `1`. A datum `Φ` of a theta kernel *raises gauges from `d` to `d′` by at most `C`* if, for
all finite points `g`, `g′` and every vector `ξ`, the image of `ξ` under the value of the kernel at the
translated datum `ω(g, g′)Φ` has gauge at `g′d′` at most `max(C, 0)` times the gauge of `ξ` at `gd`
(ThetaLiftChainsAndTheSeesawIdentity §1.1 (d), gauges and the bound "raises"). The *squared norm* of a
vector of a Weyl module is its value under the invariant integral Gram form of the module; for `σ ∈ Aut(ℂ)`,
`σ∘v` is the conjugate vector. A form is *`B`-short* if it is integral at every `ι` for every prime `p` and
all conjugates `σ∘φ(g)` have squared norm at most `B`.

**Colength.** For modules `M`, `M′` over a commutative ring `O` and `z ∈ O`, "the colength of `M′` in `M`
divides `z`" means: every finite family `(φ_1, …, φ_n)` of elements of `M` is carried into `M′` by an
`n × n` matrix over `O` whose determinant divides `z` (no inclusion `M′ ⊆ M` is asked). An endomorphism `y`
is *onto `M` modulo `pⁿ` up to colength `c`* if `y(M) ⊆ M` and the colength of `y(M) + pⁿM` in `M` divides
`p^l` for some natural number `l ≤ c`. These notions, and their behaviour under images, preimages, chains and
products of endomorphisms (the bounds add), are those of OneSidedPrimeSumBoundsAndAdmissibleData §1.1
(colength of modules).

**Valuation rings.** "Valuation domain" means an integral domain whose ideals are totally ordered; a matrix
over it has a Smith normal form.

### Table of symbols

| Symbol | Meaning | Defined |
|---|---|---|
| `q₀, d, K, χ_K` | fixed parameters (`18480 ∣ q₀`, `d` prime, `d ≡ q₀/2 − 1 mod q₀`); `K = ℚ(√−d)`; its quadratic character | OneSidedPrimeSumBoundsAndAdmissibleData §2.1 |
| `E, q₁, Φ, f` | the CM field `K(ζ_{q₁})`; the group of its infinite places, identified with `(ℤ/q₁)ˣ` and read as embeddings `E → ℂ` through a CM type; `f = #Φ` | OneSidedPrimeSumBoundsAndAdmissibleData §2.1 (`q₁`), §2.2 |
| `u(ν), (−ν)σ` | the infinite place named by the class of an integer `ν` prime to `q₁` (the identity otherwise); the product `u(−ν)·σ` | OneSidedPrimeSumBoundsAndAdmissibleData §2.2 |
| `Φ_a, Φ_b, κ(τ)` | the a-places (class `1` mod `q₀`), the b-places (class `−1` mod `q₀`); the weight, `b` on `Φ_b` and `a/x₁` elsewhere | OneSidedPrimeSumBoundsAndAdmissibleData §3.2 |
| `Δ, κ_j` | the gap `Δ = 2r⁸` between the weights of consecutive lifts, with `r = k + m − 1`; `κ_j(σ) = κ(σ) + (j + 1/2)Δ`, the weight of the character of lift `j` | OneSidedPrimeSumBoundsAndAdmissibleData §3.2 |
| `x, x₁, b, a` | the scales, `a = x·b` | OneSidedPrimeSumBoundsAndAdmissibleData §3.2 |
| `m, ϱ, k, t, n_j, s, l₀` | number of lifts (a power of `2`, `m = 2ϱ + 2`); rank of `X₀`; `n_j = k + j(t + 1)`; `2^s = m^{22}`; `l₀` the least power of `3` above `27s` | OneSidedPrimeSumBoundsAndAdmissibleData §2.1 (`l₀`), §3.2 |
| `M = p₀p₁, π̄_M` | the two level primes and an integer of `K` of norm `M` | OneSidedPrimeSumBoundsAndAdmissibleData §3.2 |
| `N, π_N` | the level prime and an integer of `E` with `π_N π̄_N = N`; `N ≥ x₁` | OneSidedPrimeSumBoundsAndAdmissibleData §3.2, §3.3 (e) (`N ≥ x₁`) |
| `u_E` | the error unit `f·a·(log b)³` | OneSidedPrimeSumBoundsAndAdmissibleData §4.1 |
| `ϑ, Q(ϑ), q(ϑ)` | a twist; its set of ramified places; `q(ϑ) = Π_{w∈Q(ϑ)} Nw` | OneSidedPrimeSumBoundsAndAdmissibleData §3.4 |
| `s_fin(y, σ)` | the prime sum `Σ_{1≤ν≤a} Λ(ν)(1 − χ_K(ν))(y/ν − κ((−ν)σ))₊` | OneSidedPrimeSumBoundsAndAdmissibleData §4.1 |
| `s_∞(j), s_main, h_main, rem` | the jet size `log j! + j log(M/Ω)`; the expected value of `s_fin(a, τ)`; the main amount; the total remainder `Σ_{τ∈Φ_a}(s_fin(a, τ) − s_main)` | OneSidedPrimeSumBoundsAndAdmissibleData §4.1 |
| `rd_E, Ω` | the root discriminant of `E`; `Ω = exp(γ − Re (L′/L)(1, χ_K))·2π/rd_E` | OneSidedPrimeSumBoundsAndAdmissibleData §2.2 |
| `X_j, K_j, Y_m` | the definite hermitian spaces of rank `n_j` (standard form on a basis), their levels, and `Y_m ⊂ X_m` | ThetaLiftChainsAndTheSeesawIdentity §2.1 (the spaces), §2.6 (the levels `K_j`) |
| `𝒮, D_X` | source forms (there `𝒮_X`): algebraic forms on `U(X₀)` of the source weight and level `K₀`; `D_X = dim_ℂ 𝒮` | ThetaLiftChainsAndTheSeesawIdentity §2.8 |
| `K°` | the stabiliser of the standard lattice in the finite adelic points of a standard definite space; `K₀ ⊂ K°` | ThetaLiftChainsAndTheSeesawIdentity, Conventions |
| lift diagrams | the lift diagram of step `j` at `τ`: the Young diagram with `c_τ(h)` columns of height `h ≤ n_j`, whose rows are `μ(X_j)_τ + κ_{j+1}(τ) − n_{j+1}/2` | ThetaLiftChainsAndTheSeesawIdentity §2.2 |
| `Θ_j^ϑ` | the theta kernel of the lift `X_j → X_{j+1}` for `ϑ` (the lift is written `L_j^ϑ` there) | ThetaLiftChainsAndTheSeesawIdentity §2.8 |
| `t_x(j)` | the integral vacuum of `Hom(X_j, X_{j+1})` translated by the `j`-th entry of a tuple `x` of translations | ThetaLiftChainsAndTheSeesawIdentity §2.12 |
| `Ψ, R_ϑ^Ψ, B_ϑ^Ψ` | chain data and weak chain data; the restricted chain (the combination `Ψ` of chains of `m` lifts with data `t_x(j)`, restricted to `Y_m`); the composite lift (there `comp_ϑ(Ψ)`) | ThetaLiftChainsAndTheSeesawIdentity §2.12 |
| `𝖦, e₀, Θ_ϑ` | the group `∏_w GL_r(𝔽_w)` over the chosen places, the good idempotent, the lower chain | ThetaLiftChainsAndTheSeesawIdentity §2.5, §2.15 |
| `p, ι, 𝒪_ι` | a prime, an embedding `ℂ → ℂ_p`, the `ι`-integral complex numbers | Conventions |
| `𝓜_ι` | the integral source forms at `ι` | 2.4 |
| `I_p, v(π_p), γ_p` | exponents and constants of a prime `p` | DivisibilityOfThetaDerivatives §2.1 |
| `s_p(y, σ), F(p), gain(p), loss(p), err` | local prime sums and their total (OneSidedPrimeSumBoundsAndAdmissibleData §4.1, where `F(p)` is written `S_p`), the gain, the loss, the allowed loss | 2.1 |
| `𝔯(p), ν_p, j_p, o₀(p)` | `⌈log_p m⌉`, `𝔯f(n_m + 𝔯)`, `⌈2mfa/p⌉`, the order of `−p` modulo `q₀` | 2.1 |
| `w_σ, Λ, A_𝔩, Y_𝔩` | induced primes, marked sets, scaling exponents, scaled Hecke operators | 2.4, 2.6 |
| `D_p(j, S), λ_j(Λ)` | the divisibility bound of a lift; the loss of a lift at a neighbour | 2.7, 3.4 |
| `z_w, 𝒮^ram` | scalings above `N`; ramified source forms | ThetaLiftChainsAndTheSeesawIdentity §2.8; 2.9 |
| `Σ_N, δ_j, Up, 𝒜′` | the set-up at the level prime | 4.4 |
| `T, P, q, w, ρ_n, depth, defect` | a Frobenius cycle and its invariants | 1.1 |
| `c_div, c₀, c*` | the divisor constant, the multinomial exponent, the defect threshold | 1.4, 1.7, 1.10 |

In 5.1 and 5.6, `N` is an integer in the different of `E`, not the level prime.

## Layer 1: Elementary divisors of an edge Hecke operator

This layer uses nothing of the data, and its letters are its own: here `N` is the number of letters of a cycle (not
the level prime), `K` a field of characteristic `p` (not `ℚ(√−d)`), `T` a Frobenius cycle, and `E`, `m` exponents where
a statement says so. A form of degree `n` in each letter is identified with its family of coefficients, indexed by the
set `Exp(N, k, n)` of exponents (1.1). A Frobenius cycle is a circle of ring maps from a local ring `W`, each
congruent modulo `p` to the `P`-th power of the one before; `GL_k(W)` acts on polynomials in one block of
`k` variables per map, through the map or its inverse transpose. The theorem (1.14) bounds the colength of the
image of an edge Hecke operator: the deep forms and the forms of large defect are rare (1.4, 1.12), forms in
all halfway lattices have no terms of large defect (1.8), and an averaging map built from the Schur algebra
removes those terms while keeping the pairing (1.10).

### 1.1 Definitions: Frobenius cycles, the twisted action, depth and defect

*Origin:* definitions and conventions.

*Method of the formal proof:* none: these are definitions.

Let `W` be a commutative local ring with finite residue field, `R` a commutative ring, and `N ≥ 1`.
(a) A *Frobenius cycle* `T` with `N` letters consists of a prime `p`, an exponent `e` with `P := p^e ≥ 5`,
ring homomorphisms `ι_s : W → R` for the letters `s ∈ ℤ/N`, a parity (even or odd) of each letter with `s`
and `s + 1` of opposite parity, and `w ∈ R` with `w² = p`, such that the residue field of `W` has
`q := P^N` elements and `ι_{s+1}(y) ≡ ι_s(y)^P (mod pR)` for all `s` and `y ∈ W`. (So `N` is even.)
(b) *The twisted action.* The variables are `x_{b,s}` with `b ∈ {0, …, k − 1}` and `s ∈ ℤ/N`. For
`g ∈ GL_k(W)` put `g_s := ι_s(g)` if `s` is even and `g_s := ι_s((g⁻¹)ᵀ)` if `s` is odd; `g` acts on
`R[x]` by the `R`-algebra map `x_{c,s} ↦ Σ_b (g_s)_{bc}·x_{b,s}`. Let `Exp(N, k, n)` be the set of families
`β = (β_s)_{s∈ℤ/N}` of monomials of degree `n` in the `k` variables of each letter; a *form of degree `n` in
each letter* is a vector `F ∈ R^{Exp(N,k,n)}`, read as `Σ_β F_β x^β`, and `ρ_n(g)`, the Kronecker product over
`s` of the `n`-th symmetric powers of the `g_s`, is the matrix of the action of `g` on such forms.
(c) *Depth.* For `r ≤ k`, the variable `x_{b,s}` is *deep* if `s` is even and `b ≥ r`, or `s` is odd and
`b < r`; `depth_r(β)` is the degree of `x^β` in the deep variables.
(d) *Defect.* For indices `a ≠ a′` and a letter `i`, put `u_s := x_{a′,s}` and `ū_s := x_{a,s}` for even
`s`, and `u_s := x_{a,s}`, `ū_s := x_{a′,s}` for odd `s`. Give `u_s` the weight
`P^{1+((s−1−i) mod N)}/(q − 1)`, `ū_s` the weight `−P^{(s−i) mod N}/(q − 1)` (residues read in
`{0, …, N − 1}`), and the other variables the weight `0`. The *defect* of an exponent vector `α` at the letter
`i` along `(a, a′)` is its weighted degree for these weights.
(e) *Levi and parahoric subgroups.* For a labelling `τ : {0, …, k − 1} → ℕ`, `L_τ(W)` is the group of
`g ∈ GL_k(W)` with `g_{ij} = 0` whenever `τ(i) ≠ τ(j)`, and `P_τ(W)` the group of `g` with `g_{ij}` in the
maximal ideal whenever `τ(i) < τ(j)`. `τ_r` is the labelling that is `0` on `b < r` and `1` on `b ≥ r`; the
constant labelling `0` gives `L_0(W) = GL_k(W)`.
(f) *Conditions on translates.* For an ideal `I ⊆ R` and a set `B` of exponents, `Tr_τ(I, B)` is the
submodule of the `F` with `(ρ_n(g)F)_β ∈ I` for all `g ∈ L_τ(W)` and `β ∈ B`. The *defect conditions*
`DC(a, a′; I; h)` are `Tr_{τ_{a′}}(I, B)` for `B` the exponents whose defect along `(a, a′)` exceeds `h` at
some letter. The *deep forms* `Deep(r, d)` are `Tr_0(0, {β : depth_r(β) < d})`: every translate of `F` by
`GL_k(W)` has only monomials of depth at least `d`.

*Needs:* Mathlib (multivariate polynomials, local rings).

[ShortProof], `New/UpperBound/ElementaryDivisors/TwistingData.lean` (`New.FrobeniusCycle`,
`New.FrobeniusCycle.letterRep`, `New.FrobeniusCycle.depth`, `New.FrobeniusCycle.defectWeight`,
`New.FrobeniusCycle.translatesIn`, `New.FrobeniusCycle.defectConditions`, `New.FrobeniusCycle.deepForms`)

### 1.2 Stepanov's count

*Origin:* adapted from Stepanov's method (Bombieri (1973): a polynomial with zeros of multiplicity at
least `E` at `q` points has degree at least `Eq`): here over a commutative ring, at the images of
representatives of the residue classes of a local ring.

*Method of the formal proof:* the images of representatives of distinct residue classes differ by units, so
the polynomials `(X − ι(y))^E` are pairwise coprime; all divide `Φ`, so does their product, which is monic of
degree `Eq`.

Let `W` be a local ring whose residue field is finite with `q` elements, `ι : W → R` a ring homomorphism to a
commutative ring, `E ∈ ℕ` and `Φ ∈ R[X]` non-zero. If `X^E` divides `Φ(X + ι(y))` for every `y ∈ W`, then
`E·q ≤ deg Φ`.

*Needs:* Mathlib (polynomials over a commutative ring).

[ShortProof], `New/UpperBound/ElementaryDivisors/RootLemma.lean` (`New.stepanov_count`)

### 1.3 Gauss filtrations and the root lemma

*Origin:* particular to this proof: a term of least weighted `w`-adic order among all translates of a
polynomial by the twisted action of `SL₂(W)` in two rows and columns has defect at most `0`, which is one of
Pieri's inequalities for its exponent.

*Method of the formal proof:* fix the root `(a, a′)` and the letter `i`. In the two variables `ū_s, u_s` of
each letter the translates by the transvections of `SL₂(W)` are written, through the Frobenius congruences,
as substitutions by polynomials in one affine coordinate; a coefficient of the substituted polynomial is
expanded at infinity, which gives its degree (a pole order), and at the `q` finite points, where minimality
of the term gives zeros of high order. Stepanov's count (1.2) compares the two, and the defect is the zero
order less the pole order divided by `q`, all divided by `q − 1`.

Let `T` be a Frobenius cycle (1.1) with `w² = p`. For `a ≠ a′` let `SL₂^{a,a′}(W)` be the group of the
`g ∈ GL_k(W)` of determinant `1` that agree with the identity matrix outside the rows and columns `a, a′`.
For real weights `c` of the variables and `t ∈ ℝ`, the *Gauss level `t`* consists of the polynomials `f` whose
coefficient at each `x^γ` is divisible by `w^{⌈t − c·γ⌉₊}` (`⌈·⌉₊` the ceiling, truncated at `0`).
(a) For `g ∈ P_τ(W)`, `p` divides `(g_s)_{ij}` if `s` is even and `τ(i) < τ(j)`, or `s` is odd and
`τ(j) < τ(i)`. The weight of `u_s` minus that of `ū_s` lies in `[0, 3/2]`, and an exponent of degree at most
`d` in each letter has defect of absolute value at most `2d`.
(b) *Root lemma.* Let `a ≠ a′`, `i` a letter, and `c` weights with `c(u_s) − c(ū_s) ∈ [1/2, 1]` for all `s`.
Let `f ∈ R[x]`, `α` an exponent and `l ∈ ℕ` be such that every translate `g·f`, `g ∈ SL₂^{a,a′}(W)`, lies in
Gauss level `l + c·α`, and `w^{l+1}` does not divide the coefficient of `x^α` in `f`. Then the defect of `α`
at `i` along `(a, a′)` is at most `0`.
(c) Let `δ` be weights with `δ(u_s) − δ(ū_s) = 1` for all `s`. If every translate of `f` by
`SL₂^{a,a′}(W)` lies in Gauss level `v₀` for `δ`, then `f` lies in Gauss level `v₀` for the weights
`δ − (defect weights at i along (a, a′))/3`: each term has order plus `δ`-weight at least `v₀` plus a third
of its defect.
(d) If `R = K` is a field of characteristic `p` (so `w = 0`), `δ` is as in (c), and `x^α` occurs in `f` and
every term of every translate of `f` by `SL₂^{a,a′}(W)` has `δ`-weight at least `δ·α`, then the defect of `α`
at `i` along `(a, a′)` is at most `0`.

*Needs:* 1.1, 1.2.

[ShortProof], `New/UpperBound/ElementaryDivisors/RootLemma.lean`
(`New.FrobeniusCycle.defect_nonpos_of_extreme_term`, `New.FrobeniusCycle.mem_gaussFiltration_sub_defect_div_three`,
`New.FrobeniusCycle.weight_defectWeight_nonpos_of_least`); `New/UpperBound/ElementaryDivisors/TwistingData.lean`
(`New.FrobeniusCycle.p_dvd_letterMatrix_of_mem_parahoric`, `New.FrobeniusCycle.defectWeight_sub_mem_Icc`,
`New.FrobeniusCycle.abs_weight_defectWeight_le`)

### 1.4 Few forms have only deep translates

*Origin:* particular to this proof: over a field of characteristic `p`, the forms all of whose translates
have depth at least `δ` have a monomial of large weighted degree, and their dimensions, summed over `δ`, are
at most a small constant times the number of monomials.

*Method of the formal proof:* a form all of whose translates are deep vanishes to order `δ`, as a polynomial
in the deep variables over the field of rational functions in the others, at the points obtained from the
matrices `1 + A` with `A` in the rows `< r` and the columns `≥ r`; these points are the common zeros of
equations whose leading powers are `P^{2r}` or `P`, and a count of multiplicities against weighted degree
gives the costly monomial. A monomial of weighted degree `t` is counted for at most `t` depths, and the mean
weighted degree is at most the divisor constant.

Let `T` be a Frobenius cycle over a field `K` of characteristic `p`, `0 < r`, `2r ≤ k` and `n ∈ ℕ`. Give the
variable `x_{b,s}` the weight `ω(b, s) = P^{−2r}` if it is deep and `b ≥ 2r`, `P^{−1}` if it is deep and
`b < 2r`, and `0` if it is not deep, and put `c_div(k, n, r) := N·n·(P^{−2r} + r²/(kP))`.
(a) Every non-zero `F ∈ Deep(r, δ)` has a coefficient `F_β ≠ 0` with `Σ_x β(x)ω(x) ≥ δ`.
(b) For every `M`, `Σ_{δ=1}^{M} dim_K Deep(r, δ) ≤ c_div(k, n, r)·#Exp(N, k, n)`.

*Needs:* 1.1; ShortGRH background (the combinatorial Nullstellensatz with multiplicity, over a field: give the
variable `u` the cost `1/κ_u`; at a set of at least `Π_u κ_u` points at which each `X_u^{κ_u}` agrees with a
polynomial all of whose monomials cost less than `1`, a non-zero polynomial vanishing to order `δ` has a
monomial of cost at least `δ`; [ShortProof] `Lib/General/Algebra/MultivariatePolynomials.lean`
(`New.exists_le_weight_of_mem_vanishingIdeal_pow`)).

[ShortProof], `New/UpperBound/ElementaryDivisors/Depth.lean` (`New.FrobeniusCycle.exists_le_weight_of_mem_deepForms`,
`New.FrobeniusCycle.sum_finrank_deepForms_le`, `New.FrobeniusCycle.divisorConstant`)

### 1.5 Adjoint weights and the Schur algebra of a Levi subgroup

*Origin:* adapted from the theory of Schur algebras (Green (1980); Benson and Doty (2009)), in which the points of a general linear group
over a field span its Schur algebra in degrees below the size of the field: here for a Levi subgroup over a
local ring, in degree `d` with `d + k` at most the size of the residue field, together with integral weights
that make substitution by a matrix and by its transpose adjoint.

*Method of the formal proof:* (a) a multinomial coefficient of degree below `p^f` with `#σ` parts divides
`p^{#σ·f}` in `O`; the quotients inherit the adjointness of the Fock pairing `⟨x^γ, x^γ⟩ = γ!`. (b) The
block part of the generic matrix of `τ` has a determinant that is homogeneous of degree `k` and a unit at the
identity, and the monomial values at the points where a homogeneous polynomial of degree `e` is a unit span
the dual of the monomials of degree `d` as soon as `d + e` is at most the size of the residue field (density
over a local ring).

Let `O` be a valuation domain of characteristic `0` in which the prime `p` is not a unit.
(a) For a finite set `σ` of variables and `f ∈ ℕ` there are weights `η(γ) ∈ O` of the monomials `γ` in `σ`
with `p^{#σ·f} = multinomial(γ)·η(γ)` whenever `deg γ < p^f`, such that for every matrix `A` over `O` the
substitutions by `A` and by `Aᵀ` are adjoint for the symmetric form with `⟨x^γ, x^γ⟩ = η(γ)` and distinct
monomials orthogonal.
(b) Let `W` be a local ring whose residue field is finite with at least `n + e` elements, `ι : W → O` a ring
homomorphism (here `O` may be any commutative ring), and `g` a polynomial over `W` in variables `σ`,
homogeneous of degree `e`, with a unit value at some point. Then the vectors `(ι(y^γ))_γ`, `γ` running over
the monomials of degree `n`, at the points `y` where `g(y)` is a unit, span `O^{Mon_n(σ)}`.
(c) Let `τ` be a labelling of `{0, …, k − 1}`, and let the residue field of `W` be finite with at least `d + k`
elements. Let `Sch_d` send a linear
form on the polynomials of degree `d` in the `k²` entries of a matrix to the matrix on `(O^k)^{⊗d}` obtained
by applying it to the entries of the `d`-th tensor power of the generic block matrix of `τ`. Then the
tensor powers `ι(g)^{⊗d}`, `g ∈ L_τ(W)`, span the image of `Sch_d`; precisely, a submodule of the forms that
contains every form with the same image under `Sch_d` as the evaluation at some `ι(g)`, `g ∈ L_τ(W)`, is
everything.

*Needs:* 1.1; Mathlib (multinomial coefficients, valuation rings); ShortGRH background (the Fock pairing
`(f, g) ↦ f(∂)g(0)` on polynomials in finitely many variables over a commutative ring, for which substitution
of the variables by a matrix and by its transpose are adjoint; [ShortProof] `Lib/GLn/SchurModule/Basic.lean`
(`New.fockPairing`, `New.fockPairing_linSubst`)).

[ShortProof], `New/UpperBound/ElementaryDivisors/InvariantAverage.lean` (`New.Average.exists_isAdjointWeight`,
`New.Average.eq_top_of_eval_monomial`, `New.Average.eq_top_of_schurMap_eq_leviMonomialValues`)

### 1.6 An invariant average on polynomials in the entries of a matrix

*Origin:* particular to this proof: a linear form on polynomials in a generic matrix, invariant under
conjugation by a Levi subgroup, that vanishes on the monomials of large row weight and agrees with a power of
`p` times evaluation at the identity on the polynomials whose conjugates have no such monomials modulo an
ideal.

*Method of the formal proof:* with the weights of 1.5 (a) a polynomial `ψ` of degree `d` gives an element
`ψ♯` of the Schur algebra, whose trace on `(O^k)^{⊗d}` is `p^{k²f}·ψ(1)` and which transforms by conjugation;
the form is, degree by degree, the trace of `ψ♯` minus its trace on the submodule generated by the basis
tensors of large weight. By 1.5 (c) that submodule is spanned by images of such tensors under the
`ι(g)^{⊗d}`, which gives invariance, vanishing on the monomials of large row weight, and the congruence
modulo `J`.

Let `W` be a local ring with finite residue field, `O` a valuation domain of characteristic `0` in which the
prime `p` is not a unit, `ι : W → O`, `τ` a labelling of `{0, …, k − 1}`, `ρ ∈ ℤ^k`, `t ∈ ℤ`, and `f, D ∈ ℕ` with `D < p^f` and
`D + k` at most the size of the residue field of `W`. The group `L_τ(W)` acts on polynomials `ψ` in the
entries of a `k × k` matrix `X` over `O` by `ψ(X) ↦ ψ(ι(g)⁻¹Xι(g))`. Call a monomial `α` in the entries
*bad* if its row weight `Σ_{i,j} α(i, j)ρ(i)` exceeds `t`. Then there is an `O`-linear form `I` on `O[X]`
such that:
(a) `I` is invariant under this action of `L_τ(W)`;
(b) `I` vanishes on the bad monomials;
(c) for every ideal `J ⊆ O` and every `ψ` of total degree at most `D` such that all conjugates of `ψ` by
`L_τ(W)` have their bad coefficients in `J`, `I(ψ) ≡ p^{k²f}·ψ(1) (mod J)`.

*Needs:* 1.5.

[ShortProof], `New/UpperBound/ElementaryDivisors/InvariantAverage.lean` (`New.Average.exists_isAverage`,
`New.Average.IsAverage`)

### 1.7 Definitions: edges, halfway lattices, edge pairings and the edge Hecke operator

*Origin:* definitions and conventions.

*Method of the formal proof:* none: these are definitions.

Let `T` be a Frobenius cycle over `W` and a domain `O` of characteristic `0`, and `r ≤ k`.
(a) *Edges.* `ParahoricCosets(k, r) := GL_k(W)/P_{τ_r}(W)`, the set of left cosets `g·P_{τ_r}(W)`. (As
`P_{τ_r}(W)` is the stabiliser of `{v ∈ W^k : v_b ∈ 𝔪 for b < r}`, `𝔪` the maximal ideal, these cosets
correspond to the lattices `L′` with `𝔪W^k ⊆ L′ ⊆ W^k` and `W^k/L′` of dimension `r` over the residue field;
read through the transpose, they label the edges leaving a lattice.)
(b) *Halfway lattices.* `Δ_r` is the diagonal matrix that multiplies the coefficient at `β` by
`w^{depth_r(β)}`. The module `ℋ_r` of *forms in all halfway lattices* consists of the `v ∈ O^{Exp(N,k,n)}`
for which there are `m ∈ ℕ` and `h ∈ O^{Exp}` with `w^m v = Δ_r h` and `w^m` dividing every coefficient of
`Δ_r ρ_n(g) h` for every `g ∈ GL_k(W)`.
(c) *Edge pairings.* `c₀ := k²·e·N`, so that `q = p^{eN}`. An *edge pairing* is a pair of weights
`b, b′ : Exp(N, k, n) → O` with `b_β ρ_n(gᵀ)_{βα} = b_α ρ_n(g)_{αβ}` for all `g, α, β`, and `b_β b′_β = p^{N c₀}`;
then `⟨h, h′⟩ := Σ_β h′_β b_β h_β` makes `ρ_n(g)` and `ρ_n(gᵀ)` adjoint.
(d) *Functions on edges.* For finite sets `X` (origins) and `E` (edges), with an origin `src(e) ∈ X` and a
change of basis `g(e) ∈ GL_k(W)` for each edge, the *edge restriction* sends `φ : X → O^{Exp}` to
`e ↦ Δ_r ρ_n(g(e)) φ(src(e))`, and the *origin functions* are the `ψ : E → O^{Exp}` with `w^m ψ` in the image
of the edge restriction for some `m`.
(e) *Edge coordinates* with blocks `(r, k − r)`, for a finite set `X` of representatives and a finite set `H`,
consist of: for each edge `(x, b)`, `b ∈ ParahoricCosets(k, r)`, a representative `origin(x, b) ∈ X`, a change
of basis `g_o(x, b) ∈ GL_k(W)` at the origin and a matrix `μ(x, b) ∈ GL_H(O)`; for each `b` a change of
basis `g_t(b)` whose inverse represents `b`; such that two edges `e`, `e′` with `origin(e) = origin(e′)` and
`g_o(e)ᵀ·(g_o(e′)ᵀ)⁻¹ ∈ P_{τ_r}(W)` are equal (equivalently, `e ↦ (origin(e), class of (g_o(e)ᵀ)⁻¹ in
ParahoricCosets(k, r))` is injective).
(f) *The edge Hecke operator.* For a bijection `J : I ≅ Exp(N, k, n) × H`, the operator `A` on functions
`F : X → O^I` is `(AF)(x) := Σ_b ((ρ_n(g_o(x, b))·diag(p^{depth_r(β)})·ρ_n(g_t(b)))ᵀ ⊗ μ(x, b))
F(origin(x, b))`, read through `J`.

*Needs:* 1.1.

[ShortProof], `New/UpperBound/ElementaryDivisors/Edges.lean` (`New.ParahoricCosets`,
`New.FrobeniusCycle.depthScaling`, `New.FrobeniusCycle.allEdgesForms`, `New.FrobeniusCycle.multinomialExponent`,
`New.FrobeniusCycle.IsEdgePairing`, `New.FrobeniusCycle.edgeRestriction`, `New.FrobeniusCycle.originFunctions`);
`New/UpperBound/ElementaryDivisors/ElementaryDivisorTheorem.lean` (`New.EdgeCoordinates`,
`New.FrobeniusCycle.edgeHeckeOperator`)

### 1.8 Edge pairings, the defect of forms in all halfway lattices, and functions on origins

*Origin:* particular to this proof: pairings of an edge with its dual exist, a form that lies in the halfway
lattices of all edges from its origin has its Levi translates divisible by `w^j` at the monomials of defect
at least `3j`, and the functions on edges that depend only on the origin form a direct summand in which the
integral functions on origins have colength controlled by the deep forms.

*Method of the formal proof:* (a) in each letter the weights of 1.5 (a), times a power of `p`, give the
pairing. (b) A Levi translate commutes with `Δ_r`; at a monomial of large defect the root lemma 1.3 (c),
applied with the depth weights, gives the extra divisibility. (c) A Hermite and a Smith normal form of the
edge restriction; its elementary divisors are bounded by the depths, and each depth `δ` contributes at most
`|X|·dim Deep(r, δ)` over the residue field.

Let `O` be a valuation domain of characteristic `0` in which `p` is not a unit, and `T` a Frobenius cycle
over `W` and `O`.
(a) If `n < q`, an edge pairing `(b, b′)` exists, and for it `⟨ρ_n(g)h, h′⟩ = ⟨h, ρ_n(gᵀ)h′⟩` and every linear
form `h′ ↦ Σ_β h′_β η_β`, times `p^{N c₀}`, is `⟨b′η, ·⟩`.
(b) Let `a < r ≤ k − 1` be indices (one in each block), `v ∈ ℋ_r`, `g ∈ L_{τ_r}(W)` and `j ∈ ℕ`. If `β` has
defect at least `3j` at some letter along `(a, r)`, then `w^j` divides `(ρ_n(g)v)_β`. Consequently
`ℋ_r ⊆ DC(a, r; w^c O; 3c*)` for every `c`, with `c* := 3kc`, and, for an edge pairing, `w^c` divides
`⟨v, ρ_n(g)e_β⟩` whenever `β` has defect above `c*` at some letter along `(a, r)`.
(c) Let `X`, `E`, `src`, `g` be as in 1.7 (d), such that every pair of a point of `X` and a coset in
`ParahoricCosets(k, r)` is `(src(e), g(e)⁻¹)` for some edge `e`, and let `depth_r ≤ x` on `Exp(N, k, n)`.
Then there are matrices `Q`, `R`, `d` with `RQ = 1`, `Qφ` an origin function for every `φ`, `Qd` equal to the
edge restriction, and `det d` dividing `w^l` with `l = |X|·Σ_{δ=1}^{x} dim Deep(r, δ)`, the deep forms being
taken for the reduction of `T` modulo the maximal ideal of `O`. Every origin function `ψ` satisfies
`QRψ = ψ`.

*Needs:* 1.1, 1.3, 1.4, 1.5, 1.7; ShortGRH background (over a valuation domain: a matrix with more rows than
columns is an invertible matrix times a square matrix placed in chosen rows, and a square matrix is a product
of an invertible matrix, a diagonal matrix and an invertible matrix; [ShortProof]
`Lib/General/LinearAlgebra/HermiteForm.lean` (`New.IsValuationPair.hermite`),
`Lib/General/LinearAlgebra/IntegralLattices.lean` (`New.IsValuationPair.smith_normal_form`)).

[ShortProof], `New/UpperBound/ElementaryDivisors/Edges.lean` (`New.FrobeniusCycle.exists_isEdgePairing`,
`New.FrobeniusCycle.IsEdgePairing.dotProduct_letterRep_mulVec`, `New.FrobeniusCycle.pow_dvd_letterRep_mulVec_of_mem_allEdgesForms`,
`New.FrobeniusCycle.allEdgesForms_le_defectConditions`, `New.FrobeniusCycle.IsEdgePairing.pow_dvd_pairing_letterRep`,
`New.FrobeniusCycle.exists_originFunctions_factorization_det_dvd`, `New.FrobeniusCycle.mulVec_mulVec_eq_self_of_mem_originFunctions`)

### 1.9 Frobenius substitution of generic matrices: weight against defect

*Origin:* particular to this proof: after substituting entrywise Frobenius powers of generic matrices, one
copy for each letter, a monomial that occurs with a coefficient not divisible by `w^c` has its weight within
`3kc` of the defect of the row.

*Method of the formal proof:* a term of an entry of a product of matrices follows a path of indices; the
weight of each step is a difference of two scaled index weights up to `1/P^ℓ`, so the weights telescope and
leave the scaled weight of the last index, which is `1 − 1/q` times the defect weight for an even letter and
the same with a sign change through the cofactor matrix for an odd one. The remainder is at most `1` because
`2n ≤ q`. All terms are handled at once by bounding levels in Gauss filtrations; the error terms of the
Frobenius congruences are multiples of `p` and are absorbed there.

Let `O` be a domain of characteristic `0`, `T` a Frobenius cycle over `W` and `O`, and `ℓ ≤ N`. Take generic
`k × k` matrices `X_j` with entries `X_j(b, c)`, one for each copy `j ∈ ℤ/N`. For `k × k` matrices `ψ_{s,d}`
(`s ∈ ℤ/N`, `d ∈ ℕ`) over a ring, let `𝒯_{r,ℓ,n}(ψ)` be the Kronecker product over the letters `s` of the
`n`-th symmetric powers of the matrices whose row `b` is row `b` of `ψ_{s,m−1}⋯ψ_{s,1}ψ_{s,0}`, with
`m = ℓ + 1` if `x_{b,s}` is deep for `r` and `m = ℓ` if not, when `s` is even, and row `b` of the transposed
adjugate of that product when `s` is odd. For `h ∈ GL_k(W)` put
`Ψ^h_{s,d} := ι_s(h)·(ι_{s−d}(h)⁻¹ X_{s−d} ι_{s−d}(h))^{∘P^d}·ι_s(h)⁻¹`, where `∘P^d` is the entrywise power.
For `a′ = a + 1` and `ρ := e_{a′} − e_a ∈ ℤ^k`, the *weight at the copy `i`* of a monomial `ν` in the entries
of all copies is `P^{−ℓ}` times the sum of the row weight for `ρ` of its part in the copy `i` and of
`P^{(j−i) mod N}/q` times (row weight − column weight) of its part in each copy `j ≠ i`.
(a) If `N·n·k·(ℓ + 2) ≤ P^ℓ`, then for all `β, γ ∈ Exp(N, k, n)`, every `h` and every monomial `ν` whose
coefficient in the entry `(β, γ)` of `𝒯_{a′,ℓ,n}(Ψ^h)` is not divisible by `w^c`, the defect of `β` at the
letter `i + ℓ` along `(a, a′)` differs from the weight of `ν` at the copy `i` by at most `3kc`.
(b) A monomial that occurs in an entry of `𝒯_{r,ℓ,n}(Ψ^1)` has degree at most `N·n·k·(ℓ + 2)·P^ℓ` in the
entries of each copy.
(c) For `h ∈ L_{τ_r}(W)` and any factors `ψ`, replacing each `ψ_{s,d}` by `ι_s(h)ψ_{s,d}ι_s(h)⁻¹` replaces
`𝒯_{r,ℓ,n}(ψ)` by `ρ_n(h)·𝒯_{r,ℓ,n}(ψ)·ρ_n(h)⁻¹`.

*Needs:* 1.1, 1.3.

[ShortProof], `New/UpperBound/ElementaryDivisors/FrobeniusFactors.lean`
(`New.FrobeniusCycle.substitutionOperator`, `New.FrobeniusCycle.conjFrobGenericMatrix`,
`New.FrobeniusCycle.copyWeight`, `New.FrobeniusCycle.abs_defect_sub_copyWeight_le`,
`New.FrobeniusCycle.degree_le_of_coeff_substitutionOperator`, `New.FrobeniusCycle.substitutionOperator_map_eq_conj`)

### 1.10 The averaging map

*Origin:* particular to this proof: a map on forms whose image has, modulo `w^c`, no terms of large defect in
any Levi translate, and which multiplies the pairing with all forms in all halfway lattices by `p^{N c₀}`
modulo `w^c`.

*Method of the formal proof:* substitute the generic matrices of 1.9 into the form, and apply in each copy
either the invariant average of 1.6 (for the Levi subgroup of the blocks, with bad monomials those of row
weight above `2c*P^ℓ`) or `p^{c₀}` times evaluation at `1`. With no average this gives `p^{N c₀}` times the
identity; by 1.9 (a) a bad monomial forces a large defect and a large defect a bad monomial, so averaging in
all copies removes the terms of large defect, while by 1.8 (b) adding one averaged copy at a time changes the
pairing with a form in all halfway lattices only by a multiple of `w^c`.

Let `O` be a valuation domain of characteristic `0` in which `p` is not a unit, `T` a Frobenius cycle over `W`
and `O` with `N = 2ℓ` letters, `a′ = a + 1 ≤ k − 1`, and `N·k·(ℓ + 2)·n + n + k < P^ℓ`. Let `(b, b′)` be an edge
pairing and `c ∈ ℕ`, `c* = 3kc`. Then there is a matrix `Av` on `O^{Exp(N,k,n)}` with:
(a) for every `h`, `Av·h ∈ DC(a, a′; w^c O; 3c*)`: for every `g ∈ L_{τ_{a′}}(W)`, `w^c` divides the coefficient
of `ρ_n(g)·Av·h` at every exponent whose defect along `(a, a′)` exceeds `3c*` at some letter;
(b) for every `h` and every `h′ ∈ ℋ_{a′}`, `⟨Av·h, h′⟩ ≡ p^{N c₀}⟨h, h′⟩ (mod w^c)`.

*Needs:* 1.6, 1.7, 1.8, 1.9.

[ShortProof], `New/UpperBound/ElementaryDivisors/AveragingMap.lean`
(`New.FrobeniusCycle.exists_average_mem_defectConditions_and_dvd_sub`)

### 1.11 The share of the Pieri cone in a slab

*Origin:* particular to this proof: the cone of Pieri's inequalities between a vector and `P` times its shift
by one letter, read through the step map, fills the fraction `Π_{l<k}(q − 1)/(q^{l+1} − 1)` of a product of
degree slabs.

*Method of the formal proof:* interlacing of two decreasing sequences is a determinant of indicators; a
signed sum over permutations of the volumes of the images of the positive orthant under the twisted step maps,
each a linear map of determinant `det(1 − τ/q)`, gives the share of the cone, which depends only on `k` and
`q`; it is computed for one letter, where the step map is a homothety.

For `P > 1`, `N ≥ 1`, a sign `v(j) ∈ {±}` for each `j ∈ ℤ/N` and `q := P^N`: the *step map* sends
`ν : {0,…,k−1} × ℤ/N → ℝ` to `β(b, j) = ±(P·ν(b, j + 1) − ν(b, j))` (sign `v(j)`); the *Pieri cone* is the set
of `ν` with `P·ν(b + 1, j + 1) ≤ ν(b, j)` when `v(j) = +` and `ν(b + 1, j) ≤ P·ν(b, j + 1)` when `v(j) = −`;
for `D : ℤ/N → ℝ` the *slab* `Slab(D)` is the set of `β ≥ 0` with `Σ_b β(b, j) ∈ [D(j) − 1, D(j)]` for all `j`.
If `Ω` is a set whose preimage under the step map is the Pieri cone, then
`Π_{l=0}^{k−1} ((q^{l+1} − 1)/(q − 1)) · vol(Ω ∩ Slab(D)) = vol(Slab(D))`.

*Needs:* Mathlib (Lebesgue measure, determinants).

[ShortProof], `New/UpperBound/ElementaryDivisors/PieriCone.lean` (`New.prod_mul_volume_real_inter_degreeSlab`,
`New.volume_real_inter_degreeSlab_eq_signed_sum`, `New.det_interlacing_indicator`)

### 1.12 The dimension of the forms of bounded defect

*Origin:* particular to this proof: in large degree, the forms whose Levi translates have no terms of defect
above a bound have dimension at most `(1 + θ)` times the number of exponents divided by the number of edges
into a lattice.

*Method of the formal proof:* substitute `m`-th powers of the variables for `m` a power of `q` and pack the
residue classes of exponents modulo `m` into one polynomial; among the terms of all Levi translates one of
least height (height `b` for even and `−b` for odd letters) has defect at most `0` along the other simple roots
by 1.3 (d) and occurs in the translate by a representative of a coset of the lower Iwahori subgroup. After a
shift, its exponent divided by `m` lies in the cone of Pieri's inequalities cut by a slab, and as `m` grows
the count becomes a volume (1.11), whose share is the inverse of the number of flags.

Let `T` be a Frobenius cycle over a field `K` of characteristic `p`, `a′ = a + 1 ≤ k − 1`, `t ≥ 2(k + 1)` an
integer, and `S := DC(a, a′; 0; 3t)` over `K`.
(a) There are degrees `D(s) ∈ [1, n + 4tP^{2a′}]` with `dim_K S ≤ [L_{τ_{a′}}(W) : L_{τ_{a′}}(W) ∩ B⁻(W)]·
vol(C ∩ Slab(D))`, where `B⁻(W)` is the lower Iwahori subgroup (matrices lower triangular modulo the maximal
ideal) and `C` the set of real vectors of defect at most `0` along every simple root `(b, b + 1)` at every
letter.
(b) If `n > 0`, `θ ≤ 1` and `8·N·k·t·P^{2a′} ≤ θn`, then
`[GL_k(W) : P_{τ_{a′}}(W)]·dim_K S ≤ (1 + θ)·#Exp(N, k, n)`.

*Needs:* 1.1, 1.3, 1.11; Mathlib `BoxIntegral.unitPartition.tendsto_card_div_pow_atTop_volume` (the number of
points of `m⁻¹ℤ^d` in a bounded measurable set with null frontier, divided by `m^d`, tends to its volume) and
`Matrix.card_GL_field` (the order of `GL_k` of a finite field, which gives the index of a parabolic subgroup).

[ShortProof], `New/UpperBound/ElementaryDivisors/DefectCount.lean`
(`New.FrobeniusCycle.exists_finrank_defectConditions_le_volume`, `New.FrobeniusCycle.index_mul_finrank_defectConditions_le`,
`New.FrobeniusCycle.defectCone`)

### 1.13 Conditions at an edge, and the size conditions

*Origin:* particular to this proof: under explicit size conditions, at each edge there are congruence
conditions modulo `w^c` that contain the forms in all halfway lattices and the values of the averaging map,
and whose reductions form a space of small dimension; and the integral functions on origins have small
colength among the origin functions.

*Method of the formal proof:* the conditions are the defect conditions of 1.10 with the precision
`c = 5Nc₀`; (a) collects 1.8 (b), 1.10 and 1.12 (b) over the residue field of `O`. (b) is 1.8 (c) with the
dimension bound 1.4 (b).

Let `O` be a valuation domain of characteristic `0` in which `p` is not a unit, `T` a Frobenius cycle over `W`
and `O`, and say that `(k, n, r, θ)` is *of large degree* if `0 < r`, `2r ≤ k`, `0 < θ ≤ 1`, `n⁴ ≤ q` and
`(N·k·log q/θ)⁵·P^{3r} ≤ n`. Let `(k, n, r, θ)` be of large degree and `c := 5Nc₀`.
(a) For every edge pairing `(b, b′)` there are an `O`-submodule `C ⊆ O^{Exp}`, a subspace `S` of
`(O/𝔪_O)^{Exp}` and a matrix `Av` such that: `ℋ_r ⊆ C`; `w^c h ∈ C` for every `h`; `Av h ∈ C` for every `h`;
`⟨Av h, h′⟩ ≡ p^{N c₀}⟨h, h′⟩ (mod w^c)` for `h′ ∈ ℋ_r`; the reduction of every `h` with `w^{c−1}h ∈ C` lies in
`S`; and `[GL_k(W) : P_{τ_r}(W)]·dim S ≤ (1 + θ)·#Exp(N, k, n)`.
(b) In the situation of 1.8 (c), the matrices `Q`, `R`, `d` can be taken with `Q` of image exactly the origin
functions and `det d` dividing `w^{|X|·⌊c_div(k,n,r)·#Exp(N,k,n)⌋}`.

*Needs:* 1.4, 1.7, 1.8, 1.10, 1.12.

[ShortProof], `New/UpperBound/ElementaryDivisors/ElementaryDivisorTheorem.lean` (`New.FrobeniusCycle.IsLargeDegree`,
`New.FrobeniusCycle.exists_isEdgeCondition`, `New.FrobeniusCycle.IsLargeDegree.exists_basis_det_dvd`)

### 1.14 Elementary divisors of the edge Hecke operator

*Origin:* particular to this proof: an operator that factors through the edge Hecke operator of a Frobenius
cycle is onto the image modulo `p^m` up to a colength of mean exponent `3c_div + θm` per coordinate.

*Method of the formal proof:* on vectors multiplied by the pairing weights the edge Hecke operator factors as
the inclusion of the integral functions on origins into the origin functions, followed by the map that adds
the values at the edges into a lattice in coordinates dual to the halfway lattices; its image contains
`p^{Nc₀}` times the target. The conditions at the edges give a near inverse whose values satisfy them, so by
Nakayama's lemma the image of the origin functions together with few further generators contains
`p^{2Nc₀}` times the target; the colengths at both ends are those of 1.13, and they add along the chain.
Colengths in the sense of determinants replace lengths because `O` need not be discrete.

Let `O` be a valuation domain of characteristic `0` in which `p` is not a unit, `T` a Frobenius cycle over `W`
and `O`, `(k, n, r, θ)` of large degree (1.13), `X` a finite set, `H`, `I` finite sets with
`J : I ≅ Exp(N, k, n) × H`, edge coordinates as in 1.7 (e), and `A` the edge Hecke operator (1.7 (f)). Let
`f : (X → O^I) → V` be `O`-linear and `Y` an endomorphism of `V` with `Y∘f = f∘A`. Then for every `m ∈ ℕ`,
`Y` is onto `f(X → O^I)` modulo `p^m` up to colength `(3c_div(k, n, r) + θm)·|X|·|I|`. If `O` is a discrete
valuation ring, the length of `L/(YL + p^mL)`, `L` the image of `f`, is at most that exponent times the
length of `O/pO`.

*Needs:* 1.7, 1.8, 1.13; OneSidedPrimeSumBoundsAndAdmissibleData §1.1 (colength of modules); ShortGRH background
(over a valuation domain a square matrix is a product of an invertible matrix, a diagonal matrix and an
invertible matrix; [ShortProof] `Lib/General/LinearAlgebra/IntegralLattices.lean`
(`New.IsValuationPair.smith_normal_form`)).

[ShortProof], `New/UpperBound/ElementaryDivisors/ElementaryDivisorTheorem.lean`
(`New.FrobeniusCycle.elementary_divisors`, `New.FrobeniusCycle.elementary_divisors_length`,
`New.FrobeniusCycle.exists_colengthDvd_range_pairingMap_mul_edgeRestriction`)

## Layer 2: Gains, losses, marks and ramified source forms

This layer fixes, prime by prime, the divisibility asked of the chain (the gain) and what may be lost; it
defines the exceptional primes (2.1 (f)), the marked sets
of primes above them and the scaled Hecke operators there, and proves what it needs of the ramified source forms.
Partners of a-places can be a-places at other inert primes too, for instance when `p ≡ −1` modulo `q₀` and
modulo `m`; those collisions are paid by the loss, which is `m` times larger at `p ≡ ±1 (mod m)` (2.1 (d),
2.7 (b)).

### 2.1 Definitions: local prime sums, the gain, the loss and exceptional primes

*Origin:* definitions and conventions.

*Method of the formal proof:* none: these are definitions.

Let `p` be a prime.
(a) `I_p`, `v(π_p)` and `γ_p` are the numbers at `p` of DivisibilityOfThetaDerivatives §2.1: `I_p` is the set
of odd `e ≥ 1` if `p` is inert in `K` (`χ_K(p) = −1`), of all `e ≥ 1` if `p = d`, and empty if `p` splits;
`v(π_p)` is `1/2` if `p = d` and `1` otherwise; and `γ_p = v(π_p)·Σ_{e∈I_p} p^{−e}`, which is `p/(p² − 1)`,
`1/(2d − 2)`, `0` for `p` inert, `p = d`, `p` split.
(b) The *local prime sum* `s_p(y, σ)` and its total are those of
OneSidedPrimeSumBoundsAndAdmissibleData §4.1; this roadmap writes `F(p)` for the total `S_p` of that section.
(c) The *gain* is `gain(p) := m·(Σ_{τ∈Φ_a} s_p(a, τ) + k·F(p))`.
(d) `p` is *small non-split* if `p < x₁` and `χ_K(p) ≠ 1`. The *loss* is
`loss(p) := f·a·(log b)²/p`, multiplied by `m` if `p ≡ ±1 (mod m)`. The *allowed loss* `err₀(p)` is
`2·loss(p)` if `p` is small non-split, `2mfb` if `p = N`, and `0` otherwise; for a natural number `n` that
is not prime, `err₀(n) := 0` (the sums of 2.3 and 4.9 run over sets of natural numbers).
(e) `𝔯(p)` is the least `r` with `m ≤ p^r`; `ν_p := 𝔯(p)·f·(n_m + 𝔯(p))`; `j_p := ⌈2mfa/p⌉`; `o₀(p)` is the
order of the class of `u(−p)` in `(ℤ/q₀)ˣ`.
(f) `p` is *exceptional* if `χ_K(p) = −1`, `p ≢ ±1 (mod m)`, and `o₀(p)` is odd and at most `𝔯(p)`.
(g) For a set `S ⊆ Φ`, a *collision outside `S`* is a pair `(τ, e)` with `e ∈ I_p` and `τ`, `(−p^e)τ` both in
`Φ_a ∖ S`; `coll_p(S) := Σ_τ Σ_{e : (τ,e) collision} a/p^e`.

*Needs:* OneSidedPrimeSumBoundsAndAdmissibleData §2.1 (the parameters and `χ_K`), §2.2 (the infinite places and
the place of an integer), §3.2 (admissible data: the weight, the a-places, the scales and the ranks), §4.1 (the
local prime sums `s_p` and their total);
DivisibilityOfThetaDerivatives §2.1 (the numbers `I_p`, `v(π_p)`, `γ_p` at a prime).

[ShortProof], `New/UpperBound/Size/ShortColumns.lean` (`New.Data.gain`, `New.Data.IsSmallNonsplit`, `New.Data.loss`, `New.Data.ceilLogLifts`, `New.Data.transferExponent`,
`New.Data.collisionExponent`, `New.Data.o₀`, `New.Data.IsExceptional`, `New.Data.IsCollision`, `New.Data.collisionSum`);
`New/UpperBound/Size/Estimates.lean` (`New.Data.allowedLoss`)

### 2.2 The gain prime by prime

*Origin:* particular to this proof: the prime sums are sums over primes of the local prime sums, and the gain
vanishes at the primes that split in `K` and at the primes from `x₁` on.

*Method of the formal proof:* the summand of the prime sum is supported on prime powers below `x₁`, because
every weight is at least `a/x₁`; grouping it by primes and using `Λ(p^e) = log p` and
`(1 − χ_K(p^e))/2 = [e ∈ I_p]·v(π_p)` gives the identities.

(a) For a prime `p`, `s_p(y, σ) = Σ_{e≥1} ((1 − χ_K(p^e))/2)·(y/p^e − κ((−p^e)σ))₊`.
(b) If `x₁ ≤ p` and `y ≤ a`, then `s_p(y, σ) = 0`; hence `gain(p) = 0` if `χ_K(p) = 1` or `p ≥ x₁`.
(c) For `y ≤ a` and every integer `U ≥ ⌈x₁⌉`, `s_fin(y, σ) = Σ_{p<U prime} 2·s_p(y, σ)·log p`.
(d) For every finite set `U` of primes, `Σ_{p∈U} 2F(p)·log p ≤ Σ_{τ∈Φ} s_fin(κ(τ), τ)`, and `F(p) ≥ 0`.

*Needs:* 2.1; OneSidedPrimeSumBoundsAndAdmissibleData §4.1 (the prime sums).

[ShortProof], `New/UpperBound/Size/Estimates.lean` (`New.Data.localPrimeSum_eq_tsum`, `New.Data.localPrimeSum_eq_zero`,
`New.Data.gain_eq_zero`, `New.Data.primeSum_eq_sum_localPrimeSum`, `New.Data.sum_localPrimeSumTotal_mul_log_le`,
`New.Data.localPrimeSumTotal_nonneg`)

### 2.3 The sum of the allowed losses

*Origin:* particular to this proof: the allowed losses, weighted by `log p`, add up to at most the error unit.

*Method of the formal proof:* a non-zero term `err₀(p)·log p` is at most `4fa(log b)²·log x₁/c` for some
integer `1 ≤ c ≤ x₁`: for `p = N` take `c = 1`; for a small non-split `p` take `c = p`, unless `p ≡ ±1 (mod m)`,
in which case `p = mc ± 1` and `m ≤ 2p/c` for a suitable `c`. A given `c` is used only for
`p ∈ {N, c, mc − 1, mc + 1}`, so the sum is at most `16fa(log b)²·log x₁·Σ_{c≤x₁} 1/c`, which the size
inequalities bound by `u_E`.

For every finite set `U` of natural numbers, `Σ_{p∈U} err₀(p)·log p ≤ u_E = f·a·(log b)³`.

*Needs:* 2.1; OneSidedPrimeSumBoundsAndAdmissibleData §3.3 (the size inequalities), §4.1 (the error unit).

[ShortProof], `New/UpperBound/Size/Estimates.lean` (`New.Data.sum_allowedLoss_mul_log_le`,
`New.Data.exists_mul_sub_one_eq_or_mul_add_one_eq`)

### 2.4 Definitions: induced primes, marked sets and integral source forms

*Origin:* definitions and conventions.

*Method of the formal proof:* none: these are definitions.

Fix a prime `p` and `ι : ℂ → ℂ_p`.
(a) For `σ ∈ Φ`, read as an embedding `E → ℂ`, the *induced prime* `w_σ` is the prime of `E` above `p` at
which the embedding `ι∘σ : E → ℂ_p` is integral (the centre of `{y ∈ E : |ι(σ(y))| ≤ 1}`).
(b) A finite set `Λ` of primes of `E` is *marked* if `p` is exceptional and small non-split, `Λ` is disjoint
from its set of complex conjugates, and every `𝔩 ∈ Λ` is `w_τ` for some `τ ∈ Φ_a`. It is a *full mark* if
moreover, for every `τ ∈ Φ_a`, `w_τ ∈ Λ` or `w̄_τ ∈ Λ`.
(c) `Φ(Λ) := {σ ∈ Φ : w_σ ∈ Λ}`, and `A_𝔩 := a·#{τ ∈ Φ_a : w_τ = 𝔩}`.
(d) The *integral source forms* `𝓜_ι` are the source forms of gauge at most `1` at the base point `1`; they
form an `𝒪_ι`-module.

*Needs:* 2.1; OneSidedPrimeSumBoundsAndAdmissibleData §2.2 (the infinite places as embeddings of `E`), §3.2 (the
a-places and the scale `a`); ThetaLiftChainsAndTheSeesawIdentity §2.8 (source forms).

[ShortProof], `New/UpperBound/Divisibility/MarkedPrimes.lean` (`New.Data.inducedPlace`, `New.Data.IsMarked`,
`New.Data.IsFullMark`, `New.Data.placesInducing`, `New.Data.heckeScalingExponent`, `New.Data.integralSourceForms`)

### 2.5 Marked sets at an exceptional prime

*Origin:* particular to this proof: at an exceptional prime the a-places that induce a prime or its conjugate
form one orbit under multiplication by the place of `−p^{o₀}`; full marks exist and leave no collision.

*Method of the formal proof:* `m` is a power of `2` dividing neither `p − 1` nor `p + 1`, and `2^s = m^{22}`
divides `q₁`, so lifting the exponent shows that `m` divides the order of `u(−p)`; even powers of `u(−p)` fix
an induced prime and odd powers conjugate it. A full mark takes, from each conjugate pair of induced primes
of a-places, the smaller one for a fixed order. In a collision outside `Φ(Λ)` the place `τ` induces a
conjugate of a prime of `Λ`, and then its odd partner `(−p^e)τ` induces a prime of `Λ`.

Let `p` be exceptional, `ι : ℂ → ℂ_p`, and `o` the order of `u(−p)` in `Φ`.
(a) `o₀(p)` is odd, `o₀(p) ≤ 𝔯(p) ≤ l₀`, and `m` divides `o`. Every `w_τ` has absolute norm `p^o` and differs
from its conjugate; for odd `e`, `(−p^e)τ` induces `w̄_τ`; and `σ` induces `w_τ` or `w̄_τ` if and only if
`σ = u(−p)^i·τ` for some `i`.
(b) If `p < x₁`, a full mark exists.
(c) For a full mark `Λ`, `coll_p(Φ(Λ)) = 0`.
(d) Let `Λ` be marked. Then `#Λ ≤ f`; `p` divides neither `M` nor `N` (and `p ≠ N`); a place `σ` with `w_σ ∈ Λ`
or `w̄_σ ∈ Λ` is not a b-place, so `κ(σ) = a/x₁`; and for every function `G` of a weight and a prime,
`Σ_{σ : w_σ∈Λ} G(κ_j(σ), w_σ) = Σ_{σ : w̄_σ∈Λ} G(κ_j(σ), w̄_σ)`, where `κ_j(σ) = κ(σ) + (j + 1/2)Δ` is the
weight of the character of lift `j`.
(e) Let `Λ` be marked and `𝔩 ∈ Λ`. Then `𝔩` lies above `p`, `p` is a uniformiser at `𝔩`, `𝔩 ≠ 𝔩̄`, and the
elements of the standard maximal compact subgroup of `G_f(X₀)` that are `1` away from `𝔩` and `𝔩̄` lie in
`K₀`.

*Needs:* 2.1, 2.4; OneSidedPrimeSumBoundsAndAdmissibleData §2.2 (the group of infinite places), §3.2 (admissible
data), §3.3 (the size inequalities).

[ShortProof], `New/UpperBound/Divisibility/MarkedPrimes.lean` (`New.Data.IsExceptional.hasExceptionalOrbits`,
`New.Data.IsExceptional.m_dvd_orderOf`, `New.Data.exists_isFullMark`, `New.Data.IsFullMark.collisionSum_placesInducing_eq_zero`,
`New.Data.IsMarked.card_le`, `New.Data.IsMarked.cast_weight_eq`, `New.Data.IsMarked.sum_placesInducing_eq_sum_placesInducingConj`,
`New.Data.IsMarked.valuation_natCast_eq_exp_neg_one`, `New.Data.IsMarked.isSplit`, `New.Data.IsMarked.maxCompactAt_le_levelX`,
`New.Data.IsMarked.not_dvd_M_mul_N`, `New.Data.IsMarked.notMem_bPlaces`, `New.Data.IsMarked.natCast_mem_asIdeal`)

### 2.6 Definition: the scaled Hecke operators of a marked set

*Origin:* definitions and conventions.

*Method of the formal proof:* none: this is a definition.

Let `Λ` be marked and `𝔩 ∈ Λ`. For a split prime `𝔩` and `0 ≤ i ≤ n` (`n` the rank of the space, `ϖ` a
uniformiser at `𝔩`), `T_{𝔩,i}` is the Hecke operator of the double coset
`GL_n(𝒪_𝔩)·diag(ϖ·1_i, 1_{n−i})·GL_n(𝒪_𝔩)` on forms spherical at `𝔩` (fixed by the elements of the standard
maximal compact subgroup that are `1` away from `𝔩` and `𝔩̄`): `T_{𝔩,i}φ` is the sum of the right translates
of `φ` by representatives `h` of the cosets `h·GL_n(𝒪_𝔩)` in the double coset, where `h ∈ GL_n(E_𝔩)` is
read in `G_f` with component `h` at `𝔩`, the inverse of the conjugate transpose of `h` at `𝔩̄`, and `1`
elsewhere. By 2.5 (e) source forms are spherical at `𝔩`, and `T_{𝔩,i}` preserves `𝒮`. The *scaled Hecke
operator* is `Y_𝔩 := p^{A_𝔩}·T_{𝔩,𝔯(p)}`, an `𝒪_ι`-linear endomorphism of `𝒮`; `Y_Λ := Π_{𝔩∈Λ} Y_𝔩`.

*Needs:* 2.4, 2.5; AutomorphicFormsOnReductiveGroups §7.4 (the operator `T_η` of a double coset `JηJ` on the
algebraic forms of level `J`, here for `η = diag(ϖ·1_i, 1_{n−i})` at a split place and `J` containing the
maximal compact subgroup there; [ShortProof] `Lib/Weil/Unramified/SplitHecke.lean` (`New.heckeSplit`,
`New.sphericalAt`)).

[ShortProof], `New/UpperBound/Divisibility/MarkedPrimes.lean` (`New.Data.IsMarked.scaledHeckeOperator`)

### 2.7 The divisibility bound of one lift: only collisions lose

*Origin:* particular to this proof: the divisibility that the jets predict for one lift, after removing the
long rows at a set of places, is at least the share of one lift in the gain, less the collisions and a small
loss.

*Method of the formal proof:* the predicted divisibility and the gain are both sums over places and exponents
`e ∈ I_p`; term by term, a place and its partner `(−p^e)τ` lose only if both are a-places outside the removed
set (a collision), the low columns cost at most `a/(pm)` at each place through `γ_p`, the terms with
`p^e ≥ x₁` vanish, and the remaining errors are absorbed by the size inequalities.

Let `p` be a prime and `0 ≤ j < m`. For `S ⊆ Φ`, remove the columns of height one at the places of `S` from
the lift diagrams of step `j`, read at the heights below `n_{j+1}`; let `B` and `B^S` be the numbers of
boxes in the columns of height below `n_{j+1}` before and after the removal, and `PD_p(j, S)` the predicted
divisibility at `p` of the remaining diagrams for the partner map `τ ↦ (−p^e)τ`
(DivisibilityOfThetaDerivatives §3.1, the predicted divisibility of a family of Young diagrams at `p`). Put
`D_p(j, S) := PD_p(j, S) + γ_p·(B − B^S) − f·n_{j+1}³·(1 + log_p max(B, 1))`, and let `lc_j(σ)` be the number
of columns at `σ` of height below `n_{j+1}` and other than `1`.
(a) If `p` is small non-split, then for every `S`,
`D_p(j, S) ≥ gain(p)/m − coll_p(S) + v(π_p)·#(Φ_a ∩ S)·a/x₁ − f·(log b)²·a/(mp)`.
(b) If `p` is small non-split and not exceptional, then `m·coll_p(∅) ≤ loss(p)`.
(c) If every collision outside `S` has `e ≥ o`, then `coll_p(S) ≤ 2fa/p^o`.
(d) `f·(log b)²·a/p ≤ loss(p)`; and `γ_p·lc_j(τ) ≤ a/(pm)` for every `τ`.

*Needs:* 2.1, 2.2; DivisibilityOfThetaDerivatives §3.1 (the predicted divisibility of a family of Young diagrams
at `p`); ThetaLiftChainsAndTheSeesawIdentity §2.2 (weights and lift diagrams);
OneSidedPrimeSumBoundsAndAdmissibleData §3.2 (admissible data), §3.3 (the size inequalities).

[ShortProof], `New/UpperBound/Divisibility/JetExponent.lean` (`New.Data.divisibilityBound`, `New.Data.lowColumns`,
`New.Data.le_divisibilityBound`, `New.Data.mul_collisionSum_le_loss`, `New.Data.collisionSum_le`, `New.Data.le_loss`,
`New.Data.gammaPrime_mul_lowColumns_le`)

### 2.8 The budget of a marked set

*Origin:* particular to this proof: what the Hecke operators of a marked set cost, per lift and in colength,
is paid by the loss.

*Method of the formal proof:* a place that induces a prime of `Λ` is not a b-place, so its low columns number
about `a/x₁`, and `𝔯(p) = 1` when `p ≥ m`, in which case the place is itself an a-place; the rest is bounded
by the size inequalities. For (b) the `A_𝔩` add up to at most `af`.

Let `Λ` be marked.
(a) For `j < m`, `#Λ·ν_p + 𝔯(p)·Σ_{σ∈Φ(Λ)} lc_j(σ) ≤ loss(p)/m + #(Φ_a ∩ Φ(Λ))·a/x₁`.
(b) `m·Σ_{𝔩∈Λ} (12A_𝔩/(mp) + j_p/(m²f)) ≤ loss(p)`.

*Needs:* 2.1, 2.4, 2.5, 2.7; OneSidedPrimeSumBoundsAndAdmissibleData §3.2 (admissible data), §3.3 (the size
inequalities).

[ShortProof], `New/UpperBound/Divisibility/MarkedPrimes.lean`
(`New.Data.IsMarked.card_mul_transferExponent_add_sum_lowColumns_le`); `New/UpperBound/Divisibility/LocalDivisibility.lean`
(`New.Data.IsMarked.mul_sum_heckeScalingExponent_le_loss`)

### 2.9 Scalings above the level prime

*Origin:* particular to this proof: each prime above `N` dividing `π_N` carries a norm-one integral idele that
is trivial elsewhere and generates the units of its residue field.

*Method of the formal proof:* the component at `w` of `z_w` generates the cyclic group of units of the residue
field, which has order `N − 1`, and this gives (a); a scalar matrix with integral unit entries, equal to `1`
away from `w` and `w̄`, lies in the groups of (b), and its powers are tested in `K_j` at `w`.

Let `w` be a prime of `E` dividing `π_N`. Scalings at `w`, the scaling `z_w` and the ramified source forms
`𝒮^ram` are those of ThetaLiftChainsAndTheSeesawIdentity §2.8: a scaling is an integral finite idele `z` with
`zz̄ = 1` whose components are `1` away from `w` and `w̄`, and `z_w` is a fixed scaling whose component at `w`
generates the units of the residue field.
(a) For the component `z_{w,w}` of `z_w` at `w`: `z_{w,w}^i ≡ 1 (mod w)` if and only if `(N − 1) | i`.
(b) The scalar matrix of `z_w` lies in the standard maximal compact subgroup at `w` and in the subgroup of the
standard maximal compact subgroup of the elements that are `1` modulo every prime of `E` dividing `π_M` (the
conjugate of `π̄_M`), and its `i`-th power lies in `K_j` if and only if `(N − 1) | i`.
(c) Right translation by the scalar matrix of `z_w` is an operator of order dividing `N − 1` on the forms of
level `K_j` on `X_j`.

*Needs:* OneSidedPrimeSumBoundsAndAdmissibleData §3.2 (the level prime `N` and `π_N`);
ThetaLiftChainsAndTheSeesawIdentity §2.1 (the definite spaces `X_j`), §2.6 (their levels `K_j`), §2.8 (scalings,
the existence of the scaling `z_w`, and the ramified source forms).

[ShortProof], `New/UpperBound/Size/ShortColumns.lean` (`New.Data.exists_isScalingAt_valuation_pow_iff`,
`New.Data.scalingGenerator`, `New.Data.scalarFin_scalingGenerator_mem_maxCompactAt`,
`New.Data.scalarFin_scalingGenerator_mem_chosenLevel`,
`New.Data.scalarFin_scalingGenerator_pow_mem_levelX_iff`, `New.Data.algFormCentralRep_scalingGenerator_pow`)

The ramified source forms `𝒮^ram = {φ ∈ 𝒮 : Σ_{i=0}^{N−2} z_w^i·φ = 0 for every prime w | π_N}` are defined in
ThetaLiftChainsAndTheSeesawIdentity §2.8; there is no section 2.10.

### 2.11 Ramified source forms: an image, and their codimension

*Origin:* particular to this proof: the ramified source forms are the image of `Π_w(1 − z_w)` and have
codimension at most `f/(N − 1)` times the dimension of the source forms.

*Method of the formal proof:* in the group algebra, `1 − z_w` divides `(N − 1) − Σ_i z_w^i`, which gives the
image; the kernel of `1 − z_w` is the space of forms of the level generated by `K₀` and `z_w`, which is free,
of index at least `N − 1` over `K₀`, and dimensions at a free level are proportional to the index; kernels
add under products.

(a) For each `w | π_N` and `φ` of level `K_j`: `Σ_{i<N−1} z_w^i φ = 0` if and only if `φ = ψ − z_w ψ` for
some `ψ` of the same level. `𝒮^ram` is the image of `Π_{w|π_N}(1 − z_w)` on `𝒮`.
(b) `dim ker(1 − z_w) ≤ D_X/(N − 1)`, so `dim ker Π_{w∈s}(1 − z_w) ≤ #s·D_X/(N − 1)`.
(c) `dim 𝒮^ram ≥ (1 − f/(N − 1))·D_X`, and `f/(N − 1) ≤ b^{−8}`.

*Needs:* 2.9; ThetaLiftChainsAndTheSeesawIdentity §2.8 (the ramified source forms);
OneSidedPrimeSumBoundsAndAdmissibleData §3.3 (the size inequalities); AutomorphicFormsOnReductiveGroups §7.4,
§7.5 (evaluation at representatives of the classes identifies the forms of a level with trivial stabilisers
with one vector of the weight for each class, so that their dimension is the number of classes times the
dimension of the weight; [ShortProof] `Lib/Adelic/AutomorphicForms/HeckeEigenforms.lean`
(`New.freeLevelEquiv`, `New.finrank_levelSpace_smoothFormRep`)).

[ShortProof], `New/UpperBound/Size/ShortColumns.lean` (`New.Data.centralRep`, `New.Data.ramifyingOp`,
`New.Data.sum_scalingGenerator_pow_eq_zero_iff_exists_eq_sub`,
`New.Data.ramifiedSourceForms_eq_range`, `New.Data.exists_eq_sub_scalingGenerator`, `New.Data.finrank_ker_one_sub_scalingGenerator_le`,
`New.Data.finrank_ker_ramifyingOp_le`, `New.Data.le_finrank_ramifiedSourceForms`, `New.Data.f_div_N_sub_one_le`)

## Layer 3: The chain of lifts at a prime other than `N`

Fix a prime `p ≠ N`, `ι : ℂ → ℂ_p`, a twist `ϑ` with `p ∤ q(ϑ)` and a weak chain datum `Ψ` for `ϑ`. The
restricted chain `R_ϑ^Ψ` is a combination of chains of `m` single lifts with data `t_x(j)`; this layer bounds
its gauge on integral source forms, and on the image of the scaled Hecke operators at an exceptional prime.

### 3.1 The value of a chain of lifts, and its gauge

*Origin:* particular to this proof: a jointly invariant combination of chains of lifts between definite
groups is, at each point, a finite sum over tuples of classes of products of kernels, so the gauge bounds of
the single lifts multiply.

*Method of the formal proof:* the levels `K_j`, `j < m`, are free, so the integrals over the definite groups
are sums over classes; joint invariance lets the sum over tuples of classes be taken with the kernels at
fixed representatives of the classes, and the gauge is ultrametric.

Let `Φ(x, j)` be data of the lifts `X_j → X_{j+1}`, one for each tuple `x` in the support of a finitely
supported `Ψ`, such that `Σ_x Ψ(x)·⊗_j Φ(x, j)` is invariant under the joint action of `K_0 × ⋯ × K_{m−1}`.
(a) For a source form `φ` and a point `g ∈ G_f(X_m)`, the value at `g` of `Σ_x Ψ(x)·(chain of m lifts with
data Φ(x, ·))(φ)` is the sum, over tuples of classes `c_j ∈ Γ\G_f(X_j)/K_j` (`j < m`) and over `x`, of
`Ψ(x)` times the composite, for `j = 0, …, m − 1` in turn, of the kernels `Θ_j^ϑ` at the data
`ω(h_j, h_{j+1})Φ(x, j)`, applied to `φ(h_0)`; here `h_j` is a fixed representative of `c_j` for `j < m`, and
`h_m = g`.
(b) If moreover `|ι(Ψ(x))| ≤ 1`, every `Φ(x, j)` raises gauges from `d_j` to `d_{j+1}` by at most `p^{r_j}`,
and `φ` has gauge at most `1` at `d_0`, then the combination has gauge at most `p^{Σ_{j<m} r_j}` at `d_m`.
(c) Let `Ψ` be a weak chain datum for `ϑ` and `p ∤ q(ϑ)`, and let `t_j` be linear maps on the data of step `j`
that commute with the action of `K_j × K_{j+1}` on the data `t_x(j)`. Then (b) holds for the data
`t_j(t_x(j))`; in particular the combination is again jointly invariant.
(d) If `Ψ` is a weak chain datum for `ϑ`, `p ≠ N` and `p ∤ q(ϑ)`, then each `t_x(j)`, `x` in the support of `Ψ`,
is a standard datum at `p` for `δ = π̄_M`, and for every `δ` if `p ∤ M` (DivisibilityOfThetaDerivatives §4.8, standard data at `p`).

*Needs:* ThetaLiftChainsAndTheSeesawIdentity §1.1 (d) (gauges and the bound "raises"), §2.8 (the theta kernels
of the lifts), §2.12 (chain data, weak chain data and the composite lift);
DivisibilityOfThetaDerivatives §4.8 (standard data at `p`); ThetaLiftsForDefiniteUnitaryGroups §1.2 (the lift
between definite groups as a sum over the classes of the level, here at levels with trivial stabilisers, where
every class has weight `1`).

[ShortProof], `New/UpperBound/Divisibility/ChainValuation.lean` (`New.Data.chainCombination_eq_sum`,
`New.Data.gaugeLe_chainCombination`, `New.Data.IsWeakChainDatum.gaugeLe_chain`,
`New.Data.IsWeakChainDatum.translateDatum_mem_standardData`)

### 3.2 Restriction from `X_m` to `Y_m`

*Origin:* particular to this proof: restriction to `Y_m` keeps gauge bounds away from `N`, keeps them at `N`
for a base point that absorbs the normalising factor, and multiplies squared norms by an explicit factor.

*Method of the formal proof:* the branching matrix has integer entries and turns the action of the block
matrix `diag(g⁻¹, ·)` into a scalar; the normalising factor `Π_τ τ(π̄_N)^{−n_τ}` of the restriction is a unit
away from `N`, and at `N` it is cancelled by the base point. For the norms, `|σ(τ(π̄_N))|² = N` and the
branching matrix multiplies squared norms by at most `exp(x^{70})`.

Let `res : forms on X_m → forms on Y_m` be the restriction of ThetaLiftChainsAndTheSeesawIdentity §2.12
(restriction from `X_m` to `Y_m`), with the exponents `n_τ` of ThetaLiftChainsAndTheSeesawIdentity §2.2.
(a) If `p ≠ N` and `φ` has gauge at most `c` at the base point `1`, so has `res(φ)`.
(b) Let `p = N` and let `d ∈ G_f(X_m)` be such that, read through the embedding `x ↦ ι(τ(x̄))`, that is, at the
conjugate `w̄_τ` of the induced prime, `d` is `diag(1, …, 1, N)` if `w̄_τ | π_N` and `1` otherwise, for every `τ`. If `φ` has gauge at most `c`
at the base point `d`, then `res(φ)` has gauge at most `c` at the base point `1`.
(c) For every `σ`, `h ∈ G_f(Y_m)`: `‖σ∘res(φ)(h)‖² ≤ exp(x^{70})·N^{−Σ_τ n_τ}·‖σ∘φ(diag(h, 1))‖²`.

*Needs:* 2.4; ThetaLiftChainsAndTheSeesawIdentity §2.2 (the branching map and the exponents `n_τ`),
§2.12 (restriction from `X_m` to `Y_m`); OneSidedPrimeSumBoundsAndAdmissibleData §3.2 (the level prime `N` and `π_N`).

[ShortProof], `New/UpperBound/Divisibility/ChainValuation.lean` (`New.Data.GaugeLe.restrictToY`,
`New.Data.GaugeLe.restrictToY_of_diag`, `New.Data.weylNormSq_restrictToY_le`, `New.Data.norm_star_piMBar_le_one`)

### 3.3 Expanding the gluing of a chain datum

*Origin:* particular to this proof: the glued tensor of a chain datum is a finite sum of plain tensors of
translates of the vacuum, so every composite lift is a restricted chain of a weak chain datum, and the plain
tensor of a chain datum is itself jointly invariant.

*Method of the formal proof:* the gluing of a double lift is a sum over residues modulo `N` of translates by
matrices with simple poles above `N`; expanding it in each double lift and collecting terms gives the weak
chain datum, whose coefficients are `1` and whose number of terms is the number of classes. The projection on
the vacua above `N` takes the glued tensor to the plain tensor and commutes with the integral levels, which
gives the last clause.

Let `ϑ` be a twist and `Ψ` a chain datum for `ϑ`.
(a) The glued tensor of `Ψ` is `Σ_x Σ_y Ψ(x)·⊗_j t_{x + z(y)}(j)`, where `y` runs over a set of *gluing
classes* (a residue modulo `N` for each double lift, basis index of the middle space and prime `w | π_N`), of
cardinality at most `N^{f m n_m/2}`, and the tuples `z(y)` vanish at the places prime to `N`.
(b) There is a weak chain datum `Ψ′` for `ϑ` with `B_ϑ^Ψ(φ) = R_ϑ^{Ψ′}(φ)` for every source form `φ`.
(c) The plain tensor `Σ_x Ψ(x)⊗_j t_x(j)` is invariant under every tuple `(b_j ∈ K_j)` with `b_m = 1`; hence `Ψ`
is itself a weak chain datum for `ϑ`.

*Needs:* ThetaLiftChainsAndTheSeesawIdentity §2.12 (chain data, the glued tensor and the composite lift).

[ShortProof], `New/UpperBound/Divisibility/ChainDatumExpansion.lean` (`New.Data.IsChainDatum.gluedTensor_eq_sum_translates`,
`New.Data.card_gluingClasses_le`, `New.Data.IsChainDatum.exists_isWeakChainDatum_compositeLift_eq`,
`New.Data.IsChainDatum.isInvariant_plainTensor`, `New.Data.IsChainDatum.isWeakChainDatum`)

### 3.4 One lift, at the identity and at a neighbour

*Origin:* particular to this proof: at a non-split prime a standard datum raises gauges by at most the
predicted divisibility, and translated by a neighbour at the primes of a marked set it raises them by at most
the scaling exponents plus the loss of the lift.

*Method of the formal proof:* (a) is the bound for one lift by the predicted divisibility. For (b), up to
integral matrices the neighbour is diagonal with entries `p` on sets of at most `𝔯(p)` indices; the jets
weighted by its entries are bounded with charges on the boxes whose indices are marked
(DivisibilityOfThetaDerivatives §4.11 (d), divisibility of Schur entries of jets with charges), the determinant
factors cancel by the balance 2.5 (d), and the charges are counted by long rows and low columns.

Let `p` be non-split in `K`, `0 ≤ j < m`, and `φ` a datum of `Θ_j^ϑ` that is standard at `p` for `δ = 1`
(DivisibilityOfThetaDerivatives §4.8, standard data at `p`; compare 3.1 (d)).
(a) `φ` raises gauges from `1` to `1` by at most `p^{−D_p(j, ∅)}`.
(b) Let `Λ` be marked and `g ∈ G_f(X_{j+1})` the element with components `g_𝔩` at `𝔩 ∈ Λ` (and the
corresponding components at `𝔩̄`) and `1` elsewhere, where each `g_𝔩` lies in the double coset of
`diag(ϖ·1_i, 1)` for some `i ≤ 𝔯(p)`. Then the translate `ω(1, g)φ` raises gauges from `1` to `1` by at most
`p^{Σ_{𝔩∈Λ} A_𝔩 + λ_j(Λ)}`, where `λ_j(Λ) := 𝔯(p)·Σ_{σ∈Φ(Λ)} lc_j(σ) − D_p(j, Φ(Λ))`.

*Needs:* 2.5, 2.7; ThetaLiftChainsAndTheSeesawIdentity §1.5 (d) (the gauge bound for one lift at a non-split prime
by the predicted divisibility); DivisibilityOfThetaDerivatives §4.8 (standard data at `p`), §4.11 (d) (divisibility
of Schur entries of jets with charges).

[ShortProof], `New/UpperBound/Divisibility/ValuationAtNonSplitPrimes.lean` (`New.Data.mem_raises_neg_divisibilityBound`,
`New.Data.liftLoss`, `New.Data.IsMarked.ω_ofSplitPlaces_mem_raises`, `New.Data.IsMarked.sum_neighborExponent_add_neighborCharge_le`)

### 3.5 Hecke operators through the lifts

*Origin:* particular to this proof: a Hecke operator at a prime of a marked set passes through each lift, and
through the chain, as a `p`-integral combination of Hecke operators on the other side, at an explicit power of
`p`.

*Method of the formal proof:* at a split prime where the datum is the vacuum and the characters are
unramified, the Hecke polynomial of the target, applied to a lift, is a polynomial factor times the lift of
the Hecke polynomial of the source at a rescaled variable; comparing coefficients and clearing the powers
`z^{(t+1)i}q^{binom(i,2)}`, which divide `p^{f𝔯t}` for `i ≤ 𝔯 ≤ t`, gives one lift, and induction gives the
chain.

Let `Ψ` be a weak chain datum for `ϑ`, `p ∤ q(ϑ)`, `Λ` marked, `𝔩 ∈ Λ` with `N𝔩 = z²` (`z = p^h`, `2h ≤ f`), and
`C_e` the chain of the first `e` lifts with data `t_x(·)`, `x` in the support of `Ψ`; write `Θ_e^ϑ` for the
lift `X_e → X_{e+1}` with datum `t_x(e)`. Forms spherical at `𝔩` are sent to forms spherical at `𝔩`, and:
(a) there is `R ∈ 𝒪_ι[U]` with `R(0) = 1`, independent of `x`, such that
`H_𝔩(U)(Θ_e^ϑ φ) = R(U)·Θ_e^ϑ(H_𝔩(z^{t+1}U)φ)` for every `φ` spherical at `𝔩` and every `U ∈ ℂ`, where
`H_𝔩(U) := Σ_{i=0}^{n} (−U)^i·N𝔩^{binom(i,2)}·T_{𝔩,i}` on forms on a space of rank `n`;
(b) for `i ≤ n_e` there are `c_{i,i′} ∈ 𝒪_ι`, independent of `x`, with
`z^{(t+1)i}·N𝔩^{binom(i,2)}·Θ_e^ϑ(T_{𝔩,i}φ) = Σ_{i′≤i} c_{i,i′}·T_{𝔩,i′}(Θ_e^ϑ φ)`;
(c) for `i ≤ 𝔯(p)` the same holds with `p^{f𝔯(p)t}` in place of `z^{(t+1)i}N𝔩^{binom(i,2)}`;
(d) there are `c_i ∈ 𝒪_ι` with `p^{e·f𝔯(p)t}·C_e(T_{𝔩,𝔯(p)}φ) = Σ_{i≤𝔯(p)} c_i·T_{𝔩,i}(C_e φ)`;
(e) the data `t_x(j)` are fixed by the maximal compact subgroup at `𝔩` of `G_f(X_{j+1})`, and for `j < m`
there are `c_i ∈ 𝒪_ι` with `p^{ν_p}·C_{j+1}(T_{𝔩,𝔯(p)}φ) = Σ_{i≤𝔯(p)} c_i·T_{𝔩,i}(C_{j+1}φ)`.

*Needs:* 2.5, 2.6; ThetaLiftChainsAndTheSeesawIdentity §2.8 (the theta kernels of the lifts), §2.12 (weak chain
data and the data `t_x(j)`); ShortGRH background (Hecke polynomials pass through a theta lift at a split place
`w` of norm `q` where the two characters `a`, `b` are unramified and the datum `f` is fixed by the vacuum projection
at `w`: let `S`, `T` be spaces of ranks `n` and `n + k`, `π` a representation of `G_f(S)` on `W`, `ρ` a representation
of `G_f(T)` on `Z`, and `B` a bilinear map from data and `W` to `Z` with `ρ(h)B(f, v) = B(ω(g, h)f, π(g)v)` for all
finite `g`, `h` and all `v`, `ω` the Weil action; if `v` is spherical at `w`, then so is `B(f, v)`, and
`P_w^ρ(X)·B(f, v) = Π_{l<k}(1 − q^l αX)·B(f, P_w^π(q^k αβ⁻¹X)·v)`, with `P_w^π`, `P_w^ρ` the Hecke polynomial
operators at the same place `w`, `α = χ_a(ϖ_w)·q^{n/2}` and `β = χ_b(ϖ_w)·q^{(n+k)/2}`, where
`χ_a(x) = a(x/x̄)·υ(x)^{−n}`, `χ_b(x) = b(x/x̄)·υ(x)^{−(n+k)}` and `ϖ_w` is the chosen uniformiser at `w`; [ShortProof]
`Lib/Weil/Unramified/HeckeTransfer.lean` (`New.SiegelWeil.hecke_transfer_of_pairing`, `New.AutChar.frobValue`)).

[ShortProof], `New/UpperBound/Divisibility/ValuationAtNonSplitPrimes.lean`
(`New.Data.IsWeakChainDatum.exists_heckePolyOp_lift`, `New.Data.IsWeakChainDatum.exists_sum_heckeSplit_lift_eq_smul`,
`New.Data.IsWeakChainDatum.exists_sum_heckeSplit_lift_eq_pow_smul`, `New.Data.IsWeakChainDatum.exists_sum_heckeSplit_chain_eq_pow_smul`,
`New.Data.IsWeakChainDatum.exists_hecke_transfer`)

### 3.6 The chain on the image of the scaled Hecke operators

*Origin:* particular to this proof: on the image of `Y_Λ^m` the chain regains the divisibility that the
neighbours at the marked primes allow, at the price of `#Λ·ν_p` and the loss of each lift.

*Method of the formal proof:* one copy of `Y_Λ` is moved into the datum of each lift: by 3.5 (e), applied
prime by prime of `Λ`, the lift of the chain after `Y_𝔩` is the lift, by a datum changed by a combination of
Hecke operators of the target, of the chain; the changed data commute with the levels and, by 3.4 (b), raise
gauges by the stated amounts; then 3.1 (c) and 3.2 (a).

Let `Ψ` be a weak chain datum for `ϑ`, `p ∤ q(ϑ)` and `Λ` marked.
(a) For each `j` and each list `L` of distinct primes of `Λ` there is a linear map `t` on the data of step
`j` such that, for every `x` in the support of `Ψ`: `t` commutes at `t_x(j)` with `ω(a, b)` for `b` in the
standard maximal compact subgroup; `Θ_j^ϑ(t(t_x(j)))(C_j y) = C_{j+1}(Π_{𝔩∈L} Y_𝔩 y)` for every source form
`y`; and for `j < m` and every `g ∈ G_f(X_{j+1})` of the form of 3.4 (b) (components `g_𝔩` at the primes
`𝔩 ∈ Λ`, the corresponding components at `𝔩̄`, and `1` at all other places) with `g_𝔩 = 1` for `𝔩 ∈ L` and
`g_𝔩` in the double coset of some `diag(ϖ·1_i, 1)`, `i ≤ 𝔯(p)`, for the other `𝔩 ∈ Λ`, `ω(1, g)t(t_x(j))` raises
gauges from `1` to `1` by at most `p^{Σ_{𝔩∈L}(ν_p − A_𝔩) + Σ_{𝔩∈Λ}A_𝔩 + λ_j(Λ)}`.
(b) For every `v ∈ 𝓜_ι`, `R_ϑ^Ψ(Y_Λ^m v)` has gauge at most `p^{Σ_{j<m}(#Λ·ν_p + λ_j(Λ))}` at the base point `1`.

*Needs:* 2.6, 3.1, 3.2, 3.4, 3.5.

[ShortProof], `New/UpperBound/Divisibility/ValuationAtNonSplitPrimes.lean`
(`New.Data.IsWeakChainDatum.exists_lift_eq_chain_scaledHeckeOperator`, `New.Data.IsWeakChainDatum.gaugeLe_scaledHeckeOperator_pow`)

### 3.7 The valuation of the chain at a prime other than `N`

*Origin:* particular to this proof: at a prime other than `N` the chain keeps integrality, gains the gain
less the loss and the collisions, and on the image of `Y_Λ^m` for a full mark gains the gain less twice the
loss.

*Method of the formal proof:* (a) every datum raises gauges by `|ι(π̄_M)|/|ι(π̄_M d)|` to a power, which is `1`
for `p ≠ d`. (b) 3.4 (a) with the lower bound 2.7 (a) for `S = ∅`, added over the `m` lifts. (c) `j_p` pays for
the collisions of all lifts. (d) 3.6 (b) with 2.7 (a) for `S = Φ(Λ)`, where no collision is left (2.5 (c)), and
2.8 (a). (e) 3.3 (b), and the sum of (c) and (d).

Let `Ψ` be a weak chain datum for `ϑ`, `p ∤ q(ϑ)`, and `v ∈ 𝓜_ι`.
(a) If `p ≠ N` and `p ≠ d`, then `R_ϑ^Ψ(v)` is integral.
(b) If `p` is small non-split, `R_ϑ^Ψ(v)` has valuation at least `gain(p) − loss(p) − m·coll_p(∅)`.
(c) If `p` is small non-split, `R_ϑ^Ψ(p^{j_p}v)` has valuation at least `gain(p) − loss(p)`.
(d) If `Λ` is a full mark, `R_ϑ^Ψ(Y_Λ^m v)` has valuation at least `gain(p) − 2·loss(p)`.
(e) If `Ψ` is a chain datum for `ϑ` and `Λ` a full mark, then `B_ϑ^Ψ(φ)` has valuation at least
`gain(p) − 2·loss(p)` for every `φ ∈ Y_Λ^m(𝓜_ι) + p^{j_p}𝓜_ι`.

*Needs:* 2.1, 2.5, 2.7, 2.8, 3.1, 3.2, 3.3, 3.4, 3.6.

[ShortProof], `New/UpperBound/Divisibility/LocalDivisibility.lean` (`New.Data.IsWeakChainDatum.gaugeLe_restrictedChain_one`,
`New.Data.IsWeakChainDatum.gaugeLe_restrictedChain_collisionSum`, `New.Data.IsWeakChainDatum.gaugeLe_pow_collisionExponent_smul`,
`New.Data.IsWeakChainDatum.gaugeLe_restrictedChain_of_isFullMark`, `New.Data.IsChainDatum.gaugeLe_compositeLift_of_isFullMark`)

## Layer 4: The scaled Hecke operator, the level prime, and the divisibility at each prime

### 4.1 The Hecke operator at a marked prime as an edge Hecke operator

*Origin:* particular to this proof: given a Frobenius cycle that matches the a-places above a marked prime,
the scaled Hecke operator on integral source forms factors through an edge Hecke operator, so 1.14 bounds its
colength.

*Method of the formal proof:* the cosets of the Hecke operator at `𝔩` are indexed by edges, determined by
their origin and their change of basis there because the rational points act freely on the classes of the
level; at an a-place inducing `𝔩` or `𝔩̄` an edge acts by the matrices of the letters and powers of `p`; the
Weyl module splits into the monomials at these a-places and a factor on which the edges act integrally; and
integral source forms are families of integral vectors indexed by the classes.

Let `Λ` be marked, `𝔩 ∈ Λ`, `W` the valuation ring of `E` at `𝔩`, and `T` a Frobenius cycle over `W` and `𝒪_ι`
with prime `p`, letters `ℤ/N_T` in bijection `i ↦ σ_i` with the a-places that induce `𝔩` or `𝔩̄`, letter maps
`ι_i = σ_i` if `i` is even and `ι_i = (complex conjugation)∘σ_i` if `i` is odd, and `A_𝔩 = a·#{even letters}`.
(a) Let `p` be a uniformiser at `𝔩`, `r < k`, and `J` a level of the standard space of rank `k` that contains
the maximal compact subgroup at `𝔩` (the elements of the standard maximal compact subgroup that are `1` away
from `𝔩` and `𝔩̄`). Number the basis, and choose for each class `x ∈ Γ\G_f/J` a representative `ρ(x)` that is
integral at the places above `p`. For `b ∈ ParahoricCosets(k, r)` (1.7 (a)) with a fixed representative `β`,
the point obtained from `ρ(x)` by replacing its component at `𝔩` by `β·diag(p·1_r, 1_{k−r})` (and its
component at `𝔩̄` accordingly) is `γ_{x,b}·ρ(y)·η` with `γ_{x,b}` a rational point, `η ∈ J` and `y` a class,
written `origin(x, b)`. Then for every form `φ` of level `J` and any weight,
`(T_{𝔩,r}φ)(ρ(x)) = Σ_b γ_{x,b}·φ(ρ(origin(x, b)))`, the sum over `b ∈ ParahoricCosets(k, r)`, with `γ_{x,b}`
acting in the weight.
(b) If `(k, a, 𝔯(p), θ)` is of large degree (1.13), then for every `j₀ ∈ ℕ`, `Y_𝔩` is onto `𝓜_ι` modulo `p^{j₀}`
up to colength `(3c_div(k, a, 𝔯(p)) + θj₀)·D_X`.

*Needs:* 1.7, 1.13, 1.14, 2.5, 2.6; AutomorphicFormsOnReductiveGroups §7.4 (the operator of a double coset as a sum
over its right cosets), §7.5 (at a level with trivial stabilisers a form is the family of its values at
representatives of the classes; [ShortProof] `Lib/Adelic/Hecke/Basic.lean` (`New.heckeFun_eq_sum_pullback`),
`Lib/Adelic/AutomorphicForms/HeckeEigenforms.lean` (`New.freeLevelEquiv`)).

[ShortProof], `New/UpperBound/Divisibility/HeckeEdges.lean` (`New.Columns.HeckeEdges.heckeSplit_apply_rep`,
`New.Columns.nonempty_heckeEdges`, `New.Columns.isOntoUpToColength_scaledHeckeOperator_of_frobeniusCycle`)

### 4.2 The Frobenius cycle of a marked prime

*Origin:* particular to this proof: the a-places above a marked prime form a Frobenius cycle whose sizes meet
the conditions of large degree.

*Method of the formal proof:* the automorphism of `E` named by `−p^e`, for odd `e`, acts as `y ↦ ȳ^{p^e}` modulo
the primes above `p`; with one conjugation for the places that induce `𝔩̄`, consecutive letter maps differ by
the `p^{o₀}`-th power modulo `p`. The sizes follow from the size inequalities.

Let `p` be inert in `K`, `o₀ = o₀(p)` odd, `τ ∈ Φ_a`, and `N′` the order of `u(−p)^{o₀}`.
(a) There is an injective `t : ℤ/N′ → Φ` with `t(i + 1) = u(−p^{o₀})·t(i)` whose image is the set of a-places
that induce `w_τ` or `w̄_τ`.
(b) For a split prime `𝔩` above `p`, `σ` inducing `𝔩` or `𝔩̄`, `ι_σ := σ` if `w_σ = 𝔩` and
`(complex conjugation)∘σ` otherwise, and `σ′ = (−p^e)σ` with `e` odd also inducing `𝔩` or `𝔩̄`:
`ι_{σ′}(y) ≡ ι_σ(y)^{p^e} (mod p𝒪_ι)` for every `y` in the valuation ring of `𝔩`.
(c) If `p` is exceptional, the residue field at a prime above `p` has `p^o` elements, `o` the order of `u(−p)`.
(d) If `Λ` is marked, `𝔩 ∈ Λ` and `o = o₀·N′`, then for every `t : ℤ/N′ → Φ` with `t(i + 1) = u(−p^{o₀})·t(i)`
and every `t(i)` inducing `𝔩` or `𝔩̄`, the maps `ι_{t(i)}` of (b) form a Frobenius cycle over the valuation ring
of `𝔩` and `𝒪_ι` with prime `p`, `P = p^{o₀}`, `N′` letters, and `i` even exactly when `t(i)` induces `𝔩`.
(e) For a Frobenius cycle with prime `13 ≤ p < x₁`, `0 < e ≤ 𝔯(p)`, at most `f` letters and `m ≤ e·#letters`,
`(k, a, 𝔯(p), 1/(m²f))` is of large degree.
(f) For a Frobenius cycle with `2ℓ` letters and `0 < e ≤ 𝔯(p)`, `3c_div(k, a, 𝔯(p)) ≤ 12aℓ/(mp)`.

*Needs:* 1.1, 1.13, 2.5; OneSidedPrimeSumBoundsAndAdmissibleData §2.2 (the infinite places and the automorphisms
that name them), §3.2 (admissible data), §3.3 (the size inequalities).

[ShortProof], `New/UpperBound/Divisibility/MarkOperator.lean` (`New.Data.exists_orbit_of_mem_aPlaces`,
`New.Data.dvd_letterEmbedding_sub_pow`, `New.Data.IsExceptional.card_residueField`, `New.Data.IsMarked.exists_frobeniusCycle`,
`New.Data.isLargeDegree_of_le_card`, `New.Data.three_mul_divisorConstant_le`)

### 4.3 Colength of the scaled Hecke operators

*Origin:* particular to this proof: each scaled Hecke operator above an exceptional prime is onto the integral
source forms modulo a power of `p` up to a small colength, and so is the `m`-th power of their product, up to
`loss(p)·D_X`.

*Method of the formal proof:* the a-places inducing `𝔩` or `𝔩̄` form one orbit (4.2 (a)), which gives the
Frobenius cycle 4.2 (d); 4.2 (e), (f) give the size conditions and the constant, and 4.1 (b) the bound. The
bounds add under products, and 2.8 (b) bounds the total.

Let `Λ` be marked.
(a) For `𝔩 ∈ Λ` and `j₀ ∈ ℕ`, `Y_𝔩` is onto `𝓜_ι` modulo `p^{j₀}` up to colength
`(12A_𝔩/(mp) + j₀/(m²f))·D_X`.
(b) `Y_Λ^m` is onto `𝓜_ι` modulo `p^{j_p}` up to colength `loss(p)·D_X`.

*Needs:* 2.8, 4.1, 4.2; OneSidedPrimeSumBoundsAndAdmissibleData §1.1 (colength of modules).

[ShortProof], `New/UpperBound/Divisibility/MarkOperator.lean` (`New.Data.IsMarked.isOntoUpToColength_scaledHeckeOperator`);
`New/UpperBound/Divisibility/LocalDivisibility.lean` (`New.Data.IsMarked.isOntoUpToColength_prod_scaledHeckeOperator_pow`)

### 4.4 Definitions: the set-up at the level prime

*Origin:* definitions and conventions.

*Method of the formal proof:* none: these are definitions.

Let `ι : ℂ → ℂ_N`.
(a) `Σ_N := {w̄_τ : τ ∈ Φ}`, the conjugates of the primes above `N` induced through `ι`.
(b) `δ_j ∈ G_f(X_j)` is supported above `N`, equal to `diag(1, …, 1, N)` at the places of `Σ_N` that divide
`π_N` and to `1` at the other places of `Σ_N`. Applied to the standard lattice at `Σ_N` it gives `L_j`: the
integral vectors with last coordinate divisible by `π_N`. Likewise `δ_j^∨ ∈ G_f(X_j)` is supported above `N`,
equal to `1` at the places of `Σ_N` that divide `π_N` and to `diag(1, …, 1, N⁻¹)` at the other places of `Σ_N`;
applied to the standard lattice at `Σ_N` it gives the dual lattice of `L_j` there.
(c) `Up` is the operator of ThetaLiftChainsAndTheSeesawIdentity §2.11 (the operator `Up` and the lift laws
modulo `N`) for the forms on `X₀`, with `GL` at `Σ_N` acting in a basis of `L₀`.
(d) `𝒜′` is the `𝒪_ι`-module of the forms `φ` on `X₀` such that `Up^{m/2}φ` is a source form of gauge at most
`1` at the base point `δ₀` (integral for `L₀`).

*Needs:* 2.4; ThetaLiftChainsAndTheSeesawIdentity §2.11 (the operator `Up` and the lift laws modulo `N`).

[ShortProof], `New/UpperBound/Divisibility/SetupAtLevel.lean` (`New.Data.nonInducedPlaces`, `New.Data.diagPointN`,
`New.Data.dualPointN`, `New.Data.formRepAtN`, `New.Data.upIntegralForms`)

### 4.5 The places `Σ_N`, the operator `Up` and ramified forms

*Origin:* particular to this proof: `Σ_N` contains one prime of each conjugate pair above `N`, `Up` preserves
source forms, and ramified source forms are ramified vectors at `Σ_N`.

*Method of the formal proof:* the induced primes form one orbit of `Φ`, which contains no conjugate pair because
`N ≡ 1 (mod q₁d)`, so that `N` splits completely in `E`. An element of `K₀` splits into a part at `Σ_N`, which in a basis of `L₀` stabilises the
standard marked lattice and so fixes `Up φ` whenever it fixes `φ`, and a part away from `Σ_N`, which commutes
with `Up`. A scaling `z_u`, `u | π_N`, is an integral unit scalar at the place of `Σ_N` below it.

(a) Every place of `Σ_N` lies above `N`, has residue field with `N` elements, and has `N` as uniformiser; a
place lies above `N` if and only if it or its conjugate lies in `Σ_N`, and `Σ_N` contains no conjugate pair.
(b) `Up` maps `𝒮` into `𝒮`.
(c) Every `φ ∈ 𝒮^ram` is, at each `w ∈ Σ_N`, of the form `ψ − x·ψ` with `x` an integral unit scalar matrix
(in a basis of `L₀`) that is `1` modulo `N` at the other places of `Σ_N`.

*Needs:* 2.9, 4.4; ThetaLiftChainsAndTheSeesawIdentity §2.8 (the ramified source forms), §2.11 (the operator
`Up` and the lift laws modulo `N`).

[ShortProof], `New/UpperBound/Divisibility/SetupAtLevel.lean` (`New.Data.isSplitLevel_nonInducedPlaces`,
`New.Data.upOperator_mem_sourceForm`, `New.Data.mem_ramified_of_mem_ramifiedSourceForms`, `New.Data.conjEmbedGL_mem_levelX`)

### 4.6 The level prime: valuation of the composite lift

*Origin:* particular to this proof: on ramified source forms in `𝒜′`, every composite lift loses at most
`2mfb` powers of `N`.

*Method of the formal proof:* the lifts with data at `Σ_N` obey the lift laws modulo `N`, so on ramified forms
a chain of glued double lifts is a scalar, of `N`-adic size at most `N^{mfb}` (one character value of size at
most `N^{2b}` for each place of `Σ_N` and each double lift), times a chain of direct lifts after `Up^{m/2}`.
Each direct lift on a translate of the vacuum raises `N`-adic gauges from `δ_j` to `δ_{j+1}` by at most `N^{fb}`
and commutes with the levels; 3.1 (c) and 3.2 (b) finish.

Let `ι : ℂ → ℂ_N`.
(a) For every twist `ϑ` there is `c ∈ ℂ` (depending on `ϑ`) with `|ι(c)| ≤ N^{mfb}` such that for all data
`v_j` of the lifts and all `φ ∈ 𝒮^ram`, the chain of the `m/2` double lifts for `ϑ` with data glued from the
projections of the `v_j` on the vacuum above `N`, applied to `φ`, equals `c` times the chain of the `m` direct
lifts for `ϑ` (data `v_j` multiplied at `Σ_N` by the indicator of the integral matrices whose last column is
the last basis vector modulo `N`, in bases of `L_j`, `L_{j+1}`) applied to `Up^{m/2}φ`.
(b) For every twist `ϑ` and `j < m`, the direct datum on `t_x(j)` of the lift `Θ_j^ϑ` raises `N`-adic gauges
from `δ_j` to `δ_{j+1}` by at most `N^{fb}`, and commutes with `ω(a, b)` for `a ∈ K_j`, `b ∈ K_{j+1}`.
(c) For every twist `ϑ`, every chain datum `Ψ` for `ϑ` and every `φ ∈ 𝒮^ram` with `φ ∈ 𝒜′`, `B_ϑ^Ψ(φ)` has
gauge at most `N^{2mfb}` at the base point `1`.

*Needs:* 3.1, 3.2, 3.3, 4.4, 4.5; ThetaLiftChainsAndTheSeesawIdentity §2.11 (the operator `Up` and the lift laws
modulo `N`), §2.13 (the glued datum of a double lift in the Schrödinger model at `Σ_N`), §2.14 (characters of
the lifts above `N`).

[ShortProof], `New/UpperBound/Divisibility/ValuationAtLevel.lean`
(`New.Data.doubleLiftChain_gluedDoubleLiftDatum_eq_smul_chain`, `New.Data.schrodingerOpAtN_directDatum_mem_raises`,
`New.Data.omega_schrodingerOpAtN_directDatum`, `New.Data.norm_gluedFactor_le`, `New.Data.gaugeLe_compositeLift_at_N`)

### 4.7 The level prime: colength

*Origin:* particular to this proof: the forms of `𝒜′` have colength at most `mfb·D_X` among the `N`-integral
source forms, through a mean degree.

*Method of the formal proof:* at representatives of the classes adapted to `δ₀` and `δ₀^∨`, a source form is
integral for `L₀` exactly when each coordinate is divisible by `N` to its degree in the last variable; the sum
of these degrees, over pairs of a class and a basis vector of the weight, is independent of the variable by
symmetry and at most `D_X·f·a/k`. The colength is paid once from the integral forms to `L₀^∨` and once for
each factor `Up`, which maps forms integral for `L₀` to forms integral for `L₀^∨`.

Let `ι : ℂ → ℂ_N` and let `ℓ` be the sum, over the pairs of a class of `K₀` and a basis vector of the source
weight, of the degree of the basis vector in the last variable of `X₀`.
(a) This sum is the same for every variable of `X₀`, and `k·ℓ ≤ D_X·f·a`.
(b) The source forms integral at `1` are integral at `δ₀^∨`; the colength of the forms integral at `δ₀` among
those integral at `δ₀^∨` divides `N^ℓ`; `Up` maps forms integral at `δ₀` to forms integral at `δ₀^∨`; and the
colength among the forms integral at `1` of the preimage under `Up^i` of the forms integral at `δ₀` divides
`N^{ℓ(i+1)}`.
(c) There is `e ≤ mfb·D_X` such that the colength of `𝒜′` among the source forms integral at `1` divides `N^e`.

*Needs:* 4.4, 4.5; OneSidedPrimeSumBoundsAndAdmissibleData §1.1 (colength of modules), §3.2 (admissible data),
§3.3 (the size inequalities).

[ShortProof], `New/UpperBound/Divisibility/ColengthAtLevel.lean` (`New.Data.sumDegreeOf_eq`, `New.Data.mul_sumDegreeOf_le`,
`New.Data.integralFormsAt_one_le`, `New.Data.colengthDvd_integralFormsAt_diagPointN`, `New.Data.upOperator_mem_integralFormsAt`,
`New.Data.colengthDvd_comap_upOperator_pow`, `New.Data.exists_colengthDvd_upIntegralForms_pow`)

### 4.8 The divisibility at one prime

*Origin:* particular to this proof: at each prime there is a module of source forms of colength at most the
allowed loss per dimension on whose ramified members every composite lift has valuation at least the gain less
the allowed loss.

*Method of the formal proof:* four cases. For `p ≠ N` split in `K` or at least `x₁`, all integral source forms,
by 3.3 (b) and 3.7 (a), the gain being `0` (2.2 (b)). For a small non-split `p` that is not exceptional, all
integral source forms, by 3.7 (b) and 2.7 (b). For an exceptional `p < x₁`, `Y_Λ^m(𝓜_ι) + p^{j_p}𝓜_ι` for a full
mark `Λ` (2.5 (b)), by 3.7 (e) and 4.3 (b). For `p = N`, the source forms in `𝒜′`, by 4.6 (c) and 4.7 (c), the
gain being `0` because `N ≥ x₁`.

For every prime `p` and `ι : ℂ → ℂ_p` there are a natural number `l ≤ err₀(p)·D_X` and an `𝒪_ι`-submodule
`S` of `𝒮` such that the colength of `S` in `𝓜_ι` divides `p^l` and, for every twist `ϑ` with `p ∤ q(ϑ)`, every
chain datum `Ψ` for `ϑ` and every `φ ∈ S ∩ 𝒮^ram`, `B_ϑ^Ψ(φ)` has valuation at least `gain(p) − err₀(p)`.

*Needs:* 2.1, 2.2, 2.4, 2.5, 2.7, 3.3, 3.7, 4.3, 4.6, 4.7; OneSidedPrimeSumBoundsAndAdmissibleData §1.1 (colength
of modules); ThetaLiftChainsAndTheSeesawIdentity §2.8 (the ramified source forms).

[ShortProof], `New/UpperBound/Divisibility/LocalDivisibility.lean` (`New.Data.exists_colengthDvd_gaugeLe_compositeLift`)

### 4.9 The divisibility of the composite lift

*Origin:* particular to this proof: the divisibility half of Theorem A
(OneSidedPrimeSumBoundsAndAdmissibleData §5.3), with losses whose weighted sum is at most the error unit.

*Method of the formal proof:* take `err = err₀` (2.1 (d)); 2.3 bounds the weighted sum, and 4.8, intersected
with the integral ramified source forms, gives the submodules.

There are real numbers `err(p)`, one for each natural number `p`, such that:
(a) `err(p) ≥ 0` for all `p`;
(b) `err(p) = 0` if `p ≠ N` and either `χ_K(p) = 1` or `p ≥ x₁`;
(c) `Σ_{p∈U} err(p)·log p ≤ f·a·(log b)³` for every finite set `U` of natural numbers;
(d) for every prime `p` and every `ι : ℂ → ℂ_p` there are a natural number `l ≤ err(p)·D_X` and an
`𝒪_ι`-submodule `S ⊆ 𝓜_ι ∩ 𝒮^ram` whose colength in `𝓜_ι ∩ 𝒮^ram` divides `p^l`, such that for every twist `ϑ`
with `p ∤ q(ϑ)`, every chain datum `Ψ` for `ϑ` and every `φ ∈ S`, `B_ϑ^Ψ(φ)` has valuation at least
`gain(p) − err(p)`.

*Needs:* 2.3, 4.8; OneSidedPrimeSumBoundsAndAdmissibleData §1.1 (colength of modules).

[ShortProof], `New/UpperBound/Divisibility/LocalDivisibility.lean` (`New.Data.exists_err_gaugeLe_compositeLift`)

## Layer 5: The size of the composite lift and short source forms

### 5.1 An explicit bound for the number of classes in a genus

*Origin:* adapted from the classical finiteness of the class number of a genus of hermitian lattices (Borel
(1963)): here an explicit bound for the genus of the standard lattice over a CM field.

*Method of the formal proof:* a class is determined by the Gram matrix `G` of a short basis `Y` of `E^n` contained
in its lattice together with `GX`, where `X` is a rational matrix approximating the inverse change of basis modulo the
integral adeles; both have integral entries whose conjugates are bounded by `c³`, and such vectors are few
because distinct ones are at distance at least `1`.

(a) *Few integral vectors have bounded conjugates.* Let `E` be a number field with `f′` infinite places, `ι` a finite
set and `r ≥ 0` real. A set of vectors in `𝒪_E^ι` all of whose entries have absolute value at most `r` at every
infinite place of `E` has at most `(1 + 2r)^{2·#ι·f′}` elements: two distinct such vectors are at distance at least
`1` in `ℂ^{ι × places}`, a real space of dimension `2·#ι·f′`, because a nonzero algebraic integer has a conjugate of
absolute value at least `1`.

(b) Let `E` be a CM field with `f` infinite places, `N ≥ 1` an integer that lies in the different of `E`, `n ≥ 1`
and `c := 6N(fn)²`. Then the number of classes `Γ\G_f/K°` of the standard definite hermitian space of rank
`n` over `E` (`K°` the stabiliser of the standard lattice in `G_f`, as in
ThetaLiftChainsAndTheSeesawIdentity, Conventions; not the level `K₀` of the source forms) is at most `(1 + 2c³)^{4fn²}`.

*Needs:* HermitianFormsAndLattices §4.12 (a) (with `q = 1`: a lattice `L` in the genus of the standard lattice of
rank `n` is unimodular, so it contains `n` vectors `y`, linearly independent over `E`, with
`Tr_{E/ℚ}⟨y, y⟩ ≤ 2f·n²·rd_E²`; every entry of such a `y` has absolute value at most `√f·n·rd_E` at every complex
embedding, and `rd_E ≤ N` because `N` lies in the different of `E`, so the entries are at most `6N(fn)²`, the form
used; [ShortProof] `Lib/Adelic/Reduction/FirstMinimumShortBases.lean` (`New.Space.exists_short_basis_stdSpace`,
`New.Space.shortBasisConst`)).

[ShortProof], `New/UpperBound/Size/ClassCount.lean` (`New.Space.card_stdClasses_le`, `New.Space.stdClasses_eq_of_gram_eq`,
`New.Space.norm_gram_apply_le_cube`); for (a), `New/Spanning/RemainingTerms/Box.lean`
(`New.Filling.encard_le_of_isIntegral_norm_le`)

### 5.2 Class counts, rows of the lift diagrams and jet sizes on the data

*Origin:* particular to this proof: explicit bounds on the data for the number of classes at levels that
contain a principal level, for the rows of the lift diagrams and for jet sizes.

*Method of the formal proof:* the number of classes is at most the class number of `K°` (5.1, with
`q₁d` in the different) times the index of the level in `K°`; the rows are the weights of the lifts plus the
gaps; `(r + e)!` is `r!` times `e` factors at most `r + e + 1`.

(a) If `G ≥ 1`, `n ≤ 2n_m` and a subgroup `K ⊆ G_f(X)` (`X` standard of rank `n` over `E`) contains the
principal congruence subgroup of level `G`, then `#(Γ\G_f/K) ≤ exp(x^{29}(1 + log G))`; if `n ≤ n_m` and `K`
contains the principal congruence subgroup of level `π_M π_N`, then `#(Γ\G_f/K) ≤ exp(x^{30})`.
(b) For `j < m`, row `i` of the lift diagram of step `j` at `τ`, read at the heights below `n_{j+1}`, has length
at most `μ_i(τ) + σ_i`, where `μ_0(τ)` is the number of columns of height one (`a` at an a-place and `0`
elsewhere), `μ_i(τ) = κ(τ)` for `0 < i < k`, `μ_i = 0` otherwise, `σ_0 = b + ⌊a/⌊x₁⌋⌋ + (Δ/2)²` and
`σ_i = (Δ/2)²` for `i > 0`; and `μ_i(τ) + σ_i ≤ 2a`.
(c) For `l ≤ r + e`, `s_∞(l) ≤ s_∞(r) + e·(log(r + e + 1) + log(M/Ω))`.
(d) Every conjugate of `π̄_M` has squared absolute value `M`.

*Needs:* 5.1; OneSidedPrimeSumBoundsAndAdmissibleData §3.2 (admissible data), §3.3 (the size inequalities),
§4.1 (the jet size `s_∞`); ThetaLiftChainsAndTheSeesawIdentity §2.2 (weights and lift diagrams).

[ShortProof], `New/UpperBound/Size/Estimates.lean` (`New.Data.card_stdClasses_le_exp_mul_log`, `New.Data.card_stdClasses_le_exp`,
`New.Data.diagramWeight_le_rowMainLength_add_rowSlack`, `New.Data.jetSize_le_add`, `New.Data.norm_map_star_piMBar_sq`);
`New/UpperBound/Size/ArchimedeanSize.lean` (`New.Data.rowMainLength_add_rowSlack_le`)

### 5.3 The excess of the lifts, and the prime sums in the exponent

*Origin:* particular to this proof: the level prime pays for the excess of the long rows over the main prime
sum, and in the exponent of the size bound the gains cancel the prime sums.

*Method of the formal proof:* Stirling's bound for `log a!`; the lower end of the window for `log N` from the
data; the identity of 2.2 (c) applied to the gains.

Let `rs_j := Σ_τ Σ_{i<n_j} s_∞(length of row i of the lift diagram of step j at τ)` and
`cs := m(#Φ_a·s_∞(a) + k·Σ_τ s_∞(κ(τ)))`.
(a) `s_∞(a) − s_main ≤ a·((1/f)Σ_τ log κ(τ) + log(M·rd_E/2π)) + 1 + (log a)/2`, and
`m(s_∞(a) − s_main) − a·log N ≤ 32a·log b`.
(b) `2Σ_{p small non-split} gain(p)·log p = m·Σ_{τ∈Φ_a} s_fin(a, τ) + mk·Σ_τ s_fin(κ(τ), τ)`.
(c) `h_main − m·rem + 2Σ_{p small non-split} gain(p)·log p = m·#Φ_a·s_main + mk·Σ_τ s_∞(κ(τ))`.
(d) `Σ_{j<m} rs_j ≤ cs + u_E/2`, and `cs − #Φ_a·a·log N ≤ h_main − m·rem + 2Σ_p gain(p)·log p + 32fa·log b`.

*Needs:* 2.1, 2.2, 5.2; OneSidedPrimeSumBoundsAndAdmissibleData §3.1 (the lower end `N₋`), §3.2 (admissible data
and the window for `log N`), §3.3 (the size inequalities), §4.1 (the prime sums); Mathlib (Stirling's formula).

[ShortProof], `New/UpperBound/Size/ArchimedeanSize.lean` (`New.Data.jetSize_sub_mainPrimeSum_le`,
`New.Data.mul_jetSize_sub_mainPrimeSum_sub_le`, `New.Data.card_aPlaces_mul_excess_le`, `New.Data.two_mul_sum_gain_mul_log`,
`New.Data.mainAmount_sub_add_two_mul_sum_gain`, `New.Data.sum_rowSizeSum_le`, `New.Data.chainSize_sub_le`)

### 5.4 The size of one kernel and of the composite lift

*Origin:* particular to this proof: for the trivial twist the composite lift multiplies the squared norms of
all conjugates by at most `exp(h_main − m·rem + 2Σ_p gain(p) log p + u_E)`.

*Method of the formal proof:* a value of the restricted chain is a sum over tuples of classes and tuples of
translations of products of `m` kernels (3.1 (a)); each kernel is bounded by the archimedean jet bound with
growth rate `a + 1`, whose terms other than the row sizes add up to `x^{50}`; the classes number at most
`exp(x^{30})` per level (5.2 (a)), the coefficients have `ℓ¹`-norm at most `exp(x^{60})`, and the restriction
gains `N^{−#Φ_a·a}` up to `N^{f m Δ/2}` (3.2 (c)); 5.3 (d) assembles the exponent.

Let `1` denote the trivial twist and `σ ∈ Aut(ℂ)`.
(a) For `j < m`, every tuple `v` of translations and all `g, g′`, the value of the kernel `Θ_j^1` with datum
`ω(g, g′)t_v(j)`, a linear map between the Weyl modules of `X_j` and `X_{j+1}`, multiplies the norm of
`σ`-conjugates by at most `exp(x^{50} + rs_j/2)`.
(b) Let `Ψ` be a weak chain datum for `1` and `φ ∈ 𝒮` with `‖σ∘φ(g)‖² ≤ exp(B)` for all `g`. Then for all
`y ∈ G_f(Y_m)`, `‖σ∘R_1^Ψ(φ)(y)‖² ≤ exp(B + β)`, with
`β := h_main − m·rem + 2Σ_{p small non-split} gain(p)·log p + u_E`.
(c) The same bound holds for `B_1^Ψ(φ)` when `Ψ` is a chain datum for `1`.

*Needs:* 3.1, 3.2, 3.3, 5.2, 5.3; ThetaLiftChainsAndTheSeesawIdentity §1.4 (the archimedean bound for jets of a
translate of the vacuum), §2.12 (chain data and the composite lift).

[ShortProof], `New/UpperBound/Size/ArchimedeanSize.lean` (`New.Data.sqrt_weylNormSq_jetMap_le`,
`New.Data.weylNormSq_restrictedChain_le`, `New.Data.weylNormSq_compositeLift_le`)

### 5.5 Passage to target forms by the good projection

*Origin:* particular to this proof: replacing a form of principal level on `Y₀` by `#𝖦·e₀ s z` keeps
integrality of the lifted form and enlarges the size of its values by at most `exp(x^{99})` after summing over
classes.

*Method of the formal proof:* the lift of `#𝖦 e₀ s z` is a combination of right translates of the lift of `z`
with coefficients `#𝖦·e₀(t)`, which are algebraic integers (values of a character of degree at most `#𝖦`) and
have conjugates of absolute value at most `#𝖦`, the coefficients `e₀(t)` themselves having conjugates of
absolute value at most `1`; the gauge is ultrametric; each value is a sum of `#𝖦` terms, and the class sum has
at most `exp(x^{30})` classes (5.2 (a)), with `x^{30} + 4 log #𝖦 < x^{99}`.

Let `𝖦`, `e₀` and the lower chain `Θ_ϑ` (from the forms of principal level on `Y₀` to the forms on `Y_m`) be those of
ThetaLiftChainsAndTheSeesawIdentity §2.5 (the group `𝖦` and the idempotent `e₀`), §2.7 (the forms of principal
level and the action of `𝖦` on them) and §2.15 (the lower chain), `s ∈ 𝖦` and `z` a form of principal level on
`Y₀`.
(a) For every prime `l`, every `ι : ℂ → ℂ_l` and every `c ∈ ℂ`: if `c·Θ_ϑ(z)` is integral at `ι`, so is
`c·Θ_ϑ(#𝖦·e₀ s z)`; and `Θ_ϑ(#𝖦 e₀ s z)(g) = Σ_{t∈𝖦} #𝖦·e₀(t)·Θ_ϑ(z)(g·γ_ϑ(ts))` for an integral lift `γ_ϑ` of
`𝖦` to `G_f(Y_m)`.
(b) For `σ ∈ Aut(ℂ)`: if `‖σ∘Θ_1(z)(g)‖² ≤ exp(B)` for all `g`, then the class sum (the sum over the classes
`ΓgJ` of the level `J` of the lifted form, each weighted by `1/#(Γ ∩ gJg⁻¹)`) of the squared norms of the
`σ`-conjugates of the values of `Θ_1(#𝖦·e₀ s z)` is at most `exp(x^{99} + B)`.

*Needs:* 5.2; ThetaLiftChainsAndTheSeesawIdentity §2.5 (the group `𝖦` and the idempotent `e₀`), §2.7 (the forms
of principal level and the action of `𝖦` on them, which give the good part `#𝖦·e₀ s z` of a translate),
§2.15 (the lower chain and its equivariance for `𝖦`).

[ShortProof], `New/UpperBound/Size/ArchimedeanSize.lean` (`New.Data.lowerChain_goodProjTranslate_apply`,
`New.Data.goodProjTranslate_mem_integralForms`, `New.Data.normSqAt_goodProjTranslate_le`)

### 5.6 Short forms span at a free level

*Origin:* particular to this proof: at a free level, algebraic forms on a definite unitary group over a CM
field are spanned by forms that are integral at every prime and have values of explicitly bounded size.

*Method of the formal proof:* at a free level a form is a sum of delta forms, one for each class; for each
class, the action of a short basis of `E^n` contained in its lattice (and of such bases for the determinant twists)
on the
evaluation vectors at families of roots of unity gives vectors that are integral at every `ι` and small at
every conjugate, and these span because the evaluation vectors span the Weyl module and the action is
invertible.

Let `E` be a CM field with `f` infinite places, `X` the standard definite hermitian space of rank `n ≥ 1` over
`E`, `K°` the stabiliser of the standard lattice in `G_f`, `K ⊆ K°` an open subgroup that is free
(`Γ ∩ gKg⁻¹ = 1` for all `g`), and `(κ, e)` a weight.
(a) If `φ` is `B`-short and `g ∈ K°`, then `φ − g·φ` is `4B`-short.
(b) The delta form at `y` made from `v` (supported on `ΓyK`, with value `Σ γ⁻¹·v` at `g` over the rational
`γ` with `y⁻¹γg ∈ K`) is `B`-short if `v` has gauge at most `1` at `y` for every prime and every `ι`, and every
conjugate of `v` has squared norm at most `B`.
(c) Let `N ≥ 1` lie in the different of `E`, `M ≥ n·f + (number of boxes of κ in columns of height below n)`
and `B ≥ (6N(fn)²)^{6M}`. Then the forms of level `K` and weight `(κ, e)` are spanned by `B`-short forms.

*Needs:* HermitianFormsAndLattices §4.12 (a) (with `q = 1`, as in 5.1: for `N ≥ 1` in the different of `E`, every
lattice in the genus of the standard lattice contains `n` vectors, linearly independent over `E`, with entries of
absolute value at most `6N(fn)²` at every complex embedding; [ShortProof]
`Lib/Adelic/Reduction/FirstMinimumShortBases.lean` (`New.Space.exists_short_basis_stdSpace`));
ShortGRH background (two linear maps from a Weyl module over a domain into a free module that agree on the
evaluation vectors at the arrays with entries in a given infinite set, and at which a given product of powers of the
determinants of the square blocks does not vanish, are equal; the form used is over `ℂ`, with no condition on the
determinants, where these vectors therefore span; [ShortProof] `Lib/GLn/SchurModule/WeylKernel.lean` (`New.GL.ext_weylEval`)); AutomorphicFormsOnReductiveGroups
§7.4, §7.5 (at a level with trivial stabilisers a form is the sum, over the classes, of the delta forms of its
values at representatives; [ShortProof] `Lib/Adelic/AutomorphicForms/HeckeEigenforms.lean` (`New.deltaForm`,
`New.freeLevelEquiv`)).

[ShortProof], `New/UpperBound/Size/ShortColumns.lean` (`New.IsShort`, `New.IsShort.sub_translate`,
`New.isShort_deltaForm`, `New.span_isShort_eq_top`, `New.weylNormSq_det_smul_weylRep_mulVec_weylEval_le`)

### 5.7 Short ramified source forms span

*Origin:* particular to this proof: the source forms, and the ramified source forms, are spanned by short
forms whose size is bounded by the error unit.

*Method of the formal proof:* 5.6 (c) for the level `K₀` of the source forms (free, and contained in `K°`) and
the integer `q₁d` in place of the `N` of 5.6 (c), which lies in the different of `E`; the
source weight has at most `fa` boxes, and the size inequalities give the bound. For the ramified forms, apply
`Π_w(1 − z_w)` (2.11 (a)), which keeps integrality and multiplies the bound by `4` for each of the `f` primes
`w | π_N` (5.6 (a), applied to the scalar matrix of `z_w`, which lies in `K°` by 2.9 (b) though not in `K₀`).

(a) `𝒮` is spanned by the `(exp(u_E)/4^f)`-short source forms.
(b) `𝒮^ram` is spanned by the `exp(u_E)`-short ramified source forms.

*Needs:* 2.9, 2.11, 5.6; OneSidedPrimeSumBoundsAndAdmissibleData §3.3 (the size inequalities), §4.1 (the error unit).

[ShortProof], `New/UpperBound/Size/ShortColumns.lean` (`New.Data.span_isShort_eq_top`, `New.Data.isShort_ramifyingOp`,
`New.Data.span_isShort_ramifiedSourceForms_eq_top`, `New.Data.sum_height_mul_columnCount_le`)

## Downstream consumers

- OneSidedPrimeSumBoundsAndAdmissibleData §5.3 (Theorem A) uses the divisibility of the composite lift (4.9), its
  size (5.4), the passage to target forms (5.5), the codimension of the ramified source forms (2.11) and the
  short forms that span them (5.7); its §5.2 uses the gain (2.1 (c)), the integral source forms (2.4) and 4.9; its
  §5.4 uses 2.11.
- NormsOfThetaLiftsAndExchangeIdentities uses the local prime sums and their sums over primes (2.1, 2.2).
- DeterminantsOfThetaLiftChains uses the passage to target forms (5.5) and short forms at a free level (5.6).
- CongruencesOfTwistedThetaLifts uses the class counts on the data (5.2 (a)).

## Scope and ownership

### Owned here

- The elementary divisors of an edge Hecke operator over a Frobenius cycle (Layer 1).
- The local prime sums, the gain, the loss, exceptional primes, marked sets and scaled Hecke operators, and the
  codimension of the ramified source forms (Layer 2).
- The valuation of the chain of lifts and of the composite lift at every prime, and the divisibility of the
  composite lift (Layers 3 and 4).
- The explicit class count of the genus of the standard lattice, the size of the composite lift, the passage to
  target forms and the spanning by short forms (Layer 5).

### Not owned here

- The data, colength of modules, the prime sums `s_fin` and Theorem A:
  OneSidedPrimeSumBoundsAndAdmissibleData.
- The spaces, weights, theta kernels and their gauges, source forms and ramified source forms, chain data, the
  composite lift, the operator `Up`, the lower chain and the seesaw identity:
  ThetaLiftChainsAndTheSeesawIdentity.
- The numbers `I_p`, `v(π_p)`, `γ_p`, the predicted divisibility of a family of Young diagrams and the standard
  data: DivisibilityOfThetaDerivatives.
- ThetaLiftsForDefiniteUnitaryGroups §2.2 states the Hecke equivariance of a theta lift at a split place in Satake
  form, in every residue characteristic and for every conductor, through the type-II models of the metaplectic
  theory. Section 3.5 uses only the case of the vacuum datum with unramified characters, in the form of an
  identity of Hecke polynomial operators, which [ShortProof] proves directly; its *Needs:* line therefore names
  that case as background and does not cite §2.2.
- LocalGainOfThetaChains §§4.12–4.16c state the corresponding stage for the chain of
  ThetaChainsOnDefiniteUnitaryGroups: the Hecke operators at an inert prime and their commutation with the chain
  (§§4.12, 4.13), the colength of the Hecke image through elementary divisors at an edge (§§4.14–4.15f) and the
  gain sublattice with the colength at the level prime (§§4.16–4.16c). Layers 1–4 here are the same stage for
  the data and the chain of this family (a Frobenius cycle in place of the progression of §4.14a, the scaled
  Hecke operators of marked sets, the operator `Up` at `N`); neither development is deduced from the other.

## Exact supplier contracts

### From OneSidedPrimeSumBoundsAndAdmissibleData

§1.1 (colength of modules and its behaviour under images, preimages and products); §2.1, §2.2 (the parameters,
`χ_K`, the infinite places and the place of an integer); §3.1 to §3.4 (the window for `log N`, admissible data,
the size inequalities, twists); §4.1 (the prime sums `s_fin`, `s_∞`, `s_main`, `h_main`, `rem` and the error unit
`u_E`).

### From ThetaLiftChainsAndTheSeesawIdentity

§1.1 (d) (gauges and the bound "raises"); §1.4 (the archimedean bound for jets of a translate of the vacuum);
§1.5 (`p`-adic gauge bounds for one lift); §2.1, §2.2, §2.6 (the spaces `X_j`, `Y_m`, their weights, the lift
diagrams, the branching map and the levels `K_j`); §2.5, §2.7, §2.15 (the group `𝖦`, the idempotent `e₀`, the
forms of principal level and the lower chain); §2.8 (source forms, scalings, ramified source forms and the lifts);
§2.11 to §2.14 (the operator `Up` and the lift laws modulo `N`, chain data, the glued datum at `N`, the lifts
above `N`).

### From DivisibilityOfThetaDerivatives

§2.1 (the numbers at a prime); §3.1 (the predicted divisibility of a family of Young diagrams); §4.8 (standard
data at `p`); §4.11 (d) (divisibility of Schur entries of jets with charges).

### From other roadmaps

AutomorphicFormsOnReductiveGroups §7.4, §7.5 (algebraic forms of a level, Hecke operators of double cosets, levels
with trivial stabilisers); ThetaLiftsForDefiniteUnitaryGroups §1.2 (the lift between definite groups as a class
sum).

## References

- `[ShortProof]`: the folder `grh` of <https://github.com/lsernau/grh-lean> at commit
  `72fead102f663d5c7a407964a13dc0cf9d977207`; this roadmap covers `src/New/UpperBound/ElementaryDivisors`,
  `src/New/UpperBound/Divisibility` and `src/New/UpperBound/Size`.
- D. Benson, S. Doty, *Schur–Weyl duality over finite fields*, Arch. Math. 93 (2009).
- E. Bombieri, *Counting points on curves over finite fields (d'après S. A. Stepanov)*, Séminaire Bourbaki 430
  (1973).
- A. Borel, *Some finiteness properties of adele groups over number fields*, Publ. Math. IHES 16 (1963).
- J. A. Green, *Polynomial representations of `GL_n`*, Lecture Notes in Mathematics 830 (1980).
