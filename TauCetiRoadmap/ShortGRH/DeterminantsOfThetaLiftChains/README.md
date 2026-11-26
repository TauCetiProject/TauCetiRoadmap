# Roadmap: determinants of theta lift chains

**Summary.** The roadmaps of the family `ShortGRH` prove the Riemann hypothesis for Dirichlet L-functions by one
route. A one-sided bound for a weighted sum over primes gives a zero-free half-plane
([OneSidedPrimeSumBoundsAndAdmissibleData](../OneSidedPrimeSumBoundsAndAdmissibleData/README.md)). The bound comes from
comparing an upper and a lower bound for the covolume of one lattice: the space `𝒯` of target forms, good automorphic
forms of principal level on a unitary group `U(Y₀)`, together with the chains `Θ_ξ` of `m` theta lifts from `U(Y₀)` to a
definite unitary group `U(Y_m)`, one chain for each twist `ξ`. Short forms (Theorem A) and few translates that span
(Theorem B) give the upper bound. This roadmap gives the lower bound, Theorem C: for every family of independent target
forms that spans almost all of `𝒯`, the covolume plus twice the index is at least `d·(h_main − 3·f·a·(log b)⁴)`, where
`d = dim 𝒯` and `h_main` is the main amount of the data.

The product formula for a twisted lattice (stated in the data roadmap) reduces Theorem C to three inputs, and this
roadmap supplies them. (i) Auxiliary forms: target forms that complete a family to a basis, whose twisted chains are
integral away from the twist after division by one explicit scalar, and whose untwisted chains are short (Layers 5 and
6). (ii) A twist for each prime: a family `ξ_ι`, one twist for each prime `ℓ` and each isomorphism `ι : ℂ ≃ ℚ̄_ℓ`, whose
ratios of twisted to untwisted Hecke L-values have small height (Layer 1; the existence of such a family is proved in
`CongruencesOfTwistedThetaLifts`). (iii) A height bound for the ratio `Z(1)/Z(ξ_ι)` of the Gram determinants of the
chain: it factors into the Gram determinants `Z_j` of the single lifts, which NormsOfThetaLiftsAndExchangeIdentities §7.5
bounds, times ratios of Hecke values (Layer 4). The Gram operator of one lift comes from the Rallis inner product
formula (Layer 2); that of the chain comes from moving lifts past each other in the squares of a triangle of unitary
groups, by an exchange identity between theta integrals of complementary spaces (Layer 3).

Layer 1 defines ratios of Hecke values, the pairs that carry them and the families of twists. Layer 2 computes the norm
of one lift. Layer 3 proves the exchange identity and its form on one square. Layer 4 computes the Gram operator of the
chain and factors its determinant. Layer 5 moves periods through two grids of unitary groups to build forms with
integral twisted lifts. Layer 6 assembles the auxiliary forms and proves Theorem C.

## Conventions and notation

**Roadmaps and sources.** A roadmap name of the family `ShortGRH` refers to that roadmap; every other roadmap name
refers to a roadmap of the library, in the family `RiemannHypothesisForDirichletLFunctions` or in another area. A
roadmap is cited by section number: `Name §k.n (what is taken)` points to section `k.n` of the roadmap `Name`, and the
words in the parenthesis say what is taken from it. `ShortGRH background (…)` names a result that the family uses and
that no roadmap section states in the form used; the words say which form, and the entry ends with the file and
declaration of `[ShortProof]` that prove it. `[ShortProof]` is the formal proof of the Riemann hypothesis for Dirichlet
L-functions whose route the family states (References); the pointer line of a section names the file under its
directory `src/` and the declaration that proves the statement. The labels are those of the
[index of the family](../README.md): `*Origin:*` says where a statement comes from (published, adapted, particular to
this proof, this roadmap's own formulation, or definitions and conventions), and `*Method of the formal proof:*` says
how [ShortProof] proves it.

**The data.** Throughout, `D` denotes admissible data in the sense of OneSidedPrimeSumBoundsAndAdmissibleData §3.2,
which, with §2.1 and §2.2 (the parameters and the field), §4.1 (the amounts `h_dir`, `h_main` and the error unit) and
DivisibilityOfThetaDerivatives §1.5 (the chosen places), fixes the following, written with the letters of that
roadmap. `E` is a CM field, `K = ℚ(√−d)` its
imaginary quadratic subfield, `Φ_E` the set of its `f` infinite places, `τ` an infinite place. The chosen places are the
finite places of `E` dividing an integer `π_M` of `E` with `π_M π̄_M = M = p₀p₁`; their residue fields are `k_w`, and
`G₀ = ∏_w GL_r(k_w)` over the chosen places. `N` is the level. The ranks are `m` (the number of lifts), `r`,
`k = r + 1 − m` and `t = 5r`; `Δ` is the gap and `κ_j(τ)` the weight of lift `j` at `τ`. The scales are `x`, `x₁`, `b`
(integers, with the inequalities of OneSidedPrimeSumBoundsAndAdmissibleData §3.2 between them) and `a = x·b`. `h_dir` is the cost of one direction,
`h_main = m·k·h_dir` the main amount, `f·a·(log b)³` the error unit and `β_tot = f·a·(log b)³/(m·k)` the denominator
budget. Inequalities between these numbers that follow from the inequalities of the data are used without comment.

**Characters of `U(1)`.** `[U(1)]` is the quotient of the norm-one ideles of `E` by the norm-one elements of `E`; a
character of `[U(1)]` is a continuous character of this compact group. It has weight `w : Φ_E → ℤ` and tame part
`ψ = (ψ_v)` (a character `ψ_v` of `k_v^×` for each finite place `v`, almost all trivial) if it is `u ↦ ∏_τ u_τ^{w(τ)}` on
the infinite part and `∏_v ψ_v(u mod v)` on integral finite parts. Its base change is the Hecke character
`ν̃(x) = ν(x/x̄)` of `E`, and `L^S(z, ν)`, for real `z ≥ 1`, is the partial Hecke L-value of `ν̃` with the Euler factors
at `S` and at the conjugates of `S` removed: the Euler product for `z > 1`, and at `z = 1` its limit as `z → 1⁺`,
which is the value of the continued L-function. The product does not converge absolutely at `z = 1`; the limit exists
and is nonzero when `ν` has nonzero weight and `S` contains its ramified places, because `ν̃` is then a nontrivial
unitary Hecke character, and every `L^S(z, ν)` of this roadmap is of that kind. For a finite set `S` of finite places
and `e ≥ 0`,
`L_*(S, ν, e) = (∏_{v∈S} q_v)^{e²} · ∏_{z=1}^{e} |L^S(z, ν)|²`, `q_v` the norm of `v`.
A modulus is a nonzero ideal `𝔪` of `O_E` divisible by no prime together with its conjugate; `ν` is tame for `(𝔪, χ)`
with weight `w` if `𝔪 ≠ (1)`, `ν` has weight `w` and a tame part `ψ` with `ψ_v ≠ 1` exactly for the primes `v | 𝔪`, and
`χ = ∏_{v|𝔪} ψ_v(· mod v)` on `O_E/𝔪`. The splitting character `υ` of the Weil data is a Hecke character of `E` whose
restriction `υ₁` to the norm-one ideles has weight `1` and trivial tame part. A space of rank `n` that carries the
character `α` of `[U(1)]` has the splitting character `α̃·υ^{−n}`.

**Hermitian spaces and theta integrals.** `E` carries Weil data (DivisibilityOfThetaDerivatives §1.4): a CM type, the
splitting character `υ`, an element `ȷ` with `ȷ̄ = −ȷ`, `Im τ(ȷ) > 0` for every `τ` of the CM type and `(1 − ȷ⁻¹)/2` an
algebraic integer, a finite idele `α` with `v_w(ȷαᾱ) = −v_w(𝔇_E)` at every finite place `w`, which is the condition
that the integral finite adeles are self-dual under `(z, u) ↦ ψ_f(ȷαᾱzu)` for the standard additive character `ψ_f`,
and a primitive root of unity of order `5040` in `E`, so that `E/E⁺` is unramified at every finite place. A
hermitian space of rank `n` with signs `s ∈ {±1}^n` is a hermitian matrix over `E` with an adelic frame that is
orthonormal for `diag(s)` at every infinite place and for the identity at every finite place; `neg(s)` is the number of
signs `−1`, and the space is positive definite if all signs are `+1`. `U(S)(𝔸)` is its adelic unitary group, `[U(S)]` the
quotient by the rational points with its invariant measure, and a form of type `e` is a bounded automorphic function on
`U(S)(𝔸)` reproduced by the kernel `e` at the infinite places (a type is a discrete series coefficient, given by a doubled
Harish-Chandra parameter `l`). For a pair `(S, T)` the Weil representation of `U(S) × U(T)` acts on the Schwartz space of
`Hom(S, T)(𝔸)`; its archimedean part is read in the Fock model, and a real vector is Schwartz if all its moments are
finite. The theta kernel `θ^{S,T}_{α,β}(φ)(g, h)` of a datum `φ` is formed with `S` carrying the character `α` and `T`
the character `β` of `[U(1)]`, that is, `θ^{S,T}_{α,β}(φ)(g, h) = α(det h)·β(det g)⁻¹·θ(ω(g, h)φ)` for `g ∈ U(S)(𝔸)`,
`h ∈ U(T)(𝔸)`, with `ω` the Weil representation and `θ` the theta functional of `Hom(S, T)`: the character written in
the position of `S` is evaluated at the variable of `T`, and every later "the character `α` for (or on) `S`" means this
kernel;
the theta integral over `[U(T)]` is a function on `U(S)(𝔸)`. `H` is the hyperbolic plane (rank `2`, spanned by two
isotropic vectors with inner product `1`, one sign `+1` and one `−1`) and `H^p` the sum of `p` copies. For a modulus `𝔪`, a
function `Φ` on matrices over `O_E/𝔪`, and a real vector `v`, the datum `(v, Φ)` is `v` at the infinite places, `Φ` (read
through the frames) at the primes dividing `𝔪`, and the characteristic function of the standard lattice elsewhere. An
edge from a type `e` to a type `e′` is a real datum whose theta lift carries forms of type `e` to forms of type `e′` and
whose transposed lift carries forms of type `ē′` to forms of type `ē`; the Fock vector of a joint harmonic polynomial
of two corresponding parameters is an edge between their types (the background entry of 3.1).

**Matched functions.** Let `R` be a commutative ring, `χ` a multiplicative character of `R`, and `σ : b ⊔ a ≃ n` a
splitting of an index set. For `k ∈ GL_n(R)` let `y_k` be the columns of `k` indexed by `b` and `x_k` the rows of `k⁻¹`
indexed by `a`. Functions `Φ` on `a × n` matrices and `Ψ` on `n × b` matrices are matched (over a subring `O` of `R`) if
`Φ` vanishes off the `x_k`, `Ψ` vanishes off the `y_k`, `k ∈ GL_n(O)`, and `Φ(x_k) = χ(det k)·Ψ(y_k)` for all such `k`.

**Forms, lifts and twists.** These objects are those of ThetaLiftChainsAndTheSeesawIdentity §2.1 (the spaces `Y_j`,
`W_j`, `V_j`), §2.4 (the target parameter), §2.5 (the group `G₀` and the idempotent `e₀`), §2.7 (the forms of level
`J_M`, the good forms and the target forms) and of OneSidedPrimeSumBoundsAndAdmissibleData §3.4 (tame characters,
twists and the characters `μ_j⁰`); they are restated here. `Y_j` is the hermitian space of rank `r + j·t` (`0 ≤ j ≤ m`), `Y_m` is definite, and `Y₀` has a
fixed parameter `λ^Y` (the target parameter) at the infinite places. `W_j` (`1 ≤ j ≤ m`) has rank `r` and differs from
`Y₀` only in its signs at the infinite places (`m − j` signs `−1`); `V_j` is the positive definite space of rank `r + t`.
`J_M` is the level that is principal at the chosen places and maximal elsewhere, and `𝒜(Y)` is the space of forms of
parameter `λ^Y` and level `J_M` on a space `Y` of rank `r`; `G₀` acts on it. `e₀` is the idempotent of the group algebra
of `G₀` given by the good families of labels, the good forms are `𝒢(Y) = e₀𝒜(Y)`, the target forms are `𝒯 = 𝒢(Y₀)`, and
`d = dim 𝒯`. A tame character `ϑ` is a character of `[U(1)]` of weight `0` whose tame part is supported on a finite set
`Q(ϑ)` of finite places, prime to `M·N` and disjoint from its conjugate; `Nm Q(ϑ) = ∏_{v∈Q(ϑ)} q_v`. A twist is a tame
character whose tame part is nontrivial at every place of `Q(ϑ)`; an `m`-fold twist is one whose tame part has
nontrivial `n`-th power at every place of `Q(ϑ)` for `1 ≤ n ≤ m`; `1` is the trivial twist. `μ_j⁰` is the character of
lift `j` at the trivial twist (weight `−κ_j`, tame part `ω^j` for a fixed family `ω` of residue characters, trivial off the
chosen places and of order above `8m` at them); lift `j` of the chain at the twist `ϑ` carries `μ_j⁰·ϑ^j`. The single lift
`Θ_{j,ϑ} : 𝒜(W_j) → 𝒜(V_j)` is the theta lift of the descent pair `(W_j, V_j)` of lift `j` with the twist `ϑ`
(ThetaLiftChainsAndTheSeesawIdentity §2.16 (descent pairs), §2.18 (the descent pairs `(W_j, V_j)` of the chain); the
lift of a descent pair is that of 2.1), where `𝒜(V_j)` denotes the
algebraic forms on `U(V_j)` of the weight and level of the pair, with the class-sum product. The chain
`Θ_ϑ : 𝒜(Y₀) → (forms on Y_m)` is the composite of the `m` lifts `Y_{j−1} → Y_j`, lift `j` twisted by `ϑ^j`, with values
in the algebraic forms of the last level `J_ϑ(Y_m)` (block upper triangular modulo `Q(ϑ)`) and its character
(ThetaLiftChainsAndTheSeesawIdentity §2.6 (the levels of the lifts), §2.15 (the chain of lifts `Y₀ → Y_m`)). On `𝒯` it is written `Θ_ϑ` as well.

**Integrality, sizes and heights.** `ι` runs over the pairs of a prime `ℓ` and an isomorphism `ι : ℂ ≃ ℚ̄_ℓ`. An
algebraic form on a definite group is integral at `ι` if its values, in the integral coordinates of the weight
representation, have `ι`-adic absolute value at most `1`; for a form `Ξ` and an automorphism `σ` of `ℂ`, `‖Ξ‖²_σ` is the
squared norm of the `σ`-conjugate of `Ξ` (OneSidedPrimeSumBoundsAndAdmissibleData §1.3, §5.1). A family `(y_ι)` of
complex numbers has height at most `c` in the sense of OneSidedPrimeSumBoundsAndAdmissibleData §1.2 (heights of
families indexed by the `ι`). The target forms with the maps `Θ_ξ`, `ξ` an `m`-fold twist, form the twisted lattice of
OneSidedPrimeSumBoundsAndAdmissibleData §5.1 (the target lattice), with its notions of index at most `δ` and covolume
at most `c` (OneSidedPrimeSumBoundsAndAdmissibleData §1.3 (twisted lattices, index and covolume)).

**Determinants.** For a linear map `u` between finite-dimensional Hilbert spaces, `vol(u) = det(u*u)`. For an `m`-fold
twist `ϑ`, `Z(ϑ) = vol(Θ_ϑ|𝒯)` and, for `1 ≤ j ≤ m`, `Z_j(ϑ) = vol(Θ_{j,ϑ^j}|𝒢(W_j))`.

### Table of symbols

| Symbol | Meaning | Defined |
|---|---|---|
| `D, E, K, Φ_E, f, τ` | the data, its CM field, `ℚ(√−d)`, the infinite places of `E`, their number, an infinite place | OneSidedPrimeSumBoundsAndAdmissibleData §2.1, §2.2, §3.2 |
| `π_M, M, k_w, G₀, N` | generator of the product of the chosen places, `π_Mπ̄_M = M`, residue fields, `∏ GL_r(k_w)`, the level | OneSidedPrimeSumBoundsAndAdmissibleData §3.2; DivisibilityOfThetaDerivatives §1.5; ThetaLiftChainsAndTheSeesawIdentity §2.5 |
| `m, r, k, t, Δ, κ_j` | number of lifts, rank, `r + 1 − m`, `5r`, gap, weight of lift `j` | OneSidedPrimeSumBoundsAndAdmissibleData §3.2 |
| `x, x₁, b, a, h_dir, h_main, β_tot` | scales, `a = xb`, cost of a direction, main amount `m k h_dir`, budget `f a (log b)³/(m k)` | OneSidedPrimeSumBoundsAndAdmissibleData §3.2, §4.1; Conventions |
| `[U(1)], ν̃, L^S(z, ν), L_*(S, ν, e)` | norm-one idele class group, base change, partial L-value, `(∏_S q_v)^{e²}∏_{z≤e}|L^S(z,ν)|²` | Conventions |
| `υ, υ₁, j` | splitting character, its restriction to `[U(1)]`, skew element | Conventions; DivisibilityOfThetaDerivatives §1.4 |
| `Y_j, W_j, V_j` | spaces of the chain, of the single lifts, definite targets | ThetaLiftChainsAndTheSeesawIdentity §2.1 |
| `J_M, 𝒜, 𝒢, e₀, 𝒯, d` | level, forms of level `J_M`, good forms, good idempotent, target forms, `dim 𝒯` | ThetaLiftChainsAndTheSeesawIdentity §2.5, §2.7; Conventions |
| `ϑ, ξ, Q(ϑ), Nm Q(ϑ)` | tame character or twist, a twist of a family, its places, their norm | OneSidedPrimeSumBoundsAndAdmissibleData §3.4 |
| `μ_j⁰, ω` | character of lift `j`, residue characters at the chosen places | OneSidedPrimeSumBoundsAndAdmissibleData §3.4; DivisibilityOfThetaDerivatives §1.5 |
| `Θ_{j,ϑ}, Θ_ϑ` | single lift `W_j → V_j`, chain `Y₀ → Y_m` | ThetaLiftChainsAndTheSeesawIdentity §2.18, §2.15; 2.1 |
| `Z(ϑ), Z_j(ϑ)` | the two determinants | Conventions; 4.4 |
| `c_Q(ϑ), Ral_{j,ϑ}` | twist factor, Rallis series operator | 2.2 |
| `Λ(ν, s; ϑ), R^quo_{ij}, R^turn_{ij}` | ratio products of Hecke values | 1.1 |
| `𝔟, 𝔪₀(ϑ), 𝔪(ϑ)` | `π_M^b`, `π_M Q(ϑ)`, `π_M^b Q(ϑ)` | 5.3 |
| `n_m` | the rank `k + m(t + 1)`; `2n_m` bounds the ranks of the nodes of the two grids | OneSidedPrimeSumBoundsAndAdmissibleData §3.2; 5.3 |
| `K₀` | on a space with a standard basis, the group of finite points of the unitary group that stabilise the standard lattice | 4.3 (d), 5.10 (a) |
| `H, H^p` | the hyperbolic plane, the sum of `p` copies | Conventions |
| `Y^a_b, Ỹ^b_a, Θ^♭, res^♭` | the two grids, the transposed chain of `Ỹ`, the flat restriction | 5.3, 5.7 |

## Layer 1: Ratios of Hecke values and families of twists

The twists enter the lower bound through ratios of twisted to untwisted Hecke L-values. This layer fixes the pairs that
carry them, the ratio products that occur as moduli of constants in Layers 4 and 5, and the conditions on a family of
twists, one for each prime, under which Theorem C is proved.

### 1.1 Critical pairs and ratio products

*Origin:* definitions and conventions.

*Method of the formal proof:* definitions; the lemmas in (f) are direct computations with weights and tame parts.

(a) A critical pair `p = (ν, z)` is an integer `1 ≤ z ≤ t` and a character `ν` of `[U(1)]` of weight `−c`, with
`z ≤ c(τ) ≤ 4b` at every infinite place, whose tame part is trivial off the chosen places. It is ramified if its tame
part is nontrivial exactly at the chosen places. It is a main pair for `j`, `1 ≤ j ≤ m`, if `z ≥ 10`, `m < z ≤ r`, its
tame part is `ω^j` and `κ_j(τ) + r − t ≤ c(τ) ≤ κ_j(τ)` at every `τ`.

(b) For a critical pair `p`, a tame character `ϑ` and `s = ±1`, the ratio is
`ratio(p, ϑ, s) = |L^{𝒞∪Q(ϑ)}(z, (νϑ^s)⁻¹)| / |L^{𝒞}(z, ν⁻¹)|`, `𝒞` the set of chosen places.

(c) For a character `ν` of `[U(1)]`, an integer `s ≥ 0` and a tame character `ϑ`,
`Λ(ν, s; ϑ) = ∏_{z=1}^{s} |L^{𝒞∪Q(ϑ)}(z, (νϑ)⁻¹)| / |L^{𝒞}(z, ν⁻¹)|`.

(d) For `0 ≤ i < j ≤ m` and an `m`-fold twist `ϑ`, `R^quo_{ij}(ϑ) = Λ(μ_j⁰/μ_i⁰, t; ϑ^{j−i})`; for `0 ≤ i, j < m`,
`R^turn_{ij}(ϑ) = Λ(μ_{i+1}⁰·μ_{j+1}⁰, t; ϑ^{j+1})`.

(e) A function `F` of the `m`-fold twists is a ramified ratio if there are a ramified critical pair `(ν, z)` and
`1 ≤ n ≤ m` with `F(ϑ) = Λ(ν, z; ϑ^n)` for all `ϑ`. A function `c` of the `m`-fold twists has modulus `F` up to a norm power
if there are a real `C` (possibly `0`) and an integer `k` with `|c(ϑ)|² = C·Nm Q(ϑ)^k·F(ϑ)²` for all `ϑ`.

(f) Prove: a main pair is ramified; `R^quo_{ij}` (`i < j ≤ m`) and `R^turn_{ij}` (`i, j < m`) are ramified ratios, with
the pairs `((υ₁^{−Δ}χ_M)^{j−i}, t)` of weight `−(j−i)Δ` and `(μ_{i+1}⁰μ_{j+1}⁰, t)` of weight `−(κ_{i+1} + κ_{j+1})`, where
`χ_M` is the character of weight `0` and tame part `ω` with `μ_j⁰ = μ_0⁰(υ₁^{−Δ}χ_M)^j`; a ramified ratio is `≥ 0` and
equals `1` at the trivial twist.

*Needs:* OneSidedPrimeSumBoundsAndAdmissibleData §3.2 (the data: `t`, `b`, the weights `κ_j`, the gap `Δ`),
§3.4 (twists and the characters `μ_j⁰`); DivisibilityOfThetaDerivatives §1.5 (the chosen places and the residue
characters `ω`), §1.6 (critical pairs, defined with the chosen places, and the character `χ_M`).

[ShortProof], `New/Determinant/Twist/FitTwists.lean` (`New.Data.CriticalPair.ratio`, `New.Data.CriticalPair.IsMainPair`,
`New.Data.CriticalPair.IsMainPair.isRamified`); `New/Determinant/Chain/Moduli.lean` (`New.Data.lRatioProd`,
`New.Data.quotientRatio`, `New.Data.IsRamifiedRatio`, `New.Data.HasAbsUpToNormPower`,
`New.Data.isRamifiedRatio_quotientRatio`); `New/Determinant/AuxiliaryForms/Turns.lean` (`New.Data.turnRatio`,
`New.Data.isRamifiedRatio_turnRatio`)

### 1.2 Moduli up to norm powers and twisted pair characters

*Origin:* particular to this proof: the calculus of constants of known modulus up to a power of `Nm Q(ϑ)`, and the
L-value product of a twisted ramified pair.

*Method of the formal proof:* the closure properties are algebra of the defining identity; for (c) the twisted character
is tame because the tame parts at the chosen places and at `Q(ξ)` have disjoint supports, and its partial L-values are
those of `ν` times the ratios, the Euler factors at the places of `Q(ξ)` being removed on both sides.

(a) If `c` has modulus `F` and `c′` modulus `F′` up to norm powers, then `c·c′` has modulus `F·F′`, `c⁻¹` modulus `F⁻¹`,
a finite product modulus the product, and a constant `a` has modulus `1`; if `|c(ϑ)|²·Nm Q(ϑ)^{−k}` is a fixed number for
some integer `k`, then `c` has modulus `1`.

(b) If `c` has modulus `F` up to a norm power, `F(1) = 1`, `F ≥ 0` and `c(1) ≠ 0`, then there is an integer `e` with
`|c(ϑ)/c(1)| = Nm Q(ϑ)^{e/2}·F(ϑ)` for every `m`-fold twist `ϑ`.

(c) Let `(ν, z)` be a ramified critical pair of weight `−c`, `ξ` a twist and `e ≥ 1`, and put
`𝔪 = π_M^e·∏_{v∈Q(ξ)} v`. Then `νξ` is tame for `𝔪` with weight `−c` and `(νξ)⁻¹` with weight `c` (with the characters of
`O_E/𝔪` given by their tame parts), and for `s = ±1`
`L_*(places of 𝔪, (νξ)^s, z) = L_*(𝒞, ν, z)·Nm Q(ξ)^{z²}·Λ(ν, z; ξ)²`.

*Needs:* 1.1; IdelicReciprocityCountsAndCyclotomicClassGroups §8.5 (the partial L-value `L^S(z, ν)` of a character of `[U(1)]` for real `z ≥ 1`, as an
Euler product and its limit at `1`; `L^S(z, ν⁻¹) = L^S(z, ν)` when the tame part of `ν` is trivial off `S`; no zero on
`z ≥ 1` when the weight is not `0` and `S` is finite).

[ShortProof], `New/Determinant/Chain/Moduli.lean` (`New.Data.HasAbsUpToNormPower.exists_norm_div_eq`,
`New.Data.CriticalPair.isTameFor_mul_and_lValueProd_eq`)

### 1.3 Small ratios, denominators and regular families of twists

*Origin:* definitions and conventions.

*Method of the formal proof:* definitions.

A family of `m`-fold twists `θ = (θ_ι)`, one for each `ι`, is said to have:

(a) small ratios if `Nm Q(θ_ι)` is prime to the prime `ℓ` of `ι`, and for every `1 ≤ j ≤ m`, every ramified pair `p` and
`s = ±1` the family `ι ↦ ratio(p, θ_ι^j, s)⁻¹` has height at most `x₁`;

(b) (a property of one twist, not of a family) a twist `ϑ` has denominators at most `β` at `ι` for `1 ≤ j ≤ m` if two
things hold. Let `Z ⊂ 𝒜(V_j)` be the range of
`Θ_{j,ϑ}` on `𝒢(W_j)` and `pr` the orthogonal projection onto `Z`. First, some endomorphism `A` of `Z` with
`|ι(det A)| ≥ exp(−dim Z·r·β)` makes `A(pr y)` integral at `ι` for every form `y` integral at `ι` and orthogonal to the
false lifts (forms orthogonal to `Z`, in the image of `e₀`, killed by the Hecke polynomial operator at its test value at
some split place off the level: NormsOfThetaLiftsAndExchangeIdentities §1.3). Second, for every main pair `p`
for `j` and any two test forms `Ξ, Ξ′` of the rank-one lift of `p` twisted by `ϑ` (NormsOfThetaLiftsAndExchangeIdentities
§1.3 (c) for test forms, §2.5 for the lift of a pair), the inner product of their projections to the line of that lift
has `ι`-adic absolute value at most `exp(β)`;

(c) a denominator bound `γ` for `1 ≤ j ≤ m` if `γ : primes → ℝ` has `∑_{ℓ∈T} γ(ℓ) ≤ β_tot` for every finite set `T` of
primes and `θ_ι^j` has denominators at most `γ(ℓ)` at every `ι` above `ℓ`;

(d) regular if it has small ratios and a denominator bound for every `1 ≤ j ≤ m`.

Numbers `e(ℓ) ≥ 0` are negligible with exponent `C` if `∑_{ℓ∈T} e(ℓ) log ℓ ≤ x^C` for every finite set of primes `T`.

*Needs:* 1.1; 2.1 (the lift of a descent pair, of which `Θ_{j,ϑ}` is a case); NormsOfThetaLiftsAndExchangeIdentities
§1.3 (false lifts and test forms), §2.5 (the rank-one lifts of the main pairs);
OneSidedPrimeSumBoundsAndAdmissibleData §1.2 (heights of families indexed by the `ι`).

[ShortProof], `New/Determinant/Twist/FitTwists.lean` (`New.Data.HasSmallRatios`, `New.Data.ClearsProjection`,
`New.Data.HasDenominatorsLe`, `New.Data.IsDenominatorBound`, `New.Data.IsRegularFamily`, `New.Data.IsNegligible`)

### 1.4 Heights of inverse ratios along a family with small ratios

*Origin:* particular to this proof: a family with small ratios makes every product of ramified ratios and of powers of
`Nm Q` a family of controlled height.

*Method of the formal proof:* a ramified ratio is a product of at most `t` ratios of one ramified pair at a power of the
twist, each of inverse height at most `x₁`; heights add in products, and a power of `Nm Q(θ_ι)` costs nothing because
`Nm Q(θ_ι)` is prime to the prime of `ι` (product formula).

Let `θ` have small ratios, `e` an integer, and `F_a` (`a` in a finite set `A`) ramified ratios. Then the family
`ι ↦ (Nm Q(θ_ι)^{e/2}·∏_{a∈A} F_a(θ_ι))⁻¹` has height at most `#A·t·x₁`. In particular
`ι ↦ (Nm Q(θ_ι)^{e/2}·∏_{1≤i<j≤m} R^quo_{ij}(θ_ι))⁻¹` and `ι ↦ (Nm Q(θ_ι)^{e/2}·∏_{0≤i,j<m} R^turn_{ij}(θ_ι))⁻¹` have
height at most `m²·t·x₁`.

*Needs:* 1.1, 1.3; OneSidedPrimeSumBoundsAndAdmissibleData §1.2 (heights: products, monotonicity, powers of integers
prime to the prime of `ι`).

[ShortProof], `New/Determinant/Chain/Moduli.lean` (`New.Data.HasSmallRatios.heightLe_inv_rpow_mul_prod`);
`New/Determinant/Chain/NormOfChain.lean` (`New.Data.HasSmallRatios.heightLe_inv_rpow_mul_prod_quotientRatio`);
`New/Determinant/Twist/LongForms.lean` (`New.Data.HasSmallRatios.heightLe_inv_rpow_mul_prod_turnRatio`)

## Layer 2: The norm of one theta lift

### 2.1 The lift of a descent pair, its kernel and its adjoint

*Origin:* adapted from the theta lifting between a unitary group and a definite unitary group, with lift and descent
as adjoint integral operators (J.-S. Li (1992); for the Hecke polynomials at split places, Rallis (1982) and Kudla
(1986); the
library states the lift from a definite group, its class-set formula and its Hecke equivariance at split places as
ThetaLiftsForDefiniteUnitaryGroups §1.2 and §2.2): here for a descent pair, whose source group need not be definite,
with a vector-valued kernel and the descent as a class sum.

*Method of the formal proof:* the kernel of the datum attached to a weight vector `ζ` is linear in `ζ̄`, so it is the
pairing of `ζ̄` with one vector-valued kernel; the lift is the integral of a form against this kernel, the descent is
the class sum of the conjugate kernel against a form, and their adjointness is the adjointness of a lift and its
transposed lift, read through the passage between algebraic forms and functions on the adelic group.

Let `O` be a descent pair (ThetaLiftChainsAndTheSeesawIdentity §2.16): a hermitian space `W` of rank `r′ ≥ 1`, the
positive definite space `V` of rank `r′ + t′ > 2r′`, characters of `[U(1)]` for `W` and `V`, the chosen places and the
places of a tame character with their tame parts, and the datum `v_P ⊗ Ψ_bl ⊗ vac`: at the infinite places the Fock
vector of a joint harmonic polynomial attached to a weight vector of `V`, at the chosen places and the twist places the
block datum modulo `π_M·Q`, and the vacuum elsewhere. Let `l` be a parameter on `W` that fits the pair (the archimedean
datum is an edge from the type `l` to the type of `V`). Then:

(a) there is a function `θ_W(g, h)`, `g ∈ U(W)(𝔸)`, `h ∈ U(V)(𝔸_f)`, with values in the weight representation of `V`, such
that `⟨ζ, θ_W(g, h)⟩` is the theta kernel of the datum of `ζ̄` at `(g, h)`; `h ↦ θ_W(g, h)` is an algebraic form on `V` of
the weight and level of the pair;

(b) the lift `Θ_W y = ∫_{[U(W)]} y(g)·θ_W(g, ·) dg` of a form `y` of type `l` is an algebraic form on `V`; the descent
`θΞ(g) = ⟨θ_W(g, ·), Ξ⟩` (class-sum product) of an algebraic form `Ξ` is a form of type `l` on `W`; and
`⟨Θ_W y, Ξ⟩ = ⟨y, θΞ⟩_{Pet}`;

(c) for `k` in the stabiliser of the standard lattice of `W(𝔸_f)`, with reduction `s` at the chosen places,
`θΞ(gk) = θ(ρ(s)Ξ)(g)`, where `ρ(s)Ξ = ∏_w ψ_w(det s_w)·Ξ(··diag(s, 1))` (`ψ` the tame part of the pair); `Θ_W` commutes
with the actions of `G₀`;

(d) let `w` be a split place with `w, w̄` off the places of the pair, of norm `q`, and let `H_w(X) = Σ_i (−X)^i
q^{i(i−1)/2} T_{w,i}` be the Hecke polynomial operator at `X ∈ ℂ` (the sum over `i` up to the rank). If `y` is spherical
at `w` and `H_w(X) y = p(X)·y` for every `X`, then `Θ_W y` is spherical at `w` and
`H_w(X)(Θ_W y) = ∏_{0 ≤ i < t′}(1 − q^i·α·X) · p(q^{t′}·α·β⁻¹·X) · Θ_W y` for every `X`: the `q`-Pochhammer polynomial of
rank `t′` at `αX` times the polynomial of `y` at `q^{t′}αβ⁻¹X`. Here `α = χ_W(ϖ_w)·q^{r′/2}` and
`β = χ_V(ϖ_w)·q^{(r′+t′)/2}`, with `χ_W(x) = a_W(x/x̄)·υ(x)^{−r′}` and `χ_V(x) = a_V(x/x̄)·υ(x)^{−(r′+t′)}` the Hecke
characters of `E` made from the characters `a_W`, `a_V` of `[U(1)]` of the pair and the splitting character `υ`, and
`ϖ_w` a uniformiser at `w`. In particular this holds when `y` lies in a joint eigenspace of the Hecke operators at the
split places off the level.

*Needs:* ThetaKernelsForUnitaryDualPairs §4.4a (the global Weil representation of a unitary pair and its theta
functional), §3.45 (the Fock model at the real places); WeilRepresentationsOnBanachSpacesOfData §§3.1, 6.1, 7.2 (the model of that representation that the
statements use. Let `E` be a CM field that contains a primitive `5040`-th root of unity, with Weil data: an element `ȷ`
with `ȷ̄ = −ȷ`, positive imaginary part at every place of the CM type and `(1 − ȷ⁻¹)/2` integral, a finite idele `α` for
which the integral finite adeles are self-dual under `(z, u) ↦ ψ_f(ȷαᾱzu)`, and a splitting character `υ` with value
`−1` at the uniformisers of the places fixed by conjugation; such data make `E` unramified over its real subfield at
every finite place. For hermitian spaces `S`, `T` and characters `(a, b)` of `[U(1)]`: the representation
`(g, h) ↦ a(det h)·b(det g)⁻¹·ω(x ↦ hxg⁻¹)` of `U(S)(𝔸) × U(T)(𝔸)` on the data space of `Hom(S, T)(𝔸)`, whose real part
is the Fock model with its polynomial vectors, and the theta kernel `θ(ω(g, h)f)` of a datum `f`; for a modulus `𝔪`, a
nonzero ideal that no prime divides together with its conjugate, a function `Ψ` on matrices modulo `𝔪` and a Fock
polynomial `P`, the datum with real part the vector of `P`, the function `Ψ` at the places dividing `𝔪` and the vacuum
elsewhere, and its theta kernel. The edge clause: if the parameters `l`, `l′` satisfy the block rule for the weights of
the pair at every infinite place, then the product `Φ` of the joint harmonic polynomials is an edge from the type of `l`
to the type of `l′`, that is, the kernel of the type of `l` is a cusp kernel of order `0`, the integral over the real
points of `⟨Φ, ω(x, 1)Φ⟩` against the conjugate of that kernel is not zero, the lift with `Φ` of a form of type `l` that
has a level is a form of type `l′`, the lift with any Fock polynomial is a real convolution, with one continuous
function of compact support, of the lift with `Φ`, and the same holds with the two groups exchanged and the conjugate
kernels in reverse order);
WeilRepresentationsOnBanachSpacesOfData §6.4 (theta kernels of unitary dual pairs over a CM field have moderate growth, the lift of a rapidly decreasing automorphic
function converges, and the Petersson product of a lift with a rapidly decreasing function is that of the function with
the transposed lift);
DiscreteSeriesCoefficientsAndAutomorphicMetrics §7.5a (class-set integration on a definite group, and the Petersson
product of algebraic forms as a class-set inner product); WeilRepresentationsOnBanachSpacesOfData §9.3 (at a place `w` split in `E` at which the
base changes `x ↦ a(x/x̄)` of both characters of a pair of ranks `n ≤ m` are unramified, let the datum `f` be fixed by
the vacuum projection at `w` and be an arrow from a type `e` to a type `e′`, so that the lift with `f` maps forms of
type `e` to forms of type `e′` and commutes with the finite points of the two groups. Then the lift of a form of type
`e` that is spherical at `w` and on which the Hecke polynomial operator of rank `n` acts by `p(X)` is spherical at `w`,
and the operator of rank `m` acts on it by the `q`-Pochhammer polynomial of rank `m − n` at `αX` times
`p(q^{m−n}αβ⁻¹X)`, with the normalisation of (d). A vector fixed by the finite points of the group of rank `n` is
spherical at `w`, and the Hecke polynomial operator acts on it by the `q`-Pochhammer polynomial of rank `n` at `X`;
[ShortProof] `Lib/Weil/Unramified/HeckeTransfer.lean` (`New.SiegelWeil.hasHeckePolynomial_formLift`,
`New.SiegelWeil.hasHeckePolynomial_qPochhammer`)); ThetaLiftChainsAndTheSeesawIdentity §2.16 (descent pairs, their
weights, levels and block data), §2.17 (the edge of a parameter that fits the pair).

[ShortProof], `New/Determinant/Norms/VectorKernel.lean` (`New.DescentPair.vectorKernel`,
`New.DescentPair.vectorKernelForm`, `New.DescentPair.normalizedDescent_eq_inner_vectorKernelForm`);
`New/Determinant/Norms/AdjointThetaLift.lean` (`New.DescentPair.thetaLift`, `New.DescentPair.inner_thetaLift`,
`New.DescentPair.isForm_normalizedDescent`, `New.DescentPair.normalizedDescent_mul_eq_normalizedDescent_formAction`,
`New.DescentPair.hasHeckePolynomial_thetaLift`)

### 2.2 The norm of one lift

*Origin:* adapted from the Rallis inner product formula in Weil's convergent range (Rallis (1984b), Proposition 1.1, for
orthogonal–symplectic pairs; J.-S. Li (1992)): here for the lift `Θ_{j,ϑ}` from `W_j` to the definite `V_j` at the level
`J_M`, for every tame twist, with the Gram operator a nonzero constant free of the twist times the factor `c_Q(ϑ)` of the
twist places times the series of translates of Rallis' formula, not evaluated as an L-value. The library states
the formula for Hecke eigenforms, with the unramified integrals evaluated as an L-value, as
ThetaKernelsForUnitaryDualPairs §6.13a (ii); the form used here holds for every form fixed by the level and keeps the
series.

*Method of the formal proof:* the block datum is sharp for the level `J_M` off the places of `π_M Q`: its Weil
coefficient at integral points is its norm on `J_M` and vanishes elsewhere. The Rallis inner product formula for sharp
data then gives the Gram form of the lift as a nonzero constant, depending only on the real data (which do not see `ϑ`,
of weight `0`), times the mass of the block datum times the series of translates; the mass times the index of the level
of `V_j` is computed by counting matrices of full rank over the residue fields, and splits into a factor of the chosen
places and `c_Q(ϑ)`. Injectivity is the case `x = y` of the same formula, which the sharp datum gives for every form.

For `1 ≤ j ≤ m` and a tame character `ϑ`, let `Θ_{j,ϑ} : 𝒜(W_j) → 𝒜(V_j)` be the single lift (Conventions) and put
`c_Q(ϑ) = Nm Q(ϑ)^{r t}·∏_{v∈Q(ϑ)} ∏_{i=t+1}^{t+r} (1 − q_v^{−i})`. For a space `W` of rank `r` with signs `s`, let
`Ral_{j,ϑ}` be the endomorphism of the forms of level `J_M` on `W` that sends `y` to the series
`∑_γ mc_j(γ)·y(·γ)` over the finite points `γ` of `U(W)` modulo those integral away from the places of `π_M Q(ϑ)` and their
conjugates (representatives supported away from those places and their conjugates), where `mc_j(γ)` is the vacuum
coefficient of the Weil representation of rank `r + t` with the character of `V_j` (the value at `γ` of the matrix
coefficient of the unramified vector). Prove:

(a) the series converges, `Ral_{j,ϑ}` preserves the forms of level `J_M` on `W`, and `⟨x, Ral_{j,ϑ} y⟩` is the sum of the
terms `mc_j(γ)⟨x, y(·γ)⟩`;

(b) `Θ_{j,ϑ}` is injective for every tame character `ϑ`;

(c) there is `c_j ≠ 0`, independent of `ϑ`, with `Θ_{j,ϑ}*Θ_{j,ϑ} = c_j·c_Q(ϑ)·Ral_{j,ϑ}` on `𝒜(W_j)` for every tame
`ϑ`;

(d) the adjoint `Θ_{j,ϑ}*` is the descent `θ` of 2.1, and `θΞ = 0` exactly when `Ξ` is orthogonal to the range of
`Θ_{j,ϑ}`; `Θ_{j,ϑ}` commutes with `G₀`;

(e) at a split place `w` with `w, w̄` off the chosen places and `Q(ϑ)`, the Hecke polynomial operator
`H_w(X) = ∑_i (−X)^i q^{i(i−1)/2} T_{w,i}` on forms on `V_j` at `X = (α q^{t−1})⁻¹` kills the range of `Θ_{j,ϑ}`, where `q`
is the norm of `w` and `α` the Frobenius value at `w` of the character of `W_j`.

*Needs:* 2.1; SiegelWeilAndRallisFormulasOnUnitaryGroups §§4.4, 4.5 (the Rallis inner product formula for sharp finite data, in the range `rank V > 2
rank W`: if the finite datum `F` is a vacuum off a set `S₀` of places and its Weil coefficient `⟨F, ω(g)F⟩` at the
finite points integral off `S₀` is `⟨F, F⟩` on a level `J` and `0` elsewhere, and the real datum is an edge, then the
lift is injective on the forms of the type fixed by `J`, and the Petersson product of two lifts is a nonzero constant,
depending only on the real data and the spaces, times the mass of `F`, times the Petersson product with the
convergent series of translates over the cosets of the finite points integral off `S₀`, weighted by the vacuum
coefficients; no Hecke eigenform and no L-value enters); SecondMomentsOfPoincareSeries §2.1a (the Hecke operators away from the level
are normal and commute, so Hecke eigenforms span the forms of level `J_M`); ThetaLiftChainsAndTheSeesawIdentity §2.18
(the descent pair of lift `j` and its parameters).

[ShortProof], `New/Determinant/Norms/AdjointThetaLift.lean` (`New.Data.singleLift_injective`,
`New.Data.exists_adjoint_singleLift_comp_eq`, `New.Data.hasSum_inner_rallisOperator`,
`New.Data.coe_adjoint_singleLift`, `New.Data.normalizedDescent_eq_zero_iff`, `New.Data.singleLift_principalRep`,
`New.Data.heckePolyOnForms_liftHeckeRoot_singleLift_eq_zero`, `New.DescentPair.gramFactor_div_card`)

## Layer 3: The exchange identity

The exchange identity compares, on a hermitian space `W`, the theta integral over `[U(V)]` with the theta integral over
`[U(V′)]`, where `rank V + rank V′ = rank W` and the negative signs add up, for matched finite data at the places of a
tame character. 3.1 fixes the data; 3.2–3.8 are the steps of the proof; 3.9 is the identity; 3.10 and 3.12 are the two
forms in which the rest of the argument uses it.

### 3.1 Theta integrals with finite data at a modulus

*Origin:* definitions and conventions.

*Method of the formal proof:* definitions.

(a) A split tame character `𝔠` of weight `μ` (with `μ(τ) > 0` for all `τ`) is a character `ν` of `[U(1)]` of weight `μ`,
tamely ramified exactly at a nonempty finite set `S` of finite places with `S ∩ S̄ = ∅`; its local character is
`χ_𝔠(t) = ν(t/t̄)` on `∏_{v∈S} E_v`, extended by `0` to non-invertible elements.

(b) For hermitian spaces `W` (rank `n`, even) and `V` (index set `r`), and a real vector `v` for `(W, V)`,
`I_large(W, V; 𝔠, v, Φ)` is the theta integral over `[U(V)]`, as a function on `U(W)(𝔸)`, of the datum with real part
`v`, the function `Φ` on `r × n` matrices over `∏_{v∈S} E_v` at `S`, and the vacuum elsewhere, with the character
`ν⁻¹υ₁^{n/2}` for both spaces. For a space `U` (index set `b`) and a real vector `y` for `(W, U)`,
`I_small(W, U; 𝔠, y, Ψ)` is the theta integral over `[U(U)]` of the datum with real part `y` and the function
`x ↦ Ψ(x^T)` at the conjugates of the places of `S` (`Ψ` a function on `n × b` matrices), with the characters
`ν·υ₁^{n/2}` for `W` and `υ₁^{#b}` for `U`.

(c) For `σ : b ⊔ r ≃ n` and an integral `b × n` matrix `z` over `∏_S O_v`, the standard row datum `x ↦ χ_𝔠⁻¹(det(z; x))`
(the square matrix with the rows of `z` and of `x`, ordered by `σ`, where it is integral with unit determinant; `0`
elsewhere) and the standard column datum `x ↦ χ_𝔠⁻¹(det(z x))` (same convention) are matched for `χ_𝔠` over `∏_S O_v`.

(d) The exchange identity on standard data for `(W, V, U)`, the real vectors `v`, `y`, and a function `ℓ` of the split
tame characters of weight `μ`, holds if `v` and `y` are Schwartz and there is a real `C` such that every `𝔠` has a
number `c` with `C·|c|² = L_*(S, ν, rank V − n/2)·ℓ(𝔠)` (where `L_*(S, ν, −e) = L_*(S, ν, e)⁻¹`) and
`I_large(W, V; 𝔠, v, row datum of z) = c·I_small(W, U; 𝔠, y, column datum of z)` for every integral `z`.

(e) The equal-rank ratio of a space `X` of even rank at a Schwartz vector `v` is
`r_X(𝔠, v) = |I_large(X, X; 𝔠, v, χ_𝔠⁻¹∘det)(1)|² / L_*(S, ν, rank X/2)`.

*Needs:* ThetaKernelsForUnitaryDualPairs §4.4a, §3.45 and the background entry of 2.1 on the model of the Weil
representation of a pair (same file and declarations of [ShortProof]); IdelicReciprocityCountsAndCyclotomicClassGroups §§7.1, 7.6 (a character `ν` of `[U(1)]`
has weight `e` and tame part `ψ`, a family of characters `ψ_w` of the residue fields at the finite places, almost all
trivial, if `ν(u) = ∏_τ u_τ^{e(τ)}·∏_w ψ_w(u mod w)` for every `u` with integral finite part. A split tame character of
weight `e` is such a `ν` with `e(τ) > 0` at every `τ` and `ψ_w ≠ 1` exactly at the places of a nonempty finite set `S`
that contains no place together with its conjugate; its local character is `t ↦ ν(t/t̄)` on the invertible elements of
`∏_{v∈S} E_v`, with `t` read as an idele of `E` that is `1` off `S`, and `0` on the non-invertible elements;
[ShortProof] `Lib/ClassField/HeckeCharacter/SplitTameCharacters.lean` (`New.Exchange.SplitTameChar`,
`New.Exchange.SplitTameChar.semilocalChar`), `Lib/ClassField/HeckeCharacter/Basic.lean` (`New.AutChar.HasWeight`));
IdelicReciprocityCountsAndCyclotomicClassGroups §7.6 (characters tame for a modulus: a character `ν` of `[U(1)]` with tame part `ψ`, in the sense of
the previous entry, is tame for a modulus `𝔪` if the prime divisors of `𝔪` are the places with `ψ_w ≠ 1`; then, with
`χ = ∏_{w∣𝔪} ψ_w` on `O_E/𝔪`, `ν(det k) = χ(det(k mod 𝔪))` for `k` in the stabiliser of the standard lattice;
[ShortProof] `Lib/ClassField/HeckeCharacter/TameModulus.lean` (`New.Exchange.IsTameFor`,
`New.Exchange.IsTameFor.apply_det`)).

[ShortProof], `New/Determinant/Exchange/LargeTriple.lean` (`New.Exchange.RowColExchangeIdentity`,
`New.Exchange.equalRankThetaRatio`); `New/Determinant/Exchange/EquivariantDifference.lean` (`New.Exchange.thetaSmall`);
`Lib/SiegelWeil/Tower/LineGaussSums.lean` (`New.areMatched_stdRowDatum_stdColDatum`)

### 3.2 Fourier coefficients of theta integrals vanish off negative forms

*Origin:* adapted from the classical fact that a theta integral has Fourier coefficients only at the forms represented
by the target space: here the vanishing of the coefficient at a non-negative index for a target with few positive
directions, by averaging over a compact stabiliser.

*Method of the formal proof:* after unfolding, the coefficient at `T` is an integral, modulo the rational stabiliser of
one rational frame with Gram matrix `T`, over the adelic group; averaging the integrand over a compact subgroup of that
stabiliser at a real place where `T` is not negative gives an invariant functional on a finite-dimensional space of Fock
polynomials with no nonzero fixed vector, hence zero.

(a) Let a compact group `G` act by bounded operators `ρ(g)` on a complex Banach space `V`, let `W ⊂ V` be a finite-dimensional
`G`-stable subspace in which only `0` is fixed, and let `l` be a bounded `G`-invariant functional. Then `l(v) = 0` for every
`v ∈ W` with continuous orbit.

(b) Let `X = (H_b) ⊕ Z` be a hermitian space split by dual isotropic frames of rank `#b` over `Z`, `Y` a hermitian space
with a positive sign and with `#b` more negative signs than `Z`, `μ(τ)` less than the number of positive signs of `Z` at
every `τ`, `ν` of weight `μ` with any tame part, and `δ = ν·υ₁^{#b}`. Let `T ∈ GL_b(E)` be not of the form `−c^H c` at
some real place, and assume that the terms of the unfolded theta integral are absolutely integrable at `g`. Then the
Fourier coefficient at `j·T` along the centre of the unipotent radical of the parabolic of the frame, of the theta
integral of `(X, Y)` with the character `δ` on both sides, vanishes at `g`, for every Schwartz datum.

*Needs:* 3.1; WeilRepresentationsOnBanachSpacesOfData §8.9 (let `X` be split by dual isotropic frames of rank `#b`, `y` a continuous function on
`U(Y)(𝔸)`, and let the terms of the theta kernel at `g`, indexed by the rational `#b`-frames `x` of `Y`, be absolutely
integrable against `y`. Then the Fourier coefficient at `ȷ·T` and `g`, along the centre of the unipotent radical, of the
theta integral of `y` is the sum, over the rational frames `x` with Gram matrix `T`, of the integrals over `[U(Y)]` of
the term of `x` times `y`. If moreover `y` is left invariant under the rational points and `T` is invertible, then for
one such frame `x₀` the term of `x₀` times `y` is left invariant under the group of rational points that fix `x₀` and
integrable modulo that group, and the coefficient is its integral modulo that group).

[ShortProof], `New/Determinant/Exchange/NegativeIndices.lean` (`New.Exchange.apply_eq_zero_of_forall_fixed_eq_zero`,
`New.Exchange.centreCoeff_eq_zero_of_not_representedBy`)

### 3.3 Matched functions and same-section pairs

*Origin:* particular to this proof: matched functions at the ramified places are determined, as data of theta
integrals, by their coset sums over `GL_b(F)/GL_b(O)`.

*Method of the formal proof:* a matrix with a left inverse is, up to a unique coset of `GL_b(O)`, primitive; summing a
Schwartz–Bruhat function over coset representatives chosen once for all matrices gives the section, which for primitive
support is one value; a translation-invariant functional of `Φ` is cut into finitely many pieces by these cosets and
moved to primitive matrices.

Let `F` be a finite product of nonarchimedean local fields with ring of integers `O`, `χ` a character of `F^×` (extended
by `0`), and `σ : b ⊔ a ≃ n`. For `y ∈ M_{n×b}(F)` with a left inverse and a Schwartz–Bruhat `Ψ` supported on such
matrices, put `sec_χ(y)(Ψ) = ∑_{g∈GL_b(F)/GL_b(O)} χ(det g)·Ψ(y g)` (a finite sum, independent of the representatives
for a common choice). A same-section pair is a pair of Schwartz–Bruhat functions `(Φ, Ψ)`, `Φ` on `a × n` matrices
supported where `x^T` has a left inverse and `Ψ` supported on left invertible matrices, with
`sec_χ(x_k^T)(y ↦ Φ(y^T)) = χ(det k)·sec_χ(y_k)(Ψ)` for every `k ∈ GL_n(F)`. Prove:

(a) the same-section pairs form a `GL_n(F)`-stable space;

(b) if `Λ` is linear in `Φ` with `χ(det g)·Λ(Φ(g·)) = Λ(Φ)` for `g ∈ GL_a(F)` and all Schwartz–Bruhat `Φ` supported where
`x^T` has a left inverse, then there is a linear `T` with `T(Ψ) = Λ(Φ)` on all same-section pairs;

(c) if `χ` is tame (trivial on `1 + ϖO` and primitive on `O/ϖO`) and `Ψ` is locally constant, then matched functions
`(Φ, Ψ)` over `O` form a same-section pair;

(d) for any commutative ring `R`, multiplicative character `χ` of `R` and function `f` on `a × b` matrices over `R`, the
block functions `Φ(x₁ x₂) = χ⁻¹(det x₂)·f(x₂⁻¹x₁)` on `a × n` matrices (`x₂` the square block of the columns `a`,
`x₁` the block of the columns `b`; `0` unless `x₂` is invertible) and `Ψ(y₁; y₂) = χ⁻¹(det y₁)·f(−y₂y₁⁻¹)` on `n × b`
matrices (`y₁` the square block of the rows `b`, `y₂` the block of the rows `a`; `0` unless `y₁` is invertible) are
matched for `χ` over `R` itself.

*Needs:* 3.1.

[ShortProof], `New/Determinant/Exchange/MatchingPartners.lean` (`New.localSection`, `New.sameSectionPairs`,
`New.sameSectionPairs.translate_mem`, `New.sameSectionPairs.exists_linear_factor`, `New.mem_sameSectionPairs`,
`New.Rows.areMatched_block`)

### 3.4 From standard data to all matched functions

*Origin:* particular to this proof: an identity between the two theta integrals that holds on standard data holds on all
matched data, because the difference is an equivariant lift that a standard datum generates.

*Method of the formal proof:* by 3.3 both theta integrals depend linearly on `Ψ` alone, so their difference is a linear
map `𝒟` on a translation-stable space of data, equivariant at `S` and invariant under the integral points elsewhere.
A locally constant `Ψ` with a match is reached from a standard datum by averaging over `GL_n(O)` and by Gauss sums of
shears; vanishing of the Fourier coefficients of `𝒟` on the standard datum at the self-dual test indices (and, by 3.2,
off negative indices) makes `𝒟` vanish on every such `Ψ`.

Let `W` have even rank `n = rank U + rank V` (`σ : b ⊔ r ≃ n`), `𝔠` a split tame character of weight `μ`, `v`, `y` real
Schwartz vectors for `(W, V)`, `(W, U)`, and `c ∈ ℂ`. Prove:

(a) there are a translation-stable space `M` of Schwartz–Bruhat functions of `n × b` matrices at `S` and a linear map `𝒟`
from `M` to automorphic functions on `U(W)(𝔸)`, equivariant at `S` for the inverse of `υ^{#b}|·|^{#b/2}` of the
determinant and right invariant under the integral points away from `S`, such that every locally constant `Ψ` with a
matched `Φ` lies in `M` and `𝒟Ψ = I_large(W, V; 𝔠, v, Φ) − c·I_small(W, U; 𝔠, y, Ψ)`;

(b) (vanishing criterion) let `X` split over `W₁` along `b` lines and `W₁` over a space along one line, by adapted
splittings (orthonormal frames at infinity, integral at the finite places), let `𝒟` be an equivariant lift as in (a) on
`X`, defined on a space `M` that contains the standard column datum of the frame, and let `V′` be a hermitian space with
basis indexed by `b`. If the Fourier coefficients of `𝒟` applied to the
standard column datum of the frame vanish at the points of the parabolic tested by `V′` (index `j·V′.J` at frames whose
columns span a lattice self-dual for `V′`, and every invertible index not represented by the signs of `V′`), then `𝒟`
kills every locally constant datum with a matched function;

(c) if `I_large(W, V; 𝔠, v, row datum of z) = c·I_small(W, U; 𝔠, y, column datum of z)` for every integral `z`, then
`I_large(W, V; 𝔠, v, Φ) = c·I_small(W, U; 𝔠, y, Ψ)` for all matched `(Φ, Ψ)` with `Ψ` locally constant, and such `Ψ` is a
Schwartz–Bruhat function supported on left invertible matrices.

*Needs:* 3.1, 3.2, 3.3; SiegelWeilAndRallisFormulasOnUnitaryGroups §§5.1, 5.3 (a singular function is governed by its unimodular coefficients, after
Freitag. Let `S` be a set of finite places, `f` an automorphic function on the adelic unitary group of `X`, right
invariant under the integral points supported on `S ∪ S̄`. Let `A` split `X` over a space `X₀` along one isotropic line
and `B` split `X₀` along `#b` lines, both adapted, and let `D` be the splitting of `X` whose frame is that of `B` inside
`X₀`. For an index `T`, the partial mean `f⁺` of `f` is the mean, over the adelic rows modulo the rational rows, of the
Fourier coefficient of `f` at `T` along the centre of the unipotent radical of `D`, taken at the translates by the
unipotent elements that shift the dual vector of the line of `A` along the frame of `B`; `f⁻` is the same for `A` with
its two isotropic vectors exchanged. Let `det T ≠ 0`, and let `U` be a nonempty set of finite places such that, at every
point that fixes the frame of `D` off `S ∪ S̄`, both `f⁺` and `f⁻` are invariant under the shears for `U`: the points
with matrix `1 + ē·uc − e·a`, `e` the idempotent adele of `U`, `u` the isotropic vector of the splitting, `c` a row with
`cu = 0`, `a` any matrix. Suppose that the coefficient of `f` at `T` vanishes at every point that acts on the frame of
`D` by a matrix `γ` on `S ∪ S̄` and by `1` elsewhere, whenever `δ⁻¹γ^HTγ`, `δ = ȷκκ̄` with `κ` the idele of the Weil
data that has finite part `α` and component `(2π·Im τȷ)^{−1/2}` at `τ`, and a left inverse of it are integral on
`S ∪ S̄`. Then the coefficient of `f` at `T` vanishes at every point that fixes the frame of `D` off `S ∪ S̄`;
[ShortProof] `Lib/SiegelWeil/SingularForms/CentreCoefficients.lean` (`New.Space.Splitting.partialMean`,
`New.Space.Splitting.ShearInvariant`), `Lib/SiegelWeil/SingularForms/UnimodularCoefficients.lean`
(`New.Exchange.centreCoeff_eq_zero_of_unimodular`)).

[ShortProof], `New/Determinant/Exchange/EquivariantDifference.lean`
(`New.Exchange.exists_isEquivariantLift_eq_thetaLarge_sub_smul`);
`New/Determinant/Exchange/StableSpacesStandardData.lean` (`New.Exchange.match_mem_of_stdColDatum`,
`New.Exchange.IsEquivariantLift.apply_eq_zero_of_areMatched`); `New/Determinant/Exchange/TheoremForPartners.lean`
(`New.Exchange.thetaLarge_eq_smul_of_areMatched`)

### 3.5 The exchange identity for the large triple

*Origin:* particular to this proof: the exchange identity on standard data for `(X, V′ ⊕ W₁)` and `(X, V′)` when `X` is
`W₁` plus hyperbolic planes, from an identity of periods over `[U(W₁)]`; with a smooth local form of Witt's theorem for
the real vectors.

*Method of the formal proof:* the theta kernel of `X` is unfolded along the isotropic frame into terms indexed by
rational matrices, computed at points of the parabolic through a theta functional of the smaller pair; for
`V = V′ ⊕ W₁` this functional factors into that of `(W₁, V′)` times the theta kernel of `(W₁, W₁)`, whose integral on the
datum `χ⁻¹∘det` is constant when `W₁` has even rank and splits off a plane. The real vectors are bump functions in the
mixed model, the one for `V′ ⊕ W₁` moved by a unitary matrix depending smoothly on the frame; the Fourier coefficients
then agree up to one factor whose size is the equal-rank ratio.

(a) (smooth local Witt theorem) Let `J` be a hermitian complex matrix and `x` a frame with `x^H J x` invertible. There is a smooth map `y ↦ k(y) ∈ U(J)` on all frames such that, for `y` near `x`, the columns of `y` are
linear combinations of those of `k(y)x`.

(b) If `W₁` has even rank and splits off a hyperbolic plane by an adapted splitting, then for every Schwartz `v` the
function `g ↦ I_large(W₁, W₁; 𝔠, v, χ_𝔠⁻¹∘det)(g)` is constant.

(c) Let `X` be `W₁` plus `#b` hyperbolic planes by an adapted splitting `D`, `W₁` of even rank with an adapted splitting
along one line, `V′` a hermitian space with basis indexed by `b`, `v` a Schwartz vector for `(W₁, V′)` and `v₁` one for
`(W₁, W₁)`. Then there are Schwartz vectors `Φ` for `(X, V′ ⊕ W₁)` and `Λ` for `(X, V′)` such that the zero term of `Λ`
(its value at `0` in the mixed model of `D` with the frames exchanged) is `v`, and the exchange identity on standard
data holds for `(X, V′ ⊕ W₁, V′)` at `(Φ, Λ)` with `ℓ(𝔠) = r_{W₁}(𝔠, v₁)`.

*Needs:* 3.1, 3.2, 3.4; HermitianFormsAndLattices §1.1 (Witt extension); SiegelWeilAndRallisFormulasOnUnitaryGroups §2.7, WeilRepresentationsOnBanachSpacesOfData §§5.2, 5.5 (the mixed model of a
splitting. Let `D` split a hermitian space `V` into dual isotropic frames `l`, `k` of rank `p` and a complement `V₀`;
`D` is adapted if the adelic matrix of the three frames has orthonormal columns at every infinite place and integral
entries at every finite place. The zero term along `k` is the continuous linear map from the data space of `V` to that
of `V₀` that sends `f` to `y ↦` the mean over `b ∈ 𝔸^p/E^p` of `θ(ϱ(ιy + kb)f)`, with `ϱ` the Heisenberg action; the
slice `f[x]` at an adelic vector `x` is the zero term of `ϱ(lx)f`. For every datum `f` the family `θ_{V₀}(f[ξ])`,
`ξ ∈ E^p`, is summable with sum `θ_V(f)`. The constancy clause: let `H` split a hyperbolic plane off a space `W` with
complement `W₀`, let `F` be a continuous function on `U(W)(𝔸)`, left invariant under the rational points, and let `S` be
a nonempty set of finite places such that `F` is right invariant under the points supported on `S ∪ S̄` and under the
integral points that are trivial on `S`. If left invariance of `F` under the unipotent radical of `H` implies that `F`,
on the Levi subgroup `GL₁(𝔸_E) × U(W₀)(𝔸)` of `H`, does not depend on the factor `GL₁`, then `F` is constant;
[ShortProof] `Lib/Weil/MixedModel/AdaptedSplitting.lean` (`New.Exchange.IsBaseAdapted`),
`Lib/Weil/MixedModel/ZeroTerm.lean` (`New.Space.Splitting.zeroTerm`, `New.Space.Splitting.slice`,
`New.Space.Splitting.hasSum_theta_slice`), `Lib/SiegelWeil/Formula/StrongApproximation.lean`
(`New.Exchange.IsAutFunction.apply_eq_apply_one`)).

[ShortProof], `New/Determinant/Exchange/RealVectors.lean` (`New.Exchange.exists_contDiff_witt`,
`New.Exchange.exists_rowColExchangeIdentity_sum`); `New/Determinant/Exchange/LargeTriple.lean`
(`New.Exchange.thetaLarge_eq_apply_one_of_even_rank`, `New.Exchange.rowColExchangeIdentity_of_periods`,
`New.Exchange.thetaOnRealData_boxProd_eq_mul`)

### 3.6 Descent of the exchange identity by removing hyperbolic planes

*Origin:* particular to this proof: the exchange identity on standard data descends from `(W ⊕ H^p, V′, U)` to
`(W, V, U)`, with the same size function `ℓ`. The constant term of a theta integral along an isotropic line, with its
cone maps, is ThetaKernelsForUnitaryDualPairs §5.7c in the library; the form used here is for standard row data at the
places of a split tame character and carries the continuation of the Tate integral of that character.

*Method of the formal proof:* one plane at a time: replace `V′` by a space with the same signs that splits over `V`, and
take the constant term along the new isotropic line. A cone integral of the real vector (an integral over the maximal
compact subgroup and the archimedean scalings) has the theta integrals of the smaller pair times a positive analytic
factor; according to the sign of `rank V − rank W/2` the constant term is read on one or the other side of Poisson's
formula.

(a) Let `W′ = W ⊕ H` and `V′ = V ⊕ H` with adapted splittings, `rank W` even. There is a positive real-analytic function
`B` on `ℝ` such that every Schwartz `v` for `(W, V)` has a Schwartz `v′` for `(W′, V′)` whose cone integral at `z > 0`
has, for every split tame `𝔠` of weight `μ`, every standard row datum and every point, the theta integral `B(z)` times
that of `v`. Here the cone integral of `v′` at `z` (for the weight `μ`) is the vector for `(W, V)` given by the integral,
over `k` in the maximal compact subgroup of `U(V′)` at the infinite places and over the archimedean ideles
`a ∈ (E ⊗ ℝ)^×`, of `∏_τ (a_τ/|a_τ|)^{2μ(τ)}·|a|^z` times the term at `a` of `k·v′` along the isotropic line of the
splitting of `V′` (the real Tate integral of `v′` over the cone of the isotropic vectors `k⁻¹xa`, `x` spanning that line).

(b) Let `A` split `W′` as `W` plus `p ≥ 1` hyperbolic planes (adapted), `rank W` even, `V′` with `p` more negative signs
than `V`, and `rank U + rank V = rank W`, `rank U + rank V′ = rank W′`. If the exchange identity on standard data holds
for `(W′, V′, U)` at `(x, y)` with `ℓ`, then it holds for `(W, V, U)` at some `x₀` and the zero term of `y` along `A`,
with the same `ℓ`.

*Needs:* 3.1, 3.5; SiegelWeilAndRallisFormulasOnUnitaryGroups §§6.8, 6.9 (the constant term along an added line. Let adapted splittings split a hyperbolic
plane off `W′` over `W` and off `V′` over `V`, `rank W` even, `e = rank V − rank W/2`, and fix the weight `μ`. There are
two positive numbers `C₊`, `C₋`, free of the character, such that for every split tame character `𝔠 = (ν, S)` of weight
`μ` there are complex numbers `ε₊`, `ε₋` of these moduli with the following property. For every Schwartz vector `v` for
`(W′, V′)`, every integral matrix `y` at `S` and every point `(u, g)` of the Levi subgroup `GL₁(𝔸_E) × U(W)(𝔸)` with
`u = 1` or `rank V = rank W`, there is a function `𝒵`, analytic on the real line, such that the constant term along the
line of `W′`, at `(u, g)`, of the theta integral of `(W′, V′)` on the datum of `v` and `y` is `𝒵(e + 1)`, and for real
`x ≥ 1`, `𝒵(x) = ε₊·|κ|^x·∏_{w∈S} q_w^{x−1/2}·L^S(x, ν)·I₊(x)` and
`𝒵(1 − x) = ε₋·|κ|^x·∏_{w∈S} q_w^{x−1/2}·L^S(x, ν)·I₋(x)`, where `κ` is the idele of the Weil data and `I_±(x)` is the
theta integral `I_large` of `(W, V)` at `g` on the standard row datum of `y` with real part the cone integral of `v`
with exponent `x`, taken on one or the other side of Poisson's formula. The functional equation in absolute values, a
case of the main theorem of Tate's thesis: for an integer `k₀ ≥ 0` with `k₀ ≤ μ(τ)` at every `τ`, there is a function
`C`, positive on `1 ≤ z < k₀ + 1` and free of the character, such that for every split tame `(ν, S)` of weight `μ` the
function `L^S(x, ν)` of `x ≥ 1` extends to an analytic function of real `x > −k₀`, with no zero at the integers
`j > −k₀`, and `|L^S(1 − z, ν)|·∏_{w∈S} q_w^{1/2−z} = C(z)·|L^S(z, ν)|·∏_{w∈S} q_w^{z−1/2}` for real `1 ≤ z < k₀ + 1`;
[ShortProof] `Lib/SiegelWeil/Tower/LargeSideConstantTerm.lean` (`New.Exchange.exists_zetaIntegral`, with the unfolding
`New.Exchange.exists_planeConstantTerm_eq_integral`), `Lib/SiegelWeil/Tower/FunctionalEquation.lean`
(`New.Exchange.exists_analytic_extension_functional_equation`, `New.Exchange.exists_analytic_extension_ne_zero`));
AdelicUnitaryGroupsAndAlgebraicModularForms §3.5, WeilRepresentationsOnBanachSpacesOfData §5.1 (every isotropic frame of a hermitian space `V` over the CM field is part of a splitting: a rational
`n × p` matrix `k` with a left inverse and `k^H J k = 0` is the isotropic frame of a splitting of `V` into dual
isotropic frames and a complement `V₀`; and if `i` is an isometric embedding of a given space `V₀` such that the
orthogonal complement of the span of `k` is that span plus `iV₀`, then the splitting can be taken over `V₀` with
embedding `i`. Every splitting has adapted points: for each `t ∈ GL_p(𝔸_E)` there is a point `γ` of the adelic group
such that `γ⁻¹` carries the frames, scaled by `t`, to a matrix with orthonormal columns at the infinite places and
integral entries at the finite places).

[ShortProof], `New/Determinant/Exchange/ConeImage.lean` (`New.Exchange.exists_thetaLarge_cone_eq_mul`);
`New/Determinant/Exchange/RemovingPlanes.lean` (`New.Exchange.exists_rowColExchangeIdentity_removing_planes`,
`New.Exchange.exists_thetaLarge_thetaSmall_eq_circle_mul`)

### 3.7 Vanishing descends along hyperbolic planes

*Origin:* particular to this proof: a descent of vanishing. If every integral `I_large` of the pair enlarged by `j`
hyperbolic planes is zero, for all Schwartz vectors and all standard row data, then the same holds for the pair itself.

*Method of the formal proof:* remove one plane at a time. For the vectors built in 3.6 (a), take the constant term of
the larger theta integral along the added isotropic line. It is a Tate integral in an auxiliary real variable, and
its continuation to the point `rank V − rank W/2 + 1`, which is at least `1 − k₀`, is the integral for `(W, V)`
multiplied by local and archimedean factors that are not zero at that point; so vanishing above forces vanishing
below.

Say that `(W, V)` vanishes for `𝔠` (and a splitting `σ : b ⊔ r ≃ n` of the index set of `W`, which fixes the standard
row data) if `I_large(W, V; 𝔠, v, row datum of y)` is `0` at every point for every Schwartz `v` and every integral
`y`. Let `W′` have the rank and the negative signs of `W ⊕ H^j`, `V′` the negative signs of `V ⊕ H^j`, `j ≥ 1`, with
splittings `σ : b ⊔ r ≃ n` of `W` and `σ′ : b ⊔ r′ ≃ n′` of `W′` for the same `b` (so `rank V′ = rank V + 2j`),
`rank W` even, and let `k₀ ≥ 0` be an integer with `k₀ ≤ μ(τ)` for all `τ` and `−k₀ ≤ rank V − rank W/2`. If `(W′, V′)`
vanishes for `𝔠` and `σ′`, then `(W, V)` vanishes for `𝔠` and `σ`.

*Needs:* 3.1, 3.6.

[ShortProof], `New/Determinant/Exchange/VanishingDescends.lean` (`New.Exchange.ThetaLargeVanishes.of_add_plane`,
`New.Exchange.ThetaLargeVanishes.of_add_planes`)

### 3.8 The exchange identity measured by the equal-rank ratio, and the value of that ratio

*Origin:* particular to this proof: the exchange identity on all matched functions at the ramified places, with the
size of its constant measured by the equal-rank ratio of `H ⊕ W`, and the equal-rank ratio as one nonzero number for all
split tame characters of a given weight.

*Method of the formal proof:* (a) the identity on standard data at the top of the tower `W, H ⊕ W, H ⊕ W ⊕ H^{rank U}`
(3.5), descended by removing planes (3.6), extended to all matched functions (3.4), and translated from `(W, U⁻)` back to
`(U, W)` by passing to adjoint maps. (b) Nonvanishing for the positive definite `J` of rank `2k₀`: if `r_{H⊕J}` vanished at
every Schwartz vector, the periods of 3.5 would vanish, and 3.7 would carry the vanishing down `2k₀ + 1` planes to the
pair `(J, 0)`, where the integral of the vacuum is a volume. Applying (a) twice, to `(J, J, 0)` and `(J, 0, J)`, and
Fubini on the theta kernel of `(J, J)`, the square of `r_{H⊕J}` is a product of numbers free of the character; the value
is then carried up one hyperbolic plane at a time, and it depends only on the signs.

(a) Let `W` have even rank `n = rank U + rank V` (`σ : b ⊔ r ≃ n`), with `neg(W) = neg(V) + neg(U)`, let `z` be a Schwartz
vector for `(H ⊕ W, H ⊕ W)` and `y` one for `(U, W)`. There are a real `C` and a Schwartz vector `v` for `(W, V)` such that
every split tame character `𝔠` of weight `μ` has a number `c` with `C·|c|² = L_*(S, ν, rank V − n/2)·r_{H⊕W}(𝔠, z)` and,
for all matched `(Φ, Ψ)` over `∏_S O_v` with `Ψ` locally constant and all `g ∈ U(W)(𝔸)`,
`∫_{[U(V)]} θ^{W,V}_{γ,1}((v, Φ))(g, h) dh = c·∫_{[U(U)]} θ^{U,W}_{γ,γ}((y, Ψ))(h, g) dh`, with `γ = ν⁻¹υ₁^{n/2}`.

(b) Let `W` have rank `2k₀ + 2q`, `q = neg(W)`, and `k₀ ≤ μ(τ)` for all `τ`. There are a Schwartz vector `z` for
`(H ⊕ W, H ⊕ W)` and `C₀ ≠ 0` with `r_{H⊕W}(𝔠, z) = C₀` for every split tame character `𝔠` of weight `μ`.

*Needs:* 3.1, 3.4, 3.5, 3.6, 3.7; WeilRepresentationsOnBanachSpacesOfData §6.8 (the flip of a pair, on theta kernels of data modulo a modulus
`𝔪`; `N𝔪 = #(O_E/𝔪)`. Let `c` be a unit of the integral finite adeles with `c̄c = −1`, `T` a space of rank `m`, `V` a
space with the opposite signs whose point is `c`, at the finite places, times that of `T`, and `S` a space of rank `n`.
For characters `a`, `b` of `[U(1)]` there is a complex `C` with `|C|²·N𝔪^{mn} = 1` such that, for every function `D` on
`n × m` matrices modulo `𝔪`, every polynomial `P` and all points `g`, `h`, the kernel of `(V, S)` with characters
`(a, b)` on `(D, P)` at `(g, h)`, `g` read in the group of `V`, is `C` times the kernel of `(S, T)` with characters
`(b⁻¹υ₁^n, a⁻¹υ₁^m)` on `(D̂, P′)` at `(h, gu)`. Here `D̂(ρ) = Σ_v D(v)·ψ(−c̄·tr ρv)` is the finite Fourier transform
for the primitive additive character `ψ` of `O_E/𝔪`, `P′` is the signed transpose of `P`, which sends `X_{τ,i,j}` to
`−s_i t_j X_{τ,j,i}`, and `u` is a fixed scalar of norm one at the finite places, given by `𝔪` and the Weil data.
Reversal of a pair: for spaces `S`, `T` of ranks `n`, `m` and characters `a`, `b` there is a complex `c′` with
`|c′|²·N𝔪^{nm} = 1` such that the complex conjugate of the kernel of `(S, T)` with characters `(a, b)` on `(D, P)` at
`(g, h)` is `c′` times the kernel of `(T, S)` with characters `(b, a)` on `(D′, P′)` at `(h, gu)`, with `D′` the Fourier
transform of `D̄` for `ψ` and `P′` the signed transpose of `P̄`).

[ShortProof], `New/Determinant/Exchange/TheoremForPartners.lean` (`New.Exchange.exchange_of_matches`,
`New.Exchange.exists_rowColExchangeIdentity_of_even_rank`, `New.Exchange.exists_equalRankThetaRatio_eq_const`,
`New.Exchange.exists_equalRankThetaRatio_ne_zero`, `New.Exchange.exists_equalRankThetaRatio_sq_eq`)

### 3.9 The exchange identity

*Origin:* particular to this proof: an identity, up to a nonzero constant of known size, between the theta integrals of
two complementary hermitian spaces on matched data at the ramified places of a tame character; nearest published
result: Kudla and Rallis (1994), the first term identity (with its extensions to other dual pairs, for a split `W`: Gan,
Qiu and Takeda (2014), Theorem 7.3). In the library, ThetaLiftsForDefiniteUnitaryGroups §6.11 states an identity of
the same kind, `I_V(Φ) = c·I_{V′}(Φ′)` with `c ≠ 0` for a complementary triple. The statement here is a variant and is
not deduced from it: the matching is by explicit functions modulo a modulus for a tame character at split places,
the ranks may be equal (`e = 0`) and `V′` may be `0` (`b = 0`), where §6.11 asks for `a′ < a` and `2(p + q) + 1 < a′`,
and the size `|c|² = C·L_*` of the constant is part of the conclusion.

*Method of the formal proof:* 3.8 (a) at a vector `z` for which the equal-rank ratio is a nonzero constant (3.8 (b));
the constant then has the size `L_*` times that constant, and `C > 0` because the size is positive as soon as one tame
character exists; matched functions modulo `𝔪` are lifted to matched functions on the completions at the primes of `𝔪`;
replacing the two splitting characters by others with the same product multiplies each side by the same character
value at `det g`.

Let `W`, `V`, `V′` be hermitian spaces over `E` of ranks `n = b + a`, `a = b + 2e` and `b` (`σ : b ⊔ a ≃ n`, `e ≥ 0`;
`b = 0` allowed), with `neg(W) = neg(V) + neg(V′) = q`, `2q + 2 ≤ n`, and let `μ : Φ_E → ℤ` satisfy `n ≤ 2μ(τ) + 2q` for
all `τ`. Let `v` be a real Schwartz vector for `(V′, W)`. Then there are `C > 0` and a real Schwartz vector `x` for
`(W, V)` such that for every modulus `𝔪`, every character `ν` of `[U(1)]` tame of weight `μ` for `(𝔪, χ)`, there is
`c ∈ ℂ` with

- `|c|² = C·L_*(places of 𝔪, ν, e) ≠ 0`;
- for all characters `α`, `α′` of `[U(1)]` whose splitting characters for the ranks `a` and `b` have product `ν̃⁻¹`, all
  matched functions `Φ` (on `a × n` matrices) and `Ψ` (on `n × b` matrices) modulo `𝔪` for `χ`, and all
  `g ∈ U(W)(𝔸)`:

  `∫_{[U(V)]} θ^{W,V}_{γ,α}((x, Φ))(g, h) dh = c·∫_{[U(V′)]} θ^{V′,W}_{α′,γ}((v, Ψ))(h, g) dh`, with `γ = ν⁻¹·υ₁^{n/2}`.

*Needs:* 3.1, 3.8; WeilRepresentationsOnBanachSpacesOfData §6.7 (multiplying the characters of the two spaces of a pair by characters `μ`, `μ′`
of `[U(1)]` multiplies the Weil action, the theta functional and the kernel of a datum modulo a modulus at `(g, h)` by
values of `μ`, `μ′` at `det g`, `det h`); IdelicReciprocityCountsAndCyclotomicClassGroups §7.1 (base change is injective: a character `μ` of `[U(1)]` is determined by
the Hecke character `x ↦ μ(x/x̄)` of `E`, because every point of `U(1)(𝔸)` is `y/ȳ` for an idele `y`; used to turn the
condition on the splitting characters into `α·α′ = ν⁻¹·υ₁^{n/2}`).

[ShortProof], `New/Determinant/Exchange/TheoremForPartners.lean` (`New.Exchange.exchange_identity`,
`New.Exchange.exchange_theorem`, `New.Exchange.exists_areMatched_modDatum_eq`)

### 3.10 The exchange identity for a definite space with determinant data

*Origin:* particular to this proof: the exchange identity with `V` positive definite and explicit real data, products of
determinants on both sides, at the cost of a fixed factor that may vanish; nearest published result: Kudla and Rallis
(1994), the first term identity (with its extensions to other dual pairs, for a split `W`: Gan, Qiu and Takeda (2014),
Theorem 7.3).

*Method of the formal proof:* 3.9 for one polynomial and its translates; an archimedean step moves an identity between
functionals on the two Fock spaces, which holds for one polynomial and its translates, to the explicit products of
determinants, which transform by the same law under the real Weil representation; this costs a factor `c′`.

Let `W` (rank `n`) and `V′` (rank `b`) both have `l` negative signs, `I_a` the positive definite space of rank `a`, with
`n = b + a`, `a = b + 2d` and `n = 2l + 2s₀`, `s₀ ≥ 1`; let `n₊ = n − l` and `b₊ = b − l` be the numbers of positive
signs of `W` and `V′` (so `n₊ = b₊ + a`), and at each infinite place `τ` let `ℐ(τ)` index a finite family of `b₊ × n₊`
complex matrices `η_{τ,i}`. There are `C > 0` and `c′ ∈ ℂ` (possibly `0`) such that for every modulus `𝔪` and every
character `α` of `[U(1)]` of weight `−#ℐ(τ)`, tame for `(𝔪, χ)`, there is `c` with
`|c|² = C·L_*(places of 𝔪, (α/υ₁^{s₀})⁻¹, d) ≠ 0` and, for all `η`, all `g ∈ U(W)(𝔸)` and all matched `Φ`, `Ψ` modulo `𝔪`
for `χ⁻¹`: `c′` times the class sum, at the level `K₀` of `I_a`, over the finite points `h` of `U(I_a)` of `α(det h)` times
the kernel of `(W, I_a)` at `(g, h)`, with the characters `υ₁^l` on `W` and `1` on `I_a`, with data `Φ` and the product
over `τ, i` of the determinants of `η_{τ,i}` stacked over the `a × n₊` matrix of the variables of the positive part of
`W`, equals `c·α(det g)` times the integral over `x ∈ [U(V′)]` of `α(det x)⁻¹` times the kernel of `(V′, W)` at `(x, g)`,
with the character `υ₁^l` on each of `V′` and `W`, with data `Ψ` and the matched product of determinants
`∏_τ det(y⁻_τ)^{#ℐ(τ) + n − 2l}·∏_{τ,i} det(η_{τ,i} y_τ)`, where `y_τ` is the `n₊ × b₊` block of the variables at `τ`
with both signs positive and `y⁻_τ` the `l × l` block with both signs negative. In the normalised form used later, under
the same hypotheses with `n = 2l + 2s₀`, `s₀ ≥ 1` replaced by `2l + 2 ≤ n`: there is a real `C` (possibly `0`) such that
for every `α` of weight `l − #ℐ(τ)` tame for `(𝔪, χ)` some `c` with `|c|² = C/L_*(places of 𝔪, α⁻¹υ₁^{b+d}, d)` makes `c`
times the class sum equal to the integral, now with the characters `α, β` on `(W, I_a)` and `α/β, α` on `(V′, W)` and
without the factors `α(det h)`, `α(det g)`, `α(det x)⁻¹`, for every character `β` of `[U(1)]`, with the same polynomials
and level and all matched `Φ`, `Ψ` modulo `𝔪` for `χ⁻¹`.

*Needs:* 3.9; IntegralRepresentationsOfGeneralLinearGroups §2.4 (polarisation: for `p < n` and complex `p × n` matrices `η_{τ,i}`, the product of
the `det(η_{τ,i}·Y_τ)` is a finite combination, with coefficients free of the `Y_τ`, of the products
`∏_τ det(η₀·u_τ^T·Y_τ)^{#ℐ(τ)}` with `u_τ` unitary and `η₀` a matrix of `p` standard basis rows); DiscreteSeriesCoefficientsAndAutomorphicMetrics §7.5a (class-set
integration on a definite group).

[ShortProof], `New/Determinant/Exchange/ExplicitMatching.lean` (`New.Rows.exists_stdClassSum_eq_mul_integral_modKernel`,
`New.Rows.exists_mul_stdClassSum_eq_integral_modKernel`, `New.Rows.exists_mul_apply_eq_apply_matchedPoly`)

### 3.11 The finite square law

*Origin:* particular to this proof: linear algebra over a finite ring behind the commuting squares of theta lifts.

*Method of the formal proof:* take the law at a block point, multiply by a unipotent matrix, sum over the block with
the weights and average over the shear; for (b) apply the rule to a Fourier transform and compare the transforms of the
two weights.

Let `R` be a finite commutative ring, `χ` a multiplicative character and `σ : b ⊔ a ≃ n`. Functions `L` on `a × n` and `L′`
on `n × b` matrices satisfy the square law with constant `c` if `L(kx) = χ(det k)L(x)` for `k ∈ GL_a(R)`,
`L′(yk) = χ(det k)L′(y)` for `k ∈ GL_b(R)`, and `∑_y Ψ(y)L′(y) = c·∑_x Φ(x)L(x)` for all matched `(Φ, Ψ)` over `R`. For a
function `p` on `n × a` matrices let `next(p)` be the function on `(n ⊔ b) × (a ⊔ b)` matrices equal to
`p(−η)/#M_{n×b}(R)` at `(η s; 0 1)` and `0` elsewhere. Prove:

(a) under the square law for the splitting `a ⊔ (n ⊔ b) ≃ n ⊔ a ⊔ b`,
`#GL_a(R)·∑_y p(y)·L′(y stacked over (1; 0)) = c·#GL_{n⊔b}(R)·∑_x next(p)(x)·L((1; 0) placed left of x)`, the sums over
the `n × a` matrices `y` and the `(n ⊔ b) × (a ⊔ b)` matrices `x`, where `(1; 0)` is the matrix of the inclusion of the
first summand (of `a` in `a ⊔ b`, resp. of `n` in `n ⊔ b`);

(b) let the additive character `ψ` of `R` be primitive (`x ↦ ψ(ex)` is nontrivial for every `e ≠ 0`) and `χ` be
primitive (for every `e ≠ 0` some `χ(1 + c₀e)` is neither `0` nor `1`), and write `F(f)(ρ) = ∑_v f(v)ψ(tr(ρv))` for the
Fourier transform of a function `f` of matrices. For the shapes `n = u`, `a = u ⊔ v`, `b = v` (`u`, `v` finite index
sets) there is `γ` with `|γ|²·#R^{#v(#v + 2#u)} = 1` such that, whenever `L`, `L′` satisfy the square law with constant
`c` for the splitting of (a), for every function `p` on `a × n` matrices (`next(p)` formed with `n` and `a` exchanged):
`∑_y F(p̄)(y)·L′(y stacked over (1; 0)) = γc·∑_x F(conj next(p))(x)·L((1; 0) placed left of x)`, where `p̄` and
`conj next(p)` are the complex conjugate functions;

(c) matched partners are unique; if `(Φ, Ψ)` are matched and `g ∈ GL_n(R)`, so are `x ↦ χ(det g)Φ(xg)` and
`y ↦ Ψ(g⁻¹y)`; and every `Ψ` that vanishes off the blocks of the columns `b` of invertible matrices and satisfies
`χ(det h)·Ψ(yh) = Ψ(y)` for all `h ∈ GL_b(R)` has a match.

*Needs:* 3.1.

[ShortProof], `New/Determinant/Chain/SquareLaw.lean` (`New.Exchange.SquareLaw`, `New.Exchange.SquareLaw.sum_eq_nextDatum`,
`New.Exchange.SquareLaw.exists_sum_matrixFourier_eq_sum_nextDatum`, `New.Exchange.areMatched_matchOf`,
`New.AreMatched.unique`, `New.AreMatched.translate`)

### 3.12 One square: up then down against down then up

*Origin:* adapted from the seesaw identity (Kudla (1984)) and the regularised Siegel–Weil formula with the complementary
space (Kudla and Rallis (1994); Ichino (2004)): here the two routes around a square of four spaces agree on matched data
up to a factor `κ/c_i`, where `|c_i|²` is a fixed number times `L_*` and `κ`, independent of the character, is not shown
to be nonzero.

*Method of the formal proof:* apply 3.9 to `W = U₁ ⊕ U₂`. A theta kernel of `W` is a product of a kernel of `U₁` and one of
`U₂`, so pairing both sides with a form on `U₁` and changing the order of the integrals gives, on each side, a lift
followed by a transposed lift, summed over matched point data. The archimedean data of the two sides are polynomial
vectors of the four edges; comparing them costs the factor `κ`, which may be `0`.

Let `U₁`, `U₂`, `A`, `A′` be hermitian spaces with `W = U₁ ⊕ U₂`, `rank A = rank A′ + 2t`, `neg(W) = neg(A) + neg(A′) = q`,
`2q + 2 ≤ rank W ≤ 2μ(τ) + 2q` for all `τ`, and `σ : A′ ⊔ A ≃ U₁ ⊔ U₂` (index sets). Let `I` be a set and, for `i ∈ I`,
`ν_i` tame of weight `μ` for `(𝔪_i, χ_i)`; let the four pairs `(U₁, A)`, `(U₂, A)`, `(A′, U₁)`, `(A′, U₂)` be edges
`e₁ → e`, `ē₂ → ē`, `ē′ → ē₁`, `e′ → e₂` for families of characters of `[U(1)]` of fixed weights, with polynomial real
data, such that on each side of the square the two splitting characters multiply to `ν̃_i⁻¹`. For a matrix `x` modulo
`𝔪_i` with rows indexed by `A`, let `Θ_i(x)` be the lift from `U₁` to `A` followed by the transposed lift to `U₂`, with
the point data of the two blocks of `x`; for `y` with columns indexed by `A′`, let `Θ′_i(y)` be the transposed lift from
`U₁` to `A′` followed by the lift to `U₂`. Then there are `C > 0` and `κ ∈ ℂ` (possibly `0`) such that for each `i` some
`c_i` has `|c_i|² = C·L_*(places of 𝔪_i, ν_i, t) ≠ 0` and
`∑_y Ψ′(y)·Θ′_i(y) = (κ/c_i)·∑_x Ψ(x)·Θ_i(x)` as maps from forms of type `e₁` on `U₁` to forms of type `e₂` on `U₂`, for all
matched `Ψ`, `Ψ′` modulo `𝔪_i`. Moreover, for every form `f` of type `e₁` on `U₁` and every linear functional `l` on the
forms of type `e₂` on `U₂`, the functions `L(x) = l(Θ_i(x)f)` and `L′(y) = l(Θ′_i(y)f)` satisfy the square law of 3.11
for `χ_i` and `σ` with constant `κ/c_i`; in particular `Θ_i(kx) = χ_i(det k)·Θ_i(x)` and `Θ′_i(yk′) = χ_i(det k′)·Θ′_i(y)`
for invertible matrices `k`, `k′` modulo `𝔪_i` indexed by `A`, resp. `A′`.

*Needs:* 3.9, 3.11; WeilRepresentationsOnBanachSpacesOfData §§6.4, 7.4 (a family of characters over a real edge is a family of pairs of characters of
`[U(1)]`, all of one pair of weights and, in each pair, of one tame part, together with two pairs of conjugate cuspidal
types and a polynomial `P` whose Fock vector is an edge between the types, in the sense of the background entry of 2.1,
for the real Weil representation of these weights. For such a family and an arbitrary polynomial `Q` there is one
complex `κ`, the same for every member of the family, all spaces `S`, `T` of the given signs, every modulus `𝔪`, every
function `x` on matrices modulo `𝔪` and all forms `y` on `S` and `z` on `T` of the conjugate types, such that the
Petersson product of `z` with the conjugate of the lift of `ȳ`, formed with the datum of `(x, Q)`, is `κ` times the
inner product of the transposed lift of `z`, formed with the datum of `(x, P)`, with `y`. The number `κ` may be `0`, and
this is adjointness up to the factor `κ`, not adjointness. For automorphic functions `y` on `S` and `y′` on `T` of rapid
decay and any theta kernel and datum, `∫_{[T]} y′·(lift of y) = ∫_{[S]} y·(transposed lift of y′)`).

[ShortProof], `New/Determinant/Exchange/OneSquare.lean`
(`New.Exchange.exists_sum_pairLift_comp_pairTransposedLift_eq_smul`, `New.Exchange.IsSquare`,
`New.Exchange.equivariant_and_exists_sum_eq_of_areMatched`, `New.Exchange.one_square_identity_of_isEdgeFamily`)

## Layer 4: The norm of a chain of lifts and its two determinants

### 4.1 Triangles of arrows and their Gram forms

*Origin:* particular to this proof: an abstract triangle of inner product spaces with lifts along the rows and descents
between rows, in which the Gram form of a full chain is computed square by square; with the order of a block triangular
group over a finite ring.

*Method of the formal proof:* induction on the length of the chain, from row `i + 1` to row `i`: the commutation of the
squares moves the descent of the first step to the end, the adjoint law turns it into the adjoint of the lift, and the
Gram form of the first arrow finishes; the moduli multiply.

(a) For a commutative ring `R`, the group of invertible block upper triangular matrices with diagonal blocks one copy of
`N` and `j` copies of `T` has order `#GL_N(R)·#GL_T(R)^j·#R^{e}`, `e` independent of `R`.

(b) A triangle of size `m` consists of inner product spaces `F(i, n)`, a parameter set `I`, linear maps
`a_t(i, n) : F(i, n) → F(i, n + 1)` and `d_t(i, n) : F(i, n + 1) → F(i + 1, n)` for `t ∈ I`, positive integer weights
`w_t(n)`, and isometries `j_i : V → F(i, 0)`, such that: for all `i, n` with `i + n + 2 ≤ m` the square at `(i, n)`
commutes up to some function `β` on `I`, `w_t(n)·a_t(i + 1, n)∘d_t(i, n) = (w_t(n + 2)/β̄_t)·d_t(i, n + 1)∘a_t(i, n + 1)`
on `F(i, n + 1)`, where the scalar `w_t(n + 2)/β̄_t` is read as `0` if `β_t = 0`; and for every `i < m`, with `a = a_t(i, 0)` and `d = d_t(i, 0)`: `⟨z, a(j_i y)⟩ = ⟨d z, j_{i+1} y⟩`
for `y ∈ V` and `z ∈ F(i, 1)`, and `d∘a` maps `j_i(V)` into `j_{i+1}(V)` with trivial kernel on `j_i(V)`. Then for all
`i, n` with `i + n ≤ m` and every `t ∈ I`, the weighted chain `(w_t(n − 1)·a_t(i, n − 1))∘⋯∘(w_t(0)·a_t(i, 0))` of
length `n` of row `i`, a map `F(i, 0) → F(i, n)`, is injective on `j_i(V)`. The range `i + n ≤ m` is needed: beyond it
nothing is assumed of the arrows.

(c) Let `Mod` be a relation between functions `c : I → ℂ` and `F : I → ℝ`, read "`c` has modulus `F`", such that the
constant `1` has modulus `1` and, if `c` has modulus `F` and `c′` has modulus `F′`, then `cc′` has modulus `FF′`; assume the
square constants `β` at `(i, n)`, `i + n + 2 ≤ m`, have modulus `L(i + 1, i + n + 2)` and every such square obeys the
adjoint law (every `z` has an `a`-adjoint vector `x` with `⟨d x, y⟩ = ε_t⟨d z, a y⟩`) with `ε` of modulus `1`. Let
`s : U → V` and endomorphisms `S_t(i)` of `U` satisfy, for every `i < m`,
`w_t(0)⟨a(j_i x), a(j_i s y)⟩ = C_i(t)⟨x, s(S_t(i) y)⟩` with `C_i` of modulus `1`. Then for
`i + n = m` there is `κ` of modulus `∏_{i<ρ<k≤m} L(ρ, k)` with
`⟨u x, u s(y)⟩ = κ_t·(w_t(0)w_t(1)^n/w_t(n))·⟨x, s(S_t(i)⋯S_t(m − 1) y)⟩` for the weighted chain `u` of row `i`.

*Needs:* none.

[ShortProof], `New/Determinant/Chain/TriangleNorms.lean` (`New.exists_card_parabolic_blockNumber_eq`,
`New.Exchange.IsTriangle`, `New.Exchange.HasSquareModuli`, `New.Exchange.IsTriangle.eq_zero_of_weightedChain_eq_zero`,
`New.Exchange.IsTriangle.exists_inner_weightedChain_eq`)

### 4.2 The triangle of lifts and its first lifts

*Origin:* adapted from the Rallis inner product formula in Weil's convergent range (Rallis (1984b), Proposition 1.1, for
orthogonal–symplectic pairs; J.-S. Li (1992)): here for the first lift of each row of the triangle of the chain, on the
forms fixed by the base level.

*Method of the formal proof:* the point datum of the first lift is sharp for the base level, so the Rallis formula for
sharp data gives the Gram form as a series of translates and the injectivity; lift and transposed lift with a datum are
adjoint after the datum is replaced by its conjugate transpose, and the opposite space carries the forms negated.

For the data and a flag `z ∈ {Y, Ỹ}`, the triangle `z` has nodes `(i, n)`, `i + n ≤ m`: the node `(i, n)` is the space of
the interval `[i + 1, i + n]`, the stem (the `r` basis indices of `Y₀` for `Y`; these and one more index, rank `r + 1`,
for `Ỹ`) plus the blocks `i + 1, …, i + n` (of length
`t` for `Y`, `t − 1` for `Ỹ`), with the signs and parameters of ThetaLiftChainsAndTheSeesawIdentity §2.4 (index sets,
signs and parameters of the grids), and `(i, 0)` is the space at `(0, 0)` negated `i` times. For an `m`-fold twist `ϑ`, the
lift from `(i, n)` to `(i, n + 1)` is the theta lift along the right pair that adds the last block, with the point
datum modulo `𝔪_z(ϑ)` (`π_M Q(ϑ)` for `Y`, `π_M^b` for `Ỹ`) and the character `μ_{i+n+1}⁰·ϑ^{i+n+1}·υ₁^{⌊n′/2⌋}` for
`Y`, `μ_{i+n+1}⁰·υ₁^{⌈n′/2⌉}` (no twist) for `Ỹ`, on each of its two spaces with `n′` the rank of that space; its weight
in the chains is `N_n(ϑ) = #GL_{rank (0,n)}(O_E/𝔪_z(ϑ))`, the index that makes the measure give the principal level of
`𝔪_z(ϑ)` volume `1`. The base level is `J_M` for `Y` and the principal level of `π_M^b` for `Ỹ`; the base forms are the
forms at `(0, 0)` fixed by the base level. Prove: for `i < m` there is a constant `C` such that for every `ϑ` and every
base form `y`, the first lift `a` of row `i` (applied to the copy at `(i, 0)` of a form at `(0, 0)`) satisfies

(a) if `⟨v, x⟩ = ⟨a y, a x⟩` for all `x`, then `v` is a base form, and `v = 0` implies `y = 0`;

(b) for every form `x` at `(0, 0)`, the series `∑_γ C·mc(γ)·⟨x, y(·γ)⟩ / #M_{n₁×n₀}(O_E/𝔪_z(ϑ))` converges to
`N_0(ϑ)·⟨a x, a y⟩`, where `n₀`, `n₁` are the ranks of the nodes `(0, 0)` and `(0, 1)`, `mc` is the vacuum coefficient
(as in 2.2) for the rank `n₁` and the character of the first lift of row `i` on its space of rank `n₁`, and `γ` runs over
the cosets of the finite points modulo those integral away from the places of `𝔪_z(ϑ)` and their conjugates
(representatives supported away from those places and their conjugates);

(c) for `i + n < m` there are polynomial real data making the left pair at `(i, n)` (removing the first block) and the
reversed pair edges. Moreover, for hermitian spaces `S`, `T`, let `S⁻` be `S` with its hermitian form negated; if
polynomial real data `Φ` make `(S, T)` an edge from the type of a parameter `l` on `S` to a type `e` on `T` for a family
of characters `α` (one for each rank), and `Φ′` make `(S⁻, T)` an edge from the type of `−l` to `ē` for the characters
`α⁻¹·υ₁^{rank}` (on a space of rank `n′`, the character `α_{n′}⁻¹·υ₁^{n′}`), then for every function `Ψ` of matrices modulo
a modulus there is a function `Ψ′` with `⟨x, Θ_{Φ,Ψ} y⟩ = ⟨Θ^T_{Φ′,Ψ′} x, y⁻⟩` for all forms `y` of the type of `l` on `S`
and `x` of type `e` on `T`, where `Θ_{Φ,Ψ}` is the lift from `S` to `T`, `Θ^T_{Φ′,Ψ′}` the transposed lift from `T` to `S⁻`,
and `y⁻` is `y` read on `S⁻`.

*Needs:* 2.1, 2.2, 3.1; SiegelWeilAndRallisFormulasOnUnitaryGroups §§4.4, 4.5 (the Rallis inner product formula for sharp finite data in the range
`rank V > 2 rank W`, in the form stated in the *Needs:* line of 2.2); WeilRepresentationsOnBanachSpacesOfData §§6.7, 7.4 (the background entry of 3.12 on families of
characters over a real edge: for such a family with polynomial `P` and an arbitrary polynomial `Q` there is one complex
`κ`, free of the member of the family, of the spaces, of the modulus, of the datum `x` and of the forms, such that the
Petersson product of `z` with the conjugate of the lift of `ȳ` with the datum of `(x, Q)` is `κ` times the inner product
of the transposed lift of `z` with the datum of `(x, P)`, with `y`; and negating a space conjugates theta kernels: for
spaces `S`, `T` of ranks `n`, `n′` there is a complex `c` of modulus `1` such that the conjugate of the kernel of
`(S, T)` with characters `(a, b)` on `(Ψ, P)` at `(g, h)` is `c` times the kernel of `(S⁻, T)` with characters
`(a⁻¹υ₁^n, b⁻¹υ₁^{n′})` on `(Ψ′, P̄)` at `(g, h)`, where `S⁻` has the negated form, `Ψ′(x)` is the conjugate of
`Ψ(u⁻¹x)` for a fixed unit `u` of `O_E/𝔪` that is the reduction of an element of norm `−1`, and `P̄` has the conjugate
coefficients); ThetaLiftChainsAndTheSeesawIdentity §2.4 (index sets, signs and
parameters of the grids; the parameters of every step correspond).

[ShortProof], `New/Determinant/Chain/TriangleLifts.lean` (`New.Data.triangleLift`,
`New.Data.exists_hasSum_inner_triangleFirstLift`, `New.Exchange.IsEdgeFamily.exists_inner_modLift_eq_inner_modTransposedLift`,
`New.Data.exists_isLeftPair`, `New.Data.exists_isReversedPair`)

### 4.3 Commutation in the squares of the triangle and injectivity of the chain

*Origin:* particular to this proof: the lifts of the triangle commute with the descents up to constants whose moduli are
ratios of Hecke values, so the triangle of 4.2 satisfies the conditions of 4.1, and the chain `Θ_ϑ` is injective at the
level `J_M`.

*Method of the formal proof:* each square is a square of 3.12, with the character of the square tame for
`π_M Q(ϑ)` and of weight the sum of the two lift weights; the size of its constant is given by 1.2 (c) as `R^quo`. The
second relation turns the descent into a reversed lift, commutes it with the lift by 3.12 and turns it back. The
descents are defined by recursion on `n` from the adjoint datum at `n = 0` by `next` (3.11).

(a) For `i + n + 1 < m` and left pairs at `(i, n)` and `(i, n + 1)` there is `β(ϑ)` such that for every `m`-fold twist `ϑ`
and every datum `Ψ`, `N_n(ϑ)·a∘d_Ψ = (β̄(ϑ))⁻¹·N_{n+2}(ϑ)·d_{next(Ψ)}∘a` on the node `(i, n + 1)` (in inner products), with `(β̄(ϑ))⁻¹` read
as `0` where `β(ϑ) = 0`, as in 4.1 (b); for
`Y`, `β` has modulus `R^quo_{i+1, i+n+2}` up to a norm power. Here `d_Ψ` is the transposed lift along the left pair at
`(i, n)`, from `(i, n + 1)` to `(i + 1, n)`, with the real datum that makes that pair an edge (4.2 (c)) and the finite
datum `Ψ`, a function of matrices modulo `𝔪_z(ϑ)`; `d_{next(Ψ)}` is the same along the left pair at `(i, n + 1)`.

(b) In the triangle `Y`, for the same `i, n`, there is `κ(ϑ)` of modulus `1` up to a norm power such that, if `x′` is the
image of `x` under the adjoint of the lift from `(i, n + 1)` to `(i, n + 2)`, then `⟨d_Ψ x′, y⟩ = κ(ϑ)⟨d_{next(Ψ)} x, a y⟩`.

(c) There are descents making the triangle `z` a triangle of size `m` in the sense of 4.1 (b), with the weights `N_n` and
the copies of the base forms at `(i, 0)`; for `Y` it has square moduli `R^quo` in the sense of 4.1 (c), the relation `Mod`
being "modulus up to a norm power" (1.1 (e)).

(d) For `x, y ∈ 𝒜(Y₀)`, `⟨Θ_ϑ x, Θ_ϑ y⟩ = [K₀ : J_ϑ(Y_m)]·dim(weight of Y_m)·⟨u x, u y⟩` (`K₀` the stabiliser of the
standard lattice of `Y_m(𝔸_f)`), `u` the weighted chain of the triangle `Y` from `Y₀`; and `Θ_ϑ` is injective on
`𝒜(Y₀)` for every `m`-fold twist `ϑ`.

*Needs:* 1.1, 1.2, 3.11, 3.12, 4.1, 4.2; ThetaLiftChainsAndTheSeesawIdentity §2.6 (the last level and its character),
§2.15 (the chain of lifts `Y₀ → Y_m`, which has that level and character).

[ShortProof], `New/Determinant/Chain/ChainNorms.lean` (`New.Data.exists_triangleLift_triangleTransposedLift_comm`,
`New.Data.exists_triangleTransposedLift_adjoint_comm`, `New.Data.exists_isTriangle`, `New.Data.inner_lowerChainAtLevel`,
`New.Data.lowerChainAtLevel_injective`)

### 4.4 The norm of the chain and its two determinants

*Origin:* adapted from the Rallis inner product formula (Rallis (1984b), Proposition 1.1, for orthogonal–symplectic
pairs, and J.-S. Li (1992), in the range `dim Y_1 > 2 dim Y_0` of the step `i = 0`; Gan, Qiu and Takeda (2014),
Propositions 11.1 (ii) and 11.2, in the range `n_i < n_{i+1} ≤ 2n_i`, `n_i = rank Y_i`, of the steps `i ≥ 1`), composed
along the `m` steps of the chain: here lift `j` is twisted by `ϑ^j`, the chain is compared with the single lifts through
the squares of a triangle, and the identity is one of operators and of determinants with Rallis series, with a twist-dependent factor
whose modulus is a product of ratios of Hecke values.

*Method of the formal proof:* the first lift of each row has the Gram form of its Rallis series (4.2), and 4.1 (c) with
the moduli of 4.3 gives the Gram form of the chain; the index of the last level and the weights cancel up to a constant
times a power of `Nm Q`. Determinants: the Rallis series has the same determinant on `𝒯` and on `𝒢(W_j)`, and the two
spaces have the same dimension (equality of multiplicities), so the factor `c_Q` cancels between the chain and the single
lifts. If the constant vanished at the trivial twist, `𝒯` would be `0` by injectivity.

Let `Ral(ϑ) = Ral_{1,ϑ}⋯Ral_{m,ϑ^m}` (product in the order `j = 1, …, m`) act on `𝒯`, where `Ral_{j,ϑ^j}` is the series
of 2.2 on the forms on `Y₀`, which preserves `𝒯`. Prove:

(a) there are `C > 0`, an integer `e` and numbers `c(ϑ)` with `|c(ϑ)| = C·Nm Q(ϑ)^{e/2}·∏_{1≤i<j≤m} R^quo_{ij}(ϑ)` and
`Θ_ϑ*Θ_ϑ = c(ϑ)·c_Q(ϑ)^m·Ral(ϑ)` on `𝒯`, for every `m`-fold twist `ϑ`;

(b) for `1 ≤ j ≤ m` there is `A_j ≠ 0` with `Z_j(ϑ) = (A_j·c_Q(ϑ))^d·det(Ral_{j,ϑ^j}|𝒯)` for every `ϑ`;

(c) there is an integer `e` such that for every `m`-fold twist `ϑ`: `Z(ϑ) > 0`, `Z_j(ϑ) > 0` for `1 ≤ j ≤ m`, and
`Z(ϑ)/Z(1) = (Nm Q(ϑ)^{e/2}·∏_{1≤i<j≤m} R^quo_{ij}(ϑ))^d·∏_{j=1}^{m} Z_j(ϑ)/Z_j(1)`;

(d) the range of `Θ_{j,ϑ}` on `𝒢(W_j)` is spanned by the lifts of good Hecke eigenforms whose lifts lie in the range of
the idempotent of a good family of labels.

*Needs:* 1.1, 1.2, 2.2, 4.1, 4.2, 4.3; SecondMomentsOfPoincareSeries §2.3 (equality of multiplicities: the
good forms on every `W_j` have dimension `d`), §2.4 (the Rallis series preserves the good forms and has the same
determinant on `𝒢(Y₀)` and on `𝒢(W_j)`).

[ShortProof], `New/Determinant/Chain/NormOfChain.lean` (`New.Data.exists_adjoint_chain_comp_eq_smul_rallisProduct`,
`New.Data.exists_normDet_goodLift_sq_eq`, `New.Data.exists_chainDeterminant_pos_and_div_chainDeterminant_one_eq`,
`New.Data.range_goodLift_le`)

## Layer 5: Auxiliary forms

The auxiliary forms are target forms whose twisted chains are integral at every prime not dividing `Nm Q(ϑ)` after
division by one scalar, the same for all forms. They are produced by a period computation through two grids of unitary
groups: periods of forms on the first path (the chain itself) are moved, one square at a time, to the last path, where all
spaces are definite and the periods are finite sums with controlled denominators.

### 5.1 Monotone paths through two grids

*Origin:* particular to this proof: the combinatorics of the paths of theta lifts through the two grids.

*Method of the formal proof:* induction on paths.

A grid path from `(a₀, b₀)` to `(a, b)` is a sequence of steps down (`b` decreases by `1`) and right (`a` increases by
`1`). A two-grid path for `m` is a diagonal index `l ≤ m` and two grid paths from `(0, m)` to `(l, l)` (its halves in the
grids `Y` and `Ỹ`). The first path has `l = 0` and both halves the column `(0, m) → (0, 0)`; the last has `l = m` and both
halves the row `(0, m) → (m, m)`. A turn at `(i, j)` replaces, in one half, two steps down-then-right through a corner by
right-then-down through `(i + 1, j + 1)` (off the diagonal; in the half of the grid `Ỹ`, whose nodes are recorded with the
two indices exchanged, the turn at the corner `(a, b)` of the half is the turn at `(b, a)`), or replaces two halves ending
with a step down at `(j, j + 1)` by halves ending with a step right (on the diagonal, `l = j → j + 1`). The squares between
the first path and a two-grid path with diagonal index `l` are the `(i, j)` with `i, j < l`, the `(i, b)` with `i < a` for
each step down `(a, b + 1) → (a, b)` of the half in `Y`, and the `(b, i)` with `i < a` for each such step of the half in
`Ỹ`. Prove: every two-grid path other than the last admits a turn; under a turn at `(i, j)` the square `(i, j)`, not
among the squares of the old path, is added to them; and a property that holds at
the last path with the empty set of squares and passes backwards along a turn at a new square holds at the first path
with all `m²` squares `(i, j)`, `i, j < m`.

*Needs:* none.

[ShortProof], `New/Determinant/AuxiliaryForms/GridPaths.lean` (`New.TwoGridPath`, `New.TwoGridPath.Turn`,
`New.TwoGridPath.squares`, `New.TwoGridPath.exists_turn`, `New.TwoGridPath.Turn.squares_eq`,
`New.TwoGridPath.turn_induction`)

### 5.2 Weights of regular parameters

*Origin:* adapted from the classical dictionary between highest weights of `GL_n` and regular integral parameters
(the Harish-Chandra parameter is the highest weight shifted by half the sum of the positive roots): here an explicit
weight for each regular integral parameter, with bounds on its boxes and its determinant power.

*Method of the formal proof:* the columns of the weight are read off from the gaps between consecutive entries of the
sorted parameter.

A weight `(κ, e)` at the infinite places gives the number `κ_τ(h)` of columns of height `h` and the power `e(τ)` of the
determinant; its doubled Harish-Chandra parameter is a vector `l_τ`. Prove: (a) if every `l_τ` is a parameter with gap
(distinct entries of the parity of `n − 1`), then `l` is the doubled parameter of some weight; more precisely, for all
integers `e₀(τ)` with `e₀(τ) ≤ ⌊l_τ(i)/2⌋ + ⌊n/2⌋` for every `τ` and `i`, and all prescribed numbers `κ⁰_τ(h)` of columns
of the heights `h > n`, there is a weight `(κ, e)` with doubled parameter `l`, with `κ_τ(h) = κ⁰_τ(h)` for `h > n`, and
with `e(τ) = e₀(τ) + κ_τ(n)` (the parameter sees only the columns of height below `n` and the determinant power); (b) if `l` is the doubled parameter of `(κ, e)` and `|l_τ(i)| ≤ β` for all `τ` and `i`, then `κ` has at most
`f·n·β` boxes in the columns of height below `n`, and, for `n ≥ 1`, `|e(τ)| ≤ β`.

*Needs:* none.

[ShortProof], `New/Determinant/AuxiliaryForms/RegularParameters.lean` (`New.Exchange.exists_isHCParam_of_hasGap`,
`New.Exchange.exists_isHCParam_of_le`, `New.Exchange.boxes_le_card_mul_of_isHCParam`,
`New.Exchange.natAbs_le_of_isHCParam`)

### 5.3 The two grids, path data and their periods

*Origin:* definitions and conventions.

*Method of the formal proof:* definitions; the closure lemmas are direct.

(a) Put `𝔟 = π_M^b` (the scale `b` as an integer), `𝔪₀(ϑ) = π_M·Q(ϑ)` and `𝔪(ϑ) = 𝔟·Q(ϑ)` for an `m`-fold twist `ϑ`. The
grid `Y` has nodes `Y^a_b` (`a, b ≤ m`): the stem of rank `r` with `a` blocks and then `b` blocks of length `t`; the grid
`Ỹ` has nodes `Ỹ^b_a`: the stem plus a line (rank `r + 1`) with `a` blocks of length `t + 1` and `b` of length `t − 1`;
signs and parameters are those of ThetaLiftChainsAndTheSeesawIdentity §2.4 (index sets, signs and parameters of the
grids).
`Y^0_j = Y_j`, `Ỹ^0_0 = Y₀ ⊕ ⟨1⟩`, and `Ỹ^j_j` is `Y^j_j` plus one vector of sign `(−1)^j`; every node of the two grids
has rank at most `2n_m`, `n_m = k + m(t + 1)`. Forms in grid `Y` are conjugate forms (of the negative parameter), forms in grid `Ỹ` are forms. The level at a node is a subgroup of `GL` over
`O_E/𝔪(ϑ)`: trivial at the nodes `Y_b = Y^0_b`, and the kernel of reduction modulo `𝔟` elsewhere;
`gridLevelForms(i)` are the forms on `Ỹ^i_0` of the principal level of `𝔟`.

(b) A vertical edge (one along which the lower index grows: from `Y^a_b` to `Y^a_{b+1}`, or from `Ỹ^a_b` to
`Ỹ^a_{b+1}`) carries the character `μ_{l+1}⁰·ϑ^{l+1}·υ₁^{⌊n/2⌋}` of its edge index `l`, a horizontal edge the character
`μ_{l+1}⁰·υ₁^{⌈n/2⌉}` (the character is used on both spaces of the edge, on each with `n` the rank of that space). The
edge index `l` is the value, at the start of the edge, of the index that grows along it. A move along an edge is the
theta lift (or the transposed lift) with a single matrix modulo `𝔪(ϑ)` as finite datum.

(c) An edge tuple is a matrix modulo `𝔪(ϑ)` for each edge; a family `g` of invertible matrices at the nodes acts on it by
`S_e ↦ g_q⁻¹ S_e g_p` on `e = (p, q)`, and is admissible if it lies in the level at the two ends `Y_m` and `Ỹ^m_0` and is
`g ⊕ 1` at `Ỹ^a_a` for its element `g` at `Y^a_a`. A path datum with bound `N` on a set of edges is a function `Ψ` of the matrices
on these edges, invariant under admissible families up to the product of the edge characters at `det g_q/det g_p`,
vanishing unless the vertical edges carry left invertible matrices, with values sums of at most `N` roots of unity.

(d) The diagonal period of a conjugate form on `Y^j_j` and a form on `Ỹ^j_j` at a real point `g` is the period along
`U(Y^j_j) → U(Ỹ^j_j)` of the first against the second translated by `g` and, on the added line, by the `j`-th power of the
finite idele `ū/u` (`u` a fixed multiple of the idele generating `𝔪(ϑ)`). The period of a family of path data `Ψ_ϑ` on a
two-grid path `Γ` at `g` is the function of triples `(ϑ, y′, φ)` (a twist, a conjugate form on `Y_m`, a form on `Ỹ^m_0`)
`∑_S Ψ_ϑ(S)·(diagonal period of the images of y′ and φ along the two halves of Γ with the matrices of S)`. `Ψ ∝ Ξ` means
that at each real point the period is a multiple of `Ξ` by a number independent of the triple. A pair of paths
`(Γ′, Γ)` transfers periods with factor `k` and constants `c(ϑ)` (numbers `c(ϑ) ≠ 0`; the factor `k = k(ϑ)` may depend
on `ϑ`) if every family of path data `Ψ′_ϑ` on `Γ′` (bounds `N(ϑ)`) gives path data `Ψ_ϑ` on `Γ` (bounds `k(ϑ)·N(ϑ)`)
with: `Ψ ∝ Ξ` implies `Ψ′ ∝ Ξ/c`, that is `Ψ′ ∝ ((ϑ, y′, φ) ↦ Ξ(ϑ, y′, φ)/c(ϑ))`.

*Needs:* ThetaLiftChainsAndTheSeesawIdentity §2.1 (the spaces `Y_j`), §2.4 (index sets, signs and parameters of the
grids); 3.1.

[ShortProof], `New/Determinant/AuxiliaryForms/PathData.lean` (`New.Data.gridModulus`, `New.Data.gridSpace`,
`New.Data.gridChar`, `New.Data.liftMove`, `New.Data.transposedMove`, `New.Data.IsPathDatum`,
`New.Data.diagonalPeriodForm`, `New.Data.gridPeriod`, `New.Data.IsProportional`); `New/Determinant/AuxiliaryForms/Turns.lean`
(`New.Data.TransfersPeriods`)

### 5.4 Steep parameters and periods of Poincaré series of deep level

*Origin:* adapted from the unfolding of Poincaré series on adelic groups, in which the identity coset gives the main
term (for periods of Poincaré series of deep level: Prasad and Schulze-Pillot (2008); Muić (2015)): here the period
over `[U(V)]` of a Poincaré series of deep level on `U(V ⊕ ⟨1⟩)` built from translated discrete series coefficients.

*Method of the formal proof:* the cosets of `U(V)` in `U(V ⊕ ⟨1⟩)` are indexed by last columns, which are separated at deep
level; the term of the identity coset is the main term, and the others decay like a power of the length of the last
column.

(a) For one numbering of the indices, the parameter of `Y₀` and minus the parameter of `Ỹ^0_0` are steep at every
infinite place in the sense of PairsOfFramesAtOnePlace §8.1 (a): the lowest `K`-type vanishes
on a block of `k − 1` indices of sign `+1` (the basis indices of the space `X₀` of rank `k` of
ThetaLiftChainsAndTheSeesawIdentity §2.1 other than the last), and on the other `2ϱ + 2` indices (one
more for `Ỹ^0_0`; `ϱ` the number of hyperbolic planes of `Y₀`) the signs alternate and the weight of the lowest `K`-type
decreases strictly within `[−3B, −B]`, where `B = κ_0(τ)` is the weight `κ_j(τ)` of the data
(OneSidedPrimeSumBoundsAndAdmissibleData §3.2) at `j = 0`.

(b) Let `V` be a hermitian space of rank `n` over a CM field with a root of unity of order `5040` and `f` infinite
places, `F` an automorphic
function of level the principal level of `a ≠ 0` bounded by `S`, `l` parameters on `V ⊕ ⟨1⟩` with gap at least
`500(n + 1)³ + 2A`, `|a|_τ ≥ R ≥ 0` at every `τ`, `d² ≤ R·λ(x)` with `λ(x)` the first minimum of the lattice at `x` (cut at
`1`), `d ≥ max(10, f)`, `A ≥ 2f(n + 1) + 2` and `A > 8(n + 1)²`. Then the period at `x` against `F` of the Poincaré series
of level `a` of the translated product of discrete series coefficients differs from `vol(principal level of a)` times
the real convolution of `F` at `x` with the restricted coefficient by at most `vol·C(A, α, ω)·S·10/d`. Here `α, ω` are
points of the real group `∏_τ U(V_τ ⊕ ⟨1⟩)`; the translated product is
`g ↦ ∏_τ conj(c_{l_τ}(α_τ⁻¹ g_τ ω_τ))`, `c_{l_τ}` the discrete series coefficient of the doubled parameter `l_τ`; its
restriction is `r ↦` its value at `r ⊕ 1` on `∏_τ U(V_τ)`, which is integrable; and
`C(A, α, ω) = ∏_τ (2(‖α_τ‖·‖ω_τ‖)²)^A·16^A·vol{r ∈ U(V_τ) : ‖r − 1‖ ≤ 1}`, with operator norms of matrices and the Haar
measure of `U(V_τ)` normalised as in SecondMomentsOfPoincareSeries (Conventions, **Normalisations**).

*Needs:* PairsOfFramesAtOnePlace §8.1 (steep parameters and discrete series coefficients); AdelicUnitaryGroupsAndAlgebraicModularForms §4.2 (the
first minimum cut at `1`. For a hermitian space `V` over a CM field with point `x`, and a point `g` of the adelic
unitary group, the lattice at `g` is the set of rational vectors `y` for which `(xg)⁻¹y` has integral finite part, the
length of `y` is the Euclidean norm of the archimedean components of `(xg)⁻¹y`, and `λ(g)` is the minimum of `1` and of
the least length of a nonzero vector of the lattice. Then `0 < λ(g) ≤ 1`; `λ = 1` at every point if `V` is definite; and
for the block sum of points `g`, `h` of two spaces, `min(λ_V(g), λ_W(h)) ≤ λ_{V⊕W}(g ⊕ h)`).

[ShortProof], `New/Determinant/AuxiliaryForms/DeepLevelPoincarePeriod.lean` (`New.Data.exists_isSteep`,
`New.Exchange.norm_poincare_period_sub_le`)

### 5.5 Forms on `Y₀` are detected by the deep level on `Ỹ^0_0`

*Origin:* particular to this proof: every nonzero form on `U(Y₀)` of level `J_M` has a nonzero period against a form of
deep level on the unitary group of `Y₀ ⊕ ⟨1⟩`, after one real translation, by a Poincaré series whose main term
dominates.

*Method of the formal proof:* it suffices to halve every bound `S` of `|y|`. Where the lattice at the point has a short
vector, cuspidality and slow variation give the halving; elsewhere orthogonality to the restricted Poincaré series and
5.4 make the smoothing of `y` by the translated coefficient small, and the lower bound for the pairing of the two
coefficients undoes the smoothing.

(a) (criterion) Let `V` be a space of rank `n ≥ 1` over `E` and `l`, `l′` parameters on `V` and `V ⊕ ⟨1⟩` with gaps at
least `500n³ + 4A`, `500(n+1)³ + 2A`, entries of `l` bounded by `L`, and let `A, L, γ, β, ρ` satisfy: `8(n + 1)² < A`,
`γ < A`, `2f(n + 1) + 2 ≤ A`, `M·C_cusp² ≤ β` (`C_cusp` the cusp constant of the background entry below, for the rank
`n`, with the order of the cyclotomic field of the data that contains `E` as the natural number in the different),
`2000(n + L + 1)⁶ ≤ β`, `f ≤ β`, `β^{20A(f+1)} ≤ ρ` and `ρ^{3n+2} ≤ |𝔟|_τ` at every `τ`. Let `ω` be a real point of
`U(V ⊕ ⟨1⟩)` with `‖ω_τ‖² ≤ β` and `vol{r : ‖r − 1‖ ≤ 1} ≤ β^γ·|∫ c_l(r)·c̄_{l′}(ω⁻¹(r ⊕ 1)ω) dr|` at every `τ` (the
integral over the real points `r` of `U(V)` at `τ`; `c` the discrete series coefficients). Then a form `y` of type `l`
and level `J_M` on `V` is `0` if it is Petersson-orthogonal to `x ↦ φ((x ⊕ 1)ω)` for every form `φ` of type `l′` and
principal level of `𝔟` on `V ⊕ ⟨1⟩`.

(b) For the data, there is a real point `g` of the unitary group of `Ỹ^0_0` such that every `y ∈ 𝒜(Y₀)` that is
orthogonal to `x ↦ φ((x ⊕ 1)g)` for all `φ ∈ gridLevelForms(0)` is `0`.

*Needs:* 5.3, 5.4; PairsOfFramesAtOnePlace §8.6 (a lower bound for the pairing of two steep discrete series coefficients
at some point, by Laplace's method); AdelicUnitaryGroupsAndAlgebraicModularForms §5.4 (a cuspidal form at a point with a short lattice vector is
bounded by its oscillation under small real translations. Let `V` be a hermitian space of rank `n` over a CM field `E`
with `f` infinite places and root discriminant `rd`, let `N ≠ 0` be a natural number in the different of `E`, and
`C_cusp = 8fn·rd + 48n⁶f²N + 1`. Let `F` be a form on `V` whose type is a cusp kernel, right invariant under the
principal level of a natural number `M ≠ 0`, let `0 < δ ≤ 1`, and let `g` be a point whose first minimum, cut at `1` as
in the background entry of 5.4, is less than `(δ/(M·C_cusp²))^n`. If `|F(g·x) − F(g)| ≤ C` for every real point `x` at
distance at most `δ` from `1`, then `|F(g)| ≤ C`).

[ShortProof], `New/Determinant/AuxiliaryForms/DeepLevelVanishing.lean`
(`New.Exchange.eq_zero_of_petersson_translate_eq_zero`, `New.Exchange.exists_forall_eq_zero_of_petersson_restrict_eq_zero`,
`New.Data.exists_eq_zero_of_orthogonal_gridLevelForms`)

### 5.6 Periods on the diagonal and the first path datum

*Origin:* particular to this proof: the period of the two iterated transposed lifts down the first columns is a constant
times the period of one path datum on the first path.

*Method of the formal proof:* for one tuple of matrices the two iterated transposed lifts are lifts with point data, so
their diagonal period is the period attached to the indicator of that tuple. Summing the translates of this indicator by
the admissible families, each against the edge characters, gives a function with the invariance of a path datum; the
period has the same invariance, so the sum multiplies it by the number of translates.

Let `y′` be a conjugate form on `Y_m`, `φ` a form on `Ỹ^m_0` and `g` a real point of `U(Ỹ^0_0)`; move `y′` down the first
column of `Y` by the transposed lifts at the twist `ϑ` and `φ` down that of `Ỹ` at the trivial twist (each weighted by the
order of `GL` of its smaller space modulo `𝔪₀(ϑ)` in `Y`, modulo `𝔟` in `Ỹ`). There are a constant `C` and, for each
`ϑ`, a path datum `Ψ_ϑ` on the first path with bound `(#(O_E/𝔪(ϑ))^{(2n_m)²})^{2m}` such that the diagonal period at `g`
of the two images is `C` times the period of `Ψ` on the first path at `(ϑ, y′, φ)`. Moreover, at each real point `g` there is a linear map
`R` from `gridLevelForms(0)` to the forms of level `J_M` on `Y₀` such that, for every `ϑ`, every form `y` of level
`𝔪₀(ϑ)` on `Y₀` and every `φ ∈ gridLevelForms(0)`, the diagonal period at `(0, 0)` and `g` of the conjugate of `y` and `φ`
is `⟨y, R φ⟩`.

*Needs:* 5.3.

[ShortProof], `New/Determinant/AuxiliaryForms/GridFirstColumns.lean` (`New.Data.exists_isPathDatum_diagonalPeriodForm_eq`,
`New.Data.exists_petersson_eq_diagonalPeriodForm`, `New.Data.firstPathDatum`)

### 5.7 The maps `Θ^♭` and `res^♭`, and the first path

*Origin:* adapted from the Rallis inner product formula (Rallis (1984b), Proposition 1.1, for orthogonal–symplectic
pairs, and J.-S. Li (1992), for the first step of the column, whose larger rank exceeds twice the smaller; Gan, Qiu and
Takeda (2014), Propositions 11.1 (ii) and 11.2, for the later steps, whose larger rank is at most twice the smaller):
here for the column of the grid `Ỹ`, untwisted and of deep level, whose transposed chain is onto.

*Method of the formal proof:* the chain of lifts of `Ỹ` is injective on the level `𝔟` (the triangle `Ỹ` of 4.3 with 4.1
(b)), and it is the transpose of `Θ^♭`, so a form orthogonal to the image of `Θ^♭` has a lift of norm zero; `res^♭` is
composed of `Θ^♭` and the projection given by the diagonal period, and it is onto by 5.5.

Let `Θ^♭` be the composite of the `m` weighted transposed lifts from `Ỹ^m_0` to `Ỹ^0_0` at the trivial twist. Prove:

(a) `Θ^♭` maps `gridLevelForms(m)` onto `gridLevelForms(0)`;

(b) there are a real point `g` of `U(Ỹ^0_0)` and a surjective linear map `res^♭ : gridLevelForms(m) → 𝒜(Y₀)` such that
every form `y` on `Y₀` of level `𝔪₀(ϑ)` (any `m`-fold twist `ϑ`) has the same Petersson product with `res^♭ φ` as with
`h ↦ (Θ^♭φ)((h ⊕ 1)g)`;

(c) there are path data `Ψ_ϑ` on the first path (bound as in 5.6), `g`, a constant `α` and `res^♭` as in (b) such that for
every `ϑ`, conjugate form `y′` on `Y_m` and `φ ∈ gridLevelForms(m)`, the integral over `[U(Y_m)]` of `y′` times the chain
of twisted lifts of `res^♭ φ` from `Y₀` to `Y_m` (the chain `Θ_ϑ` of the Conventions, each lift weighted by the index
`[K₀ : J]` of its level `J`, read as a function on `U(Y_m)(𝔸)`) is `α` times the period of `Ψ` on the first path at
`(ϑ, y′, φ)`.

*Needs:* 4.1, 4.2, 4.3, 5.3, 5.5, 5.6; ThetaLiftChainsAndTheSeesawIdentity §2.15 (the chain of lifts `Y₀ → Y_j`).

[ShortProof], `New/Determinant/AuxiliaryForms/FirstPath.lean` (`New.Data.gridLevelForms_eq_map_transposedChain`,
`New.Data.exists_isFlatRestriction_range_eq_top`, `New.Data.exists_isPathDatum_first`)

### 5.8 Turns off the diagonal

*Origin:* particular to this proof: a turn of a path at a square off the diagonal transfers periods, with a constant
whose modulus is a ratio of Hecke values.

*Method of the formal proof:* the match of a path datum across the square is a path datum; the square law of the grid
square (3.12 applied to the four nodes, with the character of the square tame for `𝔪(ϑ)` and of the weight of the pair of
1.1 (f)) moves the period of the old datum to that of the new one with the factor `κ/c(ϑ)`, `|c|` given by 1.2 (c).

(a) For `a, b < m` and a grid `z`, there are a constant `κ` (possibly `0`), a bijection of index sets and numbers
`c(ϑ) ≠ 0` of modulus `R^turn_{ab}` (for `Y`; `R^turn_{ba}` for `Ỹ`) up to a norm power, such that for every form `f` at
`(a, b + 1)` and functional `l` on the forms at `(a + 1, b)`, the two composites of moves around the square (through
`(a + 1, b + 1)` and through `(a, b)`) satisfy the square law of 3.11 with constant `κ/c(ϑ)` and the inverse of the product
of the characters of the two edges at `(a, b)`.

(b) For `a < b < m` and a half `z`, there are `c(ϑ) ≠ 0` of modulus `R^turn_{ab}` (resp. `R^turn_{ba}`) up to a norm power
such that a turn at the corner `(a, b)` of that half transfers periods with factor `1` and constants `c`.

(c) A path datum on the old path gives, after a Fourier transform in the column of the line when the turn is on the
diagonal, a path datum on the new path.

*Needs:* 1.1, 1.2, 3.11, 3.12, 5.1, 5.3.

[ShortProof], `New/Determinant/AuxiliaryForms/Turns.lean` (`New.Data.exists_squareLaw_grid_hasAbsUpToNormPower`,
`New.Data.exists_transfersPeriods_off_diagonal`, `New.Data.Corner.IsTurn.exists_isPathDatum`)

### 5.9 Turns on the diagonal, and the transfer from the first path to the last

*Origin:* particular to this proof: the period of a path datum is carried from the first path to the last by `m²` turns,
each with a constant whose modulus is a ratio of Hecke values.

*Method of the formal proof:* a diagonal turn takes three steps. The seesaw of periods first rewrites the period as an
integral over the group of `Ỹ^{j+1}_j = Y^{j+1}_j`, the one space that the old and the new path share; the added line
enters there through its own theta kernel. The flip of the pair of the line and the square law of 3.12 then interchange
the lift and the transposed lift, and the seesaw, applied again, returns a period on the new path. For (b), compose
along the turns of 5.1, starting from the last path; the constants multiply.

(a) For `i, j < m` there are `c(ϑ) ≠ 0` of modulus `R^turn_{ij}` up to a norm power such that every turn at `(i, j)`
transfers periods with factor `#(O_E/𝔪(ϑ))^{2n_m}` and constants `c`.

(b) There are `c(ϑ) ≠ 0` of modulus `∏_{0≤i,j<m} R^turn_{ij}` up to a norm power such that the pair (first path, last
path) transfers periods with factor `#(O_E/𝔪(ϑ))^{2n_m·m²}` and constants `c`.

*Needs:* 5.1, 5.3, 5.8; 3.12; WeilRepresentationsOnBanachSpacesOfData §§6.8, 7.4 (the seesaw of periods. Take two families of characters over real
edges, in the sense of the background entry of 3.12: one with polynomial `Φ` for a pair `S → T`, one with polynomial
`Φ′` for a pair `T′ → S′`. Let the index `o` run over a set and `i` over finite sets `W_o`, with moduli `𝔪_o`,
coefficients `u_{o,i}`, numbers `c_o`, forms `y_{o,i}` on `S` and `f_{o,i}` on `S′` of the types of the edges, moderate
weights `N_{o,i}` from `S` to `T′`, that is, a function of moderate growth on the group of `S` with a comparison map to
the group of `T′`, and functions `Ψ′_{o,i}` on matrices modulo `𝔪_o`. A polynomial `p` for `T′ → S′` is matched if there
are a polynomial `Q`, functions `Ψ_{o,i}` modulo `𝔪_o` and moderate weights `M_{o,i}` from `S′` to `T` such that: (i)
for every real point `r` of the group of `T` there is a `β_r` with
`Σ_{i∈W_o} u_{o,i}·(period with weight M_{o,i}, moved by r, of f_{o,i} against the lift of y_{o,i} with Φ and Ψ_{o,i}) = β_r·c_o`
for every `o`; and (ii) the weight function of `N_{o,i}` at `g` times the kernel of `(T′, S′)` on `(Ψ′_{o,i}, p)` at the
image of `g` and `x` equals the weight function of `M_{o,i}` at `x` times the kernel of `(S, T)` on `(Ψ_{o,i}, Q)` at
`g` and the image of `x`, for all `o`, `i`, `g`, `x`. If the matched polynomials span all polynomials, then for every
real point `r` of the group of `T′` there is one `β` such that, for every `o`,
`Σ_{i∈W_o} u_{o,i}·(period with weight N_{o,i}, moved by r, of y_{o,i} against the transposed lift of f_{o,i} with Φ′ and Ψ′_{o,i}) = β·c_o`.
The flip for lines: let `S` have rank `n`, `ε = ±1`, and `L`, `L′` the standard lines of signs `−ε` and `ε`. For every
modulus `𝔪`, characters `b`, `a′` of `[U(1)]` and finite point `k` of the group of rank one there are an additive
character `ψ` of `O_E/𝔪` and a complex `c ≠ 0` with `|c|²·#(O_E/𝔪)^n = 1` such that, for every polynomial `P`, every
function `D` on columns modulo `𝔪` and every `h`, the kernel of `(L, S)` with characters `(1, b)` on `(D, P)` at
`(k, h)` is `c` times the kernel of `(S, L′)` with characters `(a′, υ₁)` on `(D̂, P′)` at `(h, ku)`, with `D̂` the
Fourier transform of `D` for `ψ`, `P′` the signed transpose of `P`, and `u` the scalar of the background entry of 3.8;
[ShortProof] `Lib/Weil/Seesaw.lean` (`New.Exchange.IsSeesawMatched`, `New.Exchange.seesaw_periods`,
`New.Space.periodPairing`), `Lib/Weil/DualPair/Flip.lean` (`New.exists_modKernel_flip_line`)).

[ShortProof], `New/Determinant/AuxiliaryForms/DiagonalTurns.lean` (`New.Data.exists_transfersPeriods_of_turn`,
`New.Data.exists_transfersPeriods_first_last`, `New.Data.exists_columnLineKernel_eq`)

### 5.10 The branching pairing and the periods on the last path

*Origin:* adapted from the branching from `GL_{n+1}` to `GL_n` for interlacing highest weights, with multiplicity one
(Goodman and Wallach (2009), Theorem 8.1.1; Zhelobenko (1973), Chapter X): here an
integral pairing between the two Weyl modules, equivariant for block matrices, with explicit bounds, that computes
periods over the smaller definite unitary group.

*Method of the formal proof:* the branching matrix of an interlacing pair, followed by the duality of Weyl modules; the
period over the smaller definite group of two algebraic forms is a class integral of the pairing of their values; on
the last path every lift is a finite sum over points, so the period of a path datum is a controlled sum of such
pairings.

(a) Let `n ≥ 1`, let `(κ, e)` be a weight of `GL_{n+1}` with doubled parameter `l′` and `(κ′, e′)` a weight of `GL_n` with
doubled parameter `−l`, where `l` and `l′` interlace (for every `x`, the number of entries of `l′` above `x` minus that of
`l` is `0` or `1`), all signs `+1`, and let `V` be the standard definite space of rank `n`. Write
`boxes(κ) = ∑_τ ∑_{h≤n} h·κ_τ(h)` for the number of boxes of `κ` in its columns of height at most `n`. There is an
integer matrix `B` between the coordinate vectors of the two Weyl modules such that: the pairing `(v′, v) ↦ v′·B·v` is
invariant under `g` acting on `v′` and `diag(g, u)` acting on `v` up to `∏_τ det(u_τ)^{N_τ}`, with
`|N_τ| ≤ boxes(κ) + |e(τ)|`; `|v′·B·v| ≤ (M^M)³·‖v′‖·‖v‖` (norms of the Weyl modules) whenever `boxes(κ) ≤ M`; and for
each real point `g` there is `c` with `∫_{[U(V)]} η(x)φ(diag(x, u)g) dx = c/[K₀ : K]·∫ η(h)·B·φ(diag(h, u)) dh` for all
algebraic forms `η`, `φ` (of the weights `(κ′, e′)`, `(κ, e)`, read as functions on the adelic groups), every finite point
`u` of `U(1)` and every level `K` of `U(V)`, where `[K₀ : K]` is the index of `K ∩ K₀` in `K₀` and the integral on the
right is over the finite points `h` of `U(V)` modulo the rational points for the measure that gives `K` volume `1` (the
class integral).

(b) On the last path, for every family `Ψ` of functions of edge tuples there is, at each real point, `β` such that the
period of `Ψ` is `β` times `Ξ(ϑ, y′, φ)/#GL_{r+m·t}(O_E/𝔪₀(ϑ))`, where `Ξ(ϑ, y′, φ)` is the sum over the edge tuples `S`
of `Ψ_ϑ(S)` times the class integral, over the finite points `h` of `U(Y^m_m)` at the level of the last path there, of the
branching pairing of the lifts of `y′` at `h` and of `φ` at `diag(h, (ū/u)^m)` along the two halves of the last path
(`ū/u` the finite idele of 5.3 (d)).

(c) Let `Ψ` be a path datum on the last path with bound `N`, and let `y′` and `φ` be fixed by the outer levels (the levels
of 5.3 (a) at the two ends `Y_m` and `Ỹ^m_0`: the integral points congruent to `1` modulo `𝔪(ϑ)`, resp. modulo `𝔟`).
Let `σ` be a ring homomorphism from `ℂ` to a normed field, `C₁ ∈ ℂ` and `R` real, and suppose that `|σ(C₁·a)| ≤ R` for
every branching pairing `a` of two vectors reached by the lifts at corresponding points `h` and `diag(h, (ū/u)^m)` (the
vectors obtained from the values of `y′` and `φ` by the kernels of the lifts along the two halves of the last path).
Then for some `L ≤ N·(#(O_E/𝔪(ϑ))^{(2n_m)²})^{2m}`, `Ξ` is a sum of `L·∏(class numbers of the 2m + 1 levels of the last
path)` numbers `a` with `|σ(C₁·a)| ≤ R`.

*Needs:* 5.2, 5.3; IntegralWeylModulesOfGeneralLinearGroups §1.1 (integral branching between the Weyl modules of
two interlacing weights); IntegralRepresentationsOfGeneralLinearGroups §§3.1, 3.4 (the form of that branching used here: for families of weights indexed
by the infinite places `τ`, `(κ, e)` of `GL_{n+1}` and `(κ₀, e₀)` of `GL_n`, where `κ₀` is obtained from `κ` by
removing one box from some of the columns, among them all columns of height below a given `q`, and the columns of
height `n` that keep their box are counted in `e₀`: there is an integer matrix `br` between the coordinate vectors of
the two Weyl modules with `br·ρ_{κ,e}(diag(g, s)) = ∏_τ s_τ^{N_τ}·ρ_{κ₀,e₀}(g)·br` over every field of characteristic
`0`, `N_τ` being `e(τ)` plus the number of columns at `τ` that lose a box; with `‖br ξ‖ ≤ (L^L)³·‖ξ‖` in the Gram
norms when `L` bounds the number of boxes of `κ₀` in the columns of height at least `q` and less than `n`, of which
the bound of (a) is the case `q = 0`, where `M` bounds all the boxes; and spanning over `ℂ` the maps equivariant for
the unitary block group; and the duality pairing of the Weyl module of a weight with that of the dual weight, the
weight whose doubled Harish-Chandra parameter is the negative: an integer matrix `A` with `v′·A·v` invariant over
every field of characteristic `0` and with an integral left inverse up to the hook number; the further clause of the
[ShortProof] structure, which reads the function of an algebraic form of the dual weight as this pairing with a
translate of the highest vector, is a statement about forms of a type and not about Weyl modules); DiscreteSeriesCoefficientsAndAutomorphicMetrics §7.5a (class-set
integration on a definite group).

[ShortProof], `New/Determinant/AuxiliaryForms/LastPath.lean` (`New.Exchange.exists_isBranchingPairing`,
`New.Data.isProportional_lastPathPeriod`, `New.Data.exists_lastPathPeriod_mem_smul_norm_le`)

### 5.11 Denominators and sizes on the last path; forms with short integral lifts span

*Origin:* particular to this proof: the forms of level `J_M` on `Y₀` are spanned by forms whose twisted chains, after
division by one scalar of known modulus, are integral at every prime not dividing `Nm Q(ϑ)`, and whose untwisted chain
has small conjugates.

*Method of the formal proof:* on the last path each lift is cleared by one integer, the branching pairing is integral,
and the conjugates of each lift are bounded, which bounds the denominators and the conjugates of `Ξ`. Going back through
the `m²` turns (5.9) to the first path (5.7) gives the pairing of the chain of lifts of a restriction with any form as
`Ξ/c(ϑ)`; reading the values of the chain by delta forms gives integrality and size of the values; short forms span the
forms of level `𝔟` on `Ỹ^m_0`, and `res^♭` is onto.

(a) There is an integer `0 < N_den ≤ exp(x^99 b²)` such that for every `ϑ`, path datum `Ψ` on the last path, pair of forms
fixed by the outer levels (5.10 (c)), and prime `p ∤ Nm Q(ϑ)`: if both forms, read as algebraic forms, have `p`-adic gauge
at most `1`, then `N_den·Ξ` is `p`-integral. At the trivial twist, for a path datum on the last path with bound
`#(O_E/𝔟)^{2n_m·m²}·(#(O_E/𝔟)^{(2n_m)²})^{2m}` (the bound that 5.6 and 5.9 (b) give there): if, for an automorphism `σ`
of `ℂ`, the `σ`-conjugates of the values of a pair of forms fixed by the outer levels have squared norms at most
`B_Y` and `B_Ỹ`, then `|σ(Ξ)| ≤ exp(x^200 b²)·√B_Y·√B_Ỹ`. The bound on the datum is needed: `Ξ` is linear in `Ψ`, and
an integer multiple of a path datum is a path datum with a larger bound.

(b) There are `c(ϑ) ∈ ℂ^×` of modulus `∏_{0≤i,j<m} R^turn_{ij}` up to a norm power such that `𝒜(Y₀)` is spanned by the forms
`y` with: for every `m`-fold twist `ϑ` and every prime `ℓ ∤ Nm Q(ϑ)`, `(c(ϑ)/c(1))·Θ_ϑ y` is integral at `ℓ`; and for every
automorphism `σ` of `ℂ` and every finite point, the squared norm of the `σ`-conjugate of the value of the untwisted chain
`Θ_1 y` is at most `exp(x^202 b²)`.

*Needs:* 5.3, 5.7, 5.9, 5.10; CompositeThetaLiftsAndShortForms §5.6 (algebraic forms of a principal level are spanned by
forms integral at every prime with conjugates of bounded squared norm); AdelicUnitaryGroupsAndAlgebraicModularForms §§6.3, 6.6 (on the definite standard
space of rank `n`, with its Weyl module of a weight: the `p`-adic gauge of a vector `ξ` at a finite point `g`, for a
prime `p` and an embedding `ℂ → ℂ_p`, is the largest `p`-adic absolute value of a coordinate of the image of `g⁻¹ξ`, and
the squared norm of the `σ`-conjugate of `ξ`, for an automorphism `σ` of `ℂ`, is that of `σ∘ξ`. Let `K` be a level
inside the stabiliser of the standard lattice, with finitely many classes, and `χ` a character of `K` with values of
finite order, trivial near `1`. The delta form at a finite point `x` made from a vector `v` is the form of level
`(K, χ)` supported on the class of `x` whose value at `y` is the sum of `χ(x⁻¹γy)·γ⁻¹v` over the rational `γ` with
`x⁻¹γy ∈ K`. At every point its gauge is at most the gauge of `v` at `x`, and the squared norm of the `σ`-conjugate of
its value is at most `#Aut(x)²` times that of `σ∘v`, where `Aut(x)` is the group of rational points that stabilise the
coset `xK`. For additive functionals `L_g` with `L_{γxk}(χ(k)·γv) = L_x(v)` for all rational `γ` and `k ∈ K`, the class
sum of `g ↦ L_g(value of the delta form at g)` is `L_x(v)`).

[ShortProof], `New/Determinant/AuxiliaryForms/SpanningForms.lean` (`New.Data.exists_mul_lastPathPeriod_mem_embValRing`,
`New.Data.norm_lastPathPeriod_le`, `New.Data.exists_integral_lowerChainUpTo_eq_lastPathPeriod`,
`New.Data.exists_span_short_lifts_eq_top`)

## Layer 6: Theorem C

### 6.1 Auxiliary forms

*Origin:* particular to this proof: the target forms are spanned by auxiliary forms, whose twisted chains are integral
away from the twist after multiplication by one scalar of known modulus and whose untwisted chains are short.

*Method of the formal proof:* apply the multiple `#G₀·e₀` of the projection to the target, which is onto `𝒯`, to the
spanning forms of 5.11; integrality is preserved and the squared norms of the
conjugates of the lifts are at most `exp(x^99 + x^202 b²) ≤ exp(2x₁²b²)`; the modulus of the scalar is normalised by
1.2 (b).

For numbers `γ(ϑ)`, one for each `m`-fold twist, a target form `y` is auxiliary if `γ(ϑ)·Θ_ϑ y` is integral at every `ι`
whose prime does not divide `Nm Q(ϑ)`, for every `ϑ`, and `‖Θ_1 y‖²_σ ≤ exp(2x₁²b²)` for every automorphism `σ` of `ℂ`.
Prove: there are an integer `e` and numbers `γ(ϑ) ≠ 0` with `γ(1) = 1` and
`|γ(ϑ)| = Nm Q(ϑ)^{e/2}·∏_{0≤i,j<m} R^turn_{ij}(ϑ)` such that `𝒯` is spanned by the auxiliary forms for `γ`.

*Needs:* 1.1, 1.2, 5.11; CompositeThetaLiftsAndShortForms §5.5 (the multiple of the projection to the target forms
preserves integrality of the twisted chains and bounds the conjugates of the untwisted chain);
ThetaLiftChainsAndTheSeesawIdentity §2.5 (the idempotent `e₀`), §2.7 (the target forms `𝒯 = e₀𝒜(Y₀)`: the multiple of
`e₀` is onto `𝒯`).

[ShortProof], `New/Determinant/Twist/LongForms.lean` (`New.Data.IsAuxiliaryForm`,
`New.Data.exists_span_isAuxiliaryForm_eq_top`)

### 6.2 The inverse ratio of the chain determinants

*Origin:* particular to this proof: along a regular family of twists the ratio `Z(1)/Z(ξ_ι)` has height at most
`d·(b + f·a·(log b)⁴ − h_main)`.

*Method of the formal proof:* invert the factorisation 4.4 (c); the scalar costs at most `m²·t·x₁ ≤ b` by 1.4, and the `m`
single-lift ratios, each of height at most `d·(f·a·(log b)⁴/m − k·h_dir)`, add up, since `m·k·h_dir = h_main`.

(a) There is a family `θ` with small ratios such that for `1 ≤ j ≤ m` the family `ι ↦ Z_j(1)/Z_j(θ_ι)` has height at most
`d·(f·a·(log b)⁴/m − k·h_dir)`. Here `Z_j(θ_ι)` is the volume of the lift `j` twisted by `θ_ι^j` (Conventions): the
`j`-th power is part of the definition of `Z_j`.

(b) There is an integer `e` with `Z(1)/Z(ϑ) = ((Nm Q(ϑ)^{e/2}·∏_{1≤i<j≤m} R^quo_{ij}(ϑ))⁻¹)^d·∏_j Z_j(1)/Z_j(ϑ)` for every
`m`-fold twist `ϑ`.

(c) If `θ` has small ratios and the families `ι ↦ Z_j(1)/Z_j(θ_ι)` have height at most
`d·(f·a·(log b)⁴/m − k·h_dir)` for `1 ≤ j ≤ m`, then `ι ↦ Z(1)/Z(θ_ι)` has height at most `d·(b + f·a·(log b)⁴ − h_main)`.

*Needs:* 1.3, 1.4, 4.4; CongruencesOfTwistedThetaLifts §7.3 (every data has a regular family of `m`-fold twists);
NormsOfThetaLiftsAndExchangeIdentities §7.5 (the cost of one lift: along a regular family, `Z_j(1)/Z_j(ξ_ι)` has height at
most `d·k·(log b·β_tot − h_dir)`); OneSidedPrimeSumBoundsAndAdmissibleData §1.2 (heights: products and powers).

[ShortProof], `New/Determinant/Twist/LongForms.lean` (`New.Data.exists_hasSmallRatios_heightLe_liftDeterminant_div`,
`New.Data.exists_chainDeterminant_one_div_eq`, `New.Data.heightLe_chainDeterminant_one_div`)

### 6.3 Theorem C: integral forms are long

*Origin:* particular to this proof: a lower bound for the covolume plus twice the index of every nearly complete family
of independent target forms in the twisted lattice of the target forms.

*Method of the formal proof:* complete `y` to a basis by `n′ ≤ 4d/b²` auxiliary forms (6.1) and take the family of twists
of 6.2; the product formula for a twisted lattice gives `c + 2δ + n′(2x₁²b² + b) + d(b + f·a·(log b)⁴ − h_main) ≥ 0`, the
scalar `|γ(θ_ι)|^{−2}` costing at most `2m²t·x₁ ≤ b` by 1.4; the completion costs at most `d·b`, and `2d·b` is absorbed in
`d·f·a·(log b)⁴`.

Let `D` be admissible data, `𝒯` its space of target forms and `d = dim 𝒯` (written `d_T` in
OneSidedPrimeSumBoundsAndAdmissibleData). Let `y₁, …, y_n` be linearly independent target forms with
`n ≥ (1 − 4/b²)·d`. Suppose that the family `y` has index at most `δ` and covolume at most `c` in the target lattice,
the twisted lattice of the target forms with the maps `Θ_ξ`, `ξ` an `m`-fold twist
(OneSidedPrimeSumBoundsAndAdmissibleData §5.1; index and covolume as in its §1.3). Then
`d·(h_main − 3·f·a·(log b)⁴) ≤ c + 2δ`. This is Theorem C of the family; the main inequality,
OneSidedPrimeSumBoundsAndAdmissibleData §6.1, consumes it together with Theorems A and B.

*Needs:* 1.4, 4.3, 6.1, 6.2; OneSidedPrimeSumBoundsAndAdmissibleData §1.3 (twisted lattices, index and covolume), §1.4 (a
twist for each prime: the product formula
`covolume + 2·index + completion cost + height of the volume ratio ≥ 0` for a twisted lattice with injective maps),
§5.1 (the target forms as a twisted lattice, whose maps `Θ_ξ` are injective and whose volumes are the determinants
`Z(ξ)`).

[ShortProof], `New/Determinant/Twist/LongForms.lean` (`New.Data.integral_forms_long`, `New.Data.mul_completion_cost_le`)

## Downstream consumers

- OneSidedPrimeSumBoundsAndAdmissibleData §6.1 (the main inequality) uses Theorem C (6.3); its §5.1 uses the
  injectivity of the chain `Θ_ξ` on the target forms (4.3 (d)).
- CongruencesOfTwistedThetaLifts uses critical, ramified and main pairs and their ratios (1.1), regular families of
  twists and negligible numbers (1.3), the lift of a descent pair with its Hecke polynomials (2.1) and the spanning
  of the lifts by lifts of eigenforms (4.4 (d)); it proves the existence of the regular family that 6.2 takes.
- SelmerBoundsForAnticyclotomicTwists uses the pairs and ratios of 1.1.
- NormsOfThetaLiftsAndExchangeIdentities uses 1.1 to 1.4 (pairs, ratios, regular families, heights of inverse
  ratios), 2.1 and 2.2 (the lift of a descent pair and its norm), 3.1 and 3.3 (theta integrals with finite data,
  matched functions) and 3.10 (the exchange identity with determinant data), and the determinants `Z_j` of the
  Conventions.
- SecondMomentsOfPoincareSeries uses the series of translates of 2.2 (a) and the steep parameters of 5.4 (a).
- PairsOfFramesAtOnePlace names 5.4 and 5.5 as the consumers of its steep parameters.

## Scope and ownership

### Owned here

- Critical pairs, ratios of Hecke values, moduli up to norm powers, small ratios, denominators, regular families of
  twists and negligible numbers (Layer 1).
- The lift of a descent pair with its vector-valued kernel, its descent and its Hecke polynomials; the norm of the
  single lift `Θ_{j,ϑ}` as a constant times a Rallis series (Layer 2).
- The exchange identity between the theta integrals of two complementary hermitian spaces on matched data at the
  places of a tame character, its form with determinant data, the finite square law and the identity on one square
  (Layer 3).
- The triangle of lifts, the Gram operator of the chain and the factorisation of its determinant `Z` through the
  determinants `Z_j` of the single lifts (Layer 4).
- The two grids, path data and their periods, the transfer of periods from the first path to the last, and the forms
  with short integral lifts (Layer 5).
- Auxiliary forms, the height of `Z(1)/Z(ξ_ι)` along a regular family, and Theorem C (Layer 6).

### Not owned here

- The data, heights, twisted lattices, the product formula for a twisted lattice and the target lattice:
  OneSidedPrimeSumBoundsAndAdmissibleData §§1.2–1.4, 3.2–3.4, 5.1.
- The spaces of the chain, the grids of parameters, levels, labels, good forms, descent pairs and the chain of lifts:
  ThetaLiftChainsAndTheSeesawIdentity Layer 2.
- The existence of a regular family of twists: CongruencesOfTwistedThetaLifts §7.3, with
  SelmerBoundsForAnticyclotomicTwists.
- False lifts, test forms, the rank-one lifts of the main pairs and the cost of one lift:
  NormsOfThetaLiftsAndExchangeIdentities §1.3, §2.5, §7.5.
- Steep parameters and the pairing of two steep discrete series coefficients: PairsOfFramesAtOnePlace §8.1, §8.6.
- Equality of multiplicities of the good forms on the spaces `W_j`: SecondMomentsOfPoincareSeries §2.3, §2.4.
- The Weil representation of a unitary pair, its Fock model, class-set integration on definite groups and integral
  branching of Weyl modules, in their general forms: ThetaKernelsForUnitaryDualPairs §3.45, §4.4a;
  DiscreteSeriesCoefficientsAndAutomorphicMetrics §7.5a; IntegralWeylModulesOfGeneralLinearGroups §1.1.

### Relation to roadmaps of RiemannHypothesisForDirichletLFunctions

- ThetaKernelsForUnitaryDualPairs §6.13a states the Rallis inner product formula for Hecke eigenforms with an
  L-value. Layer 2 and 4.2 use the formula for sharp finite data, for every form fixed by a level and with the
  unramified integrals kept as a series of translates; no L-value of an eigensystem enters this roadmap.
- ThetaLiftsForDefiniteUnitaryGroups §6.11 states a complementary-space identity under its hypotheses 1 to 4. The
  exchange identity 3.9 is a variant with explicit matching modulo a modulus, the ranges `e ≥ 0` and `b ≥ 0`, and the
  size of its constant; 3.9 says how the two differ.
- RowTowerAndRallisIdentities Layer 5 computes `ι_ξι_ξ^*` for the descent of a chain on each Hecke eigensystem as a
  product of L-values (its §§5.5–5.7), and builds a rational structure on the row space from a grid of complementary
  triples and Bessel periods (its §§5.8a–5.8). Layers 4 and 5 here treat the chain of the data of this family
  without eigensystems: the Gram operator of the chain is a product of Rallis series up to a constant whose modulus
  is a product of ratios of Hecke values of characters of `U(1)` (4.4), and the grids of Layer 5 serve to build
  auxiliary forms with integral twisted lifts (5.11), with periods moved by the square law of 3.12. Neither
  development is deduced from the other.

## Exact supplier contracts

### From OneSidedPrimeSumBoundsAndAdmissibleData

§1.2 (heights of families indexed by the pairs `ι`: products, powers, integers prime to the prime of `ι`); §1.3
(twisted lattices, index and covolume); §1.4 (the product formula for a twisted lattice with injective maps); §2.1,
§2.2 (the parameters and the field); §3.2, §3.3 (admissible data and their sizes); §3.4 (tame characters, twists,
`m`-fold twists and the characters `μ_j⁰`); §4.1 (`h_dir`, `h_main` and the error unit); §5.1 (the target lattice).

### From ThetaLiftChainsAndTheSeesawIdentity

§2.1 (the spaces `Y_j`, `W_j`, `V_j`); §2.4 (index sets, signs and parameters of the grids, and the correspondence
of the parameters of consecutive nodes); §2.5 (`G₀` and `e₀`); §2.6 (levels and the last level); §2.7 (good forms and
target forms); §2.15 (the chain of lifts); §2.16 to §2.18 (descent pairs, the edge of a parameter that fits a pair,
the descent pairs of the chain).

### From NormsOfThetaLiftsAndExchangeIdentities

§1.3 (false lifts; test forms in (c)); §2.5 (the rank-one lift of a main pair); §7.5 (d) (the cost of one lift: for
a regular family `θ` and `1 ≤ j ≤ m`, the family `ι ↦ Z_j(1)/Z_j(θ_ι)` has height at most
`d·k·(log b·β_tot − h_dir)`).

### From other roadmaps of the family

CongruencesOfTwistedThetaLifts §7.3 (every admissible data has a regular family of `m`-fold twists);
DivisibilityOfThetaDerivatives §1.4 to §1.6 (Weil data, the chosen places and `ω`, characters of `U(1)` and pairs);
SecondMomentsOfPoincareSeries §2.1a, §2.3, §2.4 (eigenforms span; equal multiplicities; the Rallis operator on good
forms); CompositeThetaLiftsAndShortForms §5.5, §5.6 (the multiple of the projection to the target; short integral
forms span); PairsOfFramesAtOnePlace §8.1, §8.6 (steep parameters; the pairing of two steep coefficients).

### From roadmaps outside the family

HermitianFormsAndLattices §1.1 (Witt extension); ThetaKernelsForUnitaryDualPairs §3.45, §4.4a (the Fock model; the
global Weil representation of a unitary pair); DiscreteSeriesCoefficientsAndAutomorphicMetrics §7.5a (class-set
integration and inner products); IntegralWeylModulesOfGeneralLinearGroups §1.1 (integral branching).

## References

- `[ShortProof]`: the folder `grh` of <https://github.com/lsernau/grh-lean> at commit
  `72fead102f663d5c7a407964a13dc0cf9d977207`; this roadmap covers `src/New/Determinant`.
- W. T. Gan, Y. Qiu, S. Takeda, *The regularized Siegel–Weil formula (the second term identity) and the Rallis inner
  product formula*, Invent. Math. 198 (2014), 739–831; cited as Gan, Qiu and Takeda (2014).
- R. Goodman, N. Wallach, *Symmetry, Representations, and Invariants*, Springer (2009).
- A. Ichino, *A regularized Siegel–Weil formula for unitary groups*, Math. Z. 247 (2004), 241–277.
- S. Kudla, *Seesaw dual reductive pairs*, in Automorphic Forms of Several Variables, Progr. Math. 46 (1984), 244–268.
- S. Kudla, *On the local theta-correspondence*, Invent. Math. 83 (1986), 229–255.
- S. Kudla, S. Rallis, *A regularized Siegel–Weil formula: the first term identity*, Ann. of Math. 140 (1994), 1–80.
- J.-S. Li, *Non-vanishing theorems for the cohomology of certain arithmetic quotients*, J. reine angew. Math. 428
  (1992), 177–217.
- G. Muić, *Fourier coefficients of automorphic forms and integrable discrete series* (2015).
- D. Prasad, R. Schulze-Pillot, *Generalised form of a conjecture of Jacquet and a local consequence*, J. reine angew.
  Math. 616 (2008).
- S. Rallis, *Langlands' functoriality and the Weil representation*, Amer. J. Math. 104 (1982), 469–515.
- S. Rallis, *Injectivity properties of liftings associated to Weil representations*, Compositio Math. 52 (1984),
  139–169; cited as Rallis (1984b), after the numbering of NormsOfThetaLiftsAndExchangeIdentities.
- D. P. Zhelobenko, *Compact Lie Groups and their Representations*, Amer. Math. Soc. (1973).

The sources are those named in the heads of the files of `[ShortProof]` that this roadmap covers and of the files of
its folder `src/Lib` that they use; its `REFERENCES.md` says which citations were compared with their sources.
