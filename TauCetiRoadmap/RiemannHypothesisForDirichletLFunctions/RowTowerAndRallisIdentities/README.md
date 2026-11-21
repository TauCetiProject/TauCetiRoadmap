# Roadmap: the row tower and Rallis identities

**Summary.** This roadmap builds the row side of a chain of theta lifts between unitary groups of a CM field. Let `E`
be an abelian CM field with maximal totally real subfield `F`, and fix the data of a chain as in
[ThetaChainsOnDefiniteUnitaryGroups](../ThetaChainsOnDefiniteUnitaryGroups/README.md): ranks `k`, `m`, `t` with
`r = k + m − 1`, Hermitian spaces `Y_j` of rank `r + jt` over `E`, Hecke characters `μ_j` of `E`, type primes `g₀, g₁` at
which the finite group `G₀ = ∏_{v|g₀g₁} GL_r(𝔽_{g_v})` acts, and tuples `ξ` of twisting characters. The row space of stage
`j` consists of the cusp forms on `U(Y_j)` with a prescribed discrete series at every real place; the theta integral of
the row step `(Y_{j−1}, Y_j)` against the complex conjugate kernel is the descent `io_j(ξ)` from stage `j` to stage `j − 1`,
whose adjoint is the up-lift. The composite `D_ξ = io_1(ξ) ∘ ⋯ ∘ io_m(ξ)` carries the algebraic forms on a definite group
`U(X^h)` to the rows `ℋ^♮`, cusp forms on `U(Y_0)`, and the idempotent `Π_good` of the good labels at the type primes cuts
out the target rows `𝔼^♮` and the descent `ι_ξ = Π_good ∘ D_ξ`.

The headline theorems are these. (1) *Rallis identities.* Let `𝔥` be a Hecke eigensystem away from the set `S(ξ)` of the
places above `g₀g₁` or below the ramification of `ξ`. If the Weil data are unramified off `S(ξ)`, every place of `F` above
`2` splits in `E`, the Witt indices satisfy Weil's condition and the parameters satisfy the gap conditions (W1), (W3) of
the chain, then on the `𝔥`-part of the good rows `𝔼^♮`

`ι_ξ ι_ξ^* = 𝔫₀ · ∏_{j=1}^m L^{S(ξ)}((t+1)/2, B_𝔥 × μ_j(ξ)^{−1})`,

where each factor is an absolutely convergent Euler product with a positive value and `𝔫₀ ≠ 0` depends neither on `𝔥` nor
on `ξ`; so `ι_ξ` is onto `𝔼^♮`. This scalar is `𝔫 · ∏_j λ_j(ξ, 𝔥)`, where, for `t > r`,
`λ_j(ξ, 𝔥) = a_j · L^{S(ξ)}((t+1)/2, B_𝔥 × μ_j(ξ)^{−1})` is the scalar by which `θ_jθ_j^*` acts for the model lift `θ_j` from a
definite group `U(V_j)` to an inner form `U(W_j)` of `U(Y_0)`, positive wherever that part is nonzero.
(2) *A rational structure.* For the grid of complementary spaces of the chain (5.8a), satisfying the rank, spacing and
place conditions of 5.8b, under the size predicate `Size_□` of 5.8e, if the field `𝕃` of the chain contains the finitely many
algebraic numbers that 5.8 names and the hypotheses of (1) hold for every tuple considered, then Bessel periods define an
`𝕃`-structure `𝔼_𝕃` of `𝔼^♮` that contains `ι_ξ(x)` for every tuple `ξ` and every `𝕃`-rational form `x` and is stable under
`G₀` and the Hecke operators away from `S(1)`; the constants of the squares of the grid satisfy
`c(i, j, ξ)/c(i, j, 1) ∈ 𝕃^×`. (3) *The descent on rational coordinates.* If moreover consecutive entries of the row
parameter are at least `100r⁴` apart and `𝕃` contains the eigenvalues of finitely many Hecke operators separating the
eigensystems of `𝔼^♮`, then for every tuple `ξ` and every level `(H, χ_H)` at the type primes whose character has values in `𝕃`,
`ι_ξ` maps the `𝕃`-rational points of `ι_ξ^*(𝔼_{(H,χ_H)})` injectively onto `e_{(H,χ_H)}𝔼_𝕃`, and on the part of each eigensystem
`⟨ι_ξx, ι_ξy⟩ = |H| · 𝔫 · ∏_j λ_j(ξ, 𝔥) · X_ξ(x, y)` for the class-sum form `X_ξ` of the coordinates; for the base
tuple the model eigenvalues are positive at every embedding of `𝕃`, which gives positive definite metrics at every
embedding.

The roadmap rests on [ThetaChainsOnDefiniteUnitaryGroups](../ThetaChainsOnDefiniteUnitaryGroups/README.md) for the data of
the chain; on [MetaplecticAutomorphicForms](../../MetaplecticAutomorphicForms/README.md) and
[ThetaKernelsForUnitaryDualPairs](../ThetaKernelsForUnitaryDualPairs/README.md) for Weil representations, theta integrals
of cusp forms, the archimedean correspondence of discrete series and the Rallis inner product formula; on
[ThetaLiftsForDefiniteUnitaryGroups](../ThetaLiftsForDefiniteUnitaryGroups/README.md) for the complementary-space identity
and the recursion of its constant, applied to the squares of the grid; on
[FiniteReductiveGroups](../FiniteReductiveGroups/README.md) for the labels of the representations at the type primes; and
on [BaseChangeAndGaloisRepresentationsForUnitaryGroups](../BaseChangeAndGaloisRepresentationsForUnitaryGroups/README.md)
for the equality of cuspidal multiplicities of inner forms. It is the first part of Layer 5 of the chain; the later
roadmaps of the chain, named under Downstream consumers below, use its target rows, its descent and its Gram matrix.

Below, 5.1–5.4 define the row spaces, the row steps with their descents and up-lifts, the rows with their labels and the
good idempotent, and the descent with its section; 5.2a is the projector of an integrable discrete series. 5.5 computes
the inner product of the up-lifts of a row step by the Rallis inner product formula, with the twist places and the
independence of the tuple, and 5.6 composes the steps. 5.7 defines the model lifts and proves their Rallis identity.
5.8a–5.8e build the grid of complementary spaces, its squares, their constants and the dependence of these on the tuple,
and the Bessel periods that separate the rows; 5.8 deduces the rational structure. 5.9 compares multiplicities on `U(Y_0)`
and on the model groups; 5.10 writes the descent constant through the model eigenvalues; 5.10a and 5.11 give the model
forms a rational structure and prove positivity at every embedding; 5.12 concludes.

## Conventions

**Fields.** `E` is the host (FrobeniusRestrictedRieszSums §0.1): finite abelian over `ℚ` with an imaginary quadratic subfield `K`; `F = E⁺` its
maximal totally real subfield, `f = [F:ℚ]`; `c ∈ G` complex conjugation; `χ_K` the quadratic character of `K`; `f_E` the
conductor of `E` (the conductor of a primitive character `χ` is `f_χ`); `h_E` the class number of `E`, `μ_E` its
group of roots of unity, `d_E` its discriminant and `rd_E = |d_E|^{1/[E:ℚ]}` its root discriminant. Under
`SplitRamification d` (FrobeniusRestrictedRieszSums §0.3) `K` is ramified only at the prime `d`; on the cyclic hosts
(FrobeniusRestrictedRieszSums §0.4) `d ≡ 7 (mod 8)` and `K = ℚ(√−d)`. `𝕃` is the field of
ThetaChainsOnDefiniteUnitaryGroups §2.6: a number field containing `E`, Galois over `ℚ` and totally complex, read in `ℂ`
through the embedding `σ₀` fixed in ThetaChainsOnDefiniteUnitaryGroups §2.6, with the conjugation
`c_𝕃 = σ₀^{−1}∘(complex conjugation)∘σ₀` of ThetaChainsOnDefiniteUnitaryGroups §2.6. Its finite places are written `𝔭`.
Embeddings `𝕃 ↪ ℂ` are written `σ`.

**CM type and places.** An embedding `ι₀ : E ↪ ℂ` is fixed; `Φ = Gal(E/K)` is identified with the CM type
`{ι₀∘g : g ∈ Φ}` induced from `K` (`|Φ| = f`). Elements of `Φ` are called places. When
`K = ℚ(√−d)`, `√−d ∈ K` denotes the root with `Im ι₀(√−d) > 0`, so that `Im τ(√−d) > 0` for every `τ ∈ Φ`.

**Primes of the construction.** The *type primes* `g₀, g₁` (ThetaChainsOnDefiniteUnitaryGroups §2.7) carry the depth-zero types; the *auxiliary primes*
`p_δ, p′_δ` carry the characters `δ, δ′` (ThetaChainsOnDefiniteUnitaryGroups §2.4, ThetaChainsOnDefiniteUnitaryGroups §2.7); the *level prime* `T(u) = N(π_u)` of a word `u` (ThetaChainsOnDefiniteUnitaryGroups §2.8) carries the new forms. The *twist places*
`Q(ξ)` of a tuple `ξ` of twisting characters are its full ramification set (ThetaChainsOnDefiniteUnitaryGroups §2.5).

**Hermitian forms, definiteness and measures.** Hermitian forms are conjugate-linear in the first variable (the
convention of `HermitianFormsAndLattices` and `ThetaLiftsForDefiniteUnitaryGroups`). Definiteness is that of
`HermitianFormsAndLattices`: a space is *definite at* a real place if its form has one sign there, *totally definite* if
it is definite at every real place (the sign may depend on the place), and *totally positive definite* if every sign is
`+`; a *definite unitary group* is the unitary group of a totally definite space. The column spaces `X_j`, the model
spaces `V_j` and the hyperplane `X^h ⊂ X_m` are totally positive definite (ThetaChainsOnDefiniteUnitaryGroups §2.2). On `U(V)(𝔸_f)` the stabiliser of the
chosen self-dual lattice has volume `1`; for totally definite `V`, `∫_{[U(V)]} φ = Σ_𝒸 |Γ_𝒸|^{−1} φ(g_𝒸)` over the
classes `𝒸` (representatives `g_𝒸`, stabilisers `Γ_𝒸`), so the total volume is the mass; for indefinite `V` the
archimedean measure is transferred from the compact inner form, and formal degrees are taken for this measure.

**Theta lifts between definite groups.** The step of the column chain from level `j − 1` to level `j` is a definite dual
pair in the homomorphism model (ThetaChainsOnDefiniteUnitaryGroups §3.2): the symplectic space is `𝕎_j := Hom_E(X_{j−1}, X_j)`, on which `(g, h)` acts by
`x ↦ h∘x∘g^{−1}`, with the alternating form `Tr_{E/F}(δ_T·tr(x^†y))`, the scaling element `δ_T := √−d/d = −1/√−d` (ThetaChainsOnDefiniteUnitaryGroups §2.2),
and the standard additive character of `𝔸_F/F` (equivalently the form `Tr_{E/F}(δ_T·tr(y^†x))` with the complex
conjugate character). Every pair of spaces of the chain (column steps, row steps, model steps, the arrows of the grid of
5.8a) is a homomorphism pair in this normal form (ThetaChainsOnDefiniteUnitaryGroups §2.2a; skew element `δ_T`, or a positive rational multiple of it for
the grid); lifts integrate against the theta kernel, and the row descents integrate against its complex conjugate at the
complex conjugate vector, `θ̄_{S,T}(·; Φ) = conj θ_{S,T}(·; conj Φ)` for the test vector `Φ` (equivalently, they are
linear theta integrals of the conjugate datum: skew element `−δ_T`, inverse splitting characters, ThetaChainsOnDefiniteUnitaryGroups §2.2a (b)). `x^†` is
the adjoint of a homomorphism of Hermitian spaces, and Layer 5 writes `T^*` for the adjoint of an operator on a Hilbert
space. In the conventions of `ThetaLiftsForDefiniteUnitaryGroups` (standard character, symplectic form built from the
two Hermitian forms and a fixed purely imaginary element, here taken to be `δ_T`, which is not the `√−d` of this
roadmap) this is the homomorphism pair of ThetaLiftsForDefiniteUnitaryGroups §0.1 whose first space is the dual `X_{j−1}^∨` (on which `U(X_{j−1})` acts
contragrediently) and whose second space is `X_j` with the skew form `δ_T⟨,⟩`, read through the dictionary of ThetaLiftsForDefiniteUnitaryGroups §2.5. Since
`Im τ(δ_T) > 0` for `τ ∈ Φ`, the embedding which that roadmap attaches to the real place below `τ` is the conjugate
embedding `c∘τ`, with sign `−1` and complex structure `(c∘τ)(i)`.

**Integral structures.** For a dominant weight `λ`, `∇_ℤ(λ)` is the dual Weyl lattice (the integral polynomials of the
polynomial model of ThetaChainsOnDefiniteUnitaryGroups §3.1, spanned by products of minors) and `Δ_ℤ(λ) ⊂ ∇_ℤ(λ)` the Weyl lattice, its dual for the
invariant form; the product of leading minors `v_λ` lies in both. The column side of the chain (the integral forms
`ℳ_j^{int}` of ThetaChainsOnDefiniteUnitaryGroups §3.1, the chain lift, the source lattices of ThetaChainsOnDefiniteUnitaryGroups §3.8 and their restriction to `U(X^h)`) takes values in `Δ_ℤ`,
in the coordinates of a basis of the dual class lattice; the row forms `Υ` on `U(X^h)` paired with it take values in
`∇_ℤ` (the forms `ℳ^∨`), so that every class term of the pairing is integral and the only loss is the stabiliser
orders (ThetaChainsOnDefiniteUnitaryGroups §3.6, ThetaChainsOnDefiniteUnitaryGroups §3.10). At the top, a class `𝒸` of `U(X^h)` gives the class `𝒸̃` of level `m` with class lattice
`L_𝒸 ⊕ 𝒪_E z_u`, `z_u = π_u e_{N_m}`, and the restriction to `U(X^h)` is integral at every finite place (ThetaChainsOnDefiniteUnitaryGroups §3.9).

**Petersson products.** For algebraic modular forms with values in an algebraic representation `V_λ`:
`⟨φ, φ′⟩ = Σ_𝒸 |Γ_𝒸|^{−1}⟨φ(𝒸), φ′(𝒸)⟩_λ`, with `⟨,⟩_λ` the invariant Hermitian form normalised by `⟨v_λ, v_λ⟩ = 1` on
the product of leading minors `v_λ` of the polynomial model of ThetaChainsOnDefiniteUnitaryGroups §3.1 (it lies in both lattices `Δ_ℤ ⊂ ∇_ℤ`); the chain
forms are functions of frames, and their coefficient module in Gross's model is `V_λ^∨` (ThetaChainsOnDefiniteUnitaryGroups §3.1). For forms on indefinite
groups the Petersson product of 5.1 sums over an orthonormal basis of the lowest `K`-type.

**Indices of the chain.** Step `j` is the column lift `U(X_{j−1}) → U(X_j)` with Hecke character `μ_j` and step weight
`w_j = e_{j−1}` (ThetaChainsOnDefiniteUnitaryGroups §2.3), the row descent `U(Y_j) → U(Y_{j−1})` (against the conjugate kernel `θ̄`, ThetaChainsOnDefiniteUnitaryGroups §2.2a), and the model
lift between `U(V_j)` and `U(W_j)`. Columns grow by `t + 1`, rows by `t`.

**Row spaces.** The row forms on `U(Y_0)` are formed at principal level at the type primes, where the finite group `G₀`
of ThetaChainsOnDefiniteUnitaryGroups §2.9a acts (5.3): `ℋ^♮` denotes the rows at principal level and `𝔼^♮ = Π_good·ℋ^♮` the good ones; `ℋ` and
`𝔼 = Π_good·ℋ` are their parts of the row type level `(P_1, χ_{P_1})` of ThetaChainsOnDefiniteUnitaryGroups §2.9a, on which the Poincaré series, the seesaw
and the target rows live; `𝔼_0` is the part of the base level `(P_0, χ_{P_0})`.

**Characters and levels at the type primes.** For a type prime `g ∈ {g₀, g₁}` the prime `π_g𝒪_K` of `K` above `g` is
fixed, and for a place `v` of `F` above `g`, `w_v` is the place of `E` above `v` and `π_g` (residue field `𝔽_g`). The
*type characters* of step `j` are `χ_{v,j} := ω_g^{2j}` on `𝒪_{E_{w_v}}^×`, `ω_g` a fixed generator of the characters of
`𝔽_g^×`, the same for all `v | g` and all `j` (ThetaChainsOnDefiniteUnitaryGroups §2.4 (b)): squares, of depth zero, read as elements of `𝔽_g^×` through the
identification of ThetaChainsOnDefiniteUnitaryGroups §2.9a (its tame condition). The step character `μ_j` is tamely ramified there, with residue
`χ_{v,j}^{−1}` at `w_v` and `χ_{v,j}` at `w̄_v`. The levels of ThetaChainsOnDefiniteUnitaryGroups §2.9a carry these characters: on `U(V_j)` the character
`χ_{v,j}^{−1}` of the determinant of the `t`-block, and on the row stage of `Y_j` the character
`χ^{fl}_j = ∏_{i≤j} χ_{v,i}^{−1}` of the determinants of the added blocks. A *level* at the type primes is a pair
`(P, χ_P)` of a subgroup `P` of the finite group `G₀` and a character `χ_P` of `P`; the rows are formed at principal
level and the levels cut out their parts (base level `(P_0, χ_{P_0})`, row type level `(P_1, χ_{P_1})`, ThetaChainsOnDefiniteUnitaryGroups §2.9a). At the
twist places the levels carry `c_v(det of the lower block)`, `c_v = (ξ_{w_v}|_{𝒪^×})^{s}`, with exponent `+1` (ThetaChainsOnDefiniteUnitaryGroups §2.9c); the
rule for all bad places is that of ThetaChainsOnDefiniteUnitaryGroups §2.9 (the residues `c_{i,v}` of the step characters). The
splitting character `η̃` and the twisting characters are unramified at the type places, and `μ_j`, `δ`, `δ′` are
unramified outside the *bad places* `S₀`, the places above `g₀, g₁, p_δ, p′_δ` (ThetaChainsOnDefiniteUnitaryGroups §2.4 (b)).

**Sizes.** The size conditions are named predicates: those of ThetaChainsOnDefiniteUnitaryGroups §2.1, grouped into the
host predicates `SizeA`, `SizeN`, `SizeD`, `SizeRd`, `SizeQD`, `SizeInert`, `SizeDep` and the parameter predicates `SizeM`,
`SizeK`, `SizeW`, `SizeMf`, `SizeT`, `SizeTheta`, with their conjunction `Size(x, ε)`; and those named where their quantities
are defined: `SizeSc` (ThetaChainsOnDefiniteUnitaryGroups §2.3b), `SizeGap`, `SizeSep` (ThetaChainsOnDefiniteUnitaryGroups
§2.3c), `SizeG` (ThetaChainsOnDefiniteUnitaryGroups §2.7), `SizeT_u` (ThetaChainsOnDefiniteUnitaryGroups §2.8), and the
size predicate `Size_□` of the grid (5.8e). "The size
conditions of ThetaChainsOnDefiniteUnitaryGroups §2.1" means `Size(x, ε)`; a target that uses a single predicate names it.

**Routes.** The mathematics of this roadmap follows a complete formal proof ([FormalProof]); every target states what
that proof establishes. Where a route is not given, or not given in full, the target says so in its route.

### Table of symbols

| Symbol | Meaning | Defined |
|---|---|---|
| `E, F = E⁺, f, c, G, f_E` | host field, its maximal totally real subfield, `[F:ℚ]`, complex conjugation, `Gal(E/ℚ)`, conductor of `E` (of a primitive `χ`: `f_χ`) | FrobeniusRestrictedRieszSums §0.1, FrobeniusRestrictedRieszSums §0.2 |
| `h_E, μ_E, d_E, rd_E` | class number of `E`; group of roots of unity of `E`; discriminant and root discriminant of `E` | Conventions |
| `K, χ_K, d, √−d` | the imaginary quadratic subfield and its character; the prime of `SplitRamification d` (`K = ℚ(√−d)` on the cyclic hosts) and the root with `Im ι₀(√−d) > 0` | FrobeniusRestrictedRieszSums §§0.1–0.3, Conventions |
| `Φ, ι₀, τ` | `Gal(E/K)` and the CM type it defines through `ι₀`; its elements, the places | FrobeniusRestrictedRieszSums §0.1 |
| `SplitRamification d, InertFreeUpTo B, HostSplitting E` | host predicates: every ramified prime other than `d` splits in `K` and `I_d = {1, σ_d}`, `σ_d ∉ Φ`; no prime `p ≤ B` is inert in `K`; `4 \| f` and every place of `F` above a prime dividing `f_E` splits in `E` | FrobeniusRestrictedRieszSums §0.3 |
| `k, m, t, r, N_j, n_j` | base rank, chain length, rank step, `r = k + m − 1`, `N_j = k + j(t + 1)`, `n_j = r + jt` | ThetaChainsOnDefiniteUnitaryGroups §2.1 |
| `x, ε, b, a, X′, b′, w″, X″` | scale, exponent, `e^{x^ε}`, `x·b`, `e^{x^{ε/3}}`, `a/X′`, `b′/(x\|A\|)`, `x\|A\|X′` | ThetaChainsOnDefiniteUnitaryGroups §2.1 |
| `𝔭` | finite place of `𝕃` | Conventions |
| `Size(x, ε)` | conjunction of the host predicates `SizeA, SizeN, SizeD, SizeRd, SizeQD, SizeInert, SizeDep` and the parameter predicates `SizeM, SizeK, SizeW, SizeMf, SizeT, SizeTheta` | ThetaChainsOnDefiniteUnitaryGroups §2.1 |
| `SizeQD, SizeInert` | `log q ≥ x^{ε/(6J)}` and `log d ≥ x^{19ε/(100J)}`; inert-free up to `max(12, x^{ε/(5J)})` | ThetaChainsOnDefiniteUnitaryGroups §2.1 |
| `SizeSc, SizeGap, SizeSep, SizeG, SizeT_u` | size predicates of the words, the gaps, the separation, the type primes and the level primes | ThetaChainsOnDefiniteUnitaryGroups §2.3b, ThetaChainsOnDefiniteUnitaryGroups §2.3c, ThetaChainsOnDefiniteUnitaryGroups §2.7, ThetaChainsOnDefiniteUnitaryGroups §2.8 |
| `X_j, X^h` | column spaces, hyperplane of `X_m` | ThetaChainsOnDefiniteUnitaryGroups §2.2 |
| `Y_j, z_m, r_S` | row spaces; the negative vector of `Y_j` (`j` even); `r_S = m/2 − 1`, the number of hyperbolic planes of `Y_0` | ThetaChainsOnDefiniteUnitaryGroups §2.2 |
| `W_j, V_j` | model spaces: rank `r`, signature `(k+j−1, m−j)`; totally positive definite of rank `r + t` | ThetaChainsOnDefiniteUnitaryGroups §2.2 |
| `𝔞₀, δ_T` | `𝔞₀𝔞̄₀ = 𝔇_{E/K}^{−1}`; the scaling element `δ_T = √−d/d = −1/√−d` of the steps | ThetaChainsOnDefiniteUnitaryGroups §2.2 |
| `W, u, u_*` | the set of words, a word, the base word | ThetaChainsOnDefiniteUnitaryGroups §2.3 |
| `u(τ), v(τ), e′(τ), e(τ)` | Harish-Chandra data at `τ` of the word `u` (`v, e′, e` shared by all words) | ThetaChainsOnDefiniteUnitaryGroups §2.3 |
| `w_j(τ), w_{u₀,j}` | step weights `e_{j−1}(τ)` (thick, top or thin); those of the translate `u₀` | ThetaChainsOnDefiniteUnitaryGroups §2.3 |
| `Δ_w, Sc` | letter step, cloud size `4kΔ_w` | ThetaChainsOnDefiniteUnitaryGroups §2.3 |
| `(U_j), (W1)–(W6), h_gap, κ_j` | unit condition, conditions of a weight datum, row gap, the shift `(k + (2j − 1)(t + 1))/2` of the step diagrams | ThetaChainsOnDefiniteUnitaryGroups §2.3 |
| `μ_j, η̃, δ, δ′, o_δ` | Hecke characters of the chain, unramified splitting character (not algebraic; `η̃²` and `η̃·‖·‖_{𝔸_E}^{1/2}` are, and `𝕃` contains the values of the latter, ThetaChainsOnDefiniteUnitaryGroups §2.6), auxiliary characters and their inertial order | ThetaChainsOnDefiniteUnitaryGroups §2.4 |
| `χ_{v,j}, ω_g` | type characters `ω_g^{2j}` at the place `w_v` of `E` above `π_g` (the residue of `μ_j` there is `χ_{v,j}^{−1}`); the fixed generator of the characters of `𝔽_g^×` | ThetaChainsOnDefiniteUnitaryGroups §2.4 |
| `S₀` | bad places: the places above `g₀, g₁, p_δ, p′_δ` | ThetaChainsOnDefiniteUnitaryGroups §2.4 |
| `ξ, Ξ, ξ_𝔭, Q(ξ), s, δ_ℓ` | tuple of twists (`ξ = 1` the base tuple), set of tuples, tuple used at `𝔭`, twist places (full ramification set), the sign of the twisted tuples (`s_j := s`), auxiliary character of `ℓ` | ThetaChainsOnDefiniteUnitaryGroups §2.5 |
| `𝕃, σ₀, c_𝕃` | the field of the chain, its fixed embedding and conjugation | ThetaChainsOnDefiniteUnitaryGroups §2.6 |
| `g₀, g₁; p_δ, p′_δ; 𝔅(N, g)` | type primes; auxiliary primes; the exceptional set of a type prime | ThetaChainsOnDefiniteUnitaryGroups §2.7 |
| `T(u), T*(u), π_u` | level prime of the word `u`, its target value, `T(u) = N(π_u)` | ThetaChainsOnDefiniteUnitaryGroups §2.8 |
| `G₀, (P, χ_P), (P_0, χ_{P_0}), (P_1, χ_{P_1}) = (K₂, χ₂), ψ_g` | finite group of the type primes, a level, base level, row type level, additive character | ThetaChainsOnDefiniteUnitaryGroups §2.9a |
| `χ^{fl}_j, K^{pr}_j(ξ), K^{rt}_j(ξ)` | character `∏_{i≤j}χ_{v,i}^{−1}` of the row stage groups; finite level groups of stage `j` at principal level and at the row type level | ThetaChainsOnDefiniteUnitaryGroups §2.9a |
| `S(ξ), c_{i,v}` | the places where levels are not hyperspecial; the residues of the step characters at the bad places | ThetaChainsOnDefiniteUnitaryGroups §2.9 |
| `χ_N, χ_L, i_col, i_row, Φ^{pr}_{j,v}, Φ^{rt}_{j,v}, Φ^{(H)}_j` | characters and indices of the type levels; test vectors of the row steps at principal level and at the row type level; the row test vector at all type places together | ThetaChainsOnDefiniteUnitaryGroups §2.9a |
| `K^{rt}_j(v), K^{fn}_j(v), χ^{fn}_j` | the local row type level; the fine levels (the groups under which the chain's data at the type primes are equivariant) and their characters | ThetaChainsOnDefiniteUnitaryGroups §2.9a |
| `idx_v(j), Φ^Q_{j,v}` | parahoric indices at twist places; test vector of the row steps there | ThetaChainsOnDefiniteUnitaryGroups §2.9c |
| `∇_ℤ, Δ_ℤ` | dual Weyl and Weyl lattices | ThetaChainsOnDefiniteUnitaryGroups §3.1 |
| `𝒟^{(j)}, 𝒟_τ` | discrete series of stage `j`; its component at `τ` for `j = 0` (`𝒟_τ = 𝒟^{(0)}_τ`) | 5.1 |
| `𝒞_j, io_j` | row space of stage `j`, one descent step | 5.1, 5.2 |
| `δ_Y` | the skew element `−δ_T` of the row descent | 5.2 |
| `I^∞_j, I^{∞,∗}_j, θ̄_j` | the archimedean intertwiner of the descent step `j` and its adjoint; the conjugate kernel `θ̄_j(g, h; ψ) = conj θ_j(g, h; conj ψ)` of the step | 5.2 |
| `e_𝒟` | the projector coefficient of `𝒟` | 5.3 |
| `B_𝔥, X[𝔥], e_{P,χ_P}` | family of an eigensystem `𝔥` (the Satake parameters of its base change), the part on which the Hecke operators act by `𝔥`; idempotent of a level `(P, χ_P)` at the type primes | Layer 5 notation, ThetaChainsOnDefiniteUnitaryGroups §2.9a |
| `ℋ^♮, 𝔼^♮, ℋ, 𝔼, 𝔼_0, Π_good` | rows at principal level, good rows; their parts of the row type level (`𝔼` the target rows); the part of the base level; the good idempotent | 5.3 |
| `D_all, D_rows, δ_bad` | the dimensions of `ℋ` and `𝔼`, the discarded share | 5.3 |
| `𝒰^♮_ξ, M̃_ξ, D_ξ, ι_ξ, ℋ^{rt}_ξ, Q_ξ, sec` | forms on `U(X^h)` at principal level, integral forms, the unprojected `m`-fold descent, the good descent `Π_good∘D_ξ`, the relevant part of the row type level, its part orthogonal to `ker ι_ξ`, the section of `ι_1` on `𝔼` | 5.4 |
| `θ_j, D_{W_j}, λ_j(ξ, 𝔥), a_j, ϑ_v` | model lift of step `j`, the holomorphic discrete series of `U(W_j)`, its Rallis eigenvalue `a_j·L`, its constant; the character in the test function at a place below `Q(ξ)` | 5.7 |
| `v_□, p_□, S_□` | the auxiliary place of the grid, its rational prime, `S₀ ∪ {v_□}` | 5.8a |
| `N_E, r′, c_i(τ), h_c, N_□, ℓ_cl, C_F` | the modulus of the host (FrobeniusRestrictedRieszSums §0.4); the least prime not dividing `N_E(p_δ − 1)(p′_δ − 1)`; the centres of the grid, their spacing, `k + m(t + s + 1)`, the length of the cloud of `v`; the depth constant | 5.8a |
| `𝔪_□, d_□, K⁺; X^c_i, X⁺ = X^c_m; C⁺, e⁺_i, z⁺, N⁺, ψ⁺, n⁺` | the modulus of the grid, its depth, the principal congruence subgroup of level `𝔪_□` in `U(X⁺)(𝔸_f)`; the core column; the Bessel datum (the measure constants `𝔪_j` of 5.2 are other symbols) | 5.8a |
| `u_l` | the step quotient `u_l(ξ)/u_l(1)` | 5.8d |
| `B⁺, 𝐩, 𝐜, ℓ⁺, Cl⁺, y_{κ,i}, Θ^{(0)}_{𝐩,𝐜}; ℬ_a, a = (𝐜, κ, i)` | the Bessel form; Fock data of column `0`; coset data; a linear form on `V_{Λ⁺}`; the classes `U(X⁺)(F)\U(X⁺)(𝔸_f)/K⁺`; the form on the class `κ` with value the `i`-th basis vector; the theta series of column `0`; the Bessel periods of the grid and their index | 5.8e |
| `Size_□` | the size predicate of the grid | 5.8e |
| `𝔼_𝕃` | the `𝕃`-structure of `𝔼^♮` the Bessel periods define | 5.8 |
| `(L1)–(L7), T_w(ξ), d(w)` | the condition on `𝕃`; the places of `E` it concerns for a tuple `ξ`; the exponent of `𝔪_□` at `w` | 5.8 |
| `𝔫` | the descent constant | 5.10 |
| `j_σ` | the realisation of the rational structure at an embedding `σ` | 5.10a |

**Statements of the formal proof.** A target whose status or route names [FormalProof] is stated in the form that proof establishes: its
hypotheses, ranges and constants are those of the proof, including restrictions that the route written here does not
visibly use. A wider statement would need its own proof.

## Layer 5: The row tower and the Rallis identities

Forms on the indefinite groups `U(Y_j)` with prescribed discrete series, the theta descents between them and their
normalised `m`-fold composite from forms on `U(X^h)` to the row forms of `U(Y_0)`. All these spaces are formed at
principal level at the type primes, where the finite group `G₀` of ThetaChainsOnDefiniteUnitaryGroups §2.9a acts; the levels of ThetaChainsOnDefiniteUnitaryGroups §2.9 cut out their parts.
The norm of the composite is computed twice: step by step along the chain, one partial `L`-value per step (5.5, 5.6);
and through model lifts between the definite `U(V_j)` and `U(W_j)`, an inner form of `U(Y_0)` with the same finite
part, whose Rallis eigenvalues carry the same `L`-values (5.7, 5.9, 5.10). Matching the Hecke eigensystems of the two
sides writes the norm as `𝔫·∏_jλ_j`; Galois conjugation of the model lifts makes every `λ_j` positive at every
infinite place of `𝕃` (5.10a, 5.11); a grid of complementary-space constants gives the row space one
rational structure for all twisting tuples, through the values of the local constants at the ramified places and the
separation of the rows by Bessel periods (5.8a–5.8e, 5.8); together these make the descent a bijection on rational coordinates
with an explicit Gram matrix (5.12).

*Notation for this layer.* `σ₀ : 𝕃 ↪ ℂ` is the fixed embedding extending `ι₀` through which complex objects are read
(ThetaChainsOnDefiniteUnitaryGroups §2.6). For a tuple `ξ` (ThetaChainsOnDefiniteUnitaryGroups §2.5), `S(ξ)` is the set of places of `F` above `g₀g₁` or below `Q(ξ)` (ThetaChainsOnDefiniteUnitaryGroups §2.9).

- *Principal level.* At the places above `g₀g₁` every space of this layer is formed at principal level: forms on
  `U(Y_0)` and on `U(W_j)` are invariant under the principal congruence subgroups `K(g)_v` of ThetaChainsOnDefiniteUnitaryGroups §2.9a (on `U(W_j)` through
  the isometries `W_j ≅ Y_0` of ThetaChainsOnDefiniteUnitaryGroups §2.9 at these places), forms on `U(Y_j)`, `1 ≤ j ≤ m`, are the forms of principal level
  of ThetaChainsOnDefiniteUnitaryGroups §2.9 (level `(∏_v K^{pr}_j(v), χ^{fl}_j)` of the row stage groups), so that `G₀ = ∏_{v|g₀g₁} GL_r(𝔽_{g_v})` acts on all of
  them (on the stages by `g₀·f = χ^{fl}_j(κ)^{−1}R(κ)f`, ThetaChainsOnDefiniteUnitaryGroups §2.9). Away from `g₀g₁` the levels are those of ThetaChainsOnDefiniteUnitaryGroups §2.9. For a level
  `(P, χ_P)` at the type primes and a `G₀`-module `M`, `M^{(P,χ_P)} = e_{P,χ_P}M` is the level-`(P, χ_P)` part, cut out by the
  idempotent `e_{P,χ_P}` of ThetaChainsOnDefiniteUnitaryGroups §2.9.
- *Eigensystems and families.* An eigensystem `𝔥` away from `S(ξ)` is a character of the spherical Hecke algebras at
  the places `v ∉ S(ξ)`; its *dual* `𝔥^∨` is `T_g ↦ 𝔥(T_{g^{−1}})`. Its *family* `B_𝔥` assigns to every place `w` of `E`
  above a place `v ∉ S(ξ)` the multiset of the `r` Satake parameters of the base change of `𝔥` at `w` (unitary
  normalisation), and for a Hecke character `χ` of `E` unramified off `S(ξ)`
  `L^{S(ξ)}(s, B_𝔥 × χ^{−1}) = ∏_{w ∤ S(ξ)} ∏_{β ∈ B_𝔥(w)} (1 − β·χ(ϖ_w)^{−1}·N w^{−s})^{−1}`.
  On both sides `X[𝔥]` is the part of `X` on which the Hecke operators act by `𝔥`: `𝒞(W_j)[𝔥]` (5.7), `ℋ^♮[𝔥]`, `𝔼^♮[𝔥]`,
  `𝒞_i(ξ)[𝔥]` and `𝒰^♮_ξ[𝔥]` (5.3, 5.1, 5.4); the Hecke operators are normal, `T_g^* = T_{g^{−1}}`. With this labelling both
  sides of 5.10 carry `L^{S(ξ)}((t+1)/2, B_𝔥 × μ_j(ξ)^{−1})`.
- *Levels.* A level at the type primes is written `(P, χ_P)` (ThetaChainsOnDefiniteUnitaryGroups §2.9a): the base level `(P_0, χ_{P_0})` and the row type level
  `(P_1, χ_{P_1}) = (K₂/K(g), χ₂)`; `(P_b, χ_{P_b})`, `b ∈ {0, 1}`, denotes either.
- *Normalisations.* The constants `𝔪_1, …, 𝔪_{m−1} > 0` and the archimedean intertwiners `I^∞_j` of 5.2 are fixed once and
  for all; 5.4–5.12 hold for every choice, the constants `𝔫_j`, `𝔫` changing with them by explicit positive factors. The
  constant `𝔪_m` is not free: it is fixed in 5.2 so that the product of stage `m` is the class-sum product.

*Check (`r = 1`).* Let `x` be a form on `U(1)` with Satake parameter `β` at `w` (hence `β^{−1}` at `w̄`), `𝔥` its eigensystem,
and `μ(ϖ_w) = u`, `|u| = 1`, so `μ(ϖ_{w̄}) = u^{−1}`. The factors of `L(s, B_𝔥 × μ^{−1})` at `w, w̄` are
`(1 − βu^{−1}N w^{−s})^{−1}(1 − β^{−1}u N w^{−s})^{−1}`; those of `L(s, B_𝔥 × μ)` are `(1 − βu N w^{−s})^{−1}(1 − β^{−1}u^{−1}N w^{−s})^{−1}`, a
different Euler factor once `β² ≠ 1` and `u² ≠ 1`. So the inverse `μ_j^{−1}` in the `L`-values of this layer cannot be replaced
by `μ_j`: which of the two occurs is fixed by the Weil data of 5.2 and the labelling above.

### 5.1 Row spaces

*Definition.* For `0 ≤ j ≤ m` let `𝒟^{(j)} = ⊗_{τ∈Φ} 𝒟^{(j)}_τ` be the discrete series of
`U(Y_j)(F_τ)` (signature of ThetaChainsOnDefiniteUnitaryGroups §2.2) whose Harish-Chandra parameter at `τ` is the row parameter of `Y_j` of ThetaChainsOnDefiniteUnitaryGroups §2.3: the
entries `v_i(τ)` (`0 ≤ i ≤ k − 2`), the entries `−e′_i(τ)` (`0 ≤ i ≤ m − 1`) and, for each `1 ≤ i ≤ j`, the `t` entries
of `S(−w_i(τ), t)`, all shifted by `−½` when `j` is odd (`−½` is the exponent at `τ` of `η̃^{−1}`, `η̃_τ(z) = z/|z| = (z/z̄)^{1/2}` (ThetaChainsOnDefiniteUnitaryGroups §2.4(b)), the
splitting character of the member of odd rank divided by that of the other, and the twist of the family of an odd stage,
5.2 (3); ThetaChainsOnDefiniteUnitaryGroups §2.2a (d), ThetaChainsOnDefiniteUnitaryGroups §2.3), assigned
to the positive and the negative block of `U(Y_j)(F_τ)` as follows: every `v_i` and every string entry is positive; `−e′_i` is positive for
`i ≤ j`, and for `i > j` it is positive when `i − j` is even and negative when `i − j` is odd. Let `τ_j` be its lowest
`K_∞`-type. For `j < m` the *row space* of stage `j` is

`𝒞_j := Hom_{(𝔤,K_∞)}(𝒟^{(j)}, 𝒜_cusp(U(Y_j))^{lev})`,

the `(𝔤, K_∞)`-equivariant maps from the Harish-Chandra module of `𝒟^{(j)}` into the cusp forms on
`U(Y_j)(F)\U(Y_j)(𝔸_F)` invariant under the level of the notation above (principal at the type primes, that of ThetaChainsOnDefiniteUnitaryGroups §2.9
elsewhere). The *Petersson product* is `⟨F₁, F₂⟩ := Σ_i ∫_{[U(Y_j)]} conj F₁(e_i)(g)·F₂(e_i)(g) dg` (conjugate-linear in the first variable, as in the
Conventions) over an orthonormal basis `(e_i)` of `τ_j`, for a Haar measure on `U(Y_j)(𝔸)` (that of the conventions for `j = 0`; 5.2 fixes those of the stages of a
tuple). For `j = m` the row space is the space of algebraic forms on the
definite group `U(X^h)` of ThetaChainsOnDefiniteUnitaryGroups §3.1 (principal level at the type primes) with its class-sum product
(read as `(𝔤, K_∞)`-maps into automorphic forms, and as class sums, by AutomorphicFormsOnReductiveGroups §7.5).

Prove:
1. `𝒞_j` is finite-dimensional, and every `F(v)`, `v ∈ 𝒟^{(j)}`, is rapidly decreasing on a Siegel set.
2. *One metric.* The Petersson product is positive definite and independent of the basis, and
   `⟨F, F⟩ = dim τ_j · ∫_{[U(Y_j)]} |F(v)(g)|² dg` for every unit vector `v ∈ τ_j`.
3. *Hecke theory.* The spherical Hecke algebras at the places `v ∉ S(ξ)` act on `𝒞_j` by commuting normal operators
   (the adjoint of the double coset of `g` is that of `g^{−1}`), commuting with the action of `G₀`; `𝒞_j` is the
   orthogonal sum of its eigen-parts; every occurring eigensystem has a family as above (rank `n_j`), whose parameters
   satisfy `N w^{−(n_j−1)/2} ≤ |β| ≤ N w^{(n_j−1)/2}`.

*Route.* (1) Harish-Chandra's finiteness theorem for cusp forms with given `K_∞`-type and infinitesimal character, and
the rapid decay of cusp forms (ArithmeticLocallySymmetricSpaces ALS.F.6 (i), finiteness, and (iii), rapid decay;
AutomorphicSpectralTheory §4.5 for the discrete spectrum).
(2) `(v, v′) ↦ ∫ conj F(v)·F(v′)` is a `K_∞`-invariant Hermitian form on the irreducible
`τ_j`, hence a multiple of its inner product (Schur's lemma); taking traces gives the factor `dim τ_j`. (3) The local
spherical Hecke algebras are commutative (Satake) and act at places prime to the type primes, the adjoint formula is
unimodularity, and the bound on the Satake parameters is the trivial bound for unitary unramified representations
(LocalFactorsOfTwistsAndTypes §7.2 (i) at the split places, (ii) at the inert places; the lower bound is the
upper bound at the conjugate place, resp. the inversion symmetry of the base-change parameter); this is the bound used
by every Euler product of this layer.

*Checks.*
- When `dim τ_j > 1`, a definition of the product by `∫ F(v) conj F′(v)` for one fixed unit vector `v` differs
  from the one above by the factor `dim τ_j`; the Rallis identities of 5.5–5.7 are stated for the product above, so the
  two must not be mixed.
- The number of negative entries of `𝒟^{(j)}_τ` is the number of `i ∈ (j, m − 1]` with `i − j` odd, `⌊(m − j)/2⌋`, the
  number of negative directions of `Y_j` (ThetaChainsOnDefiniteUnitaryGroups §2.2). For `j = 0` the pattern on `−e′` is `+, −, +, −, …`; for `j = m` every
  entry is positive and `𝒟^{(m)}` is finite-dimensional, as `U(X^h)` is compact at infinity.
- From stage `j` to stage `j + 1` the `t` entries of `S(−w_{j+1}(τ), t)` are inserted, with sign `+`, between `−e′_j(τ)` and
  `−e′_{j+1}(τ)` (by (W1) of ThetaChainsOnDefiniteUnitaryGroups §2.3), and exactly the entries below the inserted string, `−e′_i` with `i > j`, change sign.
- Harish-Chandra parameters of `U(n)` lie in `((n − 1)/2 + ℤ)^n`; `dim Y_j = r + jt` is even exactly when `j` is odd, and the
  entries `v_i`, `−e′_i` and the string entries are integers (`t` odd), so a shift is needed exactly for odd `j`. Its sign
  is that of the Weil data: one step of 5.2 shifts the old entries by `(m^Φ(χ_{Y_{j−1}}) − m^Φ(χ_{Y_j}))/2` and adds
  `S(m^Φ(χ_{Y_{j−1}})/2, t)` (`m^Φ` the exponent at `τ` of a splitting character, in `(z/z̄)^{m^Φ/2}`), which for the characters
  `μ_jη̃^{−1}` (odd rank) and `μ_j` (even rank) is `(P + ½) ∪ S(−w_j, t)` for `j` even and `(P ∪ S(−w_j, t)) − ½` for `j` odd.

*KNOWN* (Harish-Chandra; Godement; Casselman–Wallach). *Needs:* ThetaChainsOnDefiniteUnitaryGroups §2.2, ThetaChainsOnDefiniteUnitaryGroups §2.3, ThetaChainsOnDefiniteUnitaryGroups §2.4, ThetaChainsOnDefiniteUnitaryGroups §2.9, ThetaChainsOnDefiniteUnitaryGroups §2.9a; AutomorphicFormsOnReductiveGroups
§§2.2, 2.4, 4.2, 7.5; ArithmeticLocallySymmetricSpaces ALS.F.6 (i), (iii); AutomorphicSpectralTheory §4.5;
SmoothRepresentationsOfLocalGroups §§SR.4.1, SR.4.3, SR.4.4; LocalFactorsOfTwistsAndTypes §7.2.

### 5.2 The row step, its descent and its up-lift

*Definition.* For `1 ≤ j ≤ m` and a tuple `ξ`, the *row step* `j` is the homomorphism pair of
`(Y_{j−1}, Y_j)` in the normal form of ThetaChainsOnDefiniteUnitaryGroups §2.2a (skew element `δ_T`; ThetaLiftsForDefiniteUnitaryGroups §§0.1, 2.5 with `δ′ = δ_T`): the
symplectic space `Hom_E(Y_{j−1}, Y_j)` (restricted to `F`), on which `(g, h) ∈ U(Y_{j−1}) × U(Y_j)` acts by `(g, h)x = hxg^{−1}`,
with the alternating form `Tr_{E/F}(δ_T·tr(x^†y))`, the standard additive character, the global Weil representation of
ThetaKernelsForUnitaryDualPairs §4.4a, and the splitting characters `μ_j(ξ)·η̃^{−1}` for the member of odd rank and `μ_j(ξ)` for
the member of even rank (the rule `χ_V|_{𝔸_F^×} = η_{E/F}^{dim V}` of MetaplecticAutomorphicForms §3.3); `θ_j` denotes its theta
kernel for the Schwartz datum below. Its complex conjugate (the conjugate datum of ThetaChainsOnDefiniteUnitaryGroups §2.2a (b)) is the Weil representation of the same space for the
form `Tr_{E/F}(δ_Y·tr(x^†y))`, `δ_Y := −δ_T = 1/√−d` (the *skew element of the row descent*; `Im τ(δ_Y) < 0` for `τ ∈ Φ`), and the
splitting characters `μ_j(ξ)^{−1}η̃` and `μ_j(ξ)^{−1}`; its kernel at a vector `ψ` is `θ̄_j(g, h; ψ) := conj θ_j(g, h; conj ψ)` (ThetaChainsOnDefiniteUnitaryGroups §2.2a (b),
(c)). The Schwartz datum is the lattice vector of the
self-dual lattices outside `S(ξ)`, the test vector `Φ^Q_{j,v}` of ThetaChainsOnDefiniteUnitaryGroups §2.9c at the places below `Q(ξ)`, at the infinite places a
Fock polynomial `P` (ThetaKernelsForUnitaryDualPairs §3.45), and at a place `v | g₀g₁` the *principal-level vector* `Φ^{pr}_{j,v}` of
ThetaChainsOnDefiniteUnitaryGroups §2.9a (in the model on `Hom(Y_{j−1,v}, Y_{j,v}) ≅ M_{n_j×n_{j−1}}(ℚ_{g_v})` of the split place, `n_j = r + jt`, it is supported on the
maps whose upper square block lies in `K^{pr}_{j−1}(v)` and whose lower `t × n_{j−1}` block is `≡ 0 (mod g_v)`, hence on injective
maps); the finite test vectors of ThetaChainsOnDefiniteUnitaryGroups §2.9a, ThetaChainsOnDefiniteUnitaryGroups §2.9c are vectors of the conjugate datum. Write `φ_j` for the finite part of the datum. *Measures.* Fix Haar measures `dg_j` on
`U(Y_j)(𝔸)` and `d_fk_j` on `U(Y_j)(𝔸_f)`, `1 ≤ j ≤ m`, common to all tuples, and constants `𝔪_j > 0`; `vol_f` is the volume for
`d_fk_j`, and `K^{pr}_j(ξ)`, `K^{rt}_j(ξ)` are the finite level groups of `ξ` at stage `j` of principal and of row type level of
ThetaChainsOnDefiniteUnitaryGroups §2.9, so `vol_f(K^{rt}_j(ξ)) = |P_1|·vol_f(K^{pr}_j(ξ))`. The theta integrals and the Petersson products of `𝒞_j(ξ)` are taken for
the measure `dg_j/(𝔪_j·vol_f(K^{pr}_j(ξ)))`. At the top stage `dg_m = dg_{m,∞} ⊗ d_fk_m` and `𝔪_m := vol(U(X^h)(F_∞))` for
`dg_{m,∞}`: with this choice the Petersson product of 5.1 on `𝒞_m(ξ)` is the class-sum product (for an algebraic form `F`
Schur orthogonality on the compact `U(X^h)(F_∞)` gives `Σ_i∫_{[U(X^h)]}|F(e_i)|²dg_m = vol(U(X^h)(F_∞))·vol_f(K)·Σ_x‖F(x)‖²/|Γ_x|`
over the classes `x`, `Γ_x` their finite stabilisers), and the adjoint identity of (2) holds at `j = m` for the class-sum
product. (For `j < m` both sides of (2) scale by `(𝔪_{j−1}𝔪_j)^{−1}`, so any `𝔪_j` will do; at `j = m` the class-sum product
does not scale with `𝔪_m`, so `𝔪_m` must be this one.) *Archimedean intertwiners.* At each `τ ∈ Φ`, `I^∞_{j,τ}` is a nonzero intertwiner
from (the complex conjugate of the Fock space of the step) ⊗ (the Harish-Chandra module of `𝒟^{(j)}_τ`) to that of `𝒟^{(j−1)}_τ`
for the action of `U(Y_{j−1})(F_τ)`, factoring through the `U(Y_j)(F_τ)`-coinvariants, and `I^∞_j = ⊗_τ I^∞_{j,τ}`; by
ThetaKernelsForUnitaryDualPairs §3.46a (e) these intertwiners form a line at each `τ`, and they are nonzero on the joint
harmonic `Φ` of ThetaKernelsForUnitaryDualPairs §3.46a (d), so `I^∞_j` is unique up to a scalar, fixed once and for all. The *descent* `io_j(ξ)F ∈ 𝒞_{j−1}(ξ)` of
`F ∈ 𝒞_j(ξ)` is the row form with

`(io_j(ξ)F)(I^∞_j(conj P ⊗ v))(g) = ∫_{[U(Y_j)]} θ̄_j(g, h; conj P ⊗ φ_j)·F(v)(h) dh = ∫_{[U(Y_j)]} conj θ_j(g, h; P ⊗ conj φ_j)·F(v)(h) dh`
for all Fock polynomials `P` and `v ∈ 𝒟^{(j)}` (the finite vectors `φ_j`, vectors of the conjugate datum, enter `θ_j` conjugated; with
`φ_j` itself in place of `conj φ_j` the level condition of stage `j − 1` fails at a twist place: there `ω̄(g, 1)Φ^Q = Φ^Q` on the source
stabiliser while `ω̄(g, 1)conj Φ^Q = c_v(det g)²·conj Φ^Q`)

(by (1) the right side is of this form); equivalently, `io_j(ξ)` is the theta integral for the complex conjugate Weil
representation, with the skew element `δ_Y` and the splitting characters `μ_j(ξ)^{−1}η̃`, `μ_j(ξ)^{−1}`. The *up-lift* of
`u ∈ 𝒞_{j−1}(ξ)` is the theta integral `Θ_ju(h) := ∫_{[U(Y_{j−1})]} θ_j(g, h; P ⊗ φ_j)·u(v′)(g) dg`, read through the
`U(Y_{j−1})(F_τ)`-coinvariants of (Fock space) ⊗ `𝒟^{(j−1)}_τ` (ThetaKernelsForUnitaryDualPairs §3.46a (b), (e)) by the intertwiner
`I^{∞,∗}_j` from (Fock space) ⊗ `𝒟^{(j−1)}` to `𝒟^{(j)}` adjoint to `I^∞_j`: `⟨v, I^{∞,∗}_j(P ⊗ v′)⟩ = ⟨I^∞_j(conj P ⊗ v), v′⟩` for the
invariant inner products of the Fock model and of the discrete series (so `(Θ_ju)(I^{∞,∗}_j(P ⊗ v′))(h)` is the integral above).

For a family `B` of rank `r` and `0 ≤ i ≤ m` put

`B^{(i)}(w) := η̃(ϖ_w)^{−ε_i}·( B(w) ∪ ⋃_{a=1}^{i} { μ_a(ξ)(ϖ_w)·N w^{(t−1)/2 − l} : 0 ≤ l < t } )`,  `ε_i = 1` for `i` odd, `0` for `i` even.

Prove:
1. *Descent.* The theta integral converges absolutely for every `F ∈ 𝒞_j(ξ)` and is a row form of stage `j − 1`: a cusp form
   with archimedean component `𝒟^{(j−1)}` and the level of 5.1; so `io_j(ξ) : 𝒞_j(ξ) → 𝒞_{j−1}(ξ)` is defined, and it is
   `G₀`-equivariant.
2. *Adjoint.* For `u ∈ 𝒞_{j−1}(ξ)`, every Fock polynomial `P` and every `K_∞`-finite `v′`, the theta integral `Θ_ju` converges
   absolutely and is a cusp form on `U(Y_j)` with archimedean component `𝒟^{(j)}` and the level of 5.1; so `Θ_ju ∈ 𝒞_j(ξ)`, and
   for `F ∈ 𝒞_j(ξ)`: `⟨io_jF, u⟩ = ⟨F, Θ_ju⟩` and `io_j(ξ)^*u = Θ_ju`.
3. *Parameters.* `io_j(ξ)` and `Θ_j` commute with the Hecke operators away from `S(ξ)` through the unramified correspondence. If
   `u ∈ 𝒞_0(ξ)` has family `B`, every nonzero `i`-fold up-lift `x = Θ_i ⋯ Θ_1u` has family `B^{(i)}`.

*Route.* (1), (2): rapid decay of cusp forms (ArithmeticLocallySymmetricSpaces ALS.F.6 (iii)) and the growth of the theta
kernel give convergence (MetaplecticAutomorphicForms §5.6).
Both directions are instances of one statement for a pair `(V, W)` and discrete series `(𝒟_V, 𝒟_W)` matched by the
correspondence at every real place (ThetaKernelsForUnitaryDualPairs §5.6a, under its hypotheses (R1)–(R3) at every real
place): the theta integral to `U(V)` of a cusp form on `U(W)` of type `𝒟_W` is a cusp form of type `𝒟_V`; it applies to the
row steps under the gap conditions (W1) and (W3) of ThetaChainsOnDefiniteUnitaryGroups §2.3. *Type:* (R1)–(R3) are the
clauses (a), (e), (c2) of ThetaKernelsForUnitaryDualPairs §3.46a for the descent and (b), (e), (c1) for the up-lift, each
applied to the contragredient of the member that is integrated (the compact-pair statements of
ThetaKernelsForUnitaryDualPairs §3.46 cover only pairs with one compact member, which the row steps are not). The condition
that every entry of the block parameters of the step has absolute value at least `(t + 3)/2` is this roadmap's sufficient
condition for the hypothesis of ThetaKernelsForUnitaryDualPairs §3.46a (c2), that `(t + 1)/2` and `−(t + 1)/2` are not both
entries. ThetaKernelsForUnitaryDualPairs §5.6a is stated for continuous maps from smooth vectors; a `(𝔤, K_∞)`-map from a
discrete series to smooth cusp forms extends uniquely to the smooth vectors, and in this form it applies to the row spaces
of 5.1. *The instance.* Fix a step `1 ≤ j ≤ m` and `τ ∈ Φ`. For an entry `y` of the row parameter of `Y_{j−1}` at `τ`
before its shift (ThetaChainsOnDefiniteUnitaryGroups §2.3) put `x := y + w_j(τ)`. Then `x ∈ ℤ = (t+1)/2 + ℤ` (`t` is odd),
and `|x| ≥ (t+3)/2`: `x > 0` for the entries `v_i`, the nodes `−e′_i` with `i < j` and the strings `S(−w_a, t)`, `a < j`;
`x < 0` for the nodes `−e′_i` with `i ≥ j` ((W1), (W2) and the interlacing). The data of ThetaKernelsForUnitaryDualPairs
§3.46a are: `α` the positive `x` (all of sign `+`), `γ = ∅`, `β` the `w_j − e′_i` with `i ≥ j` and `i − j` odd (sign `+` at
stage `j − 1`), `δ` the `w_j − e′_i` with `i ≥ j` and `i − j` even (sign `−`), each decreasing; the case is (+) at every
step and every `τ`. The parameter of `𝒟^{(j−1)}_τ` is `(α, β | δ)` translated by `−w_j(τ) − ½[j − 1 odd]`, that of
`𝒟^{(j)}_τ` is `(α, σ_t, δ | β)` translated by `−w_j(τ) − ½[j odd]`; this is the rule of 5.1 (the nodes below the inserted
string change sign). *The gap hypothesis (G)* holds by ThetaChainsOnDefiniteUnitaryGroups §2.3, Lemma (h): entries of
different signs at either stage are at least `t + 2N_m³ + 1` apart, the ranks satisfy `n_j < N_m`, so the differences
exceed `n_j³`, and `120·n_{j−1}·min(p, q)^{3/2} ≤ 120·N_m·m² ≤ 2N_m³` because `min(p, q) ≤ m` and `N_m ≥ 8m`. *Cuspidality:* for an isotropic `C ⊂ V` with
`V = C ⊕ V′ ⊕ C^∨`, the constant term along the unipotent radical attached to `C` is a volume times the theta integral of the
same form to `U(V′)` with a restricted Schwartz datum (Rallis's tower property, for lifts of rapidly decreasing cusp forms);
and every theta integral of a form of type `𝒟_W` to a member `V′` of the Witt tower of `V` below `V` vanishes: on Fock data
because the Harish-Chandra module of `𝒟_W` has no nonzero invariant pairing with the Fock module of `(V′, W)` (non-occurrence
below first occurrence, ThetaKernelsForUnitaryDualPairs §3.46a (c)), and on all data by density. For the up-lift apply this to the exchanged pair with the
complex conjugate Weil datum. So `Θ_ju ∈ 𝒞_j(ξ)` without any norm computation, and the adjoint identity is Fubini on
`[U(Y_{j−1})] × [U(Y_j)]`, justified by rapid decay of `F` and `u`, with the adjoint intertwiners `I^∞_j`, `I^{∞,∗}_j` and the measures
fixed above; the level and the
`G₀`-equivariance come from the equivariance of the principal-level vector (an eigenvector of the pairs of lifts of `G₀` to
the flag groups `K^{fl}_{j−1}(v) × K^{fl}_j(v)`, with eigencharacter the ratio of the characters `χ^{fl}`; the conjugate datum
acts on lattice stabilisers by the law of ThetaChainsOnDefiniteUnitaryGroups §2.2a (b), which is the law the characters `χ^{fl}` of ThetaChainsOnDefiniteUnitaryGroups §2.9a require); the
function-level identity uses the discrete-series cover, Harish-Chandra modules and the Casselman–Wallach globalisation.
Summing the principal-level vector over `P_1` against `χ_{P_1}` gives the vector of the row type level (5.4). The
cuspidality of the up-lifts uses neither the Rallis inner product formula nor square-integrability (5.5 is not needed
for (2)). (A support argument does not apply to `Θ_j`: maps with a component along a linear form vanishing can be
injective.) (3) Induction on `i` with the
unramified theta correspondence (ThetaKernelsForUnitaryDualPairs §3.21a): one step multiplies the family by the ratio of the
two splitting characters and adds a string of length `dim Y_j − dim Y_{j−1} = t` centred at the splitting character of the
source.

*Checks.*
- `r` and `t` are odd, so `dim Y_{j−1} = r + (j−1)t ≡ j (mod 2)`: for `j = 1` the character `μ_1(ξ)η̃^{−1}` belongs
  to `Y_0` (odd rank `r`) and `μ_1(ξ)` to `Y_1`. Exchanging them would violate the restriction rule to `𝔸_F^×`, since
  `μ_j` is trivial there and `η̃` restricts to `η_{E/F}`.
- The character attached to `Y_{i+1}` in step `i + 1` (the one that twists the action of `U(Y_i)`) is `μ_{i+1}(ξ)η̃^{−ε_i}`,
  which has the parity of `rank Y_{i+1}`; so `B^{(i)} × (μ_{i+1}(ξ)η̃^{−ε_i})^{−1}` is
  `(B ∪ strings) × μ_{i+1}(ξ)^{−1}`: no power of `η̃` remains in the `L`-function of 5.5.
- *The conjugation is needed.* With the kernel `θ_j` itself in place of `conj θ_j` in the descent, the theta integral of
  every `F ∈ 𝒞_j` vanishes at the real places: the forms of `𝒞_j` have the `K_∞`-type of a Fock type of the step at `τ`
  (`V_{(μ,0^t)+b}`, last `t` entries `n_{j−1}/2 − w_j(τ)`), not the dual of one; the linear integral against `θ_j` would need a
  type whose first `t` entries are equal. A tensor-pair realisation on `Y_{j−1} ⊗_E Y_j` instead negates the old parameters
  at every step, so no two consecutive stages could both carry parameters `(v; −e′; …)`.

*KNOWN* (Howe; Rallis; Kudla; J.-S. Li; A. Paul). *Needs:* 5.1, ThetaChainsOnDefiniteUnitaryGroups §2.2, ThetaChainsOnDefiniteUnitaryGroups §2.2a, ThetaChainsOnDefiniteUnitaryGroups §2.3 (with Lemma (h)), ThetaChainsOnDefiniteUnitaryGroups §2.4, ThetaChainsOnDefiniteUnitaryGroups §2.9, ThetaChainsOnDefiniteUnitaryGroups §2.9a, ThetaChainsOnDefiniteUnitaryGroups §2.9c, ThetaChainsOnDefiniteUnitaryGroups §3.2; MetaplecticAutomorphicForms §§3.3, 5.6, 6.15 and
ThetaKernelsForUnitaryDualPairs §§3.21a, 3.45, 3.46a, 4.4a, 5.6a; EndoscopicTransferAndUnitaryTraceComparison §6.3 and BaseChangeAndGaloisRepresentationsForUnitaryGroups §6.3a;
AutomorphicFormsOnReductiveGroups §§2.1, 2.2, 2.7, 7.5; ArithmeticLocallySymmetricSpaces ALS.F.6 (iii).

### 5.2a Projectors of integrable discrete series

Let `𝐆` be a unimodular second-countable locally compact group, `σ` an irreducible
unitary representation of `𝐆` with a nonzero square-integrable matrix coefficient (formal degree `d(σ)` for a fixed Haar
measure), `w` a unit vector of `σ`, and `e_σ(g) := d(σ)·conj⟨w, σ(g)w⟩`. Assume `e_σ ∈ L¹(𝐆)`. Then for every unitary
representation `(ρ, H)` of `𝐆`, `ρ(e_σ) = ∫_𝐆 e_σ(g)ρ(g) dg` is the orthogonal projection of `H` onto the closure of
`{T(w) : T ∈ Hom_𝐆(σ, ρ)}`; in particular `ρ(e_σ) = 0` if `σ` does not occur discretely in `ρ`, and `e_σ ∗ e_σ = e_σ`,
`e_σ(g^{−1}) = conj e_σ(g)`.

*Route.* Schur orthogonality for square-integrable representations gives `e_σ ∗ e_σ = e_σ` and `e_σ^* = e_σ`, so `ρ(e_σ)` is an
orthogonal projection (bounded, since `e_σ ∈ L¹`); for `T ∈ Hom_𝐆(σ, ρ)`, `ρ(e_σ)T(w) = T(σ(e_σ)w) = T(w)`. Conversely, for `x` in the
range the function of positive type `c(g) = ⟨ρ(g)x, x⟩` (`g ↦ c(g^{−1})` is the positive-type coefficient of
SmoothRepresentationsOfLocalGroupsPartII §0.4) satisfies `c = e_σ ∗ c ∗ e_σ`; by Godement's theorem on integrable
square-integrable representations such a function is a coefficient of a multiple of `σ`, so the cyclic representation
generated by `x` (by SmoothRepresentationsOfLocalGroupsPartII §0.5, the GNS representation of that coefficient) is a
multiple of `σ` and `x` is a limit of sums `Σ T_i(w)`.

*Check.* `𝐆` compact: `e_σ` is `d(σ)` times a coefficient, `ρ(e_σ)` is the projection onto the `w`-line of the `σ`-isotypic
part, and integrability is automatic. For `SL₂(ℝ)` the holomorphic discrete series of weight `2` is square-integrable but
not integrable, and the statement is not claimed there.

*KNOWN* (Godement; Harish-Chandra). *Needs:* Mathlib (Haar measure, Bochner integral); VonNeumannAlgebras Layer 9
(coefficient maps, Schur orthogonality for square-integrable representations, formal degree);
SmoothRepresentationsOfLocalGroupsPartII §§0.4, 0.5 (positive-type coefficients, the GNS construction).

### 5.3 The rows and the target rows

*Notation for the rows.* Put `r_S = m/2 − 1`. By ThetaChainsOnDefiniteUnitaryGroups §2.2, `Y_0 = X_0 ⊥ ⟨z⟩ ⊥ ℍ_1 ⊥ ⋯ ⊥ ℍ_{r_S}`
with `z = z_m`, `⟨z, z⟩ = −T(u_*)`, and `ℍ_a = ⟨e_a, f_a⟩` hyperbolic planes, `⟨e_a, f_b⟩ = δ_{ab}`; for a word `u` put
`z_u := z_{m,u} = (π_u/π_{u_*})z_m` (ThetaChainsOnDefiniteUnitaryGroups §2.8), so `⟨z_u, z_u⟩ = −T(u)` and `X_0 = z_u^⊥ ∩ (X_0 ⊕ ⟨z⟩)` for every word. At a real place `τ` of
`F`, `G_τ := U(Y_0)(F_τ) ≅ U(p, q_S)` with `p = k + r_S`, `q_S = r_S + 1`, and `U(X_0)(F_τ) ≅ U(k)`. `𝒟_τ = 𝒟^{(0)}_τ` (5.1):
its Harish-Chandra parameter is `hc(τ) = (v(τ); −e′(τ))`, with signs `+` on the `k − 1` entries of `v` and alternating
`+, −, +, …` on the `m` entries of `−e′`; `w_τ` is a unit vector of its lowest `K`-type and
`e_𝒟 := ∏_τ d(𝒟_τ)·conj⟨w_τ, 𝒟_τ(·)w_τ⟩` on `U(Y_0)(F_∞)`. `K^♮ ⊂ U(Y_0)(𝔸_f)` is the level of 5.1 for `j = 0` (the
stabiliser of the standard lattice outside `g₀g₁`, `K(g)_v` at `v | g₀g₁`); for a level `(P, χ_P)` at the type primes
(ThetaChainsOnDefiniteUnitaryGroups §2.9), `K_{(P,χ_P)} ⊃ K^♮` is its inverse image in the stabiliser of the standard lattice, with the character `χ_P`, and
`𝟙_{(P,χ_P)} = vol(K_{(P,χ_P)})^{−1}·conj χ_P·1_{K_{(P,χ_P)}}`. For the row type level `(P_1, χ_{P_1}) = (K₂/K(g), χ₂)` of ThetaChainsOnDefiniteUnitaryGroups §2.9 this is
the idempotent `𝟙_{K₂,χ₂}` (of Bessel–Whittaker type at the places above `g₀, g₁`, ThetaChainsOnDefiniteUnitaryGroups §2.9; the base level `(P_0, χ_{P_0})` is the
Gelfand–Graev one).

*Statement.* Assume (W5) of ThetaChainsOnDefiniteUnitaryGroups §2.3 with `h_gap > 16√(2q_S)·r·q_S` and `h_gap > r·p·q_S + 1` (both are contained in `SizeGap` of
ThetaChainsOnDefiniteUnitaryGroups §2.3c).

(i) *Rows.* `R(e_𝒟 ⊗ 𝟙_{K^♮})` is an orthogonal projection of finite rank on `L²(U(Y_0)(F)\U(Y_0)(𝔸))`. Its range `ℋ^♮`
consists of cusp forms, is stable under the Hecke operators away from `g₀g₁` and under `G₀`, and evaluation at
`⊗_τ w_τ` is a bijection from the `K^♮`-invariants of `Hom_{U(Y_0)(F_∞)}(⊗_τ 𝒟_τ, L²)` onto `ℋ^♮`. For every level
`(P, χ_P)`, `ℋ_{(P,χ_P)} := (ℋ^♮)^{(P,χ_P)}` is the range of `R(e_𝒟 ⊗ 𝟙_{(P,χ_P)})`. The *rows of the row type level* are
`ℋ := ℋ_{(P_1,χ_{P_1})}`, the range of `R(e_𝒟 ⊗ 𝟙_{K₂,χ₂})`; put `D_all = dim ℋ` and
`D* = ∏_τ d(𝒟_τ)·vol([U(Y_0)])·vol(K₂)^{−1}`; with the measures of the conventions this is the `D*` of ThetaChainsOnDefiniteUnitaryGroups §2.8.
(ii) *Labels.* Let `v` be a place of `F` above `g_i`, `i ∈ {0, 1}`. Since `g_i` splits completely in `E`,
`U(Y_0)(F_v) ≅ GL_r(ℚ_{g_i})`, and the central idempotents `Π_𝔣` of `ℂ[GL_r(𝔽_{g_i})]` indexed by the labels `𝔣` (monic
polynomials of degree `r` over `𝔽_{g_i}` with `𝔣(0) ≠ 0`; the idempotents of FiniteReductiveGroups
§5.7, labelled form) act on `ℋ^♮` through `G₀` as commuting orthogonal projections with `Σ_𝔣 Π_𝔣 = 1`, commuting with
`G₀`, with the Hecke operators and with every `e_{P,χ_P}`. A *row* is a nonzero vector of `ℋ^♮` lying in `Π_{𝔣_v}ℋ^♮`
for one label `𝔣_v` at each `v | g₀g₁`; its *label tuple at `g_i`* is `(𝔣_v)_{v | g_i}`. `ℋ^♮` and every `ℋ_{(P,χ_P)}` are the
orthogonal sums of their intersections with the spaces `∏_{v|g₀g₁} Π_{𝔣_v}·ℋ^♮`, so they have orthonormal bases of rows.
The *label* of an irreducible admissible representation `π_v` of `GL_r(F_v)` with nonzero `K(g)_v`-fixed vectors is
that of FiniteReductiveGroups §6.3 (the label of the Harish-Chandra series of `GL_r(𝔽_{g_i})`
carrying `π_v^{K(g)_v}`); rows are defined through the `Π_𝔣`, not through Hecke eigenforms, which need not generate
irreducible representations.
(iii) *Goodness.* For `v | g_i` let `χ_{v,1}, …, χ_{v,m}` be the type characters of ThetaChainsOnDefiniteUnitaryGroups §2.4(b) (the level characters of ThetaChainsOnDefiniteUnitaryGroups §2.9),
read in `𝔽̄_{g_i}^×` through the labelled form. A tuple `(𝔣_v)_{v|g_i}` is *good* if (1) every
`𝔣_v` is squarefree; (2) for every prime `ℓ ∉ 𝔅(r, g_i)` (ThetaChainsOnDefiniteUnitaryGroups §2.7), the roots of each `𝔣_v` have pairwise distinct
prime-to-`ℓ` parts; (3) for every prime `ℓ ≠ g_i`, no root of any `𝔣_v` has the prime-to-`ℓ` part of some `χ_{v,j}` or of
some `χ_{v,j}^{−1}`; (4) for every `1 ≤ a ≤ r/2` there is `v | g_i`
such that `𝔣_v` has no monic factor of degree `a` (no set of its irreducible factors has degrees summing to `a`); (5)
some `𝔣_v` has an irreducible factor of prime degree in `(r/2, r − 3]`. Let `Π_good` be the sum of the idempotents
`∏_{v|g₀g₁} Π_{𝔣_v}` over the label tuples whose parts at `g₀` and at `g₁` are good. Put `𝔼^♮ := Π_good·ℋ^♮`,
`𝔼_{(P,χ_P)} := Π_good·ℋ_{(P,χ_P)}` for a level `(P, χ_P)`, `𝔼_b := 𝔼_{(P_b,χ_{P_b})}` for the two levels `b ∈ {0, 1}` of ThetaChainsOnDefiniteUnitaryGroups §2.9, and
the *target rows* `𝔼 := 𝔼_1 = Π_good·ℋ`; `D_rows = dim 𝔼` and `δ_bad = 1 − D_rows/D_all`.
(iv) *Joint cuspidality.* If `(𝔣_v)_{v|g₀}` satisfies (4), then for every `0 < a < r` there is `v | g₀` such that no
representation in the Harish-Chandra series of `𝔣_v` has a nonzero vector fixed by the unipotent radical of the
parabolic subgroup of type `(a, r − a)`; that is, every family of types `(τ_v)_{v|g₀}` with `τ_v` in the
Harish-Chandra series of `𝔣_v` is jointly cuspidal in the sense of BaseChangeAndGaloisRepresentationsForUnitaryGroups §13.8a.
(v) *The good representations and the row type level as finite-group data.* (a) If `𝔣_v` is squarefree, the Harish-Chandra
series of `𝔣_v` consists of one irreducible representation, which is the whole Harish-Chandra induced representation
`R_{L_v}^{GL_r}σ_v` of its cuspidal pair `(L_v, σ_v)` (the blocks of `σ_v` pairwise non-isomorphic) and is generic. Hence every
irreducible representation of `G₀` occurring in the `G₀`-module `𝔼^♮` (which contains every `𝔼_{(P,χ_P)}`) is, at each of the `2f` places `v | g₀g₁`, a whole
induced representation `R_{L_v}^{GL_r}σ_v` of a cuspidal pair, and contains the base level `(P_0, χ_{P_0})` exactly once. (b) At each
`v | g₀g₁`, in the basis `b′_v = (e_1, …, e_{r_S}, β_1, …, β_k, z_m, f_{r_S}, …, f_1)` of ThetaChainsOnDefiniteUnitaryGroups §2.9a numbered `1, …, r`, the row type level
`(P_1, χ_{P_1})` is the pair `(H_i, ϕ_i)` of FiniteReductiveGroups §2.7 (b) for `GL_r(𝔽_{g_v})` with the same `k`,
the position `i = r_S` and the additive character `ψ_g`: `H_{r_S}` is the group of upper unitriangular `u` with `u_{a, r_S+k+1} = 0` for
`r_S < a ≤ r_S + k`, and `ϕ_{r_S}` is `χ₂`. So the multiplicity bounds of FiniteReductiveGroups §2.8 apply
to the level `(P_1, χ_{P_1})` in the representations of (a).

API: `Π_good` is a self-adjoint idempotent, central in `ℂ[G₀]`, commuting with `R(e_𝒟 ⊗ 𝟙_{(P,χ_P)})` for every level and
with the Hecke operators away from `g₀g₁`; `𝔼_{(P,χ_P)}` is the range of `R(e_𝒟 ⊗ 𝟙_{(P,χ_P)} ∗ Π_good)`; for a set `S` of label
tuples at `g_i` write `Π_S = Σ_{t∈S}∏_{v|g_i} Π_{t_v}` (so `dim Π_Sℋ` is the number of rows of an orthonormal row basis of
`ℋ` with tuple in `S`).

*Route.* Under the gap the coefficient of `𝒟_τ` is integrable (DiscreteSeriesCoefficientsAndAutomorphicMetrics §2.4a (d),
whose hypotheses `h > npq + 1` and `h > 16√(2q₀)·n·q₀` are, for `n = r`, `q₀ = q_S`, the two bounds on `h_gap` assumed
above), so `R(e_𝒟)` is the orthogonal projection onto
the `𝒟`-isotypic vectors realised on lowest-`K`-type vectors (5.2a, for `U(Y_0)(F_∞)` and the right regular representation
on `L²`); composing with the level
idempotent gives a projection whose range lies in the discrete spectrum of fixed level, `K`-type and infinitesimal
character, hence is finite dimensional (AutomorphicSpectralTheory 4.5 and DiscreteSeriesCoefficientsAndAutomorphicMetrics §9.1), and is cuspidal because the archimedean
component is tempered (AutomorphicSpectralTheory 4.10). `𝟙_{(P,χ_P)} = 𝟙_{K^♮} ∗ e_{P,χ_P}` through `G₀`. A local component
with `K(g)_v`-fixed vectors has depth zero, and its `K(g)_v`-invariants form one Harish-Chandra series of `GL_r(𝔽_{g_i})`
(FiniteReductiveGroups §6.3); central idempotents of `ℂ[G₀]` commute with `G₀`. (iv) A
representation in the Harish-Chandra series of a cuspidal datum with blocks of sizes `(d_c)` has a nonzero vector fixed
by the unipotent radical of type `(a, r − a)` only if its Harish-Chandra restriction to `GL_a × GL_{r−a}` is nonzero,
which forces `a = Σ_{c∈J} d_c` for a set `J` of blocks (FiniteReductiveGroups §1.2); for the series
of `𝔣_v` the block sizes are the degrees of the irreducible factors (FiniteReductiveGroups §5.7); for `a ≤ r/2` use (4), for `a > r/2`
apply (4) to `r − a`, since subset sums are closed under complements. (v) (a) A squarefree label has every multiplicity
`m(O) = 1`, so its series has exactly one character, which is generic (FiniteReductiveGroups §5.7), and
`W(L_v, σ_v) = ∏_OS_{m(O)}` is trivial (FiniteReductiveGroups §1.4), so `End(R_{L_v}^{GL_r}σ_v)` is one-dimensional (FiniteReductiveGroups §1.3): the induced
representation is irreducible and is that character; a generic representation contains the Gelfand–Graev pair once
(FiniteReductiveGroups §2.2). Goodness (1) makes every `𝔣_v` squarefree. (b) Compare the definitions: `K₂(v)/K(g)_v` consists of the elements
unipotent modulo `g` for the flag `(e, z_m, β)` of the Bessel subgroup, which in the basis `b′_v` are the upper unitriangular
matrices whose entries `(β_a, z_m)` vanish, and `χ₂ = χ_N·χ_L` is `ψ_g` of the `2r_S` entries of the chain
`e_1 → ⋯ → e_{r_S} → z_m → f_{r_S} → ⋯ → f_1` plus the `k − 1` superdiagonal entries of the block, which is `ϕ_{r_S}` (ThetaChainsOnDefiniteUnitaryGroups §2.9). The rest
is linear algebra.

*Needs:* ThetaChainsOnDefiniteUnitaryGroups §2.2, ThetaChainsOnDefiniteUnitaryGroups §2.3, ThetaChainsOnDefiniteUnitaryGroups §2.3c, ThetaChainsOnDefiniteUnitaryGroups §2.4, ThetaChainsOnDefiniteUnitaryGroups §2.7, ThetaChainsOnDefiniteUnitaryGroups §2.8, ThetaChainsOnDefiniteUnitaryGroups §2.9, ThetaChainsOnDefiniteUnitaryGroups §2.9a, 5.1, 5.2a; AutomorphicSpectralTheory 4.5, 4.10 and DiscreteSeriesCoefficientsAndAutomorphicMetrics §9.1; AutomorphicFormsOnReductiveGroups
§2.4 (discrete series); DiscreteSeriesCoefficientsAndAutomorphicMetrics §2.4a (d) (integrability of the lowest-`K`-type
coefficients of gapped discrete series); BaseChangeAndGaloisRepresentationsForUnitaryGroups §13.8a (joint cuspidality);
FiniteReductiveGroups §§1.2, 1.3, 1.4, 2.2, 2.7, 5.7, 6.3. *KNOWN* (Harish-Chandra; Godement; Wallach) for `ℋ^♮`;
*NEW* (labels of rows, goodness, `𝔼`).

*Checks.*
- Condition (4) concerns all factors, not only irreducible ones: for `r = 15`, labels of factor type `(1, 3, 11)` at
  some places above `g_i` and `(2, 2, 11)` (two distinct quadratics) at the others have, for every `a ≤ 7`, a place
  without an irreducible factor of degree `a`, and satisfy (5) (`11 ∈ (7.5, 12]`); but `4 = 1 + 3 = 2 + 2` is a sum of
  factor degrees at every place, so (4) fails, the tuple is not good, and every type has vectors fixed by the unipotent
  radical of type `(4, 11)`.
- Condition (5) asks for a prime in `(r/2, r − 3]`; for `r = 7` the interval `(3.5, 4]` contains none, so no tuple is
  good and `𝔼^♮ = 0`. For `r ≥ 8` the interval contains a prime (Bertrand), and in the chain `r = k + m − 1` is large.
- A row whose local component at some `v | g₀` is an unramified twist of the Steinberg representation has label
  `(X − a)^r`, which is not squarefree: the row is not good although its local component is generic. Goodness is a
  condition on labels, not on genericity.

### 5.4 The row descent

*Definitions.* Fix a tuple `ξ`.
- *The identity at the row type level.* Let `φ^{(1)}_j` be the Schwartz datum of 5.2 with, at the places above `g₀g₁`, the
  vector `Φ^{rt}_{j,v}` of the row type level `(P_1, χ_{P_1})` of ThetaChainsOnDefiniteUnitaryGroups §2.9a (the sum over `P_1` of the translates of the principal-level
  vector, weighted by `χ_{P_1}`), and `c_I(j)(ξ) := 𝔪_j·vol_f(K^{rt}_j(ξ))`. Then for every `F` in the level-`(P_1, χ_{P_1})` part of `𝒞_j(ξ)`:
  `∫_{[U(Y_j)]} conj θ_j(g, h; P ⊗ conj φ^{(1)}_j)·F(v)(h) dg_j(h) = c_I(j)(ξ)·(io_j F)(I^∞_j(conj P ⊗ v))(g)`, and `c_I(j)(ξ)·idx_ξ(j) = c_I(j)(1)`, `idx_ξ(j) := ∏_v idx_v(j)`, the product over the places `v` of `F` below `Q(ξ)`
  (one factor for each conjugate pair of places of `Q(ξ)`), the index of the level group of `ξ` at these places (ThetaChainsOnDefiniteUnitaryGroups §2.9c) in
  that of the base tuple.
- *Forms on `U(X^h)`.* `𝒰^♮_ξ`: the algebraic forms on `U(X^h)` of the weight of ThetaChainsOnDefiniteUnitaryGroups §3.1 and of principal level at the type
  primes (ThetaChainsOnDefiniteUnitaryGroups §2.9, stage `m`; the level of ThetaChainsOnDefiniteUnitaryGroups §2.9 for `ξ` at the other places), with its `𝕃`-structure, its class-sum product and
  the action of `G₀`; `M̃_ξ ⊂ 𝒰^♮_ξ` the integral forms of the row side: the forms with values in the dual Weyl lattices
  `∇_ℤ` in the coordinates of the class lattices (`ℳ^{∨}` of ThetaChainsOnDefiniteUnitaryGroups §3.1 for `X^h`; the column side uses the Weyl lattices `Δ_ℤ`).
- *Rows.* The level of `𝒞_0` is `K^♮` for every tuple: a tuple changes the Weil data of the steps and the levels of the
  upper stages at `Q(ξ)`, not the level of `U(Y_0)` (ThetaChainsOnDefiniteUnitaryGroups §2.9, API: at `j = 0` the parahoric of a twist place is the
  hyperspecial stabiliser), so `𝒞_0(ξ) = 𝒞_0`. Evaluation at the unit vector `⊗_τ w_τ` of the lowest `K_∞`-type
  identifies `𝒞_0` with `ℋ^♮` (5.3), `G₀`-equivariantly, the product of 5.1 being `dim τ_0` times the `L²` product.
- *The descent.* `D_ξ := io_1(ξ) ∘ ⋯ ∘ io_m(ξ) : 𝒰^♮_ξ ⊗ ℂ → ℋ^♮`, `ι_ξ := Π_good ∘ D_ξ : 𝒰^♮_ξ ⊗ ℂ → 𝔼^♮`, and `D_ξ^*`, `ι_ξ^*`
  their adjoints (the `m`-fold up-lifts, 5.2 (2)).
- *The relevant part.* For a level `(P, χ_P)` at the type primes, `𝒰^{(P,χ_P)}_ξ := Π_good·e_{P,χ_P}·𝒰^♮_ξ`, `Π_good` acting through
  `G₀` (5.3: the same set of good types for every tuple); the *relevant part* `ℋ^{rt}_ξ := 𝒰^{(P_1,χ_{P_1})}_ξ` and
  `𝒰^{(0)}_ξ := 𝒰^{(P_0,χ_{P_0})}_ξ`.
- `Q_ξ := ℋ^{rt}_ξ ∩ (ℋ^{rt}_ξ ∩ ker ι_ξ)^⊥`, and the *section* `sec : 𝔼 → Q_1` (base tuple): `sec(x) := (ι_1|_{Q_1})^{−1}(pr x)`, `pr`
  the orthogonal projection onto `ι_1(Q_1)`. The same definitions with `(P_0, χ_{P_0})` give `Q^{(0)}_ξ` and `sec^{(0)} : 𝔼_0 → Q^{(0)}_1`,
  and with any level `(P, χ_P)` give `Q^{(P,χ_P)}_ξ`: no second chain of descents is needed, since `D_ξ` is defined at principal
  level.

*Lemma.* (i) `D_ξ` and `ι_ξ` commute with the action of `G₀` and with the Hecke operators away from `S(ξ)`. (ii) For
every level `(P, χ_P)`: `D_ξ(𝒰^{(P,χ_P)}_ξ) ⊂ 𝔼_{(P,χ_P)}` and `D_ξΥ = ι_ξΥ` for `Υ ∈ 𝒰^{(P,χ_P)}_ξ`; `ι_ξ^*(𝔼_{(P,χ_P)}) ⊂ 𝒰^{(P,χ_P)}_ξ`, and
`Q^{(P,χ_P)}_ξ = ι_ξ^*(𝔼_{(P,χ_P)})`; in particular `D_ξ(ℋ^{rt}_ξ) ⊂ 𝔼`, `ι_ξ^*(𝔼) ⊂ ℋ^{rt}_ξ` and `Q_ξ = ι_ξ^*(𝔼)`. (iii) `ι_ξ` is injective on
every `Q^{(P,χ_P)}_ξ`; `sec∘ι_1 = id` on `Q_1` and `ι_1∘sec = pr`. Every statement of 5.5–5.12 about `𝔼^♮` holds for each
`𝔼_{(P,χ_P)}`, in particular for `𝔼_0` and `𝔼 = 𝔼_1`, by restriction.

*Route.* The identity at the row type level: on a form of level `(P_1, χ_{P_1})` the `|P_1|` translates of the
principal-level vector contribute equally, and `vol_f(K^{rt}_j(ξ)) = |P_1|·vol_f(K^{pr}_j(ξ))`; the level group of `ξ` has
index `idx_ξ(j)` in that of the base tuple. (i) Every `g₀ ∈ G₀` lifts to the flag group of every stage (ThetaChainsOnDefiniteUnitaryGroups §2.9); the
Schwartz vector of the step `(Y_{j−1}, Y_j)` is an eigenvector of the pair of lifts, with the ratio of the stage
characters as eigenvalue, and the Haar measures are invariant under the lifts; so the theta integral of `g₀·F` is `g₀`
applied to the theta integral of `F`, and the descent of a form is determined by its theta integrals because a
`(𝔤, K)`-map from an irreducible module into cusp forms that vanishes at one nonzero vector is zero. (ii) `Π_good` and
`e_{P,χ_P}` are self-adjoint elements of `ℂ[G₀]`, acting unitarily on both sides; apply (i). (iii) Linear algebra:
`ι_ξ^*(𝔼_{(P,χ_P)})` is the orthogonal complement of `𝒰^{(P,χ_P)}_ξ ∩ ker ι_ξ` in `𝒰^{(P,χ_P)}_ξ`.

*NEW* (objects; elementary API). *Needs:* 5.1, 5.2, 5.3, ThetaChainsOnDefiniteUnitaryGroups §3.1, ThetaChainsOnDefiniteUnitaryGroups §2.9, ThetaChainsOnDefiniteUnitaryGroups §2.9a, ThetaChainsOnDefiniteUnitaryGroups §2.9c; AutomorphicFormsOnReductiveGroups §7.4.

### 5.5 The inner product of the up-lifts of a row step

Let `ξ` be a tuple, `𝔥` a Hecke eigensystem away from `S(ξ)` and `0 ≤ i < m`; let
`𝒞_i^c(ξ) ⊂ 𝒞_i(ξ)` be the span of the `i`-fold up-lifts of `ℋ^♮[𝔥]` (for `i = 0`, `ℋ^♮[𝔥]` itself; no goodness is used).
Assume: Weil's condition for `Y_{i+1}` (its Witt index `⌊(m−i−1)/2⌋` is `< t`, which (R2) gives); the Weil data unramified off `S(ξ)`
(lattice vectors of the self-dual lattices, `μ_{i+1}(ξ)` and `η̃` unramified there); every place of `F` above `2` split
in `E` (this holds when `2` splits in `K`, as for the hosts of FrobeniusRestrictedRieszSums §0.9, because `E = FK`); and the gap conditions (W1), (W3) of ThetaChainsOnDefiniteUnitaryGroups §2.3.
At the real places the Fock datum of 5.2 is the joint harmonic `P = ⊗_τP_τ` of the step, and the forms are evaluated at
`v = ⊗_τw_τ`, `w_τ` a unit highest-weight vector of the lowest `K_∞`-type of `𝒟^{(i)}_τ`.

*Lemma (doubling integrability).* Let `H(g) ∈ (0, 1]` be the height of `(g, 1)` in the doubled group of `Y_i` (for the Siegel
parabolic of the diagonal and the maximal compact subgroup given by the lattice stabilisers and a Cartan involution
commuting with that of `U(Y_i) × U(Y_i)`), `H_∞` its archimedean factor, `G^S_int` the set of `g ∈ U(Y_i)(𝔸)` lying in the
lattice stabiliser at every place outside `S(ξ)`, and for `u₁, u₂ ∈ 𝒞_i^c(ξ)`

`I_s(g) := ⟨ω(g, 1)(P ⊗ φ_{i+1}), P ⊗ φ_{i+1}⟩·H(g)^{s−t/2}·⟨R(g)u₁(v), u₂(v)⟩`.

Then: (a) there is a real `s_∞ < t/2` such that `z_∞(g) := ⟨ω_∞(g)P, P⟩·conj∏_τ⟨w_τ, 𝒟^{(i)}_τ(g_τ)w_τ⟩` satisfies
`z_∞·H_∞^{s−t/2} ∈ L¹(U(Y_i)(F_∞))` for every real `s ≥ s_∞`, and `∫z_∞ ≠ 0`; (b) `I_s ∈ L¹(G^S_int)` for every real
`s > t/2 − 1` with `s ≥ s_∞`; (c) for the Haar measure of `U(Y_i)(𝔸)` giving
the level group `K^{pr}_i(ξ)` volume `1`, `∫_{G^S_int}I_{t/2} = κ_i·∏_v‖Φ^Q_{i+1,v}‖²·loc_v(ξ)·(∫z_∞)·conj⟨u₁, u₂⟩`, the product over
the places `v` of `F` below `Q(ξ)`, where `κ_i > 0` depends on `i`, the measures and the vectors at the type primes but not on
`ξ`, `Φ^Q_{i+1,v}` is the test vector of ThetaChainsOnDefiniteUnitaryGroups §2.9c, and, with `w = w_v` of ThetaChainsOnDefiniteUnitaryGroups §2.9c and `c_a(w)` the value at `ϖ_w` of `μ_a(ξ)μ_{i+1}(ξ)^{−1}`,
`loc_v(ξ) := ∏_{a≤i}∏_{n=1}^{t}((1 − c_a(w)N w^{−n})(1 − c_a(w)^{−1}N w^{−n}))^{−1}·∏_{n=t+1}^{(i+1)t}(1 − N w^{−n})`.

*Statement.* There are constants `𝔫_1, …, 𝔫_m ≠ 0`, depending on the ranks, the archimedean data and the measures and
normalisations of 5.2, but neither on `𝔥` nor on `ξ`, such that for `u₁, u₂ ∈ 𝒞_i^c(ξ)` (with `io_{i+1}^*u = Θ_{i+1}u`, 5.2 (2))

`⟨io_{i+1}^* u₁, io_{i+1}^* u₂⟩ = 𝔫_{i+1} · L^{S(ξ)}((t+1)/2, B_𝔥 × μ_{i+1}(ξ)^{−1}) · ⟨u₁, u₂⟩`,

the left side for `i = m − 1` being the product of `𝒰^♮_ξ`; the `L`-value is the value at `s = t/2` of
`s ↦ L^{S(ξ)}(s + ½, B_𝔥 × μ_{i+1}(ξ)^{−1})`, an absolutely convergent Euler product because `t > r`.

*Route.* The doubling seesaw writes the inner product of two theta integrals `Θ_{i+1}u₁`, `Θ_{i+1}u₂` as the doubling integral of
the theta integral of `(U(Y_i)^□, U(Y_{i+1}))`, which converges by Weil's criterion (MetaplecticAutomorphicForms §5.7 for
the split doubled space of rank `2n_i`, whose condition is Weil's condition above). The Rallis inner product formula is used in
the form with the `L`-value by continuation (ThetaKernelsForUnitaryDualPairs §6.13a (ii) for the linear lift, in the form of ThetaKernelsForUnitaryDualPairs
§6.13b (iii), with ThetaKernelsForUnitaryDualPairs §6.4a): if `I_{s₁} ∈ L¹(G^S_int)`
for one real `s₁ < t/2`, then `⟨Θu₁, Θu₂⟩ = vol([U(Y_{i+1})])·(L^{S(ξ)}(s + ½, B_𝔥^{(i)} × (μ_{i+1}(ξ)η̃^{−ε_i})^{−1})/d^{S(ξ)}(s))|_{s=t/2}·∫_{G^S_int}I_{t/2}`,
the `L`-value by continuation (in the normalisation of the pair on `Hom`: the family twisted by the inverse of the
splitting character attached to the target, the normalisation this roadmap keeps throughout), `d^{S(ξ)}` the normalising
factor of the doubled group of `Y_i`; the hypothesis serves only to
continue `s ↦ ∫_{G^S_int}I_s` (holomorphic on `Re s > s₁` because `0 < H ≤ 1`, ThetaKernelsForUnitaryDualPairs §6.13b (ii)) from the half-plane where the Euler
product identity holds to `t/2`. The unramified doubling integral at the places off `S(ξ)` is that of MetaplecticAutomorphicForms
§6.10a and ThetaKernelsForUnitaryDualPairs §6.11 (b), (c) (every residue characteristic, absolutely convergent for a bounded
spherical coefficient); the
places above `2` split, so no dyadic inert place occurs. The Lemma gives the hypothesis with any `s₁` such that
`max(s_∞, t/2 − 1) < s₁ < t/2`.
*Proof of the Lemma.* *Real places:* the Weil coefficient restricted to `(g, 1)` is a `K`-finite section of the degenerate
principal series at `s₀ = t/2` of the doubled group, hence bounded by `C·H_∞^{n_{i+1}/2}` (ThetaKernelsForUnitaryDualPairs §6.13b (i) (c)); the lowest-`K_∞`-type
coefficient of `𝒟^{(i)}_τ` is integrable (DiscreteSeriesCoefficientsAndAutomorphicMetrics §2.4a (d), under its hypotheses
`h > n_ip_iq_i + 1` and `h > 16√(2q₀)·n_i·q₀`, `q₀ = min(p_i, q_i)`, on the gap `h` between entries of different signs. They
hold: `h ≥ t + 2N_m³ + 1` (ThetaChainsOnDefiniteUnitaryGroups §2.3, Lemma (h)), `n_i < N_m`, `p_iq_i ≤ n_i²/4`, `q₀ ≤ m/2`
and `N_m > 3m²`, so `n_ip_iq_i + 1 < 2N_m³` and `16√(2q₀)·n_i·q₀ ≤ 16·N_m·m^{3/2} < 2N_m³`); `0 < H_∞ ≤ 1` and `n_{i+1} = n_i + t` give `|z_∞H_∞^{s−t/2}| ≤ C·|coefficient|` for
`s ≥ −n_i/2`, which is (a) with `s_∞ = −n_i/2` (this value is this roadmap's estimate: the formal proof gives only the
existence of `s_∞`); `∫z_∞` is a product over `τ` of local zeta integrals, each positive (ThetaKernelsForUnitaryDualPairs
§3.46a (d)). *Type primes:* the Weil coefficient of the principal-level vector vanishes unless the component of `g` lies in
the level group (its support and its translate are disjoint otherwise, ThetaKernelsForUnitaryDualPairs §6.13b (v): the upper square block
of the principal-level vector lies in one coset of the level group, 5.2), where the level characters of the vector
and of the forms cancel and `H = 1`; with Schur's lemma for the Petersson product (5.1 (2)), `I_s(bκ)` is a constant times
`conj⟨u₁, u₂⟩·z_∞(b)·H_∞(b)^{s−t/2}` on (real points)·(level group). *Twist places:* in the chart `GL_{n_i}(F_v)` the forms are
generic at `v` (their values are eigenvectors of the Hecke operators of the parahoric of type `(r, it)` with the tame
character, with the `it` lower-block parameters of the strings; automatic for `i = 0` and inherited by up-lifts), and for `x`
trivial at `v`, `I_s(xy) = ζ_v(y)·H_v(y)^{s−t/2}·I_s(x)`, where `I_s(x)` contains the factor `c_v(1) = ‖Φ^Q_{i+1,v}‖²` of the local Weil
coefficient `c_v`: by the local doubling integral with a tame twist on a block (ThetaKernelsForUnitaryDualPairs §6.13c with its `r`, `l = i`,
`N = it` and difference of ranks `t`, its `ξ` the tame character of the tuple and its `μ₀` the unramified part of the
splitting character at the place, the forms generic and the functionals `ℓ` of its cotype),
`conj c_v(y)·ℓ(π(y)x′) = conj c_v(1)·ζ_v(y)·ℓ(x′)` for the generic vectors `x′` and the functionals `ℓ` of the opposite type, with
`ζ_v = 1` on the parahoric, `ζ_v·H_v^{s−t/2}` integrable for `Re s > ρ − ½` when the lower-block parameters `α` satisfy
`N w^{−ρ} ≤ |α| ≤ N w^{ρ}`, and `∫ζ_vH_v^{s−t/2} = L(s + ½, α)L(s + ½, α^{−1})` times the inverse normalising factor of rank `it`
(the parahoric of volume `1`); the string parameters have absolute
value `N w^{(t−1)/2−l}`, `0 ≤ l < t`, so `ρ = (t − 1)/2`, the range is `Re s > t/2 − 1`, and at `s = t/2` the integral is `loc_v(ξ)`.
Only the lower block contributes: the Weil coefficient is supported where the upper block is trivial up to the parahoric, so
no bound on the Satake parameters of `𝔥` enters. Fubini one place at a time gives (b) and (c).
*Hecke factors.* By 5.2 (3) and its Check the `L`-function is
`L^{S(ξ)}(s + ½, B_𝔥 × μ_{i+1}(ξ)^{−1})·∏_{a≤i}∏_{l=0}^{t−1} L^{S(ξ)}(s + t/2 − l, μ_a(ξ)μ_{i+1}(ξ)^{−1})`, an identity on a right half-plane
extended by continuation; at `s₀` the Hecke factors are values at `1, …, t` of `L`-functions of the nontrivial unitary characters
`μ_aμ_{i+1}^{−1}` (distinct infinity types, ThetaChainsOnDefiniteUnitaryGroups §2.3), finite and nonzero (LFunctions Layer 7 on `Re s = 1`), and independent of `𝔥`.
*Independence of `ξ`.* The characters `μ_aμ_{i+1}^{−1}` of the strings do not depend on `ξ`, and the archimedean and type-prime
constants do not either. At a place `v` below `Q(ξ)`, `q = N v`: the measures of 5.2 multiply the volume of `[U(Y_{i+1})]` by
`idx_v(i+1) = #Gr(r, n_{i+1})(𝔽_q) = q^{r(i+1)t}∏_{n=(i+1)t+1}^{(i+1)t+r}(1 − q^{−n})/∏_{n=1}^{r}(1 − q^{−n})` (ThetaChainsOnDefiniteUnitaryGroups §2.9c), and
`‖Φ^Q_{i+1,v}‖² = |GL_r(𝔽_q)|·q^{−r²}·q^{−r(i+1)t}` (the volume of its support, ThetaChainsOnDefiniteUnitaryGroups §2.9c); their product is `∏_{n=(i+1)t+1}^{(i+1)t+r}(1 − q^{−n})`,
and with `loc_v(ξ)` the place `v` contributes `L_v(strings)·∏_{n=t+1}^{t+n_i}(1 − q^{−n}) = L_v(strings)/d_v(t/2)`, which is its
contribution for the base tuple divided by the Euler factor of `B_𝔥` at `v`. So the formula for `ξ` is that of the base tuple
with `L^{S(ξ)}` in place of `L^{S(1)}` in the factor of `B_𝔥`, and `𝔫_{i+1}` depends neither on `ξ` nor on `𝔥`. The up-lifts lie
in `𝒞_{i+1}(ξ)` by 5.2 (2), independently of this target.

*Check.* For `i = 0` there are no Hecke factors and the step lies in Weil's range (`dim Y_1 = r + t > 2r = 2 dim Y_0`),
where the `L`-value is an absolutely convergent Euler product. For `i ≥ 1`, `dim Y_{i+1} ≤ 2 dim Y_i` and the value is
that of the continuation; the string of step `i` contributes at `s₀` the factor `L^{S(ξ)}(1, μ_iμ_{i+1}^{−1})` on the edge
of absolute convergence, finite and nonzero only because `μ_i ≠ μ_{i+1}`: with `μ_i = μ_{i+1}` it would be the pole of a
partial Dedekind zeta function. For `i ≥ 1` the step lies in the range `n_i < n_{i+1} ≤ 2n_i` of the Rallis inner product
formula of MetaplecticAutomorphicForms §6.13 (Witt index of `Y_{i+1}` at most `n_i`, lower lifts vanishing by the route of
5.2), whose identity with the value at `s = t/2` of `L(s + ½, ·)` the statement here makes explicit, with the constant
`𝔫_{i+1}`, the twist places and the independence of `ξ`; for `i = 0` the step lies outside that range.

*Check (the twist places).* At `s = t/2 − 1` the factor `(1 − αN w^{−(s+½)})^{−1}` of the largest string parameter has
`|αN w^{−(s+½)}| = 1`, so `t/2 − 1` in (b) is sharp; at `s = (t − 1)/2` the ratio is `N w^{−1/2}`. For `i = 0`, `r = 1`, `t = 3`,
`q = 2`: `idx_v(1) = #ℙ³(𝔽_2) = 15`, `‖Φ^Q_{1,v}‖² = 1·2^{−1−3} = 1/16`, product `15/16 = 1 − 2^{−4}`, as the formula gives.

*KNOWN* in kind (Rallis; Piatetski-Shapiro–Rallis; J.-S. Li; Ichino; Hecke), *NEW* (the twist places, the independence
of the tuple). *Needs:* 5.1, 5.2, 5.4, ThetaChainsOnDefiniteUnitaryGroups §2.3 (with Lemma (h)), ThetaChainsOnDefiniteUnitaryGroups §2.9, ThetaChainsOnDefiniteUnitaryGroups §2.9c, FrobeniusRestrictedRieszSums §0.9; MetaplecticAutomorphicForms §§5.7, 6.10a, 6.11, 6.12;
ThetaKernelsForUnitaryDualPairs §§3.46a, 5.7a, 6.4a, 6.11, 6.13a, 6.13b, 6.13c; DiscreteSeriesCoefficientsAndAutomorphicMetrics
§2.4a; LFunctions Layer 6 and Layer 7 (nonvanishing of Hecke `L`-functions on
`Re s = 1`); AnalyticNumberTheoryPartI §2.3a.

### 5.6 The adjoint identity of the descent

Let `ξ` be a tuple, `𝔥` a Hecke eigensystem away from `S(ξ)`, and assume the
hypotheses of 5.5 for every `i`. Then on `𝔼^♮[𝔥]`

`ι_ξ ι_ξ^* = 𝔫₀ · ∏_{j=1}^m L^{S(ξ)}((t+1)/2, B_𝔥 × μ_j(ξ)^{−1})`,  `𝔫₀ = ∏_j 𝔫_j`,

and every factor is an absolutely convergent Euler product with a positive value. Consequently `ι_ξ^*` is injective
on `𝔼^♮`; `ι_ξ` maps `𝒰^♮_ξ ⊗ ℂ` onto `𝔼^♮` and `𝒰^{(P,χ_P)}_ξ` onto `𝔼_{(P,χ_P)}` for every level `(P, χ_P)`, in particular
`ℋ^{rt}_ξ` onto `𝔼`; and for every `i ≤ m` the composite `Π_good ∘ io_1 ∘ ⋯ ∘ io_i` maps its source onto `𝔼^♮`.

*Addition (this roadmap's own: the formal proof treats the good rows only).* The same induction on all rows gives
`D_ξ D_ξ^* = 𝔫₀·∏_j L^{S(ξ)}((t+1)/2, B_𝔥 × μ_j(ξ)^{−1})` on `ℋ^♮[𝔥]`, so that `D_ξ` maps `𝒰^♮_ξ ⊗ ℂ` onto `ℋ^♮` and
`e_{P,χ_P}(𝒰^♮_ξ ⊗ ℂ)` onto `ℋ_{(P,χ_P)}`: the step identity of 5.5 uses no goodness, every row has a family (5.1 (3)),
and `D_ξD_ξ^*` preserves `ℋ^♮[𝔥]` (5.2 (3)). `D_ξD_ξ^*` commutes with `G₀` (5.4), hence with `Π_good`, and
`ι_ξι_ξ^* = Π_good D_ξD_ξ^* Π_good`. No target of this roadmap uses the addition.

*Route.* Induction on the steps with 5.5: the `i`-fold up-lifts of `u₁, u₂ ∈ 𝔼^♮[𝔥]` have inner product
`∏_{j≤i} 𝔫_j L_j · ⟨u₁, u₂⟩`, and at the top the up-lift is `ι_ξ^*` (the `m`-fold up-lift of a good row); so
`⟨ι_ξ^*u₁, ι_ξ^*u₂⟩ = 𝔫₀∏_jL_j⟨u₁, u₂⟩`, and since `ι_ξι_ξ^*` maps `𝔼^♮[𝔥]` into itself (Hecke equivariance away from
`S(ξ)`, 5.4 (i)) it is that scalar there. Positivity:
the family of a cusp form on a unitary group is stable under conjugation, `B_𝔥(w̄) = conj B_𝔥(w)` at the two places above
a split place and `conj B_𝔥(w) = B_𝔥(w)` at an inert one (the conjugate of a cuspidal representation of a unitary group
is its contragredient); `μ_j(ξ)` is trivial on `𝔸_F^×` and unitary, so the Euler factors at `w` and `w̄` are complex
conjugate and those at inert places are real and positive; the product converges absolutely at `(t+1)/2` by the
bound of 5.1 (3) and `t > r`. Surjectivity: `𝔼^♮` is the orthogonal sum of the parts `𝔼^♮[𝔥]` (5.1 (3), 5.3 (ii)),
and if `𝒯𝒯^*` is a nonzero scalar `s_c` on each summand of an orthogonal decomposition then `𝒯^*` is injective there and
every `e` equals `𝒯(𝒯^*e)/s_c`; for `e ∈ 𝔼_{(P,χ_P)}`, `e = ι_ξ(ι_ξ^*e)/s_c` with
`ι_ξ^*e ∈ 𝒰^{(P,χ_P)}_ξ` (5.4 (ii)). For `i ≤ m`, `ι_ξ = (Π_good io_1 ⋯ io_i)∘(io_{i+1} ⋯ io_m)`, so the image of
`Π_good io_1 ⋯ io_i` contains that of `ι_ξ`, which is `𝔼^♮`. A second route to surjectivity: up-lifts of eigenforms are
nonzero (the `L`-values and the local zeta integrals are nonzero, the nonvanishing criterion of MetaplecticAutomorphicForms
§6.14 in its range; at the type primes the zeta integral of a form of
level `(P, χ_P)` against the vector of that level is its squared norm times the volume of the level group), and the
families `B^{(i)}` separate the parts.

*Check.* At a split place with `B_𝔥(w) = {β}`, `B_𝔥(w̄) = {β̄}` and `μ(ϖ_w) = u`, `|u| = 1`, the two factors multiply to
`|1 − βū N w^{−s}|^{−2} > 0` for real `s`. A family with `B(w̄) = B(w)` instead would give
`((1 − βū N w^{−s})(1 − βu N w^{−s}))^{−1}`, which need not be real.

*NEW* (chain statement), *KNOWN* ingredients (Rallis; Hecke). *Needs:* 5.1, 5.2, 5.3, 5.4, 5.5; MetaplecticAutomorphicForms
§6.14 (the second route).

### 5.7 Model lifts and their Rallis identity

For `1 ≤ j ≤ m` and a tuple `ξ`: let `D_{W_j}` be the
*holomorphic* discrete series of
`U(W_j)(F_τ) ≅ U(k + j − 1, m − j)` whose Harish-Chandra parameter is the row parameter `(v(τ); −e′(τ))` of `𝒟^{(0)}`: its
`k + j − 1` largest entries are compact-positive and its `m − j` smallest are negative (for `j = m` it is
finite-dimensional). `𝒞(W_j)` is the row space of `U(W_j)` in the sense of 5.1 for `D_{W_j}`, at principal level at the
type primes (through the isometries `W_j ≅ Y_0` of ThetaChainsOnDefiniteUnitaryGroups §2.9, so that `G₀` acts) and with the level of `U(Y_0)` transported by
the isometries of ThetaChainsOnDefiniteUnitaryGroups §2.2 at the other finite places. The pair is the homomorphism pair `Hom_E(V_j, W_j)` in the normal form of
ThetaChainsOnDefiniteUnitaryGroups §2.2a (skew element `δ_T`, `(g, h)x = hxg^{−1}` for `(g, h) ∈ U(V_j) × U(W_j)`, the standard additive character), with the splitting
characters `μ_j(ξ)` on `V_j` (even rank `r + t`) and `μ_j(ξ)η̃^{−1}` on `W_j` (odd rank `r`), and the Schwartz datum `Δ_j ⊗ f`, where
`Δ_j` is the *joint vector* below, and the *level vector* `f` is: the lattice vector outside `S(ξ)`;
at a place `v` below `Q(ξ)`, the function `f_v(y) := ϑ_v(det g)^{−1}` of the reduction `y ∈ M_{(r+t)×r}(𝔽_p)` of an integral element
of `Hom(W_{j,w_v}, V_{j,w_v})` if its last `t` rows vanish and its first `r` rows form `g ∈ GL_r(𝔽_p)`, and `0` otherwise, where `ϑ_v`
is the character for which the test vector `Φ^Q_{j,v}` of the row step at `v` (ThetaChainsOnDefiniteUnitaryGroups §2.9c), read as a vector of a Weil datum of the
same convention as the pair `(V_j, W_j)` (ThetaChainsOnDefiniteUnitaryGroups §2.2a), is `ϑ_v(det x_{rr})` on its support; so `ϑ_v` is `c_v^{−1}` or `c_v` (`c_v` the residue
of ThetaChainsOnDefiniteUnitaryGroups §2.9c of the step character of the tuple) according as these Weil data are or are not complex conjugate to those in which
ThetaChainsOnDefiniteUnitaryGroups §2.9c writes `Φ^Q_{j,v}`; the forms on `U(V_j)` carry the character `c_v` of the determinant of the lower block under the
parahoric of type `(r, t)` (ThetaChainsOnDefiniteUnitaryGroups §2.9c); and at the
places above `g₀g₁` jointly, for a level `(H, χ_H)` at the type
primes (`H ⊂ G₀ = ∏_{v|g₀g₁}GL_r(𝔽_v)`, not necessarily a product over the places), the function `f_H` in the type-II model on the
Lagrangians `Hom(W_{j,w_v}, V_{j,w_v})` of the split places `v | g₀g₁` (a function of the family `y = (y_v)_v` of the reductions
`y_v ∈ M_{(r+t)×r}(𝔽_v)` of integral elements, in the bases of ThetaChainsOnDefiniteUnitaryGroups §2.9a) equal to `|H|^{−1/2}·χ_H(g)·∏_v χ_{v,j}(det g_v)` when the last
`t` rows of every `y_v` vanish and the first `r` rows of the `y_v` form an element `g = (g_v)_v ∈ H`, and `0` otherwise (`χ_{v,j}`
the type character of step `j` at `v`, ThetaChainsOnDefiniteUnitaryGroups §2.4(b), whose inverse is the restriction of `μ_j` to the units at `w_v`: the level vector
carries the level character itself; for `H = {1}` it is the *principal level vector* `f_1`); the algebraic forms on `U(V_j)`
transform on their block at `v` by `χ_{v,j}^{−1}` (ThetaChainsOnDefiniteUnitaryGroups §2.9). The
*model lift* `θ_j(ξ)` is the theta integral over the compact quotient `[U(V_j)]` with the principal level vector
(`H = {1}`); it maps algebraic forms on `U(V_j)` with values in the coefficient representation `𝒲_j` below or in its
contragredient to functions on `U(W_j)`, pairing the values of the form with the `U(V_j)`-factor `𝒲_j` of the Fock vector.

*The joint vector.* With `(p, q) = (k + j − 1, m − j)` and `λ(τ) = (v(τ); −e′(τ))` the row parameter of `Y_0`, put
`a⁺_n(τ) := λ_n(τ) + w_j(τ) − (p − n − 1) − (t+1)/2` for `0 ≤ n < p` and
`a⁻_n(τ) := −(w_j(τ) + λ_{p+q−n−1}(τ)) − (q − n) − (t−1)/2` for `0 ≤ n < q` (positive integers, decreasing in `n`, by
(W1)), `a⁺_p = a⁻_q = 0`, and
`Δ_j := ∏_τ ∏_{n<p} (Δ⁺_{n+1,τ})^{a⁺_n − a⁺_{n+1}} · ∏_{n<q} (Δ⁻_{n+1,τ})^{a⁻_n − a⁻_{n+1}}`,
`Δ^±_{i,τ}` the leading minor of size `i` of the block of the matrix of `Hom(W_j, V_j)` at `τ` attached to the
positive, resp. negative, directions of `W_j`. *The coefficient representation* `𝒲_j` is the representation of
`U(V_j)(F_∞)` on the span of the translates of `Δ_j` in the polynomial Fock space; prove that it is irreducible, and
that there is an intertwiner from (lowest `K`-type of `D_{W_j}`) ⊗ `𝒲_j` to Fock polynomials, equivariant for
`U(V_j)(F_∞)` and for the maximal compact subgroup of `U(W_j)(F_∞)`, sending a tensor of unit vectors to `Δ_j`. Not given
here: the highest weight of `𝒲_j` (as a polynomial in the columns of the matrix, `Δ_j` has the degrees
`(a⁺_0, …, a⁺_{p−1}, 0^t, a⁻_{q−1}, …, a⁻_0)`; the signs of the last `q` entries and the twist by the splitting characters
depend on the Fock model of the step), hence the Harish-Chandra parameter of `𝒲_j`, and whether the algebraic forms on
`U(V_j)` take values in `𝒲_j` or in its contragredient.

*Lemma (cuspidality from the support).* Let `V` be anisotropic Hermitian and `W` skew-Hermitian over `E`, `v` a finite place
of `F` split in `E`, and `φ_v`, in the model on `Hom(W′_v, V′_v)` of the split place (on which `GL(V′_v) × GL(W′_v)` acts by
composition), supported on injective maps (so `dim W ≤ dim V`). Then for every isotropic `ξ′ ∈ W` the constant term along
the transvection group `Z_{ξ′}` of every theta lift from `U(V)` with local datum `φ_v` at `v` vanishes; and a smooth function
of uniform moderate growth on `U(W)(F)\U(W)(𝔸)` whose constant terms along the transvection groups of all isotropic vectors
vanish has vanishing constant terms along every proper parabolic subgroup.

Prove: (i) every theta lift of an algebraic form on `U(V_j)` with such a datum is a cusp form; `θ_j(ξ)` takes values in
`𝒞(W_j)`, its adjoint (for the class-sum product of the algebraic forms on `U(V_j)` and the Petersson product of 5.1 on
`𝒞(W_j)`; dividing both by the same positive constant changes neither the adjoint nor the scalars `λ_j` below) is the
absolutely convergent theta integral over `[U(W_j)]`, and `θ_j(ξ)` commutes with `G₀` and
with the Hecke operators away from `S(ξ)`. (ii) If `t > r`, then on `𝒞(W_j)[𝔥]` for every eigensystem `𝔥` away from
`S(ξ)`

`θ_j(ξ)θ_j(ξ)^* = λ_j(ξ, 𝔥) := a_j · L^{S(ξ)}((t+1)/2, B_𝔥 × μ_j(ξ)^{−1})`,

`a_j = d_K(j) · dim 𝒲_j · ‖Δ_j‖²_Fock · ∏_τ d(D_{W_j,τ})^{−1} · mass(V_j) / ∏_{n=t+1}^{r+t} L(n, η_{E/F}^n)`,

where `d_K(j) = ∏_τ dim(lowest K-type of D_{W_j,τ})`, `d(·)` is the formal degree for the measures of the conventions,
and `L(n, η_{E/F}^n)` is the Euler product over all finite places of `F` of the character `η_{E/F}^n` (the Dedekind zeta
function of `F` for even `n`). (ii′) With the level vector of a level `(H, χ_H)` in place of the principal one, the same
holds on the level-`(H, χ_H)` part of `𝒞(W_j)[𝔥]` with `a_j` multiplied by `|H|`. (iii) `λ_j(ξ, 𝔥) > 0` whenever
`𝒞(W_j)[𝔥] ≠ 0`.

*Route.* The irreducibility of the coefficient representation `𝒲_j` and the existence of the intertwiner are not given
here. *Lemma.* In the mixed model adapted to `W = ⟨ξ′⟩ ⊕ W₀ ⊕ ⟨ξ′^∨⟩` the transvections act on
`φ(x, y)`, `x ∈ V ⊗ ξ′^∨`, by `ψ(s⟨x, x⟩)`, so the constant term along `Z_{ξ′}` keeps the rational `x` with `⟨x, x⟩ = 0`, that is
`x = 0` (`V` anisotropic); at the split place this term is an integral of `φ_v` over the maps killing `ξ′`, which are not
injective, so it vanishes. `Z_{ξ′}` lies in the unipotent radical of the stabiliser of any isotropic flag whose first
space contains `ξ′` and is central there, so the constant term along that radical is an integral of constant terms along
`Z_{ξ′}`. (i) *Cuspidality from the level vector.* `V_j` is anisotropic and `dim W_j = r ≤ r + t = dim V_j`; at a type prime
the level vector is supported on maps whose reduction has rank `r`, so the lemma kills every constant term; a function of
uniform moderate growth with vanishing constant terms is cuspidal, hence rapidly decreasing
(ArithmeticLocallySymmetricSpaces ALS.F.6 (iii)). The lowering operators
kill `Δ_j`, so the lift at the extremal vector is a bounded holomorphic form, which generates the holomorphic discrete
series (DiscreteSeriesCoefficientsAndAutomorphicMetrics §6.8); so the lift lies in `𝒞(W_j)`. Equivariance from that of the datum.
(ii) The Rallis inner product formula in Weil's range `dim V_j = r + t > 2r = 2 dim W_j` (ThetaKernelsForUnitaryDualPairs
§6.13a, the theta integral being over the compact `[U(V_j)]`): the inner product of two up-lifts is an integral over
`U(W_j)(𝔸)` of `⟨ω(g)φ₁, φ₂⟩·conj⟨R(g)F₁, F₂⟩`. On the span of the joint harmonics the Weil representation of
`U(W_j)(F_∞)` is the discrete series tensored with `𝒲_j`, so the archimedean matrix coefficient of the Fock vector is
`‖Δ_j‖²_Fock` times a matrix coefficient of `D_{W_j}`; Schur orthogonality integrates it to the inverse formal degree. At
unramified places the matrix coefficient of the lattice vector is the bi-invariant function whose sum over
`U(W_j)(F_v)/K_v` against a spherical coefficient is the unramified doubling integral `L_v((t+1)/2, B_𝔥 × μ_j^{−1})/d_v`
(MetaplecticAutomorphicForms §6.10a and ThetaKernelsForUnitaryDualPairs §6.11 (b), (c), absolutely convergent for a
bounded spherical coefficient because `t > r − 2`); at `S(ξ)` the coefficient of the level vector is supported on the level
group, where it is the level character. Finally (index of the level group) × (norm of the level vector) × (volume of
`[U(V_j)]`) equals `mass(V_j)/∏_{v ∈ S(ξ)} d_v` (the level vector is supported on matrices of full rank modulo `ϖ`), so
the level and the twist places cancel, leaving `mass(V_j)/d^∅`. The scalar comes out for one argument in the part and
all others, so `θθ^*` is that scalar on the part: no global multiplicity one is used; the archimedean Schur constant of
5.1 (2) is. (ii′) `f_H = |H|^{−1/2}Σ_{h∈H}χ_H(h)·ω(h̃^{−1})f_1` (`h̃` a lift of `h` to the level group of `U(W_j)`), so
`θ_{f_H} = |H|^{1/2}·e_{(H,χ_H)}∘θ_{f_1}` and `θ_{f_H}θ_{f_H}^* = |H|·θ_{f_1}θ_{f_1}^*` on the level-`(H, χ_H)` part (`e_{(H,χ_H)}` commutes
with `θ_{f_1}θ_{f_1}^*`). (iii) `a_j > 0` and
the Euler product is nonzero, and `a_j L·‖y‖² = ‖θ^*y‖² ≥ 0` for `y ≠ 0` in the part forces `L > 0`. Which of the two
cases of the definition of `ϑ_v` occurs (whether the Weil data of the pair `(V_j, W_j)` are complex conjugate to those in
which ThetaChainsOnDefiniteUnitaryGroups §2.9c writes `Φ^Q_{j,v}`) is not decided here.

*Checks.*
- `a_j` depends neither on `ξ` nor on the level at `Q(ξ)`: changing the level multiplies the index and divides the
  Schwartz norm and the volume by the same local factors. For `t ≤ r` the Euler product at `(t+1)/2` need not converge, and
  the formula is outside Weil's range.
- A lift of the constant function from a definite group to a smaller isotropic group is in general an Eisenstein series,
  not a cusp form: cuspidality comes from the level vector at a type prime, and fails for the lattice vector alone.
- The normalising factor `|H|^{−1/2}` of `f_H` is what makes the factor in (ii′) `|H|`: the unnormalised sum
  `Σ_hχ_H(h)ω(h̃^{−1})f_1` gives `θθ^* = |H|²·a_jL` on the part.
- *The twist places.* For one convention of Weil data, the row-step vector at `v` carries `ϑ_v(det x_{rr})` and the model
  vector `ϑ_v(det g)^{−1}`: the two lifts are integrals of kernels of one family of Weil data, and complex conjugation of a
  Weil datum inverts the character of a test vector, which is why `f_v` is defined through `ϑ_v` and not through `c_v`
  directly. On the row side the forms of stage `i` transform under the parahoric of type `(r, it)` by the character of the
  determinant of the lower block alone (ThetaChainsOnDefiniteUnitaryGroups §2.9c): the character of the test vector on the upper block is cancelled by the
  splitting character on `det`. The same must hold on the model side: under the parahoric of type `(r, t)` of
  `U(V_j)(F_v) ≅ GL_{r+t}(F_v)`, for `A` with diagonal blocks `(A₁, A₂)`, `f_v(A^{−1}y) = ϑ_v(det A₁)f_v(y)`, and together with the
  splitting character on `det A = det A₁·det A₂` the lift transforms by a character of `det A₂` only.

*KNOWN* (Rallis; J.-S. Li; Kashiwara–Vergne; Harish-Chandra; Piatetski-Shapiro–Rallis), *NEW* (the exact constant in
this setting; cuspidality through the level vector). *Needs:* ThetaChainsOnDefiniteUnitaryGroups §2.2, ThetaChainsOnDefiniteUnitaryGroups §2.2a, ThetaChainsOnDefiniteUnitaryGroups §2.3, ThetaChainsOnDefiniteUnitaryGroups §2.9, ThetaChainsOnDefiniteUnitaryGroups §2.9a, ThetaChainsOnDefiniteUnitaryGroups §2.9c, 5.1, 5.4; MetaplecticAutomorphicForms §§6.4, 6.10a,
6.11; ThetaKernelsForUnitaryDualPairs §§3.45, 4.4a, 6.11, 6.13a; AutomorphicFormsOnReductiveGroups §§2.4, 7.5;
ArithmeticLocallySymmetricSpaces ALS.F.6 (iii); DiscreteSeriesCoefficientsAndAutomorphicMetrics §§6.8, 8.3;
HermitianFormsAndLattices §§4.5, 5.5.

### 5.8a The grid of the chain

*Definition.* A *grid* over the chain consists of: the integer `s := r + 6` (odd, as `r` is odd); Hermitian
spaces `V(i, j)` (`0 ≤ i, j ≤ m`) over `E` with self-dual lattices, of rank `r + jt + is`, with `⌊(m − j)/2⌋` negative directions
at every `τ ∈ Φ`, `V(0, j) = Y_j` for `j < m` and `V(0, m) = X^h`; the *auxiliary prime* `p_□`, the least prime with
`p_□ ≡ 1 (mod r′·N_E)`, where `N_E` is the modulus of the host (FrobeniusRestrictedRieszSums §0.4; the conductor `f_E`
divides it) and `r′` is the least prime not dividing `N_E·(p_δ − 1)(p′_δ − 1)`, and the *auxiliary place* `v_□`, a place of
`F` above `p_□`; unitary Hecke characters
`χ_1, …, χ_m` of `E` trivial on `𝔸_F^×`, with `χ_{i,τ}(z) = (z/z̄)^{c_i(τ)}` at `τ ∈ Φ` (the *centres* are
`c_i(τ) := ⌊v_0(τ) + ½ + (m − i + 3/2)·h_c⌋`, `1 ≤ i ≤ m`, where the *spacing* `h_c` is the least integer with
`h_c ≥ N_□³ + (r+1)⁷ + (r+1)³·√ℓ_cl`, `h_c > 2N_□³ + 2s + 2` and `h_c ≥ 48(r+1)²√m`, `N_□ := k + m(t + s + 1)`,
`ℓ_cl := max_τ (v_0(τ) − v_{k−2}(τ))`), unramified outside
`S_□ := S₀ ∪ {v_□}`, of conductor exponent exactly `2` at every place of `E` above `S₀` and exactly `1` at the places of `E` above
`v_□`, and, at the places of `E` above `p_δ` and `p′_δ`, trivial on the roots of unity of order prime to the residue
characteristic, where `S₀` is the set of bad places of ThetaChainsOnDefiniteUnitaryGroups §2.4(b) (the places above `g₀, g₁, p_δ, p′_δ`; outside `S₀` the `μ_j` and `η̃` are
unramified, and at the places of `S₀` the `μ_j` are at most tamely ramified); and the Weil data of the *down* pairs
`(V(i, j), V(i, j+1))` and the *right* pairs `(V(i+1, j), V(i, j))`: every pair of the grid is a homomorphism pair in the
normal form of ThetaChainsOnDefiniteUnitaryGroups §2.2a (skew element `δ_T`; ThetaLiftsForDefiniteUnitaryGroups §§0.1, 2.5 with `δ′ = δ_T`), the down pair on
`Hom_E(V(i, j), V(i, j+1))`, the right pair on `Hom_E(V(i+1, j)(−1), V(i, j))` (`(−1)`: the form negated), with the form
`Tr_{E/F}(δ_T·tr(x^†y))`, `(g, h)x = hxg^{−1}`, the standard additive character, and the splitting characters `μ_{j+1}(ξ)`, resp.
`χ_{m−i}`, times `η̃^{−1}` on the member of odd rank; the down pairs of row `0` are the row steps of 5.2, and the descents
along the down pairs integrate against the complex conjugate kernels (ThetaChainsOnDefiniteUnitaryGroups §2.2a (c)). Further data of a grid:
- the *core column*: Hermitian spaces `X^c_0, …, X^c_m` with self-dual lattices `Λ^c_i`, `X^c_i` of rank `(r + 1) + i(s − 1)` with
  `⌊(m − i + 1)/2⌋` negative directions at every `τ ∈ Φ`, `X^c_0 = Y_0 ⊥ ⟨1⟩`, `X^c_i ⊂ V(i, 0)` for `i ≥ 1` with orthogonal complement
  of rank `i − 1` and antidiagonal Gram matrix, with centre `−1` when `i − 1` is odd; `X⁺ := X^c_m`, positive definite of rank
  `r + 1 + m(s − 1)`; and the homomorphism pairs `(X^c_{i+1}(−1), X^c_i)` in the normal form of ThetaChainsOnDefiniteUnitaryGroups §2.2a with the character `χ_{m−i}` on
  both members (both ranks are even);
- the *modulus* `𝔪_□ := ∏_{v∈S_□}w(v)^{d(v)}`, `w(v)` a chosen place of `E` above `v`, for every `v ∈ S_□` (all these `v` split
  in `E`), such that: for `v | g₀g₁`, `w(v)` is the place `w_v` of the chain (ThetaChainsOnDefiniteUnitaryGroups §2.9a); for
  each of `p_δ`, `p′_δ`, the places `w(v)`, `v | p`, lie above one prime of `K`; a place of a set `Q(ξ)` that lies above `S₀`
  is the chosen place of its place of `F`; and no place of any `Q(ξ)` lies above `v_□`. `d(v) = 2` for `v ∈ S₀`, and the
  *depth* is `d(v_□) = d_□ := ⌊C_F·f²(r+1)⁶·log(b(r+1)g₀g₁p_δp′_δ|d_E|)/log p_□⌋ + 1`, with a constant `C_F ≥ 6510` fixed
  before `ε`; so `d_□·log p_□ > C_F·f²(r+1)⁶·log(b(r+1)g₀g₁p_δp′_δ|d_E|) ≥ (d_□ − 1)·log p_□`;
  `K⁺ ⊂ U(X⁺)(𝔸_f)` the principal congruence subgroup of level `𝔪_□` of the stabiliser of the lattice of `X⁺`. The
  characters `χ_j` keep conductor exponent exactly `1` at `v_□`: the modulus is a separate datum, the level of the coset data
  of 5.8e and of `K⁺`;
- the *Bessel datum* at the top of column `0`: `V(m, 0) = X⁺ ⊥ C⁺` with `C⁺` of rank `m − 1`, an isotropic flag `e⁺_1, …, e⁺_{n⁺}` of
  `C⁺`, `n⁺ = (m − 2)/2`, a vector `z⁺ ∈ C⁺` orthogonal to the flag with `⟨z⁺, z⁺⟩ = −1`, `N⁺` the unipotent radical of the
  stabiliser of the flag in `U(V(m, 0))` (the elements acting trivially on the graded pieces), and the character
  `ψ⁺(n) := ψ⁺_E(Σ_{i<n⁺}a⁺_i⟨n e⁺_{i+1}, e⁺_i{}^∨⟩ + a⁺_{n⁺}⟨n z⁺, e⁺_{n⁺}{}^∨⟩)` of `N⁺(F)\N⁺(𝔸)`, `a⁺_i ∈ E^×`, `e⁺_i{}^∨` the dual flag,
  `ψ⁺_E` a nontrivial character of `𝔸_E/E` trivial on `𝔸_F`.

(The signatures are consistent: the complement of `X^c_i` in `V(i, 0)` has `⌊i/2⌋` negative directions and
`⌊(m − i + 1)/2⌋ + ⌊i/2⌋ = m/2`, the number of `V(i, 0)`; `C⁺` is `n⁺` hyperbolic planes plus `⟨−1⟩`.) `s`, `h_c`, `p_□`, `d_□`
and the centres are functions of the host, the ranks, the scale and the weight datum. The grid is chosen with the chain,
before the field `𝕃` of ThetaChainsOnDefiniteUnitaryGroups §2.6 and the twisting datum of ThetaChainsOnDefiniteUnitaryGroups §2.5; the places of `F` above `p_□` belong to the
prescribed finite set of ThetaChainsOnDefiniteUnitaryGroups §2.5 (b), so that no place of any `Q(ξ)` lies above `p_□`. A *square* `(i, j)`, `i, j < m`, has
corners `X = V(i, j+1)`, `M = V(i+1, j+1)`, `M′ = V(i, j)`, `Y = V(i+1, j)`, and `X ⊕ Y ≅ M ⊕ M′`; its *triple* is
`(M^*, M′^*(−1), X ⊕ Y)` (as isometry classes `(M, M′(−1), X ⊕ Y)`), with the skew-Hermitian form `δ_Y⟨·,·⟩` on `X ⊕ Y`,
`δ_Y = −δ_T = 1/√−d` the skew element of 5.2, and the characters `β = χ_{m−i}η̃^{e}`, `α = μ_{j+1}(ξ)η̃^{e}` (`e` the parity of
`rank V(i, j)`); `ν = α/β`, `a = rank M`, `a′ = rank M′`, `ε_□ = (a − a′)/2`, `p = ⌊(m − j − 1)/2⌋`, `q = ⌊(m − j)/2⌋`.

*Statement.* (e) *Existence.* For every choice of `v_□` as above there are characters `χ_1, …, χ_m` with these
properties; the spaces of the core column exist (formed as those of ThetaChainsOnDefiniteUnitaryGroups §2.2, from diagonal unit forms, ThetaChainsOnDefiniteUnitaryGroups §2.2 (d), (e)).
The grid exists as soon as `g₀, g₁, p_δ, p′_δ ≡ 1 (mod N_E)`, `p_□ ∉ {g₀, g₁}` and no place of any `Q(ξ)` lies above `p_□`.
(s) `Im τ(δ_Y) < 0` for every `τ ∈ Φ`. So for every square the embedding of ThetaLiftsForDefiniteUnitaryGroups at the
real place below `τ ∈ Φ` (the one at which `Im τ_v(δ) < 0` for the skew element `δ = δ_Y` of the triple) is `τ` itself, and
there `κ_v = m_{α,v} − m_{β,v} = −(2e_j(τ) + 2c_{m−i}(τ))`. (r) For all `i, j < m` and every tuple `ξ`, the character
`ν_ξ = μ_{j+1}(ξ)/χ_{m−i}` is ramified at every place of `E` above `S_□ ∪ Q(ξ)`, and `μ_{j+1}(ξ)`, `χ_{m−i}`, `η̃` are unramified
outside `S_□ ∪ Q(ξ)`. (p) *The auxiliary prime.* `p_□` is prime to `N_E` (so it splits completely in `E`);
`p_□ ∉ {p_δ, p′_δ}`; `p_□` does not divide the discriminant of `F`; `p_□ − 1 > #μ_E`; `N(w(v_□)) ≥ p_□`.

*Route.* (e) ThetaChainsOnDefiniteUnitaryGroups §2.4 (a) with `n_η = 0`, `S = S_□`, the prescribed infinity types and local unit components of conductor exponent
`2` above `S₀`: the obstruction `(★)` is a character of `μ_{E/F}`, and at `v_□` the tame characters of `𝔽_{p_□}^×` with a
prescribed restriction to the image of `μ_{E/F}` form a coset of size `(p_□ − 1)/#μ_{E/F} ≥ 2`, which contains a nontrivial
one (the other units of `E` are, up to index `2`, units of `F`, on which every prescribed component is trivial). The
existence of the places `w(v)` under the conditions of the last sentence of (e) is not given here. (s)
`Im τ(δ_T) > 0` for `τ ∈ Φ` (ThetaChainsOnDefiniteUnitaryGroups §3.2) and `δ_Y = −δ_T`. The signatures of the grid spaces and the infinity types of the characters
are read at the same embeddings `τ ∈ Φ`, and the triple of a square carries the skew form `δ_Y⟨·,·⟩` on `X ⊕ Y`, so the
embedding of ThetaLiftsForDefiniteUnitaryGroups is `τ`; at `τ` the infinity types are `(z/z̄)^{−e_j(τ)}` for `μ_{j+1}` (ThetaChainsOnDefiniteUnitaryGroups §2.4(b),
`w_{j+1} = e_j`), `(z/z̄)^{c_{m−i}(τ)}` for `χ_{m−i}` and `z/|z|` for `η̃`, which gives `κ_v`. On `Hom(M, X ⊕ Y)` the Hom form of
`(M(−1), X ⊕ Y)` with `δ_T` is the tensor-model form of the triple with `δ_Y`, and for `M′` the Hom form of `(M′, X ⊕ Y)`; the
change of sign is the passage to the exchanged pair for the arrows into `M` and the negation of `M′^*` for the arrows out of
`M′`. (r) At the places above `v_□`: `χ_{m−i}` is ramified (exponent `1`), `μ_{j+1}` and `ξ` are not (`v_□ ∉ S₀`, and no place of
`Q(ξ)` lies above `p_□`). At the places above `S₀` (including those of `Q(ξ)` above the auxiliary primes `p_δ, p′_δ`): `χ_{m−i}`
has conductor exponent exactly `2`, so it is nontrivial on the principal units, while `μ_{j+1}(ξ)` is at most tamely ramified
there (ThetaChainsOnDefiniteUnitaryGroups §2.4(b), ThetaChainsOnDefiniteUnitaryGroups §2.5), hence trivial on them. At the other places of `Q(ξ)`: `ξ` is ramified, `χ_{m−i}` and `μ_{j+1}` are not.
Elsewhere `η̃` and `μ_{j+1}` are unramified outside `S₀` (ThetaChainsOnDefiniteUnitaryGroups §2.4(b)), `μ_{j+1}(ξ)` outside `S₀ ∪ Q(ξ)` (ThetaChainsOnDefiniteUnitaryGroups §2.5), `χ_{m−i}` outside `S_□`.
(p) `r′ | p_□ − 1` and `r′ ∤ (p_δ − 1)(p′_δ − 1)` give `p_□ ≠ p_δ, p′_δ`; the congruence gives the coprimality to `N_E`. The
statements on the discriminant of `F` and on `#μ_E` are not given here.

*NEW* (the grid). *Needs:* 5.2, ThetaChainsOnDefiniteUnitaryGroups §2.2, ThetaChainsOnDefiniteUnitaryGroups §2.2a, ThetaChainsOnDefiniteUnitaryGroups §2.4, ThetaChainsOnDefiniteUnitaryGroups §2.5, ThetaChainsOnDefiniteUnitaryGroups §2.7, ThetaChainsOnDefiniteUnitaryGroups §2.9a, ThetaChainsOnDefiniteUnitaryGroups §3.2, FrobeniusRestrictedRieszSums §0.3, FrobeniusRestrictedRieszSums §0.4; ThetaLiftsForDefiniteUnitaryGroups §§0.1, 2.5.

### 5.8b The squares of the grid are complementary triples

Let a grid (5.8a) be given, and assume:
- (R1), (R2) of ThetaChainsOnDefiniteUnitaryGroups §2.1 (`m + 3 ≤ k`, `3m < t`), `SizeInert` of ThetaChainsOnDefiniteUnitaryGroups §2.1 and `HostSplitting E` (FrobeniusRestrictedRieszSums §0.3; ThetaChainsOnDefiniteUnitaryGroups §2.4(b) uses it). Then the *place
  conditions* hold: `E/ℚ` is Galois (an abelian host) and `E/F` is unramified at every finite place (the setting of Layer 2);
  every finite place of `F` that is dyadic or divides the different of `F/ℚ` splits in `E` (ThetaChainsOnDefiniteUnitaryGroups §2.2(g));
  the places of `S_□ ∪ Q(ξ)` are prime to the different of `F/ℚ` (ThetaChainsOnDefiniteUnitaryGroups §2.4(b), ThetaChainsOnDefiniteUnitaryGroups §2.5 and 5.8a (p));
- the *spacing of the centres*: for all `i, j < m` and `τ ∈ Φ`, `2e_j(τ) + 2c_{m−i}(τ) > rank V(i+1, j+1) + rank V(i, j)`.
  It holds for the centres of 5.8a: `e_j(τ) + v_0(τ) > 0` (interlacing of ThetaChainsOnDefiniteUnitaryGroups §2.3) and
  `c_{m−i}(τ) > v_0(τ) + (i + 3/2)h_c − ½`, so the left side exceeds `3h_c − 1 > 2N_□`, and the two ranks are at most
  `N_□` each.

Then for every square `(i, j)` and every tuple `ξ` the triple with the characters `(β, α)` is a complementary triple
(ThetaLiftsForDefiniteUnitaryGroups §6.1) satisfying hypotheses 1–4 of ThetaLiftsForDefiniteUnitaryGroups §6.11:
1 one signature `(a − p, p)`, `(q, a′ − q)` at every real place; 2 `a ≡ a′ (mod 2)`, `ε_□ = (t + s)/2 > 2(p + q) + 1` and
`a′ ≥ r > 2(p + q) + 1`; 3 `κ_v = m_{α,v} − m_{β,v} = −(2e_j(τ) + 2c_{m−i}(τ)) < −(a + a′)` at every real place `v`, read at the
embedding `τ_v` of ThetaLiftsForDefiniteUnitaryGroups, which is `τ ∈ Φ` by 5.8a (s); 4 the place conditions (P1)–(P4) of
ThetaLiftsForDefiniteUnitaryGroups §6.1 — `E/F` unramified at the finite places; the places not split in `E` odd, with the
standard character unramified there; `α` and `β` each unramified outside the split set
`T = S_□ ∪ Q(ξ)`, at each place of which `ν` is ramified (5.8a (r)) and the standard character unramified; unimodular lattices in
`M_v`, `M′_v` and a lattice of `(X ⊕ Y)_v` unimodular for `δ_Y⟨·,·⟩` (no compatibility and no condition on `δ_Y`). So matching data
exist at every place, for the triple and for every smaller triple reached by removing adapted planes
(ThetaLiftsForDefiniteUnitaryGroups §6.2; at the real places ThetaKernelsForUnitaryDualPairs §3.47b (o), (ii), (iv), under 3), and
ThetaLiftsForDefiniteUnitaryGroups §6.11 applies to every square.

*Route.* The rank conditions are integer arithmetic: `a − a′ = t + s`, `p + q = m − j − 1`, so `(t + s)/2 > 2m − 1 ≥ 2(p + q) + 1`
by `t ≥ 3m + 1` and `s = r + 6 > m`; `a′ ≥ r = k + m − 1 ≥ 2m + 2`; `a + a′ ≡ t + s ≡ 0`. These are the only uses of (R1), (R2). The
signatures from ThetaChainsOnDefiniteUnitaryGroups §2.2 and the shape of the grid. Hypothesis 3: 5.8a (s), and for the centres of 5.8a `e_j(τ) + v_0(τ) > 0` by the
interlacing of ThetaChainsOnDefiniteUnitaryGroups §2.3, so `2e_j + 2c_{m−i} > 2h_c ≥ a + a′`. `ν` is ramified at every place above `S_□ ∪ Q(ξ)` and `α`, `β` are
unramified elsewhere (5.8a (r)); the standard character is unramified at the places prime to the different; (P4) from the
self-dual lattices of the grid (at an inert place `a + a′` is even, so `(X ⊕ Y)_v` contains a lattice unimodular for `δ_Y⟨·,·⟩`
whatever the valuation of `δ_Y`, ThetaKernelsForUnitaryDualPairs §3.47a; at a split place one rescales one component). The local
hypotheses of ThetaLiftsForDefiniteUnitaryGroups §5.3 at the definite pairs reached by the induction follow from (P1)–(P4)
(ThetaLiftsForDefiniteUnitaryGroups §6.1). Matching data at the real places are those of ThetaKernelsForUnitaryDualPairs §3.47b (its
Casimir-gap lemma (o) gives (ii), (iv) under 3); at the inert and split places ThetaKernelsForUnitaryDualPairs §§3.47a, 3.47 (through
ThetaLiftsForDefiniteUnitaryGroups §6.2).

*Check (the sign).* The sign of `δ_Y` matters, its size does not (any `δ_Y ∈ ℚ_{>0}·(1/√−d)` gives 5.8a (s)). With the skew
element `δ_T` of the column steps on the triple instead, the embedding of ThetaLiftsForDefiniteUnitaryGroups is `c∘τ`,
`κ_v = 2e_j + 2c_{m−i} > a + a′`, and hypothesis 3 fails: in that range both theta integrals of a compact triple vanish
identically (ThetaLiftsForDefiniteUnitaryGroups §6.10, Checks).

*NEW*. *Needs:* 5.8a, ThetaChainsOnDefiniteUnitaryGroups §2.1, ThetaChainsOnDefiniteUnitaryGroups §2.2, ThetaChainsOnDefiniteUnitaryGroups §2.3, ThetaChainsOnDefiniteUnitaryGroups §2.4, ThetaChainsOnDefiniteUnitaryGroups §2.5, FrobeniusRestrictedRieszSums §0.3; ThetaLiftsForDefiniteUnitaryGroups §§6.1, 6.2, 6.10, 6.11;
ThetaKernelsForUnitaryDualPairs §§3.47, 3.47a, 3.47b.

### 5.8c The constant of a square

Let `(M^*, M′^*(−1), X ⊕ Y)` be the triple of a square satisfying the conclusion of 5.8b.
(i) *Composite kernels:* the product of the theta kernels of the two arrows `X → M`, `M → Y` is the theta kernel of
`(U(M), U(X ⊕ Y))` restricted to `U(X) × U(Y)`, up to an explicit unitary character, and likewise for `X → M′ → Y`; of the four
arrow kernels, two (the right pair `(M′, Y)` and the down pair `Y → M`) enter the composite through the adjoint
identification `Hom(S, T) ≅ Hom(T, S)` (conjugate-linear, it turns `Tr(−δ_T·tr(y^†x))` into `Tr(δ_T·tr(y′^†x′))`). (ii)
*Regularisation:* for data on the side outside Weil's range there is a finitely supported `z` at an auxiliary place split in
`E`, at which all data are vacua, killing the strata of matrices of rank `< rk M′` and of degree `deg z ≠ 0`, for which the
theta integral over `[U(M′)]` converges absolutely, and `I(z·Φ)/deg z` does not depend on `z`. (iii) *The square constant:*
there is a unique `c = c(i, j, ξ) ≠ 0` with `∫_{[U(M)]} K_{X→M→Y} = c·∫^{reg}_{[U(M′)]} K_{X→M′→Y}` on matched data normalised as in
ThetaLiftsForDefiniteUnitaryGroups §6.2 (at the places of `T` the constant depends on the normalisation of the two local zeta
integrals there, which ThetaLiftsForDefiniteUnitaryGroups §6.2 fixes for every tuple in the same way).

*Route.* (i) The seesaw identity of the Weil representations: on `Hom(M, X ⊕ Y)` the Hom form of `(M(−1), X ⊕ Y)` is the sum of
those of the right pair `(X, M)` on `Hom(M(−1), X)` and of the down pair `Y → M` read through the adjoint; on `Hom(M′, X ⊕ Y)` the
sum of the down pair `M′ → X` and of the right pair `(M′, Y)` read through the adjoint. (ii) A regulariser of the form
`z = δ_1 − c·δ_ϖ` (rank one, `c = χ(ϖ)^{−1}q^{N/2} ≠ 1`) kills the low-rank strata; right invariance of the measure on the
quotient gives `I(z·Φ) = deg(z)·I(Φ)` on matched data, and two regularisers commute; the auxiliary place may be taken
outside any finite set, which makes the value independent of the regulariser; the regularised integral is the invariant
extension of ThetaLiftsForDefiniteUnitaryGroups §6.3 (*Extension*; any two invariant extensions agree). (iii) ThetaLiftsForDefiniteUnitaryGroups §6.11
by 5.8b.

*NEW*. *Needs:* 5.8a, 5.8b; ThetaLiftsForDefiniteUnitaryGroups §§6.2, 6.3, 6.11; ThetaKernelsForUnitaryDualPairs §§5.7a, 5.7b and MetaplecticAutomorphicForms
§§5.8, 6.4, 6.15.

### 5.8d The constants of a square as functions of the tuple

Let `(i, j)` be a square, `Λ(s, ·)` the Hecke `L`-function (Euler product over the
finite places), `ν_ξ = μ_{j+1}(ξ)/χ_{m−i}`, `ρ_ξ(s) := Λ(s, ν_ξ)/Λ(s, ν_1)` for integers `1 ≤ s ≤ h_sq`, `h_sq` half the sum of the two
ranks of the square (all these values are nonzero), `r_{ij}(ξ) := c(i, j, ξ)/c(i, j, 1)` (5.8c), and `c0(ξ)` the constant of the
bottom (definite) triple of the square, reached by removing `p` planes from `M` and `q` from `M′`, whose spaces have ranks
`a − 2p` and `a′ − 2q`; put `e_□ := ((a − 2p) − (a′ − 2q))/2 = ε_□ + q − p` and `h_□ := ((a − 2p) + (a′ − 2q))/2`. Then
`r_{ij}(ξ)·∏_{l<q} ρ_ξ(ε_□+l+1) = ζ·∏_{l<p+q}u_l·(c0(ξ)/c0(1))·∏_{l<p} ρ_ξ(ε_□+q−l)`:
up to a unit `ζ ∈ 𝕃` away from the twist primes of `ξ` (the residue characteristics of the places below `Q(ξ)`) and `p + q` step
quotients `u_l := u_l(ξ)/u_l(1)` of the step factors `u_l(ξ) = ν_ξ^{T(ξ)}(𝔟𝔠)^{±1}·c_{T,l}(ξ)` (ThetaLiftsForDefiniteUnitaryGroups §6.12:
`T(ξ) = S_□ ∪ Q(ξ)`, `ν_ξ^{T(ξ)}` the value of `ν_ξ` on the part prime to `T(ξ)` of the ideals `𝔟`, `𝔠` of the lattices of the step, `𝔠`
that of the self-dual lattice for the character, and `c_{T,l}(ξ) = ∏_{v∈T(ξ)}c_v(ξ)` the constant of the step at `T(ξ)` for the matched
data normalised as in ThetaLiftsForDefiniteUnitaryGroups §6.2, chosen for every tuple, the same at the places of `S_□` for all tuples; for the base
tuple `T(1) = S_□`; each `u_l` is of the form `β·∏_{v∈S₀} g(v)/g′(v)` with `β ∈ 𝕃` a unit away from the twist primes of `ξ`
and `g(v), g′(v)` integers of `𝕃` dividing `N(v)^{c(v)}`, `c(v)` the conductor exponent at `v`),
`r_{ij}(ξ)` is the product of `c0(ξ)/c0(1)`, of `p` values `ρ_ξ(s)` and of `q` inverse values `ρ_ξ(s)^{−1}` at
consecutive integers. Moreover:
- *(coordinate identity)* there is `κ ≠ 0` independent of `ξ` such that for every tuple there are an algebraic number `υ`,
  a unit at every prime not dividing the twist primes of `ξ`, and matrices `𝐌`, `𝐌′` with entries in `{0, ±1}`, signed
  permutation matrices of the bijection that sends a tuple of subsets to the tuple of complementary subsets, inverse to
  each other, with `conj coord_big = κ·υ·c0(ξ)·𝐌·coord_small` and `κ·υ·c0(ξ)·coord_small = 𝐌′·conj coord_big`, where `coord_big`,
  `coord_small` are the coordinates (in integral bases of the class sets) of the theta lifts of the constant function from the
  two bottom definite groups, of ranks `a − 2p` and `a′ − 2q`;
- *(norms)* the class-sum square norm of the lift from the larger bottom group is `N_big(ξ) = A·∏_{s=1−e_□}^{h_□}Λ(s, ν_ξ)`, `A ≠ 0`
  independent of `ξ` (equivalently: the ratio of `N_big` for two tuples is the ratio of these products, and `N_big ≠ 0`);
- *(bottom ratio)* `c0(ξ)/c0(1) = γ ∈ 𝕃^×`; `N_big(ξ) ≠ 0` and `N_small(1) ≠ 0` (`N_small` the class-sum square norm of the lift from
  the smaller bottom group; the coordinates of both bottom lifts are not all zero); and
  `v_w(γ) ≤ v_w(N_big(ξ)) + v_w(N_small(1)) + 6δ_w` at the places `w` of `𝕃` prime to the twist primes, `δ_w ≥ 0` an explicit integer
  attached to `w`;
- *(reflection)* `Λ(s, ν_ξ)Λ(1 − s, ν_1) = ϵ·Λ(1 − s, ν_ξ)Λ(s, ν_1)` for `1 − e_□ ≤ s ≤ 0`, `ϵ` a unit away from the twist
  primes (the functional equation in ratio form, AnalyticNumberTheoryPartI §2.3a, whose root numbers are products of
  Tate's local constants, ArithmeticGaloisRepresentations §2.7).
- *(constants at `T`)* for every square, every step of its tower recursion, every tuple `ξ` and every `v ∈ T(ξ)`, with
  the bases at `v` placed as in ThetaLiftsForDefiniteUnitaryGroups §6.5 (*The constant at `T`*: the vectors of the removed
  plane first and last),
  `c_v(ξ) = ν_{ξ,w}(−1)·N v^{−c·n}·ν_{ξ,w}(ϖ_v)^{c}·G(ψ_v, ν_{ξ,w})`, `G(ψ_v, ν) := Σ_{y∈(𝒪_v/ϖ_v^c)^×}ν(y)^{−1}ψ_v(y/ϖ_v^c)`,
  where `w | v` is the place of the model, `c ≥ 1` the conductor exponent of `ν_{ξ,w}` (5.8a (r)), `ψ_v` the standard (unramified)
  character, `n = −e` for a step removing a plane from `M′` and `n = 1 − e` for a step removing a plane from `M`, `e` half the
  difference of the two ranks before the step (Tate's local constant of `ν_{ξ,w}` at the integer `n`,
  ArithmeticGaloisRepresentations §2.7, *Arithmetic character constants*, for the additive character `y ↦ ψ_v(−y)`);
  for another placement
  of the plane vectors in the bases `c_v(ξ)` is multiplied by `ν_{ξ,w}(sgn σ)`, `σ` the permutation relating the bases. Under
  the conditions (L1), (L3) of 5.8 the constants `c_v(ξ)` lie in `𝕃`, and so do the step quotients. Hence `c_v(ξ)·ν_{ξ,w}(ϖ_v)^{−c}` is a unit at every place of `𝕃(μ_{p_v^c})` not above the residue characteristic `p_v`
  of `v`, and `|v_𝔭(c_v(ξ)ν_{ξ,w}(ϖ_v)^{−c})| ≤ c(|n| + 1)·v_𝔭(N v)` at the places `𝔭` above it. For the *quotients* between a tuple and
  the base tuple: at `v ∈ S_□` not below `Q(ξ)`, `c_v(ξ)/c_v(1)` is a root of unity; at `v ∈ S₀` below `Q(ξ)` (conductor exponent
  `2` for both characters) it is a root of unity times a quotient of two Gauss sums of the same conductor; at `v` below `Q(ξ)`
  not in `S_□`, `c_v(ξ)` divided by the value at `v` of the factor `ν_1^{S_□}(𝔟𝔠)^{±1}` of the base tuple is a unit away from `p_v`;
  and `ν_ξ^{T(ξ)}/ν_1^{T(ξ)}` is a root of unity on the ideals prime to `T(ξ)`. Hence the quotient `u_l` is a unit at every place of
  `𝕃(μ_{p_v^c} : v ∈ T(ξ))` not above a twist prime of `ξ`; in particular `v_𝔭(u_l) ≤ 2Σ_𝔮 c(𝔮)·v_𝔭(N𝔮)` there (`𝔮` the places of
  `S₀`, `c(𝔮)` the conductor exponents), the left side being `0`. For the step factors `u_l(ξ)` themselves no such bound holds:
  at a place `𝔭` above the residue characteristic of `v ∈ S_□`, `v_𝔭(N v^{−c·n}) = −c·n·v_𝔭(N v)` with `|n|` up to half the
  difference of the ranks of the square.

*Route.* The tower recursion of ThetaLiftsForDefiniteUnitaryGroups §6.12 (under its hypotheses 1–4, given by 5.8b): `q` steps on
`M′` divide by `L`-values at `ε_□ + 1, …, ε_□ + q`, `p` steps on `M` multiply by `L`-values at `ε_□ + q, …, ε_□ + q − p + 1`, and
since `q − p ∈ {0, 1}` they telescope to at most one factor; the lattice-change factor of ThetaLiftsForDefiniteUnitaryGroups §6.12 is `ν_w(ϖ_w)^{2k}`. *Constants at
`T`:* the value of `c_v(ξ)` is the constant at `T` of ThetaLiftsForDefiniteUnitaryGroups §6.5, the local constant of the step
of ThetaLiftsForDefiniteUnitaryGroups §6.12 for the matched data normalised as in ThetaLiftsForDefiniteUnitaryGroups §6.2; the
other assertions of the clause follow from that value. A Gauss sum `G` of a character of conductor exponent `c` at a place of norm `N` is an algebraic
integer with `G·G(ψ_v, ν^{−1}) = ν(−1)N^{c}` (the duality of ArithmeticGaloisRepresentations §2.7;
AutomorphicLFunctionsAndLocalFactors §AL.1.3.4), so `0 ≤ v_𝔭(G) ≤ c·v_𝔭(N)` and `G` is a unit away from the residue characteristic;
`N v^{−c·n}` contributes `−c·n·v_𝔭(N v)`. At `v ∈ S_□` not below `Q(ξ)` the characters `ν_ξ` and `ν_1` differ by a character unramified
at `w` of finite order, so they have the same restriction to the units (the same `G` and the same `c`), and the quotient is
the value of that character at `ϖ_w^c`; at `v ∈ S₀` below `Q(ξ)` the powers of `N v` cancel and the ratio of the values at `ϖ_w^c`
is a root of unity; at a twist place off `S_□` only the residue characteristic of `v` can occur in the valuations. Another
choice of bases changes `c_v` by an element of `ν_v(𝒪_{E_v}^×)`, a root of unity, which does not change valuations. The coordinate
identity: each class-sum coordinate of a bottom lift is an algebraic multiple (a unit away from the twist primes) of a theta
integral of the bottom triangle, and the signed permutation matrices of the complement bijection express the data of one
side in those of the other. The norm formula for `N_big` is a ratio formula, by the doubling `L`-function of the trivial
representation of a definite group (ThetaLiftsForDefiniteUnitaryGroups §§3.1–3.2, pairs of totally definite spaces), with
`N_big ≠ 0` and the constant `A` fixed by a reference tuple; `N_small(1) ≠ 0` because the coordinates of both bottom lifts are
not all zero (by the bottom triangle identity and `N_big ≠ 0`); the valuation bound of the bottom ratio follows by the
integrality of coordinates and norms.

*Checks.*
- Every consequence of the value of `c_v(ξ)` drawn above is unchanged if `ν_{ξ,w}` is replaced by its inverse throughout (`G(ψ_v, ν^{−1})` is again
  a Gauss sum of conductor exponent `c`, and the quotients keep their form); so they do not depend on the convention of the
  matched data at `T` in which that value is read.
- The bound is for quotients only: at the place `v_□` (conductor exponent `1`), for a step with `n = −2` the factor `N v_□^{2}`
  has valuation `2·v_𝔭(N v_□)` at a place `𝔭` above `p_□`, while the places of `S₀` do not lie above `p_□`; in the quotient by the
  base tuple this factor cancels.

*NEW*. *Needs:* 5.8a, 5.8c, ThetaChainsOnDefiniteUnitaryGroups §2.4, ThetaChainsOnDefiniteUnitaryGroups §2.5, ThetaChainsOnDefiniteUnitaryGroups §2.6; ThetaLiftsForDefiniteUnitaryGroups §§3.1, 3.2, 6.2, 6.5, 6.12; 
AutomorphicPadicLFunctionsPartII §§5.7–5.9 (integrality away from explicit primes; Katz–Shimura algebraicity; Deligne's period comparison) and
ComplexMultiplicationAndExplicitReciprocity §§1.2, 2.2 (the Serre tensor construction; the explicit reciprocity law), for the
ratios of critical values of Hecke `L`-functions of `E` under finite-order twists; ArithmeticGaloisRepresentations §2.7 and
AutomorphicLFunctionsAndLocalFactors §AL.1.3.4 (Tate's local constants and Gauss sums); AnalyticNumberTheoryPartI §2.3a.

### 5.8e Bessel periods separate the rows

*Definitions.* Let a grid (5.8a) satisfying the hypotheses of 5.8b be given, with its core
column, its modulus `𝔪_□`, the group `K⁺` and the Bessel datum `(N⁺, ψ⁺)` at the top of column `0`. Let `Λ_{i,0}` be the self-dual
lattice of `V(i, 0)`. For Fock polynomials `𝐩 = (𝐩_i)_{i<m}` of the `m` right pairs of column `0` and *coset data* `𝐜 = (𝐜_i)_{i<m}`,
`𝐜_i` a coset of `𝔪_□·Hom(Λ_{i+1,0}, Λ_{i,0})` in `Hom(Λ_{i+1,0}, Λ_{i,0})`, let `Θ^{(0)}_{𝐩,𝐜}u` be the `m`-fold theta lift along column `0`
of a function `u` on `U(Y_0)`, the Schwartz datum of step `i` being `𝐩_i` at the real places, the indicator of `𝐜_i` at the places
`w(v)` of `𝔪_□` and the lattice vector elsewhere. For functions `φ` on `[U(X⁺)]` and `F` on `[U(V(m, 0))]` put
`B⁺(φ, F) := ∫_{[U(X⁺)]}∫_{[N⁺]}φ(h)·F(nh)·conj ψ⁺(n) dn dh`. Let `V_{Λ⁺}` be the coefficient representation of the algebraic forms on
`U(X⁺)` of the weight fixed by the grid, with its `𝕃`-structure; for an algebraic form `y` on `U(X⁺)` of level `K⁺` with values in
`V_{Λ⁺}` and a linear form `ℓ⁺` on `V_{Λ⁺}` put `⟨ℓ⁺, y⟩(h) := ℓ⁺(h_∞^{−1}·y(h_f))`; and let `y_{κ,i}` be the form supported on the class `κ`
of `Cl⁺ := U(X⁺)(F)\U(X⁺)(𝔸_f)/K⁺` with value the `i`-th vector of a basis of `V_{Λ⁺}(𝕃)`. The *separating family* attached to a
smooth vector `w` of `𝒟^{(0)}` and to `(𝐩, ℓ⁺)` consists of the functionals on the row space `𝒞_0 ≅ ℋ^♮` (5.4)

`ℬ_a(e) := B⁺(⟨ℓ⁺, y_{κ,i}⟩, Θ^{(0)}_{𝐩,𝐜}(e(w)))`,  `a = (𝐜, κ, i)`,

indexed by (coset data) × `Cl⁺` × (basis of `V_{Λ⁺}(𝕃)`); their number is
`N(𝔪_□)^{Σ_{i<m}(r+is)(r+(i+1)s)}·#Cl⁺·dim V_{Λ⁺}` (the first factor is the number of coset data, `∏_i#(Hom(Λ_{i+1,0}, Λ_{i,0})/𝔪_□)`).

*The size predicate `Size_□`.* (o) The weight datum is that of ThetaChainsOnDefiniteUnitaryGroups §2.3a, and the standing
size predicates of the chain hold at its parameters (not given here: their list); (i) `m⁴ ≤ f` and `m ≥ 44`;
(ii) `x²·m³·L·log rd_E ≤ k`; (iii) `m·f·N_m²·d ≤ b`; (iv) `f·m ≤ (r+1)³`; (v) `log g_i ≤ 9L + 1` (`i = 0, 1`) and
`log p_□ ≤ L`; (vi) `log rd_E ≤ log N_E ≤ L/100`; (vii) `Sc + (m+1)·h_c + ½ ≤ b`; (viii) `e′_l(τ) > 0` and `e_l(τ) ≤ 4b`
for all `l`, `τ`. Here `L = x^ε = log b`.

*Statement (the separation).* For every `ε` and every `C_F ≥ 6510` there is `x₀` such that the following holds for every
chain at a scale `(x, ε)` with `x ≥ x₀` and `Size_□`, with the grid of the chain (5.8a, for this `C_F`; its row `0` is the
row tower with the additive character, the Weil representations, the frames and the Cartan involutions of 5.2), the
series projections `Π_𝔣` of 5.3 at the type primes (those of the labelled series of FiniteReductiveGroups §5.7 for the
Teichmüller characters of the chain), and the following measures: on `U(V(i, 0))(𝔸)`, `0 ≤ i ≤ m`, the Haar measure
normalised for the principal congruence subgroup of level `𝔪_□` of the lattice stabiliser, on `U(X⁺)(𝔸)` the one
normalised for `K⁺`, and on `N⁺(𝔸)` the Haar measure with `vol([N⁺]) = 1`. For every nonzero smooth vector `w` of
`𝒟^{(0)}` there are Fock data `𝐩` and a linear form `ℓ⁺` such that all the integrals defining the `ℬ_a` converge
absolutely on all of `ℋ^♮` and the `ℬ_a` are jointly injective there. In particular they separate the points of `𝔼^♮`.
Under `Size_□`, `p_□ < g₀` and `p_□ ≠ g₁`, so the grid exists (5.8a (e)). (Not given here: the normalisation "for a
level" of these measures in terms of the conventions of 5.2.)

*Lemma (the depth pays).* Under `Size_□`, for every `C ≥ 0` and `x ≥ C + 1` there is `0 < σ ≤ ½` with
`e^{Q}·r²·f·g₀g₁·|d_E|^{1/[E:ℚ]}·(2σ)^{1/m} ≤ ½` and `2e^{Q+(6r+15)f} ≤ σ^f·√N(𝔪_□)`, `Q = C·f(r+1)⁴·log b`. Route:
`log N(𝔪_□) ≥ d_□·log p_□ > C_F·f²(r+1)⁶·L`, and the losses
`log 2 + Q + (6r + 15)f + f(log 2 + m(log 2 + Q + log(r²f·g₀g₁|d_E|^{1/[E:ℚ]})))` are at most half of it (this uses
`C_F ≥ 6510`, `C + 1 ≤ k` and the clauses (i), (ii), (iii), (v), (vi)).

*Lemma (the level is not too deep).* Under `Size_□`, `d_□ + 2 ≤ (50C_F + 3)·t⁹·L`, and
`8N_□·log((p_□g₀g₁p_δp′_δ)^{d_□+2}) ≤ 1840(50C_F + 3)·b·log b`: the size condition into which `N(𝔪_□)` enters (the
count of the terms of the coset expansions of 5.8). Its route is not given here.

*Lemma (the gaps of the grid).* For the grid of the chain, the entries of different signs of the Harish-Chandra
parameter of the top stage `V(m, 0)` of column `0` are at least `120(r + ms)³` apart, and those of `Y_0` and of
`X^c_0` at least `1000(r + 1)³` apart. Route: for `Y_0`, ThetaChainsOnDefiniteUnitaryGroups §2.3c (*Gaps of the row
parameter*); for the stages that contain strings of the grid, the spacing `h_c > 2N_□³` of the centres; the
verification is not given here.

*Route* (an outline: the steps are statements with no target here, and their proofs are not given here except as indicated):
(A) *Column `0` is a tower:* each right step is an up-lift, so by the pair statement of 5.2 (ThetaKernelsForUnitaryDualPairs
§5.6a) the `n`-fold lift of `e(w)` is `F′_n(vec_n(𝐩, w))` for a map `F′_n` from one discrete series of `U(V(n, 0))(F_∞)` to cusp
forms, depending on `(e, 𝐜)` only, and all partial lifts are rapidly decreasing. (B) *A period at the bottom:* for `e ≠ 0`,
`w ≠ 0` there is a `K`-finite value `y` of a cusp form on `U(X^c_0)` of level `𝔪_□` and discrete-series type with
`∫_{[U(Y_0)]}y(h)e(w)(h)dh ≠ 0`: a Poincaré series of a translate of a lowest-`K`-type coefficient, unfolded along the orbit of
the added vector `z₀` (`X^c_0 = Y_0 ⊥ ⟨z₀⟩`); its main term is a positive multiple of a value of `e(w′)`, by the eigen-identity
`∫_{U(Y_0)(F_τ)}conj⟨v, π(h)v⟩⟨b, σ(h)w′⟩dh = c⟨b, w′⟩` for discrete series in the branching pattern, taken at a point `x` where
`|e(w′)|` is at least half its supremum (there the lattice has no short vector: a cusp form is small where the lattice has
one); the other terms, indexed by lattice points `z ≠ z₀` with `z − z₀ ∈ 𝔪_□Λ_x`, are each at most
`e^{Q}|c|·(∏_τ‖z‖_{x,τ})^{−(2r+7)}` times the supremum, and by the Lemma (the depth pays) their sum is smaller than the main term.
(C) *The core column is onto:* the composite of the theta descents `U(X⁺) → ⋯ → U(X^c_0)` maps the algebraic forms of level `K⁺`
onto the cusp forms of the bottom type and level `𝔪_□`: this is the surjectivity of 5.5–5.6 for the chain of base rank `r + 1`,
step `s − 1` and `m` steps, with trivial level characters and no twist places; `s − 1 ≥ r + 3` puts the `L`-value of the base
family in the range of absolute convergence, and the Hecke factors of the strings are values at `1, …, s − 1` of nontrivial
unitary characters, as in 5.5. So `y` is a combination of bottoms of chains of descents starting from functions `⟨ℓ⁺, y′⟩`.
(D) *Ascent:* if the period over `[U(Y_0)]` of such a bottom against `u` is nonzero, then by the seesaw for `X^c_0 ⊃ Y_0 ⊥ ⟨z₀⟩`
and then alternately (a Bessel period of a theta lift vanishing for all admitted data forces the Fourier–Jacobi period of the
lifted pair to vanish: unfolding along the unipotent radical, irreducibility of the Heisenberg representation on lattice
vacua, seesaw; and conversely) a Fourier–Jacobi period at the odd stages and a Bessel period at the even stages is nonzero
for suitable data, up to `B⁺(⟨ℓ⁺, y′⟩, Θ^{(0)}_{𝐩,𝐜}u) ≠ 0` at stage `m`; the data of the steps passed are replaced by data of the
family because Fock polynomials times coset indicators span the data of depth `𝔪_□` and the periods are continuous in them.
(E) Hence for every `e ≠ 0` and `w ≠ 0` some `(𝐩, ℓ⁺, y, 𝐜)` gives `B⁺(⟨ℓ⁺, y⟩, Θ^{(0)}_{𝐩,𝐜}(e(w))) ≠ 0`. (F) *The archimedean data can
be fixed:* by (A), the tensor structure of `V_{Λ⁺}^∨` over the real places and the uniqueness of Bessel functionals of gapped
discrete series at each real place (GanGrossPrasadUnitaryGroups 2.6), `B⁺(⟨ℓ⁺, y⟩, Θ^{(0)}_{𝐩,𝐜}(e(w))) = a_w(𝐩, ℓ⁺)·l(e, y, 𝐜)`; one
`(𝐩, ℓ⁺)` with `a_w(𝐩, ℓ⁺) ≠ 0` serves every `e`. (G) Linearity in `y` and the basis `y_{κ,i}` (the level `K⁺` is neat) give the
finite family. The remaining steps of the route are not given here. The route of `p_□ < g₀` and `p_□ ≠ g₁` under `Size_□` is
not given here.

*Check.* A totally definite subspace of `V(m, 0)` of rank `r` would have a complement of rank `ms`, which is not a Bessel
datum for the signature of `V(m, 0)` (`m/2` negative directions): the subspace of the separation has codimension `m − 1`.
`s = r + 6` keeps the arithmetic of 5.8b (`(t + s)/2 > 2m − 1`), since `r + 6 > m`.

*NEW*. *Needs:* 5.8a, 5.8b, 5.2, 5.3, 5.4 (and, for the outline, 5.5, 5.6); ThetaChainsOnDefiniteUnitaryGroups §2.3a, ThetaChainsOnDefiniteUnitaryGroups §2.3c; FiniteReductiveGroups §5.7; GanGrossPrasadUnitaryGroups 2.6, 4.1; ThetaKernelsForUnitaryDualPairs §5.6a.

### 5.8 The rational structure of the row space

Let a grid satisfy the hypotheses of 5.8b, and let the field `𝕃` of ThetaChainsOnDefiniteUnitaryGroups §2.6 contain, for
the grid, the base tuple and every tuple `ξ` considered (finitely many), the following numbers. Write `T_w(ξ)` for the set
of places of `E` consisting of the chosen places `w(v)`, `v ∈ S_□` (5.8a), and of the places of `Q(ξ)`, and `d(w)` for the
exponent of the modulus `𝔪_□` at `w` (`d(w) = 2` above `S₀`, `d_□` at `w(v_□)`), with `d(w) := 1` at a place of `Q(ξ)` not
above `S_□`.
- (L1) Every value of every local component, at every finite place of `E`, of `μ_j` (`1 ≤ j ≤ m`), of the twisting
  characters of the tuples and of `χ_1, …, χ_m`; the values `η̃(ϖ_v)·N v^{−1/2}` at the places where `η̃` is
  unramified; the values at their unramified places of `δ`, `δ′` and of the character of `E` that the chain attaches
  to `ψ` (not given here: its definition).
- (L2) The eighth roots of unity.
- (L3) The roots of unity of order `N(w)^{d(w)}` for every `w ∈ T_w(ξ)`.
- (L4) `√N(w)` for every `w ∈ T_w(ξ)`, and for every `w` in a set `P_𝔡` fixed with the grid: one place of `E` above
  each place of `F` that lies below the relative different `𝔡_{E/K}`, taken among the places dividing `𝔟` or `c(𝔟)`,
  where `𝔡_{E/K} = 𝔟·c(𝔟)` with `𝔟 + c(𝔟) = 1` and `𝔟` stable under `Φ` (these places of `F` split in `E`,
  ThetaChainsOnDefiniteUnitaryGroups §2.2 (g)).
- (L5) *Phases.* For every `ξ`, every `w ∈ T_w(ξ)` and every local argument at `w` at which the local term of a coset
  expansion of 5.8 and the transported local datum are both nonzero, the value `ψ_w(φ)` of the additive character of
  the Weil datum at `w` at the *phase* `φ` of the argument: the sum, over the steps `j` of the column, of a term
  attached to the step point of the argument and, when `m − 2 − j` is even, of the pairing
  `Σ_r (row variable)_{j+1,r}·(column variable)_{j,r}`. (For arguments with denominators at most `ϖ_w^{d(w)}` these are
  `N(w)^{d(w)}`-th roots of unity and (L5) follows from (L3).) *Jets.* For every `ξ`, every pure tensor of the coset
  expansions of 5.8 and every class of the class set: the entries, in the fixed `𝕃`-bases of the coefficient spaces, of
  the class-set theta kernels (ThetaChainsOnDefiniteUnitaryGroups §3.3) of the `2m` definite pairs at the definite
  corner of the grid (the `m` pairs carrying `μ_1(ξ), …, μ_m(ξ)` and the `m` pairs carrying `χ_1, …, χ_m`), at the pairs
  of consecutive class points.
- (L6) The ratios `Λ(s, ν_ξ)/Λ(s, ν_1)` for all squares `(i, j)` and all integers `1 ≤ s ≤ N_□ + 1` (5.8a) with
  `Λ(s, ν_1) ≠ 0`.
- (L7) *Bottom sums.* For every square `(i, j)`: there are a bottom triple of the square (5.8d) and two nonzero
  complex numbers `Ω`, `Ω′`, depending neither on the tuple nor on the point, such that for every `ξ`, every finite
  adelic point `h` of the unitary group of the third space of the triple and every monomial `P` in the Fock
  variables for which the kernel is integrable, `I(ξ; P; h)/Ω ∈ 𝕃` and `I′(ξ; P; h)/Ω′ ∈ 𝕃`, where `I`, `I′` are the
  theta integrals over the two definite groups of the bottom triple (the two sides of the bottom triangle identity).

Let `𝕃` also contain the values of the irreducible characters of `G₀`
and those of the characters of the levels of ThetaChainsOnDefiniteUnitaryGroups §2.9a at the type primes (so that `Π_good` and every `e_{P,χ_P}` lie in `𝕃[G₀]`).
Every number in (L1)–(L6) is algebraic ((L6) by AutomorphicPadicLFunctionsPartII §5.8: `ν_ξ` and `ν_1` differ by a character
of finite order, so they have the same infinity type, critical at these `s`, and their periods cancel in the ratio),
and so are the quotients of (L7) for suitable `Ω`, `Ω′`; the set is finite once the
tuples are fixed, and `𝕃` is chosen after the twisting datum (ThetaChainsOnDefiniteUnitaryGroups §2.5, Lemma (iv)). Not
given here: the existence of `Ω`, `Ω′` in (L7) (it belongs to the rationality of the theta integrals of definite
triples, ThetaChainsOnDefiniteUnitaryGroups §3.3), and the explicit form of the term attached to a step point in (L5).
Let `x ≥ x₀` and `Size_□` hold, for the grid of the chain (5.8e), take the functionals `ℬ_a` of 5.8e for a vector `w` and data `(𝐩, ℓ⁺)`
chosen once (jointly injective by 5.8e), and assume the hypotheses of 5.6 for the base tuple and for every tuple `ξ`
considered. There are a constant `κ_G ≠ 0` and, for every tuple `ξ`, a
root of unity `ϱ_ξ ∈ 𝕃`
such that for every `𝕃`-rational form `x ∈ Π_good·𝒰^♮_ξ`:

`ϱ_ξ · ∏_{i,j<m} c(i, j, ξ) · ℬ_a(ι_ξ x) = κ_G · v(ξ, x, a)`,  `v(ξ, x, a) ∈ 𝕃`,

`v` a finite class sum of jets of theta functions on definite groups. Moreover `c(i, j, ξ)/c(i, j, 1) ∈ 𝕃^×`. Hence
`𝔼_𝕃 := {e ∈ 𝔼^♮ : c_tot(1)κ_G^{−1}ℬ_a(e) ∈ σ₀(𝕃) for all a}` (`c_tot = ∏ c`) is an `𝕃`-structure of `𝔼^♮` containing `ι_ξ(x)` for every
tuple `ξ` and every rational `x`, stable under the Hecke operators away from `S(1)` and under `G₀`, so that every level part
`𝔼_{b,𝕃} := e_{P_b,χ_{P_b}}𝔼_𝕃` is an `𝕃`-structure of `𝔼_b`; the kernels of the `ι_ξ` are defined over `𝕃`, hence so is every
`Q^{(P,χ_P)}_ξ = 𝒰^{(P,χ_P)}_ξ ∩ (𝒰^{(P,χ_P)}_ξ ∩ ker ι_ξ)^⊥` (the class-sum product of `𝒰^♮_ξ` is `𝕃`-rational, and
`𝒰^{(P,χ_P)}_ξ = Π_good e_{P,χ_P}𝒰^♮_ξ` is rational because both idempotents lie in `𝕃[G₀]`), and the lattices
`ι_ξ(proj_{Q_ξ}(M̃_ξ ∩ ℋ^{rt}_ξ))` for different `ξ` are commensurable. All these statements are at principal level at the type
primes; the level parts follow because the operators commute with `G₀`.

*Route.* By 5.8b each square is a complementary triple, and 5.8c gives `c(i, j, ξ)`. Crossing the `m²` squares moves "descend
along row `0`, then lift along column `0`" to "lift along column `m`, then descend along row `m`", at the price `∏ c(i, j, ξ)`
and a root of unity coming from the values of the twisting characters; the period pairing then unfolds into finitely many
integrals over the definite group of `V(m, m)` of products of iterated lifts between definite groups, each a finite class
sum of jets of CM theta functions (ThetaChainsOnDefiniteUnitaryGroups §3.2, ThetaChainsOnDefiniteUnitaryGroups §3.3), whose period-normalised values lie in `𝕃` (ThetaChainsOnDefiniteUnitaryGroups §2.6).
*Rationality of the ratios.* By 5.8d, `c(i, j, ξ)/c(i, j, 1)` is the product of a unit `ζ ∈ 𝕃` away from the twist primes,
of the step quotients `u_l`, of `c0(ξ)/c0(1) ∈ 𝕃^×` and of ratios `Λ(s, ν_ξ)/Λ(s, ν_1)` and their inverses. Each factor lies
in `𝕃`: the ratios by (L6); the step quotients because the constants `c_v(ξ)` of 5.8d lie in `𝕃` (the Gauss sum
`G(ψ_v, ν_{ξ,w})` is a combination of `N(w)^c`-th roots of unity, `c ≤ d(w)`, with coefficients values of `ν_{ξ,w}`: (L1),
(L3)); the bottom ratio by 5.8d and (L7). No cancellation between the Gauss sums of the step quotients and those of the
twisted critical values is used. *Values of `η̃`.* The class sums contain `η̃` through `η̃(ϖ_v)N v^{−1/2}` at unramified
places and through `√N(w)` at the places of (L4), all in `𝕃` by (L1), (L4), and the Weil constants are eighth roots of
unity (L2). Then `ℬ_a(ι_ξ x)` is a
`(ϱ_ξ c_tot(ξ)/c_tot(1))^{−1}`-multiple of an element of `𝕃`. *The `𝕃`-structure.* `𝔼_𝕃` is an `𝕃`-subspace containing `ι_1(x)` for every
rational `x`; these span `𝔼^♮` over `ℂ` because `ι_1` maps `Π_good·𝒰^♮_1 ⊗ ℂ` onto `𝔼^♮` (5.6) and `𝒰^♮_1` has the `𝕃`-structure of its
rational forms; and `𝕃`-independent elements of `𝔼_𝕃` are `ℂ`-independent, because `e ↦ (ℬ_a(e))_a` is injective by 5.8e with
values in `σ₀(𝕃)^A` on `𝔼_𝕃` up to the common factor. So `𝔼_𝕃 ⊗_𝕃 ℂ = 𝔼^♮`. For every `ξ`, `ι_ξ` is onto (5.6), so the lattice
`ι_ξ(proj_{Q_ξ}(M̃_ξ ∩ ℋ^{rt}_ξ))` spans `𝔼_𝕃` and is finitely generated over the integers of `𝕃`: any two are commensurable. The
Hecke and `G₀`-stability because these operators act on the rational forms of `𝒰^♮_ξ` by `𝕃`-rational matrices and commute
with `ι_ξ`.

*Check.* Separation alone does not give a rational structure: `z ↦ (z, αz)` separates the points of a complex line, and for
transcendental `α` no nonzero point has both coordinates in `𝕃`; the spanning by the rational images `ι_1(x)` is what 5.6
supplies.

*NEW*. *Needs:* 5.2, 5.3, 5.4, 5.6, 5.8a, 5.8b, 5.8c, 5.8d, 5.8e, ThetaChainsOnDefiniteUnitaryGroups §2.2, ThetaChainsOnDefiniteUnitaryGroups §2.4, ThetaChainsOnDefiniteUnitaryGroups §2.5, ThetaChainsOnDefiniteUnitaryGroups §2.6, ThetaChainsOnDefiniteUnitaryGroups §3.2, ThetaChainsOnDefiniteUnitaryGroups §3.3, FrobeniusRestrictedRieszSums §0.9; MetaplecticAutomorphicForms §§5.8, 6.4, 6.15;
AutomorphicPadicLFunctionsPartII §5.8.

### 5.9 Multiplicities on the row group and on the model groups

Assume that consecutive entries of the row parameter `(v(τ); −e′(τ))` differ by at
least `100r⁴` at every `τ ∈ Φ` (a size condition on the parameters, not an open statement: for the words of ThetaChainsOnDefiniteUnitaryGroups §2.3 it means
`4Δ_w ≥ 100r⁴`, `h_gap ≥ 100r⁴` in (W5) and `v_{k−2}(τ) + e′_0(τ) ≥ 100r⁴`, which `SizeGap` (ThetaChainsOnDefiniteUnitaryGroups §2.3c) and the range of `Δ_w` (ThetaChainsOnDefiniteUnitaryGroups §2.3b) give).
Then for every step `j`, every tuple `ξ` and every Hecke eigensystem `𝔥` away from `S(ξ)`:
`dim 𝔼^♮[𝔥] = dim 𝒞(W_j)^{good}[𝔥]`, where `𝒞(W_j)^{good} := Π_good·𝒞(W_j)` is the image of the good idempotent of 5.3
read on `U(W_j)` through `G₀` (the type primes split completely, so `U(W_j)(F_v) ≅ GL_r(F_v) ≅ U(Y_0)(F_v)` at `v | g₀g₁`
and the labels and `Π_good` are defined in the same way), the parts labelled as in the notation of this layer. The
same holds for the level-`(P, χ_P)` parts for every level `(P, χ_P)` at the type primes, in particular for `𝔼_0`, `𝔼_1`. In
particular the `𝔥`-part of the model side is nonzero whenever `𝔼^♮[𝔥]` is.

*Route.* `U(Y_0)` and `U(W_j)` are unitary groups in the odd number `r` of variables over `E/F`, unramified at every
finite place, isomorphic at every finite place through isometries of self-dual lattices (ThetaChainsOnDefiniteUnitaryGroups §2.2); at every real place `𝒟^{(0)}`
and `D_{W_j}` are discrete series with the same Harish-Chandra parameter, members of the same packet; the good types at
the places above `g₀` are jointly cuspidal (5.3 (iv)). The equality of cuspidal multiplicities for two such inner forms
(BaseChangeAndGaloisRepresentationsForUnitaryGroups §13.8a, equality of cuspidal multiplicities for inner forms in an odd
number of variables: isometric at every finite place through isometries carrying lattice to lattice, Harish-Chandra
parameters in `ℤ^r` with consecutive entries at least `100r⁴` apart and any members of the packets at the real places, a
jointly cuspidal family of types on a NONEMPTY finite set `S` of split places, finite parts unramified outside `S`) gives
`m_cusp(𝒟^{(0)} ⊗ σ) = m_cusp(D_{W_j} ⊗ σ∘Φ^{−1})` for every irreducible admissible `σ` of `U(Y_0)(𝔸_f)` with a type vector for
the family (a nonzero vector fixed by `Stab(L_v)` at every finite place `v ∉ S` that lies, at every `v ∈ S`, in the isotypic
part of the type), `Φ` the isomorphism of finite adelic groups induced by the isometries. Here `S` is the set of all the
places above `g₀g₁` (the forms of level `K^♮` are unramified only outside `g₀g₁`), and the family of types is `(τ_v)_{v|g₀g₁}`,
the tensor factors of an irreducible constituent, not killed by `Π_good`, of the `G₀`-module of the vectors of principal
level; a nonzero vector of that constituent is a type vector, and the joint cuspidality comes from the places above `g₀`
by 5.3 (iv) and is preserved when the places above `g₁` are added. Its proof is a comparison of simple trace formulas with
pseudo-coefficients of the discrete series at the real places and the cuspidal types at `S`; its inputs are
Harish-Chandra's classification of discrete series with their lowest `K`-types, the rapid decay of cusp forms,
Harish-Chandra's finiteness theorem, the Dixmier–Malliavin factorisation with control of supports, the trace class
property of `R(f)` on the cuspidal spectrum for smooth compactly supported `f`, the Bernstein–Zelevinsky geometric lemma
and Zelevinsky's classification by segments; Green's description of the cuspidal characters of `GL_d` over a finite
field enters only through the joint cuspidality of the good types (5.3 (iv)). Decomposing the cusp forms of both
groups as (discrete series) ⊗ (finite part), taking the vectors of principal level at the type primes (where `Φ`
identifies the two `G₀`-modules `σ^{K(g)}`), applying `Π_good` and the level idempotents and taking Hecke eigen-parts gives
the equality of dimensions; the parts on both sides are those on which the Hecke operators act by `𝔥`, and the same `σ`
occurs on both groups. (The set of good tuples is also stable under duality: condition (3) of 5.3 is symmetric in `χ_{v,j}`
and `χ_{v,j}^{−1}`, the others are invariant under `𝔣 ↦` its reciprocal; this is not used.)

*KNOWN* in kind (Clozel; Labesse; Arthur), *NEW* in this form. *Needs:* ThetaChainsOnDefiniteUnitaryGroups §2.2, ThetaChainsOnDefiniteUnitaryGroups §2.3, ThetaChainsOnDefiniteUnitaryGroups §2.3b, ThetaChainsOnDefiniteUnitaryGroups §2.3c, ThetaChainsOnDefiniteUnitaryGroups §2.9, ThetaChainsOnDefiniteUnitaryGroups §2.9a, 5.1, 5.3, 5.4, 5.7;
BaseChangeAndGaloisRepresentationsForUnitaryGroups §13.8a (equality of cuspidal multiplicities for inner forms in an odd number of
variables isometric at every finite place), with its inputs AutomorphicFormsOnReductiveGroups §§2.4, 2.7, 4.2,
AutomorphicSpectralTheory §4.5 and DiscreteSeriesCoefficientsAndAutomorphicMetrics §9.1, SmoothRepresentationsOfLocalGroups §§SR.2.2
(the geometric lemma), SR.5.2 (segment representations);
FiniteReductiveGroups §§1.2, 5.2, 5.5, 5.7 (for 5.3 (iv)).

### 5.10 The descent constant through the model eigenvalues

Under the hypotheses of 5.6, for every tuple `ξ` and every eigensystem `𝔥` away from
`S(ξ)`:

`ι_ξ ι_ξ^* = 𝔫 · ∏_{j=1}^m λ_j(ξ, 𝔥)` on `𝔼^♮[𝔥]`,  `𝔫 := 𝔫₀ / ∏_{j=1}^m a_j`,

`𝔫` independent of `𝔥` and `ξ`; the same holds on each level part `𝔼_b[𝔥]`. Here `ι_ξ^*` is the adjoint for the class-sum
product of `𝒰^♮_ξ` and the Petersson product of 5.1 on `𝔼^♮`; on a level-`(H, χ_H)` part it is equally the adjoint for the form
`X_ξ` (the class-sum product of `𝒰^♮_ξ` on that part divided by `|H|`) and the Petersson product divided by `|H|`. If
`𝔼^♮[𝔥] ≠ 0`, then, under the hypothesis of 5.9, every `𝒞(W_j)[𝔥]` is nonzero and `λ_j(ξ, 𝔥)` is the eigenvalue of `θ_jθ_j^*`
there.

*Route.* By the definition `λ_j(ξ, 𝔥) := a_j L_j` in 5.7 (ii), with `L_j = L^{S(ξ)}((t+1)/2, B_𝔥 × μ_j(ξ)^{−1})` the `L`-value
of 5.6, the identity is 5.6 rewritten: the chain's factor of step `j` and the model eigenvalue are constants times the
same `L`-value, and no local factor is compared place by place. What 5.9 adds is that `λ_j(ξ, 𝔥)` is an eigenvalue of
`θ_jθ_j^*` on a nonzero space (5.9 compares the parts on which the Hecke operators act by `𝔥` on both groups).

*Check.* `m = 1`: `𝔫 = 𝔫_1/a_1`, and both sides are `𝔫_1 L_1`.

*NEW*. *Needs:* 5.6, 5.7, 5.9.

### 5.10a The rational structure of the model forms

*Definitions.* Let `𝕃` be as in 5.8 and `1 ≤ j < m`. Because `Φ` is
induced from `K` and `W_j` has the same signature `(k + j − 1, m − j)`, `k + j − 1 ≠ m − j`, at every `τ ∈ Φ`, the
Shimura datum of `U(W_j)` has reflex field `K`. Evaluation at the extremal vector of the lowest `K_∞`-type of the
holomorphic discrete series `D_{W_j}` (5.7) identifies `𝒞(W_j)` with the space of cuspidal sections of an automorphic
vector bundle on the Shimura variety of `U(W_j)` of the level of 5.7 (AutomorphicBundles §§3.1, 3.2, 11.2,
11.9, 11.18: the bundle, cusp forms as sections of its subcanonical extension, their comparison with analytic forms and
their rational structure), and the canonical models over `K` give `𝒞(W_j)` an `𝕃`-structure `𝒞(W_j)_𝕃` (sections over `𝕃`, read
through `σ₀`), stable under `G₀` and
the Hecke operators away from `S(1)`. For an embedding `σ : 𝕃 → ℂ` the *realisation* `j_σ` of `𝒞(W_j)_𝕃` is the base
change along `σ`: if `σ|_K = ι₀|_K`, an automorphism of `ℂ` extending `σ∘σ₀^{−1}` fixes `K`, permutes `Φ`, leaves the
Hermitian space unchanged, and the conjugate datum is that of `W_j` with the places of `Φ` relabelled (AutomorphicBundles
§§2.7, 4.3, and §6.4 for the subcanonical section spaces), so `j_σ` takes values in the row space of `U(W_j)`
for the holomorphic discrete series of the relabelled
parameter; if `σ|_K ≠ ι₀|_K`, then `σ̄ := c∘σ` restricts to `ι₀|_K` and `j_σ(y) := conj j_{σ̄}(y)`, with values in the
complex conjugates of those forms (antiholomorphic discrete series). `j_{σ₀}` is the inclusion. For `j = m` (`W_m`
definite), `𝒞(W_m)_𝕃` is the space of `𝕃`-valued algebraic forms (ThetaChainsOnDefiniteUnitaryGroups §3.1) and `j_σ` applies `σ` to the values.

API: `j_σ` is injective, `σ`-semilinear, `G₀`-equivariant and Hecke-equivariant with `σ` applied to the eigenvalues; the
Petersson products of the realisations define Hermitian forms `⟨j_σ y, j_σ y′⟩` on `𝒞(W_j)_𝕃`, and
`⟨j_σ y, j_σ y′⟩ = conj⟨j_{σ̄} y, j_{σ̄} y′⟩` when `σ|_K ≠ ι₀|_K`.

*Route.* Canonical models of unitary Shimura varieties and of their automorphic vector bundles, and the conjugation of
these models by automorphisms of `ℂ` (AutomorphicBundles §§2.7, 3.1, 3.2, 4.3, 6.1, 6.4, 11.2, 11.9, 11.18; ShimuraVarieties
§§4.4, 4.12, 6.7: canonical models over the reflex field, their uniqueness, their existence in abelian type); the reflex field
from the equal signatures along a CM type induced from `K`; the antiholomorphic case is the complex conjugate manifold.

*KNOWN* (Shimura; Deligne; Milne; M. Harris). *Needs:* 5.7, 5.8, ThetaChainsOnDefiniteUnitaryGroups §2.6, ThetaChainsOnDefiniteUnitaryGroups §3.1; AutomorphicBundles §§2.7, 3.1, 3.2, 4.3,
6.1, 6.4, 11.2, 11.9, 11.18; ShimuraVarieties §§4.4, 4.12, 6.7.

### 5.11 Positivity of the model eigenvalues at every embedding

*Lemma (rational lift).* The theta lift of an `𝕃`-rational algebraic form on
`U(V_j)`, read at the extremal vector of 5.7, lies in `𝒞(W_j)_𝕃` up to one phase independent of the form: it is the class
sum, over the classes of `V_j`, of algebraic theta values of the lattices of the classes with the harmonic polynomials of
the form; write `κ_rat` for that phase. Write `λ_j(ξ, 𝔥, σ)` for the scalar of the `σ`-realisation of `θ_jθ_j^*` on a nonzero part
(`λ_j(ξ, 𝔥, σ₀) = λ_j(ξ, 𝔥)`).

*Theorem* (base tuple). Let `σ` be an embedding of `𝕃`.
(a) If `σ` restricts on `K` to `ι₀|_K` (that is, `σ = σ₀∘g` with `g ∈ Gal(𝕃/K)`), there are: a function `𝔲_σ` on `U(W_j)(𝔸)`
with `|𝔲_σ| = 1`, left invariant under `U(W_j)(F)` and right invariant under `U(W_j)(F_∞)` and under the level (a function on
the finite set of connected components), equal to `1` for `σ = σ₀`; a central element `ζ` of `U(W_j)(𝔸_f)` supported at
the type primes, lifting a central element of `G₀`; and `κ_σ ∈ ℂ` with `|κ_σ| = 1`; such that
`𝔲_σ·j_σ(y) = κ_σ·R(ζ)θ_j^σ(x^σ)` for every rational form `x` and the rational vector `y ∈ 𝒞(W_j)_𝕃` with `j_{σ₀}(y) = κ_rat·θ_j(x)`
(`κ_rat` the phase of the Lemma), where `θ_j^σ` is the model lift for the conjugated characters `μ_j^σ`, `η̃^σ` and the
minor-product vector at the places relabelled by `σ`.
(b) If `σ|_K ≠ ι₀|_K`, then `σ̄ = c∘σ` is as in (a), the discrete series at `σ` is the antiholomorphic one, `j_σ` is the
complex conjugate of `j_{σ̄}`, and `⟨j_σ y, j_σ y′⟩ = conj⟨j_{σ̄} y, j_{σ̄} y′⟩`; hence `λ_j(1, 𝔥, σ) = λ_j(1, 𝔥, σ̄)`. So each infinite place of `𝕃` (a pair
`{σ, σ̄}`) contains exactly one embedding over `K`, and the scalar at the place is the one of the conjugate data (a) at
that embedding.
Consequently `λ_j(1, 𝔥, σ) > 0` for every `σ`, its main term (the hook products of `‖Δ_j‖²`) is that of the base
embedding, and, under the hypotheses of 5.6, `𝔫 > 0` as soon as `𝔼^♮ ≠ 0`.

*Route.* (Rational lift.) The lift from a definite group is a finite class sum of theta functions of the lattices of the
classes, and on the moduli space of abelian varieties with `𝒪_E`-multiplication these are algebraic theta values (their
algebraicity is not given here); this gives the class-sum description over a number field.
(Conjugation.) Both sides are the same classical class sum of theta
values with characteristics, evaluated at the complex fibre of the moduli space over the embedding; no reciprocity law
is used. An automorphism fixing `K` permutes `Φ` and leaves the Hermitian space unchanged (5.10a); `σ` acts on the
coefficients, on the roots of unity of the level and on the characteristics by a dilation `q ↦ m·q` with `m` prime to
the level, which the central element `ζ` (given by the scalar `m`, up to sign, at the type primes) absorbs; `𝔲_σ` is the
ratio of the frame constants of the two uniformisations (`1` at `σ₀`), and `κ_σ` is the phase of the archimedean
intertwiner at `σ` times the covering constant. (Positivity.) A conjugate datum is an instance of 5.7 at `σ`, so
`θ^σθ^{σ*}` is a real scalar on each part; the realised rational lift matrix is injective on rational coordinates, so the
scalar is a ratio of squared norms of nonzero vectors and the Hermitian form of the coordinates, hence positive; only
`|𝔲_σ| = |κ_σ| = 1` is used. (b) `K` is imaginary quadratic, so `σ̄` restricts to `ι₀|_K`, and the forms at `σ` are the
complex conjugates of the forms at `σ̄` (5.10a). The hook sum is unchanged because the relabelling is a bijection of `Φ`.
`𝔫 > 0` because `ι_1ι_1^*` is positive on `𝔼^♮ ≠ 0` and every `λ_j > 0` (5.10).

*Check.* `σ = σ₀`: `𝔲_σ = 1`, `ζ = 1`, and the statement is 5.7(iii).

*NEW* (conjugation statement), *KNOWN* ingredients (Shimura; Deligne; Milne–Shih; M. Harris). *Needs:* 5.6, 5.7, 5.10, 5.10a,
ThetaChainsOnDefiniteUnitaryGroups §2.6; MetaplecticAutomorphicForms §§3.44, 5.6; ThetaLiftsForDefiniteUnitaryGroups §§1.2, 1.6, 1.7–1.9;
AbelianSchemesAndArithmeticModuli A5.3–A5.4 (algebraizability of complex tori with a positive Riemann form; the line of
theta functions of a principal polarisation).

### 5.12 Surjectivity of the descent and its Gram matrix

Assume the hypotheses of 5.6, of 5.8 and of 5.9, and that `𝕃` (ThetaChainsOnDefiniteUnitaryGroups §2.6) contains
the eigenvalues on `𝔼^♮` of finitely many Hecke operators away from `S(1)` that separate its eigensystems; such
eigenvalues are algebraic, because by 5.9 the eigensystems of `𝔼^♮` are those of good algebraic forms on the definite
`U(W_m)`, on which the Hecke operators are rational, so such an `𝕃` exists. For every tuple `ξ` and every level `(H, χ_H)`
at the type primes whose character `χ_H` takes its values in `𝕃` (so that `e_{(H,χ_H)} ∈ 𝕃[G₀]`; this includes `H = {1}` and,
by 5.8, the levels `(P_0, χ_{P_0})`, `(P_1, χ_{P_1})` of ThetaChainsOnDefiniteUnitaryGroups §2.9a), let `Z_ξ` be the
`𝕃`-rational points of `Q^{(H,χ_H)}_ξ = ι_ξ^*(𝔼_{(H,χ_H)})` (5.4, 5.8) and
`X_ξ` the `𝕃`-rational Hermitian form of the coordinates, the class-sum product of `𝒰^♮_ξ` on the level-`(H, χ_H)` part
divided by `|H|`. Then `ι_ξ` maps `Z_ξ` injectively onto `e_{(H,χ_H)}𝔼_𝕃` (5.8), `ι_ξ(𝒰^{(H,χ_H)}_ξ) = ι_ξ(Q_ξ^{(H,χ_H)}) = 𝔼_{(H,χ_H)}`,
and on the part `Z_ξ[𝔥]` of every eigensystem the Gram matrix is

`⟨ι_ξ x, ι_ξ y⟩ = |H| · 𝔫 · ∏_j λ_j(ξ, 𝔥) · X_ξ(x, y)` (`|H| = 1` at principal level).

*Metrics at the other embeddings (a definition).* For the base tuple and an embedding `σ ≠ σ₀` of `𝕃`, the metric of
`e_{(H,χ_H)}𝔼_𝕃 ⊗_σ ℂ` is defined as the Hermitian metric transported by `ι_1` from `|H|·𝔫·∏_jλ_j(1, 𝔥, σ)·X_1^{(σ)}` on the parts,
with the one constant `𝔫` of 5.10 at every `σ`, where `λ_j(1, 𝔥, σ)` is that of 5.11 and `X_1^{(σ)}` is the class-sum product of the
`σ`-realisation of the rational forms (`σ` applied to their values in the coordinates of the class lattices, 5.10a for `j = m`,
divided by `|H|`): a Hermitian form for the conjugation `c_σ = σ^{−1}∘(complex conjugation)∘σ` of ThetaChainsOnDefiniteUnitaryGroups §2.6. It is
positive definite, and at `σ₀` it is the Petersson metric. In particular this holds for `𝔼_0` and `𝔼 = 𝔼_1`. (The `σ`-conjugate
of the rational form `X_1` is not used: it is sesquilinear for `σ∘c_𝕃∘σ^{−1}`, which differs from complex conjugation when `c_σ ≠ c_𝕃`,
ThetaChainsOnDefiniteUnitaryGroups §2.6; already on a rational line with `X_1(x, x) = 1` and `a ∈ 𝕃` with `σ(c_𝕃(a)) ≠ conj σ(a)` it is not Hermitian.)

*Route.* `Q^{(H,χ_H)}_ξ` and its eigen-parts are defined over `𝕃`: the Hecke operators away from `S(ξ)` and the central
idempotents and level idempotents of the type primes preserve the rational structures of 5.8 and are closed under
adjoints, and the eigen-packets of the rows are separated on every definite model `U(V_j)` (two distinct packets have, at
every step, transferred types that differ at some operator), so the decompositions into parts are direct over `𝕃`;
each part is the joint kernel of finitely many polynomials with coefficients in `𝕃` in the separating Hecke operators
of the hypothesis. Then linear algebra: on each part
`ι_ξι_ξ^* = 𝔫∏λ_j ≠ 0` (5.10), so `ι_ξ` is injective on `Q^{(H,χ_H)}_ξ = ι_ξ^*(𝔼_{(H,χ_H)})` (5.4), every `e ∈ 𝔼_{(H,χ_H)}[𝔥]` equals
`ι_ξ(ι_ξ^*e)/(𝔫∏_jλ_j)`, and for `x, y` in the part `⟨ι_ξ x, ι_ξ y⟩ = 𝔫∏_jλ_j⟨x, y⟩_{𝒰^♮_ξ} = |H|·𝔫∏_jλ_j·X_ξ(x, y)`; positivity of
the metric at `σ` is 5.11.

*NEW*. *Needs:* 5.4, 5.6, 5.8, 5.9, 5.10, 5.11.

### Examples

These are instances worked in the Checks above. For `r = 1` (the Check of the notation of this layer) the Euler factors of
`L(s, B_𝔥 × μ^{−1})` and of `L(s, B_𝔥 × μ)` at the two places above a split place differ as soon as `β² ≠ 1` and `u² ≠ 1`. In
5.3, for `r = 15`, labels of factor types `(1, 3, 11)` at some places above `g_i` and `(2, 2, 11)` at the others satisfy (5)
but not (4), since `4 = 1 + 3 = 2 + 2`; for `r = 7` the interval `(3.5, 4]` of (5) contains no prime, so no tuple is good and
`𝔼^♮ = 0`. In 5.5, at a twist place with `i = 0`, `r = 1`, `t = 3` and `q = 2`: `idx_v(1) = #ℙ³(𝔽_2) = 15` and
`‖Φ^Q_{1,v}‖² = 1/16`, whose product is `15/16 = 1 − 2^{−4}`. In 5.6, at a split place with `B_𝔥(w) = {β}`, `B_𝔥(w̄) = {β̄}`
and `μ(ϖ_w) = u`, `|u| = 1`, the two Euler factors multiply to `|1 − βū N w^{−s}|^{−2} > 0` for real `s`. In 5.10, for `m = 1`,
`𝔫 = 𝔫_1/a_1` and both sides are `𝔫_1 L_1`. In 5.2a, for a compact group `𝐆` the operator `ρ(e_σ)` is the projection onto the
`w`-line of the `σ`-isotypic part.

### Dependencies

FrobeniusRestrictedRieszSums §§0.1, 0.3, 0.4, 0.9 (the host and its predicates); ThetaChainsOnDefiniteUnitaryGroups
§§2.1, 2.2, 2.2a, 2.3, 2.3a, 2.3b, 2.3c, 2.4, 2.5, 2.6, 2.7, 2.8, 2.9, 2.9a, 2.9c, 3.1, 3.2, 3.3 (the data, spaces, characters, levels
and column steps of the chain); ThetaLiftsForDefiniteUnitaryGroups §§0.1, 1.2, 1.4, 1.6, 1.7, 1.8, 1.9, 2.5, 3.1, 3.2, 5.3,
6.1, 6.2, 6.3, 6.5, 6.10, 6.11, 6.12; ThetaKernelsForUnitaryDualPairs §§3.21a, 3.45, 3.46, 3.46a, 3.47, 3.47a, 3.47b, 4.4a,
5.6a, 5.7a, 5.7b, 6.4a, 6.11, 6.13a, 6.13b, 6.13c; HermitianFormsAndLattices §§4.5, 5.5, 5.6, 5.7; FiniteReductiveGroups
§§1.2, 1.3, 1.4, 2.2, 2.7, 2.8, 5.2, 5.5, 5.7, 6.3; DiscreteSeriesCoefficientsAndAutomorphicMetrics §§2.4a, 6.8, 8.3, 9.1;
BaseChangeAndGaloisRepresentationsForUnitaryGroups §§6.3a, 13.8a; LocalFactorsOfTwistsAndTypes §7.2;
MetaplecticAutomorphicForms §§3.3, 3.44, 5.6, 5.7, 5.8, 6.4, 6.10a, 6.11, 6.12, 6.14, 6.15; AutomorphicFormsOnReductiveGroups
§§2.1, 2.2, 2.4, 2.7, 4.2, 7.4, 7.5; ArithmeticLocallySymmetricSpaces ALS.F.6; AutomorphicSpectralTheory §§4.5, 4.10;
SmoothRepresentationsOfLocalGroups §§SR.2.2, SR.4.1, SR.4.3, SR.4.4, SR.5.2; SmoothRepresentationsOfLocalGroupsPartII §§0.4, 0.5;
EndoscopicTransferAndUnitaryTraceComparison §6.3; VonNeumannAlgebras Layer 9; AnalyticNumberTheoryPartI §2.3a;
ArithmeticGaloisRepresentations §2.7; AutomorphicLFunctionsAndLocalFactors §AL.1.3.4; LFunctions
Layers 6 and 7; ShimuraVarieties §§4.4, 4.12, 6.7; AbelianSchemesAndArithmeticModuli A5.3–A5.4; AutomorphicBundles §§2.7, 3.1, 3.2,
4.3, 6.1, 6.4, 11.2, 11.9, 11.18; GanGrossPrasadUnitaryGroups §§2.6, 4.1; AutomorphicPadicLFunctionsPartII §§5.7–5.9;
ComplexMultiplicationAndExplicitReciprocity §§1.2, 2.2.

## Downstream consumers

The later roadmaps of the chain in the family consume this one. BesselPoincareSeriesAndGramBounds holds the rest of
Layer 5: the target rows are forms on `U(Y_0)` of the row type level; for each word a Bessel–Poincaré series maps the
source forms into them, and the unfolded Gram operators are nearly those of subspaces in general position, which makes
the images a nearly tight frame and the series nonzero (BesselPoincareSeriesAndGramBounds §§5.13–5.23); the targets above
use nothing of these. SeesawForThetaChains writes the top period `P̃_ξ(φ, Υ)` of ThetaChainsOnDefiniteUnitaryGroups §3.9 at a
row form `Υ` of the relevant part `ℋ^{rt}_ξ` (5.4) through its period pairing `B_u(φ)(x)` (SeesawForThetaChains §6.1), which
is linear in the column `φ` and conjugate-linear in the row `x ∈ 𝔼`: `P̃_ξ(φ, Υ) = ζ(u, ξ)·B_u(φ)(ι_ξΥ)` with a root of unity
`ζ(u, ξ)` (SeesawForThetaChains §6.14), the steps of the descent of a tuple being normalised by the volume of its finite
level group (5.4); the rationality of that pairing rests on 5.8. CongruenceModulesOfThetaLifts uses the good labels (5.3)
and the model lifts with their level vectors (5.7). ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties uses the
row spaces (5.1), the model lifts and their multiplicities (5.7, 5.9) and the rational lifts (5.11).
GluedTargetAndDivisionInequality uses the determinant identity of the descent at every embedding for the base tuple
(5.10, 5.12) and the grid (5.8a, 5.8e). ThetaChainsAndFrobeniusPrimeSums uses the rows and the step identities (5.3, 5.5,
5.12) and the grid with its hypotheses (5.8a, 5.8b, 5.8e), and computes, for the measures of the Conventions,
`vol([U(Y_0)]) = mass(𝒪_E^r)` (ThetaChainsAndFrobeniusPrimeSums §9.4).

## Scope and ownership

This sub-roadmap of [RiemannHypothesisForDirichletLFunctions](../README.md) is independently definitive.

This roadmap owns the targets 5.1–5.12 above: the row spaces of the stages of the row tower with their Petersson products
and Hecke theory; the row steps with their descents and up-lifts, their cuspidality, adjointness and the parameters of
the up-lifts; the projector of an integrable discrete series; the rows and the target rows at principal level, their
labels at the type primes, goodness and the good idempotent, the joint cuspidality of good types, and the good
representations and the row type level as finite-group data; the row descent and its section; the inner product of the
up-lifts of a row step, with its twist places and its independence of the tuple, and the adjoint identity of the
descent; the model lifts and their Rallis identity; the grid of complementary spaces, its squares, their constants and
the dependence of the constants on the tuple, the separation of the rows by Bessel periods, and the rational structure
of the row space; the comparison of multiplicities with the model groups; the descent constant through the model
eigenvalues, the rational structure of the model forms and the positivity of the model eigenvalues at every embedding;
the surjectivity of the descent with its Gram matrix, and the metrics at the other embeddings.

Not owned here. The data of the chain (ranks, spaces, weights and words, Hecke, splitting and twisting characters, the
field `𝕃`, type, auxiliary and level primes, levels and test vectors) and the column chain on definite groups are
[ThetaChainsOnDefiniteUnitaryGroups](../ThetaChainsOnDefiniteUnitaryGroups/README.md) Layers 2 and 3; the abelian CM
hosts and their predicates are [FrobeniusRestrictedRieszSums](../FrobeniusRestrictedRieszSums/README.md) Layer 0. Weil
representations of unitary pairs, theta kernels and lifts, the Fock model, the archimedean theta correspondence of
discrete series, theta integrals of cusp forms, Weil's convergence criterion, local matching data, the Siegel–Weil
formula, doubling integrals and the Rallis inner product formula are
[MetaplecticAutomorphicForms](../../MetaplecticAutomorphicForms/README.md) (MetaplecticAutomorphicForms
§§5.7, 6.4, 6.10a, 6.11, 6.13: Weil's criterion, the anisotropic Siegel–Weil formula, doubling integrals, the Rallis inner
product formula) and, for the statements the family adds to it, [ThetaKernelsForUnitaryDualPairs](../ThetaKernelsForUnitaryDualPairs/README.md).
Definite dual pairs and their
class-set lifts, complementary triples, the complementary-space identity and the recursion of its constant, with the
constant at `T`, are [ThetaLiftsForDefiniteUnitaryGroups](../ThetaLiftsForDefiniteUnitaryGroups/README.md). Hermitian
lattices and masses are [HermitianFormsAndLattices](../HermitianFormsAndLattices/README.md); Harish-Chandra series,
Gelfand–Graev and Bessel-type representations and the labels of `GL_n(𝔽_q)` and of depth-zero representations are
[FiniteReductiveGroups](../FiniteReductiveGroups/README.md); the coefficients of gapped discrete series, holomorphic
discrete series as lowest-weight modules, formal degrees and the trace class on the cuspidal spectrum are
[DiscreteSeriesCoefficientsAndAutomorphicMetrics](../DiscreteSeriesCoefficientsAndAutomorphicMetrics/README.md); the
splitting characters of a quadratic extension and the equality of cuspidal multiplicities of inner forms in an odd number
of variables are [BaseChangeAndGaloisRepresentationsForUnitaryGroups](../BaseChangeAndGaloisRepresentationsForUnitaryGroups/README.md);
the Satake bounds for unitary unramified representations are
[LocalFactorsOfTwistsAndTypes](../LocalFactorsOfTwistsAndTypes/README.md). Automorphic forms on reductive groups and
algebraic modular forms are [AutomorphicFormsOnReductiveGroups](../../AutomorphicFormsOnReductiveGroups/README.md); the
discrete spectrum and Wallach's cuspidality criterion are [AutomorphicSpectralTheory](../../AutomorphicSpectralTheory/README.md);
Bessel periods and the multiplicity one of Bessel models are GanGrossPrasadUnitaryGroups; canonical models of automorphic
vector bundles and their conjugation are AutomorphicBundles and [ShimuraVarieties](../../ShimuraVarieties/README.md);
the algebraizability of complex tori and the theta functions of a polarisation are
[AbelianSchemesAndArithmeticModuli](../../AbelianSchemesAndArithmeticModuli/README.md); the
integrality and algebraicity of critical values of Hecke `L`-functions and the main theorem of complex multiplication are
AutomorphicPadicLFunctionsPartII and ComplexMultiplicationAndExplicitReciprocity. The rest of Layer 5 and the later layers
of the chain belong to the roadmaps named under Downstream consumers above.

## Exact supplier contracts

### From FrobeniusRestrictedRieszSums, a sub-roadmap of this family

§0.1: the abelian CM host `E`, with `K`, `F` and the CM type `Φ` (Conventions). §0.3: the host predicates
`SplitRamification d` and `HostSplitting E` (Conventions, 5.8a, 5.8b). §0.4: the cyclic hosts, on which `d ≡ 7 (mod 8)`
(Conventions), and the modulus of the host, which the conductor `f_E` divides (5.8a).
§0.9: the hosts of an admissible pair, on which `2` splits in `K` (5.5, 5.8).

### From ThetaChainsOnDefiniteUnitaryGroups, a sub-roadmap of this family

§2.1: the ranks, the scale and the size conditions, among them (R1), (R2) and `SizeInert` (5.5, 5.8b). §§2.2, 2.2a: the
spaces of the chain and the normal form of a step, with the conjugate datum, and the split places of §2.2 (g) (5.1, 5.2, 5.7,
5.8a, 5.8). §§2.3, 2.3a, 2.3b, 2.3c: the weights and words, the conditions (W1), (W3), (W5), the separation of entries of
different signs (§2.3, Lemma (h)), the adapted, separated data, and the gap size `SizeGap` with the gaps of the row
parameter (5.1, 5.2, 5.3, 5.5, 5.8e, 5.9). §2.4: the Hecke
characters `μ_j`, the splitting character `η̃`, the characters `δ`, `δ′` and the type characters (5.1, 5.2, 5.8a, 5.8). §2.5:
the twisting tuples and their twist places, and the field of places chosen after the twisting datum (Lemma (iv)) (5.8a,
5.8b, 5.8). §2.6: the field `𝕃`, its embedding `σ₀` and conjugation `c_𝕃`
(5.8, 5.10a, 5.11, 5.12). §§2.7, 2.8: the type, auxiliary and level primes (5.3, 5.8a). §§2.9, 2.9a, 2.9c: the levels, the
type primes with `G₀`, the principal-level and row-type vectors, and the twist places with their test vectors (5.1–5.9).
§§3.1, 3.2, 3.3: the algebraic forms on the column groups with their integral structures, the column steps and their
theta functions (5.4, 5.8, 5.10a).

### From ThetaLiftsForDefiniteUnitaryGroups, a sub-roadmap of this family

- 0.1, 2.5: definite dual pairs as homomorphism pairs, and the homomorphism pair in the dictionary. Used in 5.2, 5.7, 5.8a.
- 1.2, 1.4, 1.6: the class-set formula, the adjoint, integral structures. Used in 5.11.
- 1.7–1.9: the kernel of a lift at a polynomial Fock vector and a finite vector as a Fock pairing with its constant; the
  theta line of a self-dual lattice; induced CM types (in the conjugate reading: CM type `cΦ` for the section of 1.8). Used
  in 5.11.
- 3.1 (doubling seesaw), 3.2 (absolute convergence, the Rallis operator), for pairs of totally definite spaces (the row pairs
  of Layer 5 use ThetaKernelsForUnitaryDualPairs §6.13a and LocalFactorsOfTwistsAndTypes §7.2 instead). Used in 5.8d.
- 5.3 (nonvanishing and its local hypotheses), 6.1 (complementary triples; the place conditions (P1)–(P4)), 6.2 (matching
  data, with integral bases fixed at the places of `T`; local matching a conclusion), 6.3 (*Extension*: the theta integral of
  the smaller space as the invariant extension from regular data; used for 5.8c (ii)), 6.5 (the global descent, under
  hypotheses 1–4 of 6.11, with the constant at `T` for bases placed as there), 6.10, 6.11 (the complementary-space identity
  under its hypotheses 1–4: one signature; `a ≡ a′ (mod 2)`, `2(p + q) + 1 < ε₀` and `2(p + q) + 1 < a′`; the infinity-type
  condition; the place conditions of 6.1), 6.12 (tower recursion of the constant, with `ν^T(𝔟𝔠)` and the constants `c_T(G)`
  at `T` for the chosen bases, whose value is that of 6.5). Used in 5.8a, 5.8b, 5.8c, 5.8d.

### From ThetaKernelsForUnitaryDualPairs, a sub-roadmap of this family

- §§3.21a (unramified unitary theta correspondence), 3.45 (Fock model), 3.46 (compact pairs), 4.4a (global Weil
  representation of a unitary pair: the Siegel-parabolic normalisation, the split-place law with `χ̃` and the
  characterisation by five properties, continuity among them, which the homomorphism pairs cite). Used in 5.2, 5.7.
- §3.46a: the archimedean theta correspondence of discrete series for the Fock module of `U(p, q) × U(r, s)`, both
  members non-compact, under its gap hypothesis (G): (a) from the larger to the smaller member, (b) from the smaller to the
  larger, (c) non-occurrence below the first occurrence ((c2) when `(t + 1)/2` and `−(t + 1)/2` are not both entries), (d)
  the joint harmonic `Φ` and the positivity of its zeta integral, (e) multiplicity one, (f) occurrence. Used in 5.2, 5.5.
- §5.6a: theta integrals of cusp forms of discrete-series type are cusp forms of the matched type, under its hypotheses
  (R1)–(R3) at every real place, for continuous maps from smooth vectors. Used in 5.2, 5.8e.
- §§5.7a (Weil's convergence criterion), 5.7b (regularised convergence at a split place; (iv) the invariant extension from
  regular data). Used in 5.5, 5.8c.
- §§6.4a (Siegel–Weil in Weil's convergent range), 6.11 (b), (c) (the unramified doubling integral at inert and at split
  places in every residue characteristic, with its region of absolute convergence), 6.13a (the Rallis inner product
  formula in Weil's convergent range and for anisotropic targets; (ii) with the `L`-value by continuation), 6.13b (doubling
  integrability: (i) (c) the bound of the Weil coefficient by the height, (ii) continuation in a flat family, (iii) the
  inner product formula for the linear lift, (v) the support of the Weil coefficient at a split place). Used in 5.5, 5.7.
- §6.13c: the local doubling integral with a tame twist on a block, stated for `N = l·t`. Used in 5.5.
- §§3.47, 3.47a, 3.47b ((o), (ii), (iv)): local complementary data and local matching at split, unramified inert and real
  places. Used in 5.8b.

### From HermitianFormsAndLattices, a sub-roadmap of this family

- 4.5: lattices and compact open subgroups. Used in 5.7.
- 5.5, 5.6 (a), 5.7 (c) (mass, index formula, dimension of spaces of algebraic modular forms). Used in 5.7.

### From FiniteReductiveGroups, a sub-roadmap of this family

- 1.2 (Harish-Chandra series), 1.3 (endomorphism algebras), 1.4 (Hecke algebras of type A), 2.2 (regular characters and
  Gelfand–Graev representations; multiplicity one), 5.2, 5.5 (cuspidal characters, Green's parametrisation), 5.7 (labels and
  series idempotents; a squarefree label carries one character, which is generic), 6.3 (labels of depth-zero
  representations), and the Conventions (the tame labelled form fixed by a generator of tame inertia). Used in 5.3, 5.9;
  5.7 also in 5.8e.
- 2.7 (b) (the Bessel-type pairs), 2.8 (multiplicities of the Bessel-type characters in Harish-Chandra induced cuspidal
  representations). Used in 5.3.

### From DiscreteSeriesCoefficientsAndAutomorphicMetrics, a sub-roadmap of this family

- 2.4a (d): the lowest-`K`-type coefficient of a discrete series of `U(p, q)` is integrable when the gap `h` between entries
  of different signs satisfies `h > npq + 1` and `h > 16√(2q₀)·n·q₀`. Used in 5.3, 5.5.
- 6.8: holomorphic discrete series as lowest-weight modules. Used in 5.7.
- 8.3: the formal degree `d(π_λ) = ∏_{α>0}|⟨λ, α^∨⟩|/∏_{α>0}⟨ρ, α^∨⟩` of a discrete series for the measure of the compact
  dual. Used in 5.7.
- 9.1: the trace class of `R(f)` on the cuspidal and on the discrete spectrum. Used in 5.3, 5.9.

### From BaseChangeAndGaloisRepresentationsForUnitaryGroups, a sub-roadmap of this family

- 6.3a: splitting characters for a quadratic extension. Used in 5.2.
- 13.8a: the equality of cuspidal multiplicities `m_cusp(π_∞ ⊗ σ) = m_cusp(π′_∞ ⊗ σ∘Φ^{−1})` for two inner forms of a
  unitary group in an odd number of variables, isometric at every finite place by isometries carrying the given
  self-dual lattices to each other, for discrete series with the same integral Harish-Chandra parameter (consecutive
  entries at least `100r⁴` apart) and every `σ` with a type vector for a jointly cuspidal family of types on a nonempty
  finite set of split places. Used in 5.3, 5.9.

### From LocalFactorsOfTwistsAndTypes, a sub-roadmap of this family

- 7.2 (i), (ii): Satake bounds for unitary unramified representations of `GL_n` and of unramified unitary groups. Used in
  5.1.

### From TauCetiRoadmap.MetaplecticAutomorphicForms

- §§3.3 (unitary dual-pair splittings, with the rule `χ_V|_{𝔸_F^×} = η_{E/F}^{dim V}`), 3.44 (rationality of local theta
  lifting). Used in 5.2, 5.11.
- §§5.6, 5.8: global theta lifts and the regularised theta integral. Used in 5.2, 5.8c, 5.8.
- §5.7: Weil's convergence criterion, for the split doubled space of a row step. Used in 5.5.
- §§6.4 (the Siegel–Weil formula), 6.10a, 6.11 (the local doubling zeta integral), 6.12 (factorisation of theta pairings),
  6.15 (global seesaw). Used in 5.2, 5.5, 5.7, 5.8c, 5.8.
- §6.14: the global theta nonvanishing criterion. Used in 5.6.

### From TauCetiRoadmap.AutomorphicFormsOnReductiveGroups

- §§2.1, 2.2, 2.7, 4.2: `K`-finite vectors, infinitesimal characters and the local Harish-Chandra finiteness,
  Casselman–Wallach globalisation, cuspidal globalisation. Used in 5.1, 5.2, 5.9.
- §2.4: discrete series and their parameters. Used in 5.1, 5.3, 5.7, 5.9.
- §7.4: algebraic modular forms in Gross's models. Used in 5.4.
- §7.5: algebraic forms as class sums and as `(𝔤, K_∞)`-maps into automorphic forms. Used in 5.1, 5.2, 5.7.

### From TauCetiRoadmap.ArithmeticLocallySymmetricSpaces

- ALS.F.6 (i) (finite dimension of the automorphic forms of a given type and level), (iii) (cusp forms are rapidly
  decreasing). Used in 5.1, 5.2, 5.7.

### From TauCetiRoadmap.AutomorphicSpectralTheory

- §4.5 (finite multiplicity in the discrete spectrum), §4.10 (Wallach's tempered cuspidality criterion). Used in 5.1, 5.3,
  5.9.

### From TauCetiRoadmap.SmoothRepresentationsOfLocalGroups

- §§SR.4.1 (the Satake isomorphism), SR.4.3 (Satake transform of `T_i`; spherical representations of `GL_n`), SR.4.4
  (unramified unitary groups). Used in 5.1.
- §§SR.2.2 (the geometric lemma), SR.5.2 (segment representations). Used in 5.9.

### From TauCetiRoadmap.SmoothRepresentationsOfLocalGroupsPartII

- §§0.4 (positive-type coefficients of unitary representations), 0.5 (the GNS construction, and the GNS representation
  of a coefficient as the cyclic subrepresentation it generates). Used in 5.2a.

### From TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison

- §6.3: splitting characters, without prescribed ramification. Used in 5.2.

### From TauCetiRoadmap.AnalyticNumberTheoryPartI

- §2.3a: continuation and functional equation of Hecke `L`-functions. Used in 5.5, 5.8d.

### From TauCetiRoadmap.ArithmeticGaloisRepresentations

- §2.7: Tate's local constant by finite Gauss sums (*Arithmetic character constants*), its duality and additive-character
  scaling, and the root number as a product of local constants. Used in 5.8d.

### From TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors

- §AL.1.3.4: the local Gauss sum `𝔤(ω, ψ)`, with `𝔤·conj 𝔤 = 1`. Used in 5.8d.

### From TauCetiRoadmap.LFunctions

- Layers 6 and 7: Grössencharacters and the nonvanishing of Hecke `L`-functions on `Re s = 1` (outside the pure-norm-twist
  exception). Used in 5.5.

### From TauCetiRoadmap.VonNeumannAlgebras

- Layer 9: coefficient maps, Schur orthogonality for square-integrable representations, formal degree. Used in 5.2a.

### From TauCetiRoadmap.ShimuraVarieties

- §§4.4, 4.12, 6.7: canonical models over the reflex field, their uniqueness and their existence for data of abelian
  type. Used in 5.10a.

### From TauCetiRoadmap.AutomorphicBundles

- 2.7, 3.1, 3.2, 4.3: canonical models of automorphic vector bundles and their conjugation. Used in 5.10a.
- §§6.1, 6.4: the subcanonical extension for general data with its rationality, and the compatibility of its section
  spaces with normalized conjugation. Used in 5.10a.
- §§11.2, 11.9, 11.18: cusp forms as sections of the subcanonical extension on a toroidal model, their comparison with
  analytic forms, and their rational structure under field base change. Used in 5.10a.

### From TauCetiRoadmap.AbelianSchemesAndArithmeticModuli

- A5.3–A5.4: the Appell–Humbert theorem and the algebraizability of a complex torus with a positive Riemann form; the
  line of theta functions of a principal polarisation. Used in 5.11.

### From TauCetiRoadmap.GanGrossPrasadUnitaryGroups

- 1.2 (Bessel data), 2.6 (multiplicity one of Bessel models), 4.1 (global Bessel periods, for rapidly decreasing `f` against
  an anisotropic group). Used in 5.8e.

### From TauCetiRoadmap.AutomorphicPadicLFunctionsPartII

- §§5.7–5.9: integrality of normalised critical Hecke values away from explicit primes, Katz–Shimura algebraicity,
  Deligne's period comparison. Used in 5.8d; §5.8 also in 5.8.

### From TauCetiRoadmap.ComplexMultiplicationAndExplicitReciprocity

- §1.2 (Serre tensor construction, Lie and period comparisons), §2.2 (the main theorem of complex multiplication on
  torsion). Used in 5.8d.

### From Mathlib

- Haar measure (`MeasureTheory.Measure.haar`) and the Bochner integral (`MeasureTheory.integral`). Used in 5.2a.

## References

- S. Rallis (1982); S. Kudla (1986, 1994): 5.5–5.7.
- S. Kudla, *On the local theta-correspondence*, Invent. Math. 83 (1986); S. Rallis, *Injectivity properties of liftings
  associated to Weil representations*, Compositio Math. 52 (1984); I. Piatetski-Shapiro and S. Rallis, *L-functions for the
  classical groups*, LNM 1254 (1987); J.-S. Li, *Nonvanishing theorems for the cohomology of certain arithmetic quotients*,
  J. reine angew. Math. 428 (1992); A. Ichino, *A regularized Siegel–Weil formula for unitary groups*, Math. Z. 247 (2004):
  5.5–5.7. J. Arthur and L. Clozel, *Simple algebras, base change, and the advanced theory of the trace formula* (1989);
  J.-P. Labesse, *Cohomologie, stabilisation et changement de base*, Astérisque 257 (1999): 5.9. G. Shimura; P. Deligne;
  J. Milne, *Canonical models of (mixed) Shimura varieties and automorphic vector bundles* (1990); M. Harris, *Arithmetic
  vector bundles and automorphic forms on Shimura varieties I*, Invent. Math. 82 (1985): 5.10a, 5.11. N. Katz, *p-adic
  interpolation of real analytic Eisenstein series*, Ann. of Math. 104 (1976); D. Blasius: 5.8.
- Harish-Chandra, *Discrete series for semisimple Lie groups II*, Acta Math. 116 (1966): 5.3. J. A. Green, *The characters
  of the finite general linear groups*, Trans. Amer. Math. Soc. 80 (1955); I. M. Gelfand and M. Graev; I. N. Bernstein and
  A. V. Zelevinsky, *Induced representations of reductive p-adic groups I*, Ann. Sci. ÉNS 10 (1977).
- R. Godement (square-integrable representations): 5.1, 5.2a, 5.3. A. Paul (theta correspondence for unitary dual
  pairs over `ℝ`); S. Rallis (the tower property): 5.2. H. Petersson (Poincaré series).
- W. T. Gan, B. Gross and D. Prasad (2012); S. Kudla, *Seesaw dual reductive pairs* (1984). W. Casselman; N. Wallach: 5.1,
  5.2.
- [FormalProof] Levent Alpöge, the Lean formalization of the Riemann hypothesis and of the Riemann hypothesis for Dirichlet
  L-functions announced in [Announcement]; source with a public verification setup:
  <https://github.com/leanprover-community/riemann-hypothesis>. This roadmap specifies its mathematics; it is the reference
  of every *NEW* target.
- [Announcement] Levent Alpöge, the announcement of that proof, 20 November 2026: <https://alpo.ge/remark.pdf>.
