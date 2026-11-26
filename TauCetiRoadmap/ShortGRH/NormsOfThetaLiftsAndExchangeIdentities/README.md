# Roadmap: norms of theta lifts and exchange identities for one lift

**Summary.** The roadmaps of the family `ShortGRH` prove the Riemann hypothesis for Dirichlet L-functions by one
route ([index of the family](../README.md)). Its lower bound, Theorem C of
[DeterminantsOfThetaLiftChains](../DeterminantsOfThetaLiftChains/README.md), bounds from below the covolume plus twice
the index of the lattice of target forms, through the height of the ratio `Z(1)/Z(ξ_ι)` of the Gram determinants of the
chain of `m` theta lifts at the trivial twist and at a twist `ξ_ι` chosen for each prime. That determinant factors into
the Gram determinants `Z_j` of the single lifts `Θ_{j,ϑ} : 𝒢(W_j) → 𝒜(V_j)`, from the good forms on a hermitian space
`W_j`
of rank `r` to the algebraic forms on a definite space `V_j` of rank `r + t`. This roadmap treats one such lift. Its
headline theorem is the cost of one lift: along a regular family of twists `θ`, the family `ι ↦ Z_j(1)/Z_j(θ_ι)` has
height at most `d·k·(log b·β_tot − h_dir)`, where `d` is the dimension of the target, `β_tot` the budget for
denominators and `h_dir = Σ_σ (s_∞(κ(σ)) − s_fin(κ(σ), σ))` the cost of one direction; `Z_j(ϑ)` is the Gram
determinant of lift `j` twisted by `ϑ^j` (DeterminantsOfThetaLiftChains, Conventions). Summed over the `m` lifts this
gives back the main amount `h_main = m·k·h_dir`; it is the only place where `h_dir` enters Theorem C.

The proof compares the twisted lift with the untwisted one through an operator on `𝒜(V_j)`. Three applications of the
exchange identity of DeterminantsOfThetaLiftChains turn the twist of a theta series on `U(W_j)` into a number `c′_ϑ`,
whose squared modulus is a constant divided by a product `Γ_j(ϑ)` of Hecke L-values (Layer 4). Gluing the forms that
carry that series to arbitrary forms on a complementary block `V°` gives a map `glue_ϑ` into `𝒜(V_j)` with
`c′_ϑ·glue_ϑ^*·Θ_{j,ϑ} = Θ°`, a twist-free map that is injective because products of theta series span (Layers 3, 4, 7).
The
glued forms are integral away from the twist, short at the trivial twist, and orthogonal to the false lifts, the forms
that look like lifts at one Hecke operator and are orthogonal to the lifts (Layers 1, 5). The projection to the lifts
of a form orthogonal to the false lifts has a denominator at each prime, which the congruences of
[CongruencesOfTwistedThetaLifts](../CongruencesOfTwistedThetaLifts/README.md) bound. So the Gram determinant
`vol(Θ_{j,ϑ}|𝒢(W_j))` times a determinant of controlled size and denominator is a constant times `Γ_j(ϑ)^d`. The height of `Γ_j` comes from rank-one lifts: a
critical
value `L(z, μ⁻¹)` of a Hecke character is the squared norm of the theta lift of `μ` from `U(1)` to a definite `U(2z)`
(Layer 2), and a test form whose pairing with that lift has exactly the divisibility forced on derivatives of theta
functions (the sharpness theorem of
[DivisibilityOfThetaDerivatives](../DivisibilityOfThetaDerivatives/README.md)) bounds the valuation of the twisted
value from above (Layer 6).

The roadmap covers the folder `New/OneLift` of `[ShortProof]` (24 files). It builds on
[ThetaLiftChainsAndTheSeesawIdentity](../ThetaLiftChainsAndTheSeesawIdentity/README.md) for descent pairs, theta
kernels between definite spaces and their integrality; on DeterminantsOfThetaLiftChains for critical pairs, regular
families of twists, the lift of a descent pair and the exchange identity; and on
[OneSidedPrimeSumBoundsAndAdmissibleData](../OneSidedPrimeSumBoundsAndAdmissibleData/README.md) for the data and
heights. It feeds DeterminantsOfThetaLiftChains (the cost of one lift, false lifts, test forms),
CongruencesOfTwistedThetaLifts (false lifts, the denominator predicate, the lifts from `U(1)` of the main pairs) and
[SelmerBoundsForAnticyclotomicTwists](../SelmerBoundsForAnticyclotomicTwists/README.md) (L-values as integral
measures).

Layer 1 defines point forms, false lifts and the denominator of a projection. Layer 2 treats the lift of a character
from `U(1)` and its squared norm. Layer 3 sets up gluing and the first factors. Layer 4 proves the three exchanges and
that products span. Layer 5 proves that periods of false lifts vanish. Layer 6 bounds the heights of ratios of Hecke
values. Layer 7 builds the comparison operator and proves the cost of one lift.

## Conventions and notation

**Roadmaps and sources.** A roadmap name of the family `ShortGRH` refers to that roadmap; every other roadmap name
refers to the roadmap of that name in the family `RiemannHypothesisForDirichletLFunctions`, unless an area is named.
Citations are by section number, `Name §k.n`; bare numbers are sections of this roadmap. `ShortGRH background (…)` names
a result that the family uses and that no roadmap section states; it is given in the form used, with the file and
declaration of `[ShortProof]` that proves it. `[ShortProof]` is the formal proof that the family follows; the pointer
line of a section names the file under its directory `src/` and the declarations that prove the statement. The labels
`*Origin:*`, `*Method of the formal proof:*` and `*Needs:*` are those of the [index of the family](../README.md).

**The data.** `D` denotes admissible data (OneSidedPrimeSumBoundsAndAdmissibleData §3.2), with the letters of
DeterminantsOfThetaLiftChains: the CM field `E`, `K = ℚ(√−d)`, the set `Φ_E` of its `f` infinite places `τ`; the chosen
places `𝒞`, the finite places of `E` dividing `π_M`, with `π_M π̄_M = M = p₀p₁`, their residue fields `k_w`; the ranks
`m`,
`r`, `k = r + 1 − m`, `t = 5r`; the gap `Δ` and the weights `κ(τ)`, `κ_j(τ)`; the scales `x`, `x₁`, `b` and `a = x·b`;
`s_∞(i) = log i! + i·log(M/Ω)`, `h_dir`, `h_main = m·k·h_dir`, the error unit `f·a·(log b)³` and
`β_tot = f·a·(log b)³/(m·k)` (OneSidedPrimeSumBoundsAndAdmissibleData §4.1). Inequalities between these numbers that
follow from the inequalities of the data (OneSidedPrimeSumBoundsAndAdmissibleData §3.3) are used without comment.
Sections that do not mention `D` hold for every CM field `E` with Weil data
(DivisibilityOfThetaDerivatives §1.4): a CM type, the splitting character `υ` with restriction `υ₁` to the norm-one
ideles, a skew element `j`, a self-dual finite idele and the additive character `ψ`; such a field contains a primitive
root of unity of order `5040`, so `E/E⁺` is unramified at the finite places.

**Characters, L-values, pairs, twists.** As in DeterminantsOfThetaLiftChains (Conventions and §1.1 to §1.3): `[U(1)]`,
characters of `[U(1)]` with a weight and a tame part, the partial L-function `L^S(z, ν)` of the base change
`ν̃(x) = ν(x/x̄)` without the factors at `S` and its conjugates,
`L_*(S, ν, e) = (∏_{v∈S} q_v)^{e²}·∏_{z=1}^{e} |L^S(z, ν)|²`, a modulus `𝔪`, a character tame for `(𝔪, χ)`, matched
functions, critical, ramified and main pairs `p = (ν, z)`, `ratio(p, ϑ, s)`, tame characters `ϑ` with their places
`Q(ϑ)`
and `Nm Q(ϑ)`, twists and `m`-fold twists, the characters `μ_j⁰`, `χ_M`, `ω`, regular families of twists. The Frobenius
value of a character `α` at a finite place `v`, in rank `N`, is `α̃′(ϖ_v)·q_v^{N/2}`, where `α̃′` is the Hecke character
that a space of rank `N` carrying `α` has as splitting character.

**Spaces, forms, lifts.** As in ThetaLiftChainsAndTheSeesawIdentity and DeterminantsOfThetaLiftChains: hermitian spaces
over `E` with signs, the standard definite space `I_n` (also `E^n`), adelic unitary groups `U(S)(𝔸)`, `[U(S)]` with its
invariant measure, the Weil representation of a pair and its Fock model, the theta kernel `θ^{S,T}_{α,β}[Ψ, P]` of a
pair with characters `(α, β)`, a datum `Ψ` modulo a modulus at its primes, the vacuum elsewhere, and the Fock vector of
a polynomial `P` at the infinite places; class sums `Σ_h f(h)/#Aut(h)` over the classes of a definite group at a
level; algebraic forms with their class-sum inner product; `W_j`, `V_j`, `𝒢(W_j)`, `e₀`, `G₀ = ∏_{w∈𝒞} GL_r(k_w)`,
`Θ_{j,ϑ}`, `Z_j(ϑ)`, `𝒯` and `d = dim 𝒯`. For a descent pair `O` (ThetaLiftChainsAndTheSeesawIdentity §2.16) this
roadmap
writes `𝒜(O)` for the forms on `V = I_n` of the pair, `𝒞_O` and `Q_O` for its chosen and twist places, `G_O = ∏_{w∈𝒞_O}
GL_r(k_w)`, `K_O` and `χ_O` for its level and character, `ρ_O` for its weight representation with invariant hermitian
form `⟨·,·⟩_ρ`, `k⁺`, `k⁻` (also `μ⁺`, `μ⁻`) for its two diagrams, `ν_W`, `ν_V` for the characters of its spaces, and
`t = n − r` for the difference of ranks. `λ₁(S g)` is the first minimum, cut at `1`, of the lattice of `S` moved by the
adelic point `g`.

**Integrality, sizes, heights.** `ι` runs over the pairs of a prime `ℓ` and an isomorphism `ι : ℂ ≃ ℚ̄_ℓ`, read as a
place of `ℂ` through `ℚ̄_ℓ ⊂ ℂ_ℓ`. A vector of a weight representation is integral at an embedding `ℂ → ℂ_l` at a point
`h` if its `l`-adic gauge there is at most `1` (ThetaLiftChainsAndTheSeesawIdentity §1.5); a form is integral if all its
values are. `‖φ‖²_σ` is the squared norm of the `σ`-conjugate of a form, `σ` an automorphism of `ℂ`. Heights of families
indexed by the `ι` are those of OneSidedPrimeSumBoundsAndAdmissibleData §1.2.

### Table of symbols

| Symbol | Meaning | Defined |
|---|---|---|
| `D, E, K, Φ_E, f, 𝒞, M, π_M, m, r, k, t, x, x₁, b, a` | the data | OneSidedPrimeSumBoundsAndAdmissibleData §3.2 |
| `s_∞, h_dir, h_main, β_tot` | size of a derivative, cost of a direction, main amount, denominator budget | OneSidedPrimeSumBoundsAndAdmissibleData §4.1; Conventions |
| `O, 𝒜(O), 𝒞_O, Q_O, G_O, ρ_O, ν_W, ν_V` | a descent pair and its attributes | ThetaLiftChainsAndTheSeesawIdentity §2.16; Conventions |
| `δ_h(v)`, point form | class form, form supported on one class with prescribed finite datum | 1.1 |
| `⟨·,·⟩_σ, H_w(X), X_*(w)` | conjugated pairing, Hecke polynomial operator, test value | 1.2, 1.3 |
| false lifts, test forms, `e_1` | forms satisfying the conditions of a lift; integral forms orthogonal to them; idempotent of the label `X − 1` | 1.3 |
| denominator at most `β` at `ι` | congruence number of a projection | 1.4 |
| `X, O_X, K_X(g), φ_X, J_X` | lift data from `U(1)`, their descent pair, kernel form, lift, level | 2.1 |
| `φ_{p,ϑ}, n_ν, L^alg(p, ϑ), n_L` | lift of a pair, its denominator, algebraic part, `n_GL·n_ν²` | 2.5 |
| `P(𝔪)` | period of the determinant kernel | 2.7 |
| `ϖ, R₂, Γ, γ, e_den` | generator of the chosen places, `O_E/ϖ²`, congruence group, glued lattice, denominator exponent | 3.2, 3.3 |
| `S, W♭, V″, V°, W^add, φ°, 𝖺_c, Λ_i, 𝖥_i` | spaces of the exchanges, carrier, its coefficients, choices, twist-free functions | 3.4, 3.5 |
| `χ′, ν″, ν♭` | characters of the exchanges | 3.4 |
| `ζ, Ψ^add, Υ_{ϑ,i}, c″, φ″_{ϑ,i}` | polynomial map, added datum, series, scale, first factor | 3.5, 3.6 |
| `z_±, z_*, p_±, p_*, Γ_j(ϑ)` | points and pairs of the exchanges, product of Hecke values | 4.1 |
| `Ξ^ex_{ϑ,i}, Ξ_{ϑ,i}, c′_ϑ` | left side of the third exchange, theta series of the first factor (`Ξ_{ϑ,i} = c″·Ξ^ex_{ϑ,i}`), twist factor | 4.3, 7.1 |
| `n_*, m_u`, peak | `2f·t³`, basic holomorphic function, point of modulus above half the supremum | 4.5 |
| `S_O`, hyperplane sums | level places and conjugates; products of character sums over `1 + vλ` | 5.1 |
| integral measure | function of tame characters given by an integral group-ring element | 6.1 |
| `T_z, h_X` | twisted central translation, class number of `U(1)` at the level | 6.3 |
| `𝒜^⊕, glue_ϑ, Θ°, hk` | tuples of forms on `V°`, gluing map, period map, hook number of `μ⁻` | 7.1, 7.2, 7.3 |
| `U_ϑ, pr U_ϑ` | comparison operator and its compression to the lifts | 7.4, 7.5 |

## Layer 1: Tested forms, Hecke adjoints, false lifts and denominators

The forms on the definite space `V` of a descent pair are tested against forms supported on one class, whose inner
products and descents are explicit. The Hecke polynomial at a split place has an explicit adjoint for the conjugated
pairings. A false lift is a form that satisfies the conditions that hold for a lift and is orthogonal to the lifts; on
forms orthogonal to the false lifts the projection to the lifts does not increase any conjugate norm. The denominator
of that projection at a prime is the quantity that the congruences of the lower bound control.

### 1.1 Point forms: inner products and descent

*Origin:* adapted from Gross (1999), algebraic modular forms as functions on a finite set of classes: here the forms
supported on one class of a descent pair, with the finite datum of their descent.

*Method of the formal proof:* the inner product with a form supported on one class is a single term of the class sum.
For the descent, the class sum of the conjugate kernel against a form supported on the class of `h` is the kernel at
`h` with its finite datum averaged over the level; translating the point by an integral element `A` replaces the block
datum `Ψ(T)` by `Ψ(A⁻¹T)`, and the block datum of the pair is supported on the inclusion matrix at the chosen places.

Let `O` be a descent pair over `E` (ThetaLiftChainsAndTheSeesawIdentity §2.16), with space `W` of rank `r`, definite
space `V = I_n`, chosen places `𝒞_O`, twist places `Q_O`, embedding `incl : r ↪ n`, tame part `(ψ_w)` and weight
representation `ρ_O` of `GL_n` over `ℂ` with its invariant hermitian form `⟨·,·⟩_ρ`. Write `𝒜(O)` for the forms on `V`
of the pair, with the class-sum inner product, and `U(V)(𝔸_f)` for the finite adelic points.

(a) For `h ∈ U(V)(𝔸_f)` and a vector `v` of `ρ_O`, the class form `δ_h(v) ∈ 𝒜(O)` is
`y ↦ Σ_γ χ_O(h⁻¹γy)·ρ_O(γ)⁻¹v`, the sum over the rational points `γ` of `U(V)` with `h⁻¹γy ∈ K_O`; `v ↦ δ_h(v)` is
linear. Prove: `⟨δ_h(v), φ⟩ = ⟨v, φ(h)⟩_ρ` for every `φ ∈ 𝒜(O)`.

(b) Prove: the normalised descent of `δ_h(v)` at a point `g` of `U(W)(𝔸)` is the complex conjugate of the theta kernel
of `(W, V)` with the characters of the pair at `(g, h)`, formed with the Fock polynomial of `v̄` at the infinite places
and, at the level places, with the block datum of the pair read on matrices modulo
`(∏_{w ∈ 𝒞_O} w)²·∏_{w ∈ Q_O} w` through their reductions at the level places.

(c) Let `Y = (Y_w)_{w ∈ 𝒞_O}` be `n × r` matrices of full column rank over the residue fields `k_w`, and `e : r ↪ n` a
choice of `r` rows. Prove: there is an element `A` of the standard maximal compact subgroup of `U(V)(𝔸_f)`, with
component `1` off the level places and their conjugates, whose reduction at each chosen place `w` has the columns `Y_w`
at the indices of `incl`, and whose reduction at each twist place has the unit vectors of `incl` in the rows `e`. The
point form of `(h, Y, e)` is `v ↦ δ_{hA}(v)` for one such `A`.

(d) Prove: `⟨δ_{hA}(v), φ⟩ = ⟨v, φ(hA)⟩_ρ`, and the normalised descent of the point form at `g` is the conjugate of the
theta kernel at `(g, h)` as in (b), with the block datum replaced by the point datum
`X ↦ ∏_{w ∈ Q_O} ψ_w(det X_{w,e})` if `X_w = Y_w` at every chosen place, and `0` otherwise, where `X_{w,e}` is the
square
matrix of the rows `e` of `X_w`.

*Needs:* ThetaLiftChainsAndTheSeesawIdentity §2.16, §2.17, §1.6.

[ShortProof], `New/OneLift/TestedForms.lean` (`New.Rows.classForm`, `New.Rows.inner_classForm`,
`New.Rows.normalizedDescent_classForm`, `New.Rows.IsPointLift`, `New.Rows.pointLift`, `New.Rows.isPointLift_pointLift`,
`New.Rows.pointForm`, `New.Rows.inner_pointForm`, `New.Rows.pointFormDatum`, `New.Rows.normalizedDescent_pointForm`)

### 1.2 The adjoint of the Hecke polynomial for the conjugated pairings

*Origin:* adapted from the theory of Hecke operators on algebraic modular forms (Gross (1999): the adjoint of the
operator of a double coset is the operator of the inverse double coset; in the library,
DiscreteSeriesCoefficientsAndAutomorphicMetrics §7.5a, Hecke adjoints): here for the Hecke polynomial at a split
place and for the pairing conjugated by an automorphism of `ℂ`.

*Method of the formal proof:* the adjoint of `T_{w,i}` for the class-sum pairing is `T_{w̄,i}`, because the inverse of
the double coset of `diag(ϖ, …, ϖ, 1, …, 1)` at `w` is that double coset at `w̄`; the Hecke operators have rational
structure constants and so commute with conjugation by `σ`, which moves the coefficient `X` to `σ⁻¹(conj(σX))`.
Commutation is that of the spherical Hecke algebras, and the idempotent is self-adjoint because the action of the
finite group is unitary for every conjugated pairing.

Let `O` be a descent pair. For an automorphism `σ` of `ℂ` and `φ, φ′ ∈ 𝒜(O)`, `⟨φ, φ′⟩_σ = σ⁻¹⟨φ^σ, φ′^σ⟩`, where `φ^σ`
is the form with values `σ(φ(g))` in the integral coordinates of `ρ_O`, and `‖φ‖²_σ = ⟨φ^σ, φ^σ⟩`. A split place `w ≠
w̄`
is off the level if neither `w` nor `w̄` is a level place of `O` or the conjugate of one. For such `w`, of norm `q`, and
`X ∈ ℂ`, `H_w(X) = Σ_{i=0}^{n} (−X)^i q^{i(i−1)/2} T_{w,i}` on `𝒜(O)`, with `T_{w,i}` the Hecke operator of
`diag(ϖ_w 1_i, 1_{n−i})`. The group `G_O = ∏_{w ∈ 𝒞_O} GL_r(k_w)` acts on `𝒜(O)`, and so does its group algebra.

Prove, for split places `w`, `u` off the level, `X, Y ∈ ℂ` and `φ, φ′ ∈ 𝒜(O)`:

(a) `⟨H_w(X)φ, φ′⟩_σ = ⟨φ, H_{w̄}(X′)φ′⟩_σ` with `X′ = σ⁻¹(conj(σ(X)))`;

(b) `H_w(X)H_u(Y) = H_u(Y)H_w(X)` (the places `w`, `u` may be equal or conjugate);

(c) a central idempotent `e` of `ℂ[G_O]` satisfies `⟨eφ, φ′⟩_σ = ⟨φ, eφ′⟩_σ`, and an operator on `𝒜(O)` that commutes
with the action of `G_O` preserves the image of every element of `ℂ[G_O]`;

(d) for `g ∈ G_O` the number `∏_{w ∈ 𝒞_O} ψ_w(det g_w)` is a root of unity.

*Needs:* ThetaLiftChainsAndTheSeesawIdentity §2.16; OneSidedPrimeSumBoundsAndAdmissibleData §1.3; ShortGRH background
(the conjugated pairings of the algebraic forms of a level and the Hecke operators at split places: for an automorphism
`σ` of `ℂ`, `⟨φ, φ′⟩_σ` is `σ⁻¹` of the class sum at the level of the Gram form of `σ∘φ` and `σ∘φ′`, linear in `φ′`,
semilinear for `σ⁻¹∘conj∘σ` in `φ`, Hermitian for that conjugation and definite, and `‖φ‖²_σ` is the class sum of the
squared Gram norms of `σ∘φ`; for a split place `w`, a pairing `B` of two representations of the finite adelic group
that is invariant and semilinear for a ring homomorphism `ς` of `ℂ` in the first variable has
`B(H_w(X)y, z) = B(y, H_{w̄}(ςX)z)` on vectors spherical at `w`; and the Hecke operators at two split places, equal,
conjugate or neither, commute on a vector spherical at both; [ShortProof]
`Lib/Adelic/AutomorphicForms/PAdicGauge.lean` (`New.LevelPlaces.LevelForm.innerAt`,
`New.LevelPlaces.LevelForm.innerAt_eq_stdClassSum`, `New.LevelPlaces.LevelForm.conj_innerAt`,
`New.LevelPlaces.LevelForm.eq_zero_of_innerAt_self`, `New.LevelPlaces.LevelForm.normSqAt`),
`Lib/Weil/Unramified/SplitHecke.lean` (`New.heckePolyOp_adjoint`, `New.heckeSplit_comm`)).

[ShortProof], `New/OneLift/TestedForms.lean` (`New.LevelPlaces.LevelForm.innerAt_heckePolyOnForms`,
`New.DescentPair.heckePolyOnForms_comm`, `New.DescentPair.groupAlgAction`, `New.DescentPair.innerAt_groupAlgAction`,
`New.DescentPair.range_groupAlgAction_mem_invtSubmodule`, `New.DescentPair.isOfFinOrder_prod_tamePart_det`)

### 1.3 False lifts, forms orthogonal to the false lifts, and test forms

*Origin:* definitions and conventions.

*Method of the formal proof:* definitions.

Let `O` be a descent pair, `t = n − r` its difference of ranks, and `ν_W` the character that `W` carries
(ThetaLiftChainsAndTheSeesawIdentity §2.16). For a split place `w` off the level, of norm `q`, the test value is
`X_*(w) = (ν_W(w)·q^{t−1})⁻¹`, where `ν_W(w)` is the Frobenius value at `w` of `ν_W` in rank `r`; it is the root of the
factor `1 − q^{t−1}ν_W(w)T` of the Hecke polynomial of a lift. Let `e` be an element of `ℂ[G_O]` and `Z ⊂ 𝒜(O)` a
subspace.

(a) The false lifts at `w`, for `e` and `Z`, are the forms of `Z` that lie in the image of `e` and are killed by
`H_w(X_*(w))`: the subspace `e𝒜(O) ∩ ker H_w(X_*(w)) ∩ Z`.

(b) A form `y ∈ 𝒜(O)` is orthogonal to the false lifts, for `e` and `Z`, if for every split place `w` off the level it
is orthogonal, for the inner product of `𝒜(O)`, to the false lifts at `w` for `e` and `Z`.

(c) Let `ℓ` be a prime and let `W` have rank `r = 1`. A test form at `ℓ` is a form `Ξ ∈ 𝒜(O)` that is integral at
every embedding `ℂ → ℂ_ℓ` and orthogonal to the false lifts for `e = e_1` and `Z = ker(normalised descent of O)`, where
`e_1` is the product over the chosen places of the idempotents of `GL_1(k_w)` of the label `X − 1`
(FiniteReductiveGroups §5.7), that is, the mean over `G_O`. (For `r > 1` the polynomial `X − 1` is not a label of
degree `r`; test forms are used only for the rank-one lifts of 2.5.)

In the lower bound (b) is used with `Z` the orthogonal complement of a space of lifts: DeterminantsOfThetaLiftChains
§1.3 takes `e = e₀` and the complement of the range of `Θ_{j,ϑ}` on `𝒢(W_j)`.

*Needs:* 1.2; ThetaLiftChainsAndTheSeesawIdentity §2.16, §2.5; FiniteReductiveGroups §5.7.

[ShortProof], `New/OneLift/TestedForms.lean` (`New.DescentPair.falseLiftsAt`,
`New.DescentPair.IsOrthogonalToFalseLifts`, `New.DescentPair.IsTestForm`)

### 1.4 The denominator of the projection to a subspace

*Origin:* particular to this proof: a congruence number for a subspace of forms, measured by the determinant of one
operator that makes the projections of integral forms integral.

*Method of the formal proof:* definition.

Let `O` be a descent pair, `ℓ` a prime, `ι : ℂ ≃ ℚ̄_ℓ` an isomorphism, read as a place of `ℂ` through `ℚ̄_ℓ ⊂ ℂ_ℓ`,
`e ∈ ℂ[G_O]`, `Z ⊂ 𝒜(O)` a subspace with orthogonal projection `pr_Z`, and `β` a real number. The projection to `Z` has
denominator at most `β` at `ι` (for `O` and `e`) if there is an endomorphism `Λ` of `Z` such that

- `|ι(det Λ)| ≥ exp(−dim Z·r·β)`, with `r` the rank of `W`, and
- for every `y ∈ 𝒜(O)` that is integral at `ι` and orthogonal to the false lifts for `e` and `Z^⊥`: the form
  `Λ(pr_Z y)` is integral at `ι`, and `|ι⟨y′, Λ(pr_Z y)⟩| ≤ 1` for every `y′ ∈ 𝒜(O)` that is integral at every
  embedding `ℂ → ℂ_ℓ`.

Check: for `Z = 0` the condition holds for every `β`, with `Λ = 0` on the zero space, whose determinant is `1`.

*Needs:* 1.3; OneSidedPrimeSumBoundsAndAdmissibleData §1.2.

[ShortProof], `New/OneLift/TestedForms.lean` (`New.Selmer.DenominatorLe`, `New.PadicPlace.ofIso`,
`New.PadicPlace.ιₚ_ofIso`)

### 1.5 The projection to the lifts does not increase conjugate norms

*Origin:* particular to this proof: on forms orthogonal to the false lifts, the orthogonal projection to a space cut
out by an idempotent and one Hecke polynomial is a contraction for every conjugate norm.

*Method of the formal proof:* write `A = H_w(X_*(w))` and `y = z + x` with `z ∈ Z` and `x ∈ ker e + range A′`, `A′` the
adjoint of `A`, which is possible because `y` is orthogonal to the forms of `e𝒜(O) ∩ ker A` outside `Z`, the false
lifts. By 1.2 the space `ker e + range A′` is orthogonal to `e𝒜(O) ∩ ker A`, hence to `Z`, for every pairing `⟨·,·⟩_σ`;
so `z = pr_Z y`, and Pythagoras applies at every `σ`.

Let `O` be a descent pair, `e` a central idempotent of `ℂ[G_O]` (an idempotent whose coefficients form a class
function), `w` a split place off the level, and `Z ⊂ e𝒜(O) ∩ ker H_w(X_*(w))`. Prove: if `y ∈ 𝒜(O)` is orthogonal to the
false lifts for `e` and `Z^⊥`, then `‖pr_Z y‖²_σ ≤ ‖y‖²_σ` for every automorphism `σ` of `ℂ`, where `pr_Z` is the
orthogonal projection for the inner product of `𝒜(O)`.

*Needs:* 1.2, 1.3.

[ShortProof], `New/OneLift/TestedForms.lean` (`New.DescentPair.normSqAt_starProjection_le`)

## Layer 2: The lift of a character from `U(1)` and its squared norm

The theta lift of the constant function on `U(1)` to a definite unitary group of even rank `2z`, formed with a
character `μ` of `[U(1)]`, is an algebraic form whose squared norm is an explicit multiple of the partial Hecke L-value
`L(z, μ⁻¹)`. This layer defines the lift, computes its inner products through the descent to the line, its Hecke
polynomials, its squared norm and its Galois conjugates, and reads the ratio of a critical pair
(DeterminantsOfThetaLiftChains §1.1) as a ratio of squared norms. The value at `z = 1`, where the rank two is outside
the range of the norm formula, is carried by the period of a determinant theta kernel.

### 2.1 Lift data, the kernel form and the lift of a character

*Origin:* adapted from T. Yang (1997), theta liftings from `U(1)` and Hecke L-functions: here the lift to a definite
group of rank `n ≥ 2` as an algebraic form, the class sum of the theta kernel with the block datum of a descent pair.

*Method of the formal proof:* definitions; invariance of the kernel under rational points is that of the theta
functional, and invariance under the level is the behaviour of the block datum under the level of the line
(ThetaLiftChainsAndTheSeesawIdentity §2.17 (b)); the class sum does not change under translation of the variable.

(a) Lift data `X` over `E`, for an index set `n` with `#n ≥ 2`, consist of level places (chosen places `𝒞_X` and twist
places `Q_X`, as for a descent pair), row lengths `ρ(τ) ≥ 0` at the infinite places, and a character `μ_X` of `[U(1)]`
of weight `−(ρ(τ) + ⌊#n/2⌋)` at `τ` whose tame part is trivial off the level places. Its descent pair `O_X` has `W` the
standard positive definite line, `V = I_n`, the embedding of the one basis vector of `W` at one index of `n`, the
character `μ_X`, and column counts `k⁺(τ, ·)` with `ρ(τ)` columns of height `1` and `k⁻ = 0`, so that the weight of the
forms on `V` has the single row `ρ(τ)` at each `τ`.

(b) For a finite adelic point `g` of `U(1)`, the kernel form `K_X(g) ∈ 𝒜(O_X)` is `h ↦` the vector of the jets, for the
one-row weight and with variables scaled by `1`, of the theta function of `ω(g, h)(Ψ_bl ⊗ vac)`, with `Ψ_bl ⊗ vac` the
block datum of `O_X`. The lift of `μ_X` is `φ_X = Σ_g K_X(g)/#Aut(g)`, the class sum over
`U(1)(E)\U(1)(𝔸_f)/J_X`, with `J_X` the integral points that reduce to `1` at the chosen places.

(c) Prove: `g ↦ K_X(g)` is invariant under rational points on the left and under `J_X` on the right; for every finite
point `z` of `U(1)`, `φ_X` is also the class sum of `g ↦ K_X(gz)`; and if `ρ = 0`, every coordinate of `K_X(g)(h)` is
the value at `((1, g), (1, h))` of the scalar theta kernel of `(W, V)` with the characters `1` and `μ_X·υ₁^{⌊#n/2⌋}`,
the polynomial `1`, and the block datum modulo `(∏_{w ∈ 𝒞_X} w)²·∏_{w ∈ Q_X} w`.

*Needs:* ThetaLiftChainsAndTheSeesawIdentity §2.16, §2.17, §1.6, §1.7; DivisibilityOfThetaDerivatives §1.6.

[ShortProof], `New/OneLift/HeckeValues/CharacterLift.lean` (`New.LValueData`, `New.LValueData.descentPair`,
`New.LValueData.kernelValue`, `New.LValueData.isLiftWeight`, `New.LValueData.liftKernel`,
`New.LValueData.kernelForm`, `New.LValueData.chosenLevel`, `New.LValueData.trivialLift`,
`New.LValueData.kernelForm_invariant`, `New.LValueData.trivialLift_eq_stdClassSum_translate`,
`New.LValueData.kernelForm_of_rowLength_eq_zero`, `New.arbitraryIndexEmbedding`, `New.stdLineHom`)

### 2.2 The lift and the descent are adjoint; the Hecke polynomials of the lift

*Origin:* adapted from the adjointness of theta lifts and theta descents and from the Hecke eigenvalues of a theta
lift (Rallis (1984a), the Howe duality conjecture and Satake parameters of lifts): here for the lift of the constant
function from `U(1)`.

*Method of the formal proof:* the pairing of the kernel with a vector of the weight is a theta value of a Fock vector,
so the descent of a form is its inner product with the kernel, and summing over the classes of `U(1)` gives (b). The
lift is the theta lift of the constant function `1` because the class sum over `U(1)` is an integral over `[U(1)]`; the
parameter `0` on the line fits the pair, so the lift has the Hecke polynomials of a lift of the trivial system, and
(e) evaluates such a polynomial at the zero of one of its factors.

Let `X` be lift data and `O = O_X`. Prove:

(a) for `y ∈ 𝒜(O)`, a real point `x` and a finite point `g` of `U(1)`, the normalised descent of `y` at `(x, g)` is
`⟨K_X(g), y⟩`;

(b) `⟨φ_X, y⟩` is the class sum over `U(1)(E)\U(1)(𝔸_f)/J_X` of `g ↦ (normalised descent of y)(1, gz)`, for every finite
point `z`;

(c) the squared Fock norm of the highest vector of the weight of `O` in rank `#n` is `∏_τ ρ(τ)!`; the parameter `0` on
`W` fits `O`; and `φ_X = [U(1)(Ô) : J_X]·Θ(1)`, where `Θ(1)` is the theta lift of the constant function `1` on `[U(1)]`
by the pair `O` (ThetaLiftChainsAndTheSeesawIdentity §2.17) and `U(1)(Ô)` the integral points;

(d) at a split place `w` off the level, of norm `q`, `φ_X` is spherical with Hecke polynomial
`∏_{l < #n−1}(1 − q^l αT)·(1 − q^{#n−1}αβ⁻¹T)`, where `α`, `β` are the Frobenius values at `w` of the characters of `W`
and `V` in ranks `1` and `#n`;

(e) for any descent pair `O` with `t = n − r`, a split place `w` off the level and a form `y ∈ 𝒜(O)` that has the Hecke
polynomials of a lift of some system of eigenvalues (ThetaLiftChainsAndTheSeesawIdentity §2.16),
`H_w(X_*(w))·y = 0`.

In particular `φ_X` is orthogonal to the kernel of the normalised descent, and a form with the Hecke polynomials of a
lift that lies in a space `Z` and in the image of `e` is a false lift for `(e, Z)` at every split place off the level
(1.3).

*Needs:* 1.2, 1.3, 2.1; ThetaLiftChainsAndTheSeesawIdentity §2.16, §2.17; DiscreteSeriesCoefficientsAndAutomorphicMetrics §7.5a (the comparison of the class-set inner product of algebraic
forms with the Petersson product of the attached automorphic functions: for forms of one level `J` and weight on a
definite standard space the first is `[K° : J]·dim ρ` times the second, in the normalisation of [ShortProof]
`New/OneLift/HeckeValues/CharacterLift.lean` (`New.LevelPlaces.LevelForm.inner_eq_petersson`)).

[ShortProof], `New/OneLift/HeckeValues/CharacterLift.lean` (`New.LValueData.toPoly_eq_rename_fockPoly`,
`New.LValueData.fockPoly_eq_schurCoeffPoly`, `New.LValueData.normalizedDescent_eq_inner_kernelForm`,
`New.LValueData.inner_trivialLift`, `New.LValueData.hookNumber_eq_prod_factorial`, `New.LValueData.isHCParam_zero`,
`New.LValueData.fitsParams_descentPair`, `New.DescentPair.heckePolyOnForms_liftHeckeRoot_eq_zero`);
`New/OneLift/HeckeValues/CharacterLiftNorm.lean` (`New.LValueData.constForm`,
`New.LValueData.trivialLift_eq_smul_thetaLift`, `New.LValueData.lift_fockDatum_const_one`,
`New.LValueData.hasLiftHeckePolynomial_trivialLift`)

### 2.3 The squared norm of the lift is a Hecke L-value

*Origin:* adapted from the Rallis inner product formula in Weil's convergent range (Rallis (1984b); for unitary groups
J.-S. Li (1992)) and from T. Yang (1997): here the lift of the constant function from `U(1)` to a definite group of even
rank `2k ≥ 4`, with ramified finite data computed explicitly.

*Method of the formal proof:* the block datum is sharp for the action of `U(1)`: its matrix coefficient at integral
points is its norm on `J_X` and vanishes elsewhere. The inner product formula for sharp data gives the squared norm of
`Θ(1)` as the sum of the coefficients of the vacuum, which is the Euler product `L(k, μ⁻¹)/ζ_{E⁺}(2k)` without the
places of `X`; the omitted factors of `ζ_{E⁺}(2k)` combine with the index and the mean square of the block datum.

Let `X` be lift data with `#n = 2k` and `k ≥ 2`.

(a) Prove: the block datum of `O_X` is sharp for the action of `U(1)` with the character of `V`, for the set `S₀` of
the level places and their conjugates and the group `J_X`: it is the vacuum off `S₀`, and at finite points `g` integral
off `S₀` the coefficient `⟨F, ω(g)F⟩` is `⟨F, F⟩ ≠ 0` for `g ∈ J_X` and `0` otherwise; and
its mass `⟨F, F⟩/[U(1)(Ô) : J_X]` is `∏_{w ∈ 𝒞_X} q_w^{−2k}·∏_{w ∈ Q_X} (q_w − 1)/q_w` divided by that index.

(b) Let `C = vol[U(V)]·vol[U(1)]/ζ_{E⁺}(2k)`, with `ζ_{E⁺}` the Dedekind zeta function of the maximal totally real
subfield `E⁺` of `E` (the extension `E/E⁺` is unramified at the finite places). Prove: `C ≠ 0` and
`‖φ_X‖² = C·∏_{w ∈ 𝒞_X}(q_w − 1)·∏_τ ρ(τ)!·dim ρ_O·L^{S}(k, μ_X⁻¹)·(∏_{w ∈ Q_X} q_w)^{2k−1}`,
with `S` the set of level places of `X` and `L^S` as in the Conventions.

*Needs:* 2.1, 2.2; DeterminantsOfThetaLiftChains §2.2; SiegelWeilAndRallisFormulasOnUnitaryGroups §4.5 (the Rallis inner product formula for sharp
finite data by doubling, with unramified integrals as a sum over cosets).

[ShortProof], `New/OneLift/HeckeValues/CharacterLiftNorm.lean` (`New.LValueData.blockMeanSquare`,
`New.LValueData.isSharp_blockDatum`, `New.LValueData.inner_thetaLift_constForm_self`,
`New.LValueData.inner_trivialLift_self_eq_L`)

### 2.4 Galois conjugates of the lift

*Origin:* adapted from Shimura's reciprocity for theta functions with complex multiplication, in the form of the
action of automorphisms of `ℂ` on the Taylor coefficients of theta functions of CM lattices
(DivisibilityOfThetaDerivatives §4.7): here on the lift of a character from `U(1)` without twist places.

*Method of the formal proof:* the semilinear map that conjugates Taylor series of theta functions is moved past the
Weil operators; on the block datum it acts by a central element, which only permutes the classes of `U(1)`.

Let `(q₀, d)` be parameters and `E = K(ζ)` a field of the tower of OneSidedPrimeSumBoundsAndAdmissibleData §2.2, with
its Weil data, the number `Ω` and the scale `t₀` of Taylor series (DivisibilityOfThetaDerivatives §4.2). Let `S` be
level places of `E` without twist places, `σ` an automorphism of `ℂ` over `K`, and `n` a finite index set with
`#n = 2m`. Prove: there are complex numbers `t`, `l` and a norm-one idele `u` of `E`, depending only on `n`, `S` and
`σ`, with `|t| = Ω^{−1/2}` and `l ≠ 0`, such that for all lift data `X` on `S` with index set `n` the following holds.
Let `e` be the permutation of the infinite places induced by `σ`, and `Y` lift data on `S` with index set `n`, row
lengths `ρ_Y(τ) = ρ_X(e⁻¹τ)` and a character `μ_Y` whose values at the ideles with archimedean
component `1` are `σ(μ_X(·))`. Then, with `D = Σ_τ ρ_X(τ)`, for every finite point `h` of `U(V)` and every coordinate
`i` of the weight,

`σ((t₀^D·φ_X)(h)_i) = t^D·l·(μ_Y υ₁^m)(u)·(σΔ/Δ)(h)·(φ_Y)(h)_{i∘e⁻¹}`,

where `Δ` is the multiplier of the Weil representation and `(σΔ/Δ)(h)` its ratio at the finite component of
`x ↦ hx` on `Hom(W, V)`.

*Needs:* 2.1; DivisibilityOfThetaDerivatives §1.4, §4.2, §4.7; ThetaLiftChainsAndTheSeesawIdentity §1.3;
OneSidedPrimeSumBoundsAndAdmissibleData §2.2.

[ShortProof], `New/OneLift/HeckeValues/CharacterLift.lean` (`New.LValueData.map_trivialLift`)

### 2.5 The lift of a pair, its denominator and the algebraic part

*Origin:* adapted from Shimura's algebraicity of critical values of Hecke L-functions of CM fields, in the form of a
squared norm of an algebraic theta lift (T. Yang (1997)): here the normalisations of the data, and the ratio of a pair
as a ratio of normalised squared norms.

*Method of the formal proof:* by 2.3 the squared norm of the lift of `νϑ` is a constant independent of `ϑ` times
`L^{𝒞∪Q(ϑ)}(z, (νϑ)⁻¹)·Nm Q(ϑ)^{2z−1}`, and `|L^S(z, μ)| = |L^S(z, μ⁻¹)|`; the L-value is nonzero for `z ≥ 2` by the
Euler product, so the lift is nonzero and the squared norm positive. The finite group acts on the block datum through
the tame parts, which the class sum over `U(1)` absorbs.

Let `D` be the data, `p = (ν, z)` a critical pair with `z ≥ 2`, `ν` of weight `−c`, `n` an index set with `2z`
elements, and `ϑ` a tame character.

(a) The lift data of `(p, ϑ)` have the chosen places of `D` and the twist places `Q(ϑ)`, the row lengths `c(τ) − z`
and the character `νϑ`; write `O_{p,ϑ}` for its descent pair. The lift of the pair is
`φ_{p,ϑ} = v₀^{2z}·(π_M·t₀)^{j}·φ_X ∈ 𝒜(O_{p,ϑ})`, with `j = Σ_τ (c(τ) − z)`, `v₀` the scale of the integral vacuum
(DivisibilityOfThetaDerivatives §4.6) and `t₀` the scale of Taylor series. The denominator is
`n_ν = M^{4fz}·(M·d)^{j}`, with `d` the integer of `K = ℚ(√−d)` (not `dim 𝒯`), the algebraic part is
`L^alg(p, ϑ) = ‖φ_{p,ϑ}‖²/Nm Q(ϑ)^{2z−1}`, and the integral algebraic part is `n_L·L^alg(p, ϑ)` with
`n_L = n_GL·n_ν²`, `n_GL` the common multiple of the orders of stabilisers of ThetaLiftChainsAndTheSeesawIdentity
§2.10. The pair has empty row if `c(τ) = z` at every `τ`.

(b) Prove: `φ_{p,ϑ} ≠ 0`; `L^alg(p, ϑ) > 0`; there is `A ≠ 0`, independent of `ϑ`, with
`n_L·L^alg(p, ϑ) = A·L^{𝒞∪Q(ϑ)}(z, (νϑ)⁻¹)` for every tame character `ϑ`; and
`ratio(p, ϑ, +1) = L^alg(p, ϑ)/L^alg(p, 1)`.

(c) Prove: `φ_{p,ϑ}` is a nonzero multiple of the theta lift of the constant function `1`, and the group
`∏_{w ∈ 𝒞} GL_1(k_w)` fixes it; so it lies in the image of the idempotent `e_1` of 1.3 (c).

(d) Prove: for every critical pair `p`, tame character `ϑ` and `s = ±1`, `ratio(p, ϑ, s)` is a nonzero real number.

The rank-one lift of a main pair `p` twisted by `ϑ` in DeterminantsOfThetaLiftChains §1.3 (b) is `φ_{p,ϑ}`, its test
forms are the test forms of `O_{p,ϑ}` (1.3 (c)), and the line of the lift is `ℂ·φ_{p,ϑ}`.

*Needs:* 1.3, 2.1, 2.2, 2.3; DeterminantsOfThetaLiftChains §1.1; DivisibilityOfThetaDerivatives §1.6, §4.2, §4.6;
ThetaLiftChainsAndTheSeesawIdentity §2.10; OneSidedPrimeSumBoundsAndAdmissibleData §3.4.

[ShortProof], `New/OneLift/HeckeValues/CharacterLiftNorm.lean` (`New.Data.CriticalPair.HasLiftRank`,
`New.Data.CriticalPair.HasEmptyRow`, `New.Data.CriticalPair.rowLengthSum`, `New.Data.CriticalPair.denomBound`,
`New.Data.CriticalPair.lValueData`, `New.Data.CriticalPair.trivialLift`, `New.Data.CriticalPair.algPart`,
`New.Data.CriticalPair.integralAlgebraicPart`); `New/OneLift/HeckeValues/TwistedRatio.lean`
(`New.Data.CriticalPair.trivialLift_ne_zero`, `New.Data.CriticalPair.algPart_pos`,
`New.Data.CriticalPair.exists_ne_zero_algPart_eq_mul_L`, `New.Data.CriticalPair.exists_algPart_eq_mul_L`,
`New.Data.CriticalPair.ratio_eq_algPart_div`, `New.Data.CriticalPair.integralAlgebraicPart_ne_zero`,
`New.Data.CriticalPair.exists_integralAlgebraicPart_eq_mul_L`,
`New.Data.CriticalPair.ratio_eq_integralAlgebraicPart_div`, `New.Data.CriticalPair.ratio_ne_zero`,
`New.Data.CriticalPair.star_ratio`, `New.Data.CriticalPair.exists_ofAlgForm_trivialLift_eq_smul_lift`,
`New.LValueData.formAction_trivialLift`, `New.Data.CriticalPair.formAction_trivialLift`)

### 2.6 Products of squared L-values of a twist

*Origin:* particular to this proof: the product `L_*` of a twisted pair in terms of the untwisted product and the
ratios at the points `1, …, z`; heights along a regular family are insensitive to powers of the norm of the modulus.

*Method of the formal proof:* divide the two products factor by factor; the Euler factors at `Q(ϑ)` give the power of
`Nm Q(ϑ)`. For the heights, `Nm Q(θ_ι)` is an integer prime to the prime of `ι`, so multiplying by its powers changes
neither the `ι`-adic absolute value nor, after the product formula, the height.

(a) For a critical pair `p = (ν, z)` and `1 ≤ z′ ≤ z`, `p|_{z′} = (ν, z′)` is a critical pair. Prove: for a tame
character `ϑ` and `s = ±1`,
`L_*(𝒞 ∪ Q(ϑ), (νϑ^s)⁻¹, z) = Nm Q(ϑ)^{z²}·L_*(𝒞, ν⁻¹, z)·∏_{z′=1}^{z} ratio(p|_{z′}, ϑ, s)²`.

(b) Prove: let `θ` be a regular family of `m`-fold twists (DeterminantsOfThetaLiftChains §1.3), `y` a family of height
at
most `c`, `c ≤ c′`, and `y′` a family such that for every `ι` either `y′_ι = 0` or `y′_ι = Nm Q(θ_ι)^k·y_ι` for some
integer
`k` (depending on `ι`). Then `y′` has height at most `c′`.

*Needs:* DeterminantsOfThetaLiftChains §1.1, §1.2, §1.3; OneSidedPrimeSumBoundsAndAdmissibleData §1.2.

[ShortProof], `New/OneLift/HeckeValues/TwistedRatio.lean` (`New.Data.CriticalPair.lowerPoint`,
`New.Data.CriticalPair.lValueProd_eq_mul_prod_ratio_sq`, `New.Data.IsRegularFamily.heightLe_of_eq_zpow_mul`)

### 2.7 The period of a determinant theta kernel

*Origin:* adapted from the published construction of theta elements (Bertolini and Darmon (1996); in adelic form Chida
and Hsieh (2018)) and from the Euler factor computation of Tamagawa (1963): here the period of the theta kernel of
two definite spaces of the same rank whose datum is a character of the determinant, and its change when a prime is
added to the modulus.

*Method of the formal proof:* the datum `χ∘det` is the sum over `GL_n(O_E/𝔪)` of the translates of the indicator of the
unit matrix. Adding a prime `v` replaces the vacuum at `v` by `ψ_v∘det`; the difference is a sum over the subspaces `U`
of `k_v^n` of Hecke coefficients, evaluated by the `q`-binomial theorem.

Let `n` be a finite index set, `𝔪` a modulus of `E`, `c : Φ_E → ℕ`, and `α` a character of `[U(1)]` of weight `−c` with
tame part `ψ` trivial off the primes of `𝔪`. For a function `Ψ` on `n × n` matrices over `O_E/𝔪`, the determinant
kernel `K^det_Ψ(h)`, `h ∈ U(I_n)(𝔸_f)`, is the theta kernel of the pair `(I_n, I_n)` at `(1, h)`, both spaces carrying
`α`, with the datum `Ψ` and the polynomial `∏_τ det(x_τ)^{c(τ)}` in the matrix variables at the infinite places. The
period `P(𝔪)` is the class sum of `K^det_{χ∘det}` over `U(I_n)(E)\U(I_n)(𝔸_f)/K°`, `χ` the character of `O_E/𝔪` made
of `ψ` and `K°` the stabiliser of the standard lattice. Prove:

(a) `K^det_Ψ` is invariant under rational points on the left;

(b) `P(𝔪)` is the class sum of `g ↦ Σ_{y ∈ GL_n(O_E/𝔪)} K^det_{1[x = 1]}(g·ỹ)`, `ỹ ∈ K°` a lift of `y`;

(c) if the primes of `𝔪′` are those of `𝔪` and one further prime `v`, of norm `q`, then
`P(𝔪′) = ∏_{l=0}^{#n−1}(1 − q^l·α_n(v)⁻¹)·P(𝔪)`, where `α_n(v)` is the Frobenius value at `v` of `α` in rank `#n`.

[ShortProof] uses the period in rank two, for the L-value at `z = 1`
(SelmerBoundsForAnticyclotomicTwists §5.2).

*Needs:* ThetaLiftChainsAndTheSeesawIdentity §1.6, §1.7, §2.16; DeterminantsOfThetaLiftChains §3.1.

[ShortProof], `New/OneLift/HeckeValues/PeriodAtOne.lean` (`New.Rows.detKernel`, `New.Rows.detPeriod`,
`New.Rows.detKernel_stdEmbFin_mul`, `New.Rows.detPeriod_eq_stdClassSum_sum`, `New.Rows.detPeriod_insert`)

## Layer 3: Gluing and the first factors

The definite space `V_j` of a single lift is split as `V″ ⊕ V°`. A form on `V″` (a first factor) and a form on `V°` are
glued to a form on `V_j` across a change of lattice at the chosen places, in such a way that the descent of the glued
form to `W_j` is a product of two theta kernels summed over a finite group. This layer sets up one exchange for a space
with a definite summand, the glued lattices and the descent of product forms with their denominators, the data of the
three exchanges of Layer 4 (the carrier, the choices `i` and the twist-free functions `𝖥_i`), and the first factors
`φ″_{ϑ,i}`, which are integral away from the twist and small at the trivial twist.

### 3.1 One exchange, and class sums at the level of a row stabiliser

*Origin:* particular to this proof: two consequences of the exchange identity (DeterminantsOfThetaLiftChains §3.10)
for a space `W = E^b ⊕ W′` with a standard definite summand.

*Method of the formal proof:* for (b) the datum `χ(det x″)·Ψ′(x″⁻¹x′)` is matched with the product datum
`χ∘det ⊗ Ψ′`, and the kernel of a product datum on `E^b ⊕ W′` is the product of the kernels of the summands. For (c)
the class sum at full level is unfolded along the cosets of the level of the stabiliser, on which the datum is a
product by (a).

Let `R → S` be a homomorphism of commutative rings `φ`, `N` and `r` finite index sets, `e : r ↪ N` and `w` a matrix
over `S` with columns indexed by `N`. The row stabiliser `H(φ, w, e)` is the group of the `A ∈ GL_N(R)` whose columns
off `e` are those of `1` and with `w·φ(A) = w`. For a multiplicative character `χ` of `R`, the column datum is the
function of an `N × r` matrix `σ` over `R` equal to `χ(det σ_e)` (`σ_e` the rows `e` of `σ`) if `w·φ(σ) = w·ι_e` (`ι_e`
the inclusion matrix of `e`), and `0` otherwise.

(a) Prove: if `F` is a function of `N × c` matrices that is left invariant under `H(φ, w, e)`, then for `z ∈ GL_N(R)`
with the columns of `1` off `e`, `χ(det z)·F(z⁻¹y)·1[z ∈ H]` is the column datum at the columns `e` of `z` times
`F(y)`.

(b) Let `V′`, `W′` be hermitian spaces over `E` with bases indexed by `b`, `n`, let `W = E^b ⊕ W′`, `𝔪 ≠ (1)` a modulus,
`χ` a character of `O_E/𝔪`, `P` a polynomial in the variables of `W′`, `h′` a finite point of `U(E^b)` and `g` a point
of
`U(W′)(𝔸)`. Let `K` assign to each function `Φ` on `n × (b ⊔ n)` matrices modulo `𝔪` a function on `U(E^n)(𝔸_f)`, and
`c ∈ ℂ`. Let `a`, `β`, `β′` be characters of `[U(1)]`; the kernel of `(V′, W)` is taken with the characters
`(a, β·β′)`, the kernel of `(V′, E^b)` with `(a, β)` and the kernel of `(V′, W′)` with `(a, β′)`. Suppose that for
all `Φ`, `Ψ` matched for `χ⁻¹` (DeterminantsOfThetaLiftChains, Conventions), `c` times the class sum of `K(Φ)` at full
level equals the integral over `[U(V′)]` of the theta kernel of `(V′, W)` with datum `Ψ` and
polynomial `P` at `(x, (1, h′) ⊕ g)`. Prove: for every `Ψ′` on `n × b` matrices that is invariant under right
multiplication by `GL_b(O_E/𝔪)`, the function
`x ↦ θ^{V′,E^b}_{a,β}[χ∘det, 1](x, h′)·θ^{V′,W′}_{a,β′}[Ψ′, P](x, g)` is integrable on `[U(V′)]`, and its integral is
`c` times the class sum of `K(Φ)` for `Φ(x′ | x″) = χ(det x″)·Ψ′(x″⁻¹x′)`. Summed form: let `K` depend also on `h′`,
with the hypothesis for every `h′`, and let `coef` be a function on `U(E^b)(𝔸_f)`, `c₀ ∈ ℂ` and `F` a function on
`U(V′)(𝔸)` with `c₀·Σ_{h′} coef(h′)·θ^{V′,E^b}_{a,β}[χ∘det, 1](x, h′) = F(x)` for all `x`, the class sum over `U(E^b)`
at full level. Prove: for `Ψ′` and `Φ` as above,
`c·c₀·Σ_{h′} coef(h′)·(class sum of K(Φ)(h′)) = ∫_{[U(V′)]} F(x)·θ^{V′,W′}_{a,β′}[Ψ′, P](x, g) dx`.

(c) Let `α` be tame for `(𝔪, χ)` with weight `γ` (DeterminantsOfThetaLiftChains, Conventions), `β` a second character,
and `P` a polynomial whose Fock vector is fixed by the real group of `E^b`. Let `F` be left invariant under
`H = H(φ, w, e)` for a quotient `φ` of `O_E/𝔪`. Prove: the class sum at full level of the theta kernel of `(W, E^b)`
with
datum `χ(det x″)·F(x″⁻¹x′)` equals the class sum, at the level of the elements that reduce into `H`, of the kernel with
the datum equal to (column datum at the columns `e` of `x″`)·`F(x′)` if `x″` has the columns of `1` off `e`, and `0`
otherwise.

(d) Prove: if `𝔪 ≠ (1)` and `Ψ` is supported on matrices modulo `𝔪` that have a left inverse, then for hermitian spaces
`S`, `V` the theta kernel of `(S, V)` with datum `Ψ` and any polynomial is rapidly decreasing in the variable of
`U(S)(𝔸)`:
its product with every power of the height is bounded.

*Needs:* DeterminantsOfThetaLiftChains §3.1, §3.3, §3.10.

[ShortProof], `New/OneLift/ComparisonOperator/OneExchange.lean` (`New.Rows.rowStabilizer`, `New.Rows.columnDatum`,
`New.Rows.columnDatum_mul_ite_eq_ite_mem_rowStabilizer`,
`New.Rows.integrable_and_mul_stdClassSum_eq_integral_mul`, `New.Rows.mul_stdClassSum_eq_integral_mul_modKernel`,
`New.Rows.stdClassSum_rowStabilizer_eq`, `New.Rows.isRapid_modKernel`)

### 3.2 Divided splittings and glued lattices

*Origin:* particular to this proof: a lattice between `ϖO^n` and `O^n` at the chosen places that turns the congruence
of the block datum of a lift into conditions on the two blocks of a splitting.

*Method of the formal proof:* the lattice is spanned by the columns of the matrix that is the inclusion matrix on both
summands, by `L″_s = {u : su ≡ 0 mod ϖ}` in `V″` and by `ϖ` times the standard lattice of `V°`; its basis matrix `γ` is
made unitary at the conjugate places. The congruence for `γ⁻¹x` is solved block by block, and the freedom is a torsor
under the matrices that are `1` modulo `ϖ`.

Let `O` be a descent pair with `W` of rank `r` and `V = I_n`, `ϖ` an idele that generates the product of the chosen
places, `R₂ = O_E/(∏_{w ∈ 𝒞_O} w)²` and `R₂Q = O_E/((∏_{w ∈ 𝒞_O} w)²·∏_{w ∈ Q_O} w)`.

(a) A divided splitting of `O`, for index sets `N`, `m`, `a` and an embedding `z : r ↪ m`, is a bijection
`ε : N ⊔ m ≃ n` (so `V = V″ ⊕ V°` with `V″ = I_N`, `V° = I_m`), with embeddings `fix : r ↪ N` and `div : a ↪ N` such
that
`incl = ε ∘ fix`, and such that the diagram `k⁺` of `O` has no column of height `h` with `#N ≤ h < #n` and `k⁻` none
with
`#m ≤ h < #n`.

(b) A divided lattice is a point `γ ∈ U(V)(𝔸_f)` supported at the chosen places with `ϖγ⁻¹` integral; then
`ϖO^n ⊂ γO^n ⊂ O^n` at the chosen places. Its reduced inverse is the reduction of `ϖγ⁻¹` modulo `ϖ²`. The congruence
group `Γ` is the group of the `Y ∈ GL_r(R₂)` with `Y ≡ 1` modulo `ϖ`.

(c) For an `a × N` matrix `s` over `R₂`, an `n × r` matrix `x` over `R₂` is block normalised if its rows in `m` form the
inclusion matrix of `z`, and its rows `u` in `N` satisfy `su ≡ sι_fix` modulo `ϖ²` and `u ≡ ι_fix` modulo `ϖ`. A divided
lattice `γ` is glued for `s` if: (i) for every `x`, `(ϖγ⁻¹)x ≡ ϖι_incl` modulo `ϖ²` holds if and only if `xY` is block
normalised for some `Y ∈ Γ`, and then `Y` is unique; (ii) for some `K ∈ GL_N(R₂)` the columns of `ϖγ⁻¹` in `N`,
multiplied by `K` on the right, vanish modulo `ϖ` outside the range of `div`.

(d) Prove: for every `s` there is a divided lattice glued for `s`; and for a glued lattice the indicator of the
congruence `(ϖγ⁻¹)x ≡ ϖι_incl` is the sum over `Y ∈ Γ` of the indicators that `xY` is block normalised.

(e) For `h = (h″, h°) ∈ U(V″)(𝔸_f) × U(V°)(𝔸_f)` and vectors `y`, `η` of the weights `k⁺` on `V″` and `k⁻` on `V°`, the
product form is the class form `δ_{diag(h″,h°)γ}(y·η)` of 1.1, where `y·η` is the Cartan product, the projection of
`y ⊗ η` to the weight of `O`.

*Needs:* 1.1; ThetaLiftChainsAndTheSeesawIdentity §2.16, §2.2.

[ShortProof], `New/OneLift/ComparisonOperator/GluedLattices.lean` (`New.LevelPlaces.chosenModulusSq`,
`New.DescentPair.genIdele`, `New.Rows.DividedSplitting`, `New.Rows.DividedLattice`,
`New.Rows.DividedLattice.reducedInverse`, `New.Rows.DividedLattice.reduceAt_conj_eq_one`,
`New.Rows.DividedSplitting.congruenceGroup`, `New.Rows.DividedSplitting.IsBlockNormalised`,
`New.Rows.DividedSplitting.IsGlued`, `New.Rows.DividedSplitting.exists_isGlued`,
`New.Rows.DividedSplitting.IsGlued.indicator_eq_sum`, `New.Rows.DividedSplitting.productForm`,
`New.Rows.kernelVector`, `New.Rows.kernelClassSum`, `New.Rows.map_block_eq_blockGL`,
`New.Rows.places_levelModulus_false`, `New.Rows.atPlace_twistPlace_eq_one`)

### 3.3 The descent of product forms, and their denominators

*Origin:* particular to this proof: the descent to `W` of a form glued from two factors is a finite sum of products of
a theta kernel on `V″` and a theta kernel on `V°`; the glued form is integral up to a power of `M` bounded by the
shape of the weight.

*Method of the formal proof:* by 1.1 the descent of a class form at `diag(h″, h°)γ` is the conjugate kernel at that
point; moving `γ` to the datum gives the indicator of the congruence of 3.2, which is a sum over `Γ` of block
normalised indicators (3.2 (d)), and a block normalised indicator is a product of data on the two summands; the
polynomial of a Cartan product is the product of the polynomials. For the gauge, `γ⁻¹` has denominators only in the
directions of `div` and of `V°`, and a column of a tableau has distinct entries.

Let `O` be a descent pair, with a divided splitting, `s` an `a × N` matrix over `R₂`, `γ` a lattice glued for `s`, and
`b`, `b′` characters of `[U(1)]` with `b·b′ = ν_V`, the character of `V`. Let `w_s` be the matrix `s` stacked over
`ϖ·1`,
and `c_γ = χ_W(δ)/√|δ|^{r}` with `δ` the determinant of `γ` at the chosen places and `χ_W` the Hecke character attached
to the character of `W`.

(a) Prove: for `g ∈ U(W)(𝔸)`, the normalised descent of the product form of `((h″, h°), y, η)` at `g` is the complex
conjugate of `c_γ·Σ_{Y ∈ Γ} θ″(gỸ, h″)·θ°(gỸ, h°)`, where `Ỹ` is an integral lift of `Y`; `θ″` is the theta kernel of
`(W, V″)` with characters `(ν_W, b)`, the column datum of `(w_s, fix)` for the character of `R₂Q` made of the tame
part, and the polynomial of `ȳ` in the basis vectors of `W` of sign `+1`; and `θ°` is the theta kernel of `(W, V°)` with
characters `(ν_W, b′)`, the indicator of the inclusion matrix of `z` modulo `ϖ²`, and the polynomial of `η̄` in the
basis
vectors of sign `−1`.

(b) Prove: for a function `φ` on `U(V″)(𝔸_f)` with values in the weight `k⁺`, the normalised descent of the class sum,
over the classes `h″` at the level of the row stabiliser of `(w_s, fix)`, of the product forms of `((h″, h°), φ(h″), η)`
is the conjugate of `c_γ·Σ_{Y ∈ Γ} Θ″_φ(gỸ)·θ°(gỸ, h°)`, with `Θ″_φ` the class sum over `h″` of the kernels `θ″` formed
with `φ̄(h″)`.

(c) The denominator exponent of the splitting is
`e_den = Σ_τ (#a·#{columns of k⁺(τ) of height < #N} + #m·#{columns of k⁻(τ) of height < #m})`. Prove: for a prime `p`,
an embedding `ℂ → ℂ_p`, a nonzero natural number `M₀` in the product of the chosen places, and a glued lattice `γ`, the
`p`-adic gauge of the Cartan product `y·η` at the point `diag(h″, h°)γ` is at most `|M₀|_p^{−e_den}` times the gauge of
`y` at `h″` times the gauge of `η̄` at `h°` through the conjugate embedding.

*Needs:* 1.1, 3.1, 3.2; ThetaLiftChainsAndTheSeesawIdentity §1.5, §2.16, §2.17.

[ShortProof], `New/OneLift/ComparisonOperator/GluedForms.lean`
(`New.Rows.DividedSplitting.normalizedDescent_productForm`,
`New.Rows.DividedSplitting.normalizedDescent_stdClassSum_productForm`,
`New.Rows.DividedSplitting.denominatorExponent`, `New.Rows.DividedSplitting.weylGauge_cartanProduct_le`)

### 3.4 The data of the three exchanges: carrier, choices and the functions `𝖥_i`

*Origin:* definitions and conventions; (c) and (d) are particular to this proof.

*Method of the formal proof:* definitions. For (c) the tame part of the product of two characters with disjoint
supports is nontrivial exactly on the union. For (d) the vector is the image of the monomial under the Fock pairing of
the one-row weight, whose coordinates are integers after multiplication by the stated factorials.

Let `D` be the data, `1 ≤ j ≤ m`, and `ϖ = π_M`. Write `𝔪_c(ϑ) = (π_M)^c·∏_{v ∈ Q(ϑ)} v` for a tame character `ϑ` and
`c ≥ 1`.

(a) (spaces) `S` is the hermitian space with signs `+1` on `2m` and `−1` on `m` coordinates; `W♭ = I_{6m+1}`; the first
factor space `V″` is the standard definite space on the indices of `W_j`, of the padding `(I_j)⁻ ⊕ I_{3m−j}` (a
negative definite space of rank `j` and a standard definite space of rank `3m − j`) and of `W♭`, and `W′` denotes
`W_j ⊕ (I_j)⁻ ⊕ I_{3m−j} ⊕ W♭` on the same indices; the second factor space `V°` is the standard definite space on the
`r` indices of `W_j` and `t − 9m − 1 − r` further ones, so that `V_j = V″ ⊕ V°`. `O_j` is the `j`-th descent pair at the
trivial character, with diagrams `μ⁺ = k⁺`, `μ⁻ = k⁻` (ThetaLiftChainsAndTheSeesawIdentity §2.18).

(b) (characters and carrier) `χ′ = χ_M^j·ϑ`; `ν″ = μ_j⁰ϑ·υ₁^{j+⌊(t+k−1)/2⌋}`; `ν♭ = ν″/χ′`, which does not depend on
`ϑ`.
The carrier `φ°` is the theta lift to `U(S)` of the constant function `1` on the unitary group of the negative definite
space of rank `m`, with characters `υ₁^m` and `1`, trivial modulus and the polynomial `∏_τ det(y⁻_τ)^{2m}` in the `m ×
m`
blocks of variables of sign `−1`. For a character `c` of `[U(1)]`, `𝖺_c(h)` on `U(I_{3m})(𝔸_f)` is the class sum over
`U(I_m)` at full level of the theta kernel of `(I_m, I_{3m})` with characters `(c, 1)`, trivial modulus and polynomial
`1`.
A choice `i` is a pair of a `3m × rk V″` matrix `Λ_i` modulo `ϖ²` and a class of `U(W♭)` at level `ϖ²` with a selection
of rows of a short basis of its lattice: for each infinite place `τ`, `Δ′` lists of `2m` of its `6m + 1` rows, where
`Δ′ = Δ/2 − (t + 1)/2`. For a choice `i`,
`𝖥_i(g) = ∫_{[U(S)]} φ°(x)·θ^{S,W′}[ψ_{Λ_i}, P·P♭_i](x, (g, 1, h♭_i)) dx`, `g ∈ U(W_j)(𝔸)`,
with characters `υ₁^m` and `ν♭υ₁^m`, the additive character `ψ_Λ(y) = ψ(tr(yΛ))` of matrices modulo `ϖ²`, the fixed
polynomial `P = ∏_τ det(y⁻_τ)^{e′(τ)}·∏_{h<k+j−1} det(y_{τ,h})^{μ⁺(τ,h)}` on the padded `W_j`, and `P♭_i` the product of
determinants on `W♭` that pairs the selected rows with the variables of sign `+1`. Here, with `r₊ = k + j − 1` the
number of signs `+1` of `W_j` and its basis numbered with the positive vectors first: `y⁻_τ` is the `m × m` block of the
variables in the `m` columns of sign `−1` of `S` and the `m` rows of sign `−1` of the padded `W_j` (the `j` basis
vectors of `(I_j)⁻`, then the `m − j` negative basis vectors of `W_j`); for `h < r₊`, `y_{τ,h}` is the `2m × 2m` block in
the `2m` columns of sign `+1` of `S` whose row `a` is the positive basis vector of `W_j` of number `h + a` if
`h + a < r₊` and the basis vector `a` of `I_{3m−j}` otherwise; and `e′(τ) = n_det(τ) + (r + 9m + 1) + m`, with
`n_det(τ) = Σ_{h<r₊} μ⁺(τ,h) + Δ′` the number of determinants at `τ`. The functions `𝖥_i` do not depend on any twist.

(c) Prove: if `ϑ` is a twist, `c ≥ 1`, and `ν` is a character of `[U(1)]` of weight `γ` whose tame part is `ψ·ψ_ϑ` with
`ψ` nontrivial exactly at the chosen places, then `ν` is tame for `𝔪_c(ϑ)` with weight `γ` and the character made of
`ψ·ψ_ϑ`; this applies to `χ′`. The places of `𝔪_c(ϑ)` are the chosen places and `Q(ϑ)`, and
`Nm Q(ϑ)·M^c ∈ 𝔪_c(ϑ)`.

(d) Prove: for lift data `X` (2.1) on an index set `n`, `e : {1, …, r} ↪ n` and a monomial `x^α` in `r` rows of degree
`ρ(τ)` at each `τ`, there is a vector `v` of the weight of `O_X` with integer coordinates whose conjugate has Fock
polynomial `(∏_τ ρ(τ)!/α!)·x^α` in the rows `e`, and which is fixed by the weight representation of every family
`(g_τ)` of invertible matrices, over any field of characteristic zero, whose columns `e` are those of the identity.

(e) For matrices `M_{τ,k}` of constants, the stacked determinant product is `∏_τ ∏_k det(M_{τ,k}; x_τ)`, the constant
rows stacked over the variable rows. Prove: under the substitution `x_τ ↦ c_τᵀx_τg_τᵀ` the product for the matrices
`M_{τ,k}g_τᵀ` goes to a scalar multiple of the product for `M_{τ,k}`; and if the substitution with column matrices
`diag(1_p, g_τ)` sends `F′` to a multiple of `F`, the coordinates of `F′` and `F` in their first `p` columns are related
by the Schur matrix of the weight.

*Needs:* 2.1; ThetaLiftChainsAndTheSeesawIdentity §2.1, §2.6, §2.18; DeterminantsOfThetaLiftChains §3.1;
DivisibilityOfThetaDerivatives §1.5, §1.6; OneSidedPrimeSumBoundsAndAdmissibleData §3.4.

[ShortProof], `New/OneLift/ComparisonOperator/ExchangeData.lean` (`New.Rows.carrierForm`, `New.Rows.carrierCoeff`,
`New.Rows.stackedDet`, `New.Rows.span_piM`, `New.Data.CarrierIndex`, `New.Data.FlatIndex`,
`New.Data.FirstFactorIndex`, `New.Data.SecondFactorIndex`, `New.Data.SecondFactorClasses`, `New.Data.DetIndex`,
`New.Data.ChoiceIndex`, `New.Data.untwistedDescentPair`, `New.Data.untwistedModulus`,
`New.Data.ideal_untwistedModulus_eq_span`, `New.Data.twistedChiMPow`, `New.Data.firstFactorChar`,
`New.Data.carrierChar`, `New.Data.paddedMinorProd`, `New.Data.choiceFn`, `New.Data.conjHolomorphicWeight`,
`New.Data.kernelWeight`, `New.Data.rowIndexOfNumber`, `New.Data.places_twistModulus`,
`New.Data.isTameFor_of_hasWeight`, `New.Data.isTameFor_twistedChiMPow`,
`New.Rows.exists_int_weylRep_invariant_fockPoly_eq_smul_monomial`);
`New/OneLift/ComparisonOperator/DeterminantProducts.lean` (`New.exists_det_fromCols_eq_mul_det`,
`New.Rows.twoSidedSubst`, `New.Rows.stackedDetProd`, `New.Rows.twoSidedSubst_stackedDetProd`,
`New.Rows.firstColsCoord`, `New.Rows.twoSidedSubst_firstColsCoord`);
`New/OneLift/ComparisonOperator/FirstFactors.lean` (`New.Data.normQ_mul_M_pow_mem_modulus`)

### 3.5 The polynomial map `ζ`, the datum `Ψ^add` and the series `Υ`

*Origin:* particular to this proof: the polynomial `P_V` of the lift along `W_j` is expanded in the coordinates of a
polynomial map `ζ` into the weight `μ⁺`, with explicit bounds for its size, degree and denominator.

*Method of the formal proof:* `P_V` is a product of determinants and so of weight `μ⁺` in its first columns (3.4 (e));
the squared norm of a product of determinants is bounded by the product over the determinants, each bounded through
Hadamard's inequality; the denominators come from the Gram matrix of the weight, of size bounded by the degree.

Let `D`, `j` and a tame character `ϑ` be as in 3.4, `r₊ = k + j − 1` the number of signs `+1` of `W_j`, and
`W^add = I_{3m−j} ⊕ W♭ ⊕ I_{3m}`.

(a) For a polynomial `F` in matrix variables and a weight `κ`, "`F` has weight `κ` and squared norm at most `b`" means
that `F` is the polynomial of a vector of weight `κ` whose squared norm for the invariant form of `κ` is at most `b`.
Prove: the constant `1` has weight `0` and squared norm at most `1`, and under finite products the weights add and the
bounds multiply.

(b) For a class of `U(W♭)` with selected rows (the second component of a choice) and a `(6m+1) × (6m+1)` matrix `Y`
over `E`, the constant rows `𝖼` are, for each infinite place `τ` and each column of `μ⁺(τ)` (with `Δ′` further columns
of height `r₊`, where `Δ′ = Δ/2 − (t + 1)/2` as in 3.4), a matrix with `2m` rows: for a column of height `h < r₊`,
row `a` is the basis vector of `W_j` at the positive index `h + a` if `h + a < r₊` and the basis vector `a` of
`I_{3m−j}` otherwise; for the `l`-th column of height `r₊`, the rows are the selected rows of `τ(Y)`, in the columns
of `W♭`. `P_V = ∏ det(𝖼; X z)` is the stacked determinant product, with variables `X` in the positive basis vectors
of `W_j` and `z` in `W^add`, and `ζ = ζ_{i,Y}(z)` is the vector of its coordinates of weight `μ⁺` in the columns
`X`. Prove: `P_V` is the polynomial of `ζ(z)`, and, with the short basis of the class, `P_V = Σ_l (polynomial of the l-th unit vector in the letters of sign +1)(X)·ζ_l(z)` after any renaming of
the two sets of columns.

(c) Prove: if `φ` is a ring endomorphism of `ℂ` and `|φ(τ(Y_{ab}))| ≤ M⁴`, `|φ(z_x)| ≤ M⁴` for all entries and
values, then the squared norm of `φ(ζ(z))` is at most `(M⁹)^{(12m+1)·n_det}`, with `n_det` the total number of
determinants over the infinite places.

(d) Prove: there are a degree `d ≤ (10m + 1)·n_det` and an integer `0 < H ≤ (d^d)³`, both independent of `i` and `Y`,
such
that every coordinate of `H·ζ_{i,Y}` is homogeneous of degree `d` in `z` with coefficients in every subring of `ℂ`
containing the conjugates of the entries of `Y`.

(e) The datum `Ψ^add_Λ` on matrices `z` modulo `𝔪₂(ϑ)` with columns in `W^add` is `0` unless the columns on `I_{3m−j}`
and
`W♭` are those of the identity matrix on the indices of `V″`, and is then `Σ_{g ∈ GL_{3m}(O_E/ϖ²)} ψ_Λ(z′g)`, `z′` the
columns on `I_{3m}` modulo `ϖ²`. The series `Υ_{ϑ,i}(h)`, `h ∈ U(V″)(𝔸_f)`, has the coordinates
`Υ_l = θ^{(I_j)⁻,V″}[1_{id}](1, h)·Σ_{h′} 𝖺_{χ′}(h′)·θ^{W^add,V″}[Ψ^add_{Λ_i}, ζ_l]((1, h♭_i, h′), h)`,
the class sum over `h′ ∈ U(I_{3m})` at full level, the second kernel with both characters `ν″` and the first with
characters `υ₁^j` and `ν″`, and `ζ` formed with the short basis at the class `h♭_i`.

*Needs:* 3.2, 3.4; ThetaLiftChainsAndTheSeesawIdentity §1.6, §2.2, §3.5.

[ShortProof], `New/OneLift/ComparisonOperator/LineCoordinates.lean` (`New.HasWeightNormSqLe`,
`New.HasWeightNormSqLeIf`, `New.HasWeightNormSqLe.nonneg`, `New.HasWeightNormSqLe.one`,
`New.HasWeightNormSqLe.mul`, `New.HasWeightNormSqLe.prod`, `New.HasWeightNormSqLeIf.prod`, `New.Data.AddedIndex`,
`New.Data.constantRows`, `New.Data.stackedDetProdCoords`, `New.Data.addedDatum`, `New.Data.leftSideSeries`,
`New.Data.toPoly_stackedDetProdCoords`, `New.Data.weylNormSq_comp_eval_stackedDetProdCoords_le`,
`New.Data.exists_isHomogeneousOverEntries_smul_stackedDetProdCoords`);
`New/OneLift/ComparisonOperator/FirstFactors.lean` (`New.Data.renameRowsCols_stackedDetProd_eq_sum`)

### 3.6 The first factors are integral away from the twist and small at the trivial twist

*Origin:* adapted from the published integrality of theta series with integral data (Böcherer and Schmidt (2000);
Harris, Li and Skinner (2005)) and from T. Yang (1997): here for the series `Υ`, a double class sum of products of three
theta kernels of definite spaces, with one constant for all choices and all twists.

*Method of the formal proof:* each value of `Υ` is a double class sum of products of three theta kernels of definite
spaces; their jets are integral away from the modulus and their conjugates bounded
(ThetaLiftChainsAndTheSeesawIdentity §1.5, §1.7), the map `ζ` has the denominator and size of 3.5, the class sums have
denominators dividing the common multiple of the stabiliser orders, and `Nm Q(ϑ)·M^c` lies in the modulus.

A vector `y` of weight `μ⁺` on `V″` is integral and small at `(ϑ, h)`, `h ∈ U(V″)(𝔸_f)`, if for every prime `p` not
dividing `Nm Q(ϑ)` and every embedding `ℂ → ℂ_p` the `p`-adic gauge of `y` at `h` is at most `1`, and, when `Q(ϑ) = ∅`,
every conjugate of `y` under an automorphism of `ℂ` has squared norm at most `exp(f·m·b·(log b)²)`.

Prove: for `1 ≤ j ≤ m` there is `c″ ≠ 0`, independent of `i`, `ϑ` and `h`, such that the first factor
`φ″_{ϑ,i}(h) = conj(c″·Υ_{ϑ,i}(h))` is integral and small at `(ϑ, h)` for every choice `i`, every tame character `ϑ` and
every `h`.

*Needs:* 3.4, 3.5; ThetaLiftChainsAndTheSeesawIdentity §1.4, §1.5, §1.7, §2.10; DivisibilityOfThetaDerivatives §4.10.

[ShortProof], `New/OneLift/ComparisonOperator/FirstFactors.lean` (`New.Data.IsIntegralAndSmall`,
`New.Data.exists_isIntegralAndSmall_leftSideSeries`)

## Layer 4: Three exchanges, and products span

The exchange identity is applied three times, until only a number is left of the twist: a multiple of the theta series
of the first factors on `U(W_j)` is the twist-free function `𝖥_i`, and the squared modulus of the multiplier is a
constant divided by a product `Γ_j(ϑ)` of Hecke values. The second half of the layer proves that products span: a good
form on `W_j` that is orthogonal to all products of the `𝖥_i` with the theta kernels of `(W_j, V°)` is zero.

### 4.1 The pairs of the three exchanges and the product `Γ_j`

*Origin:* definitions and conventions.

*Method of the formal proof:* definitions; the conditions of a critical pair are checked from the inequalities of the
data.

Let `D` be the data and `1 ≤ j ≤ m`. The points are `z₊ = m`, `z₋ = m/2` and `z_* = 7·(m/2) + ⌊k/2⌋`. The three exchange
pairs of `j` are the critical pairs
`p_* = (μ_j⁰·υ₁^n, z_*)` with `n = j + ⌊(t − 11m − 1)/2⌋`, of weight `−(κ_j(τ) − n)` and tame part `ω^j`;
`p_± = (υ₁^{−z_±}·χ_M^{±j}, z_±)`, of weight `−z_±` at every place and tame part `ω^{±j}`.
For a twist `ϑ`,
`Γ_j(ϑ) = L_*(𝒞 ∪ Q(ϑ), (ν_*ϑ)⁻¹, z_*)·L_*(𝒞 ∪ Q(ϑ), (ν₊ϑ)⁻¹, z₊)·L_*(𝒞 ∪ Q(ϑ), (ν₋ϑ⁻¹)⁻¹, z₋)`,
with `ν_*`, `ν_±` the characters of the three pairs and `L_*` as in the Conventions. It is not divided by its value at
the trivial twist.

*Needs:* DeterminantsOfThetaLiftChains §1.1; DivisibilityOfThetaDerivatives §1.6;
OneSidedPrimeSumBoundsAndAdmissibleData
§3.3, §3.4.

[ShortProof], `New/OneLift/ComparisonOperator/ThreeExchanges.lean` (`New.Data.signPoint`, `New.Data.mainPairPoint`,
`New.Data.exchangePair`, `New.Data.heckeValueProd`)

### 4.2 The first two exchanges: the carrier as a class sum of twisted kernels

*Origin:* adapted from the Rallis inner product formula at equal rank for a character (Yamana (2014); T. Yang (1997)),
whose central value folds by the functional equation into Hecke L-values at `1, …, e`, and from J.-S. Li (1992) for
the nonvanishing and holomorphy of the theta lift of a character in the stable range: here with ramified data computed
explicitly, as two applications of the exchange identity.

*Method of the formal proof:* (a) is the exchange identity (DeterminantsOfThetaLiftChains §3.10) for the pair
`(I_m, I_m)` with determinant data, where the side with the trivial group is the constant `1`. (b) applies the exchange
identity to `S` and the definite space of rank `3m` and then (a) to the remaining kernel of two definite spaces of rank
`m`. (c): the class sum in (b) is of full level and rapidly decreasing (3.1 (d)), and the kernel with the polynomial
`det^{2m}` in the negative variables is holomorphic.

Let `E` be a CM field with Weil data and `m = 2e > 0` even.

(a) Prove: for exponents `k(τ) ≥ 0` there is a constant `C` such that every character `α` of `[U(1)]` of weight `−k`
that
is tame for `(𝔪, χ)` has a number `γ` with `|γ|² = C/L_*(places of 𝔪, α⁻¹υ₁^e, e)` and
`γ·Σ_h θ^{I_m,I_m}_{α,α}[χ∘det, ∏_τ det(y_τ)^{k(τ)}](g, h) = 1` for all `g ∈ U(I_m)(𝔸)`, the class sum over `U(I_m)` at
full level.

(b) Prove: there is a constant `C` such that every character `c` of `[U(1)]` of weight `0` that is tame for `(𝔪, χ)` has
a
number `γ` with `|γ|² = C/(L_*(places of 𝔪, c⁻¹υ₁^m, m)·L_*(places of 𝔪, cυ₁^e, e))` and
`γ·Σ_h 𝖺_c(h)·θ^{S,I_{3m}}_{υ₁^m,c}[χ∘det, 1](x, h) = φ°(x)` for all `x ∈ U(S)(𝔸)`, the class sum over `U(I_{3m})` at
full
level, `𝖺_c` and the carrier `φ°` as in 3.4 (b).

(c) Prove: if `E` has a character of `[U(1)]` of weight `0` that is tame for some `(𝔪, χ)`, then for every integer `N`
of
`E` the carrier is continuous, left invariant under the rational points of `U(S)`, right invariant under the principal
congruence subgroup of level `N` and rapidly decreasing; and for some numbering of the basis of `S` with the positive
vectors first, it is holomorphic of weight `(0; 3m)` at every infinite place: each left translate, restricted to the
real group, extends analytically to the products `hb` with `b` invertible and triangular for the numbering.

*Needs:* 3.1, 3.4; DeterminantsOfThetaLiftChains §3.1, §3.10.

[ShortProof], `New/OneLift/ComparisonOperator/ThreeExchanges.lean`
(`New.Rows.exists_mul_stdClassSum_modKernelStdSpace_eq_one`, `New.Rows.exists_mul_stdClassSum_eq_carrierForm`,
`New.Rows.carrierForm_mem_rapidOfLevel_and_isAdelicHol`)

### 4.3 The third exchange: the twist survives only as a number

*Origin:* particular to this proof: for every twist, an explicit theta series on `U(W_j)` times a number is a
twist-free function, and the squared modulus of the number is a constant divided by a product of squared Hecke
L-values and powers of norms of places.

*Method of the formal proof:* substitute 4.2 (b) for the carrier in `𝖥_i` and exchange the integral over `[U(S)]`
against the class sum over `U(V″)` by 3.1 (b), with the additive character `ψ_Λ` made invariant by summing over
`GL_{3m}`; the three constants multiply to a number of squared modulus `C/Γ_j(ϑ)`. The left side is rewritten at the
level of a row stabiliser by 3.1 (c).

Let `D` be the data, `1 ≤ j ≤ m`. For a twist `ϑ` and a choice `i`, the left side `Ξ^ex_{ϑ,i}(g)`, `g ∈ U(W_j)(𝔸)`,
is the class sum over `h ∈ U(V″)` at full level, and over the classes `h′` of `U(I_{3m})` against the coefficients
`𝖺_{χ′}(h′)`, of the theta kernels of `(I_{3m} ⊕ W′, V″)`, where `I_{3m} ⊕ W′ = W_j ⊕ (I_j)⁻ ⊕ W^add` (3.4 (a), 3.5),
with the characters `(χ′·ν♭υ₁^m, ν″)`, the modulus `𝔪₂(ϑ)`, the datum `(x′ | x″) ↦ χ′(det x″)·ψ^inv_{Λ_i}(x″⁻¹x′)`
(`x′` the `3m` columns of `I_{3m}`, `x″` the square block of the columns of `W′`) and the polynomial `P_V` of 3.5 (b)
formed with the short basis of the class of `i`, at the points `(1, h′) ⊕ (g, 1, 1, h♭_i)` of `U(I_{3m} ⊕ W′)(𝔸)` (the
identity on the padding `(I_j)⁻ ⊕ I_{3m−j}`) and `h` of `U(V″)`; here
`ψ^inv_Λ = Σ_{g ∈ GL_{3m}(O_E/ϖ²)} ψ_Λ(·g)`.

(a) Prove: there are a constant `C` and numbers `c′_ϑ`, one for each twist `ϑ`, such that `|c′_ϑ|² = C/Γ_j(ϑ)` and
`c′_ϑ·Ξ^ex_{ϑ,i}(g) = 𝖥_i(g)` for every choice `i` and every `g ∈ U(W_j)(𝔸)`.

(b) Prove: if `Λ_i = u·w` for matrices `u`, `w` modulo `ϖ²`, then `Ξ^ex_{ϑ,i}` is the theta series on `U(W_j)` of the
series
`Υ_{ϑ,i}` of 3.5 (e): the class sum over `h ∈ U(V″)`, at the level of the row stabiliser of `w`, of the theta kernels of
`(W_j, V″)` of the `j`-th descent pair at `ϑ` with the character `ν″`, the column datum of `w`, and the vectors
`Υ_{ϑ,i}(h)` (the function `Θ″` of 3.3 (b)).

*Needs:* 3.1, 3.3, 3.4, 3.5, 4.1, 4.2.

[ShortProof], `New/OneLift/ComparisonOperator/ThreeExchanges.lean` (`New.Data.thirdExchangeLeftSide`,
`New.Data.exists_mul_thirdExchangeLeftSide_eq_choiceFn`, `New.Data.thirdExchangeLeftSide_eq_kernelClassSum`)

### 4.4 Decay of Fock matrix coefficients and sparse theta sums

*Origin:* adapted from the published estimates for the convergence of theta lifts and for theta series away from the
cusps (the term of the zero vector dominates a theta sum over a lattice without short vectors): here with explicit
constants, and with a finite datum chosen so that the lattice of the sum is sparse.

*Method of the formal proof:* integration by parts against the Gaussian gives the decay in `y` of the Heisenberg
coefficient of a homogeneous Fock vector; a mean over additive characters modulo `𝔪` replaces the theta sum by a sum
over the sublattice of matrices divisible by `𝔪`, whose nonzero terms are bounded by the decay.

(a) Prove: let `ι` be a nonempty finite set with signs `ε`, `P` a polynomial on `ℂ^ι` with `P(cx) = c^d P(x)` for real
`c`,
`v` its Fock vector, `σ ∈ U(ε)` and `0 ≠ y ∈ ℂ^ι`. For natural numbers `A ≥ d + #ι` and `n`,
`|⟨v, ϱ(y)ω(σ)v⟩| ≤ (4(A + n))^n·|y|^{−2n}·‖σ‖^{#ι+2n}·⟨v, v⟩`, with `ϱ` the Heisenberg action, `ω` the Weil
representation, `|y|` the Euclidean norm and `‖σ‖` the operator norm.

(b) Prove: for hermitian spaces `S`, `T` over `E` of ranks `n`, `n′ ≥ 1` and a natural number `N ≠ 0` in the different
of `E`, `λ₁(S)·λ₁(T)/(6N(f·n)²·n′·n) ≤ λ₁(Hom(S, T))`, where `λ₁` is the first minimum of the lattice, cut at `1`.

(c) Prove: let `S`, `T` be hermitian spaces of ranks at least `1` with characters `a`, `b` of weights `γ`, `γ′`, `g`,
`h` adelic points, `𝔪` a modulus, `c ∈ E^×` such that `c·α·z` is integral for every integral finite adele `z` that
vanishes modulo `𝔪` (`α` the self-dual idele of the Weil data), `λ` the first minimum of `Hom(S, T)` moved by
`(g, h)`, `m₀ > 0` with `m₀·|τ(c)| ≤ √(2π·Im τ(j))·λ` at every infinite place `τ`, `q` larger than the number of
complex variables of `Hom(S, T)` at the infinite places, and `Q` a polynomial homogeneous of degree `d` under real
scalings with Fock vector `v`. Then there is a function `Ψ` on matrices modulo `𝔪` such that for all real points `u`, `u′`
`|θ^{S,T}_{a,b}[Ψ, Q](gu, hu′) − ⟨v, Ω(u, u′)v⟩| ≤ (100(d + 2q)/m₀²)^q·(‖u‖·‖u′‖)^{3q}·|⟨v, v⟩|`,
`Ω` the real Weil representation of the pair with weights `(γ, γ′)` and `‖u‖` the largest operator norm at a place.

(d) (sparse sums on the data) Prove: let `V`, `V′` be hermitian spaces over `E` of ranks between `1` and `t`, with
characters of `[U(1)]` of weights `γ`, `e`, and `Q` homogeneous of degree `d ≤ b^{3/2}` under real scalings. If
`λ₁(Vg)·λ₁(V′g′) ≥ b^{−13}`, there is a function `Ψ` on matrices modulo `ϖ²` such that for all real points `h`, `h′`
`|θ^{V,V′}[Ψ, Q](gh, g′h′) − c_Q(h, h′)| ≤ b^{−20n_*}·(‖h‖·‖h′‖)^{6n_*}·|c_Q(1, 1)|`,
where `c_Q(h, h′) = ⟨v_Q, Ω(h, h′)v_Q⟩` and `n_* = 2f·t³`.

*Needs:* ThetaLiftChainsAndTheSeesawIdentity §1.6, §3.5; DivisibilityOfThetaDerivatives §1.1, §1.4, §4.1;
OneSidedPrimeSumBoundsAndAdmissibleData §3.3.

[ShortProof], `New/OneLift/ComparisonOperator/ThetaKernelEstimates.lean`
(`New.Fock.norm_fockInner_realHeisenbergOp_le`, `New.Rows.firstMinimum_mul_le_hom`,
`New.Rows.exists_norm_modKernel_sub_fockInner_le`); `New/OneLift/ComparisonOperator/ProductsSpan.lean`
(`New.Data.exists_datum_norm_modKernel_sub_polyMatrixCoeff_le`)

### 4.5 The isolation estimate

*Origin:* adapted from the published bounds for integrals of matrix coefficients of holomorphic discrete series with
a large gap (Harish-Chandra's integrability, with the basic function as a quotient of products of minors): here a
mean over the peaks of a holomorphic form that isolates the value at `1` of a bounded function.

*Method of the formal proof:* the integral of `|m_{u′}|·‖h‖^{6n_*}` is compared with `∫|m_u|²` through the explicit
formula for the minors on the Cartan decomposition; at a peak `x` of `F` the reproducing formula for holomorphic
functions of weight `u` writes `F(x)·K(1)` as the weighted integral, which vanishes, so `K₀(1)` is bounded by the error
`δ` times the first integral divided by `|F(x)|`, at least half the supremum.

Let `D` be the data, `n_* = 2f·t³`, `s` signs on `n` indices with `1 ≤ n ≤ t`, and an order that puts the signs `+1`
first. A weight `u = (u_τ)` is admissible here if each `u_τ` is dominant within each sign block and its entries at the
signs `−1` exceed those at the signs `+1` by at least `300n_*`. `m_u(h) = ∏_τ (quotient of principal minors of weight
u_τ)(h_τ)` is the basic holomorphic function on the real group `G_∞ = ∏_τ U(diag s)`, `‖h‖` the largest operator norm
at a place, and a peak of a bounded function is a point where its modulus exceeds half of its supremum.

(a) Prove: for admissible `u`, `u′` with `|u_τ(i)| ≤ 5b`: `∫_{G_∞}|m_u|² > 0`, the function `|m_{u′}(h)|·‖h‖^{6n_*}` is
integrable, and `∫_{G_∞}|m_{u′}(h)|·‖h‖^{6n_*} dh ≤ b^{n_*}·∫_{G_∞}|m_u|²`.

(b) Prove: let `u`, `u′` be as in (a), `F` a continuous function on the adelic group that is holomorphic of weight `u`
in the archimedean variable and has a peak, and `K₀` a bounded function on `G_∞`. Suppose that for every peak `x` of
`F` there is a function `K` on `G_∞`, holomorphic of weight `u − u′`, with `|K(h) − K₀(h)| ≤ δ·‖h‖^{6n_*}` for all `h`
and
`∫_{G_∞} conj(F(xh))·K(h)·m_{u′}(h) dh = 0`. Then `|K₀(1)| ≤ (4b^{n_*} + 1)·δ`.

*Needs:* OneSidedPrimeSumBoundsAndAdmissibleData §3.3; HolomorphicDiscreteSeriesOfUnitaryGroups §§4.1, 5.4, 5.5, 6.3, 6.4 (holomorphic functions of a weight on the real
group `G_∞ = ∏_τ U(diag s)` of signs `s` on `n ≥ 1` indices, for an injective order that puts the signs `+1` first: a
function is holomorphic of weight `u` if it extends to a function of tuples of matrices, analytic at the products of
group elements with invertible triangular matrices, that takes the character of weight `u` of the triangular matrix as
a factor; if each `u_τ` decreases weakly within each block of equal signs, the product `m_u` of the quotients of
principal minors of the weights `u_τ` is holomorphic of weight `u`, and every `F` holomorphic of weight `u` with
`F·conj(m_u)` integrable has `∫ F·conj(m_u) = F(1)·∫|m_u|²`; if moreover the entries of `u_τ` at the signs `−1` exceed
those at the signs `+1` by more than `500n³ + A + n + 1`, the quotient of minors of weight `u_τ` is the discrete series
coefficient `c_λ` of `2λ = 2u_τ + 2ρ`, a parameter of gap `500n³ + A`; for a parameter of gap `h` and `c ≤ h`,
`|c_λ(g)| ≤ (2/‖g‖)^c` in the operator norm; and for a parameter of gap `500n³ + B` with `|2λ_a| ≤ L` and `c > 8n²`,
the function `deg_λ·(2/‖g‖)^c` is integrable on `U(diag s)` with integral at most `8·(2000(n + L + 1)⁶)^{2n²}·2^c`,
where `deg_λ > 0` is the inverse of `∫|c_λ|²`).

[ShortProof], `New/OneLift/ComparisonOperator/ThetaKernelEstimates.lean`
(`New.Data.integral_norm_holMinorsPi_mul_pow_le`, `New.Data.norm_apply_one_le_of_forall_isPeak`)

### 4.6 Products span

*Origin:* adapted from the basis problem, the spanning of a space of forms by theta series (Eichler (1973);
Waldspurger (1978/79); Böcherer (1989)) and from J.-S. Li (1992): here a good form on `U(W_j)` orthogonal to all
products of the twist-free theta forms `𝖥_i` with the theta kernels of the complementary block `V°` is zero.

*Method of the formal proof:* suppose `y ≠ 0`; its peaks are not deep in a cusp. Four steps. (1) The integral `𝖥^g` of
the carrier times a kernel on `(S, W̃)` times a basic function over the real group of `S` is a combination of the
`𝖥_i`. (2) For every combination `𝖥` of the `𝖥_i`, the integral of `y·𝖥·m_{u°}` over the real group at any point is
zero, `u°` the weight on `W_j` of the kernels of `(W_j, V°)`.
(3) At every peak `g`, `𝖥^g(gh)` is close to `𝖥⁰(h)` for one bounded `𝖥⁰` with `𝖥⁰(1) ≠ 0`, by the sparse sums of 4.4 at
a peak of the carrier. (4) The isolation estimate 4.5 makes `𝖥⁰(1)` too small.

Let `D` be the data and `1 ≤ j ≤ m`. For a function `ζ` from the classes of `U(V°)` at principal level `ϖ²` to the
weight
`μ⁻`, the pairing `⟨ζ, θ°(g, ·)⟩` is `Σ_c θ^{W_j,V°}[1_{incl}, polynomial of conj ζ(c) in the negative basis vectors](g,
c)`,
the sum over the classes, with the indicator of the inclusion matrix of `W_j` in `V°` modulo `ϖ²`; the kernels
`θ^{W_j,V°}` are taken with the characters `(ν_W, υ₁^{m/2−j})`, `ν_W` the character of `W_j` in the untwisted pair
`O_j`.

(a) Prove: the carrier has a peak `g₁` with `λ₁(S g₁) ≥ (5b^{3/2})^{−1/2}`.

(b) Prove: for every `g₁ ∈ U(S)(𝔸)` and every function `Ψ` on matrices modulo `ϖ²`, there are coefficients `c_i` with
`Σ_i c_i 𝖥_i(g) = ∫_{G_∞(S)} φ°(g₁h)·θ^{S,W̃}[Ψ, P](g₁h, (g, 1))·m_{u₁}(h) dh` for all `g ∈ U(W_j)(𝔸)`, where `W̃` is
the padded
`W_j`, `P` the polynomial of 3.4 (b), `u₁ = (−Δ′; 6m + 1)` at every `τ` (the entry `−Δ′` at the signs `+1` of `S`,
`6m + 1` at the signs `−1`), and the kernel `θ^{S,W̃}` is taken with the characters `(υ₁^m, ν♭υ₁^m)`.

(c) Prove: there is a bounded function `𝖥⁰` on the real group of `W_j` with `𝖥⁰(1) ≠ 0` such that for every adelic `g`
with
`λ₁(W_j g) ≥ (5b^{24})^{−1/2}` some combination `𝖥` of the `𝖥_i` has
`|𝖥(gh) − 𝖥⁰(h)| ≤ 2b^{−19n_*}·|𝖥⁰(1)|·‖h‖^{6n_*}` for all real `h`.

(d) (products span) Prove: if `y ∈ 𝒢(W_j)` satisfies `∫_{[U(W_j)]} y(g)·𝖥_i(g)·⟨ζ, θ°(g, ·)⟩ dg = 0` for every choice
`i` and
every `ζ`, then `y = 0`.

*Needs:* 3.4, 4.2, 4.4, 4.5; ThetaLiftChainsAndTheSeesawIdentity §2.7, §3.5; HolomorphicDiscreteSeriesOfUnitaryGroups §6.4 (a bounded nonzero function, in
particular a nonzero rapidly decreasing form of a level, has a peak, a point where its absolute value exceeds half its
supremum; let `F` be a function on the adelic unitary group of a hermitian space of signs `s` that is left invariant
under the rational points, right invariant under the principal level of an integer `p` of `E` with `p̄ = −p` whose
imaginary part at every infinite place is positive and at most `A′`, `A′ ≥ 1`, and holomorphic at every adelic
translate, for an order that puts the signs `+1` first, of a weight `u` with `u_τ(i) + 1 ≤ u_τ(j)` whenever `s_i = +1`
and `s_j = −1` and with entries of absolute value at most `A`, `A ≥ 2`; then at every peak `g` of `F` the first minimum
of the lattice moved by `g`, the length of its shortest nonzero vector cut off at `1`, is at least `(A·A′)^{−1/2}`, so
the peaks are not deep in a cusp).

[ShortProof], `New/OneLift/ComparisonOperator/ProductsSpan.lean` (`New.Data.exists_isPeak_carrierForm`,
`New.Data.exists_sum_choiceFn_eq_integral`, `New.Data.integral_mul_sum_choiceFn_eq_zero`,
`New.Data.exists_choiceFn_approx`, `New.Data.thetaKernelPairing`,
`New.Data.eq_zero_of_integral_choiceFn_thetaKernelPairing`)

## Layer 5: Periods of false lifts

A false lift on the definite space `V = I_n` of a descent pair is killed by the descent to `W`, by the hyperplane sums
at
the chosen places and by one Hecke polynomial at the test value. This layer shows that all its theta descents vanish,
first to `W` for all data, then up a tower `W ⊕ ℍ^N` of hyperbolic planes, and deduces that its periods over the second
block of a splitting `I_n = I_N ⊕ I_l` against theta kernels of `(W, I_l)` vanish. This is what makes the glued forms of
Layer 7 orthogonal to the false lifts.

### 5.1 The bottom of the tower: from the block datum to all data

*Origin:* particular to this proof: a form on a definite group whose descents with the block datum vanish, and which
the hyperplane sums at the chosen places annihilate, has vanishing descents for all data unramified off the level.

*Method of the formal proof:* it suffices to treat the indicator of a small class around each point `x`, modulo `i!`
for large `i`. If `x` has an integral block ratio at every level place, the mean of the translates of this indicator
under the level group is a multiple of a translate of the block datum under `U(W)`. Otherwise an annihilating row at a
place where `x` has no integral block ratio gives integral elements that fix the components of `x` at the level places
and whose sum annihilates `y`. The passage from the polynomial of the highest vector to all polynomials uses the
equivariance of the descent for the real group.

Let `O` be a descent pair with `W` of rank `r ≥ 1` and `V = I_n`, and `S_O` the set of the level places and their
conjugates. For a hermitian space `W′`, a character `a` of `[U(1)]`, and a function `Y` on `U(V)(𝔸)`, "the descents of
`Y`
to `W′` twisted by `a` vanish off `S_O`" means: for every Schwartz datum `f` on `Hom(W′, V)(𝔸)` that is the vacuum at
the
finite places outside `S_O`, the function `g ↦ ∫_{[U(V)]} θ_f(g, h)·a(det h)·Y(h) dh` on `U(W′)(𝔸)` is zero.

For a form `y ∈ 𝒜(O)`, the hyperplane sums annihilate `y` if, for every family of rows `λ_w ∈ k_w^r` at the chosen
places, not all zero, the product over the chosen places of the elements
`Σ_{s} ψ_w(det s)⁻¹·s ∈ ℂ[GL_r(k_w)]`, the sum over the invertible `s = 1 + vλ_w` with `v` any column, kills `y`. An
`n × r` matrix `x` over the completion at a level place `w` has an integral block ratio if its block `x′` of the rows of
`incl` is invertible and `x″x′⁻¹` is integral (`x″` the other rows), and `≡ 0` modulo `w` if `w` is a chosen place.

(a) Prove: if a parameter `l₀` on `W` fits `O` and the normalised descent of `Ξ ∈ 𝒜(O)` is `0`, then for every
polynomial `P` the descent to `W`, twisted by `ν_W`, of the conjugate of the matrix coefficient of `Ξ` at the highest
vector, with the datum `v_P ⊗ Ψ_bl ⊗ vac`, vanishes.

(b) Prove: let `y ∈ 𝒜(O)` and `u` a linear form on the weight. If the tame parts `ψ_w` are nontrivial at the twist
places,
the hyperplane sums annihilate `y`, and the descents of the conjugate of the coefficient `u∘y` with the data
`v_P ⊗ Ψ_bl ⊗ vac` vanish for all polynomials `P`, then the descents of that function to `W` twisted by `ν_W` vanish
off `S_O`.

*Needs:* ThetaLiftChainsAndTheSeesawIdentity §2.16, §2.17; WeilRepresentationsOnBanachSpacesOfData §§5.3, 5.4, 8.10 (vanishing of theta descents as a
predicate: for hermitian spaces `W′`, `V`, a character `a` of `[U(1)]`, a set `S` of finite places and a function `Y`
on `U(V)(𝔸)`, the descents of `Y` to `W′` twisted by `a` vanish for the data that are vacua above `S` if for every
datum `f` on `Hom(W′, V)(𝔸)` fixed by the vacuum projection at the places of `S` and their conjugates the function
`g ↦ ∫_{[U(V)]} θ_f(g, h)·a(det h)·Y(h) dh` on `U(W′)(𝔸)` is zero; if `Y` is automorphic, this passes to the right
translate of `Y` by an element that is integral at every place of `S`; and for `V` definite, `Y` automorphic and a set
`A` of finite places disjoint from its conjugate, it holds for `S` the complement of `A ∪ Ā` as soon as the descents
vanish for the data `v_P ⊗ Ψ ⊗ vac`, obtained from the vacuum by the Schrödinger operator of a Schwartz–Bruhat function
`Ψ` above `A` and the Fock vector `v_P` of a polynomial `P` at the real places).

[ShortProof], `New/OneLift/FalseLifts/BottomOfTower.lean` (`New.DescentPair.HyperplaneSumsAnnihilate`,
`New.HasIntegralBlockRatio`, `New.DescentPair.descentsVanish_of_hyperplaneSumsAnnihilate`,
`New.DescentPair.isConjDisjoint_places`, `New.DescentPair.smul_chosenGLRep_eq_apply_of_triangular`,
`New.IsSchwartzBruhat.eventually_const`);
`New/OneLift/FalseLifts/PeriodsOfFalseLifts.lean` (`New.Rows.lift_polyVector_blockDatum_eq_zero`)

### 5.2 Vanishing of descents passes to the sum with hyperbolic planes

*Origin:* adapted from the tower property of theta lifts (Rallis (1984a); for unitary groups C. Wu (2021); Ginzburg,
Jiang and Soudry (2009); Jiang and Wu (2016)): here the step from `W` to `W ⊕ ℍ^l` for a function on a definite group of
large rank killed by a Hecke polynomial at a small point.

*Method of the formal proof:* the constant term of the descent to `W ⊕ ℍ^l` along the Siegel parabolic of the planes
is a descent to `W`, which vanishes, so the zero term contributes nothing; the rest is bounded (the bound for the theta
functional minus its zero term along one plane is proved here, as part of (a), not taken from the background); the
descent inherits a Hecke equation at `w`, and its root is too small for a nonzero bounded spherical function (b).

(a) Prove: let `W` be a hermitian space of rank `r′` and `V` a positive definite hermitian space of rank `r′ + t′`,
`A` a set of finite places disjoint from its conjugate, `a` a character of `[U(1)]`, and `Y` an automorphic function on
`U(V)(𝔸)` whose descents to `W` twisted by `a`
vanish off `A ∪ Ā`. Let `w` be a split place outside `A ∪ Ā` with the base change of `a` unramified at `w̄`, and let `Y`
be
spherical at `w` and killed by the Hecke polynomial at `w` at a point `X` with `|X| = q_w^{1−t′−r′/2}`. If `W′` is the
sum of
`W` and `l` hyperbolic planes and `2r′ + 2l + 3 < r′ + t′`, then the descents of `Y` to `W′` twisted by `a·υ₁^l` vanish
off
`A ∪ Ā`.

(b) (small roots) Prove: a bounded function `F` on the adelic unitary group of a hermitian space of rank `n′` that is
spherical at a split place `w` and killed by the Hecke polynomial at `w` at a point `X` with `q_w^{n′+1}·|X| ≤ 1` is
zero.

*Needs:* 5.1; AdelicUnitaryGroupsAndAlgebraicModularForms §3.6, WeilRepresentationsOnBanachSpacesOfData §§6.9, 9.3 (the mixed model of the Weil representation for a splitting of a hermitian space
`W′` into `W` and `p` hyperbolic planes, and the transfer of the Hecke polynomial through the transposed theta lift:
the slice `φ ↦ φ[x]`, for an adelic matrix `x`, is a continuous map from the data on `Hom(W′, V)` to the data on
`Hom(W, V)`, and `φ[0]` is the zero term of `φ` along the isotropic frame; for a Levi element with components
`m ∈ GL_p(𝔸)` and `g₀ ∈ U(W)(𝔸)`, `(ω_{aυ₁^p,b}(g, h)φ)[x] = χ_V(det m)⁻¹·|det m|^{n′/2}·ω_{a,b}(g₀, h)(φ[h⁻¹xm])`, with
`n′` the rank of `V` and `χ_V(y) = b(y/ȳ)υ(y)^{−n′}`; an element `u` of the unipotent radical acts on the slices by
`(ω(u, 1)φ)[x] = c(u, x)·ϱ(y(u, x))(φ[x])` with a number `c(u, 0) = 1` and a translation `y(u, 0) = 0`; every adelic
point of `U(W′)` is a product of an element of the radical, a Levi element and an element of the stabiliser of the
lattice that is unitary at the infinite places; and, for spaces `S`, `T` of ranks `n` and `m = n + k`, a split place
`w` of norm `q`, characters `a`, `b` whose base changes are unramified at `w̄`, a datum `f` on `Hom(S, T)` that is the
vacuum at `w̄`, and an automorphic function `y` of rapid decay on `U(T)(𝔸)` that is spherical at `w`, the transposed
lift `F` of `y` with the datum `f` is spherical at `w`, and the transposed lift of `H_w(X)y` is
`∏_{l<k}(1 − q^l αX)·H_w(q^k αβ⁻¹X)F` for every `X`, where `α` and `β` are the Frobenius values at `w̄` of `a` in rank
`n` and of `b` in rank `m`, the value at a uniformiser of the Hecke character of the character in that rank times
`q^{n/2}`, respectively `q^{m/2}`).

[ShortProof], `New/OneLift/FalseLifts/HyperbolicPlaneStep.lean` (`New.SiegelWeil.descentsVanish_add_planes`,
`New.SiegelWeil.eq_zero_of_heckePolyOp_eq_zero`, `New.SiegelWeil.DescentsVanish.integral_homSlice_eq_zero`,
`New.SiegelWeil.exists_norm_theta_sub_zeroTerm_le`, `New.SiegelWeil.lift_eq_zero_of_heckePolyOp_eq_zero`)

### 5.3 The tower of descents of a false lift

*Origin:* particular to this proof: the descents of a false lift vanish on the whole tower `W ⊕ ℍ^N` within the range
`2r + 2N + 3 < n`.

*Method of the formal proof:* 5.1 gives the vanishing on `W` for all data; the test value `X_*(w)` has the modulus
required by 5.2 (a), which is applied once with `N` planes.

Prove: let `O` be a descent pair with `r ≥ 1`, `l₀` a parameter on `W` that fits `O`, and suppose that the tame parts
are
nontrivial at the twist places. Let `Ξ ∈ 𝒜(O)` be killed by the hyperplane sums at the chosen places, by the normalised
descent, and by `H_w(X_*(w))` for one split place `w` off the level. If `2r + 2N + 3 < n`, then for every vector `ζ` of
the weight the descents to `W ⊕ ℍ^N`, twisted by `ν_W·υ₁^N`, of the conjugate of `h ↦ ⟨ζ, Ξ(h)⟩_ρ` vanish off `S_O`.

*Needs:* 1.3, 5.1, 5.2.

[ShortProof], `New/OneLift/FalseLifts/PeriodsOfFalseLifts.lean` (`New.Rows.descentsVanish_hyperbolicSum`)

### 5.4 Periods of false lifts over a block vanish

*Origin:* adapted from the published principle that the vanishing of lifts in a theta tower kills theta periods on a
subgroup (C. Wu (2021); Ginzburg, Jiang and Soudry (2009)): here for a form on a definite `U(I_N ⊕ I_l)` and periods
over
`U(I_l)` against theta kernels of `(W, I_l)`, written as class sums.

*Method of the formal proof:* the product of the kernel of `(W, I_l)` with the kernel of `(W, I_N)` at a fixed point is
a kernel of `(W, I_n)` restricted to the block; a Fourier coefficient of the descent to `W ⊕ ℍ^N` along the planes, with
the datum varied, isolates the period over the block `I_l`, which therefore vanishes by 5.3.

Let `O`, `l₀`, `Ξ` and `w` be as in 5.3, and let `ε : N ⊔ l ≃ n` split `I_n = I_N ⊕ I_l` with `2r + 2#N + 3 < n`.

(a) Let `κ` be a weight on `I_l`, `C` a conjugate-linear map from the weight `κ` to the weight of `O` that is
equivariant
for the real points of `U(I_l)`, and `ϑ` a function on `U(I_l)(𝔸_f)` with values in `κ` each coordinate of which, moved
by
the real points, is a multiple of a conjugate theta kernel of `(W, I_l)` at a fixed point of `U(W)(𝔸)`, with the
character `ν_W`, some character of `I_l`, and a datum that is the vacuum off `S_O`. Prove: for `h₁ ∈ U(I_N)(𝔸_f)` and
`x`
supported at the level places, the function `h ↦ ⟨C(ϑ(h)), Ξ(diag(h₁, h)x)⟩_ρ` on `U(I_l)(𝔸_f)` is left invariant under
the
rational points, and its class sum vanishes at every level that fixes it.

(b) Prove: the same conclusion holds for `r = 1` and `2#N + 5 < n` when `Ξ` is a false lift at `w` for the mean `e_1`
over
`∏_{w ∈ 𝒞_O} GL_1(k_w)` and `Z = ker(normalised descent)`, provided the tame parts are nontrivial at all level places;
in that case the hyperplane sums annihilate every form in the image of `e_1`.

(c) (point forms) Prove: with `x` supported at the chosen places, `Y`, `e′` as in 1.1 (c) with the rows `e′` in `I_N`, a
modulus `𝔪` with places among the level places, a datum `Ψ` modulo `𝔪`, and a level `K` of `U(I_l)` that fixes `Ψ` and,
after conjugation by `x`, the matrices `Y_w`: the class sum over `K` of
`h ↦ ⟨(point form of (diag(h₁, h)x, Y, e′))(C(k_Ψ(g, h))), Ξ⟩` is zero, where `k_Ψ(g, h)` is the vector of the conjugate
theta kernels of `(W, I_l)` at `(g, h)` with datum `Ψ`, one for each basis polynomial of weight `κ`.

(d) (product forms) Prove: for a divided splitting of `O` (3.2) with `V° = I_l`, such that `(∏_{w ∈ 𝒞_O} w)²` is
generated by an integer of `E`, a divided lattice `γ`, `x ∈ U(I_N)(𝔸_f)`, a vector `y` of weight `k⁺`, a character
`b`, a datum `Ψ` modulo `ϖ²` and `g ∈ U(W)(𝔸)`, the class sum over `h ∈ U(I_l)` at principal level `ϖ²` of the inner
products with `Ξ` of the product forms of `((x, h), y, conj k_Ψ(g, h))`, with `k_Ψ` of weight `k⁻`, is zero.

*Needs:* 1.1, 1.3, 3.2, 5.3.

[ShortProof], `New/OneLift/FalseLifts/PeriodsOfFalseLifts.lean`
(`New.Rows.integral_conj_pairTheta_mul_algFormCoeff_eq_zero`, `New.Rows.stdClassSum_gramForm_eq_zero`,
`New.Rows.stdClassSum_gramForm_eq_zero_of_rank_one`, `New.Rows.hyperplaneSum_apply_eq_zero_of_rank_one`,
`New.Rows.stdClassSum_period_eq_zero`, `New.Rows.DividedSplitting.stdClassSum_inner_productForm_eq_zero`);
`Lib/Weil/Periods/DescentVanishing.lean` (`New.SiegelWeil.integral_blockEmb_eq_zero_of_descentsVanish`)

## Layer 6: Heights of Hecke values

The squared norm of the lift of a main pair is integral up to an explicit denominator and, as a function of the twist,
is given by one group-ring element at each modulus. Its conjugates at the trivial twist have the size `Σ_τ s_∞(κ(τ))` of
the derivatives it is made of. At a prime `ℓ`, a test form pairs with the twisted lift with small valuation, and a
bound for the denominator of the projection to the line of the lift then bounds the valuation of the twisted squared
norm from above. Together these give the height of the inverse ratio of a main pair along a regular family of
twists, `6β_tot − h_dir`: this is where the cost `h_dir` of one direction enters the lower bound. The product `Γ_j` of
Layer 4 is a product of such ratios.

### 6.1 Denominators of the lift, and one group-ring element for all twists

*Origin:* adapted from the integral group-ring elements that interpolate twisted Hecke L-values
(Katz (1978); as theta elements, Bertolini and Darmon (1996), Chida and Hsieh (2018)): here only the side of the squared
norms of theta lifts from `U(1)`.

*Method of the formal proof:* the lift is a finite sum of values of the theta kernel of a point datum, whose jets are
integral away from the modulus after multiplication by `n_ν` (ThetaLiftChainsAndTheSeesawIdentity §1.5). Expanding
`‖φ‖²` over the classes of `U(1)` and the units at the modulus gives a double sum of values of the tame character times
pairings that depend on the modulus only; the stabiliser orders divide `n_GL`.

Let `D` be the data, `p = (ν, z)` a critical pair with `z ≥ 2`, `ϑ` a tame character, and the notation of 2.5.

(a) A function `F` of the tame characters is an integral measure at the modulus `Q = Q(ϑ)` if there are finitely many
points `u_a ∈ U(1)(𝔸)` and numbers `c_a ∈ ℂ` with `|j(c_a)| ≤ 1` for every prime `l` not dividing `Nm Q` and every ring
homomorphism `j : ℂ → ℂ_l`, such that `F(ϑ′) = Σ_a c_a·ϑ′(u_a)` for every tame character `ϑ′` with `Q(ϑ′) = Q`. Prove:
if `F`
is an integral measure at `Q`, so is `ϑ′ ↦ |F(ϑ′)|²`.

(b) Prove: `φ_{p,ϑ}(h) = Σ_c k_{p,ϑ}(g_c, h)`, where `k_{p,ϑ}(g, h)` is the vector of the jets, with variables scaled by
`π_M·t₀`, of the theta function at `(g, h)` of the point datum (the vacuum scaled by `v₀^{2z}` off the level places; at
the level places the indicator of the columns that reduce to the fixed basis vector at the chosen places and have
entry `1` in that position at `Q(ϑ)`), and `c` runs over the pairs of a class of `U(1)(E)\U(1)(𝔸_f)/J` and a family of
units of the residue fields at `Q(ϑ)`, with `g_c` the representative times an integral lift of the inverse family.

(c) Prove: for a prime `l` not dividing `Nm Q(ϑ)` and an embedding `j : ℂ → ℂ_l`, `n_ν·φ_{p,ϑ}` is integral at `j`; the
integral algebraic part `n_L·L^alg(p, 1)` at the trivial twist is integral at every `ι`; and
`ϑ′ ↦ n_L·L^alg(p, ϑ′)` is an integral measure at `Q(ϑ)` for every `ϑ`.

*Needs:* 2.1, 2.5; ThetaLiftChainsAndTheSeesawIdentity §1.5, §1.7, §2.10; DivisibilityOfThetaDerivatives §4.6, §4.10.

[ShortProof], `New/OneLift/HeckeValues/AlgebraicPartIntegrality.lean` (`New.Data.TameChar.IsIntegralMeasure`,
`New.Data.TameChar.IsIntegralMeasure.norm_sq`, `New.Data.CriticalPair.pointDatum`,
`New.Data.CriticalPair.pointKernel`, `New.Data.CriticalPair.trivialLift_apply`,
`New.Data.CriticalPair.weylGauge_denomBound_smul_pointKernel_le_one`,
`New.Data.CriticalPair.denomBound_smul_trivialLift_mem_integralForms`,
`New.Data.CriticalPair.integralAlgebraicPart_mem_integralAway`,
`New.Data.CriticalPair.norm_integralAlgebraicPart_one_le_one`, `New.Data.CriticalPair.TrivialLiftIndex`,
`New.Data.CriticalPair.liftPoint`, `New.Data.CriticalPair.kernelPairing`,
`New.Data.CriticalPair.norm_sq_trivialLift_eq_sum`,
`New.Data.CriticalPair.isIntegralMeasure_integralAlgebraicPart`)

### 6.2 Sizes of the conjugates and the height of the untwisted squared norm

*Origin:* adapted from Shimura's algebraicity and reciprocity for critical Hecke L-values of CM fields, read on the
squared norm of a theta lift: here with the size `Σ_τ s_∞(c(τ) − z)` of the derivatives and explicit errors.

*Method of the formal proof:* by 2.4 a conjugate of `‖φ‖²` under `Aut(ℂ/K)` is a multiple, of explicit modulus, of the
squared norm of the lift of the conjugate character; by 2.3 that is an L-value, between `ζ(2)^{−f}` and `ζ(2)^{f}`
in absolute value at `z ≥ 2`, times factorials and powers of the scales, which assemble to
`Σ_τ (log ρ(τ)! + ρ(τ)·log(M/Ω))`. For the height, the denominator `n_ν` and the size combine, and a main pair has row
lengths within `x^{42}` of `κ(τ)`.

Let `s_∞(i) = log i! + i·log(M/Ω)` (OneSidedPrimeSumBoundsAndAdmissibleData §4.1).

(a) Prove: for every index set `n` and every automorphism `σ` of `ℂ` over `K` there is a constant `c` such that for
every
critical pair `p = (ν, z)` with `#n = 2z ≥ 4`, `ν` of weight `−c_p`, there is a real `r` with `−4f ≤ r`, with `r ≤ 4f`
if `p`
has empty row, and `log|σ(‖φ_{p,1}‖²)| = c + r + Σ_τ s_∞(c_p(τ) − z)`.

(b) Prove: for a pair `p` with empty row, `|σ(n_L·L^alg(p, 1))| ≤ exp(x^{34})` for every automorphism `σ` of `ℂ`.

(c) Prove: for every index set `n` with `#n` even and `4 ≤ #n ≤ t`, and every character `μ` of `[U(1)]` of weight `0`
with
tame part `ψ` trivial off the chosen places, there is a critical pair `p = (ν, z)` with empty row on `n`, tame part `ψ`
and
`ν·υ₁^{#n/2} = μ`.

(d) Prove: for a main pair `p` for `j`, `κ(τ) ≤ c_p(τ) − z ≤ κ(τ) + x^{42}` at every `τ`; and the constant family
`ι ↦ ‖φ_{p,1}‖²` has height at most `β_tot − Σ_τ s_∞(κ(τ))`.

*Needs:* 2.3, 2.4, 2.5, 6.1; DeterminantsOfThetaLiftChains §1.1; OneSidedPrimeSumBoundsAndAdmissibleData §1.2, §3.3,
§4.1; DivisibilityOfThetaDerivatives §1.6.

[ShortProof], `New/OneLift/HeckeValues/AlgebraicPartSize.lean`
(`New.Data.CriticalPair.exists_log_norm_map_norm_sq_trivialLift_eq_add_sum_jetSize`,
`New.Data.CriticalPair.norm_map_integralAlgebraicPart_le`, `New.Data.exists_hasEmptyRow`,
`New.Data.CriticalPair.HasEmptyRow.hasLiftRank`, `New.Data.CriticalPair.IsMainPair.negWeight_sub_z_mem_Icc`,
`New.Data.heightLe_norm_trivialLift_sq`)

### 6.3 The central action, and the denominator of products of projections to the line of a lift

*Origin:* particular to this proof: a bound for the denominator of the projection to the line of a lift from `U(1)`
(1.4) bounds the `ι`-adic absolute value of the inner product of the projections of two test forms, at the cost of the
class number of `U(1)`.

*Method of the formal proof:* the finite adelic `U(1)` acts on forms through the centre; twisted by the character of
`V` this action fixes the lift, permutes the kernel forms and commutes with the Hecke polynomials, so it preserves
test forms. The inner product of the projections of `Ξ`, `Ξ′` to the line is `⟨Ξ, φ⟩⟨φ, Ξ′⟩/‖φ‖²`; the operator `Λ` of
1.4
on the line is a scalar `λ` with `|ι(λ)| ≥ exp(−β)`, and `λ·pr Ξ′` paired with the mean of the translates of `Ξ` is
integral; the mean over the classes of `U(1)` costs the `ℓ`-part of the class number.

Let `X` be lift data over the field `E` of the data, with lift `φ = φ_X` and `O = O_X`.

(a) For a finite point `z` of `U(1)`, `T_z` is right translation of forms on `V` by the scalar matrix of `z`, multiplied
by
the value at `z` of the character of `V`. Prove: `⟨x, T_z y⟩ = ⟨T_{z⁻¹}x, y⟩`; `T_{z⁻¹}K_X(g) = K_X(gz)`; and `T_z φ =
φ`.

(b) Prove: let `ℓ` be a prime, `ι : ℂ ≃ ℚ̄_ℓ` and `β` real. Suppose that the projection to the line `ℂφ` has denominator
at
most `β` at `ι` for `O` and the idempotent `e_1` of 1.3 (c), and that all stabilisers of the classes of
`U(1)(E)\U(1)(𝔸_f)/J_X` are trivial. Then for all test forms `Ξ`, `Ξ′` of `O` at `ℓ`,
`|ι⟨pr Ξ, pr Ξ′⟩| ≤ exp(β)·ℓ^{v_ℓ(h_X)}`, where `pr` is the orthogonal projection to `ℂφ` and `h_X` the number of those
classes.

CongruencesOfTwistedThetaLifts §7.2 (e) applies (b) to the line of the lift of a main pair, which gives the second
clause of DeterminantsOfThetaLiftChains §1.3 (b).

*Needs:* 1.2, 1.3, 1.4, 2.1, 2.2.

[ShortProof], `New/OneLift/HeckeValues/CentralAction.lean` (`New.LValueData.centralRep`,
`New.LValueData.normalizedCentralOp`, `New.LValueData.coe_centralRep_apply`,
`New.LValueData.inner_normalizedCentralOp`, `New.LValueData.normalizedCentralOp_kernelForm`,
`New.LValueData.normalizedCentralOp_trivialLift`, `New.Selmer.DenominatorLe.norm_inner_starProjection_le`)

### 6.4 A test form whose pairing with the lift has small valuation

*Origin:* adapted from the published sharpness of divisibility for values of theta functions with complex
multiplication and from congruence arguments for ratios of Petersson norms (Prasanna (2006); Coates, Liang and
Sujatha (2010), after Katz (1977)): here an integral form orthogonal to the false lifts whose pairing with the lift of
a main pair has the valuation forced on the derivatives, up to an auxiliary L-value at `2`.

*Method of the formal proof:* the index set of rank `2z` is split in four blocks. A point form (1.1) with a column
that is nonzero modulo the chosen places on a block of size `12` and a standard vector on the others is glued, by a
class sum, with the lift of a pair `q₂` with empty row on a block of rank `4`; it is integral by 6.1 and 3.3, and
orthogonal to the false lifts by 5.4 (b), (c). Its pairing with the lift is, by 1.1 (d) and 2.2, a product of a theta
value on the first blocks, whose valuation is the one forced on the derivatives because the bound of
DivisibilityOfThetaDerivatives is attained (its §5.6), and of the squared norm of the lift of `q₂ϑ`, which is the ratio
of `q₂` up to a constant. A twist of the class sum by a character of the class group keeps one term of largest
`ι`-adic absolute value.

(a) Prove: let `l` be a prime, `ι : ℂ → ℂ_l` an embedding, `S` a finite set of finite places of a CM field `E`, and `Γ ⊃
U(1)(E)`, `K` a compact open subgroup of `U(1)(𝔸_f)` containing the principal level at `S`, with finitely many classes
`Γ\U(1)(𝔸_f)/K`, all with trivial stabiliser. For every function `s` on `U(1)(𝔸_f)` there are a point `z` and a
character
`χ` of `[U(1)]` of weight `0` with tame part trivial off `S` such that
`|ι(s(1))| ≤ |ι(Σ_g χ(gz)·s(gz)/#(Γ\U(1)(𝔸_f)/K))|`, the sum over a fixed set of representatives `g` of the classes.

(b) Prove: let `1 ≤ j ≤ m`, `p` a main pair for `j`, and `q₂ = (ν₂, 2)` a pair with empty row on an index set with `4`
elements. There is `c₀ ≠ 0` with `|σ(c₀)| ≤ exp(f·m·b/k + 3x^{34})` for every automorphism `σ` of `ℂ`, such that for
every
prime `l`, every embedding `ι : ℂ → ℂ_l` and every twist `ϑ` with `Nm Q(ϑ)` prime to `l` there is a test form `Ξ` of
`O_{p,ϑ}`
at `l` with `|ι(c₀·ratio(q₂, ϑ, +1))|·l^{−S_l} ≤ |ι⟨Ξ, φ_{p,ϑ}⟩|`, where `S_l = Σ_τ s_l(κ(τ), τ)` is the sum over the
infinite
places of the local prime sums at `l` (CompositeThetaLiftsAndShortForms §2.1).

*Needs:* 1.1, 1.3, 2.2, 2.5, 3.3, 3.4, 5.4, 6.1, 6.2; DivisibilityOfThetaDerivatives §5.5, §5.6;
CompositeThetaLiftsAndShortForms §2.1, §2.2.

[ShortProof], `New/OneLift/HeckeValues/TwistedValueHeights.lean` (`New.rationalU1_sup_integralU1_le_comap`,
`New.exists_norm_le_norm_twisted_classSum`, `New.Data.exists_mul_eq_norm_map_le_norm_map_mul`,
`New.Data.pointForm_mem_integralForms`, `New.Data.CriticalPair.trivialLiftClassSum`,
`New.Data.CriticalPair.trivialLiftClassSum_mem`, `New.Data.CriticalPair.smul_apply_trivialLiftClassSum`,
`New.Data.CriticalPair.kernelForm_eq_modKernelStdSpace_of_hasEmptyRow`, `New.Data.twistRow`, `New.Data.testColumn`,
`New.Data.testColumn_injective`, `New.Data.inner_pointForm_kernelForm`,
`New.Data.isTestForm_trivialLiftClassSum_pointForm`, `New.Data.exists_isTestForm_inner_kernelForm_eq`,
`New.Data.exists_root_prod_integralAlgebraicPart`, `New.Data.exists_isTestForm_le_norm_inner_trivialLift`)

### 6.5 The height of the inverse ratio of a main pair

*Origin:* particular to this proof: along a regular family of twists, the inverse ratio of twisted to untwisted
L-values of a main pair has height at most `6β_tot − h_dir`.

*Method of the formal proof:* by 2.5 the ratio is `‖φ_{p,ϑ}‖²/(Nm Q(ϑ)^{2z−1}·‖φ_{p,1}‖²)`. At `ι` above `ℓ`, with `ϑ =
θ_ι^j`,
`‖φ_{p,ϑ}‖² = ⟨Ξ, φ⟩⟨φ, Ξ′⟩/⟨pr Ξ, pr Ξ′⟩` for the test forms `Ξ`, `Ξ′` that 6.4 gives at `ι` and at its complex
conjugate, so by 6.3 and the denominator bound of the family its `ι`-adic absolute value is at least
`|ι(|c₀·ratio(q₂, ϑ)|²)|·ℓ^{−2S_ℓ}·exp(−γ(ℓ))·ℓ^{−v_ℓ(h)}`. The untwisted squared norm
has
height `β_tot − Σ_τ s_∞(κ(τ))` (6.2 (d)), the inverse ratio of the ramified pair `q₂` height `x₁`, the constant `c₀`
small
conjugates, `2·Σ_ℓ S_ℓ log ℓ = Σ_τ s_fin(κ(τ), τ)`, and the powers of `Nm Q` cost nothing (2.6 (b)); the sum is
`6β_tot − h_dir`.

Prove: let `θ` be a regular family of `m`-fold twists (DeterminantsOfThetaLiftChains §1.3), `1 ≤ j ≤ m`, and `p` a main
pair for `j`. Then the family `ι ↦ ratio(p, θ_ι^j, +1)⁻¹` has height at most `6β_tot − h_dir`.

*Needs:* 2.5, 2.6, 6.2, 6.3, 6.4; DeterminantsOfThetaLiftChains §1.1, §1.3; OneSidedPrimeSumBoundsAndAdmissibleData
§1.2, §4.1, §4.2; CompositeThetaLiftsAndShortForms §2.2.

[ShortProof], `New/OneLift/HeckeValues/TwistedValueHeights.lean` (`New.Data.heightLe_inv_ratio`)

### 6.6 The height of the inverse of `Γ_j(θ^j)/Γ_j(1)`

*Origin:* particular to this proof: the product of Hecke values of the three exchanges is a product of `k/2` ratios of
main pairs and `5m` ratios of ramified pairs, up to a power of the norm of the modulus.

*Method of the formal proof:* by 2.6 (a) each of the three factors `L_*` of `Γ_j` is its untwisted value times a power
of
`Nm Q` and the squares of the ratios at the points `1, …, z`; the pair `p_*` at a point `z ≤ z_*` is counted as a main
pair for `j` when `7·(m/2) < z ≤ z_*` (there are `k/2` such points) and as a ramified pair for `z ≤ 7·(m/2)`, and the
pairs `p_±` at all their points are ramified. Heights add (6.5 for the main pairs, the small ratios of the family for
the ramified ones).

(a) Prove: for `1 ≤ j ≤ m` there are an integer `e ≥ 0`, finite families `(p_a)_{a ∈ A}` of main pairs for `j` with
`2·#A = k` and `(q_b)_{b ∈ B}` of ramified pairs with signs `s_b`, `#B = 5m`, all independent of the twist, such that
for
every twist `ϑ`
`Γ_j(ϑ) = Nm Q(ϑ)^e·(∏_{a ∈ A} ratio(p_a, ϑ, +1)·∏_{b ∈ B} ratio(q_b, ϑ, s_b))²·Γ_j(1)`.

(b) Prove: for a regular family `θ` of `m`-fold twists and `1 ≤ j ≤ m`, the family `ι ↦ (Γ_j(θ_ι^j)/Γ_j(1))⁻¹` has
height at
most `10m·x₁ + k·(6β_tot − h_dir)`.

*Needs:* 2.6, 4.1, 6.5; DeterminantsOfThetaLiftChains §1.1, §1.3, §1.4.

[ShortProof], `New/OneLift/HeckeValues/TwistedValueHeights.lean`
(`New.Data.isMainPair_lowerPoint_exchangePair_none`, `New.Data.isRamified_lowerPoint_exchangePair`,
`New.Data.heckeValueProd_eq_mul_prod_ratio_sq`, `New.Data.exists_heckeValueProd_eq_mul_prod_ratio`,
`New.Data.heightLe_inv_heckeValueProd_div`)

## Layer 7: The comparison operator and the cost of one lift

The first factors are glued to tuples of forms on `V°`. The adjoint of the gluing map, applied to the lift `Θ_{j,ϑ}`, is
a twist-free injective map `Θ°` divided by the number `c′_ϑ` of Layer 4 (a seesaw identity), and the glued forms are
orthogonal to the false lifts. The comparison operator `U_ϑ`, an integer multiple of `glue_ϑ·glue_ϑ*`, then compares
the Gram determinant of the lift at a twist with that at the trivial twist: `vol(Θ_{j,ϑ}|𝒢(W_j))·det(pr U_ϑ)`
depends on `ϑ` only through `Γ_j(ϑ)`. Bounds for
`det(pr U_ϑ)` at `ι`, from the denominator bound of a regular family, and for the conjugates of `det(pr U_1)`, with the
height of `Γ_j` from Layer 6, give the cost of one lift.

### 7.1 Tuples of forms on `V°`, the gluing map and the slices of lifts

*Origin:* particular to this proof: forms on `V_j` built from the first factors and arbitrary forms on the
complementary block, whose pairing with a lift is the pairing of `y·𝖥_i` with the theta kernel of the block.

*Method of the formal proof:* the splitting `V_j = V″ ⊕ V°` is a divided splitting of every descent pair `O_j(ϑ)`, and
for
each choice `i` a lattice glued for `Λ_i` exists (3.2), the same for all twists. The pairing of a lift with a glued
form is the integral of `y` against the descent of the glued form, which by 3.3 (b) is a sum over the congruence group
of products `Ξ_{ϑ,i}·θ°`; a good form is invariant under the congruence group, and 4.3 replaces `Ξ_{ϑ,i}` by
`𝖥_i/c′_ϑ` up to the scale `c″`.

Let `D` be the data, `1 ≤ j ≤ m`, `ϑ` a twist, `O_j(ϑ)` the `j`-th descent pair
(ThetaLiftChainsAndTheSeesawIdentity §2.18), and the notation of 3.4.

(a) `𝒜^⊕` is the space of tuples `ζ = (ζ_i)`, one function for each choice `i`, from the classes of `U(V°)` at principal
level `ϖ²` (all of whose stabilisers are trivial) to the weight `μ⁻`, with the inner product that is the plain sum over
choices and classes of the invariant pairings of the values. A tuple is integral at an embedding `ℂ → ℂ_l` if all its
values are (through the conjugate vector at the conjugate embedding), and `‖ζ‖²_σ` is the sum over choices and classes
of the squared norms of the `σ`-conjugates of the values.

(b) The splitting of 3.4 (a), with `fix` the inclusion of the indices of `W_j` in those of `V″`, `z` their inclusion in
those of `V°`, and `div` an embedding of the `3m` indices of `S` in those of `V″`, is a divided splitting of `O_j(ϑ)`.
For
each choice `i`, `γ_i` is a divided lattice glued for `Λ_i`, chosen independently of `ϑ`, and `J_{Λ_i}` is the level of
`U(V″)` of the row stabiliser of `Λ_i` stacked over `ϖ·1`. With `c″` and `φ″_{ϑ,i}` as in 3.6, and `l₁ = e_den` the
denominator exponent (3.3 (c)), the gluing map is
`glue_ϑ(ζ) = M^{l₁}·Σ_i Σ_{c} Σ_{h} (product form of ((h, h°_c), φ″_{ϑ,i}(h), ζ_i(c)) for γ_i)`,
`c` over the classes of `U(V°)` with representatives `h°_c` and `h` over the classes of `U(V″)` at level `J_{Λ_i}`; it
is a
linear map `𝒜^⊕ → 𝒜(O_j(ϑ))`.

(c) Prove: `⟨ζ, glue_ϑ^* φ⟩ = M^{l₁}·Σ_i Σ_c Σ_h ⟨φ″_{ϑ,i}(h)·ζ_i(c), φ(diag(h, h°_c)γ_i)⟩_ρ` for `φ ∈ 𝒜(O_j(ϑ))`.

(d) The theta series of the first factor is `Ξ_{ϑ,i}(g) = Σ_h θ″(g, h)`, the class sum at level `J_{Λ_i}` of the kernels
of
`(W_j, V″)` with the column datum of `Λ_i` stacked over `ϖ·1` and the polynomial of the conjugate of `φ″_{ϑ,i}(h)`,
that is, of `c″·Υ_{ϑ,i}(h)`. Prove: `Ξ_{ϑ,i} = c″·Ξ^ex_{ϑ,i}`, with `Ξ^ex_{ϑ,i}` the left side of the third exchange
(4.3 (b)), and there are a constant `C` and numbers `c′_ϑ` with
`|c′_ϑ|² = C/Γ_j(ϑ)` and `c′_ϑ·Ξ_{ϑ,i} = c″·𝖥_i` for all `i` and all twists `ϑ`.

(e) Prove: for `y ∈ 𝒢(W_j)` and `ζ ∈ 𝒜^⊕`, the inner product of `ζ` with `glue_ϑ^* Θ_{j,ϑ} y` is
`Σ_i M^{l₁}·c_{γ_i}·#Γ·∫_{[U(W_j)]} y(g)·Ξ_{ϑ,i}(g)·⟨ζ_i, θ°(g, ·)⟩ dg`, with `c_{γ_i}` the scalar of the lattice `γ_i`
(3.3) and `Γ` the
congruence group (3.2), both independent of `ϑ`; the integrands are rapidly decreasing.

*Needs:* 1.1, 3.2, 3.3, 3.4, 3.5, 3.6, 4.3, 4.6; ThetaLiftChainsAndTheSeesawIdentity §2.7, §2.10, §2.17, §2.18;
DeterminantsOfThetaLiftChains §2.1.

[ShortProof], `New/OneLift/ComparisonOperator/GluingMaps.lean` (`New.Rows.hookNumberMinus`, `New.Data.FormTuples`,
`New.Rows.IsIntegralFormTuple`, `New.Rows.formTupleNormSq`, `New.Rows.splittingV`, `New.Rows.gluingLevel`,
`New.Rows.classAut_gluingLevel_eq_bot`, `New.Rows.glueLattice`, `New.Rows.isGlued_glueLattice`,
`New.Rows.firstFactorScale`, `New.Rows.firstFactor`, `New.Rows.firstFactorPairing`,
`New.Rows.firstFactorPairing_eq_mul_thirdExchangeLeftSide`, `New.Rows.exists_mul_firstFactorPairing_eq`,
`New.Rows.twistFactor`, `New.Rows.exists_norm_twistFactor_sq_eq`, `New.Rows.twistFactor_mul_firstFactorPairing`,
`New.Rows.glue`, `New.Rows.inner_adjoint_glue`, `New.Rows.conj_normalizedDescent_glue`,
`New.Rows.inner_adjoint_glue_goodLift_eq_integral`, `New.Rows.inner_adjoint_glue_goodLift_eq_sum_integral`)

### 7.2 Integrality and size of the gluing map

*Origin:* particular to this proof: the gluing map keeps integrality away from the twist and is short at the trivial
twist.

*Method of the formal proof:* the first factors are integral and small (3.6), the Cartan product at the glued point
has denominator at most `M^{l₁}` (3.3 (c)), which the factor `M^{l₁}` repays; the stabilisers at the gluing levels are
trivial. For the size, the number of classes, the hook number of `μ⁻` and `M^{2l₁}` are bounded by `exp` of powers of
`x` and of `f·m·b·(log b)²`.

Prove, for `1 ≤ j ≤ m` and a twist `ϑ`:

(a) for a prime `l` not dividing `Nm Q(ϑ)` and an embedding `ℂ → ℂ_l`, `glue_ϑ(ζ)` is integral whenever `ζ` is;

(b) `‖glue_1(ζ)‖²_σ ≤ exp(2f·m·b·(log b)²)·‖ζ‖²_σ` for every `ζ ∈ 𝒜^⊕` and every automorphism `σ` of `ℂ`;

(c) the hook number `hk` of `μ⁻` (the squared Fock norm of its highest vector, an integer) is at most `exp(x^{999})`.

*Needs:* 3.3, 3.6, 7.1; ThetaLiftChainsAndTheSeesawIdentity §2.10; OneSidedPrimeSumBoundsAndAdmissibleData §3.3.

[ShortProof], `New/OneLift/ComparisonOperator/GluingMaps.lean` (`New.Rows.isIntegralAndSmall_firstFactor`,
`New.Rows.weylGauge_firstFactor_le_one`, `New.Rows.weylNormSq_firstFactor_le`, `New.Rows.glue_mem_integralForms`,
`New.Rows.hookNumberMinus_le`, `New.Rows.M_pow_denominatorExponent_sq_mul_le_exp`,
`New.Rows.weylNormSq_evalForm_productForm_le`, `New.Rows.normSqAt_glue_le`)

### 7.3 The map `Θ°`, the seesaw identity and orthogonality to the false lifts

*Origin:* adapted from the published use of seesaw identities to pair a lift with an integral form built from theta
series of the factors of a subgroup (Böcherer, Dummigan and Schulze-Pillot (2012); Prasanna (2006)): here for the lift
`W_j → V_j` and the subgroup `U(V″) × U(V°)`, with the twist confined to one number.

*Method of the formal proof:* (a) is 7.1 (d), (e). For (b), a false lift is killed by the hyperplane sums at the chosen
places (as every form in the image of `e₀` is), by the descent (it is orthogonal to the lifts, and the descent is the
adjoint of the lift) and by `H_w(X_*(w))`, so its periods over `U(V°)` against theta kernels of `(W_j, V°)` vanish
(5.4 (a), (d)); by 7.1 (c) the pairing of a glued form `glue_ϑ(Θ° y)` with it is a sum of such periods. (c) is "products
span" (4.6 (d)). For (d): if `c′_ϑ = 0` then `Θ° = 0` by (a), so `𝒢(W_j) = 0` by (c); but `dim 𝒢(W_j)` is the
dimension `d_T` of the target forms (SecondMomentsOfPoincareSeries §2.3 (b)), which is positive
(SecondMomentsOfPoincareSeries §5.7 (c)).

Let `c°_i = M^{l₁}·c_{γ_i}·#Γ·c″`, a nonzero number independent of the twist, and let `Θ° : 𝒢(W_j) → 𝒜^⊕` be the map
whose inner
product with a tuple `ζ` is `Σ_i c°_i·∫_{[U(W_j)]} y(g)·𝖥_i(g)·⟨ζ_i, θ°(g, ·)⟩ dg`. Prove:

(a) (seesaw identity) `c′_ϑ·glue_ϑ^*∘Θ_{j,ϑ} = Θ°` on `𝒢(W_j)`, for every twist `ϑ`;

(b) for `y ∈ 𝒢(W_j)`, the form `glue_ϑ(Θ° y)` is orthogonal to the false lifts for `e₀` and the orthogonal complement of
the range of `Θ_{j,ϑ}` on `𝒢(W_j)` (1.3); more generally the periods of 5.4 (a) vanish for every false lift `Ξ` of
`O_j(ϑ)` for `e₀` and that complement, for splittings `V_j = I_N ⊕ I_l` with `r + 2#N + 3 < t`;

(c) `Θ°` is injective;

(d) `c′_ϑ ≠ 0` for every twist `ϑ`; hence `Γ_j(ϑ)/Γ_j(1) = |c′_1|²/|c′_ϑ|²` is a nonzero real number.

*Needs:* 1.3, 4.6, 5.4, 7.1; ThetaLiftChainsAndTheSeesawIdentity §2.5, §2.7; DeterminantsOfThetaLiftChains §2.1;
SecondMomentsOfPoincareSeries §2.3 (b) (`dim 𝒢(W_j) = d_T`), §5.7 (c) (`d_T > 0`).

[ShortProof], `New/OneLift/ComparisonOperator/GluingMaps.lean` (`New.Rows.hyperplaneSum_apply_eq_zero`,
`New.Rows.normalizedDescent_eq_zero_of_mem_orthogonal`, `New.Rows.tamePart_twistPlace_ne_one`,
`New.Rows.stdClassSum_gramForm_eq_zero_of_mem_falseLiftsAt`, `New.Rows.sum_slice_eq_zero_of_mem_falseLiftsAt`,
`New.Rows.thetaKernelPairing_adjoint_glue_eq_zero`, `New.Rows.glueFactor`, `New.Rows.periodLift`,
`New.Rows.inner_periodLift`, `New.Rows.twistFactor_smul_adjoint_glue_comp`,
`New.Rows.isOrthogonalToFalseLifts_glue_periodLift`, `New.Rows.periodLift_injective`,
`New.Rows.twistFactor_ne_zero`)

### 7.4 The comparison operator

*Origin:* adapted from the published method of bounding the norm of a lift by an integral form and a congruence
denominator, known for one eigenform (Hida (1981); Böcherer, Dummigan and Schulze-Pillot (2012); X. Zhang (2018)): here
one operator for the whole space of lifts of the good forms.

*Method of the formal proof:* by 7.3 (a), `⟨Θ_ϑ y′, glue_ϑ glue_ϑ^* Θ_ϑ y⟩ = |c′_ϑ|^{−2}⟨Θ° y′, Θ° y⟩`, and `Θ°` is
injective.
A tight frame of tuples with integral conjugate values writes `hk²·glue_ϑ glue_ϑ^*` as a sum of operators of rank one
`φ ↦ ⟨glue_ϑ f_a, φ⟩·glue_ϑ f_a`, which keep integrality by 7.2 (a) because the class-sum pairing of integral forms is
integral after multiplication by `n_GL`; the size at `ϑ = 1` is 7.2 (b), (c) with the number of frame vectors.

A comparison operator for `j` is a family of endomorphisms `U_ϑ` of `𝒜(O_j(ϑ))`, one for each twist `ϑ`, such that:

1. `Γ_j(ϑ)/Γ_j(1) ≠ 0` for every `ϑ`;
2. there is an endomorphism `U°` of `𝒢(W_j)`, with `⟨y, U° y⟩ > 0` for `y ≠ 0`, such that
   `⟨Θ_{j,ϑ} y′, U_ϑ Θ_{j,ϑ} y⟩ = (Γ_j(ϑ)/Γ_j(1))·⟨y′, U° y⟩` for all `ϑ` and all `y, y′ ∈ 𝒢(W_j)`;
3. `U_ϑ` takes every lift `Θ_{j,ϑ} y` to a form orthogonal to the false lifts for `e₀` and the complement of the lifts;
4. for every prime `l` not dividing `Nm Q(ϑ)` and every embedding `ι : ℂ → ℂ_l`, `U_ϑ` preserves the forms integral at
   `ι`;
5. `‖U_1 φ‖²_σ ≤ exp(3f·m·b·(log b)²)²·‖φ‖²_σ` for every `φ` and every automorphism `σ` of `ℂ`.

(a) Prove: for every family `(δ_c)` of rational points of `U(V°)`, one for each class `c`, there are tuples
`f_a ∈ 𝒜^⊕`, `a` in a finite set, with `Σ_a ⟨f_a, ζ⟩·f_a = hk²·ζ` for all `ζ`, with the conjugate of every value
`f_a(i, c)` carried by the weight representation of `δ_c` to a vector with integer coordinates, and `‖f_a‖²_σ ≤ hk²`
for every `σ`.

(b) Prove: `U_ϑ = n_GL·hk²·glue_ϑ∘glue_ϑ^*` is a comparison operator for `j`.

*Needs:* 1.3, 7.1, 7.2, 7.3, 4.1; ThetaLiftChainsAndTheSeesawIdentity §2.10; DeterminantsOfThetaLiftChains §2.1.

[ShortProof], `New/OneLift/LiftVolumeHeight.lean` (`New.Data.IsComparisonOperator`, `New.Data.comparisonOp`,
`New.Data.heckeValueProd_div_eq`, `New.Data.adjoint_glue_goodLift`, `New.Data.inner_goodLift_comparisonOp`,
`New.Data.isOrthogonalToFalseLifts_comparisonOp`, `New.Data.TightFrameIndex`,
`New.Data.exists_frame_weightRep_eq_intCast`, `New.Data.exists_tight_frame_formTuples`,
`New.Data.comparisonOp_eq_sum`, `New.Data.comparisonOp_mem_integralForms`, `New.Data.normSqAt_comparisonOp_le`,
`New.Data.isComparisonOperator_comparisonOp`)

### 7.5 The cost of one lift

*Origin:* particular to this proof: along a regular family of twists, the ratio of the untwisted to the twisted Gram
determinant of one lift has height at most `d·k·(log b·β_tot − h_dir)`.

*Method of the formal proof:* write `vol_j(ϑ) = vol(Θ_{j,ϑ}|𝒢(W_j))`, so that `Z_j(θ) = vol_j(θ^j)`. By (a),
`vol_j(1)/vol_j(ϑ) = (Γ_j(ϑ)/Γ_j(1))^{−d}·det(pr U_ϑ)/det(pr U_1)`, used at `ϑ = θ_ι^j`. The first factor
has
height at most `d·(10m·x₁ + k(6β_tot − h_dir))` by 6.6 (b). For the second, take `H = det(pr U_1)⁻¹`: its inverse has
conjugates bounded by (c), and `det(pr U_ϑ)` has `ι`-adic absolute value at most `exp(d·r·γ(ℓ))` by (b) and the
denominator bound of the family, with `Σ_ℓ γ(ℓ) ≤ β_tot`. The sum of the three bounds is at most
`d·k·(log b·β_tot − h_dir)` by the inequalities of the data.

Let `d = dim 𝒢(W_j) = dim 𝒯`, and for a comparison operator `U` let `pr U_ϑ` be the endomorphism
`z ↦ pr(U_ϑ z)` of the range of `Θ_{j,ϑ}` on `𝒢(W_j)`, `pr` the orthogonal projection to that range.

(a) Prove: for a comparison operator `U` there is `C ≠ 0` with
`vol(Θ_{j,ϑ}|𝒢(W_j))·det(pr U_ϑ) = C·(Γ_j(ϑ)/Γ_j(1))^d` for every twist `ϑ`.

(b) Prove: let `U` be a comparison operator, `ϑ` a twist, `ι` above a prime `ℓ` not dividing `Nm Q(ϑ)`, and suppose that
the first clause of DeterminantsOfThetaLiftChains §1.3 (b) holds for `(ι, ϑ, j)` with `β`. Then
`|ι(det(pr U_ϑ))| ≤ exp(d·r·β)`.

(c) Prove: for a comparison operator `U`, `|σ(det(pr U_1))| ≤ exp(3d·f·m·b·(log b)²)` for every automorphism `σ` of `ℂ`;
and
the projection to the lifts of a form orthogonal to the false lifts has `‖pr y‖²_σ ≤ ‖y‖²_σ` at every `σ`.

(d) (the cost of one lift) Prove: for a regular family `θ` of `m`-fold twists (DeterminantsOfThetaLiftChains §1.3) and
`1 ≤ j ≤ m`, the family `ι ↦ Z_j(1)/Z_j(θ_ι)` has height at most `d·k·(log b·β_tot − h_dir)`. Here
`Z_j(θ_ι) = vol(Θ_{j,θ_ι^j}|𝒢(W_j))`: the `j`-th power of the twist is part of the definition of `Z_j`
(DeterminantsOfThetaLiftChains, Conventions), and `Z_j(1)/Z_j(θ_ι)` is the ratio of (a) at `ϑ = θ_ι^j`.

Since `β_tot = f·a·(log b)³/(m·k)`, the bound in (d) is `d·(f·a·(log b)⁴/m − k·h_dir)`, the form in which
DeterminantsOfThetaLiftChains §6.2 uses it. This is the only place where `h_dir` enters Theorem C.

*Needs:* 1.5, 6.6, 7.4; DeterminantsOfThetaLiftChains §1.3, §2.1, Conventions (`Z_j`);
OneSidedPrimeSumBoundsAndAdmissibleData §1.2, §3.3, §4.1, §4.2; SecondMomentsOfPoincareSeries §2.3.

[ShortProof], `New/OneLift/LiftVolumeHeight.lean` (`New.Data.normDet_sq_mul_det_compression`,
`New.Data.norm_map_det_le_pow`, `New.LevelPlaces.LevelForm.normSqAt_smul`,
`New.LevelPlaces.LevelForm.normSqAt_nonneg`, `New.LevelPlaces.LevelForm.normSqAt_pos`,
`New.DescentPair.exists_smul_mem_integralForms_maximal`, `New.Data.finrank_range_goodLift`,
`New.Data.range_goodLift_le_range_inf_ker`, `New.Data.normSqAt_starProjection_range_goodLift_le`,
`New.Data.liftCompression`, `New.Data.IsComparisonOperator.exists_normDet_sq_mul_det_eq`,
`New.Data.IsComparisonOperator.norm_padic_det_liftCompression_le`,
`New.Data.IsComparisonOperator.norm_map_det_liftCompression_le`, `New.Data.heightLe_liftDeterminant_ratio`)

## Downstream consumers

- DeterminantsOfThetaLiftChains §1.3 uses the false lifts and forms orthogonal to them (1.3), the test forms (1.3 (c))
  and the lifts of the main pairs (2.5); its §5.4 and §5.5 use steep parameters, which are in
  PairsOfFramesAtOnePlace §8.1; its §6.2 uses the cost of one lift (7.5 (d)).
- CongruencesOfTwistedThetaLifts §2.2 uses the lift of a character from `U(1)` to `U(2z)` (2.1, 2.5); its §6.8 and §6.9
  use the false lifts (1.3) and the denominator of a projection (1.4); its §7.2 uses the step from a denominator bound
  on the line of a lift to the inner products of projected test forms (6.3 (b)).
- SelmerBoundsForAnticyclotomicTwists §5.2 uses the integral algebraic part as an L-value and as an integral measure
  (2.5, 6.1) and the period of the determinant kernel with its Euler factors (2.7).
- Theorem C (DeterminantsOfThetaLiftChains §6.3) uses 7.5 (d) through DeterminantsOfThetaLiftChains §6.2.

## Scope and ownership

### Owned here

- Point forms, the adjoint of the Hecke polynomial for conjugated pairings, false lifts, test forms and the
  denominator of the projection to a subspace of forms on the definite space of a descent pair (Layer 1).
- The lift of a character from `U(1)` to a definite unitary group, its squared norm as a Hecke L-value, its Galois
  conjugates, its integrality and size, and the period of the determinant theta kernel (Layers 2 and 6).
- Glued lattices, product forms and their descents; the data of the three exchanges; the first factors; the three
  exchanges; products span (Layers 3 and 4).
- The vanishing of the periods of false lifts (Layer 5).
- The comparison operator and the cost of one lift (Layer 7).

### Not owned here

- Descent pairs, theta kernels between definite spaces, their integrality and size, labels and the good idempotent:
  ThetaLiftChainsAndTheSeesawIdentity.
- Critical pairs, ratios, regular families of twists, the lift of a descent pair and its norm, the exchange
  identity, the determinants `Z_j` and `Z`: DeterminantsOfThetaLiftChains.
- The existence of regular families of twists and the bound for denominators: CongruencesOfTwistedThetaLifts and
  SelmerBoundsForAnticyclotomicTwists.
- The divisibility of derivatives of theta functions and its sharpness: DivisibilityOfThetaDerivatives.
- Discrete series with a large gap (steep parameters): PairsOfFramesAtOnePlace, Layer 8.

## Exact supplier contracts

### From ThetaLiftChainsAndTheSeesawIdentity

§1.3 to §1.7 (conjugation, sizes and `p`-adic gauges of jets; data modulo an ideal; integrality and size of definite
theta kernels); §2.1, §2.2, §2.5 to §2.7, §2.10 (spaces, weights, labels and `e₀`, characters and levels, good forms,
stabiliser orders and `n_GL`); §2.16 to §2.18 (descent pairs, the block datum and the descent, the pairs of the
chain); §3.5 (lattice bounds).

### From DeterminantsOfThetaLiftChains

Conventions (characters of `U(1)`, `L_*`, tame characters for a modulus, matched functions, `Z_j`); §1.1 to §1.4
(pairs, ratios, regular families, heights of inverse ratios); §2.1, §2.2 (the lift of a descent pair and its norm);
§3.1, §3.3, §3.10 (theta integrals with finite data, matched functions, the exchange identity for a definite space
with determinant data).

### From OneSidedPrimeSumBoundsAndAdmissibleData

§1.2 (heights), §1.3 (conjugate norms), §2.2 (the field), §3.2 to §3.4 (the data, their sizes, twists and characters),
§4.1, §4.2 (prime sums, `h_dir`, `s_∞`).

### From DivisibilityOfThetaDerivatives

§1.1, §1.4 to §1.6 (the different, Weil data, chosen places, characters of `U(1)` and pairs); §4.1, §4.2, §4.6, §4.7,
§4.10 (the Weil model, the scale `t₀`, the integral vacuum and `v₀`, conjugates and integrality of jets); §5.5, §5.6
(the valuation bound and its sharpness).

### From other roadmaps

CompositeThetaLiftsAndShortForms §2.1, §2.2 (local prime sums);
SecondMomentsOfPoincareSeries §2.3 (`dim 𝒢(W_j) = dim 𝒯`), §5.7 (c) (`d_T > 0`); FiniteReductiveGroups §5.7
(idempotents of labels); DiscreteSeriesCoefficientsAndAutomorphicMetrics §7.5a (class-set inner products and the
Petersson product); SiegelWeilAndRallisFormulasOnUnitaryGroups §4.5 (the inner product formula for sharp data);
HolomorphicDiscreteSeriesOfUnitaryGroups §4.1, §5.4, §5.5, §6.3, §6.4 (products of principal minors, bounds for `c_λ`,
peaks of holomorphic forms); WeilRepresentationsOnBanachSpacesOfData §5.3, §5.4, §6.9, §8.10, §9.3 (data above a set of
places, mixed models, vanishing of descents, Hecke polynomials through theta lifts);
AdelicUnitaryGroupsAndAlgebraicModularForms §3.6 (the Iwasawa decomposition).

## References

- `[ShortProof]`: the folder `grh` of <https://github.com/lsernau/grh-lean> at commit
  `72fead102f663d5c7a407964a13dc0cf9d977207`; this roadmap covers `src/New/OneLift`.
- M. Bertolini, H. Darmon, *Heegner points on Mumford–Tate curves*, Invent. Math. 126 (1996).
- S. Böcherer, *Siegel modular forms and theta series* (1989).
- S. Böcherer, N. Dummigan, R. Schulze-Pillot, *Yoshida lifts and Selmer groups* (2012).
- S. Böcherer, C.-G. Schmidt, *p-adic measures attached to Siegel modular forms* (2000).
- M. Chida, M.-L. Hsieh, *Special values of anticyclotomic L-functions for modular forms*, J. reine angew. Math. 741
  (2018).
- J. Coates, Z. Liang, R. Sujatha, *The Tate–Shafarevich group for elliptic curves with complex multiplication II*
  (2010).
- M. Eichler, *The basis problem for modular forms and the traces of the Hecke operators* (1973).
- D. Ginzburg, D. Jiang, D. Soudry, *Poles of L-functions and theta liftings for orthogonal groups* (2009).
- B. Gross, *Algebraic modular forms*, Israel J. Math. 113 (1999), 61–93.
- M. Harris, J.-S. Li, C. Skinner, *The Rallis inner product formula and p-adic L-functions* (2005).
- H. Hida, *Congruences of cusp forms and special values of their zeta functions* (1981).
- D. Jiang, C. Wu, *On (χ, b)-factors of cuspidal automorphic representations of unitary groups I* (2016).
- N. Katz, *p-adic L-functions for CM fields*, Invent. Math. 49 (1978); and the work of 1977 after which Coates, Liang
  and Sujatha (2010) is cited in `[ShortProof]`.
- J.-S. Li, *Non-vanishing theorems for the cohomology of certain arithmetic quotients*, J. reine angew. Math. 428
  (1992).
- K. Prasanna, *Integrality of a ratio of Petersson norms and level-lowering congruences* (2006).
- S. Rallis, *On the Howe duality conjecture* (1984), cited as Rallis (1984a).
- S. Rallis, *Injectivity properties of liftings associated to Weil representations* (1984), cited as Rallis (1984b).
- T. Tamagawa, *On the ζ-functions of a division algebra*, Ann. of Math. 77 (1963).
- J.-L. Waldspurger, *Engendrement par des séries thêta de certains espaces de formes modulaires* (1978/79).
- C. Wu, *Poles of Eisenstein series and theta lifts for unitary groups*, arXiv:2104.11954 (2021).
- S. Yamana, *L-functions and theta correspondence for classical groups* (2014).
- T. Yang, *Theta liftings and Hecke L-functions* (1997).
- X. Zhang, *Special L-values and Selmer groups of Siegel modular forms of genus 2* (2018).
