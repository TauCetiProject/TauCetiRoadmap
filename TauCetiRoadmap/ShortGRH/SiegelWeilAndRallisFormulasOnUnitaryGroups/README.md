# Siegel–Weil and Rallis formulas on unitary groups

**Summary.** The argument bounds a one-sided sum over primes, and a one-sided bound of the right size for
such sums gives a zero-free half-plane for the L-functions involved. The bound for the prime sum is read off
from the covolume of a lattice of theta lifts of target forms: an upper bound comes from a composite lift of
source forms, a lower bound from determinants of chains of lifts and Hecke L-values, and the two are compared.
This background roadmap states the analytic theory of theta functions on unitary groups over a CM field that
the two bounds and the spanning theorem use, in the forms in which the shorter proof proves it.

The headline results are these. (1) *Neighbours and the series of translates* (1.2–1.5). One step of Kneser's
neighbour method for the standard lattice `Ô^n` lowers the index `[L : L ∩ γ⁻¹L]` by at least the norm of the
place; counting walks through neighbours shows that, when `m > 2n`, the coefficients
`[L : L ∩ γ⁻¹L]^{−m/2}` of the vacuum are absolutely summable over the cosets of a level, and that the series
of translates weighted by them is an injective operator on bounded functions of a level. In rank one the sum of
these coefficients is a partial Hecke L-value over a partial Euler product. (2) *The Siegel–Weil formula in
Weil's range* (2.6). For a split hermitian space `S` of rank `2p` and a space `T` of rank `m > 2p`, on the whole
Banach space of data of the Weil representation, the zero terms along the rational Lagrangians of `S` have
summable operator norms, theta has an integrable majorant on `[U(T)]` uniform in the datum, and the mean of
theta over `[U(T)]` is the sum of the zero terms. Siegel sets for split unitary groups (2.2) and a constancy
theorem replacing strong approximation (2.7) belong to the same layer. (3) *Siegel's formula and masses*
(3.2–3.5). Siegel's class-sum formula for the vectors of one norm in the standard definite lattice, and an
approximate ratio of the masses of the standard lattices in consecutive ranks; local densities bounded by an
ideal zeta value at one or several places (3.7, 3.8). (4) *Rallis' inner product formula* (4.2–4.6). The doubling
identity and the inner product formula in Weil's range for rapidly decreasing forms; for sharp data, the
product of two lifts is a nonzero constant times the pairing with the series of translates, so the lift is
injective; a reproducing formula by theta lifts to a large definite group. (5) *Singular forms* (5.3). An
automorphic function whose partial means are invariant under shears has a vanishing Fourier coefficient along
the centre of a radical as soon as the coefficients at unimodular indices vanish. (6) *Constant terms and the
functional equation* (6.8, 6.9). On standard ramified data the constant term along an isotropic line of the
theta integral of a split tame character is a constant of size `C·L♯(z + 1)` times a theta integral for the
pair with one hyperbolic plane removed; Tate's argument on the same line gives the continuation of the partial
L-function of such a character to a real half-line and a functional equation in absolute values.

The users are these. The second moment of Poincaré series uses Siegel's formula, the mass ratio and the ideal
zeta bounds (`SecondMomentsOfPoincareSeries`, `RemainingAndMainTermsOfSecondMoments`); the local theory of two
frames uses the local density bounds (`PairsOfFramesAtOnePlace`); the norms of theta lifts and the comparison
operator use the inner product formula for sharp data, the rank-one vacuum sum and the reproducing formula
(`NormsOfThetaLiftsAndExchangeIdentities`); the lower bound for chains of lifts uses the inner product formula,
and its exchange identity uses the constancy theorem, the singular forms, the constant terms along a line, the
products of L-values and the functional equation (`DeterminantsOfThetaLiftChains`); the Galois representations
of eigenforms use the inner product formula for sharp data (`GaloisRepresentationsOfUnitaryEigenforms`).

Everything is over a CM field `E` with the Weil data of `WeilRepresentationsOnBanachSpacesOfData §3.1`, in
particular with a primitive root of unity of order `5040`, so that `E` is unramified over its maximal real
subfield at every finite place. The hermitian spaces are locally standard (isometric to the identity form at
every finite place). The Weil representation acts on the Banach space of data
(`WeilRepresentationsOnBanachSpacesOfData §3.4`), not on Schwartz–Bruhat functions; Eisenstein series appear only
as sums of zero terms over Lagrangians, and L-functions only as Euler products at real points `x ≥ 1`, with a
continuation to a real half-line in 6.9. Besides `WeilRepresentationsOnBanachSpacesOfData`, the statements cite
`AdelicUnitaryGroupsAndAlgebraicModularForms` (adelic unitary groups, automorphic forms, class sums),
`IdelicReciprocityCountsAndCyclotomicClassGroups` (characters of `U(1)` and their L-functions),
`HolomorphicDiscreteSeriesOfUnitaryGroups` (measures at a place, holomorphic coefficients) and, for Witt's theorem
over a field, `HermitianFormsAndLattices`.

Layer 1 treats neighbours, the vacuum coefficients and the series of translates. Layer 2 treats Siegel sets,
the zero terms along Lagrangians and the Siegel–Weil formula in Weil's range, and the constancy theorem.
Layer 3 treats Siegel's formula for one vector, the masses of the standard lattices, and local densities.
Layer 4 treats the doubling identity and Rallis' inner product formula. Layer 5 treats singular forms. Layer 6
treats the constant terms of theta integrals along an isotropic line, Tate's integral and the functional
equation.

## Conventions and notation

**Labels.** Under each section heading, `*Origin:*` says where the statement comes from and
`*Method of the formal proof:*` how [ShortProof] proves it. The pointer `[ShortProof]` names the file and
declarations of the shorter formal proof (under its directory `src/`) where the statement is proved; its
hypotheses, ranges and constants are recorded in the statement. Where a statement here is wider than the formal
proof's, its last sentence says which case the formal proof proves. A section that states a modest form of a
deep general theorem of another roadmap says in a closing sentence which section also implies it.

**Field and places.** `E` is a CM field with a primitive `5040`-th root of unity, a CM type `Φ` (one embedding
`τ : E → ℂ` above each infinite place) and Weil data `(ȷ, α, υ)` (the purely imaginary element, the finite idele
and the splitting character) as in `WeilRepresentationsOnBanachSpacesOfData §3.1`. The root of unity makes
`E/E⁺` unramified at every finite place, so every finite place of `E⁺` is split or inert in `E`, and gives an
integer `y ∈ O_E` with `y − ȳ` a unit and an integer of norm `−1`. Only what a statement uses is needed; the
statements below assume the Weil data throughout.

**Adeles.** `𝔸` is the ring `ℂ^Φ × 𝔸_f` (one copy of `ℂ` for each infinite place, times the finite adeles), `Ô`
the integral finite adeles, `ψ` and `ψ_f` the standard additive characters of `𝔸` and `𝔸_f`, `|a|` the module of
an idele, as in `AdelicUnitaryGroupsAndAlgebraicModularForms §2.1`. For a set `A`
of finite places, `Ā` is its conjugate and `A ∪ Ā` its conjugation closure; `𝔸_f`-points are *supported on*
`A ∪ Ā` if their components outside `A ∪ Ā` are trivial, and *integral at* `A` if their components at `A` are
integral. `E_S = ∏_{w ∈ S} E_w` for a finite set `S` of finite places.

**Spaces and groups.** A *locally standard space* `S` of rank `n` and signs `s ∈ {±1}^n` is a hermitian space
`(E^n, J)` with a frame `x ∈ GL_n(𝔸)` in which the form is `diag(s)` at every infinite place and the identity
at every finite place (`AdelicUnitaryGroupsAndAlgebraicModularForms §3.1`); forms are conjugate-linear in the
first variable, `x* = x̄ᵀ`. `G(S)` is its adelic unitary group read in the frame, `G(S) = G_∞(S) × G_f`, where
`G_∞(S) = ∏_τ U(diag s)` and `G_f` is the unitary group of the identity form over `𝔸_f`; `Γ_S` is the image of the
rational points `U(S)(E)`; `[U(S)]` is the quotient `Γ_S\G(S)`, with the quotient measure of
`AdelicUnitaryGroupsAndAlgebraicModularForms §§1.1, 3.1` and total mass `vol([U(S)])`.
`L = Ô^n` is the standard lattice and `K₀ = G_f ∩ GL_n(Ô)` its stabiliser. A *level* is an open subgroup of
`K₀`. The *standard space* of rank `n` is `E^n` with the form `x*x`, signs all `+1` and frame `1`; a *hyperbolic
plane* `H` has the basis `l, k` with `l*l = k*k = 0`, `l*k = 1`.

**Forms and lifts.** Automorphic functions on `G(S)` (continuous, left invariant under `Γ_S` and right invariant
under an open subgroup of `G_f`), forms of type `e` for a function `e` on `G_∞(S)` (automorphic, bounded, fixed by
right convolution with `e` when `e` is integrable), rapid decay, right translation `R`, real convolution, a level
of a function (right invariance under an open subgroup of `G_f`), the Petersson product `⟨ , ⟩` over `[U(S)]`,
class sums and masses are those of `AdelicUnitaryGroupsAndAlgebraicModularForms §§1.4, 4.2, 4.4, 5.1`. The Banach
space of data `𝒮(V)` of a locally standard space `V`, the Weil representation `ω_{a,b}` of `G(S) × G(T)` on
`𝒮(Hom(S, T))` twisted by the automorphic characters `a` of `det h` and `b⁻¹` of `det g`, the theta functional
`θ`, the theta kernel and the theta lift `Θ_φ`, the vacuum `vac`, the Heisenberg translations `ϱ(z)`, the
projection onto the vacua above a set of places, the finite part of `𝒮`, the Fock space of the real places and
the datum `v ⊗ F` of a Fock vector `v` and a datum `F`, the real Weil representation `Ω` on the Fock space,
splittings `V = (lE^p ⊕ kE^p) ⊥ ιV₀` with their slices and zero terms, Schrödinger operators of Schwartz–Bruhat
functions above a set of places, and edges are those of
`WeilRepresentationsOnBanachSpacesOfData §§2.1, 3.4, 3.6, 3.7, 5.1, 5.4, 5.5, 6.1, 6.2, 6.4, 7.2`.

**Characters and L-functions.** Automorphic characters `ν` of `U(1)` (continuous characters of `U(1)(𝔸)`
trivial on `U(1)(E)`), their *weight* `l ∈ ℤ^Φ`, *tame part* `(ψ_w)` and base change `ν̃(x) = ν(x/x̄)` are as in
`IdelicReciprocityCountsAndCyclotomicClassGroups §7.1`, and a *split tame character* `𝔠 = (ν, S)` of weight `μ`
(`μ_τ > 0`, tame part nontrivial exactly on a nonempty finite set `S` of places disjoint from `S̄`) is as in
`IdelicReciprocityCountsAndCyclotomicClassGroups §7.6 (c)`. `L^S(x, ν)`, for a set `S` of finite places and real
`x`, is the Euler product of `ν̃` without the factors at `S ∪ S̄`
(`IdelicReciprocityCountsAndCyclotomicClassGroups §8.5`); `υ₁` is `υ` restricted to `U(1)(𝔸)`
(`IdelicReciprocityCountsAndCyclotomicClassGroups §7.6 (b)`); and `χ_𝔠(t) = ν(t/t̄)` is the tame character of `𝔠`
on `E_S`.

### Table of symbols

| Symbol | Meaning | Defined |
|---|---|---|
| `E, E⁺, Φ, f` | the CM field, its maximal real subfield, the CM type, the number of infinite places | above; `WeilRepresentationsOnBanachSpacesOfData §3.1` |
| `rd_E, D_E` | the root discriminant and the discriminant of `E`, `|D_E| = rd_E^{2f}` | Mathlib |
| `ȷ, α, κ_E, υ, υ₁` | the Weil data: imaginary element, finite idele, the idele with finite part `α` and components `(2π Im τȷ)^{−1/2}` at infinity, splitting character, its restriction to `U(1)` | `WeilRepresentationsOnBanachSpacesOfData §3.1`; `IdelicReciprocityCountsAndCyclotomicClassGroups §7.6 (b)` (`υ₁`) |
| `w, w̄, q_w, k_w, ϖ_w, O_w` | a finite place of `E`, its conjugate, the order of its residue field, the residue field, a uniformiser, the local integers; `w` is split if `w ≠ w̄` | |
| `𝔸, 𝔸_f, Ô, ψ, ψ_f, |·|` | adeles, finite adeles, integral finite adeles, standard additive characters, the idele module | `AdelicUnitaryGroupsAndAlgebraicModularForms §2.1` |
| `vol(Ô)` | the volume `2^{r₂}/√|D_E|` of `Ô` for the Haar measure of `𝔸_f` used | `AdelicUnitaryGroupsAndAlgebraicModularForms §2.1` |
| `S, T, W, V` | locally standard hermitian spaces; `n = rk S`, `m = rk T` | above |
| `G(S), G_∞(S), G_f, Γ_S, [U(S)]` | adelic unitary group, its archimedean and finite parts, rational points, quotient | above |
| `L, K₀, K_A, G_f^A` | the standard lattice `Ô^n`; its stabiliser; the points integral at `A`; the points supported on `A ∪ Ā` | 1.1 |
| `Δ(g)` | the multiplier of `g ∈ G_f`: `|Δ(g)|² = [L : L ∩ g⁻¹L]`, `Δ(g⁻¹) = conj Δ(g)` | `WeilRepresentationsOnBanachSpacesOfData §3.2` |
| `mc_{M,b}, 𝒯_{M,b,A}, σ_{n,M,b}(A)` | vacuum coefficient, series of translates, vacuum sum | 1.1 |
| `R(g)` | right translation by `g` | |
| `𝒮(V), ω_{a,b}, θ, Θ_φ, vac` | data, Weil representation, theta functional, theta lift, vacuum | `WeilRepresentationsOnBanachSpacesOfData §§3.4, 3.6, 6.1, 6.4` |
| `ev_L, f[x], A_x, a_x` | zero term of a Lagrangian, value in a Schrödinger model, normalised torus, dyadic Levi element | 2.1 |
| `ζ_R(μ)` | the ideal zeta sum of a ring | 3.1 |
| `δ(Φ₀, α)` | the density of `Φ₀` at the norm `α` | 3.1 |
| `mass(l)` | the class sum of `1` for the standard lattice of rank `l` | `AdelicUnitaryGroupsAndAlgebraicModularForms §4.4` |
| `ν̃, L^S(x, ν), 𝔠 = (ν, S), χ_𝔠` | base change, partial L-function, split tame character, its tame character | above |
| `L♯(z), L_*(e)` | `|L^S(z, ν)|·∏_{w ∈ S} q_w^{z − 1/2}`; the product of `L♯`-type values | 6.1 |

## Layer 1: Neighbours, vacuum coefficients and the series of translates

### 1.1 Definitions: neighbour vectors, vacuum coefficients and the series of translates

*Origin:* definitions and conventions.

Let `n ≥ 1`, `L = Ô^n` with the form `⟨x, z⟩ = x*z`, and `G_f`, `K₀` as in the conventions.

(a) *Neighbour vectors.* A vector `x ∈ 𝔸_f^n` is a neighbour vector at the finite place `w` if its components
at all places other than `w` vanish, `ϖ_w x_w ∈ O_w^n`, `x_w ∉ O_w^n`, and `x*x ∈ Ô`. Its *neighbour* is
`L(x) = L₀(x) + Ôx` with `L₀(x) = {z ∈ L : x*z ∈ Ô}`, and its *line* is the line of the reduction of `ϖ_w x_w`
in `k_w^n`. An element `ρ ∈ G_f` *maps the neighbour of `x` into `L`* if `ρL₀(x) ⊆ L` and `ρx ∈ L`. The lattice
`L(x)` is the neighbour `{y ∈ L : h(x, y) ∈ O_E} + O_E x` of `HermitianFormsAndLattices §5.4` (the metric form), read
over the integral finite adeles for `x` supported at one place; no second notion of neighbour is introduced.

(b) *Residues and steps.* `R_w ⊆ k_w` is the set of reductions of `ϖ_w s_w` for the finite adeles `s` supported
at `w` with `ϖ_w s_w ∈ O_w` and `s + s̄ ∈ Ô`. The *steps* at `w` are the pairs `(ℓ, r)` with `ℓ` a line in
`k_w^n` and `r ∈ R_w`.

(c) *Levels and representatives.* For a set `A` of finite places, `K_A` is the group of `g ∈ G_f` with
`g_w ∈ GL_n(O_w)` for `w ∈ A`, and `G_f^A` the group of `g ∈ G_f` with `g_w = 1` for `w ∉ A ∪ Ā`. Each coset
`q ∈ G_f/K_A` contains an element `r(q) ∈ G_f^A`, the element that agrees on `A ∪ Ā` with a chosen member of `q`
and is `1` elsewhere; fix this choice.

(d) *Vacuum coefficients.* For `M ∈ ℕ`, an automorphic character `b` of `U(1)` and `g ∈ G_f`,
`mc_{M,b}(g) = (b(det g)·Δ(g)^M)⁻¹`; its modulus is `[L : L ∩ g⁻¹L]^{−M/2}`. The character `b ∘ det` is
*unramified on `A`* if `b(det k) = 1` for all `k ∈ K₀ ∩ G_f^A`; this holds when the tame part of `b` is trivial at
the places of `A ∪ Ā`.

(e) *The series of translates.* For a locally standard space `S` of rank `n` and a function `y` on `G(S)`,
`𝒯_{M,b,A} y(g) = Σ_{q ∈ G_f/K_A} mc_{M,b}(r(q))·y(g·(1, r(q)))`, read as `0` where the terms are not summable;
the *vacuum sum* is `σ_{n,M,b}(A) = Σ_q mc_{M,b}(r(q))`, the value of the series on the constant `1`.

(f) *Step weights.* `s_{n,M}(w) = #{steps at w}·q_w^{−M/2}`.

(g) *Place signs.* Fix a well-ordering of the finite places; `ε_w = −1` if `w` precedes `w̄` and `ε_w = 1`
otherwise. So `ε_w = 1` if `w = w̄`, and `{ε_w, ε_w̄} = {1, −1}` on a split pair; the product over the places
above one place `v` of `E⁺` of `1 − ε_w q_w^{−k}` is `1 − q_v^{−2k}`.

[ShortProof], `Lib/SiegelWeil/NeighbourLattices.lean` (`New.SiegelWeil.IsNeighbourVector`,
`New.SiegelWeil.MapsNeighbour`, `New.SiegelWeil.neighbourResidues`);
`Lib/SiegelWeil/UnramifiedSeries/VacuumCoefficients.lean` (`New.SiegelWeil.vacuumCoeff`,
`New.SiegelWeil.cosetRep`, `New.SiegelWeil.IsUnramifiedOn`, `New.SiegelWeil.rallisSeries`,
`New.SiegelWeil.stepWeight`); `Lib/SiegelWeil/UnramifiedSeries/RallisSeries.lean` (`New.SiegelWeil.vacuumSum`);
`Lib/SiegelWeil/RallisInner/SharpData.lean` (`New.placeSign`)

### 1.2 One neighbour step towards the standard lattice

*Origin:* adapted from Kneser (1957), the neighbour method, in the Hermitian form of Kirschmer (2016),
Definition 5.2.1 and Propositions 5.2.4, 5.2.5: here for the standard lattice `Ô^n` over the integral finite
adeles and its translates by finite adelic unitary elements, with a finite family of unitary elements at one
place that carries every neighbour there into `L`, the count of that family, and the drop of the index.

*Method of the formal proof:* (c) take a column of `γ` with a pole at some `w` and scale it by a local element so
that its largest pole has order one. (b) For one neighbour vector a quasi-reflection supported on `{w, w̄}` maps
its neighbour into `L`; the same element serves every neighbour vector with the same line and the same residue
of `ϖ_w⟨b, cx − b⟩` against a fixed base vector `b` of the line, after scaling `x` by a local unit `c`. (a) At a
split place an integral trace `s + s̄` of an adele supported at `w` forces `s` integral; in general, with
`y ∈ O_E` and `y − ȳ` a unit, `(r, r′) ↦ r + yr′` is injective on `R_w × R_w`. (d) The multiples of `z` by
representatives of the residue field give `q_w` distinct classes in `(L ∩ (ργ)⁻¹L)/(L ∩ γ⁻¹L)`.

Let `n ≥ 1` and use the notation of 1.1.
(a) If `w` is split, `R_w` has at most one element. For every finite place `w`, `(#R_w)² ≤ q_w`.
(b) For every finite place `w` there is a family `(ρ_{ℓ,r})`, indexed by the steps at `w`, of elements of
`G_f^{{w}}` (component `1` outside `{w, w̄}`) such that for every neighbour vector `x` at `w` some `ρ_{ℓ,r}` maps
the neighbour of `x` into `L`.
(c) If `γ ∈ G_f` and `γ ∉ K₀`, there are a finite place `w` with `γ_w ≠ 1` and `z ∈ L` such that `γz` is a
neighbour vector at `w`.
(d) If `z ∈ L`, `γz` is a neighbour vector at `w`, and `ρ ∈ G_f` maps the neighbour of `γz` into `L`, then
`q_w·[L : L ∩ (ργ)⁻¹L] ≤ [L : L ∩ γ⁻¹L]`.

(c) and (d) also follow from the metric form of the neighbour step in `HermitianFormsAndLattices §5.4`; (a) and
(b) are not stated there.

*Needs:* 1.1; `AdelicUnitaryGroupsAndAlgebraicModularForms §3.1` (finite unitary group, standard level);
`WeilRepresentationsOnBanachSpacesOfData §3.2` (finite multiplier and its index).

[ShortProof], `Lib/SiegelWeil/NeighbourLattices.lean` (`New.SiegelWeil.card_neighbourResidues_le_one`,
`New.SiegelWeil.card_neighbourResidues_sq_le`, `New.SiegelWeil.exists_family_mapsNeighbour`,
`New.SiegelWeil.exists_isNeighbourVector_mulVec`, `New.SiegelWeil.q_mul_norm_finMultiplier_mul_sq_le`)

### 1.3 Weights of the steps and the sum of the vacuum coefficients

*Origin:* particular to this proof: a bound for the sum of the vacuum coefficients over the cosets of a level,
obtained by counting walks through neighbours with weights that are summable over the places when `M > 2n`.

*Method of the formal proof:* there are at most `q_w^n/(q_w − 1)` lines and, by 1.2 (a), at most `√q_w`
residues (one at a split place), which gives the bounds on `s_{n,M}(w)`; the residue fields have at least four
elements because `X² + X + 1` and `X² + 1` have roots in `O_E` but none in the fields with two and three elements.
By 1.2 (c), (b), (d) every coset other than `K_A` is reached from `K_A` by a walk of steps at places of `A ∪ Ā`,
each of which multiplies the modulus of the vacuum coefficient by at most `q_w^{−M/2}`; a general lemma on sums
along walks then bounds the sum over the nontrivial cosets by `ϱ + ϱ² + ⋯ ≤ 1/2` when the weights add up to
`ϱ ≤ 1/3`.

Let `n ≥ 1` and `M ∈ ℕ` with `2n < M`, and let `b` be an automorphic character of `U(1)`.
(a) `q_w ≥ 4` for every finite place `w`.
(b) `s_{n,M}(w) ≤ 1/(q_w − 1)` for every `w`, and `s_{n,M}(w) ≤ 1/((q_w − 1)√q_w)` if `w` is split;
`s_{n,M}(w) + s_{n,M}(w̄) ≤ 1/3` (one term if `w = w̄`); and `Σ_w s_{n,M}(w) < ∞` over all finite places.
(c) `Δ(kgk′) = Δ(g)` for `k, k′ ∈ K₀`, and `Δ(gg′) = Δ(g)Δ(g′)` if at each place one of `g`, `g′` has
component `1`. If `A₂` is disjoint from `A₁ ∪ Ā₁`, then `(q₁, q₂) ↦ coset of r(q₁)r(q₂)` is a bijection
`G_f/K_{A₁} × G_f/K_{A₂} → G_f/K_{A₁∪A₂}`; `mc_{M,b}(u₁u₂) = mc_{M,b}(u₁)·mc_{M,b}(u₂)` for `u₁ ∈ G_f^{A₁}` and
`u₂ ∈ G_f^{A₂}`, so that `|mc_{M,b}(r(q))| = |mc_{M,b}(r(q₁))|·|mc_{M,b}(r(q₂))|` when `q` is the image of
`(q₁, q₂)`, and `mc_{M,b}(r(q)) = mc_{M,b}(r(q₁))·mc_{M,b}(r(q₂))` when moreover `b ∘ det` is unramified on
`A₁ ∪ A₂`; and if the coefficients are absolutely summable over the cosets of `K_{A₁}` and of `K_{A₂}`, they are so
over those of `K_{A₁∪A₂}`.
(d) If `Σ_{w ∈ A ∪ Ā} s_{n,M}(w) ≤ 1/3`, then `Σ_{q ∈ G_f/K_A} |mc_{M,b}(r(q))| ≤ 3/2`.

*Needs:* 1.1, 1.2.

[ShortProof], `Lib/SiegelWeil/UnramifiedSeries/VacuumCoefficients.lean` (`New.FinPlace.four_le_q`,
`New.SiegelWeil.stepWeight_le`, `New.SiegelWeil.stepWeight_le_of_isSplit`,
`New.SiegelWeil.tsum_stepWeight_conjClosure_singleton_le`, `New.SiegelWeil.summable_stepWeight`,
`New.SiegelWeil.finMultiplier_mul_mul_of_mem_stdLevel`, `New.SiegelWeil.bijective_mk_cosetRep_mul`,
`New.SiegelWeil.vacuumCoeff_mul_of_disjoint`, `New.SiegelWeil.finMultiplier_cosetRep_mk`,
`New.SiegelWeil.summable_norm_vacuumCoeff_union`, `New.SiegelWeil.tsum_ofReal_norm_vacuumCoeff_le`,
`New.tsum_le_of_walk`); `Lib/SiegelWeil/UnramifiedSeries/RallisSeries.lean` (`New.SiegelWeil.vacuumCoeff_cosetRep_mk`)

### 1.4 The series of translates: convergence, forms, multiplicativity and injectivity

*Origin:* adapted from the Rallis inner product formula in Weil's convergent range (Rallis (1984), *Injectivity
properties of liftings associated to Weil representations*, Proposition 1.1, for orthogonal–symplectic pairs;
Li (1992)) and from Rallis (1984), *Injectivity properties of liftings associated to Weil representations*,
Theorem 1.6, the injectivity of theta lifts: here the contribution of the unramified places is left as a series
of translates acting on the bounded functions of a level of a source space of any signature, and its
injectivity is proved by counting neighbours, with no L-function.

*Method of the formal proof:* induction over sets of places: the statements hold for sets of total step weight
at most `1/3` by 1.3 (d) (for injectivity, the nontrivial cosets change a bounded `y` by at most half its sup
norm), every pair `{w, w̄}` is such a set by 1.3 (b), so is the set of places outside a finite set because the
weights are summable, and the statements pass to disjoint unions by multiplicativity (c).

Let `S` be a locally standard space of rank `n` and signs `s`, `m` an integer with `2n < m`, `b` an automorphic
character of `U(1)`, `A` a set of finite places, and write `mc = mc_{m,b}`, `𝒯_A = 𝒯_{m,b,A}`.
(a) `Σ_{q ∈ G_f/K_A} |mc(r(q))| < ∞`.
(b) For bounded `y` on `G(S)`, the series `𝒯_A y` converges uniformly, `|𝒯_A y| ≤ (Σ_q |mc(r(q))|)·sup |y|`, it
commutes with left translations, and it is continuous if `y` is continuous. For bounded measurable `y`, a
function `y′` integrable on `[U(S)]` and `x ∈ G(S)`, `Σ_q mc(r(q))·⟨y′, R(x·r(q))y⟩ = ⟨y′, R(x)𝒯_A y⟩`, the
sum converging. If `b ∘ det` is unramified on `A` and `J` is a subgroup of `G_f` with `K₀ ∩ G_f^A ⊆ J ⊆ K_A`,
then for every form `y` of type `e` on `S` that is fixed by `J`, `𝒯_A y` is a form of type `e` fixed by `J`.
(c) If `A₂` is disjoint from `A₁ ∪ Ā₁`, `b ∘ det` is unramified on `A₁ ∪ A₂`, and `y` is bounded and fixed by
`K₀ ∩ G_f^{A₁∪A₂}`, then `𝒯_{A₁∪A₂} y = 𝒯_{A₁}(𝒯_{A₂} y)`.
(d) If `b ∘ det` is unramified on `A`, `y` is bounded and fixed by `K₀ ∩ G_f^A`, and `𝒯_A y = 0`, then `y = 0`.

*Needs:* 1.1, 1.3; `AdelicUnitaryGroupsAndAlgebraicModularForms §5.1` (forms of a type, Petersson product).

[ShortProof], `Lib/SiegelWeil/UnramifiedSeries/RallisSeries.lean` (`New.SiegelWeil.summable_norm_vacuumCoeff`,
`New.SiegelWeil.tendstoUniformly_rallisSeries`, `New.SiegelWeil.norm_rallisSeries_le`,
`New.SiegelWeil.hasSum_petersson_rallisSeries`, `New.SiegelWeil.exists_form_eq_rallisSeries`,
`New.SiegelWeil.rallisSeries_union`, `New.SiegelWeil.eq_zero_of_rallisSeries_eq_zero`)

### 1.5 The vacuum sum over the places, and its value in rank one

*Origin:* adapted from the Rallis inner product formula (Rallis (1984), *Injectivity properties of liftings
associated to Weil representations*, Proposition 1.1; Li (1992); Gan, Qiu and Takeda (2014)), in its case of the
trivial representation of a definite unitary group of rank `2k` lifted from `U(1)`: here the unramified local
integrals in rank one are sums over cosets, evaluated at every finite place where the character is unramified
(the places of residue characteristic `2` included) and assembled into a partial Hecke L-value over a partial
Euler product.

*Method of the formal proof:* (a) the vacuum sum is multiplicative over disjoint sets of places on which `b ∘ det`
is unramified (1.4 (c) applied to the constant `1`; 1.3 (c)), and the sums over `A ∩ (finite sets)` tend to the sum
over `A` by absolute summability (1.4 (a)). (b) At a place
`w = w̄` there is one coset. At a split pair the cosets are represented by the points with component `ϖ_w^z` at
`w`, the conjugate inverse at `w̄` and `1` elsewhere (`z ∈ ℤ`); the vacuum coefficient of such a point is the
`|z|`-th power of `ν̃(ϖ_u)·q_u^{−k}`, with `u = w̄` for `z ≥ 0` and `u = w` for `z < 0`, so the sum is two geometric
series. (c) is (a) with the local factors of (b) and the Euler products of
`ν̃⁻¹` and of `ε` off `D`.

(a) Let `2n < m`, let `A` be stable under conjugation, and let `b ∘ det` be unramified on `A`. Let complex
numbers `ℓ_w` have unconditionally convergent product `P`, with `ℓ_w = 1` for `w ∉ A` and
`σ_{n,m,b}({w, w̄}) = ∏_{u ∈ {w, w̄}} ℓ_u` for every `w ∈ A`. Then `σ_{n,m,b}(A) = P`.
(b) Let `n = 1`, `k ≥ 2`, and let `ν` be an automorphic character of `U(1)` of weight `l` and tame part `(ψ_w)`
with `ψ_w = ψ_w̄ = 1`. Then
`σ_{1,2k,ν·υ₁^k}({w, w̄}) = ∏_{u ∈ {w, w̄}} (1 − ε_u q_u^{−k})/(1 − ν̃(ϖ_u)⁻¹ q_u^{−k})`.
(c) If moreover `ψ_w = 1` for every `w ∉ S` and `D = S ∪ S̄`, then the vacuum sum over the places outside `D` is
`σ_{1,2k,ν·υ₁^k}(complement of D) = L^S(k, ν⁻¹)/∏_{w ∉ D}(1 − ε_w q_w^{−k})⁻¹`.
Since `E/E⁺` is unramified at the finite places, the denominator is the value at `2k` of the Dedekind zeta
function of `E⁺` without the Euler factors at the places below `D`.

Outside its set of bad places, `ThetaLiftsForDefiniteUnitaryGroups §5.2` gives the same local factors for
`n = 1`, `d = 2k`; its bad set contains the places where the additive character ramifies, which (c) does not
exclude.

*Needs:* 1.1, 1.3, 1.4; `IdelicReciprocityCountsAndCyclotomicClassGroups §§7.1, 7.6, 8.1, 8.5` (characters of
`U(1)`, partial Euler products); `WeilRepresentationsOnBanachSpacesOfData §3.1` (splitting character).

[ShortProof], `Lib/SiegelWeil/UnramifiedSeries/RallisSeries.lean` (`New.SiegelWeil.vacuumSum_union`,
`New.SiegelWeil.tendsto_vacuumSum_inter`, `New.SiegelWeil.vacuumSum_eq_of_hasProd`);
`Lib/SiegelWeil/RallisInner/SharpData.lean` (`New.vacuumSum_pair`, `New.vacuumSum_eq_L_div_eulerProd`)

## Layer 2: Siegel sets, zero terms and the Siegel–Weil formula in Weil's range

### 2.1 Definitions: complete splittings, Lagrangians, zero terms and the normalised torus

*Origin:* definitions and conventions.

Let `S` (rank `n`, signs `s`) and `T` (rank `m`, signs `t`) be locally standard spaces.

(a) A *complete splitting* `P` of `S` into `p` hyperbolic planes is a splitting of `S` in the sense of
`WeilRepresentationsOnBanachSpacesOfData §5.1` whose complement has rank `0`: rational
frames `l = (l_1, …, l_p)`, `k = (k_1, …, k_p)` with `l_i*Jk_j = δ_{ij}` and `l_i*Jl_j = k_i*Jk_j = 0`, spanning
`E^n`; so `n = 2p`. Its *Lagrangian* is the span of `k`. A *Lagrangian* of `S` is a subspace `Λ ⊆ E^n` equal to
its own orthogonal for `J`. Every Lagrangian is the Lagrangian of a complete splitting; fix one, `P_Λ`, for each.

(b) An element `g ∈ G(S)` *acts on the frame of `P` by* `a ∈ GL_p(𝔸)` if `g k = k a` in adelic coordinates. The
*Levi element* `P.levi(a)` and the *radical element* `n(ν)`, for `ν ∈ M_p(𝔸)`, are `m(a, 1)` and `n(0, ν)` of
`WeilRepresentationsOnBanachSpacesOfData §5.1` (`n(ν)` fixes `k` and sends `l` to `l − k·½ȷ⁻¹(ν + ν*)`). For
`x ∈ ℤ^p`, `a_x = P.levi(δ_x)`, where `δ_x` is diagonal with entries `2^{x_i}` at every infinite place and `1` at
every finite place.

(c) `ω` denotes the Weil representation `ω_{a,1}` of `G(S) × G(T)` on `𝒮(Hom(S, T))` with `a = υ₁^{⌊n/2⌋}`, the
twist that makes `G(T)` act on the values below by substitution.

(d) For a complete splitting `P` and `x ∈ M_{m×p}(𝔸)`, the *value* `f[x]` of `f ∈ 𝒮(Hom(S, T))` *in the
Schrödinger model of `P`* is the slice of `f` at `x` for the splitting of `Hom(S, T)` induced by `P`, followed by
`θ` on the data of `Hom(0, T)` (`WeilRepresentationsOnBanachSpacesOfData §§5.5, 6.9`);
it is a continuous linear functional of `f`. The *zero term* along a Lagrangian `Λ` is `ev_Λ(f) = f[0]` for
`P = P_Λ`; it is the mean of `θ(ϱ(z)f)` over the adelic `z ∈ Hom(S, T)` vanishing on `Λ` modulo the rational
ones, and `ev_Λ(f) = f[0]` for every complete splitting with Lagrangian `Λ`.

(e) The *normalised torus* of `P` is `A_x = 2^{−f·m·Σ_i x_i}·ω(a_x, 1)` for `x ∈ ℕ^p`.

[ShortProof], `Lib/SiegelWeil/Formula/LagrangianZeroTerms.lean` (`New.SiegelWeil.CompleteSplitting`,
`New.SiegelWeil.Lagrangian`, `New.SiegelWeil.splitWeil`, `New.SiegelWeil.mixedValue`,
`New.SiegelWeil.Lagrangian.zeroTerm`, `New.SiegelWeil.Lagrangian.exists_completeSplitting`,
`New.SiegelWeil.zeroTerm_lagrangian_eq_theta`, `New.SiegelWeil.normalisedTorus`)

### 2.2 Siegel sets for a split unitary group

*Origin:* adapted from the published theory of reduction for arithmetic groups (Siegel sets cover the adelic
quotient): here for the unitary group of a split locally standard hermitian space, with the torus of the Siegel
parabolic of one complete splitting, in the order `γ·a_x·κ`, with exponents only bounded below.

*Method of the formal proof:* by Mahler's compactness criterion there are, for each `g`, a rational basis of
`E^n` bounded at `g` whose Gram matrix lies in a finite set; an isotropic frame fixed for each member of that set
gives a rational Lagrangian with a basis bounded at `g`. The normal form (a), proved from the Iwasawa
decomposition and Witt's theorem, then bounds the torus exponents on one side.

Let `S` be a locally standard space with a complete splitting `P` into `p` hyperbolic planes, with frame `k`.
(a) There is a compact set `Ω ⊆ M_p(𝔸) × G(S)` such that for every `g ∈ G(S)` and every `γ ∈ Γ_S` there are
`δ ∈ Γ_S`, `x ∈ ℤ^p`, `y ∈ GL_p(E)` and `(ν, κ) ∈ Ω` with `δ⁻¹g = n(ν)·a_x⁻¹·κ` and `δ⁻¹γ k = k y`; in
particular `δk` and `γk` span the same Lagrangian.
(b) There is a compact set `Ω′ ⊆ G(S)` such that every `g ∈ G(S)` is `γ·a_x·κ` with `γ ∈ Γ_S`, `x ∈ ℕ^p` and
`κ ∈ Ω′`.

`AdelicAlgebraicGroups §3.4` ("Siegel sets cover `G(F)\G(𝔸)`") also implies (b), after moving the compact factor
past the torus element and matching the chamber of the Siegel parabolic.

*Needs:* 2.1; `AdelicUnitaryGroupsAndAlgebraicModularForms §§3.6, 4.3, 4.4` (Iwasawa decomposition, reduction,
Mahler's criterion); `HermitianFormsAndLattices §1.1 (b)` (Witt's theorem).

[ShortProof], `Lib/SiegelWeil/Formula/WeilRange.lean` (`New.SiegelWeil.exists_compact_parabolic_normal_form`,
`New.SiegelWeil.exists_siegel_set`)

### 2.3 Zero terms under the parabolic, and a majorant for theta in Weil's range

*Origin:* particular to this proof: the size of the zero terms under the Levi subgroup and along the normalised
torus, and an integrable majorant of the theta function that is uniform in the datum and along the torus.

*Method of the formal proof:* in the Schrödinger model of `P`, `G(T)` acts by substitution and the Levi element
of `a` by a unitary character of `det a` times `|det a|^{m/2}` and the substitution `x ↦ xa`, and theta is the sum of
the values at the rational matrices (a). For (c) expand theta as that sum: the term of `ξ` is a value at
`h⁻¹ξδ_x`, the sum of the norms of the values over the points of a compact set is at most a constant times
`‖f‖`, and the `ξ` concerned have `h⁻¹ξ` in a compact set independent of `x`; the number of such `ξ` is a
function of `h` that is integrable over `[U(T)]` because `m > 2p`. (d) follows from (a) and the Iwasawa
decomposition, which writes `g·a_x·κ` on the frame of `P′` by a block whose determinant stays in a compact set.

Let `S` be a locally standard space with a complete splitting `P` into `p` planes, `T` locally standard of rank
`m`, and `f ∈ 𝒮(Hom(S, T))`.
(a) For `a ∈ GL_p(𝔸)`, `h ∈ G(T)` and `x ∈ M_{m×p}(𝔸)`,
`(ω(P.levi(a), h)f)[x] = χ(det a)⁻¹·|det a|^{m/2}·f[h⁻¹xa]`, with `χ` the unitary Hecke character `υ^{−m}`; and
`θ(ω(1, h)f) = Σ_ξ f[h⁻¹ξ]` over the rational `ξ ∈ M_{m×p}(E)` (in the coordinates of the frame of `T`), the
sum converging.
(b) If `g ∈ G(S)` acts on the frame of `P` by `a`, then `|ev_Λ(ω(gg′, 1)f)| = |det a|^{m/2}·|ev_Λ(ω(g′, 1)f)|`
for the Lagrangian `Λ` of `P` and every `g′`.
(c) If `m > 2p`, there is a measurable `N ≥ 0` on `G(T)` with finite integral over `[U(T)]` such that
`|θ(ω(1, h)A_x f)| ≤ N(h)·‖f‖` for all `h ∈ G(T)`, `x ∈ ℕ^p` and `f`.
(d) Let `P′` be a second complete splitting of `S`, with adelic frame `k′`, let `Z` be an adelic matrix with
`Z k′ = 1`, and let `K ⊆ G(S)` be compact. There is `R ≥ 0` such that for all `g ∈ K`, all `x, u ∈ ℕ^p` with
`Z g k δ_x = Z g k δ_u`, and all `f`: `|ev_{Λ′}(ω(g, 1)A_x f)| ≤ R·‖f‖·2^{f·m·(Σu_i − Σx_i)}`, where `Λ′` is the
Lagrangian of `P′`.

*Needs:* 2.1; `WeilRepresentationsOnBanachSpacesOfData §§3.5, 5.5, 6.1, 6.9` (Weil representation, slices, theta
expansion); `AdelicUnitaryGroupsAndAlgebraicModularForms §§3.6, 4.3` (Iwasawa decomposition, reduction theory).

[ShortProof], `Lib/SiegelWeil/Formula/LagrangianZeroTerms.lean` (`New.SiegelWeil.mixedValue_splitWeil_levi`,
`New.SiegelWeil.mixedValue_splitWeil`, `New.SiegelWeil.hasSum_mixedValue_theta_splitWeil`,
`New.SiegelWeil.norm_zeroTerm_parabolic_mul`, `New.SiegelWeil.theta_normalisedTorus_le`,
`New.SiegelWeil.exists_zeroTerm_normalisedTorus_le`)

### 2.4 Uniform summability of the zero terms

*Origin:* particular to this proof: the zero terms along all rational Lagrangians, composed with the normalised
torus, are bounded by one summable function of the Lagrangian when `m > 2p`; at `x = 0` this is the absolute
convergence of the Eisenstein series of the Siegel–Weil formula, in operator norm.

*Method of the formal proof:* put each Lagrangian in the normal form 2.2 (a) at `g = 1`, with torus exponents
`d + t(Λ)`, `t(Λ) ∈ ℕ^p`. By 2.3 (b) the term of `Λ` is `O(2^{−f·m·Σt_i})`, while only `O(2^{2f·p·Σt_i})`
Lagrangians have a given `t`, by a covering of the adelic matrices by translates of a compact set; the geometric
series converges because `m > 2p`.

Let `S` be locally standard with a complete splitting `P` into `p` planes and `T` locally standard of rank
`m > 2p`. There is a summable `c ≥ 0` on the Lagrangians of `S` such that `‖ev_Λ ∘ A_x‖ ≤ c(Λ)` (operator norm)
for every Lagrangian `Λ` and every `x ∈ ℕ^p`.

*Needs:* 2.1, 2.2, 2.3.

[ShortProof], `Lib/SiegelWeil/Formula/WeilRange.lean` (`New.SiegelWeil.exists_summable_zeroTerm_bound`)

### 2.5 Invariant functionals dominated by the zero terms vanish

*Origin:* particular to this proof: a vanishing criterion for `G(T)`-invariant functionals on the data, by a
maximum principle for a Hecke operator at a split place.

*Method of the formal proof:* it suffices to kill the data `v ⊗ ϱ(z)vac` with `v` polynomial and `z` a finite
adelic vector, which span. Take a split place `w` at which `z` is integral (there are infinitely many split
places, as places of prime norm split). The Hecke transfer at `w` writes `g ↦ λ·ℓ(ω(g, 1)φ)`, for a scalar `λ`,
in norm as a weighted sum of translates of total weight less than `|λ|`; the sum of the norms of the zero terms
of the vacuum is a supersolution of the same inequality, and the maximum principle applies.

Let `S` be locally standard of rank `2p > 0`, `T` locally standard of rank `m > 2p`, and `ℓ` a continuous linear
functional on `𝒮(Hom(S, T))` with `ℓ(ω(1, h)f) = ℓ(f)` for all `h ∈ G(T)` and `f`. Suppose that for every `f`
the zero terms `ev_Λ(f)` are summable over the Lagrangians `Λ` of `S`, and that for every `f` the function
`g ↦ |ℓ(ω(g, 1)f)| − Σ_Λ |ev_Λ(ω(g, 1)vac)|` on `G(S)` is bounded above. Then `ℓ = 0`.

*Needs:* 2.1; `WeilRepresentationsOnBanachSpacesOfData §§3.7, 9.3` (spanning by vacuum translates; Hecke
transfer); `WeilRepresentationsOnBanachSpacesOfData (the maximum principle)`.

[ShortProof], `Lib/SiegelWeil/Formula/LagrangianZeroTerms.lean` (`New.SiegelWeil.eq_zero_of_le_tsum_zeroTerm`,
`New.SiegelWeil.sum_norm_mul_norm_zeroTerm_le`)

### 2.6 The Siegel–Weil formula in Weil's range

*Origin:* adapted from Weil (1965), the Siegel–Weil formula in Weil's range `m > 2d(n)`: here for unitary pairs
over a CM field with Weil data, a split space of rank `2p` against a locally standard space of rank `m > 2p` of
any signature, for every vector of the Banach space of data, with the Eisenstein series written as the sum of the
zero terms over the rational Lagrangians, with their operator norms summable and with an integrable majorant of
theta uniform in the datum.

*Method of the formal proof:* by induction on the rank of `S`. Let `ℓ = vol([U(T)])·Σ_Λ ev_Λ − ∫_{[U(T)]} θ(ω(1, h)·)`,
a continuous functional invariant under `G(T)` and `Γ_S`, by 2.3 (c) and 2.4. Split off the line spanned by one
vector `k_ι` of the frame; its complement `S₁` has a complete splitting, and the formula holds for `S₁` by
induction. As `x_ι → ∞`, uniformly for `f` in compact sets, the theta integral of `A_x f` approaches that of its
zero term along the line, and the sum of the zero terms behaves in the same way, so `ℓ(A_x f) → 0`. With the
Siegel sets of 2.2 this bounds `|ℓ(ω(g, 1)f)| − Σ_Λ |ev_Λ(ω(g, 1)vac)|` above, and 2.5 gives `ℓ = 0`. For `S = 0`
there is one Lagrangian and theta is its zero term.

Let `S` be a locally standard space with a complete splitting into `p` hyperbolic planes and `T` a locally standard
space of rank `m > 2p` (any signs). Then:
(a) `Σ_Λ ‖ev_Λ‖ < ∞`, the sum over the rational Lagrangians of `S` of the operator norms of the zero terms;
(b) there is a measurable `N ≥ 0` on `G(T)`, with finite integral over `[U(T)]`, such that
`|θ(ω(1, h)f)| ≤ N(h)·‖f‖` for all `h` and all `f ∈ 𝒮(Hom(S, T))`;
(c) for every `f ∈ 𝒮(Hom(S, T))` the function `h ↦ θ(ω(1, h)f)` is integrable on `[U(T)]` and
`∫_{[U(T)]} θ(ω(1, h)f) dh = vol([U(T)])·Σ_Λ ev_Λ(f)`.

For Schwartz–Bruhat data and isotropic `T`, (c) is the case of Weil's range `m > 2d(n)` of
`ThetaKernelsForUnitaryDualPairs §6.4a` (in its notation; here `m > 2p`), whose statement does not contain the
bounds (a) and (b), uniform in the datum, that 4.2 uses.

*Needs:* 2.1, 2.2, 2.3, 2.4, 2.5; `WeilRepresentationsOnBanachSpacesOfData §§3.4, 3.5, 3.6, 6.1` (data, Weil
representation, theta functional); `AdelicUnitaryGroupsAndAlgebraicModularForms §§1.1, 4.3` (quotient measures,
finite volume).

[ShortProof], `Lib/SiegelWeil/Formula/WeilRange.lean` (`New.SiegelWeil.siegel_weil`,
`New.SiegelWeil.integrable_theta_splitWeil`, `New.SiegelWeil.tendsto_integral_theta_zeroTerm_sub`,
`New.SiegelWeil.tendsto_tsum_zeroTerm_sub_integral_theta`, `New.SiegelWeil.bddAbove_norm_sub_tsum_norm_zeroTerm`);
`Lib/SiegelWeil/Formula/LagrangianZeroTerms.lean` (`New.SiegelWeil.theta_normalisedTorus_le`)

### 2.7 Constancy of automorphic functions on a unitary group with a hyperbolic plane

*Origin:* adapted from Rapinchuk (2012), Theorem 2.3, strong approximation for a simply connected absolutely
almost simple group and any nonempty finite set of places (the theorem of Kneser and Platonov), and from weak
approximation, Platonov and Rapinchuk (1994), Chapter 7: here only the constancy of an automorphic function on
the full unitary group of an isotropic space, under a level at a nonempty set of places, a level away from it and
a hypothesis on the torus of a hyperbolic plane, proved without strong approximation for `SU`.

*Method of the formal proof:* `D` takes equal values at points that agree off `S ∪ S̄`; since the rational
parameters plus parameters supported on `S ∪ S̄` are dense in each unipotent radical (additive strong
approximation), `D` is left invariant under the radical of every splitting of a hyperbolic plane off `W` with
complement `W₀`. Quasi-reflections lie in the group generated with the torus, and Witt's theorem in the form
"a subgroup containing the quasi-reflections contains `U(W₀)(E)`" gives (b). Weak approximation in `U(W₀)` and in
`U(W)`, and the Iwasawa decomposition for the line of the plane, reduce every point to such Levi elements, on
which the torus hypothesis makes `D` constant.

Let `W` be a locally standard space with a splitting `W = H ⊥ W₀` off a hyperbolic plane `H` (with isotropic line
spanned by `k`), `D` a continuous function on `G(W)` left invariant under `Γ_W`, and `S` a nonempty set of finite
places.
(a) Suppose that `D` is right invariant under `G_f^S` and under the points of `K₀` with component `1` at every
place of `S`, and that, if `D` is left invariant under the unipotent radical of the stabiliser of the line of `k`,
then `D(levi(t, g))` does not depend on `t ∈ GL_1(𝔸)` for `g ∈ G(W₀)`. Then `D` is constant.
(b) If `D` is left invariant under the radical elements of every splitting of a hyperbolic plane off `W` with
complement `W₀`, then for every set `R` of finite places and every `γ ∈ U(W₀)(E)` there is `t ∈ GL_1(𝔸)` such
that `D` is left invariant under the element that agrees with `levi(t, γ)` on `R ∪ R̄` and is `1` elsewhere.

Strong approximation for `SU` (`HermitianFormsAndLattices §2.5 (d)`) also gives (a): it makes `D` a function of
the determinant, and the torus hypothesis removes that dependence.

*Needs:* `AdelicUnitaryGroupsAndAlgebraicModularForms §§2.3, 3.6, 3.8` (strong and weak approximation, Iwasawa);
`AdelicUnitaryGroupsAndAlgebraicModularForms (Witt's theorem and quasi-reflections)`.

[ShortProof], `Lib/SiegelWeil/Formula/StrongApproximation.lean`
(`New.Exchange.IsAutFunction.apply_eq_apply_one`, `New.Exchange.exists_torus_mul_rational_fixes`)

## Layer 3: Siegel's formula, masses and local densities

### 3.1 Definitions: ideal zeta sums, norm-one vectors and the density at a norm

*Origin:* definitions and conventions.

(a) For a subring `R` of a commutative topological ring and `μ ∈ ℕ`, the *ideal zeta sum* is
`ζ_R(μ) = Σ_I [R : I]^{−μ} ∈ [0, ∞]`, over the ideals `I` of `R` of finite index.

(b) For `g ∈ G_f` (rank `n`), the *norm-one vectors of the lattice of `g`* are the `y ∈ E^n` with `y*y = 1` and
`g⁻¹y ∈ Ô^n`.

(c) For a function `Φ₀ ≥ 0` on `𝔸_f^n` and `α ∈ 𝔸_f`, the *density of `Φ₀` at `α`* is
`δ(Φ₀, α) = ∫_z ∫_x Φ₀(x)·ψ_f(z(x*x − α)/2) dx dz`, where `z` runs over the self-adjoint finite adeles (the
finite adeles of `E⁺`) with the Haar measure for which `{z : ψ_f(zÔ) = 1}` has volume `1`, and `x` over `𝔸_f^n`
with the Haar measure for which `Ô` has volume `vol(Ô)` in each coordinate.

[ShortProof], `Lib/SiegelWeil/Mass.lean` (`New.idealZeta`, `New.normOneLatticeVectors`);
`Lib/SiegelWeil/OneVector/SiegelClassSum.lean` (`New.normDensity`)

### 3.2 The Siegel–Weil formula for one vector

*Origin:* adapted from Weil (1965), Siegel's formula in Weil's convergent range for the classical groups,
unitary groups included, here in rank one for `U(V)` acting on the trace form, `n ≥ 3`: here for the hyperbolic
plane against the standard definite space over a CM field with Weil data, for every datum of the Banach space,
with the terms written through the Schrödinger function of the datum, and its Fourier coefficient at a nonzero
norm read off.

*Method of the formal proof:* 2.6 for `S = H` (`p = 1`) and `T` the standard definite space. The isotropic lines
of `H` are the line of `e` and the lines of `e′ + ȷ⁻¹βe`, `β ∈ E⁺` (isotropic because `ȷ` is imaginary), and the
zero term along the line of `e′ + ȷ⁻¹βe` is computed in the model of the opposite splitting, whose values differ
from `Ψ` by the character `ψ(βx*x/2)`. For (d), average the formula over the unipotent elements `n(z)`, `z` in a
fundamental domain of `E⁺` in its adeles: this keeps the term of one norm `α`; the measure of that fundamental
domain gives `|D_E|^{1/4}`.

Let `H` be a hyperbolic plane with basis `e, e′` (`e*e = e′*e′ = 0`, `e*e′ = 1`), `T` the standard definite space
of rank `n ≥ 3`, `ω` as in 2.1 (c), and for `f ∈ 𝒮(Hom(H, T))` let `Ψ(x) = f[x]` (`x ∈ 𝔸^n`) be its values in the
Schrödinger model of the splitting with frame `e`. For `β ∈ E⁺` let `Λ_β` be the line of `e′ + ȷ⁻¹βe`. Integrals
`dx` over `𝔸^n` are for the Haar measure of `𝔸^n` of `AdelicUnitaryGroupsAndAlgebraicModularForms §2.1`.
(a) The isotropic lines of `H` are the line of `e` and the `Λ_β`, `β ∈ E⁺`, and `Σ_β ‖ev_{Λ_β}‖ < ∞`.
(b) `ev_{Λ_β}(f) = ∫_{𝔸^n} Ψ(x)·ψ(βx*x/2) dx`.
(c) `∫_{[U(T)]} θ(ω(1, h)f) dh = vol([U(T)])·(Ψ(0) + Σ_{β ∈ E⁺} ev_{Λ_β}(f))`.
(d) Let `α ∈ E⁺`, `α ≠ 0`, and `P(z) = ∫_{𝔸^n} Ψ(x)·ψ(z(x*x − α)/2) dx` for `z` in the adeles of `E⁺`
(Lebesgue measure at the infinite places, the measure of 3.1 (c) at the finite ones). Then `P` is integrable; for
every `h ∈ G(T)` the sum `σ(h) = Σ_{ξ ∈ E^n, ξ*ξ = α} Ψ(h⁻¹ξ)` converges; `σ` is left invariant under `Γ_T`; and
`∫_{[U(T)]} σ(h) dh = vol([U(T)])·|D_E|^{1/4}·∫ P(z) dz`.
(e) For every Schwartz–Bruhat `Φ₀` on `𝔸_f^n` there is a datum `f` with `Ψ(x) = exp(−Σ_τ (x*x)_τ)·Φ₀(x_f)`.

(c) is also a case of `HermitianFormsAndLattices §6.0a`, which states it for Schwartz–Bruhat functions over any
quadratic extension, as an identity of fibre measures.

*Needs:* 2.1, 2.6; `WeilRepresentationsOnBanachSpacesOfData §§5.3, 5.5, 6.9` (Schrödinger models, data with given
values); `AdelicUnitaryGroupsAndAlgebraicModularForms §2.1` (Haar measures of the adeles);
`AdelicUnitaryGroupsAndAlgebraicModularForms (a fundamental domain for E⁺ in its adeles)`.

[ShortProof], `Lib/SiegelWeil/OneVector/SiegelClassSum.lean` (`New.SiegelWeil.eq_lagrangian_of_notMem_range_shear`,
`New.SiegelWeil.zeroTerm_shearSplitting`, `New.SiegelWeil.siegel_weil_one_vector`,
`New.SiegelWeil.siegel_weil_fourierCoeff`, `New.SiegelWeil.exists_mixedValue_eq_gaussian_mul`)

### 3.3 Siegel's class-sum formula for the vectors of one norm

*Origin:* adapted from Weil (1965), the mean-value form of Siegel's main theorem for the classical groups,
unitary groups included, and its specialisation to definite lattices, Braun (1941), Satz V, after Siegel
(1935–1937): here for one vector (`k = 1`), the standard definite form of rank `n ≥ 3` over a CM field with Weil
data, every level and every nonnegative invariant locally constant test function, with the singular series left
as one adelic Fourier integral.

*Method of the formal proof:* apply 3.2 (d) to the datum of 3.2 (e) for `Φ₀` and the Gaussian, and compute the
archimedean integral `∫ exp(−x*x)ψ(z x*x/2) dx` and its integral in `z` by Laplace's integral for `1/Γ`, place by
place; a class sum of a function invariant on both sides is `[K₀ : K]` times its integral over the quotient.

Let `n ≥ 3`, `K` a level of `G_f` (rank `n`), `Γ` the image of `U_n(E)` in `G_f`, `Φ₀ ≥ 0` a locally constant
function with compact support on `𝔸_f^n` with `Φ₀(kx) = Φ₀(x)` for `k ∈ K`, and `α ∈ E⁺` with `τ(α) > 0` for every
`τ ∈ Φ`.
(a) For every `h ∈ G_f` the sum `σ(h) = Σ_{x ∈ E^n, x*x = α} Φ₀(h⁻¹x)` converges, and
`classSum_{Γ,K}(σ) = classSum_{Γ,K}(1)·|D_E|^{1/4}·∏_{τ ∈ Φ} (π^n·τ(α)^{n−1}/(n − 1)!)·δ(Φ₀, α)`.
(b) For a function `c` on `G_f` left invariant under `Γ` and right invariant under `K`,
`classSum_{Γ,K}(c) = [K₀ : K]·∫_{[U(T)]} c(h_f) dh` for the standard definite space `T`.

`HermitianFormsAndLattices §6.5 (b)` with `k = 1`, together with `§6.0a`, also implies (a), after the
archimedean fibre integral of the Gaussian is computed and the fibre measure at the finite places is identified
with `δ`.

*Needs:* 3.1, 3.2; `AdelicUnitaryGroupsAndAlgebraicModularForms §§1.4, 4.4` (class sums, integration over the
quotient).

[ShortProof], `Lib/SiegelWeil/OneVector/SiegelClassSum.lean` (`New.classSum_eq_mul_normDensity`,
`New.classSum_eq_mul_integral`, `New.integral_gaussian_mul_stdAddChar`, `New.integral_fourierChar_mul_inv_pow`)

### 3.4 Ideal zeta bounds for adelic Gauss sums

*Origin:* particular to this proof: the Gauss sums of the standard form over `Ô`, integrated over the
frequencies, are bounded at all finite places at once by sorting the frequencies by their conductor ideal and
summing over the ideals with the ideal zeta sum.

*Method of the formal proof:* (a) cut the domain into the pieces where the bound holds for a given ideal and sum
`[R : I]^{−μ}`; the countability of the ideals of finite index follows from the finiteness of `ζ_R(μ)`.
(b) Weyl differencing: the square of the Gauss sum is an integral of a character over a coset of the conductor
lattice. (c) The frequencies with a given conductor ideal of index `y` lie in at most `y` cosets of the
codifferent, one for each character of `Ô/I`; then (a). (d) Contraction to `O_E` is injective on the ideals of
finite index of `Ô` and keeps the index, so `ζ_Ô` is at most the Dedekind zeta value, whose logarithm is small.

(a) Let `R` be a subring of a commutative ring with `ζ_R(μ) ≤ 2`, `ρ` a measure, `f ≥ 0`, `s` a set, and `(S_I)` sets
indexed by the ideals of `R`. If almost every `x ∈ s` lies in some `S_I` with `I` of finite index and
`[R : I]^μ·f(x)·ρ(S_I) ≤ V`, then `∫_s f dρ ≤ ζ_R(μ)·V`.
(b) For a self-adjoint finite adele `b` and `Γ ∈ 𝔸_f`, let `I(b)` be the largest ideal of `Ô` on which
`v ↦ ψ_f(bv)` is trivial and `G(b) = ∫_{Ô^n} ψ_f(b(w*w − Γ)/2) dw`. Then `[Ô : I(b)]^n·|G(b)|² ≤ vol(Ô)^{2n}`.
(c) If `ζ_Ô(μ) ≤ 2` and `n ≥ 2(μ + 1)`, then `∫ |G(b)| db ≤ ζ_Ô(μ)·vol(Ô)^n`, the integral over the self-adjoint
finite adeles with the measure of 3.1 (c).
(d) If `n·[E : ℚ] ≤ 2^v`, then `ζ_Ô(u + v + 4)^n ≤ 1 + 2^{−u}` for every `u ∈ ℕ`.

*Needs:* 3.1; `AdelicUnitaryGroupsAndAlgebraicModularForms §2.1` (additive character, Haar measures).

[ShortProof], `Lib/SiegelWeil/Mass.lean` (`New.lintegral_le_idealZeta_mul`, `New.gauss_sum_sq_le`,
`New.lintegral_gauss_sum_le_idealZeta`, `New.idealZeta_intAdeles_pow_le`)

### 3.5 The masses of the standard lattices in consecutive ranks

*Origin:* adapted from Shimura (1997), Gan, Hanke and Yu (2001) and Kirschmer (2016), Proposition 4.2.7 (3), the
exact mass formula, of which the ratios of consecutive masses are quotients: here the logarithm of the ratio for
the standard lattices over a CM field with Weil data, in large rank, up to an explicit error that depends on the
field only through its degree.

*Method of the formal proof:* (a) the norm-one vectors of the lattice of `g` form the intersection of the
`Γ`-orbit and the `gK₀`-orbit of the last basis vector, whose stabiliser is the group of rank `j`; Witt's theorem
identifies the orbits. (b) is 3.3 (a) for the indicator of `Ô^{j+1}` and `α = 1`, with (a). (c) writes the density
as the integral of the Gauss sums of 3.4 (b); the integral frequencies give `vol(Ô)^n`, and the others are bounded
by 3.4 (c) with 3.4 (d).

Let `f` be the number of infinite places of `E`.
(a) For every `j ≥ 0`, the class sum, over `Γ\G_f/K₀` in rank `j + 1`, of the number of norm-one vectors of the
lattice of `g` is `mass(j)`; and `mass(l) > 0` for every `l`.
(b) For `j ≥ 2`, `mass(j) = mass(j + 1)·rd_E^{f/2}·(π^{j+1}/j!)^f·δ(1_{Ô^{j+1}}, 1)`.
(c) If `8f ≤ 2^u`, `n ≥ 4u + 12`, and `δ(1_{Ô^n}, 1) = x·vol(Ô)^n` with `x ≠ 0`, then `|x − 1| ≤ 2^{−u−1}`.
(d) If `8f ≤ 2^u` and `j ≥ 4u + 12`, then
`|log mass(j + 1) − log mass(j) − f·((j + ½)·log rd_E + log j! − (j + 1)·log 2π)| ≤ 2/2^u`.

`HermitianFormsAndLattices §6.4 (b)` (with `n = j + 1`) also implies (d), with the elementary bound
`|log L(j + 1, η^{j+1})| ≤ f·log ζ(j + 1)`.

*Needs:* 3.1, 3.3, 3.4; `AdelicUnitaryGroupsAndAlgebraicModularForms §§1.4, 3.4, 4.4` (class sums, masses, Witt
over `Ô`).

[ShortProof], `Lib/SiegelWeil/Mass.lean` (`New.classSum_card_norm_one_eq_mass`, `New.mass_pos`);
`Lib/SiegelWeil/OneVector/SiegelClassSum.lean` (`New.mass_eq_mass_succ_mul_normDensity`,
`New.norm_sub_one_le_of_normDensity_eq`, `New.abs_log_mass_ratio_sub_le`)

### 3.6 Definitions: semilocal places and disintegrations along a hermitian form

*Origin:* definitions and conventions.

Let `T` be a finite set of finite places of `E`, stable under conjugation, and `A = E_T = ∏_{w ∈ T} E_w` with its
involution `x ↦ x̄`, its integers `R = ∏_{w ∈ T} O_w`, and a Haar measure giving `R` volume `1`. The *modulus*
`|x|` of `x ∈ A` is the factor by which multiplication by `x` scales the Haar measure. Fix an additive character
`ψ` of `A` for which `R` is self-dual (`ψ(ra) = 1` for all `r ∈ R` if and only if `a ∈ R`), an element `τ ∈ R` with
`τ + τ̄ = 1`, a unit `δ ∈ R^×` with `δ̄ = −δ`, and the Haar measure `ν` on the skew elements `{b : b̄ = −b}` for which
the integral skew elements have volume `1` and `(a, b) ↦ τδ⁻¹a + b` carries `ν ⊗ ν` to the Haar measure of `A`.
For a finite set `κ`, the *lattice* is `R^κ`, and for `g ∈ A^×` and `x₀ ∈ A^κ` the *class* `x₀ + gR^κ`.
A hermitian matrix `J` over `A` is *unimodular* if it lies in `GL_κ(R)`. A family `(l_t)`, indexed by the skew
elements `t`, of measures on `A^κ` *disintegrates the Haar measure along* `x ↦ x*Jx` if it disintegrates it along
`J` as in `HolomorphicDiscreteSeriesOfUnitaryGroups §3.1 (c)`, with the `δ` and `ν` above; so `l_t` lives on the
quadric `x*Jx = δ⁻¹t`. The *Gauss sum of a class* at a frequency `b` is
`G_J(g, x₀; α, b) = ∫_{x₀+gR^κ} ψ(τb(x*Jx − α)) dx`.

The formal proof states the results of 3.7 and 3.8 for an abstract finite place: a locally compact ring with
involution, a compact open subring that is locally a product of valuation rings and contains a skew `i` with
`−i² = 1` and a `c` with `c̄c = −1`, and the data above with the listed properties. `E_T`, with the data that the
second moment of Poincaré series uses (`RemainingAndMainTermsOfSecondMoments §7.2 (d)`), is an instance (`E`
contains `√−1`, and `−1` is a norm of a local unit because `E/E⁺` is unramified), and stated on `E_T` the results
lose nothing that the proof uses.

[ShortProof], `Lib/SiegelWeil/OneVector/FinitePlaceDensity.lean` (`New.Floors.IntegralPlace`);
`Lib/SiegelWeil/OneVector/ResidueClasses.lean` (`New.Floors.IntegralPlace.latticeMultiple`,
`New.Floors.IntegralPlace.residueClass`); `Lib/SiegelWeil/OneVector/ClassGaussSums.lean`
(`New.Floors.IntegralPlace.classGaussSum`)

### 3.7 Local densities by Fourier inversion, and Gauss sums of classes

*Origin:* adapted from the published theory of local densities of hermitian forms (the local density as a
limit of normalised counts, equal to an integral of Gauss sums over the frequencies): here as an identity, or an
inequality, for the fibre measures of a disintegration at a product of finitely many completions, with a Weyl
differencing bound for the Gauss sum of a class.

*Method of the formal proof:* (b) the class is compact and open, and multiplication by `g` scales the volume by
`|g|^{#κ}`. (a) Cut the frequencies to `{b : yȳb ∈ R}`: by orthogonality of characters the cut integral is the
volume of the cut times the mass of `f` on a slab, which is a mean of the masses of the quadrics near `δ⁻¹t`; let
the unit `y` tend to `0`, using the continuity in `t`. (c) The square of the Gauss sum is the integral over
`d ∈ gR^κ` of an autocorrelation; up to a phase this is the integral of a character of `gR^κ` that is trivial only
on `gwR^κ`. (d) is (a) for the indicator of the class.

Let `A`, `R`, `ψ`, `τ`, `δ`, `ν` be as in 3.6, with `ψ(x + x̄) = 1` for all `x ∈ A`, and let `J` be hermitian.
(a) Let `(l_t)` disintegrate the Haar measure along `x ↦ x*Jx`, let `f ≥ 0` be continuous with compact support on
`A^κ`, and `t` skew. If `b ↦ ∫ f(x)·ψ(τb(x*Jx − δ⁻¹t)) dx` is `ν`-integrable, its integral is `∫ f dl_t`; in any
case the modulus of `∫∫ f(x)·ψ(τb(x*Jx − δ⁻¹t)) dx dν(b)`, taken as `0` when the outer integrand is not
integrable, is at most `∫ f dl_t`.
(b) For `g ∈ A^×` and `x₀ ∈ A^κ`, the class `x₀ + gR^κ` is compact and open of volume `|g|^{#κ}`.
(c) Let `J` be unimodular, `b` skew, and `w ∈ A^×` such that `w⁻¹c ∈ R` for every `c ∈ R` with `gḡbc ∈ R`. Then
`|G_J(g, x₀; α, b)|² ≤ |g|^{#κ}·(|g|·|w|)^{#κ}` for all `x₀`, `α`.
(d) With `(l_t)` as in (a): if `b ↦ G_J(g, x₀; δ⁻¹t, b)` is `ν`-integrable, its integral is `l_t(x₀ + gR^κ)`; in
any case `l_t(x₀ + gR^κ) ≤ ∫ |G_J(g, x₀; δ⁻¹t, b)| dν(b)`.

*Needs:* 3.6; `HolomorphicDiscreteSeriesOfUnitaryGroups §3.1` (disintegrations along a hermitian form);
`AuxiliaryAlgebraAndAnalysisForThetaLifts (Hermite forms over products of valuation rings)`.

[ShortProof], `Lib/SiegelWeil/OneVector/FinitePlaceDensity.lean`
(`New.Floors.IntegralPlace.setIntegral_eq_slab`, `New.Floors.Place.IsDisintegration.setLIntegral_slab`,
`New.Floors.IntegralPlace.integral_skewMeasure_eq_toReal_lintegral`,
`New.Floors.IntegralPlace.enorm_localDensity_le`); `Lib/SiegelWeil/OneVector/ResidueClasses.lean`
(`New.Floors.IntegralPlace.volume_residueClass`); `Lib/SiegelWeil/OneVector/ClassGaussSums.lean`
(`New.Floors.IntegralPlace.enorm_classGaussSum_sq_le`, `New.Floors.IntegralPlace.integral_classGaussSum`,
`New.Floors.IntegralPlace.measure_residueClass_le_lintegral`)

### 3.8 Local density bounds by an ideal zeta value

*Origin:* particular to this proof: bounds for the masses of classes on hermitian quadrics at a product of
finitely many completions, uniform in the quadric, by an ideal zeta value of the ring of integers, with no
uniformiser.

*Method of the formal proof:* (a) by 3.7 (c), with `w` governed by the denominator of `gḡb`, sort the frequencies by
the ideal of the `c ∈ R` with `gḡbc ∈ R` and sum with 3.4 (a); the rank `≥ 2μ + 1` makes the exponent of the
index at least `μ`. (b) is (a) with 3.7 (d). (c) the integral frequencies contribute exactly `1` to the mass and to
the bound. (d) a basis with Gram matrix a hyperbolic plane plus the identity exists (it uses an integral `c` with
`c̄c = −1`), and the chart measures of the quadrics of that form, carried by the basis, disintegrate the Haar
measure along `x*x`; then (b) for the class of `0` modulo `u⁻¹R^κ`. (e) change variables by `V*`, and sort by the
ideal `tβR`, `t` the content of the singled-out coordinates.

Let `A`, `R`, `ψ`, `ν` be as in 3.6, with `ψ(x + x̄) = 1` for all `x`, and `μ ∈ ℕ` with `ζ_R(μ) ≤ 2`.
(a) If `J` is unimodular with `#κ ≥ 2μ + 1`, then `∫ |G_J(g, x₀; α, b)| dν(b) ≤ ζ_R(μ)·|g|⁻¹·|g|^{#κ}` for all
`g ∈ A^×`, `x₀`, `α`.
(b) If moreover `(l_t)` disintegrates the Haar measure along `x*Jx`, then
`l_t(x₀ + gR^κ) ≤ ζ_R(μ)·|g|⁻¹·vol(x₀ + gR^κ)` for every skew `t`.
(c) In (b), if `t` is integral, `1 + |l_t(R^κ) − 1| ≤ ζ_R(μ)`.
(d) If `#κ = r + 1` with `r ≥ 2μ + 1`, there is an s-finite kernel `(l_β)` that disintegrates the Haar measure along
`x ↦ x*x` and satisfies `l_β({y : u·y_i ∈ R for all i}) ≤ ζ_R(μ)·|u|^{−r}` for every skew `β` and `u ∈ A^×`.
(e) Let `ι = n ⊔ κ` (a finite set split into two parts), `i ∈ κ`, `#κ = s + k` with `k ≥ μ`, `d = #n + k`,
`V ∈ GL_ι(R)` and `β ∈ A^×`. For a vector `p` over `A` indexed by `κ`, let `c_i(p)` be the volume of
`{c ∈ A : c·p_j ∈ R for all j}` if `p_i` is a unit and `∞` otherwise. Then
`∫_{{w : βw ∈ R^ι}} c_i((V*w)|_κ)^s dw ≤ ζ_R(μ)·|β|^{−d}`.

*Needs:* 3.4 (a), 3.6, 3.7; `HolomorphicDiscreteSeriesOfUnitaryGroups §§3.1, 3.5` (quadric measures and their
disintegration).

[ShortProof], `Lib/SiegelWeil/OneVector/SemilocalDensityBounds.lean`
(`New.Floors.IntegralPlace.lintegral_enorm_classGaussSum_le_idealZeta`,
`New.Floors.IntegralPlace.measure_residueClass_le_idealZeta`,
`New.Floors.IntegralPlace.one_add_enorm_measure_intVectors_sub_one_le`);
`Lib/SiegelWeil/OneVector/StandardQuadrics.lean` (`New.Floors.IntegralPlace.exists_kernel_isDisintegration_le`,
`New.Floors.IntegralPlace.isDisintegration_of_hyperbolic_basis`);
`Lib/SiegelWeil/OneVector/FinitePlaceDensity.lean` (`New.Floors.IntegralPlace.lintegral_contentIndex_pow_le`,
`New.Floors.IntegralPlace.exists_content`)

## Layer 4: The doubling identity and Rallis' inner product formula

### 4.1 Definitions: matrix coefficients, clean data and sharp data

*Origin:* definitions and conventions.

Let `S` (rank `n`, signs `s`) and `T` (rank `m`, signs `t`) be locally standard, `a`, `b` automorphic characters of
`U(1)`, and `⟨ , ⟩` the inner product of the data of `WeilRepresentationsOnBanachSpacesOfData §3.4`. The *matrix
coefficient* of `f, f′ ∈ 𝒮(Hom(S, T))` is `c_b(f, f′; g) = ⟨f′, ω_{1,b}(g, 1)f⟩` for `g ∈ G(S)`.

(a) A datum `F` is *clean* if all signs of `S` are equal, or `F` is the Schrödinger operator of `Ψ` applied to
some datum, where `Ψ` is a Schwartz–Bruhat function on the `m × n` matrices over the finite adeles at a set `A` of
places disjoint from `Ā`, and at some place `w` every matrix `y` with `Ψ(y) ≠ 0` has a left inverse.

(b) A datum `F` is *sharp for a subgroup `J ⊆ G_f` off a set `S₀` of finite places, with mass `c`*, relative to `b`,
if: `⟨F, F⟩ ≠ 0`; `F` lies in the finite part of `𝒮`; for every Fock vector `v` and every set `A` of places disjoint
from `S₀`, `v ⊗ F` is fixed by the projection onto the vacua above `A`; for every `g ∈ G_f` integral at all places
outside `S₀`, `c_b(F, F; g)` is `⟨F, F⟩` if `g ∈ J ∩ K₀` and `0` otherwise; `⟨F, F⟩/[K₀ : J ∩ K₀] = c`; and `v ⊗ F` is
clean for every Fock vector `v`.

(c) A *modulus* `𝔪` is a nonzero ideal of `O_E` prime to its conjugate, as in
`WeilRepresentationsOnBanachSpacesOfData §6.1`; its places are those dividing it, and
`J(𝔪)` is the group of the points of `K₀` that are `1` modulo `𝔪`. For a function `Ψ` on the `m × n` matrices over
`O_E/𝔪`, `Ψ ⊗ vac` is the datum that is `Ψ` (read on the matrices with integral components at the places of `𝔪`) at
the places of `𝔪` and the vacuum elsewhere (`WeilRepresentationsOnBanachSpacesOfData §6.1`). `Ψ` is *sharp for
`J`* relative to `b` if `J(𝔪) ⊆ J ⊆ K₀`, `Ψ ≠ 0`, `J` fixes `Ψ ⊗ vac` under `ω_{1,b}((1, k), 1)`, and there is an
`n × m` matrix `A` over `O_E/𝔪` such that `Ax` is the reduction modulo `𝔪` of an element of `J` whenever
`Ψ(x) ≠ 0`.

[ShortProof], `Lib/SiegelWeil/RallisInner/Doubling.lean` (`New.SiegelWeil.weilMatrixCoeff`,
`New.SiegelWeil.IsClean`, `New.SiegelWeil.IsSharp`); `Lib/SiegelWeil/RallisInner/SharpData.lean`
(`New.SiegelWeil.IsSharpFn`)

### 4.2 The doubling identity in Weil's range

*Origin:* adapted from the Rallis inner product formula (Rallis (1984b), for orthogonal–symplectic pairs in
Weil's range; Piatetski-Shapiro and Rallis (1987); for unitary pairs Ichino (2007), and Li (1992) and Yamana
(2014), the last two cited for `m > 2n`): here the doubling identity itself, before any local computation, in
Weil's range, for clean data of the Banach space, with a bound uniform in the data; the boundary orbits are removed
by the datum rather than by cuspidality.

*Method of the formal proof:* the product of the two kernels is the kernel of the doubled pair `(S ⊕ S⁻, T)`,
`S⁻` being `S` with the form `−J`, at the doubled datum. 2.6 for the split space `S ⊕ S⁻` of rank `2n` turns the
integral into a sum over its Lagrangians. For a clean datum only the graphs `{(x, δx)}` of the `δ ∈ U(S)(E)` have
a nonzero zero term, each graph occurs once, and its zero term is the matrix coefficient at `g′⁻¹δg`. The bound
comes from 2.6 (a) and (b) for the doubled pair.

Let `2n < m`, let `a`, `b` be automorphic characters of `U(1)`, and `g, g′ ∈ G(S)`.
(a) If `f` is clean, then for every `f′ ∈ 𝒮(Hom(S, T))`
`∫_{[U(T)]} conj θ(ω_{a,b}(g′, x)f′)·θ(ω_{a,b}(g, x)f) dx = vol([U(T)])·Σ_{γ ∈ Γ_S} c_b(f, f′; g′⁻¹γg)`.
(b) There is a finite `C`, depending only on `S` and `T`, such that for all `a`, `b`, `f`, `f′`, `g`, `g′` both
`∫_{[U(T)]} |θ(ω_{a,b}(g′, x)f′)·θ(ω_{a,b}(g, x)f)| dx` and `Σ_{γ ∈ Γ_S} |c_b(f, f′; g′⁻¹γg)|` are at most
`C·‖ω_{1,b}(g′, 1)f′‖·‖ω_{1,b}(g, 1)f‖`.

*Needs:* 2.6, 4.1; `WeilRepresentationsOnBanachSpacesOfData §§3.8, 6.3` (doubled datum, kernels of sums).

[ShortProof], `Lib/SiegelWeil/RallisInner/Doubling.lean` (`New.SiegelWeil.integral_conj_theta_mul_theta`,
`New.SiegelWeil.exists_doubling_bound`, `New.SiegelWeil.exists_graph_eq_of_zeroTerm_ne_zero`,
`New.SiegelWeil.zeroTerm_graphSplitting`)

### 4.3 The inner product formula for rapidly decreasing forms

*Origin:* adapted from the Rallis inner product formula (Rallis (1984b); Piatetski-Shapiro and Rallis (1987);
for unitary pairs Ichino (2007), and Li (1992) and Yamana (2014), cited for `m > 2n`): here in Weil's range for
automorphic functions of rapid decay on a source group of any signature, which need be neither cuspidal nor
eigenforms, for clean data, as an integral over the whole adelic group, with no L-value.

*Method of the formal proof:* integrate 4.2 (a) against `conj y′(g′)·y(g)` over `[U(S)] × [U(S)]` and unfold the
sum over `Γ_S`; the bound 4.2 (b), the growth of the matrix coefficients in the height and the rapid decay of `y`,
`y′` justify the exchanges.

Let `2n < m`, `a`, `b` automorphic characters of `U(1)`, `f` a clean datum, `f′` any datum, `Θ_f` the theta lift
from `U(S)` to `U(T)` by the kernel of `ω_{a,b}` at `f`, and `y`, `y′` automorphic functions of rapid decay on
`G(S)`. Then `k(g) = c_b(f, f′; g)·⟨y′, R(g)y⟩` is integrable on `G(S)` and
`⟨Θ_{f′}y′, Θ_f y⟩ = vol([U(T)])·∫_{G(S)} k(g) dg`.

On cuspidal Hecke eigenforms, with lattice vectors outside a finite set, the L-value form of
`ThetaKernelsForUnitaryDualPairs §6.13a` and §6.13b evaluates the same integral.

*Needs:* 4.1, 4.2; `AdelicUnitaryGroupsAndAlgebraicModularForms §§4.2, 5.1` (rapid decay, heights, Petersson
product); `WeilRepresentationsOnBanachSpacesOfData §6.4` (theta lifts).

[ShortProof], `Lib/SiegelWeil/RallisInner/Doubling.lean` (`New.SiegelWeil.inner_product_formula`,
`New.SiegelWeil.exists_doubling_le_height`)

### 4.4 Vacuum coefficients of the Weil representation, and sharp data modulo a modulus

*Origin:* particular to this proof: finite data whose matrix coefficient, at the points integral off a finite set,
is a constant times the indicator of a level, which turn the inner product formula into the series of translates
of 1.4.

*Method of the formal proof:* (a) `ω_{1,b}(g, 1)f` is again a vacuum above `A`, and the projection onto the vacua
above `A` sends `ω_{1,b}(γ, 1)` of a vacuum to the vacuum coefficient times it. (b) On `J` the datum is fixed; if the
coefficient at `g` is not zero, some `x` and `xg` lie in the support of `Ψ`, which makes `g` integral and then puts
it in `J` by the matrix `A`; the hypothesis on the signs or on `𝔪` serves only for cleanness. (e) A vacuum
coefficient at an integral point supported off `S₀` that is not in `J` would contradict the support property.

Let `S`, `T` be locally standard of ranks `n`, `m`, and `b` an automorphic character of `U(1)` of weight `γ′` and tame
part `ψ′`.
(a) If `f` is fixed by the projection onto the vacua above a set `A` of places, `γ ∈ G_f^A`, and `g ∈ G(S)` has
finite part in `K_A`, then `c_b(f, f; γg) = mc_{m,b}(γ)·c_b(f, f; g)`.
(b) Let `𝔪` be a modulus, and suppose that all signs of `S` agree or that `𝔪` has a place. If `Ψ` is sharp for `J`
relative to `b`, then `Ψ ⊗ vac` is sharp for `J` off the places of `𝔪𝔪̄`, with mass
`(Σ_x |Ψ(x)|²)/#M_{m×n}(O_E/𝔪)/[K₀ : J]`.
(c) If the tame part of `b` is trivial at every place not dividing `𝔪`, and `F ≠ 0` is a function on the `m × n`
matrices over `O_E/𝔪` with `Ax = 1` whenever `F(x) ≠ 0`, for a fixed `n × m` matrix `A`, then `F` is sharp for
`J(𝔪)`; with the hypothesis of (b), `F ⊗ vac` is sharp for `J(𝔪)` off the places of `𝔪𝔪̄`, with mass
`(Σ_x |F(x)|²)/#M_{m×n}(O_E/𝔪)/#GL_n(O_E/𝔪)`.
(d) If `2n ≤ m`, there is an `m × n` matrix `x` over `Ô` with `x*x = 0` some `n` of whose rows form the identity
matrix.
(e) If `F` is sharp for `J` off `S₀`, then `K₀ ∩ G_f^{S₀ᶜ} ⊆ J`, `b ∘ det` is unramified on the complement of `S₀`,
and for `v ⊗ F`, a real point `x`, a point `u ∈ G_f` supported on `S₀ᶜ ∪ conj(S₀ᶜ)` and a point `g ∈ G_f` integral
off `S₀`, the coefficient `c_b(v ⊗ F, v ⊗ F; x·u·g)` is the product of `⟨v, Ω(x)v⟩`, `mc_{m,b}(u)` and `⟨F, F⟩` times
the indicator of `J ∩ K₀` at `g`, where `Ω(x)` is the real Weil representation of the pair on the Fock space at
`(x, 1)`, twisted on `G_∞(S)` by the weight `γ′` of `b` (and by any weight on `G_∞(T)`).

*Needs:* 1.1, 4.1; `WeilRepresentationsOnBanachSpacesOfData §§3.7, 6.2, 6.3, 6.7` (vacuum projections, integral
points, real action); `IdelicReciprocityCountsAndCyclotomicClassGroups §§7.1, 7.6` (weight and tame part).

[ShortProof], `Lib/SiegelWeil/RallisInner/Doubling.lean` (`New.SiegelWeil.weilMatrixCoeff_mul`,
`New.SiegelWeil.exists_integral_isotropic_frame`); `Lib/SiegelWeil/RallisInner/SharpData.lean`
(`New.SiegelWeil.IsSharpFn.isSharp`, `New.SiegelWeil.isSharpFn_of_mul_eq_one`,
`New.SiegelWeil.isSharp_vacuumDatum_of_mul_eq_one`, `New.SiegelWeil.IsSharp.inf_supportedOn_le`,
`New.SiegelWeil.IsSharp.isUnramifiedOn`, `New.SiegelWeil.IsSharp.weilMatrixCoeff_integrated_mul`)

### 4.5 The inner product formula for sharp data, and injectivity of the theta lift

*Origin:* adapted from the Rallis inner product formula in Weil's convergent range (Rallis (1984), *Injectivity
properties of liftings associated to Weil representations*, Proposition 1.1; Li (1992)) and from Rallis (1984),
*Injectivity properties of liftings associated to Weil representations*, Theorem 1.6, injectivity: here for
unitary groups over a CM field with target rank more than twice the source rank, a source space of any signature,
and sharp finite data; the unramified factor is the series of translates of 1.4, the archimedean factor a nonzero
constant that is not computed, and injectivity holds on the forms of a level with no condition on L-values or
local integrals.

*Method of the formal proof:* start from 4.3 and integrate first over the finite points: by 4.4 (e) the finite
integral cuts into cosets of the points integral off `S₀`, and gives `c` times the series of translates. For an
edge `v` from type `e`, the real integral of `⟨v, Ω(x)v⟩` against the coefficient of the type is a nonzero number
`Z`, and on forms of type `e` real translates scale the Petersson product by it. If the lift of `y` vanishes, the
series `z = 𝒯 y`, a form of type `e` by 1.4 (b), satisfies `⟨z, z⟩ = 0`, and 1.4 (d) gives `y = 0`.

Let `S`, `T` be locally standard of ranks `n`, `m` with `2n < m`; let `S₀` be a set of finite places, `J ⊆ G_f` a
subgroup and `F` a datum sharp for `J` off `S₀` with mass `c` relative to `b`, where `a`, `b` are automorphic
characters of `U(1)` of weights `γ`, `γ′`; let `v` be a Fock vector and `Θ` the theta lift by the kernel of `ω_{a,b}`
at `v ⊗ F`; write `𝒯 = 𝒯_{m,b,S₀ᶜ}` for the series of translates of 1.1 off `S₀`, and `Ω` as in 4.4 (e), with the
weight `γ` on `G_∞(T)`.
(a) For automorphic `y`, `y′` of rapid decay on `G(S)` with `y` fixed by `J`, the function
`x ↦ ⟨v, Ω(x)v⟩·⟨y′, R(x)·𝒯y⟩` is integrable on `G_∞(S)` and
`⟨Θy′, Θy⟩ = vol([U(T)])·c·∫_{G_∞(S)} ⟨v, Ω(x)v⟩·⟨y′, R(x)·𝒯y⟩ dx`.
(b) If `y` is automorphic, of rapid decay and fixed by `J`, `x ↦ ⟨v, Ω(x)v⟩` is integrable and `Θy = 0`, then the
real convolution of `y` with `x ↦ ⟨v, Ω(x)v⟩` vanishes.
(c) Let `v` be an edge from type `e` to type `e′` for the weights `γ`, `γ′`. There is `C ≠ 0`, depending only on
`S`, `T`, `v`, `e`, `e′`, `γ`, `γ′`, such that for all `a`, `b` of these weights (any tame parts) and all `F`, `J`,
`S₀`, `c` as above, the lift `L` by `v ⊗ F` from forms of type `e` on `S` to forms of type `e′` on `T` satisfies:
`L` is injective on the forms of type `e` fixed by `J`, and `⟨Ly′, Ly⟩ = C·c·⟨y′, 𝒯y⟩` for every form `y` of type `e`
fixed by `J` and every form `y′` of type `e`.
(d) In the setting of (c) there is `A ≠ 0`, depending only on the same data as `C`, such that in addition
`⟨Ly′, Ly⟩ = Σ_{q ∈ G_f/K_{S₀ᶜ}} A·c·mc_{m,b}(r(q))·⟨y′, R(r(q))y⟩`, the sum converging absolutely.

`ThetaLiftsForDefiniteUnitaryGroups §3.4` and `§4.2` state injectivity for definite pairs under an invertibility
or a weight condition; `ThetaKernelsForUnitaryDualPairs §6.13a` (Corollary) states non-vanishing for one eigenform
under local non-vanishing hypotheses.

*Needs:* 1.4, 4.1, 4.3, 4.4; `WeilRepresentationsOnBanachSpacesOfData §§7.2, 7.3` (edges, arrows, lifts of
forms); `AdelicUnitaryGroupsAndAlgebraicModularForms §5.2` (discrete-series types are cusp kernels).

[ShortProof], `Lib/SiegelWeil/RallisInner/SharpData.lean` (`New.SiegelWeil.IsSharp.petersson_lift_eq_integral`,
`New.SiegelWeil.IsSharp.hasSum_integral_weilMatrixCoeff_mul`, `New.SiegelWeil.realConv_eq_zero_of_lift_eq_zero`,
`New.SiegelWeil.exists_petersson_formLift_eq_rallisSeries`, `New.SiegelWeil.rallis_inner_product_cosetTerm`)

### 4.6 A reproducing formula by theta lifts to a large definite group

*Origin:* adapted from Weissauer (1986) and Böcherer (2006): the basis problem by doubling and the Siegel–Weil
formula: here as a dual, pointwise identity at one level: the pairing of a rapidly decreasing automorphic
function of level `N` with a holomorphic discrete series coefficient is, at each point, a finite combination,
independent of the function, of its pairings with theta kernels to a definite space of rank more than twice
that of the source; the constants are not computed.

*Method of the formal proof:* on the space of rapidly decreasing automorphic functions of level `N` the left side
is a linear form `ℓ` and the pairings are linear forms `L_i`; by linear algebra it suffices that `ℓ` vanishes
where all `L_i` vanish. There, by the spanning hypothesis (e) and the equivariance of the lift, the lift by the
datum of `Q₀` vanishes; the matrix coefficient of the Fock vector of `Q₀` is holomorphic and a multiple of the
discrete series coefficient (products of minors scale by principal minors under the group), so 4.5 (b) kills the
convolution of the function with that coefficient.

Let `S` be locally standard of rank `n` and signs `s`, with the coordinates of sign `+1` ordered first; let
`𝔪 = (N)` be a modulus with at least one place; let `c`, `b` be automorphic characters of `U(1)` of weights `γ′`, `γ`
and trivial tame part; let `u` be a weight, `K`-dominant for this order at every infinite place, such that the
holomorphic discrete series coefficient `h ↦ ∏_τ hol_{u_τ}(h_τ)` (the product over the infinite places of the
quotients of minors of weight `u_τ`, as in `HolomorphicDiscreteSeriesOfUnitaryGroups §6.3`) is integrable on
`G_∞(S)`; let `T` be the standard definite space of rank
`n′ > 2n` and `e : {1..n} ↪ {1..n′}`; let `Q₀ ≠ 0` be a polynomial whose Fock vector has holomorphic matrix
coefficients of weight `u` for the weights `γ′`, `γ` (`WeilRepresentationsOnBanachSpacesOfData §6.14`);
and for each class `p` of `U(T)` of level `J(N)` let `Q_{p,1}, …, Q_{p,r}` be polynomials whose Fock vectors span a
space containing the translates of that of `Q₀` by `G_∞(T)` in the real Weil representation with weight `γ′` on
`G_∞(T)`. Then for every point `x ∈ G(S)` there are constants `a_{p,i}` such that for every automorphic function `φ` of rapid decay and level `N` on `G(S)`:
`∫_{G_∞(S)} φ(x·(h, 1))·hol_u(h) dh = Σ_{p,i} a_{p,i}·∫_{[U(S)]} φ(g)·Θ_{p,i}(g) dg`,
where `Θ_{p,i}(g)` is the theta kernel of `ω_{c,b}` for `(S, T)` at `g` and the class `p`, at the datum built from
`Q_{p,i}` at the real places and the indicator of the matrix of `e` modulo `𝔪`.

`ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.17a` states a spanning theorem for holomorphic cusp
forms by theta series in another range; it does not give this identity.

*Needs:* 4.4, 4.5; `WeilRepresentationsOnBanachSpacesOfData §§2.1, 2.2, 6.1, 6.7, 6.14` (Fock model, holomorphic
data, kernels modulo `𝔪`); `HolomorphicDiscreteSeriesOfUnitaryGroups §§4.1, 6.3` (holomorphic coefficients as
quotients of minors).

[ShortProof], `Lib/SiegelWeil/Reproduction.lean` (`New.Rows.reproducing_formula_modKernel`,
`New.Rows.realConv_holMinorsPi_eq_zero_of_lift_eq_zero`, `New.Rows.lift_modDatum_eq_zero_of_mem_span`,
`New.Rows.polyMatrixCoeff_eq_holMinorsPi_mul_conj`, `New.Rows.prod_variableMinor_mem_holomorphicData`,
`New.Rows.letterPoly_highestVector_mem_holomorphicData`, `New.Rows.realPairWeil_mem_span_pairedDetProd`)

## Layer 5: Singular forms

### 5.1 Definitions: coefficients along the centre of a radical, partial means and shears

*Origin:* definitions and conventions.

Let `W` be a locally standard space of rank `n`. A function `f` on `G(W)` is *automorphic* here if it is continuous
and left invariant under `Γ_W`.

(a) For a splitting `D` of `W` with isotropic frame `k` of `p` vectors, `z_D(M)`, for `M ∈ M_p(𝔸)`, is the element of
the centre of the unipotent radical of the stabiliser of the span of `k` with matrix `1 + k(M − M*)k*ε` (`ε` the
standard form), and the *Fourier coefficient* of `f` along `D` at `T ∈ M_p(E)` is
`f_{D,T}(g) = mean over M ∈ M_p(𝔸)/M_p(E) of ψ(tr(TM))·f(z_D(M)g)`, as in
`WeilRepresentationsOnBanachSpacesOfData §8.9` (there `z_D(M) = n(0, −2ȷM)`).

(b) *The set-up of the partial means.* `A` splits off `W` a hyperbolic plane with isotropic vectors `u` (the frame of
`A`) and `u′` (the frame of the opposite splitting `A′`, which exchanges them), with complement `W₀`; `W₀` is `p`
hyperbolic planes plus a space `W₂`, and `B` splits off `W₀` the frame of the `p` planes; `D` is a splitting of `W`
whose adelic frame is the image `k` of the frame of `B`. For an adelic row `a` of length `p`, the shift `n₊(a)` is the
central element, for the composite of `A′` and `B`, that sends `u` to `u − k a*` and fixes `k`; `n₋(b)` is the same for
`A′` in place of `A`. The *partial mean* is `f⁺(g) = mean over b ∈ M_{1×p}(𝔸)/M_{1×p}(E) of f_{D,T}(n₋(b)g)`,
and `φ⁺_g(a) = f⁺(n₊(a)g)`; `f⁻` and `φ⁻_g` are the same for `A′`.

(c) For an adele `e`, `Stab(e)` is the group of the `g ∈ G(W)` with `g·ek = ek`. For a set `U` of finite places with
idempotent `e_U`, the partial mean is *shear invariant for `U` at `g`* if `f⁺(νg) = f⁺(g)` for every `ν ∈ G(W)` whose
matrix is `1 + ē_U·uc − e_U·a` with `c` a row with `cu = 0` and `a` any matrix (when `U` is disjoint from `Ū`: `ν` is
`1 + uc` on `Ū` and `1` outside `U ∪ Ū`).

(d) For `T ∈ M_p(E)` and an adelic `γ ∈ M_p(𝔸)`, `T[γ] = δ⁻¹γ*Tγ`, where `δ` is the idele `ȷκ_Eκ̄_E` (finite part
`ȷαᾱ`). For a set `S` of finite places, a matrix is *primitive at `S`* if it and a left inverse are integral at the
places of `S ∪ S̄`. A splitting is *adapted* if it is base-adapted as in
`WeilRepresentationsOnBanachSpacesOfData §5.2` (adelic frames orthonormal at the infinite places, integral at the
finite places).

[ShortProof], `Lib/SiegelWeil/SingularForms/CentreCoefficients.lean` (`New.Exchange.IsAutFunction`,
`New.Space.Splitting.lineShift`, `New.Space.Splitting.partialMean`, `New.Space.Splitting.shiftedMean`,
`New.Space.Splitting.frameStabilizer`, `New.Space.Splitting.ShearInvariant`);
`Lib/SiegelWeil/SingularForms/UnimodularCoefficients.lean` (`New.Exchange.siegelBracket`,
`New.Exchange.closureIntegers`, `New.Exchange.closurePart`)

### 5.2 Laws of the partial means, and singularity

*Origin:* adapted from the published theory of singular automorphic forms (Fourier coefficients of singular forms
along the centre of a unipotent radical, and their invariance): here for automorphic functions on an adelic unitary
group, not necessarily holomorphic, with singularity expressed as invariance of the partial means under shears at a
nonempty set of places.

*Method of the formal proof:* (a) the coefficient at `n₋(b)n₊(a)g` is a Fourier coefficient, against a character,
of the periodic function `φ⁺_g`, and exchanging the order of `n₊` and `n₋` multiplies it by `ψ(tr(T·(−b*a)))`; so a
proportionality of the `φ⁺` passes to the coefficients and from them to the `φ⁻`, which play the part of a Fourier
transform of `φ⁺`. (b) `f⁺` agrees with the coefficient of `f` along the composite of `A` and `B` at the block matrix
`0 ⊕ T` on the points concerned; additive strong approximation turns invariance under the shears at the places of
`U` into invariance under the centre of the radical of `A`, and then under the whole radical.

In the set-up of 5.1 (b), let `f` be automorphic and `T ∈ M_p(E)`.
(a) Let `det T ≠ 0`, `g, g′ ∈ G(W)` and `c ∈ ℂ` with `φ⁺_{g′} = c·φ⁺_g`. Then
`f_{D,T}(n₋(b)n₊(a)g′) = c·f_{D,T}(n₋(b)n₊(a)g)` for all adelic rows `a`, `b`, and `φ⁻_{g′} = c·φ⁻_g`. In particular
`φ⁺_g = 0` implies `f_{D,T}(g) = 0` and `φ⁻_g = 0`.
(b) Let `U` be a nonempty set of finite places and `e` an adele, and let `f⁺` be shear invariant for `U` at every
point of `Stab(e)`. If `h` lies in the adelic unipotent radical of the stabiliser of the line of `u` and `g`,
`hg ∈ Stab(e)`, then `f⁺(hg) = f⁺(g)`.

*Needs:* 5.1; `AdelicUnitaryGroupsAndAlgebraicModularForms §2.3` (additive strong approximation);
`WeilRepresentationsOnBanachSpacesOfData §8.9` (Fourier coefficients along the centre).

[ShortProof], `Lib/SiegelWeil/SingularForms/CentreCoefficients.lean`
(`New.Space.Splitting.centreCoeff_eq_mul_of_shiftedMean_eq_smul`, `New.Space.Splitting.shiftedMean_symm_eq_smul`,
`New.Space.Splitting.centreCoeff_eq_zero_of_shiftedMean_eq_zero`, `New.Space.Splitting.shiftedMean_symm_eq_zero`,
`New.Space.Splitting.partialMean_radicalElement_mul`)

### 5.3 Singular forms are governed by their coefficients at unimodular indices

*Origin:* adapted from the published theory of singular automorphic forms (a singular form is determined by its
Fourier coefficients at indices of maximal rank): here a vanishing criterion for one Fourier coefficient of an
automorphic function on an adelic unitary group whose partial means are shear invariant, from the vanishing at the
points whose normalised index is unimodular at a set of places.

*Method of the formal proof:* otherwise, by 5.2 (a), some point whose lattice at `S ∪ S̄` splits along the two
isotropic lines (a straight point, obtained from a shift of `g` by 5.2 (b)) has `φ⁺ ≠ 0`. Choose one with the least
denominator of the inverse determinant of `T[γ]`; at it `φ⁺` and `φ⁻` are supported on its lattice up to fixed
scales, which forces `T[γ]` to be primitive at `S`, and the hypothesis gives a contradiction. A step computes how
conjugation by `GL_1(𝔸)` scales Haar measure on the hermitian `1 × 1` adelic matrices.

In the set-up of 5.1 (b), with `A` and `B` adapted, let `S` be a set of finite places with idempotent `e_S` of
`S ∪ S̄`, `f` automorphic and right invariant under `K₀ ∩ G_f^S`, `T ∈ M_p(E)` with `det T ≠ 0`, and `U` a nonempty set
of finite places. Suppose that `f⁺` and `f⁻` are shear invariant for `U` at every point of `Stab(1 − e_S)`, and that
`f_{D,T}(X) = 0` for every `X ∈ G(W)` that acts on the frame of `D` by `γ` at the places of `S ∪ S̄` and by `1`
elsewhere, whenever `T[γ]` is primitive at `S`. Then `f_{D,T}(g) = 0` for every `g ∈ Stab(1 − e_S)`.

*Needs:* 5.1, 5.2; `AdelicUnitaryGroupsAndAlgebraicModularForms §§2.4, 3.6` (scaling of Haar measure, Iwasawa
decomposition).

[ShortProof], `Lib/SiegelWeil/SingularForms/UnimodularCoefficients.lean`
(`New.Exchange.centreCoeff_eq_zero_of_unimodular`, `New.Exchange.exists_straightPoint`,
`New.Exchange.map_conjugate_selfAdjoint`)

## Layer 6: Constant terms along a line, Tate integrals and the functional equation

### 6.1 Definitions: the plane set-up, line terms, standard data, cones and products of L-values

*Origin:* definitions and conventions.

Let `W`, `V` be locally standard of ranks `n`, `r`, and `W′ = W ⊥ H`, `V′ = V ⊥ H` with adapted splittings `A` of `W′`
and `X` of `V′` off a hyperbolic plane; `k_A`, `l_A` and `k_X`, `l_X` are their isotropic vectors. Let
`𝔠 = (ν, S)` be a split tame character of weight `μ`.

(a) *Line terms.* For an adele `α` and `β ∈ {+, −}`, `λ_β(α) : 𝒮(Hom(W′, V′)) → 𝒮(Hom(W, V))` is: for `β = +`, the
slice of the splitting of `Hom(W′, V′)` induced by `A` at the value `α·k_X`, followed by the zero term along the line
of `X`; for `β = −`, the Heisenberg translation by `α·l_X ⊗ l_A*`, followed by the zero terms along the lines of `X`
and of `A` (`WeilRepresentationsOnBanachSpacesOfData §§5.5, 6.9`). `λ^ℝ_β(a)`, for `a ∈ (ℂ^Φ)^×`, is the
corresponding map of the Fock spaces at the real places.

(b) *Standard data.* Let `F` be a finite product of non-archimedean local fields with integers `O`, `χ` a character of
`F^×` (extended by `0`), and `s` an integral `b × n` matrix. The *column datum* `Ψ_s(y)`, for `y ∈ M_{n×b}(F)`, is
`χ⁻¹(det(sy))` if `y` is integral and `det(sy) ∈ O^×`, and `0` otherwise; the *row datum* `Φ_s(x)`, for
`x ∈ M_{a×n}(F)` with `a + b = n`, is `χ⁻¹(det(s; x))` if the matrix with the rows of `s` and `x` (in a fixed order)
lies in `GL_n(O)`, and `0` otherwise. Functions `Φ` on `M_{a×n}(F)` and `Ψ` on `M_{n×b}(F)` are *partners* for `χ`
if `Φ` vanishes off the matrices formed by the last `a` rows of some `k⁻¹`, `k ∈ GL_n(O)`, `Ψ` vanishes off the
matrices formed by the first `b` columns of some `k ∈ GL_n(O)`, and `Φ(last rows of k⁻¹) = χ(det k)·Ψ(first columns
of k)` (`AuxiliaryAlgebraAndAnalysisForThetaLifts (partner algebra)`). `χ` is *tame* if `χ⁻¹` on `O^×` is inflated
from a primitive character of the residue ring, as in `WeilRepresentationsOnBanachSpacesOfData §3.9`.

(c) *Theta integrals of `𝔠`.* For a Fock vector `v` and a function `Φ` of `r × n` matrices over `E_S`, `D(v, Φ)` is
the datum on `Hom(W, V)` that is `v` at the real places, `Φ` at `S` and the vacuum elsewhere, and
`I_𝔠(v, Φ)(g) = ∫_{[U(V)]} θ(ω(g, h)D(v, Φ)) dh` with `ω = ω_{c,c}`, `c = ν⁻¹·υ₁^{⌊n/2⌋}`
(`WeilRepresentationsOnBanachSpacesOfData §§6.10, 6.12`). When `r ≤ n`, let
`b = n − r` (the standard data of `(W, V)` and of `(W′, V′)` are taken for a fixed splitting of the coordinates of `W`
into `b` and `r`). The *plane datum* of `v` and an integral `y ∈ M_{b×n}(E_S)` is the datum on `Hom(W′, V′)` with
`v` at the real places and the row datum of `y` composed with the projection of `W′` to `W` at `S` (for `χ = χ_𝔠`);
the *plane constant term* `CT(v, y)(u, g)`, at a
Levi point `(u, g) ∈ GL_1(𝔸) × G(W)` of the stabiliser of the line of `A`, is the mean over the radical of that
stabiliser modulo its rational points of the theta integral of `(W′, V′)` at the plane datum.

(d) *Cones.* A Fock vector is a *Schwartz vector* if all its moments `∫(1 + ‖y‖)^N|v(y)| dy` are finite. For `z > 0`
and a Fock vector `v` of `Hom(W′, V′)`, `cone_β(z, v) = ∫ ∏_τ (a_τ/|a_τ|)^{2μ_τ}·|a|^z·λ^ℝ_β(a)(Ω(1, κ)v) dκ da`, over
`κ` in the maximal compact subgroup of `G_∞(V′)` and `a ∈ (ℂ^Φ)^×` with Haar measures, `Ω` the real Weil
representation of the pair `(W′, V′)` with weight `0` on `G_∞(W′)` and `⌊rk W′/2⌋ − μ` on `G_∞(V′)`;
`cone = cone_+` and `dualCone = cone_−`.

(e) *L-values.* `L♯(z) = |L^S(z, ν)|·∏_{w ∈ S} q_w^{z − 1/2}` for real `z ≥ 1`; for any set `S` and character `ν`,
`L_*(e) = ∏_{w ∈ S} q_w^{e²}·∏_{z=1}^{e} |L^S(z, ν)|²` for `e ∈ ℕ`, extended by `L_*(−e) = L_*(e)⁻¹`.

[ShortProof], `Lib/SiegelWeil/Tower/LineTerms.lean` (`New.Exchange.lineTerm`);
`Lib/SiegelWeil/Tower/LineGaussSums.lean` (`New.stdColDatum`, `New.stdRowDatum`);
`Lib/SiegelWeil/Tower/LargeSideConstantTerm.lean` (`New.Exchange.planeDatum`, `New.Exchange.planeConstantTerm`);
`Lib/SiegelWeil/Tower/RealConeIntegral.lean` (`New.Exchange.coneIntegrand`, `New.Exchange.cone`,
`New.Exchange.dualCone`); `Lib/SiegelWeil/Tower/FiniteTateIntegral.lean` (`New.Exchange.lSharp`,
`New.Exchange.lValueProd`, `New.Exchange.lValueProdInt`)

### 6.2 Products of partial L-values, and Tate's integral at the finite places

*Origin:* adapted from the constant terms of theta integrals of Rallis (1987) and of Kudla and Rallis (1994), with
Tate (1950) for the integrals along the line: here Tate's integral over the finite ideles of the base change of a
split tame character against the finite factor of the standard data along the line, and the recursion of the
products of L-values that the constant terms produce.

*Method of the formal proof:* (a) the weight of `ν` is nonzero, so `ν̃` is not trivial and its Euler product does
not vanish on `[1, ∞)`. (b) is a computation. (c) The finite factor satisfies the conditions of Tate's integral for
characters of a given type: support, invariance under unit ideles, and local constancy; the integral is then the
partial L-value. (d) unfolds a sum over `E^×` against the idele classes in either variable of Poisson's formula.

Let `𝔠 = (ν, S)` be a split tame character, and `χ_𝔠` its tame character on `E_S`.
(a) `L^S(x, ν) ≠ 0` and `L♯(x) > 0` for real `x ≥ 1`, and `x ↦ L^S(x, ν)` is continuous on `[1, ∞)`.
(b) `L_*(e + 1) = L♯(e + 1)²·L_*(e)` for `e ∈ ℕ`, and `L_*(e) > 0` for every integer `e`.
(c) Let `λ_fin(a)`, for a finite idele `a`, be `χ_𝔠((ā)_S)/χ_𝔠(a_S)` if `a` is integral outside `S ∪ S̄` and `a_S`,
`(ā)_S` are units, and `0` otherwise. For real `x > 1` and every Haar measure `ρ` on the finite ideles, the function
`a ↦ λ_fin(a)·ν̃(a)·|a|^x` is `ρ`-integrable and its integral is `L^S(x, ν)·ρ(Ô^×)`.
(d) Fix a Haar measure `da` of the ideles and a Haar measure of `(ℂ^Φ)^×`. Let `a′` denote `a` or `ā⁻¹` (one choice
throughout), and let `ρ` be an s-finite measure on the finite ideles such that `a ↦ (a′_∞, a′_f)` carries `da` to the
product of the Haar measure of `(ℂ^Φ)^×` and `ρ`. Let `(Y₁, m₁)`, `(Y₂, m₂)` be measure spaces with `m₁`, `m₂`
s-finite, `Z` an integrable function on `Y₁ × Y₂ × (ℂ^Φ)^×` (for `m₁`, `m₂` and the Haar measure), `ζ` a
`ρ`-integrable function on the finite ideles, and `c` an idele. Then
`Θ(a, y₁, y₂) = Σ_{ξ ∈ E^×} Z(y₁, y₂, (ξa′c)_∞)·ζ((ξa′c)_f)` is integrable on `(𝔸^×/E^×) × Y₁ × Y₂` for the product
of the quotient measure of `da` (by the counting measure of `E^×`), `m₁` and `m₂`, and its integral is
`(∫Z)·(∫ζ dρ)`.

*Needs:* 6.1, 6.4 (d); `IdelicReciprocityCountsAndCyclotomicClassGroups §§8.2, 8.5` (Tate's integral, non-vanishing
on `[1, ∞)`); `AdelicUnitaryGroupsAndAlgebraicModularForms §§1.1, 2.1, 2.4` (ideles, modules, quotient measures).

[ShortProof], `Lib/SiegelWeil/Tower/FiniteTateIntegral.lean` (`New.Exchange.SplitTameChar.L_ne_zero`,
`New.Exchange.lSharp_pos`, `New.Exchange.continuousOn_L`, `New.Exchange.lValueProd_succ`,
`New.Exchange.lValueProdInt_pos`, `New.Exchange.lineFinFactor`, `New.Exchange.integral_finTateIntegrand`,
`New.Exchange.integral_ideleClass_tsum`)

### 6.3 The terms along a line: Levi equivariance and Poisson's formula

*Origin:* adapted from the constant terms of theta integrals of Rallis (1987) and of Kudla and Rallis (1994), with
Tate (1950) for the integrals along the line: here the two families of terms along the line in the two mixed models
of one hyperbolic plane of `Hom(W′, V′)`, their equivariance under the Levi subgroups, and Poisson's formula between
them.

*Method of the formal proof:* both sums are the theta value of the zero term of `f` for the splitting of
`Hom(W′, V′)` off the hyperbolic plane spanned by the lines of `A` and `X`, read in its two mixed models; the
equivariance is a computation of the zero terms under Levi points.

In the set-up of 6.1:
(a) For `f ∈ 𝒮(Hom(W′, V′))` and either `β`, `Σ_{ξ ∈ E} θ(λ_+(ξ)f) = Σ_{ξ ∈ E} θ(λ_β(ξ)f)`.
(b) Let `u, c` be ideles with `u = 1` or `rk W = rk V`, `x = cu`, `g ∈ G(W)`, `h ∈ G(V)`, and let `a` be an automorphic
character of `U(1)`. Applying the Levi point that acts by `u` on the line of `A` and by `g` on `W`, and the Levi point
that acts by `c⁻¹` on the line of `X` and by `h` on `V`, in `ω_{a·υ₁, a·υ₁}` for `(W′, V′)`, and then `λ_β(ξ)`, gives
`|u|^{r+1}/(χ_{a,n}(x)·|x|^{n/2 + (0 if β = + else 1)})` times `ω_{a,a}(g, h)λ_β(ξ′)f`, where `ξ′ = ξx` if `β = +` and
`ξ′ = ξ·(x̄)⁻¹` otherwise, and `χ_{a,n} = ã·υ^{−n}` is the Hecke character attached to `a` in rank `n`.

*Needs:* 6.1; `WeilRepresentationsOnBanachSpacesOfData §§5.5, 6.9` (mixed models, slices, theta expansion).

[ShortProof], `Lib/SiegelWeil/Tower/LineTerms.lean` (`New.Exchange.tsum_lineTerm`,
`New.Exchange.lineTerm_pairWeil_levi`, `New.Exchange.lineTerm_eq_slice`, `New.Exchange.frameAt_lineTermSplitting`)

### 6.4 The constant term of a theta integral, unfolded along isotropic lines

*Origin:* adapted from the constant terms of theta integrals of Rallis (1987) and of Kudla and Rallis (1994): here the
constant term along the line of `A` of a theta integral over `[U(V′)]`, written as a sum over the rational vectors of
`V′` and unfolded over the one orbit of isotropic lines to an integral in Iwasawa coordinates.

*Method of the formal proof:* integrate the expansion of the kernel along `A` term by term; group the terms by the
line they span; only the lines in the orbit of the line of `X` contribute (Witt's theorem), so the integral unfolds to
the stabiliser of that line, and the Iwasawa decomposition of the stabiliser gives the coordinates; the principal
ideles are discrete, and a majorant on `(ℂ^Φ)^×` is integrable.

Let `W′ = W ⊥ H` be split by `A`, `V′` locally standard of rank `r′`, and `a`, `b` automorphic characters of `U(1)`.
(a) For `f ∈ 𝒮(Hom(W′, V′))`, the constant term at the identity along the line of `A` of the theta kernel of `f` (its
mean over the radical of the stabiliser of that line modulo the rational points) is the sum, over the rational
vectors `x` of `V′`, of terms `CT_x(f)` that vanish unless `x` is isotropic (for isotropic `x`, `CT_x(f)` is the mean
of the term of `x` in the kernel over the radical modulo its centre and its rational points).
(b) If the kernel of `f` grows at most like a power of the height on `G(W′)`, uniformly on `G(V′)`, the constant term
at `g` along `A` of the theta integral of `f` is `∫_{[U(V′)]} Σ_x CT_x(ω_{a,b}(g, h)f) dh`.
(c) Let `V′ = V ⊥ H` be split by `X`, with `rk V = r`. There is `c ≠ 0`, depending only on `A` and `X`, such that for
all `a`, `b`, `f` and `g ∈ G(W′)`: if `CT_0(ω_{a,b}(g, h)f) = 0` for all `h` and
`Θ((u, h), κ) = |u|^{r+1}·Σ_{ξ ∈ E^×} θ(λ_+(ξ)(ω_{a,b}(g, ℓ(u, h)κ)f))` is integrable for the product of the quotient
measure on `𝔸^×/E^×`, the quotient measure on `[U(V)]` and Haar measure on the maximal compact subgroup `K′` of
`G(V′)` (with `ℓ(u, h)` the Levi point of the stabiliser of the line of `X`), then
`∫_{[U(V′)]} Σ_x CT_x(ω_{a,b}(g, h)f) dh = c·∫ Θ`.
(d) The image of `E^×` in the ideles of `𝔸` is discrete, and `a ↦ ∏_τ (1 + log²|a_τ|)⁻¹` is integrable on `(ℂ^Φ)^×`
for Haar measure.

*Needs:* 6.1, 6.3; `AdelicUnitaryGroupsAndAlgebraicModularForms §§1.3, 3.6` (orbit unfolding, Iwasawa
coordinates); `HermitianFormsAndLattices §1.1 (b)` (Witt's theorem); `WeilRepresentationsOnBanachSpacesOfData §6.4`
(growth of theta kernels).

[ShortProof], `Lib/SiegelWeil/Tower/ConstantTerm.lean` (`New.Exchange.constTermAt`,
`New.Exchange.hasSum_constTermAt`, `New.Exchange.integral_thetaIntegral_lineRadical`,
`New.Exchange.lintegral_radicalHaar_conj_lineLevi`, `New.Exchange.exists_unfold_constant_term`);
`Lib/SiegelWeil/Tower/PrincipalIdeles.lean` (`New.principalAdeleUnits`,
`New.integrable_prod_inv_one_add_log_sq`)

### 6.5 Standard partners and the line terms of standard data

*Origin:* particular to this proof: the standard row and column data of an integral matrix at a set of split places
are partners, and the line terms carry the standard data of the pair `(W′, V′)` to a Gauss sum times the standard data
of `(W, V)`.

*Method of the formal proof:* (a) if `(s; x)` is `g ∈ GL_n(O)`, take `k = g⁻¹`; the values compare through
`χ(det k)`. (b) `λ_β` is the slice of a splitting with an explicit adapted frame, so it is computed on a datum that
factors along that frame; in the resulting product of local integrals one is the Gauss sum of a tame character
over the residue ring, and all the others equal `1`.

(a) In 6.1 (b), if `s` is integral, the row datum `Φ_s` and the column datum `Ψ_s` are partners for `χ`; if moreover
`χ` is tame, both are locally constant with compact support (`Ψ_s` supported on matrices with a left inverse).
(b) In the set-up of 6.1, for a set `S` of places disjoint from `S̄`, read through a map `π` of `𝔸_f` onto a finite
product `F` of local fields that reads the components at `S`: there are nonzero constants `l_+`, `l_−` such that for
every tame `χ` there is `γ ∈ ℂ` with `|γ|² = 1/#(O/ϖ)` and, for every integral `p ∈ M_{b×n}(F)` (`b = n − r` as in
6.1 (c), so `r ≤ n`), `β`, Fock vector `v` and adele `x`, with `a = x·κ_E⁻¹`: `λ_β(x)` sends the datum with `v` at the real places and the row datum of
`p·I′` at `S` (`I′` the coordinates of `W` in the frame of `A`) to `l_β·γ·χ⁻¹(a_S)·χ(ϖ·(ā)_S)` times the datum with
`λ^ℝ_β(a_∞)v` at the real places and the row datum of `p` at `S` when the finite part of `a` is integral outside
`S ∪ S̄` and `a_S`, `ϖ·(ā)_S` are units of `O`, and to `0` otherwise.

*Needs:* 6.1, 6.3; `AuxiliaryAlgebraAndAnalysisForThetaLifts (partner algebra; finite Fourier analysis)`;
`WeilRepresentationsOnBanachSpacesOfData §§3.9, 6.10` (tame Gauss sums, data read at places).

[ShortProof], `Lib/SiegelWeil/Tower/LineGaussSums.lean` (`New.areMatched_stdRowDatum_stdColDatum`,
`New.stdColDatum_mem_schwartzBruhat`, `New.stdRowDatum_mem`, `New.Exchange.exists_lineTerm_localDatum`)

### 6.6 Shears and the Fourier coefficients of equivariant lifts

*Origin:* particular to this proof: invariance of a linear form under shears passes to the standard column datum, and
the Fourier coefficients along the centre of a radical of an equivariant lift of local data are linear functionals of
the datum that transform under shears by an additive character.

*Method of the formal proof:* (a) average over the shears by integral matrices, which does not change the form, and
compare the averaged data. (b) the coefficient is linear on the space of data; extend it to a functional on all
functions; the shear of the datum by `z` along the frame at `x` corresponds to a translate by the central element
`z_H`, which multiplies the coefficient by `ψ(tr(Tz))`.

(a) Let `F` be a finite product of local fields with integers `O`, `χ` a character, `s` an integral `b × n` matrix,
`u` a column and `r` a row with `su = 0` and `ru = 0`, `M` a space of locally constant compactly supported functions,
and `Λ` a linear form on `M` invariant under the shears `Ψ ↦ Ψ(y + u·z·s·y)`. If the column datum `Ψ_s` and its
composite with `y ↦ y + u·r·y` lie in `M`, `Λ` takes the same value on them.
(b) Let `X` be locally standard of rank `m`, `𝔠 = (ν, S)` a split tame character, and `M` a space of functions of
`m × b` matrices over `E_S`. A linear map `𝒟` from such functions to functions on `G(X)` is an *equivariant lift on `M`*
if `M` consists of locally constant functions with compact support in the left invertible matrices, `𝒟Ψ` is
automorphic for `Ψ ∈ M`, for `g ∈ G_f` supported on `S ∪ S̄` the translate `y ↦ Ψ(g_S y)` lies in `M` and
`𝒟(that translate)(x·g) = 𝒟Ψ(x)/(υ·|·|^{1/2})(det g_S)^b`, and `𝒟Ψ` is right invariant under the points of `K₀` with
component `1` at `S`. For such `𝒟`, a splitting `H` of `X` with frame of `p` vectors, `T ∈ M_p(E)` and `x ∈ G(X)`, there
is a linear functional `Λ` on all functions with `Λ(Ψ) = (𝒟Ψ)_{H,T}(x)` for `Ψ ∈ M`; and the shear
`Ψ′(y) = Ψ(y + (x⁻¹k_H)_S·z·(k_H*ε·x)_S·y)` of `Ψ ∈ M` by `z ∈ M_p(E_S)` lies in `M` and has
`Λ(Ψ′) = ψ_S(tr((δ⁻¹T)_S·z))·Λ(Ψ)`, with `k_H` the adelic frame of `H`, `ε` the standard form of `X` (as in 5.1 (a)),
`ψ_S` the additive character at `S` and `δ` as in 5.1 (d).

*Needs:* 5.1, 6.1; `WeilRepresentationsOnBanachSpacesOfData §6.10` (additive character read at places).

[ShortProof], `Lib/SiegelWeil/Tower/LineGaussSums.lean` (`New.Exchange.map_shear_stdColDatum_eq`,
`New.Exchange.IsEquivariantLift.exists_linear_centreCoeff`, `New.Exchange.IsEquivariantLift.centreCoeff_shear`);
`Lib/SiegelWeil/SingularForms/CentreCoefficients.lean` (`New.Exchange.IsEquivariantLift`)

### 6.7 The real cone integral and the test vector

*Origin:* adapted from the constant terms of theta integrals of Rallis (1987) and of Kudla and Rallis (1994), with
Tate (1950) for the integrals along the line: here the archimedean Tate integral of a Fock vector over the cone of
real isotropic vectors of `V′`, its convergence in all moments, and the test vector whose cone integrand is an explicit
multiple of the vacuum.

*Method of the formal proof:* bound the moments of the line terms by powers of `|a|` and of `1 + log²|a|` (6.4 (d)),
which are integrable for `z > 0`; the test vector is a product of powers of the two positive coordinates of
`Hom(H, H)`, fixed by the diagonal part of the maximal compact subgroup, and its line term is computed in a frame
adapted at `1`.

In the set-up of 6.1:
(a) For `z > 0`, either `β` and a Schwartz vector `v`, the integrand of `cone_β(z, v)` is continuous, integrable in
every moment, and `cone_β(z, v)` is a Schwartz vector.
(b) Let `m` be a weight (`m_τ ∈ ℕ`), `W′` a hyperbolic plane (`W = 0`) whose signs take each value `±1` once, and
`t_m` the Fock vector of `∏_τ ∏_i X_{τ,i,i}^{m_τ}` on `Hom(W′, W′)` (a Schwartz vector). It is fixed by the elements of
`G_∞(W′)` that preserve the lines of each sign, in the real Weil representation with weights `0` and `1 − m`; and for
`A = X` its cone integrand for `μ = m` at `(κ, a)` is `exp(−Σ_τ |a_τ|²)·|a|^z·∏_τ |a_τ|^{2m_τ}` times the vacuum, for either `β`
and every real `z`.

*Needs:* 6.1, 6.4 (d); `WeilRepresentationsOnBanachSpacesOfData §§2.1, 2.2, 2.3` (Fock model, polynomial vectors,
moments).

[ShortProof], `Lib/SiegelWeil/Tower/RealConeIntegral.lean` (`New.Exchange.continuous_coneIntegrand`,
`New.Exchange.integrable_coneIntegrand`, `New.Exchange.isSchwartzVector_integral_coneIntegrand`);
`Lib/SiegelWeil/Tower/TestVector.lean` (`New.Exchange.tateVector`, `New.Exchange.isSchwartzVector_tateVector`,
`New.Exchange.realPairWeil_tateVector`, `New.Exchange.coneIntegrand_tateVector`)

### 6.8 The constant term on the side of the large space

*Origin:* adapted from the constant terms of theta integrals of Rallis (1987) and of Kudla and Rallis (1994), with
Tate (1950) for the integrals along the line: here, on the standard data of a split tame character, the constant term
along the new isotropic line is one term, a constant of size `C·L♯(z + 1)` times a theta integral for the pair with
one plane removed, in both ranges `rk V − rk W/2 ≥ 0` and `< 0`, including the boundary cases, with only values of the
L-function at real points `≥ 1`.

*Method of the formal proof:* the plane datum has no source term at `0` along `A`, so by 6.4 the constant term unfolds
to an integral over the ideles of the line terms; by 6.3 (a) neither side of Poisson's formula on the line has a term
at `0`, so the resulting integral `𝒵(x)` is analytic on the whole real line. By 6.5 (b) and 6.3 (b) the integrand
factors into the finite factor of 6.2 (c), the real cone integrand and a theta integral of `(W, V)`; 6.2 (d) and
6.2 (c) evaluate it for `x > 1`, and continuity in `x` (6.7) extends this to `x ≥ 1`. The case `rk V − rk W/2 < 0`
uses the other side of Poisson's formula.

Let `W`, `V`, `W′`, `V′`, `A`, `X` be as in 6.1 with `rk W = n` even and `rk V ≤ n`, let `b = n − rk V ≥ 0` as in
6.1 (c) (the standard data are attached to a splitting of the `n` coordinates of `W` into `b` and `rk V`; so in (c)
`n/2 ≤ rk V ≤ n`, and in (d) `rk V < n/2`), and let `μ` be a weight with `μ_τ > 0`.
(a) For a Fock vector `v` and an integral `z ∈ M_{b×n}(E_S)`, the datum `D(v, Φ_z)` of `(W, V)` (with `Φ_z` the row
datum of `z` for `χ_𝔠`) is fixed by the points `(1, k)`, `k ∈ K₀` of `G(V)`, in `ω_{c′,c″}` with `c′ = ν⁻¹·υ₁^{n/2}` and
any `c″`; and `ν·υ₁^{⌊n′/2⌋} = ν·υ₁^{n/2}·υ₁^{p}` when `W′` (of rank `n′`) is `W` plus `p` hyperbolic planes.
(b) There are `C_± > 0` such that for every split tame character `𝔠 = (ν, S)` of weight `μ` there are `ε_±` with
`|ε_±| = C_±` such that, for every Schwartz vector `v` of `Hom(W′, V′)`, every integral `y ∈ M_{b×n}(E_S)` and every
Levi point `(u, g)` with `u = 1` or `rk V = rk W`, there is a function `𝒵` analytic on `ℝ` with
`CT(v, y)(u, g) = 𝒵(rk V − n/2 + 1)` and, for real `x ≥ 1`,
`𝒵(x) = ε_+·|κ_E|^x·∏_{w ∈ S} q_w^{x−1/2}·L^S(x, ν)·I_𝔠(cone_+(x, v), Φ_y)(g)` and
`𝒵(1 − x) = ε_−·|κ_E|^x·∏_{w ∈ S} q_w^{x−1/2}·L^S(x, ν)·I_𝔠(cone_−(x, v), Φ_y)(g)`, where `Φ_y` is the row datum of `y`
for `χ_𝔠`.
(c) If `rk V − n/2 = z ≥ 0`, there is `C > 0` such that for every `𝔠` of weight `μ` there is `γ` with
`|γ| = C·L♯(z + 1)` and `CT(v, y)(u, g) = γ·I_𝔠(cone(z + 1, v), Φ_y)(g)` for all `v`, `y`, `(u, g)` as in (b).
(d) If `rk V − n/2 = −(z + 1) < 0`, the same holds with `dualCone(z + 1, v)` in place of `cone(z + 1, v)`.

`ThetaKernelsForUnitaryDualPairs §5.7c` gives the constant term as a sum of two theta integrals for general data in
ranges that exclude `rk V − n/2 + 1 = 1` and `rk V − n/2 + 1 = 0`; it does not give the size of the constant for
ramified data uniformly in the character.

*Needs:* 6.1, 6.2, 6.3, 6.4, 6.5, 6.7; `WeilRepresentationsOnBanachSpacesOfData §§6.4, 6.10, 6.12` (theta
integrals, growth of kernels).

[ShortProof], `Lib/SiegelWeil/Tower/LargeSideConstantTerm.lean` (`New.Exchange.pairWeil_stdRowDatum_eq_self`,
`New.Exchange.rankTwist_eq_mul_of_splitting`, `New.Exchange.homSlice_zero_planeDatum`,
`New.Exchange.tsum_lineValue_poisson`, `New.Exchange.exists_zetaIntegral`,
`New.Exchange.exists_planeConstantTerm_eq_thetaLarge_cone`,
`New.Exchange.exists_planeConstantTerm_eq_thetaLarge_dualCone`)

### 6.9 Continuation to a real half-line and functional equation in absolute values

*Origin:* adapted from the published theory of Hecke L-functions (analytic continuation and functional equation by
Tate's method): here for the partial L-functions of split tame characters of `U(1)` of positive weight over a CM field
with Weil data, for real arguments only, on a half-line bounded by the weight, as an identity of absolute values with
an unspecified positive factor, and with non-vanishing at the integers.

*Method of the formal proof:* 6.8 (b) for pairs in which `W` and `V` have rank `0` (one hyperbolic plane on each
side), where the theta integrals are explicit constants, evaluated at the test vector of 6.7 (b): the zeta integral
`𝒵` is analytic on
`ℝ`, and `𝒵(x)` and `𝒵(1 − x)` are, for `x ≥ 1`, the same expression `|κ_E|^x·∏_{w ∈ S} q_w^{x − 1/2}·L^S(x, ν)·Γ_m(x)`
up to constants of fixed modulus, where `Γ_m(x)` is the archimedean zeta integral of the test function, positive and
analytic for `x > −k`. Dividing `𝒵` by the factors other than `L` gives the continuation and the equation; the
non-vanishing at integers `j ≤ 0` follows from the equation and 6.2 (a).

Let `μ` be a weight and `k ∈ ℕ` with `k ≤ μ_τ` for every `τ`.
(a) There is `C : ℝ → ℝ`, positive on `[1, k + 1)`, such that for every split tame character `𝔠 = (ν, S)` of weight `μ`
there is a real-analytic function `Λ` on `(−k, ∞)` with `Λ(x) = L^S(x, ν)` for `x ≥ 1` and
`|Λ(1 − z)|·∏_{w ∈ S} q_w^{1/2 − z} = C(z)·L♯(z)` for `1 ≤ z < k + 1`.
(b) For every such `𝔠` the function `Λ` of (a) satisfies `Λ(j) ≠ 0` for every integer `j > −k`.

`AnalyticNumberTheoryPartI §2.3a` (Hecke's continuation and functional equation for every unitary Hecke character)
also implies (a) and (b), with the conductor `|D_E|·∏_{w ∈ S} q_w²` and the gamma factors absorbed into `C`, together with
the non-vanishing 6.2 (a).

*Needs:* 6.2 (a), 6.7, 6.8; `WeilRepresentationsOnBanachSpacesOfData §§5.6, 6.1, 6.10` (kernels with a rank-zero
space).

[ShortProof], `Lib/SiegelWeil/Tower/FunctionalEquation.lean` (`New.Exchange.exists_analyticOnNhd_eq_L_mul_gammaIntegral`,
`New.Exchange.exists_analytic_extension_functional_equation`, `New.Exchange.exists_analytic_extension_ne_zero`,
`New.Exchange.gammaIntegral_pos`, `New.Exchange.analyticOnNhd_gammaIntegral`)

## What the library already provides

None of the results of this roadmap is in the Tau Ceti library or in Mathlib in the form needed. Two neighbouring
results are there, on other objects:

- Kneser neighbours of integral quadratic `ℤ`-lattices, the neighbour construction, and that neighbours lie in one
  genus: `TauCeti.IntegralLattice.IsNeighbor`, `TauCeti.IntegralLattice.neighbor`,
  `TauCeti.IntegralLattice.IsNeighbor.sameGenus` (no hermitian lattices; 1.2 does not follow from them).
- Hecke's functional equation for the completed partial zeta function of an ideal class over any number field:
  `TauCeti.LFunctions.completedPartialZeta_one_sub` (no character; the L-functions of Hecke characters,
  `TauCeti.LFunctions.Grossencharacter.lFunctionC`, are defined as the meromorphic continuation when one exists, and
  its existence is not proved in general). A continuation and functional equation for Hecke characters in the
  library would imply 6.9 after identifying the base change of a split tame character with a Grössencharacter and its
  Euler product off `S ∪ S̄`.

## Results taken from other roadmaps

Witt's extension theorem over a field with involution, in the matrix form used (left invertible `X`, `Y` with
`X*JX = Y*JY` satisfy `gX = Y` with `g ∈ U(J)`), is taken from `HermitianFormsAndLattices §1.1 (b)` (in 2.2 and
6.4), as in `AdelicUnitaryGroupsAndAlgebraicModularForms`. No other result of this part is taken whole from another
roadmap. The sections that state modest forms of general theorems
name, in a closing sentence, the general section that also implies them: `HermitianFormsAndLattices §2.5 (d)` (2.7),
`§5.4` (1.2 (c), (d)), `§6.0a` and `§6.5 (b)` (3.2, 3.3), `§6.4 (b)` (3.5 (d)); `AdelicAlgebraicGroups §3.4` (2.2);
`ThetaKernelsForUnitaryDualPairs §6.4a` (2.6 (c) for Schwartz–Bruhat data and isotropic `T`);
`AnalyticNumberTheoryPartI §2.3a` (6.9). The objects on which the statements are made (adelic unitary groups, the Weil representation on the Banach space of
data, Hecke characters of `U(1)`, discrete series coefficients) are those of the sibling roadmaps named on the
`*Needs:*` lines.
