# Roadmap: local gain of theta chains

**Summary.** This roadmap proves the divisibility that a chain of theta lifts between definite unitary groups gains at the primes inert in the imaginary quadratic subfield `K` of an abelian CM host `E`, and bounds the colength of the sublattice of automorphic forms on which the gain holds. The objects are those of [ThetaChainsOnDefiniteUnitaryGroups](../ThetaChainsOnDefiniteUnitaryGroups/README.md): the lattices `ℳ^{int}_j` of integral algebraic forms on the unitary groups `U(X_j)` of the column spaces (values in the Weyl lattices), the step operators `K_j(ξ)` of a tuple `ξ` of twisting characters (theta lifts written as class-set operators with CM theta kernels), the chain lift `col_ξ`, the source lattice `M_u` of a word `u`, and the top period `P̃_ξ(φ, F)` against row forms `F`. At a prime `p ≥ 5` inert in `K` and unramified in `E`, the theta kernel of a step, read in the logarithmic coordinates of the Lubin–Tate formal groups of height two at the places above `p`, is an integral series times `exp(−β)` with `β` a Hermitian biextension cocycle, and the Taylor bounds of [TaylorBoundsAndDepthsOnHeightTwoFormalGroups](../TaylorBoundsAndDepthsOnHeightTwoFormalGroups/README.md) turn the large top entry `a_τ`, which stays in every weight of the chain, into an explicit power of `p` at every step.

The headline theorems are these. (1) *The gain of a step and of the chain lift* (4.10, 4.11). Under the size conditions of 4.10, let `p ≥ 5` be a prime inert in `K`, unramified in `E`, with `p ≤ X″` and of split type (complex conjugation is not a power of `Frob_p`), `𝔭 | p` a place of the field `𝕃`, and `ξ` a tuple unramified above `p`. Then every step maps `ℳ^{int}_{j−1}` into `p^{g⁰_j(𝔭) + F_j(𝔭) − E_{u,j}(𝔭) + [j=1]·v_p(D_Γ)}·ℳ^{int}_j` locally at `𝔭`, where `g⁰_j` is the operator-free gain, `F_j` the bulk and `E_{u,j}` the cost of the ledger of 4.9e–4.9f; hence `col_ξ(ℳ^{int}_0) ⊂ p^{Σ_j(g⁰_j + F_j − E_{u,j})(𝔭) + v_p(D_Γ)}·ℳ^{int}_m` locally at `𝔭`, and the periods of row forms have valuation at least `⌊e_𝔭·Σ_j(g⁰_j + F_j − E_{u,j})(𝔭)⌋` at `𝔭`. (2) *The refined gain on the Hecke image and its colength* (4.14, 4.15c). Let `𝒱` be a set of linked places above such a `p` with Hecke types and `𝒴 = ∏_{v∈𝒱}(y_v^m, p^{𝔵_v})`, the `y_v` being Hida-normalised Hecke operators at the places above `p`. On `𝒴·ℳ^{int}_0` the chain gains `Σ_j(g_j + F_j − E_{u,j})(𝔭) + v_p(D_Γ)` with the refined gain `g_j`: a top at an even position gains `γ_LT(p)·α_s` and a top at an odd position its whole ramp sum, at the price `P_j(v)` per step. If moreover the depth property `DepthBound(⌈dep_v⌉, D_p, sh_v, c*_p)` with `c*_p ≥ 8(D_p + 1)` holds at every `v ∈ 𝒱`, `m·Σ_v sh_v ≤ 1/2`, `p^e·ℳ^∨_0 ⊂ ℳ^{int}_0` and the standing conditions of 4.15c hold, then `𝒴·ℳ^{int}_0 ∩ p^τ·ℳ^{int}_0` has colength at most `e_R·rank·(τ + 2S·m·Σ_v sh_v)` in `ℳ^{int}_0`, with `τ = e + Σ_{v∈𝒱} m(⌈dep_v⌉ + D_p + 1)` and `S ≥ max_v 𝔵_v`. (3) *The gain sublattice* (4.16). Given served data with the depth property and `InertFreeUpTo 4`, the sublattice `N_u ⊂ M_u` cut out by these local conditions satisfies `N_u ⊂ p^{τ_N(𝔭)}M_u` and `length_{𝒪_𝔭}(M_u/N_u)_𝔭 ≤ e_𝔭·d^{all}_u·(τ_N(𝔭) + 𝔦(𝔭))` at every `𝔭` not above the level prime `T(u)`, and, under the hypotheses of 4.10 and 4.10a, for every `φ ∈ N_u` and every row form `F` the period `P̃_{ξ_𝔭}(φ, F)` is `0` or has valuation at least `⌊e_𝔭·𝔊_u(𝔭)⌋` at `𝔭`, `𝔊_u` being the net exponent of the ledger. (4) *The gain inequality* (4.17a). With the data of 4.17, at every `𝔭` above a prime `p ≤ X″` inert in `K` and not in `Drop`, `0 ≤ g_j(𝔭) ≤ 4|Φ_top|a/p` and `Σ_j Σ_{τ∈Φ_top(𝔭)} (V_{j,τ}(p) − ℒ(p)) − m·ℒ_f(p) ≤ Σ_j g_j(𝔭) − τ_N(𝔭)`, where `V_{j,τ}(p) = Σ_{i odd}(a_τ/p^i − w_j(par_τ(Frob_p^i)))₊` is the ramp sum of a top and `ℒ`, `ℒ_f` are explicit losses, whose sums over the primes weighted by `log p` are at most a constant times `b` (4.17b).

The roadmap builds on [ThetaChainsOnDefiniteUnitaryGroups](../ThetaChainsOnDefiniteUnitaryGroups/README.md), which supplies the chain, its integral forms, step operators and periods; on [TaylorBoundsAndDepthsOnHeightTwoFormalGroups](../TaylorBoundsAndDepthsOnHeightTwoFormalGroups/README.md), the first part of the same layer, which supplies the Taylor bounds on height-two formal groups and the depth of a weight; on [FrobeniusRestrictedRieszSums](../FrobeniusRestrictedRieszSums/README.md) for the hosts, their Frobenius data and the tops; on [IntegralWeylModulesOfGeneralLinearGroups](../IntegralWeylModulesOfGeneralLinearGroups/README.md) for the sandwich exponent between Weyl and dual Weyl lattices and the integral invariant projectors; and on [AutomorphicFormsOnReductiveGroups](../../AutomorphicFormsOnReductiveGroups/README.md) and [SmoothRepresentationsOfLocalGroups](../../SmoothRepresentationsOfLocalGroups/README.md) for Gross's models of algebraic modular forms and the Satake transform. Within the family [RiemannHypothesisForDirichletLFunctions](../README.md), the gain sublattice and the gain inequality feed the division inequality and the Frobenius-restricted inequality of the later theta-chain roadmaps.

Layer 4 here is the second part of the layer of that number (its first part is TaylorBoundsAndDepthsOnHeightTwoFormalGroups). It defines the positions, types and sides of the places above an inert prime (4.9), proves four statements on the normalised CM theta functions (4.9a–4.9d), and defines the ledger of gains, bulks and costs (4.9e, 4.9f); it then bounds a step at the inert primes, at `d` and elsewhere (4.10), at the type primes (4.10a), and the chain lift (4.11). At a prime of split type it builds the local model of the Hecke operators (4.12), the commutation of Hecke operators with the chain (4.13) and the refined gain on the Hecke image (4.14), and controls the colength of that image by depth theorems: elementary divisors along a progression (4.14a), the two-letter model at an edge with its key lemma, pairing, rank count, integral isotypic projectors and bad shares (4.14b–4.14h), the depth property (4.15), the walk lemma (4.15b), the colength of the Hecke image (4.15c), good orbits (4.15d), Theorems II and I for small and medium primes (4.15e, 4.15f), and an exchange lemma for colengths (4.15a). It ends with the gain sublattice (4.16), the kernels, the column bound and the colength at the level prime (4.16a–4.16c), and the data of the gain inequality, the inequality, the size of the loss, the selection of the tops and the choice of the top weights (4.17–4.17d).

## Conventions

**Fields.** `E` is the host (FrobeniusRestrictedRieszSums §0.1): finite abelian over `ℚ` with an imaginary quadratic subfield `K`; `F = E⁺` its maximal totally real subfield, `f = [F:ℚ]`; `G = Gal(E/ℚ)` and `c ∈ G` complex conjugation. Under `SplitRamification d` (FrobeniusRestrictedRieszSums §0.3) `K` is ramified only at the prime `d`; on the cyclic hosts (FrobeniusRestrictedRieszSums §0.4) `d ≡ 7 (mod 8)`, `K = ℚ(√−d)`, and a second imaginary quadratic field `ℚ(√−q) ⊂ E` is used; `(q, d)` is the *auxiliary pair*. `𝕃` is the field of places of ThetaChainsOnDefiniteUnitaryGroups §2.6: a finite Galois extension of `ℚ`, stable under complex conjugation and containing the coefficient field `𝕂 ⊃ E` of that target, read in `ℂ` through the embedding `σ₀` fixed there, with the conjugation `c_𝕃 = σ₀^{−1}∘(complex conjugation)∘σ₀`. Its finite places are written `𝔭`, with residue characteristic `p(𝔭)`, ramification index `e_𝔭` and weight `ϱ(𝔭) = log N𝔭/[𝕃:ℚ]` (so `Σ_{𝔭|p} ϱ(𝔭)e_𝔭 = log p`); `sz_𝔭(y) = 2ϱ(𝔭)e_𝔭·y`.

**CM type, places and Frobenius elements.** An embedding `ι₀ : E ↪ ℂ` is fixed; `Φ = Gal(E/K)` is identified with the CM type `{ι₀∘g : g ∈ Φ}` induced from `K` (`|Φ| = f`). Elements of `Φ` are called places. Frobenius elements are arithmetic (`Frob_p` acts as `x ↦ x^p` on residue fields; FrobeniusRestrictedRieszSums §0.2). On a cyclic host `G = A × ⟨c⟩ × ⟨σ_d⟩` (FrobeniusRestrictedRieszSums §0.4 (iv)). When `K = ℚ(√−d)`, `√−d ∈ K` denotes the root with `Im ι₀(√−d) > 0`, so that `Im τ(√−d) > 0` for every `τ ∈ Φ`.

**Primes of the construction.** The *type primes* `g₀, g₁` (ThetaChainsOnDefiniteUnitaryGroups §2.7) carry the depth-zero types; the primes `q, d` form the *auxiliary pair* (FrobeniusRestrictedRieszSums §0.4); the *level prime* `T(u) = N(π_u)` of a word `u` (ThetaChainsOnDefiniteUnitaryGroups §2.8) carries the new forms. The *twist places* `Q(ξ)` of a tuple `ξ` of twisting characters are its full ramification set (ThetaChainsOnDefiniteUnitaryGroups §2.5). For a type prime `g ∈ {g₀, g₁}` the prime `π_g𝒪_K` of `K` above `g` is fixed, and for a place `v` of `F` above `g`, `w_v` is the place of `E` above `v` and `π_g` (residue field `𝔽_g`).

**Theta lifts between definite groups.** The step of the column chain from level `j − 1` to level `j` is a definite dual pair in the homomorphism model (ThetaChainsOnDefiniteUnitaryGroups §3.2): the symplectic space is `𝕎_j := Hom_E(X_{j−1}, X_j)`, on which `(g, h)` acts by `x ↦ h∘x∘g^{−1}`, with the alternating form `Tr_{E/F}(δ_T·tr(x^†y))`, the scaling element `δ_T := √−d/d = −1/√−d` (ThetaChainsOnDefiniteUnitaryGroups §2.2), and the standard additive character of `𝔸_F/F` (equivalently the form `Tr_{E/F}(δ_T·tr(y^†x))` with the complex conjugate character); it is a homomorphism pair in the normal form of ThetaChainsOnDefiniteUnitaryGroups §2.2a, and `x^†` is the adjoint of a homomorphism of Hermitian spaces. In the conventions of ThetaLiftsForDefiniteUnitaryGroups (standard character, symplectic form built from the two Hermitian forms and a fixed purely imaginary element, here taken to be `δ_T`, which is not the `√−d` of this roadmap) this is the homomorphism pair of ThetaLiftsForDefiniteUnitaryGroups §0.1 whose first space is the dual `X_{j−1}^∨` (on which `U(X_{j−1})` acts contragrediently) and whose second space is `X_j` with the skew form `δ_T⟨,⟩`, read through the dictionary of ThetaLiftsForDefiniteUnitaryGroups §2.5. Since `Im τ(δ_T) > 0` for `τ ∈ Φ`, the embedding which that roadmap attaches to the real place below `τ` is the conjugate embedding `c∘τ`, with sign `−1` and complex structure `(c∘τ)(i)`. Translation: a weight `λ` of that roadmap on `U(X_{j−1})` is the weight `λ` at `τ`; a weight `λ` on `U(X_j)` is the dual weight `λ^∨ = (−λ_n, …, −λ_1)` at `τ` (the rule "dual weight at `τ`" holds for the second group only); an infinity type `s` of that roadmap is `−s` at `τ`. With the infinity types `−2w_j(τ)` of both groups at `τ`, that dictionary gives the Fock types `(V_{μ+N_j/2−w_j(τ)})^∨ ⊗ V_{(μ,0)+N_{j−1}/2−w_j(τ)}` at `τ` (a half-integer added to a weight is added to each entry), the dual of the first module tensor the second, and, at the split places where the splitting characters are unramified, the Satake relation of ThetaLiftsForDefiniteUnitaryGroups §2.5 (d) with constant `1`, without inversion. The theta functions of ThetaChainsOnDefiniteUnitaryGroups Layer 3 are the complex conjugates of its Bargmann readings (whose CM type is `cΦ`): they are holomorphic in the `Φ`-coordinates. The weights and infinity types of the chain are written at the places of `Φ`. Step `j` has the Hecke character `μ_j` and the step weight `w_j = e_{j−1}` (ThetaChainsOnDefiniteUnitaryGroups §2.3); the columns grow by `t + 1`.

**Integral structures.** For a dominant weight `λ`, `∇_ℤ(λ)` is the dual Weyl lattice (the integral polynomials of the polynomial model of ThetaChainsOnDefiniteUnitaryGroups §3.1, spanned by products of minors) and `Δ_ℤ(λ) ⊂ ∇_ℤ(λ)` the Weyl lattice, its dual for the invariant form; the product of leading minors `v_λ` lies in both. The column side of the chain (the integral forms `ℳ_j^{int}` of ThetaChainsOnDefiniteUnitaryGroups §3.1, the chain lift, the source lattices of ThetaChainsOnDefiniteUnitaryGroups §3.8 and their restriction to `U(X^h)`) takes values in `Δ_ℤ`, in the coordinates of a basis of the dual class lattice; the row forms on `U(X^h)` paired with it take values in `∇_ℤ` (the forms `ℳ^∨`), so that every class term of the pairing is integral and the only loss is the stabiliser orders (ThetaChainsOnDefiniteUnitaryGroups §3.6, ThetaChainsOnDefiniteUnitaryGroups §3.10). At the top, a class `𝒸` of `U(X^h)` gives the class `𝒸̃` of level `m` with class lattice `L_𝒸 ⊕ 𝒪_E z_u`, `z_u = π_u e_{N_m}`, and the restriction to `U(X^h)` is integral at every finite place (ThetaChainsOnDefiniteUnitaryGroups §3.9).

**Periods.** The top period `P̃_ξ(φ, F)` (ThetaChainsOnDefiniteUnitaryGroups §3.9) is linear in the column `φ` and conjugate-linear in the row form `F`. The conjugation is that of the coefficients of the row form, never of the column or of the place at which the column is bounded: a bound for the period at a place `𝔭` of `𝕃` uses the column at `𝔭` and the row form at `c_𝕃(𝔭)` (ThetaChainsOnDefiniteUnitaryGroups §3.10). The cost of the level prime `T(u) = N(π_u)` sits at the places above `π_u` and is `0` at those above `π̄_u` (4.16).

**Quantifier order and sizes.** Constants named before `ε` do not depend on `ε`; the scale `x` and everything chosen at it come after `ε`. Between them come the numbers that may depend on `ε`: the layer exponent `A_n` of `SizeA` (at most the constant `A_max`), which the size predicates of ThetaChainsOnDefiniteUnitaryGroups §2.1 take as an argument, and the exponent `c_s > 0` of the inert-free bound of 4.17 (every prime inert in `K` exceeds `max(12, x^{c_s})`). The size conditions are named predicates: those of ThetaChainsOnDefiniteUnitaryGroups §2.1, grouped into the host predicates `SizeA`, `SizeN`, `SizeD`, `SizeRd`, `SizeQD`, `SizeInert`, `SizeDep` and the parameter predicates `SizeM`, `SizeK`, `SizeW`, `SizeMf`, `SizeT`, `SizeTheta`, with their conjunction `Size(x, ε)`; and `SizeSc` of ThetaChainsOnDefiniteUnitaryGroups §2.3b. "The size conditions of ThetaChainsOnDefiniteUnitaryGroups §2.1" means `Size(x, ε)`; a target that uses a single predicate names it.

### Table of symbols

| Symbol | Meaning | Defined |
|---|---|---|
| `E, F = E⁺, f, c, G` | host field, its maximal totally real subfield, `[F:ℚ]`, complex conjugation, `Gal(E/ℚ)` | FrobeniusRestrictedRieszSums §0.1, FrobeniusRestrictedRieszSums §0.2 |
| `K, d, √−d` | the imaginary quadratic subfield; the prime of `SplitRamification d` (`K = ℚ(√−d)` on the cyclic hosts) and the root with `Im ι₀(√−d) > 0` | FrobeniusRestrictedRieszSums §§0.1–0.3, Conventions |
| `Φ, ι₀, τ` | `Gal(E/K)` and the CM type it defines through `ι₀`; its elements, the places | FrobeniusRestrictedRieszSums §0.1 |
| `Frob_p` | arithmetic Frobenius | FrobeniusRestrictedRieszSums §0.2 |
| `σ_d` | the nontrivial element of the inertia group at `d` | FrobeniusRestrictedRieszSums §0.3 |
| `SplitRamification d, InertFreeUpTo B` | host predicates: every ramified prime other than `d` splits in `K` and `I_d = {1, σ_d}`, `σ_d ∉ Φ`; no prime `p ≤ B` is inert in `K` | FrobeniusRestrictedRieszSums §0.3 |
| `(q, d)` | auxiliary pair | FrobeniusRestrictedRieszSums §0.4 |
| `A` | `Gal(E/ℚ(√−q, √−d)) ⊂ Φ` | FrobeniusRestrictedRieszSums §0.4 |
| `par_τ` | partner bijection `G∖Φ → Φ`, `g ↦ cgτ` | FrobeniusRestrictedRieszSums §0.6 |
| `Φ_top` | the tops, `Φ_top ⊂ A` | FrobeniusRestrictedRieszSums §0.6 |
| `ω, ω₀, δ_top` | coset profile and its lower bound, selection density | FrobeniusRestrictedRieszSums §0.7 |
| `𝔭, p(𝔭), e_𝔭, ϱ(𝔭), sz_𝔭` | finite place of `𝕃`, residue characteristic, ramification index, `log N𝔭/[𝕃:ℚ]`, `sz_𝔭(y) = 2ϱ(𝔭)e_𝔭y` | Conventions |
| `k, m, t, r, N_j` | base rank, chain length, rank step, `r = k + m − 1`, `N_j = k + j(t + 1)` | ThetaChainsOnDefiniteUnitaryGroups §2.1 |
| `x, ε, b, a, X′, b′, w″, X″` | scale, exponent, `e^{x^ε}`, `x·b`, `e^{x^{ε/3}}`, `a/X′`, `b′/(x\|A\|)`, `x\|A\|X′` | ThetaChainsOnDefiniteUnitaryGroups §2.1 |
| `ϑ, B₀` | thick-weight width, the budget `B₀ = fmbx^ε` | ThetaChainsOnDefiniteUnitaryGroups §2.1 |
| `Size(x, ε)` | conjunction of the host predicates `SizeA, SizeN, SizeD, SizeRd, SizeQD, SizeInert, SizeDep` and the parameter predicates `SizeM, SizeK, SizeW, SizeMf, SizeT, SizeTheta` | ThetaChainsOnDefiniteUnitaryGroups §2.1 |
| `SizeSc` | size predicate of the words | ThetaChainsOnDefiniteUnitaryGroups §2.3b |
| `A_n, c_s` | numbers that may depend on `ε`: the layer exponent of `SizeA` (`A_n ∈ [1, A_max]`), the exponent of the inert-free bound; chosen after `ε` and before the scale | ThetaChainsOnDefiniteUnitaryGroups §2.1, 4.17 |
| `x₀` | threshold of the scale | ThetaChainsOnDefiniteUnitaryGroups §2.1 |
| `X_j, X^h` | column spaces, hyperplane of `X_m` | ThetaChainsOnDefiniteUnitaryGroups §2.2 |
| `𝔞₀` | `𝔞₀𝔞̄₀ = 𝔇_{E/K}^{−1}` | ThetaChainsOnDefiniteUnitaryGroups §2.2 |
| `u` | a word | ThetaChainsOnDefiniteUnitaryGroups §2.3 |
| `a_τ, a⁻_τ, θ_a, A_w` | top entry and negative bottom entry, top window `θ_a = 1/(k·x^{A_w/2})` | ThetaChainsOnDefiniteUnitaryGroups §2.3b |
| `w_j(τ)` | step weights `e_{j−1}(τ)` (thick, top or thin) | ThetaChainsOnDefiniteUnitaryGroups §2.3 |
| `Λ_j(τ), ν_j(τ), σ(τ)` | weight on `X_j`, Young diagram of step `j`, top weight on `X^h` | ThetaChainsOnDefiniteUnitaryGroups §2.3 |
| `s⁺_j(τ), s⁻_j(τ), p_j, q_j` | the model parameter of step `j`: the first `p_j = k + j − 1` and the last `q_j = m − j` entries of `(v(τ); −e′(τ))`; `s⁻_{j,c} = −e′_{j+c}` | ThetaChainsOnDefiniteUnitaryGroups §2.3 |
| `Sc` | cloud size `4kΔ_w` | ThetaChainsOnDefiniteUnitaryGroups §2.3 |
| `(W1)–(W6), κ_j` | conditions of a weight datum, the shift `(k + (2j − 1)(t + 1))/2` of the step diagrams | ThetaChainsOnDefiniteUnitaryGroups §2.3 |
| `μ_j` | Hecke characters of the chain | ThetaChainsOnDefiniteUnitaryGroups §2.4 |
| `ξ, ξ_𝔭, Q(ξ)` | tuple of twists (`ξ = 1` the base tuple), tuple used at `𝔭`, twist places (full ramification set) | ThetaChainsOnDefiniteUnitaryGroups §2.5 |
| `𝕃, σ₀, c_𝕃` | field of places (containing the coefficient field `𝕂`), its fixed embedding and conjugation | ThetaChainsOnDefiniteUnitaryGroups §2.6 |
| `g₀, g₁` | type primes | ThetaChainsOnDefiniteUnitaryGroups §2.7 |
| `T(u), π_u` | level prime of the word `u`, `T(u) = N(π_u)` | ThetaChainsOnDefiniteUnitaryGroups §2.8 |
| `S(ξ)` | the places where levels are not hyperspecial | ThetaChainsOnDefiniteUnitaryGroups §2.9 |
| `𝔡, L_𝔡, 𝔽_v, ⟨a⟩_v` | pairs and class lattices at `T(u)`, residue field, diamond operators | ThetaChainsOnDefiniteUnitaryGroups §2.9b |
| `∇_ℤ, Δ_ℤ` | dual Weyl and Weyl lattices | ThetaChainsOnDefiniteUnitaryGroups §3.1 |
| `ℳ_j, ℳ_j^{int}, ℳ_j^∨, 𝒸, L_𝒸` | chain forms of level `j`; the `Δ_ℤ`-valued (integral) and `∇_ℤ`-valued forms; a class, its class lattice | ThetaChainsOnDefiniteUnitaryGroups §3.1 |
| `Λ_K, 𝔙(L, L′), c_τ` | the lattice `δ_K·ι₀(𝒪_K)` of discriminant `1`, the period lattice, generators of the axis ideals `𝔩_τ𝒪_𝕃` | ThetaChainsOnDefiniteUnitaryGroups §3.1a |
| `θ, θ₀, s₂` | the reduced theta function of `ℂ/Λ_K`; its even normalised Fock translate, from which the family is built; the constant `s₂(Λ_K)` | ThetaChainsOnDefiniteUnitaryGroups §3.1c |
| `Θ^{CM}_{L,L′}` | the family of CM theta functions | ThetaChainsOnDefiniteUnitaryGroups §3.1d |
| `Θ_{𝒸,𝒸′}(ξ), ρ^ξ_j, K_j(ξ), col_ξ` | theta function of a step at a pair of classes, class characters, step operator, chain lift (`col_ξ` is the sum over index paths of composites) | ThetaChainsOnDefiniteUnitaryGroups §3.2, ThetaChainsOnDefiniteUnitaryGroups §3.5 |
| `s_div,j` | `w_j − N_{j−1}/2` | ThetaChainsOnDefiniteUnitaryGroups §3.2 |
| `D_Γ` | least common multiple of the stabiliser orders | ThetaChainsOnDefiniteUnitaryGroups §3.6 |
| `U_v, D_v, FF_v, Gs_v` | level operator at `T(u)` and its transpose; the finite Fourier transform (`FF_v = D_vGs_v` on new forms); Gauss operators | ThetaChainsOnDefiniteUnitaryGroups §3.7 |
| `M_u^{all}, M_u, d_u^{all}, d_u` | full and new source lattices of the word `u`, their ranks | ThetaChainsOnDefiniteUnitaryGroups §3.8 |
| `P̃, P̃_ξ, res` | top period, of the chain of the tuple `ξ`; restriction to `U(X^h)` | ThetaChainsOnDefiniteUnitaryGroups §3.9 |
| `γ_LT(p), ρ_LT(p)` | `p/(p² − 1)`, `1/(p² − 1)` | TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.1 |
| `w̃_j(τ)` | local step weights `w_j(τ) − κ_j` | Layer 4 |
| `g_j, g⁰_j, g^D_j, F_j, E_{u,j}, Ẽ_{u,j}, τ_N, 𝔦, 𝔊_u` | the ledger of step `j` at `𝔭`: gain, operator-free gain, gain off `Drop`, bulk, cost, the cost without the stabiliser term `v_p(D_Γ)`, served colength, colength beyond `τ_N`; the net exponent of the chain | 4.9, 4.9e, 4.9f |
| `r⁰_j(v), r^H_j(v), P_j(v), 𝔵_v, A^{ev}_v, c_G` | local exponents of a place, its price, its excess, the even diagram value, `c_G = 4Sc` | 4.9e |
| split, conjugate, odd conjugate type; linked places; `𝒜_p, ℬ_p, 𝒱_p, Drop` | types of a prime inert in `K` by its Frobenius; places with two tops at odd distance in their orbit; the places above `p` whose positions lie in the coset `A` of the tops and the others, the served places, the dropped primes | 4.9, 4.17 |
| `𝔖(p), e_p, ϖ_g` | the share `m·Σ_{v∈𝒱_p}sh_v` of the served places; sandwich exponent (`p^{e_p}ℳ^∨_0 ⊂ ℳ^{int}_0` away from `T(u)`; in 4.17 the number `max_uΣ_τ(k(k−1)/2)⌊log_p(Λ_0(τ)_0 − Λ_0(τ)_{k−1} + k − 1)⌋`); `ϖ_g = π_g`, the prime of `K` above a type prime modulo which the datum is taken (ThetaChainsOnDefiniteUnitaryGroups §2.4 (b), ThetaChainsOnDefiniteUnitaryGroups §3.2 Lemma (ii)) | 4.9e, 4.9f, 4.17 |
| `𝔢_u` | cost at the level prime | 4.9f |
| `n_cyc` | the number of places of the cycle at odd conjugate type | 4.9 |
| `y_v, 𝒴, DepthBound` | Hida-normalised Hecke operators; the product of the ideals `(y_v^m, p^{𝔵_v})`; the depth property | 4.12, 4.14, 4.15 |
| `(H_I), Bl_μ(b), μ₀` | the hypotheses of the two-letter model at an edge; block lattices; the margin of the model | 4.14b |
| `Λ_log` | the log-size parameter `C·N₁²·log a` of the gain | 4.14b, 4.15e, 4.17 |
| `N_u, N_T(𝔭)` | sublattice of `M_u` on which the gains are proved; its local form at `T(u)` | 4.16 |
| `Δ_b, Z_bad` | width of the box of the negative bottom entries at the tops; the weighted count of the unserved tops | 4.17, 4.17d |
| `h_A` | `2 + 8ε` | 4.17 |
| `D^±_j, a^±_{j,τ}, D^H_j` | the two diagrams of step `j` (rows `a⁺_{j,τ,i} = s⁺_i + w_j − (p_j − 1 − i) − (t + 1)/2`, `a⁻_{j,τ,c} = e′_{j+c} − w_j − c − (t + 1)/2`, all `≥ 1`) and their total sizes; `D^H_j = D⁺_j + D⁻_j`, the type-prime term of the bulk (`F_j = −D^H_j/2` above the type primes) | 4.9f (d) |

## Layer 4: The local gain at primes inert in `K`

This layer holds the targets 4.9–4.17d of Layer 4. They apply to the chain the local theory of the first part of the layer, TaylorBoundsAndDepthsOnHeightTwoFormalGroups §§4.1–4.8c and §§4.18–4.19f, which uses no target of Layers 0–3. That part shows that a function bounded on the Lubin–Tate formal group of height two (logarithm `Σ_e T^{p^{2e}}/p^e`) has its `n`-th derivative at the origin divisible by `p^{γ_LT(p)n − O(log n)}`, with `γ_LT(p) = p/(p² − 1) = 1/p + 1/p³ + ⋯`, and that in the logarithmic coordinates of two dual isotropic formal groups a series of the form (bounded series)`·exp(−β)`, `β` a Hermitian biextension cocycle, gains at the rate `γ_LT(p)` except for exactly one power of `p` for each bi-power monomial of `β` that a derivative can absorb. Two local engines bound that price: weights at radii chosen by a linear programme, the *flow programme* (TaylorBoundsAndDepthsOnHeightTwoFormalGroups §§4.3, 4.5–4.7), and the classification of `β` with a count of pairs of boxes (TaylorBoundsAndDepthsOnHeightTwoFormalGroups §§4.4, 4.4a, 4.8); TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.8a bounds the jets of a Gaussian. On the row side, the depth of a weight at a framed point of a unitary PEL moduli problem is at most what the flow programme allows along Frobenius orbits, at the points of a unitary moduli problem of any signature (TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.19f).

*The gain of the chain.* At a prime `p ≥ 5` inert in `K` and unramified in `E`, each step of the chain is divisible by an
explicit power of `p`. When complex conjugation is not a power of `Frob_p`, every place `v` of `F` above `p` splits in `E` as
`𝔓𝔓̄`, and the theta function of a step kernel has the shape above in the coordinates of the two dual isotropic formal groups at
`𝔓` and `𝔓̄`. The CM curve enters through four statements on the normalised theta functions (4.9a–4.9d: the host property, the
hyperbolic shape, the kernel at `d`, the folded shape at the primes of odd conjugate type). Because the large entry `a_τ` stays in
every weight `Λ_j`, every step gains again and the gains add (4.10, 4.11). The ledger (4.9, 4.9e, 4.9f) records, place by place,
the gain, the bulk divisibility of the `k − 1` short rows (the number that also bounds the depth of the row side, TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.19f), and the
costs: at the primes inert in `K` (where part of the bulk is not used and is returned as a cost), at `d` (a Gaussian, TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.8a), at
the type primes (4.10a) and at the level prime. Where two top places lie at an odd distance in one Frobenius orbit, the
operator-free bound loses the linked terms; they are recovered on the image of Hida-normalised Hecke operators at the places
above `p` (4.12–4.14), a sublattice whose colength is controlled by depth theorems for these images (4.14a–4.15f, 4.15a). The
layer then gives the sublattice on which the gains are proved (4.16), its form and its colength at the level prime
(4.16a–4.16c), and the inequality between the gains and the Frobenius-restricted prime sums (4.17–4.17d).

*Local conventions.* `v_p` is the valuation with `v_p(p) = 1` on every complete extension of `ℚ_p`, and `|·|` the
absolute value with `|p| = p^{−1}`; `lg_p(y) := ⌊log_p max(y, 1)⌋ + 1`. `C`, `C_A` denote absolute constants; `C₀`, `C_m`,
`C_H`, `Y_b` are the absolute constants fixed in 4.14b; `C_g` is a constant fixed before `ε`.
For `𝒪_𝕃`-lattices `A`, `B` in `𝕃`-spaces, a linear
map `φ` and a real `s`, "`φ(A) ⊂ p^s B` locally at `𝔭`" means that every `φ(a)` is `c·b` with `b ∈ B ⊗ 𝒪_{𝕃,𝔭}` and
`v_𝔭(c) ≥ e_𝔭 s`. The field of places `𝕃` is read in `ℂ` through the embedding `σ₀` of ThetaChainsOnDefiniteUnitaryGroups §2.6, and `c_𝕃` is the
conjugation of ThetaChainsOnDefiniteUnitaryGroups §2.6; the top period `P̃_ξ(φ, F)` of ThetaChainsOnDefiniteUnitaryGroups §3.9 is linear in the column `φ` and conjugate-linear in the row form
`F`, so a bound for the period at `𝔭` uses the column at the same place `𝔭`. *Integral structures (ThetaChainsOnDefiniteUnitaryGroups §3.1):* `ℳ^{int}_j` is the
lattice of forms whose values, in the coordinates of a basis of the dual class lattice, lie in the Weyl lattices `Δ_ℤ`
(the *integral forms*), and `ℳ^∨_j` the lattice of forms with values in the dual Weyl lattices `∇_ℤ` (the span of the
products of minors), at the places not above `T(u)`; `ℳ^{int}_j ⊂ ℳ^∨_j` there. A *row form* is a form `F` on `U(X^h)` of
weight `σ` with values in the dual Weyl lattices (`ℳ^∨` of ThetaChainsOnDefiniteUnitaryGroups §3.1 for `X^h`); ThetaChainsOnDefiniteUnitaryGroups §3.10 pairs it integrally, up to the stabiliser
denominators, with the restrictions `res φ′` (ThetaChainsOnDefiniteUnitaryGroups §3.9) of the integral forms `φ′ ∈ ℳ^{int}_m`. *Duality:* `Δ_ℤ(λ)` and `∇_ℤ(λ)` are
dual for the contravariant form of ThetaChainsOnDefiniteUnitaryGroups §3.1, so a polynomial value `v` lies in `p^B·Δ_ℤ(λ)` locally at `𝔭` exactly when its
pairings with all products of minors (a spanning set of `∇_ℤ(λ)`) lie in `p^B𝒪_{𝕃,𝔭}`.
*Indices:* weights and Young diagrams are indexed from `0`, as in ThetaChainsOnDefiniteUnitaryGroups §2.3: at a top place `λ_0(τ) = a_τ` and
`λ_{k−1}(τ) = −a⁻_τ`, and the rows of a diagram `ν` are `ν_0 ≥ ν_1 ≥ ⋯`. *Local step weights:*
`w̃_j(τ) := w_j(τ) − κ_j` (`κ_j` of ThetaChainsOnDefiniteUnitaryGroups §2.3); by ThetaChainsOnDefiniteUnitaryGroups §2.3(c) the first `k` rows of `ν_j(τ)` are `λ(τ) + w̃_j(τ)·1`, and
`w̃_{j+1}(τ) − w̃_j(τ) ≥ 2`, `w̃_1(τ) + λ_{k−1}(τ) > 0` at every `τ`. *Primes:* the gain and the costs at primes inert in
`K` are defined for `p ≥ 5`, and nothing in this layer concerns a prime `2` or `3` inert in `K`; a statement that quantifies
over all primes inert in `K` assumes `InertFreeUpTo B` (FrobeniusRestrictedRieszSums §0.3) with the bound `B` it names (`B ≥ 4` for the step bounds and
the sublattice, `B ≥ 12` wherever the small-prime theorem 4.15e, stated for `p ≥ 13`, is used).

### 4.9 Definitions: positions, types and sides

Positions, types and sides at a prime `p` inert in `K`.
(a) *Positions.* Let `p ≥ 5` be inert in `K` and unramified in `E`; `Frob_p` has even order `n′ = n′_p` in `G`. The
orbits of `⟨Frob_p, c⟩` on `G` correspond to the places `v` of `F` above `p`. For each such `v` fix once a base place
`τ_0(v) ∈ Φ` in its orbit and put `τ_s := τ_0Frob_p^s` for `s` even and `τ_s := cτ_0Frob_p^s` for `s` odd (`s ∈ ℤ/n′`);
`τ_{s+e} = par_{τ_s}(Frob_p^e)` for `e` odd (FrobeniusRestrictedRieszSums §0.6). *Types:* `p` is of *split type* if `c ∉ ⟨Frob_p⟩` (the places of `F`
above `p` split in `E`, and the `τ_s` are the `n′` places of `Φ` in the orbit); of *conjugate type* if `Frob_p = c`; and of
*odd conjugate type* if `c ∈ ⟨Frob_p⟩` and `Frob_p ≠ c` (then `n_cyc := n′/2` is odd, `c = Frob_p^{n_cyc}`, and each place of `Φ` in
the orbit occurs at two positions `s`, `s + n_cyc` of opposite parity). *The cycle of places* at odd conjugate type: with
`h := cFrob_p`, of order `n_cyc ≥ 3`, `τ_s = τ_0h^s` for every `s`, so the places of `Φ` in the orbit of `v` are the `n_cyc` places
`τ_0h^e`, `e ∈ ℤ/n_cyc`, each at the two positions `s ≡ e (mod n_cyc)`; the bulk, the cost and the step bound at such a prime are
written on this cycle, each place once. `𝔗_v := {s : τ_s ∈ Φ_top}`. The place `v` is
*linked* if some `s ∈ 𝔗_v` has `s + e ∈ 𝔗_v` for an odd `e < n′`, and `p` is linked if some `v | p` is. *Sides:* if `p`
is inert in `K` and in `ℚ(√−q)` (FrobeniusRestrictedRieszSums §0.6(iv)), `𝒜_p` is the set of places `v | p` whose positions lie in the coset `A` of
the tops and `ℬ_p` the set of the others; if `p` is inert in `K` and split in `ℚ(√−q)`, `𝒜_p := ∅` and `ℬ_p` is the set
of all places above `p`.

*Checks.* In a host of FrobeniusRestrictedRieszSums §0.4 with tops `Φ_top ⊂ A`: at a prime inert in `K` and in
`ℚ(√−q)`, `h := cFrob_p` lies in `A`, the positions of the orbit of a top `τ` are `τh^s` (all in `A`), and `p` is of split
type iff `h` has even order (then `n′ = ord(h)`), of conjugate type iff `h = 1`, and of odd conjugate type iff `h ≠ 1` has
odd order (`c ∈ ⟨ch⟩` iff some odd power of `h` is `1`; the class is empty when `A` is a `2`-group); at a prime inert in `K`
and split in `ℚ(√−q)` the odd positions lie in `cσ_dA`, so no top has a top at odd distance and `p` is unlinked
(FrobeniusRestrictedRieszSums §0.6(iv)). The places of `ℬ_p` at a prime inert in `K` and in `ℚ(√−q)` carry no top, and every linked place lies in `𝒜_p`.

*NEW* (definitions). *Needs:* FrobeniusRestrictedRieszSums §0.3, FrobeniusRestrictedRieszSums §0.4, FrobeniusRestrictedRieszSums §0.6.

### 4.9a The host property at an inert prime

Let `p ≥ 5` be inert in `K` and
unramified in `E`, `𝔭 | p` a place of `𝕃`, `W` the ring of integers of the completion of the maximal unramified extension
of `ℚ_p` (in `ℂ_p` through `𝔭`) with its Frobenius `σ`, `ℓ(T) := Σ_{j ≥ 0}T^{p^{2j}}/p^j` with its law `F` and the
endomorphisms `[α] = ℓ^{−1}(α·ℓ)`, `α ∈ 𝒪_{K,p}` (LubinTateFormalModulesAndQuasiCanonicalLifts §4.3, sign `+`), and
`θ(z) := σ_{Λ_K}(z)e^{−s₂z²/2}` the reduced theta function of `ℂ/Λ_K` (ThetaChainsOnDefiniteUnitaryGroups §3.1c, with `Λ_K` of ThetaChainsOnDefiniteUnitaryGroups §3.1a; `σ_{Λ_K}` the Weierstrass sigma function, `s₂` the
constant for which `|θ(z)|²e^{−π|z|²/area(Λ_K)}` is `Λ_K`-periodic). Then:
(i) *model:* there are `g₂, g₃ ∈ W` with unit discriminant, the invariants of `ℂ/Λ_K` up to a homothety by a unit, and
`c ∈ W^×` such that the algebraic parameter `t = −2℘/℘′` of that model, at `z = c·ℓ(T)`, is an integral series in `T`
with linear term `T` (the formal group of the model is the Lubin–Tate law of `ℓ`; this is LubinTateFormalModulesAndQuasiCanonicalLifts
§§4.3, 4.4 for the model below, with the sign of the route);
(ii) *host property:* with `φ(T) := −log(θ(cℓ(T))/(cT))`, for self-dual `L ⊂ X_{j−1}`, `L′ ⊂ X_j`, every basis `b_1, …, b_n` of
the `𝒪_K ⊗ ℤ_(p)`-module `𝔞₀Hom_{𝒪_E}(L, L′) ⊗ ℤ_(p)` orthonormal for the Hermitian form `Tr_{E/K}tr(x^†y)` of ThetaChainsOnDefiniteUnitaryGroups §3.2 (`𝔞₀` is a
unit at `p`; such bases exist), and every `p`-integral finite combination `G` of Fock translates of `Θ^{CM}_{L,L′}` (ThetaChainsOnDefiniteUnitaryGroups §3.1d) by
torsion points of order prime to `p`, the series `exp(Σ_iφ(T_i))·G(c·Σ_ib_iℓ(T_i))` in `T_1, …, T_n` is integral.

*Route.* A formal consequence of four facts and one lemma. (Θ1) is (i): after a homothety by a unit the CM curve has a model over
`W` with unit discriminant whose reduction over `𝔽_{p²}` has `p²`-power Frobenius `[−p]` (KNOWN: Deuring; the good model rests on
class field theory for `K`, Artin reciprocity); by LubinTateFormalModulesAndQuasiCanonicalLifts §4.4 its formal group, in the
parameter `t`, is the Lubin–Tate module of `−p`, strictly isomorphic over `W(𝔽_{p²})` to the law of `ℓ_{−1}` (LubinTateFormalModulesAndQuasiCanonicalLifts §4.3 (iii)); and
`ℓ_{−1}(𝔲T) = 𝔲ℓ(T)` for a unit `𝔲 ∈ W(𝔽_{p⁴})` with `𝔲^{p²−1} = −1` passes to the sign `+` of `ℓ` (this is why `c` is a unit of `W`).
Torsion points of order prime to `p` are integral. The other
three facts are proved in the algebraic parameter `t` of the model and carried to `T` by the integral change of parameter of
(i). (Θ2) *Translates:* `exp(φ)·U_sθ₀` is integral for every torsion point `s` of order prime to `p` (`θ₀` the even normalised Fock
translate of `θ` by a point of order two from which the family of ThetaChainsOnDefiniteUnitaryGroups §3.1d is built, ThetaChainsOnDefiniteUnitaryGroups §3.1c): for a torsion point `s` outside the formal
group, `(log U_sθ)″ = −(℘(z + s) + s₂)` is an integral series in `t`, the value `(U_sθ)(0)` is a unit, and for `p ∤ N` (`N` the order
of `s`) `(t·U_sθ/θ)^N` is `(U_sθ)(0)^N` times a unit series, so `e^{φ}U_sθ ∈ (U_sθ)(0)·(1 + t𝒪[[t]])`; `s₂` is integral at `p` by
`α(α − ᾱ)s₂ = Σ_{0≠P∈ker α}℘(P)` for an `α ∈ 𝒪_K` that is a unit at `p` with `α − ᾱ` a unit (such `α` exist for every `p ∤ d`).
*Cube:* `β₀(x, y) := φ(x +_F y) − φ(x) − φ(y)` is biadditive up to `≃` (the theorem of the cube for `σ_{Λ_K}`: the cube expression
of `σ` is, by the Frobenius–Stickelberger formula, a unit series times `t(P₁+P₂+P₃)∏t(P_i)/∏_{i<j}t(P_i+P_j)`). (Θ3) *Norm
relation:* `φ([α]T) − ασ(α)φ(T)` has integral exponential for every unit `α` of `𝒪_{K,p}`: for `α ∈ 𝒪_K` a unit at `p` with `Nα` odd,
`exp(Nα·φ − φ∘[α]) = (αt/[α]t)·∏_{P∈S/±}t²(x(t) − x(P))`, `S = ker α ∖ {0}` (the isogeny formula; kernel points are integral because
`α` is a unit at `p`); for `Nα` even its square holds and `p` odd allows halving; in general by density of these `α` in `𝒪_{K,p}^×`,
`≃` being closed under coefficientwise limits. The cube and (Θ3) are the hypotheses (C), (N) of HodgeTateLatticesAndLubinTateLogarithms
§3.6, which gives (F1)–(F2) of TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.4a. (Θ4) *Frame:* orthonormal bases exist (four copies of the trace form of `E/K` are
standard; weak approximation for the unitary group), and in them the product coordinates in which the fourth tensor power of
`Θ^{CM}` is a product of translates of `θ₀` (ThetaChainsOnDefiniteUnitaryGroups §3.1d (f)) are a unitary integral substitution of the coordinates along `b`.
The lemma: HodgeTateLatticesAndLubinTateLogarithms §3.6 (a) (`Σ_iφ` is invariant up to `≃` under unitary substitutions, `p` odd) turns the
fourth tensor power of `exp(Σ_iφ(T_i))·G` into an integral unit times the same expression in the product coordinates, which is
integral by (Θ2); a series whose fourth tensor power is integral is integral (the coefficient at `(κ, κ, κ, κ)` is a fourth
power). The proofs of the reductions to the base pair (weak approximation, transport by rational isometries, tensor products
from rank `2 × 2`) are not given here.

*KNOWN* in kind (Serre–Tate, Deuring, Lubin–Tate for the model, from class field theory for `K`; the theorem of the cube;
Bannai–Kobayashi for one curve at ordinary primes), *NEW* in this form. *Needs:* ThetaChainsOnDefiniteUnitaryGroups §2.6, ThetaChainsOnDefiniteUnitaryGroups §3.1a, ThetaChainsOnDefiniteUnitaryGroups §3.1c, ThetaChainsOnDefiniteUnitaryGroups §3.1d, ThetaChainsOnDefiniteUnitaryGroups §3.2;
LubinTateFormalModulesAndQuasiCanonicalLifts §§4.3, 4.4 and HodgeTateLatticesAndLubinTateLogarithms §3.6.

### 4.9b The hyperbolic shape at a place of split type

In the setting of 4.9a let `p` be
of split type and `v | p` a place of `F`, split in `E` as `𝔓𝔓̄`. There are integral vectors `f_e, f′_e` (`e` in a finite
set) fixed by `σ²` with `Σ_iσ(f_{e,i})f_{e′,i} = 0 = Σ_iσ(f′_{e,i})f′_{e′,i}` and `Σ_iσ(f_{e,i})f′_{e′,i} = δ_{ee′}` (a
*hyperbolic pair*), and in the formal parameters `(X_e, Y_e)` defined by `t_i = Σ_e[f_{e,i}]X_e +_F [f′_{e,i}]Y_e` the
series `Θ := G(c·Σ_ib_iℓ(t_i))` of 4.9a satisfies `Θ = U₀·exp(−Φ)` with `U₀` integral and `Φ ≃ Σ_eβ₀(X_e, Y_e)`,
`β₀(x, y) := φ(x +_F y) − φ(x) − φ(y)` the cocycle of the curve at `p`; `β₀` satisfies (F1)–(F2) of TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.4a.

*Route.* 4.9a and this statement are one theorem: the same lemma, applied on a hyperbolic frame instead of an orthonormal
basis. Hyperbolic pairs exist at a place split in `E` (the Hermitian space of `Hom(L, L′)` at `v` is split, and the
orthonormal basis of 4.9a is transformed by an integral matrix). With `Φ := Σ_iφ(t_i)`, `U₀ := exp(Φ)·Θ` is integral by 4.9a and
stays integral under the integral substitution; `Σ_iφ(t_i) ≃ Σ_eβ₀(X_e, Y_e)` is HodgeTateLatticesAndLubinTateLogarithms §3.6 (c) applied
to `φ`, whose coboundary is biadditive up to `≃` (the cube, 4.9a) and which satisfies the norm relation (Θ3 of 4.9a);
(F1)–(F2) of TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.4a for `β₀` are the cube and the adjoint form of the norm relation (HodgeTateLatticesAndLubinTateLogarithms §3.6, route).

*NEW*. *Needs:* TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.4a, 4.9a; HodgeTateLatticesAndLubinTateLogarithms §3.6.

### 4.9c The kernel at `d`

Assume `SplitRamification d` (FrobeniusRestrictedRieszSums §0.3) with `d > 3`, let `𝔭 | d`, and
let `ξ` be a tuple unramified above `d`. For a step `j` and classes `(𝒸, 𝒸′)` read the kernel of `K_j(ξ)` in coordinates
`X_{(0,t),a,b} := z_{τ,a,b}`, `X_{(1,t),a,b} := z_{cσ_dτ,a,b}` of local bases of `L_𝒸`, `L′_{𝒸′}` at `τ` and at `cσ_dτ` dual to each
other, one pair `t = {τ, cσ_dτ}` (`τ ∈ A`) of places of `Φ` exchanged by the inertia at `d` at a time (ThetaChainsOnDefiniteUnitaryGroups §3.1d (e)). Then the
kernel series is a `d`-integral finite combination of series `exp(−s₂·Σ_tu_tΣ_{a,b}X_{(0,t),a,b}X_{(1,t),a,b})·σ` with
`s₂ = s₂(Λ_K)` of ThetaChainsOnDefiniteUnitaryGroups §3.1c, the second derivative at `0` of `−log(θ/t)` (ThetaChainsOnDefiniteUnitaryGroups §3.1d (e)), `√−d·s₂` integral at `d` (so `v_d(s₂) ≥ −1/2`), units `u_t` and
`n!·coeff_n σ` integral for every `n`.

*Route.* The finite datum of the step at the places above `d` is the lattice vector (ThetaChainsOnDefiniteUnitaryGroups §3.2 (A1): `d` is not below `Q(ξ)` and does
not divide `g₀g₁T(u)`), so by ThetaChainsOnDefiniteUnitaryGroups §3.3(iii) the kernel at `(𝒸, 𝒸′)` is a `d`-integral combination of Fock translates of
`Θ^{CM}_{L_𝒸,L′_{𝒸′}}` by torsion points of order prime to `d`; ThetaChainsOnDefiniteUnitaryGroups §3.1d (e) gives each such combination the displayed form, `u_t` being
the coefficient of the pair `t` in the quadratic form of ThetaChainsOnDefiniteUnitaryGroups §3.1d (e) divided by `s₂` (a unit: the two orderings of a pair, and a
factor `½` where the form is written as `(s₂/2)·Σ_wz_w²`, are units at `d`, which is odd). `√−d·s₂` is integral by
`α(α − ᾱ)s₂ = Σ_{0≠P∈ker α}℘(P)` with `α = (1 + √−d)/2` (`α − ᾱ = √−d`, kernel points integral).

*Check.* The exponent `−1/2` is attained: for a lattice of discriminant `1` and `d = 7, 11, 19, 43, 67, 163`,
`|√−d·s₂| = 1/4, 2/3, 2, 12, 38, 724` (discriminant `1` fixes the lattice up to a twelfth root of unity `ζ`, which multiplies `s₂` by
`ζ^{−2}`: the values are determined up to a sixth root of unity, and are these rational numbers for a suitable choice), of
valuation `0` at `d`; so the cost of TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.8a at `d` is real.

*NEW* (the step-level form of ThetaChainsOnDefiniteUnitaryGroups §3.1d (e)). *Needs:* FrobeniusRestrictedRieszSums §0.3, ThetaChainsOnDefiniteUnitaryGroups §3.1a, ThetaChainsOnDefiniteUnitaryGroups §3.1c, ThetaChainsOnDefiniteUnitaryGroups §3.1d, ThetaChainsOnDefiniteUnitaryGroups §3.2, ThetaChainsOnDefiniteUnitaryGroups §3.3.

### 4.9d The folded shape at a prime of odd conjugate type

In the setting of 4.9a let
`p` be of odd conjugate type, `h = cFrob_p` and `i := n_cyc` (4.9 (a)). There is a unit `𝔲` such that every `p`-integral combination
of Fock translates of `Θ^{CM}_{L,L′}` by torsion points of order prime to `p`, read in bases adapted at `p`, has the shape of TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.5a
with `Pl = Φ`, the permutation `h`, `ι` the pairs `(a, b)`, all signs `sgn_r = −1` and every `β_r` equal to one series `β`: the
torus mean of TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.4a, for `n′ = 2i` letters, of the cocycle `β₀` of the curve at `p` (4.9b); `β` satisfies (B1)–(B4) of TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.3.

*Route.* (1) The Hermitian form `(x, y) ↦ Tr(x·σ^i(y))` on `W(𝔽_{p^{2i}})` over `W(𝔽_{p²})` (`Tr := Σ_{k<i}σ^{2k}`; Hermitian because
`i` is odd, so `σ^{i+1}` is a power of `σ²`) is unimodular, hence has an orthonormal basis `ω_1, …, ω_i`: a unimodular Hermitian
lattice over the unramified quadratic extension `W(𝔽_{p²})/ℤ_p` has one (the norm `W(𝔽_{p²})^× → ℤ_p^×` is onto; Gram–Schmidt;
KNOWN, the unramified case of the classification of Hermitian lattices over local fields). So the dual basis of `(ω_r)` for
the trace form is `(σ^i(ω_r))`. (2) The matrix `γ_{k,(r,ρ,a,b)} := Σ_mσ^{2m}(ω_ρ)·g(h^{2m}r, a, b, k)`, with `g` the
Frobenius-equivariant coordinates of the orthonormal basis of 4.9a, is integral, fixed by `σ²`, with `Σ_kσ(γ_{k,e})γ_{k,e′} = δ_{ee′}`,
and carries the `p`-locally orthonormal coordinates of 4.9a to the letter forms `Σ_{s even}σ^{s+i}(ω_r)y_{h^sz}`. (3) The
integrality of 4.9a is preserved by such a `σ`-unitary change of logarithmic coordinates (HodgeTateLatticesAndLubinTateLogarithms
§3.6(a)). (4) *Folding.* The letter logarithms satisfy `L_{s+i} = L_s` (the places at positions `s` and `s + i` coincide), so the
odd-letter form with coefficient `ω_r` equals the even-letter form with coefficient `σ^i(ω_r)`, and in the mean identity of TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.4a,
`Σ_rβ₀(ℓ^{ev}_r, ℓ^{odd}_r) ≃ β(L)`, both arguments are the logarithm of ONE integral series `x_r`; `β₀(x, x) ≃ 2φ(x)` (the norm
relation at `α = 2`), and `2A ≃ 0` implies `A ≃ 0` for `p` odd; hence `Σ_rφ(x_r) ≃ ½β(L)`, which is the shape of TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.5a with all signs
`−1`. The existence of the Frobenius-equivariant coordinates `g` in (2) is not proved here.

*NEW*. *Needs:* TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.3, TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.4a, TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.5a, 4.9a; HodgeTateLatticesAndLubinTateLogarithms §§3.4–3.6.

### 4.9e Definitions: the local exponents of a place, the gain and the colength data

The local exponents of a place, the gain and the colength data of a step
`j ∈ {1, …, m}` at a finite place `𝔭` of `𝕃` above a rational prime `p`, for a word `u` (the weights are those of `u`, ThetaChainsOnDefiniteUnitaryGroups §2.3, and
`c_G := 4Sc`; positions, types and sides as in 4.9).
(b) *Local exponents of a place* (split and odd conjugate type). For `s ∈ 𝔗_v` let `α_s := λ_0(τ_s) − λ_1(τ_s)` (the
diagram value) and `α̂_s := a_{τ_s} − 2c_G ≤ α_s`; for every `s` let `ĉ_j(s) := w_j(τ_s) + c_G`, which is `≥ ν_j(τ_s)_1` for
`s ∈ 𝔗_v` and `≥ ν_j(τ_s)_0` otherwise (ThetaChainsOnDefiniteUnitaryGroups §2.3(c), (f)); `Dist_v(s) := {e odd : 0 < e < n′, s + e ∈ 𝔗_v}`. Define `r⁰_j(v)`,
`r^H_j(v)` by the formulas `r⁰`, `r^H` of TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.8 with the data `(α̂, ĉ)`, and `A^{ev}_v := Σ_{s∈𝔗_v even}α_s` (diagram values).
The formulas `r⁰`, `r^H` increase with `α` and decrease with `c`, so every bound of TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.8, 4.12 and 4.13 stated with the
diagram data holds with `(α̂, ĉ)`; with these data `r⁰_j(v)`, `r^H_j(v)` do not depend on the word. Let `𝔚_j(s)` be given by
TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.7 for the diagrams `ν_j(τ_s)`, `ν^{max}_j(v) := max_s|ν_j(τ_s)|`, and
`𝔩_j(v) := C·Σ_s(N_{j−1}N_j·lg_p(2 + |ν_j(τ_s)|) + [s ∈ 𝔗_v]·lg_p(2 + α_s)²)`,
`𝔯_j(v) := γ_LTΣ_{s∈𝔗_v}𝔚_j(s) + 15·Σ_s w_j(τ_s)/p + C_A·n′N_{j−1}N_j(log_p ν^{max}_j(v) + 1)`.
For a *Hecke type* `r_H` with `1 ≤ r_H ≤ k/2`, the *price* is
`P_j(v) := Σ_{s odd}(r_H·w_j(τ_s) + r_H·c_G − [s ∈ 𝔗_v]·(a⁻_{τ_s} + c_G)) + (n′/2)·r_H·j(t+1)`; it does not depend on the
word, is an integer `≥ 1`, and bounds the exact exponent of 4.13:
`P^{ex}_j(v) := Σ_{s odd}(r_H·w̃_j(τ_s) + Σ_{a=k−r_H}^{k−1}λ_a(τ_s)) + (n′/2)·r_H·j(t+1) ≤ P_j(v)` (at an odd top
`λ_{k−1} = −a⁻` and the other entries are `≤ Sc + (k−1)/2 ≤ c_G`). The *excess* is
`𝔵_v := ⌈Σ_{j=1}^m (r^H_j(v) − P_j(v) − r⁰_j(v))₊⌉`. Note `r⁰_j(v), r^H_j(v) ≥ 0`.
(c) *Gain.* Given a set `𝒱_p` of linked places above `p` (the *served* places) with Hecke types, empty unless `p` is of split type, put,
for `p ≥ 5` of split type with `p ≤ X″`:
`g_j(𝔭) := Σ_{v ∈ 𝒱_p} max(r^H_j(v) − P_j(v), r⁰_j(v)) + Σ_{v ∉ 𝒱_p} r⁰_j(v)`; `g_j(𝔭) := 0` otherwise (in particular at
the primes of conjugate and of odd conjugate type). The *operator-free gain* `g⁰_j(𝔭)` is the value for `𝒱_p = ∅`. Given
a set `Drop` of primes, `g^D_j(𝔭) := g_j(𝔭)` for `p ∉ Drop` and `0` for `p ∈ Drop`.
(f) *Colength data.* For `v ∈ 𝒱_p` (so `p` is of split type) let numbers `dep_v ≥ 0` and `sh_v ∈ [0, 1]`, and for `p` integers `D_p ≥ 0` and `e_p ≥ 0`,
be given, `e_p` a *sandwich exponent*: `p^{e_p}·ℳ^∨_0 ⊂ ℳ^{int}_0` locally at every `𝔭 | p` not above `T(u)`, for every word `u`
(ThetaChainsOnDefiniteUnitaryGroups §3.1; at every `𝔭 | p` not above `T(u)`, where `ℳ^∨_0` is defined; by IntegralWeylModulesOfGeneralLinearGroups §0.3 the integer
`max_u Σ_{τ∈Φ}(k(k−1)/2)·⌊log_p(Λ_0(τ)_0 − Λ_0(τ)_{k−1} + k − 1)⌋`, the maximum over the words `u` with their weights `Λ_0(τ)`, is one:
locally at such a `𝔭` the forms of `ℳ^{int}_0`, resp. `ℳ^∨_0`, are those whose values, class by class and in the same coordinates,
lie in `⊗_{τ∈Φ}Δ_ℤ(Λ_0(τ))`, resp. `⊗_{τ∈Φ}∇_ℤ(Λ_0(τ))`, and the exponents of the factors add; IntegralWeylModulesOfGeneralLinearGroups §0.3 (b), (c) give even
`p^{e}∇_ℤ(λ) ⊂ (dim V_λ)·Δ_ℤ(λ) ⊗ ℤ_(p)`, so each factor may be lowered by `v_p(dim V_{Λ_0(τ)})`);
`𝔖(p) := m·Σ_{v∈𝒱_p}sh_v`, `τ_N(𝔭) := e_p + Σ_{v∈𝒱_p}m(⌈dep_v⌉ + D_p + 1)` and `𝔦(𝔭) := 2𝔖(p)·max_{v∈𝒱_p}𝔵_v` when
`𝒱_p ≠ ∅`; all three are `0` when `𝒱_p = ∅`.

*Checks.* If `v` is unlinked, `r⁰_j(v) = Σ_{s∈𝔗_v}Σ_{e odd}(α̂_s/p^e − ĉ_j(s+e))₊`, the whole ramp sum. In all cases
`r^H_j(v) = Σ_{s∈𝔗_v even}γ_LTα̂_s + Σ_{s∈𝔗_v odd}Σ_{e odd}(α̂_s/p^e − ĉ_j(s+e))₊ ≥ r⁰_j(v)` (by `(x − c)₊ + min(x, c) = x`
and `Σ_{e odd}x/p^e = γ_LTx`): on a Hecke image the even tops gain everything, linked terms included. `n′ = 2`,
`𝔗_v = {0}`: `r^H_j(v) = γ_LTα̂_0` and `r⁰_j(v) = Σ_{e odd}(α̂_0/p^e − ĉ_j(1))₊`. At a prime split in `K` and at a prime of
conjugate or odd conjugate type the gain is `0`.

*NEW* (definitions). *Needs:* ThetaChainsOnDefiniteUnitaryGroups §2.1, ThetaChainsOnDefiniteUnitaryGroups §2.3, ThetaChainsOnDefiniteUnitaryGroups §3.1, TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.7, TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.8, 4.9; IntegralWeylModulesOfGeneralLinearGroups §0.3.

### 4.9f Definitions: the bulk, the cost and the ledger

The bulk, the cost and the ledger of a step `j ∈ {1, …, m}` at a finite place
`𝔭` of `𝕃` above a rational prime `p`, for a word `u` (data of 4.9, 4.9e).
(d) *Bulk.* `F_j(𝔭)` is a number defined here, the same number on both sides of the division inequality: the column
side gains it (4.10) and the depth of the row side is bounded by it up to errors (TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.19f); no equality between a depth and
`F_j` is asserted. For `p ≤ X″`, `p ≥ 5`, inert in `K` and unramified in `E`: `F_j(𝔭) := Σ_{v | p} 𝔉_{p,v}((k−1)w_j)`, the
sum over ALL places `v` of `F` above `p`, where `𝔉_{p,v}` is the programme of TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.6 on the `n′` positions of `v` with
`D_s := (k−1)w_j(τ_s)` if `p` is of split type, and the programme of TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.6(f) on the cycle of places `ℤ/n_cyc` of `v` (flows of odd
length `< n_cyc`) with `D_e := (k−1)w_j(τ_0h^e)` if `p` is of odd conjugate type (each place once: the programme of TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.6 on the
`n′` positions, with periodic capacities, is exactly twice the largest bound the folded engine TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.5a can give, while the programme
on the cycle exceeds that ceiling by at most `ΣD/p³`, the term `(k − 1)Σw/p³` of the cost (e); TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.6, Checks); and
`F_j(𝔭) := ρ_LT(p)(k−1)Σ_{τ∈Φ}w_j(τ)` if
`p` is of conjugate type (gained at all places). At `𝔭 | d`: `F_j(𝔭) := −((k−1)/2)·Σ min(w_j(τ), w_j(cσ_dτ))` over the pairs `{τ, cσ_dτ}` of places of
`Φ` exchanged by the inertia at `d` (FrobeniusRestrictedRieszSums §0.3); so `−(k−1)f·max_{τ∈A}w_j(τ)/4 ≤ F_j(𝔭) ≤ 0`. At `𝔭` above `g₀` or `g₁`:
`F_j(𝔭) := −D^H_j/2`, where `D^H_j := D⁺_j + D⁻_j`, `D^±_j := Σ_{τ∈Φ}|a^±_{j,τ}|`, the total sizes of the two *diagrams of step `j`*:
with `(s⁺(τ); s⁻(τ)) := (s⁺_j(τ); s⁻_j(τ))` the model parameter of step `j` (ThetaChainsOnDefiniteUnitaryGroups §2.3; `s⁻_{j,c} = −e′_{j+c}`), `p_j = k + j − 1`, `q_j = m − j`,
`a⁺_{j,τ,i} := s⁺_i(τ) + w_j(τ) − (p_j − 1 − i) − (t + 1)/2` (`0 ≤ i < p_j`),
`a⁻_{j,τ,c} := −s⁻_c(τ) − w_j(τ) − c − (t + 1)/2 = e′_{j+c}(τ) − w_j(τ) − c − (t + 1)/2` (`0 ≤ c < q_j`).
*Lemma.* Under (W1), (W2) of ThetaChainsOnDefiniteUnitaryGroups §2.3 these are integers `≥ 1`; `a⁺_{j,τ,i}` is weakly decreasing in `i` and `a⁻_{j,τ,c}` strictly
increasing in `c`; so `a⁺_{j,τ}` and `(a⁻_{j,τ,q_j−1}, …, a⁻_{j,τ,0})` are partitions with `p_j`, `q_j` positive rows, and
`D⁺_j ≥ f·p_j`, `D⁻_j ≥ f·q_j`. *Route.* `t` is odd; `s⁺_i − s⁺_{i+1} ≥ 1` by the interlacing, (W2) and (W1);
`a⁺_{j,τ,p_j−1} = e_{j−1} − e′_{j−1} − (t + 1)/2 ≥ 1`; `a⁻_{j,τ,0} = e′_j − e_{j−1} − (t + 1)/2 ≥ 1`;
`a⁻_{j,τ,c+1} − a⁻_{j,τ,c} = e′_{j+c+1} − e′_{j+c} − 1 ≥ t + 2`. *Check.* With `Λ = (s⁺ − ρ_{p_j} + q_j/2; s⁻ − ρ_{q_j} − p_j/2)` the
lowest `K`-type of the holomorphic discrete series with parameter `(s⁺; s⁻)`: `a⁺ = Λ⁺ + (w_j − (r + t)/2)·1` and
`−a⁻ = Λ⁻ + (w_j + (r + t)/2)·1` (`r = p_j + q_j`). For `(k, m, t) = (6, 2, 13)`, `e′ = (10, 26)`, `e = (18, 34)`, `v = (−5, …, −9)`, `j = 1`:
`a⁺ = (1⁶)`, `a⁻ = (1)`; the expression `s⁻_c + w_j − (q_j − c − 1) − (t + 1)/2` equals `−15`. (Every statement of this
layer at the type primes holds for every value of `F_j(𝔭)` there, since only `F_j − E_{u,j}` enters them; the value matters where
the ledger meets the row side.) `F_j(𝔭) := 0` elsewhere (in particular at the
prime `q` of the auxiliary pair, at the primes split in `K`, at the primes `> X″` and at the primes ramified in `E` other than `d`).
(e) *Cost.* `E_{u,j}(𝔭) := v_p(D_Γ) + Ẽ_{u,j}(𝔭)` except above `T(u)` (the summand `v_p(D_Γ)` at every step accounts for the
stabiliser denominators: each step after the first loses `v_p(D_Γ)` (ThetaChainsOnDefiniteUnitaryGroups §3.6) and the final pairing loses it once (ThetaChainsOnDefiniteUnitaryGroups §3.10), in
total `m·v_p(D_Γ)`, with `log D_Γ ≤ C·f·N_m·log(f·N_m)`), with:
- `p ≤ X″` as in (d), of split or of odd conjugate type: `Ẽ_{u,j}(𝔭) := Σ_{v∈𝒜_p}𝔩_j(v) + 𝔉^A_j(𝔭) + Σ_{v∈ℬ_p}𝔯_j(v)`,
  plus, when `p` is of odd conjugate type, `(k − 1)·Σ_{v∈ℬ_p}Σ_sw_j(τ_s)/p³ + C·f·N_m²·lg_p(2a)` (the first term is the price
  of the constraints of odd length `≥ n_cyc`, TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.6(f); sums over `s` run over the positions, twice over the places); here
  `𝔉^A_j(𝔭) := Σ_{v∈𝒜_p}𝔉_{p,v}((k−1)w_j)` is the part of the bulk of (d) that the column side does not use (it cancels in
  `F_j − E_{u,j}`), and the logarithmic losses `𝔩_j(v)` of the places of `𝒜_p` stay in the cost (the gain (c) is not net of
  them). The returned bulk is small: `𝔉^A_j(𝔭) ≤ γ_LT(p)(k − 1)Σ_{τ∈A}w_j(τ) ≤ 2f·m·b/p` for `x ≥ x₀(ε)` (TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.6(b) on each
  orbit, at both types), because no thick place lies in `A` (FrobeniusRestrictedRieszSums §0.6(ii)), every step weight at a place that is not thick is
  `≤ 2b′` (ThetaChainsOnDefiniteUnitaryGroups §2.3b (f)), and `2kb′ ≤ mb` under `SizeA`, `SizeK`;
- `p ≤ X″` as in (d), of conjugate type: `Ẽ_{u,j}(𝔭) := C_A·f·N_{j−1}N_j·(log_p ν^{max}_j + 1) + ρ_LT(p)·Σ_{τ∈Φ}w_j(τ)`,
  `ν^{max}_j := max_τ|ν_j(τ)|`;
- `𝔭 | d`: `Ẽ_{u,j}(𝔭) := F_j(𝔭) + ½·max_{u′}Σ_{pairs}c^d_j(u′; τ)`, the maximum over the words `u′` and the sum over the
  `f/2` pairs `{τ, cσ_dτ}` written with `τ ∈ A`, where `c^d_j(u′; τ) := |ν_j(τ)|` if `τ` is not a top and
  `|ν_j(τ)| − (ν_j(τ)_0 − ν_j(τ)_1) + ν_j(cσ_dτ)_0` if it is (weights of `u′`; every `c^d_j ≥ 0`). If, for every word, every
  `τ ∈ A` has `|ν_j(τ)| − [τ ∈ Φ_top](ν_j(τ)_0 − ν_j(τ)_1) ≤ 4kb′` and `w_j(τ) ≤ 2b′`, and every `τ ∈ cσ_dA` has
  `ν_j(τ)_0 ≤ 2b`, then `|Ẽ_{u,j}(𝔭)| ≤ |Φ_top|·b + 2f·k·b′` (the first summand lies in `[−(k−1)fb′/2, 0]`, the second in
  `[0, fkb′ + |Φ_top|b]`);
- `𝔭 | g` with `g ∈ {g₀, g₁}`: `Ẽ_{u,j}(𝔭) := F_j(𝔭) + Σ_{τ∈Φ}|ν_j(τ)|·v_𝔭(ϖ_g)/e_𝔭 + C_g·f·(N_m² + m²ϑ)`, where `ϖ_g := π_g`, the
  prime of `K` above `g` of ThetaChainsOnDefiniteUnitaryGroups §2.4 (b), below the places `w_v`, modulo which the finite datum of the step at `g` is taken (ThetaChainsOnDefiniteUnitaryGroups §2.9a; ThetaChainsOnDefiniteUnitaryGroups §3.2 (A3)
  and its Lemma (ii)); `v_𝔭(ϖ_g)/e_𝔭` is `1` at the places above `π_g` and `0` at those above `π̄_g`;
- `Ẽ_{u,j}(𝔭) := 0` elsewhere;

and above the level prime: `E_{u,j}(𝔭) := 𝔢_u` if `𝔭` lies above `π_u` (ThetaChainsOnDefiniteUnitaryGroups §2.8; the primes of `E` above `π_u` carry the
functionals of the pairs, ThetaChainsOnDefiniteUnitaryGroups §2.9, and `z_u = π_ue_{N_m}`, ThetaChainsOnDefiniteUnitaryGroups §3.9) and `E_{u,j}(𝔭) := 0` if `𝔭` lies above `π̄_u`, where
`𝔢_u := 2Σ_{τ∈Φ}𝔴_u(τ) + f·N_m + |Φ_top|·(t+1)(m+1)/4` and `𝔴_u(τ)` is the largest `|Λ_i(τ)_a − i(t+1)/2|` over `0 ≤ i ≤ m`
and the positions `a`, the position `0` excluded when `τ` is a top.
(g) `𝔊_u(𝔭) := Σ_{j=1}^m (g^D_j(𝔭) + F_j(𝔭) − E_{u,j}(𝔭))`. It vanishes at every place not above a prime `≤ X″` inert
in `K`, `d`, `g₀`, `g₁`, `T(u)` or a prime dividing `D_Γ`, so `∏_𝔭𝔭^{−⌊e_𝔭𝔊_u(𝔭)⌋}` is a fractional ideal. Every entry is
the exponent at `𝔭` of the column at the same place `𝔭`.
(h) *Dependence on the place.* The positions are fixed inside `G` by the base places `τ_0(v)`, independently of `𝔭`, so
the entries of (b)–(g) depend on `𝔭` only through `p`, except above `g₀`, `g₁` and `T(u)`. Above `g ∈ {g₀, g₁}` the term
`Σ_τ|ν_j(τ)|·v_𝔭(ϖ_g)/e_𝔭` is nonzero exactly at the places above `ϖ_g = π_g`, one of the two primes of `K` over `g` (`F_j` and the
constant term are the same at all places above `g`). Above `T(u)` the whole entry is `𝔢_u` at the places above `π_u` and
`0` above `π̄_u`. Hence `𝔊_u(h𝔭) = 𝔊_u(𝔭)` for every `h ∈ Gal(𝕃/ℚ)` at the places above the other primes.

*Checks.* The returned bulk is small in total: `Σ_{p≤X″}2log p·𝔉^A_j(p) ≤ 4fmb·(log X″ + C) = o(B₀)` per step, by Mertens. At the type primes `F_j − E_{u,j} = −Σ_τ|ν_j(τ)|·v_𝔭(ϖ_g)/e_𝔭 − C_g·f·(N_m² + m²ϑ)` does not depend on `D^H_j`.

*NEW* (definitions). *Needs:* FrobeniusRestrictedRieszSums §0.3, ThetaChainsOnDefiniteUnitaryGroups §2.1, ThetaChainsOnDefiniteUnitaryGroups §2.3, ThetaChainsOnDefiniteUnitaryGroups §2.4, ThetaChainsOnDefiniteUnitaryGroups §2.7, ThetaChainsOnDefiniteUnitaryGroups §2.8, ThetaChainsOnDefiniteUnitaryGroups §2.9, ThetaChainsOnDefiniteUnitaryGroups §3.1, ThetaChainsOnDefiniteUnitaryGroups §3.6, ThetaChainsOnDefiniteUnitaryGroups §3.9, TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.6, TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.7, 4.9, 4.9e; AnalyticNumberTheoryPartI §0.11.

### 4.10 The gain of a step

Let `ξ` be a tuple (ThetaChainsOnDefiniteUnitaryGroups §2.5), and assume `2fk + 1 < g₀`, `T(u) > 2fN_m + 1` (ThetaChainsOnDefiniteUnitaryGroups §3.8) and the size
conditions `k·Sc + m(t+1)(ϑ+1) + k·N_m ≤ min(w″, b′/x)` and `2log_p(2kb) + 2 ≤ k − 1` for the primes `p` of (i)–(ii′).
For a prime `p ≥ 5` inert in `K`, unramified in `E`, `p ≤ X″`, a place `𝔭 | p` and `ξ` unramified at every place of `E` above
`p` (for instance the tuple `ξ_𝔭` used at `𝔭`, ThetaChainsOnDefiniteUnitaryGroups §2.5), locally at `𝔭`:
(i) if `p` is of split type, `K_j(ξ)(ℳ^{int}_{j−1}) ⊂ p^{g⁰_j(𝔭) + F_j(𝔭) − E_{u,j}(𝔭) + [j=1]·v_p(D_Γ)}·ℳ^{int}_j`;
(ii) if `p` is of conjugate type, the same with `g⁰_j = 0`;
(ii′) if `p` is of odd conjugate type, the same with `g⁰_j = 0` (no gain; the bulk and the cost of 4.9f (d), (e) for that type).
This bound serves the bulk, not a gain: these primes are in `Drop` (4.17), but `F_j(𝔭)` is one number on both sides of the
division inequality, the row side may lose up to it at every inert prime `≤ X″` (TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.19f), so the column side must recover
`F_j − E_{u,j}` there.
(iii) At `𝔭 | d`, under `SplitRamification d` and `d > 3`, for `ξ` unramified above `d`:
`K_j(ξ)(ℳ^{int}_{j−1}) ⊂ p^{F_j(𝔭) − E_{u,j}(𝔭) + [j=1]·v_p(D_Γ)}ℳ^{int}_j` locally at `𝔭`.
(iv) At every `𝔭` above a prime `p ∤ d·g₀g₁·T(u)` that is not the residue characteristic of a place of `Q(ξ)` and is either
split in `K` or inert in `K` with `p > X″`: `K_j(ξ)(ℳ^{int}_{j−1}) ⊂ p^{−[j≥2]v_p(D_Γ)}ℳ^{int}_j` locally at `𝔭`. This includes
`2` and `3` when they split in `K`, the primes dividing `N(𝔞₀)` and the residue characteristics of the twist places of
other tuples.

*Route.* (1) By the definition of the step (ThetaChainsOnDefiniteUnitaryGroups §3.2; ThetaChainsOnDefiniteUnitaryGroups §3.3(iii) identifies it with a class-set theta lift) the kernel of `K_j(ξ)`
at classes `(𝒸, 𝒸′)` is `ρ^ξ_j(t_𝒸)ρ′^ξ_j(t′_{𝒸′})` times the jet at `0` (derivatives `c_τ·∂/∂z_τ` in the integral coordinates of
ThetaChainsOnDefiniteUnitaryGroups §3.1a, against the polynomial of the value) of `Θ_{𝒸,𝒸′}(ξ)`, a combination of Fock translates of `Θ^{CM}_{L_𝒸,L′_{𝒸′}}` (ThetaChainsOnDefiniteUnitaryGroups §3.1d) with
translation points of order supported at the residue characteristics of `S(ξ)` and of `T(u)` (ThetaChainsOnDefiniteUnitaryGroups §3.2, (A1)–(A3)); the constants
`c_τ` (generators of the axis ideals `𝔩_τ = τ(𝔞̄₀)^{−1}` of ThetaChainsOnDefiniteUnitaryGroups §3.1a) turn derivatives along `𝔞₀Hom(L_𝒸, L′_{𝒸′})` into derivatives in
local bases, also at the primes dividing `N(𝔞₀)`; both ranks `N_{j−1}`, `N_j` are even (ThetaChainsOnDefiniteUnitaryGroups §2.1). (2) At a place `𝔭` as in (iv) the
translation points have order prime to `p`, and a `p`-integral combination of such translates has `p`-integral jets along
the lattice (ThetaChainsOnDefiniteUnitaryGroups §3.1d (d), ThetaChainsOnDefiniteUnitaryGroups §3.2 API (c)); with step (6) this is (iv) once the coefficients of the combination, the class factors
`ρ^ξ_jρ′^ξ_j` at the representatives included, are `𝔭`-integral. The same reading of the kernel, as a `p`-integral (resp.
`d`-integral) combination of translates by points of order prime to `p` (resp. `d`), is used in (3)–(5) and in (iii).
*The one point of this route not proved here*, shared with Layer 3 (ThetaChainsOnDefiniteUnitaryGroups §3.2 API (c)): that the coefficients of that reading are
integral at the places above the primes outside the residue characteristics of `S(ξ)` and of `T(u)` (the tie of the kernel of
the chain to its reading as a combination of translates); the other steps rest on the targets they cite. (3)
Conjugate type (`Frob_p = c`): every place of `F` above `p` is inert in `E` with residue degree one over `ℚ_p`, a single
self-dual formal group, and the one-letter case of TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.5 with 4.9a gives (ii), the bulk being gained at all places.
Odd conjugate type, (ii′): by 4.9d the kernel has the folded shape of TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.5a on the cycles of places. Choose one radius per
place: `1/(p+1)` at the places of `A` (their contribution `ρ_LT·|ν_j| ≥ 0` is not used) and, on each orbit outside `A`, the
radii of TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.6(f) for `κ = k − 1`, `w = w_j`, `D_z = |ν_j(z)|` (no top lies outside `A`, and `(k−1)w_j ≤ |ν_j| ≤ (k−1)w_j + 4w_j` by
ThetaChainsOnDefiniteUnitaryGroups §2.3); by TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.5a every Taylor coefficient of the kernel series at the multidegree `(|ν_j(z)|)_z`, hence every jet against a product
of minors, has valuation at least `Σ_{orbits ⊄ A}𝔉_p((k−1)w_j) − (k−1)Σ_{Φ∖A}w_j/p³ − 8Σ_{Φ∖A}w_j/p − 3f·N_m²·log_pa`, which is
`≥ F_j(𝔭) − Ẽ_{u,j}(𝔭)` (4.9f (d), (e)); then step (6). Split type: by 4.9a–4.9b, in hyperbolic coordinates of the two dual isotropic formal
groups at each `v`, `Θ = U₀·exp(−Φ)` with `U₀` integral and `Φ ≃ Σ_eβ₀(X_e, Y_e)`. (4) In letters (TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.4a) the torus mean
`β` of `β₀` satisfies the hypotheses of TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.3 and `Θ = U(g(z))exp(−Σβ)`; by TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.4 the series lies in the class of TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.4(iii).
At a place `v ∈ ℬ_p` the first engine (TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.7(ii), whose hypotheses on `ν_j(τ_s)` follow from ThetaChainsOnDefiniteUnitaryGroups §2.3(c)–(f) and the size
conditions) gives `r⁰_j(v) + 𝔉_{p,v}((k−1)w_j) − 𝔯_j(v)`; at a place `v ∈ 𝒜_p`, linked or not, the second engine
(TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.8 (J1)) gives `r⁰_j(v) − 𝔩_j(v)`, and no bulk is used there (it is returned in `𝔉^A_j`; at an unlinked place of `𝒜_p`
the first engine would also give the bulk, which the ledger does not use). (5) The bounds add over
places: the series is `∏_v exp(−Φ_v)·U₁` with `U₁` integral in all variables; expanding `U₁` into monomials, each
term's jet against `∏_v P_{I,v}` is a product of one-place jets of `exp(−Φ_v)·μ_v`, each bounded by the one-place bound
(valid for every integral factor), and the ultrametric inequality concludes. (6) *From jets to integral forms.* Write
the value `φ_c` of an integral form at `c` in the coordinates of ThetaChainsOnDefiniteUnitaryGroups §3.1 (a polynomial in the Weyl lattice `Δ_ℤ(Λ_{j−1})`); the
value of the step at `c′`, paired with the product of minors of a column choice `I` of the target frame, equals, up to a
unit, the pairing of `φ_c` with the jet `J_I` of the kernel series against the products of minors of the source frame
(Cauchy–Binet applied to the substitution of ThetaChainsOnDefiniteUnitaryGroups §3.2); `J_I` lies in `p^B` times the span of those products of minors, which is
`∇_ℤ(Λ_{j−1})` (ThetaChainsOnDefiniteUnitaryGroups §3.1, saturation of TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.7), when all jets against products of minors have valuation `≥ B`; since `Δ_ℤ` and `∇_ℤ`
are dual (local conventions), the value at `c′` lies in `p^B·Δ_ℤ(Λ_j)`. So such a kernel maps integral forms to `p^B` times
integral forms; the class sum loses `v_p` of the stabiliser orders, and nothing at level `0`, where the stabilisers are
trivial (neat level, ThetaChainsOnDefiniteUnitaryGroups §3.8). (iii): by 4.9c the kernel at `𝔭 | d` is a `d`-integral combination of Gaussians
`exp(−S·Σ_tu_tΣX_{(0,t)}X_{(1,t)})·σ` with `S = s₂(Λ_K)`, `v_d(S) ≥ −1/2` (attained, 4.9c); TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.8a with `ϖ = |d|` and `𝔗` the tops (the
side `0` of each pair the place in `A`) bounds every jet against products of minors by `−½Σ_tc^d_j(u; τ)`, and (6) applies.

*NEW*. *Needs:* FrobeniusRestrictedRieszSums §0.3, ThetaChainsOnDefiniteUnitaryGroups §2.3, ThetaChainsOnDefiniteUnitaryGroups §2.3b, ThetaChainsOnDefiniteUnitaryGroups §2.5, ThetaChainsOnDefiniteUnitaryGroups §3.1, ThetaChainsOnDefiniteUnitaryGroups §3.1a, ThetaChainsOnDefiniteUnitaryGroups §3.1d, ThetaChainsOnDefiniteUnitaryGroups §3.2, ThetaChainsOnDefiniteUnitaryGroups §3.3, ThetaChainsOnDefiniteUnitaryGroups §3.8, TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.4, TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.4a, TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.5, TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.5a, TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.6, TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.7, TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.8, TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.8a, 4.9, 4.9a, 4.9b, 4.9c, 4.9d, 4.9e, 4.9f.

### 4.10a The step at the type primes

Let `g ∈ {g₀, g₁}` and `ξ` a tuple unramified above
`g`. For `ϖ_g = π_g` (4.9f (e): the prime of `K` above `g` modulo which the finite datum of the step at `g` is taken, ThetaChainsOnDefiniteUnitaryGroups §3.2 Lemma (ii))
and a constant `C_g` fixed before `ε`: at every `𝔭 | g`, locally at `𝔭`,
`K_j(ξ)(ℳ^{int}_{j−1}) ⊂ p^{F_j(𝔭) − E_{u,j}(𝔭) + [j=1]v_g(D_Γ)}ℳ^{int}_j` (the cost of 4.9f (e)), that is, the step loses at
most `Σ_{τ∈Φ}|ν_j(τ)|·v_𝔭(ϖ_g)/e_𝔭 + C_g·f·(N_m² + m²ϑ)` powers of `g` beyond the stabilisers: nothing but the constant at the
places above the conjugate of `ϖ_g`.

*Route.* *Jets at a split prime with level.* Let `ℓ ≥ 5` split in `K` as `ℓ = ππ̄`, unramified in `E`, prime to `d` (the model of
discriminant `1` of ThetaChainsOnDefiniteUnitaryGroups §3.1a is then a good short model at `ℓ`, and the family is normalised at `ℓ`, ThetaChainsOnDefiniteUnitaryGroups §3.1d (f)), and `n := fN_{j−1}N_j`. A
theta function with a finite datum `Ψ` on `𝔙/π̄𝔙` (ThetaChainsOnDefiniteUnitaryGroups §3.1a, `𝔙 = 𝔙(L, L′)` the period lattice) is `Ξ = Σ_aΨ̂(a)α(a)U_aΘ`, the sum over
the `π`-torsion points, `Ψ̂` the finite Fourier transform (`ℓ^{−n}` times a sum of roots of unity); the further translation
points have order prime to `ℓ`. *Swap.* From `U_xU_y = e^{−2πiE(x,y)}U_yU_x`, `U_{−b}Θ = α(b)Θ` for `b ∈ 𝔙` and
`U_b[Θ∘μ](z) = (U_{μb}Θ)(μz)` for the unitary scalar `μ := π/π̄`, the functional equation `Θ(μz) = c·ℓ^{−n/2}Σ_aα(a)U_aΘ(z)` (the
line of theta functions of the self-dual lattice `μ^{−1}𝔙` is one-dimensional; `c⁸ = (π̄/π)^{4n}`, the eighth-power law of the
Weil representation on the lattice model, and in dimension one `c² = π̄/π`) rewrites `Ξ(z)` as `(c·ℓ^{n/2})^{−1}` times a sum of
coefficients of `Ψ` and roots of unity times translates `(U_{μb}Θ)(μz)` by `π̄`-torsion points. *Étale torsion.* For a torsion point
`s` outside the formal group, of order `N`, `U_sθ = (U_sθ)(0)·e^{ζ*(s)z}·J_s` with `(U_sθ)(0)` a unit, `J_s` of integral jets and
`ζ*(s) ∈ N^{−1}𝒪` (the value at `s` of the periodic function `ζ − s₂z − (π/A)z̄`, compared with the logarithmic derivative of the
function of divisor `N[s] − N[0]`): only the first logarithmic jet costs, at most `|N|^{−1}` per derivative; with the fourth-power
reduction of ThetaChainsOnDefiniteUnitaryGroups §3.1d (f) the same holds for translates of `Θ^{CM}`. *The two places.* At a place above `π` (where `π̄` is a unit) use the
second form: `|c·ℓ^{n/2}| = 1` there, the coefficients are integral, the points `μ(t + b)` are étale torsion (killed by `N·π̄`), and
the substitution `z ↦ μz` multiplies each derivative by `|μ| = |ℓ|`, which pays for the scaling: no loss. At a place above `π̄`
use the first form: coefficients `ℓ^{−n}` and each derivative scaled by `|ℓ|^{−1}`. Together: a jet of order `|m|` has denominator
at most `π̄^{|m|}ℓ^n`, and the factor `ℓ^n` is not needed at the places above `π`. Applied with `ℓ = g` and `π̄ = π_g` (the datum is
taken modulo `π_g` and its translation points are `π̄_g`-torsion, ThetaChainsOnDefiniteUnitaryGroups §3.2 Lemma (ii)) to each block `τ`, where the jets against the value
have degree `|ν_j(τ)|` (step (6) of 4.10 turns jets into integral forms), it gives the displayed loss, at the places above
`ϖ_g = π_g`. Collected in `C_g`: the index factor `g^n`, the stabilisers, the degrees of the kernel against the size of `g`
(ThetaChainsOnDefiniteUnitaryGroups §2.7: `g > 16(r + t)²`), and the index factors of the column levels of ThetaChainsOnDefiniteUnitaryGroups §2.9a. The class sums of ThetaChainsOnDefiniteUnitaryGroups §3.2 are taken for the measure giving
each level volume `1`, so passing between the column levels (the principal congruence subgroups of level `g` at the stages
`1, …, m − 1`, the group `K^X_m(v)` at the stage `m`) and the fine levels of ThetaChainsOnDefiniteUnitaryGroups §2.9a, under which the data are equivariant, multiplies a
step by an index (ThetaChainsOnDefiniteUnitaryGroups §3.5); every column level contains the principal congruence subgroup of level `g`, so the `g`-part of each index
divides `g^{f_v·N_j(N_j−1)/2}` at a place `v` above `g` of residue degree `f_v` (the `g`-part of `|GL_{N_j}(𝔽_{g^{f_v}})|`), and
`Σ_vf_v ≤ f`: an exponent at most `f·N_m²/2` in all, inside `C_g·f·N_m²`. The passage from this jet bound to the
step bound with the constant `C_g` (the reading of the kernel at `g` as a combination of such theta functions, and the bookkeeping
of `C_g`) is not given here.

*KNOWN* in kind (the asymmetry between the étale and the connected halves of the torsion, as in Katz's theory at ordinary
primes; Bannai–Kobayashi), *NEW* for powers of the curve with level at half of the torsion. *Needs:* ThetaChainsOnDefiniteUnitaryGroups §2.4, ThetaChainsOnDefiniteUnitaryGroups §2.7, ThetaChainsOnDefiniteUnitaryGroups §2.9, ThetaChainsOnDefiniteUnitaryGroups §2.9a, ThetaChainsOnDefiniteUnitaryGroups §3.1a, ThetaChainsOnDefiniteUnitaryGroups §3.1d, ThetaChainsOnDefiniteUnitaryGroups §3.2, 4.9f,
4.10.

### 4.11 The gain of the chain lift

(i) If for every `j` the step `K_j(ξ)` maps `ℳ^{int}_{j−1}` into `p^{s_j}ℳ^{int}_j` locally at
`𝔭`, then `col_ξ(x) ∈ p^{Σ_j s_j}·ℳ^{int}_m` locally at `𝔭` for every `x ∈ ℳ^{int}_0`. (ii) If `col_ξ(x) ∈ p^s·ℳ^{int}_m`
locally at `𝔭` and the residue characteristic of `𝔭` is not below `Q(ξ)`, then for every row form `F` (values in the dual
Weyl lattices locally at `c_𝕃(𝔭)` suffice) the period `P̃_ξ(x, F)` is `0` or `v_𝔭(P̃_ξ(x, F)) ≥ e_𝔭(s − v_p(D_Γ))`. (iii) In
particular, for `𝔭` and `ξ` as in 4.10(i)–(ii), `col_ξ(ℳ^{int}_0) ⊂ p^{Σ_j(g⁰_j + F_j − E_{u,j})(𝔭) + v_p(D_Γ)}ℳ^{int}_m` locally
at `𝔭`, and the periods of row forms have valuation `≥ ⌊e_𝔭Σ_j(g⁰_j + F_j − E_{u,j})(𝔭)⌋` at `𝔭`.

*Route.* (i) Induction on `j`: the target lattice of step `j` is the source lattice of step `j + 1`, so nothing has to
be preserved; what makes each step gain again is that `a_τ` stays in every `Λ_j` (ThetaChainsOnDefiniteUnitaryGroups §2.3), so every kernel is a jet of
order `≥ a_τ` at the top places. (ii) ThetaChainsOnDefiniteUnitaryGroups §3.10 in its local form: `res` maps integral forms of level `m` to forms on `U(X^h)` with
values in the Weyl lattices, which pair integrally with `F` up to the stabiliser denominators; the period is linear in the
column (ThetaChainsOnDefiniteUnitaryGroups §3.9), so a scalar `c` with `v_𝔭(c) ≥ e_𝔭s` comes out of the column slot unchanged. (iii) (i), (ii) and 4.10.

*NEW* (composition). *Needs:* ThetaChainsOnDefiniteUnitaryGroups §3.5, ThetaChainsOnDefiniteUnitaryGroups §3.9, ThetaChainsOnDefiniteUnitaryGroups §3.10, 4.9e, 4.9f, 4.10.

### 4.12 The local model of the Hecke operators

Let `p`, `ξ` be as in 4.10 with `p` of split type, and for each place `v` of `F`
above `p` let `𝔓_v` be the prime of `E` over which, through `𝔭`, the even positions of 4.9 (a) lie; `E_{𝔓_v}` is
unramified of degree `n′` over `ℚ_p`, `N𝔓_v = p^{n′}`, and `U(X_j)(F_v) ≅ GL_{N_j}(E_{𝔓_v})` through the
`𝔓_v`-component. (At `c_𝕃(𝔭)` the same construction uses the conjugate prime, with the same labels and formulas.)
Adjoin `√p` to the coefficients (harmless for valuations).
(o) *The local model.* The level of `ℳ_j` at every place above `p` is the stabiliser of a self-dual lattice. Choosing
representatives away from `p`, `ℳ_j ⊗ 𝕃_𝔭` is identified with the space of functions `F(c, L)` of a component `c` in a
finite set and a tuple `L = (L_v)_{v|p}` of lattices `L_v ⊂ E_{𝔓_v}^{N_j}`, with values in `⊗_v⊗_{s∈ℤ/n′}𝒫_{Λ_j(τ_s)}`, the
polynomial modules of ThetaChainsOnDefiniteUnitaryGroups §3.1 (highest weight `Λ_j(τ_s)` for `(g·P)(X) = det(g)^{Λ_N}P(ᵗgX)`; the factor at an odd position is
read through the conjugate prime, where it is the contragredient), with `F(c, hL) = h·F(c, L)` for `h` in an arithmetic
group `Γ_c` acting through `∏_v GL_{N_j}(E_{𝔓_v})` with finite stabilisers (Gross's `p`-adic model); `ℳ^{int}_j ⊗ 𝒪_𝔭`
corresponds to the `F` with every `F(c, L)` in the Weyl lattice `Δ(L)` of the tuple of Frobenius twists of `L` (in the
coordinates of a basis of `L`, which is self-dual at `p`; the coefficient functions are transported by the inverse of the change of
basis, as in ThetaChainsOnDefiniteUnitaryGroups §3.1), and `ℳ^∨_j ⊗ 𝒪_𝔭` to those with values in the
dual Weyl lattice `∇(L)`. The step operator is `K_jF(c′, L′) = Σ_{(c,L)}|Stab(c, L)|^{−1}·ker_j((c, L), (c′, L′))(F(c, L))` over representatives.
(a) *Kernel and one-step relation.* `ker_j((c, L), (c′, L′))` depends on `(L_v, L′_v)` only through the characteristic
function of `{x ∈ M_{N_j×N_{j−1}}(E_{𝔓_v}) : xL_v ⊂ L′_v}`, linearly, up to explicit unit and `p`-power scalars. For
`T^{(j)}_{i,v}` the sum over the sublattices `L″ ⊂ L_v` with `pL_v ⊂ L″` and `L_v/L″ ≅ (𝒪/p)^i` (edges of type `i`), and
`ℰ_j(i) := (N𝔓_v)^{−i(N_j−i)/2}T^{(j)}_{i,v}`:
`ℰ_j(i)∘K_j = un_j^i·K_j∘Σ_{l=0}^{i} 𝖾_l(𝔪_j(N𝔓_v)^{t/2}, 𝔪_j(N𝔓_v)^{(t−2)/2}, …, 𝔪_j(N𝔓_v)^{−t/2})·ℰ_{j−1}(i − l)`,
`𝖾_l` the elementary symmetric polynomials in the `t + 1` displayed numbers, `un_j` a unit at `𝔭` (the ratio of the
normalisations of the kernel identity at the moved lattices and of the Satake transform), `𝔪_j := μ_j(ξ)(ϖ_{𝔓_v})` the
value of the step character (ThetaChainsOnDefiniteUnitaryGroups §2.5) at a uniformiser of `𝔓_v`, with
`v_p(𝔪_j) = Σ_{s even}w̃_j(τ_s) − Σ_{s odd}w̃_j(τ_s)` (the same expression in `w_j`, the numbers of even and odd positions
being equal; the infinity type of ThetaChainsOnDefiniteUnitaryGroups §2.4(b)); for a tuple `ξ` unramified at `v`, `𝔪_j` differs from its value for the base
tuple by the root of unity `ξ(ϖ_{𝔓_v})^{s_j}`, which does not change its valuation. In terms of Satake parameters: an
eigenform with parameter `α` at `𝔓_v` goes to one with parameter `α` together with the segment of the displayed numbers.
(b) *Hida's normalisation.* For an edge `L″ ⊂ L_v` of type `i`, a weight `λ` of the tuple and either lattice `Λ ∈ {Δ, ∇}`,
`p^{h_i(λ)}·Λ(L with L_v replaced by L″) ⊂ Λ(L)`, `h_i(λ)` := the sum over the positions of the `i` largest entries of the
weight there (contragredient at odd positions). Hence `y_v := p^{h_{r_H}(Λ_0)}T^{(0)}_{r_H,v}` preserves `ℳ^{int}_0` and `ℳ^∨_0`,
the `y_v` commute, and `T̃^{(j)}_{i,v} := p^{h_i(Λ_j)}T^{(j)}_{i,v}` preserves `ℳ^{int}_j` and `ℳ^∨_j` for `i ≤ min(k, t+1)`, with
`h_i(Λ_j) = Σ_{s even}Σ_{a<i}λ_a(τ_s) + i·Σ_{s odd}w̃_j(τ_s)` (the uniform shift `−j(t+1)/2` of the first block of `Λ_j`
cancels between even and odd positions).
(c) *Frame lemma.* Let `i₀ : {v | p} → {0, …, r_H}`. If, for every column choice, all jets of all kernel series of
step `j` against the products of minors weighted by `p^{𝔠_{i₀(v)}}` (TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.8 (J3)) at the places with `i₀(v) ≥ 1` have
valuation `≥ g`, then `∏_{v: i₀(v)≥1}T̃^{(j)}_{i₀(v),v}(K_jG) ∈ p^{g − [j≥2]v_p(D_Γ)}ℳ^{int}_j` for `G ∈ ℳ^{int}_{j−1}`.
Consequently, with `𝔟_j := F_j(𝔭) − E_{u,j}(𝔭) + [j=1]v_p(D_Γ)` and for a linked `v`:
(c1) `K_j(ℳ^{int}_{j−1}) ⊂ p^{r^H_j(v) − A^{ev}_v + Σ_{v′≠v}r⁰_j(v′) + 𝔟_j}ℳ^{int}_j`;
(c2) `T̃^{(j)}_{i,v}∘K_j(ℳ^{int}_{j−1}) ⊂ p^{r^H_j(v) + Σ_{v′≠v}r⁰_j(v′) + 𝔟_j}ℳ^{int}_j` for `1 ≤ i ≤ r_H`;
(c3) jointly: for linked places `B` and `i : B → {0, …, r_H}`, `∏_{v∈B, i_v≥1}T̃^{(j)}_{i_v,v}∘K_j(ℳ^{int}_{j−1})` lies in
`p^{Σ_{v∈B, i_v≥1}r^H_j(v) + Σ_{v∈B, i_v=0}(r^H_j(v) − A^{ev}_v) + Σ_{v∉B}r⁰_j(v) + 𝔟_j}ℳ^{int}_j`. (Single-place divisibilities
do not add; (c3) is (c) with a general `i₀`.)

*Route.* (o) Strong approximation away from `p` and Gross's comparison of the rational and the level coefficient
models (AutomorphicFormsOnReductiveGroups §7.4); the integral structures of ThetaChainsOnDefiniteUnitaryGroups §3.1 transported by `ρ(g_p)⁻¹`. (a) The
kernel identity ThetaChainsOnDefiniteUnitaryGroups §3.3(iii) at the moved lattices: at a place split in `E` the lattice of the abelian variety is determined by
`Hom(L_v, L′_v)` (the lattice model of the Weil representation of the pair `(GL_{N_{j−1}}, GL_{N_j})`). The one-step relation
is the Hecke relation ThetaChainsOnDefiniteUnitaryGroups §3.3(iv) for the homomorphism pair (the image of an eigenform of parameter `α` has the parameter `α`,
`c_w = 1`, together with the segment; no inversion), read as an operator identity by the first clause of
ThetaLiftsForDefiniteUnitaryGroups §2.2 (the algebra homomorphism `ξ_w` with `θ_φ(F) ⋆ T = θ_φ(F ⋆ ξ_w(T))`), combined with the Satake transform `S(T_i) = (N𝔓)^{i(N−i)/2}𝖾_i(X)` (SmoothRepresentationsOfLocalGroups
SR.4.3) and `𝖾_i(α ∪ segment) = Σ_l𝖾_l(segment)𝖾_{i−l}(α)`. Directly, as an identity of lattice counts:
`#{B₁ ⊂ B of type i : xA ⊂ B₁} = Σ_l (N𝔓)^{(i−l)(g−l)}[g, l]_{N𝔓}·#{A₁ ⊃ A of type i − l : xA₁ ⊂ B}` (`g = N_j − N_{j−1}`;
both sides depend only on the rank of `x` modulo `p`); summing over the classes, the count of superlattices `A₁ ⊃ A` on the
kernel side becomes the operator `T^{(j−1)}_{i−l}` (sublattices) on the source, and
`[g, l]_q = q^{l(g−l)/2}𝖾_l(q^{(g−1)/2}, …, q^{−(g−1)/2})` gives the segment. (b) Smith normal form for the pair `L″ ⊂ L_v`; in
the coordinates of ThetaChainsOnDefiniteUnitaryGroups §3.1 (polynomials in a frame, the frame of `L″` being `diag(p^{(i)}, 1)` times that of `L`, the coefficient
functions transported by the inverse change of basis) a weight vector of weight `μ` is multiplied by `p^{−⟨μ,(1^i, 0)⟩}` at an even
position and by `p^{⟨μ,(1^i,0)⟩}` at an odd one; both `Δ` and `∇` are the direct sums of their weight pieces, and every weight `μ` of
the weight at an even position has `⟨μ, (1^i, 0)⟩ ≤` the sum of its `i` largest entries, while at an odd position (the contragredient)
`−⟨μ, (1^i, 0)⟩ ≤` the sum of the `i` largest entries of the contragredient; so the factor `p^{h_i(λ)}` makes every piece integral (the
mechanism is the normalisation of PotentialAutomorphyInfrastructurePartII §3.8 at Iwahori level; here it is the hyperspecial form
with both lattices). With the opposite transport the exponent would be `h_i(λ) + ⟨μ, (1^i,0)⟩_{even} − ⟨μ′, (1^i,0)⟩_{odd}`, which is
negative for the lowest weight at a thin even position and the highest at an odd top (Check). (c) Expand `∏T̃(K_jG)(c′, L′)` as a sum over tuples of edges `L″ ⊂ L′` and use (o); in a frame adapted to the
edge, the kernel into `L″` is the kernel into `L′` with `i` target columns rescaled by `p^{−1}` at the even positions and by `p`
at the odd ones (the inverse transport of (o), (b); the two primes above `v` are dual), so a minor with column choice `I` acquires
`p^{−#\{I < i\}}` at an even position and `p^{#\{I < i\}}` at an odd one, which with the Hida factor `p^{min(ht(c), i)}` of each column
at an even position gives the weights `𝔠_i(s, c)` of TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.8 (J3); `Σ_c min(ht(c), i)` (the first `i` rows) accounts for the Hida factor,
because the first `i` rows of `ν_j(τ_s)` sum to
`Σ_{a<i}λ_a(τ_s) + i·w̃_j(τ_s)`; by step (6) of 4.10 the jet bound then lands in the Weyl lattice `Δ` of the larger lattice
`L′`. (c1)–(c3): (c) with TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.8 (J2), (J3) at the places of `B` and 4.10's bounds at the other places, added as in 4.10(5).
The comparison of this model with the chain of the tuple (the maps identifying the forms and the kernels at the places above
`p`, and the rescaling of the kernel into `L″` used in (c)) is not given here.

*Check.* `n′ = 2`, `j = 1`, `i ≤ t + 1`: by ThetaChainsOnDefiniteUnitaryGroups §2.3(b) `Λ_1(τ) = (λ(τ) − ((t+1)/2)·1, (−w_1(τ) + k/2)^{t+1})`; the `i` largest
entries at the even position sum to `Σ_{a<i}λ_a(τ_0) − i(t+1)/2`, and those of the contragredient at the odd position
to `i(w_1(τ_1) − k/2)`; the total is `Σ_{a<i}λ_a(τ_0) + i(w_1(τ_1) − κ_1) = Σ_{a<i}λ_a(τ_0) + i·w̃_1(τ_1)`, as displayed.
Written with `w_1` instead of `w̃_1` the formula would be off by `i·κ_1`. (Transport) With `n′ = 2`, `i = 1`, a thin even position and an odd
top, the transport opposite to that of (b) would give the lowest weight at the even position and the highest at the odd one the
exponent `λ_{ev,0} + λ_{ev,k−1} − λ_{odd,k−1} − λ_{odd,0} = O(Sc) + a⁻ − a < 0` after the factor `p^{h_1}`; with the inverse transport
the exponent is `h_1(λ) − ⟨μ, (1, 0)⟩_{ev} + ⟨μ′, (1, 0)⟩_{odd} ≥ 0` for every pair of weights.

*NEW* (the integral statements); *KNOWN* in kind (lattice model; Hecke operators of theta lifts, Rallis, Kudla;
Satake, Tamagawa; Hida's normalisation). *Needs:* ThetaChainsOnDefiniteUnitaryGroups §2.4, ThetaChainsOnDefiniteUnitaryGroups §2.5, ThetaChainsOnDefiniteUnitaryGroups §3.1, ThetaChainsOnDefiniteUnitaryGroups §3.3, ThetaChainsOnDefiniteUnitaryGroups §3.6, TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.8, 4.9, 4.9e, 4.9f, 4.10;
ThetaLiftsForDefiniteUnitaryGroups §2.2; SmoothRepresentationsOfLocalGroups SR.4.3; AutomorphicFormsOnReductiveGroups §7.4; ArithmeticLocallySymmetricSpaces ALS.F.7
(integral Weyl and dual Weyl modules as coefficient lattices); Mathlib `Module.Basis.SmithNormalForm`.

### 4.13 Hecke commutation along the chain

In the setting of 4.12 assume `2r_H ≤ k` (the inequalities
`w̃_1(τ) ≤ w̃_2(τ) ≤ ⋯ ≤ w̃_m(τ)` and `w̃_1(τ) ≥ −λ_{k−1}(τ)` hold for every `τ` by ThetaChainsOnDefiniteUnitaryGroups §2.3). Let `chain_j := K_j∘⋯∘K_1`. For a
place `v` of `F` above `p` and `1 ≤ j ≤ m`:
`Z_j∘chain_j = U_j^{r_H}·p^{P^{ex}_j(v)}·chain_j∘y_v` on `ℳ_0 ⊗ 𝕃_𝔭`, where `U_a := ∏_{b≤a}un_b` (`un_b` the units at `𝔭` of 4.12 (a);
`U_0 := 1`),
`Z_j := Σ_{l=0}^{r_H}(−1)^l c_{j,l}·T̃^{(j)}_{r_H−l,v}` (`T̃_0 = 1`),
`c_{j,l} := p^{h_{r_H}(Λ_j) − h_{r_H−l}(Λ_j)}·(N𝔓_v)^{l(N_j − 2r_H + l)/2}·𝗁_l(𝔪̂_{j,a}(N𝔓_v)^{(t−2x)/2} : 1 ≤ a ≤ j, 0 ≤ x ≤ t)`,
`𝔪̂_{j,a} := 𝔪_a·U_j/U_{a−1}` (the step characters rescaled by the units of the later steps),
`𝗁_l` the complete homogeneous symmetric polynomial, and `P^{ex}_j(v) ≤ P_j(v)` the exact exponent of 4.9e (b). Every
`c_{j,l}` is integral,
`v_p(c_{j,r_H}) ≥ A^{ev}_v`, and therefore
`Z_j∘K_j(ℳ^{int}_{j−1}) ⊂ p^{r^H_j(v) + Σ_{v′≠v}r⁰_j(v′) + 𝔟_j}·ℳ^{int}_j` (`𝔟_j` as in 4.12(c)).

*Route.* The identity is linear algebra valid for arbitrary integers in the place of the weights: iterating 4.12(a),
`ℰ_j(i)∘chain_j = U_j^i·chain_j∘Σ_l 𝖾_l(𝔣′_j)ℰ_0(i − l)`, `𝔣′_j` the family of the `j(t+1)` numbers `U_{a−1}^{−1}𝔪_a(N𝔓)^{(t−2x)/2}`
(induction on `j`: the factor `un_{j+1}^i` comes out in front, and moving `ℰ_j(i − l)` past `chain_j` brings `U_j^{i−l}`, i.e. `U_j^i` and the
segment of step `j + 1` divided by `U_j`; the generating series `∏(1 + 𝔣′X)` multiply); inverting with `Σ_a(−1)^a𝗁_a𝖾_{n−a} = 0` gives
`Σ_{l≤r_H}(−1)^l𝗁_l(U_j𝔣′_j)ℰ_j(r_H − l)∘chain_j = U_j^{r_H}·chain_j∘ℰ_0(r_H)`, and `U_j𝔣′_j` is the family of the
`𝔪̂_{j,a}(N𝔓)^{(t−2x)/2}`; rewrite `ℰ` through `T̃` and `y_v`, with the Hida exponents of 4.12(b) in the local step weights `w̃`. The units
cannot be absorbed into the operators: the coefficient of each `ℰ_j(r_H − l)` carries its own power of them. Integrality (the units do
not change valuations): `v_p(𝗁_l(U_j𝔣′_j)) ≥ l(min_a v_p(𝔪_a) − (n′/2)t)`, the `N𝔓`-part has
exponent `(n′/2)l(N_j − 2r_H + l − t) ≥ 0` since `2r_H ≤ k`, and the `p`-part is
`≥ Σ_{s even}(Σ_{a=r_H−l}^{r_H−1}λ_a(τ_s) + l·w̃_1(τ_s)) ≥ 0` by monotonicity of `w̃` and `w̃_1 > −λ_{k−1}`; for `l = r_H`,
`Σ_{a<r_H}(λ_a + w̃_1) ≥ λ_0 − λ_1` at an even top. The last assertion: the terms `l < r_H` by 4.12(c2), the identity term
by 4.12(c1) and `v_p(c_{j,r_H}) ≥ A^{ev}_v`; with several places, expand the product of the `Z_v` and use 4.12(c3).

*Check.* `j = 2`, `r_H = 1`, `s_a` the sum of the segment `𝔪_a(N𝔓)^{(t−2x)/2}` (`0 ≤ x ≤ t`) of step `a`: the subtracted term is
`un_1un_2(s_1 + un_1^{−1}s_2)` times the scalar factors, not `s_1 + s_2`; since the source Hecke coefficient is fixed, no single unit
in front of the identity repairs the difference unless `un_1 = 1`.

*NEW*. *Needs:* 4.9e, 4.12.

### 4.14 The refined gain on the Hecke image

In the setting of 4.13, let `𝒱` be a set of linked places above `p` with Hecke
types, and `𝒴 := ∏_{v∈𝒱}(y_v^m, p^{𝔵_v})` the product of ideals of the commutative algebra generated by the `y_v`.
(a) For `x ∈ 𝒴·ℳ^{int}_0`, `chain_m(x) ∈ p^{Σ_j(g_j + F_j − E_{u,j})(𝔭) + v_p(D_Γ)}·ℳ^{int}_m` locally at `𝔭`, with
`g_j` computed with `𝒱_p := 𝒱`; and `𝔵_v ≤ mγ_LTΣ_{s∈𝔗_v}α_s`.
(b) Through 4.12(o) this is a statement about the chain of the tuple `ξ`: for `x ∈ M_u ∩ 𝒴·ℳ^{int}_0`, `col_ξ(x)`
satisfies the bound of (a), and (4.11(ii)) its periods against row forms have valuation
`≥ ⌊e_𝔭Σ_j(g_j + F_j − E_{u,j})(𝔭)⌋` at `𝔭`. On `𝒴·ℳ^{int}_0` a top at an even position gains `γ_LTα_s` and a top at
an odd position its whole ramp sum, at the price `P_j(v)` per step.

*Route.* For `P := ∏_{v∈B}y_v` and any subsets `B_j ⊂ B`, induction on `m′`: write `P^{m′+1} = P_{B_{m′}}·(P^{m′}P_C)`;
by 4.13 for each `v ∈ B_{m′}`, `chain_{m′+1}(P_{B_{m′}}W) = p^{−ΣP^{ex}}·Z_{B_{m′}}(K_{m′+1}(chain_{m′}W))` up to a unit at `𝔭` (the
factors `U^{r_H}` of 4.13), and expanding the
product of the `Z_v` into monomials `∏c_{l_v}T̃_{r_H−l_v}`, 4.12(c3) with `i_v = r_H − l_v` (and `v_p(c_{r_H}) ≥ A^{ev}`
when `i_v = 0`) gives `Σ_{B_{m′}}(r^H − P^{ex}) + Σ_{∉B_{m′}}r⁰ ≥ Σ_{B_{m′}}(r^H − P) + Σ_{∉B_{m′}}r⁰` at that step (4.12(c3) holds
with the ledger data `(α̂, ĉ)` by monotonicity, 4.9e (b)): one factor `y_v` buys the refined gain of
`v` at one step. A generator of `𝒴·ℳ^{int}_0` is `∏_{v∈B}y_v^m(F₀)` with `F₀ ∈ p^{Σ_{𝒱∖B}𝔵_v}ℳ^{int}_0`; take
`B_j := {v ∈ B : r^H_j − P_j ≥ r⁰_j}`; the places of `𝒱 ∖ B` receive `𝔵_v ≥ Σ_j(r^H_j − P_j − r⁰_j)₊` in advance.
`𝔵_v ≤ mγ_LTΣα_s`: `Σ_j(r^H_j − P_j − r⁰_j)₊ ≤ Σ_j(γ_LTΣα_s − P_j) ≤ mγ_LTΣα_s − m` because `r^H_j ≤ γ_LTΣα̂_s ≤ γ_LTΣα_s` and
`P_j ≥ 1`, and the
ceiling adds less than `1`. (b): the local model of 4.12 (o) is the chain of the tuple read at the places above `p`; that
comparison (the identification of the forms and of the kernels at the places above `p`) is not given here (4.12, route).

*NEW*. *Needs:* 4.9e, 4.9f, 4.11, 4.12, 4.13.

### 4.14a Elementary divisors along a progression

Let `𝒦 ⊃ ℚ_p` be complete
ultrametric, `M(X)` an `n × n` matrix of polynomials of degree `≤ δ₀` with integral coefficients in the binomial basis
`(X choose i)`, with `det M = lead·∏_{ζ}(X − ζ)`, and `t_j := t₀ + jd` (`0 ≤ j < Y₀`) a progression with `p ∤ d`,
`t₀, d ∈ ℤ_p`. Let `Y₀ ≤ p^H`, `δ₀ ≤ p^H`, `E ≥ 1`, and `M(t_j) = U_j·diag(dg_j)·V_j` Smith forms. If
`−log_p|lead| + #roots/(p − 1) ≤ nΛ_M`, then `mean_j #{i : |dg_j(i)| ≤ p^{−E}} ≤ n·(δ₀/Y₀ + (Λ_M + δ₀H/Y₀)/E)`.
*Corollary.* Let `M` have coefficients in `ℤ_p` (in the binomial basis), `δ₀ ≤ p^H`, `Y₀ ≤ p^H`, `D ≥ 0` an integer, the hypothesis on
`Λ_M` read with the roots of `det M` in `𝒦 = ℂ_p`. If bilinear forms `Ψ_j` on a free `ℤ_p`-module `L` of rank `n` have Gram matrices
`s_j^{−1}M(t₀ + j)` (difference `d = 1`), `0 < |s_j| ≤ 1`, then `Σ_{j<Y₀}bad(Ψ_j, L, D) ≤ Y₀·n·(δ₀/Y₀ + (Λ_M + δ₀H/Y₀)/(D + 1))`, where
`bad(Ψ, L, D) := n −` (the largest number of pairs `x_i, y_i ∈ L` with `Ψ(x_i, y_l) = δ_{il}p^D`).

*Route.* (1) For `k ≤ p^H` and `t ∈ ℤ_p` the polynomial `(p^HX + t choose k)` has integral coefficients
(`(p^HX + t choose k) = Σ_i(p^HX choose i)(t choose k − i)` and `(p^HX choose i) = (p^HX/i)·∏_{m<i}(p^HX/m − 1)`); hence
`M(p^HX + t) = M(t) + X·N(X)` with `N` integral. (2) Let `‖·‖_E` be the Gauss norm at radius `p^{−E}` in `X`. After multiplication
by the unimodular matrices of the Smith form of `M(t)`, every row belonging to an elementary divisor of absolute value
`≤ p^{−E}` has norm `≤ p^{−E}`; so `‖det M(p^HX + t)‖_E ≤ p^{−E·β(t)}`, `β(t)` the number of such divisors. (3) The Gauss norm is
multiplicative: `‖lead·∏_ζ(p^HX + t − ζ)‖_E = |lead|·∏_ζmax(|t − ζ|, p^{−H−E})`; hence the pointwise inequality
`β(t)·E ≤ v_p(lead) + Σ_ζmin(v_p(t − ζ), H) + E·#{ζ : v_p(t − ζ) ≥ H}` (from `min(v, H + E) ≤ min(v, H) + E·[v ≥ H]`). (4) Along the
progression, for each root: the valuations need not be integers, so count with strict inequalities,
`min(v, H) ≤ Σ_{e=1}^{H}[v > e − 1]`; if `v_p(t_j − ζ) > e − 1` and `v_p(t_{j′} − ζ) > e − 1`, then `v_p((j − j′)d) > e − 1`, an integer, so
`p^e | j − j′` (`p ∤ d`): at most `Y₀/p^e + 1` indices. Hence `Σ_jmin(v_p(t_j − ζ), H) ≤ Σ_{e=1}^{H}(Y₀/p^e + 1) ≤ Y₀/(p−1) + H`, and
likewise at most one index per root has `v_p(t_j − ζ) ≥ H` (`Y₀ ≤ p^H`), so `Σ_j#{ζ : v_p(t_j − ζ) ≥ H} ≤ #roots ≤ nδ₀`. Add and
divide by `EY₀`. The valuation of `det M(t_j)` itself is
not used (it is unbounded when a root is close to `t_j`). The corollary: `p^D` times a pair of dual vectors is available
for every elementary divisor of absolute value `≥ p^{−D}|s_j|`, and `|s_j| ≤ 1`.

*NEW* (elementary); (1) KNOWN (Mahler; Amice). *Needs:* Mathlib (Smith normal form over a discrete valuation ring, Gauss
norm of polynomials and its multiplicativity, `Polynomial.roots`, binomial polynomials).

### 4.14b Definitions: lattices at an edge, the hypotheses (H_I) and the blocks of Theorem I

Setting of 4.12 at level `0` for one place `v` with `r_H = 1`, written `w := √p`, `Q₀ := N𝔓_v`; `λ` the
weight of the tuple and `h := h_1(λ)`. *Lattices at an edge* (used also in 4.15): for a lattice `L` at `v` let `H(L)` be the
dual Weyl lattice `∇` of the tuple of Frobenius twists of `L` (the coefficient lattice of ALS.F.7), with the pairing
`⟨F, G⟩_h := G(p^{h}F)` against the dual lattices; an *edge* of type `r` into `L` is `e = (L″ ⊂ L)` with `pL ⊂ L″`,
`L/L″ ≅ (𝒪/p)^r` (its *source* `L″`, *target* `L`); `H^{½}(e) := p^{−h/2}H(L″ + √p·L)` (the half-way lattice) and `H^{½}(e)^∨` the
lattice dual to it for `⟨·, ·⟩_h`. For integers `dep, c ≥ 0` (exponents of `w`) put
`C(e) := w^{−dep}H(L″) ∩ H^{½}(e) ∩ ⋂_{e′≠e, src e′ = L″}w^cRe(e′)` and
`C′(e) := w^{−dep}H(L)^∨ ∩ H^{½}(e)^∨ ∩ ⋂_{e′≠e, tgt e′ = L}w^cH^{½}(e′)^∨`.
*The hypotheses (H_I).* Integers `s_max, G′ ≥ 1`, `Y ≥ 1`, `D_p, c* ≥ 0`, `Λ_log := C₀s_max²·log a`, where `C₀ ≥ 1`,
`C_m ≥ 13` (below), `C_H` and `Y_b ≥ C_H` are absolute constants fixed once for all, large enough for 4.14h (`C_H` large compared
with `C_m`), such that: the orbit of `v` has at least two even tops, consecutive even tops are at distance `≤ G′` with at
most `s_max` odd tops between them, and `2s_max + 3 ≤ k`; `k²Y² ≤ p < a/b′`; the top weights lie in the *boxes*
`a_s ∈ [a, a + a/(kY)]`, `a⁻_s ∈ [b′, b′ + Δ_b]` with `Y_b|𝔗_v|Λ_log·b′/k ≤ Δ_b ≤ b′/2`, and the other entries are
`≤ c″ ≤ Λ_log·b′/k` in absolute value; `2Y_b|𝔗_v|Λ_log < k`, `kY²Y_b|𝔗_v|Λ_log·log a ≤ a/b′`, `C_H|𝔗_v|Λ_log² ≤ k`,
`8log(|𝔗_v|Y) ≤ Λ_log`, `δ_I := C_Hs_maxΛ_log/k + 2Δ_b/b′ < 1/6`, and no odd power of `p` lies in
`[(1 − 2δ_I)a/b′, (1 + 2δ_I)a/b′]`; `D_p ≥ C_H|𝔗_v|Y²(s_max⁵ + k³)·log_p a`, `c* ≥ 8(D_p + 1)`, and
`C_Hk³|𝔗_v|p^{4G′}(c* + |𝔗_v|c″ + n′c″)Y ≤ b′`. Put `dep°_v := Σ_{y∈𝔗_v odd}min(a⁻_{τ_y}, a_{τ_{y⁻}}/p^{d(y)})` (`y⁻` the
nearest even top before `y`, `d(y)` its odd distance),
`R°_v := C|𝔗_v|s_max(a/p² + b′/p + Λ_log·a/(pk) + Λ_log·b′/k) + C|𝔗_v|(p^{G′}(c_v + k) + k·lg_p a + c″) + 2n′c″` and
`c_v := c* + C|𝔗_v|k·lg_p a + 4|𝔗_v|c″ + 2n′c″`.
*The two-letter model.* Each top `s` carries a *vector letter* and a *covector letter*, two sets of `k` variables, of
degrees `(a_s, a⁻_s)` at an even top and `(a⁻_s, a_s)` at an odd top; the variable of index `0` of a letter is *special*;
`𝕊(a, a⁻) := ⊗_{s∈𝔗_v}(Sym^{deg(vector letter)}(V) ⊗ Sym^{deg(covector letter)}(V^∨))` over `𝒪`, `V = 𝒪^k` (polynomials with
coefficients in `𝒪` in the vector and in the covector variables; `GL_k` acting, letter `s` read at the position `s`; the covector
letters carry the dual Weyl lattice of the weight `(0, …, 0, −deg)`, and their pairing with the vector side is the Fock pairing,
whose dual lattice is the divided-power lattice: in rank two, with the invariant pairing normalised by `⟨X^d, ξ^d⟩ = 1` (`ξ, η` the
dual variables), the functional dual to `X^{d−1}Y` is `d·ξ^{d−1}η`, so `(Sym^dV)^∨` does not contain the polynomial `ξ^{d−1}η` when
`p | d`, and is not the polynomial letter). For a rational line `g` (an element of `GL_k(W(𝔽_{Q₀}))` up to the stabiliser of its first basis line modulo `p`),
the *lift at `g`* of a polynomial reads the letter at position `s` in the basis `σ^s(g)` and multiplies by `w` the non-special
variables of vector letters and the special variables of covector letters; `F` has *order `≥ j` at `g`* if its lift has
coefficients in `w^j𝒪` (this is `F ∈ w^jRe(e_g)`, `e_g` the edge of `g`).
*Segments.* The even tops cut the orbit into *segments*; a segment has a start even top with vector letter `x`, odd tops
`y_1, …, y_s` at distances `d_1 < ⋯ < d_s` with letters `v_i` (vector, degree `a⁻_{y_i}`) and `ξ_i` (covector, degree `a_{y_i}`), and
an end even top at distance `G` with letters `x^+` (vector) and `η` (covector); `P_i := p^{G−d_i}`, `Q := p^G`; `y_i` is *near* if
`p^{d_i} < a/b′`, *far* otherwise.
*Blocks.* A *block* `b` consists of digits `rz_i, ry_i ∈ {0, …, P_i − 1}^k` with `Σrz_i ≤ a⁻_{y_i}`, `Σry_i ≤ a_{y_i}` and the differences
divisible by `P_i`, with *coarse degrees* `A_i := (a⁻_{y_i} − Σrz_i)/P_i`, `C_i := (a_{y_i} − Σry_i)/P_i`, and integers `o_i ≥ 0` (far
tops), `𝑤_i, sg_i ≥ 0` (near tops), `o^+ ≥ 0`. Put `ō_i := o_i` (far) or `𝑤_i + sg_i` (near), `A_0 := ⌊(a − E_0)/Q⌋` with
`E_0 := C(a/p² + b′/p + Λ_log·s_maxa/(pk) + Λ_log·b′/k) + C·k²s_maxp^{2G′}c_v`, and `Cap(l) := A_0 + Σ_{i<l}(A_i − ō_i)`. The block is *kept* if
`o_i ≤ min(A_i, Cap(i) + Λ_log·A_i/k)` at the far tops; `𝑤_i ≤ A_i`, `sg_i ≤ min(C_i, 2Λ_log·A_0/k)` and `𝑤_i + sg_i ≤ A_i(1 + 4/p²) + Λ_log·Cap(i)/k`
at the near tops; and `o^+ ≤ Cap(s+1) + (Λ_log/k + 4/p²)Σ_i2a/P_i + Λ_log·a⁻_{x^+}/k`. Its *order* is
`ord(b) := Σ_i(P_iō_i + Σ_{c≥1}rz_i(c) + ry_i(0)) + o^+`.
*Block lattices and symbols.* *Coarse variables:* `V_{i,c} := v_{i,c}^{P_i}`, `Ξ_{i,c} := ξ_{i,c}^{P_i}`, and the variables of `x^+`, `η`.
The *block lattice* `Bl_μ(b)` (margin `μ ≥ 0`) is the `𝒪`-span of the products
`∏_{i far}E_i^{j_i}·E_+^{j_+}·∏_{i far}V_{i,0}^{A_i−o_i}·(x^+_0)^{a_{x^+}−o^+}·y·g`, where `E_i := Σ_{c≥0}V_{i,c}Ξ_{i,c}`, `E_+ := Σ_{c≥0}x^+_cη_c`,
`j_i ≤ min(o_i, C_i)`, `j_+ ≤ min(o^+, a⁻_{x^+})`, `g` is an integral form of degree `a⁻_{x^+} − j_+` in the non-special variables of
`η`, and `y` is an integral polynomial in the non-special coarse variables of `V_1, Ξ_1, …, V_s, Ξ_s, x^+`, of degrees
`(𝑤_i, C_i − sg_i)` at the near tops, `(o_i − j_i, C_i − j_i)` at the far tops and `o^+ − j_+` at `x^+`, such that for every far top
`i` all `GL_{k−1}`-types of `y` on the letters up to `V_i` have first row `≤ ⌊Cap(i) − μ⌋`, and all its types on all letters have
first row `≤ ⌊Cap(s+1) − μ⌋`. Here "all `GL_{k−1}`-types of `y` on a set of letters have first row `≤ M`" means that `y` lies in the
largest subspace stable under the polarisation operators of those letters (`x_a∂_b` on vector letters, contragrediently on
covector letters) inside the span of the monomials whose weight in the first non-special coordinate is `≤ M`. The *symbol* of
`u ∈ Bl_μ(b)` is
`σ_b(u) := ∏_iv_i^{rz_i}ξ_i^{ry_i}·∏_{i near}v_{i,0}^{P_i(A_i−𝑤_i)}ξ_{i,0}^{P_isg_i}·u`; for a family `β = (b_j)` of blocks over the
segments and `u = (u_j)`, `σ_β(u) := ∏_jσ_{b_j}(u_j) ∈ 𝕊(a, a⁻)`, homogeneous of order `ord(β) := Σ_jord(b_j)`.
*Segment lattice and form.* The *segment lattice* is the direct sum over the kept blocks of
`{u ∈ Bl_μ(b) ⊗ ℚ : v_p(u_m) + ½v_p(m!) + ½v_p(Π_b) ≥ 0 for all monomials m}`, `Π_b := ∏_{i near}(A_i − 𝑤_i)!·sg_i!`, with the
*segment form* `Σ_bΠ_b·Σ_mu_{b,m}u′_{b,m}m!`; its *bad share at `D`* is `1 −` (the largest rank of a saturated sublattice whose
primitive vectors `u` all have a partner `u′` with `v_p(form(u, u′)) ≤ D`)`/rank`.
*The cap-free classes `BL_E`* (`E ≥ 0`), over which the correction terms of 4.14d run. A block is in `BL_E` if its digits satisfy
the conditions above; at a far top `o_i ≤ A_i`, `o_i ≤ (1 − δ_I/4)A_i + E` and `𝑤_i = sg_i = 0`; at a near top `𝑤_i ≤ A_i`, `sg_i ≤ C_i`,
`sg_i ≤ 2Λ_log·A_0/k + E` and `o_i = 0`; and `o^+ ≤ a_{x^+}`, `o^+ ≤ a/p² + 3b′/p + (Λ_log/k + 4/p²)·4a/p + 2Λ_log·b′/k + E`. There is no condition
through `Cap(i)` and none on `𝑤_i + sg_i`; the block lattices `Bl_μ(b)` and symbols are defined for every block by the formulas
above. Put `κ₁ := 13k·s_max·p^{G′}`.
*Margins.* The key lemma 4.14d is used at the margin `13k·s_max·p^{G′}c_v + 12c_v` (the symbols of the pairing 4.14e), and the
theorem 4.14h is assembled at the margin `μ₀ := C_m·k·s_max·p^{G′}c_v + 12c_v` for a constant `C_m ≥ 13`; the last condition of
(H_I), with `C_H` large compared with `C_m`, gives `μ₀ ≤ b′/(k·p^{G′}·Y)`, the range of 4.14f, 4.14g (`s_max ≤ k` by `2s_max + 3 ≤ k`,
and `c_v ≤ C(c* + |𝔗_v|c″ + n′c″)` because `c* ≥ 8D_p ≥ |𝔗_v|k·lg_p a`).

*Checks.* A segment with one far odd top and no digits: `Bl_0(b)` is spanned by `E_1^{j}V_{1,0}^{A_1−o_1}(x^+_0)^{a_{x^+}−o^+}·y·g`, and the
order `P_1o_1 + o^+` counts the powers of `w` that the lift at the line of the edge attaches to the non-special coarse variables of
`V_1` and of `x^+`. Without the thresholds on the first rows of `y` the span would contain polynomials of order larger than
the depth `dep°_v + R°_v`.

*NEW* (definitions). *Needs:* 4.12; ArithmeticLocallySymmetricSpaces ALS.F.7.

### 4.14c Frobenius-twisted columns at rational planes

Let `W = W(𝔽_Q)` with Frobenius `σ`, `𝒪 ⊃ W`
with `w² = p`, and `1 ≤ r < k` (the first `r` coordinates are the *plane*, the last `k − r` the *normal* ones). Let letters `1, …, N` be
given, each a vector letter or a covector letter in `k` variables, at integer
positions `pos(1) ≤ ⋯ ≤ pos(N) ≤ z`. A *path* is a sequence `μ_0 = 0, μ_1, …, μ_N` of dominant weights of `GL_k` with `μ_i/μ_{i−1}` a
horizontal strip at a vector letter and `μ_{i−1}/μ_i` one at a covector letter; `ht_i(c) := #{b : μ_i(b) ≥ c}`. The *column* `K_c(μ)` is
the exterior vector obtained from `1` by the exterior product with the letter `i` where `ht_i(c) > ht_{i−1}(c)` and the contraction
against it where `ht_i(c) < ht_{i−1}(c)` (for `c ≤ 0`, with complementary index sets). The *twisted column* `K^σ_c(μ; g)`,
`g ∈ GL_k(W)`, is defined by the same recursion with the letter `i` read in the basis `σ^{pos(i)}(g)` and every component of the
current vector raised to the power `p^{pos(i) − pos(i′)}` before the step at `i` (`i′` the previous letter at which the height
changed), and to `p^{z − pos(i′)}` at the end. Call the step at `i` *costly* if the height rises from a value `≥ r` or falls from a
value `≤ r`, and assume `pos(i′) < pos(i)` whenever `i′ < i`, the height changes at `i′` and the step at `i` is costly; for a column
`c ≤ 0` assume moreover `ht_i(c) > r` at every letter `i` (*dual-column hypothesis*; it holds when `N + r ≤ k − r`). Orders are
taken for `r`-planes (the lift multiplies by `w` the variables of index `≥ r` of vector letters and of index `< r` of covector
letters). Then, with `𝔬 := Σ_{i costly}p^{z−pos(i)}`:
(a) every component of `K^σ_c(μ; g)` is integral and has order `≥ 𝔬` at every `g′ ∈ GL_k(W)`;
(b) the lift at `g` of `K^σ_c(μ; g)_J` is `≡ w^{𝔬}·(K_c(μ′)_{J′}·K_c(μ″)_{J″})(X_{i,b}^{p^{z−pos(i)}}) (mod w^{𝔬+1})`, `μ′` (`μ″`) the path of the
first `r` (last `k − r`) coordinates in the first `r` (last `k − r`) variables, `J′, J″` the two parts of `J`.

*Route.* *Transport.* Passing from `g` to `g′` acts on the vector at position `s` by the exterior power of `σ^s(g^{−1}g′)`, and
intertwines wedge and contraction with the letters read at `g′`; raising components to the power `P = p^{s′−s}` gives
`(Σm_{JJ′}A_{J′})^P ≡ Σσ^{s′−s}(m_{JJ′})A_{J′}^P` modulo `p` times products of `P` components, so if all components lie in `w^o` the error
lies in `w^{oP+2}` (`w² = p`): divisibility by `w^o` becomes divisibility by `w^{oP}`, an extra `w` on a component stays an extra `w`,
and becomes an extra `w²` when `s < s′`. Call a component `J` of an exterior vector of height `h` *minimal* if, for `c ≥ 1`, `|J| = h`
and `J` contains the plane when `h ≥ r` and lies in it when `h ≤ r`, and, for `c ≤ 0`, `J` lies in the normal coordinates. (a)
Induction on the letters with the invariant: in the transported coordinates all components after `j` letters lie in
`w^{o(j,s)}`, `o(j, s) := Σ_{i<j costly}p^{s−pos(i)}`, and the non-minimal ones in `w^{o(j,s)+1}`. At a non-costly step a minimal
target arises only from a variable of order `0` times a minimal source; at a costly step the previous letter at which the
height changed is strictly earlier, so non-minimal sources carry `w²`, and a minimal target arises from a variable of order `1`
times a minimal source or a variable of order `0` times a non-minimal one, gaining one `w`. (b) Induction with the invariant
"the vector after `j` letters is `w^{o(j,s)}Y` with `Y` modulo `w` the symbol column in the variables `X^{p^{s−pos}}`, using only
variables of order `1` at costly steps and of order `0` at the others"; at a costly step a term (variable of order `0`)×(source
whose symbol vanishes) has `Y₁ = wT`, hence `Y₁^p ∈ w^p𝒪`, `p ≥ 2`, and contributes nothing modulo `w`. That the symbol vanishes
there and that the symbol column is the product of the plane column and the normal column are consequences of the dominance
of the path (a column of a dominant weight fills the plane rows first) whose proofs are not given here; for `c ≤ 0` the
dual-column hypothesis makes every rise costly and no fall.

*Checks.* `r = 1`, two vector letters `x` (position `0`), `v` (position `d`), a column of height `2`: `K^σ = x_0^{p^d}v_c − x_c^{p^d}v_0`, one
costly step, order `1`, leading term `w·x_0^{p^d}v_c`. A vector letter `x` and then a covector letter `ξ` at distance `d`, a column that
rises and falls: `K^σ = Σ_bx_b^{p^d}ξ_b`, order `1`, leading term `w·x_0^{p^d}ξ_0`.

*NEW* (relatives: Moore determinants, Dickson invariants). *Needs:* Mathlib (exterior powers, Witt vectors).

### 4.14c′ Standard polynomials of paths of horizontal strips with thresholds

Let
`𝒪 ⊃ W(𝔽_Q)` be as in 4.14c, `k ≥ 3`, and letters `1, …, N`, each a vector letter or a covector letter in the `k − 1` non-special
variables, with degrees `δ_1, …, δ_N`; `GL_{k−1}` acts on the vector letters by `x ↦ gx` and on the covector letters contragrediently.
Let `M_1, …, M_N ≥ 0` be integers (*thresholds*), and let `𝒴` be the `𝒪`-module of polynomials `y` with coefficients in `𝒪`, of degree
`δ_i` in the letter `i`, such that for every `i` all `GL_{k−1}`-types of `y` on the letters `1, …, i` have first row `≤ M_i` (as defined in
4.14b: `y` lies in the largest subspace stable under the polarisation operators of those letters inside the span of the monomials
whose weight in the first non-special coordinate is `≤ M_i`). A *thresholded path* is a path `κ_0 = 0, κ_1, …, κ_N` of dominant weights
of `GL_{k−1}` (4.14c, with `k − 1` in place of `k`: `κ_i/κ_{i−1}` a horizontal strip of size `δ_i` at a vector letter, `κ_{i−1}/κ_i` one at a
covector letter) with first rows `κ_i(0) ≤ M_i`, and a *standard polynomial* of it is `∏_cK_c(κ)_{I(c)}`, the product over the columns `c`
of the components `I(c)` of the columns `K_c(κ)` of 4.14c, `I` a standard filling (increasing along the columns and non-decreasing
along the rows). Then `𝒴` is contained in the `𝒪`-span of the standard polynomials of the thresholded paths.

*Route.* The route is not given here. For a single vector letter and no threshold this is the standard monomial theory of bideterminants
(IntegralWeylModulesOfGeneralLinearGroups §0.1); for products of symmetric powers and their duals with thresholds on the first rows,
no published statement is known (the nearest classical objects are the rational tableaux of mixed tensors).

*Checks.* One vector letter of degree `δ` and `M_1 ≥ δ`: `𝒴` is the space of polynomials of degree `δ`, the paths are `(0, (δ))`, and the
standard polynomials of the one-row shape `(δ)` are the monomials. With `M_1 < δ` and one vector letter, `𝒴 = 0` (the type `(δ)` has first
row `δ`), and there is no thresholded path.

*NEW*. *Needs:* 4.14b, 4.14c; IntegralWeylModulesOfGeneralLinearGroups §0.1.

### 4.14d The key lemma: symbols lift to vectors of small depth at one edge

Assume (H_I) of 4.14b with the
windows of `a_s` and `a⁻_s` enlarged by `2Λ_log·b′/k`, let `c := c_v` and `μ := κ₁c + μ′ = 13k·s_max·p^{G′}·c + μ′` with `μ′ ∈ {0, 12c}`
(`κ₁`, `BL_E` of 4.14b). For every rational line `g`, every family `β` of blocks of `BL_0` and all `u_j ∈ Bl_μ(b_j)` there is
`F ∈ 𝕊(a, a⁻)` such that (i) `w^{ord(β)}F` is integral; (ii) the lift of `F` at `g` is `≡ σ_β(u) (mod w^c)`; (iii) `F` has order `≥ c`
at every rational line other than `g`. Equivalently `F ∈ C(e_g)` with `dep = ord(β)` and `F ≡ w^{−ord(β)}σ_β(u)` modulo `w^cRe(e_g)`
in the coordinates of the edge. Every kept block lies in `BL_0`, and `ord(β) ≤ dep°_v + R°_v` for every kept family.

*Route.* (1) *Generators.* The thresholded polynomials `y` are spanned by standard polynomials `∏_cK_c(κ)_{I(c)}`, `κ` a path of
`GL_{k−1}` along the letters with first rows within the thresholds, `I` a standard filling (4.14c′). (2) *Factors.* Join `κ` with the plane part
`ν(T) := a_0 + Σ_{V_i before T}(A_i − ō′_i)` (`ō′_i := o_i` at a far top, `𝑤_i` at a near top) to a path `(ν, κ)` of `GL_k` (dominant
because of the thresholds; `a_0 ≤ A_0 − μ − Σsg`) and apply 4.14c with `r = 1`: each column of `y`, with the monomial in
special variables that `ν` assigns to it, is the leading term of a twisted column. The other parts of the symbol are leading
terms of: `⟨v_i, ξ_i⟩^{P_i}` for `E_i` (order `P_i`), `⟨x^+, η⟩` for `E_+`; `(Σ_bx_b^{p^{d_i}}ξ_{i,b})^{P_i}` for `ξ_{i,0}^{P_i}` at a near top
(order `P_i`, leading term `x_0^Qξ_{i,0}^{P_i}`); `v_{i,c}x_0^{p^{d_i}} − v_{i,0}x_c^{p^{d_i}}` for a digit `v_{i,c}`, `c ≥ 1` (order `1`);
`Σ_bx_b^{p^{d_i}}ξ_{i,b}` for a digit `ξ_{i,0}` (order `1`); variables of order `0` for themselves. *The keys have these orders:* with
`x̃ := (x_0, wx_1, …)`, `ξ̃ := (wξ_0, ξ_1, …)` and `u := g′^{−1}`, the lift at `g′` of `Σ_ax_a^{p^d}ξ_a` is
`≡ Σ_bx̃_b^{p^d}ξ̃_b = w·x_0^{p^d}ξ_0 + w^{p^d}Σ_{b≥1}x_b^{p^d}ξ_b (mod p)`, of order `≥ 1`; the twisted `2 × 2` minors are the same with
`[ṽ; x̃^{(p^d)}]`, each of their terms containing a normal index. (3) *Localiser.* Multiply by
`x_{j_0,0}^c·∏_{c′≥1}(∏_jx_{j,0}^{Q_j−1} − ∏_jx_{j,c′}^{Q_j−1})^c` (product over all segments): modulo `w` the lift of `x_{j,a}` at `g′` is
`x_{j,0}·σ^{s_j}(u_{0a})`, and `Σ_jp^{s_j}(Q_j − 1) = p^{s_0}(Q₀ − 1)` (the even tops in cyclic order), so on `𝔽_{Q₀}`-points the lift of
`x_{j_0,0}·∏_{c′≥1}(⋯)` is a monomial times `[ū_{00} ≠ 0]·∏_{c′≥1}(1 − [ū_{0c′} ≠ 0])`, nonzero only if `g′` has the line of `g`: the
PRODUCT over `c′` has order `≥ 1` at every other rational line (a single factor need not), and the leading term is a monomial in
the `x_{j,0}`. (4) *Room.* The total exponent of `x_0` used in a segment,
`Q(a_0 + Σsg) + Σ_ip^{d_i}(Σ_{c≥1}rz_i(c) + ry_i(0)) + c(k−1)(Q−1) + c`, is at most `a_x − o^+` of the previous segment (from
`A_0 = ⌊(a − E_0)/Q⌋` and the last size condition of (H_I)). (5) *Tails.* Induction on `1 ≤ n ≤ c` with the statement: for every
family `β` of blocks in `BL_{(c−n)κ₁}` and every generator `s` of the block lattices with margin `μ′ + nκ₁` there is a product `Π`
of the factors with `w^{−ord(β)}·lift(Π) = σ_β(s) + Σ_{1≤ι<n}w^ιτ_ι (mod w^n)`, each `τ_ι` in the span of the symbols of families
in `BL_{(c−(n−ι))κ₁}`, of order `≤ ord(β) + ι`, with generators of margin `μ′ + (n − ι)κ₁`: expand the product of (leading term +
remainder) over the factors; a remainder has its coefficient at a monomial of order `o + e` divisible by `w^{max(1,e)}`, and each
product of a head and a monomial of the letter variables close to the standard one is the symbol `σ_{b′}(u′)` of the *block
of the monomial* `b′` (digits the residues of the exponents, coarse parts the rest), which lies in `BL_{(c−(n−ι))κ₁}` with margin
lowered by `ικ₁`. "Of order `≤ ord(β) + ι`" makes the subtraction integral: `w^{ord(β)}·w^ιF′` with `w^{ord(β′)}F′` integral and
`ord(β′) ≤ ord(β) + ι`. (6) Subtract `w^ι` times the polynomial for `τ_ι` and conclude at `n = c`; by linearity from generators to
all `u_j`. Kept blocks lie in `BL_0` by the dichotomy `A_0 < (1 − δ_I)A_i` at the far tops. The bound on `ord(β)` is arithmetic
from the kept conditions (at a far top `P_io_i ≤ P_iCap(i) ≈ a_x/p^{d_i}`, at a near top `P_i(𝑤_i + sg_i) ≈ a⁻_{y_i}`). Not given here:
the room inequality (4); the numerical part of (5), that the block of the monomial stays
in the class and that the thresholds move by at most `κ₁` per unit of `ι` (which fixes the constants `13`, `12` and `E_0`); and the
inclusion of the kept blocks in `BL_0`.

*NEW*. *Needs:* 4.14b, 4.14c, 4.14c′.

### 4.14e The pairing of the lifts

In the setting of 4.14d, for every edge `e` of type `1` there are
nonzero `κ_β ∈ 𝒪` with `v_p(κ_β) ≤ 8|𝔗_v|k·log_pa` and maps `(β, u) ↦ F(β, u) ∈ C(e)`, `G(β, u) ∈ C′(e)` (depth
`⌊dep°_v + R°_v⌋`, exponent `c`), defined for kept families and `u_j` in the segment lattice supported on the block `b_j`, with
`⟨F(β, u), G(β′, u′)⟩_h = [β = β′]·κ_β·∏_jform_j(u_j, u′_j) + w^cν`, `ν ∈ 𝒪`, whenever the values of the segment forms are integral.

*Route.* (1) For an edge `e` and its dual edge `e^∨` there are flat identifications in which both edges are in standard
position, and a linear map `Ξ` to the dual space with `Ξ(C(e^∨)) ⊂ C′(e)` such that `⟨F, ΞF′⟩_h = z·Fock(lift F, lift F′)`,
`z := ∏_{letters}p^{k⌊log_pdeg⌋}/deg!`, `Fock(P, P′) := Σ_mP_mP′_mm!` (the apolar pairing). (2) Take for `F` and `F′` the polynomials of
4.14d (with `μ′ = 12c`) for `e` and for `e^∨`, with symbols `σ_β(s(u))`, `σ_{β′}(s′(u′))` for suitable maps `s, s′` into the block
lattices. (3) Symbols of different blocks have disjoint monomials. For one block, a monomial of `σ_b(u)` has exponents `ρ_x + P_xn_x`
(`ρ` the digits, `n` coarse); `(ρ + Pn)! = (Pn)!·ρ!·∏_{y≤ρ}(1 + Pn/y)`, the product a unit because `v_p(y) < v_p(P)`, and
`(Pn)! = P!^n·n!·c(P, n)`, `c(P, n)` the number of partitions of a set of `Pn` elements into `n` blocks of size `P`, a unit by Legendre
(`s_p(Pn) = s_p(n)`). The coarse degree of each letter being fixed by the block,
`Fock(σ_b(u), σ_b(u′)) = K_b·Π_b·Σ_μu_μu′_μ·μ!·ε_b(μ)` with `K_b := ∏_{letters}P!^{(coarse degree)}·∏ρ!` and `ε_b(μ) := ∏_xc(P_x, n_x)·∏_{y≤ρ_x}(1 + P_xn_x/y)`
a unit that depends on the monomial `μ`; the maps `s, s′` divide out `ε_b(μ)` modulo `w^c`: they are diagonal in the monomials, do
not preserve the thresholds, and spend the margin between `μ₀` and `13k·s_max·p^{G′}c + 12c` (4.14b). Not proved here: the
identity (1) as a statement about the lattices, and the construction of `s, s′` within that margin.

*NEW*. *Needs:* 4.14b, 4.14d.

### 4.14f The rank of the kept blocks

For a segment, a class of digits `(rz, ry)` and a margin `μ ≥ 0`, let
`rk` be the sum of the ranks of `Bl_μ(b)` over the kept blocks with these digits, and `m° := Dim_k(A_0)·∏_iDim_k(A_i)Dim_k(C_i)·Dim_k(a⁻_{x^+})`,
`Dim_k(n) := (n + k − 1 choose k − 1)`. Then `rk ≤ m°`; if `⌈μ⌉ ≤ A_0s_maxΛ_log/k` then
`rk ≥ (1 − e^{−Λ_log/8})(1 − e^{−Λ_log/3})(1 − (k−1)⌈μ⌉/A_0)·m°`; and for `μ ≤ b′/(k·p^{G′}·Y)`, `rk ≥ m°/2`. Consequently
`(1 − κ_P)·dim 𝕊(a, a⁻) ≤ #ℙ^{k−1}(𝔽_{Q₀})·∏_{segments}rank(segment lattice)` with
`κ_P := C|𝔗_v|(e^{−Λ_log/8} + k·p^{G′}(μ + s_maxk)/b′ + 1/Y + kE_0/a) ≤ C|𝔗_v|s_max/Y`.

*Route.* The rank of `Bl_μ(b)` is the sum over the levels `(j, j_+)` of (the number of chains of `GL_{k−1}`-weights along the letters
within the thresholds, weighted by the Weyl dimension of their end) `×` `Dim_{k−1}(a⁻_{x^+} − j_+)`. A chain of `GL_k`-weights for
`Sym^{A} ⊗ ⊗_i(Sym^{A_i} ⊗ (Sym^{C_i})^∨)` together with a `GL_{k−1}`-weight interlacing its end determines a block (its `o_i, 𝑤_i, sg_i, o^+`
are differences of first coordinates), a level and a `GL_{k−1}`-chain, injectively; by the branching rule the pairs are counted
by the dimension of that tensor product over `GL_k`, and the pairs landing in kept blocks carry all of it but a share `e^{−Λ_log/8}`
(the *tail estimate*). Summing over the digits turns `sd` of coarse degrees into `sd` of degrees, and
`∏_jDim_k(A_{0,j})/Dim_k(a_{x_j}) ≥ (1 − C(1/Y + kE_0/a))·Q^{−(k−1)}` over the segments. The tail estimate and the statement that the bounded
pairs land in kept blocks are not proved here.

*NEW* (the count); *KNOWN* (branching `GL_k ↓ GL_{k−1}`, Pieri, Weyl's dimension formula). *Needs:* 4.14b; ReductiveGroups §10B
(characters of the induced modules are the Weyl characters);
ClassicalGroups §6.1 (branching).

### 4.14f′ Integral isotypic projectors on chains of letters

Let `𝒪 ⊃ W(𝔽_Q)`, `k ≥ 3`, a chain
of letters (vector or covector letters in `k − 1` variables, `GL_{k−1}` acting as in 4.14c′) and an integer `D ≥ 1` be given, and
consider the polynomials of degree at most `D` in each letter. For a set `S` of letters, a group `G ∈ {GL_{k−1}, GL_{k−2}}`
(`GL_{k−2}` acting on the last `k − 2` variables) acting diagonally on the letters of `S` and trivially on the others, and a dominant
weight `κ` of `G`, let `π^G_{κ,S}` be the projector onto the `κ`-isotypic part for this action. Then:
(i) `π^G_{κ,S}` commutes with the action of `G` on the letters of `S`, with every operator on the letters outside `S`, and with the
`π^G_{κ′,S}`; for initial segments `S ⊆ S′`, `π^{GL_{k−1}}_{κ,S}` commutes with `π^{GL_{k−1}}_{κ′,S′}` and with `π^{GL_{k−2}}_{μ,S′}`, and
`π^{GL_{k−2}}_{μ,S}` with `π^{GL_{k−2}}_{μ′,S′}`; `π^{GL_{k−2}}_{μ,S}` and `π^{GL_{k−1}}_{κ,S′}` need not commute when `S ⊊ S′` (Check);
(ii) these projectors are self-adjoint for the Fock pairing `Fock(P, P′) := Σ_mP_mP′_m·m!`;
(iii) `p^{(n(n−1)/2)·⌊log_p(d_S + n − 1)⌋}·π^G_{κ,S}` maps polynomials with coefficients in `𝒪` to polynomials with coefficients in `𝒪`,
where `n ∈ {k − 1, k − 2}` is the rank of `G` and `d_S := D·#S` bounds the total degree on the letters of `S`.

*Route.* (i) For `𝔤𝔩_n` distinct dominant weights have distinct central characters, so `π^G_{κ,S}` is a polynomial in the image of
the centre of the enveloping algebra acting on the letters of `S`; such an element commutes with the action of `𝔤𝔩_n` on the
letters of `S`, hence with that of `𝔤𝔩_{k−2} ⊂ 𝔤𝔩_{k−1}`, and with every operator on the other letters; the diagonal action on `S′ ⊇ S`
is the sum of the actions on `S` and on `S′ ∖ S`. (ii) The Fock pairing is invariant under the transposed action, and transposition
fixes the centre. (iii) On one multidegree let `W` be the representation and `M` its lattice of polynomials with coefficients in `𝒪`,
stable under the divided powers of the root operators and the binomials in the diagonal ones (`U_ℤ`); the weights of `W` have entries
in `[−d_cov, d_vec]`, the total degrees of the covector and of the vector letters of `S`, `d_cov + d_vec ≤ d_S`. Let `Λ ⊂ V_κ` be a
`U_ℤ`-stable lattice, `Λ^*` its dual, `(v_i)`, `(v_i^*)` dual bases, `π^{inv}` the projector of `V_κ^* ⊗ W` onto its invariants and `c` the
contraction of `V_κ ⊗ V_κ^*`. Then `T(x) := c(Σ_iv_i ⊗ π^{inv}(v_i^* ⊗ x))` equals `π^G_{κ,S}(x)/dim V_κ` (on the `κ`-isotypic part
`π^{inv}(f ⊗ u) = (f(u)/dim V_κ)·Σ_lv_l^* ⊗ v_l`, and `π^{inv}` kills `V_κ^* ⊗` the other isotypic parts). The weights of degree `0` of
`V_κ^* ⊗ W` have entries of absolute value `≤ d_S` (the weights of `V_κ` are weights of `W`), and `Λ^* ⊗ M` is `U_ℤ`-stable, so
IntegralWeylModulesOfGeneralLinearGroups §0.3a with `L = d_S` gives `p^{(n(n−1)/2)⌊log_p(d_S + n − 1)⌋}·π^{inv}(Λ^* ⊗ M) ⊂ Λ^* ⊗ M`; hence
the same power of `p` maps `π^G_{κ,S}(M)` into `(dim V_κ)·M ⊂ M`.

*Checks.* `k = 3`, two letters of degree one, `V = ⟨e_1, e_2⟩`: `π^{GL_2}_{(2,0),{1,2}} = (1 + (12))/2` and the projector of `GL_1` onto degree
one in the last variable of the first letter do not commute: on `e_1 ⊗ e_2` one composite is `0` and the other `½·e_2 ⊗ e_1`. The total
degree on the letters, not the degree in each letter, governs the denominator: for `p = 5` and `5^5` letters of degree one,
`π^{GL_2}_{(5^5,0)}` is the symmetriser, which sends a tensor with one `e_2` to the mean of its `5^5` placements (denominator `5^5`); the
exponent of (iii) is `⌊log_5(5^5 + 1)⌋ = 5`, exact, while an exponent `4·lg_5(D + k) = 4` in terms of the degree `D = 1` of each letter
fails. `k = 3`, one vector letter of degree `δ ≤ D`: `GL_2` acts irreducibly on the polynomials of degree `δ` in two variables, so the
only nonzero projector is the identity, and `GL_1` acts on the last variable by its degree: the projectors are those onto the monomials
of given degree in that variable, integral without denominator.

*NEW*. *Needs:* 4.14c′; IntegralWeylModulesOfGeneralLinearGroups §§0.1, 0.3a.

### 4.14g The bad share of a segment is small on average

Under (H_I) (windows enlarged by `≤ 2Λ_log·b′/k`),
for every segment with `t` far tops and every `0 ≤ μ ≤ b′/(k·p^{G′}·Y)`: the mean over `(a_{y_1}, …, a_{y_s}, a_{x^+})` in the window
`[a, a + a/(kY)]^{s+1}` of the bad share at `D := C·Y²s_max²k²·lg_p(8a + k) + 4|𝔗_v|k·log_pa` of the segment form on the segment
lattice (margin `μ`) is `≤ C(t + 1)s_max/Y`.

*Route.* (1) Reduce to one block and one level `(j, j_+)`: the isotypic projectors of `GL_{k−1}` and `GL_{k−2}` on initial segments
of the chain of letters are self-adjoint for the Fock pairing, commute when they are taken in the commuting family of 4.14f′ (i) (those of `GL_{k−1}` on the initial segments and
those of `GL_{k−2}` on segments containing them), and are integral after multiplication by `p^{((k−1)(k−2)/2)·⌊log_p(d + k − 2)⌋}`,
`d ≤ 8(s + 2)a` the total degree of the letters of a segment (4.14f′ (iii)); summed over the at most `2(s + 2)` projectors used, the loss
is at most `C·s·k²·lg_p(8a + k)` in the exponent (`s ≤ s_max ≤ a`). (2) On a level lattice the form is `Fock(φ·, ·)/∏deg!` with `φ` a
composite of one *tie operator* per contraction `E_i`, `E_+`. For the last tie: on a family orthogonal for the form without it
(diagonalisation of symmetric forms over `ℤ_p`, `p` odd), the Gram matrix as a function of the exponent `z = a_{x^+} − o^+` of `x^+_0`
is, after multiplication by `p^{O(sk·lg)}`, a matrix of polynomials of degree `≤ J := min(o^+, a⁻_{x^+}) − j_+` with integral coefficients
in the binomial basis and leading coefficient `1/J!` times the diagonal matrix; apply the corollary of 4.14a to the window of
`a_{x^+}`. (3) For the ties of the far tops, the same along the progressions of the coarse degrees `C_i` (difference `1`) as `a_{y_i}`
runs over one residue class modulo `P_i`. Not proved here: the reduction (1) beyond 4.14f′ (in particular, that the projectors it uses
can be taken in a commuting family of 4.14f′ (i)); in (2), that the Gram matrix depends polynomially on
`z` with that degree and leading coefficient (it depends on the definition of the tie operator; a direct computation of
`Fock(E_+^jx_0^z·, ·)/a_{x^+}!` gives ratios of factorials); the far ties (3); and the inputs from the integral representation theory
of `GL_n` (extremal projectors, restriction `GL_{r+1} ↓ GL_r`).

*NEW*. *Needs:* 4.14a, 4.14b, 4.14f, 4.14f′.

### 4.14h Theorem I at one edge

Under (H_I) of 4.14b there is a function `sh_v(a, a⁻) ≥ 0` of the
top weights of `v` only, with mean `≤ C|𝔗_v|s_max/Y` over the boxes, such that for every integer `dep ≥ dep°_v + R°_v` and every
edge `e` of type `1` there are `n_e ≥ (1 − sh_v(a, a⁻))·dim V_λ/#ℙ^{k−1}(𝔽_{Q₀})` vectors in `C(e)` and as many in `C′(e)` (with `c = c_v`)
whose Gram matrix `B_e` for `⟨·, ·⟩_h` satisfies `B_eM_e = z_e·1` with `M_e` integral and `v_p(z_e) ≤ D_p`.

*Route.* (1) *Flat weights:* a block for the weight with the non-top entries set to `0` gives one for the weight itself, at
the cost `2n′c″` in the depth; blocks for the flat weights `(A_s, 0, …, 0, −B_s)` come from the two-letter model
`𝕊(A, B) = ⊕_jV(A − j, B − j)`; a block for `𝕊` at an edge gives blocks for the shifted flat weights whose sizes add up, so a
bound for one `(A, B)` controls a weighted sum of the shares of the shifted weights, and averaging over the boxes gives the
mean bound (this reduction is not proved here). (2) By 4.14d every symbol of a kept family is, up to `w^cRe(e)`, `w^{ord(β)}`
times a vector of `C(e)` with depth `ord(β) ≤ dep°_v + R°_v`. (3) By 4.14e the Gram matrix for `⟨·, ·⟩_h` of these vectors and of the
corresponding vectors of the dual edge is, modulo `w^c`, block diagonal in `β` with blocks `κ_β·⊗_j`(segment form). (4) By 4.14f
the segment lattices at the margin `μ₀` of 4.14b have ranks whose product is `≥ (1 − κ_P)·dim 𝕊/#ℙ^{k−1}(𝔽_{Q₀})`. (5) By 4.14g the bad shares of the segment
forms have small mean; a good sublattice of each segment gives, after diagonalisation, the vectors of the statement with
`v_p(z_e)` at most the sum over the segments of the numbers `D` of 4.14g plus `8|𝔗_v|k·log_pa`, which is `≤ D_p`.

*NEW*. *Needs:* 4.12, 4.14b, 4.14d, 4.14e, 4.14f, 4.14g; ArithmeticStatisticsPartIV §3.2 (Gaussian binomial coefficients count
subspaces over `𝔽_q`).

### 4.15 Definition: the depth property

Setting of 4.12 at level `0` for one place `v`; `λ` the weight of the tuple, `h := h_{r_H}(λ)`,
and `H(L)`, `⟨·, ·⟩_h`, edges, `H^{½}(e)`, `H^{½}(e)^∨` as in 4.14b (with edges of type `r_H`).
For `dep, c* ∈ ℤ_{≥0}` (exponents of `√p`), `D ∈ ℕ` (an exponent of `p`) and `sh ∈ [0, 1]`,
`DepthBound(dep, D, sh, c*)` holds at `v` if for every lattice `L` there are edges `e_i = (L_i ⊂ L)` of type `r_H` and vectors
`F_i ∈ p^{−dep/2}H(L_i) ∩ ⋂_{e out of L_i}H^{½}(e)`, with `F_i ∈ p^{c*/2}H^{½}(e′)` for the edges `e′ ≠ e_i` out of `L_i`,
such that the functionals `G ↦ ⟨F_i, G⟩_h` on `B_L := p^{−dep/2}H(L)^∨ ∩ ⋂_{e into L}H^{½}(e)^∨` (the lattice of the arguments `G`,
which lie in the dual space) contain an identity block `p^D·1` of size `≥ (1 − sh)·dim V_λ`: there are `G_1, G_2, … ∈ B_L` with
`⟨F_i, G_l⟩_h = p^D·δ_{il}` for at least `(1 − sh)·dim V_λ` indices; `B_L^∨`, in the space of the `F_i`, is the target lattice of the
image argument below. In words: the image of `y_v` on the `∇`-valued forms of level `0` (`ℳ^∨_0`; `H(L)` is
the dual Weyl lattice) contains `p^{dep+D+1}` (here an exponent of `p`) times a part of corank `≤ sh·rank`. `DepthBound` at `v` does
not depend on the coefficient rings. `DepthBound(dep, D, sh, c*)` includes the inequality `4(D + 1) ≤ c*` (in the units of the
definition: `c*` an exponent of `√p`, `D` an exponent of `p`).

*Edge families.* Let `e = (L′ ⊂ L)` be an edge of type `r_H`. An *edge family* at `e` of size `n`, source depth `t_S`, target
depth `t_T`, Gram exponent `D` and separation `c*` consists of vectors `F_1, …, F_n ∈ p^{−t_S/2}H(L′) ∩ H^{½}(e)`, each lying in
`p^{c*/2}H^{½}(e′)` for every edge `e′ ≠ e` of type `r_H` out of `L′`, such that for every combination `F = Σ_ic_iF_i` with
integral coefficients, one of them a unit, there is a functional `G ∈ p^{−t_T/2}H(L)^∨ ∩ H^{½}(e)^∨`, lying in
`p^{c*/2}H^{½}(e′)^∨` for every edge `e′ ≠ e` of type `r_H` into `L`, with `⟨F, G⟩_h` integral and dividing `p^D`.

*Lemma (from edge families to the depth property at a lattice).* Let `L` be a lattice, `E` a finite set of edges of type `r_H`
into `L`, each carrying an edge family of size `n_e` with source and target depths at most `dep`, Gram exponent at most `D` and
separation `c*`, with `2(D + 1) ≤ c*` and `Σ_{e∈E}n_e ≥ (1 − sh)·dim V_λ`. Then the clause of `DepthBound(dep, D, sh, c*)` holds
at `L`, with the identity block `p^D·1` on all the `Σ_en_e` vectors of the families. Moreover the clause at one lattice implies
it at every lattice, and a lattice has at least `Q^{r_H(k−r_H)}` edges of type `r_H` into it (`Q = N𝔓_v`).

*Route.* The three lattices at a vertex satisfy `dual ⊂ base ⊂ ball`, `p^{dep/2}ball ⊂ base`, `p^{dep/2}base ⊂ dual`,
and `y_v` maps forms with values in `ball` to forms with values in `dual`; `H^{½}(e)` and `H^{½}(e)^∨` are dual for `⟨·, ·⟩_h`
(adapted bases).
*Lemma.* The vectors satisfy the membership conditions of `DepthBound`: depths are monotone, and
`p^{c*/2}H^{½}(e′) ⊂ H^{½}(e′)`; the same for the functionals, which lie in `B_L`. (1) *Integrality:* `⟨F, G⟩_h` is integral
for `F ∈ H^{½}(e)` and `G ∈ H^{½}(e)^∨` (duality of the two lattices, 4.14b), so the values `(⟨F_i, G⟩_h)_i`, `G ∈ B_L`, form a
lattice `S` of integral vectors indexed by all the vectors of the families. (2) *Cross terms:* let `c` be a coefficient vector
with a unit coordinate in the block of an edge `e₀`, and `G` the functional of the family of `e₀` for the combination of its own
vectors; for `e ≠ e₀` the vectors of `e` lie in `H^{½}(e)` and `G ∈ p^{c*/2}H^{½}(e)^∨`, so their pairings with `G` are divisible
by `p^{c*/2}`, hence by `p^{D+1}`. (3) An integer of the local ring dividing `p^D` plus a multiple of `p^{D+1}` still divides
`p^D`; so every such `c` pairs with a vector of `S` to a divisor of `p^D`. (4) A lattice `S` of integral vectors with this
property for every `c` having a unit coordinate contains `p^D` times the standard lattice (elementary divisors over the discrete
valuation ring): these are the functionals `G_l ∈ B_L` with `⟨F_i, G_l⟩_h = p^D·δ_{il}`. From one lattice to all: the general
linear group of the local field permutes the lattices transitively and the clause is equivariant; its proof is not given here,
nor is the count of the edges.

*NEW* (definitions). *Needs:* 4.12, 4.14b; ArithmeticLocallySymmetricSpaces ALS.F.7; Mathlib `Module.Basis.SmithNormalForm`.

### 4.15b Walk lemma

Let `y_v` (`v ∈ V`) be commuting endomorphisms of a module `X` over a discrete valuation ring with
uniformizer `π`, and `𝓛(σ)` submodules for `σ : V → {base, ball, dual}` such that, changing only the coordinate `v`:
`𝓛(dual) ⊂ 𝓛(base) ⊂ 𝓛(ball)`, `π^{a_v}𝓛(ball) ⊂ 𝓛(base)`, `π^{b_v}𝓛(base) ⊂ 𝓛(dual)`, `π^{c_v}𝓛(ball) ⊂ 𝓛(dual)` and
`y_v𝓛(ball) ⊂ 𝓛(dual)`; and for every `B ⊂ V` with `|B| = β + 1` a finite set `G(B) ⊂ 𝓛(λ_B)` (`λ_B` dual on `B`,
base elsewhere), `|G(B)| ≤ g(B)`, with `π^{c₀}𝓛(λ_B) ⊂ Σ_{v∈B}y_v𝓛(λ_B with ball at v) + span G(B)`. Then for
`M := 𝓛(base)`, `P := ∏_v(y_v^m, π^{S_v})M` and `S ≥ max_vS_v` there is `C ⊂ M` with `|C| ≤ Σ_{|B|=β+1}m^{β+1}g(B)` and
`π^E M ⊂ P + span C`, `E = Σ_v(a_v + b_v + (m−1)c_v + m·c₀) + βS`.

*Route.* One place, `β = 0`: from `π^{b}x ∈ 𝓛(dual)` the spanning hypothesis gives `π^{b+c₀}x = yz₁ + ζ₁`
with `z₁` in `ball`; iterating `m` times and returning ball → base costs `a + b + (m−1)c + mc₀` and `m·g` exceptional
vectors `y^iζ`. In general walk with counters `n_v ≤ m`: while at least `β + 1` places are active, let `B` be the
`β + 1` smallest active places, bring the piece to the label `λ_B`, apply the spanning hypothesis; a place pays
`b_v` once, `c_v` at most `m − 1` times, `a_v` once and `c₀` once per advance; when at most `β` places remain active the
remaining factor costs `βS`. An exceptional vector is determined by `B` and the counters in `B` (every place below
`max B` outside `B` is complete, every place above is untouched): `m^{β+1}` choices.

*NEW* (elementary; a statement about commuting endomorphisms of a module over a discrete valuation ring). *Needs:* Mathlib (modules over a discrete valuation ring).

### 4.15c Colength of the Hecke image

Setting of 4.15. Let `𝒱` be a set of places above `p` with Hecke types and `D_p ∈ ℕ`. Assume that `DepthBound(⌈dep_v⌉, D_p, sh_v, c*_p)` (4.15)
with `c*_p ≥ 8(D_p + 1)` holds for every `v ∈ 𝒱`, that the level-`0` stabilisers are trivial and the classes finite, that
`ℳ^∨_0` is the full lattice of `∇`-valued forms of the level and `ℳ^{int}_0` the full lattice of integral forms (ThetaChainsOnDefiniteUnitaryGroups §3.1), and that
`e ≥ 0` is an integer with `p^e·ℳ^∨_0 ⊂ ℳ^{int}_0` locally at `𝔭` (*sandwich exponent*); put `P := 𝒴·ℳ^{int}_0` (`𝒴` as in
4.14). Then for every `β ≥ 0` all but `rank·m^{β+1}𝖾_{β+1}((sh_v)_v)` elementary divisors of `P` in `ℳ^{int}_0` are `≤ τ + β·S`
(exponents of `p`), with the integer `τ := e + Σ_{v∈𝒱}m(⌈dep_v⌉ + D_p + 1)` and `S ≥ max_v 𝔵_v`; if `mΣ_vsh_v ≤ 1/2`, then, with
`e_R` the ramification index of the coefficient ring over `ℤ_p` (lengths are lengths of modules over it, so `length(R/pR) = e_R`),
`length(ℳ^{int}_0/(P ∩ p^{τ}ℳ^{int}_0)) ≤ e_R·rank·(τ + 2S·mΣ_vsh_v)`, `P ∩ p^{τ}ℳ^{int}_0 ∩ M′ ⊂ p^{τ}M′` and
`length(M′/(P ∩ p^τℳ^{int}_0 ∩ M′)) ≤ e_R·rank·(τ + 2S·mΣ_vsh_v)` for every saturated `M′ ⊂ ℳ^{int}_0`, and every map carrying
`P` into a lattice carries `P ∩ p^{τ}ℳ^{int}_0 ∩ M′` there.

*Route.* Spanning lemma: `DepthBound` gives a basis of
the dual lattice at `L` adapted to the span of the `p^{h}F_i` (all but a share `sh` of it in that span after
multiplication by `p^{D_p}`, a saturation argument); for a form supported on the source of an edge into `L`, `y_v` produces
the form at `L` plus terms at the other targets, divisible by `p^{c*/2} ⊂ p^{2(D_p+1)}` by the near-orthogonality clause;
in the tensor basis at a tuple, the vectors bad at all `v ∈ B` form `C_L`, `|C_L| ≤ ∏_{v∈B}sh_v·∏dim`; with trivial
stabilisers a form is a sum of forms supported on one orbit; so `p^{D_p}𝓛(λ_B) ⊂ J + span C + p^{D_p+1}𝓛(λ_B)` and
Nakayama gives `p^{D_p+1}𝓛(λ_B) ⊂ J + span C`, with one exponent `D_p` for all places of `B` and therefore independent of
`|B|`. Then 4.15b with `π = √p`, `𝓛(base) = ℳ^∨_0`, `a_v = b_v = ⌈dep_v⌉`, `c_v = 2⌈dep_v⌉`, `c₀ = 2(D_p + 1)`,
`g(B) = rank·∏_{v∈B}sh_v`, which gives the statement for `𝒴·ℳ^∨_0` in `ℳ^∨_0` with `τ − e` in place of `τ` (in units of `p`).
*Sandwich:* `𝒴·ℳ^{int}_0 ⊃ p^e𝒴·ℳ^∨_0`, and for submodules `A ⊂ A′ ⊂ M ⊂ M′` of full rank over a discrete valuation ring the
`i`-th largest elementary divisor of `A′` in `M` is at most that of `A` in `M′` (the partition of a submodule or a quotient of
a finite module is contained in that of the module); so the elementary divisors of `P` in `ℳ^{int}_0` are bounded by `e` plus
those of `𝒴·ℳ^∨_0` in `ℳ^∨_0`. Length: in a basis adapted to `P ⊂ M := ℳ^{int}_0`, with elementary divisors `p^{d_i}`,
`length(M/(P ∩ p^{τ}M)) = e_R·Σ_i max(d_i, τ) ≤ e_R·(rank·τ + S·Σ_β g_β)` with
`g_β ≤ rank(mΣsh)^{β+1}/(β+1)!`, and `Σ_βg_β ≤ rank(e^{mΣsh} − 1) ≤ 2rank·mΣsh`; saturation of `M′` (`M′/(M′ ∩ Q)` injects
into `M/Q`) gives the clauses on `M′`.

*NEW*. *Needs:* 4.14, 4.15, 4.15b; Mathlib `Module.Basis.SmithNormalForm`.

### 4.15d Good orbits and their probability

For `δ ∈ (0, 1)`, `h, x > 0` and integers `r ≥ 2`, `L₂ ≥ 1`, `M₀ ≥ 1` put
`u := ⌈1/δ⌉`, `G′ := (M₀ + 5)(6r + 1)u`, `N₁ := ⌈max(6e·G′δ, (h + 3)log₂x)⌉ + 1`. An orbit `ℤ/n′` with tops `𝔗` is *good*
(for `δ, h, x, r, L₂, M₀`) if: every window of `L₂` consecutive positions contains at most `r − 1` tops; cutting the orbit
into `⌊n′/((6r + 1)u)⌋` *tiles* of `6r + 1` consecutive *cells* of length `u` (the remaining fewer than `(6r + 1)u` positions
form an incomplete tile, which is never marked), and calling a tile *marked* if its odd cells contain no top and each of its
`3r` even cells contains exactly one top, at an even position, every tile has a marked tile among the next `M₀`; and
every window of length `G′` contains at most `N₁` tops. *Probability.* Let `0 < ω₀ ≤ 1` and `(M₀ + 1)(6r + 1)u ≤ n′`. If
the positions are tops independently, each with a probability in `[ω₀δ, δ]`, then conditionally on one position being a
top the orbit fails to be good with probability at most
`p_orb := n′·C(L₂, r−1)δ^{r−1} + n′(1 − (1−δ)^{u(3r+1)}(⌊u/2⌋ω₀δ(1−δ)^{u−1})^{3r})^{M₀} + n′·P(Bin(G′, δ) ≥ N₁ − 1)`.

*Route.* *Probability:* a union over the `n′`
windows or tiles of three events. (A) A window of `L₂` positions with at least `r − 1` tops besides the given one: at most
`C(L₂, r−1)δ^{r−1}` each (every probability is `≤ δ`). (B) For a tile, the next `M₀` tiles contain at most one tile meeting the given
top, so at least `M₀ − 1` of them avoid it; these are independent (disjoint positions, `(M₀ + 1)(6r + 1)u ≤ n′`), and a tile is marked with probability at least
`(1−δ)^{u(3r+1)}(⌊u/2⌋ω₀δ(1−δ)^{u−1})^{3r}` (no top in the `3r + 1` odd cells; in each even cell exactly one top, at one of its
`⌊u/2⌋` even positions, every probability lying in `[ω₀δ, δ]`). (C) At least `N₁ − 1` further tops among at most `G′`
positions: the count is dominated by `Bin(G′, δ)`. With `q` the probability that a tile is marked, (B) fails at a given tile with
probability at most `(1 − q)^{M₀−1} ≤ 2(1 − q)^{M₀}` (`q ≤ 1/2`), and the union is over at most `n′/((6r + 1)u) + 1 ≤ n′/2` tiles, which
absorbs the factor `2`: the bound is the second term of `p_orb`.

*NEW* (definition; elementary probability). *Needs:* Mathlib probability (independent Bernoulli variables, binomial tails).

### 4.15e Theorem II (small primes)

Let `13 ≤ p`, in the setting of 4.15, `r_H = r ≥ 2`, `h > 0`, `M₀ := ⌈10^{6r+1}(h + 3)log x⌉` (the statement is made for this value of
`M₀`, every `h > 0` allowed), the orbit of `v` good (4.15d) with `2L₁ ≤ L₂ < u` and `3G′ ≤ n′` for an integer `L₁ ≥ 1`, and `N₁² ≤ r|𝔗_v|`; top weights with
`a + c″ ≤ a_s ≤ 2a − c″`, `0 ≤ a⁻_s`, `a⁻_s + 2c″ ≤ c₀`, all other entries (at all positions) `≤ c″` in absolute value;
`r ≤ Y`; `Λ_log := C·N₁²·log a ≤ k`; `N₁ + 2r ≤ k − r`; `256k²|𝔗_v|Y² ≤ p^{L₁−1}`; `D ≥ C|𝔗_v|k²·log_p a`; `c* ≥ 8(D + 1)`;
`C·k³r²|𝔗_v|·p^{5G′}(c* + r|𝔗_v|c₀ + 2rn′c″)·Y ≤ a`. Then `DepthBound(dep, D, sh, c*)` holds with `sh := min(1, C|𝔗_v|r²k/Y)` for every
integer `dep ≥ C·r|𝔗_v|(Λ_log·a/(pk) + a·p^{−L₁} + c₀ + k·p^{G′}) + 2rn′c″`.

*Route.* *Model:* one letter per top (a vector letter of degree `λ_0 − λ_1` at an even top, a
covector letter at an odd top); frames of `r` consecutive even tops, one in each marked tile; variables split into `r` plane and
`k − r` normal ones; the good-orbit predicate supplies the frames and the three bounds (windows of `L₂` positions, gaps `≤ G′`, at
most `N₁` tops in a window of length `G′`). The proof has five layers; only their statements and the wiring between them are
described here, and no proof below them is given. (L1) *Cleaning:* the symbols of the basis of (P) below are realised by vectors
of the Hecke image, with source and target orders as `DepthBound` requires. (L2) *Plane Gram:* a Gram statement for the plane
coefficients, non-degenerate on a class of plane coefficients. (L1) and (L2) are not outside inputs: both are proved from the
statements of (L5) and consumed in (L4). (L3) *Edges:* the *edge step*: for every edge `e` of type `r` into the standard lattice
there is an edge family (4.15) of size `n ≥ (1 − C|𝔗_v|r²k/Y)(1 − kc₀/a)^{|𝔗_v|}·dim V_λ/Q^{r(k−r)}` (`Q = N𝔓_v`), source depth
`≤ t₀ + om`, target depth `≤ t₀ + |𝔗_v|c₀ + om`, Gram exponent `≤ C|𝔗_v|k²·log_p a` and separation `c*`, where
`t₀ := C|𝔗_v|(Λ_log·a/(pk) + a·p^{−L₁} + k·p^{G′})`
and `om := r|𝔗_v|c₀ + 2rn′c″`; the standard lattice has at least `Q^{r(k−r)}` edges of type `r` into it, so the families have at
least `(1 − C|𝔗_v|r²k/Y)·dim V_λ` vectors in all (the factor `(1 − kc₀/a)^{|𝔗_v|}` is absorbed in the constant under the size
hypotheses of the statement), and `DepthBound` follows from the lemma of 4.15, whose hypotheses `2(D + 1) ≤ c*` and
`4(D + 1) ≤ c*` hold because `c* ≥ 8(D + 1)`. (L4) The edge step from *realisable sources* (which needs (L1)) and a *cloud bound*
(primitive integrality of the sources and the remaining inputs). (L5) The remaining inputs from four statements. *(T) Tensor
operators:* for dominant `ν_t` with first row `≤ c` at the tops and `s, β ∈ ⊗_t∇(ν_t)` there are finitely many words of polarisation
operators, at most `c` at each top, and scalars `a_l` with `Fock(Θ(G)·s, Θ(H)·β) = Fock(Θ(Σ_la_l·word_l(G)), Θ(H))` for all flat `G, H`;
so the pairing on the weight `(λ_0 − λ_1) ⊗ (the rest, first row ≤ c₀)` is the pairing on the flat one-letter model after words of
length `≤ c₀` per top, and the depth pays `c₀` per top: the term `C·r|𝔗_v|c₀` of the threshold, without a minimum against `a/p^d`.
*(P) Plane count:* the span of the generators `∏_jφ_j(x_j)·`(monomial of digits), `x_j` in the space of products (polynomial in plane
variables)·(polynomial in normal variables) whose `GL_r`- and `GL_{k−r}`-types are interlaced with a margin and whose order degrees
are bounded, `φ_j` the substitution of `p^{dist}`-th powers, contains a direct summand, with a basis among the generators, of rank
`≥ (1 − C|𝔗_v|r²k/Y)·dim/#{r-planes of 𝔽_{N𝔓}^k}`, all of whose elements have order `≤ t₀`; it rests on an order-degree bound, on
Nakayama's lemma (a direct summand of rank the dimension of the span of the reductions modulo `w`), and on the rank of the
reductions: multiplication by a product of `r × r` minors in the plane variables of the `r` most recent even tops before each late
letter (nonzero modulo `w`) embeds the span of coarser generators, which has an explicit independent family per segment over the
good paths of `GL_k` (a tail estimate: with their fillings they carry all of the product of the symmetric dimensions but a
negligible share); the factor `Q^{−r(k−r)}` comes
from the `r` letters of a frame, which enter at the fine level through plane variables only. *(M) Membership:* for every datum of
chains tied to the frames and every joint isotypic projector, the plane coefficients of the projected level image lie in the class
on which (L2) is non-degenerate. *(Nd) Non-degeneracy:* every primitive vector in the span of the realised images pairs with a
realisable vector to a value of valuation `≤ D`.

*NEW*. *Needs:* 4.12, 4.14, 4.14b, 4.14h, 4.15, 4.15d; ArithmeticStatisticsPartIV §3.2.

### 4.15f Theorem I (medium primes)

In the setting of 4.15 let `r_H = 1`, assume (H_I) of 4.14b, `8D_p < c*` and `4(D_p + 1) ≤ c*` (both hold for
`c* ≥ 8(D_p + 1)`, the condition of (H_I)). Then there is `sh_v(a, a⁻) ≥ 0`, a function of
the top weights of `v` only, with mean `≤ C|𝔗_v|s_max/Y` over the boxes, such that `DepthBound(⌈dep⌉, D_p, sh_v(a, a⁻), c*)` holds
for every real `dep ≥ dep°_v + R°_v` (`dep°_v`, `R°_v` of 4.14b) and for every weight with these top weights satisfying (H_I) (the same
function for all of them: the non-top entries enter only through `c″`, 4.14h). So the least share admissible simultaneously for
all these weights is `≤ sh_v(a, a⁻)` pointwise, and has mean `≤ C|𝔗_v|s_max/Y` over the boxes. A good orbit in the sense of 4.15d with `r ≥ 2`, `3G′ ≤ n′` and `s_max := N₁` satisfies the orbit hypothesis of
(H_I) with the gap bound `G′` of 4.15d.

*Route.* From 4.14h by the per-edge argument: fix `L`; the edges into `L` are the `#ℙ^{k−1}(𝔽_{N𝔓})` hyperplanes of `L/pL`; for
`e ≠ e′` into `L`, `⟨C(e), C′(e′)⟩_h ⊂ ⟨H^{½}(e), w^cH^{½}(e)^∨⟩_h ⊂ w^c𝒪` because `H^{½}(e)` and `H^{½}(e)^∨` are dual for `⟨·, ·⟩_h`; so the Gram
matrix of all the vectors of 4.14h is `diag(B_e) + w^cR`, `R` integral, and multiplying by `diag(M_e·p^{D_p}/z_e)` gives
`p^{D_p}(1 + w^{c−2D_p}R′)`, invertible since `8D_p < c*`: this is `DepthBound` at `L` (its inequality `4(D_p + 1) ≤ c*` is a
hypothesis).
That the good orbit of 4.15d satisfies the orbit hypothesis of (H_I): a marked tile has even tops at distance `> u` from
every other top; consecutive even tops are at distance `≤ G′` with at most `N₁` tops between them, and there are at least
`3r` even tops (consequences of the good-orbit predicate, whose proofs are not given here).

*NEW*. *Needs:* 4.14b, 4.14h, 4.15, 4.15d.

### 4.15a Colengths of lattices exchanged by two operators

Let `R` be a discrete
valuation ring with uniformiser `ϖ`; lengths are lengths of `R`-modules.
(a) *Sandwich.* If `N` is free of rank `n` and `T ⊂ N` with `ϖ^eN ⊂ T`, then `length(N/T) ≤ e·n`.
(b) *Exchange.* Let `M` be an `R`-module, `S, B ⊂ M` submodules with `S` free of finite rank, `P ⊂ M` a submodule with
`ϖx ∈ P ⇒ x ∈ P`, `U, D : M → M` linear maps and `b, e ≥ 0` integers such that `ϖ^bS ⊂ B`, `U(B) ⊂ S`, `D(S) ⊂ B`,
`U(P) ⊂ P`, `D(P) ⊂ P` and `UD = ϖ^e` on `S ∩ P`. Then
`length((S ∩ P)/ϖ^bU(S ∩ P)) ≤ length(B/ϖ^bS) + e·rank S`.
(c) *Subadditivity.* For a submodule `A` and endomorphisms `g, h` with `g(A), h(A) ⊂ A`:
`length(A/gh(A)) ≤ length(A/g(A)) + length(A/h(A))`; hence `length(A/g₁⋯g_r(A)) ≤ Σ_i length(A/g_i(A))` and
`length(A/g^m(A)) ≤ m·length(A/g(A))`.

*Route.* (a) `N/T` is a quotient of `(R/ϖ^e)^n`. (b) Put `S′ := S ∩ P`, `B′ := B ∩ P`; the hypotheses hold for `(S′, B′)`, and
`ϖ^bU(S′) ⊂ U(B′) ⊂ S′`. `length(S′/U(B′)) ≤ e·rank S′` by (a), because `ϖ^es = U(Ds)` with `Ds ∈ B′`; `U` induces a surjection
`B′/ϖ^bS′ → U(B′)/ϖ^bU(S′)`; and `B′/ϖ^bS′ → B/ϖ^bS` is injective because `P` is saturated (`ϖ^bs ∈ P ⇒ s ∈ P`); finally
`rank S′ ≤ rank S`. (c) The sequence `A/h(A) → A/gh(A) → A/g(A) → 0` induced by `g` is exact; induction.

*Check.* `R = ℤ_p`, `M = ℚ_p`, `S = ℤ_p`, `P = M`, `B = p^{−1}ℤ_p`, `b = 1`, `U = p`, `D = 1`, `e = 1`: the left side is
`length(ℤ_p/p²ℤ_p) = 2`, the right side `length(p^{−1}ℤ_p/pℤ_p) + 1 = 3`.

*KNOWN* (elementary). *Needs:* Mathlib `Module.length`, `Module.Basis.SmithNormalForm`.

### 4.16 The gain sublattice

Let served data as in 4.9e be given: for each prime `p` (only finitely many, all `< X′`) a
set `𝒱_p` of linked places above `p`, empty unless `p` is of split type, with Hecke types and depth data such that
`DepthBound(⌈dep_v⌉, D_p, sh_v, c*_p)` with `c*_p ≥ 8(D_p + 1)` (4.15) holds at every `v ∈ 𝒱_p` and `𝔖(p) ≤ 1/2`, and a set `Drop`
containing no prime with `𝒱_p ≠ ∅`, with sandwich exponents `e_p` (4.9e (f)). Assume `InertFreeUpTo 4` (FrobeniusRestrictedRieszSums §0.3: every prime inert in `K` is `≥ 5`). For a
word `u` define `N_u ⊂ M_u` (ThetaChainsOnDefiniteUnitaryGroups §3.8) by local conditions: `x ∈ N_u` iff `x ∈ M_u` and
- at every `𝔭` above a prime `p` with `𝒱_p ≠ ∅`: `x ∈ (𝒴_𝔭·ℳ^{int}_0 ∩ p^{τ_N(𝔭)}ℳ^{int}_0) ⊗ 𝒪_𝔭`, where
  `𝒴_𝔭 := ∏_{v∈𝒱_p}(y_v^m, p^{𝔵_v})` is built with the primes `𝔓_v` of 4.12 for `𝔭`, and `ℳ^{int}_0 = M^{all}_u` is the
  lattice of ALL integral forms of the level (ThetaChainsOnDefiniteUnitaryGroups §3.1, ThetaChainsOnDefiniteUnitaryGroups §3.8: values in the Weyl lattices), not the lattice `ℳ^∨_0` of
  `∇`-valued forms on which the depth property is stated;
- at every `𝔭` above `T(u)`: `x ∈ N_T(𝔭) := T(u)^{m·Σ_{v∈𝒫(𝔭)}a⁻_{τ_v}}·(∏_{v∈𝒫(𝔭)}U_v)^m(M_u) ⊗ 𝒪_𝔭`, where for `𝔭` above
  `π_u` the set `𝒫(𝔭)` consists of the places `v` of `F` above `T(u)` whose place `τ_v ∈ Φ` is a top, `τ_v` being the unique
  element of `Φ = Gal(E/K)` carrying the prime of `E` above `π_u` at `v` (ThetaChainsOnDefiniteUnitaryGroups §2.9) to the prime `𝔭 ∩ E`, and `𝒫(𝔭) := ∅` for `𝔭`
  above `π̄_u`; `U_v` is the operator of ThetaChainsOnDefiniteUnitaryGroups §3.7 on forms of level `0`;
- no condition at the other places.
Then:
(i) locally at every `𝔭` not above `T(u)`, `N_u ⊂ p^{τ_N(𝔭)}M_u` and
`length_{𝒪_𝔭}(M_u/N_u)_𝔭 ≤ e_𝔭·d^{all}_u·(τ_N(𝔭) + 𝔦(𝔭))`;
(ii) for every finite place `𝔭` not above `T(u)`, the tuple `ξ_𝔭` used at `𝔭` (ThetaChainsOnDefiniteUnitaryGroups §2.5), every `φ ∈ N_u` and every row form `F`
(values in the dual Weyl lattices locally at `c_𝕃(𝔭)` suffice; for instance every `F ∈ ℳ^∨` of ThetaChainsOnDefiniteUnitaryGroups §3.1 for `X^h`):
`P̃_{ξ_𝔭}(φ, F) = 0` or `v_𝔭(P̃_{ξ_𝔭}(φ, F)) ≥ ⌊e_𝔭·𝔊_u(𝔭)⌋`, under the hypotheses of 4.10 and of 4.10a (with the datum
prime `ϖ_g` of 4.9f (e)). (At the places above `T(u)` the corresponding statements are 4.16b and 4.16c.)

*Route.* (i) 4.15c with the sandwich exponent `e_p` applied with `M′ = M_u` (saturated in `ℳ^{int}_0`) and `rank = d^{all}_u`.
(ii) The period is linear in the column (ThetaChainsOnDefiniteUnitaryGroups §3.9), so the local condition on `N_u` at `𝔭` controls the period at `𝔭` (4.11(ii);
`Q(ξ_𝔭)` lies above no residue characteristic of `𝔭`, ThetaChainsOnDefiniteUnitaryGroups §2.5): it suffices that `col_{ξ_𝔭}(φ) ∈ p^{s}ℳ^{int}_m` locally at `𝔭`
with `s = Σ_j(g^D_j + F_j − E_{u,j})(𝔭) + v_p(D_Γ)`. At the places above a prime with `𝒱_p ≠ ∅`, 4.14(b) gives it with `g_j`
(and `N_u ⊂ 𝒴_𝔭·ℳ^{int}_0`); `g^D_j ≤ g_j` because `g_j ≥ 0`. At the places above the other primes `≤ X″` inert in `K` (including
those in `Drop`; they are `≥ 5`), 4.11(iii) with `g⁰_j ≥ 0 = g^D_j` there or `g⁰_j = g_j` (4.10(ii′) at the primes of odd
conjugate type). At `d`, 4.10(iii) with 4.11(i). At the type primes, 4.10a with 4.11(i). At the remaining places (split in
`K`, or inert above `X″`), 4.10(iv) and 4.11(i): there `𝔊_u = −m·v_p(D_Γ)`. The loss `v_p(D_Γ)` of the class-set pairing
(ThetaChainsOnDefiniteUnitaryGroups §3.10) is charged in the ledger at each step (`E_{u,j} ∋ v_p(D_Γ)`), so `𝔊_u` is net of it.

*NEW*. *Needs:* FrobeniusRestrictedRieszSums §0.3, ThetaChainsOnDefiniteUnitaryGroups §2.5, ThetaChainsOnDefiniteUnitaryGroups §3.7, ThetaChainsOnDefiniteUnitaryGroups §3.8, ThetaChainsOnDefiniteUnitaryGroups §3.9, ThetaChainsOnDefiniteUnitaryGroups §3.10, 4.9e, 4.9f, 4.10, 4.10a, 4.11, 4.12, 4.14, 4.15, 4.15c.

### 4.16a The kernels at the level prime

Let `T = T(u) = π_uπ̄_u` (ThetaChainsOnDefiniteUnitaryGroups §2.8), split completely in
`E`, with `T > 2(Λ_j(τ)_a − Λ_j(τ)_b + N_j)` for all `0 ≤ j ≤ m`, `τ` and positions `a, b`. For a pair `𝔡 = (Λ, fn)` at a
place `v | T` (ThetaChainsOnDefiniteUnitaryGroups §2.9b; the finite datum of the step at `T`, a function of the pairs, is the one defined in ThetaChainsOnDefiniteUnitaryGroups §3.2 (A2) on the pairs of ThetaChainsOnDefiniteUnitaryGroups §2.9b) put `L_𝔡 := ker(fn)` and `L^♯_𝔡` its dual lattice (so `L_𝔡 ⊂ Λ ⊂ L^♯_𝔡`; the class lattice of ThetaChainsOnDefiniteUnitaryGroups §3.1 and its
dual), and read the Weyl lattices `Δ(Λ_j; ·)` (ThetaChainsOnDefiniteUnitaryGroups §3.1) in the coordinates of bases of these lattices; under the hypothesis on
`T`, `Δ(Λ_j; ·) ⊗ 𝒪_𝔭 = ∇(Λ_j; ·) ⊗ 𝒪_𝔭` at every `𝔭 | T`. For the kernels `k_j(𝔡, 𝔡′)` of step `j` between pairs of levels
`j − 1` and `j`, of every tuple unramified above `T`:
(1) `k_j(⟨a⟩_v𝔡, ⟨a⟩_v𝔡′) = k_j(𝔡, 𝔡′)` for `a ∈ 𝔽_v^×` (the diamond operators of ThetaChainsOnDefiniteUnitaryGroups §2.9b, ThetaChainsOnDefiniteUnitaryGroups §3.7);
(2) *move law:* on all forms on pairs, `U_v∘K_j = T^{(t+1)/2}·K_j∘U_v` (`U_v` of ThetaChainsOnDefiniteUnitaryGroups §3.7); the constant is the rational number
`T^{(t+1)/2}`, of valuation `e_𝔭(t + 1)/2` at every `𝔭 | T`, above `π_u` and above `π̄_u` alike; and on new forms
`FF_v∘K_j = c_{j,v}·K_j∘FF_v` with `c_{j,v} ∈ 𝕃^×` (`FF_v` of ThetaChainsOnDefiniteUnitaryGroups §3.7);
(3) at `𝔭` above `π̄_u`: `k_j(𝔡, 𝔡′)` maps `Δ(Λ_{j−1}; L^♯_𝔡) ⊗ 𝒪_𝔭` into `T^{f(t+1)/2}·Δ(Λ_j; L^♯_{𝔡′}) ⊗ 𝒪_𝔭`;
(4) at `𝔭` above `π_u`: `T^{f·N_{j−1} + Σ_{τ∈Φ}s_div,j(τ)}·k_j(𝔡, 𝔡′)` maps `Δ(Λ_{j−1}; L^♯_𝔡) ⊗ 𝒪_𝔭` into
`Δ(Λ_j; L_{𝔡′}) ⊗ 𝒪_𝔭`, with `s_div,j(τ) = w_j(τ) − N_{j−1}/2` of ThetaChainsOnDefiniteUnitaryGroups §3.2.
The places above `π_u` are those at which the primes of `E` above `π_u`, which carry the functionals of the pairs, are seen
through `Φ`.

*Route.* (1) is immediate from the form of the finite datum at `T` (ThetaChainsOnDefiniteUnitaryGroups §3.2 (A2) and Lemma (i)). (2) Two pairs of unimodular lattices agreeing away
from `T` have, for the same finite datum, kernels that differ by `∏_P w_P^{e′_P − e_P}·T^{(N_j/2)e_P − (N_{j−1}/2)e′_P}` (`e_P`, `e′_P`
the changes of the `P`-adic order of the determinant, `w_P` given by the Hecke character); for one move on each side
(`e_P = e′_P = 1`) the factors `w_P` cancel and the scalar is `T^{(N_j − N_{j−1})/2} = T^{(t+1)/2}`; and the indicator functions of the
finite data agree after summation over the pairs above and below, by an explicit bijection of pairs. The relation with `FF_v`
comes from the same kernel identity for the moves that define the transpose `D_v` of `U_v`, with `FF_v = D_v∘Gs_v` on new forms
and the commutation of `K_j` with the diamond operators (ThetaChainsOnDefiniteUnitaryGroups §3.7). Not given here: the kernel identity for two pairs of lattices (it
rests on the isogeny law of the normalised theta family), hence (2), and the relation with `FF_v` with the value of `c_{j,v}`. (3), (4): at a prime split in `K` the jets of the
kernel of level `T` are the moments of a bounded measure carried by the lattice points (at `𝔭` above `π̄_u`), resp. by the
dual support with the index `T^{−fN_{j−1}}` (at `𝔭` above `π_u`) (KNOWN in kind: `p`-adic measures of CM theta functions
at split primes, Katz; the moment theorem reduces to a statement for one curve, whose proof is not given here); that a
table of moments of integral points is an integral map of the `∇`-lattices up to the determinants of the bases used,
whose valuations give the displayed exponents, is likewise not proved here; and `Δ = ∇` locally at `T` because the
weights lie below the upper wall of the lowest alcove, `Λ_j(τ)_0 − Λ_j(τ)_{N_j−1} + N_j − 1 < T` (implied by the hypothesis on `T`, which is stronger than needed): for such a weight the Weyl and dual Weyl lattices agree over every discrete valuation ring of residue characteristic `T`, and the induced module
is simple over a field of characteristic `T` (IntegralWeylModulesOfGeneralLinearGroups §0.2; KNOWN, Jantzen II.5–II.6).

*NEW*. *Needs:* ThetaChainsOnDefiniteUnitaryGroups §2.3, ThetaChainsOnDefiniteUnitaryGroups §2.8, ThetaChainsOnDefiniteUnitaryGroups §2.9, ThetaChainsOnDefiniteUnitaryGroups §2.9b, ThetaChainsOnDefiniteUnitaryGroups §3.1, ThetaChainsOnDefiniteUnitaryGroups §3.2, ThetaChainsOnDefiniteUnitaryGroups §3.3, ThetaChainsOnDefiniteUnitaryGroups §3.7; IntegralWeylModulesOfGeneralLinearGroups §0.2.

### 4.16b The column bound at the level prime

With 4.16a, `T(u) > 2f·N_m + 1` and `a⁻_τ ≥ 0` at every top `τ`: for every tuple `ξ`
unramified above `T(u)` and every `𝔭 | T(u)`, `T(u)^{m·E_{u,1}(𝔭)}·col_ξ(N_T(𝔭)) ⊂ ℳ^{int}_m` locally at `𝔭` (`E_{u,j}(𝔭)` of
4.9f (e): `𝔢_u` above `π_u`, `0` above `π̄_u`), with `N_T(𝔭)` of 4.16. Consequently, for `φ ∈ N_u`, the tuple `ξ_𝔭` and every
row form `F`: `P̃_{ξ_𝔭}(φ, F) = 0` or `v_𝔭(P̃_{ξ_𝔭}(φ, F)) ≥ e_𝔭·𝔊_u(𝔭) = −m·e_𝔭·E_{u,1}(𝔭)` (no gain, bulk or colength
entry at `T(u)`; the stabiliser orders are prime to `T(u)`).

*Route.* (2) of 4.16a moves one product `∏_{v∈𝒫(𝔭)}U_v` past each step, at the cost `T^{(t+1)/2}` per place and step; the
stabilisers are prime to `T` (`T > 2fN_m + 1`); after the moves, each step with its product of `U_v` maps value lattices
into value lattices at `𝔭` up to `T^{2Σ_τ𝔴_u(τ) + fN_m}` above `π_u` (by (3), (4) and the normalisation `T^{a⁻_{τ_v}}`, an
endomorphism of the integral forms because `a⁻_τ ≥ 0`) and integrally above `π̄_u`; the count
`m(2Σ_τ𝔴_u(τ) + fN_m) + ((t+1)/2)·|Φ_top|·m(m+1)/2 = m·𝔢_u` gives the exponent (`|𝒫(𝔭)| = |Φ_top|` at a place above `π_u`).
The period bound follows by 4.11(ii): ThetaChainsOnDefiniteUnitaryGroups §3.9(b) and ThetaChainsOnDefiniteUnitaryGroups §3.10 hold at the places above `T(u)` (the restriction is written in the
coordinates of the dual class lattice of `d̃` and has no scalar there; the factor `T(u)^{−n_τ}` of ThetaChainsOnDefiniteUnitaryGroups §3.9(c) is archimedean).
Only the column bound (this target), the colength of `N_u` (4.16c) and the archimedean factor of ThetaChainsOnDefiniteUnitaryGroups §3.9(c) involve the level
prime, on three different maps (the column, the inclusion `N_u ⊂ M_u`, the restriction): nothing is counted twice.

*NEW*. *Needs:* ThetaChainsOnDefiniteUnitaryGroups §3.6, ThetaChainsOnDefiniteUnitaryGroups §3.7, ThetaChainsOnDefiniteUnitaryGroups §3.9, ThetaChainsOnDefiniteUnitaryGroups §3.10, 4.9f, 4.11, 4.16, 4.16a.

### 4.16c The colength at the level prime

Let `T = T(u)` be as in 4.16a, with `a⁻_τ ≥ 0` at every top. Let `𝔭 | T(u)` lie above `π_u`, `S` the
lattice `ℳ^{int}_0 ⊗ 𝒪_𝔭` of integral forms of level `0` (values in `Δ(Λ_0; L^♯_𝔡)`), and for `v ∈ 𝒫(𝔭)` (4.16) with top `τ_v` let
`B_v ⊂ ℳ_0 ⊗ 𝕃_𝔭` be the lattice of forms whose value at the embedding `τ_v` lies in the Weyl lattice read in the coordinates
of a basis of `L_𝔡` at the prime of `E` above `π_u` at `v`, the determinant twist included (at the other embeddings as for `S`).
(a) `U_v(B_v) ⊂ S`, `D_v(S) ⊂ B_v` (`D_v` the transpose of `U_v`; on new forms `D_vU_v = U_vD_v = T(u)^{N_0−1}`, ThetaChainsOnDefiniteUnitaryGroups §3.7),
`T(u)^{a⁻_{τ_v}}S ⊂ B_v`, and `length(B_v/T(u)^{a⁻_{τ_v}}S) = e_𝔭·d^{all}_u·(|Λ_0(τ_v)| + k·a⁻_{τ_v})/k` (`|λ| = Σ_iλ_i`, `k = N_0`).
(b) `N_u ⊂ M_u` locally at `𝔭`, and
`length_𝔭(M_u/N_u)_𝔭 ≤ e_𝔭·m·d^{all}_u·Σ_{v∈𝒫(𝔭)}((|Λ_0(τ_v)| + k·a⁻_{τ_v})/k + k − 1)`; at the places above `π̄_u`, `N_u = M_u`.
(c) Under the sizes of ThetaChainsOnDefiniteUnitaryGroups §2.1 and ThetaChainsOnDefiniteUnitaryGroups §2.3 (at a top `a_τ ≤ 2a` and `a⁻_τ ≤ 2b′`, every other entry of `Λ_0(τ)` of absolute value
`≤ Sc + k`, and `Sc + k ≤ b′`), so that each summand of (b) is `≤ C(a/k + b′)`:
`Σ_{𝔭|T(u)} sz_𝔭(length_𝔭(M_u/N_u)_𝔭/e_𝔭)/d_u ≤ C·|Φ_top|·m·(a/k + b′)·log T(u)`, using `d^{all}_u/d_u ≤ 2` (ThetaChainsOnDefiniteUnitaryGroups §3.8(b)).

*Route.* (a) The two integrality statements: for a pair `𝔡₁` above `𝔡` at the prime of
`v`, the kernel lattice `L_{𝔡₁}` is `L^♯_𝔡` there, so a value integral for `L_{𝔡₁}` is one for `L^♯_𝔡` (their proof in coordinates
is not given here). The length: in coordinates of bases of `L^♯_𝔡` and of `L_𝔡` at the prime of `v`, `S` is a product over
the classes of the Weyl lattice `Ω_W := ⊗_τΔ(ν(τ))` of the polynomial parts `ν := Λ_0 + a⁻·1` and `B_v` is the product of
`T^{a⁻}g_c^{−1}Ω_W`, `g_c` a change of basis with `det g_c = T·unit` acting at `τ_v` only; reduced to `diag(1, …, 1, T)`, it
multiplies a weight vector of weight `μ` by `T^{μ_k}`, and the mean of `μ_k` over a weight basis of the Weyl lattice is
`|ν|/k` (the weight multiplicities are invariant under permutations of the coordinates), with `d^{all}_u = #classes·dim`
(trivial stabilisers, ThetaChainsOnDefiniteUnitaryGroups §3.8(a)). (b) `N_T(𝔭) = (∏_{v∈𝒫(𝔭)}T^{a⁻_{τ_v}}U_v)^m(M_u)`; each `g_v := T^{a⁻_{τ_v}}U_v` maps `M_u = S ∩ new`
into itself (`T^{a⁻}S ⊂ B_v`, `U_v(B_v) ⊂ S`, `U_v` preserves new forms); 4.15a(b) with `ϖ^e = T^{k−1}` gives
`length(M_u/g_vM_u) ≤ length(B_v/T^{a⁻}S) + e_𝔭(k − 1)d^{all}_u`, and 4.15a(c) adds over `v` and over the `m` powers. (c) Sum with
the weights `2ϱ(𝔭)` (`Σ_{𝔭|π_u}ϱ(𝔭)e_𝔭 = ½log T(u)`, and `|𝒫(𝔭)| = |Φ_top|`). Not proved here: the integrality of `U_v`, `D_v`
between `S` and `B_v`, and the description of `B_v` in coordinates (surjectivity of the coordinate map for trivial
stabilisers).

*NEW* (the count), *KNOWN* in kind (symmetry of weight multiplicities). *Needs:* ThetaChainsOnDefiniteUnitaryGroups §2.1, ThetaChainsOnDefiniteUnitaryGroups §2.3, ThetaChainsOnDefiniteUnitaryGroups §3.7, ThetaChainsOnDefiniteUnitaryGroups §3.8, 4.15a, 4.16, 4.16a.

### 4.17 Definitions: the data of the gain inequality

Fix, before `ε`, constants `A_w` (the constant of the top window of ThetaChainsOnDefiniteUnitaryGroups §2.3), `c_io ≥ 1`,
`C_ρ > 0` and the minimum `ω₀ ∈ (0, 1]` of the coset profile of FrobeniusRestrictedRieszSums §0.7, and assume `InertFreeUpTo B_s` (FrobeniusRestrictedRieszSums §0.3: every prime inert
in `K` exceeds `B_s`) with `B_s ≥ max(12, x^{c_s})` for some `c_s > 0` (which may depend on `ε` and on constants chosen with
it): the small-prime theorem 4.15e is stated for `p ≥ 13`, and `L₁(p) ≤ C/c_s` for every prime inert in `K`, bounded
independently of `x`; fix `L_b ≥ 1` with `L₂ ≤ L_b` (`L₂` below; such an `L_b` exists by that bound). Put `h_A := 2 + 8ε` and assume
`x^{h_A} ≤ |A| ≤ 2x^{h_A}` (`SizeA` of ThetaChainsOnDefiniteUnitaryGroups §2.1 with `A_n = h_A`), so that every Frobenius orbit has length `≤ 2x^{h_A}` and `δ_top|A| ≥ 16o²/ω₀²` (the
hypothesis of FrobeniusRestrictedRieszSums §0.7) for `x ≥ x₀`; the thresholds `x₀` below depend only on `ε`, `c_s`, `ω₀`, `L_b` and the constants fixed before `ε`. At the scale
`x`, put `δ_top := x^{−ε/8}` (the selection density of FrobeniusRestrictedRieszSums §0.7), `r_G := ⌈8(h_A + 2)/ε⌉ + 1`, `u := ⌈1/δ_top⌉`, the tile parameter
`h_II := max(1, (5ω₀)^{−3r_G})·(h_A + 3) − 3` (`= h_A` when `ω₀ ≥ 1/5`, in particular for a uniform selection),
`M₀ := ⌈10^{6r_G+1}(h_II + 3)log x⌉`, `G′ := (M₀ + 5)(6r_G + 1)u`, `N₁ := ⌈max(6e·G′δ_top, (h_II + 3)log₂x)⌉ + 1`, `s_max := N₁`,
`Λ_log := C·N₁²·log a`, `Y_I := x^{A_w/2}`, `Y_II := x^{A_w}`, `p₀ := k²Y_II`, `L₁(p) := ⌈4·log_p(k·Y_II)⌉`,
`L₂ := 2·max{L₁(p) : p < p₀ inert in K}` (`L₂ := 2` if there is no such prime; the maximum over all primes would include `p = 2`,
where `L₁(2) ≥ 4log_2(kY_II)` grows with `x`), `ℓ(p) := ⌈log_p(k²Y_II³)⌉ + 1`, the band half-width `ρ_B := C_ρ(f·δ_top·x^ε + log x)·Λ_log/k`, and for
each prime `p` and orbit length `n′` the integer `D_p := ⌈C·40n′δ_top·Y_I²(N₁⁵ + k³)·log_p a⌉` for `p ≥ p₀` and
`D_p := ⌈C·40n′δ_top·k²·log_p a⌉` for `p < p₀` (a good orbit has at most `40n′δ_top` tops), `c*_p := 8(D_p + 1)`,
`c″ := 4Sc`, `c₀ := 2b′ + 8Sc`, the bottom box width `Δ_b := (C_ρ/8)·f·δ_top·x^ε·Λ_log·b′/k`, and the sandwich exponents
`e_p := max_u Σ_{τ∈Φ}(k(k−1)/2)·⌊log_p(Λ_0(τ)_0 − Λ_0(τ)_{k−1} + k − 1)⌋` (the maximum over the words; sandwich exponents by 4.9e (f);
a number fixed by the weights, not in general the least sandwich exponent, and any sandwich exponent would serve in 4.16). Then, under `Size(x, ε)` (ThetaChainsOnDefiniteUnitaryGroups §2.1) and for `x ≥ x₀(ε)`, `Δ_b ≤ b′/2`, `Δ_b ≥ Y_b|𝔗_v|Λ_log·b′/k` at every good place (`|𝔗_v| ≤ 80fδ_top`), and
`2δ_I ≤ ρ_B` (`δ_I` of 4.14b: `4Δ_b/b′` is half the first term of `ρ_B`, and `2C_Hs_maxΛ_log/k` is at most the other half since `f ≥ x²`),
so the band excluded from the candidates contains the band of (H_I) (`X′ = a/b′`). A linked prime `p < X′` of split
type, inert in `K` and in `ℚ(√−q)`, is a *candidate* if its Frobenius orbits have length `n′_p ≥ x^{ε/4}` and, for `p ≥ p₀`,
no power `p^e`, `e ≥ 1`, lies in `[(1 − ρ_B)X′, (1 + ρ_B)X′]`; its Hecke type is `r_H = 1` if `p ≥ p₀` and `r_G` otherwise. A
linked place `v` above a candidate is *good* if its orbit is good in the sense of 4.15d for `(δ_top, h_II, x, r_G, L₂, M₀)`
(both ranges of `p`). For a
good place put `dep_v := dep°_v + R°_v` (4.15f, with `Y = Y_I`) if `p ≥ p₀`, and `dep_v :=` the threshold of 4.15e (with
`Y = Y_II`, `L₁ = L₁(p)`, `r = r_G`, these `c″`, `c₀`, and the scale `a′ := a − c″` in place of `a`: the top window `[a, a(1 + θ_a)]` lies in
`[a′ + c″, 2a′ − c″]`, and the other inequalities of 4.15e hold at the scale `a′ ≥ a/2` for `x ≥ x₀`, the threshold at `a′` being at most
that at `a`) and `dep°_v := 0` if `p < p₀`; let `sh_v` be the least share such that `DepthBound(⌈dep_v⌉, D_p, sh_v, c*_p)` holds at `v` for
the weights of all the words at once (the words share the top entries, ThetaChainsOnDefiniteUnitaryGroups §2.3; `DepthBound` does not depend on the coefficient rings,
4.15), so that `sh_v`, and with it `𝔖(p)`, `𝒱_p` and `Drop` below, do not depend on the word. Put
`𝔖(p) := m·Σ_{v good}sh_v`, and `𝒱_p := {good places}` if `p` is a candidate and `𝔖(p) ≤ x^{−ε}`, `𝒱_p := ∅` otherwise
(so `𝔖(p)` of 4.9e (f) agrees with this one when `𝒱_p ≠ ∅`). `Drop` := the linked primes `p < (1 + ρ_B)X′` that are not
candidates (among them the primes of conjugate type below `(1 + ρ_B)X′`: every orbit that contains a top is linked there), the
candidates with `𝔖(p) > x^{−ε}`, every prime `p ≤ X″` of odd conjugate type, and the primes `> X″` inert in `K`; a
candidate without a good place is not in `Drop` (`𝒱_p = ∅`, and it keeps its operator-free gain). These
data satisfy the hypotheses of 4.16; at every prime of `Drop`, `𝒱_p = ∅`, so `g^D_j = 0` and `τ_N = 𝔦 = 0` there. Put
`V_{j,τ}(p) := Σ_{i odd}(a_τ/p^i − w_j(par_τ(Frob_p^i)))₊`, `ℒ_f(p) := C·fN_m²·lg_p(2a) + C·f·lg_p(2a)²`, and the loss per
top and step
`ℒ(p) := C(Sc + k + ϑ)·lg_p(2a) + [p < p₀]·C·r_G·b′·log x + [p₀ ≤ p < X′]·(C(b′/x + ϑ + Sc + (w″ + t)·log x/δ_top) + b^{1/2}) + [p < X′]·C·log x·(Λ_log·a/(pk) + a·p^{−ℓ(p)}[p < p₀] + (a/p²)[p ≥ p₀])`, the bracketed terms only at primes inert in `K` and
in `ℚ(√−q)`. Let `I` be the set of the primes `p < X′` of split type, inert in `K` and in `ℚ(√−q)`, with orbits of length
`n′_p ≥ x^{ε/4}`: a set that depends neither on the selection of the tops nor on the weights and contains every candidate. Put
`Z_bad := Σ_{p∈I}(log p/p)·#{τ ∈ Φ_top : the orbit of τ at p is not good}`; it depends on the selection of the tops only.

*Checks.* With `A_w = 26` (`Y_I = x^{13}`, `Y_II = x^{26}`, `p₀ = k²x^{26}`, `ℓ(p) = ⌈log_p(k²x^{78})⌉ + 1`) and `ω₀ = 3/4` (so `h_II = h_A`)
the data are those of the construction. At a prime `p` of odd conjugate type with `(1 + ρ_B)X′ ≤ p ≤ X″`, `par_τ(Frob_p) = hτ ≠ τ`
is in general a thin place, so `V_{j,τ}(p) ≥ a_τ/p − w_j(hτ)` is about `b′/2` at `p = 2X′`: such primes are in `Drop` up to `X″`.
A check of the cited sandwich exponent, outside the ranks of the chain (which have `k ≥ 5`): for `GL_2` and `λ = (n, 0)` the least exponent is
`max_iv_p(C(n, i)) = ⌊log_p(n + 1)⌋ − v_p(n + 1)`: the bound `⌊log_p(n + 1)⌋` of IntegralWeylModulesOfGeneralLinearGroups §0.3 (b) is
attained exactly when `p ∤ n + 1`, and the sharper form with `dim V_λ = n + 1` is exact.

*NEW* (definitions). *Needs:* FrobeniusRestrictedRieszSums §0.3, FrobeniusRestrictedRieszSums §0.4, FrobeniusRestrictedRieszSums §0.6, FrobeniusRestrictedRieszSums §0.7, ThetaChainsOnDefiniteUnitaryGroups §2.1, ThetaChainsOnDefiniteUnitaryGroups §2.3, 4.9, 4.9e, 4.14b, 4.15, 4.15d, 4.15e, 4.15f, 4.16.

### 4.17a The gain inequality

Data of 4.17.
(i) *Ramp identity and matching lemma.* `Σ_{e odd}(x/p^e − c_e)₊ = γ_LTx − Σ_{e odd}min(x/p^e, c_e)`; and for `n′` even,
`Σ_{y∈𝔗_v odd}min(W_y, a_{y⁻}/p^{d(y)}) ≤ Σ_{x∈𝔗_v even}Σ_{e odd}min(a_x/p^e, W_{x+e})` for any `W ≥ 0`.
(ii) *The inequality.* For every `𝔭` above a prime `p ≤ X″` inert in `K` with `p ∉ Drop`:
`0 ≤ g_j(𝔭) ≤ 4|Φ_top|a/p` and
`Σ_{j=1}^mΣ_{τ∈Φ_top(𝔭)}(V_{j,τ}(p) − ℒ(p)) − m·ℒ_f(p) ≤ Σ_{j=1}^m g_j(𝔭) − τ_N(𝔭)`,
`Φ_top(𝔭)` := all top places if `p ≥ X′`, and otherwise the top places whose orbit at `p` is unlinked or served.

*Route.* (i) Termwise `(x − c)₊ + min(x, c) = x` and `Σ_{e odd}x/p^e = γ_LTx`. Matching lemma: `y ↦ (y⁻, d(y))` is injective
and `d(y)` is odd, so each left term is a distinct right term with `x + e = y`, and all terms are `≥ 0`. (ii)
`g_j(𝔭) ≤ γ_LT(p)Σ_sα_s ≤ 4|Φ_top|a/p` since `r⁰, r^H ≤ γ_LTΣα` and `γ_LT(p) ≤ 2/p`. Replacing `(a_τ, w_j)` by the ledger data `(α̂_s, ĉ_j)` costs
`≤ C·c_G·lg_p(2a) = 4C·Sc·lg_p(2a)` per top. If the orbit of a top is unlinked, `r⁰_j(v)` is the whole ramp sum. If `p ≥ X′` is linked,
the omitted terms `(a_s/p^e − w_j(top))₊` vanish because `w_j ≥ a⁻ ≥ b′` at a top and `a_s/p^e ≤ b′` outside the band
excluded by `Drop` (`a_s ≤ a(1 + θ_a)`). At a prime of conjugate type `p ≥ (1 + ρ_B)X′` every `V_{j,τ}(p)` is `0`
(`par_τ(Frob_p^i) = τ` for odd `i`, and `a_τ/p ≤ b′ ≤ w_j(τ)`); at a prime of odd conjugate type `par_τ(Frob_p) = hτ` is in general a
thin place, which is why these primes are in `Drop` up to `X″`. At a served place, by (i) a top `s ∈ 𝔗_v` contributes
`V_{j,τ_s} + Mn_j(s) = γ_LTα̂_s` (up to the replacement cost) with `Mn_j(s) := Σ_{e odd}min(α̂_s/p^e, ĉ_j(s+e))`, so
`Σ_{s∈𝔗_v}V_{j,τ_s} ≤ r^H_j(v) − Σ_{s even}Mn_j(s) + (shifts)`. The main term of the depth is paid by the even tops: the
matching lemma with `W = w_j ≥ a⁻` at tops gives `dep°_v ≤ Σ_{s even}Mn_j(s)`. The price `P_j` of 4.9e (b) is small: for `r_H = 1` its summand at an odd top is
`w_j(τ_s) − a⁻_{τ_s} ≤ b′/x + ϑ` (the top window of ThetaChainsOnDefiniteUnitaryGroups §2.3), at an odd position that is not a top (all positions lie in `A` at a
prime inert in `K` and in `ℚ(√−q)`, so it is thin) `w_j + c_G ≤ w″ + ϑ + 4Sc`, and `(n′/2)r_Hj(t+1) ≤ n′N_m`; a good orbit has at least `n′δ_top/(C log x)` tops (the definition of good orbits); with
`r_H = r_G` below `p₀` the price per top is at most `C·r_G·b′·log x`. The depth remainders are `R°_v/|𝔗_v|` (4.15f) or the
threshold of 4.15e over `|𝔗_v|`, and `D_p + 1` per place, all within `ℒ(p)` by the choice of the data; the sandwich exponent,
the summand `e_p` of `τ_N`, satisfies `e_p ≤ f·(k(k−1)/2)·lg_p(2a) ≤ ℒ_f(p)`: `|Φ| = f`; by ThetaChainsOnDefiniteUnitaryGroups §2.3b (f) and ThetaChainsOnDefiniteUnitaryGroups §2.1, for `x ≥ x₀(ε)`,
`Λ_0(τ)_0 − Λ_0(τ)_{k−1} ≤ 3a` at every `τ` (at a top place it is `a_τ + a⁻_τ ≤ a(1 + θ_a) + 3b′/2`, elsewhere at most `2Sc + k − 1`) and
`k ≤ a`, so `⌊log_p(Λ_0(τ)_0 − Λ_0(τ)_{k−1} + k − 1)⌋ ≤ ⌊log_p(4a)⌋ ≤ ⌊log_p(2a)⌋ + 1 = lg_p(2a)`; and `k ≤ N_m`. The case analysis per
orbit is not given here. Tops whose orbit at `p` is linked and not served are not in `Φ_top(𝔭)`.

*NEW*. *Needs:* ThetaChainsOnDefiniteUnitaryGroups §2.1, ThetaChainsOnDefiniteUnitaryGroups §2.3b, 4.9e, 4.9f, 4.14, 4.15f, 4.15e, 4.16, 4.17; IntegralWeylModulesOfGeneralLinearGroups §0.3 (through 4.9e (f)).

### 4.17b Size of the loss

Data of 4.17. Under `Size(x, ε)` (ThetaChainsOnDefiniteUnitaryGroups §2.1), `SizeSc` (ThetaChainsOnDefiniteUnitaryGroups §2.3b), `k ≥ x²s_max³log a` and `X″·(Sc + k + ϑ)·log(2a) ≤ b`, for `x ≥ x₀(ε)`:
`Σ_{p<X′}(log p)·(ℒ(p) − C(Sc + k + ϑ)lg_p(2a)) ≤ C₁·b`, `C₁` depending only on the constants fixed before `ε`, and
`Σ_{p≤X″}(log p)·C(Sc + k + ϑ)lg_p(2a) ≤ C·X″(Sc + k + ϑ)·log a ≤ C·b`. No factor `x^{Cε}` is needed: the term `b′/x` summed
over `p < X′` is `≤ log 4·X′b′/x = log 4·b`, and every other term sums to `o(b)`.

*Route.* Summing with weight
`log p` over `p < X′` (Chebyshev: `Σ_{p≤y}log p ≤ log 4·y`; Mertens: `Σ_{p<y}log p/p ≤ log y + C`): the term `b′/x` gives `log 4·b`
exactly (`X′b′ = xb`); the term `b^{1/2}` gives `≤ log 4·X′b^{1/2} = o(b)`; the terms `a·p^{−ℓ(p)}` (`≤ a/(k²Y_II³)`), `a/p²` (`p ≥ p₀`),
`Λ_log·a/(pk)`, `r_Gb′log x` (`p < p₀`), `Sc`, `(w″ + t)log x/δ_top` give `o(b)` under `p₀ = k²Y_II`, `k ≥ x²s_max³log a`, `SizeSc`, `SizeT` (inside
`Size(x, ε)`), `X′ = e^{x^{ε/3}}`, `b = e^{x^ε}`; the term `ϑ` gives `≤ C·log 4·X′ϑ ≤ C·b/log(2a)` by the last hypothesis (`X′ ≤ X″`),
which also gives the second sum.

*Checks.* `Σ_{p<p₀}log p·[C·r_G·b′·log x] ≤ C·p₀·r_G·b′·log x = C·k²Y_II·r_G·log x·x·b/X′ = o(b)`. Without the hypothesis on `ϑ` the
sum fails: for `ϑ = b′/4` the term `C·ϑ` summed over `p₀ ≤ p < X′` with weight `log p` is about `C·X′b′/4 = C·x·b/4`.

*NEW* (orders of magnitude). *Needs:* ThetaChainsOnDefiniteUnitaryGroups §2.1, ThetaChainsOnDefiniteUnitaryGroups §2.3, 4.17; AnalyticNumberTheoryPartI §0.11 (Mertens); Mathlib Chebyshev bounds.

### 4.17d Selection of the tops

Data of 4.17. Let the tops be selected as in FrobeniusRestrictedRieszSums §0.7 with a coset profile `ω ≥ ω₀` (every position is a top with a
probability in `[ω₀δ_top, δ_top]`). For every `p ∈ I` and every
position `α`, `P(α ∈ Φ_top and the orbit of α at p is not good) ≤ p_orb(p)·P(α ∈ Φ_top)`, with `p_orb(p)` the bound of 4.15d
(probabilities in `[ω₀δ_top, δ_top]`) for `(δ_top, h_II, x, r_G, L₂, M₀)` and `n′ = n′_p`; for `x ≥ x₀(ε, ω₀, c_s, L_b)`,
`p_orb(p) ≤ C_b·x^{−2}` with `C_b` depending only on `ε`, `c_s`, `ω₀` and `L_b`. Consequently (FrobeniusRestrictedRieszSums §0.7 (iii′) for these events with the
weights `log p/p` and the index set `I`) there is a selection with (i), (ii) of FrobeniusRestrictedRieszSums §0.7 and `Z_bad ≤ 8C_bx^{−2}·(log X′ + C)·|Φ_top| ≤ |Φ_top|·x^{−2+ε}`
for `x ≥ x₀`.

*Checks.* A per-top form of this target ("at most `8p_bad|Φ_top|` tops are bad" with `p_bad = x(log X′ + C)·C_bx^{−2}`) would not give
4.17c: its
threshold `8p_bad·log X′ ≤ 1/x` fails by the factor `(log X′)² = x^{2ε/3}`; the aggregate count `Z_bad` needs only `p_orb·log X′ = o(1/x)`.

*Route.* Goodness counts the selected tops of the orbit, `α` among them; given that `α` is a top, whether the orbit of `α` at `p` is good
depends only on the selection of the other `n′_p − 1` positions of that orbit, which are selected independently of `α`, with
probabilities in `[ω₀δ_top, δ_top]`; so the probability conditional on `α ∈ Φ_top` is at most the bound of 4.15d, which is conditional
on one position being a top. Its three terms at the data: (A) `≤ 2x^{h_A}·L₂^{r_G−1}x^{−(ε/8)(r_G−1)} ≤ 2L₂^{r_G}x^{−2}` (`n′_p ≤ 2x^{h_A}`,
`(ε/8)(r_G − 1) ≥ h_A + 2`, `L₂ ≤ L_b`); (B) with `uδ_top ∈ [1, 1 + δ_top)` a tile is marked with probability
`≥ e^{−1}(0.067ω₀)^{3r_G}` for `x ≥ x₀`, and `M₀ ≥ 10^{6r_G+1}max(1, (5ω₀)^{−3r_G})(h_A + 3)log x`, so the term is `≤ 2x^{h_A}·x^{−(h_A+3)}`;
(C) `N₁ − 1 ≥ 6·E Bin(G′, δ_top)` and `N₁ − 1 ≥ (h_II + 3)log₂x`, so by Chernoff's bound `P(Bin(G′, δ_top) ≥ N₁ − 1) ≤ 2^{−(N₁−1)} ≤ x^{−(h_A+3)}`;
and `(M₀ + 1)(6r_G + 1)u ≤ x^{ε/4} ≤ n′_p` for `x ≥ x₀`. Then FrobeniusRestrictedRieszSums §0.7 (iii′), with the fixed index set `I`, the weights
`λ_p = log p/p` and the events `B_{α,p}` "`α` is a top and the orbit of `α` at `p` is not good" (`p_bad = C_bx^{−2}`), whose weighted
count is `Z_bad` (4.17); with
probability at least `1/2`, (i),
(ii) of FrobeniusRestrictedRieszSums §0.7 hold and `Z_bad ≤ 4C_bx^{−2}·n_top·Σ_{p∈I}log p/p ≤ 8C_bx^{−2}·|Φ_top|·Σ_{p∈I}log p/p` (`n_top` the expected number of tops,
`n_top ≤ 2|Φ_top|` on the event of (i)); `Σ_{p<X′}log p/p ≤ log X′ + C` (Mertens), and `x^{−2}·x^{ε/3} = o(x^{−2+ε})`.

*NEW*. *Needs:* FrobeniusRestrictedRieszSums §0.7, 4.15d, 4.17; AnalyticNumberTheoryPartI §0.11 (Mertens); Mathlib probability (independent Bernoulli variables, binomial tails).

### 4.17c The choice of the top weights

Data of 4.17. Assume `Y_I ≥ C·m|Φ_top|·s_max·x^{c_io+2ε}·log X′` and
`Y_II ≥ C·m|Φ_top|·r_G²k·x^{c_io+2ε}·log X′`. Let the top weights range over the boxes `a_τ ∈ [a, a + a/(kY_I)]` (the top
window of ThetaChainsOnDefiniteUnitaryGroups §2.3: `1/(kY_I) = θ_a`), `a⁻_τ ∈ [b′, b′ + Δ_b]` (`τ ∈ Φ_top`), all other entries of the weights being fixed as
in ThetaChainsOnDefiniteUnitaryGroups §2.3, and put `W(a, a⁻) := Σ_{p candidate}(log p/p)(2·[𝔖(p) > x^{−ε}] + 4·𝔖(p))`. There is a point of the boxes with
`W ≤ x^{−c_io}`; the top weights of the construction are such a point. For them, `Σ_p log p·𝔦(p) ≤ m|Φ_top|a·x^{−c_io}` and, for
every set `S` of candidates, the ask of the tops excluded in 4.17a (ii) is
`Σ_{p∈S}log p·Σ_jΣ_{τ∈Φ_top∖Φ_top(p)}V_{j,τ}(p) ≤ 2m·a·|Φ_top|·x^{−c_io} + 4m·a·Z_bad`, `Z_bad` of 4.17; for the selection of
4.17d this is `≤ C·m·a·|Φ_top|·(x^{−c_io} + x^{−2+ε})`.

*Route.* Markov's inequality over the boxes with the mean bound of 4.15f at `p ≥ p₀` (the common share of 4.17, admissible for the
weights of all the words, is at most the function `sh_v(a, a⁻)` of 4.15f, which depends only on the top weights of `v` and serves all
these weights; a mean bound for each word separately would not bound the mean of the share common to all words) and the pointwise
bound of 4.15e at `p < p₀` (at the scale `a − c″` of 4.17, for every point of the boxes and every word): the mean of `W` is at most
`Σ_{p<X′}(log p/p)(2x^ε + 4)·E𝔖(p) ≤ C·x^ε·log X′·m|Φ_top|·max(s_max/Y_I, r_G²k/Y_II) ≤ x^{−c_io}` by the hypotheses on
`Y_I`, `Y_II`. A top excluded in 4.17a (ii) at a candidate `p` is either at a candidate with `𝔖(p) > x^{−ε}` (all its linked tops;
`Σ_{such p}log p/p ≤ W/2`) or on a linked orbit that is not good (counted in `Z_bad`); it asks at most
`Σ_jV_{j,τ}(p) ≤ m·γ_LT(p)·2a ≤ 4ma/p`. The bound on `Σ log p·𝔦(p)`: by 4.14 (a), `𝔵_v ≤ mγ_LT(p)Σ_{s∈𝔗_v}α_s` with `γ_LT(p) ≤ (1 + 1/168)/p` (`p ≥ 13`) and `α_s ≤ (1 + θ_a)a`, so
`𝔦(p) ≤ 2𝔖(p)·m·(1 + 1/168)(1 + θ_a)a|Φ_top|/p ≤ 2.02·𝔖(p)·m·a|Φ_top|/p` for `x ≥ x₀`, and `Σ_p log p·𝔦(p) ≤ 2.02·m·a|Φ_top|·W/4`.

*NEW*. *Needs:* ThetaChainsOnDefiniteUnitaryGroups §2.3, 4.14, 4.15e, 4.15f, 4.17, 4.17d.

### Examples

These examples are worked in the Checks above.

- *Types of an inert prime on a host with tops* (4.9). On a host of FrobeniusRestrictedRieszSums §0.4 with tops `Φ_top ⊂ A`, at a prime inert in `K` and in `ℚ(√−q)` the element `h := cFrob_p` lies in `A`, and `p` is of split type iff `h` has even order, of conjugate type iff `h = 1`, and of odd conjugate type iff `h ≠ 1` has odd order (the last class is empty when `A` is a `2`-group); at a prime inert in `K` and split in `ℚ(√−q)` no top has a top at odd distance, so `p` is unlinked.
- *The cost at `d` is attained* (4.9c). For a lattice of discriminant `1` and `d = 7, 11, 19, 43, 67, 163`, `|√−d·s₂| = 1/4, 2/3, 2, 12, 38, 724` (up to a sixth root of unity), of valuation `0` at `d`, so the exponent `v_d(s₂) ≥ −1/2` is attained.
- *The local exponents in the smallest orbit* (4.9e). For `n′ = 2` and `𝔗_v = {0}`, `r^H_j(v) = γ_LT·α̂_0` and `r⁰_j(v) = Σ_{e odd}(α̂_0/p^e − ĉ_j(1))₊`; at a prime split in `K` and at a prime of conjugate or odd conjugate type the gain is `0`.
- *The diagrams of a step* (4.9f (d)). For `(k, m, t) = (6, 2, 13)`, `e′ = (10, 26)`, `e = (18, 34)`, `v = (−5, …, −9)` and `j = 1`, the two diagrams are `a⁺ = (1⁶)` and `a⁻ = (1)`, while the expression `s⁻_c + w_j − (q_j − c − 1) − (t + 1)/2` equals `−15`.
- *A twisted column* (4.14c). For `r = 1`, two vector letters `x` (position `0`) and `v` (position `d`) and a column of height `2`, `K^σ = x_0^{p^d}v_c − x_c^{p^d}v_0`, with one costly step, order `1` and leading term `w·x_0^{p^d}v_c`.
- *Isotypic projectors* (4.14f′). For `k = 3` and two letters of degree one, `π^{GL_2}_{(2,0),{1,2}} = (1 + (12))/2` and the projector of `GL_1` onto degree one in the last variable of the first letter do not commute; for `p = 5` and `5^5` letters of degree one the symmetriser has denominator `5^5`, and the exponent `⌊log_5(5^5 + 1)⌋ = 5` of (iii) is exact.
- *The exchange lemma* (4.15a). For `R = ℤ_p`, `M = ℚ_p`, `S = ℤ_p`, `P = M`, `B = p^{−1}ℤ_p`, `b = 1`, `U = p`, `D = 1`, `e = 1`, the left side of (b) is `2` and the right side `3`.
- *The sandwich exponent for `GL_2`* (4.17). For `λ = (n, 0)` the least exponent is `⌊log_p(n + 1)⌋ − v_p(n + 1)`, so the bound `⌊log_p(n + 1)⌋` of IntegralWeylModulesOfGeneralLinearGroups §0.3 (b) is attained exactly when `p ∤ n + 1`.

### Dependencies

ThetaChainsOnDefiniteUnitaryGroups §§2.1–2.9b and §§3.1–3.10 (the data of the chain: ranks, weights, Hecke and twisting characters, the field `𝕃`, the type and level primes, the levels; the integral forms, the CM theta functions, the step operators, the chain lift, the stabiliser denominators, the operators at the level prime, the source lattices and the periods). TaylorBoundsAndDepthsOnHeightTwoFormalGroups §§4.1–4.8c and §§4.18–4.19f, the first part of this layer (the Taylor bounds on height-two formal groups, the flow programme, the classification of biextension cocycles, the jet bound for a Gaussian, the depth of a weight and its bound by the bulk). FrobeniusRestrictedRieszSums §§0.3, 0.4, 0.6, 0.7 (host predicates, cyclic hosts, places and tops, the selection of the tops). IntegralWeylModulesOfGeneralLinearGroups §§0.1, 0.2, 0.3, 0.3a. ThetaLiftsForDefiniteUnitaryGroups §2.2. HodgeTateLatticesAndLubinTateLogarithms §§3.4–3.6. LubinTateFormalModulesAndQuasiCanonicalLifts §§4.3, 4.4. AnalyticNumberTheoryPartI §0.11. AutomorphicFormsOnReductiveGroups §§7.4, 7.5, 7.6 and DiscreteSeriesCoefficientsAndAutomorphicMetrics §§7.5a, 7.5b. SmoothRepresentationsOfLocalGroups SR.4.3. ReductiveGroups §10B. ClassicalGroups §6.1. ArithmeticLocallySymmetricSpaces ALS.F.7. ArithmeticStatisticsPartIV §3.2. Mathlib: Smith normal form, `Module.length`, Gauss norms and roots of polynomials, binomial polynomials, exterior powers, Witt vectors, modules over a discrete valuation ring, Chebyshev bounds, and probability (independent Bernoulli variables, binomial tails).

## Downstream consumers

- GluedTargetAndDivisionInequality uses the ledger of 4.9e–4.9f (gains, bulks and costs, the net exponent `𝔊_u`), the step bound 4.10, the gain sublattice 4.16 and the column bound at the level prime 4.16b for the slope of the glued target and the division inequality.
- ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties uses the diagrams of step `j` of 4.9f (d): ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19 identifies their total size `D^H_j` with `DF(λ^W_j)`.
- ThetaChainsAndFrobeniusPrimeSums applies the data and statements of the gain inequality (4.17–4.17d), the ledger (4.9, 4.9e, 4.9f), the step bound 4.10, the gain sublattice 4.16, the statements at the level prime (4.16a–4.16c) and the depth theorems (4.15–4.15f); ThetaChainsAndFrobeniusPrimeSums §10.6 fixes the order of the constants (the layer exponent `A_n = 2 + 8ε`, the exponent `c_s = ε/(5J)` of the inert-free bound), and ThetaChainsAndFrobeniusPrimeSums §10.0 (H2) states the inert-free bound and the host condition `HostSplitting E` of chain data.
- TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.19f bounds the depth of the row side by the bulk `F_j` of 4.9f (d), the same number that the column side gains in 4.10.

## Scope and ownership

This sub-roadmap of [RiemannHypothesisForDirichletLFunctions](../README.md) is independently definitive.

This roadmap owns the second part of Layer 4 of the theta-chain roadmaps, the targets 4.9–4.17d above: the positions, types and sides of the places above a prime inert in `K` (4.9); the host property, the hyperbolic shape, the kernel at `d` and the folded shape of the normalised CM theta functions (4.9a–4.9d); the ledger of local exponents, gains, bulks, costs and colength data (4.9e, 4.9f); the gain of a step at the inert primes, at `d`, at the type primes and elsewhere, and of the chain lift (4.10, 4.10a, 4.11); the local model of the Hecke operators at a prime of split type with Hida's normalisation and the frame lemma, Hecke commutation along the chain and the refined gain on the Hecke image (4.12–4.14); the elementary divisors along a progression, the two-letter model at an edge with its key lemma, pairing, rank count, integral isotypic projectors and bad shares, and Theorem I at one edge (4.14a–4.14h); the depth property, the walk lemma, the colength of the Hecke image, good orbits, Theorems II and I and the exchange lemma for colengths (4.15–4.15f, 4.15a); the gain sublattice and the kernels, column bound and colength at the level prime (4.16–4.16c); and the data of the gain inequality, the inequality, the size of the loss, the selection of the tops and the choice of the top weights (4.17–4.17d).

Not owned here. The first part of Layer 4, TaylorBoundsAndDepthsOnHeightTwoFormalGroups §§4.1–4.8c and 4.18–4.19f (formal groups of height two, the Taylor bounds and their engines, the jets of a Gaussian, the depth of a weight at a framed point and the row datum), is owned by [TaylorBoundsAndDepthsOnHeightTwoFormalGroups](../TaylorBoundsAndDepthsOnHeightTwoFormalGroups/README.md). The hosts, their predicates, the places, the tops and their selection are [FrobeniusRestrictedRieszSums](../FrobeniusRestrictedRieszSums/README.md) Layer 0; the data of the chain, its integral forms, CM theta functions, step operators, chain lift, operators at the level prime, source lattices and periods are [ThetaChainsOnDefiniteUnitaryGroups](../ThetaChainsOnDefiniteUnitaryGroups/README.md) Layers 2 and 3. The bideterminant basis, the agreement of the Weyl and dual Weyl lattices below the upper wall of the lowest alcove, the sandwich exponent and the integral invariant projection are [IntegralWeylModulesOfGeneralLinearGroups](../IntegralWeylModulesOfGeneralLinearGroups/README.md) Layer 0; the Hecke equivariance of a theta lift at split places and the dictionary of the homomorphism pair are [ThetaLiftsForDefiniteUnitaryGroups](../ThetaLiftsForDefiniteUnitaryGroups/README.md) §§0.1, 2.2, 2.5; the quasi-logarithms, the letter group and the sums of quasi-quadratic series under unitary substitutions are [HodgeTateLatticesAndLubinTateLogarithms](../HodgeTateLatticesAndLubinTateLogarithms/README.md) §§3.4–3.6. On roadmaps outside this family: the Lubin–Tate laws `ℓ_s` and the supersingular elliptic comparison are LubinTateFormalModulesAndQuasiCanonicalLifts §§4.3, 4.4; Mertens' theorem is [AnalyticNumberTheoryPartI](../../AnalyticNumberTheoryPartI/README.md) §0.11; Gross's models of algebraic modular forms are [AutomorphicFormsOnReductiveGroups](../../AutomorphicFormsOnReductiveGroups/README.md) §7.4, with the class-set integration and the kernel operators between class sets of DiscreteSeriesCoefficientsAndAutomorphicMetrics §§7.5a, 7.5b; the Satake transform is [SmoothRepresentationsOfLocalGroups](../../SmoothRepresentationsOfLocalGroups/README.md) SR.4.3; induced and Weyl modules are [ReductiveGroups](../../ReductiveGroups/README.md) §10B; the branching `GL_n ↓ GL_{n−1}` is [ClassicalGroups](../../RepresentationTheory/ClassicalGroups/README.md) §6.1; integral dual Weyl modules as coefficient lattices are [ArithmeticLocallySymmetricSpaces](../../ArithmeticLocallySymmetricSpaces/README.md) ALS.F.7; and the count of subspaces over `𝔽_q` is [ArithmeticStatisticsPartIV](../../ArithmeticStatisticsPartIV/README.md) §3.2. The consumers of this roadmap in the family are listed under Downstream consumers above.

## Exact supplier contracts

### From FrobeniusRestrictedRieszSums, a sub-roadmap of this family

- §0.1, §0.2: the host `E` with its subfields `K` and `F`, the CM type `Φ` and its places, arithmetic Frobenius elements. Used throughout.
- §0.3: the host predicates `SplitRamification d` and `InertFreeUpTo B`, and the inertia group `{1, σ_d}` at `d`. Used in 4.9, 4.9c, 4.9f, 4.10, 4.16, 4.17.
- §0.4: the cyclic hosts, the coset `A` and the auxiliary pair. Used in 4.9, 4.17.
- §0.6: the partner bijection `par_τ`, the positions of a letter, the tops and the thick places. Used in 4.9, 4.9f, 4.17.
- §0.7: the selection of the tops with a coset profile `ω ≥ ω₀` and the selection density, with its clauses (i), (ii), (iii′). Used in 4.17, 4.17d.

### From ThetaChainsOnDefiniteUnitaryGroups, a sub-roadmap of this family

- §2.1, §2.3, §2.3b: the sizes of the chain and the size predicates, the words, weights, step weights, Young diagrams and model parameters with (W1)–(W6), the top entries and the top window. Used throughout.
- §2.2, §2.2a: the spaces `X_j`, `X^h`, the ideal `𝔞₀`, the scaling element `δ_T` and the normal form of a homomorphism pair. Used in Conventions and 4.9a.
- §2.4, §2.5, §2.6: the Hecke characters `μ_j` and the primes `π_g`; the tuples of twists, the tuple `ξ_𝔭` and the twist places; the field of places `𝕃` with `σ₀` and `c_𝕃`. Used in 4.9a, 4.9f, 4.10, 4.12, 4.16.
- §2.7, §2.8, §2.9, §2.9a, §2.9b: the type primes, the level prime `T(u) = N(π_u)`, the levels at the bad places and at the type primes, the pairs at `T(u)` with the diamond operators. Used in 4.9f, 4.10a, 4.16, 4.16a.
- §3.1, §3.1a, §3.1c, §3.1d: the integral forms `ℳ^{int}_j`, the forms `ℳ^∨_j` and the polynomial model; the lattice `Λ_K` and the period lattice; the reduced theta function `θ` and the constant `s₂`; the family `Θ^{CM}_{L,L′}` with its clauses (d), (e), (f). Used in 4.9a–4.9f, 4.10, 4.10a, 4.12, 4.16.
- §3.2, §3.3, §3.5: the step operators `K_j(ξ)` with their finite data (A1)–(A3), Lemma (i)–(ii) and API (c), their reading as class-set theta lifts (§3.3 (iii)) and the Hecke relation (§3.3 (iv)), and the chain lift `col_ξ`. Used in 4.9c, 4.10, 4.10a, 4.11, 4.12, 4.16a.
- §3.6, §3.7, §3.8: the stabiliser denominator `D_Γ`; the operators `U_v`, `D_v`, `FF_v` at the level prime; the source lattices `M_u^{all}`, `M_u` with their ranks, neat level and trivial stabilisers. Used in 4.9f, 4.10, 4.11, 4.16–4.16c.
- §3.9, §3.10: the top period `P̃_ξ`, the restriction to `U(X^h)` and the integral pairing of row forms with integral forms. Used in 4.11, 4.16, 4.16b.

### From TaylorBoundsAndDepthsOnHeightTwoFormalGroups, a sub-roadmap of this family

- §4.1: `γ_LT(p) = p/(p² − 1)` and `ρ_LT(p)`. Used throughout.
- §4.3, §4.4, §4.4a: the hypotheses (B1)–(B4), the classification of a biextension cocycle and its class (iii), the letters, the torus mean and the conditions (F1)–(F2). Used in 4.9b, 4.9d, 4.10.
- §4.5, §4.5a: the one-letter engine and the folded engine. Used in 4.9d, 4.10.
- §4.6, §4.7: the flow programme (with (b) and (f)) and the first engine with the numbers `𝔚`. Used in 4.9e, 4.9f, 4.10.
- §4.8, §4.8a: the formulas `r⁰`, `r^H` with the jet bounds (J1)–(J3), and the jets of a Gaussian. Used in 4.9e, 4.10, 4.12.
- §4.19f: the bound of the depth of the row side by the bulk. Used in 4.9f, 4.10.

### From IntegralWeylModulesOfGeneralLinearGroups, a sub-roadmap of this family

- §0.1: the standard bideterminant basis of `∇_ℤ(λ)` over an integral domain, with saturation. Used in 4.14c′, 4.14f′.
- §0.2: `Δ(λ) = ∇(λ)` in characteristic `p` for `λ` below the upper wall of the lowest alcove (`λ_0 − λ_{N−1} + N − 1 < p`), with the simplicity of the Weyl and induced modules over a field of characteristic `p`. Used in 4.16a.
- §0.3: the sandwich exponent: for a discrete valuation ring `O` of characteristic `0` and residue characteristic `p` and a dominant weight `λ` of `GL_N`, `Δ_O(λ) ⊂ ∇_O(λ)` and `p^{e}·∇_O(λ) ⊂ (dim V_λ)·Δ_O(λ)` with `e = (N(N−1)/2)·⌊log_p(λ_0 − λ_{N−1} + N − 1)⌋`; in the polynomial model `p^{e}∇_ℤ(λ) ⊂ (dim V_λ)·Δ_ℤ(λ) ⊗ ℤ_(p)`. Used in 4.9e (f), 4.17, 4.17a.
- §0.3a: the invariant projection of a `U_ℤ`-stable lattice `M` of a representation of `𝔤𝔩_N` whose weights of degree `0` have entries of absolute value `≤ L`: `p^{(N(N−1)/2)·⌊log_p(L + N − 1)⌋}·Inv(M) ⊂ M`. Used in 4.14f′.

### From ThetaLiftsForDefiniteUnitaryGroups, a sub-roadmap of this family

- §2.2: Hecke equivariance at split places with the Satake relation, the parameter `c_w·α` (no inversion) for the homomorphism pair, at every split place with unramified splitting characters (any additive character, residue characteristic and conductor); its first clause, the algebra homomorphism `ξ_w`. Used in 4.12.
- §0.1, §2.5: the homomorphism pair and its dictionary, with the Satake relation of §2.5 (d). Used in Conventions.

### From HodgeTateLatticesAndLubinTateLogarithms, a sub-roadmap of this family

- §3.4 (quasi-logarithms of the unramified Lubin–Tate laws), §3.5 (the letter group), §3.6 (sums of quasi-quadratic series under unitary substitutions, for `p` odd, under (C) the biadditivity of the coboundary up to `≃` and (N) the norm relation for the units fixed by `σ²`: (o) the adjoint relation and (N) for all integral `α`, (a) unitary invariance, (b) isotropic families, (c) hyperbolic frames). Used in 4.9a, 4.9b, 4.9d.

### From TauCetiRoadmap.LubinTateFormalModulesAndQuasiCanonicalLifts

- §4.3 (the laws of `ℓ_s`, both signs), §4.4 (the supersingular elliptic comparison). Used in 4.9a, 4.9d.

### From TauCetiRoadmap.AnalyticNumberTheoryPartI

- §0.11: Mertens' first theorem. Used in 4.9f, 4.17b, 4.17d.

### From TauCetiRoadmap.AutomorphicFormsOnReductiveGroups

- §§7.4, 7.5, 7.6: algebraic modular forms in Gross's models and the operators between class sets. Used in 4.12.

### From DiscreteSeriesCoefficientsAndAutomorphicMetrics, a sub-roadmap of this family

- §7.5a, §7.5b: the class-set integration formula and the perfect pairing of lattices of forms (the duality of class-sum lattices, §7.5a), composition and adjoints of class-set operators (§7.5b). Used in 4.12.

### From TauCetiRoadmap.SmoothRepresentationsOfLocalGroups

- SR.4.3 (Satake transform of `T_i`; spherical representations of `GL_n`), Layer SR.4. Used in 4.12.

### From TauCetiRoadmap.ReductiveGroups

- §10B: the induced and Weyl modules `∇(λ)`, `Δ(λ)` and their characters, the integral Weyl lattice, the top-normalised integral contravariant form and the perfect pairing `D_τΔ(λ) ≅ ∇(λ)`, read in the polynomial model of `GL_N`. Used in 4.14f (and through ThetaChainsOnDefiniteUnitaryGroups §3.1 in the targets that use the integral Weyl lattices).

### From TauCetiRoadmap.ClassicalGroups

- §6.1 (branching `GL_n ↓ GL_{n−1}`, Gelfand–Tsetlin). Used in 4.14f.

### From TauCetiRoadmap.ArithmeticLocallySymmetricSpaces

- ALS.F.7 (integral dual Weyl modules as coefficient lattices). Used in 4.12, 4.14b, 4.15.

### From TauCetiRoadmap.ArithmeticStatisticsPartIV

- §3.2 (Gaussian binomial coefficients count subspaces over `𝔽_q`). Used in 4.14h, 4.15e.

### From Mathlib

- `Module.Basis.SmithNormalForm` and Smith normal form over a discrete valuation ring (4.12, 4.14a, 4.15, 4.15a, 4.15c); `Module.length` (4.15a); Gauss norms of polynomials and their multiplicativity, `Polynomial.roots`, binomial polynomials (4.14a); exterior powers and Witt vectors (4.14c); modules over a discrete valuation ring (4.15b); Chebyshev bounds (`Chebyshev.theta_le_log4_mul_x`, 4.17b); probability: independent Bernoulli variables, `PMF.bernoulli`, binomial tails (4.15d, 4.17d).

## References

- [FormalProof] Levent Alpöge, the Lean formalization of the Riemann hypothesis and of the Riemann hypothesis for Dirichlet L-functions announced in [Announcement]; source with a public verification setup: <https://github.com/leanprover-community/riemann-hypothesis>. It is the reference of every target marked *NEW*.
- [Announcement] Levent Alpöge, the announcement of that proof, 20 November 2026: <https://alpo.ge/remark.pdf>.
- B. Gross, *Algebraic modular forms*, Israel J. Math. 113 (1999): 4.12. D. Mumford, *Abelian Varieties* (the theorem of the cube); K. Weierstrass (the sigma function): 4.9a.
- J. Lubin and J. Tate (1965); T. Honda (1970); M. Hazewinkel, *Formal groups and applications* (1978); N. Katz, *Crystalline cohomology, Dieudonné modules and Jacobi sums* (1981); D. Mumford, *Bi-extensions of formal groups* (1969); L. Breen, *Fonctions thêta et théorème du cube* (1983): 4.9–4.10 here, and the first part of Layer 4 (TaylorBoundsAndDepthsOnHeightTwoFormalGroups §§4.1–4.8c). B. Mazur and W. Messing, *Universal extensions and one dimensional crystalline cohomology*, LNM 370 (1974). P. Cartier, *Modules associés à un groupe formel commutatif. Courbes typiques*, C. R. Acad. Sci. Paris 265 (1967). R. Jacobowitz, *Hermitian forms over local fields*, Amer. J. Math. 84 (1962): 4.9d. F. G. Frobenius and L. Stickelberger (the sigma function and the theorem of the cube): 4.9a. K. Mahler; Y. Amice (binomial polynomials on discs): 4.14a. P. Pieri; D. P. Zhelobenko (branching): 4.14f. J. C. Jantzen, *Representations of algebraic groups*, II.5–II.6: 4.16a. H. Chernoff (tail bounds): 4.17d. K. Bannai and S. Kobayashi (2010): 4.10. P. Doubilet, G.-C. Rota and J. Stein (1974); C. De Concini, D. Eisenbud and C. Procesi (1980): 4.12. H. Hida: 4.12. S. Rallis (1982); S. Kudla (1986, 1994): 4.12.
