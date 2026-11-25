# Roadmap: Bessel–Poincaré series and Gram bounds

**Summary.** This roadmap builds the analysis that makes the Bessel–Poincaré series of a chain of theta lifts nearly orthogonal. It works on the unitary group `U(Y_0)` of a Hermitian space over a CM extension `E/F`, of signature `(k + r_S, r_S + 1)` at every real place, with its forms of the row type level at two type primes `g₀, g₁`. At a real place it studies Bessel models of discrete series of `U(p, q_S)`: Bessel integrals of matrix coefficients and their pairing, bounded Bessel maps and the rank-one Bessel form that detects them, their existence for gapped discrete series in the interlacing pattern, and the Bessel function `W_u` of a word `u` with an explicit decay. Globally it averages `W_u` against algebraic modular forms on the definite group `U(X_0)` into a Bessel–Poincaré series `P_u`, unfolds the normalised Gram operators `K(u, u′)` of these series into sums over pairs of lattices, and bounds them.

The headline theorems are these. (1) *Relative Schur orthogonality* (5.15a): let `σ` be an irreducible square-integrable unitary representation of formal degree `d` of a unimodular second-countable locally compact group `𝐆`, `S, S′` closed unimodular amenable subgroups, and `W, W′` continuous functions on `𝐆`, fixed by the projector `R(e_σ)`, transforming on the left under `S`, `S′` by finite-dimensional unitary representations, integrable and of norm one in `L²` on `S\𝐆` and `S′\𝐆`, and `h : C → 𝐆` a measurable parametrisation of almost all double cosets, by a measure space `(C, m)`, that disintegrates Haar measure along `S × S′`, `dγ` being the image of `m`; if the orbital integrals `O(γ) = ∫_𝐆 W(x) ⊗ conj W′(γ^{−1}x) dx` and the three integrals of 5.15a that majorise the coefficient of `σ` along `S`, `S′` and `S × S′` converge, then `∫_{S\𝐆/S′} ‖O(γ)‖²_HS dγ ≤ 1/d`. (2) *Limit multiplicity with a uniform error* (5.16): for every `C_ϕ ≥ 0` there are `n₀`, `C`, `c > 0` such that for a Hermitian space `V` of dimension `n ≥ n₀` over a CM extension `E/F`, with a self-dual lattice and one signature `(p_V, q_V)` at every real place, `q_V² ≤ n`, `log rd_E ≤ e^n`, `log f ≤ √n`, every `b ≥ 2` with `log log b ≤ c·nf log n`, every discrete series `π_∞` of `U(V)(F_∞)` with parameters of size at most `b²` whose entries of different signs differ by at least `C·n^{19}f⁵·log(b·rd_E)`, and every admissible idempotent `ϕ` of level at most `b^{C_ϕ}` supported on elements unipotent modulo a prime `g′ > 4n` splitting completely in `E`, the multiplicity `m(π_∞, ϕ)` differs from `D*(π_∞, ϕ) = ∏_τ d(π_τ)·vol([U(V)])·ϕ(1)` by at most `exp(−c·nf log n)·D*(π_∞, ϕ)`. (3) *The Gram bounds* (5.20, 5.21): for the data of the chain at a scale `x ≥ x₀`, let `E/F` be unramified at every finite place, let the standing size conditions (St) of 5.20a hold with `m ≥ C_m`, let `r_S ≥ 1` and `g₀ ≠ g₁`, let the level primes `T(u)`, `T(u′)` be primes `≥ 3` that split completely in `E`, are prime to `g₀g₁` and are congruent modulo `(g₀g₁)²`, let the remaining hypotheses of 5.20b and 5.20 hold, and let the rank window `C₀^{−1} ≤ d_w^{all}Γ₀²/D* ≤ C₀` hold for `w = u` and `w = u′`. If the types of two words `u ≠ u′` differ by exactly `Δ_w` at one letter at every real place, then `‖K(u, u′)‖²_HS ≤ (1 + η_off)·d_u^{all}d_{u′}^{all}/D*` with `η_off ≤ b^{−6}`; and for one word, under the hypotheses of 5.21 (those of 5.20b for the pair `(u, u)` and two further size conditions), `‖K(u, u) − 1‖²_HS ≤ e_diag·d_u^{all}`, so that `P_u` is nonzero on the forms that are new at the level prime `T(u)` as soon as `e_diag < ((T(u) − 2)/(T(u) − 1))^f`.

The roadmap takes the data of the chain (words, types, type and level primes, levels) from [ThetaChainsOnDefiniteUnitaryGroups](../ThetaChainsOnDefiniteUnitaryGroups/README.md) and the row spaces from [RowTowerAndRallisIdentities](../RowTowerAndRallisIdentities/README.md); Hermitian lattices, masses and Siegel's theorem from [HermitianFormsAndLattices](../HermitianFormsAndLattices/README.md); the coefficients of gapped discrete series and their tensor products from [DiscreteSeriesCoefficientsAndAutomorphicMetrics](../DiscreteSeriesCoefficientsAndAutomorphicMetrics/README.md); Laplace's method and stationary phase from [PositivityOfDirichletSeriesWithKernels](../PositivityOfDirichletSeriesWithKernels/README.md); quantum minors from [TensorInductionAndFiniteGroupInputs](../TensorInductionAndFiniteGroupInputs/README.md); and Gelfand–Graev theory from [FiniteReductiveGroups](../FiniteReductiveGroups/README.md). It is a sub-roadmap of [RiemannHypothesisForDirichletLFunctions](../README.md).

The roadmap holds the targets 5.13a–5.23 of Layer 5 of the family. They run as follows below: the local Bessel theory at a real place (5.13a–5.13); the Bessel–Poincaré series, the geometric expansion of the Gram operators and relative Schur orthogonality (5.14, 5.15, 5.15a); limit multiplicity (5.16); the non-archimedean side of the sums over pairs of terms, namely the Gelfand–Graev expansion at the type primes, the local kernels of decorated cokernels, the local model of the chain and the mean value formula (5.17a–5.17); the archimedean side, namely the transfer matrices of Capelli operators, the level forms, the Fourier majorants, the blocks, level zero and the pointwise bound for the orbital integrals (5.18a–5.18); an abstract tower inequality, a large sieve with constant one proved one pivot at a time (5.19); the Gram bounds for distinct and for equal words (5.20a–5.21); and the labels at the type primes with the share of the good rows (5.22, 5.23).

## Conventions

Notation and conventions not restated here are those of HermitianFormsAndLattices (its Conventions: the characters `η_v`, `η`, the values `L(k, η^k)`, genera, classes and masses), of ThetaChainsOnDefiniteUnitaryGroups (Layers 2 and 3: the chain data) and of RowTowerAndRallisIdentities (§§5.1–5.3: the row spaces), as cited at each target.

**Fields.** `E` is the host (FrobeniusRestrictedRieszSums §0.1): finite abelian over `ℚ` with an imaginary quadratic subfield `K`; `F = E⁺` its maximal totally real subfield, `f = [F:ℚ]`; `c ∈ G` complex conjugation; `rd_E` the root discriminant of `E`. On the cyclic hosts (FrobeniusRestrictedRieszSums §0.4) `d ≡ 7 (mod 8)`, `K = ℚ(√−d)`, and a second imaginary quadratic field `ℚ(√−q) ⊂ E` is used; `(q, d)` is the *auxiliary pair*. The targets 5.15a, 5.16, 5.17b, 5.17c and 5.19 are stated in the generality they name (any CM extension, any local datum, any field with absolute values).

**Primes of the construction.** The *type primes* `g₀, g₁` (ThetaChainsOnDefiniteUnitaryGroups §2.7) carry the depth-zero types; the *auxiliary primes* `p_δ, p′_δ` carry the characters `δ, δ′` (ThetaChainsOnDefiniteUnitaryGroups §2.4, ThetaChainsOnDefiniteUnitaryGroups §2.7); the primes `q, d` form the *auxiliary pair* (FrobeniusRestrictedRieszSums §0.4), and are not called auxiliary primes; the *level prime* `T(u) = N(π_u)` of a word `u` (ThetaChainsOnDefiniteUnitaryGroups §2.8) carries the new forms.

**Hermitian forms, definiteness and measures.** Hermitian forms are conjugate-linear in the first variable (the convention of `HermitianFormsAndLattices` and `ThetaLiftsForDefiniteUnitaryGroups`). Definiteness is that of `HermitianFormsAndLattices`: a space is *definite at* a real place if its form has one sign there, *totally definite* if it is definite at every real place (the sign may depend on the place), and *totally positive definite* if every sign is `+`; a *definite unitary group* is the unitary group of a totally definite space. The column space `X_0` is totally positive definite (ThetaChainsOnDefiniteUnitaryGroups §2.2). On `U(V)(𝔸_f)` the stabiliser of the chosen self-dual lattice has volume `1`; for totally definite `V`, `∫_{[U(V)]} φ = Σ_𝒸 |Γ_𝒸|^{−1} φ(g_𝒸)` over the classes `𝒸` (representatives `g_𝒸`, stabilisers `Γ_𝒸`), so the total volume is the mass; for indefinite `V` the archimedean measure is transferred from the compact inner form (the compact-dual measure of the Conventions of HermitianFormsAndLattices), so that `vol([U(Y_0)]) = mass(𝒪_E^r)` (HermitianFormsAndLattices §6.2 (c)), and formal degrees are taken for this measure. `T^*` is the adjoint of an operator `T` on a Hilbert space, and `Θ^*` the formal adjoint of a differential operator `Θ` for Haar measure.

**Row spaces.** The row forms on `U(Y_0)` are formed at principal level at the type primes, where the finite group `G₀` of ThetaChainsOnDefiniteUnitaryGroups §2.9a acts (RowTowerAndRallisIdentities §5.3): `ℋ^♮` denotes the rows at principal level and `𝔼^♮ = Π_good·ℋ^♮` the good ones; `ℋ` and `𝔼 = Π_good·ℋ` are their parts of the row type level `(P_1, χ_{P_1})` of ThetaChainsOnDefiniteUnitaryGroups §2.9a, on which the Poincaré series and the target rows live; `𝔼_0` is the part of the base level `(P_0, χ_{P_0})`.

**Characters and levels at the type primes.** For a type prime `g ∈ {g₀, g₁}` the prime `π_g𝒪_K` of `K` above `g` is fixed, and for a place `v` of `F` above `g`, `w_v` is the place of `E` above `v` and `π_g` (residue field `𝔽_g`). The *type characters* of step `j` are `χ_{v,j} := ω_g^{2j}` on `𝒪_{E_{w_v}}^×`, `ω_g` a fixed generator of the characters of `𝔽_g^×`, the same for all `v | g` and all `j` (ThetaChainsOnDefiniteUnitaryGroups §2.4 (b)): squares, of depth zero, read as elements of `𝔽_g^×` through the identification of ThetaChainsOnDefiniteUnitaryGroups §2.9a (its tame condition). A *level* at the type primes is a pair `(P, χ_P)` of a subgroup `P` of the finite group `G₀` and a character `χ_P` of `P`; the rows are formed at principal level and the levels cut out their parts (base level `(P_0, χ_{P_0})`, row type level `(P_1, χ_{P_1})`, ThetaChainsOnDefiniteUnitaryGroups §2.9a).

**Quantifier order and sizes.** Constants named before `ε` do not depend on `ε`; the scale `x` and everything chosen at it come after `ε`. Between them come the numbers that may depend on `ε`, among them the window constant `J > 0`, which the size predicates of ThetaChainsOnDefiniteUnitaryGroups §2.1 take as an argument. The size conditions are named predicates: those of ThetaChainsOnDefiniteUnitaryGroups §2.1, grouped into the host predicates `SizeA`, `SizeN`, `SizeD`, `SizeRd`, `SizeQD`, `SizeInert`, `SizeDep` and the parameter predicates `SizeM`, `SizeK`, `SizeW`, `SizeMf`, `SizeT`, `SizeTheta`, with their conjunction `Size(x, ε)`; and those named where their quantities are defined: `SizeSc` (ThetaChainsOnDefiniteUnitaryGroups §2.3b), `SizeGap`, `SizeSep` (ThetaChainsOnDefiniteUnitaryGroups §2.3c), `SizeG` (ThetaChainsOnDefiniteUnitaryGroups §2.7), `SizeT_u` (ThetaChainsOnDefiniteUnitaryGroups §2.8: `16mx^ε ≤ log T*(u)` and `log T*(u) + 1 ≤ C_T m x^ε ≤ x`). "The size conditions of ThetaChainsOnDefiniteUnitaryGroups §2.1" means `Size(x, ε)`; a target that uses a single predicate names it.

### Table of symbols

| Symbol | Meaning | Defined |
|---|---|---|
| `E, F = E⁺, f, c, G, f_E` | host field, its maximal totally real subfield, `[F:ℚ]`, complex conjugation, `Gal(E/ℚ)`, conductor of `E` (of a primitive `χ`: `f_χ`) | FrobeniusRestrictedRieszSums §0.1, FrobeniusRestrictedRieszSums §0.2 |
| `K, χ_K, d, √−d` | the imaginary quadratic subfield and its character; the prime of `SplitRamification d` (`K = ℚ(√−d)` on the cyclic hosts) and the root with `Im ι₀(√−d) > 0` | FrobeniusRestrictedRieszSums §§0.1–0.3, Conventions |
| `Φ, ι₀, τ` | `Gal(E/K)` and the CM type it defines through `ι₀`; its elements, the places | FrobeniusRestrictedRieszSums §0.1 |
| `(q, d)` | auxiliary pair | FrobeniusRestrictedRieszSums §0.4 |
| `Φ_top` | the tops | FrobeniusRestrictedRieszSums §0.6 |
| `rd_E` | root discriminant of `E` | Conventions |
| `k, m, t, r, N_j, n_j` | base rank, chain length, rank step, `r = k + m − 1`, `N_j = k + j(t + 1)`, `n_j = r + jt` | ThetaChainsOnDefiniteUnitaryGroups §2.1 |
| `x, ε, b, a, X′, b′, w″, X″` | scale, exponent, `e^{x^ε}`, `x·b`, `e^{x^{ε/3}}`, `a/X′`, `b′/(x\|A\|)`, `x\|A\|X′` | ThetaChainsOnDefiniteUnitaryGroups §2.1 |
| `ϑ, B₀, N_c, Γ₀, H` | thick-weight width, the two budgets `B₀ = fmbx^ε`, `N_c = \|𝒯\|kbx^{2ε}/\|A\|²`, redundancy factor, slope range `x^{c_H}b` | ThetaChainsOnDefiniteUnitaryGroups §2.1 |
| `Size(x, ε)` | conjunction of the host predicates `SizeA, SizeN, SizeD, SizeRd, SizeQD, SizeInert, SizeDep` and the parameter predicates `SizeM, SizeK, SizeW, SizeMf, SizeT, SizeTheta` | ThetaChainsOnDefiniteUnitaryGroups §2.1 |
| `SizeQD, SizeInert` | `x^{ε/(6J)} ≤ log q`, `x^{19ε/(100J)} ≤ log q, log d ≤ x^{ε/5+ε/100}` and `\|(L′/L)(1, χ_K)\| ≤ x^ε`; inert-free up to `max(12, x^{ε/(5J)})` | ThetaChainsOnDefiniteUnitaryGroups §2.1 |
| `SizeSc, SizeGap, SizeSep, SizeG, SizeT_u` | size predicates of the words, the gaps, the separation, the type primes and the level primes | ThetaChainsOnDefiniteUnitaryGroups §2.3b, ThetaChainsOnDefiniteUnitaryGroups §2.3c, ThetaChainsOnDefiniteUnitaryGroups §2.7, ThetaChainsOnDefiniteUnitaryGroups §2.8 |
| `C_t, C_W, C_Γ, A_max, C_dep` | constants fixed before `ε`: of `SizeT`, of `SizeW`, of `Γ₀`, the bound of the layer exponent, the constant of `SizeDep` | ThetaChainsOnDefiniteUnitaryGroups §2.1 |
| `J` | the window constant, a number that may depend on `ε`, chosen after `ε` and before the scale | Conventions, ThetaChainsOnDefiniteUnitaryGroups §2.1 |
| `X_j, X^h` | column spaces, hyperplane of `X_m` | ThetaChainsOnDefiniteUnitaryGroups §2.2 |
| `Y_j, z_m, r_S` | row spaces; the negative vector of `Y_j` (`j` even); `r_S = m/2 − 1`, the number of hyperbolic planes of `Y_0` | ThetaChainsOnDefiniteUnitaryGroups §2.2 |
| `W_j, V_j` | model spaces: rank `r`, signature `(k+j−1, m−j)`; totally positive definite of rank `r + t` | ThetaChainsOnDefiniteUnitaryGroups §2.2 |
| `W, u, u_*` | the set of words, a word, the base word | ThetaChainsOnDefiniteUnitaryGroups §2.3 |
| `u(τ), v(τ), e′(τ), e(τ)` | Harish-Chandra data at `τ` of the word `u` (`v, e′, e` shared by all words) | ThetaChainsOnDefiniteUnitaryGroups §2.3 |
| `Δ_w, Sc` | letter step, cloud size `4kΔ_w` | ThetaChainsOnDefiniteUnitaryGroups §2.3 |
| `(U_j), (W1)–(W6), h_gap, κ_j` | unit condition, conditions of a weight datum, row gap, the shift `(k + (2j − 1)(t + 1))/2` of the step diagrams | ThetaChainsOnDefiniteUnitaryGroups §2.3 |
| `χ_{v,j}, ω_g` | type characters `ω_g^{2j}` at the place `w_v` of `E` above `π_g` (the residue of `μ_j` there is `χ_{v,j}^{−1}`); the fixed generator of the characters of `𝔽_g^×` | ThetaChainsOnDefiniteUnitaryGroups §2.4 |
| `g₀, g₁; p_δ, p′_δ; 𝔅(N, g)` | type primes; auxiliary primes; the exceptional set of a type prime | ThetaChainsOnDefiniteUnitaryGroups §2.7 |
| `T(u), T*(u), π_u` | level prime of the word `u`, its target value, `T(u) = N(π_u)` | ThetaChainsOnDefiniteUnitaryGroups §2.8 |
| `G₀, (P, χ_P), (P_0, χ_{P_0}), (P_1, χ_{P_1}) = (K₂, χ₂), ψ_g` | finite group of the type primes, a level, base level, row type level, additive character | ThetaChainsOnDefiniteUnitaryGroups §2.9a |
| `e_{P,χ_P}` | idempotent of a level `(P, χ_P)` at the type primes | ThetaChainsOnDefiniteUnitaryGroups §2.9a |
| `χ_N, χ_L, i_col, i_row, Φ^{pr}_{j,v}, Φ^{rt}_{j,v}, Φ^{(H)}_j` | characters and indices of the type levels; test vectors of the row steps at principal level and at the row type level; the row test vector at all type places together | ThetaChainsOnDefiniteUnitaryGroups §2.9a |
| `𝔡, L_𝔡, 𝔡₀^{(j)}, Maps(𝔡, 𝔡′), x_u, K_u, 𝔽_v, ⟨a⟩_v` | pairs and class lattices at `T(u)`, standard pairs, maps of pairs, column level of a word, residue field, diamond operators | ThetaChainsOnDefiniteUnitaryGroups §2.9b |
| `M_u^{all}, M_u, d_u^{all}, d_u` | full and new source lattices of the word `u`, their ranks | ThetaChainsOnDefiniteUnitaryGroups §3.8 |
| `𝒟^{(j)}, 𝒟_τ` | discrete series of stage `j`; its component at `τ` for `j = 0` (`𝒟_τ = 𝒟^{(0)}_τ`) | RowTowerAndRallisIdentities §5.1 |
| `e_𝒟` | the projector coefficient of `𝒟` | RowTowerAndRallisIdentities §5.3 |
| `ℋ^♮, 𝔼^♮, ℋ, 𝔼, 𝔼_0, Π_good` | rows at principal level, good rows; their parts of the row type level (`𝔼` the target rows); the part of the base level; the good idempotent | RowTowerAndRallisIdentities §5.3 |
| `D_all, D_rows, δ_bad` | the dimensions of `ℋ` and `𝔼`, the discarded share | RowTowerAndRallisIdentities §5.3 |
| `(G), h_nv` | strong gap condition and its threshold `64r²q_S + 16√2·r·q_S^{3/2}` | 5.13a |
| `P_u, K(u, u′), W_u` | Bessel–Poincaré series, Gram operators, Bessel function | 5.14, 5.15, 5.13 |
| `ε_c, ϰ_s` | the cut-off of 5.13b–5.19; the transfer coefficients | 5.13b, 5.13d |
| `𝐯_t; K^{loc}, N^{loc}, B^{loc}_w, 𝐏(w)` | the amplitude of a non-generic term; the local kernels of the decorated modules, their weights, the block matrix of a local point | 5.17a; 5.17b |
| `d_sup` | the supremum of the normalised local densities | 5.17d |
| `ε_C, e_diag, δ_old(u)` | limit-multiplicity error, diagonal Gram defect, share of the forms that are not new | 5.16, 5.21 |
| `T_crit, κ_sc, a_eff` | critical level, scaling factor, effective top entry | 5.20a |
| `thr(b, s), thr′(b)` | the scales of the archimedean Fourier majorant of a block | 5.18c |
| `Th(i, s, t), Sg(b, s)` | the dominating kernels of the tower inequality and the finite sets of pivots | 5.19 |
| `ε_L, ε_N, η_off` | the error constants of the pair counts and of the Hilbert–Schmidt bound | 5.20b, 5.20c, 5.20 |
| `j(t), lab(t), Nm, Sz_H, w_ty, A(j)` | defect and minor label of a degenerate term; the norm and the size of a label; the weights of the type bound | 5.20d |
| `c_Θ` | `½·min((C_Δ − 4)/2, (c_T·C_b − 1)/4)`, the exponent of the bound `Θ ≥ k^{c_Θ}` | 5.20 |
| `wt_v, W^{bd}` | Gelfand–Graev share of a series; the bound of the discarded share | 5.22, 5.23 |

**Statements of the formal proof.** Where a target names [FormalProof], the form that proof establishes is recorded at the target: its
hypotheses, ranges and constants are those of the proof, including restrictions that the route written here does not
visibly use. A wider or sharper form stated beside it is this roadmap's own, proved by the route written here, and is not in
[FormalProof].

**Labels.** Under each section heading, `*Origin:*` says where its statement comes from and
`*Method of the formal proof:*` how [FormalProof] proves it. Every target 5.13a–5.23 carries both labels.

**Corollaries of general theorems.** A section may carry, as a third line under these two labels, `*Corollary of:*`,
which names a general theorem and the roadmap section that states it, and the clauses it covers when it does not
cover the whole section. The general theorem is proved in the roadmap that states it, and what the line covers is
deduced from it. The proof of the Riemann hypothesis for Dirichlet L-functions needs only that case, not the general
theorem in full: the `*Method of the formal proof:*` label says how [FormalProof] proves it, and for which form of
the statement when that proof has a narrower one. Where the route given with the section is not the deduction, it is
a second proof, [FormalProof]'s unless the label says that it differs; the `*Needs:*` line lists what that route
needs, and the deduction needs the section that the `*Corollary of:*` line names.

## Layer 5: Bessel–Poincaré series and the Gram bounds

The rows are forms on `U(Y_0)` of the row type level (RowTowerAndRallisIdentities §5.3). For each word a Bessel–Poincaré series maps the source forms into them, and the unfolded Gram operators are nearly those of subspaces in general position, which makes the images a nearly tight frame and the series nonzero (5.13–5.23).

*Notation for this layer.*

- *Principal level.* At the places above `g₀g₁` the forms on `U(Y_0)` are formed at principal level: they are invariant under the principal congruence subgroups `K(g)_v` of ThetaChainsOnDefiniteUnitaryGroups §2.9a, so that `G₀ = ∏_{v|g₀g₁} GL_r(𝔽_{g_v})` acts on them. Away from `g₀g₁` the levels are those of ThetaChainsOnDefiniteUnitaryGroups §2.9. For a level `(P, χ_P)` at the type primes and a `G₀`-module `M`, `M^{(P,χ_P)} = e_{P,χ_P}M` is the level-`(P, χ_P)` part, cut out by the idempotent `e_{P,χ_P}` of ThetaChainsOnDefiniteUnitaryGroups §2.9.
- *Levels.* A level at the type primes is written `(P, χ_P)` (ThetaChainsOnDefiniteUnitaryGroups §2.9a): the base level `(P_0, χ_{P_0})` and the row type level `(P_1, χ_{P_1}) = (K₂/K(g), χ₂)`; `(P_b, χ_{P_b})`, `b ∈ {0, 1}`, denotes either.

### 5.13a Bessel data at a real place and the big cell

*Origin:* adapted from the Bruhat decomposition and the Bessel data of a pair of unitary groups
(GanGrossPrasadUnitaryGroups §1.2): explicit coordinates and Haar weight on the big cell of the double cosets of two
Bessel subgroups of `U(p, q_S)`.

*Method of the formal proof:* the sign of `Gr` comes from an inertia count for the Gram matrix of `F ∪ xF′`; the big cell
is reached one plane at a time, by writing an element with `⟨x e_l, e_l⟩ ≠ 0` uniquely as a product of a Heisenberg
element, a Weyl element, an element of the smaller group and a Heisenberg element; and the integration formula follows
from the uniqueness of Haar measure, once the measures with the densities `|c_a|^{2(M_{a−1} − 2)}` on the isotropic cones
have been checked invariant on these generators, with the invariant measure of the hyperboloid for the rank-one factor.

*Spaces.* 5.13a–5.13d, 5.13 and 5.18a–5.18 are local; 5.14–5.21 and 5.22–5.23 (i)–(iii) concern the space `ℋ` of
the row type level `(P_1, χ_{P_1})` (RowTowerAndRallisIdentities §5.3), on which the Poincaré series, the Gram operators and the counts live; 5.23 (iv) is
about the Gelfand–Graev level `(P_0, χ_{P_0})`.
*Setting.* Fix a real place `τ`, `G_τ = U(Y_0)(F_τ) ≅ U(p, q_S)` with `p = k + r_S`,
`q_S = r_S + 1`, `r = p + q_S`, and its maximal compact subgroup `𝐊_τ`; put `M_i := 2(r_S − i) + k + 1` for `0 ≤ i ≤ r_S`.
For a vector `z′ ∈ X_0 ⊕ ⟨z⟩` of negative norm let `N_S` be the unipotent radical of the stabiliser of the flag
`⟨e_1⟩ ⊂ ⋯ ⊂ ⟨e_1, …, e_{r_S}⟩`, `U_{z′}` the pointwise stabiliser of all `e_a, f_a` and `z′` (a compact group `U(k)`),
`S_{z′} = N_S ⋊ U_{z′}`, and `ψ_{z′}(n) = ψ_τ(Σ_{a<r_S}⟨f_a, n e_{a+1}⟩ + ⟨f_{r_S}, n z′⟩)`, where `ψ_τ` is the component at `τ` of
`x ↦ ψ_E(g^{−1}x)` (`g = g₀g₁`) for a fixed nontrivial character `ψ_E` of `𝔸_E/E` trivial on `𝔸_F` (any nontrivial
character of `ℂ` trivial on `ℝ` gives a datum conjugate under the torus centralising `U_{z′}`, GanGrossPrasadUnitaryGroups §1.3):
the Bessel datum of
GanGrossPrasadUnitaryGroups 1.2 for the pair `z′^⊥ ∩ (X_0 ⊕ ⟨z⟩) ⊂ Y_0`. For the word `u` the datum is
`(S_u, ψ_u) := (S_{z_u}, ψ_{z_u})`. Let `D` be a discrete series of `G_τ` with Harish-Chandra parameter
`hc = (hc_1 > ⋯ > hc_{k−1}; hc′_1 > ⋯ > hc′_m)` with the signs of RowTowerAndRallisIdentities §5.3, and `π` an irreducible representation of `U_{z′}`
with Harish-Chandra parameter (highest weight plus `ρ`) `u = (u_1 > ⋯ > u_k)`; in 5.13–5.21 the entries of a type
parameter are numbered from `1`, so that for the type of a word `u_i = u_{i−1}(τ)` of ThetaChainsOnDefiniteUnitaryGroups §2.3. Hypotheses: *interlacing*
`u_1 > hc_1 > u_2 > ⋯ > hc_{k−1} > u_k > hc′_1`; *half-integrality* `u_i − hc_s ∈ ℤ + ½` for all `i, s`; *gap*: every
two entries of `hc` with different signs differ by at least `h`, where `h ≥ 120r³` and `h > h_nv(r, q_S) := 64r²q_S + 16√2·r·q_S^{3/2}`
(that is `32r²m + 8r·m^{3/2}` for `m = 2q_S`). The *strong gap condition* (G) on a number `h` is: `h ≥ 120r³` and, with
`a(h) = h/(8√(2q_S))` and `d_N = dim_ℝ N_S = r_S(2r_S + 2k + 1)`, `a(h) ≥ 4(r_S² + r_S + 1)((r − 1)d_N + 4pq_S) + 4pq_S + 3` and
`a(h) ≥ 9q_Sr² + 12pq_S + 3` (it is used in 5.13d (g), in 5.15a and in 5.18 (i₁)).

*Statement.* (a) *Big cell.* For `x ∈ G_τ` let `D_l(x)` be the leading principal minors of the `(r_S+1)×(r_S+1)` matrix
`(⟨x F′_b, F_a⟩)`, `F = (e_1, …, e_{r_S}, z′)`, `F′ = (e_1, …, e_{r_S}, z″)` for two vectors `z′, z″` of norms `−T, −T′`;
put `c_l = D_l/D_{l−1}`, `𝔷 = D_{r_S+1}/D_{r_S}`, `Gr(x) = |D_{r_S+1}|² − T·T′·|D_{r_S}|²`. Then `Gr ≥ 0` (it is
`(−1)^{r_S+1}` times the Gram determinant of `F ∪ xF′`); `D_l`, `Gr` are invariant under `S_{z′} × S_{z″}`; every `x`
with all `D_l(x) ≠ 0` and `Gr(x) > 0` lies in `S_{z′}·h(c, 𝔷)·S_{z″}` for an explicit section `h` of the big cell; and
Haar measure disintegrates as `∫_{G_τ} φ = C∫ wt(c, 𝔷)∫_{S_{z′}}∫_{S_{z″}} φ(s·h(c,𝔷)·s′^{−1}) d²c d²𝔷` with
`wt(c, 𝔷) = ∏_{a=1}^{r_S} |c_a|^{2(M_{a−1} − 2)}·(|𝔷|² − T·T′)^{k−1}` (the integral over `c ∈ ℂ^{r_S}` and `|𝔷|² ≥ T·T′`), for a
constant `C > 0` that is uniquely determined by the Haar measures of `G_τ`, `N_S`, `U_{z′}`, `U_{z″}`; its value is not needed.

*Route.* Bruhat decomposition relative to the maximal parabolic of each line `ℂe_l` (Witt's theorem), iterated
over the planes, with the rank-one case `U(k, 1)` on the hyperboloid `|𝔷|² > T·T′`.

*Sources:* (Bruhat decomposition: RealSemisimpleLieGroups §3.3). (a), the sign of `Gr` and the invariance of `D_l`, `Gr`:
[FormalProof], `Formalism/FormalDegreeBessel/StatementG.lean` (`Formalism.QuantumDeterminants.GNonneg`); the weight `wt(c, 𝔷)`:
[FormalProof], `Formalism/FormalDegreeBessel/StatementBF.lean` (`Formalism.QuantumDeterminants.bcWeight`); (G): [FormalProof],
`Formalism/HermitianCurvature/BesselNonvanishingReduction.lean` (`Formalism.FourierDecayAlt.ThreeDimData.GapOK`).
*Needs:* RowTowerAndRallisIdentities §5.3; GanGrossPrasadUnitaryGroups 1.2,
GanGrossPrasadUnitaryGroups §1.3 (transport of Bessel data); RealSemisimpleLieGroups §§3.2, 3.3, 4.2 (open big cell, Bruhat decomposition,
parabolic double cosets); RepresentationTheory/LieGroups, "Layer 9: the Cartan, Iwasawa, and KAK decompositions".

### 5.13b Bessel integral, pairing and majorant

*Origin:* adapted from Beuzart-Plessis (2020): the regularised Bessel form, defined by integrations by parts in the
dilations of the torus that scales the character; here two-sided, on a class of functions with five decaying derivatives,
with the explicit majorant `Ξ`, a product of negative powers of Gram determinants of an opposite isotropic frame, in place
of Harish-Chandra's function, and with adjointness for invariant differential operators.

*Method of the formal proof:* the majorant `Ξ` is a product of negative powers of Gram determinants of the images of an
isotropic frame; its convolution bound follows from the Iwasawa decomposition and the equivariance of products of powers
of leading minors, and its integrability against a negative power of the linear form is proved by induction over the
planes, averaging over rotations and dilations on each Heisenberg group with a sublevel-set estimate for quadratic
polynomials. The regularised pairing is defined by two integrations by parts in each dilation and identified, against
test functions of the dilations, with the squared norm of the Bessel integral through one absolutely convergent integral,
Fatou's lemma and a lemma on two nonnegative sesquilinear forms. The published regularisation controls convergence
through Harish-Chandra's function and the weak inequality.

In the setting of 5.13a:
(b) *Bessel integral and pairing.* For `F : G_τ → Hom(V_{π″}, V_{π′})` with all derivatives of order `≤ 5` decaying like
`‖x‖^{−A}`, `A ≥ 2p(r_S+1) + 1`, the Bessel integral `𝒥F(x) = ∫∫ ψ_{z′}(n)conj ψ_{z″}(n′)π′(h)F(s^{−1}xs′)π″(h′)^{−1}`
over `s = nh ∈ S_{z′}`, `s′ = n′h′ ∈ S_{z″}` converges absolutely at almost every point `h(c, 𝔷)` of the big cell; the pairing
`β(F, F′) = ∫ wt·⟨𝒥F, 𝒥F′⟩_HS(h(c, 𝔷)) d²c d²𝔷` is finite and continuous (`|β(F, F′)| ≤ C·c·c′` when the derivatives of order
`≤ 4` of `F`, `F′` are bounded by `c‖x‖^{−A}`, `c′‖x‖^{−A}`), and it is a constant multiple (by the constant of 5.13a (a)) of the
regularised pairing `β^∞` obtained by two integrations by parts in each of the two dilation parameters of the torus that scales `ψ`;
and `β(ΘF, F′) = β(F, Θ^*F′)` for every differential operator `Θ = Σ_Tc_T·X_T` (smooth coefficients times words in invariant
vector fields) on an open set `U ⊂ {Gr > 0}` stable under `S_{z′} × S_{z″}` and commuting with their action, `Θ^*` its formal
adjoint for Haar measure, and all `F, F′` of class `C^{ord Θ + 5}` supported in `U` such that `F, F′, ΘF, Θ^*F′` are in the
class above and every product that arises when the derivatives of a word `X_T` are moved one at a time from a translate
of `F` to `c̄_TF′` is integrable on `G_τ` (for instance: `U = {Gr > 0}`, supports in `{Gr ≥ ε_c}`, the `c_T`, their adjoints
and their derivatives up to order `ord Θ + 5` bounded there by `C‖x‖^d`, and the derivatives of `F, F′` up to order
`ord Θ + 5` decaying like `‖x‖^{−A−d}`).
(b′) *Majorant.* For an isotropic frame `φ_0, …, φ_{r_S}` opposite to the flag (its span, a maximal isotropic subspace, meets
`⟨e_1, …, e_{r_S}⟩^⊥` in a line only: the frame of the coordinates of the route) and exponents `s_l` slightly below `2` (`l < r_S`) and below `k`
(`l = r_S`), the function `Ξ(x) = ∏_lΔ_l(x)^{−s_l}`, `Δ_l(x)²` the Euclidean Gram determinant of `xφ_0, …, xφ_l`, satisfies
`∫_{G_τ}|F(x^{−1}gy)||F′(g)|dg ≤ C·c·c′·Ξ(x)Ξ(y)` for `|F| ≤ c‖g‖^{−A}`, `|F′| ≤ c′‖g‖^{−A}`, `A ≥ 2p(r_S+1)+1`, and
for every `δ ∈ (0, ½]` there is `e(δ) > 0` such that `∫_{N_S}Ξ(n)(1 + |ℓ(n)|)^{−δ}dn < ∞` whenever `0 < 2 − s_l ≤ e(δ)` for
`l < r_S` and `0 < k − s_{r_S} ≤ e(δ)`, `ℓ` the real linear form defining `ψ_{z′}`; for such exponents with `δ = ½` the integral is
finite for every larger `δ` (the pairing uses `δ = 2`).

*Route.* (b′) The first bound by the Iwasawa
decomposition and the equivariance of products of powers of leading minors under the parabolic subgroup of the frame;
the integrability on `N_S` by induction on the number of planes, `N_S` being the semidirect product of the Heisenberg
group of the first plane with the group of the remaining planes (each plane costs a factor `4` in `δ`); on the
Heisenberg group of one plane, in coordinates `(a, a′, w, τ)` in which `Δ_l² = L_l²ρ_l² + |b_l|²`: average over the rotations
of `(a, a′, w)` and over the dilations `(a_0, a′_0) ↦ (τa_0, a′_0/τ)`, with the sublevel estimate
`∫_1^2(1 + |P(t)|)^{−δ}dt ≤ C(1 + ‖P‖)^{−δ/2}` for real polynomials `P` of degree `≤ 2` (`‖P‖` the supremum of `|P|` on `[1, 2]`) and
`0 < δ ≤ ½`, proved here: three points of `{t ∈ [1, 2] : |P(t)| ≤ λ}`, a set of measure `s`, at mutual distances `≥ s/2` give
`‖P‖ ≤ 12λ/s²` by Lagrange interpolation, and the layer-cake formula integrates this (for `δ = 2` and `P = A(t − 3/2)²` the left side
is of order `A^{−1/2}`, not `A^{−1}`, so the range of `δ` is needed), to replace the weight by
`|a′_0|^{−γ}(1 + |c₀|)^{−δ/4}` (`γ ≤ δ/8`); then `Δ_0² = L_1²|a′_0 − a_0b_1/L_1²|² + Δ_1²/L_1²`, a planar kernel integral, and two statements on the Heisenberg group of one plane, in coordinates `(a, a′, w, τ) ∈ ℂ^p × ℂ^p × ℂ^{k−1} × ℝ` (`p = r_S`)
with `L_l² = 1 + Σ_{j<l}|a_j|²`, `ρ_l² = L_p² + |w|² + Σ_{j≥l}|a′_j|²`, `b_l = −|w|²/2 + iτ − Σ_{j≥l}a′_jā_j`, `Δ_l² = L_l²ρ_l² + |b_l|²` (`0 ≤ l ≤ p`)
and `s⁰ = (2, …, 2, k)`. *(T1) Tail integrals.* For real `ν_0, …, ν_p` with partial sums `σ_l = Σ_{j≤l}ν_j`:
the integral `∫∏_lΔ_l^{−(s⁰_l+ν_l)}` is finite exactly when `σ_l > 0` for all `l` and `2σ_p − σ_l > 0` for `l < p`, and then it equals
`∏_{l<p}(2π/σ_l)(2π/(2σ_p − σ_l))·∫_{ℂ^{k−1}×ℝ}|1 + |w|²/2 + iτ|^{−(k+σ_p)}`; otherwise it is `+∞` (outside this cone the product can be
negative or finite while the integral diverges: `p = 1`, `ν_0 = −1`, `ν_1 = 2`). Only the finiteness inside the cone is used:
it is what the path of [FormalProof] states and uses; the converse, the value and the example are this roadmap's own.
Proof by induction on `p`: `Δ_0² = L_1²|a′_0 − a_0b_1/L_1²|² + Δ_1²/L_1²`, so the
integral over `a′_0` is `(2π/ν_0)L_1^{−2+ν_0}Δ_1^{−ν_0}`; the substitution `a_j = L_1ã_j`, `a′_j = L_1ã′_j` (`j ≥ 1`), `w = L_1w̃`, `τ = L_1²τ̃`
gives `Δ_l = L_1²Δ̃_{l−1}` for `l ≥ 1` and leaves `∫_ℂ(1 + |a_0|²)^{−(2+ν_0+2Σ_{j>0}ν_j)/2}d²a_0 = 2π/(ν_0 + 2Σ_{j>0}ν_j)` times the
integral with one plane less and exponents `(ν_0 + ν_1, ν_2, …)`; for `p = 0`, `Δ_0 = |1 + |w|²/2 + iτ|` is the square of the gauge
of the Heisenberg group of `U(k, 1)`, of homogeneous dimension `2k`. *(T2) Below the critical exponents.* For `0 < γ ≤ 1` and
`e_l > 0` with `e_0 + 2Σ_{l≥1}e_l < γ/2`: `∫∏_lΔ_l^{−(s⁰_l−e_l)}·|a′_0|^{−γ} < ∞`. Proof: (i) for `0 < e < γ < 2`,
`∫_ℂ(|x − c|² + D²)^{−1+e/2}|x|^{−γ}d²x ≤ C(|c|² + D²)^{−(γ−e)/2}` (scaling and compactness); by the completed square
`Δ_0^{−(2−e_0)} = L_1^{−(2−e_0)}(|a′_0 − c|² + D²)^{−1+e_0/2}` with `c = a_0b_1/L_1²`, `D = Δ_1/L_1²`, and
`|c|² + D² = (ρ_1² + |b_1|²)/L_1² ≥ max(Δ_1²/L_1⁴, |τ − τ_1|²/L_1²)`, `τ_1 = Im Σ_{j≥1}a′_jā_j`, so the integral over `a′_0` is at most
`C·L_1^{−2+γ}·(L_1/Δ_1)^{α}·|τ − τ_1|^{−γ/2}` with `α = γ/2 − e_0`; (ii) each `Δ_l` (`l ≥ 1`) is `(A_l² + (τ − τ_l)²)^{1/2}` with
`A_l ≥ L_lρ_l ≥ L_1²`, and for `0 < κ < 1`, `R > 0`, `A_i ≥ R`, `t_i ≥ 0`, `Σt_i ≤ T`:
`∫_ℝ∏_i(A_i² + (β − b_i)²)^{−t_i/2}|β|^{−κ}dβ ≤ C(T, κ)R^{−κ}∫_ℝ∏_i(A_i² + (β − b_i)²)^{−t_i/2}dβ` (cut `ℝ` into intervals of length `R`, on
which the product varies by at most `2^T`); with `κ = γ/2`, `R = L_1²` this bounds the integral over `τ` by `C·L_1^{−2+α}` times the
integral over `τ` of `Δ_1^{−α}∏_{l≥1}Δ_l^{−(s⁰_l−e_l)}`; (iii) this is (T1) after its first step, with first exponent `α` and the
others `−e_l`: its conditions are `α > Σ_{1≤j≤l}e_j + 2Σ_{j>l}e_j` and `α > 2Σ_{l≥1}e_l`, and the last one is the hypothesis. (b) Two
integrations by parts in each dilation parameter give an absolutely convergent expression `β^∞`. Averaged against test
functions of the two dilation parameters, `β^∞(F, F)` and `‖𝒥F‖²` are both equal to `∫ŵ₁(ℓ)ŵ₂(−ℓ′)·𝒫(F, F)` over
`S_{z′} × S_{z″}`, where `𝒫(F, F′)(s, s′) = ∫_{G_τ}⟨π′(h)F(s^{−1}gs′)π″(h′)^{−1}, F′(g)⟩dg` converges by (b′): the first by undoing
the integrations by parts and a change of variables in the dilation, the second by the integration formula over the big
cell and Fourier inversion at a fixed orbit. Hence equality for almost all dilations, an inequality everywhere by
Fatou, and equality by dilation covariance and continuity. Adjointness: `𝒫(ΘF, F′) = 𝒫(F, Θ^*F′)` by integration by parts
on `G_τ`, one invariant derivative at a time, and `β^∞` depends on `(F, F′)` through `𝒫` only.

*Check.* The frame in (b′) cannot be arbitrary: for `r_S ≥ 1` and the isotropic frame `e_1, …, e_{r_S}, v` (`v` isotropic in the
remaining space of signature `(k, 1)`), every `n ∈ N_S` acts unitriangularly on the frame, so every `Δ_l(n)` and `Ξ(n)` is constant,
and `∫_{N_S}(1 + |ℓ(n)|)^{−δ}dn = ∞` along the kernel of `ℓ`.

(b), the class and the continuity of `β`: [FormalProof], `Formalism/HermitianCurvature/WeylElementCommutesLevelOne.lean`
(`Formalism.FourierDecayAlt.B2.LemmaBNorm`), `Formalism/HermitianCurvature/StatementB.lean` (`Formalism.FourierDecayAlt.B.AB`);
the adjointness: follows from [FormalProof], `Formalism/HermitianCurvature/StatementB.lean`
(`Formalism.FourierDecayAlt.B.PairingAdjointness`); (b′): [FormalProof], `Formalism/HermitianCurvature/StatementB.lean`
(`Formalism.FourierDecayAlt.B.XiExists`, `Formalism.FourierDecayAlt.B.CoefBound`, `Formalism.FourierDecayAlt.B.XiInt`).
*Needs:* 5.13a; RealSemisimpleLieGroups 3.3, 4.3; RepresentationTheory/LieGroups, "Layer 9: the Cartan, Iwasawa, and
KAK decompositions"; Mathlib (Fourier inversion, Fatou's lemma, Lagrange interpolation, the layer-cake formula).

### 5.13c Bounded Bessel maps, rank one and uniqueness

*Origin:* adapted from Jiang, Sun and Zhu (2010) and Sun and Zhu (2012), uniqueness of Bessel models for real unitary
groups; Beuzart-Plessis (2020), Theorem 7.2.1 and the remark after it, the regularised Bessel form of a tempered pair has
rank at most one and is nonzero exactly when a Bessel functional exists, and Lemma 7.3.1, an a priori bound for Bessel
functionals; the folding of the reproducing formula along the subgroup is in Beuzart-Plessis (2018), Galois pairs, §3.2, for p-adic
square-integrable representations. Here (c) is stated for Sobolev-continuous Bessel maps of every unitary
representation, and (d) for discrete series with a large gap, on lowest `K`-type vectors, with the absolute convergence
of the unregularised form, which is the Bessel integral of coefficients over the Bessel subgroup, and its explicit
rank-one form.

*Method of the formal proof:* boundedness of a Bessel map follows by differentiating along a Lie algebra element on which
the character oscillates fast; the Bessel form of lowest `K`-type coefficients has rank at most one because the pairing
of coefficients on the open cell is symmetric under an anti-involution, which yields a crossing identity forcing all
`2 × 2` minors to vanish; uniqueness follows from the reproducing formula of the coefficient folded along the Bessel
subgroup. The published proofs rest on the multiplicity one theorem of Jiang, Sun and Zhu (2010) and Sun and Zhu (2012),
proved by the Gelfand–Kazhdan criterion on invariant distributions on all double cosets.

In the setting of 5.13a:
(c) *Bounded Bessel maps.* For every unitary representation `ρ` of `G_τ`, every Sobolev-continuous linear
`B : ρ^∞ → V_π` with `B(ρ(nh)v) = ψ_{z′}(n)π(h)B(v)` and every smooth `w`, the function `x ↦ B(ρ(x)w)` is bounded.
(d) *Rank one and uniqueness.* For `D` as in 5.13a the Bessel form
`be(v, v′) = ∫_{S_{z′}} ⟨v′, D(s)v⟩·conj ψ_{z′}(s)·π(s)^{−1} ds ∈ End(V_π)` converges absolutely for lowest-`K`-type vectors
`v, v′` and equals the rank-one operator `ξ ↦ ⟨l(v′), ξ⟩·l(v)` for a Bessel map `l`; every Sobolev-continuous Bessel map `D^∞ → V_π` is a
multiple of `l` (for the standard and for every generic character of `N_S`; in particular there is none if `be = 0`).
That these Bessel maps form a space of dimension at most one is multiplicity one for the relevant pair of 5.13a at `τ`: a
Bessel map `B` is the element `v ⊗ λ ↦ λ(B(v))` of the Bessel model of `D ⊗ π^∨` (GanGrossPrasadUnitaryGroups §2.6). What (d)
adds is the rank-one form of `be` and that `be` detects the Bessel maps: a nonzero one exists exactly when `be ≠ 0`, and it is
then a multiple of `l`. Neither clause uses the interlacing or the signs of RowTowerAndRallisIdentities §5.3.
GanGrossPrasadUnitaryGroups §3.3 gives the corresponding statements for the regularised Bessel form of every irreducible tempered
pair, here `D ⊠ π^∨` (rank at most one, nonzero exactly when the Bessel model is); (d) adds, for gapped `D`, the absolute
convergence of `be` on lowest-`K`-type vectors and its explicit rank-one form, and its route does not use that statement.

*Route.* (c) Write
`𝔤 = Lie(U_{z′}) + Lie(N_S) + 𝔮`; every `x` is `h·n·Γ·t·κ` with `t` in a torus and `κ` unitary (Iwasawa, Langlands and Cartan
decompositions); where a ratio of consecutive torus entries `M` exceeds `1` there is a bounded `Y ∈ 𝔤` with
`ψ(x e^{τY} x^{−1}) = e^{iMτ}`, so `B(D(x)w) = (iM)^{−j}B(D(x)dD(Y)^jw)`, and `j` derivatives absorb the growth of `Ad(x^{−1})` on
`𝔮`. (d) `be` is Hermitian and nonnegative; an anti-involution `θ` of `G_τ` preserving `N_S`, `U_{z′}`, the Haar measures
and `ψ_{z′}` (Gelfand–Kazhdan) fixes the big-cell representatives up to `U_{z′} × U_{z′}`, so by 5.13b (b) the pairing is
`θ`-symmetric; with the dichotomy "either `D∘θ` is disjoint from `D̄` or an antiunitary map intertwines them" the `2×2`
minors of `be` vanish (a crossing identity `be(b₁,b₂)^*π(h)be(a₁,a₂) = be(Ca₁,b₂)^*π(θh)be(Cb₁,a₂)` followed by an algebraic
separation lemma), so `be = 0` or `be` has rank one. For a bounded Bessel map `B`, `F(x) = B(D(x)w)` satisfies the
reproducing formula (Schur orthogonality; `B` passes under the integral by truncation); folding the integral along
`S_{z′}` turns it into `be`, so `B = c·l` on the orbit of `w`, which is cyclic. (For `be ≠ 0` the bound `dim ≤ 1` of
GanGrossPrasadUnitaryGroups §2.6 also gives `B ∈ ℂl`; the reproducing formula is what shows that `B = 0` when `be = 0`.)

*Sources:* (multiplicity one: GanGrossPrasadUnitaryGroups §2.6, from Sun–Zhu, Theorem B, in codimension one and
Jiang–Sun–Zhu, Theorem A, for the Bessel subgroups of `U(p, q)`; decay of generalised Whittaker functions: Beuzart-Plessis (2020),
Lemma 7.3.1 (i)). (c):
[FormalProof], `CompanionTheory/AutomorphicTheory/BesselOrbitBounds/BesselMapUniqueness/BesselMapUniqGap.lean`
(`CompanionTheory.Bmu.Bounded`); (d): follows from [FormalProof],
`ReciprocityTheory/ReductiveGroups/DiscreteSeries/MultiplicityOne/StDiagExists.lean`
(`ReciprocityTheory.ChartRestriction.DS.Mult1.ThmM`),
`CompanionTheory/AutomorphicTheory/PieriRules/ThetaBesselIsometries/IsDSOfIsDG.lean` (`BranchingSupport.RankOneG`),
`Development/AbelianVarietyTheory/Definitions/SemilocalFrames/UniqGapOfUniq.lean` (`GlobalTheory.GapIn.UniqGap`).
*Needs:*
5.13a, 5.13b; GanGrossPrasadUnitaryGroups §2.6 (multiplicity one); RepresentationTheory/LieGroups, "Layer 9: the Cartan, Iwasawa,
and KAK decompositions"; RealSemisimpleLieGroups §4.3 (Langlands decomposition); VonNeumannAlgebras Layer 9 (Schur orthogonality for square-integrable representations).

### 5.13d Nonvanishing of Bessel maps and transfer coefficients

*Origin:* adapted from Xue (2023), Theorem 2.2, with Beuzart-Plessis (2020), Theorem 12.4.1 (for real unitary groups,
in each tempered Vogan packet exactly one member has a Bessel model, the one labelled by the root numbers named there),
and, for the codimension-one pair, He (2017), Theorem 0.1 (occurrence exactly under interlacing): here (e), for gapped
discrete series in the interlacing pattern, in every codimension, the Bessel map is nonzero, and (g), the transfer
coefficients; for the codimension-one pair the translation step and the walk of unit translations are in Kobayashi and
Speh (2025) and Harris, Kobayashi and Speh (2025).

*Method of the formal proof:* [FormalProof] proves (e) for a gap above the threshold stated in (e), and the values of
(g). On a ray of parameters the Bessel form of the highest weight vector is reduced to an integral over the unipotent
radical whose integrand tends to a Gaussian, and Laplace's method shows that it is nonzero far out on the ray;
nonvanishing is then transported to the given parameters along a walk of unit steps, which [FormalProof] constructs (it
raises the negative entries of the ray one at a time, then lowers the first `k` entries) and shows to have no blocked
step; each step multiplies a coefficient by an invariant linear coordinate and cuts out one constituent by a Capelli
operator, which multiplies the period by a nonzero multiple of `∏_j(u_j − hc_s ± ½)`. The published existence proofs use
the local trace formula with endoscopic character relations (Beuzart-Plessis (2020)) or the theta correspondence
(He (2017); Xue (2023)), and the published translation arguments take their base cases from them and treat the
codimension-one pair only. The route below gives the base and the step and takes the walk from [FormalProof].

In the setting of 5.13a, with the Bessel map `l` of 5.13c (d):
(e) *Nonvanishing.* `l ≠ 0`. [FormalProof] proves it when the gap `h` of 5.13a satisfies
`h > max(3 + r·p·q_S, 16r·q_S + 8√(2q_S) + 2, 8√(2q_S)(4·max(2r·q_S, 2(q_S − 1)r²) + 1))`; (G) for `h/4` implies this. The route
outlines that argument without constructing its walk, so for `r_S ≥ 1` the statement rests on [FormalProof] for such gaps, and on
GanGrossPrasadUnitaryGroups §3.9 with the root-number step of the route, not given here, for smaller ones (for `r_S = 0` it is
also He, Theorem 0.1).
Equivalently, for every nonzero lowest-`K`-type vector `w` the function `x ↦ l(D(x)w)` is not
identically zero, i.e. `be(D(x)w, D(x′)w) ≠ 0` for some `x, x′`. (For `r_S ≥ 1` the restriction of `l` to the lowest `K`-type
has a kernel, and `x ↦ be(D(x)w, w)` vanishes identically for `w` in it.)
(g) *Transfer coefficients.* Assume in addition that consecutive entries of `hc` differ by at least `2` and that (G) holds
for `h − 1` (so that `D` and every constituent `D_s` have a gap with (G));
let `D_s` be the discrete series with parameter `hc − e_s` and the same signs, so that, on smooth vectors,
`D^∞ ⊗ (ℂ^r)^∨ = ⊕_sD_s^∞` with continuous equivariant projections `P_s` (DiscreteSeriesCoefficientsAndAutomorphicMetrics §2.4b (b), whose gap
hypotheses the gaps assumed here imply); let `a ∈ (ℂ^r)^∨` be the `S_{z′}`-invariant functional `⟨·, e_1⟩` (`⟨·, z′⟩` if `r_S = 0`) and `ev_a` the
contraction with `a` through the invariant form. Then for every Bessel map `l` of `D` for the character `ψ_{z′}` with `κ_a = 1`
(`ψ_τ = ψ_ℂ`, the character fixed in 5.18 (i)) and the vectors `e_a, f_a` of 5.13a, and every `s`:
`l(ev_a(P_s(v ⊗ a))) = ϰ_s·l(v)` for all smooth `v`, with `|ϰ_s| = T·∏_{j=1}^{k}|hc_s − ½ − u_j| / ∏_{t≠s}|hc_s − hc_t|`. If `l_s` is
the Bessel map of `D_s`, then `l_s(P_s(v ⊗ a)) = κ_sl(v)` with `|κ_s|² = |ϰ_s|`; in particular `l_s ≠ 0` when `l ≠ 0` and no `u_j`
equals `hc_s − ½`. For `ℂ^r` and the parameters `hc + e_s` (DiscreteSeriesCoefficientsAndAutomorphicMetrics §2.4b (b) with `l = 1`) the Bessel map of the constituent is nonzero when `l ≠ 0` and no
`u_j` equals `hc_s + ½`. The constant `ϰ_s` depends on this normalisation: conjugating the datum by an element of the torus
of the frame (for `r_S = 1`, `e_1 ↦ be_1`, `f_1 ↦ b^{−1}f_1`, `b > 0`) gives a Bessel map of another admitted character, and since
`(v, a) ↦ ev_a(P_s(v ⊗ a))` is homogeneous of degree two in `a`, `ϰ_s` is multiplied by a power of `b` while the right side above
is unchanged.

*Route.* (e) The statement is the existence of Bessel models for discrete series of `U(p, q_S)` in the interlacing pattern:
by 5.13c (d), `l ≠ 0` exactly when the Bessel model of `D ⊗ π^∨` is nonzero. The real tempered theorem
GanGrossPrasadUnitaryGroups §3.9 (Xue, Theorem 2.2) says that this model is nonzero exactly when the characters labelling `D`
and `π^∨` in their packets are the root numbers named there. The remaining step is that for `D`, `π` as in 5.13a
(interlacing, with the signs of RowTowerAndRallisIdentities §5.3) these labels are those root numbers, a computation of root
numbers of characters of `ℂ^×` from the Harish-Chandra parameters. For `r_S = 0`, (e) is He's interlacing theorem (He,
Theorem 0.1; the Checks of 5.13); for `r_S ≥ 1` this step is not given here. The argument of this layer proves (e) without §3.9 for the parameters
reached from a ray by admissible steps: *Base.* On the ray of parameters
`hc(t) = (u_1 − ½, …, u_k − ½; −e′_1 − t, …, −e′_{2r_S+1} − (2r_S+1)t)`, `t` a positive integer, for the vector `z′` of norm `−1` and the character of
`N_S` whose coefficients are proportional to `t`: Schur orthogonality on `U(k)` reduces the Bessel form on
highest-weight vectors to `(dim π)^{−1}∫_{N_S}⟨w, D_t(n)w⟩conj ψ_t(n)dn`; in exponential coordinates the integrand is `f_t(Y)`
with `f_t(Y/√t) → e^{−B(Y,Y)}` (coherent-state asymptotics of the lowest-`K`-type vector, the linear term being cancelled
by the character) and `|f_t(Y)| ≤ (1 + ‖Y‖²)^{−ct}` (decay of the coefficient) for all large `t` and all `Y ∈ Lie N_S`; `f_t` is
continuous for large `t`, and `exp` carries Lebesgue measure on `Lie N_S` to the Haar measure of `N_S`. These are the hypotheses
of PositivityOfDirichletSeriesWithKernels §7.1 on `E = Lie N_S`, the parameter running over the positive integers (`B` is
real-bilinear with complex values; the positivity of its real part is PositivityOfDirichletSeriesWithKernels §7.1 (a)), so the
integral is nonzero for large `t` by the non-vanishing clause PositivityOfDirichletSeriesWithKernels §7.1 (d). This gives `l ≠ 0` for one datum. All data are conjugate to it (GanGrossPrasadUnitaryGroups §1.3: transport of Bessel data under isometries
of framed pairs and changes of the generic character): the torus of the frame centralises
`U_{z′}` and is transitive on the generic characters of `N_S`, `U(X_0 ⊕ ⟨z⟩)` normalises `N_S` and is transitive on vectors of
a given negative norm, and a positive multiple of `z′` changes only the character. Every nonzero vector is cyclic and `l`
is continuous, which gives the statement for every lowest-`K`-type vector. *Translation.* The Bessel period of
coefficients is a functional `L` on the Harish-Chandra module; in a frame adapted to the point it is equivariant for
the character on the unipotent radical and for the type on `𝔤𝔩_k`. For such a functional the Capelli minor of size
`r − 1` with the last row and the first column removed satisfies `L∘minor(x) = ±κ·C_{𝔤𝔩_k}(x − r_S)∘L`, `κ ≠ 0` the product
of the values of the character on simple root vectors (for `r_S = 0`: the leading minor of size `k`, with `κ = 1`) (the
*collapse identity*; TensorInductionAndFiniteGroupInputs §9.1 (b), (f)). By (g) the Bessel map of the constituent with parameter `hc − e_s` (resp. `hc + e_s`) is nonzero
when `l ≠ 0` and no `u_j` equals `hc_s − ½` (resp. `hc_s + ½`); this route uses (G) for the gap, which the chain instance has. *Walk.* A walk
through interlacing parameters keeping the gap reaches `hc` from the ray by unit steps (half-integrality); a step from `hc` to
`hc ∓ e_s` is admissible when no `u_j` equals `hc_s ∓ ½`. Interlacing does not exclude these values (`u_{s+1} = hc_s − ½` is
allowed by strict interlacing, and a zero bit of ThetaChainsOnDefiniteUnitaryGroups §2.3 gives such an adjacent pair), so the walk must avoid the blocked
steps; for a gap above the threshold of the statement an admissible walk from the ray exists; its construction is not
given here. Below that threshold (e) rests on
GanGrossPrasadUnitaryGroups §3.9 with the step above. (g) The equivariance of `l` under `N_S` and `U_{z′}`,
differentiated, gives the two laws of a functional of Whittaker type in a frame adapted to `z′`; the component of a
vector in the `s`-th constituent is a column of the Capelli comatrix (TensorInductionAndFiniteGroupInputs §9.1 (d)) at the root `(r − 1)/2 − hc_s`, divided by
`∏_{t≠s}(hc_t − hc_s)`; the collapse identity evaluates it, the remaining block minor being the Capelli determinant of
`𝔤𝔩_k` on `V_π` at the shifted point, `∏_j(u_j − hc_s + ½)`. The relation between `ϰ_s` and `κ_s` is the adjointness of
inclusion and projection for the invariant form and the rank-one form of the two Bessel forms (5.13c (d), first clause,
for `D` and for `D_s`; no uniqueness statement is used).

*Sources:* (existence: GanGrossPrasadUnitaryGroups §3.9, from Xue, Theorem 2.2, with Beuzart-Plessis, Theorem 12.4.1, for
exactly one member with `m = 1` in each tempered Vogan packet; for `r_S = 0` under interlacing: He, Theorem 0.1). (e), for a gap above the threshold of the statement: follows from
[FormalProof], `ReciprocityTheory/ReductiveGroups/DiscreteSeries/LaplaceOperators/ParitySignEqGapSign.lean`
(`ReciprocityTheory.ChartRestriction.DS.Lap.NVStatement`); (g), the values of `|ϰ_s|` and `|κ_s|²`: [FormalProof],
`Development/AbelianVarietyTheory/Proofs/JetHarmonics/ProjectorEntryValueUnderLinearFunctionalStatement.lean`
(`GlobalTheory.T.projector_entry_value_under_linear_functional`),
`CompanionTheory/AutomorphicTheory/PieriRules/ThetaBesselIsometries/TensorMomentEstimate.lean`
(`Gp91.CompanionTheory.FamilyDerivativeExpansion.Kap.kappa_dual`).
*Needs:* 5.13a, 5.13c; GanGrossPrasadUnitaryGroups §3.9 (the real
tempered theorem); GanGrossPrasadUnitaryGroups §1.3 (transport of Bessel data); DiscreteSeriesCoefficientsAndAutomorphicMetrics §2.4b (b) (tensor
products of gapped discrete series with the standard representation and its dual, on smooth vectors);
ClassicalGroups §6.6 (Capelli generators); TensorInductionAndFiniteGroupInputs §9.1 (b), (d), (f) (Laplace
expansions of quantum minors, the comatrix identity, vector operators through quantum minors); RepresentationTheory/LieHighestWeight
Layer 7 (Harish-Chandra isomorphism); RepresentationTheory/CompactGroups Layer 4 (Schur orthogonality for `U(k)`);
PositivityOfDirichletSeriesWithKernels §7.1 (Laplace's method in several variables with a uniform majorant, and its non-vanishing
clause (d)).

### 5.13 The Bessel function of a word

*Origin:* adapted from the decay of generalised Whittaker functions (Beuzart-Plessis (2020), Lemma 7.3.1 (i), a bound for
Bessel functionals of tempered representations): the Bessel function attached to a
discrete series with a large gap and a type of `U(k)`, with an explicit decay (a domination by an integral of the lowest
`K`-type coefficient) and an explicit weighted integrability.

*Method of the formal proof:* at each real place a reference function is built by integrating the lowest `K`-type
coefficient against the character over the Bessel subgroup, its weighted integrability is deduced from that of the
coefficient by the quotient integral formula, and every other continuous equivariant square-integrable function
reproduced by the projector is a multiple of it by the uniqueness of Bessel maps; the global statement is the product
over the real places. The decay is thus read off the explicit decay of a matrix coefficient.

In the setting of 5.13a:
(f) *The Bessel function.* Up to a scalar of modulus `1` there is exactly one continuous `W : G_τ → V_π` with
`W(sx) = ψ_{z′}(s)π(s)W(x)` on `S_{z′}`, `R(e_D)W = W` (`e_D := d(D)·conj⟨w, D(·)w⟩`, `R(f)W(x) := ∫_{G_τ}f(h)W(xh)dh`, the right action
integrated as in RowTowerAndRallisIdentities §5.2a; not the group convolution `W ∗ e_D = R(ě_D)W`, `ě_D(h) = e_D(h^{−1})`, which vanishes when the central
character `ω` of `D` has `ω² ≠ 1`) and `∫_{S_{z′}\G_τ}‖W‖² = 1`, namely a multiple of
`x ↦ l(D(x)w)`. It is reproduced by a bounded measurable kernel with compact support (`W(x) = ∫α(z)W(xz)dz`),
`‖W(x)‖ ≤ C∫_{S_{z′}}|⟨w, D(x₀^{−1}sx)w⟩| ds`, and
`∫_{S_{z′}\G_τ}‖W‖·ν^N < ∞` for `ν(x) = inf_{s∈S_{z′}}‖sx‖` and every `N` with `8√(2q_S)(N + 2rq_S) < h` and
`rpq_S + 1 < h`.
*Chain instance.* Assume (W5) of ThetaChainsOnDefiniteUnitaryGroups §2.3 with `h_gap ≥ max(120r³, h_nv(r, q_S))`, `h_gap > 8√(2q_S)(N₁ + 2rq_S)`,
`h_gap > rpq_S + 1` and (G) for `h_gap/4`, where `N₁ = 4r²√(2q_S)` (all implied by `SizeGap` of ThetaChainsOnDefiniteUnitaryGroups §2.3c, whose main term
`C_gap·r^{19}` with `C_gap ≥ 120` exceeds each of them). The chain instance below, and that of 5.15a, are used for
`r ≥ 1801` and consecutive nodes of the row parameter at least `16r^{19}` apart, which (St) of 5.20a implies when `C_l ≥ 16`
and `C′ ≥ 29` (the node gaps by its clause `C_lr^{19}f⁵L ≤ e′_{j+1}(τ) − e′_j(τ)`, the rank by `C′m⁵fL ≤ k`); this is the form
in which they are established. Then for every word `u` and every `τ`, `(𝒟_τ, V_{λ_u(τ)})`
satisfies the hypotheses of 5.13a, with the sign pattern of RowTowerAndRallisIdentities §5.3, the gap between entries of different signs of `hc(τ)` being
at least `h_gap` by (W5) and `0 ≤ v_l(τ) ≤ Sc` (ThetaChainsOnDefiniteUnitaryGroups §2.3), and `W_u = ⊗_τ W_{u,τ} : U(Y_0)(F_∞) → V_{λ_u}` is the *Bessel function
of `u`*, unique up to a scalar of modulus `1`, with
`∫_{S_u\U(Y_0)(F_∞)}‖W_u‖·ν^{N₁} < ∞`.

*Route.* Existence from 5.13c (d) and 5.13d (e)
(`W = l(D(·)w)`, normalised); uniqueness from 5.13c (d) and Frobenius reciprocity; the domination from `W = c·l(D(·)w)` and the
explicit lowest-`K`-type coefficient with its decay `|⟨w, D(x)w⟩| ≤ C‖x‖_HS^{−A}`, `A = h/(8√(2q_S))`, `C = r^{A/2}e^{A/√(2q_S)}`, valid for
`h ≥ 120·r·q_S^{3/2}` (DiscreteSeriesCoefficientsAndAutomorphicMetrics §2.4a (c); the chain instance has `h_gap ≥ 120r³`, which
covers it); the weighted bound by `ν(x) ≤ ‖sx‖`, the quotient integral formula (AnalyticNumberTheoryPartII §5.3k) and the
weighted integrability of the coefficient
(DiscreteSeriesCoefficientsAndAutomorphicMetrics §2.4a (d), whose hypotheses are the two inequalities for `N` in (f)).

*Sources:* (decay of generalised Whittaker functions: Beuzart-Plessis (2020), Lemma 7.3.1 (i)). The chain instance:
[FormalProof], `Development/AbelianVarietyTheory/Proofs/FlagMeasures/WuDecayOfGap.lean` (`GlobalTheory.wuDecayOfGap`),
`Formalism/LocalToGlobal/SiegelLatticeTheory/HaarTransversals/WuDecay.lean` (`Formalism.L2.SG.WuDecay.WuWeighted`); its hypotheses
on `h_gap` follow from [FormalProof], `Formalism/LocalToGlobal/SiegelLatticeTheory/HaarTransversals/ConcreteSettingExists.lean`
(`Formalism.L2.SG.ConcreteSettingExists.GapHyp`).
*Needs:* 5.13c, 5.13d,
ThetaChainsOnDefiniteUnitaryGroups §2.3, ThetaChainsOnDefiniteUnitaryGroups §2.3c, RowTowerAndRallisIdentities §5.3; AutomorphicFormsOnReductiveGroups §2.4 (discrete series); DiscreteSeriesCoefficientsAndAutomorphicMetrics §2.4a (b)–(d) (explicit
lowest-`K`-type coefficients of gapped discrete series of `U(p, q)`, their decay and their weighted integrability);
AnalyticNumberTheoryPartII §5.3k (quotient measures on `S_{z′}\G_τ`).

*Checks.*
- Half-integrality is automatic: Harish-Chandra parameters of `U(n)` lie in `((n − 1)/2 + ℤ)^n`, and `r − k = 2r_S + 1`
  is odd, so `u_i − hc_s ∈ ℤ + ½`. It makes the end of the walk of 5.13d (e) reachable by unit steps; neither it nor the
  interlacing excludes a blocked step (`u_{s+1} = hc_s − ½` is allowed: for `k = 2`, `u = (13/2, 9/2)` and `hc = (5; 0, −3)` both hold,
  and the factor `|hc_1 − ½ − u_2|` of `ϰ_1` in 5.13d (g) vanishes), which is why the walk of 5.13d (e) must avoid the blocked steps.
- For `r_S = 0` (`m = 2`) the unipotent group is trivial, `S_{z′} = U_{z′} ≅ U(k)` is compact, `ψ_{z′} = 1`, and 5.13c (d), 5.13d (e)
  say that `π` occurs exactly once in the restriction of `D` to `U(k)`: the codimension-one branching of discrete series
  of `U(k, 1)` (multiplicity one: Sun–Zhu, Theorem B; occurrence exactly under interlacing: He, Theorem 0.1). He restricts
  `U(p, q)` to `U(p − 1, q)`, so the signs are exchanged: the signs of RowTowerAndRallisIdentities §5.3 (`+` on
  `hc_1, …, hc_{k−1}, hc′_1`, `−` on `hc′_2`) and the interlacing of 5.13a give the sequence `u_1, hc_1, u_2, …, u_k, hc′_1, hc′_2`
  whose adjacent signs are all among the admissible pairs of He's Definition 1; with the alternation on `hc′` started by `−`, the
  pair `(⊖+)` at `u_k, hc′_1` would occur, and `π` would not occur.

### 5.14 Bessel–Poincaré series

*Origin:* adapted from Poincaré series of integrable functions (Petersson (1930); Godement (1958), §4, Théorèmes 5 and 5 bis;
in adelic form, for the
trivial subgroup, Muić (2009)): the series for a Bessel subgroup of a unitary group, built from a Bessel function and an
algebraic modular form on the definite factor, whose adjoint takes Bessel periods.

*Method of the formal proof:* linearity is read off the summand, the adjoint is obtained by unfolding over a fundamental
domain built from coset representatives, and convergence follows from an explicit count of rational points: the points
are sent to matrices in a product of balls, two of them are separated at some real place because their difference maps
one Hermitian lattice into the other and so has norm product at least `(τ₁(x)τ₁(y))^f`, and a packing bound concludes.
The count is explicit in the least normalised size of a sublattice, where the usual proof takes the bound from reduction
theory.

Let `u` be a word, `ℳ_0(u)` the space of ThetaChainsOnDefiniteUnitaryGroups §3.8 of algebraic modular forms
`T` on `U(X_0)` of weight `λ_u` and level `K_u = U(X_0)(𝔸_f) ∩ x_uK₂x_u^{−1}` with the character induced by `χ₂` (`x_u ∈ U(Y_0)(𝔸_f)`
the element of ThetaChainsOnDefiniteUnitaryGroups §2.9 relating the level lattice of `z` to that of `z_u`), with the Petersson product of the conventions,
and `d_u^{all} = dim ℳ_0(u)` (so `d_u = ((T(u) − 2)/(T(u) − 1))^f·d_u^{all}` by ThetaChainsOnDefiniteUnitaryGroups §3.8). The global Bessel datum of `u` is
`S_u = N_S ⋊ U(X_0)` with the character `ψ_u(n) = ψ_E(g^{−1}(Σ_{a<r_S}⟨f_a, n e_{a+1}⟩ + ⟨f_{r_S}, n z_u⟩))` of
`N_S(F)\N_S(𝔸)`, `ψ_E` as in 5.13a with its finite components prescribed: trivial on `𝒪_{E_v}` at every finite place `v`, and with
`ψ_{E,v}(x/g) = ψ_g(x)` for `x ∈ 𝒪_{E_v}` at the places above `g₀g₁` (`ψ_g` of ThetaChainsOnDefiniteUnitaryGroups §2.9a), so that `ψ_u(n) = χ₂(x_u^{−1}nx_u)` on `N_S(𝔸_f) ∩ x_uK₂x_u^{−1}` (at the type primes
`x_u = 1` and this is `χ_N`; elsewhere both sides are `1`); such `ψ_E` exist, since `a ↦ ψ_E(a·)`, `a` in the elements of `E^×` with
`c(a) = −a`, runs through all the characters of `𝔸_E/E` trivial on `𝔸_F`, and `a` can be taken in the inverse different of a standard
`ψ_E` with prescribed residues modulo a high power of the primes above `g₀g₁`. The columns are read as forms with values in
the dual of the weight space: an element `T ∈ ℳ_0(u)` is a `ℂ`-linear map from `V_{λ_u}` to the scalar functions on
`U(X_0)(F_∞) × U(X_0)(𝔸_f)` such that every `T(ξ)` is left invariant under `U(X_0)(F)` and transforms on the right under `K_u` by
the character induced by `χ₂`, and `T(h·ξ)(y) = T(ξ)(y·(h, 1))` for `h ∈ U(X_0)(F_∞)` (`h·ξ` its action on `V_{λ_u}`). Assume the
chain instance of 5.13. For `T ∈ ℳ_0(u)` put
`Ph_T(y) = ψ_u(n)·χ₂(κ)·T(W_u(y_∞))(1, h)` if `y_f = n·h·x_u·κ` with `n ∈ N_S(𝔸_f)`, `h ∈ U(X_0)(𝔸_f)`, `κ ∈ K₂`, and
`Ph_T(y) = 0` otherwise. The value `T(W_u(y_∞))(1, h)` is the evaluation of the form at the vector `W_u(y_∞)`: it is linear in `T`
and in `W_u(y_∞)`, and no Hermitian form of `V_{λ_u}` enters; so `Ph_{T+T′} = Ph_T + Ph_{T′}` and `Ph_{cT} = c·Ph_T` (`c ∈ ℂ`). Put

`P_uT(y) = Σ_{δ ∈ S_u(F)\U(Y_0)(F)} Ph_T(δy)`.

*Statement.* `Ph_T` is well defined; the series converges absolutely and locally uniformly; `P_uT` is independent of
the choices, square-integrable, and lies in `ℋ` (RowTowerAndRallisIdentities §5.3, the rows of the row type level); `P_u : ℳ_0(u) → ℋ` is `ℂ`-linear; and
for a row `F ∈ ℋ` represented by a function `f`, `⟨conj F, P_uT⟩ = ∫_{S_u(F)\U(Y_0)(𝔸)} f(y)·Ph_T(y) dy` (equivalently
`⟨P_uT, F⟩ = ∫ conj Ph_T(y)·F(y) dy`), the integral over a fundamental domain of `S_u(F)` on which `Ph_T` is integrable,
so that `P_u^*F` is the column form obtained by pairing
the global Bessel period of `F` along `(S_u, ψ_u)` (GanGrossPrasadUnitaryGroups 4.1) with `W_u` and the level vector.

*Route.* `Ph_T` is well defined: two factorisations `y_f = nhx_uκ = n′h′x_uκ′` differ by an element of `N_S(𝔸_f)U(X_0)(𝔸_f) ∩ x_uK₂x_u^{−1}`,
on which `ψ_u·χ₂(x_u^{−1}·x_u)^{−1}` and the level law of `T` agree by the prescription above. Linearity: `Ph_T` is linear in `T`
pointwise, the series converges absolutely, and the sum of a series and the class in `L²` are linear. The finite-adelic factor
of `Ph_T`
is supported on `N_S(𝔸_f)U(X_0)(𝔸_f)x_uK₂`, which is a finite union of sets `S_u(F)·y·K₂` (strong approximation for the
unipotent `N_S`, finiteness of the class set of `U(X_0)` at the level `K_u`; the set itself has infinitely many right
`K₂`-cosets when `r_S > 0`); the archimedean factor
is dominated through 5.13 (f). *Lattice count.* For `x ∈ U(Y_0)(𝔸)` let `Λ_x` be the Hermitian lattice `x_fL` (`L` the
standard self-dual lattice of `Y_0`) with the metrics `x_∞` (SlopesOfHermitianVectorBundles §3.2), and `τ₁(x)` the minimum of `½`
and the least normalised size of a nonzero sublattice of `Λ_x` (the size of a sublattice of rank `j` is its covolume to the
power `1/(jf)`). For `x, y ∈ U(Y_0)(𝔸)` and `ρ_v ≥ 0` the number of `γ ∈ U(Y_0)(F)` such that `x^{−1}γy` stabilises the standard
lattice at the finite places and has operator norm `≤ e^{ρ_v}` at every real place `v` is at most
`(3√r/(τ₁(x)τ₁(y)))^{2r²f}·exp(2r²Σ_vρ_v)`. Hence for a compact `Ω ⊂ U(Y_0)(𝔸)`:
`sup_y#{γ ∈ U(Y_0)(F) : (cg)^{−1}γy ∈ Ω} ≤ C(Ω)·‖g‖^{4r²}` for `c` in a compact set and `g ∈ U(Y_0)(F_∞)`, `‖g‖ = ∏_v‖g_v‖`; since
`‖g‖ ≥ 1` and `N₁ = 4r²√(2q_S) ≥ 4r²`, the series is dominated by `∫‖W_u‖ν^{N₁}`. *Proof of the count.* `γ ↦ (x_v^{−1}γy_v)_v` maps
the set into the product of the balls of radius `√r·e^{ρ_v}` of `M_r(ℂ)^f`. The difference `δ` of two of its elements is a
nonzero rational matrix with `δΛ_y ⊂ Λ_x`, and `∏_v‖x_v^{−1}δy_v‖ ≥ (τ₁(x)τ₁(y))^f`: if `δ` has rank `j`, the projection of `Λ_y`
along `ker δ` is the dual of a lattice isometric to a sublattice of rank `j` of `Λ_y` (because `Λ_y` is self-dual, its image
under the Cartan involution of the majorant is an isometric copy of it), `δ` maps it onto the sublattice `δΛ_y` of `Λ_x`, and
the `j`-th power of the operator norm bounds the determinant of `δ` there. So two elements are at distance `≥ τ₁(x)τ₁(y)` at
some place, and a packing bound concludes. For the multiplicity: if `γ₀` is counted, every counted `γ` has `x^{−1}γγ₀^{−1}x`
in the set with doubled `ρ_v`; `τ₁(c) ≤ τ₁(cg)‖g‖^{1/f}` (every covolume of rank `j` decreases by at most `∏_v‖g_v‖^j`); and a
compact set is covered by finitely many translates of sets `{‖ω_v‖ ≤ e^{ρ_v}, ω_f ∈ K′}`. The count uses of the level only
the stabiliser of the lattice (any compact open subgroup of it). Then
`P_uT` is square-integrable (Godement's criterion for Poincaré series of integrable functions); `R(e_𝒟)W_u = W_u` (5.13 (f)) and the
`(K₂, χ₂)`-equivariance give `R(e_𝒟 ⊗ 𝟙_{K₂,χ₂})P_uT = P_uT`; unfolding gives the adjoint.

*Needs:* RowTowerAndRallisIdentities §5.3, 5.13, ThetaChainsOnDefiniteUnitaryGroups §2.9, ThetaChainsOnDefiniteUnitaryGroups §2.9a, ThetaChainsOnDefiniteUnitaryGroups §2.9b, ThetaChainsOnDefiniteUnitaryGroups §3.8; GanGrossPrasadUnitaryGroups 1.2, 4.1; AdelicAlgebraicGroups §2.3 (rational quotients),
§3.5 (algebraic heights); AnalyticNumberTheoryPartII §5.3k (quotient measures, integration in stages, unfolding);
SlopesOfHermitianVectorBundles §3.2. *Sources:* method (Poincaré series of integrable functions; Petersson, Godement).
The linearity of `P_u` and the definition of `Ph_T`: [FormalProof],
`Formalism/LocalToGlobal/SiegelLatticeTheory/ClosedVolumeStatements/UnipotentInLevelSubgroup.lean`
(`Formalism.L2.SG.Closed.PuLinearC_holds`), `Formalism/LocalToGlobal/SiegelLatticeTheory/HaarTransversals/PoincareInHH.lean`
(`Formalism.L2.SG.PoincareInHH.PoincareSetting.PuLinear`); the adjoint: [FormalProof],
`Development/AbelianVarietyTheory/Proofs/DecoratedLatticeProofs/InnerPoincareSeriesEqSetIntegralUnfoldingStatement.lean`
(`GlobalTheory.T.inner_poincareSeries_eq_setIntegral_unfolding`); the lattice count of the route: [FormalProof],
`Formalism/LocalToGlobal/SiegelLatticeTheory/HaarTransversals/ExplicitFormulaBoundHolds.lean` (`Formalism.L2.SG.Count.LatCount`),
`Formalism/LocalToGlobal/SiegelLatticeTheory/CasimirReductionTheory/GgExistsAddCharNeOne.lean` (`Formalism.L2.SG.LitS.Size.tau1`);
the multiplicity bound of the route: follows from [FormalProof],
`Formalism/LocalToGlobal/SiegelLatticeTheory/HaarTransversals/ExplicitFormulaBoundHolds.lean` (`Formalism.L2.SG.Count.MultBound`).

### 5.15 Geometric expansion of the Gram operators

*Origin:* adapted from the unfolding of Poincaré series and the geometric side of a relative trace formula (Petersson
(1930); Jacquet (1986), §§1, 7, 9): the expansion of the Gram operators of Bessel–Poincaré series over pairs of lattices, with a
classification of the terms for the unitary group and its Bessel subgroups (identity, degenerate, generic and
non-generic terms) and of the pairs of terms of one row (their corank, loops and scalar pairs).

*Method of the formal proof:* the inner product of two Poincaré series is unfolded once over a transversal of the double
cosets `S_u(F)\U(Y_0)(F)/S_{u′}(F)`, each double coset contributing an integral over a fundamental domain of its discrete
stabiliser; a fundamental domain made of one slab for each class of `U(X_0)`, built by strong approximation for `N_S`,
sorts the terms by pairs of classes; the identity cell is computed by averaging a rank-one operator over the compact
group `U(X_0)(F_∞)` acting irreducibly on `V_{λ_u}` together with `∫‖W_u‖² = 1`, and vanishes for `u ≠ u′` by Schur's
lemma.

For words `u, u′` put
`c₀(u) = vol(K₂)·vol(Γ_u\N_S(F_∞))·vol(U(X_0)(F_∞))/dim V_{λ_u}`, where `Γ_u = N_S(F) ∩ x_uK₂x_u^{−1}` and `N_S(F_∞)`
carries the archimedean factor of the Haar measure of `N_S(𝔸)` (for the product measure whose finite factor gives
`N_S(𝔸_f) ∩ x_uK₂x_u^{−1}` mass one, `vol(Γ_u\N_S(F_∞))` is `vol(N_S(F)\N_S(𝔸))`), and
`K(u, u′) = (c₀(u)c₀(u′))^{−1/2}·P_u^*P_{u′} : ℳ_0(u′) → ℳ_0(u)`.

*Statement.* (a) *Geometric expansion.* `K(u, u′) = Σ_t a_t`, absolutely convergent in Hilbert–Schmidt norm, over the
*terms* `t`: a pair of classes `(L, L′)` of lattices in the genus of the lattice of ThetaChainsOnDefiniteUnitaryGroups §2.9 in `X_0` with their level structures (the
classes of `U(X_0)` at the levels `K_u`, `K_{u′}`), the unimodular lattices of `Y_0` attached to them, `Λ := h·x_u·L^Y` and
`Λ′ := h′·x_{u′}·L^Y` (`L^Y` the standard lattice of `Y_0`, `h, h′ ∈ U(X_0)(𝔸_f)` with `L = h·L_0`, `L′ = h′·L_0`), and a double coset
`N_Λ(F)·γ·N_{Λ′}(F)` of elements `γ ∈ U(Y_0)(F)` with `γΛ′ = Λ`. (The transporter condition is on the ambient unimodular lattices of
`Y_0`: a condition `γL′ = L` on the lattices of `X_0` would force `γX_0 = X_0`, and for `r_S = 0` then `γz_{u′} ∈ Ez_u` and `Gr(γ) = 0`.) The block of `a_t` between classes
`ρ, ρ′` over `(Λ, Λ′)` is `(c₀(u)c₀(u′))^{−1/2}·vol(K₂)·χ₂(κ_t(ρ, ρ′))·O_t` when `κ_t(ρ, ρ′) ∈ K₂` and `0` otherwise, with
the archimedean orbital integral `O_t = ∫_{R_t\U(Y_0)(F_∞)} W_u(x) ⊗ conj W_{u′}(γ^{−1}x) dx`,
`R_t = N_Λ ∩ γN_{Λ′}γ^{−1}` (a discrete group, trivial when `Gr(γ) > 0`). A term exists only if
`T(u) ≡ T(u′) (mod g₀g₁)`.
(b) *Classification.* Terms whose two characters differ on `Lie N_S ∩ γ Lie N_S γ^{−1}` vanish. The identity terms
sum to the identity for `u = u′` and to `0` for `u ≠ u′`. *Degenerate* terms (`Gr(γ) = 0`, `γ` not in the identity
coset) vanish for `u ≠ u′` and act by scalars on each block for `u = u′`. The remaining terms have `Gr(γ) > 0`. Let
`F = (e_1, …, e_{r_S}, z_u)` be the base frame, `X = ⟨e_1, …, e_{r_S}⟩`, and `F′ = (e′_1, …, e′_{r_S}, z′)` the second frame of the
term, `X′ = ⟨e′_1, …, e′_{r_S}⟩`; by the level `K₂` there is an integral upper unitriangular matrix `ξ` with
`F′_b − Σ_aξ_{ab}F_a ∈ gΛ` at the primes above `g = g₀g₁`. Put `U = (Λ ∩ X) + 𝒪_Ez_u + (Λ ∩ X′) + 𝒪_Ez′`. The term is *generic* if
at every prime `𝔓` of `E` the lattice `Λ ∩ EU` is, locally at `𝔓`, the smallest one possible: `U_𝔓` if `𝔓 ∤ g`, and the lattice
generated by `Λ ∩ X`, `z_u` and the vectors `g^{−1}(F′_b − Σ_aξ_{ab}F_a)` if `𝔓 | g` (it does not depend on `ξ`). Otherwise it is
*non-generic*. (At `𝔓 ∤ g` the condition says that the two frames span a primitive sublattice of `Λ_𝔓`: this is the
primitivity which the densities `d_𝔭(Z)` of 5.17 count. At `𝔓 | g` the lattice generated by the two flags is never all of
`Λ ∩ EU`.)
(c) *Local form.* At `γ` with `Gr(γ) > 0`, `O_t = ⊗_τ 𝒥f_τ(γ_τ)` in a normalised frame, where
`f_τ = c_τ⟨a_τ, 𝒟_τ(·)b_τ⟩·(ξ_τ ⊗ ξ′_τ^*)` is a `K`-finite coefficient times a rank-one operator normalised by the Bessel
maps of 5.13c (`⟨l(a_τ), ξ_τ⟩⟨ξ′_τ, l′(b_τ)⟩ = 1`), and `𝒥` is the Bessel integral of 5.13b (b).
(e) *Pairs.* Let `I = ∏_{𝔭|g₀g₁}GL_k(𝔽_𝔭)` (`𝔭` the primes of `F` above `g₀g₁`), acting freely on the level structures over a fixed
pair of lattices (the reductions of frames), and `ι(t) ∈ I` the reduction of the `k × k` block of `κ_t`. A *row* is a triple
`(Λ, Λ′, i)`: a pair of lattices of (a) and an element `i ∈ I`; a term lies in the row of its two lattices and of `ι(t)`. Two terms `t, t′` of one row with `Gr ≠ 0`, with representatives `γ, γ′`, define `β = γ′γ^{−1}`, an
automorphism of `Λ` carrying the second flag `(X′, z′)` of `t` to the second flag `(X″, z″)` of `t′`. With `H′ = (EU)^⊥` (positive
definite of rank `k − 1`) and `Rad′ = {x ∈ H′ : (1 − β)x ∈ X + X″}`, the *corank* of the ordered pair is
`s(t, t′) = 1 + dim H′ − dim Rad′ ∈ {1, …, k}`; it does not depend on the representatives (for `g ≥ 3` two automorphisms of `Λ`
carrying one flag to the other compatibly with the congruences agree on `X′^⊥` modulo `X″`). *Loops* are the pairs of corank
`≥ 2`. A pair of corank one is *scalar* if for all `y ∈ EU ∩ (X + Ez_u)^⊥` and `y′ ∈ EU ∩ (X′ + Ez′)^⊥` the coordinates `(α, α′)`
defined by `y − y′ ∈ αz_u + α′z′ + X + X′` are also those of `(y, βy′)` with respect to `(z_u, z″)`, that is
`y − βy′ ∈ αz_u + α′z″ + X + X″`; the pair `(t, t)` is scalar of corank one. On the generic terms of one row, "scalar of corank
one" is an equivalence relation.

*Route.* (a) Unfold `⟨P_uT, P_{u′}T′⟩` over `S_u(F)\U(Y_0)(F)/S_{u′}(F)` and sort the finite part by the classes of
`U(X_0)` (Petersson, Jacquet); comparing the norms of `z_u, z_{u′}` modulo `g` on the level lattice gives the
congruence. (b) A non-relevant term is an integral of a nontrivial character over a cocompact discrete group. The
identity cell is computed by Schur orthogonality for the type `V_{λ_u}` of the compact `U(X_0)(F_∞)` and
`∫_{S_u\U(Y_0)(F_∞)}‖W_u‖² = 1`, which is what fixes `c₀(u)`. For a degenerate term the pointwise stabiliser of
`span(e, z_u) + γ·span(e, z_{u′})` is a full compact `U(k)` at every real place and `O_t` intertwines `V_{λ_u}` with the
`γ`-twist of `V_{λ_{u′}}`; Schur's lemma gives `0` when the highest weights differ (they differ at every real place for
`u ≠ u′`) and a scalar when `u = u′`. The lattice generated by `Λ ∩ X`, `z_u` and the `g`-th parts of the differences does not
depend on `ξ` because two choices of `ξ` differ by an integral unitriangular matrix. (c) Schur orthogonality writes
`W_u(x) ⊗ conj W_{u′}(γ^{−1}x)` integrated over `G_τ` as the Bessel integral of a coefficient, using the identification
`W_u = l(𝒟_τ(·)w)` of 5.13c (d), 5.13 (f). (e) Definitions; the independence of the representatives and the equivalence
relation are read off the two flags: `β` is determined on `X′^⊥` modulo `X″` by the flags and the congruences (`g ≥ 3`), and
the coordinates `(α, α′)` of a generic term at its row are a function of the pair of flags.

*Needs:* 5.13b, 5.13c, 5.13, 5.14; RepresentationTheory/CompactGroups Layers 2, 4; HermitianFormsAndLattices §§5.1, 5.2 (genus,
classes, stabilisers); AnalyticNumberTheoryPartII §5.3k (quotient measures, integration in stages, unfolding); Mathlib
(Haar measure). *Sources:* (unfolding; geometric side of a relative trace formula of
Bessel type). The expansion of (a) and the identity terms of (b): [FormalProof],
`Formalism/LocalToGlobal/SiegelLatticeTheory/FlagStabilizerTensors/PoincareConstantEq.lean` (`Formalism.L2.SG.Full.KExpansionC`,
`Formalism.L2.SG.Full.AbsConvC`, `Formalism.L2.SG.Full.IdCellOffC`, `Formalism.L2.SG.Full.IdCellDiagC`).

*Checks.*
- `u = u′`, identity term only: `K(u, u)` restricted to the identity cell is `1`; with `c₀` omitting the factor
  `1/dim V_{λ_u}` it would be `(dim V_{λ_u})^{−1}·1`.
- For `r_S = 0` (`m = 2`), `Gr(γ) = |⟨γz_{u′}, z_u⟩|² − T(u)T(u′) ≥ 0` is the reverse Cauchy–Schwarz inequality for two
  negative vectors, with equality exactly when `γz_{u′}` is proportional to `z_u`.
- "Generic" is a condition at every prime: with the condition only above `g₀g₁`, the mean value formula of 5.17 (with the
  densities of primitive representations `d_𝔭(Z)`) and the corank-one inequality of 5.20b would not be what their routes prove.

### 5.15a Relative Schur orthogonality

*Origin:* particular to this proof: an orthogonality inequality `∫‖O(γ)‖²_HS dγ ≤ 1/d` over the double cosets of two
closed unimodular amenable subgroups, for functions equivariant under one of them each and fixed by the projector of a
square-integrable representation, with equality for coefficients in the chain instance under the gap condition (G);
nearest published results: Schur orthogonality for square-integrable representations, the case `S = S′ = {1}`, and the
one-sided relations with the formal degree of Ichino, Lapid and Mao (2017) and Beuzart-Plessis (2018), Plancherel
formula.

*Method of the formal proof:* the generalised vectors behind the two functions are truncated along Følner sets of the two
subgroups, Schur orthogonality on the whole group is applied to the truncations, and the limit is taken with Fatou's
lemma and the disintegration of Haar measure along the double cosets; equality for coefficients uses the regularised
Bessel pairing and its rank-one form. The published one-sided relations are proved by unfolding with absolute
convergence.

Let `𝐆` be a unimodular second-countable locally compact group, `σ` an irreducible
square-integrable unitary representation of formal degree `d`, `w` a unit vector and `e_σ = d·conj⟨w, σ(·)w⟩`; `S, S′ ⊂ 𝐆` closed
unimodular amenable subgroups with Følner sequences; `(κ, V)`, `(κ′, V′)` finite-dimensional unitary representations of `S`, `S′`;
and `W : 𝐆 → V`, `W′ : 𝐆 → V′` continuous, with `W(sx) = κ(s)W(x)`, `W′(s′x) = κ′(s′)W′(x)`, `R(e_σ)W = W`, `R(e_σ)W′ = W′` (`R` the integrated right action of 5.13 (f)),
`∫_{S\𝐆}‖W‖ < ∞`, `∫_{S′\𝐆}‖W′‖ < ∞` and `∫_{S\𝐆}‖W‖² = ∫_{S′\𝐆}‖W′‖² = 1` (the quotient measures of
AnalyticNumberTheoryPartII §5.3k, `S`, `S′` and `𝐆` being unimodular). Let `(C, m)` be a measure space and `h : C → 𝐆`
a measurable map with `∫_𝐆 φ = ∫_C∫_S∫_{S′}φ(s·h(c)·s′^{−1}) ds′ ds dm(c)` for every measurable `φ ≥ 0` (a parametrisation of
almost all double cosets; `dγ` denotes the image of `m`). Assume that for every `c ∈ C`, with `γ = h(c)`: (i) the integral
`O(γ) := ∫_𝐆 W(x) ⊗ conj W′(γ^{−1}x) dx ∈ V ⊗ V̄′` converges absolutely; (ii)
`∫_{S\𝐆}∫_{S′\𝐆}∫_S∫_{S′}|⟨σ(z)w, σ(sγs′^{−1})σ(z′)w⟩|·‖W(z)‖·‖W′(z′)‖ ds′ ds dz′ dz < ∞`; and that (iii)
`∫_{S\𝐆}∫_{S\𝐆}∫_S|⟨σ(z)w, σ(s)σ(z′)w⟩|·‖W(z)‖·‖W(z′)‖ ds dz′ dz < ∞`, and the same with `(S′, W′)` in place of `(S, W)`.
Then `∫_C‖O(h(c))‖²_HS dm(c) ≤ 1/d`. (When almost every `S × S′`-orbit in `𝐆` has compact stabiliser such a parametrisation
exists, the volume of the stabiliser of the orbit being absorbed into `dγ`; this remark is this roadmap's own, not on the path
of [FormalProof], and nothing uses it.)

*Chain instance and the equality for coefficients.* For `𝐆 = G_τ = U(Y_0)(F_τ)`, `σ = 𝒟_τ`, `S = S_u`, `S′ = S_{u′}`, `W = W_{u,τ}`,
`W′ = W_{u′,τ}` (5.13), with `O(γ) = ∫_{U(Y_0)(F_∞)} W_u(x) ⊗ conj W_{u′}(γ^{−1}x) dx`:
`∫_{S_u\U(Y_0)(F_∞)/S_{u′}} ‖O(γ)‖²_HS dγ ≤ 1/∏_τ d(𝒟_τ)`, the quotient measure being that of 5.13a (a); the parametrisation is
the big cell of 5.13a (a), and (i)–(iii) hold by 5.13c (d) and 5.13 (f). (The stabiliser of a regular
point is not trivial but compact: it contains the unitary group of the positive definite orthogonal complement of the span
of the two frames, of dimension `(k − 1)²`; the dimension count `dim G_τ = 2·dim S_u + 2(r_S + 1) − (k − 1)²` of the disintegration
of 5.13a (a), with `dim S_u = r_S(2r_S + 2k + 1) + k²`, makes it the identity component, and a real algebraic group has finitely
many components. For `r_S = 0` two independent negative vectors of `U(k, 1)` have joint stabiliser `U(k − 1)`. This remark is this
roadmap's own, not on the path of [FormalProof].) If the gap of `𝒟_τ`
satisfies (G) of 5.13a, there is equality for coefficients in the following form: if `F = Σ_i⟨x_i, 𝒟_τ(·)y_i⟩X_i` with `x_i, y_i`
in the span of the translates of `K`-finite vectors and `s(F) = Σ_i⟨l(x_i), X_i l′(y_i)⟩`, then `β(F, F) = c·|s(F)|²/d(𝒟_τ)`,
with `c > 0` depending only on the local Bessel data (the two vectors, the two types and the Haar measures), not on
`𝒟_τ` nor on `F`. Moreover the Bessel integral of such an `F` converges
absolutely at every regular point and equals `s(F)` times a function `𝔅_{𝒟_τ}` that does not depend on `F`.

*Route.* Truncate the distribution vectors of `W, W′` along Følner sets of `S`, `S′`; Schur orthogonality on `𝐆` for the
truncated vectors gives the inequality with `1/d` for the truncations; pass to the limit by Fatou's lemma and the
disintegration of Haar measure (the hypothesis on `h`). In the chain instance `S_u = N_S ⋊ U(k)` is amenable, and the integrability hypotheses come
from 5.13c (d) and 5.13 (f). The equality for coefficients:
`β` is the constant of 5.13a (a) times `β^∞` (5.13b (b)); for integrable coefficients `β^∞` is the
absolutely convergent integral of `𝒫` against the two characters, then Schur orthogonality on `G_τ` and the rank-one form of
the Bessel forms (5.13c (d)); the convergence of `𝒥` on such coefficients and the norm formula are where (G) is used. The last
statement: integrate over `S_{z′}` first, then over `S_{z″}` first, and use the rank-one form on each side.

*Check.* `S = S′ = {1}`, `V = V′ = ℂ`: for unit vectors `b, b′` whose coefficients below are integrable on `𝐆` (any unit vectors
when `𝐆` is compact), `W = √d·⟨b, σ(·)w⟩` and `W′ = √d·⟨b′, σ(·)w⟩` satisfy the hypotheses (`R(e_σ)W = W` and `∫_𝐆|W|² = 1` by
Schur orthogonality); by Schur orthogonality `O(γ) = ⟨b, σ(γ)b′⟩`, and `∫_𝐆|⟨b, σ(γ)b′⟩|²dγ = 1/d`: equality. The coefficients
`⟨σ(·)w, b⟩`, conjugate-linear in `σ(·)w`, are not fixed by `R(e_σ)`: for `𝐆 = U(1)` with Haar probability measure, `σ(θ) = e^{inθ}`,
`n ≠ 0`, `w = b = 1`, it sends `x ↦ e^{−inx}` to `0`. Amenability is used for the truncation only.

*Sources:* (Schur orthogonality; relative characters). The chain instance: follows from [FormalProof],
`Formalism/LocalToGlobal/SiegelLatticeTheory/ClosedLocalOrbits/GaugeLatticeShifts/RealObjInInfinityXOfG.lean`
(`Formalism.L2.SG.Pf.realObj_inInfinityX_ofG`), `Formalism/LocalToGlobal/SiegelLatticeTheory/ClosedLocalOrbits/RealObj.lean`
(`Formalism.L2.SG.RealObj.InInfinityX`); the equality `β(F, F) = c·|s(F)|²/d(𝒟_τ)` for coefficients: [FormalProof],
`CompanionTheory/AutomorphicTheory/PieriRules/ThetaBesselIsometries/BesselSettingUniformConstantStatement.lean`
(`Gp91.GlobalTheory.T.bessel_setting_uniform_constant`), `Development/AbelianVarietyTheory/Definitions/Jets/SideFam.lean`
(`BranchingSupport.IsCoef`).
*Needs:* 5.13a, 5.13b, 5.13c, 5.13, 5.15;
VonNeumannAlgebras Layer 9 (coefficient maps, Schur orthogonality, formal degree); AnalyticNumberTheoryPartII §5.3k
(quotient measures on `S\𝐆`); Mathlib (`IsFoelner`, Haar measure, Fatou's lemma).

### 5.16 Limit multiplicity with a uniform error

*Origin:* particular to this proof: limit multiplicity of discrete series of unitary groups of Hermitian spaces over CM
fields with relative error `exp(−c·nf log n)`, uniform in the rank, the field, the level and the weight, under a gap
condition and unipotent support at one prime; nearest published result: Savin (1989), after DeGeorge and Wallach (1978),
limit multiplicity along towers of levels with the group fixed.

*Method of the formal proof:* the multiplicity is the integral over a fundamental domain of the diagonal of the kernel of
the projector given by the lowest `K`-type coefficient, the identity term giving the main term; the domain is cut by the
least normalised size in the canonical filtration of the Hermitian lattice and by the type of the canonical flag; near
terms are unipotent by a congruence on power traces and are counted against measure bounds for the points of each flag
type, far terms are bounded by the decay of the coefficient, and the deep part by the vanishing of constant terms. The
published proofs work along a tower with the group fixed and show that the cusp contribution vanishes in the limit,
without a uniform error.

For every `C_ϕ ≥ 0` there is `n₀` with the following property, with `c = 1/16` and `C = 8·10¹⁴(C_ϕ + 4)`. Let
`E/F` be a CM extension, `f = [F:ℚ]`, `V` a nondegenerate Hermitian space over `E` of dimension `n ≥ n₀` with a self-dual
lattice `L`, of the same signature `(p_V, q_V)` at every real place with `q_V² ≤ n`, and `log rd_E ≤ e^n`, `log f ≤ √n`. Let
`b ≥ 2` with `log log b ≤ c·nf log n`, `π_∞ = ⊗_τ π_τ` a discrete series of `U(V)(F_∞)` with Harish-Chandra parameters of
size `≤ b²` whose entries of different signs differ by at least `C·n^{19}f^5·log(b·rd_E)` (the gap of 5.13a),
`e_{π_∞} = ∏_τ d(π_τ)conj⟨w_τ, π_τ(·)w_τ⟩` on lowest-`K`-type unit vectors, and `ϕ` an *admissible idempotent* on
`U(V)(𝔸_f)`: locally constant, `ϕ ∗ ϕ = ϕ`, `ϕ(x^{−1}) = conj ϕ(x)`, of positive type, supported in the stabiliser of `L`,
bi-invariant under its principal congruence subgroup of some level `g_ϕ ≤ b^{C_ϕ}`, and supported on elements unipotent
modulo a prime `g′ > 4n` that splits completely in `E` (unipotent on `L/g′L`: `(x − 1)^n L ⊂ g′L`). Then
`m(π_∞, ϕ) := rank R(e_{π_∞} ⊗ ϕ)` is finite and

`|m(π_∞, ϕ) − D*(π_∞, ϕ)| ≤ exp(−c·nf log n)·D*(π_∞, ϕ)`,  `D*(π_∞, ϕ) = ∏_τ d(π_τ)·vol([U(V)])·ϕ(1)`.

*Chain instance.* Let `V = Y_0` (`n = r`, `q_V = r_S + 1`), `π_∞ = ⊗𝒟_τ` and `ϕ = 𝟙_{K₂,χ₂}` (supported on elements unipotent
modulo `g′ = g₀`, which splits completely in `E`), and assume `r ≥ n₀`, `(r_S + 1)² ≤ r`, `log rd_E ≤ e^r`, `log f ≤ √r`,
`log log b ≤ c·rf log r`, `g₀g₁ ≤ b^{C_ϕ}`, `g₀ > 4r`, (W6) of ThetaChainsOnDefiniteUnitaryGroups §2.3, and (W5) with `h_gap ≥ C·r^{19}f^5·log(b·rd_E)`. Then
`|D_all − D*| ≤ ε_C·D*` with `ε_C = exp(−c·rf log r)`.

*Route.* (a) Call a function `F` on `U(V)(F)\U(V)(𝔸)` *cuspidal* if, for every nonzero totally isotropic subspace `W ⊂ V`,
with `N_W` the unipotent radical of the stabiliser of `W` in `U(V)`, `∫_{N_W(F)\N_W(𝔸)}F(nx) dn = 0` for almost every `x` (the
definition is made on `U(V)` itself; no reduction to a semisimple group is involved). Under the gap of the statement the
coefficient `⟨w_τ, π_τ(·)w_τ⟩` decays so that `e_{π_∞} ⊗ ϕ` is integrable and `R(e_{π_∞} ⊗ ϕ)` is a bounded operator; the
space of intertwiners from `π_∞` to `L²(U(V)(F)\U(V)(𝔸))` with values fixed by `R(ϕ)` is finite-dimensional, and it has an
orthonormal basis `T_1, …, T_D` of isometric intertwiners whose values are cuspidal and such that `T_1(w), …, T_D(w)`,
`w = ⊗_τw_τ`, is an orthonormal basis of the range of `R(e_{π_∞} ⊗ ϕ)` (RowTowerAndRallisIdentities §5.3). So
`R(e_{π_∞} ⊗ ϕ)` is a projection onto cusp forms, and `m(π_∞, ϕ) = ∫_𝔉 Σ_{γ∈U(V)(F)} (e_{π_∞} ⊗ ϕ)(x^{−1}γx) dx`
over a fundamental domain `𝔉`, the kernel on the diagonal being `Σ_i|F_i(x)|²` for an orthonormal basis of the range;
the term `γ = 1` integrates to `D*(π_∞, ϕ)`. (b) For `x ∈ U(V)(𝔸)` let `Λ_x` be the Hermitian lattice `x_fL` with the
metrics `x_∞`; its canonical filtration (SlopesOfHermitianVectorBundles §3.2) gives `least(x)`, the least normalised size
of a nonzero sublattice; split `𝔉` into the *moderate* part `least(x) ≥ τ*` (`τ* = (nf·rd_E·g_ϕ·b)^{−11q_V}`) and the *deep*
part. (c) *Short flags are rare:* the measure of `{least < ½}` is at most `exp(−nf log n/3)·vol(𝔉)` when `q_V² ≤ n`, by
unfolding over the parabolic of the flag (Iwasawa integration, covolumes of unipotent radicals, volumes of `GL_j(E)`,
mass ratios of unitary groups of smaller rank, and the residue bound AnalyticNumberTheoryPartI §2.15,
`Res_{s=1}ζ_E ≤ (e·log rd_E)^{2f−1} ≤ e^{(n+1)(2f−1)}` under `log rd_E ≤ e^n`); the flag constant of a flag
of total rank `J` with blocks `j_i` is
`κ(E; p, q; j) = v^{−f·d_N/2}·2^{−f(nJ − J² + J/2)}·(S(p)S(q)/(S(p−J)S(q−J)∏_iS(j_i)))^f·(Res_{s=1}ζ_E)^{a}·∏_i∏_{l=2}^{j_i}ζ_E(l)/∏_{M=n−2J+1}^{n}L(M, η^M)`,
`v = rd_E/2`, `d_N = 2Jn − 2J² − Σj_i²`, `S(i) = ∏_{l=1}^{i}2π^l/(l−1)!`, `a` the number of blocks (the powers of `2` are those of
`vol U(i) = S(i)·2^{i(i−1)/2}` and of the Iwasawa factors), and it is at most `exp(−½Jnf log n)` for `log n ≥ 15`: all its factors
except the quotient of sphere-volume products are `e^{O(Jnf)}`, and that quotient is at most
`exp(−Jf(n − 2√n)(log n − log 2π − 1) + O(Jf√n·log n))`. (d) *Near elements are
unipotent:* if `x^{−1}γx` lies in the support and within Cartan distance `c·n^{−8}f^{−2}` of the maximal compact
subgroup at every real place, then `|tr(γ^j) − n| ≤ 3n` at every embedding and `tr(γ^j) ≡ n (mod g′𝒪_E)` (the reduction
modulo `g′` is to a reduced ring, which is where radicality is used; no other step uses `g′`), so `tr(γ^j) = n` for
`j ≤ n` (an element of `g′𝒪_E` all of whose conjugates have absolute value `≤ 3n < g′` is `0`) and `γ` is unipotent
(Newton's identities); the argument uses of `g′` only that `g′𝒪_E` is radical and `g′ > 3n`; the statement is made for a
prime `g′ > 4n` splitting completely, which is what the chain supplies;
if `least(x) ≥ ½` the only near element is `1`; at a point whose canonical flag has graded pieces
with size ratios `λ`, the near elements lie in the unipotent radical of the stabiliser of the canonical flag (a near element
maps the step of sizes `≤ t` into the step of smaller sizes) and are counted block by block: between the graded pieces
`p > q` the differences form a lattice of least size `≥ t_q/t_p`, so the block contributes at most `(1 + 4δt_p/t_q)^{dim}`;
with the sizes `τ_i, 1, τ_i^{−1}` of the self-dual chain this is at most `∏(1 + 12δ/λ)^{mult}` (`δ` the Cartan distance bound); against
the flag measure of (c) (count) × (density) is at most `2∏_i(2fj_i/τ_i)`, so the moderate range contributes a power of
`log(1/τ*)`. (e) *Far elements* are bounded by the decay `exp(−(gap/8)·min(d², d/√(2q_V)))` of the lowest-`K`-type
coefficient (DiscreteSeriesCoefficientsAndAutomorphicMetrics §2.4a (c), with `d = ‖X‖_HS` for `x = k·exp X`, under
`gap ≥ 120·n·min(p_V, q_V)^{3/2}`) against
the count `#{γ : d(x, γx) ≤ R} ≤ (3√n/τ₁(x)²)^{2n²f}·e^{2n²ΣR_v}` on the moderate part (the lattice count of 5.14 with `y = x`).
(f) *Deep part:* for `x` deep, cusp forms have vanishing constant term along the unipotent radical of a step `W` of the
filtration; there is a step `W` of the canonical flag such that every point of `N_W(ℝ)x` is a rational translate, modulo
the principal congruence subgroup of level `g_ϕ`, of `x·exp(A)exp(Z)` with `‖A‖ + ‖Z‖ ≤ n²√f·g_ϕ·rd_E·(2·least(x))^{1/q_V}/4`
(among the at most `q_V` consecutive ratios of sizes of the flag one is `≤ (2·least(x))^{1/q_V}`, and for that step the
integral points congruent to `1` modulo `g_ϕ` of the two-step nilpotent group `N_W` have covering radius at most this bound in
the frame of `x`, by the transference bound: a lattice of rank `N` whose dual has no nonzero vector shorter than
`κ` has covering radius `≤ N²/(2κ)`, applied to the first layer, whose dual minimum is controlled by the ratio of sizes, and
to the centre, by the square of the size; the transference bound is `μ(L)·λ_1(L^∨) ≤ N` (GeometryOfNumbersAndQuadraticArithmetic
§4.4.14), which gives `≤ N/κ ≤ N²/(2κ)` for `N ≥ 2`, while for `N = 1` the covering radius is `1/(2λ_1(L^∨))`; successive rounding
in an arbitrary basis does not give it: for the basis `(M, 1), (1, 0)` of `ℤ²` the first Gram–Schmidt length is `√(M² + 1)` while
the dual minimum is `1`);
iterating a mean-value inequality for
derivatives along `Lie N_W` (on vectors at `K`-type distance `≤ P` from the lowest, `‖dπ(X)v‖ ≤ (√n·b² + (3/2)n√n + 3P)‖v‖`)
about `8q_Vn²f` times gives `Σ_i|F_i(x)|² ≤ (2τ)^{c′n²f}·(Sobolev bound)`, the Sobolev bound being
`Σ_i|F_i(y)|² ≤ (6β)^{n²f}e^f(1 + 4√n/τ₁(y)²)^{2n²f}·m(π_∞, ϕ)·∏c_v/vol(K(g_ϕ))` for vectors at `K`-type distance `≤ P₀`,
`β = √n·b² + (3/2)n√n + 3(P₀ + n²f)` (the one-variable Sobolev inequality along `n²f` one-parameter subgroups, and the lattice
count of 5.14 for the number of translates of the fundamental domain met by a cube of side `1/β`); its integral over the deep
part is `≤ e^{−n²f}·m(π_∞, ϕ)`. The cover and the Sobolev bound are for the principal congruence subgroup `K(g_ϕ)`; the
counts for the stabiliser of the lattice. (g) Combine.
Chain instance: `𝟙_{K₂,χ₂}` is an admissible idempotent (ThetaChainsOnDefiniteUnitaryGroups §2.9: `K₂` is the inverse image of a unipotent subgroup modulo
`g₀g₁`, and `g₀`, split completely, is unramified in `E`), the gap from (W5) as in the chain instance of 5.13, the parameters from (W6).

*Needs:* RowTowerAndRallisIdentities §5.3, 5.14, ThetaChainsOnDefiniteUnitaryGroups §2.3, ThetaChainsOnDefiniteUnitaryGroups §2.3c, ThetaChainsOnDefiniteUnitaryGroups §2.9, ThetaChainsOnDefiniteUnitaryGroups §2.9a; AutomorphicSpectralTheory §4.5 (finite multiplicity); DiscreteSeriesCoefficientsAndAutomorphicMetrics §9.1 (trace class),
§2.4a (c) (explicit lowest-`K`-type coefficients of gapped discrete series and their decay); SlopesOfHermitianVectorBundles §3.2; HermitianFormsAndLattices §§6.0b,
5.5, 6.4, 6.5; AdelicAlgebraicGroups §3.1 (Iwasawa integration), §3.4 (adelic reduction, finite covolume); GeometryOfNumbersAndQuadraticArithmetic
§4.4.14 (covering radius and dual minimum); AnalyticNumberTheoryPartI §2.15 (residue bound for Dedekind zeta functions).
*Sources:* (limit multiplicities of
discrete series: DeGeorge–Wallach for compact quotients, Clozel and Savin for non-compact ones; rapid decay of cusp
forms). The statement: [FormalProof],
`Development/AbelianVarietyTheory/BlockTheory/SiegelWeilLocal/LatticeCountingTheorem.lean`
(`GlobalTheory.IndefiniteRowSideFullHecke.LatticeCountingTheorem.CountingTheorem`), with its hypotheses in
`Development/AbelianVarietyTheory/Definitions/SemilocalFrames/LayerProd.lean` (`GlobalTheory.Count.CountHyp`), and unbundled in
`Development/AbelianVarietyTheory/Proofs/FlagMeasures/UnitaryAutomorphicCountingUnbundled.lean` (`GlobalTheory.CountBridge.count_unbundled`);
the form at the points of the chain: [FormalProof], `Formalism/SharpRestriction/CuspSpanNormBounds/BridgeCountE.lean`
(`Formalism.MainNotions.S.CountE.CountAllPointsClass`).

*Checks.*
- For a cocompact torsion-free lattice and an integrable discrete series the multiplicity equals `d(π)·covolume`
  exactly (Langlands 1966): no near, far or deep terms. The error term here is the price of the non-compact quotient.
- The unipotent support at one prime is needed: without it the elements of finite order of the level group give
  near terms with `γ ≠ 1` that do not vanish.
- ShimuraVarieties §7.0h is Clozel's lower bound `liminf m/[Γ_0 : Γ_i] > 0` for the holomorphic discrete series along a
  congruence tower with a fixed supercuspidal place, for simply connected almost simple groups; the bound here is two-sided,
  with an error uniform in rank, field, level and weight, and neither statement contains the other.

### 5.17a The Gelfand–Graev expansion at the type primes

*Origin:* adapted from multiplicity one for the Gelfand–Graev representation (Gelfand and Graev (1962)): the norm of a
family of terms as a quadratic form in the Gelfand–Graev character at the type primes, with its bound.

*Method of the formal proof:* the inequality is reduced to the positive semidefiniteness of `∏_𝔭(1 + 3/N𝔭)·γ_GG(1)`
times the identity minus the matrix `(γ_GG(j^{−1}i))`, which follows from multiplicity one of Whittaker functionals
(Gelfand's trick with the flip across the antidiagonal and a Bruhat decomposition), the lower bound `∏_{i<k}(q^i − 1)`
for the dimension of a generic representation, and the action of the Gelfand–Graev convolution on irreducible
representations.

Let `𝔭` run over the primes of `F` above `g₀g₁`; each
splits in `E`, `U(X_0)(F_𝔭) ≅ GL_k(F_𝔭)`, and the residue field `𝔽_𝔭` has `g₀` or `g₁` elements; assume `#𝔽_𝔭 ≥ 3`. The
character of the row type level is `χ₂ = χ_N·χ_L` (ThetaChainsOnDefiniteUnitaryGroups §2.9a), `χ_L` the generic character of the upper unipotent subgroup of the
block of `X_0` and `χ_N` the character along the flag. With `I` and `ι(t)` as in 5.15 (e), let `γ_GG = ∏_𝔭γ_𝔭`,
`γ_𝔭(x) = |U|^{−1}Σ_yψ_𝔭^♮(yxy^{−1})`, the Gelfand–Graev characters for the residues `ψ_𝔭` of the additive character of conductor
`g` (`ψ^♮` the generic character of the upper unipotent group `U`, extended by `0`). For a family `𝒮` of generic or of
non-generic terms of 5.15 that is a union of `I`-orbits, with `v_i = Σ_{t∈𝒮, ι(t)=i} 𝐯_t` (`𝐯_t` the amplitude `χ_N(κ_t)·O_t`
with its row weight, placed in the coordinate `(Λ, Λ′)`), so that `Σ_i‖v_i‖²` is the sum of `⟨𝐯_t, 𝐯_{t′}⟩` over the ordered
pairs of terms of one row of 5.15 (e):
`‖Σ_{t∈𝒮} a_t‖²_HS = Re Σ_{i,j∈I} conj γ_GG(j^{−1}i)·⟨v_i, v_j⟩ ≤ ∏_𝔭(1 + 3/N𝔭)·γ_GG(1)·Σ_i‖v_i‖²`, where
`∏_𝔭(1 + 3/N𝔭) = ((1 + 3/g₀)(1 + 3/g₁))^f` (`f` primes of `F` above each `g_i`). This is a statement at the row
type level, through its Levi part `χ_L`; the Gelfand–Graev level `(P_0, χ_{P_0})` of the whole `GL_r` plays no role.

*Route.* The classes over a fixed lattice form a free homogeneous `I`-set (neat level); `χ_N(κ_t)` does not depend
on the classes and `χ_L(κ_t(ρa, ρ′b)) = ψ^♮(a^{−1}ι(t)b)`, so summing over `a, b` produces `conj γ_GG(ι(t′)ι(t)^{−1})`; convolution
by `γ_GG/γ_GG(1)` acts on an irreducible representation of `GL_k(𝔽_𝔭)` by `|U|/dim π` if `π` is generic and by `0` otherwise,
and `|U|/dim π ≤ ∏_{i<k}(1 − N𝔭^{−i})^{−1} ≤ 1 + 3/N𝔭` because a generic `π` has dimension at least `∏_{i<k}(N𝔭^i − 1)`: the
Gelfand–Graev convolution bound of FiniteReductiveGroups §2.5, in its product form. Multiplicity one of
Whittaker functionals of `GL_k(𝔽_q)` is Gelfand's trick: transposition across the antidiagonal is an anti-involution
preserving `(U, ψ)`, and by the Bruhat decomposition every double coset is either fixed by it or annihilated by `e_ψ`. A
representation with a nonzero Whittaker functional `ℓ` has dimension `≥ ∏_{i<k}(q^i − 1)`: by induction on `k`, the
translates of `ℓ` by suitable elements of the mirabolic subgroup are linearly independent (the `q^{k−1} − 1` nontrivial
characters of the last column group separate them); irreducibility is not used.

*Sources:* ingredients (Gelfand–Graev multiplicity one). The inequality with `((1 + 3/g₀)(1 + 3/g₁))^f`: [FormalProof],
`Formalism/HermitianCurvature/StatementPB.lean` (`Formalism.FourierDecayAlt.PB.Terms.GGBound`).
*Needs:* 5.15, ThetaChainsOnDefiniteUnitaryGroups §2.9a; FiniteReductiveGroups §§2.2, 2.4, 2.5.

*Checks.*
- `k = 1`: `I = ∏_𝔭 𝔽_𝔭^×`, the Gelfand–Graev representation of each factor is its regular representation,
  `γ_GG = ∏_𝔭(N𝔭 − 1)·𝟙_{\{1\}}`, the expansion has no cross terms, `‖Σ a_t‖² = γ_GG(1)Σ_i‖v_i‖²`, and the factor
  `∏(1 + 3/N𝔭)` is not needed. For `k ≥ 2` it is: on `GL₂(𝔽_q)` the top eigenvalue of convolution by the Gelfand–Graev
  character is `γ_GG(1)·(1 − q^{−1})^{−1}`, attained on the cuspidal characters (FiniteReductiveGroups §2.5).
- `q = 2` is excluded: already for `k = 3`, `∏_{i=1}^{2}(1 − 2^{−i})^{−1} = 8/3 > 1 + 3/2`.

### 5.17b Local kernels of decorated cokernels

*Origin:* particular to this proof: positive semidefinite kernels built from Kloosterman-type sums over Bruhat cells,
sorted by the class of a decorated cokernel, with support conditions and a Parseval identity in the last pivot.

*Method of the formal proof:* the double sum is regrouped by the isomorphism class of the decorated cokernel, which
exhibits the kernel as a sum of rank-one forms with nonnegative weights; the support conditions come from a descent along
the flag of row forms of `Z^{−1}`, in which an integral rank-one column operation permutes each class of matrices while
multiplying the character by a value `≠ 1`; the Parseval identity in the last pivot comes from an explicit
parametrisation of the cell of a block of size one and orthogonality of characters of the cokernel and of its dual.

A *local datum* is a commutative Hausdorff topological ring `𝔎`, Artinian and reduced, with a compact
open subring `𝔒`, a unit `ϖ ∈ 𝔒` such that `𝔎 = ⋃_mϖ^{−m}𝔒`, such that every element of `𝔎` is the sum of a unit and an
element of `𝔒`, and a unitary character `ψ` of `𝔎` with `{a : ψ(a𝔒) = 1} = 𝔒` (instances: a finite étale algebra over a
nonarchimedean local field with its maximal order and a character for which that order is self-dual; and, for a local
field `k` with uniformiser `ϖ`, the algebra `k × k` with the order `{x₁ ≡ x₂ (mod ϖ^c)}` and the character
`ψ_k(ϖ^{−c}(x₁ − x₂))`, `ψ_k` of conductor `𝔬_k`; the chain uses `k = ℚ_{g_i}`, `c = 1`). `|x|` is the modulus of `x`
on `𝔒`. A *local point* `w` is a list of blocks `(s_j, t_j)`, `t_j ∈ 𝔎^×`, its *level* the sum `Σs_j` of the block sizes (as in 5.19),
`𝐏(w)` the block matrix with antidiagonal blocks `t_jw_{s_j}`. For an integral matrix `Z` with unit determinant the *decorated cokernel* is `𝔒^n/Z𝔒^n` with the class of the last
basis vector and the linear form to `𝔎/𝔒` given by the last row of `Z^{−1}`. Put
`K^{loc}(w, w′) = Σ#Iso(coker Z, coker Z′)·ψ(Z)·conj ψ(Z′)`, the sum over the integral matrices `Z`, `Z′` of the cells of `w`, `w′`
modulo integral unipotent matrices (a finite sum; `ψ(Z)` the generic character of the unipotent coordinates, `Iso` the
isomorphisms of decorated modules), `N^{loc}(s; h, h′; t, t′) = |tt′|^{s(s−1)/2}K^{loc}(h ⊕ (s,t), h′ ⊕ (s,t′))`, `𝔰(h) = |det 𝐏(h)|^{−1}` (the
*size* of `h`), and for a decorated finite `𝔒`-module `𝒞` let `B^{loc}_w(𝒞)` be the sum, over the integral matrices `Z` of the cell
of `w` modulo integral unipotent matrices, of `ψ(Z)` times the number `#Iso(coker Z, 𝒞)` of isomorphisms of decorated modules
`coker Z → 𝒞` (each `Z` with `coker Z ≅ 𝒞` contributes `#Aut(𝒞)·ψ(Z)`). Then: (b-i)
`K^{loc}(w, w′) = Σ_𝒞B^{loc}_w(𝒞)·conj B^{loc}_{w′}(𝒞)/#Aut(𝒞)`; `K^{loc}` and `N^{loc}(s; ·)` are positive semidefinite, and `K^{loc}(w, w′) ≠ 0` forces
`|det 𝐏(w)| = |det 𝐏(w′)|` (used for `w, w′` of the same level).
(b-ii) For heads `h, h′` of the same level and `s ≥ 1`, `N^{loc}(s; h, h′; t, t′) ≠ 0` forces
`t^{−1} − t′^{−1} ∈ 𝔒`, `det 𝐏(h)·t ∈ 𝔒` and `det 𝐏(h′)·t′ ∈ 𝔒`. (b-iii) `c ↦ N^{loc}(1; h, h′; c, c)` is `𝔒`-periodic with finite
support modulo `𝔒` and `Σ_{c∈𝔎/𝔒}N^{loc}(1; h, h′; c, c) = 𝔰(h)𝔰(h′)·K^{loc}(h, h′)`. (b-iv) `K^{loc}(h, h′) = 1` for `h, h′` of the same level with
`𝐏(h), 𝐏(h′) ∈ GL(𝔒)`.

*Route.* (b-i) Rearrangement by the class of the
decorated cokernel. (b-ii) Let `λ^{(j)}` be the linear form given by row `j` of `Z^{−1}`. Say that an isomorphism of decorated
cokernels *respects the flag from `c`* if for every `j ≥ c` it carries `λ′^{(j)}` to `λ^{(j)}` modulo the span of the `λ^{(l)}`,
`l > j`; for `c = n − 1` this is the definition. *Averaging:* for `|h| ≤ c ≤ n − 2` the sum defining `K^{loc}(h ⊕ (s,t), h′ ⊕ (s,t′))`
does not change when the isomorphisms are required to respect the flag from `c` instead of `c + 1`: the isomorphisms that
respect it from `c + 1` and not from `c` are parametrised independently of the matrices in a class modulo a larger
unipotent group, and an integral column operation permutes each such class while multiplying the character by a
nontrivial value (self-duality of `𝔒`), so their contributions cancel. *End:* an isomorphism respecting the flag from `|h|`,
evaluated at the marked vector, gives `t^{−1} ≡ t′^{−1}`, because the entry of the inverse of a matrix of the cell in position
(first row of the last block, last column) is `t^{−1}` and the entries below it vanish. The second support statement: a
minor of size `|h| + 1` of a matrix of the cell is `± det 𝐏(h)·t`. (b-iii) The matrices of the cell of `h ⊕ (1, c)` are
`[[Z, Zη],[ξZ, c + ξZη]]`; `ξ` is a homomorphism `α : coker Z → 𝔎/𝔒`, `η` an element `β` of `coker Z`, integrality is `α(β) = −c`,
and decorated isomorphisms of the big cokernels are the isomorphisms `θ` of the small ones with `α′θ = α`, `θβ = β′`; this
gives `N^{loc}(1; h, h′; c, c) = Σ_{Z,Z′}ψ(Z)conj ψ(Z′)Σ_{θ,α,β: α(β) = −c}ψ(α(e − θ^{−1}e′) + λ(β) − λ′(θβ))`, which is periodic in `c`
(`e, e′` the marked vectors, `λ, λ′` the marked forms), and summing over `c` with orthogonality of characters of `coker Z` and of its dual,
`#coker Z = |det Z|^{−1}`, gives the Parseval identity.

*Sources:* (Kloosterman sums on Bruhat cells: Friedberg, Stevens, Jacquet–Ye). The local datum, `N^{loc}`
and `𝔰`: [FormalProof], `Formalism/HermitianCurvature/BlockKernelPropertiesOfSteps.lean`
(`Formalism.FourierDecayAlt.A5.LocalDatum`); (b-i): [FormalProof],
`Formalism/HermitianCurvature/HermitianCurvatureProofs/KernelQuotientFinite.lean`
(`Formalism.FourierDecayAlt.P.gram_kernel_identity`), `Formalism/HermitianCurvature/BlockKernelPropertiesOfSteps.lean`
(`Formalism.FourierDecayAlt.A5.BlockKernelPosSemidef`), and its last clause follows from [FormalProof],
`Formalism/HermitianCurvature/BlockKernelPropertiesOfSteps.lean` (`Formalism.FourierDecayAlt.A5.NsBlockDiag`); (b-ii):
[FormalProof], `Formalism/HermitianCurvature/BlockKernelPropertiesOfSteps.lean`
(`Formalism.FourierDecayAlt.A5.BlockKernelSupport`, `Formalism.FourierDecayAlt.A5.NsSupport`); (b-iii): [FormalProof],
`Formalism/HermitianCurvature/BlockKernelPropertiesOfSteps.lean` (`Formalism.FourierDecayAlt.A5.Th1Eq`,
`Formalism.FourierDecayAlt.A5.SingleBlockThetaProps`); (b-iv): [FormalProof],
`Formalism/HermitianCurvature/BlockKernelPropertiesOfSteps.lean` (`Formalism.FourierDecayAlt.A5.BaseKernelOne`).
*Needs:* Mathlib
(finite modules over discrete valuation rings, characters of finite abelian groups).

*Check.* The weight `#Iso(coker Z, 𝒞)` in `B^{loc}_w(𝒞)` is needed: with the unweighted sum of `ψ(Z)` over the `Z` with
  `coker Z ≅ 𝒞`, the right side of (b-i) would be off by the factor `#Aut(𝒞)²` in each term.

### 5.17c Germ identity and periodic majorants of the local kernels

*Origin:* particular to this proof: periodic positive semidefinite majorants of the local kernels, obtained from an exact
germ identity that adapts the germ expansions of Kloosterman integrals (Jacquet and Ye (1999)) by stationary phase over `p`-adic
fields.

*Method of the formal proof:* the germ identity is a stationary phase computation over the local ring: the sum over the
cell of `(ℓ, t) ⊕ (1, c)` becomes an integral with the phase `(Σx_k + D′/∏x_k)/t`, which vanishes away from the critical
points by averaging over small translations and is evaluated at each critical point by a Morse lemma and a Gaussian
integral; the majorants are built by induction on the block size, applying the germ identity in both arguments at pivots
shifted by a finite group, inverting the Fourier transform over that group, and passing to a limit over an exhaustion of
the units.

In the setting of 5.17b: a local datum in which every nonzero integer is invertible is a finite product of finite extensions of
fields `ℚ_p` with a compact open subring that is its own orthogonal for `ψ`: an Artinian reduced ring is a finite product of
fields, each factor is here a nondiscrete locally compact field of characteristic zero containing a compact open subring, hence
non-archimedean. So PositivityOfDirichletSeriesWithKernels §8.2 applies to every such datum, and (b1), (b-v) hold for all of them.
This classification is this roadmap's own: the path of [FormalProof] states and uses (b1) and (b-v) for the abstract local
datum, and does not use it.
(b1) *Germ identity.* Assume every nonzero integer is invertible in `𝔎`, and let `ℓ ≥ 1`, `H_ℓ(a) = a^{−1}(1 + 𝟙𝟙^t)`. Call a
compact open subgroup `L ⊂ 𝔎` *admissible* for `a` if `ψ(½y^tH_ℓ(a)^{−1}y) = 1` for all `y ∈ (L^⊥)^ℓ`. There is a *Gauss factor*
`γ : 𝔎^× → S¹` with `γ(ab²) = γ(a)` and `∫_{L^ℓ}ψ(½ξ^tH_ℓ(a)ξ)dξ = γ(a)|ℓ + 1|^{−1/2}|a|^{ℓ/2}` for every `L` admissible for `a` (`γ`
depends on `ℓ`; the Haar measure gives `𝔒` mass `1`). For every point `h` and compact set `Q` of units there is a
neighbourhood `V` of `0` such that for units `t ∈ V`, `c` with `ct^ℓ ∈ Q` and every `w′`:
`K^{loc}(h ⊕ (ℓ,t) ⊕ (1,c), w′) = |t|^{−ℓ²/2}Σ_{z^{ℓ+1} = (−t)^ℓc} γ(zt)·|ℓ + 1|^{−1/2}|z|^{ℓ²/2}·ψ((ℓ + 1)z/t)·K^{loc}(h ⊕ (ℓ+1,z), w′)`;
exact for small pivots (the archimedean analogue, with the same phase, is the block statement 5.18d).
(b-v) Assume every nonzero integer is invertible in `𝔎`. For every `s ≥ 1` and every finite set `𝔉`
of points of one level there is a function `Θ` on `𝔎` with values in positive semidefinite matrices on `𝔉`, `𝔒`-periodic,
vanishing outside a compact open `𝔒`-submodule and between points with different `|det 𝐏|`, with `Θ(t) ≥ N^{loc}(s; ·; t, t)` for
every unit `t` and `Σ_{𝔎/𝔒}Θ ≤ 𝔰(h)^s𝔰(h′)^sK^{loc}(h, h′)` (as matrices on `𝔉`); if all points of `𝔉` are unimodular,
`Θ(x) ≤ 𝟙_𝔒(x)·K^{loc}`. For `s = 1`, `Θ(t) = N^{loc}(1; ·; t, t)` with equality in the sum, and no hypothesis on the integers.

*Route.* (b1) *Gauss factor:* the modulus of the Gaussian integral is
`|det H|^{−1/2}`, its value does not depend on the admissible lattice, and `ξ ↦ bξ` gives `γ(ab²) = γ(a)`; when `𝔎` is a
finite product of finite extensions of fields `ℚ_p`, as in the instances of 5.17b, this is PositivityOfDirichletSeriesWithKernels
§8.2 (a), with `γ(a) = γ_ψ(H_ℓ(a))`. *Reduction:* for a function `Φ`
of matrices of size `ℓ + 1`, bi-invariant under integral unipotent matrices and locally constant, the sum of `Φ·ψ` over the
cell of `(ℓ,t) ⊕ (1,c)` equals `|t|^{−ℓ(ℓ+1)/2}∫A(x)ψ(t^{−1}(Σx_k + D′/∏x_k))dx`, `D′ = (−t)^ℓc`, for small `t`, with an amplitude
`A` independent of `t` whose value at `(z, …, z)`, `z^{ℓ+1} = D′`, is `|z|^{ℓ(ℓ−1)/2}` times the sum over the cell of `(ℓ+1, z)`
(for `u` upper unipotent, the matrix with first row `Σ_kξ_k·t·u_k + c·e_{ℓ+1}` and rows `t·u_i` below is the Hessenberg matrix with
subdiagonal `t` and diagonal `(tΣ_kξ_k, x_1, …, x_ℓ)`, `x_i = t·u_{i,i+1}`; its determinant `D′` gives `Σ_kξ_k = t^{−1}D′/∏x_k + g₁ +` an
integral element for small `t`, `g₁ = (D′/∏x_k)Σ_iy_{i,i+1}/(x_ix_{i+1})`, `x_0 = D′/∏x_k`, so the character becomes
`ψ(t^{−1}(Σx_k + D′/∏x_k))·ψ(g₁)`, and `A(x)` is the integral over the upper entries `y` of `|∏x_k|^{−1}Φ·ψ(g₁)` at `t = 0`; at
`x = (z, …, z)` the matrix is `z` times a unipotent matrix and `ψ(g₁)` its generic character). *Stationary phase* (for such `𝔎`, PositivityOfDirichletSeriesWithKernels §8.2 (b)–(d)): away from the critical points
`x = (z, …, z)` the gradient `1 − D′/(x_k∏x_i)` is not small and the integral over small balls vanishes; near a critical
point, with `x_k = z(1 + y_k)`, the phase is exactly `(ℓ+1)z + ½z·y^tM(y)y` for an explicit symmetric matrix `M(y)`,
`M(0) = 1 + 𝟙𝟙^t`, and `M(y) = P(y)^tM(0)P(y)` with `P(y)` found by a fixed point (`2` and `ℓ + 1` invertible): precisely, for integral matrices `G, N` the equation
`Y = N − ϖ·YGY` has an integral solution (a fixed point of a map of the compact set of integral matrices that is contracting
for the `ϖ`-adic filtration), symmetric if `G, N` are, and `P = 1 + 2p((ℓ+1) − 𝟙𝟙^t)Y` satisfies
`P^t(1 + 𝟙𝟙^t)P = (1 + 𝟙𝟙^t) + 4(ℓ+1)pN`; the Gaussian
integral gives `γ(zt)|ℓ+1|^{−1/2}|zt|^{ℓ/2}`. The sum over the cosets of the head is absorbed in `Φ` (for a head `h` and a matrix `Z′`, `Φ(Z)` is the sum over the cosets of
the head of the numbers of isomorphisms `coker(Z_h ⊕ Z) → coker Z′` times the phase; it is bi-invariant, supported in
`det(𝐏(h))^{−1}M(𝔒)`, and unchanged by perturbations of `Z` in `det(𝐏(h))²ϖ^NM(𝔒)` on a set where `det Z` stays in a compact set of
units, because such a perturbation is `Z ↦ Z(1 + ε)` with `1 + ε` integral and invertible). (b-v) *Averaged germ identity:* for a compact open set `Ω` of units stable under
the `(ℓ+1)`-th roots of unity, shifts `σ, σ′` in a finite set and `t_σ^{−1} = t^{−1} + σ`, `t` small,
`|t_σt_{σ′}|^{ℓ(ℓ+1)/2}Σ_cK^{loc}(h ⊕ (ℓ,t_σ) ⊕ (1,c), h′ ⊕ (ℓ,t_{σ′}) ⊕ (1,c)) = ∫_ΩN^{loc}(ℓ+1; h, h′; z, z)ψ(z(σ − σ′))dz` (sum over the `c`
with a root in `Ω`), from (b1) in both arguments, the cancellation of distinct roots by 5.17b (b-ii), `γ(zt_σ)conj γ(κzt_{σ′}) = 1`
(`κt_{σ′}/t_σ` a square) and the change of variables `c ↦ z`. Then `Θ` is the Fourier inversion, over a finite quotient of
shifts, of the full Gram matrices: it dominates the block kernel on `Ω` (truncation decreases a Gram matrix; vectors of
different shifts modulo `𝔒` are orthogonal by 5.17b (b-ii)), and its sum over `𝔎/𝔒` is an average of
`𝔰(h)𝔰(h′)N^{loc}(ℓ; h, h′; t_σ, t_σ) ≤ 𝔰(h)^{ℓ+1}𝔰(h′)^{ℓ+1}K^{loc}(h, h′)` by 5.17b (b-iii) for the last block and by (b-v) for `ℓ`; an exhaustion of
the units by sets `Ω` and a compactness argument (finitely many classes in the support module, bounded entries) conclude.

(b1): [FormalProof], `Formalism/HermitianCurvature/ThetaExistenceInductiveFromPieces.lean`
(`Formalism.FourierDecayAlt.A6.GermKernel`); (b-v): [FormalProof],
`Formalism/HermitianCurvature/BlockKernelPropertiesOfSteps.lean` (`Formalism.FourierDecayAlt.A5.A13`,
`Formalism.FourierDecayAlt.A5.ThetaExists`, `Formalism.FourierDecayAlt.A5.ThetaProps`).
*Needs:* 5.17b; PositivityOfDirichletSeriesWithKernels §8.2 (a) (the Gauss factor), (d) (stationary phase for
`Σx_k + D/∏x_k`); the classification of nondiscrete locally compact fields of characteristic zero.

### 5.17d The local model of the chain

*Origin:* adapted from local densities of unimodular Hermitian lattices (Siegel (1935); Shimura (1997)): the local model
of the chain at every prime, its product kernels and a bound for the normalised product of densities.

*Method of the formal proof:* the kernels are products over the primes of the local kernels by construction, and their
positivity and the domination by the majorants follow from Schur products; the local density of a self-dual lattice is
reduced by a congruence step to a count over the residue field, which [FormalProof] makes directly: at a split prime as a
number of independent tuples times the size of a fibre of a linear system, at an inert prime by a recursion on the number
of vectors; the product over the primes is bounded with at most `f` primes of `F` over each rational prime. The route
below reaches the same count through one orbit of the finite unitary or general linear group (Witt's theorem) and the
order of a stabiliser.

Assume `E/F` unramified at every finite place. For a prime `𝔭` of `F` let
`E_𝔭 = E ⊗_F F_𝔭`, `δ_𝔭 ∈ F_𝔭` a generator of the different, and take the local datum: if `𝔭 ∤ g₀g₁`, the maximal order of `E_𝔭`
with the standard character divided by `δ_𝔭`; if `𝔭 | g_i` (so `F_𝔭 = ℚ_{g_i}`, `E_𝔭 = F_𝔭 × F_𝔭`), the order `{x₁ ≡ x₂ (mod g_i)}`
with the character `ψ_F((x₁ − x₂)/g_i)` (the two coordinates are the two frames of a term, the congruence is that of their
representatives modulo `gΛ`, and the character is `χ_N`: this is where the row type level enters). A pivot `t ∈ E^×` of a
block of size `s` at position `a` is sent to `δ_𝔭^{−ν}t` up to a `𝔭`-unit, `ν = 2r_S + 3 − 2a − s` (with the sign `(−1)^s` in
the second coordinate and the factor `g_i^{−1}` at `𝔭 | g_i`), and at `𝔭 | g_i` the last pivot of a top block of size one is
shifted by `(−T(u), T(u′))/g_i`. Assume: `T(u), T(u′)` primes `≥ 3` splitting completely in `E`, prime to `g₀g₁`, with
`T(u) ≡ T(u′) (mod (g₀g₁)²)` (ThetaChainsOnDefiniteUnitaryGroups §2.8 gives it: `T(u) ≡ 1 (mod f_E(g₀g₁)²)`);
`g₀, g₁` split completely in `E`. *Kernels.* `Kr_i` (on the points of level `i`,
the Bruhat data of the first `i` columns of the pairing matrix) is the product over `𝔭` of the kernels of 5.17b at these local points, divided by `φ_i(x)φ_i(y)`,
`φ_i = ∏_{blocks}(g^{−2f}rd_E^{−2fν}|N_{E/ℚ}t|)^{s(i−a−s+1) + s(s−1)/2}`; at level `r_S + 1` it is set to `0` unless the two points
have the same ratio `D_{r_S+1}/D_{r_S}` of leading minors. The kernels are positive semidefinite, almost all local factors
are `1`, and the majorants of 5.17c (b-v) sum to the kernels of the previous level without loss. *Density.* Assume
`2r_S + 7 + f ≤ k`. For a pairing matrix `Z` let `M_{Z,𝔭}` be the local lattice of the frames (5.15 (b)): at a prime `𝔭` above
`g₀g₁` the lattice generated by the base frame and the divided differences `(F′_b − F_b)/g`, elsewhere the lattice generated by
the two frames; let `c_𝔭(Z)` be the corank of the reduction modulo `𝔭` of the Gram matrix of an `𝒪_{E_𝔭}`-basis of `M_{Z,𝔭}` (at
the primes above `g₀g₁`: of the base frame and the divided differences, not of the two frames), that is the sum of the ranks
of the Jordan constituents of positive scale of `M_{Z,𝔭}` (`t(M_{Z,𝔭})` of HermitianFormsAndLattices §4.8 (b)), and `d_𝔭(Z)` the local
density of primitive representations of `M_{Z,𝔭}` (the Gram matrix of that basis) by the local lattice. Then, when `M_{Z,𝔭}` is
integral, `d_𝔭(Z) = α_𝔭(r)/α_𝔭(k − 1 − c_𝔭(Z))`, `α_𝔭(n) = ∏_{i≤n}(1 − η_𝔭^iN𝔭^{−i})` (`η_𝔭 = 1` if `𝔭` splits in `E`, `−1` if it is inert),
`c_𝔭(Z) ≤ m`; with `α⁰_𝔭 = a_𝔭(T(u))` for `𝔭 | g₀g₁` and
`a_𝔭(T(u))a_𝔭(T(u′))` otherwise, `a_𝔭(T) = ∏_{i=k₀}^{r}(1 − η_𝔭^iN𝔭^{−i})`, `k₀ = k` if `𝔭 | T` and `k + 1` if not:
`d_sup := sup_Z∏_𝔭d_𝔭(Z)/∏_𝔭α⁰_𝔭 ≤ exp(12f·2^{−(k−2r_S−2)})`.

*Route.* The product formula is the definition; the local factors are kernels of 5.17b by the Bruhat form of the local pairing
matrices; at `𝔭 | g_i` the two coordinates are the two frames, the order `{x₁ ≡ x₂}` is their congruence modulo `gΛ` and the
character is `χ_N`. *Density:* a purely local computation: the local lattice is self-dual of rank `r` and the reduction of
the Gram matrix of the basis of `M_{Z,𝔭}` has corank `c_𝔭`; the primitive representations modulo `𝔭` are the `m`-tuples independent
modulo `𝔭` with that reduced Gram matrix, which form one orbit of the finite unitary or general linear group (Witt's theorem), with the
stabiliser of a subspace of dimension `m` with radical of dimension `c_𝔭`, and lifting is smooth (Hensel), which gives the
quotient `α_𝔭(r)/α_𝔭(r − m − c_𝔭)` with `r − m = k − 1` (for `m = 1` at an inert prime: a nonzero value is taken
`q^{r−1}(q^r − (−1)^r)` times, density `α(r)/α(r − 1)`); then `e^{−2x_𝔭} ≤ α⁰_𝔭 ≤ e^{2x_𝔭}` and `d_𝔭/α⁰_𝔭 ≤ e^{4x_𝔭}` with
`x_𝔭 = N𝔭^{−(k−2r_S−2)}`, and `Σ_𝔭x_𝔭 ≤ 3f·2^{−(k−2r_S−2)}` since at most `f` primes of `F` lie over a rational prime.

*Sources:* (local densities of unimodular Hermitian lattices). The density bound: [FormalProof],
`Formalism/HermitianCurvature/StatementPB.lean` (`Formalism.FourierDecayAlt.PB.PairBound`),
`Formalism/LocalToGlobal/SiegelLatticeTheory/FlagStabilizerTensors/TheoremSRecursion.lean`
(`Formalism.L2.SG.PoincareAmplitudeLowerBounds.SizesAt`).
*Needs:* 5.17b, 5.17c, ThetaChainsOnDefiniteUnitaryGroups §2.8, ThetaChainsOnDefiniteUnitaryGroups §2.9, ThetaChainsOnDefiniteUnitaryGroups §2.9a.

### 5.17 Mean value formula and comparison for the rows

*Origin:* adapted from Siegel's main theorem and the mass formula with gluing along discriminant forms (Siegel (1935);
Shimura (1997)): the mean number of generic terms per row, and a positive semidefinite comparison of global
coefficients with the local kernels.

*Method of the formal proof:* the rows that carry a frame with pairing matrix `Z` are the unimodular lattices meeting the
span of the two frames in `M_Z`; counting the pairs of a row and a class of terms in two ways turns the mean into a sum
over these lattices modulo the isometries fixing the span, which is evaluated by gluing along discriminant forms prime by
prime and the mass of the positive definite complement of rank `k − 1`; the comparison sorts the terms by their families
of local classes of decorated cokernels and bounds each weight by `d_sup`.

Assume the setting of 5.17d, `m + 3 ≤ k` and `E/F` unramified at every finite place. For a
pairing matrix `Z = (⟨F′_b, F_a⟩) ∈ M_{r_S+1}(E)` of a rational second frame `F′` (with `⟨z′, z′⟩ = −T(u′)`) against the base frame put
`Gr(Z) := D_{r_S+1}(Z)·conj D_{r_S+1}(Z) − T(u)T(u′)·D_{r_S}(Z)·conj D_{r_S}(Z) ∈ F` (`D_l` the leading principal minors; at each real
place this is the `Gr` of 5.13a (a)), and let `M_Z` be the lattice of 5.15 (b) for the frames (generated, at the primes above
`g₀g₁`, by the base frame and the vectors `(F′_b − F_b)/g`, and elsewhere by the lattices of the two flags).
*Rows.* The *row lattices* of `u` (the images of `Λ ∩ X^⊥ ∩ z_u^⊥` in `(X^⊥ ∩ z_u^⊥)/X ≅ X_0`, of rank `k`, `X = ⟨e_1, …, e_{r_S}⟩` isotropic
so that `X ⊂ X^⊥`, for the unimodular lattices `Λ` of `Y_0` in the genus of the standard lattice, marked by the level structure of
`K_u` at the primes above `T(u)`; the *rows* of the expansion) are the classes of one genus
of integral Hermitian lattices of volume ideal `T(u)𝒪_F`, and the total weight of the rows is `W_rows = mass(k)·T(u)^{kf}∏_{𝔭|T(u)}(1 − η_𝔭^kN𝔭^{−k})`
(`mass(n)` the mass of `𝒪_E^n` with the totally positive definite form, HermitianFormsAndLattices §6.3 (c); `W_rows = mass(k)(T(u)^k − 1)^f` when `T(u)` splits completely).
*Mean value formula.* For `Z` with totally positive `Gr(Z)`, the mean over the rows of the number of classes of generic terms
(5.15 (b)) with pairing matrix `Z` is `n_c·|N_{E/ℚ}(Gr(Z)/g^m)|^{(k−1)/2}∏_𝔭d_𝔭(Z)`, with
`n_c = mass(k−1)·|d_F|^{−2r_S(r_S+1)(k−1)}·∏_{i=k}^{r}L(i, η^i)/W_rows`, where `d_𝔭(Z) = α_𝔭(r)/α_𝔭(k − 1 − c_𝔭(Z))` when `M_Z` is integral,
`c_𝔭(Z)` the sum of the ranks of the Jordan constituents of positive scale of `M_{Z,𝔭}` (HermitianFormsAndLattices' `t(M_{Z,𝔭})`),
equal to the corank of the reduction of the Gram matrix of an `𝒪_{E_𝔭}`-basis of `M_{Z,𝔭}` (at the primes above `g₀g₁` the base frame
and the divided differences `(F′_b − F_b)/g`, not the two frames: `d_𝔭(Z)` is the density of 5.17d), and `∏_𝔭d_𝔭(Z) = 0` otherwise.
*Comparison.* Two generic terms with `Gr ≠ 0` get the same *label* iff they form a scalar pair of corank one (5.15 (e)); for
the coefficient vectors
`c_ρ(x) = Σ_{t at x, label ρ}√(mass t)·c(t)/(√(n_c·∏_𝔭α⁰_𝔭)·|N_{E/ℚ}(Gr(x)/g^m)|^{(k−1)/4}·φ_{r_S+1}(x))` (`mass t` the weight of the row of `t`;
`c(t) = φ(t)·v(t)`, where `φ(t) = conj ψ_g(Σ_aL_{a+1,a} + Σ_aU_{a,a+1})`, `ψ_g(x) = exp(2πi·tr_{E/ℚ}(x)/g)`, for a factorisation `Ẑ = L·𝐏(x)·U`
of the pairing matrix of a representative of `t` congruent to `F` modulo `g`, with `L` lower and `U` upper unitriangular over `E`,
and `v(t) > 0` is the volume of the term relative to its point: the orbital operator of `t` is `v(t)` times the orbital operator at
the point for the reference measure of 5.13a (a); `φ(t)` does not depend on the choices, `v(t)` is well defined, and `v(t) = 1`
when all blocks of `x` have size one), for `u ≠ u′`, `g₀, g₁ ≥ 3` and `2r_S + 7 + f ≤ k`:
`d_sup·Kr_{r_S+1} − Σ_ρc_ρ ⊗ conj c_ρ` is positive semidefinite on finite sets. All of this is
at the row type level `(K₂, χ₂)`.

*Route.* *One genus:*
the dual quotient of a row lattice is cyclic and killed by `T(u)`; at a prime above `T(u)`, which splits, this determines
the local lattice (HermitianFormsAndLattices §4.1), and elsewhere the lattice is unimodular; the total weight follows from the
index formula (HermitianFormsAndLattices §5.6 (c)): the stabiliser of a row lattice at a prime above `T(u)` has index
`(T(u)^k − 1)/(T(u) − 1)` in that of a unimodular lattice containing it (the hyperplanes of `𝔽_{T(u)}^k`), and the level has
index `T(u) − 1` in it. *Mean value formula:* let `F′` be a rational frame with pairing matrix `Z` against the base frame and
`U_Z` the span of the two frames (nondegenerate of dimension `m`, with positive definite orthogonal complement of dimension
`k − 1`). A lattice `Λ` is a row carrying `F′` as a generic term if and only if `Λ` is unimodular with `Λ ∩ U_Z = M_Z`. *Rows:* the
pairs (row, class of generic terms of pairing matrix `Z`) modulo the stabiliser of the base frame correspond, with equal
stabilisers, to the unimodular lattices meeting `U_Z` in `M_Z`, modulo the unitary group of `U_Z^⊥` (Witt's theorem for two flags
with the same pairing matrix against the base flag). Counting the pairs (row, term) in two ways, the mean number of classes of
terms times `W_rows` is the number of such `Λ` modulo the isometries fixing `U_Z`, weighted by the inverses of their
stabilisers. Sorting them by `T = Λ ∩ U_Z^⊥` (a positive definite lattice of rank `k − 1` whose discriminant form is
anti-isometric to that of `M_Z`, HermitianFormsAndLattices §4.9 (a)): the possible `T` form one genus, the number of `Λ` over `T` is
the product over `𝔭` of the numbers of isometries of the discriminant forms of `T` at `𝔭` (HermitianFormsAndLattices §4.9 (c), (d)), and with the local
densities by discriminant forms (HermitianFormsAndLattices §6.1d) the mass formula (for the totally definite `U_Z^⊥` of rank `k − 1 ≥ 1`) gives the closed
form of HermitianFormsAndLattices §6.4a (c), with `t(M_{Z,𝔭}) = c_𝔭(Z)`:
`mass(k−1)·n(M_Z)^{k−1}·∏_𝔭α_𝔭(k−1)/α_𝔭(k − 1 − c_𝔭(Z))`, `n(M_Z) = |d_F|^{−2r_S(r_S+1)}|N_{E/ℚ}(Gr(Z)/g^m)|^{1/2}`; and
`∏_𝔭α_𝔭(k−1)/α_𝔭(r) = ∏_{i=k}^{r}L(i, η^i)`. The glue is possible because `c_𝔭(Z) ≤ m < k − 1` and `Y_0` contains a unimodular
lattice (ThetaChainsOnDefiniteUnitaryGroups §2.2 (d)). `T(u) ≡ T(u′) (mod g₀g₁)` makes the local Gram matrix integral at the primes above `g₀g₁` (the
statement is made under the congruence modulo `(g₀g₁)²` of 5.17d), and
`(g₀g₁, T(u)T(u′)) = 1` gives representatives of the terms normalised modulo `g₀g₁` (Chinese remainder theorem). No hypothesis on roots of unity is needed: for `T ≥ 3` a root of unity `ζ` with
`ζ ≡ 1 (mod T)` is `1`, because `(ζ − 1)/T` is an algebraic integer all of whose conjugates have absolute value `≤ 2/3`. *Rows:*
attach to each term its family `θ` of local classes of decorated cokernels and let `B_θ(x)` be the product over `𝔭` of the
class sums `B^{loc}_{x_𝔭}(θ_𝔭)` (restricted to points with a given ratio of leading minors). The scalar partners of a term at a
point `y` have coefficient sum `B_θ(y)`; the terms of class `θ` at `x` have weighted coefficient sum `n₀(x)d(θ)B_θ(x)/#Aut θ`,
`n₀(x) = n_c·|N_{E/ℚ}(Gr(x)/g^m)|^{(k−1)/2}` (the
mean value formula, refined by classes); hence `Σ_ρc_ρ ⊗ conj c_ρ = Σ_θ(d(θ)/(∏α⁰_𝔭·#Aut θ))B_θ ⊗ conj B_θ` up to the diagonal
`φ`, while `Kr_{r_S+1} ≥ Σ_θB_θ ⊗ conj B_θ/#Aut θ` over any finite set of `θ` (products of the local Gram identities), and
`d(θ) ≤ sup∏d_𝔭`: the difference is the sum of two positive semidefinite matrices.

*Checks.*
- `c_𝔭` is the sum of the ranks, not the number, of the Jordan constituents of positive scale: over `ℚ_3(i)` (`3` inert), `⟨3, 3⟩` has
  one constituent, of scale `3` and rank two, the reduction `diag(3, 3) ≡ 0` has corank `2`, `A = 𝔽_9²` with `#O(A) = |U_2(𝔽_3)| = 96`, and the
  local density (normalised counts modulo `9`) is `96 = 96·β^⋆(0)`; the component count would give `96·β^⋆(1) = 128`.
- At a level prime the basis matters: at an odd split `p | g` with `r_S = 0`, `T` a unit, take `e, f` with Gram matrix
  `[[−T, −g], [−g, 2]]` and the frames `z = e`, `z′ = e + gf` (both of norm `−T`, `⟨z, z′⟩ = −T − g²`, `Gr = 2Tg² + g⁴ > 0`). The Gram
  matrix of the two frames reduces to the matrix with all entries `−T`, of corank one; the divided basis `z, (z′ − z)/g = f` has
  determinant `−2T − g²`, a unit, so `c_p = 0`, and the two prescriptions give the different denominators `α_p(k − 2)` and
  `α_p(k − 1)` (for `g = 3`, `T = 1`: determinants `−99` and `−11`).

*Sources:* ingredients (the mass formula; gluing of lattices along discriminant forms). The total weight of the
rows: [FormalProof], `Formalism/LocalToGlobal/SiegelLatticeTheory/CokernelGLCounts/RankPointCounts/DualFamilyCounting/StepsR.lean`
(`Formalism.L2.SG.Pf.Cnt.RowsMass`); the mean value formula: [FormalProof],
`Formalism/LocalToGlobal/SiegelLatticeTheory/CokernelGLCounts/RankPointCounts/DualFamilyCounting/FormulaExplicitAtOfEta.lean`
(`Formalism.L2.SG.Pf.Cnt.AtD.FormulaExplicitAt`), `Formalism/LocalToGlobal/SiegelLatticeTheory/CokernelGLCounts/CntLocal.lean`
(`Formalism.L2.SG.CntLocal.nu`).
*Needs:* 5.13a, 5.15, 5.17d,
ThetaChainsOnDefiniteUnitaryGroups §2.2, ThetaChainsOnDefiniteUnitaryGroups §2.8, ThetaChainsOnDefiniteUnitaryGroups §2.9; HermitianFormsAndLattices §§4.1, 4.8, 4.9, 5.6, 6.1, 6.1a, 6.1d, 6.3, 6.4a.

### 5.18a The archimedean transfer matrix

*Origin:* particular to this proof: the radial parts of Capelli operators on Bessel coefficients of `U(p, q_S)` as a
transfer matrix of Toda type with a start from `U(k, 1)`, and a normal form of the start. The exchange relation and the
quantum determinant of (b), in their algebraic form for bordered quantum minors, are published: they are the quantum
Sylvester theorem (Krob and Leclerc (1995); Molev (2002), Theorem 1.3). Nearest published result for the transfer
matrix: Gerasimov, Kharchev and Lebedev (2002), the Capelli generating function as an entry of the Toda monodromy for
Whittaker functions of general linear groups over `ℝ`.

*Method of the formal proof:* equivariance rules turn the matrix units joining a plane to the smaller space into border
vectors, and expansions of the Capelli determinant give a chain step from one level to the next; the exchange relation of
an upper level is derived from the commutation of the Capelli determinants of the lower level applied to functions
twisted in the pivot, by separating monomials, with continuity in the parameter for the remaining value; the quantum
determinant is identified at the last level by a Jacobi identity for bordered quantum minors and carried to all levels.
In the published theory the exchange relation comes from R-matrix or quasi-determinant identities, or from the sites
through the coproduct.

*Setting.* At a real place, `G_τ`, `F = (e_1, …, e_{r_S}, z′)`, `F′` with `z″`,
`T = −⟨z′, z′⟩`, `T′ = −⟨z″, z″⟩`, types `π, π′` of `U_{z′}`, `U_{z″}` with parameters `u, u′`, as in 5.13a. For
`0 ≤ i ≤ r_S` let `V_i = span(e_a, f_a : a > i) ⊕ X_0 ⊕ ⟨z⟩` (dimension `M_i`, 5.13a), `G_i = U(V_i)` (so
`G_{r_S} = U(k, 1)`), and `𝓕_i(D)` the smooth functions on an open subset `D ⊂ G_i` stable under
`(S_{z′} ∩ G_i) × (S_{z″} ∩ G_i)`, with values in `Hom(V_{π″}, V_{π′})`, `(N_S ∩ G_i)`-bi-equivariant for `ψ_{z′}, ψ_{z″}` and
`(π′, π″)`-equivariant. For `c ∈ ℂ^×` the element `w_i(c) ∈ G_i` sends `e_{i+1} ↦ c·f_{i+1}`, `f_{i+1} ↦ c̄^{−1}e_{i+1}` and
is the identity on `V_{i+1}`; restriction to the cell is `(res_i J)(c, x) = |c|^{M_i − 1}·J(w_i(c)x)`. `C_i(u)` is the
Capelli generating function of `𝔤𝔩(V_i)` (the ordered column determinant of ClassicalGroups §6.6, for
the right-invariant vector fields), and `𝔱_i(Y)` the `2 × 2` matrix of operators formed, with `u = Y + (M_i − 1)/2`, by
`C_i(u)`, the two Capelli minors bordered by the vectors of `F, F′` of index `i + 1` (at `u` and `u − 1`) and the doubly
bordered minor (at `u − 1`). *Sites*: `T_i(Y) = [[Y + p_i, −c_i], [c_i^{−1}, 0]]` with `p_i = c_i∂_{c_i}`; `^*` denotes the
formal adjoint for Haar measure, entrywise on the transposed matrix. `qdet(Y) = −T·T′∏_{i≤k}(Y + ½ + u_i)(Y + ½ + u′_i)`,
`P(Y) = ∏_s(Y + hc_s)`. A *letter* is `(±, y)`, `y ∈ ℝ`, a *string* a finite list of letters; the *cut* at an index `l₀`
with `|u_{l₀} − u′_{l₀}| ≥ 4` is `{Y : u_{l₀} + 2 ≤ −Y ≤ u′_{l₀} − 2}` (or with `u, u′` exchanged).

*Statement.* (a) *Radial parts.* For `J ∈ 𝓕_0(D)` and `i ≤ r_S`:
`res(𝔱_0(Y)J) = T_0(Ȳ)^*⋯T_{i−1}(Ȳ)^*·𝔱_i(Y)·T_{i−1}(Y)⋯T_0(Y)·res J` on the cell of the first `i` planes, and the Capelli
operator itself is the `(0, 0)` entry; the entries of `𝔱_i(Y)` are formally adjoint to those of `𝔱_i(Ȳ)^T` for Haar measure.
(b) *Exchange relation and quantum determinant.* On `𝓕_i`:
`(u − v)[𝔱_i(u)_{ab}, 𝔱_i(v)_{cd}] = 𝔱_i(u)_{cb}𝔱_i(v)_{ad} − 𝔱_i(v)_{cb}𝔱_i(u)_{ad}`, and `𝔱_i(Y+1)^T·𝐉·𝔱_i(Y) = qdet(Y)·𝐉` with `𝐉 = [[0,1],[−1,0]]`, where `qdet(Y)` is `−T·T′` times
the product of the left and right Capelli determinants of `U(z′^⊥)` and `U(z″^⊥)` (both `≅ U(k)`) at `Y + k/2`, which on
the types `π, π′` is the polynomial above. On a coefficient of a discrete series with Harish-Chandra parameter `hc`:
`C_0(Y + (r−1)/2)f = P(Y)f`.
(c) *The start: normal form theorem.* Let `𝒜` be a `∗`-algebra over `ℂ` containing commuting invertible elements `c_i, c̄_i = c_i^*`
(`i < r_S`), `𝔷, 𝔷̄ = 𝔷^*` with `𝔾 = 𝔷𝔷̄ − T·T′` invertible, and elements `p_i` with `p_i^* = −p̄_i`, `[p_i, c_j] = δ_{ij}c_j`, commuting
with the other coordinates and with each other; let `u, u′ ∈ ℝ^k` with `u_i − u_1, u′_i − u_1 ∈ ℤ` and
`max(u_{i+1}, u′_{i+1}) + 1 ≤ min(u_i, u′_i)`, the *types* being the `ρ ∈ ℝ^{k−1}` with
`max(u_{i+1}, u′_{i+1}) + ½ ≤ ρ_i ≤ min(u_i, u′_i) − ½` and `ρ_i − u_1 − ½ ∈ ℤ`; let `ρ ↦ E_ρ` be a complete family of orthogonal
self-adjoint idempotents of `𝒜` indexed by the types, commuting with all of these, and write `κ(f) = Σ_ρf(ρ)E_ρ`,
`x_ρ(Y) = ∏_{i<k}(Y + ρ_i)`, `x_ρ^{(l)}`, `x_ρ^{(l,j)}` the same products with the factors of index `l`, resp. `l, j`, omitted, and
`x = κ(x_·)`, `x^{(l)} = κ(x_·^{(l)})`, `x^{(l,j)} = κ(x_·^{(l,j)})`. Let `𝐐(Y) ∈ M₂(𝒜)` be polynomial in `Y` with: `𝐐(Y)` Hermitian for
real `Y`, the exchange relation of (b) and quantum determinant `qdet`; `𝐐(Y)_{11} = 𝔾·κ(x_·(Y))`; `[𝐐_{10}, 𝔷] = −𝐐_{11}`,
`[𝐐_{01}, 𝔷̄] = 𝐐_{11}`, while `𝐐_{11}` commutes with `𝔷, 𝔷̄`, `𝐐_{01}` with `𝔷` and `𝐐_{10}` with `𝔷̄`; all entries commute with the
`c_i, c̄_i, p_i, p̄_i`. Then there are `∇ ∈ 𝒜` and `S_l ∈ 𝒜` (`1 ≤ l ≤ k − 1`) with: `[∇, 𝔷] = 1`, `[∇, 𝔷̄] = 0`, `∇` commuting with the
`E_ρ` and the `c_i, c̄_i, p_i, p̄_i`; `S_l` commuting with `c_i, c̄_i, p_i, p̄_i, 𝔷, 𝔷̄`; `E_σS_lE_ρ = 0` unless `σ = ρ + e_l`;
`[∇, S_l] = −𝔷̄𝔾^{−1}S_l`, `[∇^*, S_l] = −𝔷𝔾^{−1}S_l`; `S_l^*S_l = κ(N_l)`,
`N_l(ρ) = −qdet(−ρ_l − 1)/∏_{j≠l}(ρ_j − ρ_l)(ρ_j − ρ_l − 1)` (and `N_l(ρ) = 0` when `ρ + e_l` is not a type); and, with
`l₀(Y) = −∇ − (Y + ½)𝔷̄/𝔾`, `m₀(Y) = −∇^* − (Y − ½)𝔷/𝔾`: `𝐐_{11} = 𝔾x`, `𝐐_{10} = 𝔾x·l₀ + Σ_lS_lx^{(l)}`, `𝐐_{01} = 𝔾x·m₀ + Σ_lx^{(l)}S_l^*`,
`𝐐_{00} = 𝔾^{−1}w + 𝔾x·m₀l₀ + 𝔾m₀𝔾^{−1}Σ_lS_lx^{(l)} + (Σ_lx^{(l)}S_l^*)l₀ + 𝔾^{−1}Σ_{l≠j}S_l^*S_jx^{(l,j)}`, where `w = κ(w_·)` and `w_ρ` is the
polynomial with `w_ρ(Y)·x_ρ(Y+1) = qdet(Y) + Σ_lN_l(ρ)·x_ρ^{(l)}(Y)·x_ρ^{(l)}(Y+1)`. In particular `𝐐(Y)_{10} = −Y^k𝔷̄ +` terms of lower
degree, and the `𝐐(Y)_{10}` commute with each other. Equivalently, for `Y` with `x(Y), x(Y+1)` invertible: `𝐐_{10} = 𝐐_{11}l(Y)`,
`𝐐_{01} = 𝐐_{11}m(Y)`, `𝐐_{00} = qdet(Y)𝔾^{−1}x(Y+1)^{−1} + 𝐐_{11}m(Y)l(Y)`, with `l(Y) = l₀(Y) + 𝔾^{−1}Σ_j(Y + ρ_j)^{−1}S_j`,
`m(Y) = l(Y − 1)^*`. *Converse, in the scalar model.* On tuples `j_ρ(c, 𝔷)` of smooth functions on `{c_i ≠ 0, |𝔷|² > T·T′}`, with
`∇ = ∂_𝔷 + a_ρ𝔷̄/𝔾` (`a_ρ = ½Σ_i(u_i + u′_i) − Σ_iρ_i`) and `S_l` the matrix with entries `√N_l(ρ)` from `ρ` to `ρ + e_l`, these relations
hold together with `[∇^*, ∇] = 2a_ρT·T′·𝔾^{−2}`, `S_jS_l(ρ_j − ρ_l − 1) = S_lS_j(ρ_j − ρ_l + 1)`, `S_l^*S_j = S_jS_l^*` (`j ≠ l`) and
`S_lS_l^* = κ(N_l^↓)`, `N_l^↓(ρ) = −qdet(−ρ_l)/∏_{j≠l}(ρ_j − ρ_l + 1)(ρ_j − ρ_l)` (and `N_l^↓(ρ) = 0` when `ρ − e_l` is not a type), and the
matrix defined by the formulas is Hermitian for real `Y`, satisfies the exchange relation and has quantum determinant `qdet`.
*Application.* At the last level, where `𝔾 ≠ 0`, the transfer matrix of (a) satisfies the hypotheses on the space of radial
functions, with `E_ρ` the projections on the summands of `V_{π″}` under `U(k−1)`; so it has this normal form. The start of a cut
at `l₀` is `(−1)^{k−l₀}` times it.

*Route.* (a) On the cell `x = n·w_i(c)·x₁·n′`, right and left equivariance turn the matrix units joining the plane
`i+1` to `V_{i+1}` into multiplications by border vectors, and the torus units into `p_i`, `−p̄_i`; expanding the
Capelli determinant along the two border rows and columns (noncommutative Laplace expansions of quantum minors) and
regrouping the double sums as bordered minors of level `i + 1` gives the four entries of `T_i^*𝔱_{i+1}T_i`; conjugation by
`|c|^{M_i−1}`, the square root of the Jacobian, removes the shifts. Induct on `i`. (b) Apply (a) to `C_i(Y′)C_i(Y)J̃` and
`C_i(Y)C_i(Y′)J̃` with `J̃(w_i(c)x) = |c|^{2β}c^n J(x)`: the Capelli determinants commute, and separating the monomials in
`β, n` yields the sixteen exchange relations of `𝔱_{i+1}`; level `0` is level `1` of the group with one more plane. The
quantum determinant from a Jacobi identity for bordered minors and the evaluation of a minor bordered by a vector of
nonzero norm as a Capelli determinant of its orthogonal; sites have quantum determinant `1`. The Capelli eigenvalue from
centrality and the infinitesimal character (Harish-Chandra isomorphism). (c) *Normal form.* Put `T_{σρ}(v) = E_σ𝐐(v)_{10}E_ρ`. The exchange relation for the entries `(11, 10)`, sandwiched between `E_σ`
and `E_ρ`, gives `(u − v)[(x_σ(u) − x_ρ(u))T_{σρ}(v) + δ_{σρ}x_σ(v)x_ρ(u)𝔷̄E_ρ] = x_σ(u)T_{σρ}(v) − x_σ(v)T_{σρ}(u)`. For `σ = ρ` this
says that `T_{ρρ}(v)/x_ρ(v) + v𝔷̄E_ρ` does not depend on `v`; for `σ ≠ ρ` it forces `T_{σρ} = 0` unless `x_σ(u)(u + c − 1) = x_ρ(u)(u + c)`
identically for some `c`, that is `σ = ρ + e_l` and `c = ρ_l + 1`, and then `T_{σρ}(v) = x_σ(v)(v + ρ_l + 1)^{−1}K`: the residue `K`
defines `S_l` on the block. Let `𝔇(X) = Σ_ρE_ρXE_ρ` and `l(Y) = x(Y)^{−1}𝔾^{−1}𝐐(Y)_{10}`. Then `𝔇(l(Y)) + Y𝔷̄/𝔾` does not depend on
`Y`, `∇ := −𝔇(l(Y)) − (Y + ½)𝔷̄/𝔾`, and the relations of `∇` with `𝔷, 𝔷̄` and the coordinates are those of `l(Y)` (from the
commutators of `𝐐_{10}`), because `𝔇` commutes with multiplication by elements commuting with the `E_ρ`; `𝐐_{01}` is the adjoint
of `𝐐_{10}`. The exchange relation `(10, 10)` says that the `𝐐_{10}(u)` commute, and the block `(ρ + e_l, ρ)` of this at two
parameters is `[∇, S_l] = −𝔷̄𝔾^{−1}S_l`; the relation `(01, 10)`, with the block `(ρ + e_l, ρ)` of `𝐐_{00}` taken from the quantum
determinant, gives `[∇^*, S_l] = −𝔷𝔾^{−1}S_l`. The quantum determinant, solved for `𝐐_{00}` and multiplied by `x_ρ(Y+1)`, is a
polynomial identity whose value at `Y = −ρ_l − 1` is `S_l^*S_l = N_l(ρ)` and which then gives `𝐐_{00}`. *Converse.* For
`[[d + m̃τl, m̃τ],[τl, τ]]` with `τ = 𝔾x(Y)`, `d = qdet(Y)𝔾^{−1}x(Y+1)^{−1}`, `m̃(Y) = l(Ȳ)^*` (which is `m(Y + 1)`), the exchange relation
follows from the sixteen relations of Drinfeld type between `τ, d, l, m̃` at two generic parameters (for instance
`(u − v)[l(u), l(v)] = (l(u) − l(v))²`), each of which reduces to an identity between the sums `Σ_j(u + ρ_j)^{−1}S_j`; all entries are
polynomial in the parameter, so the relation extends to all parameters; the quantum determinant likewise. *Application:* the
hypotheses on the group are (b), the spectral decomposition of the lower-right entry (Capelli determinant of `U(k−1)`,
Gelfand–Tsetlin branching `U(k) ↓ U(k−1)`), and the commutators of `𝔷, 𝔷̄` with the entries: the commutator of a quantum minor
with the matrix coefficient `𝔷` of the standard representation is the sum of its cofactor minors bordered by the two vectors
of the coefficient (with the parameter shifted by one; for `𝔷̄`, unshifted and with the opposite sign); for the singly
bordered minors this gives `∓` the doubly bordered minor or `0` by antisymmetry, and the doubly bordered minor commutes because
the second commutator vanishes.

*Sources:* frameworks (Capelli identities; RTT presentation and quantum determinant of the Yangian of `𝔤𝔩₂`: Molev,
Kulish–Reshetikhin–Sklyanin, Drinfeld; Lax matrices of Toda type: Sklyanin, Kharchev–Lebedev). The exchange relation and the quantum determinant of (b): [FormalProof], `Formalism/HermitianCurvature/StatementQ.lean` (`Formalism.FourierDecayAlt.Q.RTTLevel`,
`Formalism.FourierDecayAlt.Q.DetLevel`).
*Needs:* 5.13a, 5.13b; ClassicalGroups §6.1 (branching `GL_k ↓ GL_{k−1}`, for `U(k) ↓ U(k−1)`);
ClassicalGroups §§6.3–6.6; TensorInductionAndFiniteGroupInputs §9.1 (b), (h) (the
border expansions, for (a)), (e), (g), (j) (the quantum determinant, for (b)), (c) (the Capelli eigenvalue), (f) (the commutators
with `𝔷`, `𝔷̄`), (i) (the adjointness of the entries); RepresentationTheory/LieHighestWeight Layer 7; RealSemisimpleLieGroups 3.3.

### 5.18b Level forms: module algebra and positivity

*Origin:* particular to this proof: a family of nonnegative Hermitian forms on radial restrictions of Bessel integrals,
built by fusion with Yang's R-matrix from the transfer matrix, with their frames, the positivity of the diagonal factors
of the frames on a cut and exact passage between levels.

*Method of the formal proof:* letters are added to a matrix with the exchange relation by multiplying with Yang's
R-matrix in an auxiliary `ℂ²` and inserting the value of the matrix at the point of the letter into the Hermitian form;
a frame built letter by letter writes the dressed form as `F_𝐬^*·c_𝐬·F_𝐬` up to a positive weight, with `c_𝐬` diagonal;
on a cut the interlacing of the types makes every entry of `c_𝐬` positive; the top-level form is then the integral of a
pointwise nonnegative density, and integrating one pivot at a time carries nonnegativity down to every level.

In the setting of 5.18a:
(d) *Module algebra.* For a `∗`-algebra, a Hermitian `𝐑` and a `2×2` matrix `𝐓(Y)` with the exchange relation, quantum
determinant `qdet`, `𝐑·𝐓(Y)` Hermitian for real `Y`, and `𝐓_{11}` commuting and invertible: adding a plus letter at `y`
(`𝐓 ↦ 𝐓(Y)·R(Y − y)`, `R(D) = (D − P)/(D − 1)` Yang's matrix on an auxiliary `ℂ²`, `𝐑 ↦ 𝐑·𝐓(y)` in that slot,
`qdet ↦ qdet·(Y−y+1)/(Y−y)`) or a minus letter preserves these properties; exchanging a plus letter at `y` with a minus
letter at `y + 1` conjugates `𝐑` and divides it by `qdet(y)` up to explicit factors; `𝐓` has the Gauss decomposition
`𝐓(Y) = [[1, m(Y+1)],[0,1]]·diag(qdet(Y)·𝐓_{11}(Y+1)^{−1}, 𝐓_{11}(Y))·[[1,0],[l(Y),1]]` with the relations of Drinfeld's
realisation of the Yangian of `𝔤𝔩₂`; and there is a *frame* `F_𝐬` with `𝐑_𝐬 = F_𝐬^*·(|𝔷|²/𝔾)^{|𝐬|}c_𝐬·F_𝐬`, `c_𝐬` diagonal with
entries products of `x_ρ(y)`, `qdet_𝐬(y)/x_ρ(y+1)` (plus letters) and `qdet_𝐬(y−1)/x_ρ(y−1)` (minus letters).
(e) *Positivity on a cut.* If the points of a string `𝐬` lie on a cut and are pairwise more than `2` apart, then
`c_𝐬 > 0`; the level forms `⟨x, y⟩_{i,𝐬}` (the radial Hermitian structure of (a) dressed by `𝐑_𝐬`) are sesquilinear and
nonnegative on the span `𝒦_i` of the radial restrictions of Bessel integrals of compactly supported smooth `F`
supported in `{Gr ≥ ε_c}`, of their slices and of their wave translates; the top-level density is pointwise
nonnegative; and integrating one pivot passes exactly from level `i + 1` to level `i`.

*Route.* (d) Yang–Baxter equation and fusion; Gauss
coordinates of an exchange-relation matrix; the frame is built letter by letter. (e) On the cut, interlacing gives
`(−1)^{k−l₀}x_ρ(y + e) > 0` for `|e| ≤ 1` and `qdet(y), qdet(y−1) > 0`, so `c_𝐬 > 0` by induction on the string; the top
density is `Σ⟨d_𝐬F_𝐬x, F_𝐬x⟩ ≥ 0`; formal adjoints are adjoints on the classes `𝒦_i` by the pairing lemma 5.13b (b); the classes `𝒦_i` lie in the domain where all
level forms are defined (square integrability of every word matrix applied to an element): for a radial restriction of a
Bessel integral of compactly supported data the word matrix acts as the radial part of an operator on the group preserving
the class, and a wave translate is the product by a unimodular function, which conjugates the word matrix by scalar matrices
(for `r_S ≥ 1`; at level `0` only wave translates in the first pivot occur);
integrating a pivot is the site identity `T^*𝐑[𝐐_{i+1}]T = 𝐑[T^*𝐐_{i+1}T]` for the transfer matrix of the level,
`𝐐_i(Y) = (T_i(Ȳ)⋯T_{r_S−1}(Ȳ))^*·𝐐(Y)·T_i(Y)⋯T_{r_S−1}(Y)`, `𝐐` the matrix of the start, 5.18a (c).

*Sources:* frameworks (Yang–Baxter equation, fusion and Gauss decomposition of the Yangian of `𝔤𝔩₂`: Molev, Drinfeld).
The letter steps of (d): [FormalProof], `Formalism/HermitianCurvature/StatementWd.lean`
(`Formalism.FourierDecayAlt.Wd.LetterPlus`, `Formalism.FourierDecayAlt.Wd.LetterMinus`); the level forms of (e), their positivity and the
passage between levels: [FormalProof], `Formalism/HermitianCurvature/CompositeFormulaLevelZero.lean` (`Formalism.FourierDecayAlt.P5.ThmPActual`).
*Needs:* 5.18a, 5.13b.

### 5.18c Archimedean Fourier majorants

*Origin:* particular to this proof: bounds for the Fourier transform of the level kernels in a pivot, obtained from the
action of waves on the sites and interpolation in the spectral parameter.

*Method of the formal proof:* a wave in a pivot conjugates the site by a unipotent matrix; a slice with one more pair of
letters is a polynomial in the point of the letters whose top coefficient is the frequency times the slice without them,
and Lagrange interpolation over grids of nodes on the cut extracts it; the Cauchy–Schwarz inequality for the nonnegative
level forms then bounds the transform of a kernel, multiplied by a power of the frequency, by a convex combination of
level forms for strings with more letters.

In the setting of 5.18a, with the level forms of 5.18b:
(f) *Fourier majorants.* Multiplication by `e_s(c) = exp(sc − s̄c̄)` in a pivot conjugates each site by
`U(s) = [[1,0],[−s,1]]` and is an isometry `V(s)` of every level form. For slices at level `j` and `K_♯` families of
`2j + 1` distinct nodes on the cut: `s^{K_♯}⟨V(s)x_h, x_{h′}⟩_{j,𝐬} = Σ_n ∏_a λ_{a,n_a}·𝔍_𝐬(y_n)(V(s)x_h^{+y_n}, x_{h′}^{−y_n})`
(Lagrange coefficients `λ`, strings with `K_♯` more plus letters at `y_n` and minus letters at `y_n + 1`, `𝔍` the
antisymmetric contraction of the new slots); and `|𝔍_𝐬(ys)(x, x′)|²·∏_{y∈ys}qdet_𝐬(y) ≤ ⟨x,x⟩_{𝐬+ys}·⟨x′,x′⟩_{𝐬−ys}`.
Hence the Fourier transform of the level-`(j+1)` kernel normalised by the string weights `∏|P(y)|` in its last pivot
is bounded by `min(1, (ρ/|s|)^{K_♯})` times a convex combination (with weights not depending on the kernel) of level-`j`
diagonals for strings with `K_♯` more letters (the *wave bound* at level `b = j + 1`); and the same holds for two different last
pivots `t, t′` of a block of size `s` starting at level `b`, with `|t^{−1} − t′^{−1}|` in place of `|s|` (the *lift bound*); for grids
whose nodes lie in disjoint sub-intervals for different depths and are pairwise at least `3` apart. *The scales.* For a block of
size `s` starting at level `b` put
`thr(b, s) := C_ρ·κ^{−(2r_S+1)}·A·(C_ρ·κ·N/|cut|)^{2(b−1)+s−1}`, `N = 4K_♯(r_S + 1)`,
where `κ > 0` is the scale of the character `c ↦ ψ_ℂ(κ·l·c)` against which the Fourier transform in the pivot is taken (`ψ_ℂ` a
fixed nontrivial character of `ℂ` trivial on `ℝ`), `|cut|` the length of the interval carrying the nodes, `A` the supremum of
`|P(Y)P(Y+1)/qdet(Y)|^{1/2}` over it (over its initial segment of length `N³` for `(b, s) = (1, 1)`), and `C_ρ` an absolute constant; and
`thr′(b)² := C_ρ·κ^{−(2r_S+1)}·A·κ^{2b−1}·(T T′)^{−1/2}·(C_ρN/|cut|)^{2(b−1)}`. The wave bound at level `b` holds with `ρ = thr(b, 1)`; the
lift bound for two last pivots of a block of size `s` starting at `b` with `ρ = thr(b, s + 1)` below the top level (`b + s ≤ r_S + 1`)
and `ρ = 2·thr′(b)` at the top level (`b + s = r_S + 2`). At the top level what is proved at one place is the diagonal statement: for
one last pivot `t` of a block of size `s ≥ 2`, the top-level diagonal at `t` is at most `(|t|·Λ′)^{2K_♯}` times a convex combination
of top-level diagonals at `t` for strings with `K_♯` more letters, `Λ′ ≤ thr′(b)`; the bound for two pivots follows from it by the
Cauchy–Schwarz inequality for the positive forms, because `min(|t|, |t′|) ≤ 2/|t^{−1} − t′^{−1}|`. The volume factor of the block
bound (5.18d) is `(∏_τ thr(b, s))²` divided by the norm of the dual ideal of the block.
Since `C_ρκN/|cut| ≤ 1` in the applications, a larger exponent is a smaller scale.
(For the chain, 5.20: at the letter `l` where the two words differ, the nodes lie in the half-cut `{5/2 ≤ v_{l−1} + Y ≤ Δ_w/2}`, `K_♯ = 5`, `κ = 2π/(g₀g₁)` for the lattice of pivots of
level `g = g₀g₁`; multiplied by the covolume of that lattice the scale is
`C_ρ·g^{2r_S+2}κ_a^{−(2r_S+1)}A·(C_ρκ_aN/(g|cut|))^{2(b−1)+s−1}`, `κ_a` with `ψ_τ(x) = ψ_ℂ(κ_ax)`.)

*Route.* (f) The wave identity is
`[[Y + p + sc, −c],[c^{−1}, 0]] = T(Y)U(s)`; a letter acts by a bordered minor of size `j`, so a slice with one more pair of
letters is a polynomial of degree `≤ 2j` in its point whose top coefficient is `s` times the slice without them, and the
divided difference over `2j+1` nodes extracts it; the size inequality is Cauchy–Schwarz for the nonnegative forms of
5.18b (e) combined with the letter exchange of 5.18b (d).

The scales: [FormalProof], `Formalism/HermitianCurvature/StatementSz.lean` (`Formalism.FourierDecayAlt.Sz.lamThreshold`,
`Formalism.FourierDecayAlt.Sz.Glob.N`, `Formalism.FourierDecayAlt.Sz.Glob.lenI`).
*Needs:* 5.18b; Mathlib (Lagrange interpolation, Fourier inversion).

### 5.18d Archimedean blocks

*Origin:* adapted from stationary phase and the germ expansions of Kloosterman orbital integrals (Jacquet and Ye (1999)): an
archimedean block estimate with a rate, and its consequence for the level forms.

*Method of the formal proof:* the orbital integral over the cell is written as an oscillatory integral with phase
`(Σx_k + D′/∏x_k)/t`, truncated at matrix norm `|t|^{−ε}`, and split by a partition of unity into a region away from the
critical points, treated by non-stationary phase, and a neighbourhood of each of the `d` critical points, treated by
stationary phase with the explicit Hessian; the limit of the amplitude on the critical fibre gives the long orbital
integral.

In the setting of 5.18a:
(g) *Blocks.* Let `d ≥ 2`, `ψ = ψ_β` with `ψ_β(w) = e^{i Re(βw)}` for some `β ∈ ℂ^×`, every Haar measure on the
groups below being the product of the measures `(|β|/2π)·λ` on `ℂ` (`λ` Lebesgue measure on `ℂ = ℝ²`), self-dual for `ψ`, `O_long(Φ; z) = ∫_U ψ(u)Φ(z·w_d·u)du` (`U` upper
unipotent, `ψ(u) = ψ(Σu_{i,i+1})`, `w_d` antidiagonal) and `O_blk(Φ; t, c)` the orbital integral over the cell of
`(t·w_{d−1}) ⊕ c` (lower unipotent elements with only a last row, times `U` modulo the stabiliser). For every compact
`C_c ⊂ ℂ^×` there is `C` such that for Banach-valued `Φ` on `M_d(ℂ)` whose derivatives of order `≤ C₂d²` are bounded by
`κ·min(1, ‖Z‖^{−A})`, `A ≥ C₁d²`, on `{det Z ∈ ±C_c}`, and all `t ≠ 0`, `c` with `ct^{d−1} ∈ C_c`:
`‖ |t|^{(d−1)²}O_blk(Φ; t, c) − d^{−1}Σ_{z^d = (−1)^{d+1}ct^{d−1}} |z|^{(d−1)²}ψ(dz/t)·O_long(Φ; z) ‖ ≤ Cκ|t|`. Consequently, for the
level forms of 5.18b, the sum over a coset of a lattice `𝔏` of pivots of the diagonal block of a last block of size `s ≥ 2` is at
most `C_blk^{s}·∏_{s′<s}vol(𝔏, s′)` times a convex combination of the level-`(i − s)` forms for strings with at most `4K_♯s` more
letters, `C_blk` depending only on `C_c`, `d` and the decay of the data, `vol(𝔏, s′)` the covolume of the lattice of pivots of the
blocks of size `s′`.

*Route.* (g) Stationary phase on `(ℂ^×)^{d−1}` for the phase `Σx_k + D/∏x_k`, whose
critical points are `x = (z, …, z)`, `z^d = D`, with complex Gaussian integrals through Takagi's factorisation, in this order:
coordinates on the cell with the phase `(Σx_k + D′/∏x_k)/t`, `D′ = (−1)^{d+1}ct^{d−1}`, in the superdiagonal variables
`x ∈ ℂ^{d−1}`, and an amplitude in `(x, y)`; the tail beyond `‖Z‖ ≤ |t|^{−ε}` from the decay `A`; PositivityOfDirichletSeriesWithKernels
§8.1 (b) with §8.1 (d) (ii), (iv) away from the critical points; §8.1 (c) with §8.1 (d) (i), (iii) at each critical point for
fixed `y`, with `S = Cκ(1 + ‖y‖)^{E₀d²}max(1, ‖y‖)^{−A}`, where `E₀` is an absolute constant (a positive integer independent of
`d`, `β`, `C_c`, the Banach space and `Φ`): near a critical point the derivatives of order `≤ 2d` in `x` of the cut-off amplitude
are bounded by this `S`, uniformly in `t`; it is integrated over the `d(d − 1)/2` complex variables `y`, which converges as soon
as `A > E₀d² + d(d − 1)`, and the constant `C₁` of the statement is taken so that `A ≥ C₁d²` gives this; the limit as `t → 0`
of the integral of the
amplitude over the critical fibre, which is `|z|^{−2(d−1)}·|z|^{d(d−1)}` times the long orbital integral; and the count of the
constants (`|t|^{d−1}|z|^{d−1}/d` from the Hessian determinant `d·z^{−(d−1)}`, and `−d(d−1) + (d−1) = −(d−1)²`,
`(d−1) − 2(d−1) + d(d−1) = (d−1)²` for the exponents of `|t|` and `|z|`). Then Poisson summation over a coset and the lift bound
for the block of size `s − 1`, inducting on `s`.

*Sources:* (stationary phase; complex Gaussian integrals through Takagi's factorisation). The estimate of `O_blk` in (g):
[FormalProof], `Formalism/HermitianCurvature/StatementG.lean` (`Formalism.FourierDecayAlt.G.GermRate`). *Needs:*
5.18b, 5.18c; PositivityOfDirichletSeriesWithKernels §8.1 (b), (c), (d) with `n = d − 1` (non-stationary phase, stationary phase
at a nondegenerate critical point, the phase `Σx_k + D/∏x_k`); Mathlib (Poisson summation).

### 5.18e Level zero

*Origin:* particular to this proof: the limit of the level-zero form as the cut-off is removed, by an energy estimate
with Markov's inequality in the spectral parameter.

*Method of the formal proof:* an energy estimate uniform in the cut-off: with the weight `(Gr/(Gr + ε_c))^σ`, the
identity "a letter at `Y` multiplies the energy by `|P(Y)|`" holds up to defect terms that are derivatives, in the
parameter `s` of the conjugation by `Gr^s`, of polynomials of degree at most `r_S + 1`; conjugation by `Gr^s` translates
the spectral parameter, so Markov's inequality on a long interval bounds the defects by half the supremum of the
energies, which is absorbed; Fatou's lemma and dominated convergence then give the exact identity, and induction on the
letters with polynomial dependence on the points gives the limit for every string.

In the setting of 5.18a, with the level forms of 5.18b:
(h) *Level zero.* In the scalar model of the start (functions `j_ρ` on the orbit coordinates indexed by the types `ρ` of
`U(k−1)`): assume `C_0(Y + (r−1)/2)j = P(Y)j` for real `Y`; every word of at most `2N + 2` letters in the four first-column
operators (the first column of the product of the sites with the start, its mirror, and the two row combinations paired
with them, at real `Y`) maps `j` into `L²`; for every first-column operator `X`, every `φ` smooth in `log x`, vanishing near `0`, with
bounded logarithmic derivatives of all orders, every product `b` of the multipliers `𝔷^{−1}, 𝔷̄^{−1}, D/D̄, D̄/D, κ(f), D̄_{r_S}D_{r_S}^{−1}S_i`
and the adjoints of the last (`D_{r_S} = ∏c_i`, `D = D_{r_S}𝔷`), and all words `v, w` in the four operators with `|v| + |w| + 1 ≤ 2N + 2`:
`⟨X(φ(Gr)·b·v·j), w·j⟩ = ⟨φ(Gr)·b·v·j, X^*·w·j⟩` (both sides converging absolutely);
`r_S + 1 ≤ N`; `[α, β]` lies on a cut and `β − α ≥ C(kN(r_S+1)² + N²(r_S+1)²)`. Then for every string of at most `N` letters, of
either sign, whose points lie in `[α, β]` and are pairwise more than `2` apart, as the cutoff `ε_c → 0` the level-`0` form of
`χ(Gr/ε_c)j` tends to `∏_{letters}|P(y)|·∫Σ_ρ|j_ρ|²dμ₀`, the same integral for all strings. The level-`0` form of the model is
`Re⟨∏_y(−1)^{k−l₀}C_0(y)·χ(Gr/ε_c)j, χ(Gr/ε_c)j⟩`; it depends on the points of the string only. Here `μ₀ = ∏_id²c_i/|c_i|²·d²𝔷`,
`𝔾 = |𝔷|² − T·T′`, `Gr = ∏_i|c_i|²·𝔾`. This is the level-zero input of the tower (5.19, 5.20); 5.18 (i) does not use it. *The model's inputs.* With `g₁(Y) = D^{−1}Â(Y)`, `g₂(Y) = D̄^{−1}R̂₀(Y) + e_𝐬(Y)D^{−1}Â(Y)`
the two components of a new plus letter (`Â`, `R̂₀` the first-column operator and the row combination, `D`, `D̄` the last
minor and its conjugate, `e_𝐬` the Gauss coordinate of the frame of the string): (1) *shift:* `Gr^{−s}g₁(Y)Gr^s = g₁(Y + s)` and
`Gr^{−s}g₂(Y)Gr^s = g₂(Y + s) + (e_𝐬(Y) − e_𝐬(Y + s))g₁(Y + s)`; (2) *degree:* these are polynomials of degree `≤ r_S + 1` in `s`,
because `Â` is an entry of a product of `r_S` sites, each affine in `Y`, and the row combination has one more affine
factor; (3) *signed identity:* `g(Y)^*(d_{𝐬+Y}g(Y)X_𝐬) = (−1)^{k−l₀}P(Y)·d_𝐬X_𝐬` (frame of the string, the identity "a letter acts
on the vector of a string through `C_0(Y)` on the right", and `C_0(Y)j = P(Y)j`), and `(−1)^{k−l₀}P(Y) > 0` on the cut; (4) with
boxes of length `L_box` in the middle third of `[α, β]` and `rL_box ≤ β − α`: `|P(Y + s)| ≤ e³|P(Y)|` for `|s| ≤ L_box`, the frame
weights change by at most `e^{12}`, and `‖(e_𝐬(Y) − e_𝐬(Y + s))v‖² ≤ (176e⁷ + 2e^{14})‖v‖²` in the weighted norms (`e_𝐬` is a
partial fraction with simple poles at the type parameters and at the points of the string, all far from the box); (5)
adjointness against `χ(Gr/ε_{c,2})(Gr/(Gr + ε_c))^σ`, `σ = 4N`, by moving the hat letters one at a time with the hypothesis on `j`.
(6) *normal form of the vector of a string:* each component of the vector of a string of `n` letters is a combination, with
multipliers `b` as above, of `D^{−i}D̄^{−i′}·H·j`, `i + i′ = n`, `H` a product of `n` first-column operators; since `|D|² = Gr·|𝔷|²/𝔾`, and
the frame weights are `(|𝔷|²/𝔾)^n` times constants, the weight `(Gr/(Gr + ε_c))^σ ≤ (Gr/ε_c)^n` (`σ = 4N ≥ n`) makes all weighted
energies finite and continuous in the point; (7) *factorisation:* the vector of a string is `B·mon`, `mon` the `2^n` ordered
monomials in `D^{−1}Â(y_a)`, `D̄^{−1}R̂₀(y_a)` applied to `j`, `B` triangular with bounded entries and bounded inverse, so that
conjugation by `Gr^s` translates all points by `s` and the vector is a polynomial of degree `≤ r_S + 1` in each point up to `B`;
(8) *the level-`0` form in the model:* the level-`0` form of `χ(Gr/ε_c)j` equals the weighted energy of `χ(Gr/ε_c)j` (frame identity,
the identity of the level-`0` form above, adjointness as in (5)); (9) *polynomial dependence:* `C_0(Y)` has degree `≤ k + 2r_S + 1`
in `Y`, so the level-`0` form is a polynomial of that degree in each point. These give the box length `L_box = C₂N(r_S+1)²` with
`C₂ ≥ 64(1 + 2e√C₇)`, `C₇ = e^{12}·e³·(1 + (176e⁷ + 2e^{14})^{1/2})²`.
(h′) *On the group.* Let `k ≥ 2`, `2 ≤ l₀ ≤ k − 1`, `f` a smooth function on `G_τ` whose data decay with an exponent
`≥ C(r_S+1)⁴(Nr² + r³)` and satisfy `C_0(Y + (r−1)/2)f = P(Y)f`, and the cut of length `≥ C(kN(r_S+1)² + N²(r_S+1)² + N³)`. Then the
function `j` of `f` (route) satisfies the hypotheses of (h), and the level-`0` form of `χ(Gr/ε_c)f` on the group equals that of
`χ(Gr/ε_c)j` in the model; so the conclusion of (h) holds on the group.
(j) *Multiplication by matrix entries.* Let `F₀` be smooth with Capelli parameter `λ` in the classes of 5.18a (b), and
`A = Σ_i c_iL_i` with `c_i` polynomials of degree `≤ d_A` in the matrix entries and their conjugates; put
`D_A := (2r_S + 2)p₀ + d_A` and assume `|λ_s − λ_{s′}| > 2D_A` for `s ≠ s′`. Then `Gr^{p₀}·F₀·A = Σ_i F_i`, a finite sum of
smooth functions with Capelli parameters `λ + ν_i`, `ν_i` integral with `|ν_{i,s}| ≤ D_A` (multiplying an eigenfunction by a
matrix entry shifts one parameter by `+1`, by a conjugate entry by `−1`).
(k) *The level-zero form of an eigen-sum.* For `F = Σ_i F_i` as in (j), with the decay of 5.13b (b), and a string `𝐬`:
`Re⟨F⟩_{0,𝐬} ≤ ∏_{y∈𝐬}∏_s(|y + hc_s| + D_A)·β(F, F)`.
(l) *Cut-off limit.* For a string of `L ≤ 2p₀` letters on a cut and `F₀` smooth with decay:
`⟨χ(Gr/ε_c)Gr^{p₀}F₀⟩_{0,𝐬} → ⟨Gr^{p₀}F₀⟩_{0,𝐬}` as `ε_c → 0`, and the limit is the integral of a nonnegative top density. More
precisely: (l1) at a regular point the top density of `H` for the string is
`(|det Ẑ|²/Gr)^L·Σ_{e,ρ}κ(e,ρ)‖E_ρ𝒥(Θ_eH)‖²`, with the operators `Θ_e` of the frame of (d); (l2) for `H = φ(Gr)f`:
`‖𝒥(Θ_e(φ(Gr)f))‖ ≤ C|det Ẑ|^{−L}·Σ_{j≤L(r_S+1)}|(x∂_x)^jφ(Gr)|·Σ_t‖𝒥(Θ_tf)‖` for finitely many operators `Θ_t` with
polynomial coefficients; (l3) for two cut-offs, `β(∏(±C_0(y))χ_{ε_{c,1}}f, χ_{ε_{c,2}}f)` is the integral over the big cell of the
inner product of the two top vectors.

*Route.* (h) An energy
estimate uniform in the cutoff: with weights `(Gr/(Gr + ε_c))^σ`, the defect terms are derivatives in the spectral
parameter of polynomials of degree `≤ r_S + 1`, bounded by Markov's inequality (`sup|p′| ≤ (2d²/L)sup|p|` on an interval of
length `L` for `deg p ≤ d`) on an interval long enough to absorb them; then Fatou and dominated convergence; induction on the letters, each in its own box of length `L_b` in the middle third of `[α, β]`, the boxes `2L_b` apart; removal of the
cut-off by (7) (all derivatives in the conjugation parameter are in the weighted `L²` space, by interpolation in the points)
and (8); and extension from the boxes to all strings by (9): two polynomials of degree `≤ k + 2r_S + 1` in each point that agree
in the limit on a product grid of `k + 2r_S + 2` points per variable agree in the limit everywhere (`|P|` is a polynomial on the
cut). (h′) *Link with the group:* for a smooth orthonormal frame `e_ρ(𝔷)` of the space of values allowed by the stabiliser of
the point, put `j_ρ(c, 𝔷) = (∏_i|c_i|^{2(M_i−1)}𝔾^{k−1})^{1/2}⟨e_ρ(𝔷), 𝒥f(g(c, 𝔷))⟩_HS`; assume `k ≥ 2`. A frame adapted to the types
exists; in it `∇ = ∂_𝔷 + A_ρ`, `∇^* = −∂_𝔷̄ + conj A_ρ`. On the type `ρ` the curvature is `[∇^*, ∇] = 2a_ρT·T′/𝔾²` (forced by the exchange
relation and the quantum determinant), and the coefficient of `Y^k` in the Capelli determinant, which is the generator of the
centre up to an integer, acts in a frame constant in `𝔷` as `𝔷∂_𝔷 − 𝔷̄∂_𝔷̄` plus an integer; hence `α_ρ = a_ρ𝔷̄/𝔾 − A_ρ` satisfies
`Re ∂_𝔷̄α_ρ = 0` and `Im∮_{|w|=R}α_ρdw ∈ πℤ`, and on the annulus `|𝔷|² > T·T′` there is a smooth unimodular `u_ρ` with `ū_ρ∂_𝔷u_ρ = α_ρ`. In
the frame `u_ρe_ρ` the operators `∇, ∇^*` are those of the scalar model; the entries of `S_l` are then constants of modulus
`√N_l(ρ)`, made positive by a constant unitary change of frame; then the level-`0` form of `χ(Gr/ε_c)f` on the group equals that of
`χ(Gr/ε_c)j` in the model, and the three hypotheses on `j` follow from the eigen-equation of `𝒥f`, from (l2) (the four first-column
operators are radial parts of operators with polynomial coefficients) with the decay of `f`, and from the pairing lemma 5.13b (b),
each bounded multiplier being the transfer of a zero-order operator on the group whose coefficients grow polynomially. The
conditions `2 ≤ l₀ ≤ k − 1`, the decay exponent and the term `N³` of the cut length are what the link uses. (j) The
commutator of the quantum determinant with a vector operator splits a product `x_j·w` by the roots of the Capelli
polynomial (the characteristic identity), applied once per factor of the monomials of `Gr^{p₀}c_i`; the gap `> 2D_A` keeps
every intermediate parameter regular. (k) The Capelli operators are symmetric for `β` (5.13b (b)), so the `F_i` with
different eigenvalues at a letter are `β`-orthogonal; group them by their eigenvalue vectors and bound the
block-diagonal form. (l) (l1) the frame decomposition of 5.18b (d) at the top level. (l2) Each frame component is `|det Ẑ|^{−L}`
times a combination of products of `L` first-column operators; each of these is, up to bounded multipliers, the radial
part of a differential operator on `G_τ` with polynomial coefficients: for the first-column operators a bordered Capelli
minor with Plücker coordinates as coefficients, and for the row combinations (which carry `Gr^{−1}` in the normal form)
the identity `Σ_{s=0}^{r_S+1}λ_s·D̄^{r_S+1−s}∘C_0∘D̄^{s} = D̄^{r_S}·Θ`, `D̄` the conjugate last minor, `λ_s` the Lagrange coefficients
of the nodes `0, …, r_S+1`, `Θ` with polynomial coefficients; for the two mirror operators: the mirror first-column operator is the radial part of a
Capelli-type minor of size `r_S` whose coefficients are `r_S × r_S` minors of the conjugate transpose, and the mirror row
combination satisfies the same identity with the last minor in place of its conjugate (proved for real parameters above all
`−ρ_i` and extended because both sides are polynomial in the parameter); the orders are `≤ r` and the degrees `≤ 8(r_S+1)r`; a
Leibniz rule moves `φ(Gr)` through. (l3) from 5.18b (e) for
compactly supported approximants, both sides converging. Then `φ_{ε_c}(x) = χ(x/ε_c)x^{p₀}` has `|(x∂_x)^jφ_{ε_c}| ≤ Cx^{p₀}` uniformly in
`ε_c`, so the top densities are dominated by `C·n·Gr^{2p₀−L}(Σ_t‖𝒥(Θ_tf)‖)²`, integrable when `L ≤ 2p₀`; dominated convergence
and locality.

*Sources:* frameworks (A. Markov's inequality; Gelfand–Tsetlin branching: ClassicalGroups §6.1).
The limit of the level-`0` form in (h): [FormalProof], `Formalism/HermitianCurvature/StatementMA.lean` (`Formalism.FourierDecayAlt.MA.LemmaEModel`).
*Needs:* 5.18a, 5.18b, 5.13b; TensorInductionAndFiniteGroupInputs §9.1 (f) (commutator of the quantum determinant with a vector operator);
ClassicalGroups §6.1 (branching `GL_k ↓ GL_{k−1}`, for `U(k) ↓ U(k−1)`).

### 5.18 Archimedean Gram forms: the pointwise bound

*Origin:* particular to this proof: a pointwise bound for Bessel orbital integrals of discrete series coefficients in
terms of the Gram determinant, with constants polynomial in the parameters.

*Method of the formal proof:* the diagonal of the level form at a point is bounded one block at a time: for a block of
size one by Fourier inversion in the pivot with the wave bound, for a larger block by summing the nonnegative diagonal
over a lattice of pivots, passing to the dual lattice with the block expansion and applying the lift bound; each unit of
block size costs the square of a scale of 5.18c and `K_♯` letters, and after `r_S + 1` units the level-zero limit
identifies what is left with the norm of the Bessel integral; the weighted norm bound for discrete series comes from
tensor products with an exterior power of the standard representation.

In the setting of 5.18a:
(i) *Pointwise bound.*
(i₀) *Eigenfunctions.* For all `C, C₃ ≥ 0` there are constants `C₄` and `C_c` with the following property. Let `f` be
smooth with all derivatives decaying like `‖x‖^{−A₀}`,
`A₀ − (2r_S+2)p₀ − n₀(r_S+1) ≥ C_c(r_S+1)⁴(3(r_S+1)r² + r³)`, with Capelli parameter `λ′`
(`C_0(Y + (r−1)/2)f = ∏_s(Y + λ′_s)f`); let `λ` be a reference parameter interlaced by `u` and `u′` with margins `½`,
`|λ_s|, |u_i|, |u′_i| ≤ b`, `λ_s − λ_t ≥ 2c` for `s < t`, `|λ′_s − λ_s| + (2r_S+2)p₀ + n₀(r_S+1) ≤ c − 1`; `b^{−C(r_S+1)} ≤ T, T′`;
`3(r_S+1) ≤ 2p₀ ≤ C(r_S+1)²`; `k ≥ 2`; and either `n₀ = 0` and `|u_l − u′_l| ≥ 30(r_S+1)² + 6` for some `l`, or
`n₀ = 30(r_S+1)² + 6`, `u = u′` and `u_l − u_{l+1} ≥ 2n₀ + 1` for some `l < k`. Assume the *weighted norm bound*
`∫|det Ẑ|^{2a}·n·‖𝒥f‖²_HS ≤ b^{2C₃(2r_S+2)²a}·‖f‖²_𝒥` for `a ≤ 2p₀ + n₀`, the integral over the big cell, `Ẑ` the pairing matrix
of 5.13a (a) and `n` the Jacobian of the orbit coordinates. Then at every `γ` with `Gr(γ) > 0`:
`n(γ)·‖𝒥f(γ)‖²_HS ≤ b^{C₄(r_S+1)⁴}·Gr(γ)^{−(2p₀+n₀)}·‖f‖²_𝒥` (`‖f‖²_𝒥 = β(f, f)`, 5.13b (b)),
`C₄` and `C_c` depending on `C₃` and `C` only.
(i₁) *Weighted norm bound for discrete series.* Let `C ≥ 0` and let `λ` be a Harish-Chandra parameter of `G_τ` with:
half-integrality and interlacing with `u` and with `u′`; the `k − 1` interlaced entries in `[0, B/8]` and pairwise at least
`g_c` apart, the other entries in `[−2B, −B]`, `B ≥ 10⁶r⁷`; entries of different signs at least `h` apart, where `h/4`
satisfies the strong gap condition (G) of 5.13a; `|λ_s|, |u_i|, |u′_i| ≤ b`; `T, T′ ≤ b^{C(2r_S+2)}`; and `g_c, h ≥ 100(q₀ + 1)` with `q₀ ≥ ‖ν₀‖₁ + (r_S+1)a₁ + (r_S+1)(r_S+2)`. Let `f` be a `K`-finite
coefficient (times operators, as in 5.15 (c)) of the discrete series with parameter `λ + ν₀`, `ν₀ ∈ ℤ^r`, and the sign
pattern of RowTowerAndRallisIdentities §5.3. Then for `a ≤ a₁`: `(det Ẑ)^a·𝒥f = Σ_ic_i𝒥f_i` on the big cell, with `f_i` coefficients of the discrete
series with parameters `λ + ν₀ + e_{I_1} + ⋯ + e_{I_a}` (`|I_j| = r_S + 1`), `‖f_i‖_𝒥 ≤ ‖f‖_𝒥` and `Σ_i|c_i| ≤ b^{(C/2+6)(2r_S+2)²a}`;
in particular the weighted norm bound holds with `C₃ = C/2 + 6`.
(i) *Discrete series.* For every `C_h` and `C_p` there are `C₄` and `C_g` such that the conclusion of (i₀) holds, without
the weighted norm bound as a hypothesis, for a `K`-finite coefficient `f` (times a rank-one operator, as in 5.15 (c)) of
a discrete series with parameter `λ′` and the sign pattern of RowTowerAndRallisIdentities §5.3, when `k ≥ 2`, `n₀ = 0` if `u ≠ u′` and `n₀ = 30(r_S+1)² + 6`
if `u = u′`, `3(r_S+1) ≤ 2p₀`, `p₀ ≤ C_p(r_S+1)²`, and the reference parameter `λ` is a Harish-Chandra parameter interlaced by
`u` and by `u′`, with `|λ_s|, |u_i|, |u′_i| ≤ b`, such that: all pairwise differences of `λ` are at least `C_g(r_S+1)³` and at
least `200‖λ′ − λ‖₁`; entries of different signs are at least `C_g(r_S+1)^{9/2}(3(r_S+1)r² + r³)` apart; the interlaced
entries lie in `[0, B/8]` and the others in `[−2B, −B]` for some `B ≥ C_gr⁷`; `1 ≤ T, T′ ≤ b^{C_h(2r_S+2)}`, and
`ψ_τ(x) = ψ_ℂ(κ_ax)` for a real number `κ_a > 0` with `κ_a^{±1} ≤ b^{C_h}`, `ψ_ℂ` a nontrivial character of `ℂ` trivial on `ℝ`
fixed once and for all (the constants depend on it); and either `u ≠ u′` with a cut of length `≥ C_g(r_S+1)²`, or `u = u′`
with `u_l − u_{l+1} ≥ 2C_g(r_S+1)² + 1` for some `l` having interlaced entries of `λ` on both sides. By 5.15 (c) this bounds the
orbital integrals `O_t`. (5.20a (c) verifies these hypotheses for the chain.)

*Route.* (i₀) The bound is proved for
`F = Gr^{p₀}·f·A` (`A = 1` for distinct types): on the compactly supported approximants `ϑ_n·χ(Gr/ε_c)·F` (`ϑ_n` plateaus)
Fourier inversion in each pivot with 5.18c, `K_♯ = 3`, blocks by 5.18d, `r_S + 1` steps, the grids being `3(r_S+1)(2r_S+1)`
nodes on the cut pairwise at least `5` apart with `ω(y)ω(y+1) ≤ b^{C(r_S+1)}qdet(y)` for the normaliser
`ω(y) = ∏_s(|y + λ_s| + c)`; first limit `n → ∞` (all level forms are continuous along the plateaus; the admissible words
are finitely many); second limit `ε_c → 0` at level `0` by 5.18e (j)–(l); the step from `‖F‖_𝒥` to `‖f‖_𝒥` is the weighted norm
bound, since `Gr ≤ |det Ẑ|²`; for `u = u′` replace the right type by the two neighbours `u′ + n₀e_{l+1}`, `u′ − n₀e_l` through
the maps `A_±(x) = A^±(ω(x))`, `ω` an explicit vector with `⟨ω, ω⟩ = Gr/T′` and `A^±` chains of `n₀` reduced Wigner maps
(degree `n₀(r_S+1)`), which creates a cut of length `n₀ − 4`, at the cost `(3b)^{2n₀}(T′/Gr)^{n₀}`. (i₁)
`det Ẑ(g) = ⟨Λ^{r_S+1}(g)a′, a⟩` for the Plücker vectors `a, a′` of the two frames, fixed by `S_{z′}`, `S_{z″}`. The tensor
product of a gapped discrete series with `Λ^{r_S+1}` of the standard representation is the sum of the discrete series
with parameters shifted by `e_I` (DiscreteSeriesCoefficientsAndAutomorphicMetrics §2.4b (b) with `l = r_S + 1`, at each parameter
`μ = λ + ν₀ + e_{I_1} + ⋯ + e_{I_j}`, `j < a`: all consecutive entries of `λ` are at least `100(q₀ + 1)` apart, the interlaced ones
by `g_c`, the others by `h` because their signs alternate (RowTowerAndRallisIdentities §5.3), and the two groups by `7B/8`; since
`‖μ − λ‖₁ ≤ q₀`, the consecutive entries of `μ` are at least `98q₀ + 100 ≥ r_S + 2` apart and its entries of different signs at
least `h/2 ≥ 240r³` apart, which exceeds the threshold of DiscreteSeriesCoefficientsAndAutomorphicMetrics §2.4b (b)); the
product of `det Ẑ` with a coefficient
`⟨x, σ(·)y⟩` is the sum over `I` of `±⟨P_I(x ⊗ a), σ_I(·)P_I(y ⊗ a′)⟩`, an identity of functions; by the rank-one form of the
Bessel forms of `σ` and of `σ_I` (5.13c (d); no uniqueness statement is needed) the Bessel map of `σ_I` on `P_I(v ⊗ a)` is a
multiple `κ_I` of the Bessel map of `σ` on `v`; with 5.15a (equality for coefficients, under (G)) this gives
`det Ẑ·𝒥F = Σ_Iτ_I𝒥F_I`, `τ_I = ±κ′_I·conj κ_I·s(F)/s(F_I)`. Cauchy–Schwarz in the Bessel model bounds `|κ_I|²d/d_I` by
`∫_{S\G}‖x^{−1}(f_0∧⋯∧f_{r_S})‖²·d_I‖l_I(σ_I(x)w)‖²dx`, the norm of the wedge being the product of the Gram–Schmidt lengths
of the frame `x^{−1}F` (the Bessel models of inequivalent discrete series are orthogonal and isometric after scaling by
the square roots of the formal degrees); moments of ratios of consecutive lengths are bounded through the character
(`(len_{a+1}/len_a)·‖l(σ(x)w)‖` is at most the norm of a sum of `‖l(σ(x)Xw)‖` over a basis of the Lie algebra), with the Casimir
operators of `G_τ` and of `𝐊_τ` bounding the Lie algebra on vectors near the lowest `K`-type; moments of the first length by
induction through the dual standard representation, with the transfer coefficients of 5.13d (g), for which
`|κ_s|²d/d_s = T∏_j|λ_s − ½ − u_j|/∏_{t≠s}|λ_s − 1 − λ_t| ≤ Tb⁴` by the interlacing and the gaps `≥ 100(q₀+1)`, and with the bound
`Σ_s‖P_s(w ⊗ e)‖² ≤ (6B)^{2(2r_S+2)}‖w‖²` for the projections onto the constituents of the tensor product with the dual standard
representation, `w` of level `≤ 4r²`: the constituents are pairwise orthogonal for the invariant Hermitian form of the tensor
product (which is indefinite); on the `k − 1` constituents belonging to the interlaced entries the invariant form is
nonnegative on vectors of low level (an eigenvector of the split Casimir operator for one of these `k − 1` eigenvalues is small
at the coordinates of negative sign, whose weights lie near `[−2B, −B]`); the spectral projector onto these `k − 1` constituents
has norm `≤ 18/13` on such vectors (contour integral of the resolvent over a circle separating the two intervals, the operator
being diagonal on low levels up to an error small against `B`); each of the remaining `2r_S + 2` projections is the
complementary projector followed by a Lagrange product over the other `2r_S + 1` nodes, each factor of norm `≤ 6B`, so it has
norm `≤ 3(6B)^{2r_S+1}`; and the sum of the invariant form over the `k − 1` constituents is the invariant form of their sum, at
most `(18/13)²‖w‖²`. This is the one essential use of the two-interval shape: the number `k − 1` of interlaced entries does not
enter the exponent; Hölder's inequality with `r_S + 1` factors concludes, which needs moments of order
`(r_S+1)²` and explains the term `(r_S+1)(r_S+2)` in `q₀`. The ratio
of formal degrees of neighbours is at most `r^{r_S+1}`. Iterate `a` times. (i) from (i₀) and (i₁) with `ν₀ = λ′ − λ`,
`a₁ = 2p₀ + n₀`, the standing inputs being the majorant 5.13b (b′) and 5.18b (e) for compactly supported data, after the change of
frame that scales the isotropic vectors by `κ_a`: it replaces `ψ_τ` by `ψ_ℂ` and `T, T′` by `Tκ_a^{2r_S}, T′κ_a^{2r_S}`, which lie
between `b^{−2C_hr_S}` and `b^{C_h(4r_S+2)}` (only these two-sided bounds and `T, T′ > 0` are used), at a cost `b^{C(2r_S+2)²}` in
the Bessel functions and in `Gr`.

*Sources:* frameworks (stationary phase; tensor products of discrete series with finite-dimensional representations:
Zuckerman). (i₀), the case `u = u′`: [FormalProof],
`Formalism/HermitianCurvature/HermitianCurvatureProofs/CptCopy2.lean` (`Formalism.FourierDecayAlt.P.CutBPEq.thmBpAt_eq_NFRCpt`);
the domination of the approximants in its Route: `Formalism/HermitianCurvature/HermitianCurvatureProofs/CutNFApxDom.lean`
(`Formalism.FourierDecayAlt.P.CutBP.DominatedL2TruncationBound`); (i₁): [FormalProof],
`Development/AbelianVarietyTheory/Proofs/JetHarmonics/DiscreteSeriesCoefficientExpansionBoundBall.lean`
(`GlobalTheory.discreteSeries_coefficient_expansion_bound_ball`),
`Development/AbelianVarietyTheory/Definitions/Jets/SumIoPrAlt.lean` (`BranchingSupport.Num`),
`Formalism/HermitianCurvature/HermitianCurvatureProofs/CutBP.lean`
(`Formalism.FourierDecayAlt.P.CutBP.BigCellDerivativeExpansion`); (i): [FormalProof],
`Development/AbelianVarietyTheory/Statements/DiscreteSeriesShifts/ThmBpDS.lean` (`BpJoin.ThmBpDS`),
`Formalism/HermitianCurvature/StatementTBB.lean` (`Formalism.FourierDecayAlt.TBB.ThmBpAt`),
`Formalism/SharpRestriction/CuspSpanNormBounds/LeadMinorK.lean` (`Formalism.MainNotions.S.ThB.StdHyp`).
*Needs:* RowTowerAndRallisIdentities §5.3, 5.13a, 5.13b, 5.13c, 5.13d, 5.15, 5.15a, 5.18a, 5.18b,
5.18c, 5.18d, 5.18e; DiscreteSeriesCoefficientsAndAutomorphicMetrics §2.4b (b) (tensor products of gapped discrete series with the
exterior powers of the standard representation and with its dual, on smooth vectors); RealSemisimpleLieGroups 3.3; Mathlib (Lagrange interpolation, Fourier inversion, Poisson summation).

*Checks.*
- For `u = u′`, `qdet(Y) = −T·T′∏_i(Y + ½ + u_i)² ≤ 0` on `ℝ`: there is no cut and 5.18b (e) is empty; this is why (i) needs the
  type shift for equal types.
- A single site has `T(Y+1)^T·𝐉·T(Y) = 𝐉` (quantum determinant `1`), and `T(Y)U(s) = [[Y + p + sc, −c],[c^{−1}, 0]]`:
  multiplication by `e_s` acts on the site exactly as the wave.
- For `r_S = 0` there are no sites: 5.18a (a) is empty and the start 5.18a (c) is the whole transfer matrix on `U(k, 1)`.

### 5.19 The tower inequality

*Origin:* particular to this proof: an abstract inequality of large sieve type with leading constant one for positive
semidefinite kernels on towers of points, proved by induction on the pivots.

*Method of the formal proof:* one level of the tower is treated by splitting the points by the size of their last block;
pairs of distinct last pivots are removed by the Schur test with the lift bound and the lattice sums; on the diagonal the
kernel is replaced by its periodic majorant and the pivots are grouped into cosets; for blocks of size one the Poisson
step with the wave bound returns the previous level with the factor `1 + e_i` and a small error, the zero frequency being
an identity, and for larger blocks the block bound is applied on each coset; the levels are then iterated and the
cut-off removed.

*Data.* `L ≥ 0`, `f ≥ 1`, `K_♯ ≥ 4`; a field `E` with `f` functions `|·|_v : E → ℝ`; *points of level `i`*:
finite lists `p = ((s_1, t_1), …, (s_a, t_a))` of blocks, `s_j ≥ 1`, `t_j ∈ E^×`, `Σs_j = i` (a point of level `i` whose last block has
size `s` is written `h ⊕ (s, t)`, `h` of level `i − s`, `t` its last *pivot*; the only point of level `0` is the empty one `∅`); a finite
set of *strings* `𝐬` with a letter count and weights `wt(𝐬) > 0`, `wt(∅) = 1`; kernels `Kr_i` (`0 ≤ i ≤ L + 1`), positive semidefinite on
every finite set of points, `Kr_0(∅, ∅) = 1`; for `ε_c > 0` positive semidefinite kernels `gram(ε_c, i, 𝐬)`; additive subgroups `𝔏_{b,s}`,
`𝔏^{sp}_{b,s}`, `𝔏^∨_i` of `E`; scales `ρ^w_{i,v}`, `ρ^l_{b,s,v} > 0` and `maj_ρ(l) := ∏_v min(1, (ρ_v/|l|_v)^{K_♯})`; numbers `0 ≤ e_i ≤ 1`, `Θ > 0`
and `vol(b, s) ≥ 0` with `vol(b, s) ≤ Θ^{−2f}` for `b, s ≥ 1`, `b + s ≤ L + 2`; quantities `N̂(i, 𝐬, Y, κ; l)`; vectors `V(p)` of a Hilbert
space for the points `p` of level `L + 1`; functions `c_ρ` (`ρ ∈ ℕ`) on the points of level `L + 1` with `Σ_p|c_ρ(p)|·‖V(p)‖ < ∞` and
`Σ_{ρ∈R}c_ρ ⊗ conj c_ρ ≤ Kr_{L+1}` on finite sets for every finite `R ⊂ ℕ`. Write `b = i − s + 1` (the level at which the last block
starts) and, for finite sets `Y` of points and kernels `κ` on them,
`N(i, s, 𝐬, Y, κ; t, t′) := Σ_{h,h′∈Y}κ(h, h′)·gram(ε_c, i, 𝐬)(h ⊕ (s, t), h′ ⊕ (s, t′))/wt(𝐬)`,
`N0(j, 𝐬, Y, κ) := Re Σ_{h,h′∈Y}κ(h, h′)·gram(ε_c, j, 𝐬)(h, h′)/wt(𝐬)`.
*Hypotheses*, for `1 ≤ s ≤ i ≤ L + 1`, `ε_c > 0` and finite sets `Y` of points of level `i − s`:
- *(support)* for `t ≠ t′`: `Kr_i(h ⊕ (s, t), h′ ⊕ (s, t′)) ≠ 0` implies `(i, s) ≠ (L + 1, 1)` and `t^{−1} − t′^{−1} ∈ 𝔏^{sp}_{b,s}`;
- *(periodic domination, tower by tower)* for every choice of finite sets `Sg(b, s) ⊂ E^×`, with `X_j` the points of level `j` all of
  whose blocks have pivots in them, there are kernels `Th(i, s, t)` with, as inequalities of kernels on `X_{i−s}`:
  `Kr_i(·⊕(s, t), ·⊕(s, t)) ≤ Th(i, s, t)` for `t ∈ Sg(b, s)`; `Th(i, s, t) = Th(i, s, t′)` for `t ≡ t′ (mod 𝔏_{b,s})` in `Sg(b, s)`; and
  `Σ_{t∈S}Th(i, s, t) ≤ (1 + e_i)·Kr_{i−s}` for every `S ⊂ Sg(b, s)` of pairwise incongruent pivots;
- *(zero frequency and wave bound)* (`s = 1`) for strings with at most `4K_♯(L + 1) − K_♯` letters there are `2^f` probability vectors
  `ϑ_A` on the strings with at most `K_♯` more letters, not depending on `(Y, κ)`, such that for every positive semidefinite `κ` on `Y`:
  `N̂(i, 𝐬, Y, κ; 0) = N0(i − 1, 𝐬, Y, κ)` and, for `l ∈ 𝔏^∨_i ∖ 0`, `|N̂(i, 𝐬, Y, κ; l)| ≤ maj_{ρ^w_i}(l)·Σ_{𝐬′}ϑ_A(𝐬′)·N0(i − 1, 𝐬′, Y, κ)` for
  some `A`;
- *(Poisson step)* (`s = 1`) if every finite sum of `|N̂(i, 𝐬, Y, κ; l)|`, `l ∈ 𝔏^∨_i ∖ 0`, is `≤ B`, then every finite sum of
  `Re N(i, 1, 𝐬, Y, κ; t, t)` over nonzero `t` in one coset of `𝔏_{i,1}` is `≤ |N̂(i, 𝐬, Y, κ; 0)| + B`;
- *(lift bound)* for `(i, s) ≠ (L + 1, 1)` there are `3^f` probability vectors `ϑ_π` on pairs of strings with at most `K_♯` more letters
  such that for every finite `S ⊂ E^×`, every `κ` positive semidefinite on the points `h ⊕ (s, t)`, `t ∈ S`, and `t, t′ ∈ S` with
  `t^{−1} ≠ t′^{−1}`: `|N(i, s, 𝐬, Y, κ(·⊕t, ·⊕t′); t, t′)| ≤ maj_{ρ^l_{b,s}}(t^{−1} − t′^{−1})·Σϑ_π(𝐬′, 𝐬″)·½(Re N(i, s, 𝐬′; t, t) + Re N(i, s, 𝐬″; t′, t′))`
  for some `π` (the diagonal terms with the same `Y` and `κ`);
- *(block bound)* for `s ≥ 2` and strings with at most `4K_♯(L + 1) − (s + 1)K_♯` letters there is a probability vector `ϑ` on the
  strings with at most `(s + 1)K_♯` more letters such that for every positive semidefinite `κ` on `Y`: every finite sum of
  `Re N(i, s, 𝐬, Y, κ; t, t)` over nonzero `t` in ONE coset of `𝔏_{b,s}` is `≤ C₄^{fs}·∏_{s′=1}^{s−1}vol(b, s′)·Σ_{𝐬′}ϑ(𝐬′)·N0(i − s, 𝐬′, Y, κ)`;
- *(lattice sums)* every finite sum of `maj_{ρ^w_i}` over `𝔏^∨_i ∖ 0`, and of `maj_{ρ^l_{b,s}}` over `𝔏^{sp}_{b,s} ∖ 0` (`(i, s) ≠ (L + 1, 1)`), is
  `≤ (C₁Θ^{−(K_♯−5/2)})^f`;
- *(level zero)* `Re gram(ε_c, 0, 𝐬)(∅, ∅)/wt(𝐬) → 𝔧` as `ε_c → 0`, for the strings with at most `4K_♯(L + 1)` letters;
- *(top)* for every finite set of points of level `L + 1` and all sufficiently small `ε_c`: `gram(ε_c, L + 1, ∅)(p, q) = ⟨V(q), V(p)⟩`
  whenever `Kr_{L+1}(p, q) ≠ 0`.

*Conclusion.* For `C₁, C₄ ≥ 1` there are `C, C′` depending only on them such that `Θ ≥ C′` and `L·(C/Θ)^f ≤ 1` imply
`Σ_{ρ∈R}‖Σ_p c_ρ(p)V(p)‖² ≤ (1 + C(L + 1)(C/Θ)^f)·∏_{i=1}^{L+1}(1 + e_i)·𝔧` for every finite `R`.

*Remarks.* The *global* form of the domination (kernels `Kr^{per}_{i,s}(t)` on all points of level `i − s`, depending on `t` modulo
`𝔏_{b,s}` only, with `Kr_i(·⊕(s, t), ·⊕(s, t)) ≤ Kr^{per}_{i,s}(t)` and `Σ_{t∈E/𝔏_{b,s}}Kr^{per}_{i,s}(t) ≤ (1 + e_i)Kr_{i−s}`) implies the tower-wise
form; the tower-wise form is what the chain supplies (5.17c (b-v), 5.17d). The block bound is for one coset and a fixed kernel:
a sum over `E/𝔏_{b,s}` with a kernel varying with `t` is its composition with the domination. Poisson summation is not used by
5.19: it is how 5.20 verifies the Poisson step.

*Route.* Fix a finite `R`; by the absolute summability it suffices to treat the restrictions of the `c_ρ` to a finite set of
points of level `L + 1`; let `Sg(b, s)` be the pivots of their blocks and apply the periodic domination to this tower. By the
Schur product theorem the square root of `N0(j, 𝐬, Y, κ)` is a seminorm in the kernel and kernel inequalities pass to it.
Split the points of level `i` by the size `s` of their last block (triangle inequality). For distinct last pivots use the
support and the lift bound, and the Schur test with the lattice sums: a factor `1 + 3^fε`, `ε := (C₁Θ^{−(K_♯−5/2)})^f`. On the
diagonal replace `Kr_i` by `Th(i, s, t)`. For `s = 1` the wave bound and the lattice sums over `𝔏^∨_i` give the hypothesis of the
Poisson step with `B ≤ 2^fε·Σϑ_A·N0`, whose zero frequency is exactly the level-`(i − 1)` quantity; for `s ≥ 2` use the block bound
on each coset; then sum over pairwise incongruent pivots with the domination. This gives the one-level inequality
`√Q_i ≤ √((1 + 3^fε)(1 + 2^fε)(1 + e_i))·σ_{i−1} + Σ_{s=2}^{i}√((1 + 3^fε)(1 + e_i)C₄^{fs}∏_{s′<s}vol(b, s′))·σ_{i−s}` (`Q_i` the level-`i`
quantity of the tower, `σ_j` the largest square root of `N0` at level `j` over the strings of the budget); the bounds on the letter
counts in the hypotheses are what keeps every string used within the budget `4K_♯(L + 1)`, and `vol ≤ Θ^{−2f}` makes the blocks small.
Iterate, let `ε_c → 0` (level zero and top), and use the domination of the coefficients. The constant `1` survives because the
zero frequency of the Poisson step is an identity.

*Needs:* Mathlib `Matrix.PosSemidef.hadamard` (Schur product theorem); Tau Ceti `TauCeti.lintegral_rpow_lintegral_mul_le` (Schur's test, here for counting measures).
Follows from [FormalProof], `Formalism/HermitianCurvature/StatementTC.lean` (`Formalism.FourierDecayAlt.TC.TheoremAAfter`),
`Formalism/HermitianCurvature/StatementTB.lean` (`Formalism.FourierDecayAlt.TB.Data`).

*Checks.*
- `L = 0`, one level, `Kr_1` diagonal, no off-diagonal points: the inequality is the Poisson step for one pivot,
  `Σ_ρ‖Σ_pc_ρ(p)V(p)‖² ≤ (1 + C(C/Θ)^f)(1 + e_1)𝔧`, with the nonzero frequencies as the only loss.
- The top clause has no off-diagonal terms at `(i, s) = (L + 1, 1)`: there the support hypothesis forbids them, and no lift bound
  is asked.

### 5.20a Standing conditions, dimension formula and critical level

*Origin:* adapted from the mass formula, Weyl's dimension formula and Harish-Chandra's formal degree: the ratio of the
dimensions of rows and columns, the critical level, and the standing size conditions of the chain.

*Method of the formal proof:* the dimension formula is an algebraic identity: the mass ratios of consecutive ranks are
multiplied from rank `k + 1` to rank `r`, the factorials cancel against the Vandermonde forms of the formal degree and of
Weyl's dimension formula, and the quotient of the level indices at the type primes is computed directly; the mass ratios
and the count of columns enter as inputs.

*Standing conditions.* *(St)* with `L = log b` and absolute constants
`C′, C_l, C_g, C_u, c_b, C_T` (`C′`, `C_l` larger than bounds that depend on the other constants of (St), on `C₀` and, in
5.20b, on `A`; `C_l ≥ 40`): `8C_Γ ≤ C′`, `C′m⁵fL ≤ k`, `m⁴ ≤ f` (`SizeMf`), `f ≤ k`,
`log f ≤ √r_S`, `C_l L ≤ f·log k`, `C_l m²L ≤ k`, `C_l m k Δ_w ≤ e′_j(τ)` (ThetaChainsOnDefiniteUnitaryGroups §2.3b gives it for `x ≥ x₀`:
`e′_j(τ) ≥ w_1(τ) − ϑ ≥ w″/2` by `SizeTheta`, `4kΔ_w = Sc ≤ w″/x` by its Lemma (f), and `m ≤ x^{1/2}` by `SizeM`),
`C_l m·log(rd_E/2) ≤ k`, `C_l m³L·log rd_E ≤ k·log²k`, `log rd_E ≤ L/C_l` (`SizeRd` with its lemma, ThetaChainsOnDefiniteUnitaryGroups §2.1), `(kb)^8 ≤ g₀, g₁ ≤ b^{C_g}`
(`SizeG`, ThetaChainsOnDefiniteUnitaryGroups §2.7), `max(k^{C_l}, b^{c_b}) ≤ e′_j(τ) ≤ b²`, `e′_{m−1}(τ) ≤ 2e′_0(τ)`, `u_1(τ) ≤ b^{C_u}` (entries numbered from `1`, 5.13a;
ThetaChainsOnDefiniteUnitaryGroups §2.3b (f) bounds every entry of `u(τ)` by `b²`), `(kfL)^{C_l} ≤ Δ_w`, `C_l r^{19}f⁵L ≤ e′_{j+1}(τ) − e′_j(τ)`, all consecutive gaps of
the row parameter `> C_l k m⁴ + r·m^{10}` (`SizeGap`), `b^{c_T m} ≤ T(w) ≤ b^{C_T m}` for the words `w` considered (the upper
bound is `SizeT_u`, ThetaChainsOnDefiniteUnitaryGroups §2.8), and `C_l ≤ m`; with the adapted data of ThetaChainsOnDefiniteUnitaryGroups §2.3b (`0 ≤ v_l(τ) ≤ Sc ≤ e′_0(τ)/8`, consecutive `v_l` exactly
`4Δ_w` apart; at every real place the cloud gap `u_1(τ) − v_0(τ) ≥ Sc`; at the real places that are not top places also
`u_1(τ) − v_0(τ) ≤ 2Sc` and the last entry `u_k(τ) = v_{k−2}(τ) − ½`; at a top place `e′_0(τ)/2 ≤ −u_k(τ) ≤ e′_0(τ) − 3`;
type entries numbered from `1`). Put `κ_sc := 2π/(rd_E·g₀g₁)` (the *scaling factor*: `ψ_τ(x) = ψ_ℂ(κ_scx)` for the character `ψ_τ` of 5.13
and a suitable choice of the character `ψ_ℂ` of 5.18 (i); another choice multiplies `κ_sc` by a fixed constant) and
`Γ₀ = exp(C_Γm⁵f log b)` (ThetaChainsOnDefiniteUnitaryGroups §2.1).

*Lemma (dimension formula, critical level, and the chain in the hypotheses of 5.18 (i)).* Let `w` be a word, `d_w^{all}` as in
5.14 (the dimension of all forms of the word, not of the new part `d_w`) and `D*` as in RowTowerAndRallisIdentities §5.3. (The words `u, u′` below may be equal.)
(a) *Dimension formula.* Let `mass(M)` be the mass of the genus of unimodular Hermitian `𝒪_E`-lattices of rank `M` in the totally
positive definite space (the mass formula covers totally definite spaces of positive rank only) and
`v_E = rd_E/2`; for `E/F` unramified at the finite places and `M > k`,
`mass(M)/mass(M − 1) = ((M − 1)!(v_E/π)^M)^f(2v_E)^{−f/2}L(M, η^M)`; `d_w^{all} = mass(k)·∏_{𝔭|g₀g₁}∏_{i≤k}(N𝔭^i − 1)·∏_τ dim V_{λ_w(τ)}·(T(w)^k − 1)^f`
and `D* = mass(r)·[Stab(L^Y_0) : K₂]·∏_τd(𝒟_τ)` (measures of the conventions). Hence, for `g₀, g₁ ≥ 4` and `k ≥ 2`,
`D*/d_w^{all} = e^θ·∏_τ(T_crit(w,τ)/T(w))^k` with `|θ| ≤ 8f/2^k`, where
`T_crit(w,τ)^k := (π/v_E)^{−((m−1)k + m(m−1)/2)}·rd_E^{−(m−1)/2}·(g₀g₁)^{km + m(m−1)/2}·d(𝒟_τ)∏_{i<r}i! / ∏_{i<j}(u_i(τ) − u_j(τ))`
(`u(τ)` the type of `w`).
(b) *Critical level.* Under (St), at every real place `τ`,
`T_crit(w,τ) ≥ (1/5)·(g₀g₁)^m(π/v_E)^{−(m−1)}·∏_je′_j(τ)/a_eff(w,τ)`, where `a_eff(w,τ) := u_1(τ) − v_0(τ)` if `τ` is not a top
place `τ ∈ Φ_top` of ThetaChainsOnDefiniteUnitaryGroups §2.3 and `a_eff(w,τ) := u_1(τ)·(−u_k(τ))/(kΔ_w)` if it is (type entries numbered from `1`, 5.13); `a_eff(w,τ) ≤ e′_0(τ)·b^{C_u}`. If
moreover `C_u·log b ≤ m − 1`, then `T_crit(w,τ) ≥ (g₀g₁)^m·k^{3r_S}` at every `τ`.
(c) *Chain instance of 5.18 (i).* Let (St) hold and `m ≥ C_m`, `C_m` depending on `C_g` and on a constant `C_n` fixed
before `ε` (it depends on the constant `C₄` of 5.18 (i); 5.20 states the condition it satisfies). For all words `u, u′` and every real place `τ` the hypotheses of 5.18 (i) hold, with `p₀ ≤ C_p(r_S + 1)²` and
constants `C_h = 1`, `C_p` depending only on the constants of (St), for: the reference parameter `hc(τ) = (v(τ); −e′(τ))` with
the sign pattern of RowTowerAndRallisIdentities §5.3; the types of `u`, `u′`; `T = T(u)`, `T′ = T(u′)`; `κ_a = κ_sc`; `B = e′_0(τ)`; `b^{C_β}` in place of `b`,
`C_β = max(2, C_u, C_T, ⅛ + 2C_g)`; and every `λ′` with `‖λ′ − hc(τ)‖₁ ≤ C_nkm³`. For `u ≠ u′` the cut is
`{V − Δ_w + 2 ≤ −Y ≤ V − 2}` at the entry where the two types are `V` and `V − Δ_w`; for `u = u′` the gap is `u_2 − u_3 ≥ 3Δ_w`,
with `hc_1 > u_2` and `u_3 > hc_3`. In the loop rows and the rows of corank one the bound is applied to the discrete series
with parameters `hc(τ) + ν`, `ν ∈ ℤ^r`, `‖ν‖₁ ≤ C_nkm³`, and there the decay of the amplitudes in the size of the pairing
matrix comes from multiplying `q ≤ Ckm²` times by a leading minor and expanding as in 5.18 (i₁) (for every leading minor
`D_l`: `D_l·𝒥f = Σ_{|I|=l}c_I𝒥f_I` with parameters shifted by `±e_I` and `Σ|c_I| ≤ b^{Cm²}`); for the non-generic pairs, and for the crude bound of
the scalar generic pairs of equal words, it is applied to `𝒟_τ` itself; the loop rows and the rows of corank one of a pair `(u, u)`
use the shifted parameters as for distinct words, with the type shift of 5.18 (i).
No condition `T(w)κ_sc^{2r_S} ≥ 1` is needed: the bound of 5.18 (i) uses the norms only through two-sided bounds, and
`T(w) ≥ 1`. [FormalProof] carries this condition: `Formalism/SharpRestriction/CuspSpanNormBounds/PExtra.lean`
(`Formalism.MainNotions.PX.TFrame`); it is a hypothesis of 5.20d.

*Route.* (a) Telescoping the mass ratios from `k + 1` to `r = k + m − 1` (HermitianFormsAndLattices §§6.2–6.4) gives
the exponents `(m−1)k + m(m−1)/2 = Σ_{M=k+1}^{r}M` of `π/v_E` and `(m−1)/2` of `rd_E`; the column count is the class number
formula at a neat level (HermitianFormsAndLattices §5.7 (c): the mass of the genus of `X_0` times the indices of the level at
the type primes, ThetaChainsOnDefiniteUnitaryGroups §2.9, and at `T(u)`, ThetaChainsOnDefiniteUnitaryGroups §2.8, times the Weyl dimensions, ThetaChainsOnDefiniteUnitaryGroups §3.8; the stabilisers are trivial because an element of
prime order `g_i` of `U(X_0)(F)` would need `g_i − 1 ≤ 2fk`); `D*` comes from the equality `vol([U(Y_0)]) = mass(𝒪_E^r)` of
HermitianFormsAndLattices §6.2 (c) (the compact-dual normalisation of the Conventions, for `E/F` unramified at the finite places, the
signature of `Y_0` the same at every real place and its unimodular lattice, whose stabiliser has volume `1`), in whose measure Harish-Chandra's formula `d(𝒟_τ) = ∏_{i<j}|hc_i − hc_j|/∏_{i<j}(j − i)` (DiscreteSeriesCoefficientsAndAutomorphicMetrics §8.3)
makes `d(𝒟_τ)∏_{i<r}i!` the Vandermonde product of `hc(τ)`; the mass ratio is the mass formula for unimodular lattices
(HermitianFormsAndLattices §6.3), which gives `mass(M)/mass(M−1)` as stated; the quotient of the level indices gives the
power of `g₀g₁` up to factors `∏(1 − g_i^{−j})`; the error factor is the product of the `L(M, η^M)`, `k < M ≤ r`, of
`(T^k/(T^k − 1))^f` and of these factors, and `|log L(M, η^M)| ≤ f·log ζ(M)`. (b) By (a), `d(𝒟_τ)∏_{i<r}i! = vand(hc(τ))`, and
`vand(hc) ≥ vand(v)·∏_{l,j}(v_l + e′_j) ≥ vand(v)·(∏_je′_j)^{k−1}`. Off the top places `a_eff = u_1 − v_0 ≥ Sc = 4kΔ_w` (the cloud gap of (St))
and `v_0 − u_j ≤ 4jΔ_w` for `j ≥ 2` (the letters, and `u_k = v_{k−2} − ½`), so `u_1 − u_j ≤ a_eff(1 + j/k)` and `∏_{j>1}(u_1 − u_j) ≤ a_eff^{k−1}e^{k/2}`; the other differences are `u_i − u_j = (4(j − i) + b_j − b_i)Δ_w`
with bits `b_l ∈ {0, 1}` (ThetaChainsOnDefiniteUnitaryGroups §2.3), whose product divided by `vand(v)` is at most `e^{k/4}` (a harmonic-sum estimate); the missing
factor `∏_je′_j` costs only its `k`-th root, `≤ e^{2mL/k} ≤ 10/9` because `C_lm²L ≤ k`; this gives the constant `1/5` (the same
computation at a top place, with `a_eff` as defined there, the cloud gap and the bounds for `−u_k` of (St)).
`a_eff ≤ e′_0b^{C_u}`: off the top places `a_eff ≤ u_1 ≤ b^{C_u}` (`v_0 ≥ 0`), at a
top place `a_eff ≤ u_1·(−u_k) ≤ b^{C_u}e′_0`. The second form: `b^{C_u} ≤ k^{m−1}` (`C_u log b ≤ m − 1`), `e′_j ≥ k^{C_l} ≥ k⁴` for
`j ≥ 1`, `m − 1 = 2r_S + 1`, `v_E ≥ 1` (`rd_E ≥ 2`, Minkowski's bound for a totally complex field of degree `≥ 4`) and `k ≥ 32`. (c)
Clause by clause: `hc(τ)` is strictly decreasing by the gaps and integral because `k` is even (`(r − 1)/2 = r_S + k/2`);
interlacing from ThetaChainsOnDefiniteUnitaryGroups §2.3; `κ_sc ≤ 1` (`rd_Eg₀g₁ ≥ 2π`) and `κ_sc^{−1} = rd_Eg₀g₁/(2π) ≤ b^{1/8 + 2C_g}` by `log rd_E ≤ L/C_l` and
`g_i ≤ b^{C_g}`; `1 ≤ T(u) ≤ b^{C_Tm}`; `|hc_s| ≤ b²`, and each `u_i` lies between two entries of `hc` except `u_1 ≤ b^{C_u}`;
consecutive gaps exceed `C_lkm⁴ + rm^{10} ≥ max(C_g, 200C_nk)·m³` (this is where `m ≥ C_m` is used); a pair of entries of
different signs ends at a node other than the first, so its difference is at least a node gap, `≥ C_lr^{19}f⁵ log b`; the
shape: the interlaced entries are the `v_l ∈ [0, Sc] ⊂ [0, e′_0/8]`, the others lie in `[−e′_{m−1}, −e′_0] ⊂ [−2e′_0, −e′_0]`, and
`e′_0 ≥ k^{C_l} ≥ C_gr⁷`; the position: the letters put the type entries at `v_{l−1} − ½` or `v_{l−1} − ½ − Δ_w` on a grid of step
`4Δ_w` (ThetaChainsOnDefiniteUnitaryGroups §2.3), and `Δ_w ≥ k² ≥ 64m⁴`. The scaling condition `T(w)κ_sc^{2r_S} ≥ 1` (true under the window, by (a), (b) and a
contradiction) is not used.

*Check.* The cloud gap is assumed at every real place; off the top places it is what makes (b) hold: with `u_1 = v_0 + ½` instead, `∏_{j>1}(u_1 − u_j) ≥ (4Δ_w)^{k−2}(k − 2)!`, so
`T_crit` falls below the bound of (b) by a factor of order `kΔ_w`. Evaluating the definition of `T_crit` in (a) at `k = 200`, `m = 4`,
`Δ_w = 10⁶`, `rd_E = 2`, nodes `e′_j = 10¹⁵ + j·10³` (`0 ≤ j < m`) and `g₀g₁ = 10¹²`, the logarithm of `T_crit` over the bound is about `−18` for
`u_1 = v_0 + ½` and from `+1.5` to `+1.9`, depending on the bits of the word, for `u_1 = v_0 + Sc + ½`.

(St): [FormalProof], `Formalism/SharpRestriction/CuspSpanNormBounds/StandingNumericalData.lean`
(`Formalism.MainNotions.S.StandingHypotheses`); (a): [FormalProof], `Formalism/HermitianCurvature/StatementSz.lean`
(`Formalism.FourierDecayAlt.Sz.PropA`, `Formalism.FourierDecayAlt.Sz.TcritPow`,
`Formalism.FourierDecayAlt.Sz.SizeData.MassRatios`); (b), the first bound: follows from [FormalProof],
`Formalism/HermitianCurvature/StatementSz.lean` (`Formalism.FourierDecayAlt.Sz.TcritLower`, `Formalism.FourierDecayAlt.Sz.cOne`,
`Formalism.FourierDecayAlt.Sz.Cfg.aeff`); (c): follows from [FormalProof],
`Formalism/SharpRestriction/CuspSpanNormBounds/SBridge.lean` (`Formalism.MainNotions.S.Bridge.StdOfHyp`).
*Needs:* RowTowerAndRallisIdentities §5.3, 5.14, 5.18, ThetaChainsOnDefiniteUnitaryGroups §2.1, ThetaChainsOnDefiniteUnitaryGroups §2.3, ThetaChainsOnDefiniteUnitaryGroups §2.3b, ThetaChainsOnDefiniteUnitaryGroups §2.3c, ThetaChainsOnDefiniteUnitaryGroups §2.8, ThetaChainsOnDefiniteUnitaryGroups §2.9, ThetaChainsOnDefiniteUnitaryGroups §2.9a, ThetaChainsOnDefiniteUnitaryGroups §2.9b, ThetaChainsOnDefiniteUnitaryGroups §3.8; HermitianFormsAndLattices §§5.7, 6.2, 6.3, 6.4; DiscreteSeriesCoefficientsAndAutomorphicMetrics
§8.3 (formal degree).

### 5.20b Loops and non-scalar pairs

*Origin:* particular to this proof: the bound for the pairs of terms of corank at least two and for the non-scalar pairs
of corank one, by a lattice inequality, mean counts over a genus and the amplitude bounds.

*Method of the formal proof:* the pairs are sorted into nondegenerate pairs of corank `s`, degenerate pairs of corank `s`
and non-scalar generic pairs of corank one, and each class has a row bound that is a product of a power of `2/g`, a mass
ratio, a count of sublattices and amplitude bounds; the power of `2/g` comes from a lattice theorem in which the
determinant of the form `⟨(1 − β)x′, x″⟩` modulo its radicals is a nonzero element of `g^{s−1}𝒪_E` bounded at every
embedding by Hadamard's inequality; elementary sums over `s` give `ε_L`.

*Lemma (loops and non-scalar pairs).* Let `A ≥ 1` be a constant fixed with the constants of the chain (it may depend on `C₀`;
it does not depend on `x`, `k` or the words). There is `ε₁ > 0` such that for `ε ≤ ε₁` and the data of the chain at a scale
`x ≥ x₀` (`x₀` depending on `ε`, on `A` and on the constants of (St)), with `C′, C_l` above thresholds depending on
`C_g, c_b, C_u, c_T, C_T, C₀` and `A`: let `u, u′` be words, equal or not, and assume (St) of 5.20a; the hypotheses of 5.17d for
`(T(u), T(u′))` (primes `≥ 3` splitting completely in `E`, prime to `g₀g₁`, congruent modulo `(g₀g₁)²`); `r_S ≥ 1`; `g₀ ≠ g₁`; `T(u)/T(u′)`
and `T(u′)/T(u)` at most `A`; the Vandermonde products of the two types within `A^k` of each other at every `τ`;
`C_lm⁶ log b ≤ k log k`; `(log f)² ≤ Am² log b`; `log f ≤ Ar_S²`; `C_u log b ≤ m − 1`, `m ≥ C_m`; and the window
`C₀^{−1} ≤ d_w^{all}Γ₀²/D* ≤ C₀` for the words `w` of the chain. Then, in the notation of 5.17a and 5.15 (e),

`γ_GG(1)·Σ|⟨𝐯_t, 𝐯_{t′}⟩| ≤ ε_L·d_u^{all}d_{u′}^{all}/D*`,  `ε_L = e^{−kf log k/3}`,

for the sum over the ordered pairs of terms of one row with `Gr ≠ 0` and corank `≥ 2` (the loops), and for the sum over the
non-scalar pairs of generic terms of one row of corank one. For `u = u′` the hypotheses on the pair hold with `A = 1`.

*Route.* Three bounds of the form `Σ w_row·a(t)a(t′) ≤ W_rows·dim V_{λ_u}·B` over a class of pairs, `a(t)` the Hilbert–Schmidt norm of the
amplitude, with `γ_GG(1)·W_rows·dim V_{λ_u} ≤ d_u^{all}`: for nondegenerate pairs of corank `s`,
`B = (2/g)^{(s−1)kf}(kv_E)^{kf}Ξ(s)C^{kf}b^{Cm⁴f(s+m)}(Csf)^{6sf}Γ₀·d_{u′}^{all}/D*`; for degenerate pairs of corank `s`, the same with
`(s − 2)` in place of `(s − 1)`, the factor `e^{Cm⁶f log b}(C/k)^{kf}` and no factor `d_{u′}^{all}/D*` (the window supplies it at the cost
`C₀Γ₀²`); for non-scalar generic pairs of corank one, `B = C^fb^{Cm⁵f}Γ₀e^{Cm⁶f log b}(C·g^{−(2r_S+1)}k^{−r_S})^{kf/2}·d_{u′}^{all}/D*`. Here
`Ξ(s) = mass(s)mass(k−s)/mass(k)`. The three sums over `s` are `≤ g^{−kf/2}`, `≤ e^{−kf log k/2}Γ₀^{−2}` and `≤ e^{−kf log k}`; nothing in
them uses `u ≠ u′`. The ingredients: *Loops* (corank `s ≥ 2`, 5.15 (e)). For a row `Λ` (a unimodular lattice of `Y_0`), the base flag `F = (X, z_u)` (`X = ⟨e_1, …, e_{r_S}⟩`) and
a term `F′ = (X′, z′)`, let `U` be the lattice spanned by `Λ ∩ X`, `z_u`, `Λ ∩ X′`, `z′`; `H′` its orthogonal (positive definite
of rank `k − 1`); `𝔏′ ⊂ H′` the lattice of vectors `x = l + ξ = l′ + ξ′` with `l ∈ Λ ∩ X^⊥`, `ξ ∈ X`, `l′ ∈ Λ ∩ X′^⊥`, `ξ′ ∈ X′`,
`l − l′ ∈ gΛ + Λ ∩ X + Λ ∩ X′` (`g = g₀g₁`); `ι′ = [𝔏′ : 𝔏′ ∩ Λ]`; `𝒢′ = 𝒢(F, F′) := det U/g^{mf} = ∏_τGr_τ·g^{−mf}` (determinants are
products over the real places of Gram determinants). For a pair of terms `(F′, F″)` related by an isometry `β` of `Λ`, let
`Rad′ = {x ∈ H′ : (1 − β)x ∈ X + X″}` (of codimension `s − 1`), `M = 𝔏′ ∩ Rad′`, and `b(x′, x″) = ⟨(1 − β)x′, x″⟩` on `H′ × H″`.
*Lattice theorem* (any integers `T(u), T(u′) ≥ 1`): if the kernels of `b` are exactly `Rad′` and `Rad″` (*nondegenerate* pairs),
then `det M·ι′ι″ ≤ (2/g)^{(s−1)f}√(𝒢′𝒢″)`; otherwise (*degenerate* pairs) they are one dimension larger and
`det M·ι′ι″ ≤ (2/g)^{(s−2)f}√(𝒢′𝒢″)·T(u)^{−f}(∏_σκ_σ(F,F′)κ_σ(F,F″))^{1/2}`, the product over the embeddings of `E`,
`κ_σ = (1 + ch_σ)/sh_σ`, `ch_σ = |D_{r_S+1}/D_{r_S}|_σ/√(T(u)T(u′))` for the leading minors of the pairing matrix,
`sh_σ² = ch_σ² − 1` (so `Gr_σ = T(u)T(u′)|D_{r_S}|²_σsh_σ²`; `κ_σ = 1` if `D_{r_S}` vanishes). Proof: `det 𝔏′·ι′² ≤ 𝒢′`, because
`Λ ∩ H′ ⊂ 𝔏′` has determinant `det U/[Λ ∩ EU : U]` (`Λ` unimodular), `x ↦ l − l′` embeds `𝔏′/(𝔏′ ∩ Λ)` into `g·(Λ ∩ EU)/U` (its
class vanishes iff `l − l′ ∈ Λ ∩ X + Λ ∩ X′`, as `X ∩ X′ = 0`), and the `g`-torsion of `(Λ ∩ EU)/U` has order `≥ g^{mf}` by the
congruence of the two frames; `(det M)² = det 𝔏′·det 𝔏″/(det Ψ′·det Ψ″)` for the projections `Ψ′, Ψ″` orthogonal to `Rad′, Rad″`,
the map `x′ ↦ x″` being an isometry `Rad′ → Rad″` carrying `𝔏′ ∩ Rad′` onto `𝔏″ ∩ Rad″`; `b` takes values in `g𝒪_E` on `𝔏′ × 𝔏″`
(expanding the two congruences, every term lies in `g𝒪_E` except two cross terms that cancel), vanishes on `Rad′` and `Rad″`,
and satisfies `|b(x′, x″)| ≤ 2‖x′‖‖x″‖` at every embedding (Cauchy–Schwarz in the positive semidefinite spaces `(X + Ez_u)^⊥`
and `(X″ + Ez″)^⊥`), so that, when `b` is nondegenerate modulo `Rad′, Rad″`, its determinant in bases of `Ψ′, Ψ″` is a nonzero
element of `g^{s−1}𝒪_E` of absolute norm `≥ g^{2f(s−1)}` and of absolute value `≤ 2^{s−1}(det Gram Ψ′)^{1/2}(det Gram Ψ″)^{1/2}` at each
embedding (Hadamard's inequality for the operator `T` with `b(x, y) = ⟨Tx, y⟩`, `‖T‖ ≤ 2`): `det Ψ′·det Ψ″ ≥ (g/2)^{2f(s−1)}`. In the
other case the kernel is `Rad′` plus exactly one line: writing `x′ = p + y`, `βx′ = p₂ + y` along `U″ ⊕ (U″)^⊥`,
`U″ = X + Ez_u + X″ + Ez″`, the coefficients of `p, p₂` on the positive vectors of `U″` orthogonal to `X + Ez_u`, resp. `X″ + Ez″`,
have proportional absolute values because `‖x′‖ = ‖βx′‖`, so one vanishes only with the other; the extra line carries a rank-one lattice `R` of determinant `≥ T(u)^f/(N′∏_σκ_σ)`: for `x` in the left kernel write `x = θ + y`,
`βx = θ + y″` with `θ ∈ (U″)^⊥`, `y ∈ U″ ∩ (X + Ez_u)^⊥`, `y″ ∈ U″ ∩ (X″ + Ez″)^⊥`; then `‖y‖ = ‖y″‖ ≤ ‖x‖`, the coordinate `a(x)` of
`(1 − β)x` on `z_u` is the difference of those of `y` and `y″`, and `T(u)|α(y)|² = coth²‖y‖²`, `T(u)|α(y″)|² = csch²‖y″‖²` at each
embedding, so `T(u)|a(x)|² ≤ κ²‖x‖²`; `N′` is the index in `R` of the sublattice on which `a` is integral, the class of `a(x)` modulo
`𝒪_E` is the image of a `g`-divisible class of `(Λ ∩ EU″)/U″`, and therefore `det 𝔏″·ι″²·N′ ≤ 𝒢″`; Hadamard on the remaining `s − 2` dimensions. *Mean count:* the mean over the rows of the number of classes of pairs with given Gram classes, corank `s` and
`det M·ι′ι″ ≤ De` is at most `(De/T(u)^f)^k·Ξ(s)·W`, with `W = H^{C(s+m)m+C log f}·(Csf)^{6sf}`, `H` the product of the heights of the
two Gram classes (`T(u)^f ≤ H`, `De ≤ H^C`). Proof. (1) A pair determines a sublattice `P` of the row lattice of rank `k − s` and
determinant `≤ De`: the image of the intersection of `M` with `𝔏′ ∩ Λ` and `𝔏″ ∩ Λ` (the projection along `X` identifies the lattices
of `H′` with lattices of `X_0`, preserving ranks, determinants and indices). (2) For such a `P` with `De ≤ H³`, the classes of terms
of a given Gram class whose lattice contains `P` number at most `T(u)^{2fr_S}De^{r_S}9^{sf}H^{9s+9sr_S+16r_S²}`; and a pair is
determined by its two terms (5.15 (e)). (3) A lattice of rank `≤ k` over `𝒪_E` has at most `i^{k+log₂(2f)}` sublattices of index `i` (HermitianFormsAndLattices §4.10);
so the sublattices of rank `k − s` and determinant `≤ De` number at most `Σ_{d≤De}prim(d)·(De/d)^{k+log₂(2f)+1}`, `prim(d)` the number of
primitive ones of determinant `d`. (4) For an isometry-invariant function `N` of lattices, the mean of `N`(row lattice) over the
rows is `mass(L₀)^{−1}Σ_{L′}N(L′)/#Aut(L′)` over the classes of the genus of the row lattice `L₀` (5.17). (5) For `2 ≤ s ≤ k − 2`:
`Σ_{L′}prim(L′; d)/#Aut(L′) ≤ mass(L₀)·(d/T(u)^f)^k·(d·T(u)^f)^{Cs+C log f}·Ξ(s)` (`C ≥ 16`), by the orbit count for the genus of `L₀`
(integral, discriminant index `T(u)^{2f}`; HermitianFormsAndLattices §6.4c, with `j = k − s`, `n = d²`, resting on HermitianFormsAndLattices §§4.10, 4.11, 5.9,
6.4b), and `mass(L₀) ≥ mass(k)·T(u)^{f(k−1)}`;
for `s = k − 1, k` each lattice has at most `(9rd_E)^{kf}d^k` primitive sublattices of rank `≤ 1` and determinant `d`. The exponent `k`
of `De/T(u)^f` is a weakening, chosen because it cancels against the amplitudes; the factor `(d·T(u)^f)^{Cs+C log f}`, which is part
of `W`, cannot be dropped. *Amplitudes:* `(eπ/(kv_E))^{kf}(𝒢(t)/T(u)^f)^k·|a_t|²/dim V_{λ_u} ≤ loss(t)·(1 + δ)d_{u′}^{all}/D*`, `loss(t)` decaying like a high
power of the size of the pairing matrix (5.18 (i) through 5.20a (c); 5.20a (a) for `∏_τ(T_crit/T(u′))^{−k}` and the lower bound
`T_crit ≥ (g₀g₁)^mk^{3r_S}` of 5.20a (b)), and two absolute forms for the degenerate pairs, at each real place: `n·Gr(γ)^k‖𝒥(γ)‖²_HS·ρ(γ)^{2k}T(u)^{−k}/dim ≤ loss(γ)·(C/k)^k`
(`ρ(γ)` the hyperbolic ratio of the two flags), and, where the minor `D_{r_S}(γ) ≠ 0`,
`‖𝒥(γ)‖ ≤ loss(γ)·(C/(kv_E))^{r_S(k−2−r_S)}|D_{r_S}(γ)|^{−(k−2−r_S)}`, both with the decay of the chain instance of 5.18 (i) and
`∏_τloss ≤ e^{Cm⁶f log b}·size^{Cm⁴}`; *proof of the absolute forms:* the normalising scale at a place is
`(eπ·Gr/(g^m·T(u)·k·v_E))^k`; if `sh_σ ≥ 1` then `((1 + ch_σ)/sh_σ)² ≤ 6` and the bound of 5.18 (i) with `T_crit ≥ (g₀g₁)^mk^{3r_S}`
(5.20a (b); this uses `r_S ≥ 1`) gives the claim; if `sh_σ < 1` then `(1 + ch_σ)² ≤ 6`; with `‖𝒥‖²_HS ≤ dim·‖𝒥‖²` and the operator-norm
bound, the powers of `sh_σ` cancel against the hyperbolic ratio and those of `D_{r_S}` against `Gr = T(u)T(u′)|D_{r_S}|²sh_σ²`, which
leaves `(6eπA/(k·g^m))^k`; the operator-norm bound is the Cauchy–Schwarz inequality for the two Bessel functions, normalised in
`L²`, over dyadic pieces of the domain of integration on which two Gram numbers `Y, Y′` of the pair of flags are fixed up to a
factor `2`: `Y·Y′·|D_{r_S}(γ)| ≤ 2^{r_S}`, and the `L²` mass of a piece is at most `(C/k)^{r_S(k−2−r_S)}·Y^{2(k−2−r_S)}` (the volume of
a ball of complex dimension `k − 2 − r_S`, in `r_S` directions) times moments of the Gram–Schmidt lengths (5.18 (i₁)); where `∏_σκ_σ(t) ≤ 9^f·H(t)³` (`H(t)` the height of the pairing matrix). The powers of `𝒢` and `T(u)^f` cancel; the sums over the Gram matrices converge because their entries, scaled by powers of
`rd_E`, lie in lattices of `ℂ^f` whose nonzero elements have norm `≥ 1`. With `(kv_E)^{kf}Ξ(s) ≤ b^{Cm²f}C^{skf}` for `2 ≤ s ≤ k − 2`
(ratios of masses), and for `s = k − 1, k` the counting bound with the majorant `Ξ⁺(s) := (Ck)^{kf}(b^{Cm³f}T(u)^f)^{Ck}` in place of
`Ξ(s)` (there the count of primitive sublattices of rank `≤ 1` replaces the mass ratio; `Ξ(k) = 1`), the nondegenerate pairs of all coranks contribute
at most `g^{−kf/2}`, the degenerate ones at most `e^{−kf log k/2}Γ₀^{−2}` (which the window for `u′` turns into
`C₀e^{−kf log k/2}d_u^{all}d_{u′}^{all}/D*`), in the normalisation of the three row bounds; it is the degenerate pairs that determine
`ε_L`. *Non-scalar generic pairs of corank one.* (*Lemma.* Let `E` be a CM field, `T, T′ ≥ 3` and `g ≥ 1` integers, `γ = [[a, b],[c, d]] ∈ M₂(E)`
preserving `T|x|² − T′|y|²` at every embedding and the lattice `{(p₁, p₂) ∈ 𝒪_E² : p₁ + p₂ ∈ g𝒪_E}`, with `a − 1, c ∈ T𝒪_E` and
`b, d − 1 ∈ T′𝒪_E` locally at the primes above `TT′`. Then `γ = 1` or `(TT′/g²)^{f/2} ≤ ∏_w(T′/T)^{1/2}|c|_w`. Proof: `T²|b|² = T′²|c|²` at
every embedding, so `s = T′cc̄/T = Tbb̄/T′`; if `c ≠ 0` then `g²s/(TT′)` is a nonzero integer of `E` and the product formula gives the
bound; if `c = 0` then `b = 0`, `|a| = |d| = 1` everywhere and `(a − 1)/T`, `(d − 1)/T′` are integers with all conjugates of absolute
value `≤ 2/3`, hence `0`. The change of coordinates between the two terms satisfies the hypotheses; the congruences at the
primes above `T(u)T(u′)` use `(g, T(u)T(u′)) = 1`.) So
`(T(u)T(u′)/g²)^{f/2} ≤ (∏_σ[coth_σ(F,F′)csch_σ(F,F″) + csch_σ(F,F′)coth_σ(F,F″)])^{1/2}`. Since
`(ch′ + ch″)/(sh′sh″) ≤ 4/(min(1, sh′)·min(1, sh″))` (with `sh = ∞` when `D_{r_S} = 0`), one of the two terms has `D_{r_S} ≠ 0` and is *nearly
degenerate*: `∏_τ min(1, sh_τ²) ≤ (4g/√(T(u)T(u′)))^f`. A term with `D_{r_S} ≠ 0` satisfies, besides the `L²` bound, the *minimum bound*
`n(t)·|a_t|²/dim V_{λ_u} ≤ loss(t)·(1 + δ)(d_{u′}^{all}/D*)·∏_τ min(1, T(u′)sh_τ²·t_τ·g^{−m}(C/k)^{2r_S(1−δ′)})^k`, `t_τ = T_crit(u′, τ)/T(u′)`,
`n(t) = (eπ/(kv_E))^{kf}(𝒢(t)/T(u)^f)^k`: at each place it is the smaller of the `L²` bound and of the absolute bound (a bound for the
operator norm; `‖·‖²_HS ≤ dim·‖·‖²_op`), for `(r_S + 2)/k ≤ δ′`. Since `T_crit(u′, τ) ≥ g^mk^{3r_S}` and `∏_τt_τ^k = (1 ± δ)D*/d_{u′}^{all}`
(5.20a (a)), a nearly degenerate term satisfies the absolute bound
`n(t)|a_t|²/dim V_{λ_u} ≤ 2(1 + δ)·loss(t)·(4√(T(u′)/T(u))·g^{−(2r_S+1)}(C/k)^{2r_S(1−δ′)})^{kf}`, and for `δ′ ≤ ¼`, `k ≥ C³` the last factor is at
most `(4√A·g^{−(2r_S+1)}k^{−r_S})^{kf}`. *Count:* the mean over the rows of the number of classes of generic terms with a given Gram
class `x` is at most `H(x)^{Cr_S²}·n(x)`; a generic term has at most `C^f(H(x)H(y))^{Cr_S²}` classes of generic partners of corank one
with Gram class `y`; a pair is determined by its two terms. For the pairs with Gram classes `(x, y)` bound the nearly degenerate
term by the last display, its partner by the `L²` bound, and the number of pairs by the geometric mean of the two products
(terms) × (partners): the powers of `n` cancel, and the window for `u′` bounds `√(d_{u′}^{all}/D*)` by `√C₀·Γ₀·d_{u′}^{all}/D*`. Summed
over the Gram classes the class contributes at most `C^fb^{Cm⁵f}Γ₀e^{Cm⁶f log b}(C·g^{−(2r_S+1)}k^{−r_S})^{kf/2}·d_u^{all}d_{u′}^{all}/D*`.

Follows from [FormalProof],
`Formalism/LocalToGlobal/SiegelLatticeTheory/FlagStabilizerTensors/RootLatticeThresholds/LoopsEv.lean`
(`Formalism.L2.SG.LoopsEv.RowLoopsEv`), with the hypotheses `Formalism/SharpRestriction/CuspSpanNormBounds/CntPartners.lean`
(`Formalism.MainNotions.S.Cnt.Hyp`); at the points of the chain:
`Formalism/LocalToGlobal/SiegelLatticeTheory/FlagStabilizerTensors/ThmSOwn.lean` (`Formalism.L2.SG.ThmSOwn.LoopRowS`).
*Needs:* 5.15, 5.17a, 5.17, 5.18, 5.20a, ThetaChainsOnDefiniteUnitaryGroups §2.8, ThetaChainsOnDefiniteUnitaryGroups §2.9, ThetaChainsOnDefiniteUnitaryGroups §3.8; HermitianFormsAndLattices §§4.4, 4.10, 4.11, 5.5, 5.7, 5.9, 6.1a, 6.3,
6.4, 6.4b, 6.4c.

### 5.20c Non-generic pairs

*Origin:* particular to this proof: a weighted sum of orbital integrals over integral Bruhat points and the resulting
bound for the non-generic pairs.

*Method of the formal proof:* the non-generic pairs of corank one of a row are grouped into classes, so that their sum is
a sum of squared norms of class sums; each class sum is bounded by a weighted Cauchy–Schwarz inequality over the Bruhat
points with the weights `w(γ)`; at a point the non-generic amplitude is expanded over the nonempty sets of bad primes,
each bad prime giving the factor `N𝔭^{−(k−2r_S−5)}` in mean square, and the terms are compared with the generic mass of
the point; the remaining sum over the points is the global sum (a).

Let `u, u′` be words, equal or not, with the hypotheses of 5.20b, and let `C₄ ≥ 0` be a constant depending on the constants
of (St) (it comes from the bound of 5.18 (i) through 5.20a (c), and it is at least the constant `C_b` of (a)).
(a) *Global sum.* For every `A ≥ 0` there are `C_b` and `C_{g,0}`, depending on `A` and on the constants of (St), such that when
all differences of the entries of the parameters are at least `C_gm⁴` with `C_g ≥ C_{g,0}`: for the coefficients `f_τ` of 5.15 (c)
of the discrete series `𝒟_τ` themselves,
`Σ_γw(γ)n(γ)N(γ)^{A(r_S+1)²}∏_τ‖O_τ(γ)‖² ≤ e^{C_bm⁵f log b}·∏_τ‖f_τ‖²_𝒥`, the sum over the integral Bruhat points `γ` with
`Gr ≠ 0`, where
`w(γ) = ∏_{block ends l}∏_v(1 + |D_l(γ)|²_v)²`, `N(γ) = N(Gr(γ))∏_{block ends l}N(D_l(γ))` (the minors at the block ends, nonzero at a
Bruhat point; a minor inside a block can vanish: for the block `[[0, t], [t, 0]]`, `D_1 = 0` and `D_2 = −t²`, and a product over all
leading minors would make the summand `0`) and `O_τ(γ)` is the orbital integral of 5.15a; by 5.15a, `‖f_τ‖²_𝒥 = c/d(𝒟_τ)` with
the constant `c` of 5.15a. (b) *Non-generic
pairs.* The non-generic pairs of corank one contribute, in the notation of 5.20b, at most `ε_N·d_u^{all}d_{u′}^{all}/D*`,
`ε_N = 2^{−(k−2r_S−5)}e^{C₄m⁵f log b}`. The bound of (b) needs, of the hypotheses of 5.20b, only (St), the data of the chain
and the conditions of 5.17d on `(T(u), T(u′), g₀, g₁)`.

*Route.* (a) At one place, `(∏_l(1 + |D_l|²)^{N_l})²·n‖O(γ)‖² ≤ b^{C(m⁴+m²ΣN_l)}max(1, 1/Gr)^{Cm²}·‖f_τ‖²_𝒥` by expanding the product,
removing each factor `D_l` or `D̄_l` by the minor expansion of 5.18 (i₁) and applying 5.18 (i) to the shifted coefficients; the
exponents `N_l ≤ C(1 + A)m²` are chosen so that the left side dominates
`w_v²·(Gr_v∏_l|D_l|²_v)^{A(r_S+1)²}·(1 + |D_{r_S+1}|²_v)^{⌈Cm²⌉}·n‖O‖²`; the product over the places of
`max(1, 1/Gr_v)^{Cm²}(1 + |D_{r_S+1}|²_v)^{−⌈Cm²⌉}` is `≤ 1` because `Gr` is a nonzero integer of `F` and `Gr_v ≤ |D_{r_S+1}|²_v`; and the sum of
`w(γ)^{−1}` over the points is a lattice sum over the block-end minors, `Σ_γw(γ)^{−1} ≤ C^{f(r_S+1)}`. (b) On the non-generic terms
"same row and corank one" is an equivalence relation, so their sum is `Σ_c‖Σ_{t∈c}𝐯_t‖²` over its classes. In each class apply
the weighted Cauchy–Schwarz inequality over the Bruhat points with the weights `w(γ)`. At a point, the mean square of the
non-generic amplitudes is at most `2^{−(k−2r_S−5)}H(γ)^C` times the generic mass of the point, which is `≤ A·d_sup·H(γ)^C·n(γ)`: the
non-generic amplitude is the sum, over the nonempty sets `S` of *bad primes* of the point (the primes of `F` above `g₀g₁` and those
at which `Gr(γ)` or a leading minor at a block end is not a unit; at every other prime all terms at the point are generic), of
the amplitudes of the terms that are not generic exactly at the primes of `S`; at a bad prime `𝔭` the terms not generic at `𝔭`
have local mean square at most `H_𝔭^{C(r_S+1)²}·N𝔭^{−(k−2r_S−5)}` times the local mass, and `N𝔭 ≥ 2`; the terms at a point are counted by
the mean value theorem for the Gram matrix of the two frames in `Y_0` (HermitianFormsAndLattices §6.5 (a), for the indefinite `Y_0` and `2r_S + 2` vectors,
nondegenerate since `Gr ≠ 0`). Then (a): the bad primes off `g₀g₁` are the primes dividing `N(Gr(γ))∏_{block ends}N(D_l(γ))`, the
quantity weighted in (a); that the factor `H(γ)^C` is bounded by a power of this quantity times the archimedean sizes weighted by
`w(γ)` is used; its proof is not given here.

(a): [FormalProof], `Formalism/LocalToGlobal/SiegelLatticeTheory/FlagStabilizerTensors/ThmBUseR.lean`
(`Formalism.L2.SG.ThmBUseR.JointNormBoundRotatedUniform`). It is stated in the coordinates of the local model of
[FormalProof], which are those of the chain conjugated by a fixed diagonal matrix of powers of `i`: there `‖O_τ(γ)‖²`
for a term is at most the square of the model's orbital integral at the point whose matrix has the entries
`(−1)^{r_S}(−i)^{a+b}γ_{ab}` (`0 ≤ a, b ≤ r_S`), which is the direction the bound of (a) needs
(`Formalism/SharpRestriction/CuspSpanNormBounds/FrobeniusCoefficientMemLp/FramesPt.lean`,
`Formalism.MainNotions.S.Pv.Frames.turnPt`; the inequality:
`Formalism/SharpRestriction/CuspSpanNormBounds/FrobeniusCoefficientMemLp/FramesSh.lean`,
`Formalism.MainNotions.S.Pv.Frames.orbSqO_le_turn`). It holds for every `K`-finite coefficient at each place, not only for
the `f_τ` of 5.15 (c).
(b): follows from [FormalProof], `Formalism/LocalToGlobal/SiegelLatticeTheory/FlagStabilizerTensors/RowsPos.lean`
(`Formalism.L2.SG.RowsPos.RowNGP`), `Formalism/LocalToGlobal/SiegelLatticeTheory/CokernelGLCounts/RowsConc.lean`
(`Formalism.L2.SG.RowsConc.epsNG`).
*Needs:* 5.15, 5.15a, 5.17a, 5.17d, 5.18, 5.20a, 5.20b; HermitianFormsAndLattices §6.5.

### 5.20d Degenerate terms of equal words: the type bound

*Origin:* particular to this proof: the bound for the degenerate terms of equal words, sorted by defect and minor label.

*Method of the formal proof:* the type bound is the product of an amplitude bound for each relevant degenerate term,
obtained from local data at the real places and a tail bound for them, and of a count of the pairs of terms of a row with
given defects and labels, obtained row by row from data embedded in the positive definite lattice of the row and then
from the mean over the genus with the mass formula for maximal lattices and the ratios of masses of unimodular lattices.

*Definitions.* Let `u` be a word and `t` a degenerate term of `K(u, u)` (5.15 (b): `Gr(γ) = 0`, `γ` not in the identity
coset), with base frame `F = (e_1, …, e_{r_S}, z_u)`, `X = ⟨e_1, …, e_{r_S}⟩`, second frame `F′ = γF`, `X′ = γX`, and
`D_l(t)` the leading principal minor of size `l` of the pairing matrix of the two frames (5.17), for the chosen
representative `γ`. The *defect* of `t` is `j(t) := r_S − dim_E(X ∩ X′)` and its *minor label* is
`lab(t) := (D_1(t), …, D_{j(t)}(t)) ∈ E^{j(t)}`. `t` is *relevant* if its two characters agree on
`Lie N_S ∩ γ Lie N_S γ^{−1}`; the other terms vanish (5.15 (b)). For `1 ≤ j ≤ r_S`, `δ = (δ_1, …, δ_j) ∈ E^j` and a real
`H ≥ 1` put `e_l := l(2r_S + 1 − l)/2`,
`Nm(δ) := N(δ_j·𝔡_F^{−2e_j}𝒪_E)` (the absolute norm of a fractional ideal of `E`; `𝔡_F` the different of `F`; for `E/F`
unramified at the finite places `Nm(δ) = |N_{E/ℚ}(δ_j)|·rd_E^{−4f·e_j}`), and
`Sz_H(δ) := ∏_{τ∈Φ} max(1, max{|τ(δ_l)|·rd_E^{−2e_l}/(2H)^{2r_S} : 1 ≤ l ≤ j, δ_l ≠ 0})`.

*Statement.* For all constants `C_g, C_u, C_T, C₀` and `c_b, c_T > 0` there are `C_H, C_h, C_p, C_c ≥ 0` such that for every
`C_s ≥ C_p + 4` there is `C_⋆` such that for every `C ≥ C_⋆` there are thresholds for `C′` and `C_l` with the following
property. Let the data of the chain satisfy, in the setting of 5.14 and 5.15 (neat levels `K_w`, the Bessel functions
`W_w` with the decay of 5.13 (f), the measures and formal degrees of the Conventions): (St) of 5.20a with the constants
`C′, C_l, C_g, c_b, C_u, c_T, C_T`; for every word `w`: `T(w)` split completely in `E`, `T(w) ≡ 1 (mod (g₀g₁)²)`,
`T(w)` prime to `g₀g₁`, the window `C₀^{−1} ≤ d_w^{all}Γ₀²/D* ≤ C₀` with `C₀ ≥ 1`, and the scaling condition
`T(w)κ_sc^{2r_S} ≥ 1` (5.20a); the types of two distinct words different at every `τ`; `g₀, g₁` split completely in `E`;
`E/F` unramified at all finite places; `C_l m⁶·log b ≤ k·log k`; all pairwise differences of the row parameter
`> C_l k m³`; `C_l·log rd_E ≤ log b`; `log f ≤ r_S²`. Put `H := b^{C_H m}`. Then for every word `u`:

(a) *Type bound.* For all `1 ≤ j′, j″ ≤ r_S`, all `δ′ ∈ E^{j′}`, `δ″ ∈ E^{j″}` and every finite set `S` of ordered pairs
`(t, t′)` of relevant degenerate terms of `K(u, u)` of one row (5.15 (e)) with `j(t) = j′`, `lab(t) = δ′`, `j(t′) = j″`,
`lab(t′) = δ″`:

`Σ_{(t,t′)∈S} ‖𝐯_t‖·‖𝐯_{t′}‖ ≤ dim V_{λ_u}·W_rows·w_ty(δ′)·w_ty(δ″)`,
`w_ty(δ) := (C/k)^{j(k−1−j)f}·Nm(δ)^{(j+1)/2}·b^{(C² + C_h²)·m²·f·r_S⁴}·Sz_H(δ)^{−(C_s − C_p)·k}` for `δ ∈ E^j`,

with `𝐯_t` the amplitudes of 5.17a and `W_rows` the total weight of the rows of `u` (5.17).
(b) *Norms.* Every relevant degenerate term `t` has `j(t) ≥ 1` and `0 < Nm(lab t) ≤ b^{C·m²·f}·Sz_H(lab t)²`.
(c) *Labels.* For `1 ≤ j ≤ r_S` and every finite set `T` of minor labels of relevant degenerate terms of `K(u, u)` of
defect `j`: `Σ_{δ∈T} Sz_H(δ)^{−3r_S} ≤ b^{C_c²·m²·f·r_S}`.
(d) *Consequently*, for every finite set `S` of ordered pairs of degenerate terms of `K(u, u)` of one row,
`Σ_{(t,t′)∈S} ‖𝐯_t‖·‖𝐯_{t′}‖ ≤ dim V_{λ_u}·W_rows·(Σ_{j=1}^{r_S} A(j))²`,
`A(j) := (C/k)^{j(k−1−j)f}·b^{(C² + C_h²)·m²·f·r_S⁴ + C·m²·f·(j+1)/2 + C_c²·m²·f·r_S}`.

The scaling condition is a hypothesis of the form of [FormalProof]; 5.20a (c) records that it holds under the window.

*Route.* (a) is the product of two inequalities. *Amplitudes:* for every relevant degenerate term `t`, with `j = j(t)`
and `δ = lab(t)`,
`‖𝐯_t‖ ≤ w_row(t)·(dim V_{λ_u})^{1/2}·ω(t)·(C/k)^{j(k−1−j)f}·Nm(δ)^{−(k−1−j)/2}·b^{C²·m²·f·r_S⁴}·Sz_H(δ)^{−C_s·k}`,
where `w_row(t)` is the square root of the product of the weights of the two row lattices of `t` (5.17) and `ω(t) > 0`
is an index weight of the pair of flags of `t`. It rests on the uniqueness of the Bessel functional (5.13c (d)), which
identifies the Bessel function of the word with a coefficient of `𝒟_τ` (5.13 (f)), and on a tail bound for parameters
with gaps `> C_l k m³`: for every `λ > 0` the part of the `L²`-mass of that function on which a Gram–Schmidt length of
the frame or its inverse exceeds `λH` is at most `2(2r_S + 2)·λ^{−2q}` of the whole, `q` a fixed multiple of `k·r_S`
(this is where the scaling condition is used). The orbital operator of `t` is bounded by the covolume of the integral
stabiliser of the pair of flags, at most `ω(t)` times a power of `v_E`, times the product over the real places of local
amplitudes; at a place the tail bound gives a factor `(C/(k − 1 − j))^{j(k−1−j)}·|D_j(t)|_τ^{−(k−1−j)}` and a negative
power of the factor of `Sz_H` at `τ`. The proofs of the tail bound, of the covolume bound and of the local bound are not
given here. *Count:* for `S` as in (a),
`Σ_{(t,t′)∈S} w_row(t)w_row(t′)·ω(t)ω(t′) ≤ W_rows·e(δ′)·e(δ″)`,
`e(δ) := Nm(δ)^{k/2}·b^{C_h²·m²·f·r_S⁴}·Sz_H(δ)^{C_p·k}`, with `C_p = 16`: the pairs of terms of a row with given defects and
labels are counted through data embedded in the positive definite lattice that the row induces on `X^⊥/X`, indexed by
two integers at most `Nm(δ′)` and `Nm(δ″)`; the mean over the rows is a mean over a genus (5.17), which the mass formula
for maximal lattices (HermitianFormsAndLattices §§4.4, 6.3) and the ratio of the masses of the unimodular lattices of
consecutive ranks (HermitianFormsAndLattices §6.4 (b)) bound. The proof of the count is not given here. On `S` the
defects and labels are fixed, so the product of the amplitude bounds of `t` and `t′`, summed over `S`, is
`dim V_{λ_u}·Σ_{(t,t′)∈S} w_row(t)w_row(t′)·ω(t)ω(t′)` times factors that depend only on `δ′` and `δ″`. The count bounds
this sum, so `ω` is bounded together with `w_row` and is not divided out; with `−(k − 1 − j)/2 + k/2 = (j + 1)/2` for the
powers of `Nm` this gives (a). The proofs of (b) and (c) are not given here. (d) By 5.15 (b) only the
relevant terms contribute, and by (b) they have defect `≥ 1`. For fixed defects sum (a) over the labels: by (b),
`Nm(δ)^{(j+1)/2} ≤ b^{C·m²·f·(j+1)/2}·Sz_H(δ)^{j+1}`, and `j + 1 − (C_s − C_p)k ≤ −3r_S` because `C_s − C_p ≥ 4` and
`k ≥ r_S + 1`, so `Σ_δ w_ty(δ) ≤ A(j)` by (c) (`Sz_H ≥ 1`); then sum over `1 ≤ j′, j″ ≤ r_S`.

(a): [FormalProof], `Formalism/LocalToGlobal/SiegelLatticeTheory/FlagStabilizerTensors/RowsPos.lean`
(`Formalism.L2.SG.RowsPos.TypeP`),
`Formalism/LocalToGlobal/SiegelLatticeTheory/CokernelGLCounts/RankPointCounts/DimFormC.lean`
(`Formalism.L2.SG.KappaOffDiagonal.TypeAt`, `Formalism.L2.SG.KappaOffDiagonal.jT`,
`Formalism.L2.SG.KappaOffDiagonal.labT`), `Formalism/SharpRestriction/CuspSpanNormBounds/KappaEndpoints.lean`
(`Formalism.MainNotions.KappaEndpoints.k2a`, `Formalism.MainNotions.KappaEndpoints.k2e`,
`Formalism.MainNotions.KappaEndpoints.k2Del`, `Formalism.MainNotions.KappaEndpoints.k2S`), proved as
`Development/AbelianVarietyTheory/Proofs/FlagMeasures/RowsPosTypeP.lean` (`GlobalTheory.rowsPos_typeP`); the two
inequalities of the route: `Development/AbelianVarietyTheory/Definitions/SemilocalFrames/PerRowC.lean`
(`GlobalTheory.TypeAsm.AmpP`, `GlobalTheory.TypeAsm.PairsP`), the tail bound
`Development/AbelianVarietyTheory/Definitions/SemilocalFrames/MomAllP.lean` (`GlobalTheory.TypeAsm.TailP`); (b), (c):
`Formalism/LocalToGlobal/SiegelLatticeTheory/CokernelGLCounts/RankPointCounts/DimFormC.lean`
(`Formalism.L2.SG.KappaOffDiagonal.JPosC`, `Formalism.L2.SG.KappaOffDiagonal.DelC`,
`Formalism.L2.SG.KappaOffDiagonal.CosetsC`); (d):
`Formalism/LocalToGlobal/SiegelLatticeTheory/CokernelGLCounts/RankPointCounts/KloostermanTermANonneg.lean`
(`Formalism.L2.SG.KappaOffDiagonal.fin_bound`); the hypotheses:
`Formalism/SharpRestriction/CuspSpanNormBounds/NonGenericAndKTwoTheorems.lean`
(`Formalism.MainNotions.NonGenericAndKTwoTheorems.KTwoHypotheses`),
`Formalism/LocalToGlobal/SiegelLatticeTheory/CokernelGLCounts/RowsConc.lean` (`Formalism.L2.SG.RowsConc.ConcTie`).
*Needs:* 5.13c, 5.13, 5.14, 5.15, 5.17a, 5.17, 5.20a, ThetaChainsOnDefiniteUnitaryGroups §2.3,
ThetaChainsOnDefiniteUnitaryGroups §2.8; HermitianFormsAndLattices §§4.4, 6.3, 6.4.

### 5.20 The Gram bound for distinct words

*Origin:* particular to this proof: the Gram operators of the Bessel–Poincaré series of two distinct words have squared
Hilbert–Schmidt norm at most slightly more than the value for subspaces in general position.

*Method of the formal proof:* the operator is split into its generic and non-generic parts, the identity and degenerate
terms contributing nothing; the squared norm of each part is bounded by `P_g` times a sum over ordered pairs of terms of
one row, through the Gelfand–Graev expansion and a positive semidefinite comparison; the pairs are split into loops,
non-scalar pairs, scalar generic pairs and non-generic pairs; the scalar generic pairs give the main term through the
tower inequality, the others are small, and a triangle inequality with a numerical lemma combines the two parts.

For all constants `C_Δ > 4`, `C_b > 0`, `c_T > 0` with `c_T·C_b > 1` there is `C_n`, depending on the constant `C₄` of
5.18 (i) and fixed before `ε`, with the following property. Let `u ≠ u′` be words differing at a letter `l`
(`1 ≤ l ≤ k − 2` in the numbering of ThetaChainsOnDefiniteUnitaryGroups §2.3): at the entry `u_l(τ)` of ThetaChainsOnDefiniteUnitaryGroups §2.3 (the entry of index `l + 1` in the numbering from `1` of
5.13a–5.21) their types differ by exactly `Δ_w` at every `τ` (they may differ at other inner entries), and the strings are taken in
the half-cut `{5/2 ≤ v_{l−1} + Y ≤ Δ_w/2}` of 5.18a at that entry (of length `(Δ_w − 5)/2`). Assume: `b ≥ 16`, `k ≥ 32`, `f ≤ k`, `4r_S + 12 ≤ k`, `2r_S + 7 + f ≤ k`, `70 log b ≤ k`,
`8C_n m⁵ f log b ≤ k` (`SizeW` of ThetaChainsOnDefiniteUnitaryGroups §2.1 gives it when `C_W ≥ 16C_n`), `g₀, g₁ ≥ (kb)^8`, the nodes of the parameters of ThetaChainsOnDefiniteUnitaryGroups §2.3 at least
`k^{C_b}`, `Δ_w ≥ (kf log b)^{C_Δ}`, `T(u), T(u′) ≥ b^{c_T m}`, `E/F` unramified at all finite places; the hypotheses of 5.20b for
`(u, u′)`; and the window `C₀^{−1} ≤ d_w^{all}Γ₀²/D* ≤ C₀` for `w = u` and `w = u′` (the rank window of ThetaChainsOnDefiniteUnitaryGroups §2.8 with ThetaChainsOnDefiniteUnitaryGroups §3.8,
`d_w^{all} = ď_w^{all}`, gives it with `C₀ = 3` when `T*(w) ≥ 4f + 1`); and `k ≥ k₀` and `c_Θ·C_l ≥ 16` (`k₀`, `c_Θ` below). Then

`‖K(u, u′)‖²_HS ≤ (1 + η_off)·d_u^{all}d_{u′}^{all}/D*`,

with `η_off = (√(P_g((1+δ_tw)e₁ + 2ε_L)) + √(P_g(ε_L + ε_N)))² − 1`, `P_g = ∏_{v|g₀g₁}(1 + 3/N v)`, `δ_tw := C(r_S + 1)(C/Θ)^f` with `C` of
5.19 for `L = r_S` and `Θ` defined by `Θ^{−f} =` the largest, over the block starts and sizes, of the products over the real places
of the scales of 5.18c multiplied by the covolumes of the lattices of pivots; `Θ ≥ k^{c_Θ}` with `c_Θ := ½·min((C_Δ − 4)/2, (c_T·C_b − 1)/4)`
for `k ≥ k₀`, `k₀` depending on `C_Δ, c_T, C_b`, `C₀`, `C_Γ` and the constants of 5.19, and `r_S(C/Θ)^f ≤ 1`, `δ_tw ≤ b^{−7}`;
`e₁ = max(d_sup, 1)` (5.17d), `ε_L` of 5.20b and `ε_N` of 5.20c; under the hypotheses
`η_off ≤ b^{−6}` for `m ≥ C_m` and `x ≥ x₀`, `C_m` depending on `C_g` and on the margin `8C_n log 2 − C₄ > 0`. The operator `K(u, u′)` maps columns of
level `K_{u′}` to columns of level `K_u`; the counts are of terms of the row type level `(K₂, χ₂)`, and `D*` is formed with `K₂`.
For `C_Δ = 5`, `c_T = 1/2`, `C_b = 3` one has `c_Θ = 1/16`, and (St) of 5.20a with `C_l ≥ 256` gives the conditions on the
nodes and on `Δ_w` and `c_Θ·C_l ≥ 16`.

*Route.* By 5.15 (b) the identity and degenerate terms contribute `0`, so `K = P_gen + P_ng`. 5.17a bounds `‖P_𝒮‖²` by `P_g` times a
sum over ordered pairs of terms in one row (pairs in different rows are orthogonal), split by corank (5.15 (e)). The loops
and the non-scalar generic pairs of corank one contribute at most `2ε_L·d_u^{all}d_{u′}^{all}/D*` (5.20b); the non-generic pairs at most
`ε_N·d_u^{all}d_{u′}^{all}/D*` (5.20c). *Scalar generic pairs*: their sum equals `(n₀/(c₀c₀′))·Σ_ρ‖Σ_pc_ρ(p)V(p)‖²` over the labels `ρ`
(*second-moment identity*: two generic terms of a row form a scalar pair of corank one exactly when they have the same label, so
the sum is `Σ_{(row, label)}‖Σ amplitudes‖²`; for a row and a label there are unitary operators `U, U′` of the two types and a
unimodular `ζ` such that the amplitude of every term `t` of that row and label is `ζ·(c₀c₀′)^{−1/2}·c(t)·U∘O(γ_{p(t)})∘U′^{−1}`, `c(t)` as
in 5.17 (*frame coherence*); a term forgets to a *reduced term* (its class over the first lattice), every row that meets a label
contains exactly one term over each reduced term of the label, and the weights of the second lattices of these rows add up to
`1` (neat level), so the sum over the rows for a fixed label is `‖Σ_t√(mass t)·c(t)·O(γ_{p(t)})‖²` over the reduced terms of the
label; and the terms are regrouped by Bruhat points, `V(p) = √(n(p))·O(γ_p)`, all families being absolutely summable); then the
tower inequality 5.19 for `L = r_S`, whose hypotheses are supplied by the local model 5.17d with the comparison of 5.17 (the
kernels `Kr_i`, their support and, for every finite tower, periodic majorants (5.17c (b-v)), `Σ_ρc_ρ ⊗ conj c_ρ ≤ d_sup·Kr_{r_S+1}`, the
factor `d_sup` being moved into the top kernel) and by the archimedean inputs 5.18b (e) (positivity of the level forms), 5.18c
(wave and lift bounds with their scales), 5.18d (block bound) and 5.18e (h′) (level zero); the Poisson step of 5.19 by Poisson
summation over each coset of the lattice of pivots; strings chosen in the half-cut at the letter's entry, the nodes pairwise
at least `5` apart (so the strings used lie in the cut by construction).
*From one real place to the tower.* For the chain the data of 5.19 are these. A string of the tower is a family
`𝐬 = (𝐬_τ)_τ` of strings of 5.18a, one at each real place, its letter count the largest of the letter counts and its
weight the product of the weights of the `𝐬_τ`; a point is read at `τ` through the embedding `τ` of its pivots; and
`gram(ε_c, i, 𝐬)(p, q) = ∏_τ gram_τ(ε_c, i, 𝐬_τ)(p_τ, q_τ)`, `gram_τ` the kernel of the level-`i` form of 5.18b at `τ` with the
normalising factors of the two points. `N̂(i, 𝐬, Y, κ; l)` is the Fourier transform, in the last pivot `c = (c_τ)_τ ∈ ∏_τ ℂ`
of a block of size one, of `Σ_{h,h′∈Y}κ(h, h′)·gram(ε_c, i, 𝐬)(h ⊕ (1, c), h′ ⊕ (1, c))/wt(𝐬)` against
`c ↦ exp(2πi·Σ_τ 2Re(τ(l)c_τ)/(g₀g₁))`, divided by the covolume of the lattice of pivots. The scales are
`ρ^w_{i,τ} = thr(i, 1)`, `ρ^l_{b,s,τ} = thr(b, s + 1)` for `b + s ≤ r_S + 1` and `2·thr′(b)` for `b + s = r_S + 2` (5.18c, at `τ`).
The statements of 5.18b–5.18d hold at one place as positivity of block kernels (kernels `a`, `b` on two finite sets and
a kernel `w` between them are *block-positive* when `[[a, w], [w^*, b]]` is positive semidefinite), and pass to the
product by the Schur product theorem in the form: if `(a_τ, w_τ, b_τ)` is block-positive for every `τ` and `(κ_a, κ_w, κ_b)`
is block-positive, then `|Σκ_w·∏_τ w_τ| ≤ ½·(Σκ_a·∏_τ a_τ + Σκ_b·∏_τ b_τ)`.
(1) *Positivity.* 5.18b (e) at each `τ`; products are positive semidefinite.
(2) *Zero frequency.* At each `τ` the kernel with one more pivot `c` of a block of size one extends continuously in
`c`, is `O((1 + |c|)^{−3})`, and its integral over `ℂ` is a constant times the kernel of level `i − 1` (5.18b (e), last
clause), the product of the constants being the covolume of the lattice of pivots; hence
`N̂(i, 𝐬, Y, κ; 0) = N0(i − 1, 𝐬, Y, κ)`.
(3) *Wave bound.* At each `τ` there are two probability vectors `ϑ^±_τ` on the strings with at most `K_♯` more letters such
that, for every `l ∈ ℂ`: the level-`(i − 1)` kernel of the string, twice, with the Fourier transform at `l` of the
level-`i` kernel between them, is block-positive; and so are, for some `u` of modulus `1`, `ρ^{K_♯}` times the `ϑ^+_τ`-mean
and the `ϑ^−_τ`-mean of the level-`(i − 1)` kernels with `u·l^{K_♯}` times that Fourier transform between them, `ρ ≤ thr(i, 1)`.
Taking the second triple at the places of a set `A` and the first at the others gives, for every set `A` of real places,
a probability vector `ϑ_A` on the strings of the tower with at most `K_♯` more letters with
`∏_{τ∈A}|l|_τ^{K_♯}·|N̂(i, 𝐬, Y, κ; l)| ≤ ∏_{τ∈A}ρ_{i,τ}^{K_♯}·Σ_{𝐬′}ϑ_A(𝐬′)·N0(i − 1, 𝐬′, Y, κ)`, `0 ≤ ρ_{i,τ} ≤ thr(i, 1)`,
for every positive semidefinite `κ` and every `l ≠ 0` of the dual lattice; `A = {τ : |l|_τ > thr(i, 1)}` gives the wave
bound of 5.19, with `2^f` vectors.
(4) *Lift bound below the top* (`i ≤ r_S`). The same with `t^{−1} − t′^{−1}` in place of `l` and `thr(b, s + 1)`:
`∏_{τ∈A}|t^{−1} − t′^{−1}|_τ^{K_♯}·|N(i, s, 𝐬; t, t′)| ≤ ∏_{τ∈A}ρ_τ^{K_♯}·Σϑ_A(𝐬′, 𝐬″)·½(Re N(i, s, 𝐬′; t, t) + Re N(i, s, 𝐬″; t′, t′))`
for every `A`; the vector of 5.19 for a choice `π` is `ϑ_A` with `A = {τ : π(τ) ≠ 0}`, so only `2^f` of the `3^f` occur.
(5) *Lift bound at the top* (`i = r_S + 1`, `s ≥ 2`). At one place the statement is diagonal: for a pivot `t ≠ 0`,
`(|t|_τ·Λ′_τ)^{2K_♯}` times a mean of the top kernels at `t` minus the top kernel at `t` is positive semidefinite, with
`Λ′_τ ≤ thr′(b)`. Hence, for every set `B` of real places,
`Re N(r_S + 1, s, 𝐬; t, t) ≤ ∏_{τ∈B}(|t|_τΛ′_τ)^{2K_♯}·Σ_{𝐬′}ϑ_B(𝐬′)·Re N(r_S + 1, s, 𝐬′; t, t)`. For two pivots put `π(τ) = 0` if
`|t^{−1} − t′^{−1}|_τ ≤ 2Λ′_τ`, `π(τ) = 1` if not and `|t|_τ ≤ |t′|_τ`, `π(τ) = 2` otherwise, `B_1 = π^{−1}(1)`, `B_2 = π^{−1}(2)`.
Then `|N(t, t′)|² ≤ Re N(t, t)·Re N(t′, t′)` (positivity), the diagonal bound with `B_1` at `t` and with `B_2` at `t′`,
`min(|t|_τ, |t′|_τ) ≤ 2/|t^{−1} − t′^{−1}|_τ` and `√(xy) ≤ (x + y)/2` give the lift bound of 5.19 with
`ϑ_π(𝐬′, 𝐬″) = ϑ_{B_1}(𝐬′)·ϑ_{B_2}(𝐬″)` and the scale `2Λ′_τ ≤ 2·thr′(b)`: these are the `3^f` vectors.
(6) *Block bound.* 5.18d at each place with (3) and (4); the constant becomes `C₄^{f·s}·∏_{s′<s}vol(b, s′)`,
`vol(b, s) = (∏_τ thr(b, s))²` divided by the norm of the dual ideal of the block.
(7) *Level zero.* 5.18e (h′) at each place; the limit is the product over `τ`.
*The size of `Θ`.* On the half-cut the factor of `A` coming
from the letter is `√((v_{l−1} + Y + 1)/(Δ_w − v_{l−1} − Y))`, bounded there (at the upper end `Y + v_{l−1} = Δ_w/2` it is `≤ 2`; on the whole cut up to
`Δ_w − 3/2` it would grow like `√Δ_w`), and for `(b, s) = (1, 1)` the supremum is over the initial segment of length `N³` (5.18c), where
the factor `(C_ρκN/|cut|)^{2(b−1)+s−1}` has exponent `0`. With `N = 4K_♯(r_S + 1)`, `|cut| = (Δ_w − 5)/2`: the first threshold is
`≥ k^{(C_Δ−4)/2}` up to constants (`N³ ≤ 1000k³`, `Δ_w ≥ (kf log b)^{C_Δ}`), and the top threshold `≥ k^{(c_TC_b−1)/4}` up to constants (`b ≥ k^{C_b/2}` from
the nodes `≥ k^{C_b}` and the entries `≤ b²`, `T(u)T(u′) ≥ b^{2c_Tm}`), which gives `Θ ≥ k^{c_Θ}`, the factor `½` absorbing the constants for
`k ≥ k₀`. *Smallness.* `(C/Θ)^f ≤ C^fk^{−c_Θf}` and, by `C_lL ≤ f·log k` of (St), `k^{−c_Θf/2} ≤ b^{−c_ΘC_l/2} ≤ b^{−8}` when `c_Θ·C_l ≥ 16`;
the other half `k^{−c_Θf/2}` absorbs `C^{f+1}(r_S + 1)` for `k ≥ k₀`; so `δ_tw ≤ b^{−7}` and `r_S(C/Θ)^f ≤ 1` (with `c_Θ·C_l > 8` only
`b^{−4}` would follow). The zero frequency after all levels is `𝔧 ∝ ∫_{S_u\U(Y_0)(F_∞)/S_{u′}}‖O‖² ≤ 1/∏d(𝒟_τ)` (5.15a), and the
volume identities `c₀ = vol(K₂)vol(Γ_u\N_S(F_∞))vol(U(X_0)(F_∞))/dim V_λ` (5.15), `d_u^{all} = dim V_{λ_u}·vol([U(X_0)])/(vol(U(X_0)(F_∞))vol(K_u))`,
`D* = ∏d(𝒟_τ)·vol([U(Y_0)])/vol(K₂)` turn `𝔧` into `(1 + δ_tw)e₁·d_u^{all}d_{u′}^{all}/D*`, for these normalisations:
the Haar measure of `N_S(𝔸)` is the one with `vol([N_S]) = 1`; the measure of `U(X_0)(𝔸)` is the one compatible with that of
`U(Y_0)(𝔸)` through the orbit of the tuple `(e_1, …, e_{r_S}, z_u, f_1, …, f_{r_S})`, whose Gram matrix is nondegenerate, so that
`vol([U(X_0)]) = vol([U(Y_0)])`, and the stabiliser of a pair of base frames with nondegenerate Gram matrix has the same covolume
(HermitianFormsAndLattices §6.5 (d), for tuples of `2r_S + 1` and of `2r_S + 2` vectors; it uses `4r_S + 5 ≤ r`, which holds because
`r = k + m − 1`, `m = 2r_S + 2` and `k ≥ m + 3`); the measure of `S_u(𝔸_f)` is the product of those of `N_S(𝔸_f)` and `U(X_0)(𝔸_f)`.
The measure of `U(X_0)(𝔸)` used for the covolumes is this orbit-compatible one, not the one of the Conventions (total volume the
mass); the three identities are ratios and hold for either.
Combine by the triangle inequality; `η_off ≤ b^{−6}` because `ε_L, ε_N ≤ b^{−14}`, `P_g ≤ exp(6b^{−7})` and
`(1 + δ_tw)e₁ ≤ (1 + b^{−7})exp(b^{−14})`: with `k − 2r_S − 5 = k − m − 3` and `8C_nm⁵fL ≤ k` the
exponent of `ε_N` is `≤ −(8C_n log 2 − C₄)m⁵fL + (m + 3) log 2`, which is `≤ −14L` for `m ≥ C_m`.

*Needs:* RowTowerAndRallisIdentities §5.3, 5.14, 5.15, 5.15a, 5.17a, 5.17d, 5.17, 5.18a, 5.18b, 5.18c, 5.18d, 5.18e, 5.18, 5.19, 5.20a, 5.20b, 5.20c, ThetaChainsOnDefiniteUnitaryGroups §2.1, ThetaChainsOnDefiniteUnitaryGroups §2.3, ThetaChainsOnDefiniteUnitaryGroups §2.8, ThetaChainsOnDefiniteUnitaryGroups §2.9,
ThetaChainsOnDefiniteUnitaryGroups §3.8; HermitianFormsAndLattices §§5.5, 5.7, 6.0b, 6.2, 6.3, 6.4, 6.5 (d); AnalyticNumberTheoryPartII §5.3k
(quotient measures, integration in stages); Mathlib (Poisson summation). The size hypotheses: [FormalProof],
`Formalism/LocalToGlobal/SiegelLatticeTheory/FlagStabilizerTensors/TheoremSRecursion.lean`
(`Formalism.L2.SG.PoincareAmplitudeLowerBounds.SizesAt`), `Formalism/HermitianCurvature/StatementPB.lean`
(`Formalism.FourierDecayAlt.PB.SizeNumbers`); the assembly of the bound with `η_off ≤ b^{−6}`: [FormalProof],
`Formalism/HermitianCurvature/StatementPB.lean` (`Formalism.FourierDecayAlt.PB.PairBound`); at the points of the chain:
`Formalism/LocalToGlobal/SiegelLatticeTheory/FlagStabilizerTensors/ThmSOwn.lean` (`Formalism.L2.SG.ThmSOwn.TheoremSSelected`);
from one real place to the tower: [FormalProof], `Formalism/HermitianCurvature/ArchimedeanUniformConstantsCompactSupport.lean`
(`Formalism.FourierDecayAlt.KB.BuiltBounds2Cpt`), proved in
`Formalism/HermitianCurvature/HermitianCurvatureProofs/BuiltBoundsCompact.lean` (`Formalism.FourierDecayAlt.P.built_bounds_compact`);
`Formalism/HermitianCurvature/StatementC.lean` (`Formalism.FourierDecayAlt.C.HidaSetting`, the kernels and scales of the chain);
`Formalism/HermitianCurvature/StatementKB.lean` (`Formalism.FourierDecayAlt.KB.WaveLoc`, `Formalism.FourierDecayAlt.KB.LiftLoc`,
`Formalism.FourierDecayAlt.KB.TopLoc`, `Formalism.FourierDecayAlt.KB.BlockSchur`, `Formalism.FourierDecayAlt.KB.IntAll`);
`Formalism/HermitianCurvature/StatementJC.lean` (`Formalism.FourierDecayAlt.JC.WaveByPlaces`,
`Formalism.FourierDecayAlt.JC.LiftBelowTop`, `Formalism.FourierDecayAlt.JC.LiftTopDiag`, `Formalism.FourierDecayAlt.JC.ThresholdsLift`,
`Formalism.FourierDecayAlt.JC.SumFormConcrete`, `Formalism.FourierDecayAlt.JC.OffDiagonalLiftBoundOfPlaces`);
`Formalism/HermitianCurvature/LowerBlockNormalisedBoundFromComponents.lean`
(`Formalism.FourierDecayAlt.PairingProductCorollary.LeadingBlockSeveralPlacesBound`);
`Formalism/HermitianCurvature/HermitianCurvatureProofs/TheoremPIntegralOfPlaces.lean`
(`Formalism.FourierDecayAlt.P.off_diagonal_lift_bound_of_places`, `Formalism.FourierDecayAlt.P.plane_exponential_bound_of_places`).

### 5.21 The Gram bound for equal words

*Origin:* particular to this proof: the Gram operator of one word is close to the identity in Hilbert–Schmidt norm, so
that the Bessel–Poincaré series is nonzero on new forms.

*Method of the formal proof:* for the degenerate terms the Gelfand–Graev expansion bounds the squared norm by `P_g` times
a sum over ordered pairs of degenerate terms of one row, which the type bound of 5.20d, summed over defects and labels,
makes at most `d_u^{all}·e^{−kf log k}`; for the other terms the pair expansion of 5.20 is used with the identity cell
removed, the loops, non-scalar and non-generic pairs being bounded as there and the scalar generic pairs by a crude row
bound in place of the tower inequality.

Let `u` be a word, `K″(u, u)` the sum of the degenerate non-identity terms of 5.15, and
`Γ₀ = exp(C_Γm⁵f log b)` the factor of ThetaChainsOnDefiniteUnitaryGroups §2.1 (with `C_Γ ≥ max(C_B, C₄) + 1`, `C₄` the constant of 5.18 (i) and `C_B` that of
the crude bound of the route). Assume the hypotheses of 5.20b for the pair `(u, u)` ((St) of 5.20a with `C_l ≥ 40`,
`C_u·log b ≤ m − 1`, `m ≥ C_m`, the window `C₀^{−1} ≤ d_u^{all}Γ₀²/D* ≤ C₀`, `r_S ≥ 1`, `g₀ ≠ g₁`, `C_l m⁶·log b ≤ k·log k`,
`(log f)² ≤ A m²·log b` and `log f ≤ A r_S²` for the constant `A` of 5.20b, and `T(u)` a prime `≥ 3` split completely in `E` and prime
to `g₀g₁`; the conditions on the ratio of the norms and of the Vandermonde products hold with `A = 1`), and: all pairwise
differences of the row parameter `> C_l k m³`; `log f ≤ r_S²`. Then:
(i) for `x ≥ x₀`, `‖K(u, u) − 1 − K″(u, u)‖²_HS ≤ Γ₀·(d_u^{all})²/D*`; (ii) `‖K″(u, u)‖²_HS ≤ d_u^{all}·e^{−kf log k}`; (iii) hence
`‖K(u, u) − 1‖²_HS ≤ e_diag·d_u^{all}` with `e_diag = 2C₀/Γ₀ + 2e^{−kf log k}`; (iv) `D_all ≤ (1 + η_dim)D*` with `η_dim = ε_C` under
the hypotheses of the chain instance of 5.16; (v) `dim ker P_u ≤ ‖K(u, u) − 1‖²_HS`; so if `e_diag < 1 − δ_old(u)`, where
`1 − δ_old(u) = ((T(u) − 2)/(T(u) − 1))^f` is the share of the `T(u)`-new forms `ℳ_0^{new}(u)` of ThetaChainsOnDefiniteUnitaryGroups §3.8, then
`dim P_u(ℳ_0^{new}(u)) ≥ (1 − δ_old(u) − e_diag)·d_u^{all} > 0`: `P_u` is nonzero on the new forms.

*Route.* (i) Remove the identity cell. The loops and the non-scalar generic pairs of corank one contribute at most
`2ε_L·(d_u^{all})²/D*` by the Lemma on loops and non-scalar pairs 5.20b for the pair `(u, u)`, whose hypotheses hold with `A = 1`
(that lemma does not ask the two words to be different; its amplitudes are those of the chain instance of 5.18 (i) for equal
types, 5.20a (c)); the non-generic pairs as in 5.20c; the scalar generic pairs, for which no cut exists, by the crude bound
`exp(C_Bm⁵f log b)·(d_u^{all})²/D*`: their sum is `Σ_c‖Σ_{t∈c}𝐯_t‖²` over the classes `c` (same row, same label), and Cauchy–Schwarz in each
class bounds it by `Σ_t n_sc(t)·‖𝐯_t‖²`, `n_sc(t)` the number of scalar partners of `t` in its row; the pointwise bound 5.18 (i) for equal
types (the type shift; its hypotheses by 5.20a (c)) bounds `‖𝐯_t‖`, the mean value theorem for one nondegenerate Gram matrix
(HermitianFormsAndLattices §6.5 (a)) counts the terms, and the partner count of 5.20b (at most `C^f(H(x)H(y))^{Cr_S²}` classes of generic
partners of corank one with Gram class `y`) bounds `n_sc(t)`; the growth of `n_sc(t)` is absorbed as in 5.20c (b): in each class
the terms are grouped by their Bruhat point and the weighted Cauchy–Schwarz inequality is applied over the points with the
weights `w(γ)` of 5.20c (a), the number of groups of a class at a point being at most `rd_E^{12r_S(r_S+1)f}·T(u)^{12f}` times the
sixth power of the norm of `Gr(γ)` scaled by `rd_E^{−2r_S(r_S+1)}` at each infinite place; the mass of the terms at a point is at
most a power of `(g₀g₁)^f·N(γ)` times the mean number `n(γ)` of 5.17 (the scaled norms are `≥ 1` at the points that occur); and
what remains is the global sum of 5.20c (a) with a fixed exponent `A`, which gives `exp(C_Bm⁵f log b)·(d_u^{all})²/D*` through
the volume identities of 5.20. The count at a point and the constants at the real places use the Siegel–Weil formula
(HermitianFormsAndLattices §6.5); their proofs are not given here. (Counting the terms and bounding the amplitudes one
by one does not suffice: for `M` equal amplitudes `a` in one class the class sum is `M²‖a‖²`, the count gives `M‖a‖²`.) (ii) Degenerate
terms are scalars on each block (5.15 (b)). The expansion of 5.17a, which [FormalProof] has for the family of the degenerate terms
as well, and the orthogonality of the terms of different rows bound `‖K″(u, u)‖²_HS` by `P_g·γ_GG(1)` times the sum of
`‖𝐯_t‖·‖𝐯_{t′}‖` over the ordered pairs of degenerate terms of one row. By 5.20d (d) that sum is at most
`dim V_{λ_u}·W_rows·(Σ_{j=1}^{r_S}A(j))²`; `γ_GG(1)·W_rows·dim V_{λ_u} ≤ d_u^{all}` (5.20b) and `P_g ≤ 2` (`g₀, g₁ ≥ (kb)^8`); and
`2(Σ_jA(j))² ≤ e^{−kf log k}`, because `A(j) ≤ e^{C̃·m⁶·f·log b}(C̃/k)^{j(k−1−j)f}` with `C̃ := 1 + C + C² + C_h² + C_c²` and
`C_l m⁶·log b ≤ k·log k` with `C_l` above a threshold depending on `C̃`.
(iii) `‖K − 1‖² ≤ 2‖K − 1 − K″‖² + 2‖K″‖²` and `Γ₀d_u^{all}/D* ≤ C₀/Γ₀`. (iv) 5.16. (v) On `ker P_u`,
`K(u, u) − 1 = −1`; the new forms have dimension `(1 − δ_old(u))d_u^{all}` (ThetaChainsOnDefiniteUnitaryGroups §3.8). These bounds use neither the seesaw nor any
rational structure.

*Needs:* ThetaChainsOnDefiniteUnitaryGroups §2.1, ThetaChainsOnDefiniteUnitaryGroups §2.3, ThetaChainsOnDefiniteUnitaryGroups §2.8, ThetaChainsOnDefiniteUnitaryGroups §3.8, 5.13c, 5.13, 5.15, 5.16, 5.17a, 5.17, 5.18, 5.20a, 5.20b, 5.20c, 5.20d, 5.20; HermitianFormsAndLattices §§6.4, 6.5.
(i): [FormalProof], `Formalism/LocalToGlobal/SiegelLatticeTheory/FlagStabilizerTensors/RowsPos.lean`
(`Formalism.L2.SG.RowsPos.DiagLP`), `Formalism/LocalToGlobal/SiegelLatticeTheory/CokernelGLCounts/RowsOther.lean`
(`Formalism.L2.SG.RowsOther.DiagRow`), `Formalism/SharpRestriction/CuspSpanNormBounds/NonGenericAndKTwoTheorems.lean`
(`Formalism.MainNotions.NonGenericAndKTwoTheorems.KTwoParameterConditions`); the crude bound for the scalar generic pairs:
`Formalism/LocalToGlobal/SiegelLatticeTheory/FlagStabilizerTensors/RowsPos.lean` (`Formalism.L2.SG.RowsPos.RowMainEqP`),
`Development/AbelianVarietyTheory/Proofs/FlagMeasures/RowMainEqPOfSiegelWeil.lean` (`GlobalTheory.rowMainEqP_of_siegelWeil`),
`Formalism/HermitianCurvature/StatementPN.lean` (`Formalism.FourierDecayAlt.PN.NGChain`),
`Formalism/LocalToGlobal/SiegelLatticeTheory/FlagStabilizerTensors/RootLatticeThresholds/BDataOf.lean`
(`Formalism.L2.SG.Pf.BDat.StepThmBG`); (ii): [FormalProof],
`Formalism/LocalToGlobal/SiegelLatticeTheory/FlagStabilizerTensors/RowsPos.lean` (`Formalism.L2.SG.RowsPos.KppDiagP`),
`Formalism/LocalToGlobal/SiegelLatticeTheory/CokernelGLCounts/RowsOther.lean` (`Formalism.L2.SG.RowsOther.KppDiag`); the passage
from 5.20d: `Formalism/LocalToGlobal/SiegelLatticeTheory/FlagStabilizerTensors/RowsPos.lean`
(`Formalism.L2.SG.RowsPos.kernel_diagonal_positive`), the expansion for the degenerate terms:
`Formalism/LocalToGlobal/SiegelLatticeTheory/CokernelGLCounts/RowsConc.lean` (`Formalism.L2.SG.RowsConc.NormExpDegC`); 5.20 with
(iii) and (iv), in the form in which [FormalProof] assembles them (under the window, with `η_off`, `η_dim` and `√e_diag` at most
`exp(−x^{ε/8})` at every large scale `x`): `Formalism/SharpRestriction/GlobalTheoremInputs.lean`
(`Formalism.MainNotions.LinkS_at`, `Formalism.MainNotions.LinkS`).

### 5.22 Equidistribution of the row labels

*Origin:* particular to this proof: the count (b), by which the number of rows with given labels at a type prime is, up
to the relative error `ε_C`, the expected dimension `D*` times the Bessel-type weights of the labels; it is of the kind of
the classical limit multiplicity theorems with prescribed local behaviour. The weights of (a) are an instance of
FiniteReductiveGroups §5.8 (c).

*Method of the formal proof:* the trace of the Bessel-type idempotent on an irreducible character of `GL_r(𝔽_g)` is
written as a combination with nonnegative coefficients of Whittaker dimensions of parabolic restrictions of the
character, the coefficient of the Whittaker dimension of the character itself being `g^k − g^{k−1}`, which gives
`wt_v ≥ (1 − 1/g)·wt_GG` after division by the values of the idempotents at `1`; the count is the limit multiplicity
formula of 5.16 for the product of the level idempotent with the central idempotent of the tuples, with the other type
prime as auxiliary prime.

*Setting.* Let `g = g_i` be a type prime (`i ∈ {0, 1}`), `v | g`, and number the
coordinates of `GL_r(𝔽_g)` by `1, …, r` in the basis `(e_1, …, e_{r_S}, β_1, …, β_k, z_m, f_{r_S}, …, f_1)` of ThetaChainsOnDefiniteUnitaryGroups §2.9 (the basis
`b_v` with `z_m` moved behind `β`), the pairings being read on both factors of `E_v = E_w × E_{w̄}`; the *chain* is `{1, …, r_S} ∪ {r_S + k + 1, …, r}` and the *block* is
`W = {r_S + 1, …, r_S + k}`. Let `B ⊂ U_r(𝔽_g)` be the group of upper unitriangular matrices `u` with `u_{a, r_S+k+1} = 0` for
`a ∈ W`, and `ψ_B(u) = ψ_g(Σ u_{c,c′} + Σ_{a=r_S+1}^{r_S+k−1} u_{a,a+1})`, the first sum over the pairs `c < c′` of consecutive
elements of the chain (`2r_S` entries); `B` has index `g^k` in `U_r(𝔽_g)`. The level `(K₂, χ₂)` of ThetaChainsOnDefiniteUnitaryGroups §2.9a at `v` is the inverse
image of `(B, ψ_B)` under reduction modulo `g` in this basis, and `(B, ψ_B)` is the pair `(H_{r_S}, ϕ_{r_S})` of
FiniteReductiveGroups §2.7 (b) for `n = r` and the same `k` (RowTowerAndRallisIdentities §5.3 (v)). For a label `𝔣` at `v` put
`wt_v(𝔣) = (𝟙_{K₂,χ₂,v} ∗ Π_𝔣)(1)/𝟙_{K₂,χ₂,v}(1)`, the share of the series of `𝔣` in `Ind_B^{GL_r(𝔽_g)}ψ_B`, and let
`wt_GG(𝔣)` be the Gelfand–Graev weight of FiniteReductiveGroups §5.8 (a)
(`1/∏_{P|𝔣}(g^{deg P} − 1)` on squarefree labels).

*Statement.* (a) *Weights.* `wt_v(𝔣)` is the share of the series of `𝔣` in the Bessel-type induced representation
`Ind_{H_{r_S}}^{GL_r(𝔽_g)}ϕ_{r_S}` (FiniteReductiveGroups §5.8 (c)). Hence for every label `𝔣`,
`wt_v(𝔣) ≥ (1 − 1/g)·wt_GG(𝔣)`, with equality for every irreducible `𝔣`; the labels that are not squarefree have total
weight `≤ 3/g`; and `wt_v(𝔣) ≤ ∏_j(1 + g^{−d_j})·wt_GG(𝔣)` for squarefree `𝔣` with factors of degrees `d_j`.
The equality for irreducible labels and the bound `3/g` are this roadmap's own, not
on the path of [FormalProof], whose form is the lower bound for every label and `wt_v(𝔣) ≤ (1 + 1/g)^r·wt_GG(𝔣)` for
squarefree `𝔣`; only the lower bound is used.
(b) *Count.* For every set `S` of label tuples at `g_i`: `dim Π_S·ℋ = (1 ± ε_C)·D*·Σ_{t∈S}∏_{v|g_i} wt_v(t_v)`, under the
hypotheses of the chain instance of 5.16 and `g₁ > 4r` (for `i = 0` the route applies 5.16 with `g′ = g₁`).

*Route.* (a) `wt_v(𝔣)` is `(e_{B,ψ_B}·Π_𝔣)(1)/e_{B,ψ_B}(1)`, which is the share `wt_H` of FiniteReductiveGroups
§5.8 (c) for `(H_{r_S}, ϕ_{r_S})`, `q = g`, `n = r`. That statement gives the lower bound `(1 − q^{−1})·wt(𝔣)`, the formula
`wt_H(𝔣) = wt(𝔣)·((1 − q^{−1})Σ_{j<k}c_jq^{−j} + c_kq^{−k})` on squarefree labels (equality on the left iff no sum of some of the
degrees `d_j` lies in `[1, k]`, which holds for an irreducible label of degree `r > k`), the upper bound, and the total share
`≤ 3/q` of the labels that are not squarefree; it rests on the decomposition of Bessel-type induced representations (FiniteReductiveGroups §2.7 (b):
`Ind_{H_i}ϕ_i ≅ Γ_{(k,n−k)} ⊕ ⊕_{j=1}^{k−1}(q^{k−j} − q^{k−j−1})·Γ_{(j,n−j)} ⊕ (q^k − q^{k−1})·Γ_n`, with the degenerate Gelfand–Graev
representations `Γ_{(j,n−j)}` of the wider form of FiniteReductiveGroups §2.6 (c); so the multiplicity of every irreducible representation in `Ind_{H_i}ϕ_i` is at
least `(q^k − q^{k−1})` times its multiplicity in the Gelfand–Graev representation, with equality for the cuspidal ones, FiniteReductiveGroups
§2.7 (c)) and on the Gelfand–Graev weights `wt = wt_GG` of FiniteReductiveGroups §5.8 (a). (b) `𝟙_{K₂,χ₂} ∗ Π_S` is an admissible idempotent in the sense of 5.16: in the
group algebra of `G₀` (the functions bi-invariant under the congruence subgroup) the image of the level idempotent is
`e_{P_1,χ_{P_1}}` and `Π_S` is central, so their product is a self-adjoint idempotent, hence of positive type, supported in
`GL_r(𝒪_v)` and invariant under `K(g_i)_v`; at the places above the other prime `g_{1−i}` the factor of `Π_S` is
`Σ_𝔣Π_𝔣 = 1`, so the product has there the support of `e_{P_1,χ_{P_1}}`, a group of unipotent matrices, and `g_{1−i}` splits
completely in `E`. So 5.16 applies with `g′ = g_{1−i}`, and `D*(𝒟, 𝟙 ∗ Π_S)/D* = (𝟙 ∗ Π_S)(1)/𝟙(1) = Σ_{t∈S}∏_v wt_v(t_v)`.
Nothing below uses the upper bound of (a).

*Needs:* ThetaChainsOnDefiniteUnitaryGroups §2.9, ThetaChainsOnDefiniteUnitaryGroups §2.9a, RowTowerAndRallisIdentities §5.3, 5.16; the wider form of FiniteReductiveGroups §2.6 (c) (degenerate Gelfand–Graev representations of
`GL_n`), §2.7 (b), (c) (the decomposition of Bessel-type induced representations, the multiplicity inequality), §5.7, §5.8 (a), (c)
(Gelfand–Graev weights; shares of labels in the Bessel-type induced representations).
(a) is an instance of FiniteReductiveGroups §5.8 (c).
The lower bound of (a) and the Gelfand–Graev weight on squarefree labels: [FormalProof],
`Formalism/SharpRestriction/LevelLetterCocycles/ArithmeticCylinders.lean` (`Formalism.MainNotions.ArithmeticCylinders.admLq`);
(b): [FormalProof], `Formalism/LocalToGlobal/GlobalTheory/IrreducibleOfCountSizes.lean`
(`Formalism.L2.GlobalTheoryTheory.ConcN.CountAllRows`).

*Checks.*
- `k = 1`, `r = 2` (`r_S = 0`): `B = 1`, `Ind_1ψ_B` is the regular representation, which is `Γ_{(1,1)} ⊕ (g − 1)·Γ_ψ`
  (degrees: `g` copies of `|GL₂|/|U| = (g − 1)(g² − 1)`); an irreducible label has ratio `wt_v/wt_GG = 1 − 1/g`, a split
  squarefree label `(1 − 1/g) + 2/g = 1 + 1/g`.
- The labels at `g_i` cannot be counted with unipotent support at `g_i` itself: `Π_S` is not supported on unipotent
  elements modulo `g_i` (for `S` the irreducible labels it is a combination of cuspidal characters, which do not vanish
  on elliptic elements). This is why the level has two type primes.
- Summing the identity over all tuples gives `D_all = (1 ± ε_C)D*`, the chain instance of 5.16: the weights of the
  labels at one place sum to `1` because the `Π_𝔣` sum to `1`.

### 5.23 Good rows

*Origin:* adapted from the statistics of factorisation types of random polynomials over a finite field (Flajolet and
Sedgewick (2009), Example I.20, Note I.66 and Example VII.4): the share of the
rows whose labels are not good is small; the embedding (v) (1) in copies of the regular representation, from a group
determinant, is particular to this proof.

*Method of the formal proof:* the bad tuples are covered by five events whose probabilities for the product of the
Gelfand–Graev weights are bounded by a union bound over the places or by the `f`-th power of a one-place probability, and
the passage to the weights of the level uses only `wt_v ≥ (1 − 1/g)·wt_GG` and Bernoulli's inequality; for (v) (1)
twisted traces embed `V` equivariantly in copies of the regular representation of `H`, indexed by a basis of the
`H`-invariants of `V₁`, and the number of copies is bounded through an embedding into `V₂`, both maps being injective
because the group determinant of `u` is not a zero divisor; for (vi) orbit representatives of the free action identify
`V` with a sum of copies of the regular representation.

(i) With `W_i = Σ_{t bad at g_i}∏_{v|g_i} wt_v(t_v)` (bad: not good, RowTowerAndRallisIdentities §5.3 (iii)),
`δ_bad ≤ ((1 + ε_C)/(1 − ε_C))·(W_0 + W_1)` under the hypotheses of the chain instance of 5.16 and `g₁ > 4r`.
(ii) Let `g = g_i` (a prime), the type characters `χ_{v,j}` (`m` at each place `v | g`, ThetaChainsOnDefiniteUnitaryGroups §2.4(b)) read in `𝔽_g^×`, bad meaning not
good in the sense of RowTowerAndRallisIdentities §5.3 (iii), and assume `r ≥ 100` (ThetaChainsOnDefiniteUnitaryGroups §2.1), `g ≥ 2^{12}`, `q ≠ d` odd primes with `max(q, d) ≥ 16` (the primes of
the two auxiliary imaginary quadratic fields of the host, Conventions), and `16qd | g − 1` (ThetaChainsOnDefiniteUnitaryGroups §2.7 gives `16qd | g_i − 1` and
`g_i ≥ 2^{12}` for the hosts with `n ≥ 2`; FrobeniusRestrictedRieszSums §0.9 (ii) gives `max(q, d) ≥ 16`). Let `W_i^{GG}` be the sum, over the
tuples at `g_i` that are bad, of the products of the Gelfand–Graev weights `wt_GG`. Then
`W_i^{GG} ≤ 2f/g + 23f·log g/√g + 2fm(1/(4 min(q, d)) + (1 + log r)/(g − 1)) + (r/2)(7/8)^f + exp(−f/(5 log r))` and
`W_i ≤ W_i^{GG} + f/g`; so both are at most
`W^{bd}(f, m, r, g) := 3f/g + 23f·log g/√g + 2fm(1/(4 min(q, d)) + (1 + log r)/(g − 1)) + (r/2)(7/8)^f + exp(−f/(5 log r))`.
(iii) If moreover `0 < ε′ ≤ 1`, `ε_C ≤ 1/2`, `g_i ≥ e^{8x^{ε′}}`, `f ≥ x²`, `min(q, d) ≥ e^{x^{ε′/6}}` (`SizeQD` of ThetaChainsOnDefiniteUnitaryGroups §2.1 gives it with
`ε′ = ε/J`) and `r, m, f ≤ x^C`, then
for `x ≥ x₀(ε′, C)`:
`δ_bad ≤ e^{−x^{ε′/7}}`, and `D_rows ≥ (1 − δ_bad)D_all ≥ (1 − δ_bad)(1 − ε_C)D* > 0`.
(iv) *Bad part of a type space.* Let `Γ` be a finite group with a surjection
`π : Γ → G₀ = ∏_{i∈{0,1}}∏_{v|g_i} GL_r(𝔽_{g_i})` and a homomorphism `ι : G₀ → Γ` such that `π∘ι = 1` and `ι(G₀)` commutes with
`ker π` (so `Γ = ker π × ι(G₀)`), `ρ` a representation of `Γ`, `(P, λ)` a Whittaker datum of `G₀` (upper unitriangular groups, a
nondegenerate character), `type = Hom_{π^{−1}P}(λ, ρ)` and `bad = type ∩ ker Π_good`,
`Π_good` acting on `ρ` through `ι`. If for `i ∈ {0, 1}` the restriction
of `ρ` to `π^{−1}(H_i)` (`H_i` the elements unitriangular at the places not above `g_i`) embeds in `n_i` copies of its
regular representation with `n_i·|π^{−1}H_i| ≤ c·|π^{−1}P|·dim(type)`, then
`dim(bad) ≤ c·(W_0^{GG} + W_1^{GG})·dim(type)`; under the hypotheses of (ii), `W_i^{GG} ≤ W^{bd}(f, m, r, g_i)`.
(v) *Embedding in regular representations from a group determinant.* Let `k` be a field of characteristic zero with an
embedding in `ℂ`, `B` a commutative `k`-algebra, and `Γ` a finite group acting on `B` by `k`-algebra automorphisms `f ↦ γ·f`.
For a subgroup `H ⊂ Γ` and `u ∈ B`, the *group determinant* of `u` for `H` is `det(hg·u)_{h,g∈H} ∈ B`. Let `H₀, H ⊂ Γ` be
subgroups and `u₀, u ∈ B` elements whose group determinants for `H₀`, respectively `H`, are not zero divisors of `B`. Let
`V_m, V, V₁, V₂ ⊂ B` be `k`-subspaces with `V` and `V₂` finite-dimensional, `V` stable under `Γ`, `V₁` stable under `H`,
`V_m·(h·u₀) ⊂ V` for `h ∈ H₀`, and `V·(h·u) ⊂ V₁`, `V₁·(h·u) ⊂ V₂` for `h ∈ H`. Then:
(1) the representation of `H` on `V` embeds `H`-equivariantly in `n` copies of the regular representation of `H`, for some `n`
with `n·|H| ≤ dim_k V₂`;
(2) `dim_k V_m ≤ |H₀|·dim_ℂ(V ⊗_k ℂ)^{(H₀,λ)}` for every character `λ` of `H₀`, the exponent denoting the subspace on which `H₀`
acts by `λ`;
(3) if `dim V₂ ≤ c·dim V_m` for a real `c ≥ 0`, then for every character `χ` of `Γ`, the representation `ρ(γ) := χ(γ)·(γ ⊗ 1)` of
`Γ` on `V ⊗_k ℂ` and every character `λ` of `H₀`: `ρ|_H` embeds in `n` copies of the regular representation of `H` with
`n·|H| ≤ c·|H₀|·dim ρ^{(H₀,λ)}`. This is the hypothesis of (iv) for `π^{−1}H_i = H` and `π^{−1}P = H₀`, with the constant `c`.
(vi) *Free permutation.* Let `ρ` be a representation of a finite group `Γ` on a finite-dimensional space `V` over a field of
characteristic zero, `H ⊂ Γ` a subgroup acting freely on a finite set `X`, and `V = ⊕_{x∈X}A_x` a direct sum decomposition with
`ρ(h)A_x ⊂ A_{hx}` for `h ∈ H`. Then `ρ|_H` embeds in `n` copies of the regular representation of `H` with `n·|H| = dim V`, and
`|H₀|·dim ρ^{(H₀,λ)} = dim V` for every subgroup `H₀ ⊂ H` and every character `λ` of `H₀`. So the hypothesis of (iv) holds for
`(H, H₀)` with `c = 1`, with equality.

*Route.* (i) A bad row is bad at `g₀` or at `g₁`; count each with 5.22 (b) and divide by `D_all ≥ (1 − ε_C)D*` (5.16).
(ii) The Gelfand–Graev weight is a probability measure on labels, equal on squarefree labels to the law of the
factorisation type (FiniteReductiveGroups §5.8 (a)), and the weight of a tuple is a product over the
`f` places above `g`; the five terms bound, in order: labels not squarefree at one of the `f` places; two roots with the
same `ℓ`-prime part for a prime `ℓ` outside `𝔅(r, g)` (outside `𝔅` such coincidences are rare, `≤ g^{3δ/4}` and `g^{δ/4}` per
degree `δ`); a root with the same `ℓ`-prime part as one of the `m` tame characters or their inverses for some `ℓ ≠ g` (for
roots in `𝔽_g` this is `Σ_{ℓ | g−1} ℓ^{v_ℓ(g−1)}/(g − 1) ≤ 1/(4 min(q, d))`: the prime-power parts `P_i` of `g − 1` include `2^a ≥ 16`, a power of `q`
and a power of `d`, and `Σ_i 1/∏_{j≠i}P_j < 1/(4 min(q, d))`); a factor of degree `a` at all
`f` places, for some `a ≤ r/2` (each place has such a factor with probability `≤ 7/8`); no factor of prime degree in
`(r/2, r − 3]` at any place (such a factor occurs with probability `≥ 1/(5 log r)`). Transfer: two probability measures
with `wt_v ≥ (1 − 1/g)wt_GG` differ by at most `1/g` in total variation, and products over `f` places by at most `f/g`; only
the lower bound of 5.22 (a) is used. (iii) Insert the sizes. (iv) Inside `n_i` copies of the regular representation of
`π^{−1}H_i`, the `(P, λ)`-part of the series of a tuple `t` has dimension `n_i|π^{−1}H_i|/|π^{−1}P|` times the Gelfand–Graev
share of `t` (FiniteReductiveGroups §5.8 (a): representations contained in copies of the regular
representation, and products over the places). (v) (3): by (1) and (2),
`n·|H| ≤ dim V₂ ≤ c·dim V_m ≤ c·|H₀|·dim(V ⊗ ℂ)^{(H₀,λχ^{−1})}`; multiplying the action by the character `χ` changes neither the
existence of an embedding in `n` copies of the regular representation (the regular representation is unchanged by a twist) nor
the dimension count, the `λ`-part of `ρ` being the `λχ^{−1}`-part of the untwisted action. (2) is the injectivity of the twisted
traces `f ↦ (Σ_{h∈H₀}λ(h)^{−1}·h·(f·(g·u₀)))_{g∈H₀}` from `V_m ⊗ ℂ` into `|H₀|` copies of the `λ`-part of `V ⊗ ℂ`: a vector killed
by the matrix `(hg·u₀)` is killed by its determinant. The proof of (1), which is the statement particular to this proof
(for a non-abelian `H` it does not follow from the twisted traces of characters), is not given here. (vi) A free orbit of summands is a representation
induced from the trivial subgroup; the proof is not given here.
A second route to `𝔼 ≠ 0` goes through good forms on the definite inner form `U(W_m)` and the multiplicity
comparison RowTowerAndRallisIdentities §5.9.

*Needs:* RowTowerAndRallisIdentities §5.3, 5.16, 5.22, ThetaChainsOnDefiniteUnitaryGroups §2.7, ThetaChainsOnDefiniteUnitaryGroups §2.9, ThetaChainsOnDefiniteUnitaryGroups §2.9a; FiniteReductiveGroups §§5.7, 5.8. *Sources:* (statistics of the factorisation type of a random polynomial, as of
the cycle type of a random permutation).
(i): [FormalProof], `Formalism/LocalToGlobal/GlobalTheory/ConcNP.lean` (`Formalism.L2.GlobalTheoryTheory.ConcN.delp_of_allRows`),
`Formalism/PadicSubsetSums/CentralIdempotents/EigenbasisOfDistinctRoots.lean`
(`Formalism.IrreducibleCountingLemmas.GaloisIrreducibility.ShareFromCount`); (ii): [FormalProof],
`Formalism/LocalToGlobal/GlobalTheory/ConcNWeight.lean` (`Formalism.L2.GlobalTheoryTheory.ConcNWeight.locShare_le_Wg`),
`Formalism/LocalToGlobal/GlobalTheory/IrreducibleOfCountSizes.lean` (`Formalism.L2.GlobalTheoryTheory.ConcN.Wg`),
`Formalism/LocalToGlobal/GlobalTheory/ConcNWeight.lean` (`Formalism.L2.GlobalTheoryTheory.ConcNWeight.RangeW`); (iii): follows
from [FormalProof],
`Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/LocalShareCountLeExp.lean`
(`GlobalTheory.CovTop.LocShareNum.local_share_count_le_exp_alt`); (iv): [FormalProof],
`Development/AbelianVarietyTheory/Proofs/DivisorProofs/BadPartDimLeSumLocalSharesWhittakerStatement.lean`
(`GlobalTheory.T.bad_part_dim_le_sum_local_shares_whittaker`); (v): [FormalProof],
`Development/AbelianVarietyTheory/Proofs/DivisorProofs/EmbedsInRegularRepresentationCopiesOfGroupDetermStatement.lean`
(`GlobalTheory.T.embedsInRegularRepresentationCopies_of_groupDeterminant`),
`Development/AbelianVarietyTheory/Proofs/DivisorProofs/FinrankLeCardMulFinrankCharacterSpaceBaseChangeStatement.lean`
(`GlobalTheory.T.finrank_le_card_mul_finrank_characterSpace_baseChange`),
`Development/AbelianVarietyTheory/Proofs/DivisorProofs/EmbRegCountOfRanks.lean` (`GlobalTheory.BadCount.embReg_count_of_ranks`);
(vi): [FormalProof], `Development/AbelianVarietyTheory/Proofs/DivisorProofs/EmbedsInRegularRepresentationCopiesOfFreePermute.lean`
(`GlobalTheory.BadCount.embReg_of_free_permuted_summands`).

*Checks.*
- The conditions of (ii) on the type primes can be met: for `q = 19`, `d = 526679` (`d ≡ 7 (mod 16)`; every prime `≤ 19`
  splits in `ℚ(√−d)`), `g = 1136944064017` is a prime with `g ≡ 1 (mod 16qd)`, `g ≥ 2^{12}`, and `g = a² + ab + ((d + 1)/4)b²`
  with `(a, b) = (1053131, 456)`, a norm from the ring of integers of `ℚ(√−d)`.
- With one place above `g_i` (`f = 1`) the term `(r/2)(7/8)^f` is of size `r`, and condition (4) of RowTowerAndRallisIdentities §5.3 fails for a
  positive proportion of labels: good tuples need many places, which is why the share is small only for `f` large.
- The term `2fm/(4 min(q, d))` cannot be dropped for a general type prime: if `(g − 1)/2` is prime, the roots of degree one
  of prime-power order relative to a tame character have expected number about `1/2`; `16qd | g − 1` with `q, d` large
  bounds every prime-power part of `g − 1` by `(g − 1)/min(q, d)`.

### Examples

These instances are worked in the Checks of the targets cited.

- For `r_S = 0` (`m = 2`) the unipotent group is trivial, `S_{z′} = U_{z′} ≅ U(k)` is compact and `ψ_{z′} = 1`, and 5.13c (d) with 5.13d (e) says that `π` occurs exactly once in the restriction of `D` to `U(k)`: the codimension-one branching of discrete series of `U(k, 1)` (5.13, Checks). In the same case `Gr(γ) = |⟨γz_{u′}, z_u⟩|² − T(u)T(u′) ≥ 0` is the reverse Cauchy–Schwarz inequality for two negative vectors, with equality exactly when `γz_{u′}` is proportional to `z_u` (5.15, Checks).
- With `S = S′ = {1}` and `V = V′ = ℂ`, the functions `W = √d·⟨b, σ(·)w⟩` and `W′ = √d·⟨b′, σ(·)w⟩` for unit vectors `b, b′` with integrable coefficients satisfy the hypotheses of 5.15a, `O(γ) = ⟨b, σ(γ)b′⟩`, and `∫_𝐆|⟨b, σ(γ)b′⟩|²dγ = 1/d`: the inequality of 5.15a is an equality (5.15a, Check).
- For a cocompact torsion-free lattice and an integrable discrete series the multiplicity is exactly `d(π)·covolume` (Langlands): the error term of 5.16 is the price of the non-compact quotient (5.16, Checks).
- For `k = 1`, `I = ∏_𝔭 𝔽_𝔭^×`, `γ_GG = ∏_𝔭(N𝔭 − 1)·𝟙_{\{1\}}`, the expansion of 5.17a has no cross terms and `‖Σ a_t‖² = γ_GG(1)Σ_i‖v_i‖²`; on `GL₂(𝔽_q)` the top eigenvalue of convolution by the Gelfand–Graev character is `γ_GG(1)·(1 − q^{−1})^{−1}`; and `q = 2` is excluded because `∏_{i=1}^{2}(1 − 2^{−i})^{−1} = 8/3 > 1 + 3/2` (5.17a, Checks).
- Over `ℚ_3(i)` the lattice `⟨3, 3⟩` has one Jordan constituent of positive scale, of rank two, so its corank is `c_𝔭 = 2` and the local density is `96`, where counting constituents would give `128`; at an odd split prime `p | g` with `r_S = 0`, `g = 3` and `T = 1`, the two frames and the divided basis give the determinants `−99` and `−11` (5.17, Checks).
- For `u = u′`, `qdet(Y) = −T·T′∏_i(Y + ½ + u_i)² ≤ 0` on `ℝ`, so there is no cut and 5.18 (i) needs the type shift for equal types; a single site has quantum determinant `1`, and multiplication by `e_s` acts on it exactly as the wave (5.18, Checks).
- For `L = 0`, one level and a diagonal kernel `Kr_1`, the tower inequality 5.19 is the Poisson step for one pivot, `Σ_ρ‖Σ_pc_ρ(p)V(p)‖² ≤ (1 + C(C/Θ)^f)(1 + e_1)𝔧` (5.19, Checks).
- For `k = 1`, `r = 2` (`r_S = 0`) an irreducible label at `g` has `wt_v/wt_GG = 1 − 1/g` and a split squarefree label has `1 + 1/g` (5.22, Checks); the pair `q = 19`, `d = 526679` and the prime `g = 1136944064017`, with `g ≡ 1 (mod 16qd)`, meet the conditions of 5.23 (ii) (5.23, Checks).

### Dependencies

ThetaChainsOnDefiniteUnitaryGroups §§2.1, 2.2, 2.3, 2.3b, 2.3c, 2.4, 2.7, 2.8, 2.9, 2.9a, 2.9b, 3.8 (the data of the chain); RowTowerAndRallisIdentities §§5.1, 5.2a, 5.3, 5.9 (the row spaces); FrobeniusRestrictedRieszSums §§0.1, 0.4, 0.9 (the hosts and the auxiliary pair); HermitianFormsAndLattices §§4.1, 4.4, 4.8–4.11, 5.1, 5.2, 5.5–5.7, 5.9, 6.0b, 6.1, 6.1a, 6.1d, 6.2–6.5; SlopesOfHermitianVectorBundles §3.2; DiscreteSeriesCoefficientsAndAutomorphicMetrics §§2.4a, 2.4b, 8.3, 9.1; TensorInductionAndFiniteGroupInputs §9.1; PositivityOfDirichletSeriesWithKernels §§7.1, 8.1, 8.2; FiniteReductiveGroups §§2.2, 2.4–2.7, 5.7, 5.8. On main: AutomorphicFormsOnReductiveGroups §2.4; AutomorphicSpectralTheory §4.5; VonNeumannAlgebras Layer 9; RealSemisimpleLieGroups §§3.2, 3.3, 4.2, 4.3; AdelicAlgebraicGroups §§2.3, 3.1, 3.4, 3.5; GeometryOfNumbersAndQuadraticArithmetic §4.4; AnalyticNumberTheoryPartI §2.15; AnalyticNumberTheoryPartII §5.3k; RepresentationTheory/LieGroups Layer 9; ClassicalGroups §§6.1, 6.3–6.6; RepresentationTheory/CompactGroups Layers 2 and 4; RepresentationTheory/LieHighestWeight Layer 7. Also GanGrossPrasadUnitaryGroups 1.2, 1.3, 2.6, 3.9 and 4.1, Mathlib and Tau Ceti.

## Downstream consumers

In the family [RiemannHypothesisForDirichletLFunctions](../README.md): [SeesawForThetaChains](../SeesawForThetaChains/README.md) consumes the Bessel–Poincaré series of 5.14 and the bounds of 5.21 in its seesaw identity; [ThetaChainsAndFrobeniusPrimeSums](../ThetaChainsAndFrobeniusPrimeSums/README.md) consumes the dimension formula 5.20a, the Gram bounds 5.20 and 5.21 and the good rows 5.23 for the nearly tight frame of SlopesOfHermitianVectorBundles §5.5 that the Bessel–Poincaré series of the chain form; [ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties](../ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties/README.md) consumes 5.22, the bounds of 5.23 (ii)–(iv) for the bad part of a type space, and 5.23 (v), (vi), which give the multiplicity hypothesis of 5.23 (iv) in ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19 (b); [CongruenceModulesOfThetaLifts](../CongruenceModulesOfThetaLifts/README.md) and [GluedTargetAndDivisionInequality](../GluedTargetAndDivisionInequality/README.md) use the notation of 5.13–5.19.

ThetaChainsAndFrobeniusPrimeSums §10.6 fixes the order of the quantifiers that the Conventions above describe (the constants named before `ε`, the numbers that may depend on `ε`, then the scale `x`); [UniformWildKernelBounds](../UniformWildKernelBounds/README.md) §7.6 gives the window constant `J` at the parameters of the chain.

## Scope and ownership

This sub-roadmap of [RiemannHypothesisForDirichletLFunctions](../README.md) is independently definitive.

This roadmap owns the targets 5.13a–5.23 of Layer 5 of the family: the Bessel theory of gapped discrete series of `U(p, q_S)` at a real place (the big cell, the Bessel integral and its pairing, the majorant, bounded Bessel maps, rank one of the Bessel form and its detection of the Bessel maps, existence of Bessel maps for gapped parameters in the interlacing pattern (the case of GanGrossPrasadUnitaryGroups §3.9 made explicit in Harish-Chandra parameters), the transfer coefficients and the Bessel function of a word); the Bessel–Poincaré series and the geometric expansion of their Gram operators; relative Schur orthogonality; limit multiplicity of discrete series with an error uniform in rank, field, level and weight; the Gelfand–Graev expansion at the type primes, the local kernels of decorated cokernels with their germ identity and periodic majorants, the local model of the chain and the mean value formula for the rows; the archimedean transfer matrices of Capelli operators, the level forms, the Fourier majorants, the blocks, level zero and the pointwise bound for the orbital integrals; the tower inequality; the Gram bounds for distinct and for equal words; and the equidistribution of the row labels with the share of the good rows.

Not owned here. The targets of Layer 5 before these (the row spaces, the row tower, the Rallis identities and the rational structure of the rows) are RowTowerAndRallisIdentities §§5.1–5.12 ([RowTowerAndRallisIdentities](../RowTowerAndRallisIdentities/README.md)); the data of the chain (sizes, words and types, type and level primes, levels, source lattices) are [ThetaChainsOnDefiniteUnitaryGroups](../ThetaChainsOnDefiniteUnitaryGroups/README.md) Layers 2 and 3; the hosts and the auxiliary pair are [FrobeniusRestrictedRieszSums](../FrobeniusRestrictedRieszSums/README.md) Layer 0. Hermitian lattices, genera, masses, local densities, Siegel's main theorem, the volumes of stabilisers and the volume identity `vol([U(V)]) = mass(𝒪_E^n)` in the compact-dual normalisation (§6.2 (c), used for `Y_0` in the Conventions and in 5.20a (a)) are [HermitianFormsAndLattices](../HermitianFormsAndLattices/README.md) Layers 4–6; the canonical filtration is [SlopesOfHermitianVectorBundles](../SlopesOfHermitianVectorBundles/README.md) §3.2; the lowest-`K`-type coefficients of gapped discrete series of `U(p, q)`, their tensor products with the standard representation, the formal degree and trace class on the cuspidal spectrum are [DiscreteSeriesCoefficientsAndAutomorphicMetrics](../DiscreteSeriesCoefficientsAndAutomorphicMetrics/README.md) §§2.4a, 2.4b, 8.3, 9.1; the identities of quantum minors are [TensorInductionAndFiniteGroupInputs](../TensorInductionAndFiniteGroupInputs/README.md) §9.1; Laplace's method in several variables and stationary phase over `ℂ^n` and over non-archimedean rings are [PositivityOfDirichletSeriesWithKernels](../PositivityOfDirichletSeriesWithKernels/README.md) §§7.1, 8.1, 8.2; Gelfand–Graev representations, Bessel-type induced representations and the weights of labels of `GL_n(𝔽_q)` are [FiniteReductiveGroups](../FiniteReductiveGroups/README.md) Layers 2 and 5. On main: discrete series of real reductive groups are [AutomorphicFormsOnReductiveGroups](../../AutomorphicFormsOnReductiveGroups/README.md) §2.4; finite multiplicity in the discrete spectrum is [AutomorphicSpectralTheory](../../AutomorphicSpectralTheory/README.md) §4.5; coefficient maps, Schur orthogonality and the formal degree of square-integrable representations are [VonNeumannAlgebras](../../VonNeumannAlgebras/README.md) Layer 9; the open big cell, the Bruhat decomposition, the parabolic double cosets and the Langlands decomposition are [RealSemisimpleLieGroups](../../RealSemisimpleLieGroups/README.md) §§3.2, 3.3, 4.2, 4.3; the Cartan, Iwasawa and `KAK` decompositions are [RepresentationTheory/LieGroups](../../RepresentationTheory/LieGroups/README.md) Layer 9; the branching rule `GL_n ↓ GL_{n−1}`, Gelfand–Tsetlin patterns and the Capelli generators are [RepresentationTheory/ClassicalGroups](../../RepresentationTheory/ClassicalGroups/README.md) §§6.1, 6.3–6.6; Schur orthogonality for `U(k)` is [RepresentationTheory/CompactGroups](../../RepresentationTheory/CompactGroups/README.md) Layers 2 and 4; the Harish-Chandra isomorphism is [RepresentationTheory/LieHighestWeight](../../RepresentationTheory/LieHighestWeight/README.md) Layer 7; rational quotients, Iwasawa integration, adelic reduction and algebraic heights are [AdelicAlgebraicGroups](../../AdelicAlgebraicGroups/README.md) §§2.3, 3.1, 3.4, 3.5; the transference bound for the covering radius is [GeometryOfNumbersAndQuadraticArithmetic](../../GeometryOfNumbersAndQuadraticArithmetic/README.md) §4.4; the residue bound for Dedekind zeta functions is [AnalyticNumberTheoryPartI](../../AnalyticNumberTheoryPartI/README.md) §2.15; quotient measures, integration in stages and unfolding are [AnalyticNumberTheoryPartII](../../AnalyticNumberTheoryPartII/README.md) §5.3k. The Bessel data of a pair of unitary groups and their transport, multiplicity one of Bessel models over a local field, the real tempered theorem of the local Gan–Gross–Prasad conjecture and the global Bessel periods are GanGrossPrasadUnitaryGroups 1.2, 1.3, 2.6, 3.9 and 4.1.

## Exact supplier contracts

### From ThetaChainsOnDefiniteUnitaryGroups, a sub-roadmap of this family

- §§2.1, 2.3, 2.3b, 2.3c: the size conditions, the words with their types, the parameters `v(τ)`, `e′(τ)`, the conditions (W1)–(W6), `h_gap`, `SizeGap` and the tops. Used in 5.13, 5.16, 5.20a, 5.20d, 5.20, 5.21.
- §§2.2, 2.4, 2.7, 2.8: the spaces `X_0`, `Y_0` with a unimodular lattice, the type characters, the type primes, the level primes `T(u)` with their congruence modulo `(g₀g₁)²` and the rank window. Used in 5.17d, 5.17, 5.20a, 5.20b, 5.20d, 5.20, 5.21, 5.23.
- §§2.9, 2.9a, 2.9b: the levels at the bad places, the finite group `G₀`, the row type level `(K₂, χ₂)` with `ψ_g`, `χ_N`, `χ_L`, the elements `x_u` and the column levels `K_u`. Used in 5.14, 5.16, 5.17a, 5.17d, 5.17, 5.20a, 5.20b, 5.22, 5.23.
- §3.8: the spaces `ℳ_0(u)`, their dimensions `d_u^{all}`, `d_u` and the forms new at `T(u)`. Used in 5.14, 5.20a, 5.20b, 5.20, 5.21.

### From RowTowerAndRallisIdentities, a sub-roadmap of this family

- §5.3: the row spaces `ℋ`, `𝔼`, the projector coefficient `e_𝒟`, the cusp forms of the row type level, `D*`, `D_all`, goodness (iii) and the row type level as finite-group data (v). Used in 5.13a, 5.13, 5.14, 5.16, 5.18, 5.20a, 5.20, 5.22, 5.23.
- §5.1 (the discrete series `𝒟_τ`), §5.2a (the integrated right action), §5.9 (the multiplicity comparison, for the second route to `𝔼 ≠ 0` in 5.23). Used in 5.13, 5.23.

### From FrobeniusRestrictedRieszSums, a sub-roadmap of this family

- §§0.1, 0.4, 0.9 (ii): the hosts, the auxiliary pair `(q, d)` and `max(q, d) ≥ 16`. Used in 5.23.

### From HermitianFormsAndLattices, a sub-roadmap of this family

- §4.1 (Jordan splittings), §4.8 (discriminant forms `A_L`, the invariant `t(L)` of (b)), §4.9 (gluing along discriminant forms). Used in 5.17d, 5.17.
- §4.4 (maximal lattices), §4.10 (sublattices of given index), §4.11 (integral lattices meeting two orthogonal subspaces), §5.9 (subspaces carrying an integral lattice of given discriminant). Used in 5.20b; §4.4 also in 5.20d.
- §§5.1, 5.2 (finiteness, stabilisers, Minkowski's bound, sufficiently small levels). Used in 5.15.
- §5.5, §5.6 (c), §5.7 (c) (mass, index formula, dimension of spaces of algebraic modular forms). Used in 5.16, 5.17, 5.20a, 5.20b, 5.20.
- §6.0b (`τ(U(V)) = 2`), §6.1 (local densities), §6.1a, §6.1d (local densities by discriminant forms), §6.2 ((a) the mass formula; (b) the volume formula for every Hermitian space with the fibre measure; (c) the compact-dual normalisation: for a unimodular lattice, `E/F` unramified at the finite places and one signature at every real place, the sum over the classes of the covolumes for the compact-dual measure is `mass(𝒪_E^n)`, that is `vol([U(V)]) = mass(𝒪_E^n)` for the measures of the Conventions), §6.3 (closed mass formula; (c) the mass of `𝒪_E^n`), §6.4 (ratios of masses), §6.4a (unimodular lattices meeting a subspace in a given lattice), §6.4b (total mass of the integral lattices of given discriminant), §6.4c (subspaces meeting a lattice in a given discriminant), §6.5 (a) (Weil's mean value theorem for one nondegenerate Gram matrix). Used in 5.16, 5.17, 5.20a, 5.20b, 5.20c, 5.20d, 5.20, 5.21.
- §6.5 (d) (volumes of stabilisers: the stabilisers of two tuples with nondegenerate Gram matrices have the same covolume; the stabiliser of a flag and an anisotropic vector is the semidirect product of its unipotent radical and the pointwise stabiliser, with `vol(N(F)\N(𝔸)) = 1` for one Haar measure). Used in 5.20.

### From SlopesOfHermitianVectorBundles, a sub-roadmap of this family

- §3.2: the canonical filtration. Used in 5.14, 5.16.

### From DiscreteSeriesCoefficientsAndAutomorphicMetrics, a sub-roadmap of this family

- §2.4a (b)–(d): the explicit lowest-`K`-type coefficients of gapped discrete series of `U(p, q)`, their decay and their weighted integrability. Used in 5.13, 5.16.
- §2.4b (b): tensor products of gapped discrete series with the exterior powers of the standard representation and with its dual, on smooth vectors. Used in 5.13d, 5.18.
- §8.3: the formal degree `d(π_λ) = ∏_{α>0}|⟨λ, α^∨⟩|/∏_{α>0}⟨ρ, α^∨⟩` for the measure of the compact dual. Used in 5.20a.
- §9.1: trace class on the cuspidal and discrete spectrum. Used in 5.16.

### From TensorInductionAndFiniteGroupInputs, a sub-roadmap of this family

- §9.1 (b)–(j): quantum minors of `u + E` for `𝔤𝔩_n`: Laplace expansions, the centre and the Capelli eigenvalue, the comatrix identity, the Jacobi identity, vector and covector operators, the bordered Jacobi identity, border expansions, adjoints, and the quantum determinant of a `2 × 2` matrix with the exchange relation. Used in 5.13d, 5.18a, 5.18e.

### From PositivityOfDirichletSeriesWithKernels, a sub-roadmap of this family

- §7.1 (a), (d): Laplace's method in several variables with a uniform majorant, for a parameter running over the positive integers: positivity of the real part of the limit form and non-vanishing of the integrals for large parameters. Used in 5.13d.
- §8.1 (b), (c), (d): non-stationary phase, stationary phase at a nondegenerate critical point and the phase `Σx_k + D/∏x_k` over `ℂ^n`, for Banach-valued amplitudes. Used in 5.18d.
- §8.2 (a)–(d): Gaussian integrals over lattices and the Gauss factor, the Morse lemma, vanishing away from the critical points and stationary phase for `Σx_k + D/∏x_k` over a finite product of finite extensions of fields `ℚ_p`. Used in 5.17c.

### From FiniteReductiveGroups, a sub-roadmap of this family

- §§2.2, 2.4, 2.5: multiplicity one of Gelfand–Graev representations, the mirabolic subgroup, the Gelfand–Graev convolution bound. Used in 5.17a.
- The wider form of §2.6 (c), §2.7 (b), (c): degenerate Gelfand–Graev representations of `GL_n`, the Bessel-type induced representations, their decomposition and the multiplicity inequality. Used in 5.22.
- §5.7, §5.8 (a), (c): labels and series idempotents, Gelfand–Graev weights of labels, and the shares of labels in the Bessel-type induced representations. Used in 5.22, 5.23.

### From TauCetiRoadmap.AutomorphicFormsOnReductiveGroups

- §2.4: discrete series and their Harish-Chandra parameters. Used in 5.13.

### From TauCetiRoadmap.AutomorphicSpectralTheory

- §4.5 (finite multiplicity in the discrete spectrum). Used in 5.16.

### From TauCetiRoadmap.VonNeumannAlgebras

- Layer 9: coefficient maps, Schur orthogonality, formal degree. Used in 5.13c, 5.15a.

### From TauCetiRoadmap.RealSemisimpleLieGroups

- §3.3 (the Tits system and the Bruhat decomposition), §4.3 (Levi subgroups and the Langlands decomposition). Used in 5.13a, 5.13b, 5.13c, 5.18a, 5.18.
- §3.2 (the open big cell `N⁻ × M × A × N → G`), §4.2 (standard parabolic subgroups and their double cosets). Used in 5.13a.

### From TauCetiRoadmap.RepresentationTheory

- RepresentationTheory/LieGroups Layer 9 (the Cartan, Iwasawa and `KAK` decompositions). Used in 5.13a, 5.13b, 5.13c.
- ClassicalGroups §§6.3–6.6 (Gelfand–Tsetlin patterns, a fixed Gelfand–Tsetlin basis and its action, the dimension formula, the Capelli generators). Used in 5.13d, 5.18a.
- ClassicalGroups §6.1 (the branching rule: the restriction of `V_λ` from `GL_n` to `GL_{n−1}` is the multiplicity-free sum of the `V_μ`, `μ` interlacing `λ`; here for `U(k) ↓ U(k−1)`). Used in 5.18a, 5.18e.
- RepresentationTheory/CompactGroups Layers 2, 4 (Schur orthogonality for `U(k)`). Used in 5.13d, 5.15.
- RepresentationTheory/LieHighestWeight Layer 7 (the Harish-Chandra isomorphism). Used in 5.13d, 5.18a.

### From TauCetiRoadmap.AdelicAlgebraicGroups

- §2.3 (rational quotients), §3.1 (Iwasawa integration), §3.4 (adelic reduction, finite covolume), §3.5 (algebraic heights). Used in 5.14, 5.16.

### From TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmetic

- §4.4 (4.4.14): `μ(L)·λ_1(L^*) ≤ n` for the covering radius `μ(L)` of a full lattice of rank `n`. Used in 5.16.

### From TauCetiRoadmap.AnalyticNumberTheoryPartI

- §2.15: for a number field `K` of degree `d > 1`, the residue `κ_K` of `ζ_K` at `1` is at most `(e·log D_K/(2(d − 1)))^{d−1}`. Used in 5.16, with `K = E`, `d = 2f`.

### From TauCetiRoadmap.AnalyticNumberTheoryPartII

- §5.3k: for a closed subgroup `H` of a second countable locally compact group `G` with the same modular character, the unique invariant quotient measure on `H\G` with `∫_G f = ∫_{H\G}∫_H f(hg)`, for nonnegative Borel and for integrable `f`; composition in stages; unfolding over a countable discrete subgroup of a unimodular group. Used in 5.13, 5.14, 5.15, 5.15a, 5.20, for unimodular subgroups of unimodular groups.

### From TauCetiRoadmap.GanGrossPrasadUnitaryGroups

- 1.2 (Bessel data), 4.1 (global Bessel periods: absolute convergence, continuity and the character law of the period of every cusp form on `U(V) × U(W)`; here `U(W)` is the unitary group of a totally definite space, on which every automorphic form is cuspidal). Used in 5.13a, 5.14.
- §1.3 (transport of Bessel data: an isometry of framed pairs, a change of the flag, of the line generator or of the generic additive character gives a conjugate Bessel datum). Used in 5.13a, 5.13d.
- 2.6 (multiplicity one: for a relevant pair of odd codimension over a local field of characteristic zero, here `ℂ/ℝ` with Casselman–Wallach representations, the Bessel model of an irreducible pair has dimension at most one). Used in 5.13c.
- 3.9 (the real tempered theorem: for `ℂ/ℝ`, every relevant odd codimension and both line signs, `m(π_V, π_W) = 1` exactly when the labels of the tempered pair are the root numbers named there, and exactly one pair over the relevant pure inner forms has `m = 1`). Used in 5.13d.

### From Mathlib

- Haar measure, `IsFoelner`, Fatou's lemma, Fourier inversion, the layer-cake formula (`MeasureTheory.lintegral_comp_eq_lintegral_meas_lt_mul`), Lagrange interpolation, Poisson summation, the Schur product theorem (`Matrix.PosSemidef.hadamard`), finite modules over discrete valuation rings and characters of finite abelian groups, as named in the targets. Used in 5.13b, 5.15, 5.15a, 5.17b, 5.18c, 5.18d, 5.18, 5.19, 5.20.

### From Tau Ceti

- `TauCeti.lintegral_rpow_lintegral_mul_le` (`TauCeti/MeasureTheory/Integral/SchurTest.lean`): Schur's test: for a measurable kernel `k ≥ 0` on a product of two s-finite measure spaces whose row integrals are almost everywhere at most `A` and column integrals at most `B`, `∫(∫k(x, y)g(y)dy)^p dx ≤ A^{p−1}B∫g^p` for `p ≥ 1` and `g ≥ 0`. Used in 5.19, with counting measures on the lattices of pivots.

## References

- [FormalProof] Levent Alpöge, the Lean formalization of the Riemann hypothesis and of the Riemann hypothesis for Dirichlet L-functions announced in [Announcement]; source with a public verification setup: <https://github.com/leanprover-community/riemann-hypothesis>. It is the reference of every `*Method of the formal proof:*` label and of every target whose `*Origin:*` is particular to this proof.
- [Announcement] Levent Alpöge, the announcement of that proof, 20 November 2026: <https://alpo.ge/remark.pdf>.
- Harish-Chandra, *Discrete series for semisimple Lie groups II*, Acta Math. 116 (1966): 5.13, 5.20a.
- D. DeGeorge and N. Wallach, *Limit formulas for multiplicities in L²(Γ\G)*, Ann. of Math. 107 (1978); L. Clozel, *On limit multiplicities of discrete series representations in spaces of automorphic forms*, Invent. Math. 83 (1986); G. Savin, *Limit multiplicities of cusp forms*, Invent. Math. 95 (1989); R. P. Langlands, *Dimension of spaces of automorphic forms* (1966): 5.16. W. Banaszczyk, *New bounds in some transference theorems in the geometry of numbers*, Math. Ann. 296 (1993): 5.16.
- B. Sun and C.-B. Zhu, *Multiplicity one theorems: the Archimedean case*, Ann. of Math. 175 (2012), Theorem B (arXiv 0903.1413v2, p. 2): 5.13c, 5.13; D. Jiang, B. Sun and C.-B. Zhu, *Uniqueness of Bessel models: the Archimedean case*, Geom. Funct. Anal. 20 (2010), Theorem A (arXiv 0908.1728v2, p. 1): 5.13c; H. He, *On the Gan–Gross–Prasad conjecture for U(p, q)*, Invent. Math. 209 (2017), Theorem 0.1 (arXiv 1508.02032v2, p. 3): 5.13d, 5.13; R. Beuzart-Plessis, *A local trace formula for the Gan–Gross–Prasad conjecture for unitary groups: the Archimedean case*, Astérisque 418 (2020), Theorem 12.4.1 (arXiv 1506.01452v3, p. 290): 5.13d, its Lemma 6.5.1, §7.1 and Lemma B.1.1 (the regularised Bessel form, by integrations by parts in a scaling torus): 5.13b, and its Theorem 7.2.1 and Lemma 7.3.1 (the regularised Bessel form is nonzero exactly when a Bessel functional exists; an a priori bound for Bessel functionals): 5.13c, with Lemma 7.3.1 (i) also for 5.13; H. Xue, *Bessel models for real unitary groups: the tempered case*, Duke Math. J. 172 (2023), Theorem 2.2 (p. 1000), with the reduction to codimension one of Corollary 2.5 (p. 1001): 5.13d. I. M. Gelfand and D. Kazhdan, *Representations of the group GL(n, K) where K is a local field* (1975): 5.13c.
- R. Beuzart-Plessis, *On distinguished square-integrable representations for Galois pairs and a conjecture of Prasad*, Invent. Math. (2018), §3.2 (arXiv 1707.06495): 5.13c. T. Kobayashi and B. Speh, *How does the restriction of representations change under translations? A story for the general linear groups and the unitary groups*, preprint (2025), Lemma 2.7, Theorems 2.5, 3.2 (arXiv 2502.08479): 5.13d; M. Harris, T. Kobayashi and B. Speh, *Translation functors, branching problems, and applications to the restriction of coherent cohomology of Shimura varieties*, preprint (2025), Theorems 5.3, 5.6 (arXiv 2509.17007): 5.13d.
- R. Godement, *Série de Poincaré et Spitzenformen*, Séminaire Henri Cartan 10 (1957/58), exposé 10, §4, Théorèmes 5 and 5 bis (Poincaré series of integrable functions): 5.14; H. Petersson, *Theorie der automorphen Formen beliebiger reeller Dimension und ihre Darstellung durch eine neue Art Poincaréscher Reihen*, Math. Ann. 103 (1930) (Poincaré series): 5.14, 5.15; H. Jacquet, *Sur un résultat de Waldspurger*, Ann. Sci. ÉNS (4) 19 (1986), §1 (double cosets of tori) and §§7, 9 (the geometric side of a relative trace formula): 5.15; G. Muić, *On a construction of certain classes of cuspidal automorphic forms via Poincaré series*, Math. Ann. 343 (2009): 5.14.
- A. Ichino, E. Lapid and Z. Mao, *On the formal degrees of square-integrable representations of odd special orthogonal and metaplectic groups*, Duke Math. J. (2017), introduction and §2 (arXiv 1404.2909); R. Beuzart-Plessis, *Plancherel formula for GL_n(F)\GL_n(E) and applications to the Ichino–Ikeda and formal degree conjectures for unitary groups* (2018) (arXiv 1812.00047): 5.15a.
- A. Molev, *Yangians and classical Lie algebras* (2007); P. Kulish, N. Reshetikhin and E. Sklyanin; V. Drinfeld; E. Sklyanin; S. Kharchev and D. Lebedev: 5.17, 5.18. H. Jacquet and Y. Ye, *Germs of Kloosterman integrals for GL(3)*, Trans. Amer. Math. Soc. 351 (1999), 1227–1255: 5.17c, 5.17, 5.18d, 5.18. S. Friedberg; S. Stevens: 5.17b. A. Markov; T. Takagi: 5.18. G. Zuckerman, *Tensor products of finite and infinite dimensional representations of semisimple Lie groups*, Ann. of Math. 106 (1977): 5.18.
- A. Molev, *Yangians and transvector algebras*, Discrete Math. 246 (2002), Theorem 1.3 (arXiv math/9811115); D. Krob and B. Leclerc, *Minor identities for quasi-determinants and quantum determinants*, Comm. Math. Phys. 169 (1995); A. Gerasimov, S. Kharchev and D. Lebedev, *Representation theory and the quantum inverse scattering method: the open Toda chain and the hyperbolic Sutherland model* (2002), §§2, 4, 6 (arXiv math/0204206): 5.18a.
- J. A. Green, *The characters of the finite general linear groups*, Trans. Amer. Math. Soc. 80 (1955); I. N. Bernstein and A. V. Zelevinsky, *Induced representations of reductive p-adic groups I*, Ann. Sci. ÉNS 10 (1977); A. Zelevinsky, *Representations of finite classical groups: a Hopf algebra approach*, LNM 869 (1981); D. Ginzburg, S. Rallis and D. Soudry, *The descent map from automorphic representations of GL(n) to classical groups* (2011): 5.17, 5.22, 5.23. I. M. Gelfand and M. I. Graev, *Construction of irreducible representations of simple algebraic groups over a finite field*, Dokl. Akad. Nauk SSSR 147 (1962): 5.17a, 5.17, 5.22, 5.23.
- C. L. Siegel, *Über die analytische Theorie der quadratischen Formen*, Ann. of Math. 36 (1935); G. Shimura, *Euler products and Eisenstein series*, CBMS 93 (1997): 5.17d, 5.17, 5.20a, 5.20. W. T. Gan, J. Hanke and J.-K. Yu, *On an exact mass formula of Shimura*, Duke Math. J. 107 (2001); A. Weil, *Adeles and algebraic groups* (1961): 5.17, 5.20a, 5.20.
- P. Flajolet and R. Sedgewick, *Analytic Combinatorics*, Cambridge University Press (2009), Example I.20 and Note I.66 (pp. 90–91), Example VII.4 (pp. 449–450): 5.23.
