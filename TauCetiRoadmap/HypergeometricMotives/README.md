# Roadmap: hypergeometric motives over ℚ

**Summary.** A hypergeometric motive is cut out of the cohomology of a one-parameter family of
varieties whose periods satisfy a generalised hypergeometric differential equation.  Everything
about it that the LMFDB displays is a function of three pieces of data: two disjoint multisets of
rational numbers modulo `1`, or equivalently two multisets `A`, `B` of positive integers of equal
"totient weight", and a specialization point `t ∈ ℚˣ`.  This roadmap builds, from Mathlib's
cyclotomic polynomials, Gauss and Jacobi sums and matrices, the four families of invariants and
the classical theorem behind each: the **monodromy** of the hypergeometric equation (Levelt's
companion-matrix theorem over any field, the Beukers–Heckman invariant form, signature and
finiteness criterion, the Bézout matrix), the **Hodge vector and weight** read off the
combinatorial zigzag of the two parameter sets (symmetry, the two parity laws, interlacing ⟺
weight `0`), the **finite hypergeometric sums** of Katz, Greene and Beukers–Cohen–Mellit
(rationality, the gamma-vector form at every prime power coprime to the wild primes, integrality
of `q^δ H_q`, the shift, swap and Kummer-pullback identities, and Ono's and the cubic point
counts), and the **Euler factors, bad primes and tame conductor exponents** of the L-function.
The arithmetic layer is unconditional where Layer 4 proves it and is stated as implications from
the named purity hypothesis that Katz's theorem supplies where only the motive proves it.  The
hypergeometric *motive* itself, as an object of a category of motives, is not constructed here;
its point counts are what this roadmap defines, and the identification is cited.

The primary carrier is a **cyclotomic datum** `(A, B)`: two finite multisets of positive integers
with `A ∩ B = ∅` and `∑_{a ∈ A} φ(a) = ∑_{b ∈ B} φ(b) =: d`, exactly the LMFDB's family index.
Behind it stands the general **hypergeometric parameter pair** `(α, β)`: two multisets in `ℚ/ℤ` of
the same cardinality with `α ∩ β = ∅`, which is the generality in which Levelt, Beukers–Heckman and
the finite sums over a single field `𝔽_q` live.  A cyclotomic datum is the same thing as a
parameter pair stable under the Galois action `x ↦ ux`, `gcd(u, N) = 1`, and every statement that
needs rationality over `ℚ` (the gamma vector, the `M`-value, rationality and integrality of the
sums, the Frobenius traces for all powers of all good primes) is stated for cyclotomic data.

Suggested home: `TauCeti/NumberTheory/Hypergeometric/`, with files for the data and the
cyclotomic dictionary (`Data`), the zigzag (`Hodge`), the Levelt matrices and the Bézout form
(`Monodromy`), the finite sums (`FiniteSum`, `Gamma`), the Frobenius traces and Euler factors
(`Euler`), the bad primes (`Conductor`), and the worked families (`Examples`).

## Scope and ownership

### Owned here

- The carriers: hypergeometric parameter pairs `(α, β)` in `ℚ/ℤ`, cyclotomic data `(A, B)`, the
  dictionary between them, Galois stability, the gamma vector `γ`, the `M`-value, the defining
  rational function `Q = Φ_A/Φ_B`, the wild primes, the `p`-parts `(A_p, B_p, C_p)` and the
  prime-to-`p` parts `(A^p, B^p)`, the rotation number, and the duality `(A, B, t) ↔ (B, A, 1/t)`
  (Layer 1).
- The zigzag procedure: the height function, the degree, the weight, the Hodge vector, the Hodge
  polygon, the orthogonal/symplectic type, the Hodge-normalisation exponent `δ`, and the
  combinatorial laws they satisfy (symmetry, the two parity laws, interlacing ⟺ weight `0`)
  (Layer 2).
- Monodromy: the cyclic-vector conjugacy and the rank formula for companion matrices, the
  Levelt triple `(h_∞, h_1, h_0)`, Levelt's theorem over any field with the companion normal
  form, the invariant Hermitian form and its signature, the Beukers–Heckman finiteness criterion,
  the Bézout matrix with its determinant and module, imprimitivity and the primitive datum, and
  the reduction of the monodromy group modulo `ℓ` (Layer 3).
- Finite hypergeometric sums: Katz's exponential sum, the unnormalised sum `S_q`, the normalised
  sum `H_q` (Beukers–Cohen–Mellit Definition 1.1), Greene's `_{n+1}F_n`, their comparison, the
  dependence on the characters, the Galois action, rationality and integrality for cyclotomic
  data, the gamma-vector form (Beukers–Cohen–Mellit Theorem 1.3) that defines `H_q` at every
  prime power coprime to the wild primes, the shift, swap and Kummer-pullback identities
  (Layer 4), and Ono's theorem and the cubic family as point counts (Layer 6).
- The arithmetic layer: good, tame and wild primes of `(A, B, t)`, the Frobenius trace
  `a_q(A, B; t)`, the Frobenius series and the Frobenius polynomial `F_p(T)`, the purity
  hypothesis and the consequences that follow from it (degree, integrality, the local
  functional equation), the determinant discriminant, the tame conductor exponents, the
  archimedean shifts attached to a Hodge vector and signature, the Newton/Hodge polygon
  comparison and the ordinary predicate, and the mod-`ℓ` semisimple Frobenius order (Layer 5).

### Not owned here

- **The motive.**  The construction of `H(A, B, t)` as an object of a category of motives, its
  realizations, the hypergeometric ℓ-adic sheaf, and the theorem that the Frobenius traces of its
  ℓ-adic realization are the finite hypergeometric sums of Layer 4 (Katz, *Exponential sums and
  differential equations*, Chapter 8, and Beukers–Cohen–Mellit Theorem 1.5 for the varieties) are
  cited in 6.4.  Consequently every statement whose only proof passes through that identification
  (purity of the Euler factors, their integrality beyond 4.9, the local functional equation at
  good primes, the wild conductor exponents, the Hodge-theoretic meaning of the zigzag) is stated
  here as an implication from a named hypothesis or cited in prose, never asserted.  Katz's toric
  count with the smooth completion (Beukers–Cohen–Mellit Theorem 1.5 and Definition 5.1) is cited.
- **The signed signature `sig` and the root numbers.**  The LMFDB's signature is the signature of
  complex conjugation on the middle Hodge piece of the real Hodge structure of `H(A, B, t)` at a
  real `t`; it needs the Hodge realization and is not a function of the combinatorics alone.  The
  unsigned invariant that is combinatorial, the Beukers–Heckman signature of the
  monodromy-invariant Hermitian form, is owned (3.6).  The archimedean and global root numbers of
  the L-function are the [L-functions roadmap](../LFunctions/README.md)'s.
- **Wild primes.**  At a wild prime the Euler factor and the conductor exponent are the Artin
  invariants of the ℓ-adic realization; no formula for them is a theorem, and the function `σ(k)`
  of Roberts–Rodriguez-Villegas §13 is a conjectural bound.  Layer 5 defines the conductor
  exponents at tame primes by Roberts–Rodriguez-Villegas (13.1) and states the LMFDB's conductor
  as the product of the tame exponents and the wild exponents of the realization, the latter a
  parameter.  The tame Euler factor is owned only through its degree (5.9).
- **Labels and the database ordering.**  The LMFDB family label `A…_B…` and motive label
  `A…_B…_t n.d` are built from the intrinsic data `(A, B, t)` with `A`, `B` listed in decreasing
  order; the choice between the two presentations `(A, B, t)` and `(B, A, 1/t)` of one motive
  (`1 ∈ B`, or else `max B > max A`) is a normal form fixed by convention.  This roadmap proves
  the duality that makes the choice harmless (1.12, 5.14) and states no normal form, no database
  ordering and no completeness statement for "all families of degree `≤ 7`".
- **Group identifications.**  The LMFDB's monodromy table names the image of the monodromy group
  modulo `ℓ` by an abstract-group label and its index in an orthogonal or symplectic group; the
  isomorphism invariants of the abstract group are `FiniteGroupInvariants`' and its label is not
  a target.  Layer 3 defines the group and the reduction; it identifies nothing.  The
  classification of the finite hypergeometric groups (Beukers–Heckman Theorem 7.1 and Table 8.3)
  is cited.
- **Classical hypergeometric functions and the differential equation.**  Mathlib's
  `ordinaryHypergeometric` (`₂F₁`) and Tau Ceti's regularized hypergeometric functions are
  analysis; the hypergeometric differential operator, its solutions, periods and the variation of
  Hodge structure (Fedorov) are cited only.  Levelt's theorem is stated as a statement about
  matrix groups, as Beukers–Heckman state it, with no differential equation in its hypotheses.
- **Character sums over finite fields** that are not hypergeometric sums: Kloosterman sums,
  Morita's `p`-adic Gamma function and the Gross–Koblitz formula, and the `p`-adic evaluation of
  `H_q` that Magma and Sage use (an algorithm), are the sibling roadmap
  `CharacterSumsOverFiniteFields`' (its 6.4, 6.5).  The Hasse–Davenport product relation is
  consumed from `ClassicalArithmeticCompletion` 7.29.
- **The special motive at `t = 1`** beyond its Hodge vector (2.9): the degree drop and the special
  motive are Roberts–Rodriguez-Villegas §9, cited.  Mazur's inequality between the Newton and
  Hodge polygons is cited; only the predicate "ordinary" is owned (5.4).

## Conventions

Three conventions (`t` versus `1/t`, the power of `q` that Hodge-normalises the trace, and which
Levelt matrix sits at which cusp) are read differently by the sources and the software, and each
wrong choice still produces plausible output: the wrong `t` changes `a_q` by a character value,
and so only at some primes (for `A2.2.2.2_B1.1.1.1` at `t = 1/2` it flips `a_5` and keeps `a_7`);
the wrong power of `q` rescales every trace of a datum with `δ > 0`; the wrong cusp swaps the tame
degrees.  Each row below says which LMFDB data pin it.

| Object | Convention |
|---|---|
| Parameters | `α, β : Multiset (AddCircle (1 : ℚ))`, equal cardinality `d`, disjoint (`a ∈ α → a ∉ β`).  Representatives are taken in `(0, 1]` through `AddCircle.equivIoc 1 0`, so that the class of `0` is represented by `1`.  This is the LMFDB's display and the convention of the zigzag; Beukers–Cohen–Mellit write `β_d = 1` for the same class.  Nothing depends on representatives except the zigzag, which is stated through them. |
| Cyclotomic data | `A, B : Multiset ℕ`, entries `≥ 1`, `∀ a ∈ A, a ∉ B`, `(A.map φ).sum = (B.map φ).sum`.  `α(A) := ⋃_{a ∈ A} {k/a : 1 ≤ k ≤ a, gcd(k, a) = 1}` as a multiset, i.e. the roots of `Φ_A := ∏_{a ∈ A} Φ_a` read as arguments; likewise `β(B)`.  **`α` comes from `A` and `β` from `B`**, as the LMFDB knowl "hgm.defining_parameters" states.  ⚠ Magma's `HypergeometricData(L₁, L₂)` reads `β` from `L₁` and `α` from `L₂` (Roberts–Rodriguez-Villegas §2, "Three Magma notes"), so the LMFDB family `A…_B…` is Magma's `HypergeometricData(B, A)`: Roberts–Rodriguez-Villegas (2.4) enter the Legendre family, LMFDB `A2.2_B1.1`, as `HypergeometricData([1,1],[2,2])`.  Sage's `HypergeometricData(cyclotomic=(A, B))` reads `α` from `A`, and its `t` is the LMFDB's `t` (its docstring's "`t` replaced by `1/t`" is relative to Magma's `(L₁, L₂) = (B, A)`, and the duality 5.14 makes the two agree). |
| The gamma vector | `γ : ℕ+ → ℤ`, finitely supported, the unique function with `Φ_A/Φ_B = ∏_n (X^n − 1)^{γ(n)}`; explicitly `γ(n) = ∑_{a ∈ A, n ∣ a} μ(a/n) − ∑_{b ∈ B, n ∣ b} μ(b/n)`.  As a multiset of nonzero integers, `n` with multiplicity `γ(n)` when `γ(n) > 0` and `−n` with multiplicity `−γ(n)` when `γ(n) < 0`; `∑ γ = 0`.  Positive entries come from `A`.  The LMFDB lists the multiset in increasing order; Beukers–Cohen–Mellit's `p_j` are the positive entries and `q_j` the absolute values of the negative ones, so `r = ∑_{γ(n)>0} γ(n)`, `s = −∑_{γ(n)<0} γ(n)`. |
| `M` | `M := ∏_n n^{n γ(n)} ∈ ℚ_{>0}`; equals `∏ p_j^{p_j} / ∏ q_j^{q_j}`. |
| The specialization point | `t ∈ ℚ`, `t ≠ 0`.  **The Frobenius trace of `H(A, B, t)` at a good prime power `q` is `a_q(A, B; t) := q^δ · H_q(α(A), β(B) | t)`**, with `H_q` the normalised sum of 4.3 (Beukers–Cohen–Mellit Definition 1.1, in their variable, which is the LMFDB's `t`) and `δ = δ(A, B)` the Hodge-normalisation exponent pinned below.  Equivalently, by the swap identity 4.10, `a_q(A, B; t) = q^δ · H_q(α(B), β(A) | 1/t)`.  The LMFDB's `t` is the classical variable of the series `∑ (α)_n/(β)_n t^n`, as in Roberts–Rodriguez-Villegas (1.3), (1.7) and (2.2), where `H(A2.2_B1.1, t)` is `H¹` of `y² = x(1 − x)(x − t)`.  Witness (LMFDB data): `A2.2_B1.1_t2.1` has `F_5(T) = 1 + 2T + 5T²`, so `a_5 = −2 = H_5(1/2, 1/2; 1, 1 | 2)`, while `A2.2_B1.1_t1.2` has `a_5 = +2` (reading `1/t` swaps the two).  Over the LMFDB's 65 degree-2 motives and `A2.2.2.2_B1.1.1.1_t-1.1`, with their Euler factors at `p ≤ 29`, this convention matches all 541 good `(motive, p)` pairs; the `1/t` reading matches 231 and dropping `q^δ` matches 438. |
| The Levelt matrices | `h_∞ := C(Φ_A)` and `h_0 := C(Φ_B)^{-1}`, with `C(f) := Polynomial.companion f` the companion matrix of `ClassicalArithmeticCompletion` 2.46, which for a monic `f = X^d + c_{d−1}X^{d−1} + ⋯ + c_0` has `1` on the subdiagonal and `−c_0, …, −c_{d−1}` as last column (`C(f)_{i+1,i} = 1`, `C(f)_{i,d−1} = −c_i`), and `h_1 := h_∞^{-1} h_0^{-1}`, so that `h_∞ h_1 h_0 = 1`.  For a cyclotomic datum all three lie in `GL_d(ℤ)`.  The characteristic polynomial of `h_∞` is `Φ_A` and that of `h_0` is `Φ_B` (reciprocal polynomials of cyclotomic data are themselves up to sign, 1.5); this is the LMFDB knowl "hgm.levelt_matrices".  The LMFDB displays a conjugate of this triple; every invariant displayed is conjugation-invariant. |
| Cusps and `t` | In the LMFDB's `t`, **`t → 0` is the cusp of `h_0`** (the `B`-side: near `t = 0` the local exponents are `1 − β_j`) and **`t → ∞` the cusp of `h_∞`** (the `A`-side); `t → 1` is the cusp of the pseudo-reflection `h_1`.  Hence for a tame prime, `v_p(t) > 0` reads `h_0`, `v_p(t) < 0` reads `h_∞`, `v_p(t − 1) > 0` reads `h_1` (5.9).  This is Roberts–Rodriguez-Villegas (13.1) ("`τ = ∞` if `k` is negative, and `τ = 0` if `k` is positive", `k = ord_p(t)`), and it is what the LMFDB's tame conductor exponents force: all 53 tame `(motive, p)` pairs of the degree-2 motives agree with it and 24 contradict the opposite reading, e.g. `A2.2_B1.1_t-3.1` at `p = 3` has `c_3 = 1`, `F_3 = 1 − T` (`h_0 = C(Φ_1²)⁻¹` gives `2 − 1`; `h_∞ = C(Φ_2²)` would give `2`). |
| Good, tame, wild | `p` is **wild** for `(A, B)` if `p` divides some element of `A ∪ B` (equivalently some `n` with `γ(n) ≠ 0`, equivalently the common denominator `N := lcm(A ∪ B)` of `α ∪ β`).  For `t ≠ 1`, `p` is **tame** for `(A, B, t)` if it is not wild and `v_p(t) ≠ 0` or `v_p(t − 1) > 0`; for `t = 1` no prime is tame.  **Good** means neither.  `H_q(α, β | ·)` at `q = p^f` is defined for every `p` not wild (4.7), and the trace `a_q(A, B; t)` for every good `p` and `f ≥ 1`. |
| Zigzag and Hodge vector | List the `2d` representatives in `(0, 1]` of `α` and `β`, with multiplicity, in increasing order; an `α` and a `β` never share a representative (disjointness), but copies of one class of `α` (or of `β`) are equal and adjacent, and their order among themselves is immaterial.  Start at height `0`; at an `α` record the current height and step up by `1`; at a `β` step down by `1`.  `h_k :=` the number of `α`'s recorded at height `k`.  The `c` copies of a class `a ∈ α` are recorded at the `c` consecutive heights `Z(a) − c, …, Z(a) − 1`, with `Z` the counting function of 2.1.  The heights recorded form an interval `[m, m + w]`; the **weight** is `w` and the **Hodge vector** is `(h_m, …, h_{m+w})`, written `(h^{0,w}, …, h^{w,0})` with `h^{p, w−p} := h_{m+p}`.  It is a palindrome for cyclotomic data (2.4), so the orientation is immaterial there.  The LMFDB knowl "hgm.zigzagplot" is this procedure.  Witness: `A2.2_B1.1` (`α = (1/2, 1/2)`, `β = (1, 1)`) records the two copies of `1/2` at heights `0` and `1`, so `w = 1` and the Hodge vector is `(1, 1)`; recording both at `Z(1/2) − 1 = 1` would give `w = 0` and `(2)`. |
| Type | **symplectic** if `w` is odd, **orthogonal** if `w` is even (knowl "hgm.type"; by 2.6 the LMFDB's extra clause "`d` even" is automatic for odd `w`). |
| Hodge normalisation | `δ(A, B) := (w + 1 − m_A − m_B)/2`, an integer by the parity law 2.5, `≥ 0`, and equal to `−m` (minus the least recorded height of the zigzag) when `1 ∉ A` (2.5).  The motive the LMFDB displays is Hodge-normalised (Hodge numbers `h^{p, w−p}` for `0 ≤ p ≤ w`), and its trace is `q^δ · H_q`; `H_q` alone is the trace of the Tate twist `H(A, B, t)(δ)`.  Witness (LMFDB data): `A2.2_B4` has `δ = 1`, and `A2.2_B4_t2.1` has `F_3(T) = 1 + 2T + 3T²`, `a_3 = −2 = 3 · H_3(1/2, 1/2; 1/4, 3/4 | 2)` with `H_3 = −2/3`.  `δ = 0` for `A2.2.2.2_B1.1.1.1`, `A4.2.2_B3.1.1` and every datum with `m_A + m_B = w + 1`; `δ = 2` for `A6.4.4.3_B12.2.2.2.1`.  Sage's `padic_H_value` carries the same factor (its `D = −min zigzag`, the same number). |
| Characters on `𝔽_q` | `𝔮 := q − 1`.  `ω : MulChar 𝔽_q ℂ` is a fixed character of order `𝔮` (a generator; exists by `exists_mulChar_orderOf_eq_card_units`), `ψ : AddChar 𝔽_q ℂ` a fixed nontrivial additive character, `g(m) := gaussSum (ω ^ m) ψ` for `m : ℤ`, and `ω(0) = 0` (Mathlib's convention), so `g(0) = −1`.  A parameter `a ∈ α` with `𝔮 • a = 0` in `ℚ/ℤ` has an integer `a𝔮 ∈ ℤ/𝔮`, and `ω^{a𝔮}` is well defined.  `H_q` does not depend on `ψ` (4.4), and changing `ω` to `ω^u` replaces `(α, β)` by `(uα, uβ)` (4.4), so for cyclotomic data it depends on nothing (4.5). |
| The four sums | `S_q(α, β | t) := (1/𝔮) ∑_{m ∈ ℤ/𝔮} ∏_i g(m + α_i𝔮) g(−m − β_i𝔮) · ω((−1)^d t)^m`; `H_q(α, β | t) := −∏_i (g(α_i𝔮) g(−β_i𝔮))^{-1} · S_q(α, β | t)`, which is Beukers–Cohen–Mellit Definition 1.1 since `−1/𝔮 = 1/(1 − q)`; Katz's `Hyp_q(α, β | t)` is the exponential sum over the torus `t x_1⋯x_d = y_1⋯y_d` of 4.2; Greene's `_{n+1}F_n` is Definition 3.10 of his paper, in his normalization.  **`H_q` is the one that enters the arithmetic layer.** |
| `H_q` for all good `q` | For a cyclotomic datum and `p ∤ N`, `H_q(α, β | t)` is **defined** by the gamma-vector form of Beukers–Cohen–Mellit Theorem 1.3 (4.7), which needs no congruence on `q`; when `q ≡ 1 (mod N)` it agrees with the definition through 4.3, and that agreement is the theorem, not the definition.  This is Beukers–Cohen–Mellit Assumption 1.4. |
| Frobenius polynomial | `F_p(T) := exp(−∑_{e ≥ 1} a_{p^e} T^e/e) ∈ ℚ[[T]]`, truncated to degree `d`: `frobeniusPolynomial := trunc (d + 1) frobeniusSeries`.  Under the purity hypothesis of 5.5 the series is already a polynomial of degree `d` and the truncation changes nothing; without it the truncation is a definition that assigns a polynomial of degree `≤ d` to every datum.  `F_p(0) = 1` always.  The Euler factor of the L-function at `p` is `F_p(p^{−s})^{-1}` (arithmetic normalization, weight `w`). |
| Conductor exponents | At a tame prime, `c_p := rank(h_τ^{|k|} − 1)` with `τ, k` as in the "Cusps and `t`" row (Roberts–Rodriguez-Villegas (13.1)), except at the cusp `1`, where `c_p := 1` unless the type is orthogonal and `v_p(t − 1)` is even, when `c_p := 0`.  At a wild prime the exponent is the Artin conductor of the realization and is not defined here. |
| Determinant discriminant | For orthogonal type: when exactly one of "`d` odd" and "`1 ∈ A`" holds, `Disc(A, B; t) := Π_B · (1 − t)` with `Π_B := ∏_{v ∈ B} Polynomial.discr (Φ_v)`; otherwise `Disc(A, B; t) := Π_A · t · (t − 1)` with `Π_A := ∏_{v ∈ A} Polynomial.discr (Φ_v)` (`t` the LMFDB's; Mathlib's `Polynomial.discr` is `(−1)^{n(n−1)/2} Res(f, f')` for monic `f` of degree `n`).  The **determinant character** `χ_Disc` is the quadratic character of `ℚ(√Disc(A,B;t))`, and at a good prime `p` the sign of the local functional equation is `ε_p = (−1)^d χ_Disc(p)` (5.5, 5.8).  This is Watkins's recipe as implemented in Sage's `HypergeometricData.sign` (whose `t` is the LMFDB's); its geometric part (which of `0`, `1`, `∞` ramify) is a theorem here (5.8) and its constants `Π_A`, `Π_B` are a cited recipe.  Witness: over the 131 good `(motive, p)` pairs of the LMFDB's orthogonal family `A4_B2.1`, `ε_p = (−1)^d χ_Disc(p)` holds in all; e.g. `A4_B2.1_t-8.1` has `F_5 = 1 − T²`, `ε_5 = −1`, and `Disc = −4 · 72`, `(−2/5) = −1`. |
| Archimedean shifts | From a Hodge vector `(h^{0,w}, …, h^{w,0})` and an integer `σ`, the signature in the LMFDB's sign convention (its `sig`, with `h⁺ − h⁻ = σ`), the shifts in the analytic normalisation are: the complex shifts `ν` are `(w − 2p)/2` with multiplicity `h^{p, w−p}` for `0 ≤ p < w/2`, plus `0` with multiplicity `(h^{w/2,w/2} − |σ|)/2` when `w` is even; the real shifts `μ` are `|σ|` copies of `0` if `σ > 0` and `|σ|` copies of `1` if `σ ≤ 0`.  Roberts–Rodriguez-Villegas (12.2) write the same factor in the arithmetic normalisation, `Γ_ℝ(s − w/2)^{h⁺} Γ_ℝ(s − w/2 + 1)^{h⁻} ∏_{p<q} Γ_ℂ(s − p)^{h^{p,q}}` with `h^± = (h^{w/2,w/2} ± (−1)^{w/2} σ_RRV)/2` (their (12.2) and the definition of `h^±` after it, p. 12), so their `σ_RRV` is `(−1)^{w/2} σ`; the two signs agree for `w ≡ 0 (mod 4)` and are opposite for `w ≡ 2 (mod 4)`. |

## Exact supplier contracts

### From Mathlib

- Gauss and Jacobi sums over a finite field with values in any commutative ring, `gaussSum`,
  `jacobiSum`, and their algebra (`gaussSum_mul_gaussSum_eq_card`, `gaussSum_mulShift_eq`,
  `star_gaussSum_eq`, `gaussSum_frob`, `jacobiSum_eq_gaussSum_mul_gaussSum_div_gaussSum`,
  `gaussSum_pow_eq_prod_jacobiSum`, `MulChar.ringHomComp`, `jacobiSum_ringHomComp`)
  (`Mathlib/NumberTheory/GaussSum.lean`, `Mathlib/NumberTheory/JacobiSum/Basic.lean`);
  Beukers–Cohen–Mellit Theorems 2.1 and 2.2 are these.  Assumed: every multiplicative character,
  the trivial one included, sends `0` to `0`, so `g(1) = −1` for nontrivial `ψ`.
- Multiplicative characters of a finite field (`MulChar`, its `CommGroup` instance,
  `MulChar.exists_mulChar_orderOf_eq_card_units`) and additive characters (`AddChar`,
  `AddChar.IsPrimitive`, `FiniteField.primitiveChar`) (`Mathlib/NumberTheory/MulChar/*`,
  `Mathlib/NumberTheory/LegendreSymbol/AddCharacter.lean`), `quadraticChar`.
- Cyclotomic polynomials over any ring (`Polynomial.cyclotomic`, `natDegree_cyclotomic`,
  `cyclotomic.monic`, `cyclotomic_coeff_zero`, `cyclotomic_eq_prod_X_sub_primitiveRoots`,
  `prod_cyclotomic_eq_X_pow_sub_one`, `cyclotomic_eq_prod_X_pow_sub_one_pow_moebius`,
  `cyclotomic.irreducible_rat`, `Polynomial.eval_one_cyclotomic_prime_pow`,
  `Polynomial.eval_one_cyclotomic_not_prime_pow`, `Polynomial.cyclotomic_expand_eq_cyclotomic`)
  (`Mathlib/RingTheory/Polynomial/Cyclotomic/*`); Layer 1's gamma vector is the Möbius formula
  applied to a product.
- The rational circle `AddCircle (1 : ℚ)` with `AddCircle.equivIoc`, `AddCircle.equivIco`,
  `addOrderOf_coe_rat` and `AddCircle.addOrderOf_div_of_gcd_eq_one`
  (`Mathlib/Topology/Instances/AddCircle/Defs.lean`); `Nat.totient`,
  `Nat.filter_coprime_Ico_eq_totient`, `ArithmeticFunction.moebius`, `ascPochhammer`.
- The Galois group of a cyclotomic field (`IsCyclotomicExtension.autEquivPow`,
  `IsPrimitiveRoot.autToPow`, `IsCyclotomicExtension.Rat.galEquivZMod`).
- Resultants, Sylvester matrices and discriminants (`Polynomial.resultant`,
  `Polynomial.sylvester`, `resultant_eq_prod_roots_sub`, `resultant_ne_zero`, and
  `Polynomial.discr` with `discr_of_degree_eq_two`,
  `Mathlib/RingTheory/Polynomial/Resultant/Basic.lean`); the Bézout matrix is not there and is
  built in 3.8.
- Matrices: `Matrix.charpoly`, `Matrix.rank`, `Matrix.IsHermitian` with
  `Matrix.IsHermitian.eigenvalues`, `Matrix.PosDef`, `Matrix.conjTranspose`,
  `Matrix.GeneralLinearGroup`, `Algebra.leftMulMatrix` with `charpoly_leftMulMatrix`,
  `AdjoinRoot.powerBasis'`, `Submodule.smithNormalForm`.
- `Polynomial.Gal`, `NumberField.discr`, `PowerSeries.exp`, `PowerSeries.subst`,
  `PowerSeries.trunc`, `Polynomial.reverse`, `Polynomial.rootMultiplicity`, `padicValRat`,
  `GaloisField`, `WeierstrassCurve` with `WeierstrassCurve.Affine.Point`.

Mathlib has no hypergeometric parameters, no Levelt matrices, no finite hypergeometric sum, no
Hasse–Davenport relation, no Bézout matrix, no companion matrix, no zigzag, and no Euler factor
built from traces.

### From Tau Ceti

- `TauCeti.Geometry.Hodge.*`: pure Hodge structures `HodgeStructureOn W ω n` with
  `TauCeti.Hodge.HodgeStructureOn.hodgeNumber` and `hodgeNumber_symm`
  (`TauCeti.Geometry.Hodge.Dimension`).  Fedorov's identification is stated against this object
  in prose; the symmetry theorem 2.4 is its combinatorial shadow.
- `TauCeti.NumberTheory.DirichletCharacter.GaussSum` and
  `TauCeti.NumberTheory.NumberField.Cyclotomic.GaussSum`: `gaussSumOfPrimitiveRoot` and
  `map_gaussSumOfPrimitiveRoot`, the Galois action on Dirichlet Gauss sums inside a cyclotomic
  field, the model for 4.4.
- `TauCeti.NumberTheory.Cyclotomic.Aut`: `IsCyclotomicExtension.card_aut_eq_totient`.
- `TauCeti.NumberTheory.ArithmeticDirichletSeries.EulerProduct.Data`: `EulerProductData`, the
  Euler-product carrier that the L-functions roadmap fills from the Euler factors of Layer 5.
- `TauCeti.NumberTheory.Chebotarev.GaloisCharacter.Cyclotomic.Basic`: the cyclotomic Artin map,
  the vocabulary for 4.4's Frobenius statement.
- `TauCeti.AlgebraicGeometry.EllipticCurve.PointCount`: `WeierstrassCurve.pointCount`, the
  projective point count of a Weierstrass equation over a finite field, with
  `WeierstrassCurve.pointCount_eq_card_point` identifying it with `Nat.card` of Mathlib's point
  type on an elliptic model, the form 6.1 and 6.2 count in.

Tau Ceti's `Probability/Distributions/Hypergeometric` and
`Analysis/SpecialFunctions/RegularizedHypergeometric` share the word and nothing else; neither is
consumed.  Tau Ceti has no hypergeometric motive, no hypergeometric data, no finite
hypergeometric sum and no Bézout matrix.

### From TauCetiRoadmap.ClassicalArithmeticCompletion

[Classical arithmetic completion](../ClassicalArithmeticCompletion/README.md):

- **2.46**, the companion matrix `Polynomial.companion f` (`1` on the subdiagonal, `−coeff f i`
  in the last column, indexed by `Fin f.natDegree`) with `leftMulMatrix_root_eq_companion` (the
  matrix of multiplication by the root of `AdjoinRoot f`), `det_companion`, `minpoly_companion`
  and `hasEigenvalue_companion_iff`, and **2.60**, `charpoly C(f) = f` for monic `f` over any
  commutative ring; consumed by Layer 3 and restated nowhere here.
- **7.12**, Stickelberger's finite Gauss-sum valuation `v_𝔓̃(g(ω^{−a})) = s(a)`, the base-`p`
  digit sum of `a`, at the prime above `p`; consumed by 4.8 and 4.9.
- **7.29**, the Hasse–Davenport product relation: for `n ∣ q − 1`, `λ` of exact order `n` and any
  `χ`, `g(χⁿ) ∏_{j=1}^{n−1} g(λʲ) = χ(n)ⁿ ∏_{j=0}^{n−1} g(χλʲ)`.  In the exponent notation of 4.3
  (`χ = ω^m`, `λ = ω^{𝔮/n}`) this is `∏_{j=0}^{n−1} g(m + j𝔮/n) = ω(n)^{−nm} g(nm) ∏_{j=1}^{n−1} g(j𝔮/n)`,
  Beukers–Cohen–Mellit Theorem 2.5; consumed by 4.7 and by nothing else.  Assumed: the exact
  identity for every `q`, as 7.29 states it; its proof route settles the characteristic-two sign as
  a separate step, on which 4.7 at `p = 2` (a datum with every entry of `A ∪ B` odd) relies.
- **1.19**, **1.36**, **1.46** and **1.53** (cubic and quartic Gauss and Jacobi sums over `𝔽_p`):
  the worked instances 6.2 compares against.

### From TauCetiRoadmap.EllipticLegendreCharacterInterfaces

[Elliptic curves, Part II — Legendre models, descent and character
interfaces](../EllipticLegendreCharacterInterfaces/README.md): its **0.1**, the Legendre equation
`legendre λ`, the Weierstrass model `y² = x(x − 1)(x − λ)` with coefficients
`(0, −(1 + λ), 0, λ, 0)` over every commutative ring, which is `legendreFamily λ` of 6.1 by
definition; and its **5.1**, the character-sum point count
`pointCount = q + 1 + ∑_x quadraticChar(f(x))` for a normal-form equation `y² = f(x)` over an odd
finite field, the first step of 6.1's proof.

### From TauCetiRoadmap.ModularCurves

[Modular curves](../ModularCurves/README.md) 4C: the Legendre problem over `ℤ[1/2]`, whose
universal curve over `ℤ[1/2][λ, 1/λ(λ − 1)]` has fibre `legendreFamily λ` at `λ = t`; the LMFDB
family `A2.2_B1.1` is that fibre.  Consumed in prose by 6.1.

### From TauCetiRoadmap.Chebotarev

The completed [Chebotarev roadmap](../../Completed/Chebotarev/README.md), Layer 4: the cyclotomic
Galois character, Frobenius acting on `ζ_m` by `ζ_m ↦ ζ_m^{𝔑𝔭}`; 4.4 states the Galois action on
`H_q` in that vocabulary.

### From TauCetiRoadmap.LFunctions

[L-functions](../LFunctions/README.md), Layer 0: `ArithmeticLFunctionData` with its weight-`w`
normalization translation, conductor, gamma shifts, root number and polar divisor.  Layer 5
supplies the Euler factors, the conductor exponents at tame primes and the archimedean shifts;
the card, its continuation and its functional equation are that roadmap's.  The motivic
L-function of a hypergeometric motive is an instance of its Layer 0, not a second record type
here.

### From TauCetiRoadmap.ThetaSeries

[Theta series](../ThetaSeries/README.md) 2H: `kroneckerSym` and `kroneckerChar Δ` for
`Δ ≡ 0, 1 (mod 4)`; 5.8 defines the determinant character with them.

### From TauCetiRoadmap.DeligneWeightsAndPurity

[`DeligneWeightsAndPurity`](../DeligneWeightsAndPurity/README.md), Layer DWP.0, 0.1–0.2: Weil
`q`-numbers of integer weight and their closure properties; 5.5's purity hypothesis is phrased with
them in prose, and its Lean form carries the absolute-value condition directly.

### From TauCetiRoadmap.PolynomialGaloisGroups and TauCetiRoadmap.NumberFieldArithmetic

The completed [`PolynomialGaloisGroups`](../../Completed/PolynomialGaloisGroups/README.md) and
[number-field arithmetic](../../Completed/NumberFieldArithmetic/README.md) roadmaps: the Galois
group of a rational polynomial and `NumberField.discr`; 5.12 forms the LMFDB's `Gal(F_p(T))` and
local discriminant from them and adds nothing to either theory.

### From TauCetiRoadmap.HodgeStructures and TauCetiRoadmap.MotivesAndAlgebraicCycles

The completed [Hodge structures roadmap](../../Completed/HodgeStructures/README.md) (the Hodge
numbers of a Hodge structure, which Fedorov's theorem identifies with the zigzag numbers) and
[`MotivesAndAlgebraicCycles`](../MotivesAndAlgebraicCycles/README.md), Layers 1–2 (the category
of pure motives and its realizations): the carriers in which the prose of 6.4 locates Katz's
motive.  Nothing here is stated against either in Lean.

## How to read the build

Layer 1 builds the two carriers and every invariant of `(A, B)` that needs neither a zigzag nor a
matrix, from Mathlib alone.  Layer 2 is the zigzag (weight, Hodge vector, type, `δ`) and needs only
Layer 1.  Layer 3 is the monodromy (Levelt, Beukers–Heckman, Bézout) on top of Layer 1 and the
companion matrices of `ClassicalArithmeticCompletion` 2.46 and 2.60; its finiteness criterion for
cyclotomic data reads 2.8.  Layer 4 is the finite sums on top of Mathlib's Gauss and Jacobi sums
and Layer 1; its gamma-vector form consumes `ClassicalArithmeticCompletion` 7.29 and its
integrality theorems consume 7.12 and the exponent `δ` of 2.5.  Layers 2, 3 and Layer 4 apart from
4.8–4.9 proceed in parallel once Layer 1 is in place.  Layer 5 assembles traces, Euler factors,
bad primes and conductor exponents from Layers 2–4 and states the purity consequences; Layer 6
proves the two elliptic point counts and cites the motive.

---

## Layer 1: hypergeometric data

The carriers, in both forms, and everything the family page of the LMFDB displays that is a
function of `(A, B)` without a zigzag or a matrix.

### 1.1 Parameter pairs

Define `HypergeometricParameters` as the structure with fields `α β : Multiset (AddCircle (1 : ℚ))`,
`card_eq : Multiset.card α = Multiset.card β` and `disjoint : ∀ a, a ∈ α → a ∉ β`.  Define
`degree := Multiset.card α` and the representative map `rep : AddCircle (1 : ℚ) → ℚ` with values in
`(0, 1]` through `AddCircle.equivIoc (1 : ℚ) 0`.  Prove `rep` is injective, `((rep x : ℚ) : AddCircle 1) = x`,
and that `rep` sends the class of `0` to `1`.  Define the **swap** `(α, β) ↦ (β, α)`, the
**negation** `(α, β) ↦ (−α, −β)`, the **shift** by `μ ∈ ℚ/ℤ`, `(α, β) ↦ (α + μ, β + μ)` (a bijection
preserving disjointness), and the **scaling** by `u ∈ ℤ` coprime to the common denominator,
`(α, β) ↦ (uα, uβ)`; prove each is an involution or an action as appropriate and preserves the
degree.  Define the **common denominator** `N` as the least `n > 0` with `n • a = 0` for all
`a ∈ α ∪ β` (the lcm of the additive orders, `addOrderOf_coe_rat`); `Suggested.lean` writes it
`denominator`.  Define the representative `rep0` in `[0, 1)` through `AddCircle.equivIco`, used
only by 3.6.  `Suggested.lean` writes `ℚ/ℤ` as `QmodZ` and the negation as `neg`.

**Checks.**

- `α = {1/2}`, `β = {0}`: the structure accepts it, `degree = 1`, `rep 0 = 1`, `rep0 0 = 0`; a
  definition through `equivIco` alone would put the class of `0` at `0` and move it to the start
  of the zigzag of 2.1.
- `α = {1/2}`, `β = {1/2}` is rejected by `disjoint`; `α = {1/2}`, `β = ∅` by `card_eq`.
- `α = {1/4, 3/4}`, `β = {1/2, 1}`: `N = 4` (orders `4, 4, 2, 1`); the shift by `1/2` gives
  `({3/4, 1/4}, {1, 1/2})`, the same pair, and the negation fixes it too.

*Needs:* Mathlib `AddCircle`, `AddCircle.equivIoc`, `AddCircle.equivIco`, `addOrderOf_coe_rat`,
`Multiset`.

### 1.2 Cyclotomic data

Define `CyclotomicData` with fields `A B : Multiset ℕ`, `pos : ∀ n ∈ A + B, 0 < n`,
`disjoint : ∀ a, a ∈ A → a ∉ B`, `degree_eq : (A.map Nat.totient).sum = (B.map Nat.totient).sum`.
Define `degree := (A.map Nat.totient).sum`, the **cyclotomic polynomials**
`Φ_A := ∏_{a ∈ A} Polynomial.cyclotomic a ℤ`, `Φ_B`, and the **defining rational function**
`Q := Φ_A / Φ_B` in `RatFunc ℚ`.  Prove `natDegree Φ_A = natDegree Φ_B = d`, that `Φ_A` and
`Φ_B` are monic, coprime over `ℚ` (distinct cyclotomic polynomials are coprime; `disjoint` is
exactly what this needs), and that `Φ_A(0) = (−1)^{m_A}` with `m_A :=` the multiplicity of `1`
in `A` (`Φ_1(0) = −1`, `Φ_n(0) = 1` for `n ≥ 2`).  Define `m_A`, `m_B` (`multOne_A`,
`multOne_B`); prove `m_A m_B = 0`.  `Suggested.lean` writes `Φ_A`, `Φ_B` as `PhiA`, `PhiB`, and
proves monicity (`monic_PhiA`, `monic_PhiB`) and states the degree (`natDegree_PhiA`,
`natDegree_PhiB`) because the Levelt matrices of 3.2 take them as arguments.

**Checks.**

- `A = [2,2]`, `B = [1,1]` (`A2.2_B1.1`): `d = 2`, `Φ_A = (X + 1)²`, `Φ_B = (X − 1)²`,
  `Φ_A(0) = 1 = (−1)^0`, `Φ_B(0) = 1 = (−1)^2`, `m_A m_B = 0 · 2`.
- `A = [2,2]`, `B = [2,1]` is rejected (`2 ∈ A ∩ B`); `A = [3]`, `B = [1]` is rejected
  (`φ`-sums `2 ≠ 1`).
- `A = [4]`, `B = [2,1]`: `Φ_A = X² + 1` and `Φ_B = X² − 1` are coprime over `ℚ` but not over
  `ℤ` (their difference is `2`), which is why coprimality is stated over `ℚ`.

*Needs:* Mathlib `Polynomial.cyclotomic`, `natDegree_cyclotomic`, `cyclotomic.monic`,
`cyclotomic_coeff_zero`, `Nat.totient`.

### 1.3 The dictionary

Define `toParameters : CyclotomicData → HypergeometricParameters` with
`α := A.bind (fun a ↦ (Finset.filter (Nat.Coprime a) (Finset.Icc 1 a)).val.map (fun k ↦ ((k : ℚ)/a : AddCircle 1)))`
and likewise `β`; prove the cardinalities are `d` (the count of `k ∈ [1, a]` coprime to `a` is
`φ(a)`), disjointness (a class `k/a` in lowest terms determines `a`), and that the multiset of
representatives of `α` is the multiset of arguments of the roots of `Φ_A`, i.e.
`Φ_A = ∏_{x ∈ α} (X − e(x))` over `ℂ` with `e(x) = exp(2πi · rep x)`
(`cyclotomic_eq_prod_X_sub_primitiveRoots`).  Define `IsGaloisStable (α, β) := ∀ u, Nat.Coprime u N → uα = α ∧ uβ = β`
and prove: `toParameters D` is Galois stable; conversely a Galois-stable pair is `toParameters D`
for a unique `D` (`exists_unique_of_isGaloisStable`; collect the classes by additive order; the
orbit of a class of order `a` under `(ℤ/a)ˣ` is the full set of classes of order `a`).  Prove the
common denominator of `toParameters D` is `lcm (A ∪ B)`.  Prove `toParameters` is injective and
respects swap.  `Suggested.lean` writes the multiset `α(A)` as `primitiveClasses A`, and proves
the cardinality and disjointness that `toParameters` needs as `card_primitiveClasses` and
`addOrderOf_mem_of_mem_primitiveClasses`.

**Checks.**

- `A = [4]`: `α = {1/4, 3/4}` (not `{1/4, 1/2, 3/4, 1}`, which would be the roots of `X⁴ − 1`);
  `A = [1]`: `α = {1}`, the class of `0`.
- `A = [6]`, `B = [3]` would give `α = {1/6, 5/6}`, `β = {1/3, 2/3}`; the pair `({1/6}, {1/3})` is
  not Galois stable (`u = 5` sends `1/6` to `5/6`), so it is no `toParameters D`.
- `A = [10,6,3,2]`, `B = [14,1,1,1]`: the common denominator is `lcm = 210`, and `d = 9 = 4 + 2 + 2
  + 1 = 6 + 1 + 1 + 1`.

*Needs:* 1.1, 1.2; Mathlib `Nat.totient_eq_card_coprime`,
`cyclotomic_eq_prod_X_sub_primitiveRoots`, `IsPrimitiveRoot`; the orbit statement is
`IsPrimitiveRoot.pow_of_coprime` and its converse; for the Galois-stability definition, the
common denominator of 1.1.

### 1.4 The gamma vector and `M`

Define `gamma D : ℕ → ℤ`, `gamma D n := ∑_{a ∈ A, n ∣ a} μ(a/n) − ∑_{b ∈ B, n ∣ b} μ(b/n)` (`0` at
`n = 0`), prove it is finitely supported (support in the divisors of elements of `A ∪ B`), and
prove the **defining identity** `Φ_A · ∏_{γ(n) < 0} (X^n − 1)^{−γ(n)} = Φ_B · ∏_{γ(n) > 0} (X^n − 1)^{γ(n)}`
in `ℤ[X]` from `cyclotomic_eq_prod_X_pow_sub_one_pow_moebius`, and the uniqueness: any finitely
supported `g : ℕ → ℤ` with that identity equals `gamma D` (the polynomials `X^n − 1` are
multiplicatively independent in `ℚ(X)ˣ/ℚˣ`, by comparing multiplicities of primitive roots of
unity).  Define `gammaMultiset D : Multiset ℤ` (`n` with multiplicity `γ(n)`, `−n` with
multiplicity `−γ(n)`), prove its sum is `0` and that it has no entry `0`, and prove
`∑_{γ(n) > 0} n γ(n) = ∑_{γ(n) < 0} n (−γ(n))` (compare degrees).  Define `r D`, `s D` as the
numbers of positive and of negative entries, and `M D := ∏_n (n : ℚ)^{n · γ(n)}`, a positive
rational; prove `M (swap D) = M D⁻¹`.  Prove the Pochhammer identity of Beukers–Cohen–Mellit §1,
`∏_i (α_i)_n / ∏_j (β_j)_n = M^{−n} ∏ (p_j n)! / ∏ (q_j n)!`, as a statement about
`ascPochhammer ℚ n` evaluated at the representatives.  `Suggested.lean` takes the products over
`gammaSupport D`, the divisors of the elements of `A ∪ B`, and states the defining identity, the
uniqueness and the Pochhammer identity as `gamma_defining_identity`, `gamma_unique` and
`pochhammer_identity`.

*Needs:* 1.2, 1.3; Mathlib `cyclotomic_eq_prod_X_pow_sub_one_pow_moebius`,
`ArithmeticFunction.moebius`, `ascPochhammer`, `Nat.factorial`.

**Checks.**

- `A = [2,2,2,2]`, `B = [1,1,1,1]`: `γ(2) = 4`, `γ(1) = −8`, multiset `[−1^8, 2^4]`, `M = 256`;
  a sign error (`γ` from `B`) would give `M = 1/256`.
- `A = [30]`, `B = [5,3,2,1]`: multiset `[−15, −10, −6, 1, 30]`,
  `M = 30^{30}/(15^{15} 10^{10} 6^6) = 1007769600000`, sum `0`, no entry `0`.
- `A = [1]`, `B = [2]`: `Φ_1/Φ_2 = (X − 1)²/(X² − 1)`, so `γ(1) = 2`, `γ(2) = −1`, multiset
  `[−2, 1, 1]`, `M = 1/4`; at `n = 1` the Pochhammer identity reads `1/(1/2) = 4 · 1!² / 2!`.

### 1.5 Reciprocity and the two parities

Prove `Polynomial.reverse Φ_A = Φ_A` (every `Φ_n` with `n ≥ 2` is palindromic and `Φ_1` is
anti-palindromic; the sign is `(−1)^{m_A}`, and `reverse` of the product carries it — state the
exact identity `X^d Φ_A(1/X) = (−1)^{m_A} Φ_A(X)` and deduce that the multiset `α(A)` is stable
under negation).  Prove the two **parity laws** that the LMFDB's type field relies on, in their
combinatorial form, in Layer 2; here prove only their algebraic inputs:
`Φ_A(1) = ∏_{a ∈ A, a ≥ 2} Φ_a(1)` is `0` exactly when `1 ∈ A`, and `Φ_a(1) = p` if `a` is a
power of the prime `p` and `1` otherwise (`Polynomial.eval_one_cyclotomic_prime_pow`,
`eval_one_cyclotomic_not_prime_pow`).

*Needs:* 1.2; Mathlib `Polynomial.reverse`, `Polynomial.eval_one_cyclotomic_prime_pow`,
`Polynomial.eval_one_cyclotomic_not_prime_pow`.

### 1.6 Wild primes and the common denominator

Define `wildPrimes D : Finset ℕ` as the set of primes dividing some element of `A ∪ B`, and
`IsWild D p` as membership.  Prove the
three characterizations: `p` wild ⟺ `p ∣ lcm (A ∪ B)` ⟺ `p ∣ n` for some `n` with
`gamma D n ≠ 0` ⟺ some `a ∈ α ∪ β` has additive order divisible by `p`.  Prove that for `p` not
wild, `p` is a unit modulo every `a ∈ A ∪ B`, so that `q = p^f ≡ 1 (mod N)` for `f` the order of
`p` in `(ℤ/N)ˣ`.

**Checks.**

- `A = [2,2]`, `B = [1,1]`: wild primes `{2}`; `γ` is nonzero exactly at `1, 2`, so the gamma
  characterization agrees.
- `A = [6,4,4,3]`, `B = [12,2,2,2,1]`: wild primes `{2, 3}`; `5` and `7` are not wild.
- `A = [1]`, `B = [1]` is not a datum, and `A = ∅ = B` (degree `0`) has no wild primes; the
  characterization through `γ` is vacuous there, as it should be.

*Needs:* 1.2, 1.3, 1.4.

### 1.7 The `p`-parts and prime-to-`p` parts

For a prime `p`, write each `u ∈ A ∪ B` as `u = p^s v` with `p ∤ v`.  Define the multisets
`A' := A.bind (u ↦ φ(v) copies of p^s)`, `B'` likewise, and `A_p`, `B_p`, `C_p` by removing from
`A'` and `B'` the largest common sub-multiset (`C_p := A' ⊓ B'`, `A_p := A' − C_p`,
`B_p := B' − C_p`).  Define `A^p`, `B^p` the same way from `u ↦ φ(p^s)` copies of `v`.  Prove:
`(A_p, B_p)` is again a cyclotomic datum (disjoint by construction, equal totient sums since
`φ(p^s v) = φ(p^s) φ(v)`), as is `(A^p, B^p)`; that `α(A_p) ∪ β(B_p)` consists of the `p`-power
order classes of `α ∪ β` with the common ones cancelled; and that `p` is not wild for
`(A^p, B^p)`.  These are the LMFDB knowls "hgm.defining_parameter_ppart" and
"hgm.defining_parameter_primetoppart".

**Checks.**

- `A = [18,12]`, `B = [8,3,2,1,1,1]`, `p = 2`: `A' = [4,4,2^6]`, `B' = [8,2,1^5]`, so
  `C_2 = [2]`, `A_2 = [4,4,2,2,2,2,2]`, `B_2 = [8,1,1,1,1,1]`; forgetting the multiplicity `φ(v)`
  would give `A' = [2,4]` and a pair of unequal degrees.
- Same datum, `p = 3`: `A_3 = [9,3]`, `B_3 = [1^8]`, `C_3 = [3]`; prime-to-`2` part
  `A^2 = [9,3]`, `B^2 = [1^8]`, in which `2` is not wild.
- `p` not wild (`A = [2,2]`, `B = [1,1]`, `p = 3`): every `u` has `s = 0`, so `A' = [1,1] = B'`,
  `C_3 = [1,1]`, `A_3 = ∅ = B_3`, while `(A^3, B^3) = (A, B)`.

*Needs:* 1.2; Mathlib `Nat.totient_mul` (coprime), `Nat.factorization`.

### 1.8 The rotation number

Define `rotationNumber (α, β) := Nat.card {ρ : AddCircle 1 // ρ + α = α ∧ ρ + β = β}` (the
stabilizer of the pair under translation, a finite subgroup of the torsion of `ℚ/ℤ`).  Prove it
is finite and divides `N`.  For a cyclotomic datum prove **`rotationNumber = gcd` of the gamma
multiset** (`ρ` of order `r` stabilizes both multisets iff `Φ_A` and `Φ_B` are polynomials in
`X^r` iff `Q(X) = Q_1(X^r)` for a rational function `Q_1` iff `r ∣ n` for every `n` with
`γ(n) ≠ 0`; `rotationNumber_eq_gcd`).  This is the LMFDB knowl "hgm.rotation_number".  For
`d = 0` the stabilizer is all of `ℚ/ℤ` and `Nat.card` returns `0`, so "finite" and "divides `N`"
are stated for `d > 0`.

**Checks.**

- `A = [4]`, `B = [2,1]`: `γ = [−2, −2, 4]` and rotation number `2` (translation by `1/2` fixes
  `{1/4, 3/4}` and `{1/2, 1}`, although `1 ∈ B`); a definition testing only `α` would also give
  `2` here, but on `α = {1/4, 3/4}`, `β = {1/3, 2/3}` it gives `2` against the true `1`.
- Every family whose gamma multiset contains `±1`, such as `A2.2.2.2_B1.1.1.1`, has rotation
  number `1`.
- `A = [9]`, `B = [3,3,1,1]`: `γ = [−3,−3,−3,9]`, rotation number `3`, the gcd.

*Needs:* 1.1, 1.3, 1.4.

### 1.9 The primitive datum

For a cyclotomic datum with rotation number `r`, define `primitiveData D` as the cyclotomic datum
with gamma function `n ↦ γ(rn)` (so its gamma multiset is `γ/r`), prove it is a cyclotomic datum
(1.4's uniqueness in reverse: the product `∏ (X^n − 1)^{γ(rn)}` is a quotient of products of
cyclotomic polynomials with disjoint index sets), that its rotation number is `1`, that its degree
is `d/r`, and that `Q_D(X) = Q_{primitiveData D}(X^r)`.  Call `D` **primitive** when `r = 1`.
The relation between the finite sums of `D` and of `primitiveData D` is Layer 4's
Kummer-pullback identity.  `Suggested.lean` defines `primitiveData D` as the datum whose gamma
vector is `n ↦ γ(rn)`, chosen through `Classical.epsilon`; 1.4's uniqueness makes it unique.

**Checks.**

- `A = [4]`, `B = [2,1]`: `γ/2 = [−1, −1, 2]`, so `primitiveData D = ([2], [1])`, degree `1 = 2/2`.
- `A = [9]`, `B = [3,3,1,1]`: `primitiveData D = ([3], [1,1])`, degree `2 = 6/3`.
- A primitive datum is its own primitive datum (`A2.2_B1.1`); a definition dividing the
  entries of `A`, `B` by `r` instead would send `([4],[2,1])` to `([2],[1, 1/2])`, not a datum.

*Needs:* 1.4, 1.8.

### 1.10 Interlacing

Define `Interlace (α, β)` : between any two consecutive representatives of `α` in `(0, 1]` lies
exactly one representative of `β`, and cyclically (equivalently, in the sorted list of all `2d`
representatives the colours alternate).  Prove it is invariant under shift and under negation,
and that for a cyclotomic datum it is invariant under scaling by units (so "interlace" and
"interlace after every Galois conjugation" coincide for cyclotomic data, which is why
Beukers–Heckman Theorem 4.8 needs the conjugates and the LMFDB does not).  `Suggested.lean`
states it through the counting function `Z` of 2.1: `Interlace` holds when `Z` takes only the
values `{0, 1}` or only `{0, −1}`, with `InterlaceMultisets α β` the same condition on two bare
multisets (3.7 applies it to the scaled pairs).

**Checks.**

- `A = [30]`, `B = [5,3,2,1]` interlaces (the LMFDB's weight-`0` Bober family).
- `A = [2,2]`, `B = [1,1]` does not: `Z(1/2) = 2`; a test on the distinct representatives only
  (`{1/2}` against `{1}`) would wrongly accept it.
- `α = {1/4, 3/4}`, `β = {1/2, 1}` interlaces (`1/4 < 1/2 < 3/4 < 1`), and so does its scaling
  by `3`, as the invariance under units predicts.

*Needs:* 1.1, 1.3, 2.1 (the counting function `Z`).

### 1.11 Specialization points and the three cusps

Specialization points are rational numbers `t ≠ 0`; the hypothesis `t ≠ 0` is carried by the
theorems that need it and no subtype is introduced.  Define, for a prime `p`, the **cusp of `t` at
`p`**: `0`-cusp if `v_p(t) > 0`, `∞`-cusp if `v_p(t) < 0`, `1`-cusp if `v_p(t) = 0` and
`v_p(t − 1) > 0`, and none otherwise; prove the cases are exclusive and exhaustive.  Define
`IsTame D t p`, `IsGood D t p` by the pinned conventions, prove good/tame/wild partition the
primes for `t ≠ 1`, and that for `t = 1` the primes are exactly good or wild.  `Suggested.lean`
names the cusps `Cusp.zero`, `Cusp.inf`, `Cusp.one` of the type `Cusp` and writes the cusp of `t` at `p` as
`cuspAt t p`; with Mathlib's `padicValRat p 0 = 0`, `t = 0` has no cusp, so every theorem that
reads a trace carries `t ≠ 0`.

**Checks.**

- `A2.2_B1.1`, `t = −3`, `p = 3`: `v_3(t) = 1`, cusp `zero`, tame; `p = 5`: no cusp, good.
- `t = 8`, `p = 7`: `v_7(t − 1) = 1`, cusp `one`; `t = 1/7`: cusp `inf`.
- `t = 1`: `padicValRat p 0 = 0`, so no prime is tame; a definition with `v_p(t − 1) ≥ 0` in place
  of `> 0` would make every prime tame at every `t`.

*Needs:* 1.6; Mathlib `padicValRat`.

### 1.12 The duality `(A, B, t) ↔ (B, A, 1/t)` at the level of data

Prove the first half of the statement that makes the LMFDB's label normalisation a convention
rather than a choice of object: `swap D` has gamma vector `−γ` and gamma multiset `−γ`, `M^{-1}`
(1.4), the same wild primes (1.6), the same degree and common denominator (1.3), the same rotation
number, and primitive datum `swap (primitiveData D)` (1.8, 1.9), and interlaces iff `D` does
(1.10); and the cusps of `t` and `1/t` at `p` are exchanged between `0` and `∞` and fixed at `1`,
so that `p` is good (tame, wild) for `(D, t)` iff it is good (tame, wild) for `(swap D, 1/t)`
(1.11).  The second half, that weight, Hodge vector, Frobenius traces, Frobenius polynomials and
tame conductor exponents agree, is collected in Layer 5 after those objects are defined.  The
normal form the LMFDB picks is not stated here.

*Needs:* 1.3, 1.4, 1.6, 1.8, 1.9, 1.10, 1.11.

### Examples

- `A2.2.2.2_B1.1.1.1`: `α = (1/2)^4`, `β = (1)^4`, `d = 4`, `γ = [−1^8, 2^4]`, `M = 256`, wild
  `{2}`, rotation number `1`.
- `A4_B2.1`: `γ = [−2, −2, 4]`, `M = 16`, rotation number `2`, primitive datum `([2], [1])`.
- `A18.12_B8.3.2.1.1.1`: the `p`-parts of 1.7 at `p = 2, 3`.

### Dependencies

Mathlib only (`AddCircle`, cyclotomic polynomials, `ArithmeticFunction.moebius`,
`ascPochhammer`, `padicValRat`); 1.10 reads the counting function `Z` of 2.1, which is defined
from 1.1 alone.

## Layer 2: the zigzag, weight and Hodge vector

Pure combinatorics of the representatives.  The meaning of the numbers — that they are the Hodge
numbers of the family — is Fedorov's theorem (Fedorov, *Variations of Hodge structures for
hypergeometric differential operators and parabolic Higgs bundles*, Theorem 1), cited; the LMFDB
displays them for every family and motive, so they must be defined without it.

### 2.1 The height function

For `(α, β)` define the sorted list `L` of the `2d` representatives with their colours and with
multiplicity (`Multiset.sort` on `rep`).  Disjointness says that an `α` and a `β` never share a
representative; it does not make the entries of `α` distinct, and the copies of one class are
adjacent in `L`.  Define the height `ht : Fin (2d + 1) → ℤ`, `ht 0 = 0`, `ht (i+1) = ht i + 1` if
`L i` is an `α` and `ht i − 1` if a `β`, and the counting function
`Z(x) := #{a ∈ α : rep a ≤ x} − #{b ∈ β : rep b ≤ x}` for `x : ℚ`, copies counted with
multiplicity (`Z`).  Prove `ht (i+1) = Z(L i)` when `L i` is the last entry of its block of equal
representatives, and the block form: if the class `a ∈ α` has multiplicity `c` and its block
occupies positions `i, …, i + c − 1`, then `ht i = Z(rep a) − c` and the copies are recorded at
the heights `Z(rep a) − c, …, Z(rep a) − 1`.  Prove `ht (2d) = 0`.

**Checks.**

- `A2.2_B1.1` (`α = (1/2, 1/2)`, `β = (1, 1)`): `L = (1/2, 1/2, 1, 1)`, heights `0, 1, 2, 1, 0`,
  the two copies of `1/2` recorded at `0` and `1`; `Z(1/2) = 2`, and the block form gives
  `2 − 2, 2 − 1`.  Recording every copy at `Z(rep a) − 1` would give `1, 1`.
- `A2.2_B4` (`β = (1/4, 3/4)`): heights `0, −1, 0, 1, 0`, recorded `−1, 0`.
- `α = {1/2}`, `β = {1}`: `Z(1/2) = 1`, `Z(1) = 0`, recorded `{0}`; the empty pair has `ht = (0)`.

*Needs:* 1.1; Mathlib `Multiset.sort`, `List.foldl`.

### 2.2 Degree, weight and the Hodge vector

Define `recordedHeights` as the block form of 2.1, the multiset over the distinct classes
`a ∈ α` of the heights `Z(rep a) − 1 − j` for `0 ≤ j < count a α`, then `minHeight`, `maxHeight`,
`weight := maxHeight − minHeight` (a natural number), and
`hodgeNumber p := Multiset.count (minHeight + p) recordedHeights` for `p : ℕ`, and the **Hodge
vector** `(hodgeNumber 0, …, hodgeNumber weight)` as a list.  Prove the recorded heights
fill the interval (`hodgeNumber p > 0` for `p ≤ weight`: between two recorded heights every
intermediate height is recorded, since each step is `±1` and an upward step is a recording),
that `∑_{p ≤ w} hodgeNumber p = d`, and that `hodgeVector` is invariant under shift of the pair
(a cyclic rotation of `L` changes all heights by a constant).

**Checks.**

- `A = [2,2,2,2]`, `B = [1,1,1,1]`: recorded `0, 1, 2, 3`, `w = 3`, `(1,1,1,1)`; the collapsed
  multiset `{Z(rep a) − 1 : a ∈ α}` would give `3, 3, 3, 3`, `w = 0`, `(4)`.
- `A = [10,6,3,2]`, `B = [14,1,1,1]`: `d = 9`, `w = 4`, `(1,2,3,2,1)`; `A = [30]`,
  `B = [5,3,2,1]`: `(8)`, `w = 0`; `A = [18,12]`, `B = [8,3,2,1,1,1]`: `(2,6,2)`, `w = 2`.
- `A = [4,2,2]`, `B = [3,1,1]`: recorded `0, 0, 1, 1`, `(2,2)`, `w = 1`; `A = [6,4,4,3]`,
  `B = [12,2,2,2,1]`: recorded `−2, −1, −1, 0, 0, 1, 1, 2`, `(1,2,2,2,1)`, `w = 4`.  On all `1161`
  cyclotomic data with entries `≤ 10`, at most three entries in `A` and degree `≤ 6`, the block form
  equals the multiset produced by the walk of 2.1.

*Needs:* 2.1.

### 2.3 Agreement with the sorted-height formula

Prove that `recordedHeights` is the multiset of heights recorded by the walk of 2.1 (the block
form), and Sage's and Magma's form of the weight: for `d > 0`, `weight = max Z − min Z − 1` where
`Z` ranges over `Z(rep x)` for `x ∈ α ∪ β` together with the value `0` (the maximum of the walk is
attained just after an up-step, its minimum just before one).  The hypothesis `d > 0` is needed:
the empty pair has `weight = 0` and right side `0 − 0 − 1 = −1`.  This is a milestone because two
implementations of the zigzag exist and the LMFDB's "web_family.zigzag" and Sage's
`hodge_numbers` differ by exactly the shift of 2.2's last clause (Sage places the class of `0` at
`0`, the LMFDB at `1`).  Witness: `A2.2_B1.1` has `Z`-values `2, 0` and `0`, so `2 − 0 − 1 = 1 = w`;
on all `1161` data of the Checks of 2.2 the identity holds.  `Suggested.lean` states it as
`weight_eq_sSup_sub_sInf`, with the hypothesis `0 < degree`.

*Needs:* 2.2.

### 2.4 Symmetry of the Hodge vector

For a cyclotomic datum (more generally a pair stable under negation, 1.5) prove
`hodgeNumber p = hodgeNumber (weight − p)`: negation reverses the sorted list `L` (except for the
fixed classes `0 = 1` and `1/2`, which are their own negatives and stay in place as the ends of
the reversal), and reading the zigzag backwards negates all heights up to the constant of 2.2.
This is the combinatorial form of `TauCeti.Hodge.HodgeStructureOn.hodgeNumber_symm`, and it is
what makes the pinned orientation `h^{p,w−p} := h_{m+p}` immaterial.

*Needs:* 1.5, 2.2.

### 2.5 The first parity law

For a cyclotomic datum prove `weight` is even ⟺ `m_A + m_B` is odd (equivalently, the number of
copies of `1` in `A ∪ B` is odd).  Proof shape: by 1.5 the multiset of representatives in
`(0, 1)` is symmetric under `x ↦ 1 − x`, with the classes `1/2` and `1` fixed; the heights at
the two ends of the symmetric part are determined by the count of fixed classes, and the parity of
`w` is the parity of the total displacement between them.  The law needs `d > 0` (the empty
datum has `w = 0` and `m_A + m_B = 0`).  Acceptance: all `1593` cyclotomic data of degree `≤ 6`
taken up to swap (`3186` ordered pairs); `even_weight_iff`.  Its meaning: `h_1` is a reflection (`det h_1 = −1`,
Layer 3) exactly in the orthogonal case.

Consequently `w + 1 − m_A − m_B` is even; define the **Hodge-normalisation exponent**
`hodgeTwist D := δ(A, B) := (w + 1 − m_A − m_B)/2`, the power of `q` by which 5.1 multiplies the
finite sums.  Prove `2δ + m_A + m_B = w + 1` (for `d > 0`; `two_mul_hodgeTwist`), `δ(swap D) = δ(D)`, and
`δ = −m` (minus the least recorded height of 2.2) when `1 ∉ A` (`hodgeTwist_eq_neg_minHeight`); hence `δ ≥ 0`, since by the swap it suffices to
take `1 ∉ A`, and then the least height of the walk of 2.1 is attained just before an `α` step, so
it is a recorded height, and it is `≤ ht 0 = 0`.  Acceptance: `δ = 0` for `A2.2.2.2_B1.1.1.1` and
`A30_B5.3.2.1`, `δ = 1` for `A2.2_B4` and `A10.6.3.2_B14.1.1.1`, `δ = 2` for
`A6.4.4.3_B12.2.2.2.1`; `δ = −m` (for `1 ∉ A`) and `δ ≥ 0` hold on all `5192` ordered data of
degree `≤ 7`.  The parity law and the laws `δ ≥ 0`, `δ = −m` (for `1 ∉ A`), 2.4, 2.6 and 2.8
also hold, with the block form of 2.1, on the `1161` data of the Checks of 2.2.

**Checks.**

- `A2.2_B1.1`: `w = 1`, `m_A + m_B = 2`, `δ = (1 + 1 − 0 − 2)/2 = 0`; `A2.2_B4`: `w = 1`,
  `δ = 1 = −m` (least recorded height `−1`).
- `A = [1]`, `B = [2]`: `w = 0`, `m_A = 1`, `δ = 0`; `A6.4.4.3_B12.2.2.2.1`: `w = 4`, `m_B = 1`,
  `δ = 2 = −(−2)`.
- The truncating division of `ℕ` never acts: `w + 1 − m_A − m_B` is even and `≥ 0` on every
  datum of positive degree; at `d = 0` it is `1` and `δ = 0`, which is why the identity
  `2δ + m_A + m_B = w + 1` carries `d > 0`.

*Needs:* 1.2, 1.5, 2.1, 2.2.

### 2.6 The second parity law and the type

Prove that if `weight` is odd then `d` is even (same symmetry: an odd weight forces the fixed
classes to contribute an even displacement), and define
`type D := if Even weight then orthogonal else symplectic`.  Prove `type (swap D) = type D` and
that the LMFDB's rule "symplectic iff `w` odd and `d` even" agrees.  Acceptance: the same `1593`
data.  `Suggested.lean` writes the two values as `MotiveType.orthogonal` and
`MotiveType.symplectic` of the type `MotiveType`, and states the parity law as
`even_degree_of_odd_weight`.

**Checks.**

- `A2.2_B1.1` (`w = 1`, `d = 2`): symplectic; `A10.6.3.2_B14.1.1.1` (`w = 4`): orthogonal.
- `A = [1]`, `B = [2]` (`w = 0`, `d = 1`): orthogonal; odd degree occurs only with even weight.
- With the collapsed heights rejected in 2.2, `A2.2_B1.1` would have `w = 0` and be orthogonal,
  contradicting `det h_1 = (−1)^{0+2} = 1` of 3.3 (a transvection).

*Needs:* 2.2, 2.5.

### 2.7 Swap, shift and scaling

Prove `hodgeVector (swap (α, β)) = reverse (hodgeVector (α, β))` and `weight (swap) = weight`:
swapping colours negates the walk, and since the walk is closed, the up-steps from height `h` are
as many as the down-steps from `h + 1`, so the recorded heights of the new `α`'s (the old `β`'s)
are `−(h + 1)` for the old recorded heights `h`.  For a pair stable under negation (every cyclotomic
datum) 2.4 turns this into `hodgeVector (swap (α, β)) = hodgeVector (α, β)`; in general the
reversal is real: `α = {1/10, 1/5, 1/2}`, `β = {3/10, 3/5, 7/10}` has Hodge vector `(1, 2)` and its
swap `(2, 1)`.  For a cyclotomic datum prove also invariance under scaling by units (the datum is
fixed).

*Needs:* 2.2, 2.4.

### 2.8 Interlacing and weight zero

Prove `weight = 0 ⟺ Interlace (α, β)` for `d > 0` (`weight_eq_zero_iff_interlace`): every `α` is
recorded at the same height iff the colours alternate.  With Beukers–Heckman Theorem 4.8 (Layer 3) this says the monodromy group of a cyclotomic
datum is finite exactly when the weight is `0`, which is the LMFDB's reading of its weight-`0`
families (its knowl "hgm.monodromy" cites Beukers–Heckman for them).

*Needs:* 1.10, 2.2.

### 2.9 The Hodge polygon and the special Hodge vector

Define the **Hodge polygon** as the lower convex hull of the multiset of slopes
`{p with multiplicity h^{p,w−p}}`, i.e. the vertices `(∑_{p < k} h^{p,w−p}, ∑_{p < k} p h^{p,w−p})`;
prove it is convex and ends at `(d, wd/2)` (by 2.4).  Define the **special Hodge vector** at `t = 1`
as the LMFDB knowl "hgm.hodge_vector" states it: for even `w` decrease `h^{w/2,w/2}` by `1`, for odd
`w` decrease the two middle numbers by `1`; prove its sum is `d − 1` or `d − 2`.  That it is the
Hodge vector of `H(A, B, 1)` is Roberts–Rodriguez-Villegas §9, cited.

**Checks.**

- `(1,1,1,1)`, `w = 3`: vertices `(0,0), (1,0), (2,1), (3,3), (4,6)`, ending at `(4, 3·4/2)`;
  special Hodge vector `(1,0,0,1)`, sum `2 = d − 2`.
- `(1,2,3,2,1)`, `w = 4`: special vector `(1,2,2,2,1)`, sum `8 = d − 1`.
- `(8)`, `w = 0`: polygon `(0,0), (8,0)`, special vector `(7)`; a polygon built with the slopes in
  decreasing order would be the upper hull and end at the same point, so the ordering is checked by
  the middle vertex `(2,1)` of the first example.

*Needs:* 2.2, 2.4, 2.6.

## Layer 3: monodromy

The hypergeometric group, as Beukers–Heckman define it: the matrix group generated by two
companion matrices.  Over `ℂ` for general parameters, with integer entries for cyclotomic data.
No differential equation appears; Levelt's theorem is a theorem about triples of matrices.

### 3.1 Companion matrices

The companion matrix `C(f) := Polynomial.companion f` of a monic `f ∈ R[X]` of degree `d`, over a
commutative ring `R`, is the classical arithmetic completion's 2.46 (`C(f)_{i+1,i} = 1`,
`C(f)_{i,d−1} = −coeff f i`, `0` elsewhere), with `det C(f) = (−1)^d f(0)` (`det_companion`),
minimal polynomial `f` over a field (`minpoly_companion`) and `charpoly C(f) = f` (2.60); none of
these is restated here.  Prove that `C(f)` is cyclic (the first basis vector generates `R^d` as
an `R[C(f)]`-module: under 2.46's `leftMulMatrix_root_eq_companion` it is the class of `1` in
`R[X]/(f)`), and that over a field `K` a matrix `g` with `charpoly g = f` and a cyclic vector is
conjugate to `C(f)`, so two matrices with the same characteristic polynomial, each with a cyclic
vector, are conjugate.  Prove the
**rank formula** `rank (C(f) − λ) = d − 1` if `f(λ) = 0` and `d` otherwise, and more
generally `rank (C(f) ^ k − 1) = d − #{distinct roots ζ of f over K̄ with ζ^k = 1}` for
`k ≥ 1` over an algebraically closed field of characteristic `0` (a cyclic matrix has one Jordan
block per eigenvalue, and `J_ζ^k − 1` has rank one less than its size when `ζ^k = 1` because `k ≠ 0`
in `K`).  Both hypotheses are needed: over `𝔽_2`, `C(X² + 1)` squares to `1`, so the
rank at `k = 2` is `0`, not `1`; at `k = 0` the left side is `0`.  The rank formula is the input of
the tame conductor exponents of Layer 5, which apply it over `ℂ`.  `Suggested.lean` writes `C(f)`
as `companionMatrix hf hd`, Mathlib's `Algebra.leftMulMatrix` of the root of `AdjoinRoot f` in
`AdjoinRoot.powerBasis'` reindexed to `Fin d`, which 2.46's `leftMulMatrix_root_eq_companion`
identifies with `Polynomial.companion f`; the rank formula is `rank_companion_pow_sub_one`.

**Checks.**

- `f = X + 1` over `ℚ`: `C(f) = (−1)`; `k = 2`: `rank (1 − 1) = 0 = 1 − #{−1}`; `k = 1`:
  `rank (−2) = 1 = 1 − 0`.
- `f = (X − 1)²` over `ℂ`: one Jordan block, `rank (C − 1) = 1 = 2 − #{1}`; a formula counting
  roots with multiplicity would give `0`.
- Over `𝔽_2`, `f = X² + 1`: `C(f)² = 1`, rank `0` at `k = 2` against the formula's `1`; the
  characteristic-`0` hypothesis excludes it.

*Needs:* `ClassicalArithmeticCompletion` 2.46, 2.60; Mathlib `Matrix.charpoly`,
`Matrix.rank`, `Algebra.leftMulMatrix`, `AdjoinRoot.powerBasis'`.  `LinearMap.IsCyclic` is not in
Mathlib: state cyclicity as `Submodule.span R (range (fun k ↦ C(f)^k e₀)) = ⊤`.

### 3.2 The Levelt triple

For `(α, β)` define `q_∞ := ∏_{a ∈ α} (X − e(a))`, `q_0 := ∏_{b ∈ β} (X − e(b))` in `ℂ[X]`,
`h_∞ := C(q_∞)`, `h_0 := C(q_0)^{-1}`, `h_1 := h_∞^{-1} h_0^{-1}`, and the
**hypergeometric group** `Γ(α, β) := Subgroup.closure {h_∞, h_0} ≤ GL_d(ℂ)`.  Prove
`h_∞ h_1 h_0 = 1`, that `h_1 − 1` has rank `1` (`C(q_∞)` and `C(q_0)` differ only in
their last column), that `h_∞` has eigenvalues `e(α)` and `h_0` eigenvalues `e(−β)` with
multiplicity, and that `det h_∞ = e(∑α)`, `det h_0 = e(−∑β)`, `det h_1 = e(∑β − ∑α)` (from
2.46's `det_companion` and `q_∞(0) = (−1)^d e(∑α)`; for `α = {1/2}`, `h_∞ = (−1)`).  For a
cyclotomic datum define the same triple over `ℤ` with `q_∞ = Φ_A`, `q_0 = Φ_B` (1.3 identifies
the roots), prove `h_0 ∈ GL_d(ℤ)` (`Φ_B(0) = ±1`), that the complex triple is the base change of
the integral one, and that `charpoly h_0 = Φ_B` (1.5).  `Suggested.lean` writes `q_∞`, `q_0`,
`h_∞`, `h_0`, `Γ(α, β)` as `qInf`, `qZero`, `hInf`, `hZero`, `hypergeometricGroup`, the root of
unity `exp(2πi · rep x)` as `e x`, and the integral matrices as `hInfInt`, `hZeroInt`; the
monicity and degree of `q_∞`, `q_0` that the companion matrices take are `monic_qInf`,
`monic_qZero`, `natDegree_qInf`, `natDegree_qZero`.

**Checks.**

- `α = {1/2}`, `β = {0}`: `h_∞ = (−1)`, `h_0 = (1)`, `h_1 = (−1)`, `Γ = {±1}`, `det h_1 = −1 =
  e(1 − 1/2)`.
- `A2.2_B1.1`: `h_∞ = C((X + 1)²) = ((0, −1), (1, −2))`, `h_0 = C((X − 1)²)⁻¹`, and `h_1 − 1` has
  rank `1`; `det h_1 = 1`.
- The roles are not interchangeable: with `h_0 := C(q_0)` instead of its inverse, the eigenvalues
  of `h_0` would be `e(β)` and the cusp-`0` exponents of 5.9 would be read on the wrong side for
  non-self-dual `β` (`β = {1/3}`: `e(1/3)` against `e(−1/3)`).

*Needs:* 1.3, 1.5, 3.1; `ClassicalArithmeticCompletion` 2.46, 2.60; Mathlib
`Matrix.GeneralLinearGroup`.

### 3.3 Determinants of the Levelt triple for cyclotomic data

Prove `det h_∞ = (−1)^{d + m_A}`, `det h_0 = (−1)^{d + m_B}`, `det h_1 = (−1)^{m_A + m_B}` (from
3.2 and `Φ_A(0) = (−1)^{m_A}`).  With 2.5: `h_1` is a reflection in the orthogonal case and a
transvection in the symplectic case.  This is the geometric content of the determinant character
of Layer 5: the quadratic character of `ℚ(t)` cut out by `det` of the monodromy ramifies at the cusp
of `h_∞` (LMFDB `t = ∞`) iff `d + m_A` is odd, at the cusp of `h_0` (`t = 0`) iff `d + m_B` is
odd, and at `t = 1` iff `m_A + m_B` is odd.

*Needs:* 1.2, 2.5, 3.2.

### 3.4 Levelt's theorem

State and prove Levelt's theorem over an arbitrary field `K` (`levelt_rigidity_field`,
`levelt_irreducible_field`).  Beukers–Heckman Theorem 3.5 and Proposition 3.3 state it over `ℂ`
(Levelt, *Hypergeometric functions*, thesis, 1961); the field form is this roadmap's
generalisation, whose proof below uses nothing about `ℂ`.  Let `p, q ∈ K[X]` be monic of degree `d ≥ 1` with no common root
in an algebraic closure `K̄`.

- (i) **Rigidity**: if `g_∞, g_1, g_0 ∈ GL_d(K)` satisfy `g_∞ g_1 g_0 = 1`, `charpoly g_∞ = p`,
  `charpoly g_0^{-1} = q` and `rank (g_1 − 1) ≤ 1`, then there is `c ∈ GL_d(K)`, unique up to
  `Kˣ`, with `g_∞ = c C(p) c^{-1}` and `g_0 = c C(q)^{-1} c^{-1}`, hence
  `g_1 = c C(p)^{-1} C(q) c^{-1}`.
- (ii) **Irreducibility**: `⟨C(p), C(q)⟩` acts irreducibly on `K̄^d`.
- (iii) **Converse**: if `p` and `q` have a common root in `K̄`, then `⟨C(p), C(q)⟩` stabilizes a
  nonzero proper subspace of `K̄^d`.
- (iv) **Companion normal form**: if `p ≠ q` and `p(0) ≠ 0`, then `C(q) − C(p)` is nonzero and
  supported on the last column, so `C(p)^{-1} C(q)` fixes `e_1, …, e_{d−1}`, `C(q) C(p)^{-1}`
  fixes `e_2, …, e_d` (as `C(p)^{-1} e_{i+1} = e_i` for `i < d`), and each differs from `1` by a
  matrix of rank one.  With (i): a triple with `g_0 g_1 g_∞ = 1` (the order Qian uses in Lemma 3.4,
  where the companion normal form `BA⁻¹` with a single nontrivial column appears over `ℤ[ζ_N]`),
  and the remaining hypotheses of (i) is simultaneously conjugate to
  `(C(q)^{-1}, C(q) C(p)^{-1}, C(p))`, since `g_0 g_1 g_0^{-1} = g_∞^{-1} g_0^{-1}` satisfies (i).

The proof is linear algebra over `K`.  Put `X = g_∞` and `Y = g_0^{-1}`, so `X − Y = (1 − g_1) X`
has rank at most one and `W = ker (X − Y)` has codimension at most one; pick `e ≠ 0` in
`W ∩ X^{-1}W ∩ ⋯ ∩ X^{-(d−2)}W`.  If `e, Xe, …, X^{d−1}e` were dependent, the span `U` of
`e, …, X^{m−1}e` at the first dependence would be `X`-stable and inside `W`, so `X = Y` on `U` and
the two would share an eigenvalue over `K̄`.  So they form a basis, in which `X = C(p)` and
`Y = C(q)` (both shift the first `d − 1` vectors; 3.1's cyclic-vector conjugacy).  Uniqueness up
to `Kˣ` is (ii) with Schur's lemma.  The Levelt triple of 3.2 is the case `K = ℂ`, `p = q_∞`,
`q = q_0`, where the disjointness of `α` and `β` is that of the roots `e(α)` and `e(β)`; for a
cyclotomic datum the integral triple is the case `K = ℚ`, `p = Φ_A`, `q = Φ_B` (coprime by 1.2).

*Needs:* 1.2, 3.1, 3.2; `ClassicalArithmeticCompletion` 2.46, 2.60.

### 3.5 The invariant Hermitian form

Prove Beukers–Heckman Theorem 4.3 in the form needed: for `(α, β)` with representatives in `ℝ/ℤ`
(always, here) the group `Γ(α, β)` preserves a nondegenerate Hermitian form
`F : Matrix (Fin d) (Fin d) ℂ`, `F.IsHermitian`, `hᴴ F h = F` for `h ∈ Γ`, unique up to a real
scalar (by 3.4 (ii) and Schur).  Construct `F` explicitly in the cyclic basis of 3.4 (the
construction in Beukers–Heckman §4 through the coefficients of `q_∞`, `q_0`).  For a cyclotomic
datum prove that the form can be taken with entries in `ℚ(ζ_N)`, and real symmetric when the type
is orthogonal, alternating when symplectic (3.3 with the eigenvalue structure of `h_1`): this is
the statement behind the LMFDB's "orthogonal/symplectic type".

`Suggested.lean` states Theorem 4.3 as `exists_invariantForm` (existence of a nondegenerate
invariant Hermitian form, and every invariant Hermitian form a real multiple of it), without
fixing the factor.  The **invariant form** of `(α, β)` is a `d × d` complex matrix `F`, in the standard basis of `ℂ^d` on which the Levelt matrices
`h_∞ = C(q_∞)` and `h_0 = C(q_0)^{-1}` of 3.2 act on column vectors, such that `F` is Hermitian
(`Fᴴ = F`, with `ᴴ` the conjugate transpose), `hᴴ F h = F` for `h = h_∞` and `h = h_0` (hence
for every `h ∈ Γ(α, β)`), and `det F ≠ 0`.  Such an `F` exists and is unique up to a nonzero real
factor; the target fixes the factor by the Beukers–Heckman construction.  Every statement that
reads `F` (its signature `(p, q)` up to order, its definiteness) is invariant under that factor,
and 3.6 and 3.7 read only those.

**Checks.**

- (computation) — `α = {1/2}`, `β = {0}` (`A = [2]`, `B = [1]`, `d = 1`): `h_∞ = (−1)` and
  `h_0 = (1)`, so `Γ = {±1}` and `F` is a nonzero real `1 × 1` matrix, definite.
- (computation) — `A2.2_B1.1` (`α = (1/2, 1/2)`, `β = (1, 1)`): the count of 3.6 gives
  `|p − q| = |(−1)^{1+2} + (−1)^{2+2}| = 0`, so `F` has signature `(1, 1)`; for
  `A2.2.2.2_B1.1.1.1` it gives `0` again and signature `(2, 2)`.  Neither is definite, as 3.7
  requires of the infinite monodromy of these weight-`1` and weight-`3` families.
- (computation) — `A30_B5.3.2.1` (`w = 0`, interlacing, finite monodromy): `F` is definite,
  `F.PosDef` or `(−F).PosDef` in Mathlib's sense (Corollary 4.7, read through 2.8).
- (rejection) — the zero matrix is Hermitian and satisfies `hᴴ 0 h = 0` for every `h`; the clause
  `det F ≠ 0` is what excludes it.
- (Mathlib comparison) — Hermitian means Mathlib's `Matrix.IsHermitian`, definite means
  `Matrix.PosDef` of `F` or of `−F`, and the signature is read off
  `Matrix.IsHermitian.eigenvalues`; no Mathlib declaration constructs `F`.

*Needs:* 3.2, 3.3, 3.4; Mathlib `Matrix.IsHermitian`, `Matrix.conjTranspose`.

### 3.6 The signature count

Prove Beukers–Heckman Theorem 4.5 and Corollary 4.7: with the representatives of `α` sorted
`α_1 ≤ ⋯ ≤ α_d` in `[0, 1)` and `m_j := #{k : β_k < α_j}`, the signature `(p, q)` of `F`
satisfies `|p − q| = |∑_{j=1}^d (−1)^{j + m_j}|`; in particular `F` is definite iff `(α, β)`
interlace.  Define `bhSignatureDefect (α, β) := |∑_j (−1)^{j+m_j}|` as the combinatorial
invariant and prove its invariance under shift and under negation.  The signature identity and the definiteness
criterion read the form of 3.5 and are stated, for every nondegenerate invariant Hermitian form
`S`, as `signature_invariantForm`: the numbers of positive and negative eigenvalues of `S`
(`Matrix.IsHermitian.eigenvalues`) differ by `bhSignatureDefect` in absolute value.  ⚠ This is the unsigned
Hermitian-form invariant of the monodromy group; it is not the LMFDB's signed `sig`, which is a
Hodge-theoretic invariant of the real structure at `t` and is not owned (see *Not owned here*).

**Checks.**

- `α = {1/2}`, `β = {0}` (`rep0 0 = 0`): `m_1 = 1`, sum `(−1)^{1+1} = 1`, defect `1 = d`: the
  `1 × 1` form is definite.
- `A2.2.2.2_B1.1.1.1`: `m_j = 4` for all four copies of `1/2`, sum `∑_{j=1}^{4} (−1)^{j+4} = 0`,
  signature `(2, 2)`; indexing the copies of one class by `#{α' < α_j} + 1 = 1` instead of their
  position would give `4` and a definite form for an infinite group.
- `A30_B5.3.2.1` (interlacing): defect `8 = d`, the definite case of 3.7.

*Needs:* 3.5.

### 3.7 The Beukers–Heckman finiteness criterion

Prove Beukers–Heckman Theorem 4.8: for `α, β ⊂ ℚ/ℤ` disjoint with common denominator `N`,
`Γ(α, β)` is finite iff for every `u` coprime to `N` the scaled pair `(uα, uβ)` interlaces.
(⇐: each Galois conjugate of the form of 3.5 is definite by 3.6, so the group, which has entries
in `ℤ[ζ_N]` after conjugation by 3.4, is discrete in a compact group; ⇒: a finite group
preserves a definite form, and 3.6 applied to each conjugate forces interlacing.)  For a
cyclotomic datum conclude with 1.10 and 2.8: **`Γ(A, B)` is finite iff `weight = 0`**.  The
classification of the finite hypergeometric groups (Beukers–Heckman Theorem 7.1 and Table 8.3:
the imprimitive families and the finitely many primitive ones, with Weyl groups of `F₄`, `E₆`,
`E₇`, `E₈` among them) is cited and is not a target; the LMFDB's weight-`0` families are instances
of this list, named on their pages by their monodromy group, and 2.8 with this milestone decides
membership without the list.  `Suggested.lean` states the criterion as
`finite_hypergeometricGroup_iff` and its cyclotomic form as
`finite_hypergeometricGroup_iff_weight_eq_zero`.

*Needs:* 1.3, 1.10, 2.8, 3.4, 3.5, 3.6.

### 3.8 The Bézout matrix

For `f, g ∈ R[X]` of degree `≤ d` define `bezout f g d : Matrix (Fin d) (Fin d) R` by
`∑_{i,j} b_{ij} X^i Y^j = (f(X) g(Y) − f(Y) g(X)) / (X − Y)` in `R[X, Y]`, equivalently
`b_{ij} = ∑_{k=0}^{min(i,j)} (f_{i+j+1−k} g_k − f_k g_{i+j+1−k})`; take the second as the
definition and prove the first as a polynomial identity.  Prove symmetry `b_{ij} = b_{ji}`,
antisymmetry in `(f, g)`, bilinearity, and `det (bezout f g d) = (−1)^{d(d−1)/2} resultant f g`
for `f, g` of degree exactly `d` (Mathlib's `Polynomial.resultant`), hence `≠ 0` for coprime
`f, g` over a field.  Define `bezoutMatrix D := bezout Φ_A Φ_B d`, `bezoutDeterminant D` and the
**Bézout module** `ℤ^d / bezoutMatrix D · ℤ^d`; prove the module is finite of order
`|bezoutDeterminant D|` (nonzero by 1.2's coprimality) and record its invariant factors as the
LMFDB's "bezout_module" (Smith normal form; Mathlib has it for PIDs).  `Suggested.lean` states
the determinant formula as `det_bezout` and the order of the module as `card_bezoutModule`, with
`bezoutMatrix`, `bezoutDeterminant` and `BezoutModule`.

**Checks.**

- `f = X + 1`, `g = X − 1`, `d = 1`: `b_00 = f_1 g_0 − f_0 g_1 = −2 = Res(f, g) = g(−1)`; module
  `ℤ/2`.
- `A = [6,4,4,4,3]`, `B = [10,2,2,2,2,2,2]`, `d = 10`: determinant
  `−191102976 = −2^{18} 3^6 = (−1)^{45} Res(Φ_A, Φ_B)`, module `C_2^2 × C_{16}^2 × C_{432}^2`,
  of order `2^{18} 3^6`.
- `bezout f f d = 0` (antisymmetry), so the determinant vanishes when `f, g` share a factor; the
  datum `([2], [2])` is excluded by `disjoint`, and with it the zero module order.

*Needs:* 1.2; Mathlib `Polynomial.resultant`, `Submodule.smithNormalForm` (the
invariant factors of a submodule of a free module over a PID).

### 3.9 Imprimitivity

Define a subgroup `Γ ≤ GL_d(ℂ)` to be **imprimitive** if there is a decomposition
`ℂ^d = V_1 ⊕ ⋯ ⊕ V_k`, `k ≥ 2`, into nonzero subspaces permuted by `Γ` (the nonzero clause is what
keeps `V = (ℂ^d, 0)` out).  Prove: if `rotationNumber (α, β) = r > 1` then `Γ(α, β)` is
imprimitive with `k = r`: by 1.8, `q_∞` and `q_0` are polynomials in `X^r`, so in the cyclic model
`ℂ[X]/(q_∞)` of 3.4 the subspaces `V_i := span {X^j : j ≡ i (mod r)}`, `0 ≤ i < r`, are each
nonzero and are permuted cyclically by both companion matrices.
Beukers–Heckman Theorem 5.8, the converse for interlacing-free data, is cited; the LMFDB's
`imprim` column is the rotation number of 1.8 and is read through this milestone.
`Suggested.lean` writes the predicate as `IsImprimitive` and the theorem as
`isImprimitive_of_rotationNumber`.

**Checks.**

- `A4_B2.1` (`r = 2`): `q_∞ = X² + 1`, `q_0 = X² − 1`, and `V_0 = span{e_1}`, `V_1 = span{e_2}`
  are exchanged by both companion matrices (`C(X² + c) e_1 = e_2`, `C(X² + c) e_2 = −c e_1`).
- `Γ = {±1}` on `ℂ¹` (`α = {1/2}`, `β = {0}`) is not imprimitive: `k ≥ 2` nonzero summands do not
  fit in dimension `1`.
- Without the clause `V_i ≠ 0`, the decomposition `(ℂ^d, 0)` would make every group imprimitive.

*Needs:* 1.8, 3.2, 3.4.

### 3.10 Reduction modulo `ℓ`

For a cyclotomic datum and a prime `ℓ`, define `Γ_ℓ(A, B) ≤ GL_d(ZMod ℓ)` as the image of the
integral `Γ(A, B)` (3.2), i.e. the subgroup generated by the reductions of `h_∞, h_0`.  Prove it is
generated by the reductions of the companion matrices of `Φ_A mod ℓ` and `Φ_B mod ℓ`, that it
preserves the reduction modulo `ℓ` of the Bézout form of 3.8 whenever the integral group does,
and that the `p`-parts of 1.7 at `p = ℓ` describe the characteristic polynomials of `h_∞, h_0`
modulo `ℓ` (`Φ_{p^s v} ≡ Φ_v^{φ(p^s)} (mod p)`, Mathlib's `Polynomial.cyclotomic_mul_prime_pow_eq` in
`Mathlib/RingTheory/Polynomial/Cyclotomic/Expand.lean`).  The LMFDB's monodromy table (index,
subimage, image) names this group; the identifications are not owned here.

**Checks.**

- `A2.2_B1.1`, `ℓ = 2`: `Φ_A ≡ Φ_B ≡ (X + 1)² (mod 2)`, so the reductions of `h_∞` and
  `C(Φ_B)` coincide and `Γ_2` is generated by one unipotent matrix, of order `2`.
- `A2.2_B1.1`, `ℓ = 3`: `h_∞ ≡ C(X² + 2X + 1)`, `h_0 ≡ C(X² + X + 1)⁻¹` modulo `3`, both of
  determinant `1`.
- The reduction of a generating set generates the image: taking instead the group generated by
  `C(Φ_A mod ℓ)` and `C(Φ_B mod ℓ)` without inverting the second gives the same subgroup, since
  inverses lie in the generated subgroup of a finite group.

*Needs:* 1.7, 3.2, 3.8; Mathlib `Polynomial.cyclotomic_expand_eq_cyclotomic`,
`Matrix.map`.

### Examples

- `A2.2.2.2_B1.1.1.1`: `h_∞ = C((X+1)^4)`, `h_0 = C((X−1)^4)^{−1}`, all three determinants `1`,
  `Γ` infinite (weight `3`), invariant form of signature `(2, 2)`.
- `A30_B5.3.2.1`: weight `0`, interlacing, finite monodromy, definite invariant form.
- `A6.4.4.4.3_B10.2.2.2.2.2.2`: Bézout determinant `−2^{18} 3^6`.

### Dependencies

Layer 1 (1.2, 1.3, 1.5, 1.7, 1.8, 1.10), Layer 2 (2.5 for 3.3, 2.8 for 3.7),
`ClassicalArithmeticCompletion` 2.46 and 2.60, and Mathlib's matrices and resultants; 3.8 needs
only 1.2.

## Layer 4: finite hypergeometric sums

Everything is over a finite field `F` with `q` elements and `𝔮 = q − 1`, with the characters of
the pinned conventions.  Sums are complex-valued; where a smaller ring is needed (rationality,
integrality) the values are shown to lie in it.

### 4.1 Admissible parameters and integer parameter vectors

Define `(α, β)` to be **admissible** for `q` when `(q − 1) • x = 0` for every `x ∈ α + β`, and the
integer vectors
`a := α.map (fun x ↦ (𝔮 · rep x : ℤ))`, `b` likewise, elements of `Multiset (ZMod 𝔮)` after
reduction; prove `a` and `b` are disjoint in `ZMod 𝔮` and that for a cyclotomic datum
admissibility is `N ∣ q − 1`.  State everything in this layer for `a, b : Multiset (ZMod 𝔮)`
disjoint of equal cardinality, with the parameter pair entering through this map; this is how the
Lean file is organised, since `ω ^ (m : ZMod 𝔮)` is the natural object; `Suggested.lean` writes
`𝔮` as `qm F`, the integer parameter of a class as `intParam`, and the pair `(a, b)` as
`intParams`.

**Checks.**

- `A2.2_B1.1` at `q = 5`: admissible (`N = 2 ∣ 4`), `a = (2, 2)`, `b = (4, 4) ≡ (0, 0)`; the class
  of `0` has representative `1` and integer `𝔮 ≡ 0`, not `0 · 𝔮` read off a different
  representative, but the two agree modulo `𝔮`.
- `A2.2_B4` at `q = 5`: admissible (`4 ∣ 4`), `a = (2, 2)`, `b = (1, 3)`; at `q = 3` not admissible
  (`4 ∤ 2`), so 4.3 does not apply and 4.7 is the definition.
- `A3_B1.1` at `q = 7`: `a = (2, 4)`, `b = (0, 0)`; at `q = 5` not admissible.

*Needs:* 1.1, 1.3, 1.6.

### 4.2 Katz's exponential sum

Define `katzExpSum ω ψ a b t := ∑_{(x, y) ∈ F^d × F^d, t ∏ x_i = ∏ y_j} ψ(∑ x_i − ∑ y_j) ∏ ω^{a_i}(x_i) ∏ ω^{−b_j}(y_j)`
for `t ∈ Fˣ` (Katz, *Exponential sums and differential equations*, 8.2.7, in Beukers–Cohen–Mellit
§3's notation).  Prove it is an algebraic integer in `ℚ(ζ_p, ζ_𝔮)`; its comparison with the sum
`S_q` is 4.3.  `Suggested.lean` indexes the parameters by lists.

**Checks.**

- `d = 1`, `a = (0)`, `b = (0)`: the sum over `t x = y`, `x, y ∈ F` is `∑_x ψ(x − tx) · 1(x) ·
  1(tx)`, which is `−1` for `t ≠ 1` and `q − 1` for `t = 1`.
- At `t = 0` the condition forces `∏ y_j = 0`, and Mathlib's `ω^{−b_j}(0) = 0` kills every term,
  so the sum is `0`; that is why the comparison of 4.3 carries `t ∈ Fˣ`.
- Replacing `ψ` by the trivial character makes every term a product of character values and the
  sum a Jacobi-type sum, no longer the Fourier transform that 4.3 inverts; the comparison is stated
  for primitive `ψ`.

*Needs:* 4.1; Mathlib `gaussSum`, character orthogonality (`MulChar.sum_eq_zero_of_ne_one`,
`AddChar.sum_eq_zero_of_ne_one`).

### 4.3 The sums `S_q` and `H_q`

Define `g m := gaussSum (ω ^ m) ψ` for `m : ZMod 𝔮`,
`katzSum ω ψ a b t := 𝔮⁻¹ ∑_{m : ZMod 𝔮} (∏_i g (m + a_i) · g (−m − b_i)) · ω((−1)^d t)^m` (`S_q`), and
`hypergeometricSum ω ψ a b t := −(∏_i g a_i · g (−b_i))⁻¹ · katzSum ω ψ a b t` (`H_q`), for
`t ∈ F` (the summand at `t = 0` is `ω(0)^m`, which is `0` for `m ≠ 0` and `1` for `m = 0` in
Mathlib's convention; record `H_q(a, b | 0)` as the single `m = 0` term and never use it).  Prove
the Gauss-sum products in the normalising factor are nonzero: for `m ≠ 0` in `ZMod 𝔮`,
`g(m) g(−m) = ω(−1)^m q` (`gaussSum_mul_gaussSum_eq_card`, `ω^m` being nontrivial), and for
`m = 0` (the class `0` in `α` or in `β`) `g(0) = −1`; so `H_q` is a well-defined complex number, and prove Beukers–Cohen–Mellit (3.1) as the definitional unfolding.
Prove `H_q(a, b | t) = (1/(1 − q)) ∑_m ∏_i (g(m + a_i) g(−m − b_i))/(g(a_i) g(−b_i)) · ω((−1)^d t)^m`,
Definition 1.1 verbatim.  Prove Beukers–Cohen–Mellit Proposition 3.1:
`katzExpSum (a, b | t) = ω(−1)^{∑ b} · S_q(a, b | t)` for `t ∈ Fˣ` (Fourier inversion on `Fˣ`, their Proposition 2.6, which
is `MulChar.sum_eq_zero`-style orthogonality; `katzExpSum_eq`), so that `S_q` and `H_q` are
algebraic integers up to the normalising factor.  `Suggested.lean` writes `g(m)` as
`gaussSumPow ω ψ m`, `S_q` as `katzSum` and `H_q` as `hypergeometricSum`.

**Checks.**

- `A2.2_B1.1` at `q = 5`, `t = 2`: `H_5 = −2`, the LMFDB's `a_5` of `A2.2_B1.1_t2.1`; at `t = 1/2 = 3`:
  `H_5 = 2`.
- `a = (0)`, `b = (2)` over `𝔽_5` (`A = [1]`, `B = [2]`): `H_5(· | t)` is `0, −1, 1, −1` at
  `t = 1, 2, 3, 4`, which is `φ(t(t − 1))` (`t(t − 1) = 0, 2, 1, 2`), as
  `hypergeometricSum_degree_one` states.
- The normalising factor is never `0`: `g(m) g(−m) = ω(−1)^m q` for `m ≠ 0` and `g(0) = −1`; with
  the convention `1(0) = 1` instead of Mathlib's `0`, `g(0)` would be `0` and `H_q` undefined
  whenever `0 ∈ α ∪ β`.

*Needs:* 4.1, 4.2; Mathlib `gaussSum`, `gaussSum_mul_gaussSum_eq_card`, `gaussSum_one_one`.

### 4.4 Dependence on the characters and the Galois action

Prove: (i) `H_q` does not depend on `ψ` (`gaussSum_mulShift_eq`: replacing `ψ` by `ψ(c ·)`
multiplies `g(m)` by `ω^{−m}(c)`, and the exponents cancel factor by factor); (ii) replacing `ω`
by `ω^u` for `u ∈ (ZMod 𝔮)ˣ` gives `H_{ω^u}(a, b | t) = H_ω(u a, u b | t)` (reindex `m ↦ um`);
(iii) for `σ ∈ Gal(ℚ(ζ_p, ζ_𝔮)/ℚ)` acting by `ζ_p ↦ ζ_p^c`, `ζ_𝔮 ↦ ζ_𝔮^u`,
`σ(H_q(a, b | t)) = H_q(u a, u b | t)` (`hypergeometricSum_galois`), by (i) and (ii) (the model is Tau Ceti's
`map_gaussSumOfPrimitiveRoot`); (iv) complex conjugation gives `H_q(−a, −b | t)` with
`star_gaussSum_eq`.  Over `𝔽_p` with `ζ_𝔮 ↦ ζ_𝔮^p` being the Frobenius of 
[Chebotarev](../../Completed/Chebotarev/README.md) Layer 4, this is also `H_q(pa, pb | t)`.

*Needs:* 4.3; Mathlib `gaussSum_mulShift_eq`, `star_gaussSum_eq`, `gaussSum_frob`,
`MulChar.ringHomComp`; Tau Ceti `map_gaussSumOfPrimitiveRoot` as the pattern.

### 4.5 Rationality for cyclotomic data

For a cyclotomic datum with `N ∣ q − 1` prove `H_q(α(A), β(B) | t) ∈ ℚ` for every `t ∈ F`, and
that it does not depend on the choice of `ω`: by 1.3 the pair is Galois stable, so 4.4 (ii)–(iii)
show every Galois conjugate equals the sum itself.  Prove `H_q(α, β | t) ∈ ℚ` more generally when
`(α, β)` is Galois stable.  Define `hypergeometricSumRat D F t : ℚ` as the rational number so
obtained for a cyclotomic datum (and likewise for Galois-stable pairs): the rational number whose
image in `ℂ` is the sum of 4.3 for some generator `ω` and primitive `ψ`, which `Suggested.lean`
writes through `Classical.epsilon`.  Prove it agrees with the complex sum under the embedding for
every generator `ω` and primitive `ψ` (`hypergeometricSumRat_spec`).

**Checks.**

- `A2.2_B1.1`, `q = 5`, `t = 2`: `hypergeometricSumRat = −2`, for each of the two generators of
  `MulChar 𝔽_5 ℂ` (orders `4`) and each of the four primitive `ψ`.
- A pair that is not Galois stable, `α = {1/4}`, `β = {0}` at `q = 5`: the sum is not rational in
  general: `H_5(· | t)` is `0, −1, i, −i` at `t = 1, 2, 3, 4` (its conjugate under `ω ↦ ω³` is
  the sum of `({3/4}, {0})`), so `hypergeometricSumRat` is defined for cyclotomic data only.
- `t = 0` is allowed by the definition (single term `m = 0`), and no theorem uses it.

*Needs:* 1.3, 4.4.

### 4.6 Shift and swap

Prove Beukers–Cohen–Mellit Theorem 3.4 with the sign their statement drops: for `μ ∈ ZMod 𝔮`
and `t ∈ Fˣ`, `ω((−1)^d t)^μ S_q(a + μ, b + μ | t) = S_q(a, b | t)` (`katzSum_shift`; reindex
`m ↦ m − μ`, which needs `ω((−1)^d t)^{m}` to be periodic in `m` modulo `𝔮`, true for `t ≠ 0`;
the character factor of `S_q` is `ω((−1)^d t)^m`, so the printed `ω(t)^μ` is wrong when `dμ` is
odd), with the corresponding identity for `H_q` carrying the ratio of normalising factors; and
Theorem 3.5 (`hypergeometricSum_swap`):
`S_q(a, b | t) = S_q(−b, −a | 1/t)` for `t ∈ Fˣ` (reindex `m ↦ −m`), hence
`H_q(a, b | t) = H_q(−b, −a | 1/t)`.  For a pair stable under negation (every cyclotomic datum,
1.5) this reads **`H_q(α, β | t) = H_q(β, α | 1/t)`**, the identity that makes the pinned trace
convention and the LMFDB's label duality (1.12) consistent.

**Checks.**

- Over `𝔽_5`, `a = {0}`, `b = {2}`, `μ = 1`, `t = 2`: both sides equal `−√5 ≈ −2.236`, while the
  printed factor `ω(t)^μ` gives `+√5` on the left.
- Same data at `t = 0`: the left side is `ω(0) · S = 0` and the right side is the single `m = 0`
  term `(1/4) g(0) g(−2) = −√5/4`; the hypothesis `t ≠ 0` (Beukers–Cohen–Mellit state the
  theorem for `t ∈ 𝔽_q^×`) excludes it.
- `A2.2_B1.1` at `q = 5`: `H_5(· | 2) = −2` and `H_5(β, α | 1/2) = H_5((0,0), (2,2) | 3) = −2`
  (the negation fixes both multisets).

*Needs:* 4.3, 1.5.

### 4.7 The gamma-vector form at every good prime power

For a cyclotomic datum and a prime power `q = p^f` with `p` not wild, define the
**gamma-vector sum**
`H_q^γ(A, B | t) := ((−1)^{r+s}/(1 − q)) ∑_{m : ZMod 𝔮} q^{−s(0) + s(m)} ∏_{γ(n) > 0} g(n m)^{γ(n)} ∏_{γ(n) < 0} g(−n m)^{−γ(n)} · ω(ε M^{-1} t)^m`
with `ε := (−1)^{∑_{γ(n)<0} (−n γ(n))}` and `s(m) :=` the multiplicity of `ζ_𝔮^m` as a root of
`D(X) := gcd(∏_{γ(n)>0} (X^n − 1)^{γ(n)}, ∏_{γ(n)<0} (X^n − 1)^{−γ(n)})`, and prove
Beukers–Cohen–Mellit **Theorem 1.3**: when `N ∣ q − 1`, `H_q^γ(A, B | t) = H_q(α(A), β(B) | t)`.
The proof is the Hasse–Davenport product relation applied to each `∏_{j} g(m + j𝔮/n)/g(j𝔮/n)`
(consumed from `ClassicalArithmeticCompletion` 7.29), the evaluation `g(n) g(−n) = ω(−1)^n q` for
`n ≠ 0` and `g(0) g(0) = 1`, and the bookkeeping of the common roots `D(X)`; it is the proof on
pp. 11–12 of the paper.  Prove `H_q^γ(A, B | t) ∈ ℚ` for every `p ∤ N` (the Galois argument of
4.4–4.5 applies to the gamma form verbatim, with no congruence on `q`), and that
`s(0) = min(r, s)` (the multiplicity of `1` as a root of `∏_{γ(n)>0} (X^n − 1)^{γ(n)}` is `r`, of
the other product `s`, and `D(X)` takes the minimum).  **From here on `H_q(A, B | t)` means
`H_q^γ` for every `p ∤ N`**; its rational value is `frobeniusSum D F t`, the rational number whose
image in `ℂ` is the gamma form for some generator `ω` and primitive `ψ` (written through
`Classical.epsilon`), identified with the complex gamma form for every such choice by
`frobeniusSum_spec`.

`Suggested.lean` writes `s(m)` as `commonRootMultiplicity`, `ε` as `epsilon`, `H_q^γ` as
`gammaVectorSum` and states Theorem 1.3 as `gammaVectorSum_eq_hypergeometricSum`.

**Checks.**

- `A2.2_B4`, `q = 3` (not admissible): the gamma form gives `H_3(· | 2) = −2/3`, and `3 · (−2/3)
  = −2` is the LMFDB's `a_3` of `A2.2_B4_t2.1`.
- `A2.2_B1.1`, `q = 5` (admissible): `γ = [−1^4, 2^2]`, `M = 16`, `r = 2`, `s = 4`, `s(0) = 2`; the
  gamma form at `t = 2` equals the sum of 4.3, `−2`.
- `A3_B1.1`, `q = 5` (`3 ∤ 4`): `γ = [−1,−1,−1,3]`, `M = 27`, and the gamma form is the definition;
  it matches the cubic point count of 6.2 for every admissible `λ`.

*Needs:* 1.4, 1.6, 4.3, 4.5; `ClassicalArithmeticCompletion` 7.29 (Hasse–Davenport product
relation); Mathlib `gaussSum_mul_gaussSum_eq_card`, `Polynomial.rootMultiplicity`.

### 4.8 The Landau function and the algebraic-integrality bound

Define the Landau function `λ(α, β, x) := ∑_i ({x + α_i} − {α_i} + {−x − β_i} − {−β_i})` on
`[0, 1]` and `λ(α, β) := −min_{gcd(k, N) = 1, x} λ(kα, kβ, x)`, and prove Beukers–Cohen–Mellit
Theorem 3.3: `q^{λ} H_q(α, β | t)` is an algebraic integer.  The proof is the digit-sum valuation
of Gauss sums, which is the
[classical arithmetic completion](../ClassicalArithmeticCompletion/README.md)'s **7.12**
(`v_𝔓̃(g(ω^{−a})) = s(a)`), summed over the `d` factors and minimised over the Galois conjugates.
For a cyclotomic datum the minimum over `k` is attained at `k = 1` (the pair is Galois stable,
1.3), and prove **`λ(α(A), β(B)) = δ(A, B)`**, the exponent of 2.5: `λ(α, β, x)` is a step function
of `x` (the `d` slopes `+1` and `d` slopes `−1` cancel), constant between consecutive points of
`{−α_i} ∪ {−β_j}` in `ℚ/ℤ`, so both sides are read off the sorted representatives.  Acceptance: on all
`5192` ordered cyclotomic data of degree `≤ 7`, `λ = δ`; for `A2.2_B4`, `λ(α, β, x)` takes the
values `0, 1, −1, 0` on `[0, 1/4), [1/4, 1/2), [1/2, 3/4), [3/4, 1)`, so `λ = 1 = δ`.

**Checks.**

- `A2.2_B4`: `λ = 1 = δ` as above; a minimum taken at `k = 1` only agrees here because the pair
  is Galois stable.
- `A2.2_B1.1`: `λ(α, β, x)` is `0` at `x = 0`, `2` on `(0, 1/2)` and `0` on `[1/2, 1)`, so
  `λ = 0 = δ`; a definition with `max` in place of `min` would give `−2`.
- At `x = 0` every summand vanishes, so `λ(α, β) ≥ 0` for every pair; `A30_B5.3.2.1` (interlacing,
  `δ = 0`) has `λ = 0`.

*Needs:* 2.1, 2.5, 4.3, 4.4; `ClassicalArithmeticCompletion` 7.12.

### 4.9 Integrality for cyclotomic data

For a cyclotomic datum and every `q = p^f` with `p ∤ N`, prove **`q^δ H_q(A, B | t) ∈ ℤ`**, with
`δ = δ(A, B)` of 2.5, for every `t ∈ Fˣ` (at `t = 0` the sum is the single term `1/(1 − q)`).
`H_q` is rational by 4.7, so it suffices to show:

- *at `p`*: each summand `q^{−s(0)+s(m)} ∏ g(nm)^{γ(n)} ∏ g(−nm)^{−γ(n)}` of the gamma form has
  `v_p ≥ −f δ`.  By 7.12 its valuation (with `v_p(p) = 1`, at a prime above `p`) is
  `∑_{i<f} V(p^i m/𝔮)` with `V(x) := s(x) − s(0) + ∑_{γ(n)>0} γ(n) {nx} + ∑_{γ(n)<0} (−γ(n)) {−nx}`,
  `s(x)` the multiplicity of `e(x)` as a root of `D(X)` (constant on the orbit `x ↦ px`), and
  `min_{x ∈ ℚ/ℤ} V(x) = −δ` (the Landau identity of 4.8 read through the gamma vector; at the other
  primes above `p`, `x` is replaced by `kx` with `k` a unit, which leaves the minimum unchanged, and
  the opposite normalisation of the Teichmüller character gives the `V` of `swap D`, which has the
  same `δ`; checked on all `5192`
  ordered data of degree `≤ 7` for every `x` of denominator `≤ 60`, the minimum `−δ` being attained
  in every case);
- *away from `p`*: write `q^{s(m)−s(0)} = 1 + (q^{s(m)−s(0)} − 1)`; since `s(m) ≤ s(0)`, the second
  term is `(1 − q)` times an element of `ℤ[1/q]`, and
  `∑_m ∏ g(nm)^{γ(n)} ∏ g(−nm)^{−γ(n)} ω(u)^m = (q − 1) · T(u)` with
  `T(u) = ∑_{u ∏ x_j^{p_j} = ε ∏ y_k^{q_k}} ψ(∑ x_j − ∑ y_k)` (sum over `x ∈ (Fˣ)^r`,
  `y ∈ (Fˣ)^s`) an algebraic integer, by the Fourier inversion of 4.3 (Beukers–Cohen–Mellit
  Proposition 2.6).  So the denominator `1 − q` of the gamma form cancels.

This is sharp (`A2.2_B4`, `δ = 1`: `H_3(· | 2) = −2/3`) and implies Beukers–Cohen–Mellit
Theorem 4.2, `q^{min(r,s) − λ'} H_q ∈ ℤ` with `λ' := min (∑_{γ(n)>0} γ(n) {nx} + ∑_{γ(n)<0} (−γ(n)) {−nx})`,
because `δ ≤ min(r, s) − λ'`.  ⚠ In Theorem 4.2 the minimum must be taken over `x ∈ (0, 1)`, not
`[0, 1]` as printed (the sum is `0` at `x = 0`); over `(0, 1)` it is an integer `≥ 1` exactly when the
rotation number is `1` (`A4_B2.1` has `λ' = 0`, at `x = 1/2`).  Acceptance: for `A = [2,2,2,2]`,
`B = [1,1,1,1]` (`δ = 0`) the values `H_5(· | 2) = 12`, `H_7(· | 2) = −16`, `H_5(· | −1) = −4` are
integers; for `A6.4.4.3_B12.2.2.2.1` (`δ = 2`), `H_7(· | 2) = −6/49`.  `Suggested.lean` states
the integrality as `frobeniusSum_integral`.

*Needs:* 2.5, 4.3, 4.7, 4.8.

### 4.10 The swap at the level of traces

Combine 4.6 and 4.7: for a cyclotomic datum, `H_q(A, B | t) = H_q(B, A | 1/t)` for every `p ∤ N`
and `t ∈ Fˣ` (the gamma form of `swap D` has `γ ↦ −γ`, `M ↦ M^{-1}`, `ε ↦ ε'` with
`ε ε' = (−1)^{∑ n|γ(n)|} = 1` by 1.4's degree identity); `frobeniusSum_swap`.

*Needs:* 1.4, 1.12, 4.6, 4.7.

### 4.11 Imprimitive data: the Kummer pullback at the level of sums

For `D` with rotation number `r` and primitive datum `D'` (1.9) prove `M_D = M_{D'}^r`,
`ε_D = ε_{D'}^r`, `r_D = r_{D'}`, `s_D = s_{D'}` and `s_D(m) = s_{D'}(rm)` (the polynomial `D(X)`
of 4.7 for `D` is that of `D'` evaluated at `X^r`), so that the summand of the gamma form of `D`
at `m` is the summand of `D'` at `rm` with `ω(ε_{D'} M_{D'}^{-1})^{rm} ω(t)^m` in place of the
character factor.  Deduce, for `p ∤ N`, `r ∣ q − 1` and `t ∈ Fˣ`, the **Kummer pullback identity**
`H_q(D | t) = ∑_{c ∈ F, c^r = t} H_q(D' | c)`; in particular `H_q(D | t) = 0` when `t` is not an
`r`-th power in `F`.  (The fibre of `m ↦ rm` over `m'` contributes `∑_{j < r} ω(t)^{j𝔮/r}`, which
is `r` if `t` is an `r`-th power and `0` otherwise; on the right the `r`-th roots `c` of `t`
contribute the same factor through `∑_{ζ^r = 1} ω(ζ)^{m'}`.)  This is Katz's Kummer-pullback
relation (*Exponential sums and differential equations*, 8.2.1 and §5.6) at the level of sums.
Acceptance: `A = [9]`, `B = [3,3,1,1]` (`γ = [−3,−3,−3,9]`, `r = 3`, `D' = ([3],[1,1])`) at
`q = 19`, and `A = [4]`, `B = [2,1]` (`D' = ([2],[1])`) at `q ∈ {5, 13}`, for every `t ∈ Fˣ`.
`Suggested.lean` states the identity as `frobeniusSum_primitiveData`, with `r ∣ q − 1`.

*Needs:* 1.4, 1.9, 4.7.

### 4.12 Greene's function and the comparison

Define Greene's binomial coefficient `greeneBinom A B := B(−1)/q · jacobiSum A B⁻¹` (Greene
Definition 2.4) and his `greeneF`,
`_{n+1}F_n(A_0, …, A_n; B_1, …, B_n | x) := (q/(q−1)) ∑_χ greeneBinom (A_0 χ) χ ∏_{i=1}^n greeneBinom (A_i χ) (B_i χ) · χ(x)`
(Definition 3.10), for characters of `F`.  Prove Greene's Theorem 3.6 (`₂F₁` as a sum over `y`)
and Theorem 3.13 (the inductive integral representation).  Prove the comparison with 4.3 in the
form Beukers–Cohen–Mellit state on p. 10: with `A_i := ω^{a_i}` for the `d = n + 1` entries of `a`
and `B_j := ω^{b_j}` for the `n` nonzero entries of `b` (so `0 ∈ b` with multiplicity exactly `1`),
`_{n+1}F_n(A; B | x) = ω(−1)^{b_1 + ⋯ + b_n} · q^{1−d} · (∏_i g(a_i − b_i))^{−1} · S_q(a, b | x)`
for `x ∈ Fˣ` (`greeneF_eq_katzSum`), under the layer's standing disjointness of `a` and `b` (here:
no `a_i` is `0` or a `b_j`); both hypotheses are needed (at `x = 0` the left side vanishes and the
right does not, and over `𝔽_7` with `a = (1, 3)`, `b = (0, 3)` the ratio at `x = 2` is not `±1`).
The sign is the one point Beukers–Cohen–Mellit leave as `±`: expanding each of Greene's binomial
coefficients through `jacobiSum_eq_gaussSum_mul_gaussSum_div_gaussSum` (no Jacobi sum is
degenerate under the disjointness) leaves the factor `B_1(−1) ⋯ B_n(−1) = ω(−1)^{∑ b_j}`, which is
`(−1)^{∑ b_j}` for odd `q` and `1` for even `q`.  With it, every identity of Greene's §4 transports
to `H_q`.

**Checks.**

- `q = 5, 7, 11`, `n = 1`, `b = (3)` or `b = (1)`: `c = −1`; `b = (2)`: `c = +1`.  An existential
  sign `c ∈ {±1}` would hold trivially at every `x` where `S_q = 0`.
- On all disjoint `(a, b)` with `n = 1` over `𝔽_5`, `𝔽_7`, `𝔽_11`, `𝔽_13` and `n = 2` over `𝔽_5`, `𝔽_7`,
  and every `x ∈ Fˣ` with `S_q ≠ 0` (`22526` cases), the ratio is `ω(−1)^{∑ b_j}`.
- `greeneBinom A ε` with `ε` trivial: Greene's `(A over ε) = −1/q + (q − 1)/q · δ(A)`; Mathlib's
  `jacobiSum` with the convention `ε(0) = 0` reproduces it, a convention `ε(0) = 1` would not.

*Needs:* 4.3; Mathlib `jacobiSum`, `jacobiSum_eq_gaussSum_mul_gaussSum_div_gaussSum`,
`jacobiSum_comm`.

### Examples

- `A2.2_B1.1`, `q = 5`, `t = 2`: `H_5 = −2` by 4.3 and by the gamma form.
- `A2.2_B4`, `q = 3`, `t = 2`: `H_3 = −2/3` by the gamma form (the only definition at `q = 3`),
  and `3 · H_3 = −2 ∈ ℤ` (4.9 with `δ = 1`).
- `A2.2.2.2_B1.1.1.1` at `t = −1`: `H_5 = −4`, `H_7 = 0`; `A6.4.4.3_B12.2.2.2.1` at `t = 2`:
  `H_7 = −6/49`, `7² H_7 = −6`.

### Dependencies

Layer 1 (1.3–1.6, 1.9), Mathlib's Gauss and Jacobi sums and characters,
`ClassicalArithmeticCompletion` 7.29 for 4.7 and 7.12 for 4.8–4.9, and 2.1, 2.5 for the exponent
`δ` of 4.8–4.9; independent of Layer 3.

## Layer 5: Frobenius traces, Euler factors and bad primes

The arithmetic layer.  Its definitions are unconditional; its theorems split into those proved
from Layer 4 and those that are implications from the purity hypothesis 5.5, which Katz's theorem
(Layer 6) supplies for the realization and which nothing here asserts.

### 5.1 The Frobenius trace

For a cyclotomic datum `D`, a specialization point `t`, and `q = p^f` with `f ≥ 1` and `p` good
for `(D, t)`, define `frobeniusTrace D t q := q^δ · H_q(A, B | (t : F_q))` through 4.7, with
`δ = hodgeTwist D` of 2.5 (the image of `t` in `F_q` is a unit `≠ 1` because `p` is good).  This is
the pinned `a_q(A, B; t)`.  `Suggested.lean` indexes it by `p` and `f` and reads it in Mathlib's
`GaloisField p f`, with `t` sent to `F_q` as `num/den` (`ratToField`); at `f = 0` that field is `ZMod p` (the splitting field of `X^1 − X = 0`) while
the prefactor is `1`, a value that is not `a_1`, so every statement about the trace carries
`f ≥ 1`.  Prove it is an integer (4.9; `frobeniusTrace_integral`, for `t ≠ 0`, `f ≥ 1` and `p`
good), that
`frobeniusTrace (swap D) (1/t) q = frobeniusTrace D t q` (4.10 and `δ(swap D) = δ(D)`), and the
acceptance values, all LMFDB data: `frobeniusTrace ([2,2,2,2],[1,1,1,1]) (−1) 5 = −4` and
`… 7 = 0` (`A2.2.2.2_B1.1.1.1_t-1.1`); `frobeniusTrace ([2,2],[1,1]) 2 5 = −2` and
`frobeniusTrace ([2,2],[1,1]) (1/2) 5 = 2` (`A2.2_B1.1_t2.1`, `A2.2_B1.1_t1.2`: these two pin `t`
against `1/t`); `frobeniusTrace ([2,2],[4]) 2 3 = −2` (`A2.2_B4_t2.1`, `δ = 1`: this one pins the
power of `q`).

**Checks.**

- `A2.2_B4`, `t = 2`, `p = 3`, `f = 1`: `3 · (−2/3) = −2`, the LMFDB's `a_3`; at `f = 0` the
  definition returns `H_3 = −2/3`, not an integer, which is the instance the hypothesis `f ≥ 1`
  excludes.
- `A2.2_B1.1`, `p = 5`: `t = 2` gives `−2`, `t = 1/2` gives `2`; reading `1/t` would swap them.
- `A2.2.2.2_B1.1.1.1`, `t = −1`: `a_5 = −4`, `a_7 = 0`, `a_13 = −84`; dropping `q^δ` changes
  nothing here (`δ = 0`) but changes `A6.4.4.3_B12.2.2.2.1`'s `a_7` from `−6` to `−6/49`.

*Needs:* 1.11, 2.5, 4.7, 4.9, 4.10.

### 5.2 Frobenius series and polynomial

Define `frobeniusSeries D t p := PowerSeries.exp applied to −∑_{e ≥ 1} frobeniusTrace D t (p^e) · T^e / e`,
an element of `ℚ[[T]]` with constant term `1` (Roberts–Rodriguez-Villegas (11.1)), and
`frobeniusPolynomial D t p := PowerSeries.trunc (d + 1) (frobeniusSeries D t p) ∈ ℚ[T]`.  Prove
`coeff 1 = −a_p`, `coeff 0 = 1`, `natDegree ≤ d`, and the Newton identity relating the first `k`
coefficients to the first `k` traces (`coeff k` is the complete-homogeneous expression in the
traces, Mathlib's `MvPolynomial.psum`/Newton identities `Multiset.esymm`–`psum` relation).  Define
the **Euler factor** at `p` as `frobeniusPolynomial D t p` evaluated at `p^{−s}`, and the
**arithmetic Dirichlet coefficients** `a_n` by the multiplicative expansion of
`∏_p frobeniusPolynomial(p^{−s})^{-1}` over good primes, as a `Nat.ArithmeticFunction ℚ`
(`ArithmeticFunction.IsMultiplicative`, with `a_{p^e}` from the series `1/F_p`).

**Checks.**

- `A2.2_B1.1`, `t = 2`, `p = 5`: `a_5 = −2`, `a_25 = −6`; the series is
  `1 − a_5 T + ((a_5² − a_25)/2) T² + ⋯ = 1 + 2T + 5T² + ⋯`, and `F_5 = 1 + 2T + 5T²`, the
  LMFDB's.
- `coeff 0 = 1` for every datum, including the degree-`0` one, whose polynomial is `1`.
- A definition with `exp(+∑ a_{p^e} T^e/e)` would give `1 − 2T + …` for the same motive, the
  inverse of the Euler factor rather than the factor.

*Needs:* 5.1; Mathlib `PowerSeries.exp`, `PowerSeries.subst`, `PowerSeries.trunc`,
`Multiset.esymm`, `ArithmeticFunction`.

### 5.3 Good, tame and wild for the motive page

Prove the LMFDB knowl "hgm.good_prime"'s partition for `(D, t)` (1.11) and that
`frobeniusTrace` is defined at exactly the good prime powers; call `p` **bad** for `(D, t)` when it is tame or
wild, prove the set of bad primes is finite for `t ≠ 0` and contains the wild primes of `D` and
the primes dividing the numerator or denominator of `t` or `t − 1`.

**Checks.**

- `A2.2_B1.1`, `t = 2`: bad primes `{2}` (wild); `t = −3`: `{2, 3}`.
- `A2.2.2.2_B1.1.1.1`, `t = −1`: `t − 1 = −2`, bad primes `{2}`; every odd prime is good.
- `t = 0` is excluded: `padicValRat p 0 = 0` gives no cusp, so every non-wild prime would be
  "good", although the trace at `t = 0` is the single term `q^δ/(1 − q)`.

*Needs:* 1.6, 1.11, 5.1.

### 5.4 Newton and Hodge polygons; ordinary

Define the **Newton polygon** `NP_p(D, t) : ℕ → ℝ` as the lower convex hull of
`{(k, v_p(coeff k (frobeniusPolynomial D t p))) : coeff k ≠ 0}`, evaluated at the integers
`0 ≤ k ≤ d` (the supremum of the supporting lines), and call `(D, t)` **ordinary** at `p` when
the Newton polygon equals the Hodge polygon of 2.9 at every `k ≤ d`, the LMFDB family page's
"Ordinary?" column.  Prove that the Newton polygon takes the value `0` at `0` (the constant term
is `1`).

**Checks.**

- `A2.2_B1.1`, `t = 2`, `p = 5`: `F_5 = 1 + 2T + 5T²`, valuations `0, 0, 1`, Newton polygon
  `(0,0), (1,0), (2,1)` = Hodge polygon of `(1,1)`: ordinary.
- `A2.2.2.2_B1.1.1.1`, `t = −1`, `p = 3`: `F_3 = 1 + 6T² + 729T⁴` has `coeff 1 = 0`, valuations
  `0, ·, 1, ·, 6`, Newton slopes `1/2, 1/2, 5/2, 5/2`, not the Hodge slopes `0, 1, 2, 3`: not
  ordinary.
- The Newton polygon reads only nonzero coefficients; counting `v_p(0) = 0` (Mathlib's junk value)
  would make the second example ordinary-looking at `k = 1`.  That the Newton polygon lies on or above the Hodge polygon is Mazur's theorem for the
realization and is cited, not a target.

*Needs:* 2.9, 5.2; Mathlib `padicValRat`.

### 5.5 The purity hypothesis and its consequences

Define `IsPure D t p` : there is a multiset `Λ` of `d` complex numbers, each of absolute value
`p^{w/2}`, with `frobeniusTrace D t (p^e) = ∑_{λ ∈ Λ} λ^e` for every `e ≥ 1`.  Phrase the
elements of `Λ` as Weil `p`-numbers of weight `w` in the sense of
[`DeligneWeightsAndPurity`](../DeligneWeightsAndPurity/README.md) 0.1 (in prose; the Lean form
carries the absolute-value condition directly).  Prove, **assuming `IsPure D t p`**: (i)
`frobeniusSeries = ∏_{λ ∈ Λ} (1 − λT)`, a polynomial of degree exactly `d`, so
`frobeniusPolynomial` is it; (ii) for `t ≠ 0` and `p` good, the `λ ∈ Λ` are algebraic integers, because their power sums
`frobeniusTrace D t (p^e)`, `e ≥ 1`, are integers (5.1) (an `ℓ`-adic pole of `∑_e (∑_λ λ^e) T^e =
∑_λ λT/(1 − λT)` inside the unit disc would contradict integral coefficients), so the coefficients
of `frobeniusPolynomial` are rational algebraic integers and `frobeniusPolynomial ∈ ℤ[T]`; (iii) `|coeff k| ≤ C(d, k) p^{kw/2}`; (iv) `Λ` is determined
by `D, t, p`; (v) `coeff d = ±p^{wd/2}` (a rational integer of absolute value `p^{wd/2}`), so the
Newton polygon of 5.4 has the endpoints `(0, 0)` and `(d, wd/2)` of the Hodge polygon (2.9).  Assuming in addition the **self-duality** `Λ = {p^w/λ : λ ∈ Λ}` (`IsSelfDual D t p`), prove the **local
functional equation** `p^{wd/2} T^d F_p(1/(p^w T)) = ε_p F_p(T)`, i.e.
`coeff (d − k) = ε_p · coeff k · p^{(d − 2k) w/2}`, with `ε_p := (−1)^d ∏ λ / p^{wd/2} ∈ {±1}`
(Roberts–Rodriguez-Villegas §11, "Poincaré duality"; the factor `(−1)^d` makes `coeff d = ε_p p^{wd/2}`,
and for an elliptic curve `F_p = 1 − a_p T + pT²` gives `ε_p = 1`).  When `w` is odd (so `d` is even
by 2.6) and no `λ ∈ Λ` has `λ² = p^w`, prove `ε_p = 1`: `Λ` splits into pairs `{λ, p^w/λ}`.  The
proviso is needed: `Λ = {√p, −√p}` (`w = 1`, `d = 2`) is pure and self-dual, with `F_p = 1 − pT²`
and `ε_p = −1`.  For the realization `ε_p = 1` whenever `w` is odd, because its Poincaré pairing is
alternating; that is cited (6.4).  These
implications are what the LMFDB's displayed `F_p(T)` relies on; the hypothesis itself is Katz's
theorem and Deligne's purity for the realization, stated in Layer 6.

`Suggested.lean` states (i), (ii), (iii), the local functional equation and the symplectic sign
as `frobeniusPolynomial_of_isPure`, `frobeniusPolynomial_int_of_isPure`,
`abs_coeff_frobeniusPolynomial_le`, `local_functional_equation` and
`local_sign_eq_one_of_odd_weight`; (ii) carries `t ≠ 0` and `p` good because at a wild prime the
traces are values of `Classical.epsilon` with nothing to pin them, and purity alone does not make
a multiset integral (`Λ = {(3 + 4i)/5, (3 − 4i)/5}` has rational power sums, absolute values `1`
and non-integral elements).  (i), (iii) and the functional equation follow from `Λ` alone.

**Checks.**

- `A2.2_B1.1`, `t = 2`, `p = 5`: `Λ = {−1 ± 2i}`, `|λ| = √5 = 5^{1/2}`, power sums `−2, −6`;
  pure, self-dual, `ε_5 = (+1) · 5/5 = 1`.
- `Λ = {√5, −√5}` (`w = 1`, `d = 2`): pure and self-dual, `F = 1 − 5T²`, `ε = −1`: the proviso
  "no `λ² = p^w`" of the symplectic sign is needed.
- The degree-`0` datum: `Λ = ∅`, `F = 1`, `ε = 1`, and every statement holds trivially.

*Needs:* 2.6, 2.9, 5.1, 5.2, 5.4; Mathlib `Multiset.prod_X_sub_C_coeff`, the norm on `ℂ`.

### 5.6 Acceptance Euler factors

Prove, as instances of 5.1–5.2 with the traces computed from 4.7 (a finite computation in each
case, `decide`-style over `F_q` for `q ≤ 7^4` or by the `p`-adic method, which is not required),
that for `D = ([2,2,2,2],[1,1,1,1])`, `t = −1` (the LMFDB motive `A2.2.2.2_B1.1.1.1_t-1.1`):
`frobeniusPolynomial D t 3 = 1 + 6T² + 729T⁴`,
`frobeniusPolynomial D t 5 = 1 + 4T − 130T² + 500T³ + 15625T⁴` and
`frobeniusPolynomial D t 7 = 1 + 238T² + 117649T⁴`, as the LMFDB stores them; and that for
`D = ([6,4,4,3],[12,2,2,2,1])` (`δ = 2`), `t = 2`, `p = 7`: the first five coefficients are
`1, 6, −315, −104370, 643468` (`= 1, 6, −45·7, −2130·7², 268·7⁴`), the polynomial the LMFDB family
page displays at `p = 7` (its test suite's `test_good_euler`); `frobeniusTrace D 2 7 = 7² ·
H_7(· | 2) = 7² · (−6/49) = −6`.  (The degree-`8` factor's full form,
`… − 250592370T⁵ − 1815912315T⁶ + 83047723206T⁷ + 7^{16} T⁸`, follows from 5.5 under the
hypothesis; the unconditional target is the first half.)

*Needs:* 4.7, 5.1, 5.2.

### 5.7 The archimedean shifts

Define the **archimedean shifts** `(μ, ν)` of a list `h : List ℕ` and an integer `σ`, two
multisets of rationals, by the Conventions row, with `σ` in the LMFDB's sign convention.  Prove
`card μ + 2 · card ν = d` when `h` is a Hodge vector of weight `w` and degree `d` with
`|σ| ≤ h^{w/2,w/2}`, `σ ≡ h^{w/2,w/2} (mod 2)` for even `w` and `σ = 0` for odd `w`, and that the
gamma factor `∏ Γ_ℝ(s + μ_i) ∏ Γ_ℂ(s + ν_j)` is Roberts–Rodriguez-Villegas (12.2) with `s`
replaced by `s + w/2` and their signature `σ_RRV = (−1)^{w/2} σ`, under the duplication formula
`Γ_ℝ(s) Γ_ℝ(s + 1) = Γ_ℂ(s)`.  `σ` is a parameter of this milestone; the L-functions roadmap's card
takes `(μ, ν)`, the conductor and the Euler factors, and the signature it needs is the
realization's (not owned here).

**Checks.**

- `h = (1, 1)`, `w = 1`, `σ = 0`: `μ = ∅`, `ν = {1/2}`, `0 + 2 · 1 = 2`.
- `h = (1, 2, 3, 2, 1)`, `w = 4`: `σ = 1` gives `μ = {0}`, `ν = {2, 1, 1, 0}` (`9 = 1 + 2 · 4`);
  `σ = −3` gives `μ = {1, 1, 1}`, `ν = {2, 1, 1}` (`9 = 3 + 2 · 3`).
- `h = (2, 6, 2)`, `w = 2`, `σ = 2`: `h⁺ = 4`, `h⁻ = 2` in the LMFDB's convention, and
  Roberts–Rodriguez-Villegas' formula gives the same `h^±` from `σ_RRV = −2`; taking
  `σ_RRV = σ` would exchange `h⁺` and `h⁻`, i.e. the shifts `0` and `1`.

*Needs:* 2.2, 2.9.

### 5.8 The determinant discriminant and its geometric part

Define the **determinant discriminant** `Disc(A, B; t) ∈ ℚ` by the recipe of the Conventions
(with Mathlib's `Polynomial.discr` for `disc Φ_v`) and the **determinant character** `χ_Disc` as
the quadratic Dirichlet character `kroneckerChar Δ` of the
[theta-series roadmap](../ThetaSeries/README.md) 2H, with `Δ` the discriminant of
`ℚ(√Disc(A, B; t))`: `Δ = d₀` if the squarefree integer part `d₀` of `Disc` is `≡ 1 (mod 4)` and
`Δ = 4d₀` otherwise (`Δ = 1` if `d₀ = 1`), since 2H defines `kroneckerChar Δ` only for
`Δ ≡ 0, 1 (mod 4)`; at an odd prime `p ∤ Δ` its value is `kroneckerSym d₀ p = (d₀ / p)`.  Prove the
**geometric part**: in the orthogonal case, the degree in `t` of the recipe's polynomial is
`≡ d + m_A`, `t − 1` occurs to an odd power (`m_A + m_B` is odd by 2.5), and `t` occurs to the
power `≡ d + m_B (mod 2)`, i.e. the recipe's ramification at `∞`, `1`, `0` is `det h_∞, det h_1,
det h_0` of 3.3 (for `1 ∉ A`: `d` odd gives `1 − t` and `d` even gives `t(t − 1)`; for `1 ∈ A` the
two are exchanged).  State, as the cited content: under 5.5 with self-duality and `w` even,
`ε_p = (−1)^d · χ_Disc(p)` at good `p` (Watkins; `(−1)^d ε_p p^{wd/2}` is the
determinant of Frobenius on the realization), and the LMFDB's `det` field `χ_{d_0 f(t)} ⊗ ℚ(−wd/2)`
is this character twisted by the Tate twist.  Acceptance: the 131 orthogonal good pairs of the
pinned-conventions row, and, from complete traces at `q = p, …, p^d`, the sign of `coeff d` on every
orthogonal datum of degree `≤ 3`, its swap, `p ∈ {5, 7, 11, 13}` and five values of `t` (612 cases).
The constants `Π_A`, `Π_B` are not derived here.

**Checks.**

- `A4_B2.1`, `t = −8`: neither "`d` odd" nor "`1 ∈ A`", so `Disc = Π_A · t(t − 1)` with
  `Π_A = Polynomial.discr (X² + 1) = −4`, `Disc = −4 · 72`, `d₀ = −2`, `χ_Disc(5) = (−2/5) = −1`,
  and `F_5 = 1 − T²` has `ε_5 = −1 = (−1)^2 · (−1)`.
- `A = [1]`, `B = [2]` (`d = 1`, `1 ∈ A`: both clauses hold): `Disc = disc(Φ_1) · t(t − 1)
  = t(t − 1)`, the character of the degree-one Check of 4.3.
- `Polynomial.discr (X² + X + 1) = 1 − 4 = −3`; an unsigned resultant `Res(Φ_3, Φ_3') = 3` would
  give the character of `ℚ(√3)` in place of `ℚ(√−3)`.

*Needs:* 1.2, 2.5, 3.3, 5.5; Mathlib `Polynomial.discr`; `ThetaSeries` 2H (`kroneckerSym`,
`kroneckerChar`).

### 5.9 Tame conductor exponents and tame local degrees

For `p` tame for `(D, t)` define `tameConductorExponent D t p` by the pinned conventions: with
`k := v_p(t)`, `rank (h_0^{k} − 1)` if `k > 0`, `rank (h_∞^{−k} − 1)` if `k < 0`, and at the cusp
`1` the value `1`, or `0` when the type is orthogonal and `v_p(t − 1)` is even
(Roberts–Rodriguez-Villegas (13.1) and §13 "Tame primes").  Evaluate it by 3.1's rank formula:
`c_p = d − #{distinct roots ζ of Φ_B with ζ^{k} = 1}` for `k > 0` (`h_0 = C(Φ_B)⁻¹`, and
`rank (C^{−k} − 1) = rank (C^k − 1)`), with `Φ_A` and `|k|` for `k < 0`.
Define the **tame local degree** `d − c_p` and record it as the degree of the Euler factor at a
tame prime; that factor itself (Roberts–Rodriguez-Villegas §13, Watkins §11.4) is the
characteristic polynomial of Frobenius on the inertia invariants of the realization and is cited,
not defined.  Acceptance, `D = ([4,2,2],[3,1,1])`, `p = 7`: `t = 7^3` gives `c_7 = 1` (degree `3`:
the roots `1, e(1/3), e(2/3)` of `Φ_3 Φ_1²` all satisfy `ζ³ = 1`), `t = 7` gives `c_7 = 3` (degree
`1`: only `ζ = 1`), `t = 7^{−4}` gives `c_7 = 1` (degree `3`: the roots `±i, −1` of `Φ_4 Φ_2²`),
`t = 7^{−2}` gives `c_7 = 3` (degree `1`: only `−1`), `t = 7^{−1}` gives `c_7 = 4` (degree `0`), and
`t = 8` (cusp `1`, symplectic) gives `c_7 = 1` (degree `3`).  On the LMFDB's 53 tame `(motive, p)`
pairs of degree `2` the degree of the stored Euler factor is `d − c_p` in every case.  The LMFDB's conductor is `∏_{p tame} p^{c_p} · ∏_{p wild} p^{c_p^{wild}}`
with the wild exponents consumed by citation (*Not owned here*); state the conductor as that
product with the wild part a parameter.

`Suggested.lean` states the two evaluations as `tameConductorExponent_inf` and
`tameConductorExponent_zero`.

**Checks.**

- `A4.2.2_B3.1.1`, `p = 7`, `t = 7`: `k = 1`, roots of `Φ_3 Φ_1²` with `ζ = 1`: only `1`, so
  `c_7 = 4 − 1 = 3`; `t = 7³`: all three distinct roots satisfy `ζ³ = 1`, `c_7 = 1`.  Counting the
  root `1` of `Φ_1²` twice would give `c_7 = 0` at `t = 7³`.
- Same datum, `t = 7^{−1}`: cusp `inf`, `rank (h_∞ − 1) = 4` (no root of `Φ_4 Φ_2²` is `1`),
  `c_7 = 4`, tame local degree `0`; reading the cusps the other way round would give `3`.
- `A2.2_B1.1_t-3.1`, `p = 3`: cusp `zero`, `rank (h_0 − 1) = 2 − 1 = 1`, degree `1`, the LMFDB's
  `F_3 = 1 − T`.

*Needs:* 1.11, 2.6, 3.1, 3.2.

### 5.10 Wild primes: what is and is not stated

Define nothing new.  State in prose: at a wild prime the Euler factor and the conductor exponent
are the local invariants of the realization; the bound `c_p ≤ σ(k) − deg F_p` of
Roberts–Rodriguez-Villegas (13.2) is a conjecture and is not a target; the LMFDB stores both as
data.  The only theorem here is 5.3's classification of the prime as wild.

*Needs:* 5.3.

### 5.11 The mod-`ℓ` semisimple Frobenius order

For `F ∈ ℤ[T]` with `F(0) = 1` (5.5 (ii)) and a prime `ℓ`, define
the **semisimple Frobenius order** of `F` at `ℓ` as the order of `X` in the unit group of
`(ZMod ℓ)[X] / (radical (reverse F mod ℓ))`, i.e. the lcm of the multiplicative orders of the
reciprocal roots of `F` in `F̄_ℓ`; prove it equals that lcm and is finite.  This is the LMFDB
motive page's "order of semisimple Frobenius at `ℓ`" for `ℓ ∈ {2, 3, 5, 7}` and its "LCMs" row.

**Checks.**

- `F = 1 + 2T + 5T²` (`A2.2_B1.1_t2.1` at `5`), `ℓ = 2`: `reverse F mod 2 = X² + 1 = (X + 1)²`,
  radical `X + 1`, order of `X` is `1`; without the radical the order in
  `(𝔽_2[X]/(X + 1)²)ˣ` would be `2`.
- Same `F`, `ℓ = 3`: `X² + 2X + 2` is irreducible over `𝔽_3`, its roots lie in `𝔽_9ˣ` of order
  `8`, and `X⁴ ≡ −1`, so the order is `8`.
- `F = 1` (degree `0`): the quotient ring is `0`, and the order is `1`.

*Needs:* 5.2, 5.5; Mathlib `Polynomial.reverse`, `orderOf`, `Ideal.radical`.

### 5.12 Galois group and discriminant of the Frobenius polynomial

For `F` as in 5.11 define the Galois group of `F` as `Polynomial.Gal (reverse F : ℚ[X])` and, when
`reverse F` is irreducible, its local discriminant as `NumberField.discr (AdjoinRoot (reverse F))`,
the LMFDB knowl "hgm.local_discriminant"; when it is reducible the LMFDB displays the discriminant
of the étale algebra, which is the product over the irreducible factors of the discriminants of
their fields; define that product.  Nothing is proved about either beyond well-definedness; the
transitive-group label of the Galois group and the identification of the field are
[`PolynomialGaloisGroups`](../../Completed/PolynomialGaloisGroups/README.md)' and the completed
[number-field arithmetic roadmap](../../Completed/NumberFieldArithmetic/README.md)'s.

**Checks.**

- `F = 1 + 2T + 5T²`: `reverse F = X² + 2X + 5`, discriminant `4 − 20 = −16`, field `ℚ(i)`,
  local discriminant `−4`, Galois group of order `2`.
- `F = 1 − T²` (`A4_B2.1_t-8.1` at `5`): reducible, `reverse F = X² − 1`, étale algebra `ℚ × ℚ`,
  product of discriminants `1`, Galois group trivial.
- `F = 1` (degree `0`): `reverse F = 1`, the Galois group is trivial and the étale algebra is
  `0`, with empty product of discriminants `1`.

*Needs:* 5.2, 5.5; Mathlib `Polynomial.Gal`, `NumberField.discr`.

### 5.13 The L-function card

Prove that `(frobeniusPolynomial D t p)_{p good}`, the tame exponents of 5.9, a wild part
`(c_p^{wild})_{p wild}` and the archimedean shifts `(μ, ν)` of the Hodge vector of `D` and `σ`
(5.7) assemble into the
data the [L-functions roadmap](../LFunctions/README.md) Layer 0 asks of an
`ArithmeticLFunctionData` of weight `w` and degree `d`: norm-indexed coefficients from 5.2,
conductor `∏ p^{c_p}`, the gamma shifts, a root number `ε ∈ {±1}` as a parameter, and no poles.
This milestone states the interface in that roadmap's vocabulary; the continuation and functional
equation are its Layer 0 predicates and are not asserted here (they are the Hasse–Weil
expectation for the motive).  The LMFDB's `hgm_motives.coeffs` column is the coefficient sequence
of this card.

*Needs:* 5.2, 5.7, 5.9; `LFunctions` Layer 0.

### 5.14 The duality `(A, B, t) ↔ (B, A, 1/t)` collected

Collect the second half of 1.12: `weight (swap D) = weight D`, equal Hodge vectors for `swap D`
and `D`
(2.7) and `type (swap D) = type D` (2.6); `frobeniusTrace (swap D) (1/t) q = frobeniusTrace D t q`
at every good `q` (4.10, 5.1), hence `frobeniusPolynomial (swap D) (1/t) p = frobeniusPolynomial D t p`
(5.2) and `IsPure (swap D) (1/t) p ↔ IsPure D t p` (5.5); and
`tameConductorExponent (swap D) (1/t) p = tameConductorExponent D t p` at every tame `p` (5.9: the
cusps `∞` and `0` are exchanged by 1.12, `h_∞(swap D) = C(Φ_B)` and `h_0(swap D) = C(Φ_A)^{-1}`,
and `rank (C^{−k} − 1) = rank (C^k − 1)` for invertible `C`, so the rank formula of 3.1 gives the
same count on both sides; the cusp `1` is fixed and the type agrees).  Hence the two presentations
of one motive feed the same card (5.13) with the same conductor for the same wild part.  Nothing
here picks one of them.

*Needs:* 1.12, 2.6, 2.7, 3.1, 4.10, 5.1, 5.2, 5.5, 5.9, 5.13.

### Examples

- `A2.2.2.2_B1.1.1.1_t-1.1`: `F_3 = 1 + 6T² + 729T⁴`, `F_5 = 1 + 4T − 130T² + 500T³ + 15625T⁴`,
  `F_7 = 1 + 238T² + 117649T⁴` (5.6), every odd prime good, `ε_5 = 1`.
- `A4.2.2_B3.1.1` at the tame prime `7`: tame local degrees `3, 1, 3, 1, 0, 3` (5.9).
- `A4_B2.1_t-8.1`: `F_5 = 1 − T²`, `ε_5 = −1 = (−1)^2 χ_Disc(5)` (5.8).

### Dependencies

Layers 1 (1.6, 1.11, 1.12), 2 (2.5, 2.6, 2.9), 3 (3.1–3.3 for 5.8–5.9), 4 (4.7–4.10);
`LFunctions` Layer 0 for 5.13; `ThetaSeries` 2H for 5.8; Mathlib's power series, `padicValRat`,
`Polynomial.Gal`, `NumberField.discr` and `Polynomial.discr`.

## Layer 6: point counts and the motive

The theorems that make the sums of Layer 4 point counts, in the two cases whose varieties are
elliptic curves and are elementary, and the citation that makes the whole structure a motive.

### 6.1 Ono's theorem

For `q` an odd prime power and `λ ∈ F_q`, `λ ≠ 0, 1`, let `E_λ := legendreFamily λ`, the
Weierstrass curve with coefficients `(0, −(1 + λ), 0, λ, 0)`, which is `legendre λ`, the Legendre
equation `y² = x(x − 1)(x − λ)` of [Elliptic curves, Part II — Legendre models, descent and
character interfaces](../EllipticLegendreCharacterInterfaces/README.md) 0.1, the fibre at `λ` of
[Modular curves](../ModularCurves/README.md)' universal Legendre curve (4C).  Prove
`|E_λ(F_q)| = q + 1 − (−1)^{(q−1)/2} H_q(1/2, 1/2; 1, 1 | λ)` (Beukers–Cohen–Mellit Theorem 1.2,
their restatement of Ono's count in *Values of Gaussian hypergeometric series*, proved by expanding
the quadratic character of the cubic through Jacobi sums).  The count is Tau Ceti's
`WeierstrassCurve.pointCount` (`TauCeti.AlgebraicGeometry.EllipticCurve.PointCount`: the affine
solutions with the point at infinity); the proof is the character-sum count of the same roadmap's
5.1, `pointCount (legendre λ) = q + 1 + ∑_x φ(x(x−1)(x−λ))`, followed by the `₂F₁` evaluation of
Greene's Theorem 3.6 for `A = B = φ`, `C = ε` (4.12).  `Suggested.lean` states it as
`legendre_point_count`, counting `Nat.card` of Mathlib's point type (the affine solutions and the
point at infinity), which is `pointCount` on this elliptic model
(`WeierstrassCurve.pointCount_eq_card_point`).
This is the LMFDB's Legendre family `A2.2_B1.1` (`δ = 0`), whose motive at `t` has
`a_q = H_q(1/2,1/2;1,1 | t) = (−1)^{(q−1)/2} (q + 1 − |E_t(F_q)|)`, the trace of the quadratic twist
`y² = x(1 − x)(x − t)` of `E_t` (Roberts–Rodriguez-Villegas (1.3), (1.7)); for `t = 2`, `q = 5`:
`|E_2(F_5)| = 8`, `a_5 = −2`, as the LMFDB stores for `A2.2_B1.1_t2.1`.

**Checks.**

- `q = 5`, `λ = 2`: `8` points, `H_5 = −2`, `5 + 1 − (−1)^2 · (−2) = 8`; `q = 13`, `λ = 2`: `8`
  points, `H_13 = 6`; `λ = 7`: `20` points, `H_13 = −6`.
- All `λ ≠ 0, 1` and `p ∈ {5, 7, 11, 13, 17}`: the identity holds; at `q = 7`, `λ = 2` it reads
  `8 = 7 + 1 − (−1)^3 · 0`; at `q = 7`, `λ = 3` there are `4` points and `H_7 = −4`, so
  `4 = 8 − (−1)^3 · (−4)`, while dropping the sign `(−1)^{(q−1)/2}` would give `12`.
- `λ = 1`: the curve `y² = x(x − 1)²` is singular, and the hypothesis `λ ≠ 1` excludes it.

*Needs:* 4.3, 4.12; `EllipticLegendreCharacterInterfaces` 0.1, 5.1; `ModularCurves` 4C;
Tau Ceti `WeierstrassCurve.pointCount`; Mathlib `quadraticChar`, `jacobiSum`.

### 6.2 The cubic family

For `q` coprime to `6` and `λ ∈ F_qˣ` with `27λ ≠ 1`, let `E'_λ : y² + xy + y = λx³`.  Prove
`|E'_λ(F_q)| = q + 1 − H_q(1/3, 2/3; 1, 1 | 27λ)` (Beukers–Cohen–Mellit Corollary 1.7; acceptance:
`p ∈ {5, 7, 11, 13}` and all admissible `λ`).  When `q ≡ 1 (mod 3)` the proof is the cubic
Jacobi-sum evaluation (the
[classical arithmetic completion](../ClassicalArithmeticCompletion/README.md)'s 1.19 and 1.53
are its `F_p` instances); when `q ≡ 2 (mod 3)` the gamma form 4.7 (`γ = [−1,−1,−1,3]`, `M = 27`)
is the definition and the count is direct.  Prove also Corollary 1.6, the zero count
`N_f(t) = 1 + H_q(1/3, 2/3; 1, 1/2 | t)` of `x³ + 3x² − 4t` for `q` coprime to `6` and `t ≠ 0, 1`.  This is the
LMFDB's `A3_B1.1` (`δ = 0`) with `a_q(t) = H_q(1/3, 2/3; 1, 1 | t)`, so `E'_{t/27}` is a curve in the
motive's isogeny class.  `Suggested.lean` states Corollary 1.7 as `cubic_point_count` for every
`q` coprime to `6`, with `H_q` read as the rational value `frobeniusSum` of 4.7 of the datum
`cubicDatum = ([3], [1, 1])`, and the curve in the form `cubicFamily λ : y² + xy + λy = x³`, the
image of `E'_λ` under `(x, y) ↦ (λx, λy)`.

**Checks.**

- `q = 5` (`q ≡ 2 (mod 3)`, gamma form only): `λ = 1, 2, 4` give `9, 3, 6` points and
  `6 − H_5(· | 27λ) = 9, 3, 6`; `λ = 3` is excluded (`27 · 3 ≡ 1`).
- `q = 11`: the identity holds for every admissible `λ`; `q = 7` (`3 ∣ 6`): the sum of 4.3 and the
  gamma form agree (4.7).
- `λ = 0`: `y² + xy = x³` is singular (a node at the origin), and the hypothesis `λ ≠ 0`
  excludes it.

*Needs:* 4.3, 4.7, 4.12; `ClassicalArithmeticCompletion` 1.19, 1.53; Mathlib
`jacobiSum`.

### 6.3 Katz's toric count

Prove Beukers–Cohen–Mellit Lemma 2.7 and, from it and 4.2, the count of the torus points of the
variety `V_t : ∑ x_i = ∑ y_j, t ∏ x_i = ∏ y_j` (their (1.1) restricted to the torus) in terms of
`katzExpSum` and its Fourier expansion: `#V_t(F_q)^{torus}` is an explicit linear combination of
`H_q(α, β | M t)` and powers of `q` (the `P_{rs}(q)` of their Theorem 1.5 is the contribution of
the degenerate characters).  The statement with the smooth completion `V̄_t`
(Beukers–Cohen–Mellit Theorem 1.5 and Definition 5.1) is cited and is not a target.

*Needs:* 4.2, 4.3, 4.7.

### 6.4 The identification, cited

The following is stated in prose and asserted nowhere in Lean.  For a cyclotomic datum `(A, B)`
and `t ∈ ℚ ∖ {0, 1}`, Katz (*Exponential sums and differential equations*, Chapter 8, and
*Rigid local systems*) constructs the hypergeometric ℓ-adic sheaf `𝓗(α, β)` on `𝔾_m`, pure of
weight `w` after a Tate twist, whose Hodge-normalised Frobenius trace at a point `t ∈ F_q`,
`p ∤ N`, is `a_q(A, B; t) = q^δ H_q(A, B | t)` in the normalisation of this roadmap; Roberts–Rodriguez-Villegas §4
define the motive `H(A, B, t)` in André's category `M(ℚ, ℚ)` as the Hodge-normalised main piece
of the middle cohomology of the canonical variety (their (3.1)), of rank `d` and weight `w`, whose
ℓ-adic realization is the fibre of the sheaf, whose Hodge realization has Hodge numbers
`hodgeVector D` (Fedorov, Theorem 1; Corti–Golyshev's conjecture), whose Betti realization at
real `t` has the signature the LMFDB stores, and whose determinant is the character of 5.8.  In
the vocabulary of [`MotivesAndAlgebraicCycles`](../MotivesAndAlgebraicCycles/README.md) Layers
1–2 it is an object with realizations; in that of
[`DeligneWeightsAndPurity`](../DeligneWeightsAndPurity/README.md) its Frobenius eigenvalues are
Weil `p`-numbers of weight `w`, which is the hypothesis `IsPure D t p` of 5.5 at every good `p`,
and its Poincaré pairing (3.5's form, symmetric or alternating by type) is the self-duality
hypothesis.  The L-function of 5.13 is `L(H(A, B, t), s)`.  Every LMFDB column of the motive page
is thereby a function of the objects defined here plus the wild local invariants and the
signature, which are the realization's.

*Needs:* none; this is a citation.

### Examples

- `A2.2_B1.1` at `t = 2`: `|E_2(F_5)| = 8`, `a_5 = −2` (6.1).
- `A3_B1.1`: `E'_{t/27}` counts `q + 1 − a_q(t)` points, at `q = 5` and `q = 11` through the gamma
  form (6.2).

### Dependencies

Layer 4 (4.3, 4.7, 4.12), `EllipticLegendreCharacterInterfaces` 0.1 and 5.1 and `ModularCurves`
4C for 6.1, `ClassicalArithmeticCompletion` 1.19 and 1.53 for 6.2, Mathlib's
`WeierstrassCurve`; 6.4 is a citation.

## Explicit scope exclusions

- No category of motives, realization functor, or Katz sheaf is constructed; 6.4 is a citation.
- No signed signature, no archimedean root number, no global root number.
- No wild Euler factor and no wild conductor exponent; no `σ(k)`.
- No classification of finite hypergeometric groups (Beukers–Heckman Theorem 7.1, Table 8.3) and
  no identification of a monodromy group with a labelled abstract group.
- No Hasse–Davenport product relation (consumed from `ClassicalArithmeticCompletion` 7.29), and
  no Gross–Koblitz formula or `p`-adic Gamma function (`CharacterSumsOverFiniteFields` 6.5 and
  6.4); the `p`-adic evaluation of `H_q`
  that Magma and Sage use is an algorithm, not a target.
- No hypergeometric differential equation, period, or variation of Hodge structure; Fedorov's
  theorem and Levelt's differential-equation statement are cited only.
- No tame Euler factor beyond its degree (5.9).
- No label normal form (1.12 and 5.14 prove the duality; the choice of representative is not a
  target), no database ordering, no completeness statement for "all families of degree
  `≤ 7`".
- No `t = 1` motive beyond its Hodge vector (2.9); the degree drop and the special motive are
  Roberts–Rodriguez-Villegas §9, cited.
- No Hodge–Newton inequality (Mazur), only the predicate "ordinary" (5.4).

## Worked examples (acceptance criteria)

Every number here was computed (Sage 10.7, "sage.modular.hypergeometric_motive", as
`HypergeometricData(cyclotomic=(A, B))` with the same `t`; an independent evaluation of
Definition 1.1 and of Theorem 1.3 over `F_p`) or read from the LMFDB (its API and its source and
test suite); each line says which milestone proves it.

### `A2.2.2.2_B1.1.1.1` and its motive at `t = −1`

`α = (1/2, 1/2, 1/2, 1/2)`, `β = (1, 1, 1, 1)`; `d = 4` (1.2); `γ = [−1^8, 2^4]`, `M = 256`
(1.4); wild primes `{2}` (1.6); rotation number `1` (1.8); Hodge vector `(1,1,1,1)`, `w = 3`,
symplectic (2.2, 2.6; `m_B = 4` even, so `w` odd by 2.5); `δ = (3 + 1 − 4)/2 = 0` (2.5);
`h_∞ = C((X+1)^4)`, `h_0 = C((X−1)^4)^{−1}`, `det h_∞ = (−1)^{4+0} = 1`, `det h_0 = (−1)^{4+4} = 1`,
`det h_1 = 1` (3.3); `Γ` infinite (3.7, since `w ≠ 0`).  At `t = −1`: `t` and `t − 1 = −2` have no
odd prime factor, so every odd prime is good (5.3); `a_3 = 0`, `a_5 = −4`, `a_7 = 0`, `a_13 = −84`
(5.1); `F_3 = 1 + 6T² + 729T⁴`, `F_5 = 1 + 4T − 130T² + 500T³ + 15625T⁴`,
`F_7 = 1 + 238T² + 117649T⁴` (5.6); `15625 = 5^6 = 5^{wd/2}`, `ε_5 = 1` (5.5, `w` odd).  LMFDB:
label `A2.2.2.2_B1.1.1.1_t-1.1`, conductor `2^9 = 512` (wild, stored), sign `+1`, `sig = 0`,
Dirichlet coefficients `1, 0, 0, 0, −4, 0, 0, 0, −6, …` in arithmetic normalization (5.2).  At
`t = 1/2` and `t = 2`, which the LMFDB does not store, the pinned convention gives `a_5 = −12`,
`a_7 = −16` and `a_5 = 12`, `a_7 = −16`: the two differ by the quadratic character of `t`
(4.6 with `μ = 1/2` exchanges `α` and `β`), which is `−1` at `5` and `+1` at `7`.

### `A3_B1.1` (the cubic family) and `A2.2_B1.1` (Legendre)

`A3_B1.1`: `d = 2`, `γ = [−1,−1,−1,3]`, `M = 27`, wild `{3}`, Hodge `(1,1)`, `w = 1`.  For
`p ≡ 2 (mod 3)` the sum is defined by 4.7 only.  6.2 identifies `a_q(t)` with `q + 1` minus the
point count of `y² + xy + y = λx³` at `λ = t/27`.  `A2.2_B1.1`: `d = 2`, `γ = [−1,−1,−1,−1,2,2]`,
`M = 16`, wild `{2}`, Hodge `(1,1)`, `δ = 0`; 6.1 identifies `a_q(t)` with
`(−1)^{(q−1)/2}(q + 1 − |E_t(F_q)|)`.  LMFDB: `A2.2_B1.1_t2.1` has conductor `32` and
`F_5 = 1 + 2T + 5T²`, `F_13 = 1 − 6T + 13T²` (`a_5 = −2`, `a_13 = 6`), and `A2.2_B1.1_t1.2` has
conductor `64` and `a_5 = 2`, `a_13 = −6` (5.1); `A2.2_B1.1_t-3.1` has `c_3 = 1` and `F_3 = 1 − T`
at the tame prime `3` (5.9: cusp `0`, `rank (h_0 − 1) = 2 − 1`).

### `A2.2_B4`: the Hodge normalisation

`α = (1/2, 1/2)`, `β = (1/4, 3/4)`; `d = 2`, `γ = [−4, −1, −1, 2, 2, 2]`, `M = 1/4`, wild `{2}`;
recorded heights `−1, 0` (2.2), so `w = 1`, Hodge `(1,1)`, `δ = 1 = −m` (2.5); `λ(α, β) = 1` (4.8).
LMFDB: `A2.2_B4_t2.1` has `F_3 = 1 + 2T + 3T²` and `F_11 = 1 + 6T + 11T²`; the finite sums are
`H_3(· | 2) = −2/3` and `H_11(· | 2) = −6/11`, so `a_3 = 3 · H_3 = −2` and `a_11 = −6` (5.1, 4.9).
Without the factor `q^δ` the trace would not be an integer, and `IsPure` (5.5) would fail for
every `p`.

### `A10.6.3.2_B14.1.1.1`

`d = 9`; Hodge vector `(1, 2, 3, 2, 1)`, `w = 4`, orthogonal (2.2, 2.6; `m_B = 3` odd); the LMFDB
test suite's Hodge-vector test.

### `A6.4.4.4.3_B10.2.2.2.2.2.2`

`d = 10`; Bézout determinant `−191102976 = −2^{18}·3^6 = (−1)^{45} Res(Φ_A, Φ_B)`; Bézout module
`C_2 × C_2 × C_{16} × C_{16} × C_{432} × C_{432}` (3.8).

### `A18.12_B8.3.2.1.1.1`

`d = 10`; `A_2 = [4,4,2,2,2,2,2]`, `B_2 = [8,1,1,1,1,1]`, `C_2 = [2]`; `A_3 = [9,3]`,
`B_3 = [1,1,1,1,1,1,1,1]`, `C_3 = [3]`; `A^2 = [9,3]`, `B^2 = [1^8]` (1.7); Hodge `(2,6,2)`,
`w = 2` (2.2).

### `A6.4.4.3_B12.2.2.2.1` at `t = 2`

`d = 8`, `w = 4`, Hodge `(1,2,2,2,1)`, `m_B = 1`, `δ = 2`, wild `{2,3}`; `7` is good for `t = 2`;
`H_7(· | 2) = −6/49` and `a_7 = 7² H_7 = −6`; the first half of `F_7(T)` is
`1 + 6T − 45·7 T² − 2130·7² T³ + 268·7⁴ T⁴` (5.6), the Euler factor the LMFDB family page displays
at `p = 7` (its `test_good_euler`); the full polynomial under 5.5 ends in `7^{16} T^8`.

### `A4.2.2_B3.1.1` at the tame prime `7`

`d = 4`, `w = 1`, Hodge `(2,2)`, wild `{2,3}`.  `Φ_A = Φ_4 Φ_2²`, `Φ_B = Φ_3 Φ_1²`.  Tame local
degrees at `p = 7` (5.9): `t = 7^3 ↦ 3`, `t = 7 ↦ 1`, `t = 7^{−4} ↦ 3`, `t = 7^{−2} ↦ 1`,
`t = 7^{−1} ↦ 0`, `t = 8 ↦ 3` (cusp `1`); the corresponding factors (cited, not targets) are
`1 − 6T + 12T² − 7T³`, `1 − T`, `1 + T + 7T² + 7T³`, `1 + T`, `1`, `1 − T + 7T² − 7T³`, whose
degrees are the acceptance values.  ⚠ Reading the cusps the other way round (`v_7(t) > 0 ↦ h_∞`)
predicts degree `0` at `t = 7` and degree `1` at `t = 1/7`; the LMFDB's tame data (pinned
conventions, "Cusps and `t`") rule it out.

### `A30_B5.3.2.1` (Bober's family) and `A4_B2.1`

`A30_B5.3.2.1`: `d = 8`, `γ = [−15, −10, −6, 1, 30]`, `M = 1007769600000`, wild `{2,3,5}`,
Hodge `(8)`, `w = 0`, interlacing (2.8), finite monodromy (3.7); the LMFDB knowl on this family
cites the integrality of `(30n)! n!/((15n)!(10n)!(6n)!)`, which is 1.4's Pochhammer identity with
`M^{-n}` cleared.  `A4_B2.1`: `d = 2`, `γ = [−2,−2,4]`, `M = 16`, rotation number `2` (1.8),
primitive datum `γ/2 = [−1,−1,2]` of degree `1` (1.9), `w = 0`, imprimitive (3.9).

### Boundary and off-hypothesis checks

- `A = [2,2]`, `B = [2,1]`: not a cyclotomic datum (`2 ∈ A ∩ B`); `A = [3]`, `B = [1]`: not a
  cyclotomic datum (`φ`-sums `2 ≠ 1`).  Both are rejected by the structure (1.2).
- `A = [4]`, `q = 7`: not admissible (`4 ∤ 6`), so 4.3 does not apply; `7` is not wild, so 4.7
  defines `H_7(A, B | t)` for every `B`.  This is why 4.7, not 4.3, is the definition.
- `t = 1`: no tame primes (1.11); the degree drop (2.9) is cited; nothing in Layer 5 is stated
  at `t = 1`.
- `p = 2` for `A2.2_B1.1`: wild; no trace, no Euler factor here (5.3).
- The class `0 ∈ β`: `ω^0 = 1`, `g(0) = −1`; the normalising factor of 4.3 is still a unit,
  which is why `H_q` carries no hypothesis `0 ∉ α ∪ β`.
- `H_q(α, β | 0)`: a single term; excluded from every theorem by `t ∈ Fˣ`.
- The pair `α = {0}`, `β = {1/2}` (`A = [1]`, `B = [2]`): `d = 1`, `w = 0`,
  `Φ_1/Φ_2 = (X−1)/(X+1) = (X−1)²/(X²−1)`, so `γ(1) = 2`, `γ(2) = −1`, gamma multiset `[−2, 1, 1]`,
  `M = 1/4`, `δ = (0 + 1 − 1)/2 = 0`; and `H_q(0; 1/2 | t) = φ(t(t − 1))` with `φ` the quadratic
  character of `F_q` (so `0` at `t = 1`), for every odd `q` and `t ∈ Fˣ` (verified for
  `q ∈ {5, 7, 11, 13}`); hence `a_q(A, B; t) = φ(t(t − 1))`, and the rank-one motive is the
  quadratic character of `ℚ(√(t(t − 1)))`, which is 5.8's determinant character for `d = 1`,
  `1 ∈ A` (`Π_A = disc Φ_1 = 1`).  This is the acceptance test that `H_q` of a rank-one datum is a
  character value, computed in 4.3 and matched with 4.7 (`hypergeometricSum_degree_one`).

## Downstream consumers

- Roadmaps on the L-functions of motives and on Sato–Tate distributions read a hypergeometric
  motive through Layer 5: the Frobenius polynomials `F_p(T)` at good primes (5.2), the tame
  conductor exponents (5.9), the archimedean shifts of a Hodge vector and signature (5.7) and the
  assembled card of 5.13, together with the Hodge vector and type of Layer 2.
- Finite-field character-sum roadmaps read the finite hypergeometric sums `H_q` of Layer 4 and
  the gamma-vector form 4.7 as the hypergeometric instance of their Gauss- and Jacobi-sum
  identities.

## References

- F. Beukers, H. Cohen, A. Mellit, "Finite hypergeometric functions", *Pure Appl. Math. Q.* **11**
  (2015), 559–589, [arXiv:1505.02900](https://arxiv.org/abs/1505.02900).  Definition 1.1 (`H_q`),
  Theorem 1.2 (Ono), Theorem 1.3 (the gamma-vector form), Assumption 1.4, Theorem 1.5 (the point
  count, cited), Corollaries 1.6–1.8, Theorems 2.1–2.2 (Gauss and Jacobi sums), Theorem 2.4
  (Stickelberger), Theorem 2.5 (Hasse–Davenport), Proposition 2.6, Lemma 2.7, Proposition 3.1
  (Katz's sum), (3.1), Theorem 3.3 (Landau bound), Theorems 3.4–3.5 (shift, swap), Theorem 4.2
  (integrality), §4 proof of Theorem 1.3.
- J. Greene, "Hypergeometric functions over finite fields", *Trans. Amer. Math. Soc.* **301**
  (1987), 77–101.  Definition 2.4 (binomial coefficients), Definition 3.5 and Theorem 3.6
  (`₂F₁`), Definition 3.10 and Theorem 3.13 (`_{n+1}F_n`), (1.12)–(1.16) (Gauss–Jacobi identities).
- D. P. Roberts, F. Rodriguez Villegas, "Hypergeometric motives", *Notices Amer. Math. Soc.*
  **69** (2022), 914–929, [DOI](https://doi.org/10.1090/noti2491).  §2 (parameters, Levelt's
  companion matrices, the Magma reading of `(A, B)`), §3 (canonical varieties), §4 (the motive,
  (4.4) the orthogonal/symplectic dichotomy), §5 (zigzag, Figure 5.1), §9 (`t = 1`), §10 (wild,
  tame, good; (10.1) Katz's formula), §11 (Frobenius polynomials, Poincaré duality), §12 ((12.2)
  gamma factors, local invariants), §13 ((13.1) tame conductors, (13.2) the wild conjecture).
- F. Beukers, G. Heckman, "Monodromy for the hypergeometric function `ₙFₙ₋₁`", *Invent. Math.*
  **95** (1989), 325–354, [DOI](https://doi.org/10.1007/BF01393900).  §3 (Proposition 3.3,
  irreducibility; Theorem 3.5, Levelt's theorem),
  Theorem 4.3 (invariant Hermitian form), Theorem 4.5 and Corollary 4.7 (signature), Theorem 4.8
  (finiteness criterion), Theorem 5.8 (imprimitivity), Theorem 7.1 and Table 8.3 (classification,
  cited).  The statements of 4.5, 4.7 and 4.8 were taken from the restatement in H. Negami, "A
  closed signature formula for the Katz–Long–Moody Hermitian form", §7.2.1,
  [arXiv:2609.11793](https://arxiv.org/abs/2609.11793).
- A. H. M. Levelt, *Hypergeometric functions*, thesis, University of Amsterdam, 1961.  The
  companion-matrix description.
- L. Qian, "Potential automorphy for `GL_n`", [arXiv:2104.09761](https://arxiv.org/abs/2104.09761).
  Lemma 3.4 (a representation into `GL_n(ℤ[ζ_N])` with `γ_∞ ↦ C((X − 1)^n)`, equivalent over `ℂ`
  to the hypergeometric one, proved there by Beukers–Heckman Theorem 3.5): the source of the
  order `g_0 g_1 g_∞ = 1` and of the companion normal form `BA⁻¹` with a single nontrivial column
  used in 3.4 (iv).  The field form of 3.4 is this roadmap's generalisation of Beukers–Heckman
  Theorem 3.5.
- N. M. Katz, *Exponential sums and differential equations*, Ann. of Math. Studies **124**,
  Princeton, 1990.  Chapter 8 (hypergeometric sheaves; 8.2.7 the exponential sum; 8.2.1 and §5.6
  Kummer pullback).  Cited.
- N. M. Katz, *Rigid local systems*, Ann. of Math. Studies **139**, Princeton, 1996.  Cited for
  rigidity.
- R. Fedorov, "Variations of Hodge structures for hypergeometric differential operators and
  parabolic Higgs bundles", *Int. Math. Res. Not.* 2018, [DOI](https://doi.org/10.1093/imrn/rnx044),
  [arXiv:1505.01704](https://arxiv.org/abs/1505.01704).  Theorem 1 (Hodge numbers = zigzag).  Cited.
- A. Corti, V. Golyshev, "Hypergeometric equations and weighted projective spaces", *Sci. China
  Math.* **54** (2011), 1577–1590.  The conjecture Fedorov proves.  Cited.
- F. Jouve, F. Rodriguez Villegas, "On the bilinear structure associated to Bezoutians",
  *J. Algebra* **400** (2014), 161–184.  The Bézout form of a hypergeometric datum.  Cited for
  3.8's context; no statement of it is a target.
- K. Ono, "Values of Gaussian hypergeometric series", *Trans. Amer. Math. Soc.* **350** (1998),
  1205–1223.  Theorem 1.2 of Beukers–Cohen–Mellit is its Legendre-family count.
- M. Watkins, *Hypergeometric motives package*, Magma, 2015, and the LMFDB source
  `lmfdb/hypergm/{main.py, web_family.py, hodge.py}` with knowls `hgm.*`.  The conventions of the
  database: `t`, the Levelt matrices, `p`-parts, the zigzag plot, `mu_nu`, the determinant recipe.
- Sage, "sage.modular.hypergeometric_motive" (F. Chapoton, K. Kedlaya).  The reference
  implementation of Definition 1.1 and of Theorem 1.3 against which every number above was
  checked: `HypergeometricData(cyclotomic=(A, B))` with the LMFDB's `t` reproduces the LMFDB's
  Euler factors, and its `padic_H_value` is `q^δ H_q`.
