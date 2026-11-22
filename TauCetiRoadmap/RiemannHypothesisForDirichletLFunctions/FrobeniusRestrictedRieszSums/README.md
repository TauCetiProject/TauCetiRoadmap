# Roadmap: Frobenius-restricted Riesz sums

**Summary.** An abelian CM host is a finite abelian extension `E` of `ℚ` together with an imaginary quadratic subfield
`K`: its Galois group `G` contains the subgroup `Φ = Gal(E/K)` of index two, whose elements are the *places* of the
host, and complex conjugation `c` lies outside `Φ`. This roadmap gives such a host its Frobenius data at every prime
power, ramified primes included (the cosets of the inertia groups read through the Artin map of a cyclotomic field
containing `E`); builds the cyclic hosts attached to a primitive Dirichlet character `ψ` and an auxiliary pair of
primes `(q, d)`, with the cyclic family `𝒦(ψ)` of the primitive characters inducing the powers of `ψ`; and defines, for
a place `τ` and a weight `w : Φ → (0, ∞)`, the Frobenius-restricted Riesz sum `ℛ(a, τ, w)`: the sum over the prime
powers `p^i` of `log p` times the mean, over the Frobenius coset of `p^i`, of `2·(a/p^i − w(cgτ))₊` for the elements
`g` outside `Φ`. No automorphic form enters: this is the analytic side of the Frobenius-restricted inequality.

The headline theorems are these. (1) For every abelian CM host, every `a > 0`, `τ ∈ Φ` and
`w : Φ → (0, ∞)`, the sum
`ℛ(a, τ, w)` minus the main term `a·(log a − 1 − γ + (L′/L)(1, χ_K) − mean_{τ′∈Φ} log w(τ′))` is the average, over
the classes `g ∉ Φ` and the characters `χ` of `G`, of `conj χ(g)·w(cgτ)·G_{χ*}(a/w(cgτ))`, where `χ_K` is the quadratic
character of `K` and `G_{χ*}` the Riesz remainder of the primitive Dirichlet character of `χ` (1.2). (2) Let `ψ` be a
primitive Dirichlet character of order `o`, `C ≥ 0`, `C′` real and `ε > 0`. There is `x₁(ψ, C, C′, ε)` such that for every
`x ≥ x₁`, on every cyclic host of `ψ` with tops `Φ_top`, a thick set of density `δ_th` and weights at the scale `x`
subject to explicit size conditions, where the tops have the coset law with shares `4 : 3` between `A₀` and the other
cosets, whose Fourier coefficients are `1` and `1/(3o + 1)`, and provided the characters of the host that are trivial
on its subgroup `A₀` but do not come from `𝒦(ψ)` satisfy `|G_{χ*}(x)| ≤ x^{1/2+ε}` and `|(L′/L)(1, χ*)| ≤ C′ log x`:
the Frobenius-restricted inequality at every translate, with exponent constant `C`, for the sums of `m` differences
`ℛ − 𝔐` implies `G_1(x) + (3o + 1)^{−1}Σ_{κ≠1} Re G_κ(x) ≤ x^{1/2+(C+4)ε}` (1.9). The weights `ν̂(κ)` are the Fourier
coefficients of the coset law of the tops; for the selection of 0.7 with the profile `ω = 1` on `A₀` and `ω = ω₀ < 1`
on the other cosets they are `1` and `(1 − ω₀)/(1 + ω₀(o − 1))`, all positive. So the Frobenius-restricted inequality
at the scale `x` gives, up to factors `x^{O(ε)}`, the square-root bound at `x` for the weighted Riesz remainders of the
cyclic family. (3) There is an absolute constant `C` such that for all integers `M, L ≥ 2` some
nonempty `T ⊂ [0, M/(4L)) ∩ ℤ` with `|T| ≥ M·exp(−C·(log M · log L)^{1/2})/L` contains no pairwise distinct
`s₁, s₂, s₃` with `j(s₂ − s₁) = i(s₃ − s₁)` for integers `i ≠ j`, `0 < |i|, |j| ≤ L` (0.8); the thick sets are built
from such sets.

The roadmap builds on [ClassFieldTheory](../../ClassFieldTheory/README.md) for the theorem of Kronecker and Weber and
for Hilbert reciprocity; on [RiemannHypothesisStatementsAndConsequences](../RiemannHypothesisStatementsAndConsequences/README.md),
which supplies the Riesz remainder of a primitive character and the Riesz-sum identity for a surjection of a ray class
group, of which 1.2 is the instance for an abelian host; on
[RieszSumsOverPrimesAndExceptionalZeros](../RieszSumsOverPrimesAndExceptionalZeros/README.md) for the Lipschitz and
size bounds of the remainders and the prime number theorem with the exceptional term; and on Mathlib's Galois theory of
cyclotomic fields, its Dirichlet characters and Behrend's construction. In the family
[RiemannHypothesisForDirichletLFunctions](../README.md) the hosts, the tops, the thick sets and the implication 1.9 are
the analytic frame of the chain of theta lifts, whose output is the Frobenius-restricted inequality.

Layer 0 defines abelian CM hosts and their Frobenius data, the predicates of split ramification, inert-freeness and
host splitting, the dyadic host fields and the cyclic hosts with their Galois groups and characters, the cyclic family
and the kept characters, the places of a cyclic host (tops, thick and thin places, letters), the selection of tops with
a prescribed coset law, sets with no short relation and the thick sets built from them with their marks along Frobenius
orbits, and admissible auxiliary pairs. Layer 1 defines the Frobenius-restricted Riesz sum and its main term, writes
their difference as an average of Riesz remainders, gives the cyclic hosts a saving at the thin scales, averages over
the translates of a thick set and over the tops, and derives the square-root bound for the cyclic family from the
Frobenius-restricted inequality at every translate.

## Conventions

**Groups and indices.** Galois groups are written multiplicatively: for `g ∈ G` and subsets `S, S′ ⊂ G`,
`gS = {gs : s ∈ S}`, `SS′ = {ss′ : s ∈ S, s′ ∈ S′}`, and the orbit of `y` under `h` is `{yh^i : i ∈ ℤ}`. Places of
`Φ` and tops are written `τ`; powers of a Dirichlet character are `ψ^l`; the layer of the cyclotomic `ℤ₂`-tower is `n`;
the index `j` runs over the steps `1, …, m` of an averaged sum (1.7), and `k` is a real parameter (1.8).

**Fields.** `E` is the host (0.1): finite abelian over `ℚ` with an imaginary quadratic subfield `K`; `F = E⁺` its
maximal totally real subfield, `f = [F:ℚ]`; `c ∈ G` complex conjugation; `χ_K` the quadratic character of `K`; `f_E` the
conductor of `E` (ClassFieldTheory Layer 13 `abelianConductor`; its finite part is the least `N` with `E ⊂ ℚ(ζ_N)`,
`isLeast_absNorm_abelianConductor_finitePart`; the conductor of a primitive character `χ` is `f_χ`). Under
`SplitRamification d` (0.3) `K` is ramified only at the prime `d`; on the cyclic hosts (0.4) `q ≡ 3 (mod 8)`,
`d ≡ 7 (mod 16)`, `K = ℚ(√−d)`, and a second imaginary quadratic field `ℚ(√−q) ⊂ E` is used; `(q, d)` is the
*auxiliary pair*.

**CM type, places and Frobenius elements.** An embedding `ι₀ : E ↪ ℂ` is fixed; `Φ = Gal(E/K)` is identified with the CM
type `{ι₀∘g : g ∈ Φ}` induced from `K` (`|Φ| = f`). Elements of `Φ` are called places. In the Galois groups of abelian
fields and for Dirichlet characters, Frobenius elements are arithmetic (`Frob_p` acts as `x ↦ x^p` on residue fields),
and at a ramified prime the Frobenius datum is the coset `Fr(p^i)` of the inertia group (0.2); a primitive Dirichlet
character `κ` with `ℚ(κ) ⊂ E` is read as the character `χ_κ` of `G` with `χ_κ(art(a)) = κ(a)`, `art(a) = (ζ ↦ ζ^a)`
(0.2), so that `κ(p) = χ_κ(Frob_p)` at unramified `p`. On a cyclic host `G = A × ⟨c⟩ × ⟨σ_d⟩` (0.4 (iv)), and an
element `g ∈ G`, read through its place `pl(g)` (0.6), is a *letter*.

**Riesz remainders.** `G_χ` is the Riesz remainder of a primitive Dirichlet character (RiemannHypothesisStatementsAndConsequences §8.4a (b)):
`G_χ(y) = Σ_{n≤y} Λ(n)χ(n)(y/n − 1) + y·(L′/L)(1, χ)` for `χ ≠ 1`, and
`G_1(y) = Σ_{n≤y} Λ(n)(y/n − 1) − y log y + (1+γ)y` for the trivial character; `γ` is Euler's constant. In
`Suggested.lean`, `G_χ` is `rieszRemainder` and `(L′/L)(1, χ)` is `logDerivLAtOne`. These definitions are those of
[FormalProof], `Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/Analytic.lean` (`Formalism.HC.An.gChi`,
`Formalism.HC.An.G`, `Formalism.HC.An.logDerivativeAtOne`).

**Constants.** Exponents, densities, shares of the tops and the admissible range of `ε` are parameters, with their
constraints stated where they enter; the values of particular constructions appear only in Checks, except the coset
law of the tops in 1.7 and 1.9, which is the fixed law `ν₀` with shares `4 : 3`, the form of [FormalProof] (see
*Statements of the formal proof* below).

### Table of symbols

| Symbol | Meaning | Defined |
|---|---|---|
| `E, F = E⁺, f, c, G, f_E` | host field, its maximal totally real subfield, `[F:ℚ]`, complex conjugation, `Gal(E/ℚ)`, conductor of `E` (of a primitive `χ`: `f_χ`) | 0.1, 0.2 |
| `K, χ_K, d` | the imaginary quadratic subfield and its character; the prime of `SplitRamification d` (`K = ℚ(√−d)` on the cyclic hosts) | 0.1–0.3 |
| `Φ, ι₀, τ` | `Gal(E/K)` and the CM type it defines through `ι₀`; its elements, the places | 0.1 |
| `I_p, Frob_p, Fr(p^i), χ*, χ_κ` | inertia group, arithmetic Frobenius, Frobenius coset, primitive Dirichlet character of `χ ∈ Ĝ`; the character of `G` with `χ_κ* = κ` (`κ` primitive with `ℚ(κ) ⊂ E`) | 0.2 |
| `σ_d` | the nontrivial element of the inertia group at `d` | 0.3 |
| `SplitRamification d, InertFreeUpTo B, HostSplitting E` | host predicates: every ramified prime other than `d` splits in `K` and `I_d = {1, σ_d}`, `σ_d ∉ Φ`; no prime `p ≤ B` is inert in `K`; `4 \| f` and every place of `F` above a prime dividing `f_E` splits in `E` | 0.3 |
| `ψ, o, f_ψ, 𝒦(ψ)` | primitive Dirichlet character, its order and conductor, its cyclic family (`χ_κ`, `κ ∈ 𝒦(ψ)`, are the kept characters) | 0.4, 0.5 |
| `E_n(M, Q), N_n(M, Q), H_n(M, Q), ℚ_n` | dyadic host field, its modulus and its subgroup of `(ℤ/N_n(M, Q))^×`; the `n`-th layer of the cyclotomic `ℤ₂`-extension | 0.4 |
| `(q, d), n` | auxiliary pair, layer of the cyclotomic `ℤ₂`-tower of a cyclic host | 0.4 |
| `𝔛_n, χ_{−q}, χ_{−d}, c(ψ), n₀(ψ)` | even characters of conductor dividing `2^{n+2}`; the characters of `ℚ(√−q)` and `ℚ(√−d)`; the integer `1 ≤ c(ψ) ≤ o` and the layer with `\|A\| = c(ψ)·2^n` for `n ≥ n₀(ψ)` | 0.4 |
| `A, A₀` | `Gal(E/ℚ(√−q, √−d)) ⊂ Φ`; `A₀ = ker(ψ\|_A)`, `[A:A₀] = o` | 0.4 |
| `g_A, ε(g)` | the components of `g ∈ G = A × ⟨c⟩ × ⟨σ_d⟩` in `A` and in `{1, c, σ_d, cσ_d}` | 0.4 |
| `par_τ, pl(g)` | partner bijection `G∖Φ → Φ`, `g ↦ cgτ`; the place of a letter `g` (`g` or `cg`) | 0.6 |
| `Φ_top, 𝒯, δ_th, u₀` | tops `Φ_top ⊂ A`, thick set `𝒯 ⊂ A₀`, `\|𝒯\|/\|A\|`, a translate (thick places `cσ_d u₀𝒯`, thick letters `cσ_d u₀𝒯 ⊔ σ_d u₀𝒯`) | 0.6, 0.8a |
| `ν, ν₀, ω, ω₀, δ_top, η_top` | coset law, the coset law with shares `4 : 3` of the tops of 1.7, coset profile and its lower bound, selection density, precision of the coset law of the tops | 0.7, 1.7 |
| `ℛ, 𝔐, ℭ` | Frobenius-restricted Riesz sum, its main term, the character average | 1.1, 1.2 |
| `γ` | Euler's constant | Conventions |
| `G_χ, G_1` | Riesz remainders of a primitive `χ ≠ 1` and of the trivial character | Conventions |
| `c_ex, c_box` | a gap for the exceptional zeros of the real characters of a cyclic host; the gap of the thin-scale box hypothesis | 1.4 |
| `C_Λ, s_th, ν̂` | Lipschitz constant of the remainders (RieszSumsOverPrimesAndExceptionalZeros §1.4h (b′)–(c′)), thin-scale saving, Fourier coefficients of `ν` | 1.7, 1.4, 1.6 |
| `𝔄, 𝔜_{ν₀}(x), 𝔔_x, x₁` | averaged sum of the `m` differences, the family sum `G_1(x) + (3o + 1)^{−1}Σ_{κ≠1} Re G_κ(x)`, the logarithmic size of 1.7, the threshold of 1.9 | 1.7, 1.9 |

**Statements of the formal proof.** Where a target names [FormalProof], the form that proof establishes is recorded at the target: its
hypotheses, ranges and constants are those of the proof, including restrictions that the route written here does not
visibly use. A wider or sharper form stated beside it is this roadmap's own, proved by the route written here, and is not in
[FormalProof].

## Layer 0: Abelian CM hosts and their Frobenius data

The host is a finite abelian extension of `ℚ` with an imaginary quadratic subfield `K`; such a field is a CM field, and
`K` fixes a CM type. This layer gives the host its Frobenius data at every prime power, ramified primes included, and
reads Dirichlet characters as characters of its Galois group (0.2); it states the predicate under which the
Frobenius-restricted sums of Layer 1 become sums over the odd powers of the primes inert in `K` and the powers of one
prime `d`, each with a single cap, the predicate that no small prime is inert in `K`, and a splitting condition on the
places above the conductor (0.3); it defines the dyadic host fields and builds from them the cyclic hosts attached to a
primitive Dirichlet character and an auxiliary pair of primes, with their Galois groups, characters and splitting (0.4,
0.5); it names the places of a cyclic host (tops, thick and thin places, the partner map), the places of
the letters of a Frobenius orbit, and the two kinds of primes inert in `K` (0.6); and it gives two combinatorial
constructions on the Galois group: tops with prescribed coset shares and few bad tops in a weighted count (0.7), and
thick sets without short relations (0.8), with what they give along orbits (0.8a) and along the words of Frobenius
orbits (0.8b). Admissible auxiliary pairs (0.9) satisfy the hypotheses of the cyclic hosts, leave no prime up to a given
bound inert in `K`, and give hosts with the splitting condition from a layer of the tower bounded by their `2`-adic
valuations on.

### 0.1 Abelian CM hosts

*Definition.* An *abelian CM host* is a number field `E`, Galois over `ℚ` with abelian
group `G = Gal(E/ℚ)`, together with an imaginary quadratic subfield `K ⊂ E` and an embedding `ι₀ : E ↪ ℂ`. Its
attached data: complex conjugation `c ∈ G`, the element with `ι₀ ∘ c = conj ∘ ι₀` (it does not depend on `ι₀`,
since `G` is abelian); `F = E^c = E⁺` and `f = [F : ℚ]`; the subgroup `Φ = Gal(E/K)`, whose elements are the
*places* of the host, written `τ`; and `χ_K`, the character of `G` with kernel `Φ` (identified in 0.2 with the
quadratic Dirichlet character of `K`).

*API.* (i) `E` is a CM field (Mathlib's `NumberField.IsCMField`) with maximal totally real subfield `F` and complex
conjugation `c`; no CM hypothesis is imposed, it follows from `K ⊂ E`. (ii) `c ∉ Φ`, `[G : Φ] = 2`, `G = Φ ⊔ cΦ`,
`|Φ| = f` and `|G| = 2f`. (iii) `{ι₀ ∘ g : g ∈ Φ}` is a CM type of `E`: it is the set of embeddings of `E` whose
restriction to `K` is `ι₀|_K`, and it contains exactly one embedding of each pair `{ι, conj ∘ ι}`; it is the CM type
induced from `(K, ι₀|_K)`. (iv) If `E/F` is unramified at every finite place, then `f` is even.

*Route.* (i) `E` is Galois over `ℚ` and contains the non-real field `K`, so it has no real embedding; a totally
complex abelian extension of `ℚ` is CM (`NumberField.IsCMField.of_isAbelianGalois`), with central complex
conjugation. (ii) `c` restricts to the nontrivial automorphism of `K`; `[G : Φ] = [K : ℚ] = 2` and
`|Φ| = [E : K] = [E : ℚ]/2 = [F : ℚ]`. (iii) `ι₀ ∘ g` restricts to `ι₀|_K` exactly when `g ∈ Φ`, and
`conj ∘ ι₀ ∘ g = ι₀ ∘ cg` with `cg ∉ Φ` for `g ∈ Φ`. (iv) Write `E = F(√D)` with `D ∈ F` totally negative. At a
finite place `v` of `F` unramified in `E` the unit `−1` is a norm from `E_v` (local reciprocity sends units into
inertia), so the Hilbert symbol `(−1, D)_v` is `1`; at each of the `f` real places it is `−1`, since `D < 0` there.
Hilbert reciprocity gives `(−1)^f = 1`.

*Checks.*
- `E = ℚ(ζ₈)` with `σ_a(ζ₈) = ζ₈^a` and `K = ℚ(i)`: `Φ = {σ₁, σ₅}`, `c = σ₇ ∉ Φ`, and `{ι₀, ι₀ ∘ σ₅}` meets each
  conjugate pair `{ι₀, ι₀ ∘ σ₇}`, `{ι₀ ∘ σ₅, ι₀ ∘ σ₃}` once. A real quadratic subfield in place of `K` gives no CM
  type: `Gal(E/ℚ(√2)) = {σ₁, σ₇}` contains `c`.
- `E = ℚ(√−3, √−7)`: `F = ℚ(√21)`, `f = 2`, and `E/F` is unramified at every finite place (`2` is unramified in
  `E`, and the inertia groups at `3` and `7` have order `2` and do not contain `c`), as (iv) requires. For
  `E = K = ℚ(i)`, `f = 1` is odd and `E/F` is ramified at `2`.
- (iii) is the case `E₀ = K`, `Φ₀ = {ι₀|_K}` of the CM type induced from a CM subalgebra in ShimuraVarieties §5.1
  (`CMType`): `φ` lies in the induced type iff `φ|_K = ι₀|_K`.

*KNOWN* (elementary; Hilbert reciprocity; (iv) is this roadmap's own, not a statement of [FormalProof]).
*Needs:* Mathlib `NumberField.IsCMField`,
`NumberField.IsCMField.of_isAbelianGalois`; ClassFieldTheory Layer 7 (`mem_inertiaSubgroup_of_mk_eq_artinMap`,
`ker_artinMap_eq_iInf`: units are norms from unramified extensions), Layer 14 (`hilbertProductFormula`,
`TauCeti.hilbertSymbol_productFormula`).

### 0.2 Frobenius cosets and the primitive character of a character of the host

*Definitions.* Let `E/ℚ` be a finite abelian extension with group `G` (for
instance the field of an abelian CM host), `f_E` its conductor, and `N ≥ 1` with `E ⊂ ℚ(ζ_N)`. The *Artin map* is
`art_N : (ℤ/N)^× → G`, `a ↦ σ_a|_E`, where `σ_a(ζ_N) = ζ_N^a`; it is the ray-class Artin map `rayClassArtinMap` of
ClassFieldTheory Layer 12 for `E/ℚ` at the admissible modulus `N·∞`, read on `(ℤ/N)^×` through
AnalyticNumberTheoryPartI §0.30, since both send a prime `ℓ ∤ N` to `σ_ℓ|_E` (ClassFieldTheory W.5,
`globalArtinMap_cyclotomic_prime`). For a prime `p` write `N = p^v N′` with `p ∤ N′`, and
put `I_p = art_N{a : a ≡ 1 (mod N′)}` and, for `i ≥ 1`, the *Frobenius coset* `Fr(p^i) = art_N{a : a ≡ p^i (mod N′)}`.
For a character `χ` of `G`, `χ*` is the primitive Dirichlet character inducing `χ ∘ art_N`.

*Statements.* (i) `art_N` is surjective; for `N | N″`, `art_{N″}` is `art_N` composed with reduction; `I_p`,
`Fr(p^i)` and `χ*` do not depend on `N`. (ii) `I_p` is the inertia group at every prime of `E` above `p`; `Fr(p^i)`
is the coset `Frob_p^i I_p` of `I_p`, `Frob_p` the arithmetic Frobenius in `D_p/I_p`; `Fr(p^i)Fr(p^j) = Fr(p^{i+j})`
and `|Fr(p^i)| = |I_p|`; if `p ∤ N`, then `I_p = 1` and `Fr(p^i) = {art_N(p)^i}`. (iii) For every prime `p` and
`i ≥ 1`,
`χ*(p^i) = |I_p|^{−1} Σ_{g ∈ Fr(p^i)} χ(g)`;
in particular `p` divides the conductor of `χ*` exactly when `χ` is nontrivial on `I_p`. (iv) `χ ↦ χ*` is injective;
`(χ̄)* = conj χ*`; `(χ₁χ₂)*` is the primitive character inducing `χ₁*χ₂*`; the conductor of `χ*` divides `f_E`. For an
abelian CM host, `χ_K*` is the quadratic character of `K`, `n ↦ (d_K/n)` (Kronecker symbol, `d_K` the discriminant
of `K`); below `χ_K` denotes both. (v) *Image.* `χ*` runs over exactly the primitive Dirichlet characters `κ` whose
field `ℚ(κ)` (the subfield of `ℚ(ζ_{f_κ})` fixed by the kernel of `κ`, read on `Gal(ℚ(ζ_{f_κ})/ℚ) ≅ (ℤ/f_κ)^×`)
lies in `E`: the image is the group of primitive characters of `E` (the group `X(E)` of
QuasiRiemannHypothesis §5.4). For such `κ` write `χ_κ` for the character of `G` with `χ_κ* = κ`, so
that `κ(a) = χ_κ(art_N(a))` for `a` prime to `N`; a primitive Dirichlet character with `ℚ(κ) ⊂ E` is *regarded as a
character of `G`* through `κ ↦ χ_κ`.
The injectivity and multiplicativity of `χ ↦ χ*` in (iv), the image in (v) and the independence of that image from `N`
(part of (i)) are statements of QuasiRiemannHypothesis §5.4 for the abelian field `E`. (iii) is the case `F = ℚ` of the
one-dimensional comparison of AnalyticNumberTheoryPartI §2.18a, read through AnalyticNumberTheoryPartI §0.30: the
Hecke character of `χ` there is `χ*`, both being primitive and equal to `χ(art_N(p))` at the primes `p ∤ N` by (ii).

For a subfield `E` of a cyclotomic field `ℚ(ζ_N)`, `Suggested.lean` defines `art_N`, the Frobenius cosets, the inertia groups and `χ*` as `artinMap`, `frobCoset`, `inertia` and `primitiveChar`.

*Route.* By Kronecker–Weber `E ⊂ ℚ(ζ_N)` for `N = f_E`, and `Gal(ℚ(ζ_N)/ℚ) ≅ (ℤ/N)^×`
(`IsCyclotomicExtension.Rat.galEquivZMod`). In `ℚ(ζ_N) = ℚ(ζ_{p^v})ℚ(ζ_{N′})` the prime `p` is totally ramified in
the first factor and unramified in the second, with Frobenius `ζ ↦ ζ^p`
(`IsCyclotomicExtension.Rat.galEquivZMod_stabilizer`, `IsCyclotomicExtension.Rat.inertiaDegIn_eq`); so in
`(ℤ/p^v)^× × (ℤ/N′)^×` the inertia group is the first factor and the elements acting as `x ↦ x^{p^i}` on the residue
fields are the `a ≡ p^i (mod N′)`. Inertia groups and Frobenius cosets of `E` are the images under restriction.
(iii) If `χ|_{I_p} = 1`, `χ ∘ art_N` factors through `(ℤ/N′)^×`, the conductor of `χ*` is prime to `p`, and
`χ*(p^i)` is the common value of `χ` on `Fr(p^i)`; otherwise `p` divides the conductor, `χ*(p) = 0`, and the mean of
the nontrivial character `χ|_{I_p}` over a coset of `I_p` is `0`. (i), (iv): uniqueness of the primitive character
attached to a character of `G_ℚ` with open kernel (ArithmeticGaloisRepresentations §2.3); `χ_K*` takes the value
`χ_K(Frob_p) = ±1` at the primes `p` split or inert in `K`. (v) The characters of `G` are the characters of
`(ℤ/N)^×` trivial on `ker art_N = Gal(ℚ(ζ_N)/E)`; the character modulo `N` induced by a primitive `κ` with `f_κ | N`
is trivial on that subgroup exactly when `ℚ(κ) ⊂ E` (Galois correspondence in `ℚ(ζ_N)`,
`IsCyclotomicExtension.Rat.intermediateFieldEquivSubgroupChar`); a `κ` with `ℚ(κ) ⊂ E` has `f_κ | f_E`, and so has the
conductor of every `χ*` in (iv) (ClassFieldTheory Layer 13, `abelianConductor_eq_lcm`).

*Checks.*
- The clause `p ∤ N` of (ii) is the case `K = ℚ` of Chebotarev Layer 4 (the arithmetic Frobenius of `ℚ(ζ_N)` at `p`
  sends `ζ_N` to `ζ_N^p`), restricted to `E` by Chebotarev Layer 8.1 (`artinSymbol_map_restrictNormalHom`); the
  clauses at the ramified primes go beyond it.
- `E = ℚ(i)`, `p = 2`: `I_2 = G = {1, c}` and `Fr(2^i) = G`, so the mean of `χ_K` over `Fr(2^i)` is `0 = χ₋₄(2)`.
  Choosing one element of `G` as "the Frobenius" at the ramified prime `2` would give `χ₋₄(2) = ±1`.
- `E = ℚ(ζ₅)`, `p = 5`: `I_5 = G` and `Fr(5^i) = G`, so `χ*(5) = 0` for every `χ ≠ 1` and `1*(5) = 1`; for `p ≠ 5`,
  `Fr(p^i) = {σ_p^i}` and `χ*(p) = χ(σ_p)`. By (v) the characters of `G` are the four primitive characters of
  conductor dividing `5`; `χ₋₄` is not one of them, as `ℚ(i) ⊄ ℚ(ζ₅)`.

*KNOWN* (Kronecker–Weber with conductor: Washington, *Introduction to Cyclotomic Fields*, ch. 14; characters of
abelian fields: ibid., ch. 3; (ii), (iii): [FormalProof],
`Development/AutomorphicArithmetic/PrimitiveCosets/PrimRead.lean` (`UpperTheory.Comparison₂.prim_read`)).
*Needs:* 0.1; ClassFieldTheory Layer 13 (`kroneckerWeber`, `abelianConductor_eq_lcm`);
ArithmeticGaloisRepresentations §2.3 (`dirichletCharacterToGalois`); QuasiRiemannHypothesis §5.4;
AnalyticNumberTheoryPartI §§0.30, 2.18a; Mathlib `IsCyclotomicExtension.Rat.galEquivZMod`,
`IsCyclotomicExtension.Rat.galEquivZMod_stabilizer`, `IsCyclotomicExtension.Rat.inertiaDegIn_eq`,
`IsCyclotomicExtension.Rat.intermediateFieldEquivSubgroupChar`, `DirichletCharacter.primitiveCharacter`.

### 0.3 Split ramification, inert-free hosts and host splitting

*Definitions.* For an abelian CM host and a prime `d`, `SplitRamification d` holds when every prime `p ≠ d` ramified in
`E` splits in `K`, and `I_d` has order `2` and is not contained in `Φ`; its nontrivial element is written `σ_d`.
Equivalently: `I_d = {1, σ_d}` with `σ_d ∉ Φ`, and `I_p ⊂ Φ` and `Fr(p) ⊂ Φ` for every other ramified prime `p`. For a
real `B`, the host is *inert-free up to `B`* (`InertFreeUpTo B`) if no prime `p ≤ B` is inert in `K`, that is, every
prime inert in `K` exceeds `B`. The host satisfies `HostSplitting E` if `4 | f` and every place of `F` above a prime
dividing `f_E` splits in `E`.

*Lemma.* (a) For every host and every prime `p` unramified in `E`: `Frob_p ∉ Φ` iff `p` is inert in `K` (iff
`χ_K(p) = −1`), and then `Frob_p^i ∉ Φ` iff `i` is odd. (b) Under `SplitRamification d`: `K` is ramified only at
`d`, so `K = ℚ(√−d)` with `d ≡ 3 (mod 4)` if `d` is odd, and `K ∈ {ℚ(i), ℚ(√−2)}` if `d = 2`; the prime powers `p^i`
with `Fr(p^i) ⊄ Φ` are exactly the `p^i` with `p` unramified in `E`, inert in `K` and `i` odd, and all `d^i`,
`i ≥ 1`; and `Fr(d^i) ∖ Φ` is a single element. (c) For every host, the places of `F` above `p` are unramified in
`E` iff `c ∉ I_p`; under `SplitRamification d`, `E/F` is unramified at every finite place iff `σ_d ≠ c`. (d) The
host is inert-free up to `B` iff `χ_K(p) ≠ −1` for every prime `p ≤ B`; under `SplitRamification d` the primes `p`
ramified in `E` never violate it (they split in `K` or equal `d`). (e) For every host and every prime `p` split in `K`,
every place of `F` above `p` splits in `E`; the places of `F` above a prime `p` split in `E` iff `c` does not lie in the
decomposition group `D_p = I_p⟨Fr(p)⟩`. Under `SplitRamification d`, therefore, `HostSplitting E` holds iff `4 | f` and
`c ∉ D_d`.

*Route.* (a) `Frob_p` generates the decomposition group and `Φ = ker χ_K`, so `Frob_p ∈ Φ` iff `p` splits in `K`,
and `χ_K(Frob_p^i) = (−1)^i` for `p` inert. (b) For a ramified `p ≠ d`, `Fr(p^i)` lies in the decomposition group
`D_p = I_p⟨Fr(p)⟩`, which fixes `K`; `Fr(d^i) = g{1, σ_d}` meets each coset of the index-two subgroup `Φ` once,
since `σ_d ∉ Φ`; a prime ramified in `K` is ramified in `E` and does not split in `K`, so it is `d`; an imaginary
quadratic field ramified at one odd prime `d` only has discriminant `−d`, and one ramified at `2` only has
discriminant `−4` or `−8` (AnalyticNumberTheoryPartI §0.34a, for the odd real primitive character `χ_K`). (c) The
inertia group of `E/F` at a place above `p` is `I_p ∩ {1, c}`; for `p ≠ d`,
`I_p ⊂ Φ` does not contain `c`. (d) From (a) and the definition of `SplitRamification`. (e) `K ⊄ F`, so `E = FK` and
`E ⊗_F F_v ≅ F_v ⊗_{ℚ_p} (K ⊗ ℚ_p)` for a place `v | p` of `F`, which is `F_v × F_v` when `p` splits in `K`. The
decomposition group of `E/F` at a place above `p` is `D_p ∩ {1, c}`. Under `SplitRamification d` the primes dividing
`f_E` other than `d` are ramified in `E` and split in `K`.

*Checks.*
- `E = ℚ(√−3, √−7)`: with `K = ℚ(√−3)` and `d = 3` the predicate holds (`7` splits in `ℚ(√−3)`, as
  `−3 ≡ 2² (mod 7)`; `I_3` has order `2` and moves `√−3`), and `σ_3 ≠ c` because `σ_3` fixes `√−7`, so `E/F` is
  unramified at every finite place. With `K = ℚ(√−7)` and `d = 7` it fails: the ramified prime `3` is inert in
  `ℚ(√−7)`. `HostSplitting E` fails for `K = ℚ(√−3)` twice: `f = 2`, and `D_3 = G ∋ c` (`σ_3` and an element acting
  nontrivially on `√−7`, as `(−7/3) = −1`), so the place of `F = ℚ(√21)` above `3` is inert in `E` although `E/F` is
  unramified there.
- For `p` unramified and inert in `K`, `Fr(p²) = {Frob_p²} ⊂ Φ`: even powers of inert primes never contribute to
  the sums of Layer 1.
- `E = K = ℚ(i)` satisfies `SplitRamification 2` (`I_2 = G = {1, c}`, `c ∉ Φ = {1}`), and `σ_2 = c`: `E/F` is
  ramified at `2`, as (c) says. It is inert-free up to `2` but not up to `3` (`3` is inert in `ℚ(i)`).

*KNOWN* (elementary; the definitions: [FormalProof],
`Development/AutomorphicArithmetic/DedekindLFunctions/SplitInertia.lean` (`Deduction.CH.HostFactsS`)).
*Needs:* 0.1, 0.2; AnalyticNumberTheoryPartI §0.34a.

### 0.4 Dyadic host fields and cyclic hosts

*Definition (dyadic host fields).* Let `M` be a finite abelian extension of `ℚ` with
conductor `f_M`, `Q` a finite set of primes with `q ≡ 3 (mod 4)` and `q ∤ 2f_M` for every `q ∈ Q`, and `n ≥ 0`. Put
`N_n(M, Q) = lcm(2^{n+2}, f_M)·∏_{q∈Q} q`, let `H_n(M, Q) ⊂ (ℤ/N_n(M, Q))^×` be the subgroup of the `a` with
`a ≡ ±1 (mod 2^{n+2})`, `σ_a|_M = id` and `(a/q) = 1` for every `q ∈ Q`, and let `E_n(M, Q)` be the fixed field of
`H_n(M, Q)` in `ℚ(ζ_N)`, `N = N_n(M, Q)`, through `Gal(ℚ(ζ_N)/ℚ) ≅ (ℤ/N)^×`, `σ_a(ζ_N) = ζ_N^a`. For a primitive
Dirichlet character `ψ` write `E_n(ψ, Q) = E_n(ℚ(ψ), Q)` and `N_n(ψ, Q) = N_n(ℚ(ψ), Q)`, `ℚ(ψ)` the field cut out by
`ψ`; then `f_{ℚ(ψ)} = f_ψ` and `[ℚ(ψ) : ℚ] = ord ψ`. Write `ℚ_n = ℚ(ζ_{2^{n+2}})⁺` for the `n`-th layer of the
cyclotomic `ℤ₂`-extension of `ℚ`.

*API (host fields).* (a) `E_n(M, Q) = ℚ_n·M·∏_{q∈Q} ℚ(√−q)`. (b) `art_N` (0.2) induces
`Gal(E_n(M, Q)/ℚ) ≅ (ℤ/N)^×/H_n(M, Q)`; the Frobenius at `p ∤ N` is the class of `p`. (c) The conductor of `E_n(M, Q)`
divides `N_n(M, Q)`, with equality for `n ≥ 1`, and `[E_n(M, Q) : ℚ]` divides `2^{n+|Q|}[M : ℚ]`. (d)
`E_n(M, Q) ⊂ E_{n+1}(M, Q)`, `E_n(M, Q) ⊂ E_n(M, Q′)` for `Q ⊂ Q′`, and `E_n(M, Q) = E_0(M, Q)·ℚ_n`. (e) If `Q ≠ ∅` or `M`
is imaginary, `E_n(M, Q)` is a CM field with complex conjugation `σ_{−1}|_E = art_N(−1)`. (f) The characters of
`Gal(E_n(M, Q)/ℚ)`, read through `art_N`, are the Dirichlet characters modulo `N` trivial on `H_n(M, Q)`.
(g) Let `c = art_N(−1)` (complex conjugation, as in (e)) and let `p ∤ N` be a prime (for `n ≥ 1` these are, by (c),
exactly the primes unramified in `E_n(M, Q)`). If `c·Frob_p` has odd order in `Gal(E_n(M, Q)/ℚ)`, then
`p ≡ ±1 (mod 2^{n+2})`.

*Statement (cyclic hosts).* Let `ψ` be a primitive Dirichlet character of conductor `f_ψ` and order `o`, `n ≥ 2` an
integer, and `q`, `d` primes with `q ≡ 3 (mod 8)`, `d ≡ 7 (mod 16)`, `q, d ∤ f_ψ`, `(−d/q) = 1`, and `(−d/ℓ) = 1` for
every odd prime `ℓ | f_ψ`; `(q, d)` is the *auxiliary pair*. Let `E = E_n(ψ, {q, d}) = ℚ_n·ℚ(ψ)·ℚ(√−q)·ℚ(√−d)` and
`K = ℚ(√−d)`. Write `χ_{−q} = (·/q)` and `χ_{−d} = (·/d)` (Legendre symbols, the quadratic characters of
`ℚ(√−q)` and `ℚ(√−d)`), `𝔛_n` for the cyclic group of order `2^n` of even Dirichlet characters of conductor dividing
`2^{n+2}` (the characters of `ℚ_n`), and regard `ψ`, `χ_{−q}`, `χ_{−d}` and the elements of `𝔛_n` as characters of
`G` (0.2(v)). Put `A = Gal(E/ℚ(√−q, √−d))` and `A₀ = ker(ψ|_A)`, and let `σ_d` be the nontrivial element of `I_d`.
Then:
(i) `(E, K, ι₀)` is an abelian CM host with `SplitRamification d` and `σ_d ≠ c`; hence `E/F` is unramified at every
finite place and `f` is even.
(ii) The characters of `G` form the group generated by `𝔛_n`, `ψ`, `χ_{−q}` and `χ_{−d}`, and
`⟨χ_{−q}, χ_{−d}⟩ ∩ 𝔛_n⟨ψ⟩ = 1`. `Φ = ker χ_{−d}`, `A = ker χ_{−q} ∩ ker χ_{−d} ⊂ Φ`, `G/A ≅ (ℤ/2)²` is generated by
the images of `c` and `σ_d`, and `Φ = A ⊔ cσ_d A`.
(iii) Restriction is an isomorphism `A ≅ Gal(ℚ_n ℚ(ψ)/ℚ)`; `[A : A₀] = o`; `A₀` is cyclic and restriction maps it
injectively into `Gal(ℚ_n/ℚ)`; there are an integer `c(ψ)` with `1 ≤ c(ψ) ≤ o` and a layer `n₀(ψ)` such that
`|A| = c(ψ)·2^n` for every `n ≥ n₀(ψ)`; `2^n` divides `|A|`, and `f = 2|A|`. The conductor `f_E` is at most
`2^{n+2}·f_ψ·q·d`.
(iv) `σ_d` acts trivially on `ℚ_n ℚ(ψ) ℚ(√−q)`, so every character of `G` unramified at `d` (every power of `ψ`,
every element of `𝔛_n`, and `χ_{−q}`) is trivial on `σ_d`; and `c ∉ A`, `σ_d ∉ A`, `cσ_d ∈ Φ ∖ A`. Moreover
`G = A × ⟨c⟩ × ⟨σ_d⟩`: every `g ∈ G` is uniquely `g = g_A·ε(g)` with `g_A ∈ A` and `ε(g) ∈ {1, c, σ_d, cσ_d}`, and
`g ∈ Φ` iff `ε(g) ∈ {1, cσ_d}`.
(v) *Small primes.* The primes `2`, `q` and the odd primes dividing `f_ψ` split in `K`, and every place of `F` above
them splits in `E` (in particular every place of `F` above `2`); so every prime inert in `K` is odd and prime to
`qf_ψ`. For real `B`, the host is inert-free up to `B` (0.3) iff `(−d/p) = 1` for every odd prime `p ≤ B` other than `d`.
(vi) *Splitting above `d`.* Since `n ≥ 2 = v₂(d + 1) − 1`, the places of `F` above `d` split in `E`; then every
place of `F` above a prime dividing `f_E` splits in `E`, `4 | f`, and the host satisfies `HostSplitting E` (0.3).
Clauses (i)–(v) hold with the same route for every `n ≥ 0` and for `q ≡ 3 (mod 4)`, `d ≡ 7 (mod 8)`, and (vi) from the
layer `n ≥ v₂(d + 1) − 1` on; [FormalProof] treats the hosts with `q ≡ 3 (mod 8)`, `d ≡ 7 (mod 16)` and `n ≥ 2`, for
which `v₂(d + 1) − 1 = 2`.

In `Suggested.lean`, `hostLevel` is `N_n(ψ, {q, d})`, `cyclicHostSubgroup` is `H_n(ψ, {q, d})` (with `residueSquares` for the conditions `(a/q) = (a/d) = 1`), `cyclicHost` is `E_n(ψ, {q, d})`, `cyclicHostPlaces`, `cyclicHostA` and `cyclicHostA₀` are `Φ`, `A` and `A₀`, and `IsAuxiliaryPair` collects the hypotheses on `(q, d)`.

*Route.* (Host fields.) (a) Each condition on `a` cuts out one of the listed fields: `a ≡ ±1 (mod 2^{n+2})` the field
`ℚ_n` (IntegralIwasawaTheory §0.2: `ℚ_n ⊂ ℚ(μ_{2^{n+2}})`), `σ_a|_M = id` the field `M`, and `(a/q) = 1` the quadratic
subfield of `ℚ(ζ_q)`, which is `ℚ(√−q)` as `q ≡ 3 (mod 4)`; the fixed field of an intersection of subgroups is the
compositum. (b) Galois correspondence in `ℚ(ζ_N)` and 0.2 (ii). (c) Conductors of composita are least common multiples
(ClassFieldTheory Layer 13, `abelianConductor_eq_lcm`); `ℚ_n` has conductor `2^{n+2}` for `n ≥ 1`; the quotient by
`H_n(M, Q)` embeds in the product of the images of the three kinds of conditions. (d) From (a). (e) `σ_{−1}` is
central, induces complex
conjugation, and is nontrivial on `ℚ(√−q)` and on an imaginary `M`. (f) From (b). (g) By (a) `ℚ_n ⊂ E_n(M, Q)`, and
`Gal(ℚ_n/ℚ) ≅ (ℤ/2^{n+2})^×/{±1}` is cyclic of order `2^n`; by (b) `Frob_p = art_N(p)` restricts to `ℚ_n` as the class
of `p`, and `c` as the class of `−1`, which is trivial; so the odd-order element `c·Frob_p` restricts to the class of
`p` and to the identity of this `2`-group. (Cyclic hosts.) (ii) By (f) the
characters of `G` are the Dirichlet characters modulo `N = lcm(2^{n+2}, f_ψ)qd` trivial on `H_n(ψ, {q, d})`; that
subgroup is the intersection of the kernels of `𝔛_n`, `ψ`, `χ_{−q}` and `χ_{−d}`, so its annihilator is the group they
generate; the conductors (powers of `2`, divisors of `f_ψ`, `q`, `d`) make `⟨χ_{−q}, χ_{−d}⟩` meet `𝔛_n⟨ψ⟩` trivially.
`c = art(−1)` and `σ_d = art(a)` with `a ≡ 1 (mod N/d)` and `(a/d) = −1` are read off on the generators, using that
`χ_{−q}` and `χ_{−d}` are odd. (i) The ramified primes are the primes dividing `f_E`: `2` when `2 | f_E` (for every
`n ≥ 1`, and for `n = 0` exactly when `2 | f_ψ`, `f_E` being then `lcm(f_ψ, q, d)`), the odd primes dividing `f_ψ`, `q` and
`d`; the first three kinds split in `K` because `d ≡ 7 (mod 8)`, `(−d/ℓ) = 1` and `(−d/q) = 1` (quadratic reciprocity
translates these into values of `χ_{−d}`); `I_d = {1, σ_d}` because `χ_{−d}` is the only generator ramified at `d`;
0.3(c) and 0.1(iv) give the rest. (iii) The characters of `A` are the restrictions of `𝔛_n⟨ψ⟩`, on which restriction
is injective, so `|A| = |𝔛_n⟨ψ⟩| = |𝔛_n|·o/|𝔛_n ∩ ⟨ψ⟩|`, and `𝔛_n ∩ ⟨ψ⟩` consists of the `ψ^l` that are even of
conductor dividing `2^{n+2}`; the conductor of `ψ^l` divides `f_ψ`, so for `n + 2 ≥ v₂(f_ψ)` this condition is "even
of `2`-power conductor", which does not involve `n`. The characters of `A/A₀` are the powers of `ψ|_A`, of order `o`;
the characters of `A₀` are a quotient of the cyclic group `𝔛_n`, so `A₀` is cyclic and meets the kernel of the
restriction to `Gal(ℚ_n/ℚ)` trivially. `𝔛_n` restricts injectively to `A`, so `2^n` divides `|A|`. The conductor is
(c), and `|A| ≤ |𝔛_n|·o = 2^n·o`. (iv) From (ii): `c` and `σ_d` have order `2` and commute, `c`, `σ_d` and `cσ_d` lie
outside `A`, so `⟨c, σ_d⟩ ≅ (ℤ/2)²` meets `A` trivially and `|A|·4 = |G|`; `Φ = A ⊔ cσ_dA`. (v) `2` splits since
`−d ≡ 1 (mod 8)`; `q` and the odd `ℓ | f_ψ` by the hypotheses; the places of `F` above them split by 0.3(e); an odd
prime `p ≠ d` unramified in `E` is inert in `K` iff `(−d/p) = −1` (Multiquadratic Layer 1), and the odd ramified primes
other than `d` split.
(vi) By 0.3(e) it suffices that `c ∉ D_d`. Let `φ ∈ Fr(d)`, so `D_d = {σ_d^iφ^k}`. On `ℚ(√−q)`, `σ_d` acts trivially and
`φ` by `χ_{−q}(d) = (d/q) = −(−d/q) = −1`, as `c` does; so `σ_d^iφ^k = c` forces `k` odd. On the real field `ℚ_n`, `c` and
`σ_d` act trivially and `φ` as the class of `d` in `(ℤ/2^{n+2})^×/{±1}`, cyclic of order `2^n` and generated by `5`;
since `−d ≡ 1` modulo `2^s` exactly, `s = v₂(d + 1)`, that class is `5^{2^{s−2}u}` with `u` odd, of order `2^{n−s+2} ≥ 2`,
so `φ^k` is nontrivial on `ℚ_n` for odd `k`. The other primes dividing `f_E` are those of (v). `4 | f` because
`2^{n+1}` divides `f = 2|A|` (iii).

*Checks.*
- Host fields: `E_0(ℚ, ∅) = ℚ` (as `ℚ(ζ₄)⁺ = ℚ`), `E_1(ℚ, ∅) = ℚ(√2)` of conductor `8`, and `E_n(ℚ, {3})` has degree
  `2^{n+1}`. `q ≡ 3 (mod 4)` is needed for (e): for `q ≡ 1 (mod 4)` the Legendre condition cuts out the real field
  `ℚ(√q)`, and `E_n(ℚ, {q})` would be totally real; for even `ψ`, `E_n(ψ, ∅)` is totally real, so (e) needs one of its
  hypotheses.
- `ψ = 1`, `n = 2`, `(q, d) = (19, 526679)`, both prime, `d + 1 = 2³·3²·5·7·11·19`: the hypotheses hold (`19 | d + 1`
  gives `(−d/19) = 1`); `E = ℚ(ζ₁₆)⁺·ℚ(√−19)·ℚ(√−526679)` has conductor `16·19·526679`, `|G| = 16`, `|A| = 4 = 2^n`,
  `A₀ = A`, `o = 1` and `f = 8`; every prime `≤ 19` splits in `K` (`2` as `d ≡ 7 (mod 8)`; `3, 5, 7, 11, 19` divide
  `d + 1`; `(−d/13) = (3/13) = 1`, `(−d/17) = (15/17) = 1`) and `23` is inert (`(−d/23) = (21/23) = −1`), so this host is
  inert-free up to `22`; and `n = 2 = v₂(d + 1) − 1`, so (vi) applies.
- `ψ = 1`, `n = 1`, `(q, d) = (3, 71)`, a layer below the range `n ≥ 2`: the conditions on the pair hold
  (`(−71/3) = 1`), `E = ℚ(√2, √−3, √−71)` has conductor
  `1704`, `|G| = 8`, `|A| = 2` and `f = 4`; the primes `3` and `5` split in `K` and `7` is inert, so this host is
  inert-free up to `6` but not up to `7`. Here `n = 1 < v₂(72) − 1`, and the conclusion of (vi) fails: `Frob_{71}` is
  trivial on `ℚ(√2)` (`(2/71) = 1`) and nontrivial on `ℚ(√−3)` (`(71/3) = −1`), as `c` is, so `c ∈ D_{71}` and the places of
  `F` above `71` are inert in `E`. The pair `(11, 7)` also satisfies the conditions on the pair (`(−7/11) = 1`), but `3` and
  `5` are inert in `ℚ(√−7)`: its hosts exist and are not inert-free up to `3`.
- `ψ = 1`, `(q, d) = (3, 47)` (`v₂(48) = 4`, so `d ≡ 15 (mod 16)`, in the wider classes after (vi)): `c ∈ D_{47}` at the
  layers `n = 1, 2` and `c ∉ D_{47}` from `n = 3 = v₂(48) − 1` on, as stated after (vi).
- `ψ` of order `4` modulo `5` (an odd character), `n = 2`, `(q, d) = (19, 526679)`: the hypotheses hold (`19` and `5`
  divide `d + 1`, so `(−d/19) = (−d/5) = 1`), `|G| = 64`, `|A| = 16` (`c(ψ) = 4`, and `|A| = 4·2^n` for every `n`, as
  `v₂(f_ψ) = 0`) and `|A₀| = 4`. With `(q, d) = (3, 23)` the hypothesis at `ℓ = 5` fails (`(−23/5) = −1`), and so does
  `SplitRamification 23`: the ramified prime `5` is inert in `ℚ(√−23)`.
- `ψ` even of conductor `16` and order `4`: every power of `ψ` is even of `2`-power conductor, so `c(ψ) = 1`, and for
  `n ≥ 2` `A ≅ Gal(ℚ_n/ℚ)` and `A₀ = A⁴` has index `4` in it: `A₀` maps into `Gal(ℚ_n/ℚ)` injectively but not onto.
  For `n = 0` and `n = 1`, `ℚ(ψ) ⊄ ℚ_n` and `|A| = 4` (`𝔛_n ∩ ⟨ψ⟩ = 1`, resp. `{1, ψ²}`), not `c(ψ)·2^n = 1`, resp.
  `2`; `|A₀| = 1`.
- `ψ = (2/·)`, even of conductor `8`: `|A| = 2` at `n = 0`, while `c(ψ)·2^0 = 1`; for `n ≥ 1`, `ψ ∈ 𝔛_n` and
  `|A| = 2^n = c(ψ)·2^n`. `ψ` even of conductor `32` and order `8`: `|A| = 8` for `0 ≤ n ≤ 3`, equal to `c(ψ)·2^n` only
  from `n = 3 = v₂(32) − 2` on.
- (iv) on the first host: `|G| = 16 = 4·|A|`, and the four elements `1, c, σ_d, cσ_d` represent `G/A`.

*KNOWN* (Galois theory of cyclotomic fields; quadratic reciprocity; the dyadic host fields `E_n(M, Q)` for a general
`(M, Q)` and their API (a)–(f) are this roadmap's own, not statements of [FormalProof], and so is (g), elementary, for
every `(M, Q)`; the cyclic hosts: [FormalProof],
`Development/AutomorphicArithmetic/CharacterBoxes/ExistsPageN.lean` (`UpperTheory.Top.IsChiField`),
`Development/AutomorphicArithmetic/CharacterBoxes/TwistForm.lean` (`UpperTheory.Top.KerChi`); (iv): [FormalProof],
`Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/ZsmulGeneratorEqZeroOfProjection.lean`
(`Formalism.HC.Frame.iod`, `Formalism.HC.Frame.placeOf`)).
*Needs:* 0.1–0.3; IntegralIwasawaTheory §0.2;
ClassFieldTheory Layer 13 (`kroneckerWeber`, `isLeast_absNorm_abelianConductor_finitePart`, `abelianConductor_eq_lcm`);
Multiquadratic Layer 1; Mathlib `IsCyclotomicExtension`,
`IntermediateField.fixedField`, `DirichletCharacter`, `NumberField.IsCMField`, `jacobiSym.quadratic_reciprocity`,
`jacobiSym.at_two`, `jacobiSym.at_neg_one`, `IsCyclotomicExtension.Rat.mem_intermediateFieldEquivSubgroupChar_iff_conductor_dvd`.

### 0.5 The cyclic family and the kept characters

*Definition.* The *cyclic family* `𝒦(ψ)` of a primitive Dirichlet
character `ψ` of order `o` is the finite set of primitive Dirichlet characters inducing the powers `ψ^l`,
`l ∈ ℤ/o`. Both are bundled primitive characters (RiemannHypothesisStatementsAndConsequences §10.3): `ψ` is a term of
`PrimitiveDirichletCharacter`, and `𝒦(ψ)` a `Finset PrimitiveDirichletCharacter`, the image of `l ↦ (ψ^l)*`. This is
the one definition of the family.
*Statements.* (i) `l ↦ (ψ^l)*` is a bijection `ℤ/o → 𝒦(ψ)`; `1, ψ ∈ 𝒦(ψ)`; `𝒦(ψ)` is closed under `κ ↦ κ̄`; every
conductor divides `f_ψ`. For a host of 0.4:
(ii) the characters of `G` trivial on `A₀` are the `4o` characters `ψ^l χ_{−q}^i χ_{−d}^j` (`l ∈ ℤ/o`,
`i, j ∈ {0, 1}`), with primitive characters `(ψ^l)*·(·/q)^i·(·/d)^j`;
(iii) the *kept* characters are those with `i = j = 0`, equivalently the characters trivial on `A₀`, on `I_q` and on
`I_d`; they are trivial on `σ_d`, and `χ ↦ χ*` is a bijection from the kept characters onto `𝒦(ψ)`; for `κ ∈ 𝒦(ψ)`
the kept character with primitive character `κ` is `χ_κ` (0.2 (v));
(iv) the other `3o` characters trivial on `A₀` (the *non-kept* ones) have primitive characters `κ·(·/q)`,
`κ·(·/d)` and `κ·(·/q)(·/d)`, `κ ∈ 𝒦(ψ)`, of conductor divisible by `q` or by `d`.

In `Suggested.lean` the kept characters are `keptCharacters`.

*Route.* (i) Two powers with the same primitive character agree on the units modulo `f_ψ`. (ii) `A₀ = ker(ψ|_A)`
and `A = ker χ_{−q} ∩ ker χ_{−d}`, so a character of `G` is trivial on `A₀` iff its restriction to `A` is a power of
`ψ|_A`, iff it lies in `⟨ψ⟩·⟨χ_{−q}, χ_{−d}⟩`, of order `4o` by 0.4(ii); a product of primitive characters of
coprime conductors is primitive. (iii) `χ_{−q}` and `χ_{−d}` are the only generators ramified at `q` and `d`; 0.4(iv)
gives triviality on `σ_d`; 0.2 (iv) (injectivity) identifies the kept character of `κ` with `χ_κ`.

*Checks.*
- `ψ` of order `4` modulo `5`: `𝒦(ψ) = {1, ψ, (·/5), ψ³}`, of conductors `1, 5, 5, 5`; on the host of 0.4 for this `ψ`
  with `n = 2` and `(q, d) = (19, 526679)` there are `16` characters trivial on `A₀`. For `ψ = χ₋₄·φ` with `φ` of order
  `4` modulo `5` (conductor `20`), `ψ²` is imprimitive modulo `20` and `(ψ²)* = (·/5)`: the family consists of
  primitive characters, not of the powers modulo `f_ψ`.
- Triviality on `σ_d` does not single out the kept characters: `ψ^l χ_{−q}` is trivial on `σ_d` as well, but it is
  ramified at `q`.

*KNOWN* (elementary; [FormalProof],
`Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/ExplicitFormulaErrorOfHostConditions.lean`
(`Formalism.HC.Level.cyc`, `Formalism.HC.Level.ofSub`),
`Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/Analytic.lean` (`Formalism.HC.HostRaw.Bounded`); (iii)
follows from [FormalProof], `Development/AutomorphicArithmetic/PrimitiveCosets/CoreAtH.lean`
(`UpperTheory.Comparison₂.keptA`), `Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/Analytic.lean`
(`Formalism.HC.HostRaw.Kept`)).
*Needs:* 0.2, 0.4; RiemannHypothesisStatementsAndConsequences §10.3 (`PrimitiveDirichletCharacter`); Mathlib
`DirichletCharacter.primitiveCharacter`.

### 0.6 The partner map, tops, thick places and letters

*Definitions.* (a) For an abelian CM host and `τ ∈ Φ`, the *partner map* is
`par_τ : G ∖ Φ → Φ`, `g ↦ cgτ`. (b) For a host of 0.4: a set of *tops* is a set `Φ_top ⊂ A`, its elements viewed
as places. A *thick set* is a set `𝒯 ⊂ A₀`, and `δ_th = |𝒯|/|A|`. For a *translate* `u₀ ∈ A₀` the *thick places* of
`u₀` are `cσ_d u₀ 𝒯 ⊂ Φ` (the definition makes sense for every `u₀ ∈ A`, and 0.8b (d) uses it so); the places that
are neither tops nor thick places of `u₀` are *thin*. (c) For an abelian CM host, the *place* of `g ∈ G` is
`pl(g) := g` if `g ∈ Φ` and `pl(g) := cg` if `g ∉ Φ`; elements of `G` read through their places are called *letters*.
For a host of 0.4 and `u₀ ∈ A`, `g` is a *thick letter* of `u₀` if `pl(g)` is a thick place of `u₀`.

*Lemma.* (i) `par_τ` is a bijection, with inverse `τ′ ↦ cτ′τ^{−1}`, and `par_{ττ₁}(g) = par_τ(g)τ₁` for `τ₁ ∈ Φ`.
(ii) Tops lie in `A` and thick places in `cσ_d A`, so no top is a thick place; `|Φ| = 2|A|`. (iii) For `τ ∈ A`,
`par_τ(g)` is a thick place of `u₀` iff `g ∈ σ_d u₀ 𝒯 τ^{−1}`; these `g` lie in `σ_d A`, and the primes unramified in
`E` whose Frobenius lies in `σ_d A` are exactly the primes inert in `K` and split in `ℚ(√−q)` (for odd `p`:
`(p/q) = 1`). (iv) For `τ ∈ A` and `i` odd: if `p` is inert in `K` and split in `ℚ(√−q)`, then
`par_τ(Frob_p^i) ∈ cσ_d A`, so it is never a top; if `p` is inert in `K` and in `ℚ(√−q)`, then
`par_τ(Frob_p^i) ∈ A`, so it is never a thick place. (v) *Letters.* The thick letters of `u₀ ∈ A` are
`cσ_d u₀𝒯 ⊔ σ_d u₀𝒯` (the thick places and their conjugates). Let `φ ∈ G ∖ Φ`, `h := φ_A` (0.4 (iv)) and `y ∈ G`; then
`ε(φ) ∈ {c, σ_d}`. If `ε(φ) = σ_d`, the thick letters among the `yφ^i` lie at the positions `i` of one parity, and
`yφ^i` is thick only if `y_A h^i ∈ u₀𝒯`. If `ε(φ) = c`, then `pl(yφ^i) = pl(y)·h^i` for every `i`; if `pl(y) ∈ cσ_dA`,
the thick letters among the `yφ^i` are exactly those with `y_A h^i ∈ u₀𝒯`, and if `pl(y) ∈ A`, none is thick. In
particular, for `φ = c` the two letters `y` and `yc` have the same place: both are thick or neither. For a prime `p`
unramified in `E` and inert in `K`, `φ = Frob_p` lies in `G ∖ Φ` (0.3 (a)), with `ε(Frob_p) = σ_d` if `p` splits in
`ℚ(√−q)` and `ε(Frob_p) = c` if `p` is inert in `ℚ(√−q)`.

In `Suggested.lean` the thick places of `u₀` are `thickPlaces`, with `σ_d` read as the nontrivial element of `I_d`.

*Route.* From 0.1(ii) (`c ∉ Φ`, `[G : Φ] = 2`) and 0.4(ii), (iv): under `(χ_{−q}, χ_{−d}) : G/A ≅ {±1}²` the classes of
`c`, `σ_d` and `cσ_d` are `(−1, −1)`, `(1, −1)` and `(−1, 1)`, and for a prime `p` inert in `K`,
`χ_{−d}(Frob_p) = −1` and `χ_{−q}(Frob_p) = 1` iff `p` splits in `ℚ(√−q)` (for odd `p ≠ q`, `χ_{−q}(p) = (p/q)`; the
Frobenius of an odd `p ∤ qd` in `ℚ(√−q, √−d)` is `((−q/p), (−d/p))`, Multiquadratic Layer 1);
odd powers stay in the same class modulo `A`. (v) In the decomposition `G = A × ⟨c⟩ × ⟨σ_d⟩` of 0.4 (iv), `Φ` is the set
of `g` with `ε(g) ∈ {1, cσ_d}`, so `pl(g)_A = g_A` and `ε(pl(g))` is the element of `ε(g)⟨c⟩` lying in `{1, cσ_d}`; the
thick places are the `g` with `ε(g) = cσ_d` and `g_A ∈ u₀𝒯`, so the thick letters are those with `ε(g) ∈ {cσ_d, σ_d}`
and `g_A ∈ u₀𝒯`. `φ ∉ Φ` means `ε(φ) ∈ {c, σ_d}`, and `(yφ^i)_A = y_A h^i`, `ε(yφ^i) = ε(y)ε(φ)^i`. For `ε(φ) = σ_d`,
`ε(y)σ_d^i ∈ {cσ_d, σ_d}` holds for one parity of `i` only; for `ε(φ) = c`, `ε(y)c^i` stays in `ε(y)⟨c⟩`, so
`ε(pl(yφ^i)) = ε(pl(y))` for every `i`.

*Checks.*
- First host of 0.4 (`ψ = 1`, `n = 2`, `(q, d) = (19, 526679)`): `23` and `43` are inert in `K` and split in
  `ℚ(√−19)` (`(23/19) = (4/19) = 1`, `(43/19) = (5/19) = 1`), and `29` and `31` are inert in `K` and in `ℚ(√−19)`
  (`(29/19) = (10/19) = −1`, `(31/19) = (12/19) = −1`).
- The thick letters are not contained in `cσ_dA`: the letter `cτ` of a thick place `τ` lies in `σ_dA` and is thick.
  For `ε(φ) = c` and `h = s′s^{−1}` with `s ≠ s′` in `𝒯`, the letters `y = cσ_du₀s` and `yφ` are both thick
  (`pl(yφ) = cσ_du₀s′`), so consecutive thick letters occur at primes inert in `K` and in `ℚ(√−q)`.

*KNOWN* (definitions; (c): [FormalProof],
`Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/ZsmulGeneratorEqZeroOfProjection.lean`
(`Formalism.HC.Frame.placeOf`)). *Needs:* 0.1, 0.3, 0.4; Multiquadratic Layer 1.

### 0.7 Tops with a prescribed coset law

*Definition.* Let `A` be a finite abelian group and `A₀ ⊂ A` a subgroup of
index `o`. A *coset law* is a probability `ν` on `A/A₀`; it is *symmetric* if `ν(αA₀) = ν(α^{−1}A₀)`. A set `S ⊂ A`
*has coset law `ν` with precision `η`* (`η ≥ 0`) if `|#(S ∩ αA₀) − ν(αA₀)·|S|| ≤ η·|S|` for every coset `αA₀`.
*Statement.* Let `0 < δ_top ≤ 1`, `0 < ω₀ ≤ 1` and `ω : A/A₀ → [ω₀, 1]` (the *coset profile*). Select each `α ∈ A`
independently with probability `δ_top·ω(αA₀)`, a probability in the fixed range `[ω₀δ_top, δ_top]`; let `Φ_top` be the
set of selected elements (the tops, when `A` is the group of 0.4), put `ν(αA₀) = ω(αA₀)/Σ_{α′A₀∈A/A₀} ω(α′A₀)` (the coset
law of the selection) and let `n_top := δ_top|A₀|·Σ_{α′A₀∈A/A₀} ω(α′A₀)` be the expected number of tops, so that
`ω₀δ_top|A| ≤ n_top ≤ δ_top|A|`. Let `I` be a finite index set with weights `λ_i ≥ 0` (`i ∈ I`), and `(B_{α,i})_{α∈A, i∈I}` events
with `P(α ∈ Φ_top and B_{α,i}) ≤ p_bad·P(α ∈ Φ_top)` for all `α` and `i` (they may depend on the whole selection). If
`δ_top|A| ≥ 16o²/ω₀²`, then with probability at least `1/2`:
(i) `n_top/2 ≤ |Φ_top| ≤ 3n_top/2`; in particular `ω₀ δ_top|A|/2 ≤ |Φ_top| ≤ 2δ_top|A|`. If moreover `ω₀ ≥ 3/4` and
`δ_top|A| ≥ 36o²/ω₀²`, then `|Φ_top| ≥ 2n_top/3 ≥ δ_top|A|/2`;
(ii) `Φ_top` has coset law `ν` with precision `4(1 + ω₀)ω₀^{−2}(δ_top|A|)^{−1/2}`;
(iii′) (*weighted count of bad events*) `Σ_{i∈I} λ_i·#{α ∈ Φ_top : B_{α,i}} ≤ 4p_bad·n_top·Σ_{i∈I} λ_i ≤ 8p_bad·|Φ_top|·Σ_{i∈I} λ_i`.
For one index (`I` a point, weight `1`, events `B_α`), (iii′) is (iii), the count of bad tops: `#{α ∈ Φ_top : B_α} ≤ 8p_bad|Φ_top|`.
In particular a set with (i), (ii) and (iii′) exists.

*Route.* The coset counts `#(Φ_top ∩ αA₀)` are sums of `|A₀|` independent Bernoulli variables of mean
`δ_top ω(αA₀)`, with variance at most `|A₀|δ_top`. Chebyshev's inequality at the deviation `2(δ_top|A|)^{1/2}` and a
union bound over the `o` cosets give `|#(Φ_top ∩ αA₀) − |A₀|δ_top ω(αA₀)| ≤ 2(δ_top|A|)^{1/2}` for all cosets with
probability at least `3/4`; then `|Φ_top|` differs from `n_top ≥ ω₀δ_top|A|` by at most `2o(δ_top|A|)^{1/2}`, which is at
most `n_top/2` by the hypothesis (at most `n_top/3` when `δ_top|A| ≥ 36o²/ω₀²`, and then `n_top ≥ 3δ_top|A|/4` if
`ω₀ ≥ 3/4`), and (i), (ii) follow from `ν(αA₀)·n_top = |A₀|δ_top ω(αA₀)` and `ν(αA₀) ≤ 1/(oω₀)`.
(iii′) By linearity of expectation, whatever the dependence of the events on the selection, the expectation of
`Σ_i λ_i·#{α ∈ Φ_top : B_{α,i}}` is `Σ_i λ_i Σ_α P(α ∈ Φ_top and B_{α,i}) ≤ p_bad·n_top·Σ_i λ_i`; Markov's inequality, applied
once to this weighted sum, bounds it by `4p_bad·n_top·Σ_i λ_i` with probability at least `3/4`; on the event of (i),
`n_top ≤ 2|Φ_top|`. The two events, of (i)–(ii) and of (iii′), fail with probability at most `1/4` each.

*Checks.*
- `ω = 1` on `A₀` and `ω = ω₀` on the other cosets (probabilities `δ_top` on `A₀` and `ω₀δ_top` elsewhere):
  `ν(A₀) = 1/(1 + ω₀(o − 1))` and `ν(αA₀) = ω₀/(1 + ω₀(o − 1))` for `αA₀ ≠ A₀`; a symmetric law. At `ω₀ = 3/4`:
  `4/(3o + 1)` and `3/(3o + 1)`.
- (iii′) is not the sum over `i` of instances of (iii): each instance holds with probability `3/4` only, and for
  `|I| ≥ 2` they need not hold together, while the weighted sum is controlled by its first moment alone. The bound is
  stated with `n_top`: from (i) alone in the form `|Φ_top| ≥ ω₀δ_top|A|/2`, the bound `4p_bad·δ_top|A|·Σλ_i` would give only
  `8p_bad|Φ_top|Σλ_i/ω₀`.
- For `o > 1` the coset law `ν = δ_{A₀}` (all tops in `A₀`) is not of this form: `ω₀ > 0` is required, and with it the
  selection charges every coset. For `o = 1` there is one coset, and every profile gives `ν = δ_{A₀}`.

*KNOWN* in kind (Bernoulli selection; Chebyshev and Markov inequalities). *Needs:* Mathlib
`ProbabilityTheory.IndepFun.variance_sum`, `ProbabilityTheory.meas_ge_le_variance_div_sq`,
`MeasureTheory.mul_meas_ge_le_integral_of_nonneg`, `MeasureTheory.Measure.pi`, `PMF.bernoulli`.

### 0.8 Sets with no relation of length `L`

*Definition.* For an integer `L ≥ 2`, a set `T ⊂ ℤ` has *no relation of length `L`* if
there are no pairwise distinct `s₁, s₂, s₃ ∈ T` and integers `i ≠ j` with `0 < |i|, |j| ≤ L` and
`j(s₂ − s₁) = i(s₃ − s₁)`.
*API.* A set with no relation of length `L ≥ 2` contains no three-term arithmetic progression (Mathlib's
`ThreeAPFree`).
*Theorem.* There is an absolute constant `C` such that for all integers `M ≥ 2` and `L ≥ 2` there is a nonempty
`T ⊂ ℤ ∩ [0, M/(4L))` with no relation of length `L` and `|T| ≥ M·exp(−C·(log M · log L)^{1/2})/L`; when `M ≥ 4L`,
moreover `|T| ≤ M/(4L)`.

In `Suggested.lean` the predicate is `NoRelation` and the theorem is `exists_noRelation`.

*Route.* (API) For `i = 1`, `j = 2` the relation reads `s₃ − s₁ = 2(s₂ − s₁)`: `s₂` is the midpoint of `s₁, s₃`.
(Theorem) Behrend's construction in the form of Mathlib's `Behrend` namespace, with base `4LD_B` in place of
Mathlib's `2D_B − 1`. For integers `r_B, D_B ≥ 1` with `(4LD_B)^{r_B} ≤ M/(4L)`, the points of
`Behrend.sphere r_B D_B R_B` (the vectors in `{0, …, D_B − 1}^{r_B}` with `Σ_k x_k² = R_B`) are sent into
`[0, M/(4L))` by `Behrend.map (4LD_B)` (base-`4LD_B` digits), injectively (`Behrend.map_injOn`). In a relation
`(i − j)s₁ + js₂ − is₃ = 0` among images every digit combination `(i − j)x₁ + jx₂ − ix₃` has absolute value at most
`4L(D_B − 1) < 4LD_B`, so the relation holds coordinatewise in `ℤ^{r_B}` (an integer combination of powers of the
base with all digits of absolute value below the base vanishes only if every digit does); the coefficients
`i − j, j, −i` are nonzero and sum to `0`, so one of the three points is a strict convex combination of the other
two, which is impossible on a Euclidean sphere (`norm_combo_lt_of_ne`; for `i = 1, j = 2` this is
`Behrend.threeAPFree_sphere`). `Behrend.exists_large_sphere` gives a radius `R_B` carrying at least
`D_B^{r_B}/(r_B D_B²)` points. Take `r_B ≍ (log M/log L)^{1/2}` and `D_B` maximal; when `M` is bounded by a fixed
power of `4L`, the single point `T = {0}` suffices; removing one point if necessary gives `|T| ≤ M/(4L)` at the
cost of a factor `2`.

*Checks.*
- The bound `|T| ≥ M^{1−o(1)}` (for `log L = o(log M)`) is the density a thick set needs; a random subset of
  `[0, M/(4L))` of that size contains about `|T|³L/M` three-term progressions, far more than one.

*KNOWN* in kind (Behrend 1946 for progressions; Ruzsa 1993 for invariant linear equations; the bound uniform in `L`
is not a quotation of either; the predicate: [FormalProof], `Formalism/FrobeniusOrbits/HostThickExists.lean`
(`Formalism.FrobeniusOrbits.NoRel`)). *Needs:* Mathlib `Behrend.sphere`, `Behrend.map`, `Behrend.map_injOn`,
`Behrend.exists_large_sphere`, `Behrend.threeAPFree_sphere`, `ThreeAPFree`, `norm_combo_lt_of_ne`.

### 0.8a Thick sets

*Definition.* Let `A` be an abelian group containing a cyclic subgroup `A₀` of order `M ≥ 2`
with generator `α₀`, and `L ≥ 2`. A *thick set of length `L`* is `𝒯 = {α₀^s : s ∈ T}` for a set `T` as in the theorem
of 0.8 for `M` and `L`; so `|𝒯| = |T|`, and `4L·|𝒯| ≤ M ≤ |A|` when `M ≥ 4L`; on a host of 0.4 (`A₀` cyclic by
0.4 (iii)) its density is `δ_th = |𝒯|/|A| ≤ 1/(4L)` when `M ≥ 4L`.
*Statement.* For a thick set `𝒯` of length `L` and arbitrary elements `h, y, u₀ ∈ A` (not only of `A₀`):
(a) if `ord h > 4L`, any `L` consecutive points `yh^{i₀}, yh^{i₀+1}, …, yh^{i₀+L−1}` of the orbit of `y` include at
most two points of `u₀𝒯`;
(b) if `ord h ≤ 4L`, the orbit `y⟨h⟩` contains at most one point of `u₀𝒯`.

*Route.* (a) Three such points `u₀α₀^{s_k} = yh^{i_k}` (`k = 1, 2, 3`) give `h^{i_k − i₁} = α₀^{s_k − s₁}`, hence
`α₀^{(i₃−i₁)(s₂−s₁)} = h^{(i₂−i₁)(i₃−i₁)} = α₀^{(i₂−i₁)(s₃−s₁)}` and `(i₃ − i₁)(s₂ − s₁) ≡ (i₂ − i₁)(s₃ − s₁) (mod M)`, both
sides of absolute value `< L·M/(4L) = M/4`, hence equality in `ℤ`; the `s_k` are distinct because
`0 < |i_k − i_{k′}| < L < ord h` makes the three points distinct; this is a relation of length `L`. (b) Two points
`u₀α₀^s = yh^i`, `u₀α₀^{s′} = yh^{i′}` give `α₀^{s−s′} ∈ ⟨h⟩`, so `M` divides `ord(h)·(s − s′)`, and `s ≠ s′` would force
`|s − s′| ≥ M/ord h ≥ M/(4L)`, against `|s − s′| < M/(4L)`.

*Checks.*
- (b) uses the diameter bound `M/(4L)`: for `T` spread over all of `[0, M)`, two of its points may lie in one coset
  of a subgroup of order `≤ 4L`.

*KNOWN* in kind (consequences of 0.8). *Needs:* 0.4, 0.8.

### 0.8b Marks along Frobenius orbits and the cluster property

*Definition.* For a set of
*marked* positions in `ℤ/N` (a cyclic word, `N ≥ 1`) and an integer `j′ ≥ 1` with `2j′ < N`, the marks have the
*`j′`-cluster property* if every mark has either no mark among the `j′` positions before it, or exactly one, at a
distance `e ≤ j′`, and then no other mark among the `e + j′` positions before it.
*Statement.* Let `A`, `A₀`, `M`, `L` and a thick set `𝒯` of length `L` be as in 0.8a, and `h, y, u₀ ∈ A`.
(c) (*Words.*) For a multiple `N` of `ord h`, mark the positions `i ∈ ℤ/N` with `yh^i ∈ u₀𝒯`. If `ord h > 4L`, any `L`
consecutive positions carry at most two marks; hence, if `L ≥ 3`, no three consecutive positions are marked and some
position is unmarked, and the marks have the `j′`-cluster property for every `j′ ≥ 1` with `2j′ + 2 ≤ L`. If
`ord h ≤ 4L`, the marked positions are congruent modulo `ord h`; in particular, if `h ≠ 1`, no two adjacent positions
are marked, and the marks have the `j′`-cluster property for every `j′ < ord h` with `2j′ < N`. Every subset of the
marks keeps each of these properties.
(d) (*Frobenius orbits on a cyclic host.*) Let `E` be a host of 0.4, `𝒯 ⊂ A₀` a thick set of length `L ≥ 3` for
`M = |A₀|`, `u₀ ∈ A`, `ℓ` a prime unramified in `E` and inert in `K`, `φ = Frob_ℓ`, `N = ord φ`, `h = φ_A` (0.4 (iv)) and
`y ∈ G`, and mark the positions `i ∈ ℤ/N` at which `yφ^i` is a thick letter of `u₀` (0.6 (v)). Then `N` is a multiple
of `ord h`, and the marks are among the marks of (c) for `y_A`, `h`, `u₀`: all of them when `ℓ` is inert in `ℚ(√−q)`
and `pl(y) ∈ cσ_dA`, none when `ℓ` is inert in `ℚ(√−q)` and `pl(y) ∈ A`, and only marks of one parity when `ℓ` splits
in `ℚ(√−q)`. Consequently, unless `φ = c` and `pl(y)` is a thick place of `u₀`, no three consecutive positions are
marked and some position is unmarked, and the marks have the `j′`-cluster property for every `j′ ≥ 1` with
`2j′ + 2 ≤ L`, `2j′ < N` and either `ord h > 4L` or `j′ < ord h`. If `φ = c` and `pl(y)` is a thick place of `u₀`, then
`N = 2` and both positions are marked.

*Route.* (c) Positions that differ by a multiple of `ord h` give the same point, and `L < ord h` consecutive positions
give distinct points, so the first sentence is 0.8a (a). For `L ≥ 3`, three consecutive positions lie in a window of
`L`, which also contains an unmarked position (`N ≥ L`); a mark with two marks among the `j′` positions before it, or
with a mark at distance `e ≤ j′` and another among the `e + j′` positions before it, gives three marks in at most
`2j′ + 1 < L` consecutive positions, against 0.8a (a); and `2j′ < L ≤ N`. The short case is 0.8a (b): a marked position
marks the single point of the orbit in `u₀𝒯`, and adjacent positions carry the different points `yh^i ≠ yh^{i+1}` when
`h ≠ 1`; marks spaced by multiples of `ord h > j′` have no other mark among the `j′` positions before them. Each property
is a condition on the marks before a given mark or inside a window, so it passes to subsets. (d) `φ = h·ε(φ)` with
`ε(φ)` of order `2` commuting with `h`, so `h^N = 1`; the rest is 0.6 (v) with `ε(Frob_ℓ) = σ_d` iff `ℓ` splits in
`ℚ(√−q)`: for `ε(φ) = σ_d` the marks lie at one parity of the even `N`, so no two are adjacent and some position is
unmarked; for `ε(φ) = c` and `φ ≠ c` (so `h ≠ 1`), (c) applies with `ord h > 4L` or `2 ≤ ord h ≤ 4L`; for `φ = c`,
`N = 2` and `pl(y) = pl(yc)`.

*Checks.*
- Marks at the positions `0, 2, 3` of a long orbit fail the `2`-cluster property (the mark at `3` has the mark at `2`
  at distance `1` and the mark at `0` among the `3` positions before it); they lie in `4` consecutive positions, so by
  (c) they never come from a thick set with `L ≥ 4`.
- For `φ = c` (a prime `ℓ` with `Frob_ℓ = c`) and a thick place `τ`, the orbit `{τ, cτ}` consists of two thick
  letters: the case "every letter thick" occurs, and only there.

*KNOWN* in kind (consequences of 0.6 and 0.8a). *Needs:* 0.4, 0.6, 0.8a.

### 0.9 Admissible auxiliary pairs

*Definition.* For real `B ≥ 3` and an integer `a ≥ 3`, a *`(B, a)`-admissible pair* is a pair of
primes `(q, d)` with `q ≡ 3 (mod 4)`, `d ≡ 7 (mod 8)`, `v₂(q + 1) ≤ a` and `v₂(d + 1) ≤ a`, `q | d + 1`, and `p | d + 1` for
every odd prime `p ≤ B`. A *`B`-admissible pair* is a pair of primes `(q, d)` with `q ≡ 3 (mod 8)`, `d ≡ 7 (mod 16)`,
`q | d + 1`, and `p | d + 1` for every odd prime `p ≤ B`; it is a `(B, 3)`-admissible pair with `v₂(q + 1) = 2`.
*Lemma.* For a `(B, a)`-admissible pair: (i) `(−d/q) = 1` and `(−d/p) = 1` for every odd prime `p ≤ B`, so `q` and
these `p` split in `ℚ(√−d)`; `2` splits in `ℚ(√−d)`. (ii) `d > B`, and `d ≥ 23`. (iii) Every prime inert in `ℚ(√−d)`
exceeds `B`; so every host of 0.4 with this auxiliary pair is inert-free up to `B` (0.3). (iv) If every odd prime
dividing `f_ψ` is at most `B` and `q ∤ f_ψ`, then `(q, d)` satisfies the hypotheses of 0.4 on the pair for `ψ`, with
`q ≡ 3 (mod 4)`, `d ≡ 7 (mod 8)` in place of `q ≡ 3 (mod 8)`, `d ≡ 7 (mod 16)` unless the pair is `B`-admissible. (v)
`2 ≤ v₂(q + 1) ≤ a` and `3 ≤ v₂(d + 1) ≤ a`; for a `B`-admissible pair `v₂(q + 1) = 2` and `v₂(d + 1) = 3`. (vi) Under
(iv), the host of 0.4 (in the classes of (iv)) with this pair and any layer `n ≥ a − 1` satisfies `HostSplitting E`
(0.3), and `16qd` divides its conductor `f_E`; for a `B`-admissible pair this holds from the layer `n = 2` on.
Each condition except `v₂(q + 1) ≤ a` has a use in Layer 0: `q ≡ d ≡ 3 (mod 4)` makes `χ_{−q}`, `χ_{−d}` odd and the host CM (0.4);
`d ≡ 7 (mod 8)` splits `2` in `K` (0.4); the bound `v₂(d + 1) ≤ a` fixes the layer from which (vi) holds; `q | d + 1` splits
the ramified prime `q` in `K` (0.4); the odd primes `p ≤ B` dividing `d + 1` split the odd primes of `f_ψ` in `K` (iv) and
leave no prime `≤ B` inert in `K` (iii). The bound `v₂(q + 1) ≤ a` bounds by `2^{a−1}` the number `2^{v₂(q+1)−1}` of
places above `q` in `ℚ(μ_{2^∞})` (the decomposition group of `q` in `Gal(ℚ(μ_{2^∞})/ℚ) ≅ ℤ₂^×` is the closure of
`⟨q⟩`, of that index), a number on which the bounds for wild kernels over the host fields depend (Downstream
consumers).

*Route.* `q | d + 1` gives `−d ≡ 1 (mod q)`, and likewise modulo each odd `p ≤ B`, so these primes split in `ℚ(√−d)`
(Multiquadratic Layer 1); `d ≡ 7 (mod 8)` gives
`−d ≡ 1 (mod 8)`, so `2` splits. (ii) By Bertrand's postulate there is an odd prime `p ∈ (B/2, B]`, and `8p | d + 1`
since `8 | d + 1`; so `d + 1 ≥ 8p > 4B`. Also `3 | d + 1` (as `3 ≤ B`), so `24 | d + 1` and `d ≥ 23`.
(iii) By (ii) every prime `p ≤ B` is `2` or odd and different from `d`, and (i) splits it. (iv) `q ≡ d ≡ 3 (mod 4)`;
`q ≠ d` because `q | d + 1`; `d ∤ f_ψ` because `d > B` is larger than every odd prime of `f_ψ`; `d ≡ 7 (mod 8)`; and (i);
a `B`-admissible pair has `q ≡ 3 (mod 8)` and `d ≡ 7 (mod 16)` by definition.
(v) `q ≡ 3 (mod 4)` gives `v₂(q + 1) ≥ 2`, and `d ≡ 7 (mod 8)` gives `v₂(d + 1) ≥ 3`; `q ≡ 3 (mod 8)` and
`d ≡ 7 (mod 16)` give `v₂(q + 1) = 2` and `v₂(d + 1) = 3`. (vi) 0.4 (vi) and the sentence after it, with
`v₂(d + 1) − 1 ≤ a − 1 ≤ n`, and 0.4 (c): `f_E = lcm(2^{n+2}, f_ψ)·q·d` with `16 | 2^{n+2}` (`n ≥ a − 1 ≥ 2`) and
`q, d ∤ f_ψ`.

*Checks.*
- `(19, 526679)` is `B`-admissible exactly for `3 ≤ B < 13` (`19 ≡ 3 (mod 8)`, `526679 ≡ 7 (mod 16)`,
  `d + 1 = 2³·3²·5·7·11·19`); with `B = 12`, (iii) makes its hosts inert-free up to `12` (in fact up to `22`, 0.4,
  Checks). For `ψ = 1` and `n ≥ 2` its host satisfies the hypotheses of 0.4, is inert-free up to `12`, satisfies
  `HostSplitting E` with `16qd | f_E` (vi), and has `q = 19 > 8f_ψ`.
- `(3, 71)` and `(3, 23)` are `B`-admissible exactly for `3 ≤ B < 5` (`72 = 2³·3²`, `24 = 2³·3`). Their hosts are not
  inert-free up to `12` (`7` is inert in `ℚ(√−71)`, `5` in `ℚ(√−23)`), and for `ψ = 1` the host of `(3, 71)` at the layer
  `n = 1` fails `HostSplitting E` and `16qd | f_E` (0.4, Checks). For `ψ` of conductor `5`, (iv) needs `B ≥ 5`, and indeed
  `(3, 23)` violates the hypothesis of 0.4 at `ℓ = 5` (0.4, Checks). `(3, 359)` is `B`-admissible for `3 ≤ B < 7`
  (`360 = 2³·3²·5`).
- `(3, 47)` is `(B, 4)`-admissible for `3 ≤ B < 5` (`48 = 2⁴·3`) and not `B`-admissible; for `ψ = 1` its hosts satisfy
  `HostSplitting E` from the layer `n = 3 = a − 1` on and not at `n = 2` (0.4, Checks).
- The layer of (vi) is sufficient, not necessary, and the failures just stated are for `ψ = 1`. For `ψ` even of
  conductor `32` and order `8` (so `ℚ(ψ) = ℚ_3`), the hosts of `(3, 47)` satisfy `HostSplitting E` from `n = 1` on: the
  elements of `D_{47}` acting on `ℚ(√−3)` as `c` does are the odd powers of a Frobenius times inertia (route of 0.4
  (vi)), and on `ℚ_3`, where `c` acts trivially, they act as `47 ≡ 15 (mod 32)`, of order `2` modulo `±1`. Likewise for
  `ψ` even of conductor `16` and order `4` the host of `(3, 71)` at `n = 1` contains `ℚ_2 = ℚ(ψ)` (`71 ≡ 7 (mod 16)`),
  satisfies `HostSplitting E`, and has `16qd | f_E`.
- (iii) is sufficient, not necessary: the host of 0.4 for `(3, 71)` is inert-free up to `6` (0.4, Checks) although
  `(3, 71)` is admissible only for `B < 5`. The pair `(11, 7)` of 0.4's Checks is admissible for no `B` (`11 ∤ 8`),
  and its host is not inert-free up to `3`.

*KNOWN* (Legendre symbols; Bertrand's postulate). *Needs:* 0.3, 0.4; Multiquadratic Layer 1; Mathlib `legendreSym`,
`Nat.exists_prime_lt_and_le_two_mul`.

### Examples

- `E = ℚ(ζ₈)` with `K = ℚ(i)`: `Φ = {σ₁, σ₅}` and `c = σ₇ ∉ Φ`; a real quadratic subfield in place of `K` gives no CM
  type (0.1).
- `E = ℚ(i)` and `p = 2`: `I_2 = Fr(2^i) = G`, and the mean of `χ_K` over `Fr(2^i)` is `0 = χ₋₄(2)` (0.2).
- `E = ℚ(√−3, √−7)` with `K = ℚ(√−3)` and `d = 3` satisfies `SplitRamification 3`, with `σ_3 ≠ c`, and fails
  `HostSplitting E` (0.3).
- The cyclic host of `ψ = 1`, `n = 2`, `(q, d) = (19, 526679)` has conductor `16·19·526679`, `|G| = 16`, `|A| = 4` and
  `f = 8`, and is inert-free up to `22` (0.4); `(19, 526679)` is `B`-admissible exactly for `3 ≤ B < 13` (0.9).
- For `ψ` of order `4` modulo `5`, `𝒦(ψ) = {1, ψ, (·/5), ψ³}` (0.5).

### Dependencies

ClassFieldTheory Layers 7, 13 and 14 (0.1, 0.2, 0.4); ArithmeticGaloisRepresentations §2.3 (0.2);
QuasiRiemannHypothesis §5.4 (0.2); AnalyticNumberTheoryPartI §§0.30, 2.18a (0.2); AnalyticNumberTheoryPartI §0.34a (0.3);
IntegralIwasawaTheory §0.2 (0.4); Multiquadratic Layer 1 (0.4, 0.6, 0.9);
RiemannHypothesisStatementsAndConsequences §10.3 (0.5); Mathlib's Galois theory of cyclotomic fields, Dirichlet
characters, Jacobi symbols, Bertrand's postulate, probability and Behrend's construction.

## Layer 1: Frobenius-restricted Riesz sums

The analytic half of the argument; no automorphic form enters. The Frobenius-restricted Riesz sum `ℛ` of an abelian CM
host is a von Mangoldt sum of ramps `(a/p^i − w)₊` over the prime powers whose Frobenius coset is not contained in `Φ`;
the cap `w` is read at the place to which an element of the coset outside `Φ` carries `τ`, and at a ramified prime the
ramps are averaged over the coset (an inertia mean). Under `SplitRamification d` (0.3) only the odd powers of the primes
inert in `K` and the powers of `d` contribute, each with a single cap (1.1 (iv)). Orthogonality of characters writes its
difference with the main term `𝔐` as an average `ℭ` of the Riesz remainders `G_χ` of all characters of the host, each at
a scale `a/w` set by a weight (1.2). The Riesz remainders are Lipschitz in the scale and are bounded by the prime number
theorem with the exceptional term (RieszSumsOverPrimesAndExceptionalZeros §§1.4h, 1.4i). On a cyclic host with tops and a thick set,
the thin places are at scales where the prime number theorem holds with a saving for every character of the host,
provided the real characters of the host have no zero near `1` and the conductor of the host is small against the scale
(`log f_E ≤ (log X)^α`, 1.4): the first is a property of the auxiliary pair, the second a bound on the layer and on the
sizes of `q` and `d`; the thick places see every character at the single scale `x`; and averaging over the translates of
the thick set by `A₀` keeps exactly the characters trivial on `A₀` (1.5–1.7). The averaged sum of `m` such differences
is `m` times a fixed multiple of the weighted family sum at `x`, up to errors; an upper bound for it at every translate
whose error, divided by that multiple of `m`, is `x^{O(ε)}(x/m + m)` (1.8) then gives at `m ≈ √x`, up to factors `x^{O(ε)}`
and two side inputs (bounds at the scale `x` for the characters that are not kept, and the thin-scale saving), a
square-root bound at the scale `x` for the weighted sum of the Riesz remainders of the cyclic family (1.9).

### 1.1 The Frobenius-restricted Riesz sum and its main term

*Definitions.* For an abelian CM host,
`a > 0`, `τ ∈ Φ` and `w : Φ → (0, ∞)`, the *Frobenius-restricted Riesz sum* is

`ℛ(a, τ, w) = Σ_p Σ_{i≥1} log p · |I_p|^{−1} Σ_{g ∈ Fr(p^i) ∖ Φ} 2·(a/p^i − w(par_τ g))₊`,

that is `Σ_{n≥1} Λ(n)·mean_{g∈Fr(n)} 2·𝟙[g ∉ Φ]·(a/n − w(cgτ))₊`, and its *main term* is

`𝔐(a, w) = a·(log a − 1 − γ + (L′/L)(1, χ_K) − |Φ|^{−1} Σ_{τ′∈Φ} log w(τ′))`,

with `γ` Euler's constant and `χ_K` the quadratic Dirichlet character of `K` (0.2(iv)).

*API.* (i) Only the `p^i ≤ a/min w` contribute; `ℛ ≥ 0`, nondecreasing in `a` and nonincreasing in each value of
`w`; `𝔐` is real. (ii) Translation: for `τ₁ ∈ Φ`, `ℛ(a, ττ₁, w) = ℛ(a, τ, w(·τ₁))` and
`𝔐(a, w(·τ₁)) = 𝔐(a, w)`. (iii) Constant weights: if `w ≡ w₀` and `y = a/w₀`, then
`ℛ(a, τ, w) = w₀ Σ_{n≤y} (1 − χ_K(n))Λ(n)(y/n − 1)` and `ℛ(a, τ, w) − 𝔐(a, w) = w₀·(G_1(y) − G_{χ_K}(y))`.
(iv) Under `SplitRamification d` (0.3):
`ℛ(a, τ, w) = Σ_{p unramified in E, inert in K} Σ_{i odd} 2 log p·(a/p^i − w(par_τ(Frob_p^i)))₊ + log d·Σ_{i≥1} (a/d^i − w(par_τ(σ_{d,i})))₊`, `σ_{d,i}` the element of `Fr(d^i) ∖ Φ`.

In `Suggested.lean`, `ℛ` and `𝔐` are `frobRieszSum` and `frobRieszMain`, for a subfield of a cyclotomic field and the character `χ_K` of `G` with kernel `Φ`.

*Route.* (iii) Since `𝟙_Φ = (1 + χ_K)/2`, the mean of `2·𝟙[g ∉ Φ]` over `Fr(p^i)` is `1 − χ_K*(p^i)` by 0.2(iii);
then `(a/n − w₀)₊ = w₀(y/n − 1)₊` and the definitions of `G_1`, `G_χ` (RiemannHypothesisStatementsAndConsequences §8.4a). (iv) From 0.3(b):
`|I_p| = 1` for unramified `p`, and `|Fr(d^i)| = |I_d| = 2` with `Fr(d^i) ∖ Φ = {σ_{d,i}}`.

*Checks.*
- (iii) explains the shape: the restriction to odd powers of inert primes (and to all powers of the primes ramified in
  `K`, with weight `1`) is the factor `1 − χ_K(n)`, and the cap `w` is the scale `a/w` of a first Riesz mean. A definition counting also the even powers of inert primes would add,
  for constant weights, `2w₀ Σ_{p inert} Σ_{i≥1} log p·(y/p^{2i} − 1)₊ = a·(2Σ_{p inert} log p/(p² − 1) + o(1))`, a
  term of exact order `a` that no character term of 1.2 cancels.
- `E = K` (one place, `Φ = {1}`): `ℛ − 𝔐 = w(1)·(G_1 − G_{χ_K})(a/w(1))`, which is `o(a)` by the prime number
  theorem for `ζ` and for `L(s, χ_K)`; changing the constant `1 + γ` in `𝔐` would leave a difference of exact order `a`,
  and changing the sign of `(L′/L)(1, χ_K)` a difference `2a·|(L′/L)(1, χ_K)|`, of exact order `a` whenever
  `L′(1, χ_K) ≠ 0`, for instance for `K = ℚ(i)`, where `(L′/L)(1, χ₋₄) = γ + 2 log 2 + 3 log π − 4 log Γ(1/4) ≈ 0.2456`.
- At an unramified prime power `n`, `Λ(n)·𝟙[Fr(n) = {h}]` is the coefficient `Λ_{{h}}(n)` of Chebotarev Layer 11.1 for
  `E/ℚ`; Chebotarev has no term at the ramified prime powers, which `ℛ` keeps through the inertia means of 0.2 (iii).

*NEW* (definition; [FormalProof], `Formalism/SizeWindowBrackets/FirstPrimeNeSecondPrime.lean`
(`Formalism.LFunctionChainParameters.characterSumData.ASK`, in the form (iv), and
`Formalism.LFunctionChainParameters.characterSumData.MAIN`)). *Needs:* 0.2, 0.3, 0.6;
RiemannHypothesisStatementsAndConsequences §8.4a.

### 1.2 The difference as an average of Riesz remainders

*Definition.* The *character average* is

`ℭ(a, τ, w) = |Φ|^{−1} Σ_{g ∈ G∖Φ} Σ_{χ ∈ Ĝ} conj χ(g)·w(par_τ g)·G_{χ*}(a/w(par_τ g))`,

with `G_{χ*} = G_1` for the trivial character. *Theorem.* For every abelian CM host, `a > 0`, `τ ∈ Φ` and
`w : Φ → (0, ∞)`: `ℛ(a, τ, w) − 𝔐(a, w) = ℭ(a, τ, w)`. [FormalProof] states the case of a host with
`SplitRamification d` (0.3); the route below uses no hypothesis on ramification.

In `Suggested.lean`, `ℭ` is `frobRieszCharAverage` and the theorem is `frobRieszSum_sub_main`.

*Route.* Fix `g ∈ G ∖ Φ` and put `w_g = w(par_τ g)`, `y_g = a/w_g`. RiemannHypothesisStatementsAndConsequences §8.8a over `ℚ` (modulus `f_E·∞`,
`E ⊂ ℚ(ζ_{f_E})` by 0.2, the surjection `art_{f_E}`, `f` the indicator of `g`), with its term `D_f` (the prime powers of
the primes dividing `f_E`, which are the primes ramified in `E`, read with the values of the primitive characters)
identified by 0.2(iii) as the sum over the ramified prime powers `p^i` of `log p·(y_g/p^i − 1)₊` times the mean of the
indicator over `Fr(p^i)`, gives for `y_g ≥ 1`
`Σ_{n≥1} Λ(n)·mean_{h∈Fr(n)} 𝟙[h = g]·(y_g/n − 1)₊ = |G|^{−1}·(y_g log y_g − (1 + γ)y_g − y_g Σ_{χ≠1} conj χ(g)(L′/L)(1, χ*) + Σ_χ conj χ(g)·G_{χ*}(y_g))`;
for `y_g < 1` both sides vanish by the definitions of RiemannHypothesisStatementsAndConsequences §8.4a (b). Multiply by `2w_g`, use `w_g(y_g/n − 1)₊ = (a/n − w_g)₊`
and `w_gy_g = a`, and sum over `g ∈ G ∖ Φ`: `2/|G| = 1/|Φ|`; `Σ_{g∉Φ} conj χ(g) = |Φ|, −|Φ|, 0` for `χ = 1`,
`χ = χ_K`, and the other `χ`, so of the constants `−a(L′/L)(1, χ*)` only `+a(L′/L)(1, χ_K)` survives; and the
partner bijection 0.6(i) turns the mean of `log w(par_τ g)` over `G ∖ Φ` into the mean of `log w` over `Φ`.

*Checks.*
- Constant weights: the sums over `G ∖ Φ` kill every character except `1` and `χ_K`, and
  `ℭ = w₀(G_1 − G_{χ_K})(a/w₀)`, as 1.1(iii) requires.
- `ℭ` does not depend on the values of `(L′/L)(1, χ*)` for `χ ≠ 1, χ_K`: each enters through
  `w_g·G_{χ*}(y_g) ∋ a·(L′/L)(1, χ*)`, with total coefficient `a·|Φ|^{−1}Σ_{g∉Φ} conj χ(g) = 0`; the constant of
  `χ_K` enters `ℭ` with coefficient `−a` and `𝔐` with `+a`. Primitivity matters at `d`: under
  `SplitRamification d` the terms of `ℛ` at the powers of `d` come from the values at `d` of the primitive `χ*` of the
  characters trivial on `σ_d`, through the inertia means of 0.2(iii); the characters `χ ∘ art_N` modulo `N` vanish at
  `d`, and with them the right side would miss those terms.
- The modulus: with a modulus `N` divisible by a prime unramified in `E` (`E = ℚ(i)`, `N = 12`, `g = c`), `D_f` also
  contains the odd powers of `3` (`Frob_3 = c`), which 0.2(iii) reads as the indicator of `Frob_3^i = g`; they are terms
  of the left side, not of a ramified correction. With `N = f_E` the primes of `D_f` are exactly the ramified ones.

*KNOWN* in kind (orthogonality of characters, RiemannHypothesisStatementsAndConsequences §8.8a; [FormalProof] for the
case of split ramification, `Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/ChBalance.lean`
(`Deduction.ch_balance`), with `ℭ` the `Formalism.LFunctionChainParameters.characterSumData.De` of the file cited
in 1.1). *Needs:* 0.2,
0.6, 1.1; RiemannHypothesisStatementsAndConsequences §§8.4a, 8.8a.

### 1.4 Cyclic hosts at the thin scales

*Cyclic hosts at the thin scales.* Let `E` be a host of 0.4
for `ψ`.
(a) The real characters of `G` are the `χ` with `χ* = ρ·(·/q)^i·(·/d)^j`, `i, j ∈ {0, 1}`, `ρ` a real element
of `𝔛_n⟨ψ⟩` (its conductor divides `8f_ψ`). Let `c_ex(ψ) ∈ (0, 1/2]` be such that no `L(s, ρ)`,
`ρ` real primitive of conductor dividing `8f_ψ`, has a zero in `(1 − c_ex(ψ), 1)`; it exists and depends on `ψ` alone
(finitely many characters, none with a zero at `1`). The auxiliary pair satisfies the *thin-scale box hypothesis with
gap `c_box`* if for every real primitive `ρ` of conductor dividing `8f_ψ` and every `(i, j) ∈ {0, 1}² ∖ {(0, 0)}`,
`L(s, ρ·(·/q)^i·(·/d)^j)` has no zero in `(1 − c_box, 1)`. Under it, every exceptional zero `β` (ZerosOfLFunctions §6.3)
of an `L(s, χ*)`, `χ ∈ Ĝ` with `χ*` real, has `1 − β ≥ c_ex := min(c_ex(ψ), c_box)`. The box hypothesis concerns the
twists of every real `ρ` of conductor dividing `8f_ψ`, not only of the real powers of `ψ`: for `n ≥ 1`, `𝔛_n` contains
the even character `(2/·)` of conductor `8`, and `(2/·)·(·/q)` is a real character of `G` that is a twist of a power of
`ψ` only if `(2/·) ∈ ⟨ψ⟩`.
(b) A finite abelian extension `E/ℚ` *satisfies the prime number theorem with saving `s` beyond `X`* if
`|G_{χ*}(y)| ≤ s·y` for all `χ ∈ Ĝ` and all `y ≥ X`. Under the box hypothesis with gap `c_box`, for every
`α ∈ [1/2, 1)` there is `y₀ = y₀(α, c_ex)` such that `|G_{χ*}(y)| ≤ y·exp(−c₁(log y)^{1−α})` for all `χ ∈ Ĝ` and all
`y ≥ y₀` with `log f_E ≤ (log y)^α`, `c₁ > 0` the absolute constant of RieszSumsOverPrimesAndExceptionalZeros §1.4i (b); so `E`
satisfies the prime number theorem with saving `exp(−c₁(log X)^{1−α})` beyond every `X ≥ y₀` with
`log f_E ≤ (log X)^α`.

*Route.* (a) By 0.4(ii) `Ĝ = ⟨χ_{−q}, χ_{−d}⟩ × 𝔛_n⟨ψ⟩`, so `χ` is real iff its component in `𝔛_n⟨ψ⟩` is; the `2`-part
of the conductor of a real character divides `8` (AnalyticNumberTheoryPartI §0.34a), and the odd part of the conductor
of an element of `𝔛_n⟨ψ⟩` divides
`f_ψ`; a product of primitive characters of coprime conductors is primitive (`q, d ∤ 2f_ψ`). For `(i, j) = (0, 0)`,
`c_ex(ψ)` applies; for the others, the box hypothesis. (b) RieszSumsOverPrimesAndExceptionalZeros §1.4i (b) for the field `E` with
the gap `c_ex` of (a); the bound `exp(−c₁(log y)^{1−α})` decreases in `y`. The form of the formal proof,
RieszSumsOverPrimesAndExceptionalZeros §1.4i (b′), gives (b) with a constant `c₁` depending on `c_ex`, from the absence of
real zeros in `(1 − c_ex, 1)` that (a) states.

*Checks.*
- An instance of (b): for `ε > 0`, `X = e^{x^{ε/3}}/3` and `log f_E ≤ 2x^{ε/5} log² x`, (b) with `α = 31/50` gives
  the saving `s = e^{−x^{ε/8}}` beyond `X` for `x ≥ x₀(ε, c_ex)`, since `31/150 > 1/5` and `19/150 > 1/8`.
- On the host of 0.4 for `ψ = 1`, `n = 2`, `(q, d) = (3, 71)`, the real characters of `G` are the eight
  `ρ·(·/3)^i(·/71)^j` with `ρ ∈ {1, (2/·)}`. The twists of `ρ = 1` alone would leave out `(2/·)(·/3)`, `(2/·)(·/71)`
  and `(2/·)(·/3)(·/71)`.
- AnalyticNumberTheoryPartI §0.34 (`(1 − β) log q ≥ c_LS` for every real zero `β` of every primitive real `L(s, χ)` of
  conductor `q ≥ 3`) gives the conclusion of (b) for every finite abelian `E/ℚ` without the box hypothesis, with another
  absolute constant in place of `c₁` and `y₀` depending on `α` alone; the form with the box hypothesis is the one
  [FormalProof] uses.

*KNOWN* (Landau–Page; Davenport, *Multiplicative Number Theory*, ch. 19–20; [FormalProof],
`Development/AutomorphicArithmetic/CharacterBoxes/PairGood.lean` (`UpperTheory.Top.RealBox`),
`Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/Analytic.lean`
(`Formalism.HC.HostRaw.ChebyshevCharacterBound`); the form at the thin scales:
`Formalism/SharpRestriction/GlobalSchurBounds/ShortIntervalPrimes.lean`
(`Formalism.MainNotions.ShortIntervalPrimes.Conclusion6`), from the three statements on zeros
`Formalism/SharpRestriction/GlobalSchurBounds/MainSup.lean` (`Formalism.MainNotions.LitThin`)).
*Needs:* 0.4; RieszSumsOverPrimesAndExceptionalZeros
§1.4i; ZerosOfLFunctions §6.3 and RiemannHypothesisStatementsAndConsequences §8.4a; AnalyticNumberTheoryPartI §0.34a.

### 1.5 Averaging characters over a subgroup

Let `G` be a finite abelian group, `A₀ ⊂ G` a subgroup, `g ∈ G` and `χ` a
character of `G`. Then `Σ_{u∈A₀} χ(gu) = |A₀|·χ(g)` if `χ|_{A₀} = 1`, and `0` otherwise. Consequently, for `T ⊂ A₀`
and complex numbers `(c_χ)_{χ∈Ĝ}`:
`mean_{u₀∈A₀} Σ_{s∈T} Σ_{χ∈Ĝ} c_χ·conj χ(gu₀s) = |T|·Σ_{χ : χ|_{A₀} = 1} c_χ·conj χ(g)`.
On a host of 0.4 it is applied with `T = 𝒯` and `g = σ_d τ^{−1}`, so that `gu₀s` runs over the classes whose
partners from the top `τ` are the thick places of `u₀` (0.6(iii)).

*Route.* Orthogonality of the characters of `A₀`; `s ∈ A₀` is absorbed by the substitution `u₀ ↦ u₀s^{−1}`.

*Checks.*
- On a host of 0.4, averaging over all `u₀ ∈ A` instead of `A₀` keeps only the four characters trivial on `A`
  (`1, χ_{−q}, χ_{−d}, χ_{−q}χ_{−d}`) and loses every nontrivial power of `ψ`: the translates must run over `A₀`.

*KNOWN* (orthogonality). *Needs:* Mathlib `sum_hom_units` (a homomorphism from a finite group to a domain sums to the
order of the group or to `0`), applied to the restriction of `χ` to `A₀`.

### 1.6 Character sums over a set with a coset law

Let `A₀ ⊂ A` be finite abelian of index `o` and `ν` a coset law on
`A/A₀` (0.7); put `ν̂(χ) = Σ_{αA₀∈A/A₀} ν(αA₀)χ(α)` for the characters `χ` of `A` trivial on `A₀`, real when `ν` is
symmetric, with `ν̂(1) = 1`. If `S ⊂ A` has coset law `ν` with precision `η` (0.7), then
`|Σ_{τ∈S} χ(τ) − ν̂(χ)·|S|| ≤ o·η·|S|` for every character `χ` of `A` trivial on `A₀`. For a host of 0.4 and
`κ ∈ 𝒦(ψ)` write `ν̂(κ) = ν̂(χ_κ|_A)` (0.5(iii)).

*Route.* Group the elements of `S` by cosets: `Σ_{τ∈S} χ(τ) = Σ_{αA₀} χ(α)·#(S ∩ αA₀)`.

*Checks.*
- `ω = 1` on `A₀` and `ω = ω₀` elsewhere in 0.7 gives `ν̂(χ) = (1 − ω₀)/(1 + ω₀(o − 1))` for `χ ≠ 1`; at `ω₀ = 3/4`
  this is `1/(3o + 1)`. The uniform law (`ω₀ = 1`) gives `ν̂(χ) = 0` for every `χ ≠ 1`: tops spread uniformly over the
  cosets of `A₀` would see no character of the family but the trivial one.

*KNOWN* (elementary; [FormalProof], `Development/AutomorphicArithmetic/PrimitiveCosets/TopsSum.lean`
(`UpperTheory.Comparison₂.tops_sum`)). *Needs:* 0.5, 0.7.

### 1.7 Cyclic host data at a scale

*Cyclic host data at a scale.* A host of 0.4 for `ψ`; a nonempty set of tops
`Φ_top ⊂ A` with the coset law `ν₀`, `ν₀(A₀) = 4/(3o + 1)` and `ν₀(αA₀) = 3/(3o + 1)` on the other cosets, and precision
`η_top` (0.7, 1.6); a thick set `𝒯 ⊂ A₀`; reals `x ≥ 3`, `b, b′, X′ > 0` and `ϑ, s_th ≥ 0` with `b′X′ ≤ xb`; an integer
`m ≥ 1`; top weights `a_τ > 0` (`τ ∈ Φ_top`) with
`|a_τ/b − x| ≤ 1`; and for every translate `u₀ ∈ A₀` and `1 ≤ j ≤ m` a weight `w_{u₀,j} : Φ → (0, ∞)` with
`w_{u₀,j}(τ′) ∈ [b, b + ϑ + 1]` at the thick places `τ′ ∈ cσ_d u₀𝒯` of `u₀` and `w_{u₀,j}(τ′) ≤ 2b′` at every other
place. Assume that `E` satisfies the prime number theorem with saving `s_th` beyond `X′/3` (the *thin-scale saving*;
definition in 1.4 (b), which derives it on a host of 0.4 from the thin-scale box hypothesis of 1.4 (a) when
`X′/3 ≥ y₀(α, c_ex)` and `log f_E ≤ (log(X′/3))^α` for some `α ∈ [1/2, 1)`, with `s_th = exp(−c₁(log(X′/3))^{1−α})`).
Put

`𝔄 = mean_{u₀∈A₀} Σ_{τ∈Φ_top} Σ_{j=1}^m (ℛ − 𝔐)(a_τ, τ, w_{u₀,j})`,
`𝔜_{ν₀}(x) = Σ_{κ∈𝒦(ψ)} ν̂₀(κ)·Re G_κ(x) = G_1(x) + (3o + 1)^{−1} Σ_{κ∈𝒦(ψ), κ≠1} Re G_κ(x)` (by 1.6, `ν̂₀(1) = 1` and
`ν̂₀(κ) = 1/(3o + 1)` for `κ ≠ 1`),

`𝔔_x = log(x + 1) + C_Λ + max{|(L′/L)(1, χ*)| : 1 ≠ χ ∈ Ĝ, χ|_{A₀} = 1}`, `C_Λ` the absolute constant of
RieszSumsOverPrimesAndExceptionalZeros §1.4h (b′)–(c′).

*Theorem.* Let `ε > 0`, and let `C′`, `k` and `Err` be real. Assume `η_top ≤ x^{−1+ε}`, `m ≤ x^{1/2+ε/2}`, `xm ≤ k`, the
*cost conditions* `2f(x + 1)·s_th ≤ 1/x` and `6f(x + 1)(ϑ + 1) ≤ b/x`, and `|(L′/L)(1, χ*)| ≤ C′ log x` for the
non-kept `χ` trivial on `A₀`. For `x ≥ x₁(ψ, C′, ε)`: if `Σ_{τ∈Φ_top} Σ_{j=1}^m (ℛ − 𝔐)(a_τ, τ, w_{u₀,j}) ≤ Err` for
every `u₀ ∈ A₀`, then

`|Φ_top|·m·b·(δ_th/2)·(𝔜_{ν₀}(x) − Σ_χ |G_{χ*}(x)| − 4x^{1/2+ε}) ≤ Err + 2|Φ_top|·m·b/x`,

the sum over the `3o` non-kept characters trivial on `A₀` (0.5(iv)).

In `Suggested.lean` the data are the structure `ScaleData` (the coset law `ν₀` read on the cosets of `A₀`), and the sum of the hypothesis at `u₀` and `𝔜_{ν₀}(x)` are `ScaleData.translateSum` and `ScaleData.familySum`.

*Route.* By 1.2 each term of `𝔄` is `Re ℭ(a_τ, τ, w_{u₀,j})` (`ℛ` and `𝔐` are real). In `ℭ`, the `g` with
`par_τ(g)` a thick place of `u₀` are `g = σ_d u₀ s τ^{−1}`, `s ∈ 𝒯` (0.6(iii)); replacing their weight by `b` costs
at most `3(a_τ/b)(ϑ + 1) ≤ 3(x + 1)(ϑ + 1)` per pair `(g, χ)` by RieszSumsOverPrimesAndExceptionalZeros §1.4h (a). For every other `g`,
`a_τ/w ≥ (x − 1)b/(2b′) ≥ X′/3`, so the pair contributes at most `s_th·a_τ ≤ (x + 1)b·s_th`. The pairs carry total
weight `|Φ|^{−1}·|Φ|·|G| = 2f`. What remains, the thick part
`|Φ|^{−1} Σ_{s∈𝒯} Σ_χ conj χ(σ_d u₀ s τ^{−1})·b·G_{χ*}(a_τ/b)`, does not depend on `j`, and by 1.5 and `|Φ| = 2|A|`
its mean over `u₀ ∈ A₀` is `b(δ_th/2) Σ_{χ|A₀=1} conj χ(σ_d)χ(τ)G_{χ*}(a_τ/b)`. Sum over `τ ∈ Φ_top`: for a kept
`χ = χ_κ` (`χ(σ_d) = 1`, 0.5(iii)) move `a_τ/b` to `x` at cost `𝔔_x` per top (RieszSumsOverPrimesAndExceptionalZeros §1.4h (b′)) and replace `Σ_τ χ(τ)` by
`ν̂₀(κ)|Φ_top|` at cost `oη_top|Φ_top|·|G_κ(x)| ≤ oη_top|Φ_top|·x𝔔_x` (1.6, RieszSumsOverPrimesAndExceptionalZeros §1.4h (c′)); `ν̂₀(κ)` is real. A non-kept `χ`
contributes at most `|Φ_top|·(|G_{χ*}(x)| + 𝔔_x)`. So `𝔄`, the mean over `u₀ ∈ A₀` of the sums of the hypothesis, is at
most `Err` and at least
`m b(δ_th/2)|Φ_top|·(𝔜_{ν₀}(x) − Σ_χ |G_{χ*}(x)| − (4o + o²η_top x)𝔔_x) − 2f m|Φ_top|·(3(x + 1)(ϑ + 1) + (x + 1)b·s_th)`.
With `η_top ≤ x^{−1+ε}` and `𝔔_x ≤ log(x + 1) + C_Λ + K_ψ + |C′| log x`,
`K_ψ = max({0} ∪ {|(L′/L)(1, κ)| : 1 ≠ κ ∈ 𝒦(ψ)})`, the factor `(4o + o²η_top x)𝔔_x` is at most `4x^{1/2+ε}` for
`x ≥ x₁(ψ, C′, ε)`; the cost conditions bound the last term by `2|Φ_top|·m·b/x`.

*Checks.*
- Degenerate case `𝒯 = ∅`: there are no thick places, every weight is at most `2b′`, `δ_th = 0`, and the conclusion
  reads `Err ≥ −2|Φ_top|·m·b/x`: without thick places the hypothesis carries no information on the family. In general
  `δ_th/2 = |𝒯|/|Φ|` is the proportion of the classes `g ∈ G ∖ Φ` whose
  partner from a given top is a thick place, and the `m` steps contribute `m` identical copies of the thick part.

*NEW* (combination of classical estimates; [FormalProof],
`Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/ChCore.lean`
(`Deduction.CharacterBalanceMoves.core`, `Deduction.CharacterBalanceMoves.one_char`); the law `ν₀`:
`Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/ExplicitFormulaErrorOfHostConditions.lean`
(`Formalism.HC.Frame.lam`, `Formalism.HC.Frame.Shares`)). *Needs:* 0.5, 0.6, 1.2, 1.4, 1.5, 1.6;
RieszSumsOverPrimesAndExceptionalZeros §1.4h.

### 1.8 The error bracket

Let `ε > 0`, `C ≥ 0`, `x ≥ 3` with `x^{3ε/8} ≥ 26`, `A` a finite group with subsets `Φ_top` and `𝒯`, `δ_th = |𝒯|/|A|`, an
integer `m`, and reals `b > 0`, `a ≥ 0`, `k` with: (i) `x^{1/2−ε} ≤ m ≤ x^{1/2+ε/2}`; (ii) `xm ≤ k ≤ |A|²x^{1/2−ε}`;
(iii) `|Φ_top| ≥ x^{−ε/8}|A|/2` and `|𝒯| ≥ x^{−ε}|A|`; (iv) `a ≤ 2xb`. If a real `Y` satisfies

`|Φ_top|·m·b·(δ_th/2)·(Y − 4x^{1/2+ε}) ≤ x^{Cε}·(|Φ_top|·a·(1 + m²/k) + m·(2|A|·m·b·x^ε + |𝒯|·k·b·x^{2ε}/|A|²)) + 2|Φ_top|·m·b/x`,

then `Y ≤ x^{1/2+(C+3)ε}`.

*Route.* Divide by `|Φ_top|·m·b·(δ_th/2)`; by (iii), `2/δ_th ≤ 2x^ε`. Divided by `|Φ_top|·m·b`, the four terms of the
bracket are at most `a/(mb) ≤ 2x/m ≤ 2x^{1/2+ε}`, `am/(kb) ≤ 2xm/k ≤ 2`, `2|A|·m·x^ε/|Φ_top| ≤ 4x^{1/2+13ε/8}` and
`|𝒯|·k·x^{2ε}/(|A|²|Φ_top|) ≤ 2x^{1/2+9ε/8}` (using `|𝒯| ≤ |A|`), and the last term gives `2/x`. So
`Y ≤ 4x^{1/2+ε} + 2x^ε·(x^{Cε}(2x^{1/2+ε} + 2 + 4x^{1/2+13ε/8} + 2x^{1/2+9ε/8}) + 2/x)`, which is at most
`x^{1/2+(C+21/8)ε}·(8 + 20x^{−ε/2})`, and `8 + 20x^{−ε/2} ≤ 9 ≤ x^{3ε/8}`.

*Checks.*
- The balance: the first term is of relative size `a/(mb)` and the third of size `m·|A|/|Φ_top|` up to `x^{O(ε)}`
  (the third term is `m·2|A|·m·b·x^ε`, and `2|A| = f` on a host of 0.4); at the construction's `a = xb` the first is
  `x/m`, and their sum is least at `m ≈ √x`, where it is `x^{1/2+O(ε)}`. With `a = xb` and `m = x^{1/3}` the first term alone is `x^{2/3}·mb|Φ_top|`,
  and no square-root bound can follow from 1.9. (Under (iv) alone `a/(mb)` is only bounded above, by `2x/m`.)

*NEW* (elementary; [FormalProof], `Formalism/SizeWindowBrackets/ChainSlopeWindows/LipschitzWeightAndMinimum.lean`
(`Formalism.LFunctionChainParameters.ThickSetMeanBounds.proposition_size_bound`)). *Needs:* none beyond the definitions.

### 1.9 The square-root bound for the cyclic family from the Frobenius-restricted inequality

Let `ψ` be a primitive Dirichlet character of order `o`, `C ≥ 0`, `C′` real and `ε > 0`. There is
`x₁ = x₁(ψ, C, C′, ε) ≥ 3` such that the following holds for every `x ≥ x₁` and all cyclic host data at `x` as in 1.7
(on any host of 0.4 for `ψ`) whose tops have the coset law `ν₀` of 1.7 with precision `x^{−1+ε}`, with parameters
`k, a` satisfying 1.8 (i)–(iv) and the cost conditions of 1.7. If
(i) for every `u₀ ∈ A₀`:
`Σ_{τ∈Φ_top} Σ_{j=1}^m (ℛ − 𝔐)(a_τ, τ, w_{u₀,j}) ≤ x^{Cε}·(|Φ_top|·a·(1 + m²/k) + m·(2|A|·m·b·x^ε + |𝒯|·k·b·x^{2ε}/|A|²))`, and
(ii) `|G_{χ*}(x)| ≤ x^{1/2+ε}` and `|(L′/L)(1, χ*)| ≤ C′ log x` for every non-kept `χ` trivial on `A₀`,
then

`G_1(x) + (3o + 1)^{−1} Σ_{κ∈𝒦(ψ), κ≠1} Re G_κ(x) ≤ x^{1/2+(C+3)ε} + 4o·x^{1/2+ε} ≤ x^{1/2+(C+4)ε}`.

With parameters `B₀ ≤ 2|A|·m·b·x^ε` and `N_c ≤ |𝒯|·k·b·x^{2ε}/|A|²`, the inequality
`… ≤ x^{Cε}·(|Φ_top|·a·(1 + m²/k) + m·(B₀ + N_c))` for every `u₀ ∈ A₀` implies (i).

The threshold `x₁` is chosen before the host, the tops, the thick set and the weights. The argument uses (i) only through
its mean over `u₀ ∈ A₀`, and its threshold does not involve `C`; a mean over `A` would not suffice (1.5, Checks).
Hypothesis (ii) and the saving `s_th` of 1.7 concern other characters
or other scales than the conclusion. They are not consequences of 1.4 alone: on a host of 0.4, (ii) is a property of the
auxiliary pair, and the saving follows from 1.4 (b) under the thin-scale box hypothesis of 1.4 (a), a further property
of the pair, and the bound `log f_E ≤ (log(X′/3))^α`, which bounds the layer and the sizes of `q` and `d` against the
thin scale (`f_E = lcm(2^{n+2}, f_ψ)·q·d`, 0.4 (c)). The twist selection in the form of the formal proof,
QuadraticTwistSelectionOverPrimes §2.7c (a′)–(c′) and QuadraticTwistSelectionOverPrimes §2.7d (ii′) (box width `1/400`),
supplies (ii) and the box hypothesis with `c_box = 1/400` when it is run for a set of characters containing the members of `𝒦(ψ)`
and every real primitive character of conductor dividing `8f_ψ`, for instance the primitive characters inducing the
characters modulo `8f_ψ`; the bound on `f_E` is a condition on the choice of the layer and of the sizes of the pair.

In `Suggested.lean` the hypotheses other than (i), with the parameters `B₀` and `N_c`, are `ScaleData.BoundHyp`, (i) in the form with `B₀` and `N_c` is `ScaleData.FrobeniusInequality`, and the theorem is `cyclicBound_of_frobeniusInequality`.

*Route.* For `x ≥ x₁`, 1.7 applies with `Err` the right side of (i) (its hypothesis on `(L′/L)(1, χ*)` is part of (ii)):
`|Φ_top|·m·b·(δ_th/2)·(Y − 4x^{1/2+ε}) ≤ Err + 2|Φ_top|·m·b/x` for `Y = 𝔜_{ν₀}(x) − Σ_χ |G_{χ*}(x)|`, the sum over the
`3o` non-kept characters trivial on `A₀`. This is the hypothesis of 1.8 (`x^{3ε/8} ≥ 26` for `x ≥ x₁`), so
`Y ≤ x^{1/2+(C+3)ε}`; by (ii), `Σ_χ |G_{χ*}(x)| ≤ 3o·x^{1/2+ε}`, and `𝔜_{ν₀}(x)` is the left side (1.7). The last
inequality holds once `x^ε ≥ 1 + 4o`. The threshold of 1.7, `x^{3ε/8} ≥ 26` and `x^ε ≥ 1 + 4o` involve `ψ`, `C′` and
`ε` only.

*Checks.*
- `ψ = 1`: `o = 1`, `𝒦(ψ) = {1}`, and the conclusion is `G_1(x) ≤ x^{1/2+(C+3)ε} + 4x^{1/2+ε} ≤ x^{1/2+(C+4)ε}`.
- The law `ν₀` is the coset law of the selection of 0.7 with `ω = 1` on `A₀` and `ω₀ = 3/4` elsewhere (0.7, Checks);
  its weights `1` and `1/(3o + 1)` are positive. With the uniform law (`ω₀ = 1`) the conclusion would concern `G_1`
  alone.

*NEW* ([FormalProof], `Development/AutomorphicArithmetic/DedekindLFunctions/LandauTheorems/ChCore.lean`
(`Deduction.ch_core`), `Development/AutomorphicArithmetic/PrimitiveCosets/SigALe.lean` (`UpperTheory.Comparison₂.sigA_le`),
`Development/AutomorphicArithmetic/PrimitiveCosets/CoreGm.lean` (`UpperTheory.Comparison₂.core_gm`)). *Needs:* 0.5, 1.6,
1.7, 1.8.

### Examples

- For `E = K` (one place) and for constant weights `w ≡ w₀`, `ℛ − 𝔐 = ℭ = w₀·(G_1 − G_{χ_K})(a/w₀)` (1.1, 1.2).
- On the cyclic host of `ψ = 1`, `n = 2`, `(q, d) = (3, 71)` the real characters are the eight `ρ·(·/3)^i(·/71)^j` with
  `ρ ∈ {1, (2/·)}` (1.4).
- For the coset law with `ω = 1` on `A₀` and `ω = ω₀` elsewhere, `ν̂(χ) = (1 − ω₀)/(1 + ω₀(o − 1))` for `χ ≠ 1`, which
  is `1/(3o + 1)` at `ω₀ = 3/4` (1.6).
- For `ψ = 1` the conclusion of 1.9 is `G_1(x) ≤ x^{1/2+(C+4)ε}` (1.9).

### Dependencies

Layer 0; RiemannHypothesisStatementsAndConsequences §§8.4a, 8.8a (1.1, 1.2, 1.4); ZerosOfLFunctions §6.3 (1.4);
AnalyticNumberTheoryPartI §0.34a (1.4);
RieszSumsOverPrimesAndExceptionalZeros §§1.4h, 1.4i (1.4, 1.7, 1.9); QuadraticTwistSelectionOverPrimes §§2.7c–2.7d
(the remark of 1.9); Mathlib's `sum_hom_units` (1.5).

## Downstream consumers

The theta-chain roadmaps of the family RiemannHypothesisForDirichletLFunctions use this roadmap as follows.
ThetaChainsOnDefiniteUnitaryGroups builds its chain data on the cyclic hosts of 0.4 with admissible pairs (0.9), with
the places of 0.6 and the thick sets of 0.8a; the hosts of chain data satisfy `HostSplitting E` (0.3), which contains
`4 | f`, so `f ≥ 4` (the size conditions there give much more, `f = 2|A|` large), and the targets on unitary Shimura
varieties over `F` that use Koecher's principle need `f ≥ 2`, which this gives. LocalGainOfThetaChains uses the tops of
0.7 and the places and letters of 0.6; CongruenceModulesOfThetaLifts reads the thick letters along Frobenius orbits
(0.6 (v), 0.8a, 0.8b); TaylorBoundsAndDepthsOnHeightTwoFormalGroups, RowTowerAndRallisIdentities,
BesselPoincareSeriesAndGramBounds, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties and
GluedTargetAndDivisionInequality use the hosts and their predicates (0.1, 0.3, 0.4) and the admissible pairs (0.9);
UniformWildKernelBounds bounds wild kernels over the dyadic host fields of 0.4, with rank bounds that grow with the
number of places above the primes of `Q` in `ℚ(μ_{2^∞})` (UniformWildKernelBounds §2.3), which the bounds on
`v₂(q + 1)` and `v₂(d + 1)` of 0.9 bound. ThetaChainsAndFrobeniusPrimeSums fixes
the constants that are parameters here (among them the gap `c_box` of 1.4, chosen in `[ε₀/8, 1/12)`, the share
`δ_top` of the tops and the length of the thick set) in ThetaChainsAndFrobeniusPrimeSums §10.6, takes the admissible
pairs, the tops and the thick set from 0.9, 0.7 and 0.8a in ThetaChainsAndFrobeniusPrimeSums §10.7, and applies 1.9 to the inequality of its chain at every translate to obtain the windowed
bound for the cyclic family. GeneralizedRiemannHypothesisFromWindowBounds uses the cyclic family of 0.5.
GluedTargetAndDivisionInequality §8.23 and LocalGainOfThetaChains use 0.4 (g) on the cyclic hosts: a prime `p`
unramified in `E` with `c·Frob_p` of odd order satisfies `p ≡ ±1 (mod 2^{n+2})`.

## Scope and ownership

This sub-roadmap of [RiemannHypothesisForDirichletLFunctions](../README.md) is independently definitive.

This roadmap owns: abelian CM hosts and their Frobenius data at every prime power (the Artin map of a cyclotomic field
containing the host, inertia groups and Frobenius cosets, the primitive Dirichlet character of a character of the host
with its inertia-mean formula, and the reading of primitive characters as characters of the host); the host predicates
`SplitRamification d`, `InertFreeUpTo B` and `HostSplitting E`; the dyadic host fields `E_n(M, Q)` and the cyclic
hosts, with their Galois groups, characters, small primes and splitting; the cyclic family `𝒦(ψ)` of a primitive
Dirichlet character and the kept characters; the partner map, tops, thick and thin places and the places of letters;
the selection of tops with a coset law, sets with no relation of length `L`, thick sets and the cluster property of
their marks along Frobenius orbits; admissible auxiliary pairs; the Frobenius-restricted Riesz sum, its main term and
the character average with the identity 1.2; the thin-scale saving of cyclic hosts; the averaging statements 1.5 and
1.6; the bound for the averaged sum at a scale (1.7), the error bracket (1.8) and the square-root bound for the cyclic
family from the Frobenius-restricted inequality (1.9).

Not owned here. The theorem of Kronecker and Weber with conductor, the inertia statements of local class field theory
and Hilbert reciprocity are ClassFieldTheory Layers 7, 13 and 14; the primitive character attached to a character of
`G_ℚ` with open kernel is ArithmeticGaloisRepresentations §2.3; the group `X(E)` of primitive characters of an abelian
field, with the injectivity and multiplicativity of `χ ↦ χ*` and the independence of its image from the level, is
QuasiRiemannHypothesis §5.4; the one-dimensional comparison of Artin and Hecke characters is
AnalyticNumberTheoryPartI §2.18a, with the dictionary AnalyticNumberTheoryPartI §0.30, and the classification of real
primitive characters is AnalyticNumberTheoryPartI §0.34a; the splitting law in multiquadratic fields is Multiquadratic Layer 1; the cyclotomic
`ℤ₂`-extension is IntegralIwasawaTheory §0.2. The bundled primitive Dirichlet character, the Riesz remainder of a
primitive character and the Riesz-sum identity for a surjection of a ray class group are
RiemannHypothesisStatementsAndConsequences §§10.3, 8.4a and 8.8a; exceptional
zeros are ZerosOfLFunctions §6.3; the Lipschitz and size bounds of Riesz remainders and the prime number theorem with
the exceptional term are RieszSumsOverPrimesAndExceptionalZeros §§1.4h and 1.4i; the twist selection that produces
auxiliary pairs with zero-free boxes is QuadraticTwistSelectionOverPrimes §§2.7c–2.7d. The Galois theory of
cyclotomic fields, Behrend's construction, and Chebyshev's and Markov's inequalities are in Mathlib. The chain of theta
lifts built on the cyclic hosts, and the choice of the constants left as parameters here, belong to the theta-chain
roadmaps named under Downstream consumers.

## Exact supplier contracts

### From TauCetiRoadmap.ClassFieldTheory

- Layer 7 (`mem_inertiaSubgroup_of_mk_eq_artinMap`, `ker_artinMap_eq_iInf`: units are norms from unramified
  extensions) and Layer 14 (`hilbertProductFormula`, `TauCeti.hilbertSymbol_productFormula`). Used in 0.1.
- Layer 13 (`kroneckerWeber`; the conductor `abelianConductor`, whose finite part is the least cyclotomic level,
  `isLeast_absNorm_abelianConductor_finitePart`; `abelianConductor_eq_lcm`: the conductor of an abelian extension is the
  lcm of the conductors of its characters, so the conductor of a compositum is the lcm of the conductors). Used in the
  Conventions, 0.2 and 0.4.

### From TauCetiRoadmap.ArithmeticGaloisRepresentations

- §2.3 (`dirichletCharacterToGalois`): the primitive character attached to a character of `G_ℚ` with open kernel.
  Used in 0.2.

### From TauCetiRoadmap.QuasiRiemannHypothesis

- §5.4: for an abelian field `K`, the character group `X(K)` of the primitive characters inducing the characters modulo
  `f_K` trivial on the subgroup fixing `K`; `χ′ ↦ χ′*` is injective, identifies `X(K)` with the character group of
  `Gal(K/ℚ)` and is multiplicative for the product "primitive character inducing `ψψ′`"; the characters modulo any level
  `f` with `K ⊆ ℚ(ζ_f)` trivial on the subgroup fixing `K` have the same primitive characters. Used in 0.2 (i), (iv), (v).

### From TauCetiRoadmap.AnalyticNumberTheoryPartI

- §0.30: the narrow ray class group of `ℚ` of modulus `(N)·∞` is `(ℤ/N)^×` through positive generators. Used in 0.2.
- §2.18a, one-dimensional comparison: for a finite-order Galois character `ψ` with primitive Hecke character `ψ̃`, the
  local factors agree at every place, both being `1` where `ψ` is ramified, and the conductor of `ψ̃` is the Artin
  conductor of `ψ`. Used in 0.2 (iii).
- §0.34a (`quadratic_character_eq_fundamentalDiscriminantChar`): a primitive nonprincipal real Dirichlet character of
  conductor `q` is the Kronecker character of `χ(−1)q`; the only primitive real character of an odd prime-power conductor
  is the Legendre character of conductor `p`, and those of `2`-power conductor are `χ₋₄`, `χ₈` and `χ₋₈`. Used in 0.3 and
  1.4.

### From TauCetiRoadmap.Multiquadratic

- Layer 1, the prime-splitting law: for squarefree `d₁, …, d_n` and an odd prime `p ∤ d₁⋯d_n`, the Frobenius at `p` in
  `ℚ(√d₁, …, √d_n)` is `((d₁/p), …, (d_n/p))` under `Gal ≅ 𝔽₂^n`. Used in 0.4 (v), 0.6 and 0.9 (i).

### From TauCetiRoadmap.IntegralIwasawaTheory

- §0.2: the `n`-th layer of the cyclotomic `ℤ₂`-extension, `ℚ_n ⊂ ℚ(μ_{2^{n+2}})`. Used in 0.4.

### From TauCetiRoadmap.ZerosOfLFunctions

- §6.3 (`IsExceptionalZero`). Used in 1.4.

### From RiemannHypothesisStatementsAndConsequences, a sub-roadmap of this family

- §8.4a (a)–(b): Riesz sums and the Riesz remainder `G_χ` of a primitive character
  (`PrimitiveDirichletCharacter.rieszRemainder`), with the normalisation of the Conventions. Used in 1.1, 1.2, 1.4.
- §8.8a: the Riesz-sum identity for a surjection of a ray class group onto a finite abelian group. Used in 1.2.
- §10.3: the bundled primitive Dirichlet character `PrimitiveDirichletCharacter`. Used in 0.5.

### From RieszSumsOverPrimesAndExceptionalZeros, a sub-roadmap of this family

- §1.4h (a) and (b′)–(c′), the form of the formal proof of (b), (c): Lipschitz and size bounds of the Riesz remainder: for
  an absolute `C_Λ` and every primitive `χ ≠ 1`:
  (a) `|w·G_χ(a/w) − w′·G_χ(a/w′)| ≤ 3(a/min(w, w′))|w − w′|` (and for `G_1`); (b′) `|G_χ(y) − G_χ(z)| ≤ |y − z|(log max(y, z) + C_Λ + |(L′/L)(1, χ)|)`, `|G_1(y) − G_1(z)| ≤ C_Λ|y − z|` for `y, z ≥ 1`; (c′) `|G_χ(y)| ≤ y(log y + C_Λ + |(L′/L)(1, χ)|)`, `|G_1(y)| ≤ C_Λy`
  for `y ≥ 1`. Used in 1.7, 1.9.
- §1.4i: (c′), the form of the formal proof: for every `c₀ > 0` there are `C, c > 0` with
  `|G_χ(y)| ≤ C·y·(log 3f_χ)^5·exp(−c·log y/(√(log y) + log f_χ))` for `y ≥ 2` and every primitive `χ ≠ 1` such that, if `χ` is
  real, `L(s, χ)` has no real zero in `(1 − c₀, 1)`, and `|G_1(y)| ≤ Cy·exp(−c√(log y))`; (b) for a finite
  abelian `E/ℚ` and `c_ex ∈ (0, 1/2]` with `1 − β ≥ c_ex` for every exceptional zero of a real `χ*`, `χ ∈ Ĝ`: for every
  `α ∈ [1/2, 1)` there is `y₀(α, c_ex)` with `|G_{χ*}(y)| ≤ y·exp(−c₁(log y)^{1−α})` for all `χ ∈ Ĝ` and `y ≥ y₀` with
  `log f_E ≤ (log y)^α`, `c₁` absolute; (b′), the form of the formal proof: the same with `c₁ = c₁(c_ex)`, when no `L(s, χ*)`,
  `χ ∈ Ĝ` real and nonprincipal, has a real zero in `(1 − c_ex, 1)`. Used in 1.4.

### From QuadraticTwistSelectionOverPrimes, a sub-roadmap of this family

- §2.7c (a′)–(c′) and §2.7d (ii′) at its instance, the forms of the formal proof (box width `1/400`): twisting by two primes
  chosen in succession, `q ≡ 3 (mod 8)` and `d ≡ 7 (mod 16)` with `q·∏_{3≤p≤z} p | d + 1` (`z = Y^{ε/5}`, `0 < ε < 1/52`); for
  a proportion at least `1 − η` of the `q`, and for each such `q` of the `d`, for every primitive `ξ` inducing a character
  modulo `N₀` and `(i, j) ∈ {0, 1}² ∖ {(0, 0)}`, the primitive character `χ` inducing `ξ·(·/q)^i·(·/d)^j` satisfies (a′)
  `L(s, χ) ≠ 0` for `Re s > 1 − 1/400` and `|Im s|` at most the box height (`N₀U₁` if `j = 0`, `N₀U₁U₂` if `j = 1`), (b′)
  `|(L′/L)(1, χ)| ≤ C log Y` with an absolute `C`, and (c′) `|G_χ(y)| ≤ y^{1/2+τ}` for every `y ∈ [Y, Y^K]`. Used in the
  remark of 1.9.

### From Mathlib

- Cyclotomic Galois theory (`IsCyclotomicExtension.Rat.galEquivZMod`, `…galEquivZMod_stabilizer`, `…inertiaDegIn_eq`,
  `…intermediateFieldEquivSubgroupChar`, `…mem_intermediateFieldEquivSubgroupChar_iff_conductor_dvd`),
  `IntermediateField.fixedField`, `NumberField.IsCMField`, `NumberField.IsCMField.of_isAbelianGalois`, Dirichlet
  characters (`DirichletCharacter`, `DirichletCharacter.primitiveCharacter`), Jacobi and Legendre symbols
  (`jacobiSym.quadratic_reciprocity`, `jacobiSym.at_two`, `jacobiSym.at_neg_one`, `legendreSym`), Bertrand's
  postulate (`Nat.exists_prime_lt_and_le_two_mul`), Behrend's construction (`Behrend.sphere`, `Behrend.map`,
  `Behrend.map_injOn`, `Behrend.exists_large_sphere`, `Behrend.threeAPFree_sphere`, `ThreeAPFree`), strict convexity
  (`norm_combo_lt_of_ne`), `sum_hom_units`, and probability (`ProbabilityTheory.IndepFun.variance_sum`,
  `ProbabilityTheory.meas_ge_le_variance_div_sq`, `MeasureTheory.mul_meas_ge_le_integral_of_nonneg`,
  `MeasureTheory.Measure.pi`, `PMF.bernoulli`), as named in the targets.

## References

- [FormalProof] Levent Alpöge, the Lean formalization of the Riemann hypothesis and of the Riemann hypothesis for
  Dirichlet L-functions announced in [Announcement]; source with a public verification setup:
  <https://github.com/leanprover-community/riemann-hypothesis>. The files cited are those of the source as published,
  the repository's first commit
  <https://github.com/leanprover-community/riemann-hypothesis/tree/40e56bab026552e089d7afcfeff08d2defb9c005>, and
  their paths are relative to its directory `src/`. It is the reference of every *NEW* target.
- [Announcement] Levent Alpöge, the announcement of that proof, 20 November 2026: <https://alpo.ge/remark.pdf>.
- F. A. Behrend, *On sets of integers which contain no three terms in arithmetical progression*, Proc. Nat. Acad. Sci.
  USA 32 (1946), 331–332; I. Z. Ruzsa, *Solving a linear equation in a set of integers I*, Acta Arith. 65 (1993),
  259–282: 0.8, 0.8a.
- L. C. Washington, *Introduction to Cyclotomic Fields*, ch. 14 (Kronecker–Weber) and ch. 3 (characters of abelian
  fields): 0.2, 0.4.
- J. Neukirch, *Algebraic Number Theory* (1999), Hilbert's reciprocity law: 0.1.
- P. L. Chebyshev, *Mémoire sur les nombres premiers* (1852): 0.9 (Bertrand's postulate).
- H. Davenport, *Multiplicative Number Theory*, ch. 19–20 (de la Vallée Poussin, Landau, Page): 1.4.
