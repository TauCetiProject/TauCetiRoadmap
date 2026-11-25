# Roadmap: arithmetic volumes and integral forms on unitary Shimura varieties

**Summary.** This roadmap builds the lattices of integral cusp forms on unitary Shimura varieties and bounds their slopes, together with the CM periods and CM values that enter these bounds. Its objects are: the CM period `log Ω = γ + log(2π/rd_E) − (L′/L)(1, χ_K)` of a CM field `E`, abelian over `ℚ`, containing an imaginary quadratic field `K`; the unitary Shimura variety of a Hermitian space of signature `(p, q)` over `E` with a self-dual lattice, at a principal congruence level that is good at every prime, with its normal projective model over the ring of integers of a number field, its automorphic vector bundles and its flag bundles; the lattices of cusp forms that are integral at every integral point, with their Petersson metrics, read as Hermitian vector bundles; and lattice sums of CM lattices twisted by Hecke characters.

The headline theorems are these. (1) *Chowla–Selberg in class-mean form.* For every imaginary quadratic field `K` of discriminant `−D`, `D > 4`, the mean over the ideal classes of `K` of the logarithmic period `log(area(ℂ/𝔞)/π) + (1/6)·log|Δ(𝔞)|` of a fractional ideal `𝔞` in the class is `γ + log(2π/√D) − (L′/L)(1, χ_K)`. (2) *The flat line.* If `|disc K| > 4`, then on every geometrically connected component of such a Shimura variety the line `det Lie_τ ⊗ (det Lie_{cτ})^{−1}`, with the Hodge metric and the integral structure of the eigen-submodules of the Lie algebra, has a section without zeros or poles, of constant norm and of the same valuation at every integral point above a given place, and its arithmetic degree is `((p − q)/2)·log Ω`. (3) *The average arithmetic volume theorem.* If `K = ℚ(√−d)` with `d` a prime `≡ 7 (mod 16)`, `E` is abelian over `ℚ` and unramified over `E⁺` at every finite place, a group of automorphisms of the datum acts transitively on the CM type, `|Φ| ≥ 2`, `p, q ≥ 1`, `3q + 1 ≤ N` and at most `4|Φ|N²` primes divide `2·disc(E)` and the level, then for every dominant weight `u` whose entries at every place are strictly decreasing, with `|u_{τ,a} − u_{τ,b}| ≥ g > 0` whenever `a` lies in the block of the last `q` indices, and with `B(u, g) = 4|Φ|N²(1 + ‖u‖_∞/g)`, the mean over the components of the volume slopes of the forms of weight `u` is at least `−C·[(log B(u, g) + log rd_E + |(L′/L)(1, χ_K)|)·|u|₁ + q·spread(u)]`, with an absolute constant `C`. (4) *The slope of the step lattices.* For the unitary groups `U(W_j)` of a chain of theta lifts (ThetaChainsOnDefiniteUnitaryGroups), under the size conditions of the chain, the hypotheses of 8.19 (b) on the type primes and on the level groups of the deep covers, and `[F:ℚ] ≥ 3`, the lattice of integral cusp forms of the weight of the model lift of step `j`, cut out by its type at the type primes, has slope at least `−(p_j − q_j)·Σ_τ w_j(τ)·log Ω − C·B₀·log log x`.

The roadmap takes slopes, Bost's slope inequality and an explicit arithmetic Hilbert–Samuel inequality from [SlopesOfHermitianVectorBundles](../SlopesOfHermitianVectorBundles/README.md); moduli schemes, toroidal compactifications and integral models from [ShimuraCompactifications](../../ShimuraCompactifications/README.md), [PELModuli](../../PELModuli/README.md) and [ProjectiveModelsAndPeriodBoundsOnShimuraVarieties](../ProjectiveModelsAndPeriodBoundsOnShimuraVarieties/README.md); log-log singular metrics and the arithmetic intersection numbers of flag varieties from [HeightsForLogSingularMetrics](../HeightsForLogSingularMetrics/README.md); Hodge–Tate lattices at every prime from [HodgeTateLatticesAndLubinTateLogarithms](../HodgeTateLatticesAndLubinTateLogarithms/README.md); point separation, Bertini and division by sections from [MultiplierIdealsOfPairsAndPointSeparation](../MultiplierIdealsOfPairsAndPointSeparation/README.md); and the data of the chain (ranks, weights, levels, the coefficient field `𝕂`) from [ThetaChainsOnDefiniteUnitaryGroups](../ThetaChainsOnDefiniteUnitaryGroups/README.md). Its results are used by [GluedTargetAndDivisionInequality](../GluedTargetAndDivisionInequality/README.md) for the slope of the glued target and the division inequality.

All targets lie in Layer 8 below, which keeps its number in the family. The CM period comes first (8.5); the Conventions state the setting of 8.11–8.19, whose targets 8.15–8.19a‴ are stated for the fields of the hosts of the chain (`K = ℚ(√−d)` with `d` a prime `≡ 7 (mod 16)`, `E` unramified over `E⁺`). Then the flat line and its twists (8.11, 8.12), the definite step (8.13) and a change of weight by a short section of a power of the Hodge line (8.14). Then the flag bundles: a degree inequality on curves in characteristic `ℓ`, local facts on the `𝔩`-torsion and antisymmetric polynomials (8.14a–8.14c), models with mixed integral structure (8.15), arithmetic proportionality with its two constants (8.15b–8.16) and the average arithmetic volume theorem (8.17). Then deep covers: generation by theta series in the stable range (8.17a), heights of images (8.18), Poincaré series on the flag domain and Mackey averages of lattice indices (8.18a, 8.18b), cusp forms on deep covers (8.18c), a uniform slope bound (8.18e), rank growth (8.18f) and the slope of the step lattices (8.19). Then the theta lattices (8.19a–8.19a‴), and the CM values: denominators at every prime, the Galois equivariance of toric ratios and Hecke's formula for toric sums (8.19b–8.19d).

## Conventions

Notation and conventions not restated here are those of the roadmaps named at each use: of [ShimuraCompactifications](../../ShimuraCompactifications/README.md), [PELModuli](../../PELModuli/README.md) and [ProjectiveModelsAndPeriodBoundsOnShimuraVarieties](../ProjectiveModelsAndPeriodBoundsOnShimuraVarieties/README.md) for moduli schemes, compactifications and models, of [ThetaChainsOnDefiniteUnitaryGroups](../ThetaChainsOnDefiniteUnitaryGroups/README.md) for the data of the chain, and of [SlopesOfHermitianVectorBundles](../SlopesOfHermitianVectorBundles/README.md) for slopes, read through the dictionary below. Internal references `8.n` name targets of this roadmap.

**Fields.** `E` is the host (FrobeniusRestrictedRieszSums §0.1): finite abelian over `ℚ` with an imaginary quadratic subfield `K`; `F = E⁺` its maximal totally real subfield, `f = [F:ℚ]`; `c` complex conjugation; `χ_K` the quadratic character of `K` and `d_K := |disc K|`; `f_E` the conductor of `E`. On the cyclic hosts (FrobeniusRestrictedRieszSums §0.4) `d` is a prime with `d ≡ 7 (mod 16)`, `K = ℚ(√−d)`, and a second imaginary quadratic field `ℚ(√−q) ⊂ E` is used; `(q, d)` is the *auxiliary pair*. The targets that use Koecher's principle on the unitary Shimura varieties over `F` ask `f ≥ 2`. The fields of the chain are those of ThetaChainsOnDefiniteUnitaryGroups §2.6: the *coefficient field* `𝕂`, a number field containing `E` whose degree and root discriminant are bounded there, and the *field of places* `𝕃 ⊃ 𝕂`, finite and Galois over `ℚ` inside `ℂ`, stable under complex conjugation, with the embedding `σ₀` and the conjugation `c_𝕃` of ThetaChainsOnDefiniteUnitaryGroups §2.6; no bound on `𝕃` is used. Cusp forms on the Shimura varieties of the steps, their lattices of integral forms, theta rules and short theta series are over `𝒪_𝕂`, and enter the chain after extension of scalars to `𝒪_𝕃`, which changes neither the normalised slope nor the maximal slope. The finite places of `𝕃` are written `𝔭`, with residue characteristic `p(𝔭)`, ramification index `e_𝔭` and weight `ϱ(𝔭) = log N𝔭/[𝕃:ℚ]` (so `Σ_{𝔭|p} ϱ(𝔭)e_𝔭 = log p`). Embeddings `𝕃 ↪ ℂ` are written `σ`.

**CM type.** An embedding `ι₀ : E ↪ ℂ` is fixed; `Φ = Gal(E/K)` is identified with the CM type `{ι₀∘g : g ∈ Φ}` induced from `K` (`|Φ| = f`); its elements are called places. When `K = ℚ(√−d)`, `√−d ∈ K` denotes the root with `Im ι₀(√−d) > 0`, so that `Im τ(√−d) > 0` for every `τ ∈ Φ`. Artin reciprocity sends uniformisers to geometric Frobenius elements, as in AutomorphicGaloisRepresentationsPartII.

**Petersson products.** For algebraic modular forms with values in an algebraic representation `V_λ`: `⟨φ, φ′⟩ = Σ_𝒸 |Γ_𝒸|^{−1}⟨φ(𝒸), φ′(𝒸)⟩_λ`, with `⟨,⟩_λ` the invariant Hermitian form normalised by `⟨v_λ, v_λ⟩ = 1` on the product of leading minors `v_λ` of the polynomial model of ThetaChainsOnDefiniteUnitaryGroups §3.1. For forms on indefinite groups the Petersson product of RowTowerAndRallisIdentities §5.1 sums over an orthonormal basis of the lowest `K`-type.

**Slopes and heights.** Hermitian lattices are finitely generated submodules of full rank, over the ring of integers of a number field (`𝒪_𝕃`, `𝒪_𝕂` or the field named in a target), of Hermitian spaces with a metric at every complex embedding. This roadmap writes `μ(L̄) := 2μ̂(L̄)`, twice Bost's normalised slope (`μ̂ = deĝ/([𝕃:ℚ]·rk)` over `𝒪_𝕃`), so `μ(𝒪_𝕃^n, standard) = 0`; `μ_max`, `μ_min` likewise. For a linear map `φ`, `ht(φ) := (2/[𝕃:ℚ]) Σ_σ log ‖φ‖_σ`, twice Bost's archimedean height, that is the mean over the embeddings of `log ‖φ‖²_σ` (equivalently over the infinite places, the metrics being compatible with conjugation); integrality at finite places is stated separately, and operator norms are taken for the metrics named in each statement. For a lattice `L` and a basis `e` of `L ⊗ 𝕃`, `−rk L·μ(L) = mean_σ log det Gram_σ(e) − 2Σ_𝔭 ϱ(𝔭)·idx_𝔭(L : ⟨e⟩)`, `idx_𝔭` the signed length at `𝔭` (no factor `2` on the mean). With these, `μ(N̄) ≤ μ_max(M̄) + ht(φ)` for `φ` injective and integral. SlopesOfHermitianVectorBundles uses `μ̂` and `h`; this paragraph is the dictionary, and its statements are homogeneous in it.

**The CM period.** `log Ω := γ + log(2π/rd_E) − (L′/L)(1, χ_K)`, `rd_E` the root discriminant of `E` and `γ` Euler's constant
([FormalProof], `Development/AbelianVarietyTheory/Definitions/CMLattices/ExistsIsThetaDegOfIsLocalModel.lean` (`GlobalTheory.CM.logOm`)). Equivalently `log Ω = log Ω_K − log(rd_E/√d_K)`, where `log Ω_K = γ + log(2π/√d_K) − (L′/L)(1, χ_K)` is the mean over the ideal classes of `K` of `log(area(Λ)/π) + (1/6) log|Δ(Λ)|` (Chowla–Selberg, 8.5). The same `Ω` is the arithmetic degree of the flat line bundle (8.11).

**The chain.** Step `j` (`1 ≤ j ≤ m`) has the step weight `w_j = e_{j−1}` (ThetaChainsOnDefiniteUnitaryGroups §2.3) and the model lift between `U(V_j)` and `U(W_j)` (RowTowerAndRallisIdentities §5.7). For a type prime `g ∈ {g₀, g₁}` (ThetaChainsOnDefiniteUnitaryGroups §2.7) the prime `π_g𝒪_K` of `K` above `g` is fixed. A *level* at the type primes is a pair `(P, χ_P)` of a subgroup `P` of the finite group `G₀` of ThetaChainsOnDefiniteUnitaryGroups §2.9a and a character `χ_P` of `P`; the forms are formed at principal level and the levels cut out their parts; `(P_0, χ_{P_0})` is the base level (ThetaChainsOnDefiniteUnitaryGroups §2.9a), and `𝔼_0` the part of the good rows at the base level (RowTowerAndRallisIdentities §5.3).

**Quantifier order and sizes.** Constants named before `ε` do not depend on `ε`; the scale `x` and everything chosen at it come after `ε`; between them come numbers that may depend on `ε`, among them the window constant `J`. `C` denotes positive constants that do not depend on `x` nor on anything chosen at the scale `x`; they may depend on `ε` and on the constants fixed before `ε`, except that a constant in an exponent of `x` (such as the `C` of `x^{C}·b`) depends only on the constants fixed before `ε`. The size conditions are the named predicates of ThetaChainsOnDefiniteUnitaryGroups §2.1, with their conjunction `Size(x, ε)`; "the size conditions of ThetaChainsOnDefiniteUnitaryGroups §2.1" means `Size(x, ε)`, and a target that uses a single predicate names it.

### Table of symbols

| Symbol | Meaning | Defined |
|---|---|---|
| `E, F = E⁺, f, c, f_E` | host field, its maximal totally real subfield, `[F:ℚ]`, complex conjugation, conductor of `E` | FrobeniusRestrictedRieszSums §§0.1, 0.2 |
| `K, χ_K, d_K, d, √−d` | the imaginary quadratic subfield, its character and the absolute value of its discriminant; `K = ℚ(√−d)` on the cyclic hosts (so `d_K = d`), and the root with `Im ι₀(√−d) > 0` | FrobeniusRestrictedRieszSums §§0.1, 0.3, Conventions |
| `Φ, ι₀, τ` | `Gal(E/K)` and the CM type it defines through `ι₀`; its elements, the places | FrobeniusRestrictedRieszSums §0.1 |
| `(q, d)` | auxiliary pair of a cyclic host | FrobeniusRestrictedRieszSums §0.4 |
| `γ` | Euler's constant | Conventions |
| `rd_E, log Ω, log Ω_K` | root discriminant, CM periods of `E` and of `K` | Conventions |
| `μ, μ_max, μ_min, ht` | twice Bost's slopes, twice his archimedean height | Conventions |
| `𝕂, 𝕃, σ₀, c_𝕃` | coefficient field, field of places, its fixed embedding and conjugation | ThetaChainsOnDefiniteUnitaryGroups §2.6 |
| `𝔭, p(𝔭), e_𝔭, ϱ(𝔭)` | finite place of `𝕃`, residue characteristic, ramification index, `log N𝔭/[𝕃:ℚ]` | Conventions |
| `k, m, t, r, N_j` | base rank, chain length, rank step, `r = k + m − 1`, `N_j = k + j(t + 1)` | ThetaChainsOnDefiniteUnitaryGroups §2.1 |
| `x, ε, b, B₀` | scale, exponent, `e^{x^ε}`, the budget `B₀ = fmbx^ε` | ThetaChainsOnDefiniteUnitaryGroups §2.1 |
| `Size(x, ε)` | the conjunction of the size predicates | ThetaChainsOnDefiniteUnitaryGroups §2.1 |
| `Q_S, S_small, vd` | `Q_S = f_E/(q·d)`, the part of the conductor prime to `q·d`; the primes dividing `2f_E` other than `q`, `d` (those dividing `Q_S`); `vd := log₂ Q_S` | ThetaChainsOnDefiniteUnitaryGroups §2.1 |
| `J` | the window constant (UniformWildKernelBounds §7.6 at the chain's parameters), chosen after `ε` and before the scale | ThetaChainsOnDefiniteUnitaryGroups §2.1 |
| `W_j, V_j` | model spaces: rank `r`, signature `(k + j − 1, m − j)`; totally positive definite of rank `r + t` | ThetaChainsOnDefiniteUnitaryGroups §2.2 |
| `w_j(τ), h₀` | step weights `e_{j−1}(τ)`; the gap parameter of the weights | ThetaChainsOnDefiniteUnitaryGroups §§2.3, 2.3a |
| `g₀, g₁` | type primes | ThetaChainsOnDefiniteUnitaryGroups §2.7 |
| `G₀, (P, χ_P), (P_0, χ_{P_0})` | finite group of the type primes, a level, the base level | ThetaChainsOnDefiniteUnitaryGroups §2.9a |
| `𝔼_0, Π_good, δ_bad` | good rows at the base level, the good idempotent, the discarded share | RowTowerAndRallisIdentities §5.3 |
| `D^±_j, a^±_{j,τ}, D^H_j` | the two diagrams of step `j` (rows `a⁺_{j,τ,i} = s⁺_i + w_j − (p_j − 1 − i) − (t + 1)/2`, `a⁻_{j,τ,c} = e′_{j+c} − w_j − c − (t + 1)/2`, all `≥ 1`) and their total sizes; `D^H_j = D⁺_j + D⁻_j`, equal to `DF(λ^W_j)` by the definitions of 8.19 and LocalGainOfThetaChains §4.9f (d) | LocalGainOfThetaChains §4.9f (d), 8.19 |
| `E_W` | the matrix of the Weil pairing | 8.14b |
| `ω_q, ω_{j′}` | determinant of the Hodge piece of rank `q`; of the smaller Hodge piece | 8.14, 8.16 |
| `fib` | the within-block Vandermonde class | 8.16 (c) |
| `𝓕_τ, M^W_j, λ^W_j` | flat line; step lattice on the Shimura variety of `U(W_j)`; its weight | 8.11, 8.19 |
| `α_∞, β_∞, B′` | the two constants of 8.16 (d); the smaller cut-off | 8.15e, 8.16 |
| `c_Λ, G_{Y_j}, c_j` | `log Λ`; the group of the deep cover; the integer `c` of the weight `c·w_q` | 8.18 |
| `κ_can; T₁, rem, u₂, wt(i); ρ, P` | the canonical weight of the flag bundle; `T₁ = T + D + 1`, the remainder and the weights `u₂`, `wt(i) = κ_can + u₂ + (D + i)·u₁` of the division of the anchored weight; `ρ := 1 − P(u′)/P(u₁)`, `P` the Weyl polynomial | 8.18 |
| `q_z, ℒ, SizeSG` | `7(D²/T + D·ρ)`; the logarithmic parameter of 8.18c (c); the size conditions of 8.18c (f) (ii) | 8.18c |
| `S_u, η_u` | bounds in the gap conditions of 8.18c (f) | 8.18c |
| `Γ_j, π, ι, H_i` | the level group of the deep cover `Y_j`, its surjection onto `G₀`, a section of it whose image commutes with `ker π`, the elements unitriangular at the places not above `g_i` | 8.18f (c) |
| `Ω_𝔇, B_𝔇, ρ_𝔇, e_P, e_𝔇, 𝔪₁, 𝔪₂, Wt` | the data of the Poincaré series on the flag domain | 8.18a |
| `ϖ_K` | a twelfth root of `Δ(𝒪_K)` | 8.19b |
| `R_E, C_R, C_deg, φ′_C` | `rd_E^{C_R}`, `C_R` and `C_deg` constants fixed before `ε` (8.19a (N2): `T ≤ x^{C_deg}`); the map of 8.19a′ | 8.19a, 8.19a′ |

### The setting of 8.11–8.19

`E ⊃ K` and `Φ` are as in FrobeniusRestrictedRieszSums §0.1, with `d_K > 4` (the range of 8.5 (a), which 8.11 (b) uses);
`E` need not be abelian over `ℚ` except where a transitive symmetry of `Φ` is used (8.15d, 8.16, 8.17). The targets
8.15–8.19a‴ ask in addition that `K = ℚ(√−d)` for a prime `d ≡ 7 (mod 16)` (so `d_K = d`) and that `E` be unramified over
`F` at every finite place: 8.15 (a2) takes conjugate data from ProjectiveModelsAndPeriodBoundsOnShimuraVarieties §§6.9a,
7.12a, which are stated there for these fields (those of the marked form §7.31a (b′)), and no statement of 8.15–8.19a‴ is
made here for other CM fields. The hosts of the chain are of this kind, so 8.13 (c), which concerns the chain, is on these
fields as well; 8.19b–8.19d state their own fields. On fields other than those of the hosts of the chain, the statements of
8.11–8.14c are this roadmap's own and are not in [FormalProof]. `W` is a Hermitian space over `E` of dimension `N = p + q` with signature
`(p, q)`, `p ≠ q`, at every `τ ∈ Φ`, containing a self-dual lattice `L_W` over the maximal order `𝒪_E`, and `w_0 ∈ 𝒪_E` is an element with `w_0 + w̄_0 = 1` (for the chain, `w_0 = (1 + √−d)/2`). *The level.* `K_W` is the principal congruence subgroup of level `M` of the stabiliser of `L_W ⊗ Ẑ`, for an odd integer `M ≥ 3` with `M𝒪_K = 𝔐·𝔐̄`, `𝔐 + 𝔐̄ = 1` (for the chain `M = g₀g₁` and `𝔐 = 𝔓₀𝔓₁`, `𝔓_i` a prime of `K` above `g_i`), and `Sh = Sh(W, K_W)` is the moduli scheme, over a number field `F′ ⊂ ℂ` containing the conjugates of `E` and `ζ_M`, of principally polarised abelian schemes with `𝒪_E`-action of signature `(p, q)` and a marking of the `𝔐`-torsion (similitude level one). *The level is good:* for every prime `p` the part of `M` prime to `p` is at least `3` (for `M = g₀g₁`: two distinct odd primes). The levels of ThetaChainsOnDefiniteUnitaryGroups §§2.9, 2.9a contain `K_W`, and the forms of those levels with their characters are the vectors of the corresponding type, under the finite group `G₀`, among the forms of level `K_W`. The deeper levels `M·15^e` of 8.18 (o), and `M·p` for a prime `p` split in `K` and prime to `M`, are of the same kind and good for the same reason. `A → Sh` is the universal principally polarised abelian scheme with `𝒪_E`-action, and for an
embedding `σ` of `E`, `Lie_σ` the `σ`-eigen-submodule of `Lie(A)` (over `Y`, of the Lie algebra of the semi-abelian
extension): of rank `p` for `σ = ι₀∘τ` and `q` for `σ = ι₀∘cτ`, `τ ∈ Φ`; `ω_σ = Lie_σ^∨`. `Y` is the union of the corresponding
components of the normal projective flat model over `𝒪_{F′}`, with a semi-abelian extension of `A`, of ProjectiveModelsAndPeriodBoundsOnShimuraVarieties §7.31a (b) for the datum and the level (the global model), with the cubical line bundle that ProjectiveModelsAndPeriodBoundsOnShimuraVarieties §7.31a (b) attaches to the principal polarisation and to `w_0`. In the form of [FormalProof] the model, its semi-abelian scheme and this bundle are those of ProjectiveModelsAndPeriodBoundsOnShimuraVarieties §7.31a (b′) (ii), chosen so that ProjectiveModelsAndPeriodBoundsOnShimuraVarieties §7.12a holds; ProjectiveModelsAndPeriodBoundsOnShimuraVarieties §7.31a (b′) relates them to those of (b) through an identification of the two moduli problems that it does not give. `Y` agrees with the integral toroidal model of ShimuraCompactifications §7.3 over a dense open subset of `Spec 𝒪_{F′}` only; toroidal charts at a given prime are taken from ShimuraCompactifications §7.3 at a prime good for the datum and the level, and from ShimuraCompactifications §7.31 (the singleton collection) at a bad one. `Fl → Sh` is the bundle of full flags of every `Lie_τ` and
every `Lie_{cτ}` (increasing flags `0 = F_0 ⊂ F_1 ⊂ ⋯`; the `i`-th graded piece is `F_{i+1}/F_i`, `i` counted from `0`, as in
[FormalProof], `Formalism/LocalToGlobal/ProjectiveLattices/IsCombAt.lean` (`Formalism.L2.Pj.FrBor`),
`Development/AbelianVarietyTheory/Definitions/Foundations/IsProbabilityMeasureMuPart.lean` (`GlobalTheory.AllWt.wtOf`,
`GlobalTheory.AllWt.wtOf_big`)),
of relative dimension `D − dim Sh`, `D = |Φ|·N(N − 1)/2`, with tautological lines `x_{τ,i}` (`0 ≤ i < N`):
for `i < p` the `i`-th graded piece of the flag of `Lie_τ`, for `i ≥ p` the dual of the `(N − 1 − i)`-th graded piece of the
flag of `Lie_{cτ}`. For a dominant weight `λ = (λ_τ)_{τ∈Φ}`,
`λ_τ ∈ ℤ^N` non-increasing (the first `p` entries for `Lie_τ`, the last `q` for `Lie_{cτ}`), `V_λ` is the automorphic
vector bundle of weight `λ` with its canonical extension (AutomorphicBundles §§0.5, 5.3): the direct image of the line
`L_λ` on `Fl` with `c₁(L_λ) = ℓ_{λ} = −Σ_{τ,i} λ_{τ,i}x_{τ,i}`;
`|λ_τ|` is the sum of the entries of `λ_τ` and `|λ|₁ = Σ_{τ,i}|λ_{τ,i}|`. With this convention the line of the parallel
weight `par(w) = (w_τ·(1, …, 1))_τ`, `w ∈ ℤ^Φ`, is `⊗_τ 𝓕_τ^{−w_τ}` with `𝓕_τ` of 8.11, and the line of the weight
`−(0, …, 0, 1, …, 1)` (the last `q` entries at every `τ`) is `ω_q := ⊗_{τ∈Φ} det(ω_{cτ})`. A holomorphic section `f` of `V_λ`
over `Sh_ℂ` extending to the canonical extension is a *form of weight `λ`*; it is a *cusp form* if it vanishes along the
boundary (its constant terms along every boundary stratum vanish); cusp forms have finite Petersson norm, and the
product of a cusp form with a form of any weight is a cusp form. *Koecher's principle:* if `dim Sh ≥ 2` (for instance
`[F:ℚ] ≥ 2` and `p, q ≥ 1`), every holomorphic section of `V_λ` over `Sh_ℂ` extends to the canonical extension
(ShimuraCompactifications §7.22, in characteristic zero), so every such section is a form, and its product with a cusp
form is a cusp form. A form is *integral* if for every complete
discrete valuation ring `O` over `𝒪_{F′}`, every `O`-point of `Y` with abelian generic fibre and every `O`-basis of its
Hodge bundle compatible with the `𝒪_E`-action, the value of `f` in that frame has coordinates in `O`. `M_λ(Sh)` is the
lattice of integral cusp forms of weight `λ` with the Petersson metric of the conventions (RowTowerAndRallisIdentities §5.1); `μ`, `μ_max`, `μ_min` and
`ht` are those of the conventions (`μ = 2μ̂`). For a component `Z` of `Sh` (geometrically connected, defined over a finite
extension of `F′`) the same objects restricted to `Z` carry the subscript `Z`.

**Statements of the formal proof.** Where a target names [FormalProof], the form that proof establishes is recorded at the target: its
hypotheses, ranges and constants are those of the proof, including restrictions that the route written here does not
visibly use. A wider or sharper form stated beside it is this roadmap's own, proved by the route written here, and is not in
[FormalProof].

**Labels.** Under each section heading, `*Origin:*` says where its statement comes from and
`*Method of the formal proof:*` how [FormalProof] proves it. Every section of this roadmap carries both labels:
[FormalProof] has a statement of each section; where the form stated here is wider or sharper than the proof's, the
section or its labels say so, and that form is this roadmap's own formulation.

**Corollaries of general theorems.** A section may carry, as a third line under these two labels, `*Corollary of:*`,
which names a general theorem and the roadmap section that states it, and the clauses it covers when it does not cover
the whole section. The general theorem is proved in the roadmap that states it, and what the line covers is deduced
from it. The proof of the Riemann hypothesis for Dirichlet L-functions needs only that case, not the general theorem in
full: the `*Method of the formal proof:*` label says how [FormalProof] proves it, and for which form of the statement
when that proof has a narrower one. Where the route given with the section is not the deduction, it is a second proof,
[FormalProof]'s unless the label says that it differs; the `*Needs:*` line lists what that route needs, and the
deduction needs the section that the `*Corollary of:*` line names.

## Layer 8: CM periods, arithmetic volumes and lattices of integral forms

This layer bounds the slopes of the lattices of integral cusp forms on the unitary Shimura varieties of the spaces `W_j` and supplies the CM values that enter the slope test of the chain. The CM period `Ω` of the Conventions is the class mean of the Chowla–Selberg periods (8.5) and the arithmetic degree of the flat line (8.11), whose twists move slopes by an explicit amount (8.12); the definite step is computed at CM points (8.13), and a change of weight by a short section of a power of the Hodge line passes between weights at a controlled loss (8.14). The flag bundles of the Shimura varieties carry models with mixed integral structure (8.14a–8.15), on which arithmetic proportionality holds up to two constants (8.15b–8.16); this gives the average arithmetic volume theorem (8.17). On deep covers the cusp forms are spanned by short theta series (8.17a), the heights of the images of the flag bundles bound the volumes (8.18), and an explicit arithmetic Hilbert–Samuel inequality over the coordinate bundle gives a uniform lower bound for slopes (8.18a–8.18f); descent to the base level gives the slope of the step lattices (8.19). Theta series generate the integral forms uniformly on subspaces (8.19a–8.19a‴). Finally 8.19b–8.19d bound the denominators of CM values at every prime and give the Galois equivariance of toric ratios and Hecke's formula for toric sums with its Euler-factor relation.

Some clauses of this layer are statements whose routes are not given, or not fully given, here: the flag facts (L3), (L4) of the `𝔩`-torsion (8.14b); the criterion that bounded sections are cusp forms (8.18a (f₀)); the statements on translates of the pulled-back theta function (8.19a′ (d), 8.19a″ (b₀)); on the deep covers of the steps, the carrying sections, the sizes other than the two inequalities of `SizeSG` in `err` and `htc`, and the sup norms of integral forms (8.18c (f)); and the two height inequalities of 8.19a (I8). Single steps of the routes of 8.11, 8.15, 8.15c, 8.16, 8.17, 8.18a, 8.18f, 8.19a′, 8.19b and 8.19c are not given; each route says which. All numbers attached to the flag bundles in 8.15–8.19 (limit numbers, volumes, volume slopes) are computed on the models of 8.15 (a), built over the modified base models `Y_B(c)`.

### 8.5 The CM period: the Chowla–Selberg formula in class-mean form

*Origin:* published: Chowla and Selberg (1967), (a), the class mean of the logarithmic periods, read off the constant
terms at `s = 1` through Kronecker's limit formula; its second expression, at `s = 0`, follows by the functional equation
of `L(s, χ_K)` and is not in [FormalProof]; (b) for every curve and every `k ⊃ K` is this roadmap's own formulation.

*Method of the formal proof:* (a) is proved analytically: for `s > 1`, `ζ_K(s)` is written as `½·(2/√D)^s` times the sum
over the ideal classes of the real-analytic Eisenstein series at a point of the class, Kronecker's first limit formula
(proved row by row, with dominated convergence and the partial fractions of the cotangent) gives its constant term at
`s = 1`, with `log(Im τ·|η(τ)|⁴)` in it, and the comparison with `ζ(s)·L(s, χ_K)` to first order gives the class mean;
for the mean over the embeddings, one curve with unit discriminant is taken for each class over a common field, and that
mean is identified with the class mean by a double count over classes and embeddings with the product formula. The
route written here is not that proof's: it deduces (a) from the Faltings height of a CM elliptic curve
(ComplexMultiplicationAndExplicitReciprocityPartII §4.6, through ArakelovGeometryAndAbelianHeights §2.9) and (b), and
takes (b) and (c) from the CM dictionary.

*Corollary of:* ComplexMultiplicationAndExplicitReciprocityPartII §4.6 (the classical Chowla–Selberg case: for an
imaginary quadratic field, here `K`, and either CM type, the Faltings height of that CM type is
`−(L′/L)(0, χ_K)/2 − log D/4 − log(2π)/2` in the unscaled metric), for (a) and, through (a), for (c); (b) is not a case
of it.

For a lattice `Λ ⊂ ℂ` put `Per(Λ) := log(area(ℂ/Λ)/π) + (1/6)·log|Δ(Λ)|`
(the *logarithmic period*), `Δ` the modular discriminant; it is unchanged under `Λ ↦ cΛ`, `c ∈ ℂ^×`, and equals
`log(4π·Im τ·|η(τ)|⁴)` for `Λ = ℤ + ℤτ`.

(a) (*Chowla–Selberg, class-mean form.*) For every imaginary quadratic field `K` of discriminant `−D` with `D > 4`
(so `𝒪_K^× = {±1}`) and class number `h_K`,
`(1/h_K)·Σ_{C∈Cl(K)} Per(𝔞_C) = log Ω_K := γ + log(2π/√D) − (L′/L)(1, χ_K) = (L′/L)(0, χ_K) + ½ log D`
(the last equality is the functional equation of `L(s, χ_K)`; it is this roadmap's own, not part of [FormalProof], which
writes the period at `s = 1`), `𝔞_C` any fractional ideal in the class `C`. In `Suggested.lean` this is `chowlaSelberg_classMean`, with the logarithmic period of `ℤ + ℤτ` written `logPeriod τ = log(4π·Im τ·|η(τ)|⁴)` and `χ_K` characterised by `ζ_K(s) = ζ(s)·L(s, χ_K)` for `Re s > 1`.

(b) If `𝓔` is an elliptic curve with complex multiplication by `𝒪_K` over a number field `k ⊃ K`, then for every
embedding `s : k → ℂ` the period lattice of `𝓔^s` is homothetic to an ideal of `𝒪_K`, every ideal class occurs for the
same number of embeddings, and `mean_s Per(period lattice of 𝓔^s)` is the class mean of (a).

(c) If `Λ₀ ⊂ ℂ` is a lattice with `𝒪_K`-multiplication of discriminant `−D`, `D > 4`, and `Δ(Λ₀) = 1`, defined over a
number field `k` together with its conjugates `Λ₀^s`, then `mean_s log(area(ℂ/Λ₀^s)/π) = log Ω_K`, the mean over all
embeddings `s : k → ℂ`.

*Route.* (b) By the CM dictionary the conjugates of `𝓔` run over the curves `ℂ/𝔞_C`, the class group acting simply
transitively on their `j`-invariants and every class having `[k : K(j)]` conjugates over each embedding of `K(j)`;
`Per` depends only on the homothety class. (a) Take `𝓔` as in (b) and enlarge `k` so that `𝓔` has good reduction at
every place (Serre–Tate: CM curves have potentially good reduction everywhere) and its invariant differentials have a
global generator `α` over `𝒪_k` (the Hilbert class field of `k` makes the line principal). By
ArakelovGeometryAndAbelianHeights §2.9 with `Δ_{𝓔/k} = (1)` (good reduction everywhere), plus `½·log π` for the metric
`‖α‖²_s = (2π)^{−1}|∫α∧ᾱ| = area(Λ_s)/π`, the Faltings height of `𝓔` in Deligne's normalisation is
`h(𝓔) = −½·mean_s Per(Λ_s)`. ComplexMultiplicationAndExplicitReciprocityPartII
§4.6 gives `h(𝓔) = −½(L′/L)(0, χ_K) − ¼·log D` (its unscaled height plus `½·log 2π`), so by (b) the class mean is
`−2h(𝓔) = (L′/L)(0, χ_K) + ½·log D`; the first form is the functional equation of `L(s, χ_K)`. (c) The conjugates of the
curve `ℂ/Λ₀` have Weierstrass models with unit discriminant over a finite extension, so the mean of
`log(area(Λ₀^s)/π)` over the embeddings is the class mean of `Per` (the correction `mean_s log|s(Δ)|` vanishes for a
unit), which is `log Ω_K` by (a), (b).

*Checks.* `K = ℚ(i)`, `h_K = 1`, `Λ = ℤ[i]`: `Per(ℤ[i]) = log(Γ(1/4)⁴/(4π²)) = 1.476336…`, and
`γ + log π − (L′/L)(1, χ_{−4}) = 0.577216 + 1.144730 − 0.245610 = 1.476336` (a classical case, outside the range `D > 4`
of the statement); `−½·1.476336 = −0.738168` is `h(𝓔)` of the route
for `y² = x³ − x` (the metric `‖α‖² = area/π`); with the metric `‖α‖² = area(Λ)` (that is `(i/2)∫α∧ᾱ`) one subtracts `½·log π`
and gets `−1.310533`, the classical value of the Faltings height of that curve, which fixes the sign of (a).

*Sources:* ((a): Chowla–Selberg 1967, §12, p. 109, the constant terms at `s = 1` of their identity (1) between the sum over the classes of the Epstein zeta functions and `w·ζ(s)·L(s, χ_K)`, through Kronecker's limit formula in their form §6, (39), p. 97; their (2), p. 110, is the same identity as a product over the classes, with values of `Γ`). The identity holds for `D = 3, 4` as well (Lerch;
Chowla–Selberg); [FormalProof] treats `D > 4`, which contains every host of the family.
(b) for every curve and every `k ⊃ K` is this roadmap's own. [FormalProof],
`Development/AbelianVarietyTheory/Proofs/CubicalLineBundles/OneMulConjFracOneEqInvDifferent.lean`, has one curve for each `D ≥ 7`
squarefree with `D ≡ 3 (mod 4)`: an elliptic curve with complex multiplication by `𝒪_K` over the ring of integers of a number field
`M ⊂ ℂ`, with a basis `v` of its Lie algebra such that the mean over the embeddings of `M` of `log(π·H(v, v))` (`H` the Hermitian form of
the principal polarisation) is `−log Ω_K` (`GlobalTheory.chowla_selberg_lie_lines`, which takes the existence of the curve as a
hypothesis; the existence is `GlobalTheory.T.exists_cmEllipticCurve_withPeriod`,
`Development/AbelianVarietyTheory/Proofs/UniformizationProofs/ExistsCmEllipticCurveWithPeriodStatement.lean`); `GlobalTheory.chowla_selberg_of_mean_log` derives
this value from (a) when that mean is minus the class mean of `Per`.
*Needs:* ComplexMultiplicationAndExplicitReciprocityPartII
§4.6 (the Faltings height of a CM elliptic curve); ArakelovGeometryAndAbelianHeights §2.9 (the Faltings height of an
elliptic curve from its minimal discriminant and its periods); ImaginaryQuadraticClassNumber H3.1 (the CM dictionary and the
class-group action on CM `j`-values).

### 8.11 The flat line and its arithmetic degree

*Origin:* adapted from the Chowla–Selberg formula (Chowla and Selberg (1967); Colmez (1993) for its reading as a height)
and the CM periods of determinant lines on unitary Shimura varieties (Shimura; Deligne): the line
`det Lie_τ ⊗ (det Lie_{cτ})^{−1}` has a section of constant norm and valuation, and its arithmetic degree is computed
exactly for the integral structure of eigen-frames.

*Method of the formal proof:* a horizontal section of the line is obtained on a model with good reduction from resolution
and the comparison theorem for sections; its norm is constant at every complex embedding and at every finite place, which
gives the adelic family of its valuations; the degree is evaluated at a CM point, where the frame function is an
algebraic number times `z₁^p/z₀^q` in the periods of two CM elliptic curves, by the Chowla–Selberg period, the Gram
determinant of a local basis and the product formula.

For `τ ∈ Φ` let
`𝓕_τ := det Lie_τ ⊗ (det Lie_{cτ})^{−1}` (equivalently `det(ω_τ)^{−1} ⊗ det(ω_{cτ})`), `Lie_σ` the eigen-submodules of the
setting. Metrise it by the Hodge inner product `π·H_A` on `Lie` (`H_A` the Riemann form of the polarisation; its determinant
on `det Lie` is dual to Deligne's metric `‖α‖² = (2π)^{−g}|∫α ∧ ᾱ|` on the line of invariant `g`-forms). Give it the
integral structure of the eigen-submodules on both factors: a local generator over a discrete valuation ring `O` is the
function on pairs of eigen-frames `(v, w)` (of ranks `p` at `τ` and `q` at `cτ`) that takes the value `1` on the integral
eigen-frames of the Lie algebra of the semi-abelian model over `O`. For a component `Z`, defined over a finite extension
`F″` of `F′`, write `ϱ(𝔭) := log N𝔭/[F″:ℚ]` for the finite places `𝔭` of `F″`. Prove:

(a) there is a section `s_{τ,Z}` of `𝓕_τ|_Z` with an inverse (no zeros or poles on `Z`), whose norm is constant on
`Z_σ(ℂ)` at every complex embedding `σ` of `F″` and whose valuation is the same number `ρ_{τ,Z}(𝔭)` at every integral
point of `Z` (with integral eigen-frames) over each finite place `𝔭` of `F″` above a prime good for the datum and the level
(ShimuraCompactifications §7.3), and at the finitely many other places; `ρ_{τ,Z}` has finite support, is rational, and is an integer at every `𝔭` not dividing `2·d_K·d_E` nor the level;
any two such sections differ by a factor in `F″^×`; and on every smooth projective toroidal compactification of `Z_ℂ`
(with simple normal crossings boundary) `s_{τ,Z}` extends to a section of the canonical extension of `𝓕_τ` without zeros
or poles, so that the canonical extension of `𝓕_τ` is trivial there.

(b) `deg(𝓕̄_τ|_Z) := Σ_𝔭 ρ_{τ,Z}(𝔭)·ϱ(𝔭) − mean_σ log‖s_{τ,Z}‖_σ = ((p − q)/2)·log Ω` for every `τ` and every `Z`; in
particular every algebraic point of `Z` has this height for `𝓕̄_τ`;

(c) for the integral structure multiplied at each `𝔭` by `(τ(𝔡_E)·d_K^{−1})^q` (`𝔡_E` the different of `E`) the degree is
`((p − q)/2)·log Ω + q·(log d_K − log rd_E)`, and `|log d_K − log rd_E| ≤ log rd_E`. For `E = K`, `log Ω = log Ω_K` and the
second term is `(q/2)·log d_K`: this is the integral structure of `(det Lie_{cτ})^{−1}` dual to `Lie_{cτ}` for the
`𝒪_K`-Hermitian pairing with values in the inverse different.

*Route.* (a) On a normal projective model of `Z` the line `𝓕_τ` has curvature zero for the Hodge metric; its monodromy is
the character `det` of the arithmetic group, with values in the norm-one units of `𝒪_E`, which are roots of unity, so it
is trivial on the neat level group and a horizontal section is single-valued. At a complex point of a smooth model of the
generic fibre, in frames of the two eigen-bundles of the Lie algebra of the semi-abelian scheme, the determinants of the
Hodge Gram matrices lie between `c·(1 + Σ_i|log|u_i||)^{−C}` and `C` (logarithmic periods, ProjectiveModelsAndPeriodBoundsOnShimuraVarieties §§6.2a (a),
6.7a); so the section and its inverse have at most logarithmic growth, and a holomorphic function without zeros on the
complement of the coordinate hyperplanes with this property extends to a holomorphic function without zeros;
resolution (ResolutionOfSingularitiesCharacteristicZero §5.2) and the comparison theorem for sections
(ComplexComparisonPartII C1.9, C2.2) make it algebraic. Two
such sections have a ratio without zeros on `Z` of constant absolute value at every complex embedding, hence locally
constant on `Z(ℂ)`, and `Z` is geometrically connected. Constancy of the valuations (at every `𝔭` at which the level is
good for the datum and the level): the smooth integral toroidal model of the component at `𝔭` (ShimuraCompactifications §7.3),
on which the frame function of the section is a rational function with vertical divisor; the special fibre of a component of
a smooth proper model with geometrically connected generic fibre is irreducible, so the divisor is a multiple of it and the
function is a unit times a power of a uniformiser. At a bad place a normal model may have a reducible special fibre (on
`xy = π` the unit `x` has valuations `1` and `0` at the sections `(π, 1)`, `(1, π)`), and the route of the constancy there is not given here. (b) The height of a
point is the same for all points of `Z`; evaluate it at a CM point of `Z` of type `(p, q)`, built from `ℰ₀`, an elliptic curve with
complex multiplication by `𝒪_K`, and its conjugate `ℰ̄₀` (`𝒪_K` acting through the conjugate embedding): up to isogeny the product
of `(ℰ₀ ⊗_{𝒪_K} Λ⁺)` and `(ℰ̄₀ ⊗_{𝒪_K} Λ⁻)` for the positive and the negative part of a Hermitian `𝒪_E`-lattice of the right signature
(one tensor product `ℰ₀ ⊗ Λ` has its Lie algebra of one type only, so both CM types are needed; PELModuli M3.8, M4.7; every
component of `Z(ℂ)` is uniformised by the Hermitian domain of a Hermitian `𝒪_E`-lattice `Λ′` of the genus, PELModuli M3.4, M3.5; `Λ′ ⊗ ℚ` has an orthogonal `E`-basis of `p` vectors of totally positive and `q` vectors of totally negative
norm, which can be chosen to be a basis of `Λ′` at any one given prime; the corresponding point is of this form up to an
isogeny prime to that prime, and the finite part of the degree is computed prime by prime with such points): the
section is an algebraic number times `z₁^p/z₀^q` in the periods of two CM elliptic curves (one for each sign of `√−d_K`);
the mean logarithmic period is `log Ω_K` (8.5); the finite places contribute through the Gram determinant of a local
basis and the different of `E`, and the product formula gives `((p − q)/2)·(log Ω_K − log rd_E + ½·log d_K)`, which is
`((p − q)/2)·log Ω` (Conventions). (c) `Σ_𝔭 ord_𝔭(τ(𝔡_E))·ϱ(𝔭) = log rd_E`, `Σ_𝔭 ord_𝔭(d_K)·ϱ(𝔭) = log d_K`, and
`rd_E ≥ rd_K = √d_K`.

*Checks.* `(p, q) = (1, 0)`, `E = K`: `𝓕_τ = Lie(ℰ₀)` has degree `½·log Ω_K = −h(ℰ₀)` (Deligne's normalisation,
`h(ℰ₀) = −½(L′/L)(0, χ_K) − ¼·log d_K`, 8.5). `(0, 1)`, `E = K`: `𝓕_τ = (Lie ℰ₀)^{−1}` has degree `−½·log Ω_K` for the Lie
lattice, and (c) adds `½·log d_K`. Writing `log Ω_K` for `log Ω` when `E ≠ K` changes the degree by
`((p − q)/2)·log(rd_E/√d_K)`, which after multiplication by a weight of size `a` is of the size of the main term of the chain's division inequality. With
`H_A` itself in place of `π·H_A` the degree changes by `((p − q)/2)·log π`. Local consistency at the CM point: the
eigen-submodule of `𝒪_E ⊗ 𝒪_{F″}` at `τ` is `τ(𝔡_{E/K})` times the eigen-quotient, so with `p` frame vectors in the
denominator and `q` in the numerator the finite log-norm of the generator at integral eigen-frames has the shape
`log‖r‖ − log‖τ(t)‖ − q·log‖𝔡_E‖ + (q − p)·log‖𝔡_{E/K}‖` (`r`, `t` algebraic numbers attached to the point, `t` a unit where the
chosen vectors form a local basis); summed with `log‖t‖ + log‖t̄‖ + log‖a‖ = −(p + q)·log‖𝔡_E‖` for the Gram determinant `a`,
the product formula turns this shape into (b).

*Sources:* (the arithmetic degree of the determinant line on unitary Shimura varieties is a Chowla–Selberg
period). (a): [FormalProof],
`Development/AutomorphicSpectrum/Proofs/DivisibilityProofs/ExistsConstSectionKroneckerCharStatement.lean`
(`GlobalTheory.T.exists_const_section_kronecker_char`),
`Development/AbelianVarietyTheory/Definitions/Foundations/ExistsFlatSecRankZero.lean` (`GlobalTheory.FlatLine.ConstSec`),
`Development/AbelianVarietyTheory/Definitions/Divisors/HtValOnSubset.lean` (`GlobalTheory.FlatCore.Laws`); the finite support
of `ρ_{τ,Z}`: [FormalProof], `Development/AbelianVarietyTheory/Proofs/DivisorProofs/ExistsArchSecOfUnf.lean`
(`GlobalTheory.FlatDenom.archSec_denom`); the last clause, in the form that on a toroidal flag space of `Z` every power
of `𝓕_τ` is generated by its global sections: [FormalProof],
`Development/AbelianVarietyTheory/Proofs/DivisorProofs/TorusFlagUnitWeightBundlesNef.lean`
(`GlobalTheory.NefUnit.isGenerated_unitWt`). (b) for `q = 0`: [FormalProof],
`Development/AbelianVarietyTheory/Definitions/Divisors/HtValOnSubset.lean` (`GlobalTheory.FlatCore.FrameDeg`),
`Development/AbelianVarietyTheory/Proofs/DivisorProofs/ComponentPointLastIndex.lean` (`GlobalTheory.DefCoreLie.frameDeg_def`),
`Development/AbelianVarietyTheory/Proofs/DivisorProofs/CmObjectDefiniteLieEigenLatticeDegreeDifferenceStatement.lean`
(`GlobalTheory.T.cmObject_definite_lieEigenLattice_degree_difference`). (c): [FormalProof],
`Development/AbelianVarietyTheory/Definitions/Foundations/ExistsFlatSecRankZero.lean` (`GlobalTheory.FlatLine.flDefect_vw`,
`GlobalTheory.FlatLine.FlatSec.deg_eq_toFrame`),
`Development/AutomorphicSpectrum/Proofs/GeometryProofs/FlatDegreeHoldsStatement.lean` (`GlobalTheory.T.FlatDegree_holds`).
*Needs:* 8.5; PELModuli M1.7, M2.8, M3.4, M3.5, M3.8, M4.7;
ProjectiveModelsAndPeriodBoundsOnShimuraVarieties §§6.2a (a), 6.7a, 7.31a (b) and ShimuraCompactifications §§7.3, 7.31; AutomorphicBundles §5.3 and DiscreteSeriesCoefficientsAndAutomorphicMetrics §10.1;
ResolutionOfSingularitiesCharacteristicZero §5.2; ComplexComparisonPartII C1.9, C2.2;
ComplexMultiplicationAndExplicitReciprocityPartII §§1.4, 4.6.

### 8.12 Twisting by the flat line

*Origin:* particular to this proof: multiplication by powers of the flat section shifts parallel weights and moves the
slopes of the lattices of integral forms by `−(p − q)·log Ω·Σ_τ w_τ`, up to `2·Σ_{ℓ∈S_bad} log ℓ` from the bad primes;
elementary given the flat line.

*Method of the formal proof:* forms are multiplied by powers of the flat section, whose degree adds to the slope and whose
valuations are integers outside the bad primes.

Let `Z`, `s_{τ,Z}`, `ρ_{τ,Z}` be as in 8.11, `w ∈ ℤ^Φ` and
`s^w = ⊗_τ s_{τ,Z}^{−w_τ}`, a section of the line of weight `par(w)`, and let `S_bad` be the set of primes dividing
`2·d_K·d_E` and the level. Prove: (a) multiplication by `s^w` is an isomorphism of `F″`-spaces from the forms (and from the cusp forms) of weight `λ`
on `Z` onto those of weight `λ + par(w)`, preserving ranks; at every complex embedding it multiplies Petersson norms by a
constant, and it changes the valuations of values at ALL integral points over `𝔭` by the same amount
`−Σ_τ w_τρ_{τ,Z}(𝔭)`. (b) Hence

`μ(M_{λ+par(w)}(Z)) ≥ μ(M_λ(Z)) − (p − q)·log Ω·Σ_τ w_τ − 2·Σ_{ℓ∈S_bad} log ℓ`,

and, applying this also to `(λ + par(w), −w)`,

`|μ(M_{λ+par(w)}(Z)) − μ(M_λ(Z)) + (p − q)·log Ω·Σ_τ w_τ| ≤ 2·Σ_{ℓ∈S_bad} log ℓ`.

There is no term in `q` and none in `rd_E`.

*Route.* (a) is 8.11 (a): `s^w` is a section of the canonical extension without zeros or poles on a toroidal
compactification. (b) The degree of the lattice changes by the rank times the degree of `s^w` (SlopesOfHermitianVectorBundles
§§1.2, 1.7) exactly at the places where its valuation is an integer, that is outside `S_bad` (8.11 (a)); above `S_bad` the
valuation may be fractional and rounding costs at most `log ℓ` per prime and unit of rank in the normalised degree;
`μ = 2μ̂` doubles 8.11 (b).

*Check.* `w = 0`: the bound reads `μ ≥ μ − 2Σ log ℓ`, the rounding allowance only. Using the shifted integral structure of
8.11 (c) on one side and the Lie lattices on the other would introduce `2q·(log d_K − log rd_E)·Σ_τ w_τ`, whose absolute
value is at most `2q·log rd_E·Σ_τ|w_τ|`.

*Sources:* (a): [FormalProof],
`Development/AbelianVarietyTheory/Proofs/DivisorProofs/ExistsTwSecOfConst.lean` (`GlobalTheory.FlatTwisting.twSec_of_flat`),
`Development/AbelianVarietyTheory/Definitions/Divisors/MulSmulIdemMem.lean` (`GlobalTheory.FlatTw.TwSec`). (b) follows from
[FormalProof], `Development/AbelianVarietyTheory/Proofs/DivisorProofs/ExistsTwSecOfConst.lean`
(`GlobalTheory.FlatTwisting.twSec_of_flat`), whose twisting section of weight `par(w)` has integral valuations outside
`S_bad` and the degree `Σ_τ w_τ·c_τ − q·(log rd_E − log d_K)·Σ_τ w_τ = −((p − q)/2)·log Ω·Σ_τ w_τ`, `c_τ` the negative of the
degree of 8.11 (c), with the change of degree under such a section,
`Development/AbelianVarietyTheory/Proofs/DivisorProofs/CuspFormSupLatticeDegreeTwistLowerBound.lean`
(`GlobalTheory.FlatTw.degOn_add_rank_mul_degLo_le`). [FormalProof] states the first bound of (b), in its case `m = 0` (it
also twists by a natural number `m`, with a further term in `m` in the lower bound), with the lower bound
`Σ_τ w_τ·c_τ − q·log rd_E·Σ_τ|w_τ|` of that degree in place of its value, so with terms in `q` and `rd_E`:
`Development/AbelianVarietyTheory/Proofs/DivisorProofs/FlatLineThetaRootTwistTwistingSection.lean`
(`GlobalTheory.FlatRootTwist.flat_root_twist`, which takes one named statement as a hypothesis).
*Needs:* 8.11; SlopesOfHermitianVectorBundles §§1.2, 1.7; RowTowerAndRallisIdentities §5.1.

### 8.13 The definite step

*Origin:* adapted from the heights of CM abelian varieties (the Chowla–Selberg formula; the key formula of Moret-Bailly):
a lower bound for the slope of the lattice of integral forms on a definite unitary group, computed point by point.

*Method of the formal proof:* at each CM point the lattice obtained from the eigen-lattices of the Lie algebra by the Schur
functors of the `a_τ` and from the `n`-th power of the theta line maps integrally, with full rank, into the forms
supported at the point; its slope is linear in the weight with the Lie degree of 8.11 as coefficient, minus the
logarithms of the dimensions, and the degree of the theta line is bounded below through the key formula by
`½·Σ_τ deg(det ω_{x,τ}) + |Φ|·p·(¼·log 2π − ½·log rd_E)`; a change of level passes to the eigen-lattices of a group acting freely on the points.

Let `q = 0` (a totally definite `W` of dimension `p`). Then `Sh` is a
finite set of points, each an abelian variety with complex multiplication of signature `(p, 0)` along `Φ`. A *weight* is
`w = (a, n)` as in 8.17a: for every `τ ∈ Φ` a partition `a_τ` (non-increasing, entries `≥ 0`, at most `p` parts) and an
even integer `n ≥ 0`, the scalar weight. A form of weight `w` is a function of the points of this set together with a frame
of every `Lie_{x,τ}` and a nonzero section `s` of the line of the principal polarisation, transforming by the Schur functors
of the `a_τ` in the frames and by the `n`-th power in `s`. Its *norm at a point* `x` is the norm of its value, in frames
orthonormal for the Hodge inner product `π·H_A` of 8.11, for the invariant Hermitian form `⟨,⟩_λ` of the Conventions (the
highest-weight vector has norm one), divided by `‖s‖^n`, where `‖s‖²` is the mean over a period parallelogram of
`|θ_s(z)|²·e^{−π·H(z, z)}`, `θ_s` the theta function of `s` and `H` the Riemann form. In the highest-weight model, where a form
is a scalar function of the frames, its *norm at a frame* is the absolute value of its value at the Gram–Schmidt
orthonormalisation of the frame for `π·H_A`, divided by `‖s‖^n`; the norm at the point dominates the norm at every frame over
it, and its square is `∏_τ dim V_{a_τ}` times the mean of the squares of the norms at the orthonormal frames over the point.
Prove: (a) at every point `x` the lattice of the integral forms of
weight `w` supported at `x`, with the norm at `x`, has slope

`μ ≥ −Σ_τ (|a_τ| + n·p/2)·log Ω − Σ_τ log dim V_{a_τ} − n·|Φ|·p·(log rd_E − ½·log 2π)`,

where `log Ω = μ(Lie_{x,τ}) = 2deg(det Lie_{x,τ})/p` (8.11 (b) with `q = 0`); (the lattice obtained from the Lie lattices by
the Schur functors of the `a_τ` and from the `n`-th power of the theta line maps into it with full rank and has slope at least
this bound for the norm at `x`); (b) if a finite group `S` acts through
the level, freely on the points, and `ψ` is a character of `S` with values in the coefficient field, the `ψ`-eigen-lattice
of the lattice of integral forms of weight `w` is nonzero and has slope at least the right-hand side of (a) for the
Petersson norm normalised as the `L²` norm for the invariant probability measure
(`‖f‖² = Σ_x|Γ_x|^{−1}‖f(x)‖²/Σ_x|Γ_x|^{−1}`), and also for the smaller norm in which `‖f(x)‖²` is replaced by the mean of the
squares of the norms at the orthonormal frames over `x`, that is by `‖f(x)‖²/∏_τ dim V_{a_τ}` (the `L²` norm of the scalar frame
function for the invariant probability measure on the adelic quotient: the norm in which [FormalProof] states (b) and (c));
(b′) the lattice of all integral forms of weight `w` is the orthogonal direct
sum over the points of the lattices of (a), for the product of the Conventions (the metric at `x` weighted by
`|Γ_x|^{−1}`), so its slope for that product is at least the right-hand side of (a). The slope for the product of the
Conventions is the slope for the first of these two norms minus `log Σ_x|Γ_x|^{−1}`, and the slope for the second minus
`log Σ_x|Γ_x|^{−1} + Σ_τ log dim V_{a_τ}`. (c) For the definite step of the chain (`W = W_m` of ThetaChainsOnDefiniteUnitaryGroups
§2.2, `p = r`, the weight of step `m` of ThetaChainsOnDefiniteUnitaryGroups §2.3) under the size conditions of
ThetaChainsOnDefiniteUnitaryGroups §2.1: the part `M^W_m` of the lattice of integral cusp forms of weight `λ^W_m` cut out by its
type at the type primes (8.19), with the second norm of (b), satisfies `μ(M^W_m) ≥ −p·Σ_τ w_m(τ)·log Ω − C·B₀·log log x`, `C`
not depending on `x`. For the product of the Conventions the left side is smaller by `log Σ_x|Γ_x|^{−1} + Σ_τ log dim V_{a_τ}`;
the second term is at most `C·B₀·log log x`, and a bound for the first is this roadmap's own (it is not part of [FormalProof]).

*Route.* (a) At a CM point the Schur part of weight `a` is the representation of `∏_τ GL(Lie_{x,τ})` of highest
weight `a` evaluated on the Lie lattices; its degree is linear in `a` with coefficient the Lie degree, which 8.11
computes, and the integral structure of values at integral frames costs at most the logarithm of the dimension per
place. The line of the scalar weight is the line of the theta section, not a power of the determinant line with the Hodge
metric: its degree at a point is at least `½·Σ_τ deg(det ω_{x,τ}) + |Φ|·p·(¼·log 2π − ½·log rd_E)`, by the key formula (an
equality at the infinite places, an inequality at the finite places, where the eigen-lattices of the Lie algebra differ
from the Lie algebra by at most the different of `E`); this is the last term of (a), which vanishes for `n = 0`. (b) The
`ψ`-eigen-lattice is the orthogonal sum over the `S`-orbits of the eigen-lattices of the forms supported on one orbit, each
isomorphic by the value at one point `x` of the orbit (`S` acts freely and isometrically, `ψ` has unit values) to the
lattice of (a) at `x` with its norm squared multiplied by `|S|·|Γ_x|^{−1}/Σ_y|Γ_y|^{−1} ≤ 1`. (b′) The class-sum description
of the Petersson product (Conventions). (c) Write `λ^W_m` as `w_m·(1, …, 1)` plus a
remainder: the main term is `−p·Σ_τ w_m(τ)·log Ω`; the remainder (at most `|log Ω|·Σ_τ|λ^W_m(τ) − w_m(τ)(1, …, 1)|`), the
logarithms of the dimensions and the term `n·|Φ|·p·log rd_E` of (a) (`n = r + t`) are at most `C·B₀·log log x` under the size
conditions of ThetaChainsOnDefiniteUnitaryGroups §2.1; the logarithm of the mass `Σ_x|Γ_x|^{−1}`, needed only for the product
of the Conventions, is to be bounded by `C·B₀·log log x` (this roadmap's own step).

*Sources:* ingredients (algebraic modular forms; CM abelian varieties). (b): [FormalProof],
`Development/AbelianVarietyTheory/Proofs/DivisorProofs/EigenlatticeSlopeLowerBoundDefiniteCaseStatement.lean`
(`GlobalTheory.T.eigenlattice_slope_lower_bound_definite_case`),
`Development/AbelianVarietyTheory/Definitions/Divisors/EigLatLe.lean` (`GlobalTheory.DefPt.defBound`).
*Needs:* 8.11, ThetaChainsOnDefiniteUnitaryGroups §3.1;
ClassicalGroups §5.1 (Weyl dimension); ThetaLiftsForDefiniteUnitaryGroups §1.6 (integral structures);
ThetaChainsOnDefiniteUnitaryGroups §2.1, ThetaChainsOnDefiniteUnitaryGroups §2.3.

### 8.14 Change of weight by a short section of a power of the Hodge line

*Origin:* adapted from Bost's slope inequality (Bost (1996)): slopes are compared across a change of weight and a descent
to an isotypic part by multiplying with a section whose group determinant is nonzero, found by point separation after
Angehrn and Siu (1995) and Kollár (1997).

*Method of the formal proof:* the inequality is Bost's slope inequality, with quotient term, for the injective integral
map `f ↦ (tr_ψ(f·γ_h^*ς))_h` into the orthogonal power `B_ψ^{|S|}`, whose height is at most `2P` by (ii) and whose target
has minimal slope at least `−2Λ` by (iii); injectivity is the group determinant lemma (multiplication by the adjugate);
the section `ς` comes from separating the points of an orbit on a resolved modification of the quotient, over `ℂ`, by
sections of the canonical bundle twisted by `m > binom(n + 1, 2)` times a nef and big class (an isolated non-klt centre
and Nadel vanishing), which makes the group determinant that of a permutation matrix at one point.

Let
`ω_q := ⊗_{τ∈Φ} det(ω_{cτ})` (the determinant of the Hodge piece of rank `q`; its square is the Hodge line `det Lie(A)^∨` up
to the flat lines of 8.11), `q ≥ 1`. Let `Sh′ = Sh(W, K′)` with `K′ ⊂ K_W` normal, `S = K_W/K′` acting on `Sh′` by the
automorphisms `γ`, freely on `Sh′(ℂ)`, everything defined over a number field `𝕃′`; `c ≥ 1`, a weight `λ` and a character
`ψ` of `S`. Let `A_λ ≠ 0` be the lattice of integral cusp forms of weight `λ` on `Sh′` and `B_ψ` the `ψ`-isotypic part of the
lattice of integral cusp forms of weight `λ + c·ω_q` (the weight of `ω_q^c` added), both finitely generated with the
Hermitian Petersson norms, the pull-backs `γ^*` preserving the lattices and isometric; `tr_ψ(F) := Σ_{δ∈S} ψ(δ)^{−1}γ_δ^*F`. Suppose:

(i) `ς` is an integral form of weight `c·ω_q` on `Sh′` (a section of the canonical extension of `ω_q^c`) whose *group determinant* `det(γ_{hg}^*ς)_{h,g∈S}` is nonzero at the
generic point of every component (equivalently, is not a zero divisor of the ring of sections);

(ii) `Σ_{h∈S} ‖tr_ψ(f·γ_h^*ς)‖² ≤ e^{2P}·‖f‖²` for every form `f` of weight `λ`, at every complex embedding; this holds with
`e^{2P} = |S|³·e^{2P₁}` if, for every automorphism `γ` of the level structure of `K′` (in particular for every `γ ∈ S`), `γ^*` is
isometric and `‖f·γ^*ς‖ ≤ e^{P₁}·‖f‖` for all `f` and every embedding;

(iii) `B_ψ ⊗ 𝕃′` is spanned by elements of `B_ψ` of norm at most `e^Λ` at every embedding, `Λ ≥ 0`;

(iv) `rk A_{λ+2c·ω_q} ≤ (1 + ε_rk)·rk A_λ` with `ε_rk ≥ 0`.

Then `rk A_λ ≤ |S|·rk B_ψ ≤ rk A_{λ+2c·ω_q}` and

`μ(B_ψ) ≥ μ(A_λ) − 2P − ε_rk·(|μ(A_λ) − 2P| + 2Λ)`;

more generally `μ(B_ψ) ≥ t − ε_rk·(|t| + 2Λ)` for every real `t ≤ μ(A_λ) − 2P`.

Moreover (existence): if `p ≥ 1`, `q ≥ 1`, `[F:ℚ] ≥ 3` (`F` the maximal totally real subfield of `E`; in particular
`dim Sh ≥ 2`, hence Koecher's principle of the setting), every element of `S`
other than `1` is unipotent at a neat prime of the level (so that an element of `S` fixing a complex point is the
identity) and `c ≥ N + binom(dim Sh + 1, 2) + 1`, some section of `ω_q^c` vanishing at the cusps satisfies (i); if moreover on
every component the lattice of integral cusp forms of weight `c·ω_q` (the sections of `ω_q^c` vanishing at the cusps) is generated
as an abelian group by at most `n_θ` sections `θ_i` of `L²` norm at most `Λ_θ` at every embedding, `Λ_θ ≥ 1`, and
`|θ(y)|² ≤ β_θ·‖θ‖²` pointwise for these sections (`β_θ ≥ 1`), then `ς` may be taken among the
combinations `Σ_i n_iθ_i` with integers `0 ≤ n_i ≤ |S|²`, `sup|ς| ≤ n_θ·|S|²·√β_θ·Λ_θ`, and then (ii) holds with
`P₁ ≤ log(n_θ·|S|²·√β_θ·Λ_θ) ≤ log(n_θ·|S|²·β_θ·Λ_θ)`.

*Route.* `Ψ_S = (tr_ψ(f·γ_h^*ς))_h : A_λ → B_ψ^{|S|}` maps into `B_ψ^{|S|}`: the product of a cusp form with a form is a cusp
form (setting), integral at the integral points, and of weight `λ + c·ω_q`. *Group-determinant lemma* (for a finite group acting on
a commutative ring and an element with regular group determinant): if all `tr_ψ(f·γ_h^*ς)` vanish, the vector
`(ψ(g)^{−1}γ_g^*f)_g` is killed by the matrix `(γ_{hg}^*ς)_{h,g}`; multiplying by the adjugate kills it by the group
determinant, so `f = 0`: `Ψ_S` is injective; dually `(F_h)_h ↦ Σ_h F_h·γ_h^*ς` is injective on tuples of `ψ`-eigenvectors,
which maps `B_ψ^{|S|}` into the forms of weight `λ + 2c·ω_q`; these give the two rank inequalities. (ii) says
`ht(Ψ_S) ≤ 2P` (the norm on `B_ψ^{|S|}` is the orthogonal sum); `μ_min(B_ψ^{|S|}) ≥ −2Λ` by (iii) (SlopesOfHermitianVectorBundles
§3.4 (v)); the slope inequality with quotient term (SlopesOfHermitianVectorBundles §2.4 (e)) with `μ(B_ψ^{|S|}) = μ(B_ψ)` (SlopesOfHermitianVectorBundles §1.7)
gives `|S|·rk B_ψ·μ(B_ψ) ≥ rk A_λ·(μ(A_λ) − 2P) − 2Λ·(|S|·rk B_ψ − rk A_λ)`; with `x = μ(A_λ) − 2P ≥ t` and
`0 ≤ θ := 1 − rk A_λ/(|S|·rk B_ψ) ≤ ε_rk/(1 + ε_rk)` this reads `μ(B_ψ) ≥ (1 − θ)x − 2θΛ ≥ t − ε_rk(|t| + 2Λ)`, for every `ε_rk ≥ 0`.
For (ii) from the pointwise bound: `tr_ψ(f·γ_h^*ς)` is a sum of `|S|` terms `ψ(δ)^{−1}γ_δ^*(f·γ_h^*ς)`, `|ψ(δ)| = 1`, pull-backs
are isometric, so each `φ_h` has norm `≤ |S|e^{P₁}` and the sum of the `|S|` squares is at most `|S|³e^{2P₁}`. Existence:
descend `ω_q` to the quotient `W` of an equivariant normal projective compactification of a component, isomorphic over an open set to an equivariant smooth projective toroidal compactification (ShimuraCompactifications Layer 2), by the stabiliser of the component (an element of the group fixing a point and acting trivially on its residue field acts trivially on the fibre of the line, by its unipotence at a neat prime; descent of a linearised line bundle to a finite quotient, Kempf's lemma, ProjectiveModelsAndPeriodBoundsOnShimuraVarieties §9.1), where it is nef and big:
`det ω = ω_q² ⊗ ⊗_τ𝓕_τ^{−1}`, and on the compactification every `𝓕_τ` is trivial (8.11 (a)), so `ω_q² ≅ det ω` there; a positive
power of the Hodge line `det ω` of the semi-abelian extension is the pull-back of an ample line bundle on the minimal
compactification (ShimuraCompactifications §§7.13, 7.17, on the generic fibre of the integral toroidal model of ShimuraCompactifications §7.3 for a smooth projective cone system), so its degree on every complete curve, curves in the boundary included, is `≥ 0`, and
`ω_q` is nef (the seminegativity of ProjectiveModelsAndPeriodBoundsOnShimuraVarieties §6.2a (b), which holds for every
semi-abelian scheme over a curve in characteristic zero, curves in the boundary included, gives this as well); `det ω`
is big because `ω^{⊗a} ⊗ O(−Σ_ρ d·pol(ρ)D_ρ)` is ample for large `a` (ProjectiveModelsAndPeriodBoundsOnShimuraVarieties §7.17a (a), for the smooth integral toroidal model of ShimuraCompactifications §7.3 at a good prime and on the generic fibre) and the boundary twist is effective; bigness and
nefness pass to the quotient `W` and back (finite surjective maps); `ω_q` is ample at the generic point.
The separation is made over `ℂ`. Take a smooth projective modification `W′` of `W` and a smooth projective modification of
the compactification mapping onto it, étale over an open set of `W′` that contains its generic point; `ω_q` descends to
a class on `W′` that is nef, big and ample at the generic point. Fix a complex embedding of the field of definition and
base change both varieties, the map and the bundles to `ℂ`: nefness, bigness and étaleness are preserved. Let the
points of the fibre be complex points over the generic point of the component and `x` their common image, a complex
point of `W′_ℂ` over its generic point. Separate them by sections of `K + m·ω_q + (`nef`)`,
`m > c₀ := binom(n + 1, 2)`, `n = dim Sh`: every positive-dimensional subvariety `Z ∋ x` of `W` has `ω_q^{dim Z}·Z ≥ 1`, so the isolated non-klt centre theorem (MultiplierIdealsOfPairsAndPointSeparation §9.12, with `c_d = c₀`, in its form with `D` numerically equivalent to `N` itself), applied to the smooth projective complex variety `W′_ℂ` with boundary `0`, gives an effective `ℚ`-divisor `D ≡ (c₀ + ½)·ω_q` on it, log canonical near `x` and klt off `x` near `x`; its pull-back to
the cover is non-klt exactly along the fibre near the fibre (the quotient map is étale there, and klt is étale local);
Nadel vanishing for pairs (MultiplierIdealsOfPairsAndPointSeparation §9.10c) for `K + m·ω_q + (nef) −`
(pull-back of `D`), which is nef and big because `m > c₀`, makes the sections separate the isolated points of the
cosupport. The sections over `ℂ` are combinations of sections over the field of definition (flat base change), so the
forms defined over it separate the points. The canonical bundle of the toroidal compactification is written through
automorphic weights by the logarithmic Kodaira–Spencer isomorphism (ShimuraCompactifications §7.12): up to the flat lines, which are trivial there
(8.11 (a)), it is `N·ω_q` minus the boundary, so the term `(nef)` is the multiple `(c − N − m)·ω_q`, nef by the above
(`c − N − m ≥ 0` for `m = c₀ + 1`), and the sections of `K + m·ω_q + (c − N − m)·ω_q` are the sections of `ω_q^c` vanishing on the
boundary; the log resolutions are by principalisation (ResolutionOfSingularitiesCharacteristicZero §5.1). The numerical
facts on nef bundles are these: nefness of pull-backs, and of a bundle whose pull-back along a surjective map is nef
(AlgebraicModuliForArithmeticGeometryPartII §1.5); bigness of a nef bundle on an integral proper variety exactly when its
top self-intersection is positive (AlgebraicModuliForArithmeticGeometryPartII §1.6); non-negative intersection numbers of
nef bundles (AlgebraicModuliForArithmeticGeometryPartII §1.7 (ii)); and asymptotic Riemann–Roch for a nef bundle in the
form `vol(L) = (L^n)` (ArakelovGeometryAndAbelianHeightsPartII §0.3 (1′)). At a separated orbit
the matrix `(ς(γ_{hg}y))` can be made a permutation matrix times a nonzero scalar, so the group determinant is nonzero at
the generic point of every component, and one section serves all components (the conditions are nonvanishing of finitely
many polynomials). Shortness: replacing one coefficient at a time by an integer, `t ↦ det(…)(v + t·θ_i)` is at the generic
point of each component a polynomial of degree `≤ |S|`, nonzero at the original coefficient, and depends on `t` only for
the `≤ |S|` components of an orbit, so some `0 ≤ t ≤ |S|²` is admissible; at a point only the generators on its component
contribute, each of absolute value `≤ √β_θ·Λ_θ`, which gives `|ς(y)| ≤ n_θ·|S|²·√β_θ·Λ_θ` and `‖f·γ^*ς‖ ≤ sup|ς|·‖f‖`.

*Checks.* (Summed, not pointwise.) `S` acting simply transitively on a finite set with the probability measure,
`A_λ = 𝒪^S` (`μ(A_λ) = log|S|`), `ς = 𝟙_{1}` (group determinant `±1`), `B_ψ = 𝒪·ψ` (`μ(B_ψ) = 0`): the pointwise constant is
`P₁ = 0`, while `Σ_h‖tr_ψ(f·γ_h^*ς)‖² = Σ_x|f(x)|² = |S|·‖f‖²`, so (ii) holds with `2P = log|S|` exactly and the
conclusion is the equality `μ(B_ψ) = μ(A_λ) − log|S|`; with `2P₁ = 0` in place of `2P` it would be false.
(Group determinant, not translates.) For `S = {1, γ}` acting on two points `y, γy` and `ς ≡ 1`, no translate of `ς`
vanishes, the group determinant `ς² − (γ^*ς)²` is `0`, and for trivial `ψ` the function with values `1` at `y` and `−1`
at `γy` is killed by every `tr_ψ(·γ_h^*ς)`.

*Sources:* (this form; Bost's slope method in the descent; the group determinant of Dedekind and Frobenius as a criterion
for injectivity of twisted traces; for abelian `S` it factors, up to sign, into the twisted traces `Σ_g ψ(g)γ_g^*ς`
over the characters `ψ` of `S`, ClassicalArithmeticCompletion §7.5). The inequality: [FormalProof],
`Development/AbelianVarietyTheory/Proofs/DivisorProofs/HtMapLeOfPoints.lean` (`GlobalTheory.DescentFamily.descent`).
In the route, the canonical bundle of the toroidal compactification through automorphic weights, with an effective
divisor supported on the boundary in place of the boundary: [FormalProof],
`Development/AbelianVarietyTheory/Proofs/DivisorProofs/ExistsToroidalCanonicalBundleWeightLineStatement.lean`
(`GlobalTheory.T.exists_toroidalCanonicalBundle_weight_line`); the separation of the points by the forms defined over the
field of definition: [FormalProof],
`Development/AbelianVarietyTheory/Proofs/DivisorProofs/SectionsSeparateQuotientGenericFibreDescendsStatement.lean`
(`GlobalTheory.T.sections_separate_quotient_generic_fibre_descends`).
*Needs:* 8.11; SlopesOfHermitianVectorBundles §§1.2, 1.7, 2.4 (e), 3.4 (v);
AlgebraicModuliForArithmeticGeometry §1.6 (big line bundles); AlgebraicModuliForArithmeticGeometryPartII §§1.5, 1.6, 1.7 (ii);
ArakelovGeometryAndAbelianHeightsPartII §0.3 (1′); MultiplierIdealsOfPairsAndPointSeparation §§9.10c, 9.12;
ResolutionOfSingularitiesCharacteristicZero §5.1; ShimuraCompactifications §§2.3, 2.6, 2.7 and 2.9 (smooth projective toroidal compactifications and their models over the reflex field); ShimuraCompactifications §§7.3, 7.12, 7.13, 7.17, 7.22; ProjectiveModelsAndPeriodBoundsOnShimuraVarieties §7.17a (a);
ComplexComparisonPartII C1.9, C2.2 (GAGA, through 8.11 (a)); ProjectiveModelsAndPeriodBoundsOnShimuraVarieties §9.1; AutomorphicBundles §§0.5, 5.3.

### 8.14a Nefness away from the cut-off: a degree inequality on curves

*Origin:* particular to this proof: an inequality for the degrees of arbitrary sub-bundles of the eigen-parts of the Lie
algebra of a semi-abelian scheme on a curve in characteristic `ℓ`, under `4|Φ|·M ≤ (ℓ − 2)·g`; nearest published results:
Yuan (2021), the identity `h(A/G) = h(A) − (ℓ − 1)·deg Lie(G)` for a height-one subgroup `G`, flat over a curve in
characteristic `ℓ` (Theorem 2.9 (2) of arXiv:1808.03960), which with `h ≥ 0` gives `(ℓ − 1)·m₀ ≤ deg ω` over `ℙ¹` for the
sub-bundle of `Lie` of largest degree (Lemma 2.4 there), and Yang (2025), nef cones of automorphic line bundles on unitary Shimura varieties in positive characteristic.

*Method of the formal proof:* a slope argument on the curve: the Frobenius pull-back of a sub-bundle of largest degree
`m₀` of the Lie bundle is placed in the de Rham bundle, and counting degrees through the Hodge and conjugate sequences
gives `(ℓ − 2)·m₀ ≤ deg ω`; conjugate eigen-parts are shown to have equal degree, and an Abel summation with the gap
condition gives the inequality. The published bound over `ℙ¹` for the sub-bundle of largest degree comes instead from the quotient
by a height-one subgroup and the nonnegativity of the height, and the published cones come from Hasse invariants on
strata rather than from slopes on a curve.

Let
`ℓ > 2` be a prime unramified in `E`, `k₀` a field of characteristic `ℓ` containing the images of the embeddings of `E`,
`C` a smooth projective curve over `k₀`, and `G → C` a semi-abelian scheme with `𝒪_E`-action, with eigen-sub-bundles
`Lie_σ` of its Lie algebra `Lie` of ranks `rk Lie_τ = p`, `rk Lie_{cτ} = q` for `τ ∈ Φ` with `p, q ≥ 1` (no fibre need be abelian),
`ω := Lie^∨`; assume that there are a vector bundle `H` on `C` of rank `2·rk Lie` with an action of `𝒪_E` and exact sequences of
vector bundles `0 → ω → H → Lie → 0` and `0 → Fr^*Lie → H → Fr^*ω → 0`, compatible with `𝒪_E`, the action on `ω = Lie^∨` being the
dual action composed with the conjugation of `E` (*conjugate data* for `G` on `C`). For a principally polarised abelian
scheme over `C`, `H` may be taken to be the de Rham homology with its two filtrations; in general conjugate data are
supplied by ProjectiveModelsAndPeriodBoundsOnShimuraVarieties §6.9a. Let `W_{τ,i} ⊂ Lie_τ` (`0 < i < p`) and `L_{τ,n} ⊂ Lie_{cτ}` (`0 < n < q`) be saturated sub-bundles, not
necessarily nested, `W_{τ,0} = L_{τ,0} = 0`, `W_{τ,p} = Lie_τ`, `L_{τ,q} = Lie_{cτ}` (`τ ∈ Φ`), and `μ_{τ,1} ≥ ⋯ ≥ μ_{τ,N}` reals
with `|μ_{τ,i}| ≤ M` and `μ_{τ,p} − μ_{τ,p+1} ≥ g` for every `τ`. If `4|Φ|·M ≤ (ℓ − 2)·g`, then

`−Σ_{τ∈Φ} [ Σ_{i<p} μ_{τ,i+1}·(deg W_{τ,i+1} − deg W_{τ,i}) + Σ_{m<q} μ_{τ,p+m+1}·(deg L_{τ,q−m−1} − deg L_{τ,q−m}) ] ≥ 0`.

*Route.* Let `e = deg ω` and `m₀ ≥ 0` the largest degree of a sub-bundle of `Lie`. (1) For a sub-bundle `W₀` of degree `m₀`,
`Fr^*W₀ ⊂ Fr^*Lie ⊂ H` has degree `ℓ·m₀`; its image in `Lie` has degree `≤ m₀`, and its intersection with `ω` has degree
`≤ max(0, m₀ + e)` (a nonzero sub-bundle of `ω` is dual to a quotient of `Lie`); so if `m₀ + e ≥ 0`, `ℓ·m₀ ≤ 2m₀ + e`, that is
`(ℓ − 2)·m₀ ≤ e`, and `e ≥ 0`; the case `m₀ + e < 0` does not occur (it would give `ℓm₀ ≤ m₀`, so `m₀ = 0`, and the same count
for `Fr^*Lie`, of degree `−ℓe`, would give `−ℓe ≤ 0`, against `e < 0`). (2) `x_τ := deg Lie_τ − deg Lie_{cτ}` is the degree of the
`τ`-part of `H` by the Hodge filtration and `ℓ·x_{φ^{−1}τ}` by the conjugate one (`φ` the Frobenius permutation of the labels,
`ℓ` unramified); around a Frobenius orbit `x_τ = ℓ^k·x_τ`, so `x_τ = 0` and `Σ_{τ∈Φ} deg Lie_τ = −e/2`. (3) Abel summation: the
left side is `Σ_τ[−g_τ·deg Lie_τ − Σ_{0<i<p}(μ_{τ,i} − μ_{τ,i+1})·deg W_{τ,i} − Σ_{0<n<q}(μ_{τ,p+q−n} − μ_{τ,p+q−n+1})·deg L_{τ,n}]` with
`g_τ = μ_{τ,p} − μ_{τ,p+1} ≥ g`; write `g_τ = g + (g_τ − g)`, use `Σ_τ deg Lie_τ = −e/2` for the part with `g`, and bound every
degree by `m₀`: the remaining coefficients are `≥ 0` and add up to `Σ_τ(μ_{τ,1} − μ_{τ,N} − g) ≤ 2|Φ|M`, so the left side is
`≥ g·e/2 − 2|Φ|M·m₀ ≥ 0` by (1). No nestedness is used, and no fibre of `G` is required to be abelian: only the ranks of
`Lie_τ`, `Lie_{cτ}` and the two filtrations enter.

*Check.* `|Φ| = 1`, `p = q = 1`, `μ = (M, −M)`, `g = 2M`: the condition is `4M ≤ 2(ℓ − 2)M`, true for `ℓ ≥ 4`, and the
inequality reads `−M·(deg Lie_τ + deg Lie_{cτ}) = M·e ≥ 0` (step (1)); the content of the statement lies in unequal
entries, where single eigen-pieces of positive degree must be paid for by the gap. Since `g ≤ 2M`, the condition
`4|Φ|M ≤ (ℓ − 2)g` forces `ℓ ≥ 2|Φ| + 2` when `M > 0`: at smaller primes the statement is empty. Sub-bundles of `Lie` of
positive degree do occur in characteristic `ℓ`, so the route cannot go through seminegativity of sub-bundles, which holds
in characteristic zero only.

*Sources:* (statement; follows from [FormalProof],
`Development/AutomorphicSpectrum/Statements/GeometryStatements/CurveSemiAbelianConjecture.lean`
(`GlobalTheory.CompanionTheory.Ar.Conj.CurveSemiAbelianConjecture`), proved there without hypotheses as
`GlobalTheory.T.curveSemiAbelianConjecture`, `Development/AutomorphicSpectrum/Proofs/GeometryProofs/M2CurveEstablishedStatement.lean`). *Needs:* FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.1 (relative Frobenius and
Verschiebung); ProjectiveModelsAndPeriodBoundsOnShimuraVarieties §6.9a (conjugate data), assumed in the statement.

### 8.14b Local facts for the `𝔩`-torsion at a good prime

*Origin:* particular to this proof: the comparison, by type under `𝒪_E`, of the functions on the `𝔩`-torsion that are
regular modulo `ℓ` and `τ`-linear with the Lie and Hodge–Tate lattices, triangular along a flag with Raynaud's coordinates
on the diagonal, of which (L1) is known in kind; nearest published result: Fargues (2011), the bound for the cokernel of
the Hodge–Tate map of a finite flat group scheme and its computation along a flag of subgroups of prime order.

*Method of the formal proof:* (L1), (L2) and (L5) are read off the period matrix of the principally polarised abelian
scheme and its Riemann relation, which compare the `τ`-linear functions with the functions regular modulo `ℓ`; along the
flag, inclusions at every step between the ideals of Raynaud's coordinates and those of the forms of `af(χ_τ)`, together
with an identity of total lengths given by a discriminant, force equality at every step, which gives (L3) and (L4).

Let `ℓ` be an odd prime unramified
in `E`, `𝔩 | ℓ` a prime of `E`, `F_𝔩 = 𝒪_E/𝔩`, `C` a complete algebraically closed field over `ℚ_ℓ` with ring of integers `𝒪_C`,
`w ∈ 𝒪_C` with `w^{ℓ−1} = ℓ·unit`, `φ` the Frobenius permutation of the labels `Φ ⊔ cΦ`, and `𝒢 := A[𝔩]` for a principally
polarised abelian scheme `A` over `𝒪_C` with `𝒪_E`-action and signature `(p, q)` along `Φ` (for a semi-abelian scheme over
`𝒪_C` with principally polarised abelian generic fibre, obtained by base change along a local homomorphism to `𝒪_C` from a
semi-abelian scheme with a uniformisation over a complete noetherian normal local domain of characteristic `0`, the
`𝔩`-torsion of its `ℓ`-divisible group of HodgeTateLatticesAndLubinTateLogarithms §0.18a: the setting of
HodgeTateLatticesAndLubinTateLogarithms §0.5h (6)).
Let `T = F_𝔩^N` be the points of `𝒢`, with the flag `T_i = F_𝔩^i × 0` and `H_i ⊂ 𝒢` the finite flat subgroups with points
`T_i`, `χ_τ : F_𝔩 → 𝒪_C` the multiplicative lifts at the embeddings `τ`, `af(χ_τ)` the `τ`-linear functions
`Σ_i a_iχ_τ(x_i)` regular on `𝒢` modulo `ℓ`, and `Ξ_τ` the dual lattice of `af(χ_τ)`. Then:
(L1) `w·𝒪_C^N ⊆ af(χ_τ)` (valid at every prime: HodgeTateLatticesAndLubinTateLogarithms §0.5h (2));
(L2) the sequence `0 → w^{−1}Lie_τ → Ξ_τ → ω_{τ̄} → 0` (ranks `p`, `N`, `q` for `τ ∈ Φ`) is exact, lying over the Hodge–Tate sequence
`0 → Lie^{HT}_τ → T_𝔩(A) ⊗_τ 𝒪_C → ω^{HT}_{τ̄} → 0` of the `𝔩`-adic Tate module `T_𝔩(A)` (of which `T = T_𝔩(A)/𝔩`);
(L5) (*the period lattice*) `af(χ_τ)` is the part of type `τ` of the lattice `𝔄(A)` of HodgeTateLatticesAndLubinTateLogarithms §0.5h: it
is spanned by the rows of the Hodge–Tate matrix and of a complementary period block, the two blocks `𝔥`, `𝔟` forming a matrix
`Π = (𝔥; 𝔟)` with `𝔟^T𝔥 − 𝔥^T𝔟 = c·E_W` (that is `Π^TJΠ = c·E_W` for `J = [[0, −1], [1, 0]]`), `E_W` the matrix of the Weil pairing
and `|c| = |ζ_ℓ − 1|`; the forms of type `τ` among the rows are the components of the Hodge–Tate map in `ω_{τ̄}` and the
components of the complementary block in `Lie_τ` (for `x` of type `τ`, `𝔥(ax) = ā^*𝔥(x)`);
and (*the flag facts of the `𝔩`-torsion*), for every `τ`:
(L3) `af(χ_τ)` is triangular for the flag, with diagonal the ideals `(c_{τ,i})` of Raynaud's coordinates `X_τ = c_{τ,i}χ_τ` of
the rank-one pieces `H_{i+1}/H_i`;
(L4) `X_τ^ℓ = δ_τX_{φτ}` with `δ_τ = c_{τ,i}^ℓ/c_{φτ,i}`, `ω_{gr_i, φτ} ≅ 𝒪_C/δ_τ`, and `ω` is additive along the flag.

*The form of the formal proof.* The formal proof states (L1)–(L4) for the models of 8.15 (the normal models `Y_B(c)`
with their Hodge–Tate lattices at the primes of `S(B)`) and a prime `ℓ ∈ S(B)`, odd and unramified in `E`: for the
universal semi-abelian scheme at the points of the model with values in the valuation rings `𝒪_C` of the algebraically
closed valued fields `C` that contain the function field of the model (`𝒪_C` `ℓ`-adically complete, centred on the model
above `ℓ`), with `w = ζ_ℓ − 1` and `w^{ℓ−1} = ℓ·unit` (the `w` of the statement is the same up to a unit, with the same
lattices), the lattices `Lie_τ`, `ω_{τ̄}` being the de Rham lattices of the model and `Lie^{HT}_τ`, `ω^{HT}_{τ̄}` its
Hodge–Tate lattices, which are locally free above `ℓ` (8.15). (L1)–(L4) as stated above, for every `A` over `𝒪_C` and for
the semi-abelian schemes of the parenthesis, are this roadmap's own.

*Route.* (L1): the truncated logarithm `Σ_{k<ℓ}(−1)^{k−1}([x^D] − 1)^k/k` of a character `x^D` of `𝒢` lies in `𝒪(𝒢)` and takes the
value `−(w^ℓ/ℓ)·χ(⟨x, x^D⟩)` modulo `ℓ`; the eigen-decomposition under `F_𝔩^×` (a unit Vandermonde) gives each `w·χ_τ(x_i)`; this is
exact modulo `ℓ`. (L2), (L5): HodgeTateLatticesAndLubinTateLogarithms §0.5g gives the period matrix `Π` of `A` with `Π^TJΠ = c·E_W` and rows
congruent modulo `ℓ` to regular functions on `A[ℓ]`; HodgeTateLatticesAndLubinTateLogarithms §0.5h gives `𝔄(A) =` rowspan`(Π)`, `𝔥(𝔄(A)^∨) = ω_A` and
`𝔄(A)^∨ ∩ ker 𝔥 = c^{−1}E_W^{−T}𝔥^T(𝒪_C^g)`; `𝔄(A)` is stable under the idempotents of `𝒪_E ⊗ 𝒪_C` (`ℓ` unramified), and its part of
type `τ` is `af(χ_τ)`; the kernel statement is then (L2), because the kernel of the Hodge–Tate map at `τ` is `Lie^{HT}_τ` and `c`
and `w` differ by a unit. At a point of semi-abelian reduction: HodgeTateLatticesAndLubinTateLogarithms §0.5h (6), for a semi-abelian scheme obtained by base change from one with a uniformisation over a complete noetherian normal local domain of characteristic `0`. (L3), (L4): the route is not given here in full: the Hopf algebras of the
quotients `A[ℓ]/H_i` are generated by their elements additive modulo `ℓ` (HodgeTateLatticesAndLubinTateLogarithms §0.5h (4′)); from
this, the forms of `af(χ_τ)` vanishing on `T_i` should induce on `T_{i+1}/T_i` exactly the forms of the rank-one piece
`H_{i+1}/H_i`, whose lattice is `c_{τ,i}𝒪_C` by Raynaud's classification (FiniteFlatGroupsAndIntegralPadicHodgeTheory
R07.1.27–R07.1.28), and the invariant differentials are additive along the flag (R07.1.17); the passage from the generation
to the flag statement is the step that is not given here. The close published argument, for a flag with Oort–Tate
pieces, is Fargues (2011), Théorème 3 and the proof of Théorème 4 (Lemme 9, Propositions 7–8).

*Sources:* (statement; (L1): the Hopf order of a finite flat group of order `ℓ` is generated by `w`-multiples of
characters; (L5) [FormalProof], the period relation known in kind, Fontaine). (L1)–(L4) in the form of the formal proof:
[FormalProof], `Development/AutomorphicSpectrum/Proofs/GeometryProofs/OrdinaryCurveHodgePrime.lean`
(`GlobalTheory.CompanionTheory.Ar.Num.FamEx.TestPt.testFacts`),
`Development/AutomorphicSpectrum/Definitions/CommutativeAlgebra/LieLatticeData.lean`
(`GlobalTheory.CompanionTheory.Ar.Num.LieLatticeData.Facts`, `GlobalTheory.CompanionTheory.Ar.Num.IsTestPt`),
`Development/AutomorphicSpectrum/Proofs/GeometryProofs/FamilyExistsPosOfFamilyExists.lean`
(`GlobalTheory.CompanionTheory.Ar.Num.FamilyExistsPos`), derived there, from five named statements that it takes as
hypotheses, by `GlobalTheory.T.family_pos_of_hodge_tate_inputs`
(`Development/AutomorphicSpectrum/Proofs/GeometryProofs/FamilyPosOfHodgeTateInputsStatement.lean`).
*Needs:* FiniteFlatGroupsAndIntegralPadicHodgeTheory
R07.1.17, R07.1.27, R07.1.28; HodgeTateAndCanonicalSubgroups §0.4 and HodgeTateLatticesAndLubinTateLogarithms §§0.5g, 0.5h, 0.18a.

### 8.14c Antisymmetric polynomials vanishing on the walls

*Origin:* adapted from the divisibility of a polynomial antisymmetric under a reflection group by the product of the
linear forms of its reflections: here for the Weyl group `𝔚` of the Levi subgroup, with vanishing on a piece of one
non-compact wall at each `τ` in place of antisymmetry under the non-compact reflections, and in a quantitative form;
elementary.

*Method of the formal proof:* antisymmetry gives vanishing on the compact walls, vanishing on an open piece of a wall gives
vanishing on the wall, and each `x_{τ,a} − x_{τ,b}` is a prime dividing `P`, so `Δ` divides `P` with a linear quotient
invariant under the block permutations; the quantitative form follows from a linear right inverse of the restriction to
the compact pieces `K_τ` on the finite-dimensional space of antisymmetric polynomials, and the simple non-compact wall is
carried to the others by products of two transpositions.

Let `𝔚` be the Weyl
group of the Levi subgroup `∏_τ(GL_p × GL_q)` of `∏_τ GL_N` (`0 < p < N`, `τ` in a finite set `Φ`), acting on the variables
`x_{τ,i}`, and `D = |Φ|·N(N − 1)/2`. A homogeneous polynomial `P` of degree `D + 1`, antisymmetric under `𝔚`, that vanishes on a
relatively open piece of the simple non-compact wall `x_{τ,p−1} = x_{τ,p}` for each `τ`, is `Δ·lf` with
`Δ = ∏_τ∏_{a<b}(x_{τ,a} − x_{τ,b})` and `lf = Σ_τ(α_τΣ_{i<p}x_{τ,i} + β_τΣ_{i≥p}x_{τ,i})`. Quantitatively, for fixed compact pieces
`K_τ` with nonempty interior of these walls there is `C₀ = C₀(N, |Φ|, K)` such that if `P` is homogeneous of degree `D + 1`,
antisymmetric under `𝔚` and `|P| ≤ ε` on every `K_τ`, then every coefficient of `P − Δ·lf` is at most `C₀ε` for some such
`lf`. (A `𝔚`-antisymmetric homogeneous `h` of degree `D + 1` vanishing on all the walls is itself `Δ·(invariant linear form)`,
so the same holds for `P − h` with `P` antisymmetric.) The proof uses that `𝔚` carries the simple non-compact wall at `τ` to
the wall `x_{τ,a} = x_{τ,b}` of every non-compact positive root (`a < p ≤ b`); for another reductive group the statement
needs that the compact Weyl group acts transitively on the non-compact positive roots.

*Route.* `𝔚` carries the simple non-compact wall to every non-compact wall, and antisymmetry makes `P` vanish on the
compact walls; so `Δ` divides `P`, the quotient is linear and `𝔚`-invariant, and the invariant linear forms are spanned by
the `2|Φ|` block sums. For the quantitative form, the supremum over the `K_τ` is a norm on the finite-dimensional quotient
of the antisymmetric polynomials by `Δ·(invariant linear forms)`.

*Check.* `|Φ| = 1`, `N = 2`, `p = q = 1`: `𝔚` is trivial, `D = 1`, a quadratic form vanishing on `x₀ = x₁` is
`(x₀ − x₁)(αx₀ + βx₁)`, and the non-homogeneous `(x₀ − x₁)(αx₀ + βx₁ + c)`, `c ≠ 0`, shows that homogeneity is needed.

*Sources:* [FormalProof], `GroundTheory/HeightsAndTheta/Heights/Antisymmetric/Statements.lean`
(`GroundTheory.Heights₂.Heights.AntisymDivisible.Statement`, divisibility by `Δ` with an invariant linear quotient, from
vanishing on a relatively open piece of every non-compact wall; `GroundTheory.Heights₂.Heights.AntisymPerturbation.Statement`,
the quantitative form for `P − v·h` with `h` vanishing on compact pieces `K_τ` of the simple non-compact walls, which at
`v = 0` is the quantitative form stated here and at `ε = 0` gives the divisibility from the simple walls alone).
*Needs:* Mathlib (`MvPolynomial`, `MvPolynomial.rename`, `Equiv.Perm.sign`; invariance and antisymmetry
under `𝔚` are stated through `rename` and the sign, and are not Mathlib notions).

### 8.15 Models of the flag bundles with mixed integral structure

*Origin:* particular to this proof: integral models of the flag bundles that use Hodge–Tate lattices at the primes of
`S(B)` (the small and the bad primes) and Lie lattices at the other primes, so that the weights dominant for `GL_N` at
each `τ` are nef on the fibres over `S(B)`, and the dominant weights with a gap condition on the other fibres.

*Method of the formal proof:* for each component and each cut-off `B` the model is built in four steps: a finite extension
of the function field over which the `ℓ⁴`-torsion and the `ℓ⁴`-th roots of unity are rational for `ℓ ∈ S(B)`; a normal
projective model with smooth generic fibre in coordinates of that field; a common refinement on which the Hodge–Tate
lattices and their images in the eigen-quotients are vector bundles, unchanged where they already had frames; and the
bundle of flags of the patched lattices with its lines `x_{τ,i}`, to which the Hodge metrics are transported. (a1) is read
off the Hodge–Tate sequence modulo `ℓ^{R−2}`, which makes the lines `x_{τ,i}` at `τ` the graded pieces of a full flag of a
trivial bundle of rank `N` on every component of the fibre.

In the setting above with
`p, q ≥ 1` and `N ≥ 3` (so `Sh` is not compact), with `Fl`, `x_{τ,i}`, `D` and `ℓ_{λ}` for `λ ∈ ℝ^{Φ×N}` as there. On the
polynomials in the `x_{τ,i}` let `deg_Fl(F) = ∫_{∏_τ GL_N/B} F` (integration over the flag variety of the compact dual),
`δ_Fl(λ) = deg_Fl(ℓ_{λ}^D)`, `S^p_τ(F) = deg_Fl(Σ_{i<p}∂F/∂x_{τ,i})`, `S^N_τ(F) = deg_Fl(Σ_i ∂F/∂x_{τ,i})`, `ĥ_Fl(F)` the arithmetic
intersection number of `F` on the flag variety over `ℤ` with its Fubini–Study metrics (HeightsForLogSingularMetrics
§14.2), `p_k(τ) = Σ_i x_{τ,i}^k`. The *compact* simple roots are `(τ; a, a+1)` with `a + 1 ≠ p`; the *non-compact wall* at
`τ` is `x_{τ,p−1} = x_{τ,p}`. Let `S_disc` be the set of primes dividing `2·disc(E)` and the level, `S(B) = S_disc ∪ {primes ≤ B}`,
and `R ≥ 4` an integer.

(a) *Models with mixed integral structure.* For each component `c` and `B`, let `Y⁰_B(c)` be the normalisation of the global
model `Y` of the setting (with the endomorphisms of the universal abelian scheme extended to the semi-abelian scheme;
the principal polarisation is that of the generic abelian variety) in a finite extension of the function field of `c` over which the `ℓ^R`-torsion of `A` and the `ℓ^R`-th
roots of unity are rational for every `ℓ ∈ S(B)`, and `Y_B(c)` the normal projective model of HodgeTateLatticesAndLubinTateLogarithms §0.5c (b) over it, in its finite-set form for `Σ = S(B)` and for the eigen-quotients of `𝒪_E`: `Y_B(c)` is isomorphic to `Y⁰_B(c)` over the generic fibre and over the primes outside `S(B)` (HodgeTateLatticesAndLubinTateLogarithms §0.5c (b): these primes do not divide `disc(E)`), and on it the Hodge–Tate lattices `ω^{HT}_ℓ` (HodgeTateLatticesAndLubinTateLogarithms §0.5a, level `R`) and their
images in the duals of the eigenspaces `Lie_σ` of the generic fibre are locally free at the points over `ℓ ∈ S(B)`. The
*patched lattices* on `Y_B(c)` are lattices in the eigenspaces of the Lie algebra of the generic fibre: at the points over no
prime of `S(B)`, the eigen-sublattices `Lie ∩ Lie_σ` (vector bundles there, `S(B)` containing the primes dividing
`disc(E)`); at the points over `ℓ ∈ S(B)`, `V_{cτ}` is the dual of the image of `ω^{HT}_ℓ` in the dual of `Lie_{cτ}`, and `V_τ` is
`𝔡_τ^{−1}` times the dual of the image of `ω^{HT}_ℓ` in the dual of `Lie_τ` (`𝔡_τ` the ideal generated by the image under `τ`
of the different of `E`). They are vector bundles of ranks `p` (at `τ`) and `q` (at `cτ`). `M_B(c)` is the bundle over
`Y_B(c)` of pairs of full flags of `V_τ` and `V_{cτ}`, `τ ∈ Φ` (AlgebraicModuliForArithmeticGeometry §1.3), with the lines
`x_{τ,i}` its graded pieces as in the setting; it is a normal projective arithmetic variety over `𝒪_{F′}`, birational over
`F′` to the flag bundle of a cover of `c`. The lines `x_{τ,i}` carry the Hodge metrics (from the Hodge inner product `π·H_A`
on `Lie`, `H_A` the Riemann form, the metric from which the Petersson norms of RowTowerAndRallisIdentities §5.1 and of the setting are built), log-log
singular along the boundary (HeightsForLogSingularMetrics §0.4) and with the logarithmic gradient bound
`|dφ| ≤ C·(log(1/‖s‖²))^C/‖s‖` in polydisc coordinates adapted to the boundary (`φ` the weight of the metric, `s` a canonical
section of the boundary). There is an ample class `𝒜` on `M_B(c)`: a relatively ample class of the flag bundle plus a large
multiple of a class pulled back from a projective embedding of the base component.
On a log-smooth model `X′` of `M_B(c)` (a3) the reference class is taken ample: `X′` is embedded in a projective space,
the embedding is a holomorphic immersion of the complex manifold `X′(ℂ)`, and the hyperplane class with its Fubini–Study
metric is an ample line bundle whose Chern form is bounded below by a Kähler form, as HeightsForLogSingularMetrics §0.4 (c)
asks of `Ā`. In [FormalProof] this is a clause of the tower, with the level `R = 4`:
`Development/AutomorphicSpectrum/Statements/TowerExistence/GoodTowerExistsX.lean`
(`GlobalTheory.CompanionTheory.Ar.Top.GoodOrigin.Extra`, `GlobalTheory.CompanionTheory.Ar.Top.GoodTowerExistsX`).

(a1) At every `ℓ ∈ S(B)`: every weight dominant for `GL_N` at each `τ` is nef on the fibre of `M_B(c)` over `ℓ`, and, when `ℓ` is odd, unramified in `E` and prime to the level, every `p_k(τ)` restricts to zero there (HodgeTateLatticesAndLubinTateLogarithms §0.17b (c), (d) at `σ = τ`); at every point of `Y_B(c)` over `ℓ`, `κ·ω ⊆ ω^{HT}_ℓ ⊆ ω` with `κ = ζ_ℓ − 1` for odd `ℓ` (`v_ℓ(κ) = 1/(ℓ − 1)`) and `κ = 4` for `ℓ = 2` (`v_2(κ) = 2`) (HodgeTateLatticesAndLubinTateLogarithms §§0.5a (a), 0.5b (b), the second at `ℓ = 2`, where `ω^{HT}_ℓ` is locally free; the factor `2` of HodgeTateLatticesAndLubinTateLogarithms §0.5b (b) is that roadmap's own, and the form used here is that of [FormalProof]: the factor `4`, and the sequence of HodgeTateLatticesAndLubinTateLogarithms §0.17b modulo `2^{R−2}`, `R ≥ 4`); hence
`Lie ∩ Lie_σ ⊆ V_σ`, `κ·V_{cτ} ⊆ Lie ∩ Lie_{cτ}` and `κ·𝔡_τ·V_τ ⊆ Lie ∩ Lie_τ`.

(a2) At every prime `ℓ ∉ S(B)` (odd, as `2 ∈ S(B)`), a dominant `μ` is nef on the fibre of `M_B(c)` at `ℓ` when
`4|Φ|·‖μ‖_∞ ≤ (ℓ − 2)·gap(μ, τ)` for every `τ`, `gap(μ, τ) = μ_{τ,p−1} − μ_{τ,p}`; in particular when
`4|Φ|·‖μ‖_∞ ≤ (B − 2)·gap(μ, τ)`, every `ℓ ∉ S(B)` being `> B`. For this: for every smooth projective curve `C` over a field of
characteristic `ℓ` containing the images of the embeddings of `E` and every morphism from `C` to the fibre of `Y_B(c)` at `ℓ`
(which is the fibre of `Y⁰_B(c)`), the pulled-back semi-abelian scheme has conjugate data on `C` in the sense of 8.14a
(ProjectiveModelsAndPeriodBoundsOnShimuraVarieties §§6.9a, 7.12a), whether or not the image of `C` meets the interior.

(a3) *Log-smooth models and the root fibrations.* Let `Y′ → Y_B(c)` be a log-smooth model of `Y_B(c)` with its interior
(HeightsForLogSingularMetrics §0.4 (o)) and `X′` the bundle of pairs of full flags of the pulled-back patched
lattices. Then `X′ → M_B(c)` is a log-smooth model of `M_B(c)`, with boundary the preimage of the boundary of `Y′`, and its
lines are the pull-backs of the `x_{τ,i}`; for every compact simple root `α = (τ; a, a + 1)`, `X′ = ℙ(V_α)` for the rank-two
graded piece `V_α` on the bundle `Z_α` of flags with the step between `a` and `a + 1` omitted, a projective arithmetic variety
with smooth generic fibre and simple normal crossings boundary; the lines `x_{τ′,i}` other than `x_{τ,a}`, `x_{τ,a+1}`, and
`x_{τ,a} ⊗ x_{τ,a+1}`, are pulled back from `Z_α` with their Hodge metrics, which are log-log integrable along its boundary;
the dual of the root line of `α` is the relative tangent line, with the metric induced fibrewise, over the interior, by
the Hodge form on `V_α`, log-log integrable along the boundary.

Put `I_c(B, F)` := the limit number of `F` on `M_B(c)` (HeightsForLogSingularMetrics §0.4 (b), independent of
the regularisations and of the log-smooth model, by definition the one of `X′`) divided by the degree of `M_B(c)` over the
flag bundle `Fl_c` of the component (the number per unit degree; `M_B(c)` is a cover of degree growing with `B`, and only
these normalised numbers are bounded uniformly in `B` below); `vol(c)` by `∫_{Fl_c} F = vol(c)·deg_Fl(F)`,
`vol_tot = Σ_c vol(c)` and `I(B, λ) = Σ_c I_c(B, ℓ_{λ}^{D+1})`. These numbers, and every number built from them, are computed on
`M_B(c)` over the modified base `Y_B(c)`. The limit number is not identified with an
arithmetic intersection number of a theory for log-singular metrics; nothing below uses such an identification.

*Route.* (a) Pass from the global model to `Y⁰_B(c)` by normalisation (the finite covers `Y_L` of
ProjectiveModelsAndPeriodBoundsOnShimuraVarieties §7.31a (b), which (b′) does not state: this step rests on the clause (b), not
on the form of [FormalProof]; the covers of [FormalProof], as ProjectiveModelsAndPeriodBoundsOnShimuraVarieties §7.31a (b)
records them, are integral normal projective schemes with a morphism to the component, dominant and of finite degree,
carrying the pull-back of `G` with its action, with all `ℓ⁴`-torsion points of the generic fibre rational for `ℓ` in a
finite set containing the primes dividing `disc(E)`, and with normal-crossings boundary; such a cover maps to `Y_L` for
its function field and need not be finite over the component; homomorphisms of
abelian generic fibres extend over a normal base, ShimuraCompactifications §6.8, and the normalisation in a finite extension of the function field
is again a normal projective flat model carrying the pulled-back semi-abelian scheme), then to `Y_B(c)`
(HodgeTateLatticesAndLubinTateLogarithms §0.5c (b): the normalisation of the Nash modification of the sheaves `ω^{HT}_ℓ` and of their images in the eigen-quotients, NashBlowups §§1.2–1.4); the patched lattices are vector bundles because the images
`ω^{HT}_{ℓ,σ}` are locally free and `𝔡_τ` is invertible; any two choices are dominated by a third on which the lattices agree
(the lattice on a dominating model is the image of the pulled-back lattice, HodgeTateLatticesAndLubinTateLogarithms §0.5a (c); a tensor pull-back need not be locally free), so nothing below depends on the choice; any two such models, for the same or for different cut-offs, are
dominated by a normal projective model on which the lattices of both are locally free and are the images of the pulled-back lattices (HodgeTateLatticesAndLubinTateLogarithms §§0.5a (c), 0.5c (a), (c)); the numbers below are unchanged by pull-back to it. All the statements at the
primes of `S(B)` are made on `Y_B(c)`, where the lattices are locally free by construction; on the level normalisation `Y⁰_B(c)`
they need not be (on the Katz–Mazur model of a modular curve the lattice fails to be locally free at every supersingular
point). The Hodge metric is that of ProjectiveModelsAndPeriodBoundsOnShimuraVarieties §6.2a (its
constant makes it the form dual to `π·H_A`, `H_A` the Riemann form: Deligne's normalisation); log-log growth of the lines of
a flag follows from ProjectiveModelsAndPeriodBoundsOnShimuraVarieties §6.2a (a) (bounds for the entries of the Gram matrix) through determinants of quotients, and the control
of the derivatives (connection forms and their exterior derivatives of Poincaré growth) from the goodness of the invariant
metric relative to the canonical extension (DiscreteSeriesCoefficientsAndAutomorphicMetrics §10.1, for the `Lie_σ`, a representation trivial on the unipotent radical, as §10.1 requires; ProjectiveModelsAndPeriodBoundsOnShimuraVarieties §6.2a bounds the entries only). The logarithmic gradient bound: at a boundary point, in
coordinates `u_i` of a polydisc in which the boundary is `u_1⋯u_a = 0`, the imaginary part of the period matrix is a bounded
real-analytic matrix plus `Σ_i(log(1/|u_i|)/2π)·B_i` with positive semidefinite integral `B_i` (the nilpotent orbit theorem in
weight one: for integral `v`, `exp(2πi·v^tτv)` is single-valued and bounded, hence holomorphic across the boundary), and is
bounded below; the Gram matrix of the Hodge form on `Lie` in a frame of the semi-abelian scheme is, up to a bounded
holomorphic change of frame, `π` times its inverse, so it lies between `c/r` and `C` (`r = log(1/‖s‖²)`) and its
differential is `O(Σ_i 1/|u_i|)`; the potentials of the step lines are logarithms of minors of it in bounded holomorphic
frames, whose condition numbers are polynomial in `r`. The logarithmic periods at a boundary point are those of a chart `Spec R` of the model with a holomorphic family of points (ProjectiveModelsAndPeriodBoundsOnShimuraVarieties §6.7a), with the Riemann form of the principal polarisation; that statement does not assert that the monodromy is unipotent, and the unipotence that the shape of the imaginary part above uses is not given here. (a1) HodgeTateLatticesAndLubinTateLogarithms §0.17b (c) at `σ = τ` gives, on `Y_B(c)` (where `ω^{HT}_ℓ` and its eigen-quotients are locally free) and modulo `ℓ^{R−2}`, hence modulo `ℓ` (on the fibre over `ℓ`, reduced or not), after the choice of a primitive `ℓ^R`-th root of unity, for each `τ` an exact sequence `0 → V_τ ⊗ μ_ℓ → T_τ ⊗ 𝒪 → (V_{cτ})^∨ → 0` with `T_τ ⊗ 𝒪` trivial of rank `N`, `V_τ = Hom(ω^{HT}_{ℓ,τ}, 𝔡_τ^{−1})` and `(V_{cτ})^∨ = ω^{HT}_{ℓ,cτ}`, exactly as in (a), so full flags of the two outer terms form a full flag of the trivial bundle of rank `N`: for a full flag `F_•` of a trivial
bundle on a curve `deg F_k ≤ 0`, and `Σ_i(−λ_i)·deg(F_i/F_{i−1}) = Σ_{k<N}(λ_{k+1} − λ_k)·deg F_k ≥ 0` for decreasing `λ`, so the
weights dominant for `GL_N` at each `τ` are nef; the power sums vanish by Whitney's formula and Newton's identities (HodgeTateLatticesAndLubinTateLogarithms §0.17b (d)). The sandwich is HodgeTateLatticesAndLubinTateLogarithms §0.5a (a) at the points of `Y_B(c)` over `ℓ`, where `ω^{HT}_ℓ` is locally free; dualising it on the eigen-quotients gives
the three inclusions. (a2) Nefness on the fibre is tested on integral curves; their normalisations are smooth projective
curves. A curve contracted to a point of `Y_B(c)` lies in a flag variety, on which dominant weights are nef. Otherwise apply
8.14a to the pulled-back semi-abelian scheme (its Lie eigen-bundles have ranks `p`, `q`), with the conjugate data of
ProjectiveModelsAndPeriodBoundsOnShimuraVarieties §§6.9a, 7.12a (every geometric fibre of the semi-abelian scheme over a point of positive characteristic of the model is an extension of an abelian variety `B` by a torus on which the cubical line bundle of the setting is pulled back from a line bundle `M` on `B` with `K(M)` trivial, by the uniformisation of degenerations, ShimuraCompactifications §§6.4–6.6; this is the hypothesis of ProjectiveModelsAndPeriodBoundsOnShimuraVarieties §6.9a, and ProjectiveModelsAndPeriodBoundsOnShimuraVarieties §7.12a gives it on a global model of ProjectiveModelsAndPeriodBoundsOnShimuraVarieties §7.31a (b′) (ii) chosen there (the global model of the setting) and on every reduced locally noetherian scheme over it whose generic points map to `Sh_F`, in particular on every normal model dominating the global one) and the sub-bundles of the flag: the modification of (a) is an isomorphism over the primes outside `S(B)`, so the fibres at
these primes are those of the level normalisation, where the eigen-sublattices are vector bundles because these primes
do not divide the discriminant. (a3) A flag bundle of vector bundles is smooth and projective over its base and commutes
with base change, and forgetting one step is the bundle of lines of the rank-two graded piece
(AlgebraicModuliForArithmeticGeometry §1.3; HeightsForLogSingularMetrics §14.1, Objects); a smooth morphism
pulls a simple normal crossings divisor back to one; on the generic fibre the patched lattices are the `Lie_σ` of the
semi-abelian scheme, whose Hodge form has Gram matrix between `c/r^C` and `C·r^C` in frames near the boundary
(ProjectiveModelsAndPeriodBoundsOnShimuraVarieties §6.2a (a)) and whose derivatives are controlled by the goodness of the invariant metric
(DiscreteSeriesCoefficientsAndAutomorphicMetrics §10.1, for the `Lie_σ`, a representation trivial on the unipotent radical, as §10.1 requires), so the induced metrics of graded pieces of flags are log-log singular along the pulled-back
boundary and involve the flag only up to the step in question.

*Needs:* 8.14a; ProjectiveModelsAndPeriodBoundsOnShimuraVarieties §§6.2a (a), 6.7a, 6.9a, 7.12a, 7.31a (b), (b′) and ShimuraCompactifications §§6.4–6.6, 6.8; HodgeTateAndCanonicalSubgroups §§0.2, 0.3, 0.5, 0.17; HodgeTateLatticesAndLubinTateLogarithms §§0.5a, 0.5b, 0.5c, 0.17b, 0.18a, 2.4 (the last through HodgeTateLatticesAndLubinTateLogarithms §§0.18a (d), 0.17b); NashBlowups §§1.2–1.4; AlgebraicModuliForArithmeticGeometry
§1.3; NeronModelsAndSemistableAbelianVarieties §§3.5, 3.6 (through HodgeTateLatticesAndLubinTateLogarithms §0.18a); SchemeAndStackFoundations §0.14;
ArakelovGeometryAndAbelianHeightsPartII §0.3 and HeightsForLogSingularMetrics §§0.4 (b), (o), 14.1 (Objects); ResolutionOfSingularitiesCharacteristicZero
§5.2; AutomorphicBundles §§0.5, 5.3 and DiscreteSeriesCoefficientsAndAutomorphicMetrics §10.1; PELModuli M1.7, M2.8, M6.1.

### 8.15b Antisymmetry

*Origin:* particular to this proof: the difference between the limit numbers of the flag bundle and the arithmetic
intersection numbers of the flag variety of the compact dual changes sign under every compact simple reflection.

*Method of the formal proof:* the reflection relation for a fibre square, which expresses the sum of the intersection
numbers at `λ` and at `s_αλ` through the polynomial of geometric degrees, is applied to the system of lines on a model of the flag bundle and to the flag variety
over `ℤ`; the two degree polynomials are proportional with factor the volume, so the difference of the two instances
shows that `I_c(B, ·) − vol(c)·ĥ_Fl` changes sign under each compact simple reflection.

In the setting of 8.15, for every component `c`, every integer cut-off `B ≥ 2`, every compact simple root
`α = (τ; a, a + 1)` and every `λ ∈ ℝ^{Φ×N}`:
`I_c(B, ℓ_{s_αλ}^{D+1}) − vol(c)·ĥ_Fl(ℓ_{s_αλ}^{D+1}) = −(I_c(B, ℓ_λ^{D+1}) − vol(c)·ĥ_Fl(ℓ_λ^{D+1}))`, `s_α` exchanging the
entries `a` and `a + 1` at `τ`. Summing over `c`: `I(B, ·) − vol_tot·ĥ_Fl(ℓ_{·}^{D+1})` is antisymmetric under every compact
simple reflection.

*Route.* On `X′` of 8.15 (a3), for each compact simple root `α`, with `Z = Z_α` and `V = V_α`: the Hodge metrics of the step
lines are log-log singular and pulled back from `Z_α`, so they have monotone `C²` regularisations
(SingularHermitianMetricsAndL2Methods §7.7 (b)), close and with loss at most `C·log log(1/t)/log(1/t)` under the gradient
bound of 8.15 (a) (SingularHermitianMetricsAndL2Methods §7.7 (c));
their pull-backs along the projective-line fibrations and along the fibre
squares are again regularisations, for the pulled-back boundary (SingularHermitianMetricsAndL2Methods §7.7 (d);
HeightsForLogSingularMetrics §0.4 (o) for morphisms `f` of log-smooth models with `f^{−1}(D) = D′` as sets), and the
boundary sections of the fibre square are pulled back from the base, so the regularisations are compatible with every
projection forgetting one step. Beyond hypothesis (iv) of HeightsForLogSingularMetrics §14.1 (c), no closeness and no rate
is used here. `ℙ(V_α)` has tautological class of fibre degree
`−1`, half the class of the root line (fibre degree `−2`), and the limit metric of the root line is fibrewise the
Fubini–Study metric of the Hodge form on the rank-two graded piece; the reflection formula for limit numbers
(HeightsForLogSingularMetrics §14.1 (c), stated for a line of fibre degree `+2`, with its hypothesis (iv), close `C²`
regularisations with loss at most `C·log log(1/t)/log(1/t)`, met by those above: it is applied to the dual of the root line, with the change of sign of the right side that HeightsForLogSingularMetrics §14.1 (a) records) expresses the even parts along `α` through geometric degrees, HeightsForLogSingularMetrics §14.1 (a) does the same on the flag variety over `ℤ`, and the geometric degrees are proportional with factor `vol` by Hirzebruch–Mumford proportionality (DiscreteSeriesCoefficientsAndAutomorphicMetrics
§10.2, for the flag bundle of the `Lie_τ`, `Lie_{cτ}`, representations trivial on the unipotent radical, as §10.2 requires). The limit numbers of `M_B(c)` are by definition those of its log-smooth model `X′` (HeightsForLogSingularMetrics §0.4 (b)).

*Sources:* [FormalProof], `Development/AutomorphicSpectrum/Definitions/DivisibilityTowers/Proportional.lean`
(`GlobalTheory.CompanionTheory.Ar.Top.RootTower.I8`),
`Development/AutomorphicSpectrum/Proofs/DivisibilityProofs/FullIntersectionTowerI8IdentityStatement.lean`
(`GlobalTheory.T.full_intersection_tower_I8_identity`),
`Development/WeilBound/CoreStatements/MultihomogeneousSquares/GoodTowerAntisymmetry.lean`
(`SquareStatements.good_tower_antisymmetry`).
*Needs:* 8.15; HeightsForLogSingularMetrics §§0.4 (b), (o), 14.1 (a), (c); SingularHermitianMetricsAndL2Methods
§7.7 (b)–(d); DiscreteSeriesCoefficientsAndAutomorphicMetrics §10.2.

### 8.15c Vanishing on the walls

*Origin:* particular to this proof: on a non-compact wall the limit numbers per unit degree are
`O(log B/B)`, by both halves of Zhang's theorem of successive minima and logarithmic bounds for the heights of points.

*Method of the formal proof:* a rational weight on the wall is moved off it by `θ = 5|Φ|/B` and by `θ²` times an ample
class; the regularised self-intersection of the perturbed bundle is squeezed between the two halves of the inequality of
successive minima, with heights of points `≥ −C·log(B/θ²)` everywhere and `≤ C·log B` on a dense set, against a geometric
degree of size `O(θ)`; the loss of the regularisation (`O(θ²)`) and the Lipschitz dependence on the weight
(`O(θ·log B)`) return to the wall, and continuity gives real weights.

In the setting of 8.15:
for every `c₀ > 0` there are `C`, `B₁`, depending only on `E`, the datum (space, lattice, level) and `c₀`, not on `B` nor on
`λ`, with `|I(B, λ)| ≤ C·log B/B` for `B ≥ B₁` and every real `λ` with `‖λ‖ ≤ ½`, `gap(λ, τ₀) = 0` for one `τ₀` and all other
gaps `≥ c₀`.

*Route.* For rational `λ` put `θ = c_θ|Φ|/B` with an absolute `c_θ`, raise the first `p` entries at `τ₀` by `2θ` so that
8.15 (a1), (a2) give nefness, perturb by `s = θ²` times the ample class `𝒜` of 8.15 (a) (a boundary-supported class compatible
with this perturbation is not constructed here), and regularise
at `t = exp(−1/s²)` (SingularHermitianMetricsAndL2Methods §7.7 (c), under the gradient bound of 8.15 (a));
the regularised metrics are semipositive only after the ample perturbation (their loss is `ε(t) ≤ s`),
and HeightsForLogSingularMetrics §4.3a (d) is applied to the perturbed bundle. The lower half of Zhang's successive-minima inequality
(HeightsRationalPointsAndObstructions §5.17f, through the arithmetic Kleiman statement for nef bundles) and the upper half
in the form without ampleness on the generic fibre, which follows from the volume inequality
HeightsForLogSingularMetrics §4.3a (d) by small sections, with heights of points `≥ −C·log(B/s)` everywhere and
`≤ C·log B` on a dense set, bound the self-intersection by `C·log(B/s)` times a geometric degree that is `O(θ·vol)` because
`δ_Fl` vanishes on the wall. Heights of points: on the reference model (de Rham lattices, fixed smooth metrics) a point has
height `≥ −C·log(2 + C + h_𝒜)` for a dominant weight of norm `≤ 2` (the heights of the root lines at a point are the degrees
of the graded pieces of the flags in the Lie algebra of the semi-abelian scheme there, the determinant lines have bounded
height, and the maximal slope of the Lie algebra is at most `C·log(2 + g + h⁺)` by the logarithmic bound
HeightsForLogSingularMetrics §16.1; Abel summation); the regularised metrics on `M_B(c)` differ from the
reference ones by at most `C` from above and `C·log(1/s) + C` from below at infinity, and at the finite places by at most
`Σ_{ℓ∈S(B)}(c_ℓ + 2v_ℓ(disc E))·log ℓ ≤ C·log B` (`c_ℓ = 1/(ℓ − 1)` for odd `ℓ` and `c_2 = 2`,
from the inclusions of 8.15 (a1), which hold
at every point of `Y_B(c)` over `ℓ` because `ω^{HT}_ℓ` is locally free there; the second terms sum to `2·log|disc E|`, which is
where `C` depends on `E`); minimising `s·h − C·log(2 + C + h)` over `h` gives `≥ −C·log(B/s)` for the weight plus `s·𝒜`; a dense
set of points of bounded height on the reference model gives the upper bound. The regularised numbers per unit degree at
`t = exp(−1/s²)` differ from the limit numbers per unit degree by at most `C·s`, uniformly in `B` and in bounded weights:
the boundary mass bound holds in every dimension (HeightsForLogSingularMetrics §0.4 (c)(i)), and either rate of HeightsForLogSingularMetrics §0.4 (c) gives `C·s` there ((ii) with the boundary rate `δ(t) ≤ C·log log(1/t)/log(1/t)`, or (iii) for close regularisations with losses
`ε_i(t) ≤ C·log log(1/t)/log(1/t)`; SingularHermitianMetricsAndL2Methods §7.7 (c) gives both under the gradient bound of
8.15 (a)); the constant is that of one log
resolution of the component, from which every `M_B(c)` carries pulled-back metrics, and on a cover the difference is the
degree times the difference below (projection formula), so the bound is uniform in `B` for the numbers per unit degree.
Returning to `λ` costs `O(θ log B)` (the coefficients of the normalised numbers as polynomials in the weight are
`O(log B)`); continuity extends to real `λ`.

*Check.* `c_θ = 5` is the value of one construction.

*Sources:* [FormalProof],
`Development/AutomorphicSpectrum/Definitions/DivisibilityTowers/HeckeSectionsIsotropicCommutatorPairingPower.lean`
(`GlobalTheory.CompanionTheory.Ar.Top.RootTower.ThmW`),
`Development/AutomorphicSpectrum/Definitions/DivisibilityTowers/Proportional.lean` (`GlobalTheory.CompanionTheory.Ar.Top.RootTower.PB`),
`Development/AutomorphicSpectrum/Proofs/DivisibilityProofs/TowerWeilTheoremStatement.lean` (`GlobalTheory.T.tower_weil_theorem`).
*Needs:* 8.15; HeightsForLogSingularMetrics §§0.4 (c)(i)–(iii), 4.3a and ArakelovGeometryAndAbelianHeightsPartII §§3.1, 4.8;
SingularHermitianMetricsAndL2Methods §§7.7 (c), 7.8; HeightsRationalPointsAndObstructions §§5.17a, 5.17f;
HeightsForLogSingularMetrics §16.1; ArakelovGeometryAndAbelianHeights §§4.6–4.8.

### 8.15d Arithmetic proportionality for flag bundles: the structure theorem

*Origin:* particular to this proof: arithmetic proportionality for the flag bundles of unitary Shimura varieties up to two
constants, from antisymmetry under the compact Weyl group and vanishing on the non-compact walls; a close precedent:
Bruinier and Howard (arXiv:2105.11274), Theorem A, the exact arithmetic volume of the metrised Hodge bundle on the
integral model, without level structure, of the Shimura variety of `GU(n − 1, 1)` over an imaginary quadratic field of
odd discriminant, in terms of logarithmic derivatives of Dirichlet L-functions. The statements here are for CM fields
`E ≠ K`, unramified over `E⁺`, signatures `(p, q)` with `q > 1` allowed, principal level and every dominant weight on the
flag bundles, and give proportionality up to two constants, not a formula; the two have no Shimura variety in common.

*Method of the formal proof:* the summed limit numbers and `vol_tot·ĥ_Fl` are read as polynomials of degree `D + 1` in the
weight; their difference is antisymmetric under the compact simple reflections and is `O(log B/B)` on a compact piece of
each simple non-compact wall, so the quantitative lemma on antisymmetric polynomials makes it `Δ·l` up to `O(log B/B)`
with `l` an invariant linear form, which is rewritten through `S^p_τ` and `S^N_τ`. The label symmetry comes from the
automorphisms of the moduli scheme that representability attaches to the automorphisms of the CM field, and the
constants are averaged over this transitive group.

In the
setting of 8.15: there are `C`, `B₁`, depending only on `E` and the datum, and reals
`α_τ(B), β_τ(B)` (`B ≥ B₁`) with, for every monomial `m` of degree `D + 1`,
`|Σ_c I_c(B, m) − vol_tot·(ĥ_Fl(m) − Σ_τ(α_τ − β_τ)·S^p_τ(m) − Σ_τ β_τ·S^N_τ(m))| ≤ C·log B/B`.
*Label symmetry.* Suppose `E` is abelian over `ℚ` and `p, q ≥ 1`. Then there is a subgroup `Γ` of the group of
permutations of `Φ`, transitive on `Φ`, such that for every `σ ∈ Γ`, every integer `B ≥ 2` and every polynomial `F` of
degree `D + 1` in the `x_{τ,i}`: `Σ_c I_c(B, σ·F) = Σ_c I_c(B, F)`, `σ·F` being `F` with every `x_{τ,i}` replaced by
`x_{σ(τ),i}`. Consequently `α_τ, β_τ` may be replaced by their means `α(B), β(B)`.

*Route.* By 8.15b, 8.15c and HeightsForLogSingularMetrics §14.2 (`ĥ_Fl` vanishes on the walls; 8.15c is used on the wall of the non-compact simple root at
each `τ`, and the compact Weyl group `S_p × S_q` carries it to the wall of every non-compact positive root, a transitivity that
holds for unitary groups and fails, for instance, for `Sp_{2g}`), `I − vol_tot·ĥ_Fl` falls under the quantitative form of
8.14c: it is `Δ·l` up to `C·log B/B`, with `Δ` the Vandermonde product and `l` a Levi-invariant linear form, spanned by the
block sums; express `Δ·l` through `S^p_τ`, `S^N_τ` (on `ℓ_{u}^{D+1}` they are `−(D+1)δ_Fl(u)Σ_{i<p}u_{τ,i}` and
`−(D+1)δ_Fl(u)Σ_iu_{τ,i}`), polarise, and average over the group for the second statement.
*Label symmetry.* Let `g` be an automorphism of `E` over `K`. The lattice `L_W ⊗ Ẑ` with its form is isometric to its
conjugate by `g`: at every prime both are self-dual Hermitian lattices of the same rank, and `E` is unramified over `F`
(HermitianFormsAndLattices §4.2 (a)); the level, defined by an ideal of `𝒪_K`, is preserved. Hence the conjugate by `g` of
the universal object is an object of the same moduli problem, the pull-back of the universal object along an
automorphism `Φ_g` of the moduli scheme over its base (PELModuli M1.7). Over `Φ_g` the Lie algebras of the two universal
objects are identified by a map that is `g`-semilinear for `𝒪_E`; it carries the eigenspace at `τ` to the eigenspace at
`τ∘g`, the patched lattice of the first (the Hodge–Tate lattices of the same level at the primes of `S(B)` included)
to that of the second, and the Hodge metric to the Hodge metric. So the model `M_B(c)` with the lines `x_{τ,i}` and the
model of the image component with the lines `x_{τ∘g,i}` are dominated by one model on which the lines and their singular
metrics agree, and their limit numbers per unit degree are equal by HeightsForLogSingularMetrics §0.4 (b) (two
generically finite maps from one log-smooth model). Summing over the components gives the invariance for
`σ : τ ↦ τ∘g`; these `σ` form a group acting transitively on `Φ`.

*Sources:* The structure theorem: [FormalProof],
`Development/AutomorphicSpectrum/Definitions/DivisibilityTowers/HeckeSectionsIsotropicCommutatorPairingPower.lean`
(`GlobalTheory.CompanionTheory.Ar.Top.RootTower.ThmB`). The label symmetry: [FormalProof],
`Development/AutomorphicSpectrum/Proofs/DivisibilityProofs/GoodTowerGlobalExtraStatement.lean`
(`GlobalTheory.T.good_tower_propA_of_global_extra`),
`Development/AutomorphicSpectrum/Statements/GeometryStatements/HodgeComparisonCompatibility.lean`
(`GlobalTheory.CompanionTheory.Ar.HodgeComparisonCompatibility`, proved there without hypotheses as `GlobalTheory.T.CmpHodgeTied_holds`,
`Development/AutomorphicSpectrum/Proofs/GeometryProofs/CmpHodgeTiedHoldsStatement.lean`),
`Development/AutomorphicSpectrum/Statements/GeometryStatements/PadicIntegersHenselianFiniteResidue.lean`
(`GlobalTheory.CompanionTheory.Ar.TwistAut`, proved there without hypotheses as `GlobalTheory.T.TwistAut_holds`,
`Development/AutomorphicSpectrum/Proofs/GeometryProofs/TwistAutHoldsStatement.lean`).
*Needs:* 8.14c, 8.15b, 8.15c; HeightsForLogSingularMetrics §§0.4 (b), (c), 14.2; PELModuli M1.7;
HermitianFormsAndLattices §4.2 (a).

### 8.15e Change of cut-off

*Origin:* particular to this proof: the change of the limit numbers when the Lie lattice at a good prime
is replaced by the Hodge–Tate lattice, as an explicit vertical class.

*Method of the formal proof:* on a normal refinement of the model over a discrete valuation ring above `ℓ`, on which the
lattices of 8.14b are vector bundles, `h(τ)` is the sum over the diagonal lines of (L3) of their `k`-th local numbers; the
exact sequence of (L2) with the rule for the power sums of a bundle scaled by `w` gives the difference of the two
integral structures as `h(τ) − v_k(τ)/(ℓ − 1)`, the Frobenius relation of (L4) gives `ℓ^k·h(τ) = h(φτ) + v_k(φτ)`, and
iteration along the orbit of `φ` with a geometric series gives `ϰ_k`; the numbers are unchanged under the refinements and
descend from an extension of the valuation ring that contains the multiplicative lifts.

In the setting of 8.15, let `ℓ` be a good prime (odd,
unramified in `E`, prime to the level), `φ` its Frobenius permutation of the labels `Φ ⊔ cΦ`, `k ≥ 1` and `Q` of degree
`D + 1 − k`. Then the difference of `p_k(τ)` computed with the lines of the de Rham integral structure at
`ℓ` and with those of the Hodge–Tate one (on one model carrying both families, isometric at infinity), against `Q`, is the
vertical class `[div ℓ]·k·Σ_σ ϰ_k(τ, σ)·P_{k−1}(σ)·Q`, with `ϰ_k(τ, σ) = Σ_{n≥0} ℓ^{−k(n+1)}[φ^{n+1}τ = σ] − [σ = τ]/(ℓ − 1)`,
`P_{k−1}(τ) = Σ_{i<p}x_{τ,i}^{k−1}`, `P_{k−1}(cτ) = Σ_{i≥p}(−x_{τ,i})^{k−1}`. Consequently, for a cut-off `B′ ≤ B`,
`I_c(B′, p_k(τ)Q) = I_c(B, p_k(τ)Q) + vol(c)·Σ_{B′<ℓ≤B, ℓ good} δ(ℓ, τ, k, Q)`,
`δ(ℓ, τ, k, Q) = log ℓ·k·Σ_σ ϰ_k(τ, σ)·deg_Fl(P_{k−1}(σ)·Q)`, and `δ` is `−(log ℓ/(ℓ − 1))·Σ_σ S^p_σ(p_kQ)` plus a multiple of
`Σ_σ S^N_σ(p_kQ)` depending only on `ℓ`, `φ` and `(p, q)`, plus a remainder that vanishes for `k = 1` and is summable over `ℓ`.

*Route.* On a normal modification on which the lattices of 8.14b are vector bundles: with the Chern character with
supports in the special fibre and `p_k(V(div w)) − p_k(V) = k·p_{k−1}(V)·[div w]`, `[div w] = [div ℓ]/(ℓ − 1)`, (L2) gives
`h(τ) − v_k(τ)/(ℓ − 1)` for the difference, `h(τ) := p_k(Ξ_τ) − p_k(T ⊗ 𝒪)`, (L3) of 8.14b writes `h(τ)` through the diagonal lines
`ℒ_{τ,i}`, and (L4) of 8.14b gives `0 → ℒ_{τ,i}^{⊗ℓ} → ℒ_{φτ,i} → gr^i(ω_{φτ}/ℓ) → 0`, hence the recursion `ℓ^k·h(τ) = h(φτ) + v_k(φτ)`,
`v_k(τ) = k·(P_{k−1}(τ)·Q·[div ℓ])`, whose solution is `ϰ_k`; (L1) makes the lattices `Ξ_τ` comparable to the trivial one. On
one model carrying both families of lines, isometric at infinity, the difference of intersection numbers is a sum of
these vertical terms, evaluated in the special fibre by proportionality; the models for `B′` and `B` are compared on a model
dominating both (8.15 (a)).

*Checks.* For a label fixed by `φ`: `ϰ_k(τ, τ) = 1/(ℓ^k − 1) − 1/(ℓ − 1)`, zero for `k = 1`; and for `k = 1`,
`Σ_σ ϰ_k(τ, σ) = (1/ℓ)/(1 − 1/ℓ) − 1/(ℓ − 1) = 0`: first Chern classes see the change of lattice only through the ranks `p`,
`q` of the labels that Frobenius exchanges.

*Sources:* [FormalProof], `Development/AutomorphicSpectrum/Statements/GeometryStatements/HodgeLatticeFlagBound.lean`
(`GlobalTheory.CompanionTheory.Ar.HodgeLatticeFlagBound`), derived there from the statement of 8.14b
(`GlobalTheory.CompanionTheory.Ar.Num.FamilyExistsPos`) by `GlobalTheory.T.model_on_hodge_from_family`,
`Development/AutomorphicSpectrum/Proofs/GeometryProofs/ModelOnHodgeFromFamilyStatement.lean`.
*Needs:* 8.14b, 8.15; DiscreteSeriesCoefficientsAndAutomorphicMetrics §10.2.

### 8.16 The two constants

*Origin:* particular to this proof: the two constants of arithmetic proportionality are bounded by testing on the flat
line and on the Hodge line, with Zhang's theorem of successive minima and a mean bound for the first minimum of a
Hermitian lattice over the arithmetic quotient; a close precedent: Bruinier and Howard (arXiv:2105.11274), Theorem A
(8.15d), in whose case the arithmetic volume per unit of complex volume is, up to elementary constants, a combination of
logarithmic derivatives of Dirichlet L-functions and of the logarithms of the discriminant of the imaginary quadratic
field and of its prime factors, quantities of the kind that bound the
two constants here.

*Method of the formal proof:* the constants at a cut-off are the limits of the coefficients of 8.15d corrected by the
change of cut-off, which converge because two test classes determine them through a triangular system;
`|p·α_∞ + N·β_∞|` is read on the class
`p₁(τ)·Q`, a flat line, and the lower bound for `α_∞` on a power of the small Hodge class times the fibre class,
decomposed along the power sums, with the lower half of the inequality of successive minima on the base, the mean of the
cusp weight (packing of short isotropic vectors, a scaling law by unfolding, a layer-cake integral) and the height of a
product of Grassmannians.

In the setting of 8.15 with the transitive symmetry
of 8.15d, put `Λ_E(B) = log(B·rd_E) + |(L′/L)(1, χ_K)|` and `j′ = min(p, q)`. Prove:

(a) *Heights on the base.* Let `ω_{j′}` be the determinant of the Hodge piece of rank `j′` on a component (for `q ≤ p`,
`ω_{j′} = ⊗_τ det(ω_{cτ}) = ω_q` of 8.14; for `p < q`, `⊗_τ det(ω_τ)`), with the Hodge norm multiplied by `exp(−U/2)` (for
a local frame `e` the potential `−log‖e‖` is increased by `U/2`, so the heights of points increase by the mean of `U/2`
over the embeddings), where the
*cusp weight* `U` at a point is `max(0, sup_I −log nz(I))` over the nonzero saturated isotropic `𝒪_E`-submodules `I` of its
period lattice (`nz(I)` the product over `τ` of the Gram determinants of the `τ`-components of a basis of `I`, divided by
the index), regularised, and with the integral structure of the cut-off `B` (the vertical factors at the primes of
`S(B)`). Let `𝒜` be the ample class of 8.15 (a), with a constant `K_𝒜` bounding the heights of points for `𝒜̄` from below.
Suppose that at most `4|Φ|N²` primes divide `2·disc(E)` and the level.
There are `B₂(|Φ|)` and `C` such that for every rational `ε ∈ (0, 1]` and `B ≥ max(B₂, 4|Φ|N²)`: the line `ω_{j′} + ε·𝒜` is
semipositive, nef on the fibres and ample on the generic fibre, and every point has height `≥ −C|Φ|·j′·Λ_E(B) − ε·K_𝒜`.

(b) *Mean of the first minimum.* Let `h` be a Hermitian form on `E^N` of signature `(p, q)` at every place of `Φ`, `q ≥ 1`,
`L ⊂ E^N` an `𝒪_E`-lattice on which `h` takes values in `𝒪_E`, and `Γ ⊂ U(h)` an arithmetic subgroup preserving `L`; for
`g ∈ U(h)(F_∞)` let `λ₁(g)` be the first minimum of `L` for the majorant at `g` (normalised by the trace over the places of
`Φ`). Put `a_q = 2|Φ|j′`, `k_q = 2|Φ|(N − 1)`, let `r₀ := (2|Φ|·rd_E)^{−1/2}` (below this length nonzero vectors of `L` are
isotropic and mutually orthogonal), and for `0 < r_* ≤ r₀` let `m(r_*)` be the mass over `Γ∖U(h)(F_∞)` of the isotropic vectors
of `L` of bounded line index and length `< r_*`. If `a_q < k_q`, the mean of `log⁺(r_*/λ₁)` over `Γ∖U(h)(F_∞)` is at most
`(1 + log⁺ m(r_*))/k_q`, with `m(r_*)^{1−a_q/k_q} ≤ 3^{a_q}·k_q/(k_q − a_q)`; in particular it is bounded by an absolute constant (at
most `3`) when `3j′ + 1 ≤ N`. (The case `3j′ + 1 ≤ N`, with the bound `3` and for every `r_* ≤ r₀`, is the statement of
[FormalProof]; the general form is this roadmap's.) Consequently, if `3j′ + 1 ≤ N`, `B ≥ 4|Φ|N²` and at most `4|Φ|N²`
primes divide `2·disc(E)` and the level, the mean of `U` against `c₁(ω_{j′})^{dim Sh}` is at most
`C|Φ|j′·Λ_E(B)·vol`.

(c) *Height of the variety.* If `3q + 1 ≤ N` (so `j′ = q`), `B ≥ max(128, 4|Φ|N²)` and at most `4|Φ|N²` primes divide
`2·disc(E)` and the level:
`I_tot(c₁(ω_{j′})^{dim Sh+1}·fib) ≥ −C|Φ|j′·Λ_E(B)·(dim Sh + 1)·deg(c₁(ω_{j′})^{dim Sh}·fib)`,
`fib := ∏_τ∏_{a<b, same block}(x_{τ,b} − x_{τ,a})` the product over the pairs of indices in the same block (of degree
`|Φ|·(p(p − 1) + q(q − 1))/2 = D − dim Sh`, the relative dimension, so that the class has degree `D + 1`), and `deg` the geometric
degree, summed over the components.

(d) *The constants.* Fix a cut-off `B′ ≥ 2`. There are real numbers `α_∞`, `β_∞`, depending on `B′`, such that
`Σ_c I_c(B′, p_k(τ)Q) = vol_tot·(ĥ_Fl(p_k(τ)Q) − α_∞Σ_σ S^p_σ(p_k(τ)Q) − β_∞Σ_σ S^N_σ(p_k(τ)Q) + rest(B′))` holds exactly
for every `τ`, every `1 ≤ k ≤ N` and every `Q` of degree `D + 1 − k`, with `rest(B′)` the summed remainders of 8.15e over
the good primes `ℓ > B′` (they vanish for `k = 1`). They arise from `α(B) − β(B) + Σ_{B′<ℓ≤B, ℓ good} log ℓ/(ℓ − 1)` and
`β(B) − Σ_{B′<ℓ≤B, ℓ good} κ_ℓ` (`κ_ℓ` the coefficient of `S^N` in 8.15e for `k = 1`): for each `(τ, k, Q)` the identity
holds with these coefficients at `B` and the remainders up to `B`, up to an error tending to `0` as `B → ∞`. (The
convergence of the two sequences is not used: what follows holds for every pair of constants
satisfying the identity.) If `B′ ≥ 128` and at most `B′` primes divide `2·disc(E)` and the level, then
`|p·α_∞ + N·β_∞| ≤ C·N·Λ_E(B′)`; if moreover `B′ ≥ 4|Φ|N²` and at most `4|Φ|N²` primes divide `2·disc(E)` and the level,
then `α_∞ ≥ −C·Λ_E(B′)`; `C` absolute (`C = 4` in the first bound).

(e) *Equal volumes.* If `q ≥ 1` and `3q + 1 ≤ N`, all components have the same volume.

*Route.* (a) A point of the model over `𝒪_L` has an abelian and a toric part; choose vectors of the toric lattice and an
adapted family of vectors of the eigenspaces; the height of the point for `ω_{j′}` is bounded below by minus a degree of
the fibre lattice, which the flat degree (8.11) and the logarithmic bound for the maximal slope of the Lie algebra
(HeightsForLogSingularMetrics §16.1, for a semi-abelian scheme with an `𝒪_E`-action and a symmetric cubical line bundle
compatible with it that gives the principal polarisation of its abelian generic fibre, as the bundle of the setting does,
with the Hodge inner product `π·H_A`, Deligne's normalisation, as in 8.11;
with the Faltings metric of ArakelovGeometryAndAbelianHeights §2.8
the slopes of `Lie` change by `½·log π`, which costs at most `C|Φ|j′` on the fibre lattice) bound by `C|Φ|j′·Λ_E(B)`; the twist by `ε·𝒜` makes the line ample on the
generic fibre and costs `ε·K_𝒜`; nefness and semipositivity as in 8.15 (a1), (a2). (b) Vectors shorter than `r_* ≤ r₀` are isotropic
and mutually orthogonal (their `h`-values lie in `𝒪_E` and are smaller than `1` at every place), so they span an isotropic
sublattice of real rank at most `a_q = 2|Φ|j′` (an isotropic subspace has dimension at most `min(p, q)` at each place), and there are at most `(3y/λ₁)^{a_q}` of them below length `y`
(packing: the balls of radius `λ₁/2` about them are disjoint and lie in the ball of radius `y + λ₁/2`, `y ≥ λ₁`); the mass `m(y)` of
short isotropic vectors over the quotient is finite (finite covolume) and scales as `m(θy) = θ^{k_q}m(y)` by unfolding over
the orbit of an isotropic vector; then `P(λ₁ < s) ≤ min(1, (s/r_*)^{k_q}m(r_*))` and a layer-cake integral bound the mean by
`(1 + log⁺ m(r_*))/k_q` with `m(r_*)^{1−a_q/k_q} ≤ 3^{a_q}·k_q/(k_q − a_q)`, absolute when `3a_q ≤ k_q`. For `U`:
`U ≤ |Φ|j′·(2log⁺(1/λ₁) + log(2|Φ|j′·rd_E))` and `log⁺(1/λ₁) ≤ log⁺(r₀/λ₁) + ½·log(2|Φ|·rd_E)`; the integral against
`c₁(ω_{j′})^{dim Sh}` is a sum of integrals over fundamental sets for the invariant density. (c) The lower half of Zhang's
inequality (HeightsRationalPointsAndObstructions §5.17f) for `ω_{j′} + ε·𝒜` with (a), then `ε → 0` (both sides are
polynomials in `ε`), then removing the correction `U/2` at the cost of `½·mean(U)` by (b). (d) Let `B → ∞` in 8.15d with
8.15e and test on two polynomials: `p₁(τ)·Q`, for which `Σ_i x_{τ,i}` is the class of `𝓕_τ`, so
`I_c(p₁(τ)Q) = deg(𝓕̄_τ)·vol(c)·deg_Fl(Q)` by 8.11 (b) (in the normalisation of the intersection numbers; in the form of
[FormalProof]: on the model at the cut-off `2` the line `Σ_i x_{τ,i}` is a flat line of height `h_rec + Σ_{ℓ bad} d_ℓ` with
`|h_rec| ≤ N·(3/2·log rd_E + |(L′/L)(1, χ_K)|/2)`, `|d_ℓ| ≤ (N/(ℓ − 1) + N·v_ℓ)·log ℓ` and `Σ_ℓ v_ℓ·log ℓ ≤ log rd_E`,
`Development/AutomorphicSpectrum/Proofs/DivisibilityProofs/GoodTowerRealExtraStatement.lean`
(`GlobalTheory.T.good_tower_real_extra`)) up to the change of
cut-off with `k = 1` (a correction of at most `N·log ℓ/(ℓ − 1)` per good prime, and `Σ_{ℓ≤B} log ℓ/(ℓ − 1) ≤ log B + O(1)`),
and `ĥ_Fl(p₁Q) = 0` (HeightsForLogSingularMetrics §14.2): this gives `|p·α_∞ + N·β_∞|`; and `c₁(ω_{j′})^{dim Sh+1}·fib`, against (c) and the upper bound
`|Φ|·(q/2)·log(N − q + 1)` per unit of `(dim Sh + 1)·deg` for the height of the product over `τ ∈ Φ` of the Grassmannians over `ℤ`
(each factor contributes at most `(q/2)·log(N − q + 1)`, HeightsForLogSingularMetrics §14.2 (d)): this gives `α_∞ ≥ −C·Λ_E`. (e) The
degree of `ω_{j′}` on a component is a fixed multiple of the invariant volume of a fundamental set, and the level
stabilisers of two self-dual Hermitian lattices of the same rank and signature have equal covolumes (strong
approximation for `SU`, Kneser). Two steps of this route are not given here: in (a), a lower bound for the heights of the
points that does not depend on `h(A)`; in (c), (d), the normalisation of the push-forward of the class `fib` on both sides
of the test.

*Check.* `B₂ = 4|Φ| + 2` is the value of one construction, and `r₀` is the threshold of one argument: any `r_*` below the
length at which short vectors become isotropic and orthogonal works. [FormalProof] states the inequality of (c) as a
property of a tower of models, for every integer `B ≥ max(128, 4|Φ|N²)` with at most `B` bad primes, and derives it from
the heights on the base (a) and the mean of the cusp weight (b) supposed at every such `B`; for the Shimura varieties (a)
and (b) are available when at most `4|Φ|N²` primes are bad, which is the hypothesis here.

*Sources:* (a), (b): [FormalProof], `Development/AutomorphicSpectrum/Statements/GeometryStatements/NineGeoU.lean`
(`GlobalTheory.CompanionTheory.Ar.Cusp.NineGeoU`); in [FormalProof] the constants of (a) and (b) are absolute: they are
chosen before `E` and the datum. (c) follows from [FormalProof],
`Development/AutomorphicSpectrum/Definitions/GlobalGeometry/HasBaseDegreeSettingStrict.lean`
(`GlobalTheory.CompanionTheory.Ar.Top.RootTower.HasBaseDegreeSettingStrict`). (d), the lower bound for `α_∞`: [FormalProof],
`Development/AutomorphicSpectrum/Proofs/DivisibilityProofs/TestHeightBoundStatement.lean` (`GlobalTheory.T.test_height_bound`).
(e): [FormalProof], `Development/AutomorphicSpectrum/Proofs/DivisibilityProofs/GoodTowerIntersectionExtraStatement.lean`
(`GlobalTheory.T.good_tower_intersection_extra`).
*Needs:* 8.11, 8.15, 8.15d, 8.15e; HeightsRationalPointsAndObstructions §5.17f; ArakelovGeometryAndAbelianHeightsPartII §4.8 and HeightsForLogSingularMetrics §14.2; HeightsForLogSingularMetrics §16.1 (through its reduction step, the absolute Siegel lemma
HeightsForLogSingularMetrics §4.3b (b)); AdelicAlgebraicGroups §4.2 (finite covolume, strong approximation).

### 8.17 The average arithmetic volume theorem

*Origin:* particular to this proof: a lower bound, in the mean over the connected components, for the arithmetic volume of
the automorphic line bundles on the flag bundles, with explicit dependence on the weight and on the field; a close
precedent: Bruinier and Howard (arXiv:2105.11274), Theorem A, the exact arithmetic volume of the Hodge bundle for
`GU(n − 1, 1)` over an imaginary quadratic field without level structure (8.15d), where the bound here is an inequality,
for the dominant weights whose entries at every place are strictly decreasing with a gap in the smaller block, and with
`|Φ| ≥ 2`.

*Method of the formal proof:* `ℓ_u^{D+1}` is decomposed along the power sums and the exact identity of 8.16 (d) at the
cut-off `B` is applied term by term, with `ĥ_Fl ≥ 0` on dominant weights, the bound for the remainder, and
`α_∞s + β_∞t = α_∞(s − pt/N) + (pα_∞ + Nβ_∞)t/N`; the components have equal volume. The volume slope on a component is
bounded below by the slope of the limit self-intersection minus a cost `O(log B)·|u|₁`, by counting small sections on the
model of the flag bundle and carrying them to forms on the cover, with `B = B(u, g)`. The identity of 8.16 (d) is exact
at every cut-off, so the proof asks no lower bound `B₁` for the cut-off and bounds the volume slope at every shift; the
route written here covers `B(u, g) ≥ B₁` only.

There are absolute constants `C`, `c_B ≥ 1`, and
`B₁ ≥ max(128, 4|Φ|N²)` depending on `E` and the datum (that of 8.15d), such that, in the setting of 8.15 with the transitive symmetry of 8.15d, with
`p, q ≥ 1`, `3q + 1 ≤ N` and the level good at every prime, as in the setting (the *bad primes* are those dividing `2·disc(E)` and the level):
for every dominant `u` with every `u_τ` strictly decreasing and `|u_{τ,a} − u_{τ,b}| ≥ g > 0` for every `b ≠ a` whenever `a` lies in
the smaller block (of size `min(p, q)`), and every `B ≥ B₁` with `B + 1 > c_B|Φ|N²(1 + ‖u‖_∞/g)` and at most `4|Φ|N²` bad primes,

`I(B, u) ≥ −C·(D + 1)·vol_tot·δ_Fl(u)·(Λ_E(B)·|u|₁ + min(p, q)·spread(u))`,  `spread(u) = Σ_τ(max_i u_{τ,i} − min_i u_{τ,i})`;

hence, the components having the same volume (8.16 (e)), the mean over the components of
`I_c(B, ℓ_{u}^{D+1})/((D + 1)·vol(c)·δ_Fl(u))` is at least
`−C·(Λ_E(B)·|u|₁ + min(p, q)·spread(u))`. This first form is a step of the route; the theorem used below is the mean of
the volume slopes.

*The mean of the volume slopes.* There is an absolute constant `C` such that, in the setting of 8.15 with the transitive
symmetry of 8.15d, with `|Φ| ≥ 2`, `q ≥ 1`, `3q + 1 ≤ N` (so `q < p`, and the block of the last `q` indices is the smaller
one), the level good at every prime, and at most `4|Φ|N²` primes dividing `2·disc(E)` and the level: for every dominant
`u` with every `u_τ` strictly decreasing and every real `g > 0` with `|u_{τ,a} − u_{τ,b}| ≥ g` for every `b ≠ a` whenever `a` lies in
the last `q` indices, with `B(u, g) := 4|Φ|N²(1 + ‖u‖_∞/g)`, the mean over the components of the *volume slopes* of the
weight-`u` forms (the arithmetic volume of the integral forms of weight `u` with the mixed integral structure at
`S(B(u, g))`, divided by `(D + 1)·vol(c)·δ_Fl(u)`) is at least

`−C·[(log B(u, g) + log rd_E + |(L′/L)(1, χ_K)|)·|u|₁ + q·spread(u)] = −C·err(u, g)`,

which defines `err(u, g)`. No lower bound for `B(u, g)` is asked, and `C` depends neither on `E` nor on the datum.

*Route.* Every homogeneous polynomial of degree `> D` lies in the ideal of the power sums: write
`ℓ_{u}^{D+1} = Σ_{τ,k} p_k(τ)·Q_{τ,k}`; apply 8.16 (d) with the cut-off `B′ = B`; `ĥ_Fl ≥ 0` for dominant weights (HeightsForLogSingularMetrics §14.2 (c)); the remainder
is at most `2(D + 1)·δ_Fl(u)·min(p, q)·spread(u)` in absolute value (this uses `B + 1 > c_B|Φ|N²(1 + ‖u‖_∞/g)`); with
`s_τ = Σ_{i<p}u_{τ,i}`, `t_τ = Σ_iu_{τ,i}`, `α_∞s + β_∞t = α_∞(s − pt/N) + (pα_∞ + Nβ_∞)t/N` and `0 ≤ s − pt/N ≤ Σ_i|u_{τ,i}|` for
dominant `u`, so 8.16 (d) bounds it below by `−C·Λ_E·Σ_i|u_{τ,i}|`; divide by the common volume (8.16 (e)). The volume
form: arithmetic volume `≥` self-intersection for line bundles that are nef on the fibres and semipositive, with log-log
singular metrics and mixed integral structures (HeightsForLogSingularMetrics §4.3a), and the comparison of sup
norms of forms with those of the regularised metrics, at cost `O(log B)·|u|₁`, and asymptotic Riemann–Roch for classes nef on
the generic fibre, which turns the volume into the growth of the ranks of the lattices of forms
(ArakelovGeometryAndAbelianHeightsPartII §0.3 (1′): `vol(L) = (L^n)` for a nef line bundle `L` on a projective variety of
dimension `n` over a field); with `B = B(u, g)` (`c_B = 4`), `Λ_E(B)` is the bracket of `err`.
(*Lower count along multiples.*) Let `𝒳` be an integral scheme, projective and flat over `ℤ`, of dimension `D + 1 ≥ 2`,
and `L̄` a line bundle on it with a smooth metric, semipositive and invariant under complex conjugation, such that `L` has
non-negative degree on every curve contained in a closed fibre and `(L_ℚ^D) > 0`. Then for every `ε > 0` there is `a ≥ 1` with `log#{s ∈ H⁰(𝒳, L^{ak}) : sup‖s‖ ≤ 1} ≥ (L̄^{D+1} − ε)·(ak)^{D+1}/(D + 1)!` for all large `k`.
No hypothesis is made on the horizontal curves, and none of ampleness. (It follows from the volume inequality of
HeightsForLogSingularMetrics §4.3a for smooth metrics and the existence of the limit defining the volume,
ArakelovGeometryAndAbelianHeightsPartII §0.3.) This passage
needs `B(u, g) ≥ B₁`; the mean of the volume slopes when `B(u, g) < B₁` is not given here. The volume slope is
used as a function of the shift; that it has the stated bound at every shift, and not only at the one metric at which it
is defined, is not given here.

*Check.* On a non-compact wall `δ_Fl(u) = 0` and the inequality is empty; the gap condition excludes it. The
dependence on `E` enters only through `rd_E` and `(L′/L)(1, χ_K)` in `Λ_E`, that is through 8.11 twice (in 8.16 (a) and in
the test with `p₁(τ)` of 8.16 (d)). The error `C·Λ_E(B)·|u|₁` is of the same order as the flat term `|u|₁·|log Ω|`
of 8.11–8.12: 8.17 carries no main term and is applied only to the weight left after the flat twist. `log(‖u‖/g)` in
place of `log B(u, g)` would be wrong: it can be negative, and `log(|Φ|N²)` is not bounded by the other terms.
`c_B = 4` is the value of one construction, and `128` is the absolute part of the lower bound for `B₁` (`B(u, g) ≥ 128` holds when `|Φ| ≥ 2` and `N ≥ 4`).

*Sources:* the mean of the volume slopes in the form stated (no lower bound for `B(u, g)`, `C` independent of `E` and of the
datum) is the form of [FormalProof],
`Development/AutomorphicSpectrum/Proofs/GeometryProofs/AbelianCmCompLawsBoundStatement.lean`
(`GlobalTheory.T.abelian_cm_comp_laws_bound`, which takes six named statements as hypotheses); on the deep covers of the chain,
`Development/WeilBound/CoreStatements/AutomorphicKernels/MoriwakiBigness/HilbertSamuelApplications/AhSlimU.lean`
(`PositivityTheory.HtPt.Ah.deep_slim_use`); and the route written here covers `B(u, g) ≥ B₁` only. The first form follows from [FormalProof],
`Development/AutomorphicSpectrum/Proofs/DivisibilityProofs/TowerT2Statement.lean` (`GlobalTheory.T.tower_T2`),
`Development/AutomorphicSpectrum/Proofs/DivisibilityProofs/MeanSlopeProportionalVolumeStatement.lean`
(`GlobalTheory.T.mean_slope_proportional_volume`). *Needs:* 8.15, 8.15e, 8.16; ArakelovGeometryAndAbelianHeightsPartII §0.3 (with (1′)) and HeightsForLogSingularMetrics §§4.3a, 14.2; DiscreteSeriesCoefficientsAndAutomorphicMetrics §10.2.

### 8.17a The basis problem in the stable range

*Origin:* adapted from Weissauer (1986) and Böcherer (2006): the basis problem by doubling and the Siegel–Weil formula,
carried to holomorphic cusp forms on `U(W)` over a CM field at the levels of the setting, in the explicit range
`n(w) ≥ 4[E:ℚ]·N + 4`, uniformly in the level and with explicit sup-norm bounds for the spanning theta series.

*Method of the formal proof:* a kernel built from pluriharmonic polynomials reproduces bounded holomorphic forms on a thin
slab of the frame domain; the doubling identity (Eisenstein series on the doubled group restricted to the graph,
Siegel–Weil formula for definite Hermitian lattices of rank `> 4N`) writes the kernel, weighted by a matrix of class sums
of inner products of level test functions, as a sum of products of theta series; this matrix is diagonally dominant and
is inverted by a Neumann series, and unfolding writes every form as a finite combination of theta series. The published
proofs invert instead through Hecke eigenvalues and the nonvanishing of an `L`-value in the range of convergence, or
through the injectivity of Hecke operators at the bad places.

In the setting of 8.11–8.19 let `K′ ⊂ K_W` be a level of the kind of the setting (good at every prime) and `𝕂 ⊃ F′` a number field containing the values of the
characters of the level. A *weight* `w` is a dominant weight `a(w) = (a⁺_τ, a⁻_τ)_τ` of the Levi subgroup `∏_τ GL_p × GL_q`
with entries `≥ 0` together with an even integer `n(w)`, the *scalar weight*; its *theta series* are the theta lifts to
`U(W)` at level `K′` of the forms on the definite unitary groups of rank `n(w)`: the theta series of the positive definite
self-dual Hermitian `𝒪_E`-lattices of rank `n(w)`, with pluriharmonic coefficients of weight `a(w)` with integral
coefficients and with the characteristic functions of cosets at the level, read at the extremal vector of the lowest
`K`-type. If `n(w) ≥ 4[E:ℚ]·N + 4` and the last entry of `a⁺_τ` is positive for every `τ ∈ Φ`, the cusp forms of weight `w`
on `Sh(W, K′)` are spanned over `𝕂` by the theta series of weight `w`. *Sup norms.* Put `DF(w) := Σ a(w)` and
`|w| := Σ a(w) + f·max(q, 1)·N·n(w) + 1`, and let `L ≥ 2` be a real number with `log g_i ≤ 9L + 1`, `log rd_E ≤ 2L`,
`log d ≤ 2L`, `log f ≤ 2L`, `log p_δ ≤ L`, `log p′_δ ≤ L` (the auxiliary primes `p_δ, p′_δ` of
ThetaChainsOnDefiniteUnitaryGroups §2.4 (b)),
`log(1 + DF(w)) ≤ 2L` and `log n(w) ≤ L` (at the scale `x` of the chain, `L = x^ε`). If `n(w) ≥ N` and the last entries are
positive, a theta series `g` of weight `w` whose pluriharmonic polynomial `P` has integral coefficients satisfies, at every
embedding `σ`, `log sup_σ|g| ≤ ℓ + 10·L·DF(w) + 200·f·N·n(w)·L` for every `ℓ ≥ 0` with `Σ|σ(c)| ≤ e^ℓ` over the coefficients
`c` of `P`; and the pluriharmonic polynomials of weight `a(w)` are spanned by finitely many with integral coefficients and
`Σ|σ(c)| ≤ exp(140·N·L·DF(w))` at every embedding. Hence the cusp forms of weight `w` have a finite spanning set of theta
series of logarithmic sup norm at most `(140N + 10)·L·DF(w) + 200·f·N·n(w)·L` at every embedding, which is at most
`(140N + 10)·L·|w|` when `N ≥ 2`. The factor `L` is not a constant: it grows with the field, the primes of the level and
the weight.

*Route.* The basis problem by the doubling method in the convergent range: a reproducing kernel on a thin slab of the
frame domain, a doubling identity that uses the Siegel–Weil formula for definite Hermitian lattices of rank `> 4N`
(MetaplecticAutomorphicForms §6.4 and ThetaKernelsForUnitaryDualPairs §6.4a), a Neumann series for the diagonally dominant matrix of the test functions, and
unfolding; the larger bound `4[E:ℚ]N + 4` is used for the test functions at the level. The theta series are rational, so a
finite spanning set over `ℂ` of them spans over `𝕂`. The spanning statement is uniform in the level: it holds at every level
of the kind of the setting (an odd `M ≥ 3` with `M𝒪_K = 𝔐·𝔐̄`, `𝔐 + 𝔐̄ = 1`, similitude level one) at which the arithmetic
groups of the components contain the principal congruence subgroups of level `M`, their automorphy characters are trivial
and the components have the same model form. The theta series may be formed at a deeper level `M·p_d`, `p_d` an integer
prime to `3M`, and brought down to level `M` by a section without zeros. It is used at the levels of the steps, with theta
series formed at the auxiliary primes `p_δ, p′_δ`, and at the deep covers of 8.18 (o), with theta series formed at the level
of the cover.

*Sources:* (the basis problem through the doubling method). The spanning statement: [FormalProof],
`Development/AbelianVarietyTheory/Proofs/SiegelThetaTransformation/CuspFormsLeSpanShortThetaSeriesStatement.lean`
(`GlobalTheory.T.cuspForms_le_span_shortThetaSeries`, the cusp forms of weight `w` lie in the span over `𝕂` of the theta
series of weight `w` when `n(w) ≥ 4[E:ℚ]·N + 4` and the last entries are positive, at a level with the properties named
in the route, the theta series being formed at a deeper level `M·p_d`, `p_d` prime to `3M`, and brought down by a section whose
values in the complex frames have absolute value one) and
`Development/AbelianVarietyTheory/Proofs/SiegelThetaTransformation/ShortThetaSeriesDominantWeightIsCuspFormStatement.lean`
(`GlobalTheory.T.short_thetaSeries_dominant_weight_isCuspForm`, these theta series are cusp forms); both take the same
named statement as a hypothesis.
*Needs:* RowTowerAndRallisIdentities §5.11; ThetaLiftsForDefiniteUnitaryGroups
§§3.2–3.3; MetaplecticAutomorphicForms §6.4 and ThetaKernelsForUnitaryDualPairs §6.4a; ThetaChainsOnDefiniteUnitaryGroups §2.4 (b).

### 8.18 Heights of images on deep covers

*Origin:* particular to this proof: the height of the projective image of the flag bundle under the cusp forms of a
divided weight is bounded below by the arithmetic volume, through carrying sections and the upper half of the arithmetic
Hilbert–Samuel count.

*Method of the formal proof:* (a) the height of the image is the height of its Chow form, and every nonzero
multihomogeneous form of degree `δ_Z` in each of `D + 1` blocks has height at least `−(D + 1)·δ_Z·log Λ` in the
coordinates of generators of norm at most `Λ`, by induction on the degree through the leading coefficient along one
generator (Gauss norms at the finite places, a Jensen inequality on spheres at the infinite ones). The route written here
bounds the height through the points of the image and the inequality of successive minima. (b) Small forms of
weight `u′` are multiplied into small forms of weight `u₁` by powers of the carrying section and counted on a nef model of
the image by the Hilbert–Samuel upper bound and the identification of the top self-intersection with
`(D + 1)·δ_Z·h(u₁, Z)`; (c) is the mean of (b) with 8.17.

Let `1 ≤ j < m`, `W = W_j` with the weights of ThetaChainsOnDefiniteUnitaryGroups §2.3, under the
size conditions of ThetaChainsOnDefiniteUnitaryGroups §2.1; `λ^W_j` the weight whose classical lift is the discrete series of the model lift of step `j` (RowTowerAndRallisIdentities §5.7),
with its *anchor* `â_j(τ) := λ^W_j(τ)_{k−1}` (the entry of index `k − 1`, counting from `1`), `w_q := −(0, …, 0, 1, …, 1)` the
weight of `ω_q` (8.14), `D` the dimension of the flag bundle of `Sh(W_j)`, and `c = c_j` the least positive integer divisible
by `8` with `c ≥ N_j + binom(dim Sh + 1, 2) + 2` and `c ≥ 8f·r + 4` (`N_j = r` the rank of `W_j`, `dim Sh = f·p_j·q_j`); it
exceeds the threshold `N_j + binom(dim Sh + 1, 2) + 1` of 8.14 and satisfies `c_j ≤ 22·f²·r⁴`.
Put `u_{M,j} := λ^W_j − par(â_j) − c·w_q`.

*The canonical weight.* For a signature `(p, q)` of the setting, `N = p + q`, the canonical weight `κ_can` has, at every
`τ ∈ Φ` (entries indexed `0 ≤ i < N`), `κ_can(τ)_i = q − p + 1 + 2i` for `0 ≤ i < p` and `κ_can(τ)_i = 2(i − p) + 1 − N` for
`p ≤ i < N`: `κ_can = (q, …, q; −p, …, −p) − 2ρ_c`, where `(q, …, q; −p, …, −p) = N·w_q + par(q)` is the weight of the canonical
bundle of `Sh` (8.14) and `2ρ_c = (p − 1, p − 3, …, 1 − p; q − 1, q − 3, …, 1 − q)` is the sum of the positive roots of
`GL_p × GL_q`. Its consecutive gaps are `−2` inside the two blocks and `2N − 2` at the block boundary, its entries have
absolute value at most `N − 1`, and it is not dominant. Prove (κ): let `Z` be a component of `Sh` over `F′`, `X̄` a normal
scheme, proper over a normal projective model of `Sh` over `F′` carrying a semi-abelian extension of `A` that is abelian
exactly over `Sh` (the generic fibre of `Y`, for instance), whose part over `Sh` is `Fl`, and `π : R → X̄` a morphism from a
smooth projective `F′`-scheme `R` of dimension `D` to the part of `X̄` over the closure of `Z`, an isomorphism over the open
flag bundle `Fl_Z`, with `π^{−1}(Fl_Z)` dense in `R`. Then `K_R ⊗ π^*L(κ_can)^{−1}` has a nowhere vanishing section `ω_can` over
`π^{−1}(Fl_Z)`, normalised as follows. At a point with values in a field and a frame `P = (u_{σ,i})` of the Lie algebra adapted
to the flags, the tangent frame attached to `P` consists of the first-order deformations of the point whose
Kodaira–Spencer matrix in the frame `P` is an elementary matrix (one for each `τ ∈ Φ`, each frame vector of `Lie_{cτ}` and
each frame vector of `Lie_τ`) and of the first-order changes of frame `u_{σ,i} ↦ u_{σ,i} + ε·u_{σ,j}`, `i < j`; the value of
`ω_can` on it is the generator of `L(κ_can)` attached to `P`. In particular, over `π^{−1}(Fl_Z)` the forms of weight
`κ_can + μ` are the sections of `K_R ⊗ π^*L(μ)`.
*Route of (κ).* `K_{Fl} = K_{Sh}|_{Fl} ⊗ K_{Fl/Sh}`. By the Kodaira–Spencer isomorphism (PELModuli M2.10, in its Gauss–Manin
description) the tangent bundle of `Sh` is `⊕_{τ∈Φ} Lie_τ ⊗ Lie_{cτ}`, so `K_{Sh} = ⊗_τ (det Lie_τ)^{−q} ⊗ (det Lie_{cτ})^{−p}`, the
line of `(q, …, q; −p, …, −p)`. The relative tangent bundle of the bundle of full flags of a vector bundle of rank `n` has a
filtration with graded pieces `Hom(gr_i, gr_j)`, `i < j`, so its canonical bundle is `⊗_i gr_i^{n−1−2i}`: for `Lie_τ` the line
of `(2i + 1 − p)_{0≤i<p}`, and for `Lie_{cτ}`, whose `i′`-th graded piece is the dual of `x_{τ,N−1−i′}`, the line of
`(2(i − p) + 1 − q)_{p≤i<N}`. Under a triangular change of `P` with diagonal `t` the determinant of the tangent frame is
multiplied by `∏ t_{σ,i}^{e(σ,i)}`, `e(σ, i) = 2i + 1 − rk Lie_σ + rk Lie_{cσ}`, the character of `κ_can`.
*Checks.* `(p, q) = (1, 1)`: `κ_can = (1; −1)` and `L(κ_can) = ω_τ ⊗ ω_{cτ}`, the cotangent line of the Shimura curve. `(2, 0)`:
`κ_can = (−1, 1)` and `L(κ_can) = gr_0 ⊗ gr_1^{−1} = 𝒪(−2)` on the projective line of lines of `Lie_τ`. `(2, 1)`:
`κ_can = (0, 2; −2) = (1, 1; −2) + (−1, 1; 0)`.

*The weights.* Let `T ≥ T₀(D)` be an integer and `T₁ := T + D + 1`. For every `τ` and every pair
of consecutive indices write the gap of `u_{M,j} − κ_can` as `T₁·g + ϱ`, `0 ≤ ϱ < T₁`. The *divided weight* `u₁` has the gaps `g`
and the entry `0` at the anchor index; `rem` has the gaps `ϱ` and the entry `0` there; `u₂ := u₁ + rem`;
`wt(i) := κ_can + u₂ + (D + i)·u₁` (`0 ≤ i ≤ T`). Then `wt(T) = κ_can + rem + T₁·u₁` has the gaps of `u_{M,j}`, and `u_{M,j} = wt(T) + par(w)`
with `w_τ` the entry of `u_{M,j} − κ_can` at the anchor index (`|w_τ| ≤ 3r`, the entries of `κ_can` being at most `3r` in absolute
value); the flat twists (8.11–8.12) identify the forms of the weights `u_{M,j}` and `wt(T)`, preserve ranks, and move slopes by
the flat degree. Let `k_c := 8` and `e_c := 3N_j`, `u′ := u₁ − e_c·w_q`, `g > 0` a gap of `u′` in the sense of 8.17, and
`ρ := 1 − P(u′)/P(u₁)`, `P(λ) := ∏_τ∏_{a<b}(λ_{τ,a} − λ_{τ,b})` the Weyl polynomial; by Hirzebruch–Mumford proportionality
(DiscreteSeriesCoefficientsAndAutomorphicMetrics §10.2, for the flag bundle of the `Lie_τ`, `Lie_{cτ}`, representations trivial on the unipotent radical, as §10.2 requires) `(1 − ρ)·deg_Z(u₁) = deg_Z(u′)` on every component `Z` for the top self-intersections of the lines of
`u₁` and `u′` on the flag bundle. A weight is *good* on a cover if its lattice of integral cusp forms is finitely generated and
spans the cusp forms of that weight.

(o) *Deep covers.* Suppose `3` and `5` split in `K` and `gcd(15, g₀g₁) = 1`. For `e ≥ 0` there is a cover `Y_j → Sh(W_j)` of level `g₀g₁·15^e`, of the kind of the setting, defined over `𝕃_Y := 𝕂·K(g₀g₁·15^e)` (`K(n)` the ray class field of `K` of modulus `n`), with geometrically irreducible components over `𝕃_Y`, on which the level group acts through a finite group `G_{Y_j}` whose elements other than `1` are unipotent at a prime of the level and act freely on the complex points; and `log[𝕃_Y:ℚ] + log rd(𝕃_Y) ≤ log[𝕂:ℚ] + log rd(𝕂) + 20·(log(g₀g₁·15^e) + log d + 1)`. For `e := ⌊3x^ε/log 3⌋` and under the size conditions of ThetaChainsOnDefiniteUnitaryGroups §2.6, `log(g₀g₁·15^e) ≤ 27x^ε + 2` and `log[𝕃_Y:ℚ] + log rd(𝕃_Y) ≤ 391·(f·r·x^ε)²`, which is at most `b` when `(f·r·x^ε)^{12} ≤ b`. The field `𝕃_Y` is the same for every step.

*Images and heights.* For a component `Z` of `Y_j`, defined over a number field `𝕃_Z ⊃ 𝕃_Y`, the *coordinate bundle* `Ū_Z` is
the lattice, over the ring of integers of `𝕃_Z`, of the integral cusp forms of weight `u₁` on `Z`, with its Petersson metrics
at the embeddings of `𝕃_Z`; `N_Z` is its rank. Suppose that the forms of weight `u₁` define a birational map of the flag
bundle over `Z` onto its image (generic degree one). Let `X_Z ⊂ ℙ(U_Z^∨)` be the closure of the image, of dimension `D`;
`δ_Z := deg X_Z` is the degree of this image (not the top self-intersection of the line of `u₁` on the flag bundle, which
exceeds it when the forms have a base locus), and `f_Z` is the Chow form of `X_Z`, an irreducible multiform on `U_Z` of degree
`δ_Z` in each of its `D + 1` arguments. `h(u₁, Z)` is the height of `X_Z` for `𝒪(1)` on the model `ℙ(U_Z^∨) = Proj Sym` of the
lattice `Ū_Z`, with the Fubini–Study metrics of its Petersson forms (ChowFormsAndHeightsOfSubvarieties §6.2 (a)),
divided by `(D + 1)·δ_Z`. The *base-locus defect* is `ρ_Z := 1 − min(1, deg_Z(u′)/δ_Z)`. Prove, for such a component `Z`:

(a) *Positivity.* If `Ū_Z` is spanned over `𝕃_Z` by integral forms of norm at most `Λ ≥ 1`, then `h(u₁, Z) ≥ −log Λ`; write
`c_Λ := log Λ`.

(b) *Volume is bounded by height.* A *carrying section* on `Z` is a holomorphic form `θ` of weight `k_c(u₁ − u′)`, not
identically zero on `Z`, with `θ^k·`(cusp forms of weight `k_ck·u′`) `⊂` (cusp forms of weight `k_ck·u₁`) for all `k ≥ 1`, with reals
`t_σ = t_{σ̄}` and `e_𝔭 ≥ 0` (almost all `0`) such that `|θ(y)|² ≤ e^{2k_c·t_σ}·Berg_{u₁}(y)^{k_c}` at one embedding `σ` of each conjugate
pair (`Berg_{u₁}` the Bergman function of the weight `u₁`, the supremum of `|P(y)|²/‖P‖²` over its cusp forms), and
`k_c·dep_v ≤ v(θ) + k_c·e_𝔭` at every valuation `v` of an integral framed point above `𝔭` at which some integral form of weight `u₁`
does not vanish, `dep_v` the least valuation at `v` of an integral form of weight `u₁`; and such that at every valuation of an
integral framed point at which some cusp form of some weight does not vanish, some integral form of weight `u₁` does not
vanish. Its *cost* is `mean_σ t_σ + Σ_𝔭 ϱ(𝔭)·e_𝔭`. For a cut-off `B` let
`htc(B) := Σ_{ℓ ≤ B or ℓ | 2·d_E·level} (1/(ℓ − 1) + C_HT·v_ℓ(d_E)/[E:ℚ])·log ℓ`, `C_HT` an absolute constant. If `ρ < 1`, `δ_Z > 0`,
`ρ_Z ≤ ρ` (that is `(1 − ρ)·δ_Z ≤ deg_Z(u′)`; by proportionality this says `δ_Z ≤ deg_Z(u₁)`), and `Z` carries a carrying section
of cost at most `c_c`, `c_c ≥ 0`, then for every `s` at most the volume slope of `u′` on `Z` for the mixed integral structure
with cut-off `B` (8.17): `(1 − ρ)·max(0, s + c_Λ) ≤ h(u₁, Z) + c_Λ + c_c + htc(B)·|u′|₁`. The term
`htc(B)·|u′|₁` is the cost of passing from the Hodge–Tate to the Lie integral structure at the primes of `S(B)`. A *valuative
carrying section* is a form `θ` of weight `a·(u₁ − u′)` (`a ≥ 1`), not identically zero, with `θ^k·`(cusp forms of weight `ak·u′`) `⊂`
(cusp forms of weight `ak·u₁`) and, for every valuation `ν` of the function field trivial on the constants and every such
product `g`, a cusp form `v` of weight `u₁` with `ord_ν(g) ≥ ak·ord_ν(v)`.

(c) *Mean.* Suppose that the forms of weight `u₁` define a birational map on every component, that `ρ < 1` bounds every
defect `ρ_Z`, that `Λ` serves in (a) for every component and that every component carries a carrying section of cost at
most `c_c`, `c_c ≥ 0`. Suppose also that the mean of the volume slopes of 8.17 holds for `u′` on the cover (for the deep
covers of the steps: `m² ≤ k`, `1 ≤ j < m`, and at most `15` primes dividing the level of the cover). Then the mean over
the components of `h(u₁, Z)` is at least
`−C·err(u′, g) − ρ·c_Λ − c_c − htc(B(u′, g))·|u′|₁`, `err(u, g)` that of 8.17.

*Route.* (o) `K(n)` is Galois over `ℚ`, contains `ζ_n` and the Weber values of the `n`-torsion of `ℂ/𝒪_K`
(ComplexMultiplicationAndExplicitReciprocity §3.2 in its elliptic maximal-order case: the regular values at the CM point
of the functions of level `n` generate `K(n)`), which make the components geometrically irreducible;
`[K(n):K] ≤ h_K·n² ≤ d·n²` and `rd(K(n)) ≤ √d·n` (ClassFieldTheory §13.1: the Galois group of the ray class field is the
ray class group, and the conductor–discriminant formula, every character conductor dividing `n`), so `log[K(n):ℚ] + log rd(K(n)) ≤ 20·(log n + log d + 1)`; composita (ThetaChainsOnDefiniteUnitaryGroups §2.6 (b)); `log[𝕂:ℚ] + log rd(𝕂) ≤ 217·(f·r·x^ε)²` by ThetaChainsOnDefiniteUnitaryGroups §2.6. (a) The spanning forms give sections of
`𝒪(1)` on `X_Z` of norm at most `Λ` without common zero, so every point of `X_Z` has height `≥ −log Λ`, and Zhang's inequality
(HeightsRationalPointsAndObstructions §5.17f, after the twist by `log Λ`) bounds the
cycle height. (b) Definition of the volume slope; the comparison of the two integral structures at the primes of `S(B)`:
by the inclusions of 8.15 (a1) the Hodge–Tate valuation of a form of weight `u` exceeds its frame valuation by at most
`v(ℓ)·(1/(ℓ − 1) + C_HT·v_ℓ(d_E)/[E:ℚ])·|u|₁`; multiplication by `θ^k` carries small forms of weight `k_ck·u′` into small forms of
weight `k_ck·u₁`, with the shift `c_c + htc(B)·|u′|₁` (the Bergman clause at one embedding of each conjugate pair suffices
because the metrics are compatible with complex conjugation and `t_{σ̄} = t_σ`; the cost enters only through `max(0, cost)`,
which is why `c_c ≥ 0` is asked); the arithmetic Hilbert–Samuel formula for nef line bundles
(ArakelovGeometryAndAbelianHeightsPartII §0.3(1)) (applied on the normalisation of `X_Z`, counting the sections
of the pulled-back `𝒪(k)`: `𝒪(1)` with the Fubini–Study metric is semipositive and generated by sections of norm `≤ 1`, hence
nef on every curve, and its top self-intersection is unchanged by the finite birational pull-back; only the upper bound
for the count is used) and the identification of `𝒪(1)^{D+1}` on `X_Z` with `(D + 1)·δ_Z·h(u₁, Z)`
(ChowFormsAndHeightsOfSubvarieties §6.2 (a), with HeightsRationalPointsAndObstructions §5.9b and ChowFormsAndHeightsOfSubvarieties §6.1) bound the volume of small sections by `δ_Z·(h + t)`;
divide by `δ_Z` with `(1 − ρ)δ_Z ≤ deg_Z(u′)`. (c) From (b) on each component, `h ≥ (1 − ρ)·s − ρ·c_Λ − c_c − htc·|u′|₁`, with `s`
the volume slope of `u′`, whose mean 8.17 bounds below by `−C·err(u′, g)` (the degrees of the components being equal up to
`ρ`: Hirzebruch–Mumford, DiscreteSeriesCoefficientsAndAutomorphicMetrics §10.2, for the flag bundle of the `Lie_τ`, `Lie_{cτ}`, representations trivial on the unipotent radical, as §10.2 requires), and `err ≥ 0`. The mean of the volume
slopes of 8.17 applies on `Y_j` under the size conditions of ThetaChainsOnDefiniteUnitaryGroups §2.1: `|Φ| = f ≥ 4`,
`q_j = m − j ≥ 1`, `3q_j + 1 ≤ 3m − 2 ≤ r` by `SizeK`, and the primes dividing `2·disc(E)` and the level `g₀g₁·15^e` are among
`2`, `3`, `5`, `g₀`, `g₁` and the primes dividing `f_E`, at most `5 + log f_E/log 2 ≤ 4f·r²` of them by `SizeN`.

*Check.* `C_HT = 40` is the value of one construction; (b) is proved for `k_c = 8`, `e_c = 3N_j`. At `ℓ = 2` the inclusion
of 8.15 (a1) has the factor `4`, and the term of `htc(B)` at `2` is still `(1 + C_HT·v_2(d_E)/[E:ℚ])·log 2`: the bound for the
Hodge–Tate valuation holds there because `2` is ramified in `E` (`v_2(d_E) ≥ [E:ℚ]/2`), as it is for the fields of the chain.
Without birationality the degree of the
linear system and the degree of the image differ: `u², v²` on `ℙ¹` has degree `2` and image `ℙ¹` of degree `1`. The cost may be
negative (the `t_σ` have either sign); the inequality of (b) is asserted only for an upper bound `c_c ≥ 0` of it.

*Sources:* ingredients (Zhang; Bost–Gillet–Soulé; Gillet–Soulé). The preamble (`u′`, `ρ`,
proportionality): [FormalProof], `Development/AbelianVarietyTheory/Definitions/Divisors/IsHomogeneousCompIdeal.lean`
(`GlobalTheory.CompHt.uPrime`). (a): [FormalProof],
`Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/HodgeBundleWeights/HeightAddLogNonneg.lean`
(`GlobalTheory.CovHt.HtTopG.height_add_log_nonneg`). (b): [FormalProof],
`Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/HodgeBundleWeights/VolumeEstimateHypotheses.lean`
(`SelfIntersectionVolumeEstimates.SelfIntersectionBound`, `SelfIntersectionVolumeEstimates.SmallSectionsInject`).
(c) follows from [FormalProof],
`Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/HeightOfSteps.lean`
(`GlobalTheory.CovHt.HtTopG.height_of_meanAll_bound`),
`Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/LiftLambdaBound.lean`
(`GlobalTheory.CovTop.HeightCondition`),
`Development/AutomorphicSpectrum/Definitions/GlobalGeometry/ModelSmall.lean` (`GlobalTheory.CompanionTheory.Ar.Plug.DeepStR`).
The canonical weight: [FormalProof] states, from the de Rham cohomology of abelian schemes and with the Kodaira–Spencer
map an isomorphism at every point with values in a field, that on every smooth projective modification of a
compactification of the flag bundle of a component that is an isomorphism over the open flag bundle (with dense
preimage) the canonical bundle is, off the boundary, the line of `κ_can`, by a nowhere vanishing section normalised on
tangent frames; its weights are in the convention of the setting, and its hypothesis on the Kodaira–Spencer map is proved
there from the de Rham statements and the deformation theory of abelian schemes along nilpotent divided-power thickenings:
`Development/AbelianVarietyTheory/Proofs/DivisorProofs/NonemptyKodairaSpencerIdentificationOffBoundaryStatement.lean`
(`GlobalTheory.T.nonempty_kodairaSpencer_identification_offBoundary`),
`Development/AbelianVarietyTheory/Definitions/Divisors/ExistsUniqueIsTanFrameOfIsEmpty.lean` (`GlobalTheory.FlagTan.kap`,
`GlobalTheory.FlagTan.KSIso`), `Development/AbelianVarietyTheory/Definitions/Divisors/NonemptyCuspFrame.lean`
(`GlobalTheory.CompHS.CanId`).
*Needs:* 8.11, 8.12, 8.14, 8.15, 8.17;
HeightsRationalPointsAndObstructions §§5.9b, 5.17f and ChowFormsAndHeightsOfSubvarieties §§6.1, 6.2 (a); ArakelovGeometryAndAbelianHeightsPartII §0.3;
DiscreteSeriesCoefficientsAndAutomorphicMetrics §10.2; PELModuli M1.7, M2.8, M2.10; AbelianSchemesAndArithmeticModuli A4.3;
AutomorphicBundles §§0.5, 5.3; ThetaChainsOnDefiniteUnitaryGroups §§2.1, 2.3, 2.6; RowTowerAndRallisIdentities §5.7;
ComplexMultiplicationAndExplicitReciprocity §3.2; ClassFieldTheory §13.1.

### 8.18a From the big cell of the flag domain to the arithmetic quotient

*Origin:* adapted from Poincaré series on bounded symmetric domains and the `L²` methods of Hörmander (1965), Skoda (1972)
and Donnelly and Fefferman (1983): carried to the flag domain of a product of groups `U(p, q)` through its big cell, with
interpolation, division and peak sections descended to the arithmetic quotient with explicit constants.

*Method of the formal proof:* for (f), Hörmander's estimate on the big cell, with a cut-off at the frame and weights with
logarithmic poles at the frame and at the other points of its orbit, gives a holomorphic function equal to `1` at the
frame and vanishing at the other orbit points, whose Poincaré series is bounded, hence a cusp form by (f₀), with its `L²`
norm on a fundamental set controlled by unfolding. For (f₀), the constant Fourier–Jacobi coefficient of a bounded section
is invariant under the complex flow along the isotropic vector, while the invariant norm factor grows along it under the
hypothesis on the weight, so the coefficient vanishes.

Let `p + q = N`,
`0 < p < N`, `𝔇` the domain of frames `x = (x_τ)_{τ∈Φ}` of `ℂ^N` whose Gram matrices for the forms of signature `(p, q)` have
leading principal minors of the signs of that signature, `B_𝔇` the product of the Borel subgroups acting on the right (elements `𝔟`)
(`𝔇/B_𝔇` is the flag domain of `∏_τ U(p, q)`, fibred over the Hermitian symmetric domain with compact flag varieties as
fibres), `Γ` an arithmetic group acting properly discontinuously on the left, `n_𝔇 := |Φ|·N(N − 1)/2`. A *section of weight
`λ`* is a holomorphic `F` on `𝔇` with `F(x𝔟) = χ_λ(𝔟)F(x)` and `F(γx) = χ(γ)F(x)` (`χ` a character of finite order of `Γ`);
`φ_λ` is the potential of the invariant metric of the weight.
Here a weight on `𝔇` is a family of integers `λ = (λ_{τ,a})_{τ∈Φ, 0≤a<N}`, `χ_λ(𝔟) := ∏_τ∏_a 𝔟_{τ,aa}^{λ_{τ,a}}` (`𝔟_τ` upper
triangular: `x𝔟` multiplies the `a`-th vector of the frame by `𝔟_{τ,aa}` and adds a combination of the earlier ones), and
`|λ|₁ := Σ_{τ,a}|λ_{τ,a}|`. *Dictionary with the setting of 8.11–8.19.* For the Shimura variety of a signature `(p′, q′)` of
the setting, the frame domain is `𝔇` with `(p, q) = (q′, p′)`: the first `q′` vectors of a frame span the positive
`q′`-plane, which carries `Lie_{cτ}` through the Hermitian pairing, and the last `p′` coordinates in the frame are those
of `Lie_τ`. A form of weight `λ′` of the setting is a section on `𝔇` of the weight
`(λ′_{τ,p′}, …, λ′_{τ,N−1}; λ′_{τ,0}, …, λ′_{τ,p′−1})`: the two blocks are interchanged, each in its order; the canonical weight
`(2a + 1 − N)_a` of `𝔇/B_𝔇` corresponds to `κ_can` (8.18).
For an orthonormal frame `x₀` let `Ω_𝔇 := {z ∈ ℂ^{n_𝔇} : x₀·n(z) ∈ 𝔇}` (`n(z)` lower unipotent; the *big cell*), `dμ = dens·dλ` the invariant measure on it
(`dens = ∏_τ∏_{i<N}|Δ_{τ,i}|^{−2}`, `Δ_{τ,i}` the leading principal minors of the Gram matrix), `ρ_𝔇 := −Σ_τ log|Δ_{τ,p}|` the
Bergman potential of the symmetric domain pulled back to `Ω_𝔇`, and `Wt ≥ c·e^{−φ_λ}` an invariant weight for `λ` (measurable,
`Wt(x𝔟) = Wt(x)/|χ_λ(𝔟)|²`, `Wt(γx) = Wt(x)`). Put `e_𝔇 := 4|Φ|N²`. Prove:

(a) (*the chart*) `Ω_𝔇` is pseudoconvex, with the exhaustion `ρ_𝔇 + log(1 + |z|²)`; a holomorphic function on `Ω_𝔇` that is square
integrable on the saturation of every compact set extends to a `B_𝔇`-equivariant holomorphic function on `𝔇`;

(b) (*Poincaré series*) for `e_P > e_𝔇`: `x ↦ Σ_{γ∈Γ}e^{−e_Pρ_𝔇(γx)}` converges and is bounded on `𝔇`, and
`∫_{Ω_𝔇} e^{−e_Pρ_𝔇}φ dμ ≤ C·∫_{Γ∖𝔇/B_𝔇} φ dμ` for every invariant measurable `φ ≥ 0`; for every holomorphic `F` on `Ω_𝔇` of weight `λ` for `B_𝔇`
with `∫_{Ω_𝔇}|F|²e^{e_Pρ_𝔇}Wt dμ < ∞` the Poincaré series `P(F) := Σ_γ χ(γ)^{−1}F̃∘γ` (`F̃` the equivariant extension of (a)) converges
absolutely and locally uniformly to a bounded section of weight `λ`, square integrable for `Wt` on a fundamental set, with
`P(gF) = g·P(F)` for every section `g` of any weight and `⟨P(F), f₀⟩_{Wt} = ∫_{Ω_𝔇} F·conj(f₀)·Wt dμ` for every section `f₀` of weight `λ`
square integrable for `Wt` on a fundamental set;

(c) (*gradient bound*) `|∂ρ_𝔇|² ≤ |Φ|·min(p, q)·i∂∂̄ρ_𝔇` on `Ω_𝔇`;

(d) (*lifting*) let `e_P > e_𝔇` and `𝔪₂ > e_P²·|Φ|·min(p, q) + e_P`, `Wt = e^{−ψ}` with `ψ` plurisubharmonic and smooth off the zero
set `Z` of a holomorphic function on `Ω_𝔇` and locally bounded above near `Z`, and the margin (M2) `i∂∂̄(ψ − log dens) ≥ 𝔪₂·i∂∂̄ρ_𝔇` holds off `Z`; suppose that the bounded sections of weight `λ` are cusp forms and that the space of cusp
forms of weight `λ` square integrable for `Wt` is finite-dimensional. Then every such cusp form is `P(F)` for a holomorphic `F`
on `Ω_𝔇` with `∫_{Ω_𝔇}|F|²e^{e_Pρ_𝔇}Wt dμ < ∞`;

(e) (*interpolation and division on the quotient*) let `L`, `w_F` be weights with `i∂∂̄φ_L ≥ 0`, `w_1, …, w_K` cusp forms of
weight `L` without common zero in `𝔇`, and `s_0, s_1, …, s_{n_𝔇}` cusp forms of weight `L` such that the common zeros of
`s_1, …, s_{n_𝔇}` in `𝔇` are a finite union `Γ·{x_1, …, x_δ}·B_𝔇` of distinct orbits, `s_0(x_j) ≠ 0`, the Jacobian of
`(s_1/s_0, …, s_{n_𝔇}/s_0)` at each `x_j` is nonzero, and `Σ_k|w_k|² ≤ K·(|s_0|² + Σ_i|s_i|²)`, `|s_0|² + Σ_i|s_i|² ≤ K·Σ_k|w_k|²` in
the invariant norms (`n_𝔇 ≥ 2`). If for some `e_𝔇 < e_P < 𝔪₁` the margin (M1)
`𝔪₁·i∂∂̄ρ_𝔇 ≤ i∂∂̄φ_{w_F} − i∂∂̄log dens − n_𝔇·i∂∂̄φ_L` holds, the Levi form of `φ_{w_F} − log dens − n_𝔇·φ_L − e_Pρ_𝔇` is positive definite
near the points `x_j` (it holds when `w_F − w_can − n_𝔇·w_L` is strictly dominant in the compact directions, `w_can` the
weight of the canonical bundle), and bounded sections of weight `w_F` are cusp forms, then for all values at the `x_j` there
is a cusp form of weight `w_F` with these values. The form with positivity near the points only is this roadmap's own;
the formal proof states the interpolation for weights with `i∂∂̄φ_L` positive definite on `𝔇` and
`i∂∂̄(φ_{w_F} − log dens − n_𝔇·φ_L) ≥ 2η·i∂∂̄φ_L` for some `η > 0`; with (M1) these give the positivity near the points, the
Levi form above being at least `(1 − e_P/𝔪₁)·2η·i∂∂̄φ_L`.
If moreover the margin (M2) of (d) holds for `ψ = φ_{w_F}`, bounded sections of the weights `w_F`, `w_F + n_𝔇·L`,
`w_F + T·L` are cusp forms, the cusp forms of weight `w_F + T·L` form a finite-dimensional space, and the `s_i` have no common
zero at infinity (`Σ_k|w_k|² ≤ K·Σ_i|s_i|²` outside a `Γ`-invariant neighbourhood of the orbit points), then every cusp form `f`
of weight `w_F + T·L` with `∫_{Γ∖𝔇/B_𝔇}‖f‖²(Σ_k‖w_k‖²)^{−T}dμ < ∞` is
`Σ_{|α|<T−n_𝔇} Σ_{k≤δ} c(α, k)·s^α·s_0^{T−|α|}·t_k + Σ_{|α|=T−n_𝔇} s^α h_α`, where `t_1, …, t_δ` are cusp forms of weight `w_F` whose
values at the `x_j` form an invertible matrix (the first half supplies them), the constants `c(α, k)` are those for which
the first sum has the Taylor polynomial of `f/s_0^T` of degree `< T − n_𝔇` at every `x_j` in the variables `s_i/s_0`, and the
`h_α` are cusp forms of weight `w_F + n_𝔇·L` (`T ≥ 11·n_𝔇²`).

(f₀) (*bounded sections are cusp forms*) If at one place `τ` the weight `λ` satisfies `λ_{τ,a+1} ≤ λ_{τ,a}` for every
`a + 1 ≠ p` and `λ_{τ,0} < λ_{τ,N−1}` (in the dictionary: `λ′_τ` non-increasing inside the two blocks with `λ′_{τ,p′−1} > λ′_{τ,p′}`),
then every bounded section of weight `λ` is a cusp form: its constant Fourier–Jacobi coefficient along every nonzero
isotropic vector of the lattice vanishes. The route is not given here.

(f) (*peak sections at a frame with an injective chart*) There is an absolute constant `C ≥ 0` with the following
property, for every CM field with its CM type `Φ`, `f = |Φ|`, every `N` and `0 < p < N`, and every `Γ` of finite index in the
stabiliser of a Hermitian form of signature `(p, N − p)` at every place and of a lattice, acting freely on `𝔇/B_𝔇` and
containing the transvections along the isotropic lattice vectors with parameters `m₀·κ₀·s`, `s` an integer of the
totally real subfield, for an integer `m₀ ≥ 1` and a nonzero purely imaginary `κ₀`. Let `λ` be a weight on `𝔇` with
`λ_{τ,a} − λ_{τ,a+1} ≥ C·(f·N)⁸` for all `τ` and all `a` with `a + 1 ≠ p`, and `λ_{τ,N−1} − λ_{τ,0} ≥ C·(f·N)⁸` for all `τ` (in the
dictionary: every consecutive gap `λ′_{τ,i} − λ′_{τ,i+1}`, `0 ≤ i < N − 1`, of the weight of the setting, the gap at the block
boundary included, is at least `C·(f·N)⁸`). Let `x` be an orthonormal frame at which the chart `z ↦ x·n(z)` is injective
modulo `Γ` and `B_𝔇` on the ball `|z| ≤ 1/(100N²)` of `ℂ^{n_𝔇}`: if `γ·x·n(z) ∈ x·n(z′)·B_𝔇` with `γ ∈ Γ` and
`|z|, |z′| ≤ 1/(100N²)`, then `γ = 1`. Then there is a cusp form `P` of weight `λ` with `P(x) ≠ 0` and, for every orthonormal
frame `x₀` and every fundamental set `FF ⊂ Ω_𝔇` of `Γ` in the big cell of `x₀` (measurable, meeting every class modulo `Γ` and
`B_𝔇` at most once and almost every class once),
`∫_{FF}‖P‖² dμ ≤ exp(C·(|λ|₁ + (f·N)⁸))·‖P(x)‖²·μ(FF)`, `‖·‖` the invariant norm of the weight. Consequently the Bergman
function of the cusp forms of weight `λ`, for the invariant probability measure on `Γ∖𝔇/B_𝔇`, is at least
`exp(−C·(|λ|₁ + (f·N)⁸))` at `x`.

*Route.* (a) `ρ_𝔇` is plurisubharmonic and `log(1 + |z|²)` strictly so; the complement of the big cell in the fibres of
`𝔇 → 𝔇/B_𝔇` is a closed analytic subset, across which square-integrable holomorphic functions extend
(SingularHermitianMetricsAndL2Methods §3.4). (b) Convergence and boundedness of `Σ_γ e^{−e_Pρ_𝔇∘γ}` for `e_P` above the threshold
(Poincaré series on products of the domains of `U(p, q)`, DiscreteSeriesCoefficientsAndAutomorphicMetrics §6.8a with `f = |Φ|`, `n = N`, `s = e_P`; that statement needs only `e_P > 2|Φ|N²` and any properly discontinuous `Γ`), then unfolding over `Γ`. (c) For each base point `v₀` a supporting
function: `ρ_𝔇(v) − ρ_𝔇(v₀) ≥ −C·log(Σ_k Q_k(v)/C)`, `C = |Φ|·min(p, q)`, with equality at `v₀`, the positive pluriharmonic `Q_k`
coming from the arithmetic–geometric mean inequality for `det(1 − ZZ^*)^{1/min(p,q)}` and Jensen's inequality over `Φ`; for
`u = −C·log h`, `h > 0` pluriharmonic, `i∂u ∧ ∂̄u = C·i∂∂̄u`, and contact of order two at `v₀` gives the bound. (d) By (b) the
Poincaré map sends `{F : ∫|F|²e^{e_Pρ_𝔇}Wt dμ < ∞}` into the cusp forms; if `f₀` is orthogonal to its image, unfolding gives
`∫_{Ω_𝔇} F·conj(f₀)·Wt dμ = 0` for all such `F` (absolutely convergent: `∫_{Ω_𝔇}|f₀|²e^{−e_Pρ_𝔇}Wt dμ < ∞` by the boundedness in (b)). Write
`Wt dμ = e^{−Φ_{Wt}}dλ` and `Ψ_{Wt} := Φ_{Wt} − e_Pρ_𝔇`: `i∂∂̄Ψ_{Wt} ≥ (𝔪₂ − e_P)·i∂∂̄ρ_𝔇`, so by (c) `|∂̄ρ_𝔇|²_{i∂∂̄Ψ_{Wt}} ≤ κ := |Φ|·min(p, q)/(𝔪₂ − e_P)` and
`e_P²κ < 1`; the dual weighted estimate (SingularHermitianMetricsAndL2Methods §3.8a (b), in its form for weights of class `C²`
off a hypersurface and locally bounded above near it) applied to `f₀` gives `f₀ = 0`.
Equivalently: `G := e^{−e_Pρ_𝔇}f₀` has `∂̄G = −e_P·∂̄ρ_𝔇·G`, Hörmander's estimate with the datum measured by the Levi form (SingularHermitianMetricsAndL2Methods §3.8) on the
Stein open set off the zero set gives `u` with `∂̄u = ∂̄G`, `‖u‖² ≤ e_P²κ·‖G‖²`, `F := G − u` is holomorphic (it extends across the
zero set by SingularHermitianMetricsAndL2Methods §3.4), and `0 = ∫F·conj(f₀)·Wt dμ ≥ (1 − e_P√κ)·‖G‖²`.
(e) Interpolation, one orbit point `x_j` at a time: take the big cell `Ω_𝔇` at an orthonormal frame `x₀` of the orbit
`x_j·B_𝔇`. The quotients `s_i/s_0` are coordinates at `0` (the Jacobian), so `0` is the only common zero of the `s_i` in a
ball around it. SingularHermitianMetricsAndL2Methods §3.9 on `Ω_𝔇` with the weight `φ_{w_F} − log dens − n_𝔇·φ_L − e_Pρ_𝔇`,
whose Levi form is `≥ (𝔪₁ − e_P)·i∂∂̄ρ_𝔇 ≥ 0` by (M1) and positive definite on the ball by hypothesis, and with a cut-off
equal to `1` near `0` and supported in the ball, gives a holomorphic `F` on `Ω_𝔇` with
`∫_{Ω_𝔇}|cut − F|²·e^{e_Pρ_𝔇}·e^{−φ_{w_F}}·(Σ_i‖s_i‖²)^{−n_𝔇}dμ < ∞` ((M1) alone bounds the Levi form only by `(𝔪₁ − e_P)·i∂∂̄ρ_𝔇`,
which vanishes along the fibres of `𝔇/B_𝔇` over the symmetric domain when `max(p, q) ≥ 2`: hence the
hypothesis near the points). The factor `(Σ_i‖s_i‖²)^{−n_𝔇}` is not integrable at a common zero of the `s_i`, so `F = 1` at
`x₀`, and the equivariant extension of `F` (by (a)) vanishes at every other point of the orbits; and the `s_i`, being cusp
forms, are bounded in the invariant norm, so `(Σ_i‖s_i‖²)^{n_𝔇}` is bounded and `∫_{Ω_𝔇}|F|²e^{e_Pρ_𝔇}Wt dμ < ∞` for
`Wt = e^{−φ_{w_F}}`. Then (b): the Poincaré series `P(F)` is a bounded section of weight `w_F`, a cusp form by hypothesis,
nonzero at `x_j` and zero at the `x_{j′}`, `j′ ≠ j`. Division: with the constants `c(α, k)` of the statement let `g` be `f`
minus the first sum: a cusp form of weight `w_F + T·L` with the integrability of `f`, vanishing to order `T − n_𝔇` at the
orbit points. The weight `e^{−φ_{w_F}}(Σ|w_k|²)^{−1/2}(Σ|s_k|²)^{−(T−1/2)}` is comparable to `e^{−φ_{w_F}}(Σ|w_k|²)^{−T}` away from
the orbit points by the condition at infinity, is an invariant weight for `w_F + T·L` of the form that (d) admits, with the
margin (M2) off the zero set of a holomorphic function, and `g` is square integrable for it on a fundamental set (near the
orbit points by the order of vanishing). Lift `g` by (d) for this weight: `g = P(G)`. On `Ω_𝔇` apply
SingularHermitianMetricsAndL2Methods §3.10 (b)–(c) to `G` in `T − n_𝔇` single steps with exponents `a′ + n_𝔇 − ½`,
`a′ = T − n_𝔇 − 1, …, 0`: `G = Σ_{|α|=T−n_𝔇} s^α·H_α`, the `H_α` holomorphic and square integrable for
`e^{e_Pρ_𝔇−φ_{w_F+n_𝔇L}}`; their Poincaré series are the `h_α` by (a) and (b), and `P(s^α·H_α) = s^α·P(H_α)`.
(f) A peak function on the big cell of `x`: a holomorphic `F` on `Ω_𝔇` whose equivariant extension `F̃` ((a)) has
`F̃(x) = 1` and `F̃(γx) = 0` for `γ ≠ 1`, with `∫_{Ω_𝔇}|F|²e^{e_Pρ_𝔇}Wt dμ ≤ exp(C·(|λ|₁ + (f·N)⁸))·μ(ball)`, `e_P = e_𝔇 + 1`, `Wt` the
weight of the invariant metric: Hörmander's estimate on the pseudoconvex `Ω_𝔇` with the cut-off of radius `1/(100N²)` and
weights singular at the centre and at the other points of the orbit, as in the route of
SingularHermitianMetricsAndL2Methods §9.1; the gaps make the Levi form of the weight dominate. Then the Poincaré series
`P := P(F)` of (b): `P(x) = 1`, `∫_{FF}‖P‖² dμ ≤ exp(C·(f·N)⁸)·∫_{Ω_𝔇}|F|²e^{e_Pρ_𝔇}Wt dμ`, `P` is bounded, hence a cusp form by
(f₀), and `μ(ball) ≤ μ(FF)` by the injectivity of the chart. The two explicit constants are those of [FormalProof]; their
routes are not given here. (f) is not a case of SingularHermitianMetricsAndL2Methods §9.1, whose constants depend on the
dimension in a way that is not specified and whose sections are square integrable, not cuspidal.

*Check.* Unit disc (`|Φ| = 1`, `N = 2`, `p = q = 1`, the frame domain reduced to its base): `ρ_𝔇 = −log(1 − |z|²)`,
`|∂ρ_𝔇|² = |z|²/(1 − |z|²)² ≤ i∂∂̄ρ_𝔇 = 1/(1 − |z|²)²`, the constant `|Φ|·min(p, q) = 1` of (c). Without the margin `e_P²κ < 1` in (d)
the estimate of `u` does not beat `‖G‖`, and the pairing argument gives nothing. `e_𝔇` and the margin of (d) are the values of
one argument; the exponent of convergence and the sharp gradient constant are not needed.

*Sources:* (Poincaré series on bounded symmetric domains; the bounded gradient of the Bergman potential, as in
Donnelly–Fefferman). The weights on `𝔇` and the dictionary: [FormalProof],
`ReciprocityTheory/ReductiveGroups/ArithmeticGeometry/FundamentalDomains/Signature.lean`
(`ReciprocityTheory.ChartRestriction.G.FD.bchar`),
`Development/AbelianVarietyTheory/Definitions/Foundations/IsProbabilityMeasureMuPart.lean`
(`GlobalTheory.AllWt.modelWt_wtOf_big`, `GlobalTheory.AllWt.modelWt_wtOf_small`). (f₀): [FormalProof],
`ReciprocityTheory/ReductiveGroups/ArithmeticGeometry/ArakelovVolumes/UpperBounds/FundSetMeasStatement.lean`
(`ReciprocityTheory.ChartRestriction.G.AR.Up.CuspStatement`),
`ReciprocityTheory/ReductiveGroups/ArithmeticGeometry/ArakelovVolumes/UpperBounds/CuspStatementPf.lean`
(`ReciprocityTheory.ChartRestriction.G.AR.Up.cuspStatement_holds`). (f): [FormalProof],
`Development/AbelianVarietyTheory/Proofs/DivisorProofs/ExistsCuspFormPeakAtInjectiveChartFrameStatement.lean`
(`GlobalTheory.T.exists_cusp_form_peak_at_injective_chart_frame`),
`Development/AbelianVarietyTheory/Proofs/DivisorProofs/ExistsHormanderPeakOrthonormalFrameL2BoundStatement.lean`
(`GlobalTheory.T.exists_hormanderPeak_orthonormalFrame_l2Bound`),
`Development/AbelianVarietyTheory/Proofs/DivisorProofs/PoincareL2InequalityFundamentalSetStatement.lean`
(`GlobalTheory.T.poincare_l2_inequality_fundamental_set`).
*Needs:* SingularHermitianMetricsAndL2Methods §§3.1, 3.4, 3.8, 3.8a (b), 3.9,
3.10 (b)–(c), 9.1 (the construction); DiscreteSeriesCoefficientsAndAutomorphicMetrics §6.8a;
AdelicAlgebraicGroups §4.2 (finite covolume).

### 8.18b Averaging lattice indices over a Mackey pair

*Origin:* adapted from Mackey's irreducibility criterion for induced representations: for a subgroup and character
satisfying it, lattice indices in the isotypic part are bounded by the `[P : U]`-th part of the indices in the whole
space, up to terms in `v_𝔩(|U|)`.

*Method of the formal proof:* the uniform bound on subspaces is first shown equivalent to one inequality,
`idx_𝔩(M, M ∩ a⁻¹Th) ≤ r`; then, with `e_ψ = Σ_{u∈U} ψ(u⁻¹)ρ(u)` and representatives `h_i` of `P/U`, the maps
`s_i = ρ(h_i)` and `t_i = e_ψ∘ρ(h_i)⁻¹` satisfy `t_i s_j = |U|·δ_{ij}` on `Z′_ψ`, because the Mackey property makes `e_ψ`
vanish on `ρ(h)Z′_ψ` for `h ∉ U`, and a count of lengths on the images gives
`[P : U]·idx_𝔩(B ∩ Z′_ψ, B′ ∩ Z′_ψ) ≤ idx_𝔩(B, B′) + dim Z′·v_𝔩(|U|)`; monotonicity, scaling and transport of indices
finish. This is the proof of Mackey's criterion over a field, carried out with lattices and lengths at the cost of
`v_𝔩(|U|)`.

Let `𝕂′` be a number field, `𝔩` a finite
place, `Z′` a finite-dimensional `𝕂′`-space with a representation of a finite group `P`, and `(U, ψ)` a subgroup with a
character such that for every `h ∉ U` there is `u ∈ U ∩ hUh^{−1}` with `ψ(h^{−1}uh) ≠ ψ(u)` (a *Mackey pair*; the mirabolic pair
over the residue fields of the type primes is one). Let `Th ⊂ M` be `P`-stable lattices in `Z′`, `a ∈ 𝕂′^×` with
`v_𝔩(a) = E ≥ 0`, and suppose `idx_𝔩(M ∩ W, Th ∩ W) ≤ E·dim W + r` for every subspace `W`. Let `V₀` be the range of an idempotent,
`Z′_ψ` the `(U, ψ)`-isotypic part of `Z′`, `Z_g = Z′_ψ ∩ V₀`, and lattices with `Th ⊂ σ·Th_𝕂′` (`σ ∈ 𝕂′^×`) and
`|U|·(Th_𝕂′ ∩ Z′_ψ) ⊂ Th_0 ⊂ Z′_ψ`. Then

`idx_𝔩(M ∩ Z_g, Th_0 ∩ V₀) ≤ (E − v_𝔩(σ) + v_𝔩(|U|))·dim Z_g + (r + dim Z′·v_𝔩(|U|))/[P : U]`.

*Route.* The uniform bound is equivalent to `a·M ⊂ Th` up to a module of length `r`; `N := M ∩ a^{−1}Th` is `P`-stable; for
`P`-stable `B′ ⊂ B`, `[P : U]·idx_𝔩(B ∩ Z′_ψ, B′ ∩ Z′_ψ) ≤ idx_𝔩(B, B′) + dim Z′·v_𝔩(|U|)`: the Mackey property gives maps `s_i`, `t_i`
between `Z′_ψ` and the translates `ρ(h_i)Z′_ψ` with `t_i s_j = |U|·δ_{ij}`, and the lengths are counted on the resulting
decomposition; then monotonicity and transport of indices. The hypothesis "for every `W`" is used for one extremal
subspace, which can be taken global (HermitianFormsAndLattices §4.0b (a) over the localisation of the ring of integers).

*Sources:* [FormalProof], `Formalism/MirabolicMackeyTheory/StatementL.lean` (`Formalism.EigenvalueLevelCeiling.IdxPsiGood`,
the inequality stated here with integers `u, δ ≥ 1` in place of `|U|` and `[P : U]`, assuming the bound
`idx_𝔩(M, M ∩ a⁻¹Th) ≤ r` and the inequality of the route for `M ∩ a⁻¹Th ⊂ M`; `Formalism.EigenvalueLevelCeiling.LemmaGG`,
the inequality `[P : U]·idx_𝔩(B ∩ Z′_ψ, B′ ∩ Z′_ψ) ≤ idx_𝔩(B, B′) + dim Z′·v_𝔩(|U|)` of the route for `P`-stable lattices
`B′ ⊂ B` and a Mackey pair).
*Needs:* HermitianFormsAndLattices §4.0b (the index `idx` and its API, (a)); FiniteReductiveGroups §2.4
(the mirabolic subgroup).

### 8.18c Cusp forms on deep covers: goodness, birationality, short generators, multiplication, degrees

*Origin:* adapted from effective point separation (Angehrn and Siu (1995); Kollár (1997)), the basis problem and Bergman
kernel bounds: goodness, birationality, short generators, a multiplication bound and degree comparisons for cusp forms on
deep covers, explicit in the field, the level and the weight.

*Method of the formal proof:* for (b), non-vanishing on a component comes from a ball about an orthonormal frame that is
disjoint from its translates under the arithmetic group of a deep cover, on which a section of the weight is not zero;
birationality is by contradiction: two embeddings of the function field that agree on the field of ratios give two
complex points over the generic point, and two-point separation for the nef and big twist `K ⊗ L(u − κ_can)` on a
toroidal compactification of the flag space, with the number `binom(D + 2, 2)`, gives a cusp form whose values at the
two points contradict the equality of the ratios.

Let `Y` be a deep cover (8.18 (o)) of the Shimura variety of a unitary group of signature `(p, q)`, `p, q ≥ 1`, in the
setting of 8.11–8.19 with `[F:ℚ] ≥ 2`, `D` the dimension of its flag bundle, `N = p + q`, `κ_can` the canonical weight (8.18).

(a) *Goodness.* Every weight with weakly decreasing entries and gap `≥ 1` at the block boundary is good on `Y` and on every
component.

(b) *Birationality.* For every weight `u` all of whose consecutive gaps of `u − κ_can` are at least `binom(D + 2, 2)` (in particular if
all gaps of `u` are `≥ (D + 3)² + 2N`) and every component `Z`: some cusp form of weight `u` is not identically zero on `Z`, and
the ratios of cusp forms of weight `u` generate the function field of the flag bundle of `Z`; equivalently these forms
define a rational map of generic degree one onto its image.

(c) *Short generators.* There is an absolute constant `C` with the following property. Let `Y` belong to a step of the chain
(`W = W_j`, `1 ≤ j < m`), `ℒ ≥ 1` with `log(level) ≤ 30ℒ`, `log[E:ℚ] + log rd_E ≤ 3ℒ`, `log(f·r) ≤ ℒ`, the field of definition
`𝕃_Y` with `log[𝕃_Y:ℚ] + log rd(𝕃_Y) ≤ 391(f·r·ℒ)²`, and the flat degree of 8.11 of absolute value `≤ 9r·ℒ`; let `λ` be a weight
with weakly decreasing entries, gap `≥ 8f·r + 10` at the block boundary and `log|λ|₁ ≤ 10ℒ`. Then on every component `Z` the
lattice of integral cusp forms of weight `λ` is generated over `ℤ` by `n` forms of Petersson norm `≤ Λ` at every embedding,
with `log Λ ≤ C·((f·r·ℒ)³·|λ|₁ + (f·r·ℒ)⁵)` and `log n ≤ C·(f·r·ℒ)³`.

(d) *Multiplication.* With `Y`, `ℒ` as in (c) and `λ` weakly decreasing with `log|λ|₁ ≤ 20ℒ`: on every component, at every
embedding, the Bergman function of the cusp forms of weight `λ` is at most `β := exp(4000·(f·r·ℒ)³)`; consequently
`‖u·v‖_σ ≤ √β·‖u‖_σ·‖v‖_σ` at every embedding `σ` for all complex combinations `u` of forms of weight `λ` and `v` of forms of any weight
(the field of definition of a component is totally complex), and the rank of the cusp forms of weight `λ` on the component
is at most `β`.

(e) *Degrees.* In the notation of 8.18, suppose that `u₁` and `u′` are strictly decreasing, that the forms of weight `u₁`
define a birational map on every component and that every component carries a valuative carrying section (8.18 (b)).
Then: (i) `deg_Z(u′) ≤ δ_Z ≤ deg_Z(u₁) = deg_Z(u′)/(1 − ρ)` for every component `Z`, the outer terms being independent of `Z`; in
particular `ρ_Z ≤ ρ`; (ii) if `ρ ≤ ½` and `λ` is weakly decreasing with `(T + D + 3)·u₁ − λ` weakly decreasing, then
`(1 − q_z)·rk(λ, Z) ≤ binom(T − 1, D)·δ_Z`, `q_z := 7·(D²/T + D·ρ)`, `rk(λ, Z)` the rank of the cusp forms of weight `λ` on `Z` (the
inequality is not divided by `1 − q_z`, which may be negative).

(f) *The deep covers of the steps* (the witnesses, the carrying sections, the sizes, the sup norms). For every step `1 ≤ j < m` let `Y_j` be the cover of 8.18 (o) for `e = ⌊3x^ε/log 3⌋`, and take `T := ⌈P²·D²·k/m⌉` (`P` a fixed polynomial in `f·r·x^ε`), `u₁` the divided weight of 8.18 for this `T`, `e_c := 3N` and `u′ := u₁ − e_c·w_q`. Suppose that there are an integer `h₀` and reals `S_u, η_u ≥ 0` with
`P·(S_u + η_u) ≤ 100·w″` (`w″` of ThetaChainsOnDefiniteUnitaryGroups §2.1), `4T² ≤ h₀` and `P·T·r·f²·m²·k·D ≤ h₀` for which
`u_{M,j}` satisfies the *gap conditions*: `4D + 4 ≤ T`; `4(c + 2N + T + D + 1) ≤ h₀` and `24N·T ≤ h₀` (`c = c_j` the integer
of 8.18); the entry of `u_{M,j}` at the anchor index is `0` and the entries before the anchor lie in `[0, S_u]`; the entries
after the anchor differ from `−â_j(τ)` by at most `η_u + S_u + N` (`â_j(τ)` the anchor at `τ`, 8.18), and
`4(η_u + 2S_u + c + 3N) + 20N·T ≤ â_j(τ)`; the gaps of `u_{M,j}` after the anchor are at least `h₀ − 1`, at the block boundary
at least `h₀`, the others at least `(T + D + 2)(T + D + 2 + 2N) − 2`; and every entry has absolute value at most `8b − c − 4N`.
Then, with `g := h₀/(4T)` for this `h₀`: `g` is a gap of `u′`, `log B(u′, g) ≤ x^ε + 22`, `q·spread(u′) ≤ 6|u′|₁`, `T·|u′|₁ ≤ C·f·m·b`, and `T·err(u′, g) + T·htc(B(u′, g))·|u′|₁ ≤ C·B₀·log log x` with an absolute `C` (`B₀·log log x = f·m·b·x^ε·log log x`). Moreover there is a real `c_c ≥ 0` such that on every component `Z` of `Y_j`, with
`n`, `Λ` the numbers of (c) and `β` that of (d) for the weights `u₁`, `wt(0)`, `wt(D)`, `wt(T)` and `ℒ := x^ε`, `ρ` of 8.18 and `q_z` of (e):
(i) *the carrying sections*: `Z` carries a carrying section (8.18 (b)) of cost at most `c_c` and a valuative carrying
section (8.18 (b));
(ii) *sizes* (the unit of these bounds is `B₀·log log x`): `q_z ≤ ½`; `q_z·P_S·|λ^W_j|₁ ≤ b`, `T·P_S ≤ √b` and `log n ≤ P_S` for a fixed
polynomial `P_S` in `f·r·x^ε`; `log Λ ≤ P_S·(|λ^W_j|₁/T + 1)` at the weight `u₁`, `log Λ ≤ D·P_S·(|λ^W_j|₁/T + 1)` at `wt(0)` and
`log Λ ≤ P_S·|λ^W_j|₁` at `wt(D)`, `wt(T)` and `λ^W_j`; `T·(log β + c_c) + log Λ·(1 + T·(q_z + ρ)) + q_z·T·(log n + 1) ≤ C·B₀·log log x`; and
`|G_{Y_j}|³·(n·|G_{Y_j}|²·β·Λ)² ≤ e^{2b}`; and the size conditions `SizeSG`: `T·err(u′, g) + T·htc(B(u′, g))·|u′|₁ + T·H_{N−1} ≤ C·B₀·log log x`
for the rank `N` of the forms of weight `u₁` on every component (`err` of 8.17, `htc` of 8.18 (b)); `u₁` and `u′` strictly
decreasing; every gap of `u₁ − κ_can` and of `u₂ − κ_can` at least `binom(D + 2, 2)`; `(T + D + 3)·u₁ − wt(T) − s′·c·w_q` weakly decreasing for
`s′ = 0, 2, 3`; and the hypotheses of (a), (c), (d) at the weights `u₁`, `u₂`, `u′`, `wt(i)` (`0 ≤ i ≤ T`), `λ^W_j`, `λ^W_j ± c·w_q`
and `c·w_q`, with `ℒ := x^ε`;
(iii) *sup norms at the base level*: on the Shimura variety of `U(W_j)` at the level of ThetaChainsOnDefiniteUnitaryGroups §2.9, ThetaChainsOnDefiniteUnitaryGroups §2.9a, every nonzero integral cusp
form of weight `λ^W_j` (`1 ≤ j ≤ m`) has mean over the embeddings of the logarithm of its sup norm at least `−x^C·b`, `C` depending
only on the constants fixed before `ε`.

(g) *The level and the field of the deep covers.* For every step `1 ≤ j ≤ m` the level `g₀g₁` of the setting on `U(W_j)` is good, and, under the size conditions of ThetaChainsOnDefiniteUnitaryGroups §2.6 and `(f·r·x^ε)^{12} ≤ b`, the field `𝕃_Y` of 8.18 (o) has `log[𝕃_Y:ℚ] + log rd(𝕃_Y) ≤ b`; no bound on the field `𝕃` of ThetaChainsOnDefiniteUnitaryGroups §2.6 is used.

*On (f) and (g).* The gap parameter `h₀` of the weights (ThetaChainsOnDefiniteUnitaryGroups §2.3) serves as the integer `h₀` of (f)
when it satisfies these inequalities. The witnesses of (f) and their two inequalities in `err` and `htc` come from division with remainder: only the `≈ m` entries of `u_{M,j}` after the anchor are of size `b`, and the level `g₀g₁·15^e` has four prime factors. The routes of the other clauses of (f), namely (i), the clauses of (ii) other than these two inequalities (the third clause of `SizeSG` among them) and (iii), are not given here. (g) is the goodness of the level in the setting together with 8.18 (o). On (f) (i): on the thick part of `Z(ℂ)`, the frames `y` with `b ≤ M·λ₁(y)²`
(`M` the level of the cover, `λ₁(y)` the first minimum of the lattice for the majorant form of the frame), the peak sections
of 8.18a (f) give a real `B ≥ 0` with `T·B` within the budget and `Berg_{u₁} ≥ e^{−B}` at every frame of the thick part
([FormalProof],
`Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/BergmanKernelThickPartEstimate.lean`
(`GlobalTheory.ThickBerg.exp_neg_B_le_bergOn_of_mem_framesOn`)); 8.18a (f) asks that every consecutive gap of `u₁` be at
least `C·(f·N)⁸` and that the chart of radius `1/(100N²)` be injective, and the passage from the first minimum to that
injectivity is not given here; near the boundary the injectivity radius of the period lattice and a Poincaré series
bound it from below, and a theta constant with an explicit sup norm (SpecialFunctionsTheta Layer 7) is compared with these
bounds. At the finite places the clause is to come from `v(θ(y)) ≥ (k_c/2500)·φ(y) − k_c·e_𝔭` and `dep(y) ≤ φ(y)/2500 + e(ℓ)` with
`T·Σ_ℓ e(ℓ)·log ℓ` within the budget, `φ = φ′_C` of 8.19a′ (b): this is 8.19a′ (b′) with `c_* = 1/2500` for the theta weight of
the divided weight, with the exponents of 8.19a′ (b″) at the primes other than the type primes and the bound `1` at the
type primes (which adds `T·(log g₀ + log g₁)` to the sum); the passage to the depth with the
polarisation factor is the statement on powers of leading minors of TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.19f (o),
stated for a unitary moduli problem whose polarisation is principal, as that of the setting is (8.11–8.19); it holds at
every place and for every multiplier, and the level `M` enters only through the theta rules (8.19a′ (b)).
The valuative carrying section rests on three statements about the boundary.

*Route.* (a) Finite generation: every nonzero form has a nonzero value, with bounded denominator on the lattice, at a CM
point; spanning: a power of every form times a fixed form is integral up to a scalar, and the lattice is defined by
valuations. (b) If the ratios generated a proper subfield, two distinct complex points `z₁`, `z₂` over the generic point of the flag bundle, lying over the same embedding of the field of definition, would have equal ratios (two embeddings of a countable
field of characteristic zero agreeing on a proper subfield). Sections of `K ⊗ L(u − κ_can)` on a toroidal compactification of the
flag bundle are cusp forms of weight `u` (the logarithmic Kodaira–Spencer isomorphism, ShimuraCompactifications §7.12;
Koecher's principle, ShimuraCompactifications §7.22, `[F:ℚ] ≥ 2`). The line of a weight with non-negative gaps is nef (on every complete curve, curves in a
boundary stratum included, by the seminegativity of ProjectiveModelsAndPeriodBoundsOnShimuraVarieties §6.2a (b), which asks
no abelian fibre), the line of the standard weight `(N − 1, …, 0)` is ample at
the points of the open part, and `u − κ_can − binom(D + 2, 2)·std` has non-negative gaps; Kollár's effective two-point separation for klt pairs, the form of the Angehrn–Siu theorem for a nef and big twist (MultiplierIdealsOfPairsAndPointSeparation §9.12a, applied over `ℂ` at two complex points over one embedding of the field of definition, on the smooth compactified flag space with `Δ = 0`), with `c(e) := binom(D + 2, 2) − ½` (the twist has self-intersection `≥ binom(D + 2, 2)^e > c(e)^e` on every `e`-dimensional subvariety
through one of the two points, and `Σ_{e≤D} 2^{1/e}·e/c(e) ≤ Σ_{e≤D}(e + 1)/c(e) = (binom(D + 2, 2) − 1)/c(e) < 1`), gives a section of `K ⊗ L(u − κ_can)` vanishing at exactly one of the two points, hence, for any nonzero `a₁`, `a₂`, a section `g` with `a₁g(z₁) + a₂g(z₂) ≠ 0`, against the equality of ratios. (c) (1) For the weight
`(a, n)` of a classical lift from a definite group of even rank `n ≥ 8f·r + 4` in which the last entry of `a⁺_τ` is positive for
every `τ`, the theta series of self-dual Hermitian lattices of rank `n` with pluriharmonic coefficients span the cusp forms
(8.17a, at the level of the cover), harmonic polynomials have a spanning family of bounded coefficients, raw theta series
have bounded sup norms, and a bounded integer multiple of each is integral. (2)
Write `λ` as such a weight with `n = 8(f·r + 1)`, plus a scalar weight, plus a parallel weight chosen at every `τ` so that the
last entry of `a⁺_τ` is `1` (the gap `≥ 8f·r + 10 = n + 2` at the block boundary is what makes `a` a dominant weight with
entries `≥ 0`), and multiply by a unit section of scalar weight and by
the short integral flat section (8.11–8.12). (3) A lattice with a spanning family of vectors of norm `≤ B` is generated over `ℤ`
by at most `2[𝕃_Y:ℚ]·rk` vectors of norm `≤ max(1, [𝕃_Y:ℚ]⁴·rk·rd(𝕃_Y)·B)` (HermitianFormsAndLattices §4.13 for the field `𝕃_Y` over which the components are defined (8.18 (o)) and the lattice of forms on a component is a module, with the norms at its embeddings, which are seminorms for `|σ(·)|`); the rank is bounded by
(d). (d) A sup-against-`L²` inequality for holomorphic sections on the uniformised component, with an explicit constant
(SingularHermitianMetricsAndL2Methods §3.7); then `|u(y)|² ≤ β·‖u‖²` pointwise gives the product bound for the Petersson norms
(probability measures), and the rank is the integral of the Bergman function for the probability measure. (e) (i)
Hirzebruch–Mumford proportionality (DiscreteSeriesCoefficientsAndAutomorphicMetrics §10.2, for the flag bundle of the `Lie_τ`, `Lie_{cτ}`, representations trivial on the unipotent radical, as §10.2 requires) and the equality of the volumes of the components (8.16 (e))
make `deg_Z(u₁)`, `deg_Z(u′)` independent of `Z`; the image of a birational linear subsystem has degree at most the top
self-intersection of the line, and the valuative carrying section bounds `deg_Z(u′)` by the degree of the image; then
`deg_Z(u′)/δ_Z ≥ 1 − ρ`. (ii) With `n₁ := T + D + 3` and `a := ⌊n₁/(1 − ρ)⌋`: `n₁·deg_Z(u₁) < (a + 1)·δ_Z`, so MultiplierIdealsOfPairsAndPointSeparation §9.13b (b) applies on a modification on which the base ideal of the forms of weight `u₁` is invertible, with `L′` the line of `u₁` (nef), `L` its moving part (`(L^D) = δ_Z` by birationality), `Λ` the line of `λ` and `n = n₁`: the lines of `u₁`, `λ` and `n₁u₁ − λ` are nef because these weights have non-negative gaps (`u₁` is strictly decreasing, `λ` and `n₁u₁ − λ` weakly decreasing), `(L′^D) ≤ deg_Z(u₁)`, and the cusp forms of weight `λ` inject into the sections of the line of `λ`.

*Check.* The hypothesis on `𝕃_Y` in (c) is 8.18 (o) for the chain. The constants `30`, `3`, `391`, `9`, `10`, `20`, `8f·r + 10`, `4000` and `7` are those of one construction. The sharp
input of (b) is `binom(D + 2, 2) = ½(D² + 3D + 2)`, the Angehrn–Siu number for two points in dimension `D`; `(D + 3)² + 2N`
suffices because the gaps of `κ_can` are at most `2N − 2`.

*Sources:* ingredients (Kollár's two-point separation; Hirzebruch–Mumford proportionality; the basis
problem). (b), its first clause when all gaps of `u` are `≥ (D + 3)² + 2N`: [FormalProof],
`Development/AbelianVarietyTheory/Proofs/DivisorProofs/WeightPositivityPrincipalisation.lean`
(`GlobalTheory.CentreCusp.exists_cusp_genVal_ne_zero'`). *Needs:* 8.11, 8.12, 8.16, 8.17a, 8.18, 8.18a; ProjectiveModelsAndPeriodBoundsOnShimuraVarieties §6.2a (b) and ShimuraCompactifications §§7.12, 7.22; AlgebraicModuliForArithmeticGeometry §§1.6, 9.10, AlgebraicModuliForArithmeticGeometryPartII §§1.5, 1.6, 1.7 (ii) and
MultiplierIdealsOfPairsAndPointSeparation §§9.12a, 9.13b; DiscreteSeriesCoefficientsAndAutomorphicMetrics §10.2; HermitianFormsAndLattices §4.13; SingularHermitianMetricsAndL2Methods §3.7;
ThetaChainsOnDefiniteUnitaryGroups §§2.1, 2.3, 2.6, 2.9, 2.9a.

### 8.18e A uniform lower bound for slopes on deep covers

*Origin:* adapted from the arithmetic Hilbert–Samuel theorem and the heights of Chow forms of Bost, Gillet and Soulé
(1994): an explicit inequality at one finite degree between the slope of a lattice of cusp forms
and the height of the projective image, on varieties where the forms have a fixed divisor at the boundary.

*Method of the formal proof:* on a component the abstract Hilbert–Samuel inequality over the coordinate bundle is applied
to the graded system of forms of the weights `wt(i)`, after the degree and the height of the birational image are
identified with those of the tuple of sections; the components are then combined by a numerical lemma that turns the
unweighted mean of the volume slopes into the rank-weighted mean of the degrees, the degrees and the ranks of the
components agreeing up to the factors `1 − ρ` and `1 − z`.

In the setting of 8.18, for a
component `Z` of `Y_j` on which the forms of the weights `u₁` and `u₂` define birational maps, let `V_i` (`0 ≤ i ≤ T`) be the cusp
forms on `Z` of the weights `wt(i)`, with their lattices `M_i(Z)` of integral cusp forms and Petersson norms, and the
multiplications by the forms of weight `u₁`. The product of an integral form of weight `u₁` and an integral form of weight
`wt(i)` is an integral form of weight `wt(i + 1)` (integrality is tested by the values at the integral frames of the setting,
and values multiply), so multiplication by every integral form of weight `u₁` maps `M_i(Z)` into `M_{i+1}(Z)`, as
SlopesOfHermitianVectorBundles §§6.7a (iv) and 6.7b ask of a family generating the lattice of weight `u₁`; `M_T(Z)` is the lattice
of weight `wt(T)`. `Ū_Z` is the coordinate bundle of 8.18 and `f_Z` its Chow form, a multiform on `U_Z`
(SlopesOfHermitianVectorBundles §6.7a, where the coordinate bundle is written `J̄`; the letter `J` has other meanings here). Put
`h_Ū(Z) := ht_{Ū_Z}(f_Z)/((D + 1)δ_Z)`, the normalised spherical height relative to `Ū_Z` (SlopesOfHermitianVectorBundles §6.7a (i)). The Chow height and the
relative spherical height satisfy `h(u₁, Z) = h_Ū(Z) + ½·H_{N_Z−1}`: this is ChowFormsAndHeightsOfSubvarieties §6.2 (b) for
the coordinate bundle `Ū_Z` and the cycle `X_Z ⊂ ℙ(U_Z^∨)` (dimension `D`, degree `δ_Z`), divided by `(D + 1)·δ_Z`, since
`c(D, N_Z − 1)/(D + 1) = ½·H_{N_Z−1}` (one lattice, with the model `Proj Sym` at the finite places, and one set of Petersson metrics
serve both heights; the identity is exact). Prove:

(e1) (*Flatness along simple rational sections, on a subspace.*) Let `X̄` be a smooth projective toroidal compactification of
the flag bundle of `Z` and `π : R → X̄` a modification, an isomorphism over the open part, with `R` smooth, on which the base
ideals of the cusp forms of the weights `u₁`, `u₂` are invertible: `π^*L(u₁) = L ⊗ 𝒪(Δ₁)`, `π^*L(u₂) = L₂ ⊗ 𝒪(Δ₂)`, `Δ₁, Δ₂` effective
and supported over the boundary, `L` and `L₂` generated by the divided cusp forms. Put `L_A := π^*L(u₂ + D·u₁)`, and suppose that `u₁` has non-negative gaps; then so has `u₂ = u₁ + rem`, the lines of `u₁` and `u₂` are nef on `X̄` (the line of a weight with non-negative gaps is nef, route of 8.18c (b)), and `π^*L(u₁)` and `L_A` are nef and big (big because `L` and `L₂` are). Then
`V_i = H⁰(R, K_R ⊗ L_A ⊗ π^*L(u₁)^i)` (`0 ≤ i ≤ T`); let `G_i ⊂ V_i` be the forms divisible by `i·Δ₁`, that is `H⁰(R, K_R ⊗ L_A ⊗ L^i)`;
`G_0 = V_0`, and forms of weight `u₁` map `G_i` into `G_{i+1}`. There is a nonzero polynomial `Q` on `U_Z^D` such that for every
`s = (s_0, …, s_{D−1}) ∈ U_Z^D` with `Q(s) ≠ 0`:
(i) the divided sections `s_i/1_{Δ₁}` of `L` have exactly `δ_Z` common zeros on `R`, all simple and in the open part, with
pairwise distinct images `y_1, …, y_{δ_Z}` in `X_Z`, and `f_Z(s, ·) = c·∏_p y_p` with `c ≠ 0`;
(ii) evaluation at these points maps `V_0` onto the `δ_Z`-dimensional space of values;
(iii) with `W(s) := G_T + Σ_{|α|=T−D} s^α·V_D ⊂ V_T` and `U(a) ⊂ W(s)` the forms vanishing to order `≥ a` at each of the `δ_Z` points
(`0 ≤ a ≤ T − D`): the symbol of order `a` on `U(a)` has kernel `U(a + 1)`; for `m ∈ V_0`, `|α| = a < T − D` and forms
`l_1, …, l_{T−a}` of weight `u₁`, the form `s^α·l_1⋯l_{T−a}·m` lies in `U(a)` with symbol `[α′ = α]·∏_q l_q(y_p)·m(y_p)`; and
`U(T − D) = Σ_{|α|=T−D} s^α·V_D`.

(e2) (*Hilbert–Samuel inequality over the coordinate bundle.*) Let the lattice of integral forms of weight `u₁` on `Z` be
generated by `n` forms of Petersson norm `≤ Λ`, `Λ ≥ 1`; let `β ≥ 1` with `‖u·v‖_σ ≤ √β·‖u‖_σ·‖v‖_σ` at every embedding for all complex
combinations `u` of forms of weight `u₁` and `v` of forms of the weights `wt(i)` (Petersson norms); let `V_0`, `V_D`, `V_T` be spanned
by integral forms of norms `≤ Λ₀, Λ_D, Λ_T`, with `Λ₀, Λ_D, Λ_T ≥ 1`. Then, with `z := 1 − binom(T − 1, D)·δ_Z/rk M_T(Z)`,
`cst := log(nΛ) + (log n + 1)/2` and `h_Ū(Z) = h(u₁, Z) − ½·H_{N_Z−1}`: `0 ≤ z < 1` and
`μ̂(M_T(Z)) ≥ (1 − z)·(T·h_Ū(Z) − D(D + 1)·cst − log Λ₀ − (T/2)·log β) − z·(T·cst + (T/2)·log β + log Λ_D + log Λ_T)`.
If moreover `(1 − q)·rk M_T(Z) ≤ binom(T − 1, D)·δ_Z` for a real `q`, then `z ≤ q`.

(e3) For the cover `Y_j` and the choices of 8.18c (f) (whose clause (ii) contains the size conditions `SizeSG`): the lattice of integral cusp forms of weight `u_{M,j}` on `Y_j` satisfies `μ ≥ −C·B₀·log log x`; hence so does the
lattice of weight `wt(T)` (the flat twist 8.12 (b) identifies the two lattices up to a change of slope of at most `C·B₀`).

*Route.* (e1) The identification of `V_i`: a form of weight `κ_can + μ` on the open part extends with zero on the boundary if and only
if it is a section of `K ⊗ L(μ)` on a modification (the logarithmic Kodaira–Spencer isomorphism, ShimuraCompactifications §7.12).
(i) MultiplierIdealsOfPairsAndPointSeparation §9.13 for the system of the divided forms on `R` (zeros finite étale of degree `δ_Z`, in the open part, with pairwise distinct images, and the factorisation of `f_Z`). (ii) MultiplierIdealsOfPairsAndPointSeparation §9.13a (ii) (the Koszul complex of `s` and Kawamata–Viehweg vanishing for `K_R ⊗ L₂ ⊗ L^i`; `L₂` nef and big by the birationality of `u₂`, the zeros simple by (i)): `H⁰(R, K_R ⊗ L₂ ⊗ L^D)` maps onto the
values, and multiplication by the section of `Δ₂ + D·Δ₁` carries it into `V_0`. (iii) Orders of vanishing have formal symbols; a
form of `G_T` vanishing to order `T − D` at the points is `Σ s^α·g_α` with `g_α ∈ G_D` (induction on the order from the first-order division, MultiplierIdealsOfPairsAndPointSeparation §9.13a (i) with `j = D` and `a = T − D`; it needs `L` generated, `L_A` nef and big, which is the hypothesis on `u₁`, and the zeros simple; Kawamata–Viehweg for `K_R ⊗ L_A ⊗ L^i`, `i ≥ 0`). (e2)
SlopesOfHermitianVectorBundles §6.7b, (f′), for the graded system `(V_i)` over the coordinate bundle `Ū_Z`, whose hypotheses are:
the integrality of the multiplications for a family generating the lattice of weight `u₁` (the preamble), `β ≥ 1` for complex
combinations, the spanning bounds `Λ₀`, `Λ_D`, `Λ_T` with `Λ₀, Λ_D, Λ_T ≥ 1`, the irreducible multiform `f_Z` (the Chow form of an
irreducible variety), and the flatness on a subspace (c′) along the rational sections of (e1) (with `res` the evaluation of (ii), onto the values, the factorisation of (i), and `U(a)`, the symbols, the symbol rule and the deepest step of (iii)); the floor is `cst` (SlopesOfHermitianVectorBundles §6.7a (ii): the `n` generators have norms `≤ Λ`, `Λ ≥ 1`), and
`cst ≥ 0`. SlopesOfHermitianVectorBundles §6.7b (d′) gives `binom(T − 1, D)·δ_Z ≤ rk M_T(Z)`, that is `z ≥ 0`. The undivided inequality gives
`binom(T − 1, D)·δ_Z/rk M_T(Z) ≥ 1 − q`, which is `z ≤ q`, whatever the sign of `1 − q`. Everything is computed on the bundle `Ū_Z`
of rank `N_Z`. (e3) By 8.18c (b) every component is birational for `u₁` and `u₂`; by 8.18c (c) the lattices of the weights `u₁`,
`wt(0)`, `wt(D)`, `wt(T)` are generated by at most `n` forms of norm at most `Λ`, with the bounds of 8.18c (f) (ii); 8.18 (a) gives
`h(u₁, Z) ≥ −c_Λ`, 8.18c (d) gives `β`, (e1) the flatness (`u₁` is strictly decreasing by 8.18c (f) (ii)), and 8.18c (e) (ii) at `λ = wt(T)` with (e2) gives `z ≤ q_z`. The lattice of
forms is, up to the component idempotents, the orthogonal sum over the components, so its slope `μ = 2μ̂` is at least twice
the mean over the components of the right side of (e2). There `h_Ū = h − ½·H_{N_Z−1}`, and since `h ≥ −c_Λ` and `0 ≤ z ≤ q_z ≤ ½`,
`(1 − z)·T·h ≥ (1 − q_z)·T·h − q_z·T·c_Λ`; 8.18 (c), with 8.18c (f) (i), `ρ_Z ≤ ρ` (8.18c (e) (i))
and `ρ < 1` (from `q_z ≤ ½`), bounds the mean of `h` below by
`−C·err(u′, g) − ρ·c_Λ − c_c − htc(B(u′, g))·|u′|₁`. The remaining terms are `(T/2)·H_{N_Z−1}`, `(T/2)·log β`,
`z·(log Λ_D + log Λ_T) ≤ 2b`, `z·T·cst ≤ 3T·P_S + T + q_z·P_S·|λ^W_j|₁ ≤ 4√b + b`, and `(1 − z)·(D(D + 1)·cst + log Λ₀)`, at most `5b`
because `q_z ≤ ½` gives `D² ≤ T/14` and `D²·P_S·|λ^W_j|₁/T ≤ q_z·P_S·|λ^W_j|₁/7 ≤ b/7`; by 8.18c (f) (ii) and `SizeSG` each is at most
`C·B₀·log log x`. Finally `u_{M,j} = wt(T) + par(w)` with `|w_τ| ≤ 3r` (8.18), and the flat twist 8.12 (b) costs
`(p − q)·|log Ω|·Σ_τ|w_τ| + 2·Σ_{ℓ∈S_bad} log ℓ ≤ C·B₀`. The passage from the components to the cover is this combination.
Let `c` run over the components and let `h_c`, `s_c`, `δ_c`, `r_c`, `d_c` be reals (the height `h(u₁, Z)`, the volume slope of
`u′`, the degree `δ_Z`, the rank and the arithmetic degree of the lattice on `Z`), and `T`, `D`, `A`, `c_s`, `X`, `c_c`, `z`, `ρ`, `R`,
`b`, `δ′`, `E`, `C₁`, `C₂` reals with `D ≥ 0`, `T ≥ 3D + 5`, `A > 0`, `c_s, X, c_c, R ≥ 0`, `0 ≤ z < 1`, `0 ≤ ρ < 1`, `b > 0`,
`δ′ > 0`, `E ≥ 1`. If for every `c`: `δ′ ≤ δ_c ≤ δ′/(1 − ρ)`; `b·δ_c ≤ r_c` and `(1 − z)·r_c ≤ b·δ_c`; `h_c + c_s ≥ 0`;
`(1 − ρ)·max(0, s_c + c_s) ≤ h_c + c_s + c_c`; and `b·δ_c·(T·h_c − 3(D + 1)·|h_c| − A·log(2 + |h_c|) − R) ≤ d_c`; if the
(unweighted) mean of the `s_c` is `≥ −X`; and if `T·X ≤ C₁E`, `T·c_c ≤ C₁E`, `c_s·(6D + 10 + T·(z + 2ρ)) ≤ C₁E`,
`A·log max(A, 1) + R ≤ C₂E`: then `2·(Σ_c d_c)/(Σ_c r_c) ≥ −2(3C₁ + C₂ + 4)·E`. It is applied with `b = binom(T − 1, D)`,
`c_s = c_Λ`, `c_c` the cost, `E = B₀·log log x`: the first two conditions (8.18c (e) (i), (ii) with (e2)) say that the degrees
and the ranks of the components agree up to the factors `1 − ρ` and `1 − z`, which is what turns the unweighted mean of
8.18 (c) into the rank-weighted mean, and the left side is at most the slope of the orthogonal sum.

*Check.* (*Hypothesis (c) of SlopesOfHermitianVectorBundles §6.7 fails here.*) For the system `(V_i)`, when `π^*L(u₁)` and `L_A` are nef and big (the hypothesis of (e1) on `u₁`; for the choices of 8.18c (f) it holds because `u₁` is strictly decreasing, and the line of a weight with non-negative gaps is nef, route of 8.18c (b)), (c) of SlopesOfHermitianVectorBundles §6.7 fails whenever `Δ₁ ≠ 0`, in particular whenever the Shimura variety is not compact: `a ↦ dim H⁰(R, K_R ⊗ L_A ⊗ π^*L(u₁)^{D+a}) − dim H⁰(R, K_R ⊗ L_A ⊗ π^*L(u₁)^D ⊗ L^a)` is a polynomial of degree `≤ D` (Kawamata–Viehweg), non-negative, non-decreasing and not
zero, hence positive for `a ≥ D`; so `W(s) ≠ V_T` for `T ≥ 2D`, while (c) would give `W(s) = V_T`. On a modular curve with `c`
cusps the codimension is at least `(T − 1)·c`. This is why (e2) has the term `log Λ_T` (SlopesOfHermitianVectorBundles §6.7, the
remark on fixed divisors). (*Values.*) `T₀(D) = 3D + 5` is the value of
one construction; with `q_z = 7(D²/T + Dρ)`, `1 − q_z` is negative for `D = 2`, `T = 11`, `ρ = 0` (`q_z = 28/11`), which is why
8.18c (e) and (e2) keep the undivided inequality.

*Sources:* ingredients (Bost–Gillet–Soulé; Gillet–Soulé; Kawamata–Viehweg). (e1): [FormalProof],
`Development/AbelianVarietyTheory/Definitions/Divisors/HermSysHypOneLeLambdaZero.lean` (`GlobalTheory.HSShort.Sys.Flat`).
(e2): [FormalProof] has the inequality of (e2) for an abstract system (SlopesOfHermitianVectorBundles §6.7b (f′);
[FormalProof], `Development/AbelianVarietyTheory/Definitions/Divisors/HermSysHypOneLeLambdaZero.lean`
(`GlobalTheory.HSShort.SlopeBound`, `GlobalTheory.HSShort.ClaimS`)), applies it to the system of a component inside the
proof of its statement for a component, and states there the following weaker consequence, in terms of the Chow height
`h := h(u₁, Z) = h_Ū(Z) + ½·H_{N_Z−1}` of 8.18 and not of `h_Ū(Z)`: with `G := (D + 1)(log n + 1)/2 + 1` and
`log ϱ := log Λ + 26·log(n·D·δ_Z·(2 + |h| + log Λ))`,
`μ̂(M_T(Z)) ≥ (1 − z)·(T·h − 3(D + 1)·|h| − log Λ₀ − 26·D²·log(ϱ·T) − (T + D + 1)·log β − (T + D²)·(G + 2)) − z·(T·log(2ϱ·√β) + log Λ_D + log Λ_T)`,
`0 ≤ z ≤ 1`. It follows from (e2) by `h_Ū(Z) ≥ h − (log n + 1)/2` (`N_Z ≤ n`, `H_{N−1} ≤ log N + 1`) and elementary estimates,
for `D ≥ 1`, `T ≥ D + 1` and `n, Λ, β, δ_Z ≥ 1` (these estimates are not given here). This is the form in which
[FormalProof] feeds the components into the combination in the route of (e3), with `h_c = h(u₁, Z)`:
`Development/AbelianVarietyTheory/Proofs/DivisorProofs/HilbertSamuelComponentShortBasisBoundStatement.lean`
(`GlobalTheory.T.hilbertSamuel_component_short_basis_bound`),
`Formalism/LocalToGlobal/IndefiniteForms/IndefiniteTree/RealCubicMeans/LogMeanShares/LogMeanStatements/HSClaim.lean`
(`Formalism.NormVectorIdentities.Items.HSClaimS`),
`Development/AbelianVarietyTheory/Definitions/Divisors/IsHomogeneousCompIdeal.lean` (`GlobalTheory.CompHt.compHeight`).
(e3), the lattice of weight `u_{M,j}`, follows from [FormalProof],
`Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/LiftLambdaBound.lean`
(`GlobalTheory.CovTop.UniformLowerBound`),
`Development/AbelianVarietyTheory/Definitions/Divisors/NormNegCmConstantEqAtAllEmbeddings.lean` (`GlobalTheory.CovTop.Deep.mu`),
`Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/ULowOfStatement.lean`
(`GlobalTheory.T.uniform_lower_bound_of_sums'`). *Needs:* 8.12, 8.18,
8.18c; ChowFormsAndHeightsOfSubvarieties §6.2 (b); SlopesOfHermitianVectorBundles §§6.6, 6.7 (the remark on fixed divisors),
6.7a (i)–(iii), 6.7b (d′)–(f′);
ShimuraCompactifications §7.12; AlgebraicModuliForArithmeticGeometry §9.10 and MultiplierIdealsOfPairsAndPointSeparation §§9.13, 9.13a; ThetaChainsOnDefiniteUnitaryGroups §2.1.

### 8.18f Rank growth and short vectors on the deep cover; the maximal slope at the base level; the level group and group determinants

*Origin:* particular to this proof: the rank comparisons, short spanning vectors, bound for the maximal slope and cusp
forms with nonzero group determinant that the descent from the deep covers requires.

*Method of the formal proof:* (a) on each component the ranks at the shifted weights are compared by upper and lower counts
of independent forms, the shifted weights being brought back by multiplication with one fixed nonzero form, and two
inequalities between binomial coefficients give the growth of ranks, in [FormalProof] with the factor `2` at the double
shift and a factor `1 − D(D + 6)/T` at the single one (`D` the dimension of the flag bundle); the factor `1 + 2q_z` at
both shifts is this roadmap's own formulation; (b) is Minkowski: a lower bound for the norms of nonzero vectors bounds
the maximal slope. (d) At a point of each component, an element of the level group that is unipotent modulo a split
prime of the level and close to the identity is the identity; a ball about the point is therefore disjoint from its
translates, interpolation gives a cusp form that is nonzero at the point and zero at its other translates, and its
matrix of translates there is a scalar times a permutation matrix, whose determinant is not zero; the statement of
[FormalProof] that step (v) of 8.19 uses is the non-vanishing of the group determinant at a point of every component,
for complex cusp forms.

In the setting of 8.18 and 8.18c, with `q_z` of 8.18c (e):

(a) under the hypotheses of 8.18e (e3), for `s = 1, 2` the lattices `A_λ` of integral cusp forms on `Y_j` satisfy
`rk A_{λ^W_j + s·c·w_q} ≤ (1 + 2q_z)·rk A_{λ^W_j − c·w_q}`; and for a character `ψ` of `G_{Y_j}` the `ψ`-isotypic part of the integral
cusp forms of weight `λ^W_j` on `Y_j` is spanned over the field of definition by elements of Petersson norm at most
`|G_{Y_j}|·Λ`, `Λ` the number of 8.18c (c) at the weight `λ^W_j`;

(b) for every step `1 ≤ j ≤ m` and the lattice `L` of all integral cusp forms of weight `λ^W_j` on the Shimura variety of `U(W_j)`
at the level of ThetaChainsOnDefiniteUnitaryGroups §§2.9, 2.9a, over `𝒪_𝕂`: `μ_max(L) ≤ 2·ℓ_sup + 2·log β_sup + 2·log rd(𝕂) + 4` (the maximal slope does not change under extension of scalars to `𝒪_𝕃`),
where `ℓ_sup` is an upper bound for the mean over the embeddings of `−log` of the sup norm of the nonzero elements of `L` and
`β_sup` an upper bound for the Bergman function of the cusp forms of weight `λ^W_j`.

(c) *The level group of the deep cover and the type part.* Let `1 ≤ j < m` and let `Γ_j` be the group of the
`𝒪_E`-linear automorphisms of the level structure of `Y_j` (level `g₀g₁·15^e`). Hypotheses, carried by this clause:
(H1) `Γ_j` acts on `Y_j` by change of the level structure, and its action on functions preserves, for every weight,
the cusp forms of that weight; (H2) reduction at the type primes, in a frame of the level structure there, is a
surjection `π : Γ_j → G₀` with a homomorphism `ι : G₀ → Γ_j` such that `π∘ι = 1` and `ι(G₀)` commutes with `ker π`, so
that `Γ_j = ker π × ι(G₀)` (the Chinese remainder theorem for the level, `g₀g₁` being prime to the rest of it: `ι(G₀)` is
the group of the automorphisms trivial modulo the rest of the level, on which `π` is bijective, and `ker π` the group of
those trivial modulo the type primes), and the group `G_{Y_j}` of 8.18 (o) is `π^{−1}(P)`, `P` the product of the upper
unitriangular groups at all the places above `g₀g₁` (BesselPoincareSeriesAndGramBounds §5.23 (iv)); (H3)
`r + 1 < g₀` and `r + 1 < g₁`. Then:
(c1) for `S = π^{−1}(P)` and for `S = π^{−1}(H_i)`, `i ∈ {0, 1}` (`H_i` the elements unitriangular at the places not
above `g_i`), there is a prime `𝔔` of `E` dividing the level, of degree one over a rational prime `g > r + 1` and
unramified, such that every element of `S` is unipotent modulo `𝔔` (a *neat prime* for `S`);
(c2) there are a representation `ρ` of `Γ_j` on the complex cusp forms of weight `λ^W_j` on `Y_j`, equal to the action
by translation up to a character of `Γ_j`, and a character `λ` of `π^{−1}(P)` inflated from a nondegenerate character of
`P`, such that the rank of the type part of the lattice of integral forms of weight `λ^W_j` at the base level is
`dim ρ^{(π^{−1}P, λ)}` and the rank of its non-good part is the dimension of the intersection of `ρ^{(π^{−1}P, λ)}` with the
kernel of the good idempotent of RowTowerAndRallisIdentities §5.3 acting through `ι`.

(d) *Cusp forms with a regular group determinant.* Let `1 ≤ j < m`, `p_j, q_j ≥ 1`, `[F:ℚ] ≥ 3`, `c = c_j` (8.18), and
assume (H1)–(H3) of (c). For `S = π^{−1}(P)` and for each `S = π^{−1}(H_i)` there is a cusp form `ς_S` of weight `c·w_q` on
`Y_j`, defined over the field of definition of `Y_j`, whose group determinant `det(γ_{hg}^*ς_S)_{h,g∈S}` is not a zero
divisor of the ring of sections of `Y_j`.

*Route.* (a) After the flat twist by `par(â_j)` (8.12), which preserves ranks, the weights `λ^W_j + s·c·w_q` become
`u_{M,j} + (s + 1)·c·w_q` and `λ^W_j − c·w_q` becomes `u_{M,j}`, of the rank of `wt(T)` (8.18). On each component, the jet bound
8.18c (e) (ii) for the weights `wt(T) + (s + 1)·c·w_q` (of the rank of `u_{M,j} + (s + 1)·c·w_q`, 8.12) gives `(1 − q_z)·rk ≤ binom(T − 1, D)·δ_Z`, and 8.18e (e2) (`z ≥ 0`) gives
`binom(T − 1, D)·δ_Z ≤ rk(wt(T), Z)`; sum over the components and use `(1 − q_z)^{−1} ≤ 1 + 2q_z` for `q_z ≤ ½`. Short vectors: 8.18c
(c) at the weight `λ^W_j`, and the isotypic projector `|G_{Y_j}|^{−1}Σ_δ ψ(δ)^{−1}γ_δ^*`, whose pull-backs are isometric. (b) A nonzero
`v ∈ L` has `‖v‖_σ² ≥ β_sup^{−1}·sup_σ|v|²` (definition of the Bergman function), so the mean, hence the maximum, over `σ` of
`log‖v‖_σ` is at least `−ℓ_sup − ½·log β_sup`, and the first minimum satisfies `log λ_0 ≥ −ℓ_sup − ½·log β_sup`;
SlopesOfHermitianVectorBundles §4.2 gives `μ̂_max ≤ −log λ_0 + ½·log(rk L + 2) + log 2 + ½·log rd(𝕂)`, and `rk L ≤ β_sup` (the rank is the
integral of the Bergman function), so `μ = 2μ̂` gives the bound. (c) (c1) For `π^{−1}(H_i)` a prime above `g_{1−i}`, at which
the elements of `H_i` are unitriangular; for `π^{−1}(P)` a prime above either type prime; an element trivial modulo the type
primes is unipotent there; `g > r + 1` is (H3). The choice of the prime inside the frame is not given here. (c2) Descent
from the cover (8.19 (a)): the forms at the base level are the `G_{Y_j}`-invariants on `Y_j`, and the type part is cut by the
character of `P`. Its proof is not given here. (H1), (H2) are properties of the moduli problem with full level structure
that 8.18 (o) does not state; they are hypotheses of this clause. The direct product of (H2) is the hypothesis on `(π, ι)`
of BesselPoincareSeriesAndGramBounds §5.23 (iv); the formal proof proves it for the deep covers of the chain, whose level
is `g₀g₁` times an integer prime to `g₀g₁`. (d) By (c1) every element of `S` is unipotent at one neat
prime of the level. (1) *Separation of an orbit* (8.14, existence clause, applied to the quotient of `Y_j` by `S`; its proof
uses of `S` only this unipotence, and of `c` only `c ≥ N_j + binom(dim Sh + 1, 2) + 1`): on every component `Z` there is a
complex point `y` over the generic point such that the values of the cusp forms of weight `c·w_q` at the points of the
`S`-orbit of `y` lying on `Z` are linearly independent. (2) *One form for all components:* for each component the
nonvanishing at `y` of the group determinant is the nonvanishing of a nonzero polynomial on the space of cusp forms over
the field of definition, an infinite field, and there are finitely many components. (3) A section whose value at a point
over the generic point of every component is nonzero is not a zero divisor of the ring of sections. The existence clause
of 8.14 asks `[F:ℚ] ≥ 3`, the hypothesis here. Not given here: (1)
beyond 8.14, and the linear algebra of (2).

*Check.* The hypothesis of 8.18c (e) (ii) at the weights `wt(T) + (s + 1)·c·w_q` is one of the conditions `SizeSG` of 8.18c (f) (ii)
(a parallel twist does not change it); `2q_z ≤ 2b/(P_S·|λ^W_j|₁)` by 8.18c (f) (ii), so (a) is the rank growth that 8.14 (iv) asks with
`ε_rk := 2q_z ≤ 1`.

*Needs:* 8.12, 8.14, 8.18, 8.18c, 8.18e, 8.19 (a); RowTowerAndRallisIdentities §5.3; SlopesOfHermitianVectorBundles §4.2; ThetaChainsOnDefiniteUnitaryGroups §2.9, ThetaChainsOnDefiniteUnitaryGroups §2.9a.

### 8.19 The slope of the step lattices

*Origin:* particular to this proof: a lower bound for the slope of the lattice of integral cusp forms of each step, whose
main term is the degree of the flat line and whose error comes from the average arithmetic volume theorem through deep
covers and descent.

*Method of the formal proof:* an assembly of the earlier sections: on the deep cover the uniform lower bound for slopes and
the flat twist bound the slope at the shifted weight, the change of weight by a short section transfers the bound to the
weight of the step with a loss proportional to the rank defect, the descent to the base costs `2·log rd(𝕃_Y)`, and the
passage from the type part to the good part uses the slope inequality for an idempotent with bounded denominator on a
non-good part of small relative rank; the comparison of the model norm with the Petersson norm gives the stated form.

For `1 ≤ j ≤ m` let `M_{λ^W_j}` be the lattice of all integral
cusp forms (integral at every integral framed point) on the Shimura variety of `U(W_j)` (signature
`(p_j, q_j) = (k + j − 1, m − j)`, the level of ThetaChainsOnDefiniteUnitaryGroups §2.9, ThetaChainsOnDefiniteUnitaryGroups §2.9a with the base level `(P_0, χ_{P_0})` at the type primes) of the weight `λ^W_j`
whose classical lift is the discrete series of the model lift of step `j` (RowTowerAndRallisIdentities §5.7), with rows `a⁺_{j,τ}` at the embeddings `τ ∈ Φ`,
rows `(a⁻_{j,τ,q_j−1}, …, a⁻_{j,τ,0})` at the conjugate embeddings, and scalar weight `r + t` (the diagrams of LocalGainOfThetaChains §4.9f (d)); so its total
degrees at the embeddings of `Φ` and of `cΦ` are `D⁺(λ^W_j) = D⁺_j`, `D⁻(λ^W_j) = D⁻_j`, and `DF(λ^W_j) := D⁺(λ^W_j) + D⁻(λ^W_j) = D^H_j`
by definition. Put `M^W_j := (M_{λ^W_j} ⊗ 𝒪_𝕃) ∩ Z_g`, `Z_g` the `(P_0, χ_{P_0})`-isotypic part cut by the good projector of RowTowerAndRallisIdentities §5.3, with the Petersson
metric. With the anchor `â_j` of 8.18, `λ^W_j − par(â_j)` has entries bounded by the spread of the weights of ThetaChainsOnDefiniteUnitaryGroups §2.3. Then, under the
hypotheses of RowTowerAndRallisIdentities §5.9, `rk M^W_j = D_0 = dim 𝔼_0` (RowTowerAndRallisIdentities §5.9), and:

(a) *Descent from a cover.* For `j < m` and the cover `Y_j` of 8.18 (o), pull-back of cusp forms of a weight `λ` that is good on the base and on `Y_j` from the
Shimura variety of `U(W_j)` to `Y_j` is injective and isometric (probability measures), its image is the
`G_{Y_j}`-invariant part, it maps integral forms to integral forms, and a form whose pull-back is integral is integral up
to the different of `𝕃_Y`; consequently, for every saturated sublattice `L` of the integral cusp forms of weight `λ` on the base (over `𝒪_𝕂`),
`μ(L ⊗ 𝒪_{𝕃_Y}) ≥ μ(L′) − 2·log rd(𝕃_Y)` for the lattice `L′` of the integral forms on `Y_j` lying in the span of the pull-back
of `L` (`rd` the absolute root discriminant).

(b) *The slope.* Under the size conditions of ThetaChainsOnDefiniteUnitaryGroups §2.1, the hypotheses of BesselPoincareSeriesAndGramBounds §5.23 (ii), (iii) (on `r`, `g_i`, `q`, `d` and the exponent
of `δ_bad`), `r + 1 < g₀, g₁`, and, for `j < m`, `[F:ℚ] ≥ 3` (`p_j, q_j ≥ 1` hold), `q_z ≤ ¼` (8.18c (e)) and the hypotheses of
8.18f (c), (d):

`μ(M^W_j) ≥ −(p_j − q_j)·Σ_τ w_j(τ)·log Ω − C·B₀·log log x`,

`C` a constant in the sense of the Conventions: it depends neither on `x` nor on anything chosen at the scale `x`.
*The form of [FormalProof].* [FormalProof] states (b), (c) for families of chain data and not for one datum. There is
`ε₁ > 0`, and for every `0 < ε ≤ ε₁` a threshold for the constants of chain data, such that for every family of chain
data at the exponent `ε` (a datum for every scale of its window set and every translate, with constants that do not
depend on the scale) which is of the class of the chain (the class of chain data of ThetaChainsAndFrobeniusPrimeSums:
the page of the ranks, the conditions on `q`, `d`, on the type primes and on the level primes, the tame parameters, the
good twisting datum and the chosen weights) and whose constants pass the threshold, there are `C₀ ≥ 0` and `x₀` with:
at every scale `x ≥ x₀` and every datum of the family at that scale whose row spaces, step spaces and lattices are those
of the chain (RowTowerAndRallisIdentities §§5.3, 5.7, 5.11, 5.12, under the gap condition of RowTowerAndRallisIdentities
§5.9) and whose coefficient field `𝕂` satisfies the two bounds of ThetaChainsOnDefiniteUnitaryGroups §2.6, the
inequality `−μ ≤ (p_j − q_j)·Σ_τ w_j(τ)·log Ω + C·B₀·log log x` holds for every `C ≥ C₀` and every `1 ≤ j ≤ m`, for the
lattice `M^W_j` with the norm of RowTowerAndRallisIdentities §5.11 divided by `|P_0|` (the metric with which
GluedTargetAndDivisionInequality uses it). There `C₀` is chosen after `ε`, the threshold and the family, and the
hypotheses of BesselPoincareSeriesAndGramBounds §5.23 (ii), (iii), `r + 1 < g₀, g₁`, `[F:ℚ] ≥ 3`, the bound on `q_z` and
the hypotheses of 8.18f (c), (d) are not assumed: they hold for the families of the class at every large scale.

(c) *The classical lift.* The classical lift at the extremal vector of the lowest `K`-type (the identification of
RowTowerAndRallisIdentities §5.10a, with the extremal vector of the normalisation of RowTowerAndRallisIdentities §5.11)
identifies `M^W_j ⊗ 𝕃` with the `𝕃`-rational forms of RowTowerAndRallisIdentities §5.11 at the base level (the forms of
the model lift of step `j` have the weight `λ^W_j`: the lowest `K`-type
of the lift at `τ` is `(a⁺_{j,τ} + ((r + t)/2 − w_j(τ))·1; −a⁻_{j,τ} − ((r + t)/2 + w_j(τ))·1)`). (i) The Petersson norm and the norm of
the model lift are proportional at every embedding, `‖·‖_{5.11} = c_σ·‖·‖_{Pet}` with `|log c_σ| ≤ C·B₀·log log x` under the size
conditions of ThetaChainsOnDefiniteUnitaryGroups §2.1. (ii) The type part of the lattice of integral forms is spanned by its integral vectors of the type. The
`𝕃`-rational forms of RowTowerAndRallisIdentities §5.11 at the base level carry the integral structure transported from `M^W_j` by this identification;
so the bound of (b) holds, with `2C` in place of `C`, for the norms of RowTowerAndRallisIdentities §5.11 and for the Petersson form of RowTowerAndRallisIdentities §5.1.

*Route.* (a) The cover is Galois over the base with group `G_{Y_j}` (8.18 (o)); the invariant measures are probability
measures, so pull-back is isometric; integrality at an integral point of the base is tested on a point of the cover over
a finite extension, whose different bounds the denominators; the index of `L ⊗ 𝒪_{𝕃_Y}` in `L′` is at most that of the
different in each coordinate, which costs `2·log rd(𝕃_Y)` in `μ = 2μ̂`. (b) For `j = m`, 8.13 (c) (for the product of the
Conventions, with its bound for the mass, this roadmap's own) and step (v) below. For `j < m`:
(i) by (a) the cover `Y_j` of 8.18 (o) descends to the base at the cost `2·log rd(𝕃_Y) ≤ 2b` (8.18 (o), 8.18c (g)); the level `g₀g₁` is good (setting). (ii) On `Y_j` the uniform bound
8.18e (e3) holds at the weight `u_{M,j}`, for the choices of 8.18c (f). (iii) The weight `λ^W_j − c·w_q` is `u_{M,j} + par(â_j)`; the flat twist
8.12 (b) with `w = â_j` costs `(p_j − q_j)·log Ω·Σ_τ â_j(τ) + 2·Σ_{ℓ∈S_bad} log ℓ`, with no term in `q_j`, and
`2Σ_{ℓ∈S_bad} log ℓ ≤ C·f·x^ε ≤ C·B₀` under the size conditions; `|(p_j − q_j)·Σ_τ(â_j(τ) − w_j(τ))·log Ω| ≤ C·B₀·log log x`
because the anchor and the step weight differ by the bounded shifts of ThetaChainsOnDefiniteUnitaryGroups §2.3. (iv) The change of weight 8.14 from `A_λ`,
`λ = λ^W_j − c·w_q`, to the `ψ`-part `B` of weight `λ^W_j`, with the section `ς` of 8.14 (existence, `S = G_{Y_j}` of 8.18 (o),
with `n_θ = n`, `Λ_θ = Λ`, `β_θ = β` of 8.18c (c), (d) at the weight `c·w_q`): `P = b` in the summed form (from the pointwise constant
`P₁ ≤ log(n·|G_{Y_j}|²·β·Λ)` and `|G_{Y_j}|³e^{2P₁} ≤ e^{2b}`, 8.18c (f) (ii)), `Λ = b + P_S·|λ^W_j|₁` (the short spanning vectors of 8.18f (a),
with `log|G_{Y_j}| ≤ b` and `log Λ ≤ P_S·|λ^W_j|₁` at `λ^W_j`, 8.18c (f) (ii)) and `ε_rk = 2q_z ≤ 1` (the rank growth of 8.18f (a));
`|G_{Y_j}|·rk B ≤ rk A_{λ^W_j+c·w_q}` is part of 8.14. Apply 8.14 in its form with `t`, `t` the lower bound for `μ(A_λ) − 2P` from
(i)–(iii); then `|t| ≤ P_S·|λ^W_j|₁ + C·B₀·log log x + 2b` (as `|log Ω| ≤ P_S`), and with `q_z·P_S·|λ^W_j|₁ ≤ b`, `q_z ≤ ½` (8.18c (f) (ii))
`ε_rk|t| ≤ 4b + C·B₀·log log x` and `2ε_rkΛ ≤ 6b`: the loss `ε_rk(|t| + 2Λ)` is at most `10b + C·B₀·log log x`. (v) From
the type part to the good part: the good projector is a self-adjoint idempotent of the group algebra of `G₀` with
`|G₀|·Π_good(L) ⊂ L`, `2 log|G₀| ≤ b`; the non-good part of the type part has rank at most
`3e^{−x^{ε/(7J)}}` times the whole. For `j = m`: the forms are functions on a finite set of classes with values in a
fixed space, the preimage of each `H_i` in the level group permutes the classes freely, the level group being again a
direct product `ker π × ι(G₀)`, so
BesselPoincareSeriesAndGramBounds §5.23 (vi) gives the hypothesis of BesselPoincareSeriesAndGramBounds §5.23 (iv) with
`c = 1`, and BesselPoincareSeriesAndGramBounds §5.23 (iv), (ii), (iii) give the bound with `2e^{−x^{ε/(7J)}}`. For `j < m`: by 8.18f (c) the type part and its non-good part are the
`(π^{−1}P, λ)`-part of the representation `ρ` of `Γ_j` on the cusp forms of weight `λ^W_j` on `Y_j` and its intersection
with the kernel of the good idempotent; BesselPoincareSeriesAndGramBounds §5.23 (v) applies with `B` the ring of
sections of `Y_j`, `V` the cusp forms of weight `λ^W_j` and `V_m`, `V₁`, `V₂` those of the weights `λ^W_j − c·w_q`,
`λ^W_j + c·w_q`, `λ^W_j + 2c·w_q` (products of cusp forms by forms are cusp forms of the sum of the weights, and `Γ_j`
preserves the cusp forms of each weight, 8.18f (c)), `H₀ = π^{−1}P`, `H = π^{−1}H_i`, and `u₀`, `u` the cusp forms of
weight `c·w_q` of 8.18f (d); the weights `λ^W_j`, `λ^W_j − c·w_q`, `λ^W_j + 2c·w_q` are good (8.18c (a), (f) (ii)), so the
three ranks are the dimensions of the spaces of cusp forms, and `dim V₂ ≤ (1 + 2q_z)·dim V_m ≤ (3/2)·dim V_m` by
8.18f (a) with `s = 2`. So the hypothesis of BesselPoincareSeriesAndGramBounds §5.23 (iv) holds with `c = 3/2`, and
BesselPoincareSeriesAndGramBounds §5.23 (iv), (ii), (iii) give the bound. Freeness of the action on the cover alone would not give it for global sections (a group of translations of
an elliptic curve acts trivially on `H⁰(𝒪)`): the cusp form with a group determinant that is not a zero divisor is
what replaces it; `μ_max` of the integral forms of the
type part is at most `x^C·b` by 8.18f (b) with `ℓ_sup ≤ x^C·b` (8.18c (f) (iii)) and `β_sup ≤ β` of 8.18c (d) (the pull-back to the deep cover
is injective and isometric, so the Bergman function at the base level is at most that on the cover; `log β ≤ C·(f·r·x^ε)³`);
SlopesOfHermitianVectorBundles §2.6 (integer form, `g = |G₀|`) gives
`μ(L ∩ im e) ≥ μ(L) − (rk(L ∩ ker e)/rk(L ∩ im e))·(2 log|G₀| + μ_max(L) − μ(L))`, a loss `O(δ_bad·x^C·b)`, at most `b ≤ B₀` for
`x ≥ x₀`. (c) The identification of the rational structures is RowTowerAndRallisIdentities §5.11. For every embedding `σ` of
`𝕃` that is good for the step there is exactly one `σ`-semilinear map from the cusp forms of weight `λ^W_j` at the base level
into the model of the row space at `σ` whose value at the extremal vector of the lowest `K`-type is the classical lift: the
values at the extremal vector of the vectors of the model are exactly the classical lifts of the holomorphic cusp forms of
this weight (rapid decay of cusp forms and finiteness of the volume), and evaluation at the extremal vector is injective on
the model. (i) The model norm is `vol·dim τ` times the Petersson
norm (RowTowerAndRallisIdentities §5.1), whose logarithm the size conditions bound. (ii) A full lattice meets every rational subspace in a lattice that
spans it (a basis of the subspace times a common denominator). The integral structure is then a definition, and the slope
of `M^W_j` with the model norm differs from that with the Petersson norm by `2·mean_σ log c_σ`.

*Check.* `δ_bad ≤ 3e^{−x^{ε/(7J)}}` is the value that BesselPoincareSeriesAndGramBounds §5.23 (iii) gives at the parameters of one construction; the loss of (v) is
then `o(b)`, not `O(1)`, which is all that 8.19 needs.

*Sources:* (a): [FormalProof],
`Development/AbelianVarietyTheory/Proofs/DivisorProofs/CuspFormLatticeSlopeSqGoodCoverLeCoreStatement.lean`
(`GlobalTheory.T.cuspFormLattice_slope_sq_goodCover_le_core`),
`Development/AbelianVarietyTheory/Proofs/DivisorProofs/SlopeSqSubLeOfDifferentSmul.lean`
(`GlobalTheory.SlopeDifferent.slope_sq_sub_le_of_different_smul`). (b), (c): [FormalProof],
`Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/LiftLambdaBound.lean`
(`GlobalTheory.CovTop.CovolumeBoundOfX`),
`Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/TopCovolSlim2Use.lean`
(`SelfIntersectionVolumeEstimates.topCovolSlim2_use_alt_alt`); the clauses at one datum:
`Development/AbelianVarietyTheory/Definitions/Divisors/CovolXOfCovol.lean` (`GlobalTheory.CovTop.LowAt`,
`GlobalTheory.CovTop.RecAt`, `GlobalTheory.CovTop.CoreAt`); the class, the threshold and the conditions at a datum:
`Development/AbelianVarietyTheory/Definitions/Divisors/TupleReadBaseTupleEqFamily.lean` (`GlobalTheory.BigTop.FamHyp`),
`Formalism/SharpRestriction/ParamsHeightRankConstant.lean` (`Formalism.MainNotions.Closed`,
`Formalism.MainNotions.FamP.Large`),
`Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/Realised.lean`
(`GlobalTheory.BigTop.PtAt.PointConditions'`),
`Development/AbelianVarietyTheory/Definitions/Divisors/CovolXOfCovol.lean` (`GlobalTheory.CovTop.RecTied`). In step (v)
of the route the hypothesis of BesselPoincareSeriesAndGramBounds §5.23 (iv) holds in [FormalProof] with the constant `2`,
for `j = m` and for `j < m`, in place of `1` and `3/2`:
`Development/AbelianVarietyTheory/Proofs/DivisorProofs/BadWStOfRegular.lean` (`GlobalTheory.BadWOn.model_bound`),
`Development/AbelianVarietyTheory/Proofs/DivisorProofs/ExistsRunModel.lean` (`GlobalTheory.ShareOn.exists_runModel`).
*Needs:* LocalGainOfThetaChains §4.9f, 8.12, 8.13, 8.14, 8.18, 8.18c, 8.18e, 8.18f, RowTowerAndRallisIdentities §5.1, RowTowerAndRallisIdentities §5.3, RowTowerAndRallisIdentities §5.7, RowTowerAndRallisIdentities §5.9, RowTowerAndRallisIdentities §5.10a, RowTowerAndRallisIdentities §5.11, BesselPoincareSeriesAndGramBounds §5.23, ThetaChainsOnDefiniteUnitaryGroups §2.1, ThetaChainsOnDefiniteUnitaryGroups §2.3, ThetaChainsOnDefiniteUnitaryGroups §2.9; SlopesOfHermitianVectorBundles
§§1.2, 2.1, 2.2, 2.6; ShimuraCompactifications §7.22; AutomorphicBundles §5.3 and DiscreteSeriesCoefficientsAndAutomorphicMetrics §10.2.

### 8.19a Theta series generate the integral forms, uniformly on subspaces

*Origin:* particular to this proof: at every finite place the lattice of integral cusp forms is generated by products of
theta series up to a controlled length, uniformly on subspaces, by jets along a generic zero-cycle and an arithmetic
Bézout bound.

*Method of the formal proof:* at each finite place the uniform bound on subspaces is turned into a bound for a lattice
index on every subspace, and a descent lemma for lattices, applied over the ring of the generic zero-cycle
`s_1 = ⋯ = s_n = 0` over the Gauss point of the space of coefficients, bounds that index by `e·dim V′` plus four local
terms: the index of the restricted short theta series in the integral functions on the zero-cycle and the valuations of
the boundary form along it, each times `binom(T − 1, n)`, the Gauss content of a determinant of regularity terms, and the
length of the quotient modulo the deep cusp forms; the sums over the places of these terms are then bounded by the two
height inequalities of (I8), by (I2) to (I4) with transference, and by (I5).

Fix a step `j`,
the Shimura variety of `U(W_j)` (signature `(p, q)`, `p + q = r`) with the level of 8.19, its flag bundle, of dimension
`n := f·(pq + p(p−1)/2 + q(q−1)/2)`, and let `𝕂` be the field over which its cusp forms are taken (the coefficient field of the
moduli scheme), `ϱ(𝔩) := log N𝔩/[𝕂:ℚ]` and `e_𝔩` the ramification index over `ℓ` for a finite place `𝔩 | ℓ` of `𝕂`. A *weight* `w` is
a dominant weight `a(w) = (a⁺_τ, a⁻_τ)_τ` of the Levi subgroup `∏_τ GL_p × GL_q` (entries `≥ 0`) together with an even integer
`n(w)`, the *scalar weight* (the power of the determinant line; the theta series of the class-sum lifts from a definite
space of rank `n′` have scalar weight `n′`); `|w| := Σ a(w) + f·max(q, 1)·r·n(w) + 1` is its size, `DF(w) := D⁺(w) + D⁻(w)` with
`D⁺(w) := Σ_τΣ a⁺_τ`, `D⁻(w) := Σ_τΣ a⁻_τ` (the total degrees at the embeddings of `Φ` and of `cΦ`). `M_w` is the lattice of ALL
integral cusp forms of weight `w`: integral at every integral framed point over a complete discrete valuation ring of
characteristic zero with finite residue field (given normal affine charts of a model at every place, this is integrality
at every complete discrete valuation ring and at the generic points of horizontal divisors: a rational function on a
normal flat model integral at the finite points off a divisor is regular at every prime meeting the special fibre), so
that `M^W_j = (M_{λ^W_j} ⊗ 𝒪_𝕃) ∩ Z_g` (8.19).

*Scalars and depth.* Let `Q := ∏_{p∈S_small} p^{max(1, ⌈vd(p)⌉)}`, `vd(p) := v_p(disc E)/[E:ℚ]`, over the small primes `S_small` (ThetaChainsOnDefiniteUnitaryGroups §2.1)
(so `log Q ≤ 2·Σ_{p∈S_small} log p + log rd_E`); for a
weight `w` and a prime `ℓ` put `c_ℓ(w) := v_ℓ(Q)·DF(w)` for `ℓ ∈ S_small`, `c_ℓ(w) := ⌈DF(w)/2⌉` for `ℓ ∈ {q, d}`, and `c_ℓ(w) := 0`
otherwise. Let `π ∈ 𝒪_K` with `π·π̄ = g₀g₁`, `(π, π̄) = 1` and `π̄·𝒪_E` the half-level ideal of ThetaChainsOnDefiniteUnitaryGroups §2.9a, and
`N(w) := π^{D⁺(w)}·π̄^{D⁻(w)}`, read in the coefficient field through the embedding of `K` that defines `Φ`; so
`N(w)·N̄(w) = (g₀g₁)^{DF(w)}`. For weights `w_L`, `w_F`, an integer `T ≥ 1`, `κ := w_F + T·w_L` and nonzero `s_F, s_0, s_K ∈ 𝒪_𝕂` put
`s_W := N(w_L)·∏_{ℓ∈S_small∪{q,d}} ℓ^{c_ℓ(w_L)}` and

`𝒲 := s_W·Th^{all}(w_L)`,  `Θ(s, w) := s·(g₀g₁)^{f·r·n(w)}·Th^{short}(w)`,
`Θ_κ := 𝒲^T·Θ(s_F, w_F) + 𝒲^{T−n}·Θ(s_0, w_F + n·w_L) + Θ(s_K, κ)`,

`Th^{all}(w)` the lattice spanned by all theta rules of weight `w` (jets along the frame of theta sections at torsion
points, with harmonic polynomials with integral coefficients), `Th^{short}(w)` that of the short theta series (the
class-sum lifts of RowTowerAndRallisIdentities §5.11). `dep_𝔩(y)` is the least valuation at an integral framed point `y` over `𝔩` of the elements of `𝒲`.
(N4′) *The depth function.* `ν_W(𝔩) := ν_𝔩(w_L; n(w_L), M)` is the depth of TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.8b
with multiplier the integer `M = g₀g₁` of the level: the larger of `0` and the supremum, over the algebraic integral framed
points above `𝔩` that have an integral chart, of the least over the integral charts of the point of the depth of `w_L` on
`n(w_L)` copies of the variables, taken with the factor `exp(M·Σ_bh_L(x_b))`, in units `v(ℓ) = 1`;
`ν*(𝔩) := DF(w_L)/(g_i − 1)` if `ℓ = g_i` (`i = 0, 1`), `ν*(𝔩) := ν_W(𝔩) + c_ℓ(w_L)` otherwise; and
`ν_dep(𝔩) := e_𝔩·ν*(𝔩)`. Assume that `ν_dep` has finite support (it is `0` at the places above neither `g₀` nor `g₁` at
which `ν_W` and `c_ℓ` vanish). The statement below holds, with the same proof, for every function `ν ≥ 0` of finite support
on the finite places of `𝕂` in place of `ν_dep` that satisfies the sum bound of (N4) and the depth inequalities of (I8).

Write `q_* := min(g₀, g₁)`, `R_E := rd_E^{C_R}` for the constant `C_R` fixed before `ε` (`C_R = 7`, Check), `T′ := T + n + 2`, `γ₀` for a
fixed multiple of `r`, `P` for a fixed polynomial in `f·r·x^ε`, and
`c := R_E·P·DF(w_L)²/q_*`; by (N0), `c ≥ r₀·((2fm)⁴·n(w_L) + 2(2fm)³)·DF(w_L)²/q_*` with `r₀ := rd_E²/(4f)`. Assume, for a share parameter `δ₂ ∈ [x^{−ε}, 1]` and numbers
`G, P₀ ≥ 1` and `C_s` fixed before `ε`:

(N0) *scale and constants.* The size conditions `Size(x, ε)` of ThetaChainsOnDefiniteUnitaryGroups §2.1 hold, and
`P = C_P·(f·r·x^ε)^{e_P}` with `e_P ≥ 12`, `C_R = 7`. Moreover `x ≤ f·r ≤ x^{C_A}`, `log|disc E| ≤ C_A·f·r·x^ε`,
`log g_i ≤ 9x^ε + 1`, `|(L′/L)(1, χ_K)| ≤ x^ε`, `|log Ω| ≤ C_A·x^ε`, `2fm ≤ rd_E`, and `log p_o ≤ x^ε` for the two
auxiliary primes `p_o ∈ {p_δ, p′_δ}` of ThetaChainsOnDefiniteUnitaryGroups §2.4 (b); `log[𝕂:ℚ]` and
`log rd(𝕂)` are at most `P_O := 19·f·r²·x^ε + 198·f²·x^ε`; `P ≥ max(16200π·n_W·m⁴·(2fm)⁴, (2fm)⁴·n_W + 2(2fm)³, r·(2fm)³)`.
With `P_H ≥ P_rw ≥ ½` and `P_et ≥ 0` the constants of the two height inequalities of (I8) and of the number `N_𝒲` of
generators of `𝒲` (`log N_𝒲 ≤ P_rw·(|w_L| − 1)`), `P_d` a bound for `log dim S_κ` and for the exponent `P_G·(1 + log|κ|)` of
(I2), `P_q` the constant of (I5), and `C_κ` the constant of `|κ| ≤ C_κ·k·f·b`: `25·(2G + 6P_H + P_rw) ≤ P`, `P_et ≤ P`,
`4C_κ ≤ P²·f`, `2G + P_rw + P₀·(1 + log|κ|) + (3/2)·(P_d + P_O) ≤ P`, and
`60G + 180P_H + 44·(2G + P_rw + P₀·(1 + log|κ|) + (3/2)·(P_d + P_O)) + 44·P_q ≤ P²·n`.
`P_N := 2x^ε + λ^* + 4`, `λ^* := log(g₀g₁) + log(f²·q·d)`. *Domination.* With `Z := f·r·x^ε`: `C_P ≥ 1000`, `C_P^{20} ≤ Z`,
`λ^* ≤ C_P·Z`, `P_N ≤ C_P·Z`, `log(f_E·g₀g₁) ≤ C_P·Z`, `f·r·(2·log rd_E + 2·log(f·r) + 3) ≤ C_P·Z`, `P_O ≤ C_P·Z²`,
`r + 2γ₀(f·p·q + 1) ≤ C_P·Z³`, `max(90(f·r + 1), 360·f·m³, 2(3r + 3 + r·log r), n_W, γ₀, f·r² + 6, 11) ≤ C_P·Z⁴` and
`72·5⁴·n²·f²·r²·m⁴ ≤ C_P·Z^{10}`. The polynomials named in the inputs are `P_G = C_G·Z^{A_G}` in (I2) with `A_G ≤ 2`,
`P₀ = C_L·(f·r + x^ε + log|disc E| + |log Ω|)^{A_L}` in (I3) with `A_L ≤ 4`, `P_q = C_q·Z^{A_q}` in (I5) with `A_q ≤ 11`, the
bound `log sup_σ|η| ≤ C_f·Z^{A_f}·i_η` of (I8) with `A_f ≤ 2`, and `log[𝕂:ℚ], log rd(𝕂) ≤ C_h·Z^{A_h}` with `C_h ≥ 1`,
`A_h ≥ 4`; `P_G·(1 + log|κ|) ≤ P_d` and `log dim S_κ ≤ P_d`; `P² ≥ 2` and `P_rw ≤ P`;

(N1) *weights.* All scalar weights are even (the theta series are those of Hermitian lattices of even rank equal to the
scalar weight); `n(κ) = n_P + T·n_W`, `n_W := n(w_L) ≥ 2f·r`, `n_P := n(w_F)`, `n_P⁰ ≤ n_P ≤ n_W`, `n_W ≥ n_W⁰`, with the thresholds
`n_P⁰ := 8f·r + 4` and `n_W⁰ := max(f·r·(r + 1), 40)`; `n ≤ T` (for `κ = λ^W_j`, whose scalar weight is `r + t` (8.19), this reads
`r + t = n_P + T·n_W`); the last entries of `w_L` are positive; `w_L` has scalar weight `n_W` and is obtained from `κ` as
follows: each gap of `w_L` between consecutive entries is `⌊(g + 2)/T′⌋`, `g` the corresponding gap of `κ`; its last entry
at an embedding of `Φ` is `⌊(a − (n + 2)·n_W − 2r)/T′⌋` and at an embedding of `cΦ` is `⌊a/T′⌋`, `a` the last entry of `κ`
there; `w_F := κ − T·w_L` entry by entry, with scalar weight `n_P`; every gap of `κ` is at
least `T′(T′ + 2r) − 2`; its last entries and its non-compact entries are at least `h₀/2 − (t + 1)/2` and `h₀/4 − t` with
`h₀ ≥ 4T² + t + 1`; `|κ| ≤ C_κ·k·f·b`, `|w_L| ≤ C·k·f·b/T`, `b ≤ |κ|`, `T·|w_L| ≤ 2|κ|`, `|w_F| ≤ (n + 2)|w_L| + 5·f·r²·T`;

(N2) *the degree `T`.* `T ≥ T₀(n, n_W, r, f, p, q)`, `T ≥ P⁴·n³·k·f/(m·δ₂)`, `T ≤ x^{C_deg}`, `P³T² ≤ b`, `R_E·P ≤ b`;
`T·c·γ₀ ≤ 1`, `f·m³·R_E²·c ≤ ½`; `R_E⁴·P³·DF(w_L)² ≤ q_*`, `T·γ₀·R_E·P·DF(w_L)² ≤ q_*`, `(n + 4)·DF(w_L) ≤ q_* − 2`,
`4·DF(w_L) + 4 ≤ q_*`, `2·DF(κ) + 2 < g_i`, and for `j < m` `DF(w_L)·2√(2fm) < q_*`; and `f² ≤ rd_E`, `r ≥ 8`, `DF(w_L) ≥ 3`;

(N3) *scalars and rational spanning.* At every embedding `σ`: `log|σ(s_F)| ≤ (λ^* + 2·log p_o)·|w_F|`,
`log|σ(s_0)| ≤ 2(λ^* + 2·log p_o)·|w_F + n·w_L|`, `log|σ(s_K)| ≤ 2(λ^* + 2·log p_o)·|κ|` and
`log|σ(s_W)| ≤ (λ^* + 2·log p_o)·|w_L|`, for one of the two primes `p_o` of (N0) (for `s_W`,
`log|σ(s_W)| ≥ (DF(w_L)/2)·log(g₀g₁)` holds by definition); `𝒲` has a finite generating
set whose maximal logarithmic sup norm has mean over `σ` at most `G·|w_L|`; each of `Θ(s_F, w_F)`, `Θ(s_0, w_F + n·w_L)`,
`Θ(s_K, κ)` contains a finite set spanning all cusp forms of its weight over `𝕂`, of mean logarithmic sup norm at most
`G·|weight|`; here `G = P_Λ + 3x^ε + 2·max(log[𝕂:ℚ] + log rd(𝕂), log[E:ℚ] + log rd_E) + 2·f·r·(λ^* + 2·log p_o) + 31·f·r·x^ε`
for some `P_Λ ≤ 1009·f·r·x^ε`;

(N4) *depth and integrality.* `Σ_𝔩 ν_dep(𝔩)ϱ(𝔩) ≤ P_N·|w_L|`; the four scaled lattices `𝒲`, `Θ(s_F, w_F)`, `Θ(s_0, w_F + n·w_L)`,
`Θ(s_K, κ)` consist of integral forms;

(N5) *two auxiliary forms.* For `j < m` an integral form of weight `2w_L` with scalar weight lowered by `2`, and for all
`j` an integral form of weight `(n + 4)·w_L − w_F`, both nonzero on every component, with logarithmic sup norms at most a
fixed polynomial factor times `n·|w_L|`;

and the inputs:

(I1) `M_κ` is a lattice (a consequence of (N3), (N4) and (I3), see below); (I2) `sup² ≤ exp(P_G(1 + log|κ|))·‖·‖²` on forms of weight `κ` for SOME Hermitian norm `‖·‖` bounded by
the sup norm; (I3) nonzero integral forms of weight `κ` have mean logarithmic sup norm `≥ −P₀(1 + log|κ|)·|κ|`; (I4) sup norms
are submultiplicative; (I5) for `j < m`: with the *deep* cusp forms of weight `κ` those whose Fourier–Jacobi coefficients of
trace at most `c₁ := R_E·T·c·(2f·q)²·q/2`, along the cusps of rank one over `𝒪_E`, vanish at every frame, and `Q_κ` the quotient of `M_κ`
by its intersection with the deep cusp forms, of rank `ρ_P`: there is a function `be ≥ 0` of finite support on the finite
places of `𝕂` with `Σ_𝔩 be(𝔩)ϱ(𝔩) ≤ P_q·|κ|` such that for every family `th` of `ρ_P` integral forms of weight `κ` that spans the
cusp forms together with the deep cusp forms and has mean logarithmic sup norms at most `P_h·|κ|` (`P_h` a polynomial in
`f·r·x^ε` fixed with `P`) there is a function `nn` of finite support (of either sign) with `length_𝔩(Q_κ/⟨th⟩) ≤ nn(𝔩) + ρ_P·be(𝔩)`
at every `𝔩` and `Σ_𝔩 nn(𝔩)ϱ(𝔩) ≤ ρ_P·P_q·|κ|`; (I6) generators of `𝒲` with bounded sup norms and
without common zero on the open variety, short theta series of the weights `w_F`, `w_F + n·w_L`, `κ` with bounded sup norms,
and over the Gauss point of the space of coefficients: the restrictions of the chosen short theta series of weight `w_F`
form a basis on the generic zero-cycle (*interpolation*), the deep cusp forms lie in the span of the leading monomials in
the generic sections times those series and of the regularity terms (*division with jets*), the regularity terms are
spanned by the chosen ones, the leading monomials `s^α·s_0^{T−|α|}·θ_i` (`|α| < T − n`, `θ_i` the chosen series of weight `w_F`) are
linearly independent and independent of the regularity part, and `dim S_κ ≤ δ·binom(T + 2n + 6, n)` while the deep cusp forms
have dimension `≥ δ·binom(T + n, n)` (`S_κ` the cusp forms of weight `κ`); (I7) the three share inequalities:
`binom(T − 1, n)·δ ≤ rk M_κ`; at every finite place the regularity terms span a space of dimension `≤ C_s·n²·rk M_κ/T` over the
local function field (hence `r_z ≤ C_s·n²·rk M_κ/T` and `r_z ≤ r_q + C_s·n²·rk M_κ/T`); `r_q ≤ C_s·n²·rk M_κ/T` (`δ` the degree of the
image, `r_z`, `r_q` the ranks of the regularity part and of the quotient by the deep cusp forms; `C_s = 22`, for `n ≥ 2` and
`11n² ≤ T`; (I7) is a consequence of (I1) and (I6), see below); (I8) for all `j`: local point data on the generic zero-cycle
(its ring finite and reduced with a generator; the valuations at its points are those at integral points `y(ζ)` minus a
multiple of the depth; integral restrictions lift) and the arithmetic Bézout bound for the local heights of the zero-cycle;
for `j < m` moreover: an auxiliary boundary form `η`, that is an integer `i_η ≥ 1` and a nonzero cusp form `η` of scalar
weight `γ₀·i_η` (all entries of its dominant weight zero) which is not a zero divisor on the cusp forms (it vanishes
identically on no component), with `log sup_σ|η| ≤ C_f·Z^{A_f}·i_η` at every embedding `σ`, with `0 ≤ v(η)(y(ζ)) < ∞` and
`dep(y(ζ)) ≤ ν_dep(𝔩) + (c/2i_η)·v(η)(y(ζ))` at the specialisations `y(ζ)` of the points of
the zero-cycle, and the bound for the valuations of `η` along the zero-cycle (the second height inequality below); for
`j = m`: `dep(y) ≤ ν_dep(𝔩)` at every integral framed point `y`
above every `𝔩` (no boundary form, and (I5) is not asked).

*The two height inequalities of (I8).* Let `δ` be the number of the chosen short theta series `θ′_1, …, θ′_δ` of weight
`w_F` (the degree of the zero-cycle), and for a finite place `𝔩` let `I_𝔩` be the length at `𝔩` of the lattice of the
integral functions on the zero-cycle modulo the span of the restrictions of the `θ′_i`. For all `j`: every `I_𝔩` is finite
and
`2·Σ_𝔩 I_𝔩·ϱ(𝔩) ≤ δ·log δ + 2·Σ_{i≤δ} mean_σ log sup_σ|θ′_i| + (8/3)·n(n + 4)·δ·P_rw·|w_L| + 2(n + 4)(n + 1)·δ·(2G + 6P_H)·|w_L|`.
For `j < m`, with `e_ζ`, `f_ζ` the ramification index and the residue degree of the point `ζ` of the zero-cycle above `𝔩`:
`(1/i_η)·Σ_𝔩 ϱ(𝔩)·Σ_{ζ|𝔩} e_ζ·f_ζ·v(η)(y(ζ)) ≤ γ₀·((n + 1)·δ·(2G + 6P_H)·|w_L| + (4/3)·n·δ·P_rw·|w_L|) + δ·P_et`.

Then there are `r(𝔩) ≥ 0` with `Σ_𝔩 r(𝔩)ϱ(𝔩) ≤ rk(M_κ)·f·m·b·δ₂` such that for every `𝔩`, every integer `e ≥ T·ν_dep(𝔩)` and
every subspace `V′` of the forms of weight `κ` over the completion at `𝔩`:

`length_𝔩((M_κ ∩ V′)/(Θ_κ ∩ M_κ ∩ V′)) ≤ e·dim V′ + r(𝔩)`,

with `r(𝔩)` the sum of `binom(T − 1, n)` times the local height at `𝔩` of the generic zero-cycle relative to `Θ(s_F, w_F)` (with
a correction proportional to `T·c` from the boundary), the Gauss content at `𝔩` of a determinant of regularity terms, and
the length at `𝔩` of the quotient of `M_κ` modulo the deep cusp forms by the images of the chosen short theta series of
weight `κ`. The conclusion contains no metric. Moreover: (I1) holds under (N3), (N4) and (I3); and (I7) holds under (I1) and
(I6) when `n ≥ 2` and `11n² ≤ T`. These two derivations are this roadmap's own; [FormalProof] takes (I1) and (I7) from the
producers of the inputs.

*Route.* (I1): `Θ(s_K, κ) ⊂ M_κ` (N4) contains a set spanning the cusp forms over `𝕂` (N3), and by (I3) `Σ_σ log sup_σ(F)` is bounded
below on `M_κ ∖ {0}`; an `𝒪_𝕂`-submodule of a finite-dimensional `𝕂`-space on which `Σ_σ log‖x‖_σ` is bounded below off `0`, for norms
`‖·‖_σ` at the embeddings, is discrete in the real points (a sequence of nonzero elements tending to `0` would have every norm
tending to `0`), hence finitely generated. (I7): the first inequality counts the independent leading monomials
(`#{α ∈ ℕ^n : |α| < T − n} = binom(T − 1, n)`); the third is `ρ_P ≤ dim S_κ − dim(deep) ≤ δ·(binom(T + 2n + 6, n) − binom(T + n, n))`
with the ratio bound `d ≤ δ·binom(T + 2n + 6, n)`, `ρ + δ·binom(T − 1, n) ≤ d` ⟹ `ρ ≤ d·n(2n + 7)/T ≤ 5.5·n²·d/T` (`n ≥ 2`); the second
counts the monomials of degree `T − n` in the generic sections. The uniform index on subspaces is one length: `sup_W(idx(A ∩ W, B ∩ W) − E·dim W) = length(A/(A ∩ ϖ^{−E}B))`
(HermitianFormsAndLattices §4.0b (a), with the index `idx` and its API, the first item of HermitianFormsAndLattices §4.0b), unchanged under flat base
change of discrete valuation rings with the same uniformiser (HermitianFormsAndLattices §4.0b (c)), and the colength identity and the colength
inequality of HermitianFormsAndLattices §4.0b (b), through their corollary the descent lemma, bound that length by four colengths: of the jet part, of
the pole part, of the regularity part and of the quotient by the deep cusp forms. Over the Gauss point of the space of
coefficients choose `n + 1` generic combinations `s_0, …, s_n` of the generators of `𝒲`; a form of weight `κ` is divided by
`s_0^T` and expanded in jets of order `< T − n` along the generic zero-cycle `s_1 = ⋯ = s_n = 0`, integrality of jets being
defined through Hasse derivatives in the parameters `s_i/s_0` (these are not integral parameters of the model); the
valuation of the generic section `s_0` at every point equals the depth of the base locus, bounded through (N4) and (I8). (I6)
and (I7) say that the forms of weight `κ` are, up to a fraction `O(n²/T)` of the rank, such jets of forms of weight `w_F`. The
sums over the places are bounded by the height inequalities of (I8), by the Gauss content of a determinant against the
successive minima of the dual lattice (I2)–(I4), SlopesOfHermitianVectorBundles §§4.1–4.2 and the transference theorem
GeometryOfNumbersAndQuadraticArithmetic §4.4, and by (I5). The norm of (I2) is auxiliary. The routes of the two height
inequalities of (I8) are not given here.

*Check.* Values of one construction: `n_P⁰ = 8fr + 4`, `n_W⁰ = max(40, f·r·(r + 1))`,
`T₀ = max(40(n + 2), (n + 2)n_W + 2r, 11n², r + 2γ₀(fpq + 1))`, `γ₀ = 2·5⁴·r`, `C_s = 22`, `C_R = 7` (with `f² ≤ rd_E`, `r ≥ 8`,
`DF(w_L) ≥ 3`, `P = C_P·(f·r·x^ε)^{e_P}`, `e_P ≥ 12`, `(2fm)⁴·n_W ≤ P`); no smaller exponent `C_R` has been shown to suffice (the depth
bound of the theta functions with characteristics needs only `R_E ≥ rd_E²`); the weight `(n + 4)·w_L − w_F` of (N5) and the bound `T′(T′ + 2r) − 2` of (N1) are those
under which the reduction is read. The form `r_z ≤ r_q + C_s·n²·rk M_κ/T` of (I7) is the weak one; the reduction uses the bound for the
span of the regularity terms at every place. For `j = m` the two conditions of (N2) on `c` follow from
`T·γ₀·R_E·P·DF(w_L)² ≤ q_*` and `R_E⁴·P³·DF(w_L)² ≤ q_*`; `c₁ = 0` there because `q = 0`; and the second share inequality of
(I7) reads `r_z ≤ C_s·n²·rk M_κ/T` (`r_q = 0`). Without rational spanning in (N3) the
quotient `M_κ/(Θ_κ ∩ M_κ)` has infinite length. A theta lattice spanned by the class-sum lifts only (in place of all theta
rules for `𝒲`) need not be base-point free. The numbers `C_G`, `C_f`, `C_L`, `C_q`, `C_h` are real numbers that need not be
independent of `x`; they are constrained only through the domination conditions of (N0). `C_f` enters none of them, so the
bound for `sup|η|` holds for a suitable `C_f` and restricts nothing: the boundary form enters the reduction through the
second height inequality, with its constant `P_et ≤ P`. For the chain, `C_G = 1041·Z`, `A_G = 2`, `C_f = 200000`, `A_f = 2`,
`A_L = 2`.

*Sources:* The frame and the conclusion: [FormalProof],
`Development/AbelianVarietyTheory/Definitions/HeightFunctions/ConclOfInputs4.lean` (`GlobalTheory.FinalJoin.concl_of_inputs4`),
`Formalism/SharpRestriction/Divisibility/WeightFamilies.lean` (`Formalism.MainNotions.WeightFamilies.Wt.size`). (N0), the
number `f_E`: [FormalProof],
`Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/ConjEMemHostFIff.lean` (`Formalism.HC.HostRaw.condN`),
`Development/AutomorphicArithmetic/CyclotomicBounds/RamifiedDiscriminants/IsCond.lean` (`UpperTheory.Ram.isCond_condN`),
`Formalism/LocalToGlobal/UnitaryNorms/RealCyclotomicTwoPower.lean` (`Formalism.L2.Host.IsCond`). (N4′), the function
`ν_dep`, follows from [FormalProof],
`Development/AbelianVarietyTheory/Definitions/HeightFunctions/GrowthConstantBoundGcR.lean` (`GlobalTheory.RunJoin.nusR`),
`Formalism/SharpRestriction/Divisibility/AbelianOpenPart/OEOsInjective.lean` (`Formalism.MainNotions.DIV.Cons.nusOf`),
`Development/AbelianVarietyTheory/Definitions/Jets/ExistsSecTieFOfTies.lean` (`GlobalTheory.PtTie.nuWt`). (I2): [FormalProof],
`Formalism/SharpRestriction/GenusPolyhedralBounds/RelativeIndexClassSets/WeightedPrimeSumBound.lean`
(`Formalism.MainNotions.Gaps.EtaleWeightGaps.SupBoundByL2AtWeight`),
`Formalism/SharpRestriction/Divisibility/WeightFamilies.lean` (`Formalism.MainNotions.WeightFamilies.Wt.size`).
*Needs:* TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.8b, TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.18, RowTowerAndRallisIdentities §5.11, 8.19, ThetaChainsOnDefiniteUnitaryGroups §2.1, ThetaChainsOnDefiniteUnitaryGroups §2.4 (b), ThetaChainsOnDefiniteUnitaryGroups §2.9a; HermitianFormsAndLattices §4.0b (the index `idx` and its API, (a), (b) the colength
identity and the colength inequality with their corollary the descent lemma, (c)); PELModuli M1.7, M2.8;
AbelianSchemesAndArithmeticModuli A2.4 (for a principal polarisation `π_*L` is invertible: the theta section) and A5.3–A5.4
(the Appell–Humbert theorem; one theta function, up to a scalar, for a principal polarisation over `ℂ`); ShimuraCompactifications §§7.15 and 7.22 (Fourier–Jacobi expansions of Hodge-line sections; the Koecher principle); AutomorphicBundles §12.15 (Fourier–Jacobi expansions with vector coefficients);
SlopesOfHermitianVectorBundles §§1.2, 1.7, 4.1–4.2; GeometryOfNumbersAndQuadraticArithmetic §4.4 (transference).

### 8.19a′ The depth of the theta lattices

*Origin:* particular to this proof: a valuative bound at every integral point, including points of semi-abelian
reduction, for some theta rule of a given weight, by a chart depth plus a term `c·φ′_C(y)` from the monodromy form, with
its input (d) on the translates of the pull-back of the theta function by an element of `𝒪_E`; nearest published result: Pazuki (2012), after Bost and David, the integral spanning of the sections of `L^{⊗r²}` by
translates of the pull-back of a theta section by `[r]`, with a controlled index.

*Method of the formal proof:* a section with integral expansion on the uniformisation is matched to a given integral germ
up to a scalar of small valuation, written as an integral combination of translates of the pull-back of the theta
function by `α` (with `α·ᾱ = N`) by points killed by `ᾱ`, and an ultrametric choice selects one translate whose jet has
controlled valuation; at the type primes eigenfunctions of translations by torsion are used, and the jet is identified
with a theta rule times an integral factor. The published integral spanning treats the multiplication by an integer and
bounds the index globally through slopes, with no jets, no expansion on a uniformisation and no monodromy term.

In the setting of 8.19a:

(a) *The depth function.* For every multiplier, in particular for `M`: `0 ≤ ν_W(𝔩) ≤ DF(w_L)/(ℓ − 1)` and `ν_W(𝔩) = 0` for
`ℓ > DF(w_L)`; hence
`Σ_𝔩 ν_dep(𝔩)·ϱ(𝔩) ≤ DF(w_L)·(Σ_{ℓ≤DF(w_L)} log ℓ/(ℓ − 1) + log(Q·q·d) + 1)`.

(b) *Theta functions with characteristics attain the chart depth.* Let `w` be a weight with positive last entries,
`n(w) ≥ 2f·r`, `4·DF(w) + 4 ≤ q_*`, and, for `j < m`, `DF(w)·2√(2fm) < q_*` and `c ≥ r₀·((2fm)⁴·n(w) + 2(2fm)³)·DF(w)²/q_*`; let `s_W`,
`ν_dep` be those of 8.19a for `w_L = w`, and for a point `y` of semi-abelian reduction with character lattice `X` and monodromy
(valuation) form `Q_y` on it let `φ_C(y)` be the infimum of `Σ_b Q_y(x_b)` over the families `(x_b)` of vectors of `X` spanning a
finite-index `𝒪_E`-submodule (`φ_C(y) := 0` at a point of abelian reduction, and for `j = m`), and `φ′_C(y)` the infimum of `l(β_y)`,
`β_y(x, z) := Q_y(x + z) − Q_y(x) − Q_y(z)`, over the real linear functionals `l` on the symmetric forms `β` on `X` with `β(ax, z) = β(x, āz)`
(`a ∈ 𝒪_E`) that are integral on the integral forms and positive on the nonzero positive semidefinite ones; then
`φ′_C(y) ≤ 2·φ_C(y)`, `φ′_C(y) ≤ φ_C(y)` when `𝒪_E` contains an element `w₀` with `w₀ + w̄₀ = 1`, and `φ_C(y) ≤ r₀·rk_ℤ(X)³·φ′_C(y)`. Then
for every finite place `𝔩`
of `𝕂` and every algebraic integral framed point `y` above `𝔩` with an integral chart (with a saturated frame) and a
uniformised model, `dep_𝔩(y) ≤ ν_dep(𝔩) + c·φ′_C(y)`, hence `≤ ν_dep(𝔩) + c·φ_C(y)` when `w₀` exists. More precisely, if the character lattice `X` has a basis `(b_i)` with
`Q_y(b_i) ≤ Φ_y` and `|Q_y(b_i + z) − Q_y(b_i) − Q_y(z)| ≤ M₀·Q_y(z)`: (i) if `M = g₀g₁` is a unit at the point, `4·DF + 4 ≤ M` and
`DF·M₀ < M`, then `inf_f v(f(y)) ≤ (chart depth with multiplier M) + DF²·Φ_y/M`, the infimum over the theta rules `f` of
weight `w` (a theta rule of level `M` is a jet of a section of the `M`-th power of the polarisation: this is why the depth
carries the multiplier `M`); (ii) if the
residue characteristic is `g ∈ {g₀, g₁}` (`g′` the other), `DF < g − 1`, `4·DF + 4 ≤ g′` and `DF·M₀ < g′`, then
`inf_f v(f(y)) + v(N(w)) ≤ v(g)·DF/(g − 1) + r·rk(X)·Φ_y/(4g′) + 2·DF²·Φ_y/g′`; and there is such a basis with `rk X ≤ 2fm`,
`M₀ ≤ 2√(2fm)` and `Φ_y ≤ r₀·rk_ℤ(X)³·φ′_C(y)`.

(b′) *The depth of the integral forms away from the type primes.* Let `w = (a, n)` be a weight (8.19a) in which the last
entry of every `a⁺_τ` (`τ ∈ Φ`) is positive, with `n ≥ f·(p(p + 1) + q(q + 1))` and `n ≥ 2r`, and let `c_*` be a real number
with `4·DF(w) + 4 ≤ g_i`, `DF(w)·2√(2fm) < g_i` and `r₀·(2fm)³·(r·(2fm)/4 + 2·DF(w)²)/g_i ≤ c_*` for `i = 0, 1`. For an integral
framed point `y` over a complete discrete valuation ring of characteristic zero and residue characteristic `ℓ`, with
`v(ℓ) = 1`, put `dep_w(y) := min{v(f(y)) : f ∈ M_w}` and `ν_P(y) := Σ_Δ dep^{fac}_y(Δ^{g(Δ)})`: the sum over the `f·r` leading
principal minors `Δ` of the frames at the embeddings of `Φ` and of `cΦ` of the factor depths of
TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.18 (c), least over the integral charts of `y`, where for the minor `Δ` of
size `s` at the embedding `σ` the exponent is `g(Δ) := a_{σ,s} − a_{σ,s+1}` (entries counted from `1`; `a_{σ,s+1} := 0` for the
full minor). Let `ℓ ∉ {g₀, g₁}` be a prime and `b` a real number such that for every place `𝔩 | ℓ` of `𝕂` there is an integer
`A_𝔩 ≥ 0` with `A_𝔩 ≤ ν_P(y)` at every integral framed point `y` above `𝔩` and `ν_P(y) ≤ A_𝔩 + b` at the algebraic ones. Then
at every algebraic integral framed point `y` above `ℓ` with a uniformised model, `dep_w(y) ≤ b + c_*·φ′_C(y)`, `φ′_C` as in
(b) with `Q_y` in the normalisation `v(ℓ) = 1`. For `ℓ = g_i` and the same `w`, `c_*`: `dep_w(y) ≤ 1 + c_*·φ′_C(y)`.

(b″) *The oscillations of the theta weight of a divided weight.* Let `1 ≤ j ≤ m`, `(p, q) = (p_j, q_j)`,
`n_col := 8·(⌊f·(p(p + 1) + q(q + 1))/8⌋ + f·r + 1)`, and let `u` be a weight of the setting on `U(W_j)` (indices counted from
`1`): `u_τ` non-increasing, `u_{τ,k−1} = 0` (the anchor index; `k ≤ p + 1`), `u_{τ,p} − u_{τ,p+1} ≥ n_col + 1`, `|u_{τ,i}| ≤ B` for
an integer `B ≥ 0`, and `Σ_{i<k−1} u_{τ,i} ≤ S_g`, at every `τ`. Its *theta weight* is `w(u) := (a, n_col)` with
`a⁺_{τ,i} := u_{τ,i} − u_{τ,p} + 1` (`1 ≤ i ≤ p`) and `a⁻_{τ,c} := u_{τ,p} − u_{τ,r+1−c} − n_col − 1` (`1 ≤ c ≤ q`): `u` shifted by the
parallel weight that makes the last entry of `a⁺_τ` equal to `1`, with scalar weight `n_col`. Let `T := ⌈P²·D²·k/m⌉ ≥ 1` for a
real `P`, `E` a real number, and `C₁ ≥ 0`, `C₂ ≥ 1` with: `T·(B + 1) ≤ C₁·b` and `T·S_g ≤ C₁·b`; `log log x ≥ 1`;
`B₀·log log x ≤ C₂·E`; `log log k ≤ C₂·log log x`; `log r ≤ C₂·x^ε`; `log₂ Q_S ≤ C₂·x^ε` (`Q_S = f_E/(q·d)`,
ThetaChainsOnDefiniteUnitaryGroups §2.1); `T·r³ ≤ C₂·b`; and `r·log ℓ′/(ℓ′ − 1) ≤ C₂·m·x^ε` for the two primes `ℓ′` of the
auxiliary pair; with the standing relations `r + 1 = k + m`, `q_j ≤ m ≤ k`, `m ≥ 1`, `k ≥ 2` of the chain. Then there are a
finite set `S` of primes and numbers `e(ℓ) ≥ 0`, zero for `ℓ ∉ S`, such that for every prime `ℓ ∉ {g₀, g₁}` the hypothesis of
(b′) on `ν_P` holds for the weight `w(u)` with `b = e(ℓ)`, and
`T·Σ_{ℓ∈S} e(ℓ)·log ℓ ≤ 40·(4C₁(2C₁ + C₂ + 1)² + C₂(2C₁ + C₂ + 1) + 2C₁)·C₂·E`. With (b′) for `c_* = 1/2500`:
`dep_{w(u)}(y) ≤ φ′_C(y)/2500 + e(ℓ)` at the primes other than the type primes.

(c) *The boundary form.* Let `R > 1` be odd, `n ≥ 1`, and `η` the norm, over the level group `LevGrp(R⁴)` of level `R⁴`, of a
polynomial with integral coefficients in the null values of an integral theta section at the `R⁴`-torsion points, every
monomial of which is a product of exactly `n` null values, at torsion points that span the module of `R⁴`-torsion classes
of the lattice over `𝒪_E`. Then `η` is a form of scalar weight `n·|LevGrp(R⁴)|` (all entries of its dominant weight zero),
and at every point `y` with a uniformisation `v(η)(y) ≥ 2i_η·φ′_C(y)`, `2i_η := |LevGrp(R⁴)|/R⁴`. Consequently, with (b),
`dep_𝔩(y) ≤ ν_dep(𝔩) + (c/2i_η)·v(η)(y)`. The boundary form of 8.19a (I8) is the case `R = 5`, `n = r`: its scalar weight is
`2·5⁴·r·i_η = γ₀·i_η`. (In (c), `n` is the number of null values in each monomial, not the dimension `n` of 8.19a.)

(d) *Translates of the pulled-back theta function: the input of (b).* Let `y` be an algebraic integral framed point over a
complete discrete valuation ring `V` of characteristic zero, with an integral chart with a saturated frame and a uniformised
model with character lattice `X` and monodromy form `Q_y`; let `C` be an algebraically closed valued field containing the
fraction field of `V`, over which the Tate module of the generic fibre is identified with the lattice of the datum, with the
action of `𝒪_E` and the Weil pairings; let `n ≥ 1`, and let `ϑ_n` be the theta function of the frame on the `n`-fold product,
a section of its polarisation bundle whose expansion on the uniformisation has coefficients of valuation `≥ 0`. For a
polynomial `P` in the jet variables write `∇_N(h; P)` for the jet of a germ `h` against `P` with multiplier `N`.
(i) (*level prime to the residue characteristic*) Let `α ∈ 𝒪_E` with `α·ᾱ = N`, `(α, ᾱ) = 1` and `N` a unit of `V`; let `(b_i)`,
`Φ_y`, `M₀` be as in (b), and `D ≥ 0` an integer with `4D + 4 ≤ N` and `D·M₀ < N`. Then for every germ `f` with integral
coefficients in the `n` copies of the chart variables and every finite family of polynomials `P_i` with coefficients `a_i ∈ C`,
`v(a_i) ≥ 0`, `deg Σ_i a_iP_i ≤ D`, there are an index `i` and a point `x` of the product, each component of which is killed by
`ᾱ`, such that the translate by `x` of `α^*ϑ_n`, a section of the `N`-th power of the polarisation bundle, has, after
multiplication by a root of unity, a germ `h` at the frame with `v(∇_N(h; P_i)) ≤ v(∇_N(f; Σ_i a_iP_i)) + D²·Φ_y/N`.
(ii) (*at a type prime*) Let the residue characteristic be `g ∈ {g₀, g₁}` and `g′` the other, both odd, and `a, a′ ∈ 𝒪_E` with
`a·ā = g`, `a′·ā′ = g′`, `(a, ā) = (a′, ā′) = 1`. Let `s_1, …, s_n` be sections of the `g′`-th power of the polarisation bundle of
one copy with expansions of valuation `≥ 0`, and `x_1, …, x_n` points killed by `ā`. Then the germ at the frame of the product
over the copies of the translates by `x_b` of the `a^*s_b` (each multiplied by a root of unity) is a finite combination
`Σ_i c_i·h_i`, `v(c_i) ≥ 0`, of germs `h_i` of translates of `(a·a′)^*ϑ_n` by points each component of which is killed by
`ā·ā′`, multiplied by roots of unity.
Over `ℚ̄`, for a principal polarisation by a symmetric ample `L` and an even `r ≥ 2`, the translates of the pull-back by `[r]` of
a theta section, by representatives of `A[r²]/A[r]`, form a basis of `H⁰(A, L^{⊗r²})` (ArakelovGeometryAndAbelianHeights §5.7);
(i) and (ii) are forms of this for the pull-back by an element of `𝒪_E`, with valuations, on a uniformised model. Their
proofs are not given here. The integral form of the spanning, by the translates of the pull-back by `[r]` with a
controlled index and with bad reduction allowed, is Pazuki (2012), Proposition 2.5, Theorem 3.4 and Proposition 5.3,
after Bost and David; it is published for `[r]` only, not for an `α ∈ 𝒪_E` with `α·ᾱ = N`. Valuations of theta functions
on a uniformisation are studied in Foster, Rabinoff, Shokrieh and Soto (2018).

*Route.* (The comparisons of `φ_C` and `φ′_C`: for a family `(x_b)` spanning a finite-index submodule, `β ↦ Σ_b β(x_b, x_b)` is an
admissible functional (positive on a nonzero positive semidefinite `β`, whose radical is an `𝒪_E`-submodule), with value
`2·Σ_b Q_y(x_b)`; with `w₀`, `β ↦ Σ_b β(w₀x_b, x_b)` is admissible with value `Σ_b Q_y(x_b)`, since `β(w₀x, x) = β(x, w̄₀x)` and
`w₀ + w̄₀ = 1`; the third comparison comes from `rk_ℤ(X)` independent vectors with `Q_y ≤ r₀·rk_ℤ(X)²·φ′_C(y)`.) (a) In a saturated chart a jet of order `D` along the frame has valuation at most that of `D!`, which is
`≤ D/(ℓ − 1)` and `0` for `ℓ > D` (the bound for a jet in a saturated chart does not depend on the multiplier; `0 ≤ ν_W` is the
cut-off in the definition of the depth at a place); `Σ_{𝔩|ℓ} ϱ(𝔩)e_𝔩 = log ℓ`; above the type primes
`Σ_i log g_i/(g_i − 1) ≤ 1`; and
`Σ_ℓ c_ℓ(w_L)·log ℓ ≤ DF(w_L)·log Q + ⌈DF(w_L)/2⌉·log(qd)`. (b) (i): jets by integral sections of the `M`-th power on the product
of the copies, and (d) (i) with `α = π`, `N = M` (`π = a·a′` of (ii)).
(ii): write `π = a·a′` with `a·ā = g`, `a′·ā′ = g′` in `𝒪_K`, `(a, ā) = 1` (so `ā·ā′` generates the half-level ideal). The
embeddings split into those at which `a` vanishes at the place and those at which it is a unit, exchanged by complex
conjugation; write the highest weight vector as a product of leading minors of the first group in `r` copies of the
variables times a product of leading minors of the second group in further copies (harmonic: conjugate variables never
share a copy). *Second group:* the pull-back by `a` is étale in these directions; choose integral sections of the `g′`-th
power whose jets of order `≤ n_b` in copy `b` are the monomials dual to the frame along the diagonal monomial of the minors
(cost `n_b²Φ_y/g′`, `Σ n_b ≤ DF`); the jet of the minors is then a unit (`DF < g`). *First group:* for an `ā`-torsion point `x`, the
translate by `x` of the pull-back by `a` of a section is an eigenfunction of the translations by the `a`-torsion, with
character the Weil pairing with `x` (any character of the `a`-torsion, extended from the connected part of the `g`-torsion
projected to the `a`-torsion, is such a pairing); the `a`-torsion contains a finite flat subgroup scheme tangent, modulo `g`,
to the directions of the first group, so the germ `f` of the translate satisfies `D_e f ≡ dlog κ_x(e)·f (mod g)` for these
directions `e`. By the cokernel bound of the Hodge–Tate map in its chart form (HodgeTateLatticesAndLubinTateLogarithms §0.5f, from HodgeTateLatticesAndLubinTateLogarithms §0.5b: the cokernel is killed by `g^{1/(g−1)}`) and the pivot lemma TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.18 (b) there are characters whose differentials have
all leading `s × s` minors of valuation `≤ s·v(g)/(g − 1)`; take in each of the `r` copies a section with one dominant
Fourier term on the uniformisation, so that its germ has unit constant term after a scalar of valuation `≤ rk(X)·Φ_y/(4g′)`
(a coset of the character lattice has a representative with `Q_y ≤ ¼·Σ_i Q_y(b_i)`). Since `DF·v(g)/(g − 1) < v(g)` (the one
place where `DF < g − 1` is used), the congruence determines the valuation of the jet: `≤ DF·v(g)/(g − 1)`. By (d) (ii)
the composite of the two pull-backs and translations is again a translate of the theta function pulled back by `π = a·a′`;
its value at the frame is a theta rule times `N(w)` times an integral factor. The scalar: `v_𝔩(s_W) = v_𝔩(N(w))` above a type
prime, `= e_𝔩·c_ℓ(w)` elsewhere; the short basis is a reduced basis of the monodromy form over `𝒪_E`, and `c` is chosen for it.
(c) Over an algebraic closure the full level `R⁴` structure exists and `η(y)` is the product over the level group of the
values of the polynomial at the null values; the integral theta section has an expansion on the uniformisation with
coefficients of valuation `≥ 0`; each torsion point has a lift whose component `y_a` in the character lattice depends only
on its class, and the lifts of a spanning family span `X` modulo `R⁴X` over `𝒪_E`; a theta null value at a torsion point
with component `y_a` has valuation `≥ min_{χ∈X} Q_y(R²χ + y_a)/R⁴`; and `Σ_b min_χ Q_y(R²χ + y_b) ≥ φ_C(y)` by the definition of
`φ_C` (for representatives `z_b = R²χ_b + y_b` the `z_b` span `X ⊗ ℚ` over `E`). So every term of the polynomial, hence every
factor of the norm, has valuation `≥ φ_C(y)/R⁴`, which is `≥ φ′_C(y)/R⁴` by (b), `w₀` being that of the setting. That `η`
has scalar weight `n·|LevGrp(R⁴)|` is not derived here.
(b′) From the hypothesis at `𝔩`, one harmonic polynomial of the weight has, at every algebraic point above `𝔩`, depth with
the polarisation factor between `A_𝔩` and `A_𝔩 + b`, for every chart and multiplier
(TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.19f (o)). The theta rules built with it are cusp forms of valuation at
least `A_𝔩` at every integral point above `𝔩` and of valuation bounded below at every other place, so a scalar of valuation
`−A_𝔩` at `𝔩` that clears their denominators at the other places puts them in `M_w`; and (b) (i), `M = g₀g₁` being a unit at
`ℓ`, bounds their least valuation at `y` by `A_𝔩 + b + DF²·Φ_y/M` with `Φ_y ≤ r₀·(2fm)³·φ′_C(y)`. The bound at the type primes
is not given here. (b″) Three steps: bounds for the gaps of `a(u)` by `B` and `S_g`; a bound `e(ℓ)` for the oscillation at
each prime, by kind of prime (zero for `ℓ > 2B + 1`; the primes of `S_small`, where
`Σ_{ℓ∈S_small}(1 + vd(ℓ)/2)·log ℓ ≤ (3/2)·log₂ Q_S` is used; `q` and `d`; the other primes, through
TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.8c); and the sum over the primes `≤ 2B + 1`. The routes of the second and
third steps are not given here.

*Check.* With the route of (c) one has also `v(η)(y) ≥ 2i_η·φ_C(y)` when the classes of the torsion points of every
monomial span the character lattice modulo `R⁴`; this form is this roadmap's own and is not used.

*Sources:* ingredients (the basis by translates over an algebraically closed field, Mumford
1966, §1; the Weil pairing as a commutator; the cokernel bound of the Hodge–Tate map, Fargues). (b) (i):
[FormalProof], `Development/AbelianVarietyTheory/Proofs/JetHarmonics/IInfThetaGeneratorsLeLocalDepthPrimeToLevelStatement.lean`
(`GlobalTheory.T.iInf_theta_generators_le_local_depth_prime_to_level`); (b) (ii): [FormalProof],
`Development/AbelianVarietyTheory/Proofs/JetHarmonics/ThetaGeneratorsLeastValueOverLevelPrimeStatement.lean`
(`GlobalTheory.T.theta_generators_least_value_over_level_prime`); (d): [FormalProof],
`Development/AbelianVarietyTheory/Definitions/Jets/JetsOnCopiesCompatibleFrames.lean` (`GlobalTheory.PowGerm.RPointT`,
`GlobalTheory.PowGerm.GenPointT`), proved in
`Development/AbelianVarietyTheory/Proofs/JetHarmonics/PointStatementsOnCopiesHoldStatement.lean`
(`GlobalTheory.T.pointStatements_on_copies_hold`). (b′): [FormalProof],
`Development/AbelianVarietyTheory/Proofs/DivisorProofs/BaseLocusExponentLeOscillationNonTypePrimeStatement.lean`
(`GlobalTheory.T.baseLocusExponent_le_oscillation_nonTypePrime`),
`Development/AbelianVarietyTheory/Proofs/DivisorProofs/SupLatticeReferenceExponentThetaWeightLevelLeOneStatement.lean`
(`GlobalTheory.T.supLatticeReferenceExponent_thetaWeight_level_le_one`),
`Development/AbelianVarietyTheory/Definitions/Divisors/IsHomogeneousCompIdeal.lean` (`GlobalTheory.CompHt.depth_vw`).
(b″): [FormalProof], `Development/AbelianVarietyTheory/Proofs/DivisorProofs/SumPointOfWeightNumerical.lean`
(`GlobalTheory.RefSum.sumAt_of_sizes`), `Development/AbelianVarietyTheory/Definitions/Divisors/ESmall.lean`
(`GlobalTheory.RefSum.NumAt`), `Development/AbelianVarietyTheory/Definitions/Divisors/EightDvdNCol.lean`
(`GlobalTheory.RefSum.thA`).
*Needs:* TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.8b′, TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.18 (a), (b), 8.19a; HodgeTateLatticesAndLubinTateLogarithms
§§0.5b, 0.5f; AbelianSchemesAndArithmeticModuli A3.6 (the theta group and its commutator pairing);
ArakelovGeometryAndAbelianHeights §5.7 (the classical case of (d), not an input); ShimuraCompactifications
§§6.4–6.7 (degeneration data and Mumford's uniformisation); PELModuli M1.7; TaylorBoundsAndDepthsOnHeightTwoFormalGroups
§§4.8c, 4.18 (c), 4.19f (o); ThetaChainsOnDefiniteUnitaryGroups §2.1.

### 8.19a″ Spanning by short theta series and base-point freeness

*Origin:* adapted from the basis problem and from the jet form of Lefschetz's theorem for theta functions: spanning by
short theta series, at every frame a theta rule that is not zero there, and closure under products, at the levels of the
chain.

*Method of the formal proof:* for (b₀), products of three translates of `ϑ` generate the jets of order one at a point, as
in Lefschetz's theorem on the third power of a principal polarisation, and by induction sections of higher powers realise
every jet of bounded order; so for `3·deg P + 2 ≤ M` a section of the `M`-th power with the quasi-periodicity of `𝔐·L`
has a nonzero jet against `P`, it is a finite combination of the translates of `∏_b ϑ(z_b)` by points `y` with
`M·y_b ∈ 𝔐·L`, and by linearity of jets one of these translates has a nonzero jet; (b) follows frame by frame.

In the setting of
8.19a:

(a) for a weight `w` of even scalar weight `n(w) ≥ 4[E:ℚ]r + 4` with the last entry of `a⁺_τ` positive for every `τ ∈ Φ`, the
cusp forms of weight `w` are spanned over `𝕂` by the short theta series of weight `w`, and a finite spanning set of them has
logarithmic sup norm at most `(140r + 10)·L·DF(w) + 200·f·r·n(w)·L` at every embedding, `L` as in 8.17a;

(b) if `n(w) ≥ r` and `3·DF(w) + 2 ≤ g₀g₁`, some theta rule of weight `w` is nonzero at every frame of the open variety;
hence the generators of `Th^{all}(w)` have no common zero on the open variety;

(b₀) (*the input of (b), over `ℂ`*) At a frame of the open variety in normalised form, for `n` even, the odd level `M` with its
ideal `𝔐`, `𝔐·𝔐̄ = (M)`, and the theta function `ϑ` of the self-dual lattice `L` of the frame: for every nonzero harmonic
polynomial `P` in `n` copies with `3·deg P + 2 ≤ M` there is a point `y` of the `n`-fold product, with `M·y_b ∈ 𝔐·L` in every
copy `b`, such that the jet against `P`, at the frame, of the translate of `∏_b ϑ(z_b)` by `y` is not zero. Its proof is not
given here.

(c) (*products*) with the short theta series of all scalar weights taken at one auxiliary level and similitude level `1`: for
a short theta series `g` of weight `w` with `r ≤ n(w) < r + t` and a theta rule `f` of weight `w′`, `g·f` is an `𝒪_𝕂`-combination of
short theta series of weight `w + w′`; consequently `Th^{all}(w_L)^T·Th^{short}(w_F)` and `Th^{all}(w_L)^{T−n}·Th^{short}(w_F + n·w_L)`
lie in `Th^{short}(κ)` when `n(κ) = r + t` and `n(w_F) ≥ r`.

*Route.* (a) is 8.17a at the level of 8.19 (the short theta series of 8.19a are its theta series of weight `w` at this level).
(c) A theta rule is the short value of the standard lattice of rank `n(w′)` for the delta weight at one class; the product
of the values of two lattices is the value of their orthogonal sum for the block polynomial, whose normalising constant is
the product of the two up to a root of unity; orthogonality of the characters of the level quotient writes the delta
weight as a combination with roots of unity. For the consequence multiply one rule at a time: before the last factor the
scalar weight is `< r + t`, and it is `≥ n(w_F) ≥ r`. (b) At a frame, the theta rules of weight `w` are the jets of the
theta sections at the torsion points of level `g₀g₁` against harmonic polynomials; for `3·DF(w) + 2 ≤ g₀g₁` the jets of
order `DF(w)` of these sections at a point are not all annihilated by a nonzero harmonic polynomial of that degree, by
(b₀), so some rule is nonzero; a semilinear functional vanishing on the generators vanishes on `Th^{all}(w)`.

*Sources:* (the basis problem through the doubling method; theta bases). (b): [FormalProof],
`Development/AbelianVarietyTheory/Proofs/CuspFormEvaluations/ExistsThetaGeneratorReadingNeZeroAllFramesStatement.lean`
(`GlobalTheory.T.exists_thetaGenerator_reading_ne_zero_all_frames`, which takes one named statement as a hypothesis); (b₀): [FormalProof],
`Development/AbelianVarietyTheory/Proofs/CuspFormEvaluations/ExistsLevelTranslateJetNeZeroStatement.lean`
(`GlobalTheory.T.exists_level_translate_jet_ne_zero_alt`). *Needs:* RowTowerAndRallisIdentities §5.11, 8.17a, 8.19a;
AbelianSchemesAndArithmeticModuli A5.3–A5.4 (the theta function of a principal polarisation at a complex point).

### 8.19a‴ Lengths of a quotient through functionals with controlled heights

*Origin:* adapted from the product formula for a nonzero determinant with Hadamard's inequality: a bound for the lengths
of a quotient lattice at all finite places in terms of heights of spanning vectors and of functionals; elementary.

*Method of the formal proof:* the determinant `Dt = det(c_i(θ_j))` is not zero because the common kernel of the `c_i` is
`𝕂₁ ⊗ W`; at a place `w | 𝔩` the forms shifted by `s_i(w) + e(w|𝔩)·be(𝔩)` are integral on `M`, so the length at `w` of
`Q/⟨θ⟩` is at most `ord_w Dt + Σ_i s_i(w) + ρ·e(w|𝔩)·be(𝔩)`; lengths descend to `𝔩` and are averaged over `w | 𝔩` with the
residue degrees; globally the product formula replaces `Σ_w ord_w Dt·log Nw` by the archimedean absolute values of `Dt`,
which Hadamard's inequality on the columns bounds.

Let
`𝕂 ⊂ 𝕂₁` be number fields, `V` a finite-dimensional `𝕂`-space, `M ⊂ V` a lattice, `W ⊂ V` a subspace, `Q := M/(M ∩ W)`,
`ρ := rk Q`; `θ_1, …, θ_ρ ∈ M` spanning `V` modulo `W`; `c_1, …, c_ρ` linear forms on `𝕂₁ ⊗ V` whose common kernel is exactly
`𝕂₁ ⊗ W`. Let `be ≥ 0` on the finite places of `𝕂` and `s_i` on those of `𝕂₁` be of finite support, `a_i(σ)` reals at the
infinite places of `𝕂₁`, and `B_θ`, `C_arch`, `B_deg` reals with: (int) for `m ∈ M`, `w | 𝔩` and `c_i(m) ≠ 0`:
`ord_w c_i(m) + s_i(w) ≥ −e(w|𝔩)·be(𝔩)`; (sup) `mean_τ log S_τ(θ_j) ≤ B_θ` for a conjugation-invariant family of functions `S_τ` on
`V`; (arch) `log|c_i(θ_j)|_σ + a_i(σ) ≤ log S_{σ|𝕂}(θ_j) + C_arch` whenever `c_i(θ_j) ≠ 0`; (deg)
`(Σ_w s_i(w)·log Nw − Σ_σ [𝕂₁,σ:ℝ]·a_i(σ))/[𝕂₁:ℚ] ≤ B_deg`. Then there is `nn` of finite support on the finite places of `𝕂`
(of either sign) with `length_𝔩(Q/⟨θ⟩) ≤ nn(𝔩) + ρ·be(𝔩)` for every `𝔩` and
`Σ_𝔩 nn(𝔩)·log N𝔩/[𝕂:ℚ] ≤ ρ·(B_θ + C_arch + B_deg + ½·log ρ)`.

*Route.* `Dt := det(c_i(θ_j)) ≠ 0` by the kernel condition. Locally, over a discrete valuation ring, for `Q` free of rank `ρ`,
forms `c_i : Q → O` and `θ_j ∈ Q` with `det(c_i(θ_j)) ≠ 0`, `length(Q/⟨θ⟩) ≤ v(det(c_i(θ_j)))` (in a basis the matrix is a product,
and the matrix of the `c_i` has determinant of valuation `≥ 0`). After scaling `c_i` by a uniformiser to the power
`s_i(w) + e·be(𝔩)` this gives `length_w ≤ ord_w Dt + Σ_i s_i(w) + ρ·e(w|𝔩)·be(𝔩)`; lengths descend, `length_w = e(w|𝔩)·length_𝔩`; the mean
over `w | 𝔩` with the weights `f(w|𝔩)` gives the first claim with `nn(𝔩) := (1/[𝕂₁:𝕂])·Σ_{w|𝔩} f(w|𝔩)·(ord_w Dt + Σ_i s_i(w))`.
Globally the product formula turns `Σ_w ord_w Dt·log Nw` into `Σ_σ [𝕂₁,σ:ℝ]·log|Dt|_σ`; by (arch) and Hadamard's inequality on the
columns, `log|Dt|_σ ≤ −Σ_i a_i(σ) + Σ_j log S_σ(θ_j) + ρ·C_arch + (ρ/2)·log ρ`; (sup) and (deg) finish.

*Check.* `nn` may be negative; only `nn + ρ·be ≥ 0` holds, so the form with positive parts,
`Σ_𝔩 (length_𝔩 − ρ·be(𝔩))⁺·ϱ(𝔩) ≤ ρ(B_θ + C_arch + B_deg + ½·log ρ)`, does not follow: it would need the extra term `ρ·Σ_𝔩 be(𝔩)ϱ(𝔩)`.

*Sources:* [FormalProof], `ReciprocityTheory/ReductiveGroups/ArithmeticGeometry/Rationality/QCoreSt.lean`
(`ReciprocityTheory.ChartRestriction.G.FreeQuotientRank.QuotCoreStatement`, the statement, which takes the descent of
lengths `ReciprocityTheory.ChartRestriction.G.FreeQuotientRank.LenDescentStatement` as a hypothesis),
`ReciprocityTheory/ReductiveGroups/ArithmeticGeometry/Rationality/GlobSt.lean`
(`ReciprocityTheory.ChartRestriction.G.FreeQuotientRank.GlobalQuotStatement`, the global half, for a matrix in place of
`(c_i(θ_j))`, with the term `(ρ/2)·log ρ`).
*Needs:* Mathlib (`Matrix.det`; the product formula `NumberField.prod_abs_eq_one`); Tau Ceti `OrthonormalBasis.norm_det_le_prod_norm` (Hadamard's inequality).

### 8.19b Denominators of CM values at every prime

*Origin:* adapted from the algebraicity theorems of Damerell (1970) and Shimura and the integrality method of Katz (1976)
and Katz (1978) for CM values of Eisenstein series: an explicit lower bound for the valuations of normalised class terms
and toric sums at every prime, independent of the auxiliary set `Q`.

*Method of the formal proof:* for (i), a class term is reduced to the lattice sum of one lattice trivial above `l`; its
derivatives are jets, in the conjugate direction, of the Hilbert–Eisenstein series of a lattice of rank two over `𝒪_F` at
the diagonal point `ϑ₀`; the conjugate direction is replaced by a holomorphic one built from `G₂` and a Weierstrass value
at a torsion point of order prime to `l`, at the cost of powers of `W`; on the diagonal the holomorphic jets are values of
elliptic modular forms with expansions of controlled valuation at `l`, bounded at `ϑ₀` through the integrality of
`j(ϑ₀)` after division by a power of a twelfth root of `Δ(ϑ₀)`. The usual proofs work on the Hilbert modular variety, with
nearly holomorphic derivatives or with the splitting of the Hodge filtration at CM points; here the CM type induced from
`K` puts the CM point on the diagonal and everything is done with elliptic modular forms.

Let `E` be a CM field, abelian over `ℚ`, unramified over its maximal real subfield `F` (`[F:ℚ] = f ≥ 2`) at all finite places, in
which `2` is ramified, containing `K = ℚ(√−D)` for a prime `D > 4`, with the CM type `Φ` induced from `K` and `∏_{τ∈Φ}τ(ζ) = 1` for
every root of unity `ζ ∈ E`; let `s ≥ 1`, `κ : Φ → ℕ`, `|κ| = Σ_τκ_τ`. A *base conductor* is an ideal `𝔣 ≠ 0, 1` of `𝒪_F` whose prime
factors split in `E`, occur with exponent `≤ 2` and lie over odd primes unramified in `E` all of whose primes in `E` have degree
one; for such `𝔣` and every `𝔠 = 𝔣·∏_{𝔮∈Q}𝔮` below, the units of the order `𝒪_𝔠 = 𝒪_F + 𝔠𝒪_E` are those of `𝒪_F`. Let `Q` be a finite set
of places of `F` split in `E` and prime to `𝔣`, `χ` a unitary Hecke character of `E` trivial on `𝔸_F^×`, of infinity type
`(κ_τ + s)_τ`, of conductor `𝔣` away from `Q` and of level `≤ 1` at `Q`, and for a finite idele `y` let `L(y) := E ∩ y·𝒪̂_𝔠` and
`S_L(σ) := Σ_{x∈(L∖0)/𝒪_F^×}∏_τ τ(x)^{−(2s+κ_τ)}τ̄(x)^{κ_τ}|τ(x)|^{−2σ}`, continued to `σ = 0`. A *class term* is
`(χ_f(y)|y|^s)^{−1}·S_{L(y)}(0)`; it depends only on the class `[y] ∈ Pic(𝒪_𝔠)`. A *twisted toric sum* is
`T(χψ; 𝔠) := Σ_{[y]∈Pic(𝒪_𝔠)}ψ([y])^{−1}(χ_f(y)|y|^s)^{−1}S_{L(y)}(0)` for a character `ψ` of `Pic(𝒪_𝔠)`. Let `ϖ_K` be a twelfth root of
`Δ(𝒪_K)` (`Δ = g₂³ − 27g₃²`), and for a number `T` put
`T^♮ := |d_F|^{(2s−1)/2}·∏_τΓ(2s + κ_τ)·(2π/√D)^{|κ|}·T/ϖ_K^{2sf+2|κ|}`; write `S_L^♮` for `S_L(0)^♮`. For a prime `l` let `c_E(l)` be the largest `l`-adic denominator exponent of the numbers
`2^{−f}ζ_F(C, 1 − 2s)` (`C` the ideal classes of `F`; these values are rational, IntegralIwasawaTheory §6.0 for the
Hilbert class field of `F`), `a(l)` the largest exponent of `𝔣` above `l`,
`c(l) := a(l)` if `l` lies under `𝔣` and `c(l) := v_l(d_E)/[E:ℚ]` otherwise, and
`n(l) := 2sf·c(l) + |κ|·(2c(l) + ½[l = D])` (so `n(l) = 0` unless `l ∣ 𝔣·d_E`, and `n(l) ≤ 3(sf + |κ|)(1 + c(l))`).

Prove that for `T` a class term or a twisted toric sum `T^♮` is algebraic, and:

(i) for every prime `l` and every `Q` prime to `l`, at every place above `l` (normalised by `v(l) = 1`):

`v_l(T^♮) ≥ −( c_E(l) + n(l) + (2sf + 2|κ|)·a(l) )`;

in particular the bound does not depend on `Q`, and at `l ∤ 𝔣·d_E` not on `κ`;

(ii) with `k = 2s`: `c_E(l) ≤ f·v_l(2) + m(l)`, where for odd `l`, `m(l) = 0` if `(l − 1) ∤ fk` and `m(l) = 1 + v_l(fk)` if `(l − 1) ∣ fk`, and `m(2) = 2 + v₂(fk)`; and `Σ_l c_E(l)·log l ≤ fk·log(fk + 1)` when `fk ≥ 16`.

*The form of the formal proof.* [FormalProof] states (i) with
`n(l) = 2sf·c(l) + |κ|·(2c(l) + 1 + [l = 2] + ½[l = D])` at the primes with `c(l) ≠ 0`:
`Development/AbelianVarietyTheory/BlockTheory/DivisorBase/VpBounds.lean`
(`GlobalTheory.IndefiniteRowSideFullHecke.ClassZetaValuationBounds.ToricDenominator`), derived there, from three named
statements that it takes as hypotheses, by `GlobalTheory.ToricDenomRow.toricDenominator`
(`Development/AbelianVarietyTheory/Proofs/DivisorProofs/ToricDenominatorOfZetaDenominators.lean`); the smaller exponent above is this
roadmap's, by the route. The uses (8.19d (iii)) need only that the exponent does not depend on `Q`.

*Route.* (i): (0) *Reduction to one lattice.* Fix `l` and `Q` prime to `l`. Every class of `Pic(𝒪_𝔠)` contains an idele `y` with
`y_w = 1` at all `w ∣ l`; for such `y` the factor `(χ_f(y)|y|^s)^{−1}` is an `l`-unit, a class term does not depend on the
representative, and a twisted toric sum is a finite sum of class terms of `χψ`. By the ultrametric inequality it suffices to
bound `S_L^♮` for `L = L(y)`, `y` trivial above `l`. For `z` in the unit polydisc of `ℂ^Φ` put
`g_L(z) := c_F·Σ_{x∈(L∖0)/𝒪_F^×}∏_τ(τ(x) + z_τ·τ̄(x))^{−2s}`, `c_F := ((2s − 1)!)^f|d_F|^{(2s−1)/2}` (for `s = 1` with Hecke's
factor `∏_τ|τ(x) + z_τ·τ̄(x)|^{−2σ}`, continued to `σ = 0`); then
`∂_z^κg_L(0) = (−1)^{|κ|}|d_F|^{(2s−1)/2}∏_τΓ(2s + κ_τ)·S_L(0)`, so `S_L^♮ = ±∂_z^κg_L(0)·(2π/√D)^{|κ|}/ϖ_K^{2sf+2|κ|}`.

(1) *A lattice of rank two over `𝒪_F` at a diagonal point.* Let `θ := (−1 + √−D)/2` if `D ≡ 3 (mod 4)` and `θ := √−D` otherwise,
`D′ := |d_K|`, and `ϑ₀ ∈ ℍ` the common image of `θ` under the elements of `Φ`, so that `𝒪_K = ℤϑ₀ + ℤ` in `ℂ`. There are integers
`M`, `M′` prime to `l` such that `L′ := {(x₀, x₁) ∈ F² : x₀θ + x₁ ∈ M·D′·L}` satisfies `N·𝒪_F² ⊂ L′ ⊂ 𝒪_F²` with
`N := M′·l^{v_l(D′) + a(l)}`, and `x₀²/D′`, `x₁²/D′` are integral for `(x₀, x₁) ∈ L′` (`M·L ⊂ 𝒪_E` because `y` is trivial above `l`;
`𝒪_𝔠 ⊃ M₁·l^{a(l)}·𝒪_E` with `l ∤ M₁`; and `x₀θ + x₁ ∈ D′𝒪_E` forces the claim on the coordinates). For pairs `(b_τ, a_τ)_{τ∈Φ}` of
complex numbers put `G_{L′}(b, a) := Σ_{x∈(L′∖0)/𝒪_F^×}∏_τ(τ(x₀)b_τ + τ(x₁)a_τ)^{−2s}` (Hecke's convention for `s = 1`): it is
homogeneous of degree `−2s` in each pair, and `g_L(z) = (MD′)^{2sf}·c_F·G_{L′}((ϑ₀ + z_τ·ϑ̄₀)_τ, (1 + z_τ)_τ)`. So `∂^κg_L(0)` is
`(MD′)^{2sf}c_F` times the derivative, of order `κ_τ` in the `τ`-th pair, of the Hilbert–Eisenstein series of `L′` at the
diagonal point `(ϑ₀, 1)` in the direction `(ϑ̄₀, 1)`.

(2) *The conjugate direction through a holomorphic one.* For `ϑ ∈ ℍ` and `C ∈ ℂ` let `B_C := ((2πi)²C·ϑ − 2πi, (2πi)²C)`. Then
`(ϑ̄, 1) = (Im ϑ/π)·(B_C + λ·(ϑ, 1))`, `λ := π/Im ϑ − (2πi)²C`, and for a function `H` of one pair `v`, homogeneous of degree
`−2s`: `∂^n_{B+λv}H(v) = Σ_{m≤n}r(n, m)·λ^{n−m}·∂^m_BH(v)`, `r(n, m) := (−1)^{n−m}binom(n, m)(2s + m)(2s + m + 1)⋯(2s + n − 1)`
(from `H(v + x(B + λv)) = (1 + λx)^{−2s}H(v + x(1 + λx)^{−1}B)`). With
`h_μ^C(ϑ) := (2πi)^{−(2sf+2|μ|)}·c_F·∂^μ_{B_C}G_{L′}|_{(ϑ,1)}` (order `μ_τ` in the `τ`-th pair, the same direction in every pair):

`(2πi)^{−(2sf+2|κ|)}·(π/Im ϑ)^{|κ|}·c_F·∂^κ_{(ϑ̄,1)}G_{L′}|_{(ϑ,1)} = Σ_{μ≤κ}∏_τr(κ_τ, μ_τ)·(λ/(2πi)²)^{|κ−μ|}·h_μ^C(ϑ)`.

Take `C = C_u(ϑ) := (G₂(ϑ) + ℘_ϑ(t_u))/(2πi)²`, where `G₂(ϑ) = Σ_nΣ′_m(mϑ + n)^{−2}`, `℘_ϑ` is the Weierstrass function of `ℤϑ + ℤ`
and `t_u := (u₀ϑ + u₁)/N` for a nonzero `u ∈ (ℤ/N)²` of order prime to `l` (`M′` may be taken with a factor `> 1`). Then
`λ/(2πi)² = −W_u(ϑ)`, `W_u(ϑ) := (G₂^*(ϑ) + ℘_ϑ(t_u))/(2πi)²`, `G₂^*(ϑ) := G₂(ϑ) − π/Im ϑ`. (For `C = G₂/(2πi)²` the direction `B_C` is
the pair of quasi-periods of `ℤϑ + ℤ`; the Weierstrass value is added so that the expansion of `C_u` is integral at `2` and `3`.)

(3) *A family of elliptic modular forms.* For `α ∈ GL₂(ℤ/N)` let `L′_α := L′·α̃ + N𝒪_F²` (`α̃` an integral lift) and let
`h_{μ,α}` be the function `h_μ^C` formed with `L′_α` and `C = C_{uα}`. Each `h_{μ,α}` is holomorphic on `ℍ`, and
`h_{μ,α}|_{2sf+2|μ|}γ = h_{μ,αγ}` for `γ ∈ SL₂(ℤ)`: `G_{L′}` at the pair `(aϑ + b, cϑ + d)` is `G_{L′γ}` at `(ϑ, 1)`, and
`C_u(γϑ) = (cϑ + d)²·C_{uγ}(ϑ) − c(cϑ + d)/(2πi)` (`G₂` is quasi-modular, `℘` at torsion points modular of weight `2`), which says
that the directions `B_C` correspond up to the factor `(cϑ + d)²`.

(4) *Expansions and their size at `l`.* Every lattice `N𝒪_F² ⊂ L″ ⊂ 𝒪_F²` is `{(x₀, x₁) : x₀ ∈ 𝔟, x₁ − x₀ξ₀ ∈ (𝔡_F𝔞)^{−1}}` for
fractional ideals `𝔞`, `𝔟` and some `ξ₀ ∈ F`. By the expansion of the Hilbert–Eisenstein series (constant term
`A(0) = 2^{−f}ζ_F([𝔞]^{−1}, 1 − 2s)`, the other coefficients `A(ξ)` integers supported on the totally positive `ξ ∈ 𝔞𝔟`, after division
by `((2πi)^f|d_F|^{1/2}N𝔞)^{2s}`), the function `h_μ^C` of `L″` has the expansion in `q^{1/N}`, `q = e^{2πiϑ}`:

`(|d_F|^{1/2}N𝔞)^{2s}·Σ_{ν≤μ}∏_τ(−1)^{ν_τ}r(μ_τ, ν_τ)·C(ϑ)^{|μ−ν|}·Σ_ξA(ξ)·e^{2πi Tr(ξξ₀)}·∏_ττ(ξ)^{ν_τ}·q^{Tr ξ}`.

At a place above `l`: `A(0)` has valuation `≥ −c_E(l)`; if `(0, M l^b) ∈ L″` with `l ∤ M` and the first coordinates of the vectors
of `L″` have valuation `≥ −ρ₀`, then `τ(ξ)` has valuation `≥ −(b + v_l(d_F)/f + ρ₀)` for `ξ ∈ 𝔞𝔟` (`M l^b𝔞 ⊂ 𝔡_F^{−1}`, and an element of
`𝔡_F^{−1}` has valuation `≥ −v_l(d_F)/f` at every place above `l` because `F` is Galois over `ℚ`), and `(|d_F|N𝔞²)^s` has valuation
`≥ −(s·v_l(d_F) + 2sbf)`. The expansion of `C_u` is `Σ_{n∈ℤ}q^nw/(1 − q^nw)²`, `w = e^{2πit_u}`: its coefficients lie in `ℤ[ζ_N]`
except the constant term `ζ/(1 − ζ)²` when `u₀ = 0` (`ζ = e^{2πiu₁/N} ≠ 1`, of order prime to `l`); so it is integral at `l`. These
hypotheses hold for every `L′_α` with `b = v_l(D′) + a(l)` and `ρ₀ = −v_l(D′)/2` (step (1)). Hence every coefficient of every
`h_{μ,α}` has valuation `≥ −(c_E(l) + s·v_l(d_F) + 2sbf + |μ|·ρ)` for any `ρ ≥ max(0, b + v_l(d_F)/f + ρ₀)`.

(5) *The `q`-expansion principle for a permuted family.* Let `(f_i)_{i∈ι}` be finitely many functions on `ℍ` with `f_i|_wγ = f_{iγ}`
for a right action of `SL₂(ℤ)` on `ι`, each with an expansion `Σ_{n≥0}a_n(i)q^{n/N}` on `ℍ` with coefficients in a subring `R ⊂ ℂ`.
If `j(ϑ₀)` is integral over `R` and `ω^{12} = Δ(ϑ₀)` (the discriminant function), every `f_i(ϑ₀)/ω^w` is integral over `R`: the
elementary symmetric functions of the `f_i^{12}` are invariant under `SL₂(ℤ)` with coefficients in `R`, hence of the form
`Δ^{kw}P_k(j)` with `P_k ∈ R[X]`. Applied with `R` the algebraic numbers integral at a place above `l`, after scaling by an
algebraic number: coefficients of valuation `≥ −r` give `v(f_i(ϑ₀)/ω^w) ≥ −r`. The hypothesis is on all members of the family
(all cusps); no condition relates `N` to `l`.

(6) *The CM point.* (i) `j(ϑ₀)` is an algebraic integer: `ϑ₀` is fixed by an integral matrix of non-square determinant, and
the modular polynomial of that degree (ModularCurvesPartII §5.6) has leading coefficient `±1` on the diagonal. (ii) With `ω := ϖ_K/2πi` (so `ω^{12} = Δ(ϑ₀)`),
the number `W := W_u(ϑ₀)/ω² = (G₂^*(𝒪_K) + ℘_{𝒪_K}(t_u))/ϖ_K²` has valuation `≥ −w(l)` above `l`, where `w(2) = 1` if `D ≡ 3 (mod 4)`
and `w(2) = 2` if `D ≡ 1 (mod 4)`, `w(D) = ½`, and `w(l) = 0` otherwise. Three facts give this. For nonzero torsion points `P`, `P′`
of `ℂ/𝒪_K` of order dividing `m`, `m²(℘(P) − ℘(P′))/ϖ_K²` and `12m²℘(P)/ϖ_K²` are algebraic integers ((5) for the family of
`℘`-values at the `m`-torsion points, and (i)). For `α ∈ 𝒪_K` of norm `n`: `(α² − n)·G₂^*(𝒪_K) = Σ_{T∈α^{−1}𝒪_K/𝒪_K, T≠0}℘(T)`, so that
`(α² − n)·W − (α² − 1)·℘(t_u)/ϖ_K² = Σ_T(℘(T) − ℘(t_u))/ϖ_K²` is integral at `l` when `l ∤ n` (the order of `t_u` being prime to `l`).
Take `α = √−D` for `l ≠ D` (and both `α = 1 ± √−D` when `l = 3`, `D ≡ 1 (mod 3)`), and `α = 1 + √−D` for `l = D`.

(7) *Assembly.* By (0)–(2) at `ϑ = ϑ₀`:

`S_L^♮ = ±(MD′)^{2sf}·(2Im ϑ₀/√D)^{|κ|}·Σ_{μ≤κ}∏_τr(κ_τ, μ_τ)·(−W_u(ϑ₀)/ω²)^{|κ−μ|}·h_μ(ϑ₀)/ω^{2sf+2|μ|}`,   `2Im ϑ₀/√D ∈ {1, 2}`.

Let `ρ := 2c(l) + 2a(l) + v_l(D′)/2`. It satisfies the condition of (4) (`v_l(d_F) ≤ f·c(l)`) and `ρ ≥ w(l)` (at `l = 2` because
`c(2) ≥ ½`: `2` is ramified in `E` and `E` is Galois over `ℚ`). By (3)–(6) every term of the sum has valuation
`≥ −(c_E(l) + s·v_l(d_F) + 2sf(v_l(D′) + a(l)) + |κ|ρ)`, and with the two factors in front
`v_l(S_L^♮) ≥ −( c_E(l) + s·v_l(d_F) + (2sf + 2|κ|)·a(l) + |κ|·(2c(l) + ½[l = D]) )`, which gives the claim since
`s·v_l(d_F) ≤ 2sf·c(l)`. Algebraicity is contained in (5) and (6), all coefficients being algebraic. Not given here: the
expansion of the derivatives in (4) from that of the Hilbert–Eisenstein series (termwise differentiation, holomorphy), Hecke's
continuation used for `s = 1`, and two general statements that are steps of this roadmap: the expansion of the Hilbert–Eisenstein
series of every lattice `N𝒪_F² ⊂ L″ ⊂ 𝒪_F²` used in (4), with the additive shift `ξ₀` and weight two included
(NoncommutativeAndEquivariantIwasawa §6.1, step 0(c), has the series of a finite-order character of a ray class group, depleted at a
finite set of places and without additive shift), and the isogeny formula for `G₂^*` of (6) (ii). The other general statements cited in (4)–(6) are those of
the suppliers named under *Needs*. The route of (ii) is not given here.

*Check.* At `l ∤ 𝔣·d_E` with `c_E(l) = 0` the bound of (i) says `T^♮` is `l`-integral, uniformly in `Q` and `κ`: the uniformity that
8.19d (iii) needs. Numerically (twelve digits), with `E₂^* = E₂ − 3/(π·Im ϑ)`, `G₂^* = (π²/3)E₂^*`: for `D = 7`,
`ϑ₀ = (1 + √−7)/2`: `E₂^*(ϑ₀)⁶/Δ(ϑ₀) = −3⁶/7³` (and `E₂^*E₄/E₆ = 5/21`), that is `(G₂^*(𝒪_K)/ϖ_K²)⁶ = −2^{−12}·7^{−3}`. So `G₂^*(𝒪_K)/ϖ_K²` has
valuation `−½` at `7`: the term `½[l = D]` is attained. Its valuation at `2` is `−2`, while `Σ_PW_P⁶ = −1142/7³` over the eight
points `P` of order `3` (`W_P = (G₂^*(𝒪_K) + ℘(P))/ϖ_K²`) has no denominator at `2`: consistent with (6) (ii), which allows `W_P`
the denominator `2` where `G₂^*/ϖ_K²` alone has `4`. The isogeny formula of (6) holds for `α = ϑ₀` (norm `2`, the one point
`T = ϑ̄₀/2`) and for `α = √−7` (six points). For `D = 11`: `(G₂^*(𝒪_K)/ϖ_K²)⁶ = −2⁶·3^{−6}·11^{−3}`, a denominator `3` that `W_P` must
lose. Without the condition on the primes of `𝔣` the units of `𝒪_𝔠` can be larger: for `F = ℚ(√7)`, `E = F(i)` and `𝔣` a prime of
`F` above `2` split in `E`, `i ∈ 𝒪_𝔣^×`.

*Sources:* (Damerell 1970, §2, Theorem 1, p. 290: algebraicity of the values of Hecke `L`-functions of an order of an imaginary quadratic field, normalised by the periods; Shimura; Katz). *Needs:* 8.5; LFunctions Layer 6 (continuation of the lattice sums); for the functional equation of the partial zeta
functions of a totally real field, LFunctions Layer 2 (the partial zeta functions) and Layer 5 (the orthogonality
reconstruction and the functional equation of a finite-order Hecke character) at the trivial modulus of `F`, and for their
rationality at `1 − 2s` IntegralIwasawaTheory §6.0 (the Siegel–Klingen rationality, for the Hilbert class field of `F`);
the expansion of the Hilbert–Eisenstein series of a pair of ideals with an additive shift, weight two included (a step of this
roadmap not given here, see the route);
modular forms of level one with coefficients in a ring (`f = Δ^wP(j)`; the field case, `F₁ = ℚ(j)` with the `q`-expansion
principle for coefficient subfields, is ImaginaryQuadraticClassNumber H3.1, and the integral algebraic case is
EllipticCohomology Layer 1); ModularCurvesPartII §5.6 (the modular polynomial) for the integrality of `j` at CM points;
Weierstrass functions: ModularCurvesPartII §1.4a (the quasi-period homomorphism and Legendre's relation), the isogeny formula
for `G₂^*` (a step of this roadmap not given here, see the route), and ModularForms §10D (the complex Tate curve and the division values) for the `℘` part of the expansion of
`(G₂ + ℘(t))/(2πi)²` at torsion points and of its transformation law; for (ii), IntegralIwasawaTheory §6.0 (the rationality of
the partial zeta values of a totally real field at negative integers and the Deligne–Ribet congruences between them).

### 8.19c Galois equivariance of toric ratios

*Origin:* adapted from Goldstein and Schappacher (1981), as presented in Goldstein (1981–1982), Proposition 1.8,
Théorèmes 2.1, 2.2 and Corollaires 2.5, 2.6: the action of the automorphisms of `ℂ` on normalised Eisenstein numbers at
torsion points of CM lattices and on normalised partial Hecke `L`-values of an imaginary quadratic field; here for the
ratios of twisted toric sums over the class group of an order of a CM field `E ⊃ K` with the CM type induced from `K`,
the lattice sums of `E` being reduced to values of elliptic modular forms at the CM point of `K`; for the critical values
of Hecke `L`-functions of CM fields: Shimura (1975) and Katz (1978) (algebraicity), Blasius (1986) (Deligne's conjecture
for Hecke characters of CM fields).

*Method of the formal proof:* a twisted toric sum divided by the untwisted one, a nonzero Hecke `L`-value, is algebraic; a
transport statement for single normalised lattice sums (which takes as a hypothesis the transport of the Weierstrass data
of `𝒪_K`, supplied by the main theorem of complex multiplication), applied to numerator and denominator, cancels the
periods and the factors depending on the idele and leaves the inverse of the
conjugated character at its class.

Let `E` be a CM field, unramified over its maximal real subfield `F` at all finite places, containing an imaginary quadratic field `K = ℚ(√−D)` (`D > 0` arbitrary), with the CM type `Φ` induced from `K`; let `s`, `κ`, the base conductor `𝔣`, `Q`, `χ`, the class terms, the twisted toric sums and `ϖ_K` be defined as in 8.19b, with all `κ_τ ≥ 1` (that `E` is abelian over `ℚ`, that `D` is prime and that `2` is ramified in `E` is not asked here). Suppose `T(χ; 𝔣) ≠ 0`. Then for every character `ψ` of `Pic(𝒪_{𝔣Q})` the ratio `T(χψ; 𝔣Q)/T(χ; 𝔣)` is algebraic; for every automorphism
`g` of `ℂ` fixing `τ(E)` for all `τ ∈ Φ` and the values of `χ_f|·|^s`, with `g|_{K^{ab}} = art_K(t)^{−1}` for a finite idele `t` of
`K` (the reciprocity map of the Conventions, sending uniformisers to geometric Frobenius elements; the lattice moved by `g`
is then `t^{−1}𝒪_K`; with the arithmetic normalisation the condition reads `g|_{K^{ab}} = art_K(t)`):

`g( T(χψ; 𝔣Q)/T(χ; 𝔣) ) = ψ^g([t])^{−1}·T(χψ^g; 𝔣Q)/T(χ; 𝔣)`,

`[t]` the class of `t` in `Pic(𝒪_{𝔣Q})`, `ψ^g = g∘ψ`.

*Route.* For one lattice sum: the main theorem of complex multiplication for `ℂ/𝒪_K` in Weierstrass form (`g` transports
`g₂/ϖ_K⁴`, `g₃/ϖ_K⁶` and the values of `℘/ϖ_K²`, `℘′/ϖ_K³` at torsion points from `𝒪_K` to the lattice `t^{−1}𝒪_K`, with a second
period `ϖ₁` depending only on `(g, t)`); write both lattice sums by steps (0)–(2) of 8.19b, at `ϑ₀` for `𝒪_K` and at the point `ϑ₁` of the lattice `t^{−1}𝒪_K` (the lattice `L′` being replaced by its twist by the matrix `A ∈ GL₂(ℤ/N)` of `t` on the `N`-torsion); `g` maps `W_u(ϑ₀)/ω₀²` to `W_{uA}(ϑ₁)/ω₁²` and the normalised `E₄`, `E₆` to those at `ϑ₁` (the main theorem in Weierstrass form, with the isogeny formula for `G₂^*`); the `q`-expansion coefficients of the family `h_{μ,α}` are conjugated by `g` into those of `h_{μ′,α·diag(1,a)}`, where `g(ζ_N) = ζ_N^a` and `μ′` is `μ` moved by `g` (the coefficients are sums of roots of unity times products `∏τ(ξ)^{ν_τ}`, and a rational constant term); and for a family permuted by `SL₂(ℤ)` whose coefficients are conjugated in this way, `g(h_α(ϑ₀)/ω₀^w) = h′_{αA}(ϑ₁)/ω₁^w`, because the values of `℘` and `℘′` at two basis points of the `N`-torsion separate the members of the family at `ϑ₀` and are transported by the main theorem; this
gives `g(S^♮_{L(y)}) = |t|^{−|κ|}·S^♮_{L(yt^{−1})}` with the period `ϖ₁`. Sum over the classes and reindex by `[y] ↦ [y][t]^{−1}`; in
the ratio the periods `ϖ_K, ϖ₁`, the factor `|t|^{−|κ|}` and `χ_f(t)|t|^s` cancel (`g` fixes the type and the values of `χ`). The route is given at the level of its steps only; not given here: the transport of `G₂^*`, `E₄`, `E₆` and of the matrix of `t` on the torsion by the main theorem, the conjugation of the coefficients of the family, the conjugation form of the `q`-expansion principle for families permuted by `SL₂(ℤ)`, and the fact that the Weierstrass values at two basis torsion points separate `GL₂(ℤ/N)`.

*Check.* `ψ = 1`: the identity says that `g` fixes `T(χ; 𝔣Q)/T(χ; 𝔣)`, the product of the Euler corrections of 8.19d (i) (not `1`
in general: `1/2` for one place with `Y = 1`, `N𝔮 = 2`, `s = 1`), whose entries are values of `χ`. `g` trivial on `K^{ab}` (`[t] = 1`): the ratio is fixed by every `g` fixing `ψ`'s values.

*Sources:* (Shimura's reciprocity law, here through the main theorem of complex multiplication of ComplexMultiplicationAndExplicitReciprocity §2.2; the algebraicity of the normalised lattice sums of an order of an imaginary quadratic field is Damerell 1970, §2, Theorem 1, p. 290). [FormalProof],
`Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/IsValueTiedOfIsToricElt.lean` (`GlobalTheory.ToricRational.RatioConj`), derived
there from `GlobalTheory.IndefiniteRowSideFullHecke.ToricSymbols.ToricRatioConjugates` by
`GlobalTheory.ToricRatioBridge.ratioConj_of_toricRatioConjugates`,
`Development/AbelianVarietyTheory/Proofs/DivisorProofs/RatioConjOfToricRatioConjugates.lean`. `RatioConj` is stated for the
fields of its hosts only (`Formalism.BasicNotions.Host`, `Formalism/LocalRingCardinality/DataHost.lean`: `K = ℚ(√−d)` with `d` a
prime `≡ 7 (mod 16)`, `E` abelian over `ℚ`); `ToricRatioConjugates`, in
`Development/AbelianVarietyTheory/BlockTheory/DivisorBase/ToricSymbols.lean`, is the form above for every `E ⊃ K`, with
`T(χ; 𝔣) ≠ 0` among its conclusions rather than its hypotheses, and [FormalProof] proves it by
`GlobalTheory.ToricTransport.toricRatioConjugates_of_transport` from the transport statement for twisted toric sums
(`GlobalTheory.ToricTransport.TwistedTransport`).
*Needs:* 8.19b (its steps (0)–(4)); ComplexMultiplicationAndExplicitReciprocity §2.2 (the normalized idele and torsion
dictionary, the main theorem of complex multiplication in adelic form with the arithmetic Artin map, applied to the
Weierstrass model `y² = 4x³ − g₂x − g₃` of `ℂ/𝒪_K`); the conjugation form of the `q`-expansion principle for families of
elliptic modular forms permuted by `SL₂(ℤ)` (a step of this roadmap not given here, see the route; it extends
ComplexMultiplicationAndExplicitReciprocity §2.3, level functions with their semilinear action of `GSp_{2g}(ℤ/N)` (`GL₂(ℤ/N)` for `g = 1`), from weight `0` to
weight `w` divided by `ω^w`); ImaginaryQuadraticClassNumber H3.1 (the CM dictionary).

### 8.19d Toric sums: Hecke's formula, the Euler-factor relation, and the twisted values

*Origin:* adapted from Hecke's formula for the `L`-function of a ring class character as a sum of lattice sums over the
classes (for an order of an imaginary quadratic field, Damerell (1970), §6): (i) and (ii), with an Euler-factor relation
when split places are added to the conductor; (iii), the integrality of the partial sums as polynomials in the twisting
roots of unity, is particular to this proof.

*Method of the formal proof:* for (i), each lattice sum over a class of `Pic(𝒪_𝔠)` is entire in a shift `σ`; for
`Re(s + σ) > 1` the pairs of a class and a lattice point modulo units correspond to the integral ideles modulo
`𝒪̂_𝔠^×`, whose generating series is the Euler product with the factor `(1 − Yw)(1 − Y^{−1}w) + (N𝔮 − 1)w²` at the
places of `Q` above which `χ` is unramified; the identity principle and `σ = 0` give the formula. (ii) follows from (i) for `Q` and for `Q ∖ {𝔮}`,
and from (i) at `Q = ∅` with the nonvanishing of `Λ(s, χ)`; the relation of (iii) follows from (i) applied to `Q` and to
`Q` without the pair, after the sum over the fibres of `Pic(𝒪_𝔠) → G_Q` is written as a toric sum of `χ` times the Hecke
character attached to `ψ` by reciprocity.

For (i) and (ii) let `E` be a CM field, unramified over its maximal real subfield `F` at all finite places, with a CM type `Φ`, and let
`s ≥ 1`, `κ`, the base conductor `𝔣`, `Q`, `χ`, `𝔠 = 𝔣·∏_{𝔮∈Q}𝔮`, the class terms and the twisted toric sums be defined as in 8.19b (that `E`
is abelian over `ℚ`, that it contains an imaginary quadratic field inducing `Φ`, that `2` is ramified in `E` and the condition on its roots
of unity are not asked here). (iii) is stated in the setting of 8.19b (in particular `D` is prime and `2` is ramified in `E`). Let
`Λ(s, χ)` be the Hecke `L`-function of `χ` without Gamma factors (the Euler product over the places where `χ` is unramified).

(i) `T(χ; 𝔠) = Λ(s, χ)·∏_{𝔮∈Q, χ unramified above 𝔮}[(1 − Y_𝔮N𝔮^{−s})(1 − Y_𝔮^{−1}N𝔮^{−s}) + (N𝔮 − 1)N𝔮^{−2s}]`, `Y_𝔮` the value of
`χ` at a place `P_𝔮` above `𝔮`. (This uses `𝒪_𝔠^× = 𝒪_F^×`, which the shape of a base conductor gives for every CM field: for a unit
`u` of `𝒪_𝔠`, `u/ū` is a root of unity congruent to `1` modulo a prime of `E` above an odd prime under `𝔣` unramified in `E`, so it is `1`;
for an order with larger units the right side is multiplied by the index `[𝒪_𝔠^× : 𝒪_F^×]`.)

(ii) For a conjugate pair `{P, P̄}` above `𝔮 ∈ Q` with `χ` unramified above `𝔮` (as it is when `χ` has exact conductor `𝔣`) and
a character `ψ` of `Pic(𝒪_{𝔠/𝔮})`, extended through `Pic(𝒪_𝔠) → Pic(𝒪_{𝔠/𝔮})`: `T(χψ; 𝔠) = [(1 − Yw)(1 − Y^{−1}w) + (N𝔮 − 1)w²]·T(χψ; 𝔠/𝔮)`, `Y = (χψ)(P)`, `w = N𝔮^{−s}`; and
`T(χ; 𝔣) = Λ(s, χ) ≠ 0`.

(iii) For a prime `ℓ` and `G_Q` the `ℓ`-part of the anticyclotomic ray class group of `E` ramified in `Q`, with the reciprocity
map `Pic(𝒪_𝔠) → G_Q`, the *twisted theta values* `th(Q, δ) := T(χ; 𝔣)^{−1}·Σ_{[y]↦δ}(χ_f(y)|y|^s)^{−1}S_{L(y)}(0)` (`δ ∈ G_Q`; partial
toric sums normalised by the untwisted toric sum) satisfy: `Σ_δ th(Q, δ)ψ(δ) = T(χψ_𝔸; 𝔠)/T(χ; 𝔣)` for every character `ψ` of `G_Q`
(`ψ_𝔸` the Hecke character of finite order attached to `ψ` by reciprocity); `Σ_δ th(∅, δ) = 1`; the `th(Q, δ)` lie in the
compositum of the field generated by the `τ(E)` and the values of `χ_f|·|^s` with the abelian extension of `K` of `ℓ`-power
degree cut out by `𝔸_{K,f}^× → Pic(𝒪_𝔠) → G_Q`, which is unramified above `ℓ` (ramified at the places under `Q` in general),
hence in an unramified extension of the completion at every place above `ℓ`; `ℓ^{N₀}·th(Q, δ)` is integral above `ℓ`
for an `N₀` independent of `Q` and `δ`; and the Euler-factor relation (ii) holds for `Σ_δ th(Q, δ)ψ(δ)` when a conjugate pair
leaves `Q`. Consequently, if `Q` is a set of pairs `{P_a, P̄_a}`, `{P′_a, P̄′_a}` (`a ≤ R`) of split places that split completely
in the field `𝒢_M` of CongruenceModulesOfThetaLifts §7.8 (2) (SelmerLengthBoundsAndLocalLifting §3.22 (1); a norm `≡ 1` modulo `2ℓ^M` alone is not enough), with
characters `d_𝔮` of order `ℓ^M` ramified at the pair of `𝔮`, such that, with `H_χ ⊂ G_E` the kernel of the residual
character `χ̄` of `χ` and `z` an element with `χ̄(z) ≠ 1` (for instance a tame inertia element; `z` is central modulo `H_χ`,
`G_E/H_χ` being abelian), the Frobenius at `P_a` lies in `z·H_χ` and the Frobenius at `P′_a` lies in `H_χ` and generates the
inertia quotient at `P_a`, then, as a function of roots of unity `u_𝔮` of order dividing `ℓ^M`,
`f(u) := ℓ^{N₀}·Σ_δ th(Q, δ)∏_𝔮 u_𝔮^{d_𝔮(δ)}` is a polynomial in the `X_𝔮 := u_𝔮 − 1` with integral coefficients, and on the locus
`X_{P′_a} = 0` (all `a`) `f` is congruent, modulo the ideal generated by the `(1 + X_{P_a})^{ℓ^M} − 1`, to the product `F := Dd·g` of
the polynomial `Dd` of the route and the polynomial `g` of the pairs `{P_a, P̄_a}` alone (of degree `< ℓ^M` in each variable),
with `g(0) = ℓ^{N₀}·(a unit)·Σ_δ th(∅, δ)` and `Dd ≡ ∏_a X_{P_a}^{e_a}·(a unit power series)` modulo the maximal ideal, `e_a ∈ {0, 2}`,
and `e_a = 2` for these families (the residual value of `χ` at the Frobenius of `P′_a` is `1`). Hence, for these families, `f` is a polynomial of the second kind at level `M` of SelmerLengthBoundsAndLocalLifting §3.25b (2), the `X_{P_a}` being the first-half and the `X_{P′_a}` the second-half variables, with `v₀ = N₀` (`v(ℓ) = 1`) and exponent bound `n_max = 2`: these are polynomial conditions of the second kind in the sense of SelmerLengthBoundsAndLocalLifting §3.26 (in its coset form), of level `N₀`, the valuation of the untwisted value times `ℓ^{N₀}`.

*Route.* (i) `χ_f` is trivial on `𝒪̂_𝔠^×` (`χ` is trivial on `𝔸_F^×`, has the stated levels, and `E/F` is unramified);
`Pic(𝒪_𝔠)` is finite; each lattice sum is entire in `σ` (continuation of Hecke `L`-functions with nontrivial infinity
type, LFunctions Layer 6); for `Re(s + σ) > 1` the pairs (class, lattice point modulo `𝒪_F^×`) correspond to the integral
ideles modulo `𝒪̂_𝔠^×` (the shape of a base conductor makes the units of `𝒪_𝔠` those of `𝒪_F`), whose generating series is
the Euler product with the local factor `1 + (N𝔮 − 1)Σ_{a,b≥1}(Yw)^a(Y^{−1}w)^b` in place of the two Euler factors at each `𝔮 ∈ Q` above
which `χ` is unramified (at the other `𝔮 ∈ Q` the local factor is `1`, the classes with `a, b ≥ 1` cancelling); then the
identity principle and `σ = 0`. (ii) Divide (i) for `Q` by (i) for `Q ∖ {𝔮}` (same `Λ(s, χψ)`, `χψ` unramified above `𝔮`);
`Λ(s, χ) ≠ 0` at integers `s ≥ 1` (`χ` is ramified at `𝔣 ≠ 1`, so it is not a power of the norm). (iii) Fourier inversion
on the fibres of `Pic(𝒪_𝔠) → G_Q`; field of values by 8.19c, applicable because `T(χ; 𝔣) ≠ 0` by (ii): an automorphism `g` fixing
`τ(E)` and the values of `χ_f|·|^s`, with symbol `t`, maps `th(Q, δ)` to `th(Q, δ·π([t])^{±1})` (`π` the map to `G_Q`), so the
conjugates of a partial sum are the partial sums over the translates of the fibre by the image of `𝔸_{K,f}^×`, and an inertia
element above `ℓ` has trivial image in `G_Q`; integrality uniform in `Q` from 8.19b (class terms) and a power of `ℓ` absorbing
`ϖ_K^{2sf+2|κ|}/T(χ; 𝔣)`; the Euler-factor relation from (ii) through Artin
reciprocity (ClassFieldTheory §11.1, the global Artin map composed with inversion for the geometric convention of the
Conventions), the label being the inverse character on Frobenius. For the polynomial: by
integrality `u ↦ ℓ^{N₀}Σ_δ th(Q, δ)∏u_𝔮^{d_𝔮(δ)}` is a polynomial `f` in the `X_𝔮`, and the same for the pairs `P_a` only (`g`); on the
locus `u_{P′_a} = 1` the Euler-factor relation applied `R` times gives `f = Dd·g` with
`Dd = ∏_a[(1 − x_a(1 + X_a)w_a)(1 − x_a^{−1}(1 + X_a)^{ℓ^M−1}w_a) + (NP′_a − 1)w_a²]`, `x_a` the value of `χ` at the Frobenius of `P′_a` (in characteristic zero; its residue `x̄_a` is the
value of the residual character), `X_a = X_{P_a}`, `w_a = N(P′_a)^{−s}`; `g(0)` is the untwisted value times the Euler factors at the `P_a`,
which are units because `NP ≡ 1` and the residual value of `χ` at the Frobenius of `P_a` is `χ̄(z) ≠ 1`; modulo the maximal ideal each factor of
`Dd` is a unit power series times `X_a^{e_a}`, `e_a = 0` if `x̄_a ≠ 1` and `2` if `x̄_a = 1` (`(1 + X)^{n−1} − 1 = X·Σ_{j<n−1}(1 + X)^j`
with `n − 1 ≡ −1`). These are the data of the second kind of SelmerLengthBoundsAndLocalLifting §3.25b (2): `v(g(0)) = N₀` because `Σ_δ th(∅, δ) = 1` and the Euler factors at the `P_a` are units, and every `e_a ≤ 2`.

*Checks.* (ii) with `Y = 1`, `N𝔮 = 2`, `w = ½`: the factor is `(½)² + ¼ = ½`; as `s → ∞` the factor tends to `1`. The first kind does not follow when `N₀ > 0`: in one variable `Dd = X² + ℓ` and `g = ℓ^{N₀} − ℓ^{N₀−1}X²` have the properties of the second kind, while `Dd·g = −ℓ^{N₀−1}X⁴ + ℓ^{N₀+1}` has no coefficient of valuation `≤ N₀` on a monomial of degree `≤ 2`.

*Sources:* (i), (ii) (Hecke: the `L`-function of a ring class character as a sum of Epstein zeta functions; for an order
of an imaginary quadratic field, the Hecke zeta function as a sum, over the proper ideal classes of the order, of lattice
sums is Damerell 1970, §6, p. 300).
(i): [FormalProof], `Development/AbelianVarietyTheory/Proofs/DivisorProofs/ToricSumEqHeckeLValueMulAuxiliaryFactorsStatement.lean`
(`GlobalTheory.T.toric_sum_eq_hecke_L_value_mul_auxiliary_factors`).
*Needs:* 8.19b, 8.19c, CongruenceModulesOfThetaLifts §7.8; LFunctions Layer 6 (Grössencharacters); ClassFieldTheory §11.1 (global Artin
reciprocity, composed with inversion for the geometric convention); SelmerLengthBoundsAndLocalLifting §§3.22, 3.25b, 3.26.

### Examples

From the Checks of this layer. For `K = ℚ(i)` the logarithmic period of `ℤ[i]` is `log(Γ(1/4)⁴/(4π²)) = 1.476336…`, which is `γ + log π − (L′/L)(1, χ_{−4})` (a classical case, outside the range `D > 4` of 8.5 (a)); `−½` of it is the height of `y² = x³ − x` for the metric `‖α‖² = area/π`, and the metric `‖α‖² = area` gives the classical value `−1.310533` of its Faltings height (8.5). For `(p, q) = (1, 0)` and `E = K` the flat line is `Lie(ℰ₀)`, of degree `½·log Ω_K = −h(ℰ₀)`; for `(0, 1)` it has degree `−½·log Ω_K`, and the shifted integral structure of 8.11 (c) adds `½·log d` (8.11). For `S` acting simply transitively on a finite set with the probability measure, `A_λ = 𝒪^S`, `ς = 𝟙_{1}` and `B_ψ = 𝒪·ψ`, the summed bound of 8.14 (ii) holds with `2P = log|S|` and gives the equality `μ(B_ψ) = μ(A_λ) − log|S|`; for `S = {1, γ}` on two points and `ς ≡ 1` the group determinant vanishes and the twisted traces are not injective (8.14). For `|Φ| = 1`, `p = q = 1`, `μ = (M, −M)`, `g = 2M` the inequality of 8.14a reads `M·deg ω ≥ 0`, and the hypothesis forces `ℓ ≥ 2|Φ| + 2` (8.14a). For `|Φ| = 1`, `N = 2` a quadratic form vanishing on `x₀ = x₁` is `(x₀ − x₁)(αx₀ + βx₁)`, while `(x₀ − x₁)(αx₀ + βx₁ + c)`, `c ≠ 0`, shows that homogeneity is needed (8.14c). For a label fixed by Frobenius, `ϰ_k(τ, τ) = 1/(ℓ^k − 1) − 1/(ℓ − 1)`, zero for `k = 1`, and `Σ_σ ϰ_1(τ, σ) = 0` (8.15e). The forms `u², v²` on `ℙ¹` have degree `2` and image of degree `1` (8.18). On the unit disc, `ρ_𝔇 = −log(1 − |z|²)` and `|∂ρ_𝔇|² = |z|²/(1 − |z|²)² ≤ i∂∂̄ρ_𝔇` (8.18a). For `D = 2`, `T = 11`, `ρ = 0`, `q_z = 28/11` exceeds `1`, which is why 8.18c (e) and 8.18e (e2) keep the undivided inequality; on a modular curve with `c` cusps the codimension of `W(s)` in `V_T` is at least `(T − 1)·c` (8.18e). For `F = ℚ(√7)`, `E = F(i)` and `𝔣` a prime of `F` above `2` split in `E`, `i ∈ 𝒪_𝔣^×` (8.19b). The Euler factor of 8.19d (ii) for `Y = 1`, `N𝔮 = 2`, `w = ½` is `½`, and `Dd = X² + ℓ`, `g = ℓ^{N₀} − ℓ^{N₀−1}X²` show that the second kind is not the first (8.19d).

### Dependencies

This roadmap holds one layer. It uses the earlier roadmaps of this family FrobeniusRestrictedRieszSums §§0.1–0.4; ThetaChainsOnDefiniteUnitaryGroups §§2.1, 2.2, 2.3, 2.4, 2.6, 2.7, 2.9, 2.9a, 3.1; TaylorBoundsAndDepthsOnHeightTwoFormalGroups §§4.8b, 4.8b′, 4.8c, 4.18, 4.19f; LocalGainOfThetaChains §4.9f; RowTowerAndRallisIdentities §§5.1, 5.3, 5.7, 5.9, 5.10a, 5.11, 5.12; BesselPoincareSeriesAndGramBounds §5.23; UniformWildKernelBounds §7.6; CongruenceModulesOfThetaLifts §7.8; HermitianFormsAndLattices §§4.0b, 4.2, 4.13; SlopesOfHermitianVectorBundles (Layers 1–4 and 6); SingularHermitianMetricsAndL2Methods (Layers 3, 7 and 9); HodgeTateLatticesAndLubinTateLogarithms (Layers 0 and 2); MultiplierIdealsOfPairsAndPointSeparation §§9.10c–9.13b; ProjectiveModelsAndPeriodBoundsOnShimuraVarieties §§6.2a–9.1; HeightsForLogSingularMetrics §§0.4, 4.3a, 4.3b, 14.1, 14.2, 16.1; ChowFormsAndHeightsOfSubvarieties §§6.1, 6.2; DiscreteSeriesCoefficientsAndAutomorphicMetrics §§6.8a, 10.1, 10.2; ThetaKernelsForUnitaryDualPairs §6.4a; ThetaLiftsForDefiniteUnitaryGroups §§1.6, 3.2, 3.3; SelmerLengthBoundsAndLocalLifting §§3.22, 3.25b, 3.26; FiniteReductiveGroups §2.4. Roadmaps on main or in open pull requests: ShimuraCompactifications, PELModuli, AutomorphicBundles, AlgebraicModuliForArithmeticGeometry, AlgebraicModuliForArithmeticGeometryPartII, ArakelovGeometryAndAbelianHeights, ArakelovGeometryAndAbelianHeightsPartII, HeightsRationalPointsAndObstructions, HodgeTateAndCanonicalSubgroups, FiniteFlatGroupsAndIntegralPadicHodgeTheory, NeronModelsAndSemistableAbelianVarieties, NashBlowups, SchemeAndStackFoundations, ResolutionOfSingularitiesCharacteristicZero, ComplexComparisonPartII, AdelicAlgebraicGroups, GeometryOfNumbersAndQuadraticArithmetic, MetaplecticAutomorphicForms, AbelianSchemesAndArithmeticModuli, SpecialFunctionsTheta, ImaginaryQuadraticClassNumber, ComplexMultiplicationAndExplicitReciprocity, ComplexMultiplicationAndExplicitReciprocityPartII, LFunctions, ClassFieldTheory, IntegralIwasawaTheory, ModularCurvesPartII, ModularForms, EllipticCohomology, ClassicalArithmeticCompletion, RepresentationTheory/ClassicalGroups.

## Downstream consumers

- GluedTargetAndDivisionInequality takes the CM period of 8.5 (the same `Ω` enters the heights of its lifts, its §8.6), the step lattices and their slopes (8.19), the theta lattices (8.19a–8.19a‴) for the generation by theta series and the index statements of its §§8.19e–8.20, the Poincaré series and the Mackey averages (8.18a, 8.18b), the flag-bundle models (8.15), the local facts of 8.14b, and the CM values and toric sums (8.19b–8.19d), whose theta conditions it states as polynomial conditions of the second kind; its own primes `p_o` use the levels `M·p_o` of the setting of 8.11–8.19.
- ThetaChainsAndFrobeniusPrimeSums takes 8.5, 8.11, 8.14b, 8.17, 8.18, 8.18c (f), (g), 8.18e, 8.19 and 8.19a in the verification of the data of the chain at large scales; its §10.6 fixes the quantifier order of the Conventions, and its §10.0 asks of the hosts of chain data the splitting conditions that give `f ≥ 4`.

## Scope and ownership

This sub-roadmap of [RiemannHypothesisForDirichletLFunctions](../README.md) is independently definitive.

It owns the targets above: the class-mean Chowla–Selberg statement (8.5); the flat line, twisting by it, the definite step and the change of weight on unitary Shimura varieties (8.11–8.14); the degree inequality on curves in characteristic `ℓ`, the local facts on the `𝔩`-torsion and the antisymmetric polynomials vanishing on the walls (8.14a–8.14c); the models of the flag bundles with mixed integral structure, arithmetic proportionality for flag bundles and the average arithmetic volume theorem (8.15–8.17); the basis problem in the stable range, heights of images on deep covers, Poincaré series on the flag domain, Mackey averages of lattice indices, cusp forms on deep covers with their slopes, and the slope of the step lattices (8.17a–8.19); the theta lattices, their depth and their spanning (8.19a–8.19a‴), with the translates of the pulled-back theta function (8.19a′ (d), 8.19a″ (b₀)); and the denominators of CM values, toric ratios and toric sums (8.19b–8.19d). The rest of Layer 8 of the chain, from the pairing integral to the division inequality, is owned by [GluedTargetAndDivisionInequality](../GluedTargetAndDivisionInequality/README.md).

It leaves to other roadmaps, by section: slopes, Bost's slope inequality and the arithmetic Hilbert–Samuel inequality over a coordinate bundle to [SlopesOfHermitianVectorBundles](../SlopesOfHermitianVectorBundles/README.md); Hodge–Tate lattices at every prime, the model on which they are locally free and the Hodge–Tate sequence modulo `ℓ^{R−1}` to [HodgeTateLatticesAndLubinTateLogarithms](../HodgeTateLatticesAndLubinTateLogarithms/README.md) (§§0.5a–0.18a, 2.4), over HodgeTateAndCanonicalSubgroups; Nadel vanishing for pairs, isolated non-klt centres, Kollár's two-point separation, Bertini for birational linear systems, division by sections with simple common zeros and the bound for sections to [MultiplierIdealsOfPairsAndPointSeparation](../MultiplierIdealsOfPairsAndPointSeparation/README.md) (§§9.10c–9.13b); growth bounds for the Hodge metric, logarithmic periods, conjugate data, the global normal projective models with their cubical line bundle and Kempf's descent to [ProjectiveModelsAndPeriodBoundsOnShimuraVarieties](../ProjectiveModelsAndPeriodBoundsOnShimuraVarieties/README.md) (§§6.2a–9.1), over [ShimuraCompactifications](../../ShimuraCompactifications/README.md) and [PELModuli](../../PELModuli/README.md); log-log singular metrics, arithmetic volumes, the reflection formula, the heights of flag varieties and the logarithmic bound for the maximal slope of a Lie algebra to [HeightsForLogSingularMetrics](../HeightsForLogSingularMetrics/README.md) (§§0.4, 4.3a, 4.3b, 14.1, 14.2, 16.1); the heights of cycles relative to a Hermitian vector bundle to [ChowFormsAndHeightsOfSubvarieties](../ChowFormsAndHeightsOfSubvarieties/README.md) (§§6.1, 6.2); good invariant metrics, Hirzebruch–Mumford proportionality and Poincaré series on products of the domains of `U(p, q)` to [DiscreteSeriesCoefficientsAndAutomorphicMetrics](../DiscreteSeriesCoefficientsAndAutomorphicMetrics/README.md) (§§6.8a, 10.1, 10.2); singular Hermitian metrics and `L²` methods to [SingularHermitianMetricsAndL2Methods](../SingularHermitianMetricsAndL2Methods/README.md); the index of two lattices, unimodular lattices and short generators to [HermitianFormsAndLattices](../HermitianFormsAndLattices/README.md) (§§4.0b, 4.2, 4.13); polynomial conditions and twist selection to [SelmerLengthBoundsAndLocalLifting](../SelmerLengthBoundsAndLocalLifting/README.md) (§§3.22–3.26); and the data of the chain to [ThetaChainsOnDefiniteUnitaryGroups](../ThetaChainsOnDefiniteUnitaryGroups/README.md), [RowTowerAndRallisIdentities](../RowTowerAndRallisIdentities/README.md), [TaylorBoundsAndDepthsOnHeightTwoFormalGroups](../TaylorBoundsAndDepthsOnHeightTwoFormalGroups/README.md), [LocalGainOfThetaChains](../LocalGainOfThetaChains/README.md), [BesselPoincareSeriesAndGramBounds](../BesselPoincareSeriesAndGramBounds/README.md) and [CongruenceModulesOfThetaLifts](../CongruenceModulesOfThetaLifts/README.md), by the sections named at each use.

## Exact supplier contracts

### From Mathlib

- `MvPolynomial`, `MvPolynomial.rename` and `Equiv.Perm.sign` (8.14c: invariance and antisymmetry under `𝔚` are stated through them and are not Mathlib notions); `Matrix.det` and the product formula `NumberField.prod_abs_eq_one` (8.19a‴).
- For the statement of 8.5 in `Suggested.lean`: `UpperHalfPlane`, `ModularForm.eta`, `ClassGroup`, `ClassGroup.mk`, `FractionalIdeal`, `NumberField.classNumber`, `NumberField.discr`, `NumberField.dedekindZeta`, `riemannZeta`, `DirichletCharacter.LFunction`, `Real.eulerMascheroniConstant`.

### From Tau Ceti

- `OrthonormalBasis.norm_det_le_prod_norm` in `TauCeti/Analysis/InnerProductSpace/Gram/Hadamard.lean` (Hadamard's inequality: the determinant of a finite family in the coordinates of an orthonormal basis has norm at most the product of the norms of its members). Used in 8.19a‴.

### From TauCetiRoadmap.ShimuraCompactifications

- Layer 2 (toroidal compactifications); §§6.4–6.8 (degeneration data, Mumford's construction, the degeneration equivalence, the universal degeneration on a cusp chart); §7.3 (integral toroidal models; charts at good primes); §7.12 (logarithmic Kodaira–Spencer); §§7.13, 7.17 (semiampleness of the Hodge line; a power of it pulled back from an ample sheaf on the minimal compactification): the nefness of `ω_q` on every curve, boundary curves included; §7.22 (the Koecher principle on normalised models: for an open `U` of the minimal compactification, restriction from the toroidal preimage of `U` to `U` minus the boundary is bijective on sections of a formally canonical bundle, except when the moduli space has dimension `1` and `U` meets the boundary); §7.31 (singleton models at bad primes, toroidal charts); Layer 7, with §7.15 (Fourier–Jacobi expansions of Hodge-line sections on PEL toroidal models). Used in 8.11, 8.14, 8.15, 8.18c, 8.18e, 8.19, 8.19a.

### From TauCetiRoadmap.PELModuli

- M1.7 (the PEL moduli problem), M2.8 (representability and smoothness), M2.10 (the Kodaira–Spencer map of the universal family, an isomorphism `KS_{(A,λ,i)/M_H} ≅ Ω¹_{M_H/S₀}` of rank `Σ_τ p_τq_τ` for a unitary datum, with its Gauss–Manin description on `H¹_dR`; used in 8.18 at the points with values in a field, in the eigen-frames of the Lie algebra), M3.4, M3.5 (complex uniformisation), M3.8 (the Hermitian space of homomorphisms from a CM object), M4.7 (the rank-one CM moduli schemes), M6.1 (level-forgetting and Hecke maps are finite étale). Used in 8.11, 8.15, 8.15d, 8.18, 8.19a, 8.19a′.

### From TauCetiRoadmap.AutomorphicBundles

- §§0.5, 5.3 (automorphic bundles and their canonical extension), used in the setting of 8.11–8.19, 8.11, 8.14, 8.15, 8.18, 8.19; §12.15 (Fourier–Jacobi expansion with vector coefficients: the coefficients, on the abelian torsor over a cusp of a neat PEL toroidal model, of a section of the canonical extension of the bundle of a finite projective representation), used in 8.19a.

### From TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry

- §1.3 (coherent quotients, Plücker and partial flags; 8.15); §1.6 (big line bundles: bigness by the growth of sections, ample bundles are big, a bundle is big exactly when its positive powers are; 8.14, 8.18c); §9.10 (algebraic vanishing; 8.18c, 8.18e).

### From TauCetiRoadmap.AlgebraicModuliForArithmeticGeometryPartII

- §1.5 (nef invertible sheaves on proper schemes; the pull-back of a nef sheaf is nef, and a sheaf whose pull-back along a surjective morphism is nef is nef), §1.6 (on an integral proper scheme `V` of dimension `n` over a field, a nef `L` is big exactly when `(L^n·V) > 0`), §1.7 (ii) (Kleiman's non-negativity of intersection numbers of nef sheaves on integral closed subschemes). Used in 8.14, 8.18c.

### From TauCetiRoadmap.ArakelovGeometryAndAbelianHeights

- §2.8 (the Faltings metric; 8.16); §2.9 (the Faltings height of an elliptic curve from its minimal discriminant and its periods; 8.5); §§4.6–4.8 (the `τ`-components of the Hodge line under an `𝒪_E`-action, their heights along `𝒪_E`-isogenies, the Hodge filtration of a CM abelian scheme over a `p`-adic ring; 8.15c); §5.7 (the good translated basis of `H⁰(A, L^{⊗r²})` over `ℚ̄`, `r` even: the classical case of 8.19a′ (d), cited there for comparison; not an input).

### From TauCetiRoadmap.ArakelovGeometryAndAbelianHeightsPartII

- §0.3 (`vol(L̄) = L̄^d` for nef `L̄`; its geometric case (1′), `vol(L) = (L^d)` for a nef line bundle `L` on a projective variety of dimension `d` over a field, which is asymptotic Riemann–Roch for nef bundles), §§3.1, 4.8. Used in 8.14, 8.15c, 8.16, 8.17, 8.18.

### From TauCetiRoadmap.HeightsRationalPointsAndObstructions

- §5.9b (projective heights of cycles and controlled projections), §5.17a (the arithmetic divisor action: real arithmetic forms and currents, arithmetic cycle classes), §5.17f (successive minima; Zhang's inequality). Used in 8.15c, 8.16, 8.18.

### From TauCetiRoadmap.HodgeTateAndCanonicalSubgroups

- §§0.2, 0.3, 0.4, 0.5, 0.17 and §2.4 (the Hodge–Tate sequence of a `p`-divisible group over `𝒪_C` is a complex, exact over `C`). Used in 8.14b, 8.15.

### From TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory

- R07.1.1 (relative Frobenius and Verschiebung; 8.14a); R07.1.17, R07.1.27, R07.1.28 (8.14b).

### From TauCetiRoadmap.NeronModelsAndSemistableAbelianVarieties

- §§3.5, 3.6 (the toric–finite filtration of the Tate module; Weil orthogonality). Used in 8.15.

### From TauCetiRoadmap.NashBlowups

- §§1.2–1.4 (the Nash modification of a sheaf, its universal property, the Plücker form). Used in 8.15.

### From TauCetiRoadmap.SchemeAndStackFoundations

- §0.14 (Henselian pairs). Used in 8.15.
- §4.10 (`algebraize_hom`: compatible morphisms from the thickenings of a proper scheme to a separated scheme of finite
  type over an adically complete noetherian ring come from a unique morphism). Used with AbelianSchemesAndArithmeticModuli
  A4.8.

### From TauCetiRoadmap.ResolutionOfSingularitiesCharacteristicZero

- §5.1 (principalisation; 8.14); §5.2 (embedded resolution; 8.11, 8.15); §5.5 (the resolution of a reduced scheme of
  finite type, an isomorphism over its regular locus), which with §5.1 for the ideal of the reduced preimage of the
  singular locus gives the form of [FormalProof]: a resolution by blow-ups whose exceptional locus is a simple normal
  crossings divisor.

### From TauCetiRoadmap.ComplexComparisonPartII

- C1.9 (projective and proper coherent GAGA), C2.2 (ideals, sections and bundles under analytification). Used in 8.11, 8.14.

### From TauCetiRoadmap.AdelicAlgebraicGroups

- §4.2 (finite covolume, strong approximation). Used in 8.16, 8.18a.

### From TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmetic

- §4.4 (Banaszczyk's transference theorem `λ_i(L)λ_{n+1−i}(L^*) ≤ n` for a full lattice `L` of rank `n` in a Euclidean space and its dual `L^*`, applied to a `ℤ`-lattice in a positive definite rational quadratic space through its real model). Used in 8.19a.

### From TauCetiRoadmap.MetaplecticAutomorphicForms

- §6.4 (the anisotropic Siegel–Weil formula; the unitary group of a totally definite Hermitian space is anisotropic). Used in 8.17a.

### From TauCetiRoadmap.AbelianSchemesAndArithmeticModuli

- A2.4 (for a relatively ample `L` on an abelian scheme, `π_*L` is locally free, of formation compatible with base change, of
  fibre rank `h⁰(L_s) = χ(L_s)`, with vanishing higher direct images; `h⁰(B, f^*L) = deg(f)·h⁰(A, L)` for an isogeny `f`). Used
  in 8.19a.
- A3.6 (the theta group `G(L)` of a line bundle rigidified along zero, over any base: a central extension of `K(L)` by `𝔾_m`,
  its commutator pairing, and the level subgroups over a finite locally free `H ⊂ K(L)` as the descents of `L` along
  `A → A/H`; nothing on sections). Used in 8.19a′ (b). The statements on translates of the pulled-back theta function that
  8.19a′ (b) and 8.19a″ (b) use are 8.19a′ (d) and 8.19a″ (b₀) of this roadmap; no supplier states them.
- A5.3–A5.4 (over `ℂ`: line bundles on `V/Λ` through factors of automorphy (Appell–Humbert), algebraicity of a complex torus
  with a positive Riemann form, and `h⁰(L) = d₁⋯d_g` for a polarisation of type `(d₁, …, d_g)`, so that a principal
  polarisation has a single theta function up to scalars). Used in 8.19a, 8.19a″.
- A3.2 (an abelian variety of dimension `g` over an algebraically closed field `k` has `n^{2g}` points of order dividing
  `n`, for `n` invertible in `k`). Used by [FormalProof] for 8.19 (b), (c).
- A4.3 (the first de Rham cohomology of an abelian scheme: locally free of rank `2g`, compatible with base change, with
  its Hodge filtration and its perfect pairing with the de Rham cohomology of the dual abelian scheme). Used in 8.11, 8.18
  and 8.18c, in the form of [FormalProof]: for the Kodaira–Spencer map of the universal family and the form that the
  polarisation induces on the de Rham cohomology.
- A4.6, A4.7 (Grothendieck–Messing: over a divided-power thickening in which a prime `p` is locally nilpotent, with
  locally nilpotent divided powers, the de Rham realisation of a lift does not depend on the lift, the lifts of an abelian
  scheme correspond to the lifts of the Hodge filtration, and a homomorphism lifts exactly when it respects the
  filtrations). Used in 8.11 and 8.18c, in the form of [FormalProof]: over square-zero thickenings, for the lifting of
  homomorphisms that gives integral framed points with integer valuations at the primes good for the datum and the level.
- A4.8 (a compatible system of proper schemes with line bundles over the powers of an ideal of an adically complete
  noetherian ring, ample at the first level, is the completion of a proper scheme with a relatively ample line bundle).
  Used with the previous line.

### From TauCetiRoadmap.SpecialFunctionsTheta

- Layer 7 (Riemann theta functions and their quasi-periodicity). Used in 8.18c.

### From TauCetiRoadmap.ImaginaryQuadraticClassNumber

- H3.1 (the CM dictionary and the class-group action on CM `j`-values; for an imaginary quadratic field `K`: `K(j(𝒪_K))`
  is the Hilbert class field of `K`, of degree `h_K` over `K`, and the values `j(𝔞)` depend only on the class of `𝔞`, are
  `h_K` in number and are the conjugates of `j(𝒪_K)` over `K`). Used in 8.5, 8.19b, 8.19c.

### From TauCetiRoadmap.ComplexMultiplicationAndExplicitReciprocity

- §2.2 (the normalized idele and torsion dictionary: the main theorem of complex multiplication in adelic form, with the arithmetic Artin map), applied to the Weierstrass model of `ℂ/𝒪_K`. Used in 8.19c.
- §2.3 (level functions with their semilinear action of `GSp_{2g}(ℤ/N)`, `GL₂(ℤ/N)` for `g = 1`: the weight-`0` case that the conjugation form of the `q`-expansion principle of 8.19c extends). Used in 8.19c.
- §3.2 (the exact ray-level field: in the elliptic maximal-order case the regular values at the CM point of the functions of level `n` generate the ray class field `K(n)`). Used in 8.18.

### From TauCetiRoadmap.ComplexMultiplicationAndExplicitReciprocityPartII

- §1.4 (integral polarised CM families), §4.6 (the Chowla–Selberg formula; the Faltings height of a CM elliptic curve; the general theorem named in the `*Corollary of:*` line of 8.5, for 8.5 (a) and, through (a), (c)). Used in 8.5, 8.11.

### From TauCetiRoadmap.LFunctions

- Layer 2 (the partial zeta functions of ray classes, at the trivial modulus), Layer 5 (the orthogonality reconstruction of partial zeta functions from finite-order Hecke `L`-functions; their functional equation). Used in 8.19b.
- Layer 6 (Grössencharacters; the continuation of the lattice sums). Used in 8.19b, 8.19d.

### From TauCetiRoadmap.ClassFieldTheory

- §11.1 (the global Artin map, arithmetic Frobenius normalisation; composed with inversion for the geometric convention of the Conventions). Used in 8.19d.
- §13.1 (the Galois group of the ray class field is the ray class group; the conductor–discriminant formula). Used in 8.18.

### From TauCetiRoadmap.IntegralIwasawaTheory

- §6.0 (the Siegel–Klingen rationality of the values at negative integers of finite-order Hecke `L`-functions of a totally real field; the Deligne–Ribet congruences). Used in 8.19b.

### From TauCetiRoadmap.ModularCurvesPartII

- §1.4a (the quasi-period homomorphism of a lattice and Legendre's relation), §5.6 (the modular polynomial: integral, symmetric, monic of degree `ψ(m)` in each variable). Used in 8.19b.

### From TauCetiRoadmap.ModularForms

- §10D (the complex Tate curve `(2πi)^{−2}℘(u; ℤ + ℤz) − 1/12 = X_Tate(e^{2πiu})`, the holomorphy of the division values, homogeneity of `℘`). Used in 8.19b.

### From TauCetiRoadmap.EllipticCohomology

- Layer 1 (Deligne's computation of the ring of integral algebraic modular forms of level one, `ℤ[c₄, c₆, Δ]/(c₄³ − c₆² − 1728Δ)` with weights `4, 6, 12`). Used in 8.19b.

### From TauCetiRoadmap.ClassicalArithmeticCompletion

- §7.5 (Dedekind's factorisation of the group determinant of a finite abelian group into the sums `Σ_g χ(g)X_g` over its characters). Used in 8.14.

### From TauCetiRoadmap.RepresentationTheory/ClassicalGroups


- §5.1 (the Weyl dimension formula). Used in 8.13.

### From FrobeniusRestrictedRieszSums, a sub-roadmap of this family

- §0.1 (the host `E`, `K`, the CM type `Φ`), §§0.2–0.4 (Frobenius conventions, `SplitRamification d`, the cyclic hosts and the auxiliary pair). Used in the Conventions and the setting of 8.11–8.19.

### From ThetaChainsOnDefiniteUnitaryGroups, a sub-roadmap of this family

- §2.1 (the size conditions, `Q_S`, `S_small`, `vd`), §2.2 (the spaces `W_j`), §2.3 (the weights of the steps; the gap parameter `h₀`), §2.4 (b) (the auxiliary primes `p_δ, p′_δ`), §2.6 (the fields `𝕂 ⊂ 𝕃`, the bound for the degree and the root discriminant of `𝕂`, composita), §2.7 (type primes), §2.9, §2.9a (the levels, the finite group `G₀`, the base level, the half-level ideal), §3.1 (the polynomial model of algebraic modular forms). Used in 8.13, 8.17a, 8.18, 8.18c, 8.18f, 8.19, 8.19a, 8.19a′.

### From TaylorBoundsAndDepthsOnHeightTwoFormalGroups, a sub-roadmap of this family

- §4.8b (the depth of a weight at a framed point and at a place, with a multiplier, `M = g₀g₁` at the chain; at a place it is cut off below at `0`), §4.8b′ (integral charts and saturated frames), §4.8c (the unramified colength bound), §4.18 ((a), (b) the pivot lemma; (c) the factor depth), §4.19f (o) (the depth of powers of leading minors, for a unitary moduli problem with principal polarisation). Used in 8.18c, 8.19a, 8.19a′.

### From LocalGainOfThetaChains, a sub-roadmap of this family

- §4.9f (d) (the diagrams of step `j`). Used in 8.19.

### From RowTowerAndRallisIdentities, a sub-roadmap of this family

- §5.1 (the Petersson product), §5.3 (the good projector, `𝔼_0`, `δ_bad`), §5.7 (the model lift; the weight `λ^W_j`), §5.9 (`rk M^W_j = D_0`), §5.10a (the rational structure of the model forms and its identification at the extremal vector), §5.11 (the rational forms; the class-sum lifts), §5.12 (surjectivity of the descent and its Gram matrix). Used in 8.12, 8.13, 8.17a, 8.18, 8.19, 8.19a, 8.19a″.

### From BesselPoincareSeriesAndGramBounds, a sub-roadmap of this family

- §5.23 (ii)–(vi) (the Gelfand–Graev shares and the bound for the discarded share; (v) embedding in regular representations from a group determinant; (vi) free permutation). Used in 8.19.

### From UniformWildKernelBounds, a sub-roadmap of this family

- §7.6 (the budget bound on windows; its constant `J` at the chain's parameters is the window constant of ThetaChainsOnDefiniteUnitaryGroups §2.1). Used in the Conventions.

### From CongruenceModulesOfThetaLifts, a sub-roadmap of this family

- §7.8 ((2) the governing field `𝒢_M`, and twist selection by polynomial conditions, under `r ≥ 100` and `g₀, g₁ ≥ 2r`). Used in 8.19d.

### From HermitianFormsAndLattices, a sub-roadmap of this family

- §4.0b (the index `idx(A, B)` of two lattices and its API: independence of the auxiliary lattice, additivity, antisymmetry, monotonicity, transport, `idx(A, gA) = v(det g)`; (a) the exact length lemma; (b) the colength identity and the colength inequality, with the descent lemma as corollary; (c) flat base change). Used in 8.18b, 8.19a.
- §4.2 (a) (at a split or unramified place a unimodular lattice has an orthonormal basis and is unique up to the unitary
  group). Used in 8.15d.
- §4.13 (short generators from a short spanning family: for a number field `K` of degree `n`, a `K`-space `V` of dimension `ρ` with seminorms `N_σ` (`N_σ(ax) = |σ(a)|N_σ(x)`) and a finitely generated `𝒪_K`-submodule `M ⊂ V` containing a family spanning `V` with `N_σ ≤ B`, `M` is generated over `ℤ` by at most `2nρ` elements with `N_σ ≤ max(1, n⁴·ρ·rd(K)·B)`). Used in 8.18c (c).

### From SlopesOfHermitianVectorBundles, a sub-roadmap of this family

- §1.2, §1.3, §1.7 (slopes, heights of maps with their finite and archimedean parts, duals, tensor products). Used in 8.12, 8.14, 8.19, 8.19a.
- §2.1, §2.2 (maximal and minimal slopes, their shift by a fractional ideal, duality, direct sums, sub-bundles), §2.4 (e) (the slope inequality with quotient term), §2.6 (orthogonal idempotents), §3.4 (v). Used in 8.14, 8.19.
- §§4.1–4.2 (successive minima and Harder–Narasimhan slopes). Used in 8.18f (b), 8.19a.
- §6.6, §6.7 (the remark on fixed divisors), §6.7a (i)–(iii) and the integrality condition of 6.7a (iv), §6.7b (d′)–(f′): spherical heights of multiforms; the explicit arithmetic Hilbert–Samuel inequality over a Hermitian coordinate bundle `Ū` (written `J̄` in that roadmap), with flatness on a subspace (c′) in all its clauses (the factorisation, the residue map onto the values, the symbols with the symbol rule, the deepest step). Used in 8.18e.

### From SingularHermitianMetricsAndL2Methods, a sub-roadmap of this family

- §3.1, §3.4, §3.8, §3.8a (b), §3.9, §3.10 (b)–(c): Hörmander's estimate with the datum measured by the Levi form of the weight, interpolation of jets on a discrete common zero set, division with jets; §3.8a (b) also for weights plurisubharmonic of class `C²` off a hypersurface and locally bounded above near it; and the construction of §9.1 (used in 8.18a (f)). Used in 8.18a.
- §3.7. Used in 8.18c.
- §7.7 (b)–(d), §7.8: log-log singular semipositive metrics with monotone `C²` regularisations ((c): close, with the boundary rate, under the gradient bound) and their pull-backs. Used in 8.15b, 8.15c.

### From HodgeTateLatticesAndLubinTateLogarithms, a sub-roadmap of this family

- §0.5a ((a) the sandwich `κ·ω ⊆ ω^{HT} ⊆ ω` where the lattice is locally free; (c) the lattice on a dominating model), §0.5b ((b) `κ = 2` at `2`, that roadmap's own; used here in the form of [FormalProof], with the factor `4`), §0.5c ((a) pull-back of the eigen-quotients; (b) the model, in its finite-set form, an isomorphism over the points where the lattices are already locally free; (c) its universal property), §0.5f (the chart form of the cokernel bound), §0.5g (the period matrix), §0.5h (functions additive modulo `p`, with (2), (4′), (6)), §0.17b ((c) the Hodge–Tate sequence modulo `ℓ^{R−1}` at every prime, on the fibre over `ℓ`, reduced or not, used here modulo `ℓ^{R−2}` with `R ≥ 4`, the form of [FormalProof] at `ℓ = 2`; (d) flags, power sums, nefness), §0.18a (the `p`-divisible group of a semi-abelian scheme over `𝒪_C`), §2.4 (the kernel of the Hodge–Tate map at every prime, through §§0.18a (d), 0.17b). Used in 8.14b, 8.15, 8.19a′.

### From MultiplierIdealsOfPairsAndPointSeparation, a sub-roadmap of this family

- §9.10c (Nadel vanishing for pairs), §9.12 (isolated non-klt centres, over `ℂ` with an effective boundary, with `D` numerically equivalent to `N`), §9.12a (Kollár's two-point separation: a section vanishing at exactly one of two points), §9.13 (Bertini for a birational base-point-free linear system), §9.13a ((i) division by `D` sections with simple common zeros; (ii) surjectivity onto the values), §9.13b ((b) the bound for sections by intersection numbers with a generated line bundle). Used in 8.14, 8.18c, 8.18e.

### From ProjectiveModelsAndPeriodBoundsOnShimuraVarieties, a sub-roadmap of this family

- §6.2a (growth bounds for the Hodge metric: (a) the Gram matrix; (b) seminegativity of the Lie algebra of every semi-abelian scheme over a smooth projective geometrically connected curve over a field of characteristic zero), §6.7a (logarithmic periods of a chart of the model with a holomorphic family of points; the monodromy is not asserted unipotent), §6.9a (conjugate data on a curve in characteristic `p`), §7.12a (the hypotheses of §6.9a on a global model of §7.31a (b′) (ii) that can be chosen, and on every reduced locally noetherian scheme over it whose generic points map to `Sh_F`), §7.17a (a) (ampleness of twisted Hodge lines on the smooth integral toroidal model at a good prime), §7.31a (b) (the global normal projective model, with the endomorphisms, its finite covers `Y_L` (that roadmap's own clause; the covers of [FormalProof] that it records are normal projective, dominant of finite degree over a component, with all `ℓ⁴`-torsion rational at a finite set of primes and normal-crossings boundary) and, for a self-dual lattice and `w_0`, the cubical line bundle of the principal polarisation in that roadmap's own form), (b′) (ii) (the global model with its cubical line bundle, the form of [FormalProof]), §9.1 (Kempf's descent of a linearised line bundle to a quotient by a finite group). Used in the setting of 8.11–8.19, 8.11, 8.14, 8.14a, 8.15, 8.18c.

### From HeightsForLogSingularMetrics, a sub-roadmap of this family

- §0.4 ((b) limit numbers, (c) (i)–(iii) the boundary mass bound and either rate, (iii) for close regularisations with losses `≤ C·log log(1/t)/log(1/t)`, (o) morphisms of log-smooth models), §4.3a ((d) the two minima statements without ampleness), §4.3b (b) (the absolute Siegel lemma), §14.1 ((a), (c) and *Objects*: the reflection formula for arithmetic projective-line bundles, for limit numbers, (c) with its hypothesis (iv) of close `C²` regularisations with loss `≤ C·log log(1/t)/log(1/t)`), §14.2 (arithmetic intersection numbers of flag varieties over `ℤ`), §16.1 (`μ̂_max(Lie Ḡ) ≤ C·log(2 + g + max(h, 0))` for a semi-abelian `G` with an `𝒪_E`-action, `E` a CM field of the family, and a symmetric cubical line bundle compatible with it that gives the principal polarisation of its abelian generic fibre). Used in 8.15–8.18.

### From ChowFormsAndHeightsOfSubvarieties, a sub-roadmap of this family

- §6.1 (the Fubini–Study height as the spherical Mahler measure of the Chow form), §6.2 ((a), (b): for a Hermitian vector bundle `J̄` of rank `N` and a cycle `Z` of dimension `d`, the height of `Z` in `ℙ(J^∨)` is the height relative to `J̄` of its Chow form plus `((d + 1)/2)·H_{N−1}·deg Z`). Used in 8.18, 8.18e.

### From DiscreteSeriesCoefficientsAndAutomorphicMetrics, a sub-roadmap of this family

- §6.8a (Poincaré series on products of the domains of `U(p, q)`, with `f = |Φ|`, `n = N`, `s = e_P`), §10.1 (the invariant metric of an automorphic vector bundle of a representation trivial on the unipotent radical of the parabolic subgroup stabilising a point of the compact dual and unitary on `K_∞` is good along the boundary relative to the canonical extension), §10.2 (Hirzebruch–Mumford proportionality for such representations, also for flag bundles). Used in 8.11, 8.15, 8.15b, 8.15e, 8.17, 8.18, 8.18a, 8.18c, 8.19.

### From ThetaKernelsForUnitaryDualPairs, a sub-roadmap of this family

- §6.4a (the Siegel–Weil formula in Weil's convergent range). Used in 8.17a.

### From ThetaLiftsForDefiniteUnitaryGroups, a sub-roadmap of this family

- §1.6 (integral structures). Used in 8.13.
- §§3.2–3.3. Used in 8.17a.

### From SelmerLengthBoundsAndLocalLifting, a sub-roadmap of this family

- §3.22 ((1) the governing field), §3.25b ((2) polynomials of the second kind), §3.26 (polynomial conditions of the first or second kind, in the coset form). Used in 8.19d.

### From FiniteReductiveGroups, a sub-roadmap of this family

- §2.4 (the mirabolic subgroup). Used in 8.18b.

## References

- [FormalProof] Levent Alpöge, the Lean formalization of the Riemann hypothesis and of the Riemann hypothesis for Dirichlet L-functions announced in [Announcement]; source with a public verification setup: <https://github.com/leanprover-community/riemann-hypothesis>. The file paths cited from it are relative to its directory `src/` (`src/Development/…`, `src/Formalism/…`). The targets whose origin is particular to this proof or adapted from published work specify its mathematics.
- [Announcement] Levent Alpöge, the announcement of that proof, 20 November 2026: <https://alpo.ge/remark.pdf>.
- G. Shimura; P. Deligne; J. Milne, *Canonical models of (mixed) Shimura varieties and automorphic vector bundles* (1990); M. Harris, *Arithmetic vector bundles and automorphic forms on Shimura varieties I*, Invent. Math. 82 (1985). N. Katz, *p-adic interpolation of real analytic Eisenstein series*, Ann. of Math. 104 (1976); D. Blasius: 8.19b.
- J. A. Green, *The characters of the finite general linear groups*, Trans. Amer. Math. Soc. 80 (1955); I. M. Gelfand and M. Graev; I. M. Gelfand and D. Kazhdan, *Representations of the group GL(n, K) where K is a local field* (1975); I. N. Bernstein and A. V. Zelevinsky, *Induced representations of reductive p-adic groups I*, Ann. Sci. ÉNS 10 (1977); A. Zelevinsky, *Representations of finite classical groups: a Hopf algebra approach*, LNM 869 (1981); D. Ginzburg, S. Rallis and D. Soudry, *The descent map from automorphic representations of GL(n) to classical groups* (2011): 8.19.
- L. Kronecker; M. Lerch, *Sur quelques formules relatives au nombre des classes*, Bull. Sci. Math. 21 (1897); S. Chowla and A. Selberg, *On Epstein's zeta-function*, J. reine angew. Math. 227 (1967), pp. 86–110 (§6, (39), p. 97; §12, pp. 109–110); M. Deuring, *Die Klassenkörper der komplexen Multiplikation* (1958); P. Colmez, *Périodes des variétés abéliennes à multiplication complexe*, Ann. of Math. 138 (1993): 8.5, 8.11.
- J.-B. Bost, *Périodes et isogénies des variétés abéliennes sur les corps de nombres*, Séminaire Bourbaki 795, Astérisque 237 (1996), pp. 115–161 (Proposition 4.3): 8.14, 8.15, 8.16; É. Gaudron and G. Rémond (2014): 8.15, 8.16. D. Mumford, *Hirzebruch's proportionality theorem in the non-compact case*, Invent. Math. 42 (1977): 8.15, 8.18. G. Faltings and C.-L. Chai, *Degeneration of abelian varieties* (1990) (the minimal compactification, 8.14); K.-W. Lan, *Arithmetic compactifications of PEL-type Shimura varieties* (2013): 8.11, 8.14, 8.15, the setting of 8.11–8.19.
- H. Gillet and C. Soulé, *An arithmetic Riemann–Roch theorem*, Invent. Math. 110 (1992); A. Abbes and T. Bouche, *Théorème de Hilbert–Samuel arithmétique*, Ann. Inst. Fourier 45 (1995); S. Zhang, *Positive line bundles on arithmetic varieties*, J. Amer. Math. Soc. 8 (1995): 8.15–8.18. J.-B. Bost, H. Gillet and C. Soulé, *Heights of projective varieties and positive Green forms*, J. Amer. Math. Soc. 7 (1994): 8.18, 8.18e. A. Moriwaki, *Continuity of volumes on arithmetic varieties*, J. Algebraic Geom. 18 (2009); X. Yuan, *Big line bundles over arithmetic varieties*, Invent. Math. 173 (2008): 8.15, 8.17.
- L. Fargues (with Y. Tian), *La filtration canonique des points de torsion des groupes p-divisibles*, Ann. Sci. Éc. Norm. Sup. (4) 44 (2011), pp. 905–961 (Théorème 3; Lemme 9, Propositions 7–8 and the proof of Théorème 4), the Hodge–Tate map of `p`-divisible groups over `𝒪_C`: 8.14b, 8.15, 8.19a′. M. Raynaud, *Schémas en groupes de type (p, …, p)*, Bull. Soc. Math. France 102 (1974), pp. 241–280: 8.14b, 8.15. W. Schmid, *Variation of Hodge structure: the singularities of the period mapping* (1973), the nilpotent orbit theorem: 8.15. P. Scholze and J. Weinstein (moduli of `p`-divisible groups); J. Anschütz and A.-C. Le Bras, *Prismatic Dieudonné theory*.
- D. Mumford, *On the equations defining abelian varieties. I*, Invent. Math. 1 (1966), pp. 287–354 (§1: Proposition 1, p. 291; Proposition 3 and its proof, pp. 295–296; Theorem 2, p. 297): 8.19a′. F. Pazuki, *Theta height and Faltings height*, Bull. Soc. Math. France 140 (2012), pp. 19–49 (Proposition 2.5, Theorem 3.4, Proposition 5.3), after J.-B. Bost and S. David: 8.19a′. T. Foster, J. Rabinoff, F. Shokrieh and A. Soto, *Non-Archimedean and tropical theta functions*, Math. Ann. (2018), arXiv:1705.08212: 8.19a′. Lefschetz (the theorem on the third power of a principal polarisation): 8.19a″.
- X. Yuan, *Positivity of Hodge bundles of abelian varieties over some function fields*, Compositio Math. 157 (2021), pp. 1964–2000; D. Yang, *Positivity of automorphic vector bundles on unitary Shimura varieties*, arXiv:2503.08119 (2025): 8.14a.
- U. Angehrn and Y.-T. Siu (1995): 8.14, 8.18c; J. Kollár, *Singularities of pairs* (1997) (the two-point separation for klt pairs): 8.14, 8.18c; A. M. Nadel (1990); G. Kempf (descent of linearised bundles); R. Dedekind and G. Frobenius (group determinant): 8.14. M. Koecher, *Zur Theorie der Modulformen n-ten Grades* I, II (1954–1955): Koecher's principle, 8.11–8.19, 8.19a. Y. Kawamata; E. Viehweg: 8.18. L. Hörmander (1965); H. Skoda (1972): 8.18, 8.18a, 8.19a; G. Tian (1990): 8.18, 8.19a. H. Donnelly and C. Fefferman (1983): 8.18a. L. Moret-Bailly (key formula): 8.13, 8.16; M. Kneser (strong approximation): 8.16. G. W. Mackey (irreducibility criterion for induced representations): 8.18b.
- G. Shimura; R. Damerell, *L-functions of elliptic curves with complex multiplication I*, Acta Arith. 17 (1970), pp. 287–301 (§2, Theorem 1, p. 290; §6, p. 300); E. Hecke: 8.19b–8.19d. C. L. Siegel; H. Klingen: 8.19b. R. Weissauer; S. Böcherer (the basis problem by the doubling method): 8.17a, 8.19a. R. Weissauer, *Stabile Modulformen und Eisensteinreihen*, Lecture Notes in Math. 1219 (1986); S. Böcherer, *On the basis problem for Siegel modular forms of squarefree level*, RIMS Kôkyûroku 1523 (2006), pp. 1–11: 8.17a. N. Katz, *p-adic L-functions for CM fields*, Invent. Math. 49 (1978), pp. 199–297: 8.19b, 8.19c. C. Goldstein and N. Schappacher, *Séries d'Eisenstein et fonctions L de courbes elliptiques à multiplication complexe*, J. reine angew. Math. 327 (1981), pp. 184–218; C. Goldstein, *Valeurs spéciales de fonctions L*, Séminaire de théorie des nombres de Grenoble 10 (1981–1982), exposé 4, pp. 1–14 (Proposition 1.8, Théorèmes 2.1, 2.2, Corollaires 2.5, 2.6); G. Shimura, *On some arithmetic properties of modular forms of one and several variables*, Ann. of Math. 102 (1975); D. Blasius, *On the critical values of Hecke L-series*, Ann. of Math. 124 (1986), pp. 23–63: 8.19c. Published relatives of 8.15–8.17: K. Köhler; J. Burgos Gil, J. Kramer and U. Kühn; P. Hörmann; J. Bruinier, B. Howard, S. Kudla, M. Rapoport and T. Yang.
- J. H. Bruinier and B. Howard, *Arithmetic volumes of unitary Shimura varieties*, arXiv:2105.11274 (theorem numbers of version 3), Theorem A (Theorem 8.6.1): the exact arithmetic volume of the metrised Hodge bundle on the integral model, without level structure, of the Shimura variety of `GU(n − 1, 1)` over an imaginary quadratic field of odd discriminant, in terms of logarithmic derivatives of Dirichlet L-functions; a close precedent for 8.15d, 8.16 and 8.17.
