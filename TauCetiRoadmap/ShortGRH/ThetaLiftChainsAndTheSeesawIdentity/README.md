# Roadmap: theta lift chains and the seesaw identity

**Summary.** This roadmap states the first half of the upper bound in the shorter proof of the Riemann hypothesis for Dirichlet
L-functions. The argument has this shape. A one-sided bound for a sum over primes gives the zero-free half-plane; the
bound comes from comparing an upper and a lower bound for the covolume of a lattice of theta lifts, the lattice of the
images of the target forms on a unitary group `U(Y_0)` under the chains `Θ_ϑ` of `m` theta lifts `Y_0 → Y_1 → ⋯ → Y_m`,
one chain for each twist `ϑ` (OneSidedPrimeSumBoundsAndAdmissibleData §3.2 (the data), §3.4 (the twists)). For the upper
bound the target forms are spanned by normalised Poincaré series of short integral source forms on the definite group
`U(X_0)` (CompositeThetaLiftsAndShortForms, SecondMomentsOfPoincareSeries), and the image of a Poincaré series under
`Θ_ϑ` is computed by the seesaw identity of this roadmap: it is a constant, the same for all twists, times a composite
lift of the source form, a finite combination of chains of `m` theta lifts between definite spaces `X_0 → X_1 → ⋯ → X_m`
restricted to the definite space `Y_m ⊂ X_m`, whose data have controlled support, denominators and size. The
divisibility and the size of the composite lift (CompositeThetaLiftsAndShortForms) then bound the index of the lattice.

The roadmap has three layers. Layer 1 holds the estimates for one theta kernel between definite spaces: the Galois
conjugates of the Taylor coefficients (jets) of theta functions, archimedean bounds for these conjugates, `p`-adic gauge
bounds, and the integrality and size of definite theta kernels with data given by functions modulo an ideal. Layer 2
defines the main objects of the argument, which several roadmaps of this family use: the spaces `X_j`, `Y_j`, `W_j`,
`V_j` and the grids of spaces, their weights and parameters, the good idempotent `e₀` and the target forms, the source
forms and the ramified source forms, the lifts between the `X_j` and their chain data, the glued tensor and the composite
lift, the lower chain `Θ_ϑ` along the `Y_j`, the descent pairs `(W_j, V_j)`, and the Poincaré map `𝒫`. Layer 3 proves
the seesaw identity by unfolding the pairing of `Θ_ϑ(𝒫φ)` with a form on `Y_m` one pair of lifts at a time, evaluating
the finite data place by place through lattices of graded spaces, and summing the outer variables over finite cuts.

**The seesaw identity (3.20).** For the data of OneSidedPrimeSumBoundsAndAdmissibleData §3.2, a linear form `t` on
the values of the forms on `X_0` and an archimedean point `g` of `U(Y_0)` there is `c ∈ ℂ^×` such that every twist `ϑ`
has a chain datum `Ψ` (support at the places dividing `M q_ϑ`, values integral away from `q_ϑ`, bounded by
`M^{3 f m n_m²}` when `ϑ` is trivial, glued tensor invariant under the levels) with `Θ_ϑ(𝒫_{g,t}φ) = c·comp_ϑ(Ψ)(φ)`
for every ramified source form `φ`. Neither side is asserted to be nonzero.

## Conventions and notation

**Statements of the shorter proof.** `[ShortProof]` is the shorter formal proof. Each section names where it proves the
statement. Where a section states more than that proof proves, a closing sentence says which case it proves.

**Labels.** Under each section heading, `*Origin:*` says where the statement comes from, in one of the forms
`published:`, `adapted from … : here, …`, `particular to this proof:`, `this roadmap's own formulation:` or
`definitions and conventions`, and `*Method of the formal proof:*` says how [ShortProof] proves it. `*Needs:*` lists the
sections the statement rests on: bare ids for this roadmap, `Name §k.n` for other roadmaps, and `ShortGRH background (…)`
for a background result that the shorter proof proves in its folder of known results and that no roadmap section states
in the form used.

**The data.** Everything is relative to admissible data in the sense of OneSidedPrimeSumBoundsAndAdmissibleData
§3.2, whose letters are used throughout. `d` is a prime, `K = ℚ(√−d)` with quadratic character `χ_K`, `E = K(ζ)` with
`ζ` a root of unity of order `q₁`, `F = E⁺`; `E` contains a primitive root of unity of order `5040`, so `E/F` is
unramified at every finite place. `Φ` is the set of infinite places of `E`, identified with a CM type of `E`, and
`f = |Φ|`. `Φ_a ⊂ Φ` are the `a`-places. The integers `m` (even, the number of lifts), `r` (odd), `k = r + 1 − m`
(even), `t = 5r` (odd), the ranks `n_j = k + j(t + 1)` (even) and `ϱ = m/2 − 1` satisfy `m = 2ϱ + 2` and
`r = k + m − 1`. `κ : Φ → ℕ` is the weight, `Δ = 2r⁸` the gap, `κ_j(τ) = κ(τ) + (j + ½)Δ` the weight of lift `j`, and
`a = x·b` the order of the derivative at the `a`-places, with the scales `x`, `x₁`, `b`. `q₂` is the integer of the data
of which the residue characters below are taken. The primes `p₀`, `p₁` and `N` (the level) are `≡ 1 (mod q₂²)`,
`M = p₀p₁`. `π_M ∈ 𝒪_E` has `π_M π̄_M = M`; its prime divisors are the *chosen places*, one of each conjugate pair of
places of `E` above `p₀` and above `p₁` (`f` above each); `𝔽_w` is the residue field at `w`. `π_N ∈ 𝒪_E` has
`π_N π̄_N = N`; the set `P_N` of its prime divisors has `f` elements, all split of degree one over `N`, one of each
conjugate pair of places above `N`. `ϖ_M` is a finite idele that generates `(π_M)` and is `1` away from the chosen
places. `Ω = exp(γ − Re L′/L(1, χ_K))·2π/rd_E`, and `t₀` is the jet scale of DivisibilityOfThetaDerivatives §4.2 (the scale
`𝔱_E` at which Taylor series of theta functions are taken).

**Weil data.** `E` carries Weil data (DivisibilityOfThetaDerivatives §1.4 (c); IdelicReciprocityCountsAndCyclotomicClassGroups §7.2, WeilRepresentationsOnBanachSpacesOfData §3.1 (Weil data of a CM field containing a primitive root of unity of order `5040`: a splitting character with the scale idele of the additive character)): a splitting character `υ` (a unitary Hecke character with `υ(x̄) = υ(x)^{−1}` and infinity type
`∏_τ x_τ/|x_τ|`), an element `ȷ ∈ E^×` with `ȷ̄ = −ȷ`, `Im τ(ȷ) > 0` for every `τ` of the CM type and `(1 − ȷ⁻¹)/2` an algebraic integer,
and a finite idele `α` with `v_w(ȷαᾱ) = −v_w(𝔇_E)` at every finite place `w`, which is the condition that `Ô` is
self-dual under `(z, u) ↦ ψ(ȷαᾱzu)` for the standard additive character `ψ` of `𝔸_{E,f}`. `U(1)(𝔸)` is the group of norm-one ideles; a character of `U(1)(𝔸)/U(1)(F)` *has
weight* `e : Φ → ℤ` and *tame part* `(ψ_w)_w` (characters of the `𝔽_w^×`) if on norm-one ideles with integral finite
part it is `∏_τ u_τ^{e(τ)}·∏_w ψ_w(u_w mod w)`. For such a character `ν` and a finite set `n`, `ν_n := ν·υ^{⌊|n|/2⌋}`
is the character attached to a space of rank `|n|` (the rank twist).

**Twists.** A *tame character* `ϑ` is a character of `U(1)(𝔸)/U(1)(F)` of weight `0` with a finite set `Q(ϑ)` of finite
places (its modulus), disjoint from its conjugate, of norms prime to `MN`, outside which its tame part is trivial; a
*twist* is a tame character whose tame part is nontrivial at every place of `Q(ϑ)`. `q_ϑ = ∏_{w ∈ Q(ϑ)} N(w)`.
`ϑ = 1` is the twist with `Q = ∅`. The character of lift `j` for `ϑ` is `ν_j^ϑ := μ_j⁰·ϑ^j`, with `μ_j⁰` the untwisted
character of lift `j` of OneSidedPrimeSumBoundsAndAdmissibleData §3.4; it has weight `−κ_j` and tame part
`ω^j ψ_ϑ^j`, where `ω` is the residue character of the data at the chosen places.

**Hermitian spaces, groups and levels.** Hermitian forms are conjugate-linear in the first variable. A *space* is
`E^n` (basis indexed by a finite set `n`) with a Hermitian Gram matrix `J` over `E` and a *point* `x ∈ GL_n(𝔸_E)` with
`x*Jx = diag(ε)` at the infinite places (`ε : n → {±1}`, the signs) and `x*Jx = 1` at the finite places; its unitary
group is read in the coordinates of the point, `U(V)(𝔸) = G_∞ × G_f`, and its *lattice* `Λ_V` is the `Ô`-span of the
columns of the finite part of `x`. The *standard definite space* `I_n` has `J = 1`, `x = 1`, lattice `Ô^n`. For a finite
point `g`, the lattice of `g` is the lattice spanned by `x_f g`. `K°(V)` is the stabiliser of `Λ_V` in `G_f`; a *level*
is an open subgroup `J ⊂ K°(V)`, and `[K° : J]` is its index. For finite places `w_1, …, w_s`, no two equal or conjugate and none conjugate to itself,
and a subgroup `H ⊂ ∏_i GL_n(𝔽_{w_i})`, `K(w, H)` is the group of `k ∈ K°(V)` whose reductions at the `w_i` lie in `H`
(AdelicUnitaryGroupsAndAlgebraicModularForms §3.9 (the subgroups `K(w, H)` of the stabiliser of the lattice defined by reductions at finitely many places, no two equal or conjugate and none conjugate to itself, and the principal levels: `K(w, H)` is open and its index in the stabiliser is the index of `H` in `∏_i GL_n(𝔽_{w_i})`; the principal level of an integer `a ≠ 0` of `E` is open, of index at most `N(a)^{n²}`)). `J_M := K(chosen places, 1)` is the
*chosen level*: integral points that reduce to `1` at every chosen place. `Γ_V = U(V)(F)`, `[U(V)] = Γ_V \ U(V)(𝔸)`,
with fixed Haar measures. For definite `V`, integration over `[U(V)]` is a class sum.

**Forms.** For a space `V` and a discrete-series type `e` at the infinite places (a product over `τ ∈ Φ` of formal
degree times a conjugated discrete-series coefficient of `U(diag ε)` for a doubled Harish-Chandra parameter `l`), a *form
of type `e`* on `U(V)` is a bounded continuous function on `[U(V)]` fixed by convolution with `e` at infinity and fixed on
the right by some level; the forms of type `e` and of a given level with a character form a space with the Petersson
product, finite-dimensional when `e` is a cusp kernel (AdelicUnitaryGroupsAndAlgebraicModularForms §§5.1, 5.2, 5.4 (forms of a discrete-series type on an adelic unitary group as the bounded automorphic functions fixed by convolution with the type kernel; the type kernel is a cusp kernel of order `B` when at every infinite place the entries of opposite signs of the parameter are at least `500n³ + B` apart; for a cusp kernel `e` and an open subgroup `K` of the finite adelic group, the forms of type `e` that are right invariant under `K` form a finite-dimensional space)). For the
standard definite space `I_n` and a dominant weight `λ = (c, e)` (at each `τ`, `c(τ, h)` columns of height `h` and the
power `e(τ)` of the determinant), an *algebraic form* of weight `λ` is a smooth function `φ` from `G_f` to the Weyl
module `V_λ` with `φ(γg) = ρ_λ(γ)φ(g)` for `γ ∈ Γ`; algebraic forms of weight `λ` and automorphic forms of the type of
the parameter `λ + ρ` are identified by `φ ↦ (g ↦ ⟨v_λ, ρ_λ(g_∞)^{−1}φ(g_f)⟩)` with a highest vector `v_λ`
(ThetaLiftsForDefiniteUnitaryGroups §1.2). For a linear form `t` on `V_λ`, `t(φ)(g) := t(ρ_λ(g_∞)^{−1}φ(g_f))` is the
coefficient of `φ` at `t`.

**Weil representation and theta lifts.** For spaces `V`, `V′` the space `Hom(V, V′)` with the symplectic form built
from the two Hermitian forms and `ψ` carries the Weil representation `ω_{a,b}` of `U(V)(𝔸) × U(V′)(𝔸)` twisted by
characters `a`, `b` of `U(1)(𝔸)`, on a space `𝒮(Hom(V, V′))` of integrable functions of adelic matrices with the
Heisenberg action `ϱ`; `θ` is the theta functional, invariant under rational points; `vac` is the vacuum; the
*finite Heisenberg translate* of a datum by a finite adelic matrix `x` is `ϱ_f(x) := ϱ(α x)` times a root of unity; the
*finite part* is the span of the finite translates of `vac`; a datum `v_P ⊗ Φ` is the Fock vector of a polynomial `P` at
the infinite places tensored with a finite part `Φ` (WeilRepresentationsOnBanachSpacesOfData §§2.1, 3.1, 3.4, 3.6, 5.6, 6.1 (the Weil representation in the realisation used: for Weil data of `E`, which include a primitive root of unity of order `5040` in `E`, and spaces `V`, `V′`, the representation `ω_{a,b}(g, h) = a(det h)·b(det g)⁻¹·ω(x ↦ hxg⁻¹)` of `U(V)(𝔸) × U(V′)(𝔸)` by continuous operators on the data space `𝒮(Hom(V, V′))`, with its Heisenberg action `ϱ`, the vacuum, the finite part, which is the span of the finite Heisenberg translates of the vacuum, the Fock vector `v_P` of a polynomial `P` at the real places and the datum `v_P ⊗ f = ∫ v_P(y)·ϱ(y)f dy`; the theta functional `θ` is a continuous functional on the data space that is invariant under the Heisenberg operators of the rational vectors and under the rational points of the unitary group, with the mean of `|θ(ϱ(x)vac)|²` over the adelic vectors modulo the rational vectors equal to `1`; the theta kernel of a datum `f` is `(g, h) ↦ θ(ω_{a,b}(g, h)f)`)). The *theta lift* of a form `z` on `U(V)` with datum `Φ` is
`h ↦ ∫_{[U(V)]} θ(ω(g, h)Φ) z(g) dg`; the *transposed lift* integrates over the other group. A Fock vector `Φ` is an *edge* from
type `e` to type `e′` if `e` is a cusp kernel of order `0`, the zeta integral of `Φ` against `e` is not zero, the lifts with the data `Φ ⊗ f` carry forms of type `e` to forms of type `e′` once they have a level, the lift with any polynomial Fock vector is a real convolution of the lift with `Φ`, and the same holds with the two groups exchanged, from the conjugate of `e′` to the conjugate of `e`; a product of joint harmonic polynomials is
an edge when the two parameters satisfy the block rule below (HolomorphicDiscreteSeriesOfUnitaryGroups §8.2, WeilRepresentationsOnBanachSpacesOfData §§7.2, 7.3 (theta lifts between discrete-series types: an edge from a type `e` to a type `e′`, for the real Weil representation `Ω` of weights `γ`, `γ′`, is a Fock vector `Φ` such that `e` is a cusp kernel of order `0`, the zeta integral `∫⟨Φ, Ω(x, 1)Φ⟩·conj(e(x))/e(1) dx` is not zero, the lift with a datum `Φ ⊗ f` of a form of type `e` is a form of type `e′` as soon as it has a level, and the lift with the Fock vector of any polynomial is the convolution of the lift with `Φ` with one continuous function of compact support on the real group, and such that the same four properties hold with the two groups exchanged, from the conjugate of `e′` to the conjugate of `e`; if two families of parameters satisfy the block rule at every infinite place, a chosen product over the infinite places of joint harmonic polynomials is an edge between their types; for an edge `Φ`, characters `a`, `b` of weights `γ`, `γ′` and a datum `f` in the finite part, the lift with `Φ ⊗ f` carries forms of type `e` to forms of type `e′`, the transposed lift carries forms of the conjugate type of `e′` to forms of the conjugate type of `e`, and the descent, the conjugate of the transposed lift of the conjugate, carries forms of type `e′` to forms of type `e`; the block rule is kept by exchanging the two spaces, by negating both parameters and the signs of the first space with `(γ, γ′)` replaced by `(n − γ, n′ − γ′)`, by reversing all signs on both spaces, and by raising `γ`, `γ′` by integers `u`, `u′` while adding `u′` to the first parameter and `u` to the second)). The *jets* of a datum `F` at scale `s` are the Taylor coefficients `P(∂)Th_s(F)(0)` of its theta function in
Fock coordinates scaled by `s`; the *jet matrix* of a datum for a lift weight is the matrix of its jets along the Schur
polynomials of the weight, which is the kernel of the class-sum lift between definite spaces (ThetaLiftsForDefiniteUnitaryGroups
§§1.2, 1.7).

**Data modulo an ideal.** A *modulus* `𝔪` is a nonzero ideal of `𝒪_E` not contained in its conjugate. For a function
`Ψ` on matrices modulo `𝔪`, `Ψ ⊗ vac` is the finite datum equal to `Ψ` of the reduction on integral matrices at the
places dividing `𝔪` (zero on nonintegral ones) and the vacuum elsewhere, and
`θ^{a,b}[Ψ, Q](g, h) := θ(ω_{a,b}((1, g), (1, h))(v_Q ⊗ Ψ ⊗ vac))` is the definite theta kernel of `I_L`, `I_N` with
real datum the polynomial `Q`.

**Integrality.** A complex number `z` is *integral away from* `q ∈ ℕ` if `ι(z)` is integral for every prime `ℓ ∤ q` and
every ring homomorphism `ι : ℂ → ℂ_ℓ`. For a prime `p`, `ι_p : ℂ → ℂ_p` is a fixed homomorphism and `𝒪_{ι_p}` the ring of
`z` with `|ι_p(z)| ≤ 1`.

**Graded spaces.** A *grading* of a space `V` by `X` and a string of length `s` is an indexing of its basis by
`X ⊔ {0, …, s−1}` such that the Gram matrix is `1` on `X` and pairs the string vectors `e_i`, `e_{s−1−i}` to `1`,
except that the middle vector (for odd `s`) has norm `−N`, with `N = N̄ ≠ 0`, together with a constant `c ∈ E^×`,
`c = c̄`. The *grade* is `0` on `X` and `s − 1 − 2i` on `e_i`. The *Bessel subgroup* `R ⊂ U(V)(𝔸)` consists of the `g`
whose matrix in rational coordinates sends each string vector of grade `≥ 0` to itself plus vectors of higher grade;
`R_f` is its finite part, `R(F) = R ∩ Γ_V`, and `[R] = R(F)\R(𝔸)` is compact. `inc_X` is the embedding of `U(I_X)` acting
on `X` and fixing the string. The *shift* `𝔢` and the *generic character* `ψ_U(u) = ψ(½ ȷ tr(𝔢 u))` of the unipotent
radical are those of the grading. For a second graded space `V′` with a string of length `s − 1`, the *string map*
`sh : V → V′` kills `X` and sends each string vector to a fixed multiple of the string vector of `V′` with the same
number. For a finite point `x`, `Λ_x⁻` is the intersection of the lattice of `x` with `X^⊥` and `Λ_x⁺` its projection to
`X^⊥`; a lattice is *graded* if it contains the part in each grade of each of its vectors (WeilRepresentationsOnBanachSpacesOfData §§8.1, 8.2, 8.5, 8.6 (graded spaces `X ⊕ string` and their Bessel subgroups: a grading of `V` presents its basis as `X` and a string of `s` vectors such that the Gram matrix is `1` on `X` and pairs the string vector `i` only with the string vector `s − 1 − i`, to `1`, or to `−N` for the middle vector, with `N = N̄ ≠ 0`, together with a constant `c = c̄ ≠ 0`; the Bessel subgroup `R` consists of the `g` whose matrix in rational coordinates sends each string vector of grade at least `0` to itself plus string vectors of higher grade; the rational points are cocompact in `R(𝔸)`, so that the Haar measure of `R(𝔸)` is right invariant and gives `[R]` a finite measure; the lattice of a finite point `x` consists of the vectors whose coordinates in the frame of `x` are integral, `Λ_x⁻` is its intersection with `X^⊥` and `Λ_x⁺` its projection to `X^⊥`; `ψ_U(u) = ψ(½ȷ tr(𝔢u))` for the shift `𝔢` of the grading; and the function `𝒲_φ` on `R(𝔸)` of an algebraic form `φ` on `U(I_X)` and a linear form `t` on its values satisfies `𝒲_φ(u·inc_X(a)) = ψ_U(u)·t(ρ(a_∞⁻¹)φ(a_f))` for `u` in the unipotent subgroup and `a ∈ U(I_X)(𝔸)`)).

**The block rule.** For signs `ε` on `n` and `ε′` on `n′`, doubled parameters `l = 2λ`, `l′ = 2λ′` and integers `γ`,
`γ′`, the *shifted entries* are `l_i − 2γ′ + |n′|` and `l′_j − 2γ + |n|`. The pair *satisfies the block rule* for
`(γ, γ′)` if: both have distinct entries of the parity of the rank less one, with entries of opposite signs at least
`2·500(|n| + |n′|)³` apart; the shifted entries of the larger space are those of the smaller together with the doubled
block `2[|n′| − |n|]` (resp. `2[|n| − |n′|]`), where `[d] = ((d − 1)/2, (d − 3)/2, …, (1 − d)/2)` is the block of
length `d` and `2[d] = (d − 1, d − 3, …, 1 − d)` the same block with its entries doubled; and a positive common
shifted entry has the same sign on both sides, a negative one opposite signs. Two families of parameters *correspond*
if they satisfy the block rule at every `τ ∈ Φ`.

### Table of symbols

| Symbol | Meaning | Defined |
|---|---|---|
| `E, K, F, d, χ_K, Φ, f, Φ_a` | the CM field, `ℚ(√−d)`, `E⁺`, the prime, its character, the infinite places (a CM type), their number, the `a`-places | OneSidedPrimeSumBoundsAndAdmissibleData §§2.1–2.2 (the field and its places), §3.2 (the `a`-places) |
| `m, r, k, t, n_j, ϱ` | number of lifts, ranks `k = r + 1 − m`, `t = 5r`, `n_j = k + j(t + 1)`, `ϱ = m/2 − 1` | OneSidedPrimeSumBoundsAndAdmissibleData §3.2; Conventions |
| `κ, Δ, κ_j, a, x, x₁, b` | weight, gap `2r⁸`, `κ + (j + ½)Δ`, order `xb`, scales | OneSidedPrimeSumBoundsAndAdmissibleData §3.2 |
| `p₀, p₁, M, π_M, ϖ_M, J_M` | level primes, `M = p₀p₁`, `π_Mπ̄_M = M`, its idele, the chosen level | Conventions |
| `N, π_N, P_N, ψ_N` | the level prime, `π_Nπ̄_N = N`, its prime divisors, `ψ_N(c) = ψ(−c/N)` | Conventions, 2.11 |
| `υ, ȷ, α, ψ, ν_n` | Weil data, rank twist `ν·υ^{⌊|n|/2⌋}` | Conventions |
| `ϑ, Q(ϑ), q_ϑ, ν_j^ϑ` | twist, modulus, norm of the modulus, character `μ_j⁰ϑ^j` of lift `j` | Conventions |
| `t₀, Ω` | jet scale, `exp(γ − Re L′/L(1, χ_K))·2π/rd_E` | DivisibilityOfThetaDerivatives §4.2 (the jet scale); Conventions |
| `vac°, 𝒮_δ` | integral vacuum, standard data | 1.1; DivisibilityOfThetaDerivatives §4.6 (the integral vacuum), §4.8 (standard data) |
| `X_j, Y_j, W_j, V_j` | the spaces of the chain | 2.1 |
| `c_τ, e_j, μ(X_j), μ(Y_m), n_τ, br` | columns and last entry of the weights, the weights, the branching exponent and map | 2.2 |
| `ς, l_Y(j)` | target parameter (the row parameter `λ_i(v)` of OneSidedPrimeSumBoundsAndAdmissibleData §3.4), doubled parameter of `Y_j` | 2.4 |
| `𝖦, e₀` | `∏_w GL_r(𝔽_w)` over the chosen places, the good idempotent | 2.5 |
| `K_j, J_ϑ(Y_j)` | level of `X_j`, level of `Y_j` for `ϑ` | 2.6 |
| `𝒜(Y_0), 𝒯` | forms of principal level on `U(Y_0)`, target forms | 2.7 |
| `𝒮_X, 𝒮_X^{ram}, L_j^ϑ` | source forms, ramified source forms, lift `j` between the `X_j` | 2.8 |
| `Up` | the operator at `N` | 2.11 |
| `𝔗, Glue, Ψ, comp_ϑ(Ψ)` | translations, gluing, chain datum, composite lift | 2.12 |
| `Θ_ϑ, ι_j^ϑ` | lower chain, lift `j` along the `Y_j` | 2.15 |
| `O = (W, V, …)` | descent pair | 2.16 |
| `𝒫 = 𝒫_{g,t}, 𝒲_φ` | Poincaré map, Bessel function of a source form | 2.19 |
| `Λ_x⁻, Λ_x⁺, sh` | lattice pieces of a point of a graded space, string map | Conventions, 3.2 |
| `Ω_j, mult_j` | cuts and multiplicities of the outer variables | 3.16 |

## Layer 1: Theta kernels between definite spaces

These are the estimates for one theta kernel between standard definite spaces that the divisibility and size of the
composite lift (CompositeThetaLiftsAndShortForms) and the lower bound (DeterminantsOfThetaLiftChains,
NormsOfThetaLiftsAndExchangeIdentities, CongruencesOfTwistedThetaLifts) use, together with the bookkeeping of finite
combinations of translates of the vacuum with controlled denominators and size.

### 1.1 Combinations of translates of the vacuum, standard data and gauges

*Origin:* definitions and conventions.

*Method of the formal proof:* definitions; the integral vacuum and the standard data are those of the integral vacuum
of the shorter proof.

Let `V` be a space of rank `n` over `E`, `q, d ∈ ℕ`, `B ∈ ℝ` and `𝖯` a condition (in the uses, either a condition that holds or the condition that the twist is trivial, `Q(ϑ) = ∅`: sizes are bounded only for the trivial twist).

(a) *Admissible combinations.* For vectors `(v_x)_{x ∈ A}` of a complex vector space, `z` is an *admissible combination*
of the `v_x`, `x ∈ A`, with denominator `d` away from `q` and size `B` under `𝖯`, if `z = Σ_x r_x v_x` with finitely
many `r_x ≠ 0`, all at points of `A`, each `d·r_x` integral away from `q`, and, if `𝖯` holds,
`Σ_x |σ(r_x)| ≤ B` for every automorphism `σ` of `ℂ`.

(b) *The integral vacuum and vacuum combinations.* `vac° := c₀^n·vac` is the integral vacuum of `V`, with `c₀ ≠ 0` the
scale of DivisibilityOfThetaDerivatives §4.6 (b) (the vacuum scale). A datum `F ∈ 𝒮(V)` is a *vacuum combination of
size `B`* if `F = Σ_x r_x ϱ_f(x) vac°` (finitely many finite adelic vectors `x`) with `Σ_x |σ(r_x)| ≤ B` for every
automorphism `σ` of `ℂ`.

(c) *Standard data.* For a prime `p` and `δ ∈ 𝒪_K ∖ {0}`, the standard data `𝒮_δ(V)` are the `𝒪_{ι_p}`-combinations of
the translates `ϱ_f(x) vac°` by the vectors `x` that `δ` makes integral at the places above `p`
(DivisibilityOfThetaDerivatives §4.8).

(d) *Gauges.* For a weight `λ = (c, e)` of rank `n`, a finite point `g` of `U(I_n)` and `ξ ∈ V_λ`, the *gauge*
`‖ξ‖_g` is the largest `p`-adic absolute value of a coordinate of `g^{−1}·ι_p(ξ)`, where `g` acts in weight `λ` at each
`τ` through the `p`-adic embedding `x ↦ ι_p(τ(x̄))`. For a theta kernel `k` between `I_n` and `I_{n′}` (a
representation `ω` of the finite points on data and a map `Φ ↦ J(Φ)` from data to linear maps `V_λ → V_{λ′}`, the jet
matrix), finite points `d`, `d′` and a real `c ≥ 0`, a datum `Φ` *raises gauges by at most `c` from `d` to `d′`* if
`‖J(ω(g, h)Φ)ξ‖_{hd′} ≤ c·‖ξ‖_{gd}` for all finite `g`, `h` and all `ξ`. These data form an additive monoid.

[ShortProof], `New/UpperBound/Seesaw/AdmissibleCombinations.lean` (`New.Seesaw.IsAdmissibleCombination`,
`New.Seesaw.IsAdmissibleCoeffs`, `New.Seesaw.integralAway`), `New/UpperBound/Kernels/JetConjugatesAndBounds.lean`
(`New.Parameters.IsVacuumCombination`), `New/UpperBound/Kernels/ThetaLiftGauge.lean` (`New.Kernel.raises`).

*Needs:* DivisibilityOfThetaDerivatives §4.6 (the integral vacuum vector), §4.8 (the standard data); WeilRepresentationsOnBanachSpacesOfData §§2.1, 3.1, 3.4, 3.6, 5.6, 6.1 (the Weil representation in the realisation used: for Weil data of `E`, which include a primitive root of unity of order `5040` in `E`, and spaces `V`, `V′`, the representation `ω_{a,b}(g, h) = a(det h)·b(det g)⁻¹·ω(x ↦ hxg⁻¹)` of `U(V)(𝔸) × U(V′)(𝔸)` by continuous operators on the data space `𝒮(Hom(V, V′))`, with its Heisenberg action `ϱ`, the vacuum, the finite part, which is the span of the finite Heisenberg translates of the vacuum, the Fock vector `v_P` of a polynomial `P` at the real places and the datum `v_P ⊗ f = ∫ v_P(y)·ϱ(y)f dy`; the theta functional `θ` is a continuous functional on the data space that is invariant under the Heisenberg operators of the rational vectors and under the rational points of the unitary group, with the mean of `|θ(ϱ(x)vac)|²` over the adelic vectors modulo the rational vectors equal to `1`; the theta kernel of a datum `f` is `(g, h) ↦ θ(ω_{a,b}(g, h)f)`); AdelicUnitaryGroupsAndAlgebraicModularForms §6.6 (the `p`-adic gauge of a vector of a Weyl module at a finite point of a standard definite space: it is ultrametric, and it is unchanged by the points integral above `p`).

### 1.2 Admissible combinations under substitution, products and the Weil action

*Origin:* particular to this proof: the closure properties of finite combinations with controlled denominators and size
that every integrality statement of the upper bound uses.

*Method of the formal proof:* direct manipulation of finitely supported coefficient families; for (e) the Weil operator
of a finite point is computed on a vacuum translate through the finite multiplier, and for (f) the Schrödinger operator
of a function modulo `𝔪` is expanded over the vectors modulo `𝔪`, whose number divides a power of `q` times `N(g)^n`.

Let `q ∈ ℕ` and let `𝖯` be a condition.

(a) *Substitution.* If `z` is an admissible combination of `(v_x)_{x ∈ A}` with denominator `d` and size `B`, and each
`v_x`, `x ∈ A`, is an admissible combination of `(v′_y)_{y ∈ A′}` with denominator `d′` and size `B′`, then `z` is one of
the `v′_y` with any denominator `e` divisible by `dd′` and any size `C ≥ B|B′|` (under `𝖯`).
(b) *Bilinear maps and tensor products.* If `z`, `z′` are admissible combinations of `(v_x)_{x∈A}`, `(v′_y)_{y∈A′}` with
denominators `d`, `d′` and sizes `B`, `B′`, then for every bilinear map `b`, `b(z, z′)` is an admissible combination of
`b(v_x, v′_y)`, `(x, y) ∈ A × A′`, with denominator `dd′` and size `B|B′|`; and a pure tensor `f_{m−1} ⊗ ⋯ ⊗ f_0` of
admissible combinations with denominator `d` and size `B` over product index sets is an admissible combination of the
corresponding pure tensors with denominator `d^m` and size `|B|^m`. Linear maps carry admissible combinations to
admissible combinations of the images.
(c) *Scalars.* Admissible combinations are stable under multiplication by a scalar integral away from `q` whose
conjugates (under `𝖯`) have absolute value at most `1`, in particular by `0` and by roots of unity; and if each `v_x` is a
root of unity times some `v′_y`, an admissible combination of the `v_x` is one of the `v′_y` with the same denominator
and size.
(d) *Integrality.* If `z` is an admissible combination of `(v_x)_{x ∈ A}` with denominator `d` away from `q` and `ℓ ∤ q`
is prime, then `d·z` lies in every `𝒪_{ι_ℓ}`-module that contains the `v_x`.
(e) *The Weil action on a vacuum translate.* Let `g` be a finite point of `U(V)`, `μ_f(g) = υ(det u)|det u|^{−1/2}` its
finite multiplier (`uÔ^n = Ô^n ∩ g^{−1}Ô^n`), factored as `μ_f(g) = c·C`. If `A` contains `g(x + z)` for all `z ∈ Ô^n`,
`d·c/|μ_f(g)|²` is integral away from `q` and (under `𝖯`) all conjugates of `c` have absolute value at most `1`, then
`ω(1, g)ϱ_f(x)vac` is an admissible combination of the `C·ϱ_f(y)vac`, `y ∈ A`, with denominator `d` away from `q` and size
`1` under `𝖯`.
(f) *Functions modulo an ideal.* Let `𝔪` divide `g·q` and `d·q` (`g ∈ 𝒪_E`, `d ∈ Ô`), let `Ψ` be a function on vectors
modulo `𝔪` with values integral away from `q` and (under `𝖯`) `Σ_x |σ(Ψ(x))| ≤ B` for all `σ`, and let `v` be the mean of
the `ϱ_f(y)u` over the integral `y` supported at the places dividing `𝔪` and their conjugates. Then the Schrödinger
operator of `Ψ` sends `u` to an admissible combination of the `ϱ_f(y)v` over the `y` with `d̄y` integral away from `q`,
with denominator `N(g)^n` away from `q` and size `B` under `𝖯`.

[ShortProof], `New/UpperBound/Seesaw/AdmissibleCombinations.lean` (`New.Seesaw.IsAdmissibleCombination.bind`,
`New.Seesaw.IsAdmissibleCombination.map_bilinear`, `New.Seesaw.IsAdmissibleCombination.pure`,
`New.Seesaw.IsAdmissibleCombination.smul_mem`, `New.Seesaw.isAdmissibleCombination_weil_vacElem`,
`New.Seesaw.isAdmissibleCombination_schrodingerOp_of_reduction`).

*Needs:* 1.1; WeilRepresentationsOnBanachSpacesOfData §§2.1, 3.1, 3.4, 3.6, 5.6, 6.1 (the Weil representation in the realisation used: for Weil data of `E`, which include a primitive root of unity of order `5040` in `E`, and spaces `V`, `V′`, the representation `ω_{a,b}(g, h) = a(det h)·b(det g)⁻¹·ω(x ↦ hxg⁻¹)` of `U(V)(𝔸) × U(V′)(𝔸)` by continuous operators on the data space `𝒮(Hom(V, V′))`, with its Heisenberg action `ϱ`, the vacuum, the finite part, which is the span of the finite Heisenberg translates of the vacuum, the Fock vector `v_P` of a polynomial `P` at the real places and the datum `v_P ⊗ f = ∫ v_P(y)·ϱ(y)f dy`; the theta functional `θ` is a continuous functional on the data space that is invariant under the Heisenberg operators of the rational vectors and under the rational points of the unitary group, with the mean of `|θ(ϱ(x)vac)|²` over the adelic vectors modulo the rational vectors equal to `1`; the theta kernel of a datum `f` is `(g, h) ↦ θ(ω_{a,b}(g, h)f)`).

### 1.3 Galois conjugation of jets

*Origin:* adapted from Shimura (1976), theta functions with complex multiplication and the algebraicity of their values:
here, the action of `Aut(ℂ/K)` on the jets of theta functions realised by one semilinear operator on the space of the
Weil representation of a standard definite space, with one scale `|t|² = 1/Ω` for every automorphism.

*Method of the formal proof:* the operator is built on the finite part, spanned by the finite translates of the vacuum,
from the Galois law of the finite Weil representation and the algebraicity of the jets of the theta functions of `E`;
its laws on the vacuum and on Schrödinger data follow from the scaling of finite translations.

Let `V` be the standard definite space of rank `n` over `E` and `σ` an automorphism of `ℂ` over `K`; let `σ*` be the
permutation of `Φ` that `σ` induces.

(a) There are `t ∈ ℂ` with `|t|² = 1/Ω`, a finite adele `b` and a `σ`-semilinear map `L` of `𝒮(V)` such that `L`
preserves the finite part and turns the translate by `x` into the translate by `bx` there,
`σ(ψ(z)) = ψ(b b̄ z)` for all finite adeles `z`, and for every `F` in the finite part the jets of `LF` at scale `t` are
the `σ`-conjugates of the jets of `F` at scale `t₀`, with the places renamed by `σ*`. In particular
`σ(F(α x)) = (LF)(α b x)` for finite `x`.
(b) For such `L` and every set `R` of finite places disjoint from its conjugate there are `c ≠ 0` and a finite adele `u`
with `u ū = 1` such that `L vac = c·ω(1, u)vac` and `L(Ψ ⊗ vac) = c·ω(1, u)((σ ∘ Ψ) ⊗ vac)` for every function `Ψ`
that is Schwartz–Bruhat at `R`, `Ψ ⊗` denoting the Schrödinger operator of `Ψ` at `R`.

[ShortProof], `New/UpperBound/Kernels/JetConjugatesAndBounds.lean` (`New.Parameters.exists_isJetConjugation`,
`New.Parameters.IsJetConjugation.exists_map_schrodingerOp`, `New.Parameters.IsJetConjugation.map_apply_finVec`).

*Needs:* WeilRepresentationsOnBanachSpacesOfData §6.13 (the Galois law of the finite part of the Weil representation: a map of the finite part that is semilinear over an automorphism `σ` of `ℂ` and scales the finite Heisenberg translations intertwines the action of a finite point up to the ratio `σ(μ_f)/μ_f` of its finite multiplier);
DivisibilityOfThetaDerivatives §1.4 (the field and its characters: the Weil data of `E`), §4.2 (the jet scale);
WeilRepresentationsOnBanachSpacesOfData §§2.1, 3.1, 3.4, 3.6, 5.6, 6.1 (the Weil representation in the realisation used: for Weil data of `E`, which include a primitive root of unity of order `5040` in `E`, and spaces `V`, `V′`, the representation `ω_{a,b}(g, h) = a(det h)·b(det g)⁻¹·ω(x ↦ hxg⁻¹)` of `U(V)(𝔸) × U(V′)(𝔸)` by continuous operators on the data space `𝒮(Hom(V, V′))`, with its Heisenberg action `ϱ`, the vacuum, the finite part, which is the span of the finite Heisenberg translates of the vacuum, the Fock vector `v_P` of a polynomial `P` at the real places and the datum `v_P ⊗ f = ∫ v_P(y)·ϱ(y)f dy`; the theta functional `θ` is a continuous functional on the data space that is invariant under the Heisenberg operators of the rational vectors and under the rational points of the unitary group, with the mean of `|θ(ϱ(x)vac)|²` over the adelic vectors modulo the rational vectors equal to `1`; the theta kernel of a datum `f` is `(g, h) ↦ θ(ω_{a,b}(g, h)f)`); IdelicReciprocityCountsAndCyclotomicClassGroups §7.5 (for a character `μ` of `[U(1)]` that has a weight and a tame part, and a point `u` of `U(1)(𝔸)` with archimedean part `1`: `|σ(μ(u))| = 1` for every ring homomorphism `σ : ℂ → ℂ`; used for the multiplier of the Weil representation at finite points).

### 1.4 Archimedean bounds for the conjugates of jets

*Origin:* adapted from Bargmann (1961): the Taylor coefficients of a function of the Fock space as its reproducing
integrals against the Gaussian weight: here, bounds for all Galois conjugates of the jets of finite combinations of
translates of the integral vacuum, moved by finite points of a pair of definite groups.

*Method of the formal proof:* each conjugate of a jet of a translate of the integral vacuum is, by 1.3, a jet at the
scale `t` of a vector `ω(1, u)` times a translate of the vacuum; the jet is written as a Gaussian integral of the
polynomial against the vacuum, which is bounded by the growth of the polynomial on balls; the values of the conjugated
vacuum are bounded through the sum over the lattice.

Let `𝒮 = 𝒮(Hom(I_n, I_{n′}))` over `E` with characters `a`, `b` of `U(1)(𝔸)` that have weights and tame parts. Put
`J(B, L, w) := B·exp(c_P·(q₁|n′||n| + 1)² + w)·(2L + 2)^{f|n′||n|}`, with `c_P` the constant of the data that depends
on `q₀` and `d` only. For an automorphism `σ` of `ℂ`, a polynomial `Q` *has conjugate growth* `(T, L, w, A)` if
`|σ(Q(z))| ≤ A·exp(w + LR)` whenever `Σ_i |σ(z_i)|² ≤ T(2L + 2)R`.

(a) For `L` as in 1.3 (a), every value of `Lϱ_f(x)ω(1, g)vac°` (finite `x`, `g`) has absolute value at most
`exp(c_P(q₁n + 1)²)`.
(b) Let `F ∈ 𝒮` be a vacuum combination of size `B`, `g`, `h` finite points, `c ∈ ℂ`, `A ≥ 0`, `|σ(c)|²/Ω ≤ T`, and
let `Q` have conjugate growth `(T, L, w, A)` for `σ`. Then the `σ`-conjugate of the jet along `Q` of
`ω_{a,b}((1, g), (1, h))F` at scale `c·t₀` has absolute value at most `J(B, L, w)·A`.
(c) Let moreover `λ` be a lift weight from rank `|n|` to `|n′|` and `L ≥ 1`. Let `S` be the matrix of jets along the
Schur polynomials of `λ` of the same translated datum at scale `c·t₀`. Then `‖σ(Sξ)‖ ≤ J(B, L, w)·‖σ(ξ)‖` for every vector
`ξ` of the Weyl module (Gram norms, `σ` applied to coordinates), with `2w = Σ_l (l/L + log l! + l·log(|σ(c)|²/Ω))`, the
sum over the row lengths `l` of `λ`.
(d) An admissible combination of the `ϱ_f(x)vac°` of size `B` under a condition that holds is a vacuum combination of size
`B`.

[ShortProof], `New/UpperBound/Kernels/JetConjugatesAndBounds.lean`
(`New.Parameters.IsJetConjugation.norm_map_intVacuum_le`, `New.Parameters.norm_jet_le_of_isVacuumCombination`,
`New.Parameters.sqrt_weylNormSq_schurJet_le_of_isVacuumCombination`,
`New.Parameters.isVacuumCombination_of_isAdmissibleCombination`).

*Needs:* 1.1, 1.3; DivisibilityOfThetaDerivatives §4.6 (the integral vacuum vector and the bounds for its conjugates);
WeilRepresentationsOnBanachSpacesOfData §§2.1, 3.1, 3.4, 3.6, 5.6, 6.1 (the Weil representation in the realisation used: for Weil data of `E`, which include a primitive root of unity of order `5040` in `E`, and spaces `V`, `V′`, the representation `ω_{a,b}(g, h) = a(det h)·b(det g)⁻¹·ω(x ↦ hxg⁻¹)` of `U(V)(𝔸) × U(V′)(𝔸)` by continuous operators on the data space `𝒮(Hom(V, V′))`, with its Heisenberg action `ϱ`, the vacuum, the finite part, which is the span of the finite Heisenberg translates of the vacuum, the Fock vector `v_P` of a polynomial `P` at the real places and the datum `v_P ⊗ f = ∫ v_P(y)·ϱ(y)f dy`; the theta functional `θ` is a continuous functional on the data space that is invariant under the Heisenberg operators of the rational vectors and under the rational points of the unitary group, with the mean of `|θ(ϱ(x)vac)|²` over the adelic vectors modulo the rational vectors equal to `1`; the theta kernel of a datum `f` is `(g, h) ↦ θ(ω_{a,b}(g, h)f)`).

### 1.5 `p`-adic gauge bounds for one theta lift

*Origin:* particular to this proof: bounds for the `p`-adic gauge of the image of a vector under the jet matrix of a
standard datum, from bounds for the jets of standard data.

*Method of the formal proof:* the gauge is ultrametric, the Weil action of points integral above `p` preserves the
standard data, and a translate by a point diagonal at the places above `p` changes the jets by the diagonal weight of
the rows; the explicit bound for standard data comes from the divisibility of jets of
DivisibilityOfThetaDerivatives §§4.10–4.11.

Let `k` be the theta kernel of the definite pair `(I_n, I_{n′})` over `E` at scale `c·t₀`, with characters `a`, `b`
of weights `e_a`, `e_b` and a lift weight `λ = (κ, e)`, at any level; let `L` be the number of boxes of `κ` in columns of
height below `|n′|`, and `δ ∈ 𝒪_K ∖ {0}`.

(a) If `Φ ∈ 𝒮_δ`, then `Φ` raises gauges from `1` to `1` by at most `(|ι_p(c)|/|ι_p(δ̄ d)|)^L`.
(b) Let `Φ ∈ 𝒮_δ`, let `x`, `y` be finite points of `U(I_{n′})` integral above `p`, and let `d` be a finite point
whose image at each `τ` under `z ↦ ι_p(τ(z̄))` is a diagonal matrix `u_τ`. If for every standard datum and every entry
`(i′, i)` of its jet matrix, `|ι_p(entry)|` times the diagonal weight of the row `i′` (the product over `τ` of
`|det u_τ|^{e_a(τ)}` and of the `|u_τ(b)|` over the boxes of `i′`) is at most `B`, then `ω(1, xdy)Φ` raises gauges from
`1` to `1` by at most `B`.
(c) If `e′·f` is standard for `δ = N ≠ 0` (`e′, N ∈ ℕ`), `|ι_p(c)| ≤ 1`, and `e′(N·d)^L` divides `M′ ∈ ℕ` (`d` the prime
with `K = ℚ(√−d)`), then `M′·f` raises gauges by at most `1`.
(d) If `p` is not split in `K`, `c` is integral at `p` and `Φ ∈ 𝒮_1`, then `Φ` raises gauges by at most
`p^{−(D − f|n′|³(1 + log_p max(L, 1)))}`, with `D` the predicted divisibility of
DivisibilityOfThetaDerivatives §3.1.

[ShortProof], `New/UpperBound/Kernels/ThetaLiftGauge.lean` (`New.Parameters.mem_raises_of_standardData`,
`New.Parameters.omega_mem_raises_of_schurJet_le`, `New.Parameters.smul_mem_raises_of_dvd`,
`New.Parameters.mem_raises_predictedDivisibility`, `New.Parameters.pairWeil_mem_standardData`).

*Needs:* 1.1; DivisibilityOfThetaDerivatives §3.1 (the predicted divisibility), §4.6 (the integral vacuum vector),
§4.8 (stability of the standard data), §4.10 (integrality of their jets), §4.11 (divisibility of jets that counts primes);
AdelicUnitaryGroupsAndAlgebraicModularForms §6.6 (the `p`-adic gauge of a vector of a Weyl module at a finite point of a standard definite space: it is ultrametric, and it is unchanged by the points integral above `p`).

### 1.6 Data from functions modulo an ideal

*Origin:* particular to this proof: data defined by functions on matrices modulo an ideal, put at the places of the
ideal with the integral vacuum elsewhere, are integral multiples of standard data and combinations of translates of the
integral vacuum.

*Method of the formal proof:* the function is expanded over the matrices modulo `𝔪`, each indicator being a mean of
translates of the vacuum over a coset of a lattice; the number of matrices modulo `𝔪` controls the denominators.

Let `𝔪` be a modulus of `E`, `Ψ` a function on `n′ × n` matrices modulo `𝔪`, and `F_Ψ := c₀^{|n′||n|}·(Ψ ⊗ vac)`.

(a) If `qN ∈ 𝔪` and the values of `Ψ` are integral away from `q`, then for every prime `ℓ ∤ q`,
`N^{2f|n′||n|}·F_Ψ` is a standard datum for `N` at `ℓ`.
(b) If `|σ(Ψ(x))| ≤ M′` for all `σ` and `x`, then `F_Ψ` is a vacuum combination of size `M′` times the number of matrices
modulo `𝔪`; and if `Ψ` is the indicator of one matrix, `F_Ψ` is a vacuum combination of size `1`.

[ShortProof], `New/UpperBound/Kernels/ThetaLiftGauge.lean` (`New.Parameters.smul_vacuumDatum_mem_standardData`,
`New.Parameters.isAdmissibleCombination_vacuumDatum`, `New.Parameters.isVacuumCombination_vacuumDatum`,
`New.Parameters.isAdmissibleCombination_vacuumDatum_indicator`).

*Needs:* 1.1, 1.2; DivisibilityOfThetaDerivatives §4.6 (the integral vacuum vector), §4.8 (the standard data).

### 1.7 Rational equivariance, integrality and size of definite theta kernels

*Origin:* particular to this proof: one normalising constant makes all definite theta kernels with data modulo an ideal
integral at the primes where their input is, and bounds all their conjugates.

*Method of the formal proof:* moving the points by rational elements is absorbed by the invariance of `θ` and acts on
the polynomial by a two-sided substitution; integrality follows from 1.5 and 1.6 at the primes prime to `q`, and the
size bound from 1.4 with the growth of a homogeneous polynomial on polydiscs.

Let `L`, `N′` be finite sets, `a`, `b` characters of `U(1)(𝔸)` with weights `e`, `e′` and tame parts.

(a) For rational points `γ ∈ U(I_L)(E)`, `γ′ ∈ U(I_{N′})(E)` and finite `g`, `h`:
`θ^{a,b}[Ψ, Q]((1, γg), γ′h) = ∏_τ τ(det γ′)^{−e(τ)}·τ(det γ)^{e′(τ)}·θ^{a,b}[Ψ, Q^{γ,γ′}]((1, g), h)`, where `Q^{γ,γ′}` is
`Q` with the variables `x_τ` replaced by `τ(γ′^{−1})ᵀ x_τ τ(γ)ᵀ`.
(b) For every `d ∈ ℕ` there is `c ≠ 0`, depending only on `L`, `N′`, the data and `d`, such that for every `Q`
homogeneous of degree `d` and every `Ψ`: (i) if `qM² ∈ 𝔪`, the values of `Ψ` are integral away from `q`, `p ∤ q` is
prime, `g`, `h` are integral above `p` and the coefficients of `Q` lie in `𝒪_{ι_p}`, then
`|ι_p(c·θ^{a,b}[Ψ, Q]((1, g), h))| ≤ 1`; (ii) if `|L|, |N′| ≤ Δ`, `d ≤ M`, `M² ∈ 𝔪`, `|σ(Ψ(x))| ≤ A` for all `σ`, `x`, and
`|σ(Q(z))| ≤ B` whenever all `|σ(z_i)| ≤ M⁴`, then `|σ(c·θ^{a,b}[Ψ, Q]((1, g), h))| ≤ exp(x₁)·A·B` for all `g`, `h`.

[ShortProof], `New/UpperBound/Kernels/DefiniteKernelSize.lean` (`New.Rows.modKernelStdSpace_embFin_mul`,
`New.Rows.exists_ne_zero_isModKernelScale`).

*Needs:* 1.4, 1.5, 1.6; WeilRepresentationsOnBanachSpacesOfData §§6.1, 6.7 (theta kernels of a pair whose finite datum is a function `Ψ` on matrices modulo an ideal `𝔪`, `θ^{a,b}[Ψ, P](g, h) = θ(ω_{a,b}(g, h)f)` for the datum `f` built from `Ψ` and the Fock vector of the polynomial `P`; the levels act by equivariance, not invariance: right translation of `g` by an element `k` of the stabiliser of the lattice replaces `Ψ` by `x ↦ b(det k)⁻¹·Ψ(xk̄)`, and right translation of the finite part of `h` by such a `k` replaces `Ψ` by `y ↦ a(det k)·Ψ(k̄⁻¹y)`, with `k̄` the reduction of `k` modulo `𝔪`; the kernel of the pair of `S` and an orthogonal sum `T ⊕ V`, for the characters `a`, `bb′`, the product of `Ψ` and `Ψ′` on the two blocks of rows and the product `PP′`, is at `(g, h ⊕ h′)` the product of the kernels of `(S, T)` for `a`, `b` and of `(S, V)` for `a`, `b′`; and there is a number `c` of modulus `1`, depending only on the two spaces, such that the complex conjugate of `θ^{a,b}[Ψ, P](g, h)` is `c` times the kernel of the pair with `S` negated, for the characters `a⁻¹υⁿ`, `b⁻¹υ^{n′}`, the function `x ↦ conj Ψ(u⁻¹x)`, with `u` the reduction of a fixed element of `Ô` of norm `−1`, and the polynomial with the conjugate coefficients).

## Layer 2: Source forms, target forms and chains of lifts

This layer defines the spaces and maps of the argument. With ranks: source forms on `X_0` (rank `k`) go by the Poincaré
map to forms of principal level on `Y_0` (rank `r`), which `e₀` projects to the target forms, and from `Y_0` by the `m`
lifts of the lower chain to `Y_m` (rank `r + mt`). Source forms also go by the `m` lifts of the upper chain to `X_m`
(rank `r + mt + 1`) and by restriction to `Y_m`. The single lifts of the descent pairs are `W_j` (rank `r`) to `V_j`
(rank `r + t`).

Two sections of this layer rest on sections of Layer 3 that are independent of the rest of this layer: 2.1 takes the
glued lattice from 3.2, which uses only the Conventions, and 2.19 takes the grading of `Y_0` from 3.7, which rests on
2.1, 2.6, 3.2 and 3.4.

### 2.1 The spaces of the chain

*Origin:* definitions and conventions; the lemma is elementary.

*Method of the formal proof:* the spaces `Y_j` for `j < m` are chosen with the prescribed Gram matrix and a point whose
lattice is the glued lattice of 3.2; the frames at the infinite places come from the string frame of 3.2.

*Definitions.* For `0 ≤ j ≤ m`:
- `X_j := I_{n_j}`, with basis indexed by `{1, …, n_j − 1}` and a last index; `Y_m` is identified with the span of the
  first `n_m − 1` basis vectors of `X_m` by a fixed bijection, so `X_m = Y_m ⊥ ⟨e_last⟩`.
- `Y_0` has basis `e_1, …, e_ϱ`, the basis of `X_0`, a middle vector `z`, and `e*_1, …, e*_ϱ` (`r` vectors). For
  `j ≥ 1`, the basis of `Y_j` is that of `Y_0` followed by `j` blocks of `t` vectors (rank `r + jt`). For `j < m` there is
  a bijection of this basis with the basis of `X_j` and a string of `m − 1 − j` vectors (the identity on `X_0` and the
  string `e_1, …, z, …, e*_1` for `j = 0`) under which the Gram matrix of `Y_j` is `1` on `X_j` and pairs `e_i`,
  `e_{m−2−j−i}` to `1`, the middle vector (for even `j`) to itself to `−N`. For `j ≥ m` all signs are `+1` and `Y_j` is
  standard.
- The point of `Y_j` (`j < m`) is chosen so that its lattice is the glued lattice of 3.2 for the ideles
  `a := α/ϖ̄_M`, `π_N` and the scale `u_j := (a/ā)^{⌈(m − j)/2⌉}`, up to an integral matrix that reduces to `1` at every
  chosen place.
- `W_j` (`1 ≤ j ≤ m`) is the diagonal space on the basis of `Y_0` with sign `+1` on the vectors whose number (in a fixed
  numbering `0, …, r − 1`) is below `k + j − 1` and `−1` on the others; `V_j := I_{r+t}`, on the basis of `Y_0` followed by
  `t` vectors.

*Lemma.* (a) `rank Y_j = r + jt`, and for `j < m` the signs of `Y_j` have `⌊(m − j)/2⌋` entries `−1` at every `τ`; `Y_m`
is definite of rank `n_m − 1`. (b) `W_j` has `m − j` signs `−1`, and `W_m` is standard. (c) For `j ≤ m`,
`rank Y_j ≤ n_m`.

[ShortProof], `New/UpperBound/Objects/LabelsAndIndexTypes.lean` (`New.Data.X`, `New.Data.Y`, `New.Data.RowIndex`,
`New.Data.signsW`), `New/UpperBound/Objects/Rows.lean` (`New.Data.spaceY`, `New.Data.spaceW`,
`New.Data.spaceY_gram_eq`, `New.Data.exists_spaceY_xFin_eq`, `New.Data.isStd_spaceY_of_le`, `New.Data.card_Y_le`),
`New/UpperBound/Objects/Columns.lean` (`New.Data.lastIndexEquiv`).

*Needs:* 3.2; OneSidedPrimeSumBoundsAndAdmissibleData §3.2 (the ranks `m`, `r`, `k`, `t`, `n_j`, the prime `N` and `π_N`),
§3.3 (b) (the parities and `r + 1 = k + m`).

### 2.2 Weights of the definite spaces and the branching map

*Origin:* definitions and conventions; the lemma is elementary, with the existence of an integral branching map from
the classical branching law from `U(n)` to `U(n − 1)` (Goodman and Wallach (2009), Theorem 8.1.1;
IntegralWeylModulesOfGeneralLinearGroups §1.1).

*Method of the formal proof:* the weights are written through their columns, the parameters as staircases of blocks,
and the interlacing of `μ(X_m)` and `μ(Y_m)` is checked column by column; the branching map is the integral branching
matrix of the background result for these columns.

*Definitions.* For `τ ∈ Φ` and `h ≥ 1` let `c_τ(h) := a` if `h = 1` and `τ ∈ Φ_a`, `0` if `h = 1` and `τ ∉ Φ_a`;
`c_τ(k) := κ_1(τ) − ⌊(k + t + 1)/2⌋`; `c_τ(h) := Δ − (t + 1)` if `h > k` and `h ≡ k (mod t + 1)`; `c_τ(h) := 0` otherwise.
`e_0 := 0` and `e_j(τ) := n_{j−1}/2 − κ_j(τ)` for `j ≥ 1`. The weight `μ(X_j)` of rank `n_j` has `c_τ(h)` columns of
height `h < n_j` and last entry `e_j(τ)`. The kept columns are `c°(h) := Δ/2 − (t + 1)/2` if `h ≥ k` and
`h ≡ k (mod t + 1)`, else `0`; the weight `μ(Y_m)` of rank `n_m − 1` has
`c^Y_τ(h) := c°(h) + c_τ(h + 1) − c°(h + 1)` columns of height `h` and last entry `e_m(τ)`. The branching exponent is
`n_τ := |μ(X_m)_τ| − |μ(Y_m)_τ|` (`|·|` the sum of the entries). The *lift diagram* of step `j < m` at `τ` is the Young
diagram with the `n_j` rows `μ(X_j)_τ + κ_{j+1}(τ) − n_{j+1}/2`; by (a) below it has `c_τ(h)` columns of each height
`h ≤ n_j`, and `μ(X_{j+1})` is this diagram, continued by `0`, shifted by `n_j/2 − κ_{j+1}`.

*Lemma.* (a) `μ(X_j) + ρ` has the doubled Harish-Chandra parameter `2[k] + (2a_τ, 0, …, 0)` followed by the blocks
`−2κ_i + 2[t + 1]`, `1 ≤ i ≤ j`, where `a_τ = a` on `Φ_a` and `0` elsewhere; `μ(X_{j+1})` is `(μ(X_j) + κ_{j+1} − n_{j+1}/2,
0, …, 0) + n_j/2 − κ_{j+1}`, and `(c, e_j)` is a lift weight from `X_j` to `X_{j+1}`: no column has height strictly between
`n_j` and `n_{j+1}`, and `e_j = n_{j+1}/2 − κ_{j+1} + c_τ(n_j)`. (b) The doubled parameter of `μ(Y_m) + ρ` is `2[k − 1]`
followed, for `i = 1, …, m`, by `−2κ_i + Δ` and the block `−2κ_i + 2[t]`; the parameters of `X_m` and `Y_m` interlace.
(c) `n_τ = a_τ − mΔ/2`. (d) There is an integer matrix `br : V_{μ(X_m)} → V_{μ(Y_m)}` with
`br∘ρ_{μ(X_m)}(diag(g, z)) = ∏_τ z_τ^{n_τ}·ρ_{μ(Y_m)}(g)∘br` over every field of characteristic `0`, whose squared operator
norm is at most `exp(x^{70})`, and whose complex multiples are all the maps equivariant for the `diag(g, 1)`, `g` unitary.
A fixed such `br` is the *branching map*.

[ShortProof], `New/UpperBound/Objects/Weights.lean` (`New.Data.columnCount`, `New.Data.lastEntry`,
`New.Data.columnsY`, `New.Data.paramX`, `New.Data.weightX_eq`, `New.Data.weightY_eq`, `New.Data.liftDiagram`,
`New.Data.branchExponent_eq`), `New/UpperBound/Objects/Columns.lean` (`New.Data.IsBranchingMap`,
`New.Data.exists_isBranchingMap`, `New.Data.isLiftWeight_columnCount`), `New/UpperBound/Objects/Rows.lean`
(`New.Data.isHCParam_paramY`).

*Needs:* OneSidedPrimeSumBoundsAndAdmissibleData §3.2 (the ranks, the weights `κ_j`, the gap `Δ` and the order `a`),
§3.3 (their parities and sizes); IntegralWeylModulesOfGeneralLinearGroups §1.1 (an equivariant branching map from
`GL_N` to `GL_{N−1}` for an interlacing pair that preserves the integral structures, its weight for the last coordinate
and its norm); IntegralRepresentationsOfGeneralLinearGroups §3.4 (the form used: for an interlacing pair of weights at every place of `Φ`, an integer matrix between the Weyl modules in the coordinates dual to the bases of products of minors of [ShortProof] (such a basis differs from the semistandard basis by an invertible integer matrix), equivariant for `diag(g, z)` with the character `∏_τ z_τ^{n_τ}` over every field of characteristic `0`, with an explicit bound for its squared norm, whose complex multiples are all the maps equivariant for the unitary block group).

### 2.3 Inserting a block into a parameter

*Origin:* particular to this proof: a combinatorial criterion under which a parameter and the same parameter with one
more block correspond; the correspondence of discrete-series parameters under the theta lift is that of Li (1990).

*Method of the formal proof:* the entries before and after the insertion are compared after the shift by the centre;
the separation of the centres places the inserted block away from the others, so the signs change only at the
inserted centre.

At one infinite place, a *centre system* is a finite set `C` of centres `c` with integer values `c̃`, lengths `l_c` and
kinds (up or down), and a finite set `S` of doubled stem entries. For `B ⊆ C`, `λ⁺_B` has the doubled entries `S` and the
blocks `2c̃ + 2[l_c]`, `c ∈ B`; its rank is `|S| + Σ_{c∈B} l_c`; the sign of an entry `y` is `(−1)` to the number of centres
outside `B` that are down with `y < 2c̃` or up with `2c̃ < y`; `λ_B` is `λ⁺_B` lowered by `½` if `|S|` and `|B|` are both
odd. The system is *separated* with bound `h` if all lengths have the parity of `|S|`, the stem entries have the parity
of `|S| + 1`, and every centre `c` is at doubled distance at least `h + l_c` from the stem and from the blocks of the other
centres. A doubled parameter `l` on a space with signs `s` *is `λ_B` with sign `σ`* if the rank is that of `λ_B`, the
entries of `l` raised by the lowering are those of `λ⁺_B`, and each sign is `σ` times the sign of its entry.

Let the system be separated with bound `h`, `B ⊆ C`, `c ∈ C ∖ B`, and let `l` be `λ_B` and `l′` be `λ_{B∪{c}}`, with the
same sign, on spaces of ranks `n`, `n′`, with `h ≥ 500(n + n′)³`. (a) If `c` is down, `l` and `l′` satisfy the block rule
for `γ = c̃ + ⌊n/2⌋`, `γ′ = c̃ + ⌊n′/2⌋`. (b) If `c` is up, `−l` and `−l′` satisfy the block rule for
`γ = −c̃ + ⌈n/2⌉`, `γ′ = −c̃ + ⌈n′/2⌉`. (c) In either case `λ_B` has the gap `h` for its signs.

[ShortProof], `New/UpperBound/Objects/InsertBlock.lean` (`New.CentreSystem.IsParam.isBlockRule_insert_of_down`,
`New.CentreSystem.IsParam.isBlockRule_neg_insert_of_up`, `New.CentreSystem.IsParam.hasGap`).

*Needs:* HolomorphicDiscreteSeriesOfUnitaryGroups §8.2, WeilRepresentationsOnBanachSpacesOfData §§7.2, 7.3 (theta lifts between discrete-series types: an edge from a type `e` to a type `e′`, for the real Weil representation `Ω` of weights `γ`, `γ′`, is a Fock vector `Φ` such that `e` is a cusp kernel of order `0`, the zeta integral `∫⟨Φ, Ω(x, 1)Φ⟩·conj(e(x))/e(1) dx` is not zero, the lift with a datum `Φ ⊗ f` of a form of type `e` is a form of type `e′` as soon as it has a level, and the lift with the Fock vector of any polynomial is the convolution of the lift with `Φ` with one continuous function of compact support on the real group, and such that the same four properties hold with the two groups exchanged, from the conjugate of `e′` to the conjugate of `e`; if two families of parameters satisfy the block rule at every infinite place, a chosen product over the infinite places of joint harmonic polynomials is an edge between their types; for an edge `Φ`, characters `a`, `b` of weights `γ`, `γ′` and a datum `f` in the finite part, the lift with `Φ ⊗ f` carries forms of type `e` to forms of type `e′`, the transposed lift carries forms of the conjugate type of `e′` to forms of the conjugate type of `e`, and the descent, the conjugate of the transposed lift of the conjugate, carries forms of type `e′` to forms of type `e`; the block rule is kept by exchanging the two spaces, by negating both parameters and the signs of the first space with `(γ, γ′)` replaced by `(n − γ, n′ − γ′)`, by reversing all signs on both spaces, and by raising `γ`, `γ′` by integers `u`, `u′` while adding `u′` to the first parameter and `u` to the second).

### 2.4 The grids of spaces and their parameters

*Origin:* definitions and conventions; the lemma is particular to this proof: every step of the chains and grids
inserts one block, so the parameters of consecutive nodes correspond.

*Method of the formal proof:* each node is the parameter of a centre system (2.3) with the stem `2ς` and the blocks of
the steps taken so far; the separation of the system comes from the gap `Δ` between the weights `κ_l`, and 2.3 gives the
block rule for each step; the interlacing at `(m, m)` is a count of entries above each integer.

*Definitions.* The *target parameter* `ς(τ) ∈ ℤ^r` is the row parameter of OneSidedPrimeSumBoundsAndAdmissibleData §3.4
at the place `τ`, read on its first `r` entries: `ς(τ) = (λ_0(τ), …, λ_{r−1}(τ))`, which is `k/2 − 1, k/2 − 2, …, 1 − k/2`
(`k − 1` entries) followed by `Δ/2 − κ_1(τ), …, Δ/2 − κ_m(τ)`; the next entry of the row parameter,
`λ_r(τ) = Δ/2 − κ_{m+1}(τ)`, continues it. For `i, j ≥ 0` and an offset `o ≥ 0`:
- *grid `Y`, node `(i, j)`*: index set the basis of `Y_0`, then `i` blocks of `t`, then `j` blocks of `t` (rank
  `r + (i + j)t`); the base index with number `n` has sign `(−1)^{o + a + min(max(a − o, 0), j)}` with
  `a = max(n + 1 − k, 0)` and the added indices sign `+1`; the doubled parameter is `2ς(τ)` on the base, the block
  `2κ_l(τ) + 2[t]` for the `l`-th block of the first kind (`1 ≤ l ≤ i`) and `−2κ_{l+o}(τ) + 2[t]` for the `l`-th
  block of the second kind (`1 ≤ l ≤ j`), all lowered by `1` if `i + j` is odd;
- *grid `Ỹ`, node `(i, j)`*: index set the basis of `Y_0` and one more index, then `i` blocks of `t + 1`, then `j` blocks of
  `t − 1` (rank `r + 1 + i(t + 1) + j(t − 1)`); signs as before on the base (with `r + 1` numbers); the doubled parameter of
  the space `Ỹ^j_i` is minus the vector with `2ς(τ) + 1` on the base, the blocks `2κ_l(τ) + 2[t + 1]` (first
  kind) and `−2κ_{l+o}(τ) + 2[t − 1]` (second kind), with no lowering.
The signs and doubled parameter of `Y_j` (2.1) are those of the node `(0, j)` of grid `Y` with offset `0`; write
`l_Y(j)`. For a step with centre `±κ_{l+1}` and a node of `N` indices, the weights are `⌊N/2⌋ − κ_{l+1}(τ)` and
`⌈N/2⌉ − κ_{l+1}(τ)`.

*Lemma.* For `i, j ≤ m`: (a) with offset `o = 0`: at `(j, j)`, `Ỹ^j_j` is `Y^j_j` plus one vector of sign `(−1)^j`; at
`(m, m)` the entries of the parameters of `Ỹ^m_m` and `Y^m_m` interlace (for every integer the number of entries of
`Ỹ^m_m` above it minus that of `Y^m_m` is `0` or `1`); and for `j ≥ m` all signs are `+1`. (b) Every node (of every
offset) has the gap `Δ` at every `τ`, and, for `o + j ≤ m` and `o = 0` or `i = 0`, its parameter is `λ_B` (2.3), with sign `(−1)^o`, of a separated centre system whose stem comes from `ς` and
whose centres are the `κ_l` (up) and the `−κ_l` (down), `B` being the centres of its blocks. (c) For `i + 1 ≤ m`, `j ≤ m` and `o = 0`, the negated parameters of `(i, j)` and `(i + 1, j)` correspond for the
weights `⌈N/2⌉ − κ_{i+1}` (grid `Y`) or `⌊N/2⌋ − κ_{i+1}` (grid `Ỹ`); for `j + 1 + o ≤ m` and `o = 0` or `i = 0`, the
parameters of `(i, j)` and `(i, j + 1)` correspond for the weights `⌊N/2⌋ − κ_{j+o+1}` (grid `Y`) or
`⌈N/2⌉ − κ_{j+o+1}` (grid `Ỹ`); in particular `l_Y(j)` and `l_Y(j + 1)` correspond for `j < m`.

[ShortProof], `New/UpperBound/Objects/Parameters.lean` (`New.Data.GridIndex`, `New.Data.gridSigns`,
`New.Data.gridParam`, `New.Data.signsY`, `New.Data.paramY`, `New.Data.gridWeight`, `New.Data.gridDiagEquiv`,
`New.Data.sumElim_gridSigns_comp_gridDiagEquiv_symm`, `New.Data.gridSigns_eq_one`,
`New.Data.gridParam_interlace`, `New.Data.hasGap_gridParam`, `New.Data.isParam_gridParam`,
`New.Data.paramsCorrespond_grid_succ_left`, `New.Data.paramsCorrespond_grid_succ_right`), `New/UpperBound/Objects/RowChain.lean`
(`New.Data.paramsCorrespond_paramY`).

*Needs:* 2.3; OneSidedPrimeSumBoundsAndAdmissibleData §3.2 (the ranks, the weights `κ_j` and the gap `Δ`), §3.3 (their
sizes), §3.4 (the row parameter); HolomorphicDiscreteSeriesOfUnitaryGroups §8.2, WeilRepresentationsOnBanachSpacesOfData §§7.2, 7.3 (theta lifts between discrete-series types: an edge from a type `e` to a type `e′`, for the real Weil representation `Ω` of weights `γ`, `γ′`, is a Fock vector `Φ` such that `e` is a cusp kernel of order `0`, the zeta integral `∫⟨Φ, Ω(x, 1)Φ⟩·conj(e(x))/e(1) dx` is not zero, the lift with a datum `Φ ⊗ f` of a form of type `e` is a form of type `e′` as soon as it has a level, and the lift with the Fock vector of any polynomial is the convolution of the lift with `Φ` with one continuous function of compact support on the real group, and such that the same four properties hold with the two groups exchanged, from the conjugate of `e′` to the conjugate of `e`; if two families of parameters satisfy the block rule at every infinite place, a chosen product over the infinite places of joint harmonic polynomials is an edge between their types; for an edge `Φ`, characters `a`, `b` of weights `γ`, `γ′` and a datum `f` in the finite part, the lift with `Φ ⊗ f` carries forms of type `e` to forms of type `e′`, the transposed lift carries forms of the conjugate type of `e′` to forms of the conjugate type of `e`, and the descent, the conjugate of the transposed lift of the conjugate, carries forms of type `e′` to forms of type `e`; the block rule is kept by exchanging the two spaces, by negating both parameters and the signs of the first space with `(γ, γ′)` replaced by `(n − γ, n′ − γ′)`, by reversing all signs on both spaces, and by raising `γ`, `γ′` by integers `u`, `u′` while adding `u′` to the first parameter and `u` to the second).

### 2.5 Labels, the group `𝖦` and the good idempotent

*Origin:* definitions and conventions; the lemma rests on the labels of the characters of `GL_r(𝔽_q)`
(FiniteReductiveGroups §5.7).

*Method of the formal proof:* the idempotent of a label is formed from Green's character of the label; orthogonality of
these characters makes the tensor products central orthogonal idempotents, and a hyperplane sum with a character whose
name is not a root of the label is killed by the character formula.

*Definitions.* A *label* of degree `r` over a finite field `k` is a monic squarefree `c ∈ k[X]` of degree `r` with
`c(0) ≠ 0`; it is *allowed* for `q₂` if no root of `c` in `k` is a `q₂`-th root of unity, and *primitive* if it is
irreducible with a root that generates the units of the extension of degree `r`. `e_c ∈ ℂ[GL_r(k)]` is the central
idempotent of the irreducible character of label `c` (FiniteReductiveGroups §5.7). `𝖦 := ∏_w GL_r(𝔽_w)` over the chosen
places, on the basis of `Y_0`. A family `(c_w)` of labels of degree `r` over the `𝔽_w` is *good* if, for `i = 0, 1`, every
`c_w` with `w` above `p_i` is allowed and at least one of them is primitive. `e₀ := Σ_{(c_w) good} ⊗_w e_{c_w} ∈ ℂ[𝖦]`.

*Lemma.* (a) `e₀` is a central idempotent. (b) If at one chosen place `w` the factor of a pure tensor `⊗_w x_w` is the
hyperplane sum `Σ_h χ(det h)^{−1}h` over the invertible `h = 1 + u lᵀ` (`l ≠ 0`, `χ^{q₂} = 1`), then `(⊗_w x_w)·e₀ = 0`.

[ShortProof], `New/UpperBound/Objects/LabelsAndIndexTypes.lean` (`New.IsPrimitivePolynomial`, `New.goodTuples`,
`New.Data.chosenGL`, `New.Data.goodTupleFamilies`, `New.Data.e₀`, `New.Data.isCentralProj_e₀`,
`New.Data.hyperplaneSum_mul_e₀`).

*Needs:* FiniteReductiveGroups §5.7; OneSidedPrimeSumBoundsAndAdmissibleData §3.2 (`r`, `q₂` and the primes `p₀`, `p₁`).

### 2.6 Characters and levels of the lifts

*Origin:* definitions and conventions.

*Method of the formal proof:* definitions.

Let `ϑ` be a tame character.
- The *level places* of `ϑ` are the chosen places and the places of `Q(ϑ)`; they are pairwise distinct and none is
  conjugate to another.
- `K_j := {k ∈ J_M on X_j : the last row of k is ≡ (0, …, 0, 1) (mod π_N)}`, the level of `X_j`; it is a level and
  contains the principal level `(π_Mπ_N)`.
- `J_ϑ(Y_j) := K(level places, 1)` on `Y_j`, the integral points of `U(Y_j)` that reduce to `1` at all level places;
  `J_ϑ(Y_j) ⊂ J_M`.
- The character of lift `j + 1` on a space of rank `n` is `(ν_{j+1}^ϑ)_n`, and its tame part
  `ψ_{j+1}^ϑ = ω^{j+1}ψ_ϑ^{j+1}` is trivial outside the level places.
- `J_m^ϑ ⊂ K°(Y_m)`: the `k` whose reductions are `1` at the chosen places and block upper triangular at the places of
  `Q(ϑ)` for the blocks of `Y_m` (the basis of `Y_0`, then the `m` blocks of `t`); `χ_m^ϑ(k) := ∏_w ∏_{l<m}
  ψ_{l+1}^ϑ(det k_w^{(l+1)})`, over the level places `w`, where `k_w^{(l+1)}` is the diagonal block `l + 1` of the
  reduction of `k` at `w`.

[ShortProof], `New/UpperBound/Objects/Rows.lean` (`New.Data.levelPlaces`, `New.Data.levelY`,
`New.Data.levelY_le_chosenLevel`, `New.Data.chainTamePart`), `New/UpperBound/Objects/Columns.lean`
(`New.Data.levelX`, `New.Data.principalLevel_le_levelX`), `New/UpperBound/Objects/RowChain.lean`
(`New.Data.lastLevel`, `New.Data.lastLevelChar`).

*Needs:* 2.1; OneSidedPrimeSumBoundsAndAdmissibleData §3.2 (the data), §3.4 (the twists and the characters `μ_j⁰`).

### 2.7 Forms of principal level, good forms and target forms

*Origin:* definitions and conventions; the finiteness is that of spaces of forms of a cusp type at a fixed level.

*Method of the formal proof:* the type of `2ς` has the gap `Δ` for the signs of `Y_0` and of the `W_j` (2.4), which makes
its kernel a cusp kernel of order `Δ/2`; spaces of forms of a cusp type at a level are finite-dimensional.

*Definitions.* For a space `V` on the basis of `Y_0` with signs `s` for which `2ς` has the gap `Δ`, `𝒜(V)` is the space
of forms of type `2ς` (the product over `τ` of the discrete-series kernels of `2ς(τ)` for `s`) on `U(V)` that are fixed by
`J_M`. `𝖦` acts on `𝒜(V)` through integral lifts of its elements (right translation by an element of `K°` with the given
reductions at the chosen places). The *good forms* are `e₀·𝒜(V)`; the *target forms* are `𝒯 := e₀·𝒜(Y_0)`, of dimension
`dim 𝒯` (the target dimension).

*Lemma.* For the signs of `Y_0` and of every `W_j`, `2ς` has the gap `Δ` at every `τ`; the type of `2ς` is then a cusp
kernel of order `Δ/2`, and `𝒜(V)` is finite-dimensional.

[ShortProof], `New/UpperBound/Objects/Rows.lean` (`New.Data.principalForms`, `New.Data.principalRep`,
`New.Data.goodForms`, `New.Data.targetForms`, `New.Data.targetDim`, `New.Data.hasGap_signsY_paramW`,
`New.Data.hasGap_paramW`, `New.Data.isCuspKernel_typeKernel_paramW`).

*Needs:* 2.1, 2.4, 2.5; AdelicUnitaryGroupsAndAlgebraicModularForms §§5.1, 5.2, 5.4 (forms of a discrete-series type on an adelic unitary group as the bounded automorphic functions fixed by convolution with the type kernel; the type kernel is a cusp kernel of order `B` when at every infinite place the entries of opposite signs of the parameter are at least `500n³ + B` apart; for a cusp kernel `e` and an open subgroup `K` of the finite adelic group, the forms of type `e` that are right invariant under `K` form a finite-dimensional space).

### 2.8 Source forms, ramified source forms and the lifts between the `X_j`

*Origin:* definitions and conventions.

*Method of the formal proof:* definitions; the lift is the class-sum theta lift of a definite pair whose kernel is the
jet matrix of the theta function of the translated datum.

- The *source forms* `𝒮_X` are the algebraic forms on `U(X_0)` of weight `μ(X_0)` (weight `(a, 0, …, 0)` at the
  `a`-places and `0` elsewhere) fixed by `K_0`. `𝒜_j` denotes the algebraic forms on `U(X_j)` of weight `μ(X_j)`.
- For `w ∈ P_N` fix a *scaling* `z_w`: an integral norm-one idele, `1` away from `w` and `w̄`, whose component at `w`
  generates `𝔽_w^×`. One exists: take a unit at `w` whose reduction generates the cyclic group `𝔽_w^×` and divide its
  idele by its conjugate; as `w` is split, the component at `w` of the quotient is that unit. The *ramified source forms* are
  `𝒮_X^{ram} := {φ ∈ 𝒮_X : Σ_{0 ≤ i < N−1} z_w^i·φ = 0 for every w ∈ P_N}`, `z_w` acting by right translation by the
  scalar `z_w`.
- For a tame character `ϑ` and `j ≥ 0`, the *lift* `L_j^ϑ(Φ) : 𝒜_j → 𝒜_{j+1}` with finite datum `Φ` in the finite part of
  `𝒮(Hom(X_j, X_{j+1}))` is the theta lift of the definite pair `(X_j, X_{j+1})` with characters `(ν_{j+1}^ϑ)_{X_j}`,
  `(ν_{j+1}^ϑ)_{X_{j+1}}`, level `K_j`, the lift weight of 2.2 (a), and derivatives scaled by `π_M·t₀`, where `π_M` is
  the element of `𝒪_K` with `π_M π̄_M = M` fixed by the data (the conjugate of the `π̄_M` chosen there, not any other
  element of norm `M`): the class sum over `[U(X_j)]` against the jet matrix of `ω(g, h)Φ` (ThetaLiftsForDefiniteUnitaryGroups
  §1.2). The finite groups act on its data by `ω`.

[ShortProof], `New/UpperBound/Objects/Columns.lean` (`New.Data.SourceForm`, `New.Data.FormX`, `New.Data.liftKernel`,
`New.Data.homX`), `New/UpperBound/Size/ShortColumns.lean` (`New.Data.IsScalingAt`, `New.Data.exists_isScalingAt_valuation_pow_iff`,
`New.Data.scalingGenerator`,
`New.Data.ramifiedSourceForms`).

*Needs:* 2.2, 2.6; ThetaLiftsForDefiniteUnitaryGroups §1.2; DivisibilityOfThetaDerivatives §4.2 (the jet scale).

### 2.9 Chains of theta lifts and jointly invariant combinations

*Origin:* particular to this proof: the composite of the lifts over a tensor of data as one operator, its equivariance,
and the expansion of a jointly invariant combination of chains as a sum over double cosets without denominators.

*Method of the formal proof:* equivariance by induction on the length from the equivariance of one lift; the value of a
chain at a point is a sum over the classes at each stage of products of kernels, and joint invariance lets the sum over
the classes be taken once for all members of the combination.

Let `(K_j)` be levels of standard definite spaces `I_{n_j}` over `E`, and `k_j` theta kernels from algebraic forms of
weight `(κ, e_j)` on `U(I_{n_j})` of level `K_j` to forms on `U(I_{n_{j+1}})`, with data spaces `S_j`, actions `ω_j` and
lifts `L_j(Φ)`. The *chain* with data `Φ_0, Φ_1, …` is `C_j(Φ) := L_{j−1}(Φ_{j−1}) ∘ ⋯ ∘ L_0(Φ_0)`, extended linearly to
tensors in `S_{j−1} ⊗ ⋯ ⊗ S_0`; the *double-lift chain* takes data in `S_{2i} ⊗ S_{2i+1}`.

(a) *Equivariance.* Let `a_j` be points of the finite groups. Move the factor `j` of the tensor by `ω_j(a_j, a_{j+1})`
and translate `φ` on the right by `a_0`: the chain of length `m` then gives the right translate by `a_m` of its value on
the original tensor and `φ`. If `ω_i(z_i, z_{i+1}) = 1` for all `i` and the tensor is fixed by `ω_j(1, z_{j+1})` on its factor `j < m`, then
the chain takes the same value at `φ` and at its translate by `z_0`.
(b) *Joint invariance.* A family `(L_x, Φ_x)_{x ∈ s}` (linear maps `L_x` from the Weyl module of stage `m`) is *jointly
invariant* if `Σ_x L_x(β(⊗_j ω_j(a_j, a_{j+1})Φ_{x,j})) = Σ_x L_x(β(⊗_j Φ_{x,j}))` for every linear `β` from the tensors to
the Weyl module and every `(a_j)` with `a_j ∈ K_j` and `a_j = 1` for `j ≥ m`. Suppose the levels are free
(`Γ ∩ gK_jg^{−1} = 1` for all `g` and `j < m`), `φ` has level `K_0`, a property `𝒫_j` of pairs (point, vector) holds for the
values of `φ` and is carried by each jet map of each `Φ_x`, and a set `A` contains `Σ_x L_x(β(⊗Φ_x))` whenever all
`β(⊗Φ_x)` satisfy `𝒫_m` at `p`. Then `Σ_x L_x(C_m(Φ_x)φ(p))` is a sum of `∏_{j<m} |Γ\G_f/K_j|` elements of `A`.

[ShortProof], `New/UpperBound/Objects/LiftChains.lean` (`New.chain`, `New.doubleLiftChain`,
`New.TensorChain.lift_kernelLift_map_omega`, `New.TensorChain.lift_algFormRep_of_map_eq`, `New.chain_equivariant`,
`New.IsJointlyInvariant`, `New.IsJointlyInvariant.sum_chain_mem_nsmul`).

*Needs:* ThetaLiftsForDefiniteUnitaryGroups §1.2.

### 2.10 Free levels and the orders of stabilisers

*Origin:* adapted from Minkowski (1887), the bound for the orders of the finite subgroups of `GL_N(ℤ)` and the absence
of torsion in congruence subgroups: here, for the chosen level of standard definite spaces of rank at most `4n_m` and
the integral levels of rank at most `2n_m`.

*Method of the formal proof:* a nontrivial element of `Γ ∩ gKg^{−1}` would be a matrix of finite order whose
characteristic polynomial has bounded coefficients, of size below the product of the norms of the chosen places above
one level prime, yet `≡ 1` there; for an integral level the stabiliser injects into `𝖦_{rt}` by reduction at the chosen
places.

Let `n` be a finite set and `Γ = U(I_n)(E)`. (a) If `|n| ≤ 4n_m` and `K` is a subgroup of the integral points that reduce
to `1` at the chosen places above one of `p₀`, `p₁`, then `Γ ∩ gKg^{−1} = 1` for every finite `g`; in particular this
holds for every `K ⊂ J_M` when `|n| ≤ 2n_m`, and for `K_0`. (b) If `|n| ≤ 2n_m` and `K ⊂ K°(I_n)`, the order of
`Γ ∩ gKg^{−1}` divides `∏_w |GL_{rt}(𝔽_w)|` (over the chosen places), which is at most `exp(x^{32})`. (c) The chosen
places above `p_i` are `f` in number and the product of the norms of all chosen places is `M^f`.

[ShortProof], `New/UpperBound/Objects/LiftChains.lean` (`New.Data.classAut_eq_bot_of_le_levelOf_chosenPlace`,
`New.Data.classAut_eq_bot_of_le_chosenLevel`, `New.Data.card_classAut_dvd_chosenGroupOrder`,
`New.Data.log_chosenGroupOrder_le`, `New.Data.prod_q_chosenPlace`), `New/UpperBound/Objects/Columns.lean`
(`New.Data.classAut_levelX_zero_eq_bot`).

*Needs:* HermitianFormsAndLattices §5.2; OneSidedPrimeSumBoundsAndAdmissibleData §3.2 (the data), §3.3 (the sizes).

### 2.11 Direct and mirror data modulo `N`, and the operator `Up`

*Origin:* particular to this proof: on ramified vectors, lifts whose data are glued in pairs above `N` become lifts with
direct data after a power of an explicit operator `Up`.

*Method of the formal proof:* the mirror datum is sorted by the last row modulo `N`; each term is a direct datum moved
by an integral matrix with that last row, and the terms whose last entry is not a unit vanish on ramified vectors; the
glued datum is sorted by the last column of the first matrix and gives the number of primitive vectors times a mirror
lift after a direct lift; induction on the number of pairs.

Let `P` hold one place of each conjugate pair above a prime `N` of `E` that splits completely, `F_P = ∏_{w∈P} E_w`,
`𝒪_P` its integers, and reduction `𝒪_P → (ℤ/N)^P`. For index sets `n ⊔ {last}` let `D := diag(1, …, 1, N^{−1})` at `P`,
`ψ_N(c) := ψ(−c/N)` for `c ∈ (ℤ/N)^P` (`c/N` the adele `c_w/N` at `w ∈ P`, `0` elsewhere), and for a vector `y` modulo
`N` with unit last entry let `g_y` be an integral matrix whose last column and last row are `y` modulo `N`. On matrices over
`F_P`: the *direct datum* is the indicator of the integral matrices whose last column is `(0, …, 0, 1)` modulo `N`; the
*mirror datum* is `ψ_N` of the corner entry on integral matrices and `0` elsewhere; `lastCol_y`, `char_y` are the
indicator of integral matrices with last column `y` and `ψ_N(last row·y)` on integral matrices; the *glued datum* of a
pair is `Σ_y lastCol_y ⊗ char_y`. For a representation `π` of `GL_{n⊔{last}}(F_P)`, `Up := π(D)·Σ_y ψ_N(y_last)π(g_y)` over
the `y` with unit last entry. A vector `φ` is *ramified* if for each `w ∈ P` there are a vector `ψ` and an integral unit scalar `x`, with
`x ≡ 1 (mod N)` at every place of `P` other than `w`, such that `φ = ψ − π(x)ψ`. A lift `L(Ψ) : π → π′`, linear in the
datum `Ψ`, *obeys the lift law with factor `γ`* if integral invertible matrices move freely between the datum and the two
representations, and `π′(D)L(Ψ_row)φ = γ·L(direct)(π(D)φ)` with `Ψ_row` the indicator of integral matrices whose last
row is `(0, …, 0, 1)`.

For lifts obeying the lift law and ramified `φ`: (a) `π′(D)L(mirror)φ = Up(L(direct)φ) = γ·L(direct)(Up φ)`, so `Up`
passes through a direct lift at the cost `γ`, and direct lifts keep ramified vectors ramified. (b) For two lifts `L`,
`L′`, `π″(D)·Σ_y L′(char_y)L(lastCol_y)φ = (#prim·γ′γ)·L′(direct)L(direct)(Up φ)`, `#prim` the number of vectors modulo `N`
that are nonzero at every place of `P`. (c) For a chain of lifts `L_j` obeying the lift law with factors `γ_j` and glued
double lifts `G_i := d_i·π(D)∘Σ_y L_{2i+1}(char_y)∘L_{2i}(lastCol_y)`, the composite of the first `p` glued double lifts
takes `φ` to `∏_{i<p}(d_i·#prim_i·∏_{l<2i+2}γ_l)` times the composite of the first `2p` direct lifts applied to `Up^p φ`.

[ShortProof], `New/UpperBound/Objects/LiftLawsModuloN.lean` (`New.IsSplitLevel`, `New.IsSplitLevel.upOperator`,
`New.IsSplitLevel.LiftLaw`, `New.IsSplitLevel.LiftLaw.upOperator_direct`,
`New.IsSplitLevel.LiftLaw.glued_eq_direct_direct_upOperator`, `New.IsSplitLevel.compUpTo_gluedLift_eq_smul`).

*Needs:* none beyond the Conventions.

### 2.12 Chain data, the glued tensor and the composite lift

*Origin:* definitions and conventions; the lemma is particular to this proof.

*Method of the formal proof:* definitions; the restriction is the branching map composed with restriction to
`diag(h, 1)`, which lands in the algebraic forms of weight `μ(Y_m)` by 2.2 (d).

*Definitions.* Let `ϑ` be a twist.
- `𝔗` is the set of *translations* `x = (x_j)_{j≥0}`, `x_j` an `X_{j+1} × X_j` matrix of finite adeles;
  `v_j(x) := ϱ_f(x_j)vac°` on `Hom(X_j, X_{j+1})`. `x` is *admissible for* `q` if every `π̄_M x_j` is integral at the
  places not dividing `q`; it is *supported at* `q′` if every `x_j` vanishes at the places not dividing `q′`.
- *Gluing.* For the double lift `X_{2i} → X_{2i+1} → X_{2i+2}`, `Glue_i(v ⊗ v′) := Σ_y ϱ_f(P_y)v ⊗ ϱ_f(R_y)v′`, the sum over
  `y ∈ ((ℤ/N)^{P_N})^{X_{2i+1}}`, where `P_y` has last column `−y/N` at the places of `P_N` (zero elsewhere) and `R_y` has
  last row `−ȳ/N` at their conjugates. The *glued vacuum* of `x` is `⊗_{i ≤ ϱ} Glue_i(v_{2i}(x) ⊗ v_{2i+1}(x))`, and for
  `Ψ : 𝔗 → ℂ` finitely supported the *glued tensor* is `Glue(Ψ) := Σ_x Ψ(x)·(glued vacuum of x)`; the plain tensor is
  `Σ_x Ψ(x)·⊗_j v_j(x)`.
- A tensor `w` of data for the double lifts is *jointly invariant for* `ϑ` if it is fixed by `⊗_i ω(b_{2i}, b_{2i+1}) ⊗
  ω(b_{2i+1}, b_{2i+2})` for every `(b_j)` with `b_j ∈ K_j` and `b_m = 1`.
- `Ψ` is a *chain datum for* `ϑ` if its support consists of translations admissible for `q_ϑ` and supported at `Mq_ϑ`,
  its values are integral away from `q_ϑ`, `Σ_x |σ(Ψ(x))| ≤ M^{3fmn_m²}` for every automorphism `σ` of `ℂ` if
  `Q(ϑ) = ∅`, and `Glue(Ψ)` is jointly invariant for `ϑ`. `Ψ` is a *weak chain datum* if its support consists of
  translations admissible for `q_ϑ N`, its values are integral away from `q_ϑ`, it has size at most `exp(x^{60})` if
  `Q(ϑ) = ∅`, and its plain tensor is jointly invariant.
- The *restriction* `res : 𝒜_m → (algebraic forms on U(Y_m) of weight μ(Y_m))` is
  `res(ψ)(h) := ∏_τ τ(π̄_N)^{−n_τ}·br(ψ(diag(h, 1)))`.
- The *composite lift* is `comp_ϑ(Ψ)(φ) := res(C_m(Glue(Ψ))φ)` for `φ ∈ 𝒮_X`, the double-lift chain of the `L_j^ϑ` with the
  tensor `Glue(Ψ)` followed by restriction; the *restricted chain* of a plain `Ψ` is `res∘Σ_x Ψ(x)C_m(⊗_j v_j(x))`.

*Lemma.* `res` is well defined: it carries algebraic forms of weight `μ(X_m)` to algebraic forms of weight `μ(Y_m)`.

[ShortProof], `New/UpperBound/Objects/Columns.lean` (`New.Data.Translations`, `New.Data.translateDatum`,
`New.Data.admissibleTranslations`, `New.Data.supportedTranslations`, `New.Data.gluedDoubleLiftDatum`,
`New.Seesaw.doubleLiftGluing`, `New.Data.gluedVacuum`, `New.Data.gluedTensor`, `New.Data.plainTensor`,
`New.Data.ChainTensor.IsInvariant`, `New.Data.IsChainDatum`, `New.Data.IsWeakChainDatum`, `New.Data.restrictToY`,
`New.Data.compositeLift`, `New.Data.restrictedChain`).

*Needs:* 1.1, 2.2, 2.6, 2.8, 2.9.

### 2.13 The glued datum in a Schrödinger model at `N`

*Origin:* particular to this proof: the gluing of a double lift, read in the Schrödinger model at any set of places
above `N`, is the glued datum of 2.11 with no constant.

*Method of the formal proof:* the translates of the indicators of integral matrices by the pole column and the pole row
are multiplied and summed over the residues; exactly one residue class makes both translates integral, and the product
is `ψ_N` of the corner entry.

Let `P`, `S` each hold one place of every conjugate pair above `N`, all split of degree one. Let `v`, `v′` be finite data
of `Hom(I_{n⊔{last}}, I_{n′})` and `Hom(I_{n′}, I_{m′⊔{last}})`, averaged over the Heisenberg operators of the integral
vectors supported above `N`. Then `Glue(v ⊗ v′)` (the gluing of 2.12 with residues at `S`) is, in the Schrödinger model
at `P`, the sum over `z ∈ ((ℤ/N)^P)^{n′}` of `lastCol_z ⊗ char_z` evaluated at `T·diag(1, …, 1, N)_{P∩S}` and
`diag(1, …, 1, N)_{P∖S}·R`, applied to `v ⊗ v′`. Equivalently, the product of the translates of the indicators of the
matrices integral at `P` by the pole column and the pole row, summed over the residues, is `ψ_N` of the residue of the
corner entry of `R′T′` (`T′ = T·diag(1, …, 1, N)_{P∩S}`, `R′ = diag(1, …, 1, N)_{P∖S}·R`) when `T′`, `R′` are integral at
`P`, and `0` otherwise.

[ShortProof], `New/UpperBound/Objects/Columns.lean` (`New.IsSplitLevel.sum_translate_eq_gluedDatum`,
`New.IsSplitLevel.doubleLiftGluing_eq_sum_schrodingerOpAt`, `New.IsSplitLevel.pairWeilFinite_schrodingerOpAt`).

*Needs:* 2.11, 2.12; WeilRepresentationsOnBanachSpacesOfData §§2.1, 3.1, 3.4, 3.6, 5.6, 6.1 (the Weil representation in the realisation used: for Weil data of `E`, which include a primitive root of unity of order `5040` in `E`, and spaces `V`, `V′`, the representation `ω_{a,b}(g, h) = a(det h)·b(det g)⁻¹·ω(x ↦ hxg⁻¹)` of `U(V)(𝔸) × U(V′)(𝔸)` by continuous operators on the data space `𝒮(Hom(V, V′))`, with its Heisenberg action `ϱ`, the vacuum, the finite part, which is the span of the finite Heisenberg translates of the vacuum, the Fock vector `v_P` of a polynomial `P` at the real places and the datum `v_P ⊗ f = ∫ v_P(y)·ϱ(y)f dy`; the theta functional `θ` is a continuous functional on the data space that is invariant under the Heisenberg operators of the rational vectors and under the rational points of the unitary group, with the mean of `|θ(ϱ(x)vac)|²` over the adelic vectors modulo the rational vectors equal to `1`; the theta kernel of a datum `f` is `(g, h) ↦ θ(ω_{a,b}(g, h)f)`).

### 2.14 The lifts above `N` and the ramified source forms

*Origin:* particular to this proof: the characters of the lifts are unramified above `N`, so scalings at the places of
`P_N` commute with every lift, and a chain whose data at one lift are fixed by a scaling kills the ramified source forms.

*Method of the formal proof:* the characters of the lifts have tame parts supported at the level places, which lie off
`N`; the pair of scalings `(z, z)` acts trivially on the data through the determinant characters; a ramified form is a
difference `ψ − z_wψ` because `z_w` has order dividing `N − 1` on source forms.

Let `ϑ` be a tame character, `j ≥ 0` and `w ∈ P_N`. (a) The base change of `(ν_j^ϑ)_n` is unramified at every place above
`N`, and for `|n| = n_j` (even) the character attached by the Weil data to a space of rank `n_j` and `(ν_i^ϑ)_n` is the base
change `x ↦ ν_i^ϑ(x/x̄)`. (b) For a scaling `z` at `w` (2.8), `ω(z, z) = 1` on the data of `L_j^ϑ`, so
`L_j^ϑ(Φ)(zψ) = z·L_j^ϑ(Φ)ψ`; if `Φ` is fixed by `ω(1, z)`, then `L_j^ϑ(Φ)(ψ − zψ) = 0`. (c) If a tensor of data of the
first `m` lifts is fixed, on one factor `j < m`, by `ω(1, z_w)`, then the chain with these data vanishes on `𝒮_X^{ram}`.

[ShortProof], `New/UpperBound/Objects/CharactersAtLevel.lean` (`New.Data.charUnramifiedAt_rankTwist_of_N_mem`,
`New.Data.spaceChar_rankTwist`, `New.Data.liftKernel_omega_scaling`, `New.Data.liftKernel_lift_scaling`,
`New.Data.liftKernel_lift_sub_scaling_eq_zero`, `New.Data.tensorChainLift_sub_scaling_eq_zero`,
`New.Data.tensorChainLift_eq_zero_of_ramified`).

*Needs:* 2.8, 2.9; OneSidedPrimeSumBoundsAndAdmissibleData §3.4 (the twists and the characters `μ_j⁰`).

### 2.15 The lower chain: level, character and `𝖦`-equivariance

*Origin:* particular to this proof: the chain `Θ_ϑ` of the `m` lifts along the `Y_j`, its level and character on
`Y_m`, and its commutation with `𝖦`.

*Method of the formal proof:* the datum of each lift is the indicator of the inclusion matrix modulo the level places;
block upper triangular elements move it by the tame characters of the diagonal blocks, which gives the level and the
character by induction on `j`; an element of `𝖦` acts on the first block only.

*Definitions.* Let `ϑ` be a tame character and `j < m`. `𝒜_Y(j)` is the space of forms on `U(Y_j)` of type `l_Y(j)` (2.4)
for the signs of `Y_j`. The datum of lift `j + 1` is `Φ_j^ϑ := v_{H_j} ⊗ Υ_{j+1}`, where `v_{H_j}` is the Fock vector of the
product over `τ` of the joint harmonic polynomials for `l_Y(j)`, `l_Y(j + 1)` and the weights of 2.4, and `Υ_{j+1}` is, at
the level places, the indicator of the inclusion matrix `Y_j ↪ Y_{j+1}` modulo the product of the level places and, at the
other finite places, the vacuum. The lift `ι_{j+1}^ϑ : 𝒜_Y(j) → 𝒜_Y(j + 1)` is `[K° : J_ϑ(Y_j)]` times the theta lift with
datum `Φ_j^ϑ` for the characters `(ν_{j+1}^ϑ)_{Y_j}`, `(ν_{j+1}^ϑ)_{Y_{j+1}}`:
`ι_{j+1}^ϑ(f)(h) = [K° : J_ϑ(Y_j)]·∫_{[U(Y_j)]} θ(ω(g, h)Φ_j^ϑ)f(g) dg`. The *lower chain* `Θ_ϑ : 𝒜(Y_0) → (algebraic forms
on U(Y_m) of weight μ(Y_m))` is `ι_m^ϑ ∘ ⋯ ∘ ι_1^ϑ` read as algebraic forms (2.2 (b)).

*Lemma.* (a) For `j < m`, `Φ_j^ϑ` is an edge: `ι_{j+1}^ϑ` maps forms of type `l_Y(j)` to forms of type `l_Y(j + 1)`, and the
transposed lift maps forms of the conjugate type back. (b) If `k ∈ K°(U(Y_j))`, `k′ ∈ K°(U(Y_{j+1}))` have reductions
`g`, `g′` at the level places with `g′ι = ιg` (`ι` the inclusion matrix), then `ω((1, k), (1, k′))Υ_{j+1} =
∏_w ψ_{j+1}^ϑ(det g′_w)/ψ_{j+1}^ϑ(det g_w)·Υ_{j+1}`; in particular `J_ϑ(Y_j)` fixes the datum. (c) For `y ∈ 𝒜(Y_0)`,
`Θ_ϑ(y)` has level `J_m^ϑ` with character `χ_m^ϑ`; more generally, for `k ∈ K°(Y_m)` with block upper triangular
reductions at the level places whose first block at the chosen places is `s ∈ 𝖦`, `k·Θ_ϑ(y) = c·Θ_ϑ(s·y)` with `c` the
product over the level places and `l < m` of `ψ_{l+1}^ϑ` at the determinant of the diagonal block `l + 1`. (d) For
`s ∈ 𝖦` there is an element of `K°(Y_m)`, with reduction `diag(s, 1)` at the chosen places and `1` at `Q(ϑ)`, whose right
translation takes `Θ_ϑ(y)` to `Θ_ϑ(s·y)`.

[ShortProof], `New/UpperBound/Objects/RowChain.lean` (`New.Data.FormY`, `New.Data.harmonicY`, `New.Data.datumY`,
`New.Data.liftY`, `New.Data.lowerChainUpTo`, `New.Data.lowerChain`, `New.Data.isArrow_datumY`,
`New.Data.lowerChain_mem_levelSpace`, `New.Data.algFormRep_lowerChain`, `New.Data.lowerChain_principalRep`),
`New/UpperBound/Objects/Rows.lean` (`New.Data.pointDatumY`, `New.Data.thetaKernelY_omega_pointDatumY_eq_smul`).

*Needs:* 2.1, 2.2, 2.4, 2.5, 2.6, 2.7; HolomorphicDiscreteSeriesOfUnitaryGroups §8.2, WeilRepresentationsOnBanachSpacesOfData §§7.2, 7.3 (theta lifts between discrete-series types: an edge from a type `e` to a type `e′`, for the real Weil representation `Ω` of weights `γ`, `γ′`, is a Fock vector `Φ` such that `e` is a cusp kernel of order `0`, the zeta integral `∫⟨Φ, Ω(x, 1)Φ⟩·conj(e(x))/e(1) dx` is not zero, the lift with a datum `Φ ⊗ f` of a form of type `e` is a form of type `e′` as soon as it has a level, and the lift with the Fock vector of any polynomial is the convolution of the lift with `Φ` with one continuous function of compact support on the real group, and such that the same four properties hold with the two groups exchanged, from the conjugate of `e′` to the conjugate of `e`; if two families of parameters satisfy the block rule at every infinite place, a chosen product over the infinite places of joint harmonic polynomials is an edge between their types; for an edge `Φ`, characters `a`, `b` of weights `γ`, `γ′` and a datum `f` in the finite part, the lift with `Φ ⊗ f` carries forms of type `e` to forms of type `e′`, the transposed lift carries forms of the conjugate type of `e′` to forms of the conjugate type of `e`, and the descent, the conjugate of the transposed lift of the conjugate, carries forms of type `e′` to forms of type `e`; the block rule is kept by exchanging the two spaces, by negating both parameters and the signs of the first space with `(γ, γ′)` replaced by `(n − γ, n′ − γ′)`, by reversing all signs on both spaces, and by raising `γ`, `γ′` by integers `u`, `u′` while adding `u′` to the first parameter and `u` to the second);
WeilRepresentationsOnBanachSpacesOfData §§2.1, 3.1, 3.4, 3.6, 5.6, 6.1 (the Weil representation in the realisation used: for Weil data of `E`, which include a primitive root of unity of order `5040` in `E`, and spaces `V`, `V′`, the representation `ω_{a,b}(g, h) = a(det h)·b(det g)⁻¹·ω(x ↦ hxg⁻¹)` of `U(V)(𝔸) × U(V′)(𝔸)` by continuous operators on the data space `𝒮(Hom(V, V′))`, with its Heisenberg action `ϱ`, the vacuum, the finite part, which is the span of the finite Heisenberg translates of the vacuum, the Fock vector `v_P` of a polynomial `P` at the real places and the datum `v_P ⊗ f = ∫ v_P(y)·ϱ(y)f dy`; the theta functional `θ` is a continuous functional on the data space that is invariant under the Heisenberg operators of the rational vectors and under the rational points of the unitary group, with the mean of `|θ(ϱ(x)vac)|²` over the adelic vectors modulo the rational vectors equal to `1`; the theta kernel of a datum `f` is `(g, h) ↦ θ(ω_{a,b}(g, h)f)`).

### 2.16 Descent pairs

*Origin:* definitions and conventions.

*Method of the formal proof:* definitions.

A *descent pair* consists of: level places, namely finitely many chosen places and twist places of `E`, pairwise
distinct and none conjugate to another; a space `W` of rank `r` (finite set `r`) with signs `ε` and a numbering of its basis; an
embedding `r ↪ n` into the basis of `V := I_n` with `|r| < |n|`; column counts `k^+(τ, i)`, `k^-(τ, i)`; and a character `μ`
of `U(1)(𝔸)/U(1)(F)` with weight `e_μ` and tame part `(ψ_w)` trivial off the level places. Attached to it:
- the *level* `K_O ⊂ K°(V)`: elements whose reductions fix the basis vectors of `r` at the chosen places and preserve the
  span of the other basis vectors at the twist places, with the character `k ↦ ∏_{w twist} ψ_w^{−1}(det k_{w,00})` (block
  `00` on the basis vectors of `r`);
- the forms on `V`: algebraic forms of weight `(c_O, e_O)`, `c_O(τ, i) = k^+(τ, i) + k^-(τ, n − i)`,
  `e_O(τ) = −Σ_{1≤i<|n|} k^-(τ, i)`, of level `K_O` with this character; the doubled parameter `l_O` of this weight;
- the characters `ν_W := υ^{r_-}` (`r_-` the number of signs `−1` of `W`) and `ν_V := μ_n`, and the theta kernel of
  `(W, V)` with these characters;
- the *block datum* `Ψ_bl ⊗ vac` on `Hom(W, V)`: at the level places, the function of the reductions equal to
  `∏_{w twist} ψ_w(det of the rows of r)` if the reductions at the chosen places are the inclusion matrix, else `0`; the
  vacuum elsewhere;
- the *normalised descent* of a form `Ξ` on `V`: `g ↦ Σ_h (class sum over K_O) conj θ(ω(g, (1, h))(v_{P_ξ̄} ⊗ Ψ_bl ⊗ vac))`
  applied to `Ξ(h)`, where `P_ξ` is the Fock polynomial of the vector `ξ` of the Weyl module;
- the Hecke polynomial of a lift at split `w` off the level places:
  `∏_{l<|n|−|r|}(1 − q^l ν T)·H_{z(w)}(q^{|n|−|r|}νT/ν′)`, with `H_{z(w)}` the Hecke polynomial of rank `|r|` of the
  eigenvalues `z(w)` and `ν`, `ν′` the Frobenius values of `ν_W`, `ν_V`.
A doubled parameter `l` on `W` *fits* the pair if `l` and `l_O` correspond for the weights `r_-` and `⌊|n|/2⌋ + e_μ`, the
numbering lists the basis vectors of each sign by decreasing `±l`, and `k^±(τ, i) = 0` for `i` above the number of signs
`±1` of `W`.

[ShortProof], `New/UpperBound/Objects/AuxiliaryPair.lean` (`New.DescentPair`, `New.DescentPair.levelGroup`,
`New.DescentPair.FormV`, `New.DescentPair.blockDatum`, `New.DescentPair.normalizedDescent`,
`New.DescentPair.HasLiftHeckePolynomial`, `New.DescentPair.paramV`, `New.DescentPair.FitsParams`).

*Needs:* AdelicUnitaryGroupsAndAlgebraicModularForms §3.9 (the subgroups `K(w, H)` of the stabiliser of the lattice defined by reductions at finitely many places, no two equal or conjugate and none conjugate to itself, and the principal levels: `K(w, H)` is open and its index in the stabiliser is the index of `H` in `∏_i GL_n(𝔽_{w_i})`; the principal level of an integer `a ≠ 0` of `E` is open, of index at most `N(a)^{n²}`); WeilRepresentationsOnBanachSpacesOfData §§2.1, 3.1, 3.4, 3.6, 5.6, 6.1 (the Weil representation in the realisation used: for Weil data of `E`, which include a primitive root of unity of order `5040` in `E`, and spaces `V`, `V′`, the representation `ω_{a,b}(g, h) = a(det h)·b(det g)⁻¹·ω(x ↦ hxg⁻¹)` of `U(V)(𝔸) × U(V′)(𝔸)` by continuous operators on the data space `𝒮(Hom(V, V′))`, with its Heisenberg action `ϱ`, the vacuum, the finite part, which is the span of the finite Heisenberg translates of the vacuum, the Fock vector `v_P` of a polynomial `P` at the real places and the datum `v_P ⊗ f = ∫ v_P(y)·ϱ(y)f dy`; the theta functional `θ` is a continuous functional on the data space that is invariant under the Heisenberg operators of the rational vectors and under the rational points of the unitary group, with the mean of `|θ(ϱ(x)vac)|²` over the adelic vectors modulo the rational vectors equal to `1`; the theta kernel of a datum `f` is `(g, h) ↦ θ(ω_{a,b}(g, h)f)`).

### 2.17 The block datum, the edge and the descent of a descent pair

*Origin:* adapted from Li (1990): the theta lift of a discrete series whose parameter has a large gap, through its
joint harmonic: here, the polynomial of the highest vector of a fitting descent pair is a product of joint harmonics and
an edge; with Gross (1999) for the descent as a class sum.

*Method of the formal proof:* the block datum is expanded over the elements of `∏_{w twist} GL(𝔽_w)`; the polynomial of
the highest vector is a staircase of minors, which is jointly highest and harmonic; the class sum is rewritten as an
integral over `[U(V)]` against the conjugate kernel.

Let `O` be a descent pair. (a) `Ψ_bl ⊗ vac = Σ_A ω((1, a_A), 1)(Ψ¹ ⊗ vac)`, the sum over `A ∈ ∏_{w twist} GL_r(𝔽_w)`, with
`a_A ∈ K°(W)` a lift of `A^{−1}` and `Ψ¹` the indicator of the matrices that reduce to the inclusion matrix at the chosen
places and whose rows in `r` reduce to `1` at the twist places. (b) If `k ∈ K°(W)`, `k′ ∈ K°(V)` and the reductions of `k′`
are `diag(reductions of k at the chosen places, 1)` times an element `j` of the residue level, then
`ω(k, k′)(Ψ_bl ⊗ vac) = (∏_{w chosen} ψ_w(det k_w))^{−1}·χ_O(j)·(Ψ_bl ⊗ vac)`. (c) If `W` has positive rank and `l` fits `O`,
the Fock vector of the polynomial of the highest vector of `l_O` is an edge from the type of `l` (signs `ε`) to the type of
`l_O` on the definite `V`. (d) The normalised descent of `Ξ` is `dim V_{(c_O,e_O)}·[K° : K_O]` times the complex conjugate of
the transposed lift, from `V` to `W`, of the conjugate of the automorphic form of `Ξ`, with the datum
`v_{P_{v⁺}} ⊗ Ψ_bl ⊗ vac` of the highest vector `v⁺`.

[ShortProof], `New/UpperBound/Objects/AuxiliaryPair.lean` (`New.DescentPair.blockDatum_eq_sum_modDatum`,
`New.DescentPair.omega_blockDatum_eq_smul`, `New.DescentPair.FitsParams.isEdge`,
`New.DescentPair.FitsParams.exists_isJointHarmonic`, `New.DescentPair.normalizedDescent_eq_smul_star_lift_swap`).

*Needs:* 2.16; ThetaLiftsForDefiniteUnitaryGroups §1.2; HolomorphicDiscreteSeriesOfUnitaryGroups §8.2, WeilRepresentationsOnBanachSpacesOfData §§7.2, 7.3 (theta lifts between discrete-series types: an edge from a type `e` to a type `e′`, for the real Weil representation `Ω` of weights `γ`, `γ′`, is a Fock vector `Φ` such that `e` is a cusp kernel of order `0`, the zeta integral `∫⟨Φ, Ω(x, 1)Φ⟩·conj(e(x))/e(1) dx` is not zero, the lift with a datum `Φ ⊗ f` of a form of type `e` is a form of type `e′` as soon as it has a level, and the lift with the Fock vector of any polynomial is the convolution of the lift with `Φ` with one continuous function of compact support on the real group, and such that the same four properties hold with the two groups exchanged, from the conjugate of `e′` to the conjugate of `e`; if two families of parameters satisfy the block rule at every infinite place, a chosen product over the infinite places of joint harmonic polynomials is an edge between their types; for an edge `Φ`, characters `a`, `b` of weights `γ`, `γ′` and a datum `f` in the finite part, the lift with `Φ ⊗ f` carries forms of type `e` to forms of type `e′`, the transposed lift carries forms of the conjugate type of `e′` to forms of the conjugate type of `e`, and the descent, the conjugate of the transposed lift of the conjugate, carries forms of type `e′` to forms of type `e`; the block rule is kept by exchanging the two spaces, by negating both parameters and the signs of the first space with `(γ, γ′)` replaced by `(n − γ, n′ − γ′)`, by reversing all signs on both spaces, and by raising `γ`, `γ′` by integers `u`, `u′` while adding `u′` to the first parameter and `u` to the second).

### 2.18 The descent pairs of the chain

*Origin:* particular to this proof: the `m` descent pairs `(W_j, V_j)` of a twist, and the fit of the target parameter.

*Method of the formal proof:* the parameter `l_O` of the `j`-th pair is the parameter of a centre system with one more
block, centred at `−κ_j`, than `2ς` on `W_j`, so 2.3 gives the correspondence; the numbering and the vanishing of the
column counts are read off the staircase.

For a tame character `ϑ` and `1 ≤ j ≤ m`, the *`j`-th descent pair* has the level places of `ϑ` (2.6), `W = W_j`,
`V = V_j = I_{r+t}` with `W_j` on the first summand, the numbering by the fixed numbering of the basis of `Y_0` on the signs
`+1` and the reverse numbering on the signs `−1`, `k^+(τ, i) = max(0, ς_{i−1}(τ) − max(ς_i(τ), (t − 1)/2 − κ_j(τ)) − 1)`,
`k^-(τ, i) = max(0, min(ς_{r−i−1}(τ), −κ_j(τ) − (t − 1)/2) − ς_{r−i}(τ) − 1)`, and the character `μ_j⁰ϑ` of weight `−κ_j`.
Then `2ς` fits this pair: `2ς` (signs of `W_j`) and `l_O` correspond for the weights `m − j` and `⌊(r + t)/2⌋ − κ_j`.

[ShortProof], `New/UpperBound/Objects/Rows.lean` (`New.Data.descentPair`, `New.Data.paramsCorrespond_descentPair`,
`New.Data.fitsParams_descentPair`).

*Needs:* 2.3, 2.4, 2.16; OneSidedPrimeSumBoundsAndAdmissibleData §3.4 (the twists and the characters `μ_j⁰`).

### 2.19 The Poincaré map

*Origin:* adapted from Poincaré series of integrable functions (Petersson (1930); Godement (1958), §4, Théorèmes 5 and
5 bis): here, the Poincaré map on source forms is defined as the Riesz representative of a Bessel period on the
finite-dimensional space of forms of principal level, and the defining identity is unfolded against forms of any level.

*Method of the formal proof:* the Bessel period is a conjugate-linear form on `𝒜(Y_0)`, finite-dimensional by 2.7, and
`𝒫φ` is its Riesz vector; against a form of level `J` the identity follows by summing the translates over `J_M/(J ∩ J_M)`.

Let `Y_0` carry the grading of 3.7 (`X_0` and a string of `m − 1` vectors) with Bessel subgroup `R_0`. For a source form
`φ`, a linear form `t` on `V_{μ(X_0)}` and `u h ∈ R_0(𝔸)` (`u` unipotent, `h ∈ inc_X(U(X_0)(𝔸))`), let
`𝒲_φ(uh) := ψ_U(u)·t(ρ_{μ(X_0)}(h_∞)^{−1}φ(h_f))`; it is continuous, left invariant under `R_0(F)` and transforms by `ψ_U`.
For an archimedean point `g` of `U(Y_0)`, the *Poincaré map* `𝒫 = 𝒫_{g,t} : 𝒮_X → 𝒜(Y_0)` is the linear map with

`⟨y, 𝒫φ⟩ = ∫_{[R_0]} 𝒲_φ(r)·conj y(r g) dr` for all `y ∈ 𝒜(Y_0)`

(Petersson product conjugate-linear in the first variable; a fixed Haar measure on `R_0(𝔸)`). (a) `𝒫` exists and is unique;
`𝒫_{g,ct} = c·𝒫_{g,t}`. (b) For a form `z` of the conjugate type on `U(Y_0)`, right invariant under a level `J`:
`[J_M : J ∩ J_M]·∫_{[U(Y_0)]} z·𝒫φ = Σ_γ ∫_{[R_0]} 𝒲_φ(r)z(r g γ) dr`, over representatives `γ` of `J_M/(J ∩ J_M)`.

[ShortProof], `New/UpperBound/Objects/PoincareMap.lean` (`New.Data.besselPeriod`, `New.Data.poincareAt`,
`New.Data.inner_poincareAt`, `New.Data.poincareAt_smul`, `New.Data.integral_mul_poincareAt`,
`New.Data.isEquivariant_sourceFn`).

*Needs:* 2.7, 2.8, 3.7; WeilRepresentationsOnBanachSpacesOfData §§8.1, 8.2, 8.5, 8.6 (graded spaces `X ⊕ string` and their Bessel subgroups: a grading of `V` presents its basis as `X` and a string of `s` vectors such that the Gram matrix is `1` on `X` and pairs the string vector `i` only with the string vector `s − 1 − i`, to `1`, or to `−N` for the middle vector, with `N = N̄ ≠ 0`, together with a constant `c = c̄ ≠ 0`; the Bessel subgroup `R` consists of the `g` whose matrix in rational coordinates sends each string vector of grade at least `0` to itself plus string vectors of higher grade; the rational points are cocompact in `R(𝔸)`, so that the Haar measure of `R(𝔸)` is right invariant and gives `[R]` a finite measure; the lattice of a finite point `x` consists of the vectors whose coordinates in the frame of `x` are integral, `Λ_x⁻` is its intersection with `X^⊥` and `Λ_x⁺` its projection to `X^⊥`; `ψ_U(u) = ψ(½ȷ tr(𝔢u))` for the shift `𝔢` of the grading; and the function `𝒲_φ` on `R(𝔸)` of an algebraic form `φ` on `U(I_X)` and a linear form `t` on its values satisfies `𝒲_φ(u·inc_X(a)) = ψ_U(u)·t(ρ(a_∞⁻¹)φ(a_f))` for `u` in the unipotent subgroup and `a ∈ U(I_X)(𝔸)`).

## Layer 3: The seesaw identity

The pairing of `Θ_ϑ(𝒫φ)` with a form on `Y_m` is moved down the lower chain by transposing the lifts one at a time;
each transposed lift is unfolded against the Bessel function of the previous stage. Two steps of unfolding turn a pair of
lifts `Y_{2i} → Y_{2i+1} → Y_{2i+2}` into a pair of lifts `X_{2i} → X_{2i+1} → X_{2i+2}` with the finite evaluation of the
data, a zero term along an isotropic frame. Each outer integral over a finite group modulo a level becomes a weighted sum
over a finite cut whose multiplicities divide powers of `q_ϑ`, because the unfolded functions are supported on points whose
graded lattices are sandwiched between powers of `Q(ϑ)` times the standard ones. The evaluated data are admissible
combinations of glued translates of the vacuum, with denominators prime to the modulus; at the top, Schur orthogonality on the
compact group `U(Y_m)(F_∞)` reduces the integral over `[U(Y_m)]` to a fixed multiple of a Petersson product (3.17).

### 3.1 Integrals over a quotient as weighted sums over a cut

*Origin:* adapted from Gross (1999): the class set of a group compact at infinity, with the weights `|Γ_𝒸|^{−1}`: here,
the integral over the quotient of an adelic unitary group by the rational points of a Bessel subgroup of a function
whose periods factor over a finite set of cosets, as a constant times a sum weighted by inverse cover multiplicities.

*Method of the formal proof:* the cut is built from finitely many representatives of the orbits meeting a compact set;
the multiplicity at a point of the cut is the index of a stabiliser, which divides a power of `q` because `q`-power
powers of the conjugates of the level fall into the larger level; the integral is computed with a weight whose orbit
integrals are `1` on the support.

Let `S`, `A`, `J` be subgroups of the finite unitary group `G_f` of a space with `J ⊂ A` levels, and `T` a finite set of
cosets of `J`. The *cover multiplicity* `mult(t)` of a coset `t` is the number of classes of `r ∈ S` modulo `S ∩ A` with
`r^{−1}t ∈ T`, and `mult(t) := 0` if there are infinitely many. (a) It is constant on `S`-orbits. (b) If `D` is compact, every `x ∈ D` lies in a subgroup
`B ⊃ A` and has `n` with `(xux^{−1})^{q^n} ∈ A` for all `u ∈ J`, and a property `W` forces the `S`-orbit of a point to meet
`D`, then there is a finite `T` stable under `S ∩ A`, inside `B`, with `mult(x)` dividing a power of `q` whenever `xJ ∈ T`
or `W(x)`. (c) Let `Y` be a grading with Bessel subgroup `R`, finite part `R_f`, `A` a level and `a` a function on the
archimedean group. There is `κ ∈ ℂ` such that for every level `J`, every finite `T` stable under `R_f ∩ A`, every continuous
`f` on `U(V)(𝔸)` left invariant under `R(F)`, integrable on `R(F)\U(V)(𝔸)`, with `mult(g_f) ≠ 0` wherever `f(g) ≠ 0`, and
every `b` on cosets of `J` with `∫_{[R]} f(r t) dr = [K° : J]·a(t_∞)b(t_f)` whenever `t_f J ∈ T`:
`∫_{R(F)\U(V)(𝔸)} f = κ·Σ_{t∈T} mult(t)^{−1}·b(t)`.

[ShortProof], `New/UpperBound/Seesaw/IntegralAsCosetSum.lean` (`New.Seesaw.coverMultiplicity`,
`New.Seesaw.coverMultiplicity_smul`, `New.Seesaw.exists_finset_coverMultiplicity_dvd_pow`,
`New.Grading.exists_integral_eq_sum_over_cut`).

*Needs:* WeilRepresentationsOnBanachSpacesOfData §§8.1, 8.2, 8.5, 8.6 (graded spaces `X ⊕ string` and their Bessel subgroups: a grading of `V` presents its basis as `X` and a string of `s` vectors such that the Gram matrix is `1` on `X` and pairs the string vector `i` only with the string vector `s − 1 − i`, to `1`, or to `−N` for the middle vector, with `N = N̄ ≠ 0`, together with a constant `c = c̄ ≠ 0`; the Bessel subgroup `R` consists of the `g` whose matrix in rational coordinates sends each string vector of grade at least `0` to itself plus string vectors of higher grade; the rational points are cocompact in `R(𝔸)`, so that the Haar measure of `R(𝔸)` is right invariant and gives `[R]` a finite measure; the lattice of a finite point `x` consists of the vectors whose coordinates in the frame of `x` are integral, `Λ_x⁻` is its intersection with `X^⊥` and `Λ_x⁺` its projection to `X^⊥`; `ψ_U(u) = ψ(½ȷ tr(𝔢u))` for the shift `𝔢` of the grading; and the function `𝒲_φ` on `R(𝔸)` of an algebraic form `φ` on `U(I_X)` and a linear form `t` on its values satisfies `𝒲_φ(u·inc_X(a)) = ψ_U(u)·t(ρ(a_∞⁻¹)φ(a_f))` for `u` in the unipotent subgroup and `a ∈ U(I_X)(𝔸)`).

### 3.2 Glued lattices of graded spaces

*Origin:* definitions and conventions; the lemma is elementary.

*Method of the formal proof:* matrix computation.

Let `V` be graded by `X ⊔ {last}` and a string of length `s`, with `N ∈ E`. For a unit `a`, a unit `π` with `N = ππ̄`
and a norm-one `u` (finite adeles), the *glued basis* is: the vectors of `X` unchanged; for odd `s`, every string vector
times `u` and the last vector `y` replaced by `y/π̄ + uz/(ππ̄)`, `z` the middle string vector; for even `s`, the first half
of the string times `ua^{−1}` and the second half times `uā`. The *glued lattice* is its `Ô`-span, and `V` *spans the glued
lattice* if its lattice is this one. `N` is *split squarefree* along a finite set `P` of places containing no conjugate
pair if `N = ππ̄` with `π` a uniformiser at `P` and a unit elsewhere. The *string frame* has column `b` equal to
`(σ_b e_b + e_{s−1−b})/√2`, or `e_b/√N` at the middle, with `σ_b = −1` for the first `⌊(s + 1)/2⌋` indices.

*Lemma.* (a) The Gram matrix of the glued basis is the graded Gram matrix with the last vector of norm `0` paired to `−1`
with the middle vector (for odd `s`); it is unimodular over every subring of the finite adeles. (b) If exactly
`⌊(s + 1)/2⌋` signs are `−1`, the graded Gram matrix (with `N > 0`) is carried to `diag(ε)` by a complex matrix, unitary if
`N = 1`.

[ShortProof], `New/UpperBound/Seesaw/AdmissibleCombinations.lean` (`New.gradedLatticeBasis`,
`New.Grading.SpansLattice`, `New.Seesaw.IsSplitSquarefree`, `New.Seesaw.gram_gradedLatticeBasis_eq_gluedGram`,
`New.Seesaw.isUnimodular_gradedLatticeBasis_gram`, `New.Seesaw.exists_conjTranspose_mul_gradedGram_mul_eq_signMatrix`).

*Needs:* WeilRepresentationsOnBanachSpacesOfData §§8.1, 8.2, 8.5, 8.6 (graded spaces `X ⊕ string` and their Bessel subgroups: a grading of `V` presents its basis as `X` and a string of `s` vectors such that the Gram matrix is `1` on `X` and pairs the string vector `i` only with the string vector `s − 1 − i`, to `1`, or to `−N` for the middle vector, with `N = N̄ ≠ 0`, together with a constant `c = c̄ ≠ 0`; the Bessel subgroup `R` consists of the `g` whose matrix in rational coordinates sends each string vector of grade at least `0` to itself plus string vectors of higher grade; the rational points are cocompact in `R(𝔸)`, so that the Haar measure of `R(𝔸)` is right invariant and gives `[R]` a finite measure; the lattice of a finite point `x` consists of the vectors whose coordinates in the frame of `x` are integral, `Λ_x⁻` is its intersection with `X^⊥` and `Λ_x⁺` its projection to `X^⊥`; `ψ_U(u) = ψ(½ȷ tr(𝔢u))` for the shift `𝔢` of the grading; and the function `𝒲_φ` on `R(𝔸)` of an algebraic form `φ` on `U(I_X)` and a linear form `t` on its values satisfies `𝒲_φ(u·inc_X(a)) = ψ_U(u)·t(ρ(a_∞⁻¹)φ(a_f))` for `u` in the unipotent subgroup and `a ∈ U(I_X)(𝔸)`).

### 3.3 The glued lattice line by line

*Origin:* particular to this proof: the intersection with and the projection to the span of the string of a glued
lattice are sums of lines, and the string map carries the one to a multiple of the other.

*Method of the formal proof:* coordinates in the glued basis; the only coordinate that links two lines is the last one,
glued to the middle vector.

Let `V` span the glued lattice `Λ` for `a`, `π`, `u`, with `N = ππ̄` split squarefree along `P`, and put
`𝔩_i := a^{s−i}ā^{−1−i}`. (a) `Λ` is graded. (b) `Λ⁻` is the sum over the string vectors `e_b` of the multiples of `e_b`
by the fractional ideal of the `b`-th diagonal entry of the glued basis; `Λ⁺` is the same sum with an extra `N^{−1}` at the
middle vector. For odd `s`, `Λ ∩ (span of X ⊔ {last})` consists of the vectors with integral coordinates on `X` and last
coordinate in `πÔ`. (c) If `u = (a/ā)^{⌊(s+2)/2⌋}` and the constant of the grading has the valuations of `aā`, then
`Σ_i t_i𝔢^i ∈ Λ⁻` iff each `t_i ∈ 𝔩_i` in grade `≥ 0` and `∈ N^{−1}𝔩_i` in negative grade, and `∈ Λ⁺` iff `t_i ∈ 𝔩_i` in positive
grade and `∈ N^{−1}𝔩_i` in grade `≤ 0`, where `𝔢^i` are the string powers of the grading. (d) Under (c), for a second graded
space with a string of length `s − 1`, the same constant, spanning its glued lattice `Λ′` for the scale
`(a/ā)^{⌊(s+1)/2⌋}`: `sh(Λ⁺) = aΛ′⁻`. (e) A vector of `Λ⁺` outside `Λ⁻` exists only for odd `s`, and such a vector
generates `Λ⁺` over `Λ⁻` at some place above `N`.

[ShortProof], `New/UpperBound/Seesaw/StandardLines.lean` (`New.Grading.SpansLattice.isGraded`,
`New.Grading.SpansLattice.mem_latticeMinus_iff`, `New.Grading.SpansLattice.mem_latticePlus_iff`,
`New.Grading.SpansLattice.mem_lattice_and_stringProj_eq_zero_iff`, `New.Grading.SpansLattice.stringSum_mem_latticeMinus_iff`,
`New.Grading.SpansLattice.stringSum_mem_latticePlus_iff`, `New.Grading.SpansLattice.map_stringMapFin_latticePlus`,
`New.Grading.SpansLattice.odd_and_exists_place_of_notMem_latticeMinus`).

*Needs:* 3.2.

### 3.4 Congruence levels inside the stabiliser of a glued lattice

*Origin:* adapted from Nikulin (1980), Propositions 1.4.1, 1.5.1 and 1.6.1, the gluing of even `ℤ`-lattices along
discriminant forms: here, a sufficient congruence on an isometry of the part `X ⊔ {last}` for its extension by the identity
on the string to stabilise the glued lattice.

*Method of the formal proof:* in the coordinates of the glued basis the image of `h` differs from the identity only in the
column of the glued vector, and the congruence of the last row modulo `π` makes that column integral.

Let `V` span the glued lattice for `a`, `π`, `u`, with `N = ππ̄` split squarefree along `P`. Let `h` be a finite unitary
point of `I_{X⊔{last}}`, integral, whose last row is `≡ (0, …, 0, 1) (mod π)`. (a) `inc_X(h)` (identity on the string)
stabilises the lattice of `V`. (b) If moreover `h ≡ 1` at places `w_i` with `w_i, w̄_i ∉ P`, then so is `inc_X(h)` in the
coordinates of the point of `V`.

[ShortProof], `New/UpperBound/Seesaw/GluedLevel.lean` (`New.Grading.inclXFin_mem_stdLevel`,
`New.Grading.inclXFin_mem_levelOf`).

*Needs:* 3.2; HermitianFormsAndLattices §4.9.

### 3.5 Lattice bounds for the points of graded spaces

*Origin:* particular to this proof: the induction step for the bounds `q̄^kΛ⁻ ⊂ Λ_x⁻ ⊂ q^{−k}Λ⁻` on the lattices of the points
along a tower of graded spaces.

*Method of the formal proof:* the lower bound on the next space comes from the upper bound and the string map; duality of
the glued lattice turns a lower bound into an upper bound unless the lattice splits at a place above `N`.

For a finite idele `q` and `k ≥ 0`, a point `x` *has lattice bounds* `(q, k)` if `q̄^kΛ⁻ ⊂ Λ_x⁻` and `q^kΛ_x⁻ ⊂ Λ⁻`, and *has a
bounded orbit* if some `rx`, `r ∈ R_f`, has a graded lattice with these bounds. The lattice of `x` *splits at* `w` if at `w`
the projection `Λ_x⁺` lies in `Λ_x⁻`. (a) If `sh(Λ⁺) = aM⁻` on the next space `V′`, `q^kΛ_x⁻ ⊂ Λ⁻` and
`(q̄/a)·sh(Λ_x⁺) ⊂ M_{x′}⁻`, then `q̄^{k+1}M⁻ ⊂ M_{x′}⁻`. (b) If `V` spans the glued lattice, `N` is split squarefree along `P`,
`q` is a unit above `N` and `q̄^kΛ⁻ ⊂ Λ_x⁻`, then `x` has lattice bounds `(q, k)`, or `s` is odd and the lattice of `x` splits
at some `w ∈ P`. (c) If the lattice of `x` splits at `w ≠ w̄`, the conjugate by `x` of the scaling of `X` by an integral
norm-one idele that is `1` off `w`, `w̄` is integral and trivial off `w`, `w̄`. (d) If `rx ∈ K°` for some `r ∈ R_f`, then `x`
has a bounded orbit for `k = 0`.

[ShortProof], `New/UpperBound/Seesaw/Sandwich.lean` (`New.Grading.LatticeSplitsAt`,
`New.Grading.smul_latticeMinus_le_of_map_latticePlus`, `New.Grading.SpansLattice.hasLatticeBounds_or_latticeSplitsAt`,
`New.Grading.LatticeSplitsAt.conj_scalarFin_mem`, `New.Grading.SpansLattice.hasBoundedOrbit_zero`).

*Needs:* 3.2, 3.3; WeilRepresentationsOnBanachSpacesOfData §§8.1, 8.2, 8.4, 8.5, 8.6 (graded spaces `X ⊕ string` and their Bessel subgroups: a grading of `V` presents its basis as `X` and a string of `s` vectors such that the Gram matrix is `1` on `X` and pairs the string vector `i` only with the string vector `s − 1 − i`, to `1`, or to `−N` for the middle vector, with `N = N̄ ≠ 0`, together with a constant `c = c̄ ≠ 0`; the Bessel subgroup `R` consists of the `g` whose matrix in rational coordinates sends each string vector of grade at least `0` to itself plus string vectors of higher grade; the rational points are cocompact in `R(𝔸)`, so that the Haar measure of `R(𝔸)` is right invariant and gives `[R]` a finite measure; the lattice of a finite point `x` consists of the vectors whose coordinates in the frame of `x` are integral, `Λ_x⁻` is its intersection with `X^⊥` and `Λ_x⁺` its projection to `X^⊥`; `ψ_U(u) = ψ(½ȷ tr(𝔢u))` for the shift `𝔢` of the grading; and the function `𝒲_φ` on `R(𝔸)` of an algebraic form `φ` on `U(I_X)` and a linear form `t` on its values satisfies `𝒲_φ(u·inc_X(a)) = ψ_U(u)·t(ρ(a_∞⁻¹)φ(a_f))` for `u` in the unipotent subgroup and `a ∈ U(I_X)(𝔸)`; and, for an invertible finite adele `q` of valuation `1` outside a set `Q` of places and `k ∈ ℕ`, there is a finite set of finite points supported on `Q ∪ Q̄` that meets the double coset `R_f·x·K°` of every `x` whose orbit under `R_f` is bounded, that is, contains a point with a graded lattice `Λ` such that `q̄^k Λ_1⁻ ⊂ Λ⁻` and `q^k Λ⁻ ⊂ Λ_1⁻`, `Λ⁻` its intersection with `X^⊥`).

### 3.6 The shift at a nonzero constant term

*Origin:* particular to this proof: where the constant term of a Weil translate along the string map does not vanish, a
multiple of the string map carries the lattice of the first point into that of the second.

*Method of the formal proof:* the constant term is the mean over the maps that raise grades; invariance of the datum
under a lattice of Heisenberg translations forces the homogeneous part of degree `−1` of the point to map lattices into
lattices.

Let `V`, `V′` be graded with strings of lengths `s`, `s − 1`, `sh` the string map. Let `t ⊗ f` be a datum of
`𝒮(Hom(V, V′))` with `f` fixed by the finite Heisenberg operators of `bÔ^{n′×n}` for a finite idele `b`, and let the constant
term at `sh` of its Weil translate by `(x, x′)` (twisted by characters of `U(1)`) be nonzero. If `r ∈ R_f`, `r′ ∈ R′_f` make
the lattices of `rx_f`, `r′x′_f` graded, then `(b̄/α)·sh` maps `Λ_{rx}⁺` into `Λ′_{r′x′}⁻`.

[ShortProof], `New/UpperBound/Seesaw/Frequency.lean` (`New.Grading.smul_map_stringMapFin_latticePlus_le`,
`New.Grading.exists_mapsTo_lattice_hasDegreeGe_sub_smul_stringMap`, `New.Grading.IsGraded.mulVec_mem_of_homogeneous`).

*Needs:* 3.2; WeilRepresentationsOnBanachSpacesOfData §§8.1, 8.2, 8.5, 8.6 (graded spaces `X ⊕ string` and their Bessel subgroups: a grading of `V` presents its basis as `X` and a string of `s` vectors such that the Gram matrix is `1` on `X` and pairs the string vector `i` only with the string vector `s − 1 − i`, to `1`, or to `−N` for the middle vector, with `N = N̄ ≠ 0`, together with a constant `c = c̄ ≠ 0`; the Bessel subgroup `R` consists of the `g` whose matrix in rational coordinates sends each string vector of grade at least `0` to itself plus string vectors of higher grade; the rational points are cocompact in `R(𝔸)`, so that the Haar measure of `R(𝔸)` is right invariant and gives `[R]` a finite measure; the lattice of a finite point `x` consists of the vectors whose coordinates in the frame of `x` are integral, `Λ_x⁻` is its intersection with `X^⊥` and `Λ_x⁺` its projection to `X^⊥`; `ψ_U(u) = ψ(½ȷ tr(𝔢u))` for the shift `𝔢` of the grading; and the function `𝒲_φ` on `R(𝔸)` of an algebraic form `φ` on `U(I_X)` and a linear form `t` on its values satisfies `𝒲_φ(u·inc_X(a)) = ψ_U(u)·t(ρ(a_∞⁻¹)φ(a_f))` for `u` in the unipotent subgroup and `a ∈ U(I_X)(𝔸)`).

### 3.7 The gradings, lattices and levels of the spaces `Y_k`

*Origin:* particular to this proof: the facts about the spaces `Y_k` of the data that the unfolding uses.

*Method of the formal proof:* the valuations of the chosen idele are those of `π_M`; the lattice of `Y_k` is the glued
lattice by the choice of its point in 2.1; 3.4 gives the levels.

For `k ≤ m − 1` the *grading* of `Y_k` is the presentation of 2.1 (`X_k` and a string of `m − 1 − k` vectors) with one
constant `c_Y ∈ E^×`, `c_Y = c̄_Y`, independent of `k`; `Y_m` is graded by its whole basis with an empty string. (a) `ϖ_M` has
the valuations of `π_M`; `c_Y` has the valuations of `aā` (`a = α/ϖ̄_M`); `N(π_M) = M^f`. (b) `Y_k` spans the glued lattice
for `a`, `π_N` and `u_k = (a/ā)^{⌈(m−k)/2⌉}`. (c) `inc_X` maps `K_k` into `J_M` on `Y_k`; an element of `J_M` that is `1` at the
places of `Q(ϑ)` lies in `J_ϑ`. (d) The Bessel subgroup of the grading of `Y_m` is `U(Y_m)`.

[ShortProof], `New/UpperBound/Seesaw/EdgePairEvaluation.lean` (`New.Data.gradingY`, `New.Data.lastGrading`),
`New/UpperBound/Seesaw/LevelIdeles.lean` (`New.Data.v_chosenIdele`, `New.Data.absNorm_piM`,
`New.Data.v_gradingY_genericConst_eq_ideleA_mul_star`, `New.Data.spansLattice_gradingY`,
`New.Data.chosenLevel_inf_trivialOn_le`), `New/UpperBound/Seesaw/UnfoldingStages.lean`
(`New.Data.inclXFin_mem_chosenLevel`).

*Needs:* 2.1, 2.6, 3.2, 3.4.

### 3.8 Finite zero terms and pairs of edges

*Origin:* particular to this proof: the zero term of the Weil representation along an isotropic frame, split into a real
and a finite part, and the finite evaluation of the data of two consecutive lifts between graded spaces, with its
equivariance.

*Method of the formal proof:* the zero term is the mean of the datum over translations along the isotropic frame; it is
computed on pure tensors through a point adapted to the frame; the part of grade zero of `V⁻ ⊕ V″` gives a splitting
whose isotropic part is spanned by the string vectors, and the zero term intertwines the Weil actions of the three groups.

(a) For a splitting `V = (isotropic frame ⊕ dual frame) ⊥ V_0`, the *finite zero term* `Z_f : 𝒮(V) → 𝒮(V_0)` is
`f ↦ zero term of v ⊗ f` with `v` the Fock vacuum moved by an adapted real point. The zero term of `ϱ(y)(v ⊗ f)` is
`v_0 ⊗ Z_f(ϱ_f(α^{−1}y_f)f)` for a real Fock vector `v_0` independent of `f`; `Z_f(vac) ≠ 0`, and `Z_f` obeys the law of the
zero term for finite points of the parabolic subgroup.
(b) A *pair of edges* `Y → Y′ → Y″` is three graded spaces with strings of lengths `s` (odd), `s − 1`, `s − 2` (or `s = 1`
and empty strings) and data identifying the part of grade zero of `V⁻ ⊕ V″` with `X⁻ ⊕ X″` plus hyperbolic planes,
compatibly with the stacked string map `(sh*, sh′) : V′ → V⁻ ⊕ V″`; the *middle* pair removes the plane of the two middle
vectors (`s ≠ 1`), the *last* pair (`s = 1`, `N = pp̄`) adjoins `z/p` to `X_0` as last vector of `X″`. Its *finite evaluation*
sends data on `Hom(V′, V⁻ ⊕ V″)` (the join of data on `Hom(V, V′)` and `Hom(V′, V″)`) to tensors of finite data on
`Hom(X, X′)` and `Hom(X′, X″)`: translate by the stacked string map, take the finite zero term along the splitting, and
split.
(c) *Equivariance.* The zero term carries the joint Weil operator of `(inc_X g, inc_{X′} g′, inc_{X_0} k)` to that of
`(g, g′, k′)` with `k′` the image of `k`; and the finite evaluation of the join of the translates of `Φ`, `Φ′` by
`(inc g, inc g′)` and `(inc g′, inc k)` is the translate of the finite evaluation by `(g, g′)` and `(g′, k′)`.
(d) For the spaces `Y_{2i} → Y_{2i+1} → Y_{2i+2}` (graded as in 3.7) the evaluation is the middle pair for `i < ϱ` and the last
pair for `i = ϱ`. For finite points `y_k` of `U(Y_k)` the *evaluated datum* of pair `i` is the finite evaluation of the data
`Υ_{2i+1}`, `Υ_{2i+2}` of 2.15 moved by `(y_{2i}, y_{2i+1})` and `(y_{2i+1}, y_{2i+2})`. `B_M := M^{f n_m²}`.

[ShortProof], `New/UpperBound/Seesaw/EdgePairEvaluation.lean` (`New.Seesaw.zeroTermFin`,
`New.Seesaw.exists_zeroTerm_rho_integrated_eq`, `New.Seesaw.DoubleLiftData`, `New.Seesaw.DoubleLiftData.finEval`,
`New.Seesaw.DoubleLiftData.zeroTerm_splitting_tripleWeil`, `New.Seesaw.DoubleLiftData.finEval_arrowProduct_equivariant`,
`New.Seesaw.middleDoubleLift`, `New.Seesaw.lastDoubleLift`, `New.Data.doubleLiftEvalY`, `New.Data.evaluatedDatum`,
`New.Data.translatedPointDatumY`, `New.Data.residueMatrixCount`).

*Needs:* 2.15, 3.7; WeilRepresentationsOnBanachSpacesOfData §§5.5, 6.9 (the mixed model of the Weil representation along an isotropic splitting: the zero term `𝒮(V) → 𝒮(V₀)`, the theta functional as a sum of slices, and the zero terms of a pair under the Levi part and the radical).

### 3.9 The neighbour lattice of a pair of edges

*Origin:* particular to this proof: the image in `I^⊥/I` of the vacuum lattice of a pair of edges is a neighbour of the
standard lattice above `N`, with explicit representatives modulo its integral points.

*Method of the formal proof:* an explicit unitary carries the standard lattice of `Hom(X′, X⁻ ⊕ X″)` to the neighbour
lattice; away from `N` it scales rows, above `N` the translations by the matrices built from residues represent it.

Take definite spaces on `X ⊔ {e}`, `X′`, `X″ ⊔ {e″}`, `N = ππ̄` split squarefree along `P`, row factors `κ` equal to `1` or a
norm-one `δ` that is `1` above `N`, with denominators bounded by an integral `β` (a unit above `N`) and `β̄`. For residues
`y` modulo `N` at `P` let `T_y` have `ηȳ/N` in the row of `e` and `−ȳ/N` in the row of `e″` (`η` of norm `−1`), supported at
the conjugates of `P`. The *neighbour lattice* is the image of the standard lattice of `Hom(X′, X⁻ ⊕ X″)` under the explicit
unitary `(γκ) ⊗ 1` (a neighbour of the standard lattice above `N`, rows scaled by `κ` elsewhere); its elements that
vanish above `N` form finitely many classes modulo the integral matrices, whose number divides the number of matrices
with entries in `Ô/(β)`; every element is congruent modulo integral matrices to exactly one `T_y + t` with `t` a chosen
representative of such a class. For a pair of edges, the neighbour lattice is the image of the vacuum lattice of 3.11.

[ShortProof], `New/UpperBound/Seesaw/NeighbourLattice.lean` (`New.Seesaw.neighbourLattice`,
`New.Seesaw.neighbourTranslation`, `New.Seesaw.IsNeighbourVector`, `New.Seesaw.IsScalingAtM`,
`New.Seesaw.AwayLatticeQuotient`, `New.Seesaw.card_awayLatticeQuotient_dvd`, `New.Seesaw.neighbourCosetRep`,
`New.Seesaw.existsUnique_sub_neighbourCosetRep_mem`).

*Needs:* 2.12, 3.2.

### 3.10 The vacuum of the neighbour lattice

*Origin:* particular to this proof: the sum of the translates of the vacuum over representatives of the neighbour
lattice, read on the two edges, is a combination of glued translates.

*Method of the formal proof:* the translations by the `T_y` add up to the gluing of 2.12 and commute with the
translations that vanish above `N`; each class of the latter contributes a root of unity times one glued translate.

In the setting of 3.9, the *glued translate* of `t = (t_1, t_2)` is `Glue(ϱ_f(t_1)vac ⊗ ϱ_f(t_2)vac)` on the two edges
`Hom(X ⊔ {e}, X′)`, `Hom(X′, X″ ⊔ {e″})`. Let `x` vanish above `N` and have rows of denominator at most `β` (first block) and
`β̄` (second block) away from `n`. Then the translate by `x` of `Σ_{(y, c)} ϱ_f(T_y + t_c)vac`, read on the two edges, is an
admissible combination of the `K·(glued translate of t)`, `K` the number of classes, over the `t` with `β̄t_1`, `β̄t_2`
integral away from `n`, with denominator the number of matrices modulo `β` and size `1` under any condition.

[ShortProof], `New/UpperBound/Seesaw/NeighbourVacuum.lean` (`New.Seesaw.gluedTranslate`, `New.Seesaw.IsAdmissibleEval`,
`New.Seesaw.isAdmissibleCombination_finHeisenbergOp_sum_neighbourCosetRep`).

*Needs:* 1.1, 1.2, 3.9.

### 3.11 Finite evaluation of a pair of edges

*Origin:* particular to this proof: what the finite evaluation of 3.8 does to a translate of the vacuum, expressed
through the glued translates of 3.3.

*Method of the formal proof:* the vacuum's lattice meets `I^⊥`, `I` the isotropic part, in a lattice whose image modulo
`I` is the neighbour lattice of 3.9. Hence the finite evaluation sends a translate of the vacuum to `0` or to a root of
unity times a translate of the vacuum's zero term, and 3.10 expands that zero term as a nonzero multiple of a sum over
representatives of the neighbour lattice. The two hypotheses, on lifting neighbour vectors and on matching
denominators, are verified separately for the middle pair and for the last pair.

Let `P` hold one place of each pair above `N` with `N = ππ̄` split squarefree along `P`, `κ`, `δ`, `β` as in 3.9, and a pair of
edges whose middle space spans the glued lattice for `a`, `π`, `u′`, such that the solutions of the neighbour congruences lift
to the lattice of `V⁻ ⊕ V″` and the denominators match through `κ`. Then there is `C` such that for every `n` prime to `N` the
finite evaluation sends each translate of the vacuum by `y`, with rows of denominator `β` on `V⁻` and `β̄` on `V″` away from
`n`, to an admissible combination of the `C·(glued translate of (t_1, t_2))` with `β̄t_1`, `β̄t_2` integral away from `n`, of
denominator depending only on `β` and the index sets and of size `1`. The two hypotheses hold for the middle pair and for the
last pair of the spaces `Y_k` (3.8 (d)).

[ShortProof], `New/UpperBound/Seesaw/AdmissibleEvaluation.lean` (`New.Seesaw.isAdmissibleEval_finEval`,
`New.Seesaw.liftsNeighbours_middleDoubleLift`, `New.Seesaw.matchesDenominators_middleDoubleLift`,
`New.Seesaw.liftsNeighbours_lastDoubleLift`, `New.Seesaw.matchesDenominators_lastDoubleLift`).

*Needs:* 3.3, 3.8, 3.9, 3.10.

### 3.12 Evaluated data as admissible combinations of glued translates

*Origin:* particular to this proof: the tensor of the evaluated data of all pairs of the chain is an admissible
combination of glued vacua with denominators prime to the modulus and bounded size for the trivial twist.

*Method of the formal proof:* the data `Υ_k` moved by points integral away from `q_ϑ` are admissible combinations of
translates of the vacuum (1.2 (e)); 3.11 evaluates each pair, and 1.2 (b) takes the tensor product.

There is `C ∈ ℂ` such that for every tame character `ϑ` and points `y_k` of `U(Y_k)` integral at the places not dividing
`q_ϑ`, the tensor `⊗_{i ≤ ϱ} (evaluated datum of pair i)` is an admissible combination of the `C·(glued vacuum of x)`, `x`
admissible for `q_ϑ`, with denominator `B_M^{2m}` away from `q_ϑ` and size `1` if `Q(ϑ) = ∅`.

[ShortProof], `New/UpperBound/Seesaw/GoodDatum.lean` (`New.Data.exists_isAdmissibleCombination_gluedVacuum`).

*Needs:* 1.2, 2.12, 3.8, 3.11.

### 3.13 Unfolding a pair of lifts

*Origin:* adapted from Wang (2025), Theorem 4.5: the exchange of periods attached to nilpotent orbits under the global
theta lift: here, two unfolding steps of the Bessel periods of a pair of lifts between graded unitary spaces give an
integral over the definite group of `X` of a theta integral over the definite group of `X′` with the finitely evaluated datum.

*Method of the formal proof:* each step integrates over a unipotent group first; the character of the kernel cancels that of
the equivariant function, and the mean over the second unipotent group turns one zero term into the zero term along the
splitting of the pair; the double theta integral is a coefficient of a composite of two lifts.

Let `Y → Y′ → Y″` be a pair of edges (3.8) with definite parts `X`, `X′`, `X_0`. There is `z ∈ ℂ` such that for all
characters `a`, `b` of `U(1)(𝔸)`, data `f`, `f′` on `Hom(V, V′)`, `Hom(V′, V″)`, `k ∈ U(X_0)(𝔸)` and every continuous
`W` on `R(𝔸)` left invariant under `R(F)` and transforming by `ψ_U`:

`∫_{[R′]}∫_{[R]} W(g)·CT(f)(g, r)·CT(f′)(r, inc k) dg dr = ∫_{[U(X)]} W(inc g)·(z·∫_{[U(X′)]} θ(ω_{a,b}(g, r, k′)Z(sh·(f ⋆ f′))) dr) dg`,

where `CT` are the constant terms at the string maps of the Weil translates, `f ⋆ f′` the join, `sh` the translation by the
stacked string map, `Z` the zero term along the splitting of the pair, `k′` the image of `k` and `ω_{a,b}` the joint Weil
action on `Hom(X′, X⁻ ⊕ X″)`.

[ShortProof], `New/UpperBound/Seesaw/UnfoldingStages.lean` (`New.Seesaw.DoubleLiftData.exists_integral_constTermAtStringMap_mul_eq`).

*Needs:* 3.8; WeilRepresentationsOnBanachSpacesOfData §§8.1, 8.2, 8.5, 8.6 (graded spaces `X ⊕ string` and their Bessel subgroups: a grading of `V` presents its basis as `X` and a string of `s` vectors such that the Gram matrix is `1` on `X` and pairs the string vector `i` only with the string vector `s − 1 − i`, to `1`, or to `−N` for the middle vector, with `N = N̄ ≠ 0`, together with a constant `c = c̄ ≠ 0`; the Bessel subgroup `R` consists of the `g` whose matrix in rational coordinates sends each string vector of grade at least `0` to itself plus string vectors of higher grade; the rational points are cocompact in `R(𝔸)`, so that the Haar measure of `R(𝔸)` is right invariant and gives `[R]` a finite measure; the lattice of a finite point `x` consists of the vectors whose coordinates in the frame of `x` are integral, `Λ_x⁻` is its intersection with `X^⊥` and `Λ_x⁺` its projection to `X^⊥`; `ψ_U(u) = ψ(½ȷ tr(𝔢u))` for the shift `𝔢` of the grading; and the function `𝒲_φ` on `R(𝔸)` of an algebraic form `φ` on `U(I_X)` and a linear form `t` on its values satisfies `𝒲_φ(u·inc_X(a)) = ψ_U(u)·t(ρ(a_∞⁻¹)φ(a_f))` for `u` in the unipotent subgroup and `a ∈ U(I_X)(𝔸)`); WeilRepresentationsOnBanachSpacesOfData §§5.5, 6.9 (the mixed model of the Weil representation along an isotropic splitting: the zero term `𝒮(V) → 𝒮(V₀)`, the theta functional as a sum of slices, and the zero terms of a pair under the Levi part and the radical); WeilRepresentationsOnBanachSpacesOfData §§8.7, 8.8 (one step of the unfolding of a theta integral over the Bessel subgroup of a graded space: for a `ψ_U`-equivariant function `W` and a form `y` of rapid decay, `∫_{[R]} W(r) ∫ θ(ω(r, h)Φ) y(h) dh dr` is the integral over the next Bessel quotient of `y` times the integral of `W` against the constant term along the string map).

### 3.14 The functions of the unfolding

*Origin:* particular to this proof: the functions left by the successive unfolding steps of the lower chain against the
Bessel function of a source form, and their value after each pair of lifts as a coefficient of a chain of lifts between the
`X_j`.

*Method of the formal proof:* recursion on the stage; integrability from the rapid decay of the forms on `Y_{k+1}` and
compactness of `[R_k]`; after a pair, 3.13 and the class-sum lift of ThetaLiftsForDefiniteUnitaryGroups §1.2 identify the
double theta integral with a coefficient of the double-lift chain.

Fix `ϑ`, `t`, a source form `φ` and outer variables `g_k = (ξ_k, y_k) ∈ U(Y_k)(𝔸)`. Let `R_k` be the Bessel subgroup of the
grading of `Y_k`. Define `𝒲_0 := 𝒲_φ` on `R_0` and, for `k ≥ 0` and a grading `Y′` of `Y_{k+1}` with a string of `m − 2 − k` vectors, `𝒲_{k+1}` on `U(Y_{k+1})(𝔸)` by
one unfolding step of `𝒲_k(·g_k)` against the Weil translates of `Φ_k^ϑ`; it depends only on `g_0, …, g_k`, is continuous and
left invariant under the rational points of the Bessel subgroup of `Y′`, and its restriction to `R_{k+1}` is equivariant.
(a) For `z` automorphic and rapidly decreasing on `U(Y_{k+1})` (every form of the conjugate type is, for `k + 1 ≤ m`),
`𝒲_{k+1}·z` is integrable on `R′(F)\U(Y_{k+1})(𝔸)` and
`∫_{[R_k]} 𝒲_k(r)·∫_{[U(Y_{k+1})]} θ(ω(r g_k, h)Φ_k^ϑ)z(h) dh dr = ∫_{R′(F)\U(Y_{k+1})(𝔸)} 𝒲_{k+1}·z`.
(b) For `2i + 1 ≤ m − 1` and a pair of edges `R` for `Y_{2i} → Y_{2i+1} → Y_{2i+2}` whose evaluation is that of 3.8 (d), and an
archimedean `x`, there is a linear form `l` on `V_{μ(X_{2i+2})}`, independent of `ϑ`, `φ` and the `y_k`, with
`𝒲_{2i+2}(inc g·(x, y_{2i+2})) = l(C_{i+1}(evaluated data)φ)(R.emb g)` for `g ∈ U(X)(𝔸)`, `C_{i+1}` the chain of the first
`i + 1` double lifts `L_j^ϑ`.

[ShortProof], `New/UpperBound/Seesaw/UnfoldingStages.lean` (`New.Data.unfoldStageOn`, `New.Data.unfoldStage`,
`New.Data.unfoldStage_update`, `New.Data.continuous_unfoldStage`, `New.Data.fixesLeft_ratBessel_unfoldStage`,
`New.Data.integral_unfoldStageOn`, `New.Data.exists_unfoldStage_eq_algFormCoeff`).

*Needs:* 2.8, 2.15, 2.19, 3.7, 3.8, 3.13; ThetaLiftsForDefiniteUnitaryGroups §1.2.

### 3.15 Support of the unfolded functions

*Origin:* particular to this proof: for ramified source forms the unfolded functions vanish unless the graded lattice of the
finite point is sandwiched between powers of the modulus of the twist times the standard lattice.

*Method of the formal proof:* induction on the stage: a nonzero constant term gives the lattice inclusion of 3.6, which
with 3.3 (d) and 3.5 (a) gives the lower bound on the next space; 3.5 (b) gives the upper bound unless the lattice splits at a
place above `N`, and there the scalings of 3.5 (c) act through a central character on which the ramified forms vanish
(2.14).

Let `q_Q` be a finite idele generating the product of the places of `Q(ϑ)`. Let `φ ∈ 𝒮_X^{ram}`, `y_0 ∈ J_M`,
`j = k + 1 ≤ m − 1`, and suppose `𝒲_j(a, x) ≠ 0` (the grading of `Y_j` in the last step). If `r′ ∈ R_{j,f}` makes the lattice of
`r′x` graded, then `r′x` has lattice bounds `(q_Q, j)`: `q̄_Q^jΛ⁻ ⊂ Λ_{r′x}⁻` and `q_Q^jΛ_{r′x}⁻ ⊂ Λ⁻`.

[ShortProof], `New/UpperBound/Seesaw/UnfoldingStages.lean` (`New.Data.hasLatticeBounds_of_unfoldStage_ne_zero`,
`New.Data.twistIdele`).

*Needs:* 2.14, 3.3, 3.5, 3.6, 3.7, 3.14.

### 3.16 Cuts for the outer variables

*Origin:* particular to this proof: finite sets of classes of the outer variables, with multiplicities dividing powers of
`q_ϑ`, over which the outer integrals become weighted sums with coefficients integral away from `q_ϑ`.

*Method of the formal proof:* 3.1 (b) with the compact set of points whose orbit has lattice bounds; invariance under the
levels `K_j` by 3.4 and 3.7 (c); the coefficients are inverses of multiplicities that divide powers of `q_ϑ`.

Let `ϑ` be a tame character. For `j ≤ m − 1`, a *cut* of stage `j` is a finite set `T` of classes of `U(Y_j)(𝔸_f)` modulo
`J_ϑ(Y_j)` that is stable under `R_{j,f} ∩ K°`, whose points are integral at the places not dividing `q_ϑ`, on which the cover
multiplicity (for `R_{j,f}` and `K°`) divides a power of `q_ϑ`, and whose multiplicity is nonzero at every point with a bounded
orbit for `(q_Q, j)`. (a) Cuts exist; `Ω_0` is the set of classes of the elements of `J_M`, and `Ω_j` a fixed cut for
`j ≥ 1`; `mult_0 := 1`, `mult_j` the cover multiplicity. (b) For `S` on tuples of classes, `Σ_k(S)` is the sum of `S` over
`Ω_0 × ⋯ × Ω_{k−1}` (the other coordinates the class of `1`), each term divided by the multiplicities of its coordinates;
it is linear in `S`, and invariant under translating `S` by a tuple `h` with `h_i ∈ inc_X(K_i)` for `i < k` and `h_i = 1` for
`i ≥ k`. (c) `Σ_k(S)` is an admissible combination of the values of `S` at tuples of points integral at the places not
dividing `q_ϑ`, with denominator `1` away from `q_ϑ` and size `B_M^k` if `Q(ϑ) = ∅`.

[ShortProof], `New/UpperBound/Seesaw/Cut.lean` (`New.Data.IsStageCut`, `New.Data.exists_isStageCut`, `New.Data.cutPoints`,
`New.Data.cutMultiplicity`, `New.Data.cutSum`, `New.Data.map_cutSum`, `New.Data.cutSum_comp_smul`,
`New.Data.isAdmissibleCombination_cutSum`).

*Needs:* 1.1, 3.1, 3.4, 3.5, 3.7.

### 3.17 The top of the chain

*Origin:* adapted from Gross (1999): the class set of a group compact at infinity, with the weights `|Γ_𝒸|^{−1}` and the
mass: here, by Schur orthogonality on the compact `U(Y_m)(F_∞)`, integrating a coefficient of a form on `X_m`, restricted
to `Y_m`, against a form on `Y_m` gives a fixed multiple of its Petersson product with the restricted form.

*Method of the formal proof:* the integral is a class sum of integrals over the compact `U(Y_m)(F_∞)`; Schur orthogonality
makes each a constant times the pairing of the branching of the column with the highest vector, and the branching map
spans the equivariant maps (2.2 (d)).

For every linear form `t` on `V_{μ(X_m)}` there is `C ∈ ℂ` such that for every form `x` on `U(Y_m)` of type `l_Y(m)`, every
`ψ ∈ 𝒜_m` and every function `F` on `U(Y_m)(𝔸)` with `F(k) = t(ψ)(diag(k, 1))` for all `k ∈ U(Y_m)(𝔸)`:
`∫_{[U(Y_m)]} F·x̄ = C·⟨x, res(ψ)⟩`. Consequently, if `ι_m^ϑ ∘ ⋯ ∘ ι_1^ϑ(f) = res(ψ)` as automorphic forms, then
`Θ_ϑ(f) = res(ψ)` as algebraic forms.

[ShortProof], `New/UpperBound/Seesaw/SeesawIdentity.lean` (`New.Data.exists_integral_eq_mul_inner_restrictToFormY`,
`New.Data.lowerChain_eq_of_lowerChainUpTo_eq`).

*Needs:* 2.2, 2.12, 2.15; ThetaLiftsForDefiniteUnitaryGroups §1.2; IntegralRepresentationsOfGeneralLinearGroups §2.4 (Schur orthogonality on the compact group `U(n)^Φ`, with Haar measure of mass one, for the conjugate action `ρ(x) = ρ_{κ,e}(x̄)` of the algebraic representation `ρ_{κ,e}` of weight `(κ, e)`, which is the action on the values of forms used here, and not for `ρ_{κ,e}` itself: `∫ ⟨a, ρ(x⁻¹)b⟩·f(ρ(x)c) dx = (dim ρ)⁻¹·⟨a, c⟩·f(b)` for a linear form `f` and the invariant Hermitian form `⟨·, ·⟩`).

### 3.18 The outer integrals of the seesaw

*Origin:* particular to this proof: the pairing of the image of the Poincaré map under the first `k + 1` lifts with a form
on `Y_{k+1}` is a constant, independent of the twist and the source form, times a weighted cut sum of unfolded periods.

*Method of the formal proof:* lift and descent are transposes; the first step unfolds the Poincaré map (2.19 (b)), the sum
over `J_M/J_ϑ(Y_0)` being the cut `Ω_0`; each further step unfolds by 3.14 (a) and turns the outer integral into a cut sum
by 3.1 (c), whose hypotheses on the support come from 3.15 and 3.16.

Let `ϑ` be a tame character and `j < m`. (a) For a form `z` of the conjugate type on `Y_{j+1}` and `f` on `Y_j`,
`∫_{[U(Y_{j+1})]} z·ι_{j+1}^ϑ(f) = ∫_{[U(Y_j)]} ι_{j+1}^{ϑ,*}(z)·f`, where the descent `ι_{j+1}^{ϑ,*}(z)(g) =
[K° : J_ϑ(Y_j)]·∫_{[U(Y_{j+1})]} θ(ω(g, h)Φ_j^ϑ)z(h) dh` is right invariant under `J_ϑ(Y_j)`. (b) For `t`, an archimedean
point `g` of `U(Y_0)`, `k ≤ m − 1`, a grading `Y′` of `Y_{k+1}` with a string of `m − 2 − k` vectors (none for
`k = m − 1`) and a function `a` of the
archimedean outer variables, there is `c ∈ ℂ` such that for every `ϑ`, every `φ ∈ 𝒮_X^{ram}`, every form `z` of the conjugate
type on `Y_{k+1}` and every `S` on tuples of classes with
`∫_{R′(F)\U(Y_{k+1})(𝔸)} 𝒲_{k+1}·z = a(ξ)·S(classes of y)` whenever `y_0 ∈ J_M` and `y_m = 1`:
`∫_{[U(Y_{k+1})]} z·(ι_{k+1}^ϑ ∘ ⋯ ∘ ι_1^ϑ)(𝒫_{g,t}φ) = c·Σ_{k+1}(S)`.

[ShortProof], `New/UpperBound/Seesaw/SeesawIdentity.lean` (`New.Data.integral_mul_liftY`, `New.Data.transposedLiftY_apply`,
`New.Data.hasLevel_transposedLiftY`, `New.Data.integral_mul_liftY_poincareAt`,
`New.Data.exists_integral_mul_lowerChainUpTo_eq_cutSum`).

*Needs:* 2.15, 2.19, 3.1, 3.14, 3.15, 3.16.

### 3.19 The seesaw tensor

*Origin:* particular to this proof: the tensor of data for the upper chain that the seesaw produces, its invariance, the
identity of chains it gives, and its expansion in glued vacua.

*Method of the formal proof:* at the top, 3.14 (b) and 3.17 identify the unfolded period with the pairing of the restricted
double-lift chain; 3.18 (b) sums it over the cuts, which is linear in the tensor; invariance by the equivariance of the finite
evaluation (3.8 (c)) and of the cut sum (3.16 (b)); admissibility by 3.12 and 3.16 (c).

Let `ϑ` be a tame character. The *seesaw tensor* is `φ_ϑ := Σ_m(c ↦ ⊗_{i≤ϱ} evaluated datum of pair i at representatives of
c)`, a tensor of data for the `ϱ + 1` double lifts `X_{2i} → X_{2i+1} → X_{2i+2}`. (a) `φ_ϑ` is jointly invariant for `ϑ`.
(b) For `t` and an archimedean point `g` of `U(Y_0)` there is `c₀ ∈ ℂ` with
`ι_m^ϑ ∘ ⋯ ∘ ι_1^ϑ(𝒫_{g,t}φ) = c₀·res(C_m(φ_ϑ)φ)` for every tame character `ϑ` and every `φ ∈ 𝒮_X^{ram}`. (c) There is
`C ∈ ℂ` such that for every `ϑ`, `φ_ϑ` is an admissible combination of the `C·(glued vacuum of x)`, `x` admissible for
`q_ϑ`, with denominator `B_M^{2m}` away from `q_ϑ` and size `B_M^{2ϱ+2}` if `Q(ϑ) = ∅`.

[ShortProof], `New/UpperBound/Seesaw/SeesawIdentity.lean` (`New.Data.seesawDatum`, `New.Data.isInvariant_seesawDatum`,
`New.Data.exists_lowerChainUpTo_poincareAt_eq`, `New.Data.exists_isAdmissibleCombination_seesawDatum`).

*Needs:* 2.9, 2.12, 3.8, 3.12, 3.14, 3.16, 3.17, 3.18.

### 3.20 The seesaw identity

*Origin:* particular to this proof: the `m`-fold lower chain of the Poincaré series of a ramified source form is a nonzero
constant, the same for all twists, times a composite lift of the source form with a chain datum of the twist; that either
side is nonzero is not asserted.

*Method of the formal proof:* 3.19 (b) with the constant `c₀`; 3.19 (c) after rescaling by a unit that clears the
denominator `B_M^{2m}` gives a combination of glued vacua with denominator `1`; the glued vacua whose translations do not
vanish off `Mq_ϑ` are replaced, up to roots of unity, by glued vacua of supported translations, and the size bound becomes
`B_M^{2m}·B_M^{2ϱ+2} = M^{3fmn_m²}`; invariance is that of 3.19 (a).

For every linear form `t` on `V_{μ(X_0)}` and every archimedean point `g` of `U(Y_0)` there is `c ∈ ℂ^×` such that for every
twist `ϑ` there is a chain datum `Ψ` for `ϑ` (2.12) with

`Θ_ϑ(𝒫_{g,t}φ) = c·comp_ϑ(Ψ)(φ)` for every `φ ∈ 𝒮_X^{ram}`.

[ShortProof], `New/UpperBound/Seesaw/SeesawIdentity.lean` (`New.Data.seesaw_identity`).

*Needs:* 2.12, 2.15, 2.19, 3.17, 3.19; OneSidedPrimeSumBoundsAndAdmissibleData §3.2 (the data), §3.4 (the twists).

## Downstream consumers

- CompositeThetaLiftsAndShortForms uses the gauges and the bounds for one kernel (1.1 (d), 1.4, 1.5), the spaces,
  weights, lift diagrams and levels (2.1, 2.2, 2.6), the group `𝖦`, `e₀`, the forms of principal level and the lower
  chain (2.5, 2.7, 2.15), source forms, scalings, ramified source forms and the lifts (2.8), and the operator `Up`,
  chain data, the glued datum at `N` and the lifts above `N` (2.11 to 2.14).
- OneSidedPrimeSumBoundsAndAdmissibleData §§5.1–5.4 use the gauge of a vector of a Weyl module (1.1), the spaces (2.1),
  `𝖦` and `e₀` (2.5), the target forms (2.7), source forms (2.8), trivial stabilisers at free levels (2.10), the lower
  chain (2.15), the Poincaré map (2.19) and the seesaw identity (3.20).
- SecondMomentsOfPoincareSeries uses the spaces, the grids and the target parameter (2.1, 2.4), `e₀`, good forms and
  target forms (2.5, 2.7), source forms (2.8), free levels (2.10) and the Poincaré map (2.19).
- DeterminantsOfThetaLiftChains and CongruencesOfTwistedThetaLifts use the spaces and grids (2.1, 2.4), labels and `e₀`
  (2.5), characters and levels (2.6), good forms (2.7), the orders of stabilisers (2.10), the lower chain (2.15) and the
  descent pairs (2.16, 2.18).
- NormsOfThetaLiftsAndExchangeIdentities uses the estimates for one kernel (1.3 to 1.6), the spaces, labels, good forms
  and stabiliser orders (2.1, 2.5, 2.7, 2.10) and the descent pairs with their block datum (2.16 to 2.18).
- SelmerBoundsForAnticyclotomicTwists uses the orders of stabilisers (2.10).

## Scope and ownership

### Owned here

- The estimates for one theta kernel between standard definite spaces: admissible combinations, Galois conjugates of
  jets, archimedean and `p`-adic bounds, data modulo an ideal, integrality and size (Layer 1).
- The objects of the chain: the spaces `X_j`, `Y_j`, `W_j`, `V_j`, their weights and grids, labels and the good
  idempotent, levels, good forms and target forms, source forms and ramified source forms, the lifts and chain data,
  the composite lift, the lower chain, descent pairs and the Poincaré map (Layer 2).
- The seesaw identity and the unfolding that proves it (Layer 3).

### Not owned here

- The data, the row parameter, twists and the characters `μ_j⁰`: OneSidedPrimeSumBoundsAndAdmissibleData §3.2, §3.4.
- Weil data of `E`, the jet scale, the integral vacuum and standard data: DivisibilityOfThetaDerivatives §1.4, §4.2,
  §4.6, §4.8.
- The divisibility and the size of the composite lift: CompositeThetaLiftsAndShortForms.
- The Weil representation, its Fock and mixed models, theta lifts between discrete-series types, graded spaces with
  their Bessel subgroups, and automorphic forms of a discrete-series type are background results of [ShortProof], in
  its own realisation (a data space `𝒮(V)` built from Weil data with one splitting character `υ`, twisted by characters
  of `U(1)`). ThetaKernelsForUnitaryDualPairs §3.45 and §4.4a state the Fock model and the global Weil representation
  of a unitary pair on Schwartz functions with two splitting characters `χ_V`, `χ_W`; no section states the
  identification of the two realisations, so the *Needs:* lines here name the realisation used as background.
- SeesawForThetaChains §6.2 (the double step) and §6.14 (the seesaw identity) are the corresponding statements for the
  chain of ThetaChainsOnDefiniteUnitaryGroups. There the identity is between periods: the top period of the column
  chain against a row form is a root of unity, depending on the tuple of characters, times a pairing with a descended
  row. Sections 3.13 to 3.20 here state an identity between forms, `Θ_ϑ(𝒫_{g,t}φ) = c·comp_ϑ(Ψ)(φ)`, for the data of
  this family, with one constant for all twists and with control of the chain datum `Ψ`; neither is deduced from the
  other.

## Exact supplier contracts

### From OneSidedPrimeSumBoundsAndAdmissibleData

§2.1, §2.2 (the parameters and the field); §3.2 (admissible data: ranks, weights `κ_j`, gap, scales, level primes);
§3.3 (parities and sizes); §3.4 (the row parameter, twists and the characters `μ_j⁰` of the lifts).

### From DivisibilityOfThetaDerivatives

§1.4 (Weil data and the splitting character `υ`); §3.1 (the predicted divisibility of a family of Young diagrams);
§4.2 (the jet scale `t₀`); §4.6 (the integral vacuum and its scale `c₀`); §4.8 (standard data); §§4.10–4.11 (integrality
and divisibility of jets).

### From other roadmaps

ThetaLiftsForDefiniteUnitaryGroups §1.2 (algebraic forms on a definite group and the lift as a class sum), §1.7 (the
kernel as a Fock pairing); FiniteReductiveGroups §5.7 (the characters and the central idempotent of a label);
HermitianFormsAndLattices §4.9, §5.2 (lattices and the orders of finite stabilisers);
IntegralWeylModulesOfGeneralLinearGroups §1.1 (integral branching).

## References

- `[ShortProof]`: the folder `grh` of <https://github.com/lsernau/grh-lean> at commit
  `72fead102f663d5c7a407964a13dc0cf9d977207`; the declarations named on the pointer lines of this roadmap are in
  `src/New/UpperBound/Kernels`, `src/New/UpperBound/Objects`, `src/New/UpperBound/Seesaw` and, for 2.8, in
  `src/New/UpperBound/Size`.
- R. Goodman, N. Wallach, *Symmetry, Representations, and Invariants*, Graduate Texts in Mathematics 255 (2009):
  Theorem 8.1.1 (2.2).
- B. Gross, *Algebraic modular forms*, Israel J. Math. 113 (1999), 61–93: the class set of a group compact at infinity
  (3.1, 3.17; 2.17).
- B. P. J. Wang (Bryan Wang Peng Jun), *Global theta lifting and automorphic periods associated to nilpotent orbits*,
  J. Number Theory 271 (2025), 122–149, arXiv:2311.14234: Theorem 4.5 (3.13).
- G. Shimura, *Theta functions with complex multiplication*, Duke Math. J. 43 (1976), 673–696 (1.3).
- V. Bargmann, *On a Hilbert space of analytic functions and an associated integral transform, Part I*, Comm. Pure Appl.
  Math. 14 (1961) (1.4).
- V. V. Nikulin, *Integral symmetric bilinear forms and some of their applications*, Math. USSR-Izv. 14 (1980) (3.4).
- J.-S. Li, *Theta lifting for unitary representations with nonzero cohomology*, Duke Math. J. 61 (1990) (2.3, 2.17).
- H. Minkowski, *Zur Theorie der positiven quadratischen Formen*, J. reine angew. Math. 101 (1887) (2.10, through
  HermitianFormsAndLattices §5.2).
- H. Petersson, *Theorie der automorphen Formen beliebiger reeller Dimension und ihre Darstellung durch eine neue Art
  Poincaréscher Reihen*, Math. Ann. 103 (1930); R. Godement, *Série de Poincaré et Spitzenformen*, Séminaire Henri Cartan
  10 (1957/58), exposé 10, §4, Théorèmes 5 and 5 bis (2.19).
