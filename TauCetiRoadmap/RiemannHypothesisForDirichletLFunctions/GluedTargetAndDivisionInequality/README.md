# Roadmap: the glued target and the division inequality

**Summary.** This sub-roadmap of [RiemannHypothesisForDirichletLFunctions](../README.md) builds the target lattice of a chain of theta lifts between definite unitary groups and bounds everything that enters the slope inequality of the chain on the side of the maps: their integrality, their heights, the slope and the maximal slope of the target. The chain lives over the coefficient fields `𝕂 ⊂ 𝕃` of ThetaChainsOnDefiniteUnitaryGroups, `𝕃` a number field, Galois over `ℚ` and stable under complex conjugation `c_𝕃`. To each word `u` of the chain belong a lattice `M_u` of algebraic automorphic forms with its gain sublattice `N_u`, and the period pairing `B_u`, linear in the form and `c_𝕃`-semilinear in the row, from `M_u` to functionals on the target rows `𝔼`. Slopes `μ`, `μ_max` and heights `ht` are twice Bost's.

The headline theorems are these. (1) *Integrality after division.* Let `𝕃′` be a number field with an automorphism `c`, `B : V × W → 𝕃′` biadditive, `𝕃′`-linear in `V` and `c`-semilinear in `W`, and `N ⊂ V`, `R ⊂ W` `𝒪_{𝕃′}`-submodules. Suppose that at every finite place `𝔭` the module `R` lies in `𝒪_(c^{−1}(𝔭))·j_𝔭(M_𝔭)` for an `𝒪_{𝕃′}`-submodule `M_𝔭` of an `𝕃′`-space and a linear map `j_𝔭` from that space into `W`, and that each value `B(φ, j_𝔭Υ)`, `φ ∈ N`, `Υ ∈ M_𝔭`, is zero or has `𝔭`-adic valuation at least `σ_𝔭`. Then `B((∏_𝔭𝔭^{−τ_𝔭})·N, R) ⊂ 𝒪_{𝕃′}` for all integers `τ_𝔭 ≤ ⌈σ_𝔭⌉`, almost all zero. For the chain it gives, under the hypotheses listed at 7.14 (among them those of the seesaw identity, which ask that the Bessel–Poincaré series of `u` be nonzero on its new forms), that `B_u` maps the divided source `N′_u = I_u·N_u` into the lattice `R^∨` of `c_𝕃`-semilinear functionals integral on the glued target `R`, the lattice generated near each place by the integral forms of the tuple of twists used there. (2) *The height of the period pairing.* Under the size conditions of the chain, among them `SizeT_u` on the level prime, `|(L′/L)(1, χ_K)| ≤ x^ε` and, at a scale `x ≥ x₀`, the size predicate `Size_□` of the grid of the rows, and under the hypotheses of the seesaw identity, among them that the Bessel–Poincaré series of `u` is nonzero on its new forms (all listed at 8.9), if `B_u ≠ 0` then `ht(B_u) ≤ h_u`, an explicit number: the top term `t_u = −A_top·log T(u) + C₂·N_m²·(Σ_{τ∈Φ_top}a⁻_τ + f·(mϑ + Sc + 1))·La`, plus for each of the `m` steps the kernel terms `Σ_τ(Σ_i ph(ν_{j,τ,i}) − (Σ_iν_{j,τ,i})·log Ω)` (`ph(y) = y log y − y`, `Ω` the CM period of the host) and an error `C₁·f·m³·N_m²·La`, minus for each step the logarithms of the hook products `H⁺_{j,τ}` that bound the Rallis eigenvalues from below, up to an error, minus `log 𝔫` plus `log|P_1|`. (3) *The division inequality.* For a good twisting datum that satisfies the support condition (T3), a host with wild-kernel budget `1` and `[F:ℚ] ≥ 2`, under the size predicate `Size_□` of the grid at a scale `x ≥ x₀` and the size conditions of the chain (all listed at 8.22), for every word `u`,
`μ(R^∨) + h_u − F_tot ≤ Σ_{τ∈Φ_top}(m·(ph(a_τ) − a_τ·log Ω) − a_τ·log T(u)) + C·|Φ_top|·a·La + C·m·(B₀ + N_c)·x^ε`, where `F_tot` is the bulk divisibility of the steps at the twisted places, `Φ_top` the top places with top entries `a_τ`, `T(u)` the level prime of `u` and `B₀`, `N_c` the budgets of the chain. The large powers of `Ω` cancel between the kernels and the step lattices, the Stirling terms against the hooks, and one row of length `a_τ` per top place and per step survives.

The roadmap sits on [ThetaChainsOnDefiniteUnitaryGroups](../ThetaChainsOnDefiniteUnitaryGroups/README.md), which fixes the chain data; [LocalGainOfThetaChains](../LocalGainOfThetaChains/README.md), whose gain exponents divide the source; [RowTowerAndRallisIdentities](../RowTowerAndRallisIdentities/README.md) and [SeesawForThetaChains](../SeesawForThetaChains/README.md), which supply the rows, the model lifts with their Rallis eigenvalues and the period pairing; [CongruenceModulesOfThetaLifts](../CongruenceModulesOfThetaLifts/README.md) and [ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties](../ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties/README.md), which bound the congruence lengths and the slopes of the step lattices; and [SlopesOfHermitianVectorBundles](../SlopesOfHermitianVectorBundles/README.md), whose slope calculus and gluing lemma are used throughout. [ThetaChainsAndFrobeniusPrimeSums](../ThetaChainsAndFrobeniusPrimeSums/README.md) applies the results to the slope inequality of the chain.

Layer 7 below proves integrality after division and forms the divided source and the glued target (7.12–7.14). Layer 8 bounds the height of the period pairing through its factorisation into step operators, top period and descent (8.1–8.10), shows that the theta conditions of the twist selection are polynomial conditions (8.19e), computes the local terms of the glued target with the depth table (8.20–8.20b), bounds the slope of the target (8.21), proves the division inequality and the cost of the type primes (8.22, 8.23), and bounds the maximal slope of the target (8.24a, 8.24b, 8.24).

## Conventions

**Fields.** `E` is the host (FrobeniusRestrictedRieszSums §0.1): finite abelian over `ℚ` with an imaginary quadratic subfield `K`; `F = E⁺` its
maximal totally real subfield, `f = [F:ℚ]`; `c ∈ G` complex conjugation; `χ_K` the quadratic character of `K`; `f_E` the
conductor of `E`; `h_E` the class number of `E` and `μ_E` its group of roots of unity. Under `SplitRamification d` (FrobeniusRestrictedRieszSums §0.3) `K` is
ramified only at the prime `d`; on the cyclic hosts (FrobeniusRestrictedRieszSums §0.4) `d ≡ 7 (mod 8)`, `K = ℚ(√−d)`, and a second imaginary quadratic
field `ℚ(√−q) ⊂ E` is used; `(q, d)` is the *auxiliary pair*. `𝕂 ⊂ 𝕃` are the two fields of the chain (ThetaChainsOnDefiniteUnitaryGroups §2.6): the
*coefficient field* `𝕂`, a number field containing `E`, over whose ring of integers the cusp forms on the Shimura varieties of the
steps, their integral forms, theta rules and short theta series are taken, and the *field of places* `𝕃`, a finite Galois
extension of `ℚ` inside `ℂ`, stable under complex conjugation and containing `𝕂`, with the embedding `σ₀` and the conjugation
`c_𝕃 = σ₀^{−1}∘(complex conjugation)∘σ₀` of ThetaChainsOnDefiniteUnitaryGroups §2.6. The Hermitian lattices of the chain are over `𝒪_𝕃`; lattices over `𝒪_𝕂`
enter them after extension of scalars to `𝒪_𝕃`, which changes neither the slope nor the maximal slope. The finite places of
`𝕃` are written `𝔭`, with residue characteristic `p(𝔭)` (also `ℓ(𝔭)`), ramification index `e_𝔭` and weight `ϱ(𝔭) = log N𝔭/[𝕃:ℚ]`
(so `Σ_{𝔭|p} ϱ(𝔭)e_𝔭 = log p`); `sz_𝔭(y) = 2ϱ(𝔭)e_𝔭·y`. Embeddings `𝕃 ↪ ℂ` are written `σ`.

**CM type and places.** An embedding `ι₀ : E ↪ ℂ` is fixed; `Φ = Gal(E/K)` is identified with the CM
type `{ι₀∘g : g ∈ Φ}` induced from `K` (`|Φ| = f`). Elements of `Φ` are called places. When `K = ℚ(√−d)`, `√−d ∈ K`
denotes the root with `Im ι₀(√−d) > 0`, so that `Im τ(√−d) > 0` for every `τ ∈ Φ`.

**Primes of the construction.** The *type primes* `g₀, g₁` (ThetaChainsOnDefiniteUnitaryGroups §2.7) carry the depth-zero types; the *auxiliary primes*
`p_δ, p′_δ` carry the characters `δ, δ′` (ThetaChainsOnDefiniteUnitaryGroups §2.4, ThetaChainsOnDefiniteUnitaryGroups §2.7); the primes `q, d` form the *auxiliary pair* (FrobeniusRestrictedRieszSums §0.4), and are not
called auxiliary primes; the *level prime* `T(u) = N(π_u)` of a word `u` (ThetaChainsOnDefiniteUnitaryGroups §2.8) carries the new forms. The *twist places*
`Q(ξ)` of a tuple `ξ` of twisting characters are its full ramification set (ThetaChainsOnDefiniteUnitaryGroups §2.5). Twisting involves two sets (ThetaChainsOnDefiniteUnitaryGroups §2.5): the
*admissible twisting characteristics* `𝒮_tw`, the primes at which twisting is permitted, and the *twisted places* `Tw`,
a finite `c_𝕃`-stable set of places of `𝕃` above `𝒮_tw`, fixed with the twisting datum (ThetaChainsOnDefiniteUnitaryGroups §2.5), outside which the tuple
`ξ_𝔭` used is the base tuple; sums "over the twisted places" run over `Tw`.

**Hermitian forms, definiteness and measures.** Hermitian forms are conjugate-linear in the first variable (the
convention of `HermitianFormsAndLattices` and `ThetaLiftsForDefiniteUnitaryGroups`). Definiteness is that of
`HermitianFormsAndLattices`: a space is *definite at* a real place if its form has one sign there, *totally definite* if
it is definite at every real place (the sign may depend on the place), and *totally positive definite* if every sign is
`+`; a *definite unitary group* is the unitary group of a totally definite space. The column spaces `X_j`, the model
spaces `V_j` and the hyperplane `X^h ⊂ X_m` are totally positive definite (ThetaChainsOnDefiniteUnitaryGroups §2.2). On `U(V)(𝔸_f)` the stabiliser of the
chosen self-dual lattice has volume `1`; for totally definite `V`, `∫_{[U(V)]} φ = Σ_𝒸 |Γ_𝒸|^{−1} φ(g_𝒸)` over the
classes `𝒸` (representatives `g_𝒸`, stabilisers `Γ_𝒸`), so the total volume is the mass; for indefinite `V` the
archimedean measure is transferred from the compact inner form, and formal
degrees are taken for this measure.

**Integral structures.** For a dominant weight `λ`, `∇_ℤ(λ)` is the dual Weyl lattice (the integral polynomials of the
polynomial model of ThetaChainsOnDefiniteUnitaryGroups §3.1, spanned by products of minors) and `Δ_ℤ(λ) ⊂ ∇_ℤ(λ)` the Weyl lattice, its dual for the
invariant form; the product of leading minors `v_λ` lies in both. The column side of the chain (the integral forms
`ℳ_j^{int}` of ThetaChainsOnDefiniteUnitaryGroups §3.1, the chain lift, the source lattices of ThetaChainsOnDefiniteUnitaryGroups §3.8 and their restriction to `U(X^h)`) takes values in `Δ_ℤ`,
in the coordinates of a basis of the dual class lattice; the row forms `Υ` on `U(X^h)` paired with it take values in
`∇_ℤ` (the forms `ℳ^∨`), so that every class term of the pairing is integral and the only loss is the stabiliser
orders (ThetaChainsOnDefiniteUnitaryGroups §3.6, ThetaChainsOnDefiniteUnitaryGroups §3.10). At the top, a class `𝒸` of `U(X^h)` gives the class `𝒸̃` of level `m` with class lattice
`L_𝒸 ⊕ 𝒪_E z_u`, `z_u = π_u e_{N_m}`, and the restriction to `U(X^h)` is integral at every finite place (ThetaChainsOnDefiniteUnitaryGroups §3.9).

**Slopes and heights.** Hermitian lattices are finitely generated `𝒪_𝕃`-submodules of full rank in Hermitian
`𝕃`-spaces with a metric at every complex embedding. This roadmap writes `μ(L̄) := 2μ̂(L̄)`, twice Bost's normalised
slope (`μ̂ = deĝ/([𝕃:ℚ]·rk)`; Bost 1996, App. A.2, pp. 146–147), so `μ(𝒪_𝕃^n, standard) = 0`; `μ_max`, `μ_min` likewise. For a linear map `φ`,
`ht(φ) := (2/[𝕃:ℚ]) Σ_σ log ‖φ‖_σ`, twice Bost's archimedean height, that is the mean over the embeddings of
`log ‖φ‖²_σ` (equivalently over the infinite places, the metrics being compatible with conjugation); integrality at
finite places is stated separately. For a lattice `L` and a basis `e` of `L ⊗ 𝕃`,
`−rk L·μ(L) = mean_σ log det Gram_σ(e) − 2Σ_𝔭 ϱ(𝔭)·idx_𝔭(L : ⟨e⟩)`, `idx_𝔭` the signed length at `𝔭` (no factor `2` on
the mean). With these, `μ(N̄) ≤ μ_max(M̄) + ht(φ)` for `φ` injective and integral, and this roadmap is written in
squared norms (`ph(y) = y log y − y`). `SlopesOfHermitianVectorBundles` uses `μ̂` and `h`; this paragraph is the
dictionary, and its statements are homogeneous in it.

**Galois representations and wild kernels.** The Galois representations of CongruenceModulesOfThetaLifts, which enter here through the twist selection (8.19e), follow
`AutomorphicGaloisRepresentationsPartII`: Artin reciprocity sends uniformizers to geometric Frobenius elements, and the
cyclotomic character `χ_cyc` has Hodge–Tate weight `−1`. A Hecke character `μ_j` of `E` (ThetaChainsOnDefiniteUnitaryGroups §2.4; the same for `η̃`, `δ`,
`δ′`) has the value `μ_j(𝔓)` at a prime `𝔓` of `E` prime to its conductor, its value at a uniformizer of `E_𝔓`; its
`ℓ`-adic Galois character takes the value `μ_j(𝔓)` at the geometric Frobenius of `𝔓`, and for a character of
finite order it is the inverse of the character that the arithmetic normalisation (`Frob_p` acting as `x ↦ x^p` on residue fields) attaches to
it. For a number field `M`, a prime `ℓ` and an integer `e ≥ 1`, `Ш¹(M, ℓ, e)` is the group of classes in
`H¹(𝒪_M[1/ℓ], ℚ_ℓ/ℤ_ℓ(−e))` unramified outside `ℓ` and trivial at the places above `ℓ`, and
`V(M, t) = Σ_ℓ log ℓ Σ_{1≤e<t} length Ш¹(M, ℓ, e)`, as in BernoulliBoundsForClassGroupEigenspaces §6.17; the roadmap uses them for `M = E`.

**The CM period.** `log Ω := γ + log(2π/rd_E) − (L′/L)(1, χ_K)`, `rd_E` the root discriminant of `E`. Equivalently
`log Ω = log Ω_K − log(rd_E/√d)`, where `log Ω_K = γ + log(2π/√d) − (L′/L)(1, χ_K)` is the mean over the ideal
classes of `K` of `log(area(Λ)/π) + (1/6) log|Δ(Λ)|` (Chowla–Selberg, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.5). The same `Ω` enters the heights of the
lifts (8.6, through ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.5) and the arithmetic degree of the flat line bundle (ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.11).

**Indices of the chain.** Step `j` is the column lift `U(X_{j−1}) → U(X_j)` with Hecke character `μ_j` and step weight
`w_j = e_{j−1}` (ThetaChainsOnDefiniteUnitaryGroups §2.3), the row descent `U(Y_j) → U(Y_{j−1})` (against the conjugate kernel `θ̄`, ThetaChainsOnDefiniteUnitaryGroups §2.2a), and the model
lift between `U(V_j)` and `U(W_j)`. Columns grow by `t + 1`, rows by `t`.

**Row spaces.** The row forms on `U(Y_0)` are formed at principal level at the type primes, where the finite group `G₀`
of ThetaChainsOnDefiniteUnitaryGroups §2.9a acts (RowTowerAndRallisIdentities §5.3): `ℋ^♮` denotes the rows at principal level and `𝔼^♮ = Π_good·ℋ^♮` the good ones; `ℋ` and
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

**Periods and pairings.** The top period `P̃_ξ(φ, Υ)` (ThetaChainsOnDefiniteUnitaryGroups §3.9) is linear in the column `φ` and conjugate-linear in the
row form `Υ`. Equivalently, it is a bilinear pairing applied to the row form with conjugated coefficients: for a column
form `φ′` of level `m`, `P̃(φ′, Υ) = P^{bil}(φ′, Υ^c)`, where `P^{bil}` is `𝕃`-bilinear (built from the `ℚ`-bilinear
contravariant forms `β_λ` whose Hermitian forms are those of ThetaChainsOnDefiniteUnitaryGroups §3.1) and `Υ^c`, the *coefficient conjugate* of `Υ`, is a form
for the CM type `cΦ` with the conjugate character (ThetaChainsOnDefiniteUnitaryGroups §3.9). The conjugation is that of the coefficients of the row form,
never of the column or of the place at which the column is bounded: a bound for the period at a place `𝔭` of `𝕃` uses
the column at `𝔭` and the row form at `c_𝕃(𝔭)` (`Υ^c` is integral at `𝔭` exactly when `Υ` is integral at `c_𝕃(𝔭)`;
ThetaChainsOnDefiniteUnitaryGroups §3.10). The cost of the level prime `T(u) = N(π_u)` sits at the places above `π_u` and is `0` at those above `π̄_u` (LocalGainOfThetaChains §4.16).
The period pairing `B_u(φ)(x)` of SeesawForThetaChains §6.1 is linear in the column `φ` and conjugate-linear in the row `x ∈ 𝔼`; under
the hypotheses of SeesawForThetaChains §6.14 (among them that the Bessel–Poincaré series of `u` is nonzero on the new forms `M_u`), for
a tuple `ξ` and a row form `Υ` of the relevant part `ℋ^{rt}_ξ` of the row type level (RowTowerAndRallisIdentities §5.4),
`P̃_ξ(φ, Υ) = ζ(u, ξ)·B_u(φ)(ι_ξΥ)` with a root of unity `ζ(u, ξ)` (SeesawForThetaChains §6.14 (c), §6.15 (b)). The steps of the descent of a tuple are
normalised by the volume of its finite level group (RowTowerAndRallisIdentities §5.4).

**Routes.** The mathematics of this roadmap follows a complete formal proof ([FormalProof]); every target states what
that proof establishes. Where a route is not given, or not given in full, the target says so in its route. The good
twisting datum (CongruenceModulesOfThetaLifts §7.10a) and the wild-kernel budget (CongruenceModulesOfThetaLifts §7.11) are conditions on the data, and so are the conditions (T1), (T2)
of ThetaChainsOnDefiniteUnitaryGroups §2.5 and (T3) of 8.20 on the twisting datum.

**Quantifier order and sizes.** Constants named before `ε` do not depend on `ε`; the scale `x` and everything chosen at
it come after `ε`. Between them come the numbers that may depend on `ε` and that the size predicates of
ThetaChainsOnDefiniteUnitaryGroups §2.1 take as arguments: the layer exponent `A_n`, the window constant `J` and the exponent `c_H` of the slope
range. The size conditions are named predicates: those of ThetaChainsOnDefiniteUnitaryGroups §2.1, grouped into the host predicates `SizeA`,
`SizeN`, `SizeD`, `SizeRd`, `SizeQD`, `SizeInert`, `SizeDep` and the parameter predicates `SizeM`, `SizeK`, `SizeW`,
`SizeMf`, `SizeT`, `SizeTheta`, with their conjunction `Size(x, ε)`; and those named where their quantities are defined:
`SizeSc` (ThetaChainsOnDefiniteUnitaryGroups §2.3b), `SizeGap`, `SizeSep` (ThetaChainsOnDefiniteUnitaryGroups §2.3c), `SizeG` (ThetaChainsOnDefiniteUnitaryGroups §2.7), `SizeT_u` (ThetaChainsOnDefiniteUnitaryGroups §2.8: `16mx^ε ≤ log T*(u)` and
`log T*(u) + 1 ≤ C_T m x^ε ≤ x`). `SizeDep` uses the set `S_small` and the number `vd` of ThetaChainsOnDefiniteUnitaryGroups §2.1 and a constant `C_dep`
fixed before `ε`. "The size conditions of ThetaChainsOnDefiniteUnitaryGroups §2.1" means `Size(x, ε)`; a target that uses a single predicate names it.

**Constants.** Exponents, window ratios, the shares of the tops, the bound `t ≤ x^{C_t}`, the budgets and the
admissible range of `ε` are parameters with their true constraints; the exponents written in the size predicates of
ThetaChainsOnDefiniteUnitaryGroups §2.1 are fixed choices. The values of one construction (such as `C_t = 401`) appear only in Checks.

### Table of symbols

| Symbol | Meaning | Defined |
|---|---|---|
| `E, F = E⁺, f, c, G, f_E` | host field, its maximal totally real subfield, `[F:ℚ]`, complex conjugation, `Gal(E/ℚ)`, conductor of `E` (of a primitive `χ`: `f_χ`) | FrobeniusRestrictedRieszSums §0.1, FrobeniusRestrictedRieszSums §0.2 |
| `K, χ_K, d, √−d` | the imaginary quadratic subfield and its character; the prime of `SplitRamification d` (`K = ℚ(√−d)` on the cyclic hosts) and the root with `Im ι₀(√−d) > 0` | FrobeniusRestrictedRieszSums §§0.1–0.3, Conventions |
| `Φ, ι₀, τ` | `Gal(E/K)` and the CM type it defines through `ι₀`; its elements, the places | FrobeniusRestrictedRieszSums §0.1 |
| `σ_d` | the nontrivial element of the inertia group at `d` | FrobeniusRestrictedRieszSums §0.3 |
| `SplitRamification d, InertFreeUpTo B, HostSplitting E` | host predicates: every ramified prime other than `d` splits in `K` and `I_d = {1, σ_d}`, `σ_d ∉ Φ`; no prime `p ≤ B` is inert in `K`; `4 \| f` and every place of `F` above a prime dividing `f_E` splits in `E` | FrobeniusRestrictedRieszSums §0.3 |
| `(q, d), n` | auxiliary pair, layer of the cyclotomic `ℤ₂`-tower of a cyclic host | FrobeniusRestrictedRieszSums §0.4 |
| `A, A₀` | `Gal(E/ℚ(√−q, √−d)) ⊂ Φ`; `A₀ = ker(ψ\|_A)`, `[A:A₀] = o` | FrobeniusRestrictedRieszSums §0.4 |
| `Φ_top, 𝒯, δ_th, u₀` | tops `Φ_top ⊂ A`, thick set `𝒯 ⊂ A₀`, `\|𝒯\|/\|A\|`, a translate (thick places `cσ_d u₀𝒯`, thick letters `cσ_d u₀𝒯 ⊔ σ_d u₀𝒯`) | FrobeniusRestrictedRieszSums §0.6, FrobeniusRestrictedRieszSums §0.8a |
| `γ` | Euler's constant | Conventions |
| `rd_E, log Ω, log Ω_K` | root discriminant, CM periods of `E` and of `K` | Conventions |
| `μ, μ_max, μ_min, ht, ph` | twice Bost's slopes, twice his archimedean height, `ph(y) = y log y − y` | Conventions |
| `𝔭, p(𝔭), e_𝔭, ϱ(𝔭), sz_𝔭` | finite place of `𝕃`, residue characteristic, ramification index, `log N𝔭/[𝕃:ℚ]`, `sz_𝔭(y) = 2ϱ(𝔭)e_𝔭y` | Conventions |
| `Ш¹(E, ℓ, e), V(E, t)` | twisted Tate–Shafarevich groups, their total length | Conventions |
| `k, m, t, r, N_j, n_j` | base rank, chain length, rank step, `r = k + m − 1`, `N_j = k + j(t + 1)`, `n_j = r + jt` | ThetaChainsOnDefiniteUnitaryGroups §2.1 |
| `x, ε, b, a, X′, b′, w″, X″` | scale, exponent, `e^{x^ε}`, `x·b`, `e^{x^{ε/3}}`, `a/X′`, `b′/(x\|A\|)`, `x\|A\|X′` | ThetaChainsOnDefiniteUnitaryGroups §2.1 |
| `ϑ, B₀, N_c, Γ₀, H` | thick-weight width, the two budgets `B₀ = fmbx^ε`, `N_c = \|𝒯\|kbx^{2ε}/\|A\|²`, redundancy factor, slope range `x^{c_H}b` | ThetaChainsOnDefiniteUnitaryGroups §2.1 |
| `Size(x, ε)` | conjunction of the host predicates `SizeA, SizeN, SizeD, SizeRd, SizeQD, SizeInert, SizeDep` and the parameter predicates `SizeM, SizeK, SizeW, SizeMf, SizeT, SizeTheta` | ThetaChainsOnDefiniteUnitaryGroups §2.1 |
| `S_small, vd, SizeDep` | the primes dividing `2f_E` other than `q`, `d`; the largest mean different exponent of `E` at a prime of `S_small`; the host predicate on them | ThetaChainsOnDefiniteUnitaryGroups §2.1 |
| `SizeSc, SizeGap, SizeSep, SizeG, SizeT_u` | size predicates of the words, the gaps, the separation, the type primes and the level primes | ThetaChainsOnDefiniteUnitaryGroups §2.3b, ThetaChainsOnDefiniteUnitaryGroups §2.3c, ThetaChainsOnDefiniteUnitaryGroups §2.7, ThetaChainsOnDefiniteUnitaryGroups §2.8 |
| `C_t, C_W, C_Γ, A_max, C_dep` | constants fixed before `ε`: of `SizeT`, of `SizeW`, of `Γ₀`, the bound of the layer exponent, the constant of `SizeDep` | ThetaChainsOnDefiniteUnitaryGroups §2.1 |
| `X_j, X^h` | column spaces, hyperplane of `X_m` | ThetaChainsOnDefiniteUnitaryGroups §2.2 |
| `Y_j, z_m, r_S` | row spaces; the negative vector of `Y_j` (`j` even); `r_S = m/2 − 1`, the number of hyperbolic planes of `Y_0` | ThetaChainsOnDefiniteUnitaryGroups §2.2 |
| `W_j, V_j` | model spaces: rank `r`, signature `(k+j−1, m−j)`; totally positive definite of rank `r + t` | ThetaChainsOnDefiniteUnitaryGroups §2.2 |
| `𝔞₀, δ_T` | `𝔞₀𝔞̄₀ = 𝔇_{E/K}^{−1}`; the scaling element `δ_T = √−d/d = −1/√−d` of the steps | ThetaChainsOnDefiniteUnitaryGroups §2.2 |
| `W, u, u_*` | the set of words, a word, the base word | ThetaChainsOnDefiniteUnitaryGroups §2.3 |
| `u(τ), v(τ), e′(τ), e(τ)` | Harish-Chandra data at `τ` of the word `u` (`v, e′, e` shared by all words) | ThetaChainsOnDefiniteUnitaryGroups §2.3 |
| `a_τ, a⁻_τ, θ_a, A_w` | top entry and negative bottom entry, top window `θ_a = 1/(k·x^{A_w/2})` | ThetaChainsOnDefiniteUnitaryGroups §2.3b |
| `w_j(τ), w_{u₀,j}` | step weights `e_{j−1}(τ)` (thick, top or thin); those of the translate `u₀` | ThetaChainsOnDefiniteUnitaryGroups §2.3 |
| `Λ_j(τ), ν_j(τ), σ(τ)` | weight on `X_j`, Young diagram of step `j`, top weight on `X^h` | ThetaChainsOnDefiniteUnitaryGroups §2.3 |
| `s⁺_j(τ), s⁻_j(τ), p_j, q_j` | the model parameter of step `j`: the first `p_j = k + j − 1` and the last `q_j = m − j` entries of `(v(τ); −e′(τ))`; `s⁻_{j,c} = −e′_{j+c}` | ThetaChainsOnDefiniteUnitaryGroups §2.3 |
| `Δ_w, Sc` | letter step, cloud size `4kΔ_w` | ThetaChainsOnDefiniteUnitaryGroups §2.3 |
| `(U_j), (W1)–(W6), h_gap, κ_j` | unit condition, conditions of a weight datum, row gap, the shift `(k + (2j − 1)(t + 1))/2` of the step diagrams | ThetaChainsOnDefiniteUnitaryGroups §2.3 |
| `(W7), η_s, D_*, ℓ*, ℓ_A` | the separation condition, separation width, thresholds | ThetaChainsOnDefiniteUnitaryGroups §2.3c |
| `η_w` | the window `t + max_τ(e_{m−1}(τ) − e′_0(τ))` of an adapted weight datum | ThetaChainsOnDefiniteUnitaryGroups §2.3b |
| `h₀` | node spacing of an adapted weight datum | ThetaChainsOnDefiniteUnitaryGroups §2.3a |
| `μ_j, η̃, δ, δ′, o_δ` | Hecke characters of the chain, unramified splitting character (not algebraic; `η̃²` and `η̃·‖·‖_{𝔸_E}^{1/2}` are, and `𝕃` contains the values of the latter, ThetaChainsOnDefiniteUnitaryGroups §2.6), auxiliary characters and their inertial order | ThetaChainsOnDefiniteUnitaryGroups §2.4 |
| `χ_{v,j}, ω_g` | type characters `ω_g^{2j}` at the place `w_v` of `E` above `π_g` (the residue of `μ_j` there is `χ_{v,j}^{−1}`); the fixed generator of the characters of `𝔽_g^×` | ThetaChainsOnDefiniteUnitaryGroups §2.4 |
| `S₀` | bad places: the places above `g₀, g₁, p_δ, p′_δ` | ThetaChainsOnDefiniteUnitaryGroups §2.4 |
| `ξ, Ξ, ξ_𝔭, Q(ξ), s, δ_ℓ` | tuple of twists (`ξ = 1` the base tuple), set of tuples, tuple used at `𝔭`, twist places (full ramification set), the sign of the twisted tuples (`s_j := s`), auxiliary character of `ℓ` | ThetaChainsOnDefiniteUnitaryGroups §2.5 |
| `A(ℓ), Q(ψ_𝔭)` | places of `E` above the auxiliary prime of `ℓ`; ramification set of the twist `ψ_𝔭` (`Q(ξ_𝔭) = A(ℓ) ⊔ Q(ψ_𝔭)`) | ThetaChainsOnDefiniteUnitaryGroups §2.5 |
| `𝒮_tw, Tw` | admissible twisting characteristics; twisted places | ThetaChainsOnDefiniteUnitaryGroups §2.5 |
| `Z₀; (T1), (T2); (T3)` | the prescribed set of places of a twisting datum; conditions on the twisting datum; the support condition on `Tw` | ThetaChainsOnDefiniteUnitaryGroups §2.5; 8.20 |
| `𝕂, 𝕃, σ₀, c_𝕃` | coefficient field, field of places, the embedding of `𝕃` and its conjugation | ThetaChainsOnDefiniteUnitaryGroups §2.6 |
| `g₀, g₁; p_δ, p′_δ; 𝔅(N, g)` | type primes; auxiliary primes; the exceptional set of a type prime | ThetaChainsOnDefiniteUnitaryGroups §2.7 |
| `T(u), T*(u), π_u` | level prime of the word `u`, its target value, `T(u) = N(π_u)` | ThetaChainsOnDefiniteUnitaryGroups §2.8 |
| `G₀, (P, χ_P), (P_0, χ_{P_0}), (P_1, χ_{P_1}) = (K₂, χ₂), ψ_g` | finite group of the type primes, a level, base level, row type level, additive character | ThetaChainsOnDefiniteUnitaryGroups §2.9a |
| `S(ξ), c_{i,v}` | the places where levels are not hyperspecial; the residues of the step characters at the bad places | ThetaChainsOnDefiniteUnitaryGroups §2.9 |
| `ℳ_j, ℳ_j^{int}, ℳ_j^∨, 𝒸, L_𝒸` | chain forms of level `j`; the `Δ_ℤ`-valued (integral) and `∇_ℤ`-valued forms; a class, its class lattice | ThetaChainsOnDefiniteUnitaryGroups §3.1 |
| `Λ_K, 𝔙(L, L′), H_A, c_τ` | the lattice `δ_K·ι₀(𝒪_K)` of discriminant `1`, the period lattice, its Hermitian form, generators of the axis ideals `𝔩_τ𝒪_𝕃` | ThetaChainsOnDefiniteUnitaryGroups §3.1a |
| `Θ^{CM}_{L,L′}` | the family of CM theta functions | ThetaChainsOnDefiniteUnitaryGroups §3.1d |
| `ℱ_j, Θ_{𝒸,𝒸′}(ξ), ρ^ξ_j, K_j(ξ), col_ξ, A_j, φ^{(α,α′)}_j` | Fock summand of step `j`, theta function of a step at a pair of classes, class characters, step operator, chain lift; a system of data of the chain: index sets and admissible data (`col_ξ` is the sum over index paths of composites) | ThetaChainsOnDefiniteUnitaryGroups §3.2, ThetaChainsOnDefiniteUnitaryGroups §3.5 |
| `D_Γ` | least common multiple of the stabiliser orders | ThetaChainsOnDefiniteUnitaryGroups §3.6 |
| `M_u^{all}, M_u, d_u^{all}, d_u` | full and new source lattices of the word `u`, their ranks | ThetaChainsOnDefiniteUnitaryGroups §3.8 |
| `P̃, P̃_ξ; Υ, φ′; P^{bil}, Υ^c, β_λ` | top period, of the chain of the tuple `ξ`; a row form on `U(X^h)`, a column form of level `m`; the bilinear form of the period, the coefficient conjugate of `Υ`, the bilinear contravariant form | ThetaChainsOnDefiniteUnitaryGroups §3.9 |
| `𝒸̃, res, br_τ, c_{Br,τ}, D₀(τ), D₁(τ)` | the class of level `m` of a class of `U(X^h)`, restriction to `U(X^h)`, the branching map, its constant, its degree bounds | ThetaChainsOnDefiniteUnitaryGroups §3.9 |
| `n_o` | the length of a cycle of the flow programme; orbit length of a row datum | TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.6, TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.19 |
| integral charts | existence, chart-independence of the depth, saturated frames | TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.8b′ |
| `g_j, g⁰_j, g^D_j, F_j, E_{u,j}, Ẽ_{u,j}, τ_N, 𝔦, 𝔊_u` | the ledger of step `j` at `𝔭`: gain, operator-free gain, gain off `Drop`, bulk, cost, the cost without the stabiliser term `v_p(D_Γ)`, served colength, colength beyond `τ_N`; the net exponent of the chain | LocalGainOfThetaChains §4.9, LocalGainOfThetaChains §4.9e, LocalGainOfThetaChains §4.9f |
| split, conjugate, odd conjugate type; linked places; `𝒜_p, ℬ_p, 𝒱_p, Drop` | types of a prime inert in `K` by its Frobenius; places with two tops at odd distance in their orbit; the places above `p` whose positions lie in the coset `A` of the tops and the others, the served places, the dropped primes | LocalGainOfThetaChains §4.9, LocalGainOfThetaChains §4.17 |
| `𝔢_u` | cost at the level prime | LocalGainOfThetaChains §4.9f |
| `N_u, N_T(𝔭)` | sublattice of `M_u` on which the gains are proved; its local form at `T(u)` | LocalGainOfThetaChains §4.16 |
| `B_𝔥, X[𝔥], e_{P,χ_P}` | family of an eigensystem `𝔥` (the Satake parameters of its base change), the part on which the Hecke operators act by `𝔥`; idempotent of a level `(P, χ_P)` at the type primes | RowTowerAndRallisIdentities §5.7, ThetaChainsOnDefiniteUnitaryGroups §2.9a |
| `ℋ^♮, 𝔼^♮, ℋ, 𝔼, 𝔼_0, Π_good` | rows at principal level, good rows; their parts of the row type level (`𝔼` the target rows); the part of the base level; the good idempotent | RowTowerAndRallisIdentities §5.3 |
| `𝒰^♮_ξ, M̃_ξ, D_ξ, ι_ξ, ℋ^{rt}_ξ, Q_ξ, sec` | forms on `U(X^h)` at principal level, integral forms, the unprojected `m`-fold descent, the good descent `Π_good∘D_ξ`, the relevant part of the row type level, its part orthogonal to `ker ι_ξ`, the section of `ι_1` on `𝔼` | RowTowerAndRallisIdentities §5.4 |
| `θ_j, D_{W_j}, λ_j(ξ, 𝔥), a_j, ϑ_v` | model lift of step `j`, the holomorphic discrete series of `U(W_j)`, its Rallis eigenvalue `a_j·L`, its constant; the character in the test function at a place below `Q(ξ)` | RowTowerAndRallisIdentities §5.7 |
| `v_□, p_□, S_□` | the auxiliary place of the grid, its rational prime, `S₀ ∪ {v_□}` | RowTowerAndRallisIdentities §5.8a |
| `𝔪_□, d_□, K⁺; X^c_i, X⁺ = X^c_m; C⁺, e⁺_i, z⁺, N⁺, ψ⁺, n⁺` | the modulus of the grid, its depth, the principal congruence subgroup of level `𝔪_□` in `U(X⁺)(𝔸_f)`; the core column; the Bessel datum (the measure constants `𝔪_j` of RowTowerAndRallisIdentities §5.2 are other symbols) | RowTowerAndRallisIdentities §5.8a |
| `B⁺, 𝐩, 𝐜, ℓ⁺, Cl⁺, y_{κ,i}, Θ^{(0)}_{𝐩,𝐜}; ℬ_a, a = (𝐜, κ, i)` | the Bessel form; Fock data of column `0`; coset data; a linear form on `V_{Λ⁺}`; the classes `U(X⁺)(F)\U(X⁺)(𝔸_f)/K⁺`; the form on the class `κ` with value the `i`-th basis vector; the theta series of column `0`; the Bessel periods of the grid and their index | RowTowerAndRallisIdentities §5.8e |
| `Size_□, x₀` | the size predicate of the grid; the scale from which its separation statement holds | RowTowerAndRallisIdentities §5.8e |
| `𝔫` | the descent constant | RowTowerAndRallisIdentities §5.10 |
| `B_u` | the period pairing (linear in the column, conjugate-linear in the row) | SeesawForThetaChains §6.1, SeesawForThetaChains §6.14 |
| `η_j(𝔭), Z_good, V_good, d^Z_j` | congruence length, lifted good eigensystems, the lifted subspace, its dimension | CongruenceModulesOfThetaLifts §7.1, CongruenceModulesOfThetaLifts §7.5b, CongruenceModulesOfThetaLifts §7.10a |
| `N′_u, I_u, R, R^∨, R_0` | divided source, division ideal, glued target, its dual (the `c_𝕃`-semilinear functionals integral on `R`), its base-level form | 7.13 |
| `𝔧_j(𝔭), 𝔧_j(ℓ)` | Weyl exponent (an exponent of `ℓ`); the exponent of weight elimination at step `j` and its bound | CongruenceModulesOfThetaLifts §7.15, CongruenceModulesOfThetaLifts §7.16a (3) |
| `La, e_D` | `log(a·rd_E)`; the exponent of the per-lift division error, `e_D = 1` | ThetaChainsOnDefiniteUnitaryGroups §2.1, 8.22 |
| `t_u, A_top` | top term of the height of `B_u`; `Σ_{τ∈Φ_top} a_τ` | 8.7 |
| `T_br` | the common value of `\|s(t_τ)\|²·s(g_τ)` in 8.7 (a) | 8.7 |
| `A_g, A_R` | absolute constants of the hook bound | 8.8 |
| `h_u` | explicit height of `B_u` | 8.9 |
| `𝓕_τ, M^W_j, λ^W_j` | flat line; step lattice on the Shimura variety of `U(W_j)`; its weight | ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.11, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19 |
| `SizeGen, SizePage` | size predicates: (N1)–(N2) of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a; (P1)–(P5) of 8.20 | ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a, 8.20 |
| `B_all` | the finitely generated Hecke-stable module of forms of a step in the index target 8.19e (b) | 8.19e |
| `L` (in 8.20) | the logarithmic size of the theta data (`L = x^ε` in the chain) | 8.20 |
| `D^±_j, a^±_{j,τ}, D^H_j` | the two diagrams of step `j` (rows `a⁺_{j,τ,i} = s⁺_i + w_j − (p_j − 1 − i) − (t + 1)/2`, `a⁻_{j,τ,c} = e′_{j+c} − w_j − c − (t + 1)/2`, all `≥ 1`) and their total sizes; `D^H_j = D⁺_j + D⁻_j`, the type-prime term of the bulk (`F_j = −D^H_j/2` above the type primes), equal to `DF(λ^W_j)` by the definitions of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19 and LocalGainOfThetaChains §4.9f (d) | LocalGainOfThetaChains §4.9f (d), ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19 |
| `𝔰_j, n_j(v), E_j(v), ϵ_j(v)` | the scalar of step `j` and its exponents; an admissible exponent at `v` and its normalised excess over the valuation of `𝔰_j` | 8.20 |
| `ig_j(v)` | the index growth of the twist | 8.20b |
| `F_tot, s^{st}_j, δ_G` | bulk divisibility; slope bound of the step lattice; multiplicity deviation | 8.21 |
| `E_tot(u)` | total cost of the steps | 8.23 |
| `d(ℓ), d_l(𝔭)` | the integrality defect of the bottom norms at `ℓ`; `d(ℓ)·v_𝔭(ℓ)` for `𝔭 \| ℓ` | 8.24b, 8.24a |
| `κ_W` | the constant of the wild-kernel budget (CongruenceModulesOfThetaLifts §7.11); a good twisting datum (CongruenceModulesOfThetaLifts §7.10a) and the wild-kernel budget are conditions on the data | CongruenceModulesOfThetaLifts §7.10a, CongruenceModulesOfThetaLifts §7.11 |

## Layer 7: Division of the source and the glued target

At each place `𝔭` the period is divisible by the accumulated gain for the tuple `ξ_𝔭` used there; the target lattice
is glued place by place from the images of the integral forms of those tuples, so the divided source lattice pairs
integrally with its dual (7.12–7.14). The pairing is one and the same for all tuples, while the glued lattice is taken at
each place from the tuple for which the gain is proved there. The hypotheses of RowTowerAndRallisIdentities §5.8, on which
the rational structure of the target rows rests, and those of SeesawForThetaChains §6.14, on which the rationality of the
period pairing rests, enter through 7.13 and 7.14.

*Notation for this layer.* Fix a twisting datum (ThetaChainsOnDefiniteUnitaryGroups §2.5). A place `𝔭` of `𝕃` is *twisted* if `𝔭 ∈ Tw` (ThetaChainsOnDefiniteUnitaryGroups §2.5), that is if
`ξ_𝔭` is not the base tuple; then, `ℓ` being the residue characteristic of `𝔭`, `ξ_𝔭 = δ_ℓ·ψ_𝔭` with `δ_ℓ` the auxiliary
character of `ℓ` (`δ`, or `δ′` if `ℓ = p_δ`; it is unramified above `ℓ`) and `ψ_𝔭` of `ℓ`-power order (ThetaChainsOnDefiniteUnitaryGroups §2.5). `Q(ψ_𝔭)` is
the set of places of `E` at which `ψ_𝔭` is ramified, and `Q(ξ_𝔭) = A(ℓ) ⊔ Q(ψ_𝔭)` the set of twist places of `ξ_𝔭`, `A(ℓ)` the set
of places above the auxiliary prime of `ℓ` (ThetaChainsOnDefiniteUnitaryGroups §2.5).

### 7.12 Integrality after division

Let `𝕃′` be a number field, `c`
an automorphism of `𝕃′` (`c = id` allowed), `V` and `W` `𝕃′`-vector spaces and `B : V × W → 𝕃′` biadditive,
`𝕃′`-linear in `V` and `c`-semilinear in `W` (`B(φ, ax) = c(a) B(φ, x)`). Let `N ⊂ V` and `R ⊂ W` be `𝒪_{𝕃′}`-submodules
(no finiteness is needed; in 7.14 they are lattices). Suppose that
for every finite place `𝔭` of `𝕃′` there are a `𝕃′`-space `U_𝔭` with an `𝒪_{𝕃′}`-submodule `M_𝔭`, a `𝕃′`-linear map `j_𝔭 : U_𝔭 → W` with
`R ⊂ 𝒪_(c^{−1}(𝔭)) · j_𝔭(M_𝔭)`, a map `P_𝔭 : V × U_𝔭 → 𝕃′` and a `𝔭`-unit `ζ_𝔭` with `P_𝔭(φ, Υ) = ζ_𝔭 · B(φ, j_𝔭 Υ)`, and a
real `σ_𝔭` such that for `φ ∈ N`, `Υ ∈ M_𝔭` either `P_𝔭(φ, Υ) = 0` or `v_𝔭(P_𝔭(φ, Υ)) ≥ σ_𝔭`. Let `τ_𝔭 ∈ ℤ`, zero for almost
all `𝔭`, with `τ_𝔭 ≤ ⌈σ_𝔭⌉` for every `𝔭`, and `N′ := (∏_𝔭 𝔭^{−τ_𝔭}) · N`. Then `B(N′, R) ⊂ 𝒪_{𝕃′}`.

Route: fix `𝔮`, `x ∈ R`, `φ ∈ N` and `a ∈ ∏ 𝔭^{−τ_𝔭}`. Write `x = Σ_i d_i j_𝔮(Υ_i)` with `d_i ∈ 𝒪_(c^{−1}(𝔮))`, `Υ_i ∈ M_𝔮`;
then `c(d_i) ∈ 𝒪_(𝔮)` and `B(φ, x) = ζ_𝔮⁻¹ Σ_i c(d_i) P_𝔮(φ, Υ_i)` has `v_𝔮 ≥ ⌈σ_𝔮⌉` (valuations are integers), while
`v_𝔮(a) ≥ −τ_𝔮 ≥ −⌈σ_𝔮⌉`; so `v_𝔮(B(aφ, x)) = v_𝔮(a) + v_𝔮(B(φ, x)) ≥ 0`. This holds at every `𝔮`, and `N′` is spanned by
such `aφ`.

*Checks.* (i) Sharpness: `𝕃′ = ℚ`, `B(φ, x) = φx`, `N = 6ℤ`, `R = ℤ`, `M_p = ℤ`, `j_p = id`, `ζ_p = 1`:
`σ_2 = σ_3 = 1`; `τ_2 = τ_3 = 1` gives `N′ = ℤ` and `B(N′, R) = ℤ`, while `τ_2 = 2` gives `N′ = ½ℤ` and fails.
(ii) The division is paid at the same place: `𝕃′ = ℚ(i)`, `c` complex conjugation, `𝔭 = (2 + i)`, `B(φ, x) = φ·c(x)`, `N = 𝔭`,
`R = 𝒪`, `M = 𝒪`, `j = id`, `ζ = 1`: the values `B(N, R) = 𝔭` are divisible at `𝔭` and not at `c(𝔭)`; dividing by `𝔭`
(`τ_𝔭 = 1 ≤ ⌈σ_𝔭⌉ = 1`) gives `N′ = 𝒪` and integral values, whereas dividing by `c(𝔭)` gives the non-integral value
`(2 + i)/(2 − i)`. (iii) The localisation is at `c^{−1}(𝔭)`: in the same field with `N = 𝒪` (`σ = 0` everywhere) the lattice
`R = c(𝔭)^{−1}` lies in `𝒪_(𝔭)·𝒪` but not in `𝒪_(c(𝔭))·𝒪`, and `B(N, R) = 𝔭^{−1}` is not integral at `𝔭`.

*NEW* (elementary). Stated in `Suggested.lean` as `pairing_integral_of_localDivision`. *Needs:* Mathlib
(`IsDedekindDomain`, valuations at maximal ideals, fractional ideals).

### 7.13 The divided source and the glued target

*Definitions.* Assume the hypotheses of RowTowerAndRallisIdentities §5.8, on which the rational structure
`𝔼_{1,𝕃}` rests (those of RowTowerAndRallisIdentities §5.8b for the grid of the chain, a scale `x ≥ x₀` with the size predicate
`Size_□` of RowTowerAndRallisIdentities §5.8e, the condition on `𝕃` there and the hypotheses of
RowTowerAndRallisIdentities §5.6), and those of RowTowerAndRallisIdentities §5.12. For a word `u` let

`I_u := ∏_𝔭 𝔭^{−⌊e_𝔭 𝔊_u(𝔭)⌋}` and `N′_u := I_u · N_u ⊂ M_u ⊗ 𝕃`,

the *divided source*, a Hermitian lattice with the Petersson metrics of ThetaChainsOnDefiniteUnitaryGroups §3.8 at every complex embedding of `𝕃` (the gain
exponent `𝔊_u(·)` of LocalGainOfThetaChains §4.9f (g) has finite support, `N_u ⊂ M_u` the gain sublattice of LocalGainOfThetaChains §4.16). Let `𝔼_{1,𝕃}` be the `𝕃`-structure (RowTowerAndRallisIdentities §5.8) of the target rows `𝔼` of the row type level (RowTowerAndRallisIdentities §5.3; the rows of SeesawForThetaChains). For a
tuple `ξ` let `Λ_ξ ⊂ 𝔼_{1,𝕃}` be the `𝒪_𝕃`-span of `ι_ξ(M̃_ξ ∩ ℋ^{rt}_ξ)`, `M̃_ξ` the lattice of `∇`-valued
integral forms of RowTowerAndRallisIdentities §5.4 (equivalently the span of `ι_ξ(proj_{Q_ξ}(M̃_ξ ∩ ℋ^{rt}_ξ))`, since `ι_ξ` kills `ℋ^{rt}_ξ ∩ ker ι_ξ`). The *glued
target* is

`R := { x ∈ 𝔼_{1,𝕃} : for every finite place 𝔭 there is d ∈ 𝒪_𝕃 ∖ 𝔭 with d · x ∈ Λ_{ξ_𝔭} }`,

`ξ_𝔭` the tuple used at `𝔭` (ThetaChainsOnDefiniteUnitaryGroups §2.5; `ξ_𝔭 = 1` except at the finitely many twisted places), and the *target lattice* is the
lattice of `c_𝕃`-semilinear functionals integral on `R`,

`R^∨ := { λ : 𝔼_{1,𝕃} → 𝕃 additive : λ(ax) = c_𝕃(a)·λ(x) for a ∈ 𝕃, and λ(R) ⊂ 𝒪_𝕃 }`,

an `𝒪_𝕃`-lattice in the `𝕃`-space of `c_𝕃`-semilinear functionals (`(aλ)(x) := a·λ(x)`). The functionals are
semilinear because, under the hypotheses of SeesawForThetaChains §6.14 as well (among them that the Bessel–Poincaré series
of `u` is nonzero on the new forms `M_u`), the pairing `B_u(φ)` takes values in `𝕃` on `𝔼_{1,𝕃}` and is `c_𝕃`-semilinear in the row
(SeesawForThetaChains §6.15(a)); so `B_u` is then an `𝕃`-linear map from `M_u ⊗ 𝕃` to this space. At a complex embedding `σ` of `𝕃`, `λ ⊗ 1` is the conjugate-linear functional
`x ⊗ z ↦ conj(z)·σ(λ(x))` on `𝔼_{1,𝕃} ⊗_{𝕃,σ̃} ℂ`, `σ̃ := conj∘σ∘c_𝕃` (so `σ̃₀ = σ₀`), and `R^∨` carries at `σ` the norm dual
to the metric of `𝔼_{1,𝕃}` at `σ̃`, the metrics of `𝔼_{1,𝕃}` being those of RowTowerAndRallisIdentities §5.12 divided by the order `|P_1|` of the level
group of the part (by `|P_0|` on `𝔼_0`), so that `ι_1^*ι_1 = 𝔫·∏_jλ_j` for the form `X_1` of RowTowerAndRallisIdentities §5.12. At `σ₀` this space of
conjugate-linear functionals is identified `ℂ`-linearly with `𝔼` by `y ↦ ⟨·, y⟩` (Hermitian products are conjugate-linear
in the first variable), and the dual norm is the norm of `y`. Since `σ ↦ σ̃` permutes the embeddings, the bijection
`λ ↦ c_𝕃∘λ` onto the lattice of `𝕃`-linear functionals integral on `R`, with its dual metrics, is `c_𝕃`-semilinear and
isometric from `σ` to `σ̃`: the two have the same degree and the same slopes, and `μ_min(R^∨) = −μ_max(R)`
(SlopesOfHermitianVectorBundles §2.2 for the linear dual). The same
definitions in the part `𝔼_0 = 𝔼_{(P_0,χ_{P_0})}` of the base level, with the relevant part `𝒰^{(0)}_ξ` of that level (RowTowerAndRallisIdentities §5.4),
give `Λ_ξ^{(0)}`, `R_0 ⊂ 𝔼_{0,𝕃}` and `R_0^∨`.

*Theorem.* (i) Each `Λ_ξ` is a lattice of full rank in `𝔼_{1,𝕃}`; `R` is a lattice of full rank, and
`R_(𝔭) = (Λ_{ξ_𝔭})_(𝔭)` for every `𝔭`; `R^∨` is a lattice of full rank; the same holds for `R_0`. (ii) `rk N′_u = d_u`, and
`N′_u` and `N_u` differ by the invertible ideal `I_u`; so every global invariant of `N′_u` (rank, slope) is the one computed
with this ideal.

Route: (i) `M̃_ξ ∩ ℋ^{rt}_ξ` is a full lattice of the `𝕃`-rational subspace `ℋ^{rt}_ξ` (a lattice meets a rational subspace in a
full lattice of it); `ι_ξ` is `𝕃`-rational (RowTowerAndRallisIdentities §5.8) and maps `ℋ^{rt}_ξ` onto `𝔼_{1,𝕃}` (RowTowerAndRallisIdentities §5.6, RowTowerAndRallisIdentities §5.12), so `Λ_ξ` is finitely generated and
spans; the `Λ_{ξ_𝔭}` agree with `Λ_1` at almost all `𝔭`, and the gluing of lattices from local data in module form
(HermitianFormsAndLattices §4.0(g)) gives `R` with the stated localisations; the dual of a full lattice is a full lattice.
(ii) `N_u` has finite colength in `M_u` at every place (LocalGainOfThetaChains §4.16).

Where `c_𝕃` enters: `B_u` is linear in the column and `c_𝕃`-semilinear in the row (SeesawForThetaChains §6.15(a)), so dividing the source at `𝔭`
is paid by the valuation of the period at `𝔭` itself (7.12, Check (ii)), while the target must be generated near `c_𝕃(𝔭)` by
the integral forms of the tuple used at `𝔭` (7.12, Check (iii)); the glued target has this property because
`ξ_{c_𝕃(𝔭)} = ξ_𝔭` (ThetaChainsOnDefiniteUnitaryGroups §2.5). LocalGainOfThetaChains §4.16(ii) bounds the valuation at `𝔭` by the gain exponent at `𝔭` (`⌊e_𝔭𝔊_u(𝔭)⌋`), so the ideal paid
is `I_u`. The ledger entries above `T(u)` (at the places above `π_u`) and above `g₀`, `g₁` (at the places above one of the two
primes of `K` over each, LocalGainOfThetaChains §4.9f (e)) are not `c_𝕃`-invariant, so `I_u` and `c_𝕃(I_u)` differ there; they have the same norm.

*Check.* With no twisted place (`ξ_𝔭 = 1` for all `𝔭`) the definition gives `R = Λ_1`, the lattice spanned by the images
of the integral forms of the base tuple.

*NEW* (objects). *Needs:* LocalGainOfThetaChains §4.9f, LocalGainOfThetaChains §4.16, ThetaChainsOnDefiniteUnitaryGroups §3.8, RowTowerAndRallisIdentities §5.4, RowTowerAndRallisIdentities §5.6, RowTowerAndRallisIdentities §5.8, RowTowerAndRallisIdentities §5.8d, RowTowerAndRallisIdentities §5.8e, RowTowerAndRallisIdentities §5.12, ThetaChainsOnDefiniteUnitaryGroups §2.5, SeesawForThetaChains §6.15; HermitianFormsAndLattices §4.0(g);
SlopesOfHermitianVectorBundles §2.2.

### 7.14 The period pairing on the divided source

For every word `u`, under the hypotheses of LocalGainOfThetaChains §4.16(ii) (and of LocalGainOfThetaChains §4.16b at the places above
`T(u)`), of RowTowerAndRallisIdentities §5.5 for every step, of RowTowerAndRallisIdentities §5.8 and RowTowerAndRallisIdentities §5.12 (as in 7.13), and of
SeesawForThetaChains §6.14 (among them that the Bessel–Poincaré series of `u` is nonzero on the new forms `M_u`), `B_u(N′_u) ⊂ R^∨`: `B_u(φ)(x) ∈ 𝒪_𝕃` for all `φ ∈ N′_u` and
`x ∈ R` (each `B_u(φ)` is a `c_𝕃`-semilinear functional, SeesawForThetaChains §6.15(a)).

Route: if `B_u = 0` there is nothing to prove. Otherwise apply 7.12 with `𝕃′ = 𝕃`, `c = c_𝕃`, `V = M_u ⊗ 𝕃`, `W = 𝔼_{1,𝕃}`,
`B = B_u` (SeesawForThetaChains §6.15(a)), `N = N_u`, and at each `𝔭`: `U_𝔭 = ℋ^{rt}_{ξ_𝔭}`, `M_𝔭 = M̃_{ξ_𝔭} ∩ ℋ^{rt}_{ξ_𝔭}` (the `∇`-valued integral
forms of RowTowerAndRallisIdentities §5.4), `j_𝔭 = ι_{ξ_𝔭}`, `P_𝔭(φ, Υ) = P̃_{ξ_𝔭}(φ, Υ)` and `ζ_𝔭 = ζ(u, ξ_𝔭)`, a root of unity in `𝕃` (SeesawForThetaChains §6.14(c),
SeesawForThetaChains §6.15(b)); `R ⊂ 𝒪_(c_𝕃(𝔭)) j_𝔭(M_𝔭)` by 7.13(i) at `c_𝕃(𝔭)`, since `ξ_{c_𝕃(𝔭)} = ξ_𝔭` (ThetaChainsOnDefiniteUnitaryGroups §2.5). The valuation bound is LocalGainOfThetaChains §4.16(ii)
(with LocalGainOfThetaChains §4.16b at the places above `T(u)`) for the tuple `ξ_𝔭` and the forms `Υ ∈ M̃_{ξ_𝔭} ∩ ℋ^{rt}_{ξ_𝔭}`, whose values lie in the
dual Weyl lattices (RowTowerAndRallisIdentities §5.4; ThetaChainsOnDefiniteUnitaryGroups §3.1, ThetaChainsOnDefiniteUnitaryGroups §3.10(b): the column side is `Δ`-valued): the period is linear in the column, so the bound at `𝔭`
uses the column at `𝔭`, `σ_𝔭 = ⌊e_𝔭 𝔊_u(𝔭)⌋`. Here the column chain and the lattice into which the point map sends the top
column lattice are `Δ`-valued while `Υ` is `∇`-valued, so the period is `Σ_𝒸|Γ_𝒸|^{−1}y_𝒸` with every class term `y_𝒸`
integral; the only loss is `v_ℓ(D_Γ)` (`D_Γ` the least common multiple of the stabiliser orders, ThetaChainsOnDefiniteUnitaryGroups §3.6), a summand of the error
of every step at every place not above the level prime (LocalGainOfThetaChains §4.9f (e)), `m·v_ℓ(D_Γ)` in total, with `log D_Γ ≤ C·f·N_m·log(f·N_m)`. Then
`τ_𝔭 := ⌊e_𝔭 𝔊_u(𝔭)⌋ = σ_𝔭` is the exponent of `𝔭` in `I_u⁻¹` (7.13). The pairing `B_u` is one and the same for all tuples, while the lattice `R` is taken at each place from
the tuple for which the gain is proved there: no single tuple would give integrality at every place.

*NEW*. *Needs:* LocalGainOfThetaChains §4.9f, LocalGainOfThetaChains §4.10, LocalGainOfThetaChains §4.16, LocalGainOfThetaChains §4.16b, SeesawForThetaChains §6.14, SeesawForThetaChains §6.15, 7.12, 7.13; ThetaChainsOnDefiniteUnitaryGroups §2.5, ThetaChainsOnDefiniteUnitaryGroups §3.9, ThetaChainsOnDefiniteUnitaryGroups §3.10, RowTowerAndRallisIdentities §5.4, RowTowerAndRallisIdentities §5.5, RowTowerAndRallisIdentities §5.6, RowTowerAndRallisIdentities §5.8, RowTowerAndRallisIdentities §5.8d, RowTowerAndRallisIdentities §5.8e, RowTowerAndRallisIdentities §5.12.

### Examples

- Over `ℚ` with `B(φ, x) = φx`, `N = 6ℤ`, `R = ℤ`, `M_p = ℤ`, `j_p = id`, `ζ_p = 1`: `σ_2 = σ_3 = 1`, and `τ_2 = τ_3 = 1` gives `N′ = ℤ`
  with `B(N′, R) = ℤ`, while `τ_2 = 2` gives `N′ = ½ℤ` and the conclusion fails (7.12, Check (i)).
- In `ℚ(i)` with `c` complex conjugation, `𝔭 = (2 + i)` and `B(φ, x) = φ·c(x)`: for `N = 𝔭`, `R = 𝒪`, dividing by `𝔭` gives
  `N′ = 𝒪` and integral values, while dividing by `c(𝔭)` gives the value `(2 + i)/(2 − i)`; for `N = 𝒪`, the lattice `R = c(𝔭)^{−1}` lies
  in `𝒪_(𝔭)·𝒪` but not in `𝒪_(c(𝔭))·𝒪`, and `B(N, R) = 𝔭^{−1}` is not integral at `𝔭` (7.12, Checks (ii), (iii)).
- With no twisted place the glued target is `R = Λ_1`, the lattice spanned by the images of the integral forms of the
  base tuple (7.13, Check).

### Dependencies

ThetaChainsOnDefiniteUnitaryGroups §§2.5, 3.1, 3.6, 3.8, 3.9, 3.10; LocalGainOfThetaChains §§4.9f, 4.10, 4.16, 4.16b;
RowTowerAndRallisIdentities §§5.3, 5.4, 5.5, 5.6, 5.8, 5.8b, 5.8d, 5.8e, 5.12; SeesawForThetaChains §§6.14, 6.15;
HermitianFormsAndLattices §4.0 (g); SlopesOfHermitianVectorBundles §2.2; Mathlib's Dedekind domains, valuations at maximal
ideals and fractional ideals (7.12).

## Layer 8: Heights and the slope of the target

The height of the period pairing is bounded through its factorisation into the `m` step operators, the top period
and the descent (8.1). Each step operator is a class sum of Taylor blocks of theta functions of CM abelian
varieties; in the Fock model its norm at an embedding is `Σ ph(ν) − (Σ ν)·log Ω_{τ,σ}` up to polynomial factors
(8.2–8.4), the period entering through the ratio of the Fock coordinate to an algebraic coordinate, and averaging
over the embeddings replaces `Ω_{τ,σ}` by the one CM period `Ω` of the Conventions (8.5c, 8.6, through ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.5). The top period is a
scaled branching map whose norm carries exactly `T(u)^{−a_τ}` at each top place (8.7); the descent is scalar on
isotypic parts with the Rallis eigenvalues of RowTowerAndRallisIdentities §5.10, bounded below by hook products (8.8); together they give the
explicit height of the period pairing (8.9). The slope of the target is bounded through the lattices of integral cusp
forms on the unitary Shimura varieties of `U(W_j)` (ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §§8.11–8.19d), with the local terms of the glued target at the
twisted places (8.19e–8.20b) and the gluing lemma (8.21). In the division inequality (8.22) the large powers of `Ω`
cancel between the kernels and the step lattices, the Stirling terms cancel against the hooks (8.10), and one row of
length `a_τ` per top place and per lift survives. The maximal slope of the target is bounded by a slope test whose
finite-place terms are valuations of ratios of Hecke `L`-values, controlled by the twist selection of CongruenceModulesOfThetaLifts §7.8
through toric sums (ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §§8.19b–8.19d; 8.24a, 8.24).

In this layer, `La = log(a·rd_E)` (ThetaChainsOnDefiniteUnitaryGroups §2.1); `C` denotes positive constants that do not depend on `x` nor on anything
chosen at the scale `x`; they may depend on `ε` and on the constants fixed before `ε`, except that a
constant in an exponent of `x` (such as the `C` of `x^{C}·b`) depends only on the constants fixed before `ε`. The
exponent of the division error is `e_D := 1` (8.20, 8.22, 8.24). Heights of maps are `ht = mean_σ log ‖·‖²_σ` over the
embeddings `σ : 𝕃 → ℂ` (Conventions); since the metrics are compatible with complex conjugation, this is also the mean
over the infinite places of `𝕃`. Operator norms are taken for the metrics named in each statement.

The congruence lengths are bounded by CongruenceModulesOfThetaLifts §7.11 under its hypotheses: the twisting datum is good (CongruenceModulesOfThetaLifts §7.10a: every `ψ_𝔭` an
`ℓ^{−2}`-good twist at `𝔭` in the sense of CongruenceModulesOfThetaLifts §7.8 (2), here for a family of polynomial conditions, of the second kind of SelmerLengthBoundsAndLocalLifting §3.25b (2),
containing those of 8.19e (a) and (b); the tuples at `𝔭` and `c_𝕃(𝔭)` agree by ThetaChainsOnDefiniteUnitaryGroups §2.5), and the host has wild-kernel budget `κ_W`
(CongruenceModulesOfThetaLifts §7.11: every `Ш¹(E, ℓ, e)` (`ℓ` prime, `0 < e < t`) is finite and `V(E, t) ≤ κ_W·x^ε·B₀`; `κ_W = 1` when `V(E, t) ≤ b`), with the depth hypothesis of CongruenceModulesOfThetaLifts §7.10a (for every prime `ℓ ≥ 11` some `j ≥ 0` has
`(ℓ − 1)^j ≥ ℓ_A` and `2j + 2 ≤ L_th`, `L_th` the length of the thick set); the
multiplicity identity `d^Z_j(𝔭) = d^Z_j` of CongruenceModulesOfThetaLifts §7.5b rests on CongruenceModulesOfThetaLifts §7.5a. They enter through 8.20 (v) and are hypotheses of every target
of this layer whose bound uses the congruence lengths (8.20, 8.22, 8.24 (b)); the goodness of the twisting datum alone is used in
8.20b and 8.24a (c), through the definition of a good twist. The Weyl exponents of CongruenceModulesOfThetaLifts §7.15
are bounded per step by CongruenceModulesOfThetaLifts §7.16a (3); they enter through 8.20b. The structures `𝔼_{1,𝕃}`, `R_0`, `R` of RowTowerAndRallisIdentities §5.8 and 7.13 rest on the
hypotheses of RowTowerAndRallisIdentities §5.8 (among them `x ≥ x₀` and the size predicate `Size_□` of RowTowerAndRallisIdentities §5.8e), which every target of this layer that uses them carries
by reference (8.9, 8.20–8.22, 8.24a, 8.24). The targets that apply ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19b (8.19e (a), 8.24a, 8.24, and 8.20
through them) assume, as §8.19b does, that `d` is prime (`K = ℚ(√−d)`) and that `2` is ramified in `E`.

Some clauses of this layer are statements whose routes are not given, or not given in full, here: the hypotheses of the
index statement for the lattices of the chain (8.19e (c)); the generation inputs (8.20 (vii)) and the page conditions (P3),
(P5) for the weights of a run; the passage to geometrically irreducible components in 8.20 (o); step (3) of the depth table
at the orbits of odd conjugate type that do not alternate between `Φ` and `cΦ` (8.20a); one point of the route of 8.24a, the
proof of 8.24b (i) and two points of 8.24 (a). Through ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties the targets also rest on clauses of that roadmap whose routes are not given there,
among them the flag facts (L3), (L4) of the `𝔩`-torsion (ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.14b) and, on the deep covers of the steps, the carrying sections, the
sizes and the sup norms of integral forms (ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.18c (f)). All numbers attached to the flag bundles in ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §§8.15–8.19 (limit numbers, volumes, volume slopes)
are computed on the models of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.15 (a), built over the modified base models `Y_B(c)`.

The top period is the one of ThetaChainsOnDefiniteUnitaryGroups §3.9: `P̃(φ′, Υ) = ⟨Υ, res φ′⟩_{X^h}`, linear in the form `φ′` of level `m` (hence in the
column) and conjugate-linear in the row form `Υ`; a bound at a place `𝔭` uses the column at the same place.

### 8.1 The height of a map that factors through a chain

*Statement.* Let `𝕃` be a number field and let `S_0, …, S_m`, `V`, `𝒯` be
finite-dimensional `𝕃`-vector spaces carrying a positive definite Hermitian form at every embedding `σ : 𝕃 → ℂ`;
let `P : V → Q` be a surjection, `Q` carrying the quotient forms; let `K_j : S_{j−1} → S_j` (`1 ≤ j ≤ m`),
`Pt : S_m → V^∨` and a bijection `ι : Q → 𝒯` be `𝕃`-linear. Suppose `Q = ⊕_π Q_π` is a finite decomposition into
`𝕃`-subspaces such that, at every `σ`, `ι_σ^* ι_σ` acts on `Q_{π,σ}` by the scalar `κ(σ)·∏_{j=1}^m λ_j(π, σ)` with
`κ(σ) > 0` and `λ_j(π, σ) > 0`. If `B : S_0 → 𝒯^∨` satisfies `B(φ)(ι(P F)) = Pt(K_m ⋯ K_1 φ)(F)` for all `φ ∈ S_0`,
`F ∈ V`, and `B ≠ 0`, then at every `σ`

`log ‖B‖²_σ ≤ log ‖Pt‖²_σ + Σ_j log ‖K_j‖²_σ − log κ(σ) − min_π Σ_j log λ_j(π, σ)`,

and therefore `ht(B) ≤ ht(Pt) + Σ_j ht(K_j) − mean_σ log κ(σ) − mean_σ min_π Σ_j log λ_j(π, σ)`. Here `𝒯^∨` and `V^∨`
carry the dual forms. The same holds, with the same proof, when `V^∨` and `𝒯^∨` are replaced by the spaces of
`c`-semilinear functionals (`ℓ(ay) = c(a)ℓ(y)`) for an automorphism `c` of `𝕃`, the norm of such a functional at `σ` being
`sup_y |σ(ℓ(y))|/‖y‖_{σ∘c}`, and with `κ(σ∘c)`, `λ_j(π, σ∘c)` in place of `κ(σ)`, `λ_j(π, σ)` in the pointwise bound; `σ ↦ σ∘c`
permutes the embeddings, so the bound for `ht(B)` is unchanged.

*Route.* For `q ∈ Q` and any `F` with `P F = q`, `|B(φ)(ιq)| ≤ ‖Pt‖·∏_j ‖K_j‖·‖φ‖·‖F‖`; minimising over `F` gives
the quotient norm `‖q‖`. The operator `ι_σ^*ι_σ` is self-adjoint, so its eigenspaces for distinct eigenvalues are
orthogonal, and grouping the `Q_π` by eigenvalue gives `‖ιq‖² ≥ min_π κ∏_jλ_j(π)·‖q‖²`. Hence the dual norm of
`B(φ)` is at most `‖Pt‖∏_j‖K_j‖·‖φ‖·(min_π κ∏_jλ_j(π))^{−1/2}`; take logarithms and average over `σ`. For semilinear
functionals the same chain of inequalities holds with the norms of `F`, `q` and `ιq` taken at `σ∘c`.

*Check.* `m = 1`, `S_0 = S_1 = 𝕃` with the standard form and `K_1 = id`, `V = Q = 𝒯 = 𝕃²` with `P = id`, `Q_1, Q_2` the
coordinate lines, `ι` multiplying squared norms by `1` on `Q_1` and by `4` on `Q_2` (so `κ = 1`, `λ_1 = 1` on `Q_1` and `4` on
`Q_2`), `Pt : S_1 → V^∨` sending `1` to the first coordinate functional, so that `B(1)(ιF) = F_1`: then
`‖B‖² = 1 = ‖Pt‖²·‖K_1‖²/1`. With `max_π` in place of `min_π` the bound would read
`‖B‖² ≤ 1/4`, which is false.

*KNOWN* in kind (submultiplicativity of operator norms), *NEW* as packaged. *Needs:* SlopesOfHermitianVectorBundles
§1.3 (operator norms and heights of linear maps, quotient and dual metrics).

### 8.2 Taylor blocks in the Fock model

*Statement.* Let `ι` be a finite set partitioned as `ι = ⊔_{τ∈P} ι_τ`, `N = |ι|`, and let
`Th : ℂ^ι → ℂ` be entire with Taylor coefficients `c_e` (`e ∈ ℕ^ι`) and `|Th(u)| ≤ S·e^{|u|²/2}`.

(a) *Reproducing identity.* `∫_{ℂ^ι} Th(u)·ū^e·e^{−|u|²} du = π^N·e!·c_e` for every `e`.

(b) *Gaussian maximum.* For `y ≥ 0`, `sup_{s≥0} s^y e^{−s²/2} = exp(ph(y)/2)` (with `0⁰ = 1`). If `s_1, …, s_R ≥ 0` are
functions on `ℂ^ι` with `Σ_i s_i(u)² = |u|²` and `ν_i ≥ 0`, `n = Σ_i ν_i`, then
`π^{−N}∫_{ℂ^ι} ∏_i s_i^{ν_i}·e^{−|u|²/2} du ≤ e^{1/2}·(2n + 2)^N·exp(Σ_i ph(ν_i)/2)`.

(c) *Taylor blocks.* Let `R(ū) = Σ_e ū^e A_e` be a polynomial in the conjugate variables with values in a
finite-dimensional normed space, homogeneous of degree `n_τ` in the variables of `ι_τ`, with
`‖R(ū)‖ ≤ ∏_τ ∏_i s_{τ,i}(u_τ)^{ν_{τ,i}}`, where `s_{τ,i} ≥ 0`, `Σ_i s_{τ,i}(u_τ)² = |u_τ|²`, `Σ_i ν_{τ,i} = n_τ`; let
`λ_τ ∈ ℂ^×` with `|λ_τ|² = Ω_τ^{−1}`, and `n = Σ_τ n_τ`. Then

`‖Σ_e c_e·e!·(∏_{x∈ι} λ_{τ(x)}^{e_x})·A_e‖² ≤ S²·∏_τ Ω_τ^{−n_τ}·e·(2n + 2)^{2N}·exp(Σ_{τ,i} ph(ν_{τ,i}))`.

The left side is the block of Taylor coefficients of `Th` selected by `R` in the rescaled coordinates `z_τ = u_τ/λ_τ`.

*Route.* (a) Monomials are orthogonal for `e^{−|u|²}du` with `‖u^e‖² = π^N e!`; integrate on polydiscs and pass to the
limit by dominated convergence, which the growth bound allows. (b) The maximum is at `s = √y`. With
`θ = 1/(n + 1)`, `∏_i s_i^{ν_i} e^{−(1−θ)|u|²/2} ≤ (1 − θ)^{−n/2} exp(Σ ph(ν_i)/2) ≤ e^{1/2} exp(Σ ph(ν_i)/2)`, and
`π^{−N}∫ e^{−θ|u|²/2} = (2/θ)^N`. (c) By (a) the vector on the left is `π^{−N}∫ Th(u)e^{−|u|²}R(λ·ū) du`, where
`λ·ū` multiplies the conjugate variables of the block `ι_τ` by `λ_τ`; homogeneity gives `R(λ·ū) = ∏_τ λ_τ^{n_τ}R(ū)`, the
growth bound leaves the integral of (b), and squaring gives the claim.

*Check.* `N = 1`, `Th(u) = e^{u²/2}` (`S = 1`), `R(ū) = ū^{2n}` with `s_1(u) = |u|`, `ν_1 = 2n`: the left side is
`((2n)!/(2^n n!))²·Ω^{−2n} ∼ 2(2n/e)^{2n}Ω^{−2n}`, the right side `e(4n + 2)²(2n/e)^{2n}Ω^{−2n}`: the exponential factor
`exp(ph(2n))` is attained, so `ph` cannot be replaced by anything smaller.

*KNOWN* (Bargmann's reproducing formula), *NEW* in this form. *Needs:* Mathlib (Gaussian integrals on `ℂ^n`,
power series of entire functions, dominated convergence).

### 8.3 Pointwise bounds for theta functions

*Statement.* Let `Λ ⊂ ℂ^g` be a lattice with `|λ|² ≥ πh` for every `0 ≠ λ ∈ Λ` (`h > 0`), and
let `Th` be entire on `ℂ^g` such that `|Th(z)|²e^{−|z|²}` is `Λ`-periodic. Then for every `z ∈ ℂ^g`

`|Th(z)|²·e^{−|z|²} ≤ (C(1 + g/h))^g · ∫_{ℂ^g/Λ} |Th(u)|²·e^{−|u|²} du`,

with `C` absolute. Consequently, if `Th = Σ_i α_i Th_i` is a finite combination of such functions (for lattices with
the same bound `h`), `|Th(u)| ≤ S·e^{|u|²/2}` with `S = Σ_i |α_i|·(C(1+g/h))^{g/2}‖Th_i‖_{L²(ℂ^g/Λ_i, e^{−|u|²})}`.

*Route.* `G(u) = Th(u)·e^{−⟨u, z⟩ + |z|²/2}` is holomorphic with `|G(z)|² = |Th(z)|²e^{−|z|²}` and
`|G(u)|² = |Th(u)|²e^{−|u|²}e^{|u−z|²}`. The sub-mean-value inequality for `|G|²` on the ball of radius `ρ = √g` about
`z` gives `|Th(z)|²e^{−|z|²} ≤ e^{ρ²}vol(B_ρ)^{−1}∫_{B_ρ(z)}|Th|²e^{−|u|²}`; by periodicity the ball covers each point
of `ℂ^g/Λ` at most `#(Λ ∩ B_{2ρ}) ≤ (1 + 4ρ/√(πh))^{2g}` times (disjoint balls of radius `√(πh)/2` about lattice
points), and `e^{g}g!/(π g)^g ≤ C^g`.

*KNOWN* (sub-mean-value estimates for theta functions). *Needs:* Mathlib (mean-value inequality for subharmonic
functions, volumes of balls); SpecialFunctionsTheta Layer 7 (Riemann theta functions and their quasi-periodicity,
which satisfy the hypothesis).

### 8.4 The norm of a step operator

*Statement.* Fix a step `1 ≤ j ≤ m` and an embedding `σ : 𝕃 → ℂ`, and give the forms on
`U(X_{j−1})` and `U(X_j)` the Petersson forms of the Conventions. For `τ ∈ Φ` let `ν_{j,τ} = (ν_{j,τ,i})_i` be the row
lengths of the polynomial representation of `GL_{N_{j−1}}` through which `K_j` acts at `τ` (ThetaChainsOnDefiniteUnitaryGroups §3.4), `n_{j,τ} = Σ_i ν_{j,τ,i}`,
`|ν_j| := Σ_τ n_{j,τ}`, and `g_j = f·N_{j−1}N_j`. On the `σ`-conjugate of the CM abelian variety `A(L, L′)` of ThetaChainsOnDefiniteUnitaryGroups §3.1a, let
`z_τ` be the algebraic coordinates of ThetaChainsOnDefiniteUnitaryGroups §3.1a and put `u′ := √π·w`, `w` the Fock coordinates of ThetaChainsOnDefiniteUnitaryGroups §3.1a (in which `H_A` is the
standard form; so `u′_τ = √π·z_τ/√area(Λ_K^σ)`); `u′` is the coordinate in which `|Θ|²e^{−|u′|²}` is periodic for every
`Θ ∈ Th(L, L′)`. Let `Ω_{τ,σ} > 0` be defined by: `Ω_{τ,σ}^{−1}` is the squared Fock norm `π|x|²/area(Λ_K^σ)` of a generator
`x` of the `τ`-eigen-SUBmodule `ℓ_τ` of the integral tangent lattice `𝔞₀ ⊗_{𝒪_K} 𝒪_𝕃` of the variety (`𝔞₀` of ThetaChainsOnDefiniteUnitaryGroups §2.2(f),
`𝔞₀𝔞̄₀ = 𝔡_{E/K}^{−1}`; coordinates in which the lattice of the curve is `Λ_K`, `Δ(Λ_K) = 1`); equivalently `u′_τ = λ_{τ,σ}·z′_τ`,
`|λ_{τ,σ}|² = Ω_{τ,σ}^{−1}`, for the coordinate `z′_τ` with `z′_τ(x) = 1` (whose differential generates the `τ`-eigen-QUOTIENT of
the integral differentials). When `ℓ_τ` is not principal, only `mean_σ log Ω_{τ,σ}` is used, and it is twice the normalised
degree of the Hermitian line `(ℓ_τ, π|x|²/area(Λ_K^σ))`. For `E = K` and the curve `ℂ/Λ_K` this is `Ω_{τ,σ} = area(Λ_K^σ)/π`.
Let `Θ^σ_{𝒸,𝒸′}` be the `σ`-conjugate of the theta function `Θ_{𝒸,𝒸′}(ξ)` of ThetaChainsOnDefiniteUnitaryGroups §3.2 (a finite combination of Fock translates of
`Θ^{CM}_{L_𝒸,L′_{𝒸′}}`, ThetaChainsOnDefiniteUnitaryGroups §3.1d), `S_j(σ)` the least `S` with `|Θ^σ_{𝒸,𝒸′}(u′)| ≤ S·e^{|u′|²/2}` for all pairs of classes `(𝒸, 𝒸′)`, and
`h_{j−1}, h_j` the numbers of classes of the levels of ThetaChainsOnDefiniteUnitaryGroups §2.9 on `U(X_{j−1})`, `U(X_j)`. The kernel `k_j(𝒸, 𝒸′)` is read
through matrix coefficients: for unit vectors `v ∈ V_{Λ_{j−1}}`, `v′ ∈ V_{Λ_j}` (invariant forms of the Conventions), the
coefficient `⟨k_j(𝒸, 𝒸′)v, v′⟩` is the jet of the reading at the polynomial `u ↦ ⟨ρ(u)v, v′⟩` on `ℱ_j ≅ V_{Λ_{j−1}}^∨ ⊗ V_{Λ_j}`
(the identification by matrix coefficients of the invariant forms, which is the one of the defining formula of ThetaChainsOnDefiniteUnitaryGroups §3.2, not
the one that is isometric for the Fischer form). Then

`log ‖K_j‖²_σ ≤ Σ_{τ∈Φ} ( Σ_i ph(ν_{j,τ,i}) − n_{j,τ}·log Ω_{τ,σ} ) + E_j(σ)`,
`E_j(σ) := log(h_{j−1}h_j) + 2 log S_j(σ) + 1 + 2g_j·log(2|ν_j| + 2)`.

*Route.* By ThetaChainsOnDefiniteUnitaryGroups §3.2 the operator is `(K_jφ)(𝒸′) = Σ_𝒸 |Γ_𝒸|^{−1}ρ^ξ_j(t_𝒸)ρ′^ξ_j(t′_{𝒸′})·T(𝒸, 𝒸′)(φ(𝒸))` with character values of
absolute value `1` and `T(𝒸, 𝒸′)` the Taylor block of `Θ_{𝒸,𝒸′}(ξ)` selected by the matrix coefficients of the weight (ThetaChainsOnDefiniteUnitaryGroups §3.2
defines the step by jets, which is the matrix-coefficient identification). For unit
vectors, `|⟨ρ(u)v, v′⟩| ≤ ‖ρ(u)‖ = ∏_i s_i(u_τ)^{ν_{j,τ,i}}` at each `τ` (the singular values `s_i` of the
`N_j × N_{j−1}` matrix variable, by the singular value decomposition and unitarity of `ρ` on the unitary groups), which is
the domination hypothesis of 8.2 (c). 8.2 (c) bounds `‖T(𝒸, 𝒸′)‖²` by
`S_j(σ)²∏_τΩ_{τ,σ}^{−n_{j,τ}}e(2|ν_j| + 2)^{2g_j}exp(Σ ph)`. The Schur test for a kernel between class sets with weights
`|Γ_𝒸|^{−1} ≤ 1` gives `‖K_j‖² ≤ h_{j−1}h_j·max ‖T(𝒸, 𝒸′)‖²`.

*Check.* `N_{j−1} = N_j = 1`, one place, `ν = (n)`, `n` even: the matrix coefficient is `R(ū) = ū^n`; for
`Θ(u′) = e^{u′²/2}` (`S = 1`) the block is `c_n·n!·λ^n` with `|c_n·n!|² = (n!/(2^{n/2}(n/2)!))² ≈ √(2/(πn))·n!`, of the size
`exp(ph(n))` of the bound. The identification that is isometric for the Fischer form (unit vector `u′^n/√(n!)`) would
give a block of size `1`, and the hook products of 8.8 would then not be paid by the kernels.

*NEW* (the statement and its uniformity), *KNOWN* ingredients. *Needs:* 8.2, 8.3, ThetaChainsOnDefiniteUnitaryGroups §2.2, ThetaChainsOnDefiniteUnitaryGroups §2.9, ThetaChainsOnDefiniteUnitaryGroups §2.9a, ThetaChainsOnDefiniteUnitaryGroups §3.1, ThetaChainsOnDefiniteUnitaryGroups §3.1a, ThetaChainsOnDefiniteUnitaryGroups §3.1d, ThetaChainsOnDefiniteUnitaryGroups §3.2, ThetaChainsOnDefiniteUnitaryGroups §3.4.

### 8.5c The mean period of the step kernels

For the host `E ⊃ K`, the CM abelian varieties
of ThetaChainsOnDefiniteUnitaryGroups §3.1a and the coefficient field `𝕃` of ThetaChainsOnDefiniteUnitaryGroups §2.6: for every `τ ∈ Φ`,
`mean_σ log Ω_{τ,σ} = log Ω = log Ω_K − (1/[E:ℚ])·log N(𝔡_{E/K}) = log Ω_K − log(rd_E/√D)`, the mean over all
embeddings `σ : 𝕃 → ℂ` of the numbers `Ω_{τ,σ}` of 8.4, `𝔡_{E/K}` the relative different (`|d_E| = N(𝔡_{E/K})·D^{[E:K]}`).

*Route.* ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.5 (c) for the curve `ℂ/Λ_K` of 8.4 (the lattice `Λ_K` of ThetaChainsOnDefiniteUnitaryGroups §3.1a) gives `log Ω_K` for the mean of `log(area(Λ_K^σ)/π)`. The transport term comes
from the lattice of 8.4: the `τ`-eigen-submodule of `𝔞₀ ⊗_{𝒪_K} 𝒪_𝕃` (`𝔞₀` of ThetaChainsOnDefiniteUnitaryGroups §2.2(f), `𝔞₀𝔞̄₀ = 𝔡_{E/K}^{−1}`) is
`ℓ_τ = τ(𝔞₀𝔡_{E/K})𝒪_𝕃`, the relative different times the eigen-quotient `τ(𝔞₀)𝒪_𝕃`; its norm is
`N(𝔞₀𝔡_{E/K}) = N(𝔡_{E/K})^{1/2}`, which contributes `−(2/[E:ℚ])·log N(𝔞₀𝔡_{E/K}) = −(1/[E:ℚ])·log N(𝔡_{E/K})`. With the
eigen-quotient the sign of the transport term would be `+`.

*Check.* For `E = K` there is no transport: `𝔡_{E/K} = 𝒪_K`, `ℓ_τ = 𝔞₀ = 𝒪_K` and the statement is `log Ω = log Ω_K`.

*NEW* (the transport). *Needs:* 8.4, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.5; ThetaChainsOnDefiniteUnitaryGroups §2.2, ThetaChainsOnDefiniteUnitaryGroups §2.6, ThetaChainsOnDefiniteUnitaryGroups §3.1a.

### 8.6 The height of a step operator

*Statement.* For every step `j`,

`mean_σ log ‖K_j‖²_σ ≤ Σ_{τ∈Φ} ( Σ_i ph(ν_{j,τ,i}) − n_{j,τ}·log Ω ) + C·f·m²·N_m²·(La + log T(u))`,

the mean over all embeddings `σ : 𝕃 → ℂ`, for the chain data of the word `u` (ThetaChainsOnDefiniteUnitaryGroups §3.8), under the size conditions of ThetaChainsOnDefiniteUnitaryGroups §2.1,
`SizeG` (ThetaChainsOnDefiniteUnitaryGroups §2.7: `g₀, g₁ ≤ b^{C}` with `C` fixed before `ε`, which gives `log g₀, log g₁ ≤ C·La`) and `|(L′/L)(1, χ_K)| ≤ x^ε`. In particular, under `SizeT_u` (ThetaChainsOnDefiniteUnitaryGroups §2.8: `log T(u) ≤ C_T·m·x^ε`), and since
`La ≥ x^ε` (ThetaChainsOnDefiniteUnitaryGroups §2.1), the error is at most `C·f·m³·N_m²·La`.

*Route.* Average 8.4 over `σ`; by 8.5c `mean_σ Σ_τ n_{j,τ} log Ω_{τ,σ} = Σ_τ n_{j,τ}·log Ω`. The remaining terms of
`mean_σ E_j(σ)`: the class numbers of the levels of ThetaChainsOnDefiniteUnitaryGroups §2.9 are at most the masses times the indices of the level
groups at `g₀, g₁` and at the places above `T(u)` (HermitianFormsAndLattices §§5.5, 6.3), so
`log h_i ≤ C·f·N_m²·(La + log T(u))`; the Gaussian-growth constants `S_j(σ)` are bounded by 8.3: the mean of
`|Θ^{CM}_{L,L′}|²e^{−πH_A}` is the same for all pairs of the genus, invariant under Fock translations, with mean logarithm over
the conjugates at most `C·f·N_{j−1}N_j·(La + |(L′/L)(1, χ_K)|) ≤ 2C·f·N_{j−1}N_j·La` (ThetaChainsOnDefiniteUnitaryGroups §3.1d (c), and `|(L′/L)(1, χ_K)| ≤ x^ε ≤ La`), the lattices of the CM abelian varieties have minimum at least `π/v`,
`v = rd_E/2`, and the coefficients of the finite combinations of translates of ThetaChainsOnDefiniteUnitaryGroups §3.2 (the admissible finite data, fixed in
SeesawForThetaChains §6.5, SeesawForThetaChains §6.8 and LocalGainOfThetaChains §4.16) at the type primes and the level prime have logarithmic size `≤ C·f·m²·N_m²·log(g₀g₁T(u))`; this gives
`mean_σ 2 log S_j(σ) ≤ C·f·m²·N_m²·(La + log T(u))`; and `g_j log(2|ν_j| + 2) ≤ C·f·N_m²·La` since `|ν_j| ≤ C f N_m a`.

*NEW*. *Needs:* 8.4, 8.5c, 8.3, ThetaChainsOnDefiniteUnitaryGroups §2.1, ThetaChainsOnDefiniteUnitaryGroups §2.7, ThetaChainsOnDefiniteUnitaryGroups §2.8, ThetaChainsOnDefiniteUnitaryGroups §2.9, ThetaChainsOnDefiniteUnitaryGroups §2.9a, ThetaChainsOnDefiniteUnitaryGroups §2.9b, ThetaChainsOnDefiniteUnitaryGroups §3.1a, ThetaChainsOnDefiniteUnitaryGroups §3.1d, ThetaChainsOnDefiniteUnitaryGroups §3.2; HermitianFormsAndLattices §§5.5, 6.3.

### 8.7 The scaled branching map and the top period

*Statement.* (a) *Scaled branching.* Let `K′` be a field with an involution and
`s : K′ → ℂ` an embedding compatible with it. For `τ` in a finite set let `λ_τ` (of `GL_{n+1}`) and `σ_τ` (of `GL_n`) be
dominant weights that interlace and have the same determinant shift, `n_τ := |λ_τ| − |σ_τ|` (`|λ| = Σ_i λ_i`), `G′_τ`
Hermitian `n × n` matrices over `K′`, positive definite at `s`, and `g_τ, t_τ ∈ K′` with `|s(t_τ)|²·s(g_τ) = T_br > 0` for all
`τ`. Give `V_{λ_τ}` and `V_{σ_τ}` the Hermitian forms induced by `G′_τ ⊕ (g_τ)` and by `G′_τ` on the standard
representations (in the polynomial model `⟨x, y⟩_G = B(x̄, ρ(G)y)`, `B` the invariant pairing, so that a vector
homogeneous of degree `n` in the last coordinate has squared norm proportional to `g_τ^n`), the invariant pairing `B` being
normalised once (highest-weight vector of norm `1` for `G′ = 1`, `g = 1`) and then transported, with no further rescaling
depending on `G′_τ` or `g_τ` (Conventions; any rescaling by positive constants depending only on the weights changes `β` below
and nothing else; a rescaling of the highest-weight vector to norm `1` for the transported form would make the formula
below false: for `λ = (1, 0)`, `σ = (0)`, `G′ = (a)`, `g = t = 1` the squared norm of the projection would be `a`). Let `br := ∏_τ t_τ^{−n_τ}·br⁰`, `br⁰ = ⊗_τ br⁰_τ` the `∏_τGL_n`-equivariant map that
takes the component of degree `n_τ` in the last coordinate and projects it to `V_{σ_τ}`, normalised once. Then `br∘br^*` is
the scalar `T_br^{−Σ_τ n_τ}·∏_τ β(λ_τ, σ_τ)` on `⊗_τ V_{σ_τ}`, the squared operator norm of `br` is this number and is attained,
and `β(λ, σ) > 0` depends only on `(λ, σ)` and the normalisation of `br⁰` (it is the value for `G′ = 1`, `g = 1`, `t = 1`: the
SQUARE of the operator norm of `br⁰`). In the chain `br⁰_τ = br_τ` of ThetaChainsOnDefiniteUnitaryGroups §3.9 (the adjoint of the integral embedding `io_τ` with
the integer `c_{Br,τ}`), and `β(λ_τ, σ_τ)` is the number `β_τ` of ThetaChainsOnDefiniteUnitaryGroups §3.9 (c), the square of the operator norm of `br_τ`; since
`io_τ(v_{σ(τ)}) = c_{Br,τ}·ξ_τ` and `io_τ` is a multiple of an isometry (`V_{σ(τ)}` is irreducible),
`β_τ = c_{Br,τ}²·‖ξ_τ‖²/‖v_{σ(τ)}‖²` for the forms of ThetaChainsOnDefiniteUnitaryGroups §3.1: it contains the square of the branching integer. The chain
(ThetaChainsOnDefiniteUnitaryGroups §3.9) is the instance `g_τ = T(u)`, `t_τ = 1` in the coordinates of the class lattice `L_𝒸 ⊕ 𝒪_E z_u` of `𝒸̃` (`z_u = π_u e_{N_m}`,
`⟨z_u, z_u⟩ = T(u)`); the same map in the standard coordinates of `e_{N_m}` is the instance `g_τ = 1`, `t_τ = τ(π̄_u)`, with
`|s(τ(π_u))|² = T(u)` at every embedding (one value of `T_br` for all `τ ∈ Φ`, since `Φ` is induced from `K`).

(b) *The top period.* For the word `u` let `res` be the restriction of ThetaChainsOnDefiniteUnitaryGroups §3.9 (the value at the class `𝒸̃` of level `m`,
followed by `⊗_τ br_τ`), and `Pt(φ′) := P̃(φ′, ·) = ⟨·, res φ′⟩_{X^h}`, a conjugate-linear functional on the forms on `U(X^h)`
(ThetaChainsOnDefiniteUnitaryGroups §3.9) of norm `‖Pt(φ′)‖_σ = ‖res φ′‖_σ` at every embedding; put `A_top := Σ_{τ∈Φ_top} a_τ`. Then, with `a⁻_τ` the negative bottom
entry of ThetaChainsOnDefiniteUnitaryGroups §2.3,

`ht(res) ≤ −A_top·log T(u) + (Σ_{τ∈Φ_top}(Sc + mϑ + a⁻_τ + N_m) + Σ_{τ∈Φ∖Φ_top}(2Sc + mϑ + N_m))·log T(u) + C·N_m²·(Σ_{τ∈Φ_top} a⁻_τ + f·(mϑ + Sc + 1))·La`,

and under `SizeT_u` (ThetaChainsOnDefiniteUnitaryGroups §2.8) the middle term is absorbed:

`ht(res) ≤ t_u := −A_top·log T(u) + C₂·N_m²·(Σ_{τ∈Φ_top} a⁻_τ + f·(mϑ + Sc + 1))·La`,

which defines the *top term* `t_u` (`C₂` the constant of this bound). The factor `T(u)^{−n_τ}` is the archimedean side of the
coordinate `⟨z_u, ·⟩` (ThetaChainsOnDefiniteUnitaryGroups §3.9 (c)): `res` is integral at every finite place, and the costs of the level prime are those of the
column steps (LocalGainOfThetaChains §4.9f (e)).

*Route.* (a) Let `tr⁰ : V_σ → V_λ` be the transpose of `br⁰` for the invariant bilinear pairings. `br⁰∘tr⁰` is a scalar,
because `V_σ` is spanned by the orbit of its highest-weight vector and both maps are equivariant for the block matrices
`diag(h, 1)` (the branching `GL_{n+1} ↓ GL_n` is multiplicity free). The block `diag(G′, g)` acts on the image of `tr⁰`
through the degree `n_τ` in the last coordinate, so the adjoint of `br` for the induced forms is
`conj(∏_τ(t_τg_τ)^{−n_τ})·tr⁰` and `br∘br^*` is the scalar `∏_τ(|t_τ|²g_τ)^{−n_τ}β(λ_τ, σ_τ)`; if `P∘P^* = k` then
`‖Pf‖² ≤ k‖f‖²` (expand `‖kf − P^*Pf‖² ≥ 0`), with equality at `f = P^*(v_σ)`. (b) ThetaChainsOnDefiniteUnitaryGroups §3.9 (c) (the case `g_τ = T(u)`, `t_τ = 1`
of (a), Cauchy–Schwarz over the classes of `U(X^h)` with the weights `|Γ_𝒸|^{−1}` and injectivity of `𝒸 ↦ 𝒸̃`, ThetaChainsOnDefiniteUnitaryGroups §3.9 (a)) gives
`log‖res‖²_σ ≤ −(Σ_τ n_τ)·log T(u) + Σ_τ log β_τ` at every embedding. By interlacing, `n_τ = Λ_{m,0}(τ) − D₀(τ)` (ThetaChainsOnDefiniteUnitaryGroups §3.9),
`D₀(τ) ≤ Sc + mϑ + [τ ∈ Φ_top]·a⁻_τ`; the first entry of `Λ_m(τ)` is `u_0(τ) − (N_m − 1)/2` (ThetaChainsOnDefiniteUnitaryGroups §2.3), which is `≥ a_τ − N_m` at a
top place and `≥ −Sc − N_m` elsewhere, so `−n_τ ≤ 2Sc + mϑ + N_m` off the tops (`n_τ` may be negative there).
`β_τ = c_{Br,τ}²·‖ξ_τ‖²/‖v_{σ(τ)}‖²` (a). By its definition in ThetaChainsOnDefiniteUnitaryGroups §3.9, `c_{Br,τ}` is a product of at most `N_m²·D₀(τ)` integers
(`N_m − 1` values of `j` for each of the at most `(N_m − 1)·D₀(τ)` pairs `(i, v)`, `|R_i| ≤ D₀(τ) + 1`), each of absolute value
less than the *spread* `sp(τ) := Λ_{m,0}(τ) − Λ_{m,N_m−1}(τ) + N_m` (without the `+N_m` this fails: for `N = 6`, `λ = (1⁵, 0)`,
`σ = (1⁵)` the integer is `−120`); the ratio `‖ξ_τ‖²/‖v_{σ(τ)}‖²` is `⟨ξ_τ, ξ_τ⟩ ≤ dim V_{Λ_m(τ)}` (ThetaChainsOnDefiniteUnitaryGroups §3.9: `br_τ∘io_τ = c_{Br,τ}²·⟨ξ_τ, ξ_τ⟩`
exactly; IntegralWeylModulesOfGeneralLinearGroups §1.1), the Weyl product of `Λ_m(τ)`. So
`log β_τ ≤ C·N_m²·(D₀(τ) + 1)·log sp(τ)`; when `Λ_{m,0}(τ) − Λ_{m,N_m−1}(τ) ≤ 2a`, `log sp(τ) ≤ log(2a + N_m) ≤ C·La` (ThetaChainsOnDefiniteUnitaryGroups §2.1:
`N_m = k + m(t + 1)` and `t ≤ x^{C_t}`), and `Σ_τ(D₀(τ) + 1) ≤ Σ_{τ∈Φ_top} a⁻_τ + f·(Sc + mϑ + 1)`, which gives the last term.
Under `SizeT_u`, `log T(u) ≤ C_T·m·x^ε ≤ C_T·m·La` (ThetaChainsOnDefiniteUnitaryGroups §2.1), and `m ≤ N_m`, so each `(Sc + mϑ + a⁻_τ + N_m)·log T(u)` and each
`(2Sc + mϑ + N_m)·log T(u)` is at most a constant times `N_m²·(a⁻_τ + mϑ + Sc + 1)·La`.

*Check.* `n = 0`, `λ = (a)`, `σ = ∅` (one place): `br` takes the coefficient of `z^a` and multiplies it by `t^{−a}`; since
`‖z^a‖² = β^{−1}g^a`, the squared norm of `br` is `β·(|t|²g)^{−a} = β·T_br^{−a}`. With forms for which `‖z^a‖² ∝ g^{−a}` the
exponent of `g` would change sign and the instance `g = T_br`, `t = 1` would give `T_br^{+a}`.

*NEW* (exact form). *Needs:* ThetaChainsOnDefiniteUnitaryGroups §2.1, ThetaChainsOnDefiniteUnitaryGroups §2.3, ThetaChainsOnDefiniteUnitaryGroups §2.3b, ThetaChainsOnDefiniteUnitaryGroups §2.8, ThetaChainsOnDefiniteUnitaryGroups §3.9; IntegralWeylModulesOfGeneralLinearGroups §1.1 (integral branching and the bound
for `c_{Br,τ}`); ClassicalGroups §5.1 (Weyl dimension), ClassicalGroups §6.1 (branching
`GL_n ↓ GL_{n−1}`, Zhelobenko, Gelfand–Tsetlin); AutomorphicFormsOnReductiveGroups §§7.4–7.6 and
DiscreteSeriesCoefficientsAndAutomorphicMetrics §§7.5a, 7.5b (class-set integration).

### 8.8 Rallis eigenvalues and hook products

*Statement.* For a step `j`, a place `τ ∈ Φ` and the Harish-Chandra parameter of
the row discrete series of `U(W_j)` at `τ` (ThetaChainsOnDefiniteUnitaryGroups §2.3), with positive block `s^+(τ)` (length `p_j = k + j − 1`, its first
`k − 1` entries `v(τ)`) and negative block `s^−(τ)` (length `q_j = m − j`), let `a⁺_{j,τ}` be the positive diagram of step `j`
at `τ` of LocalGainOfThetaChains §4.9f (d) (rows `a⁺_{j,τ,i} = s⁺_i(τ) + w_j(τ) − (p_j − 1 − i) − (t + 1)/2`, integers `≥ 1`, `0 ≤ i < p_j`) and `H^+_{j,τ}` its
hook product. Let `A_g, A_R` be absolute constants
(fixed before `ε`). Suppose `0 < w_j(τ) ≤ 2b`, `0 ≤ v_l(τ) ≤ b` for the entries of `v(τ)`, `|e′_l(τ) − w_j(τ)| ≤ b`, and
`g₀, g₁ ≥ (kb)^{A_g}`. Let `λ_j(ξ, 𝔥, σ)` be the eigenvalue of `θ_jθ_j^*` (RowTowerAndRallisIdentities §5.7) on the `𝔥`-part, at the embedding `σ`, for
the Petersson form of RowTowerAndRallisIdentities §5.1 on the forms of `U(W_j)` (the form for which RowTowerAndRallisIdentities §5.7 computes `θ_jθ_j^*`). Then:

(a) for every tuple `ξ` of ThetaChainsOnDefiniteUnitaryGroups §2.5 whose twist places lie above primes not dividing `f_E·d·g₀g₁·T(u)`, every embedding `σ` of `𝕃` over `K` and every Hecke eigensystem `𝔥` with nonzero part, `λ_j(ξ, 𝔥, σ) > 0` and

`log λ_j(ξ, 𝔥, σ) ≥ Σ_{τ∈Φ} log H^+_{j,τ} − A_R·f·(r + t)²·log(b·rd_E·g₀g₁·(r + t))`;

(b) for the base tuple, at every infinite place `v` of `𝕃` the rational model lift multiplies the form of the coordinates
by `λ_j(1, 𝔥, v)` on the `𝔥`-part (RowTowerAndRallisIdentities §5.11 (b), RowTowerAndRallisIdentities §5.12), and the same lower bound holds: the two embeddings of `v` give complex
conjugate forms (they differ by complex conjugation, which moves `K`), and at the one over `K` the lift is the adelic lift
of the conjugate data.

*Route.* (a) The exact value of RowTowerAndRallisIdentities §5.7: `λ_j = a_j·L^{S(ξ)}((t+1)/2, B_𝔥 × μ_j(ξ)^{−1})` with
`a_j = |H|·d_K(j)·dim 𝒲_j·‖Δ_j‖²_Fock·∏_τ d(D_{W_j,τ})^{−1}·mass(V_j)/∏_{n=t+1}^{r+t}L(n, η^n)` (RowTowerAndRallisIdentities §5.7 (ii), with the factor `|H|`
of RowTowerAndRallisIdentities §5.7 (ii′) at the level `(H, χ_H)`; `d_K(j)` the product of the dimensions of the lowest `K`-types). The Fischer norm of the
minor-product vector `Δ_j` is at least the hook product `∏_τ H^+_{j,τ}` of the positive diagrams (IntegralWeylModulesOfGeneralLinearGroups §3.1 for the block of the
positive diagram; the Fischer form is multiplicative over the places `τ` and over the two blocks, which use disjoint sets
of variables, and the factor of the negative block is a Fischer norm of a product of minors with integer coefficients,
at least `1`). Every other factor is at least
`exp(−A_R f(r+t)²log(b·rd_E·g₀g₁(r+t)))` in total: `|H|, d_K(j), dim 𝒲_j ≥ 1`; the mass of the standard lattice of `V_j`
by its closed form (HermitianFormsAndLattices §6.3), at least `1/(w_E^{r+t}·(r+t)!)`; the inverse formal degrees by
Harish-Chandra's formula, the parameters being bounded by `2b`; the partial `L`-value is an absolutely convergent Euler
product close to `1`, the Satake parameters being bounded by `q_w^{(r−1)/2−(t+1)/2}` and `t > r + 1`, and so is
`∏_n L(n, η^n)`; the level index and the norm of the level vector at the type primes cost at most a power of `g₀g₁`.
(b) For `v ≠ v₀` the scalar at the embedding over `K` under `v` is that of the conjugate data, by the conjugation of
rational lifts (RowTowerAndRallisIdentities §5.11 (b)), and (a) applies to the conjugate data. (If the eigenvalue is computed for the norm
`∫|F(v)|²` of one unit vector of the lowest `K`-type instead, it changes by `∏_τ dim τ_τ` (RowTowerAndRallisIdentities §5.1 (2)), whose logarithm is
at most `C·f·r²·log(b·r)`.)

*Check.* `g₀, g₁ ≥ (kb)^8` and `A_R = 8` are the values of one construction. The Fischer norm of `Δ_j` is the hook
product, not the product of the row factorials (IntegralWeylModulesOfGeneralLinearGroups §3.1, Check).

*NEW* (bound), *KNOWN* ingredients (the Rallis inner product formula; Harish-Chandra's formal degrees). *Needs:* LocalGainOfThetaChains §4.9f, IntegralWeylModulesOfGeneralLinearGroups §3.1;
RowTowerAndRallisIdentities §5.1, RowTowerAndRallisIdentities §5.7, RowTowerAndRallisIdentities §5.11; HermitianFormsAndLattices §6.3; DiscreteSeriesCoefficientsAndAutomorphicMetrics §8.3 (the formal degree of a discrete series).

### 8.9 The height of the period pairing

*Statement.* For a word `u` define the *explicit height*

`h_u := t_u + Σ_{j=1}^m ( Σ_{τ∈Φ} Kt_{j,τ}(u) + C₁·f·m³·N_m²·La ) − Σ_{j=1}^m ( Σ_{τ∈Φ} log H^+_{j,τ} − A_R·f(r + t)²·log(b·rd_E·g₀g₁(r + t)) ) − log 𝔫 + log|P_1|`,

where the *kernel term* is `Kt_{j,τ}(u) := Σ_i ph(ν_{j,τ,i}) − (Σ_i ν_{j,τ,i})·log Ω`, the *top term* `t_u` is that of 8.7 (b),
`C₁` the constant of 8.6 (in the form under `SizeT_u`), `A_R` that of 8.8, and `𝔫 > 0` the descent constant of RowTowerAndRallisIdentities §5.10 (one
number, the same at every embedding). (`h_u` is a number attached to the word; it is defined here and nowhere earlier.
Besides `−A_top·log T(u)` in `t_u`, the word enters `h_u` only through the kernel terms.) The rows `𝔼_0` and
`𝔼 = 𝔼_1` carry, at every embedding `σ`, the metric of RowTowerAndRallisIdentities §5.12 divided by its factor `|H|` (`H = P_0`, resp. `P_1`; at `σ₀` the
Petersson metric divided by `|H|`); for this metric `ι_1^*ι_1 = 𝔫·∏_jλ_j(1, 𝔥, σ)` on the `𝔥`-part of `Q_1` with the form
`X_1^σ` of RowTowerAndRallisIdentities §5.12 (the class-sum product divided by `|H|`), at every `σ`, hence `(𝔫/|P_1|)·∏_jλ_j(1, 𝔥, σ)` for the class-sum
product itself; `R^∨`, `R_0^∨` (the `c_𝕃`-semilinear functionals integral on `R`, `R_0`) carry the dual metrics (7.13): at `σ` the norm dual
to the metric at `σ̃ = conj∘σ∘c_𝕃`, which is the norm of 8.1 for semilinear functionals at `σ` (the metrics being compatible with
complex conjugation, `‖y‖_{σ̃} = ‖y‖_{σ∘c_𝕃}`). Under `SizeT_u` (ThetaChainsOnDefiniteUnitaryGroups §2.8), the hypotheses of 8.6 (the size conditions of
ThetaChainsOnDefiniteUnitaryGroups §2.1, `SizeG` of ThetaChainsOnDefiniteUnitaryGroups §2.7 and `|(L′/L)(1, χ_K)| ≤ x^ε`) and of 8.8 at every step and place,
the hypotheses of SeesawForThetaChains §6.14 (among them that the Bessel–Poincaré series of `u` is nonzero on the new forms
`M_u`), and those of RowTowerAndRallisIdentities §5.8b for the grid of the chain and a scale `x ≥ x₀` with the size predicate
`Size_□` of RowTowerAndRallisIdentities §5.8e (on which, with the other hypotheses of RowTowerAndRallisIdentities §5.8 that
this layer carries by reference, SeesawForThetaChains §6.15 and 7.13 rest), if `B_u ≠ 0` then `ht(B_u) ≤ h_u` for
the Petersson metric of ThetaChainsOnDefiniteUnitaryGroups §3.8 on `M_u` and this metric on `R^∨`.

*Route.* By SeesawForThetaChains §6.1 and SeesawForThetaChains §6.14, `B_u(φ)(ι_1 Υ) = P̃_1(col φ, Υ) = Pt(K_m ⋯ K_1 φ)(Υ)` on `ℋ^{rt}_1` (with the class-sum product), and
by RowTowerAndRallisIdentities §5.12 with the metric above `ι_1^*ι_1` is the scalar `(𝔫/|P_1|)∏_jλ_j(1, 𝔥, σ)` on the `𝔥`-part, positive at every `σ`
(RowTowerAndRallisIdentities §5.11). The period is linear in the column and conjugate-linear in the row form (ThetaChainsOnDefiniteUnitaryGroups §3.9), so `B_u` is `𝕃`-linear and takes
values in the `c_𝕃`-semilinear functionals. Apply 8.1 in its form for semilinear functionals (`c = c_𝕃`) with these `K_j`,
`Pt` of 8.7 (b) and `ι = ι_1` restricted to `Q_1`; then 8.6 for `ht(K_j)`, 8.7 (b) for `ht(Pt) = ht(res) ≤ t_u` and 8.8 (b) for
`min_𝔥 Σ_j log λ_j(1, 𝔥, σ)` at every embedding (the base tuple). The size of the seesaw scalar `a_u` of SeesawForThetaChains §6.14 does not
enter.

*NEW*. *Needs:* 8.1, 8.6, 8.7, 8.8, ThetaChainsOnDefiniteUnitaryGroups §2.1, ThetaChainsOnDefiniteUnitaryGroups §2.7, ThetaChainsOnDefiniteUnitaryGroups §2.8, ThetaChainsOnDefiniteUnitaryGroups §3.9, RowTowerAndRallisIdentities §5.10, RowTowerAndRallisIdentities §5.11, RowTowerAndRallisIdentities §5.12, SeesawForThetaChains §6.1, SeesawForThetaChains §6.14, SeesawForThetaChains §6.15, 7.13.

### 8.10 Stirling terms against hook products

*Statement.* (a) For every Young diagram `μ`, `∏_i μ_i! ≤ H(μ)`, the product of its hook
lengths; hence `log H(μ) ≥ Σ_i ph(μ_i)`.

(b) Let the parameters of ThetaChainsOnDefiniteUnitaryGroups §2.3 interlace (`u_0 > v_0 > u_1 > ⋯ > v_{k−2} > u_{k−1}`, indices from `0`), the word
`δ ∈ {0,1}^{k−2}` giving the inner entries `u_i = v_{i−1} − ½ − δ_{i−1}Δ_w` (`1 ≤ i ≤ k − 2`, `Δ_w` the letter step) and,
off the top places, `u_{k−1} = v_{k−2} − ½`. Then for every step `j` and place `τ`, with `κ_j = (k + (2j − 1)(t + 1))/2`
and `λ_i(τ) = u_i(τ) − (k−1)/2 + i` the level-`0` highest weight, the kernel rows of 8.4 are
`ν_{j,τ,i} = λ_i(τ) + w_j(τ) − κ_j` for the `k` rows from level `0` and `w_j(τ) − w_{j′}(τ) − (j − j′)(t + 1) ≥ 0` for the
`t + 1` rows created at a step `j′ < j`; and every kernel row except the first is dominated by a hook row of 8.8: with
the rows `a⁺_{j,τ,n}` of the positive diagram of LocalGainOfThetaChains §4.9f (d),
`ν_{j,τ,i} = a⁺_{j,τ,i−1} − (j − 1)t − δ_{i−1}Δ_w` for `1 ≤ i ≤ k − 2` and `ν_{j,τ,k−1} ≤ a⁺_{j,τ,k−2} − (j − 1)t` (with
equality off the top places), where `s^+_n(τ) = v_n(τ)` for `n ≤ k − 2`.

(c) (*The ledger at one place.*) `Σ_i ph(ν_{j,τ,i}) − log H^+_{j,τ} ≤ [τ ∈ Φ_top]·ph(a_τ) + eE_{j,τ}`, with
`eE_{j,τ} := C·(w_j(τ) + Sc + N_m² + m(t + 1)ϑ)·La`. The unpaid row is the first: `a_τ + w_j(τ) − κ_j` at a top place,
at most `w_j(τ) + C·Sc` elsewhere.

(d) (*The sum of the rows.*) `Σ_i ν_{j,τ,i} = [τ ∈ Φ_top]·a_τ + k·w_j(τ) + δ_{j,τ}` with
`|δ_{j,τ}| ≤ C·(w_j(τ) + k(N_m + Sc) + m(t + 1)ϑ + [τ ∈ Φ_top]·k·b′)`.

*Route.* (a) The hooks in row `i` are at least `μ_i, μ_i − 1, …, 1`, and `log n! ≥ ph(n)`. (b) Compare the kernel rows
of ThetaChainsOnDefiniteUnitaryGroups §3.4 with the hook rows of 8.8 entry by entry, using the interlacing and the shape of the words (ThetaChainsOnDefiniteUnitaryGroups §2.3). (c) For
integers `0 ≤ ν ≤ a`, `ph(ν) ≤ log ν! ≤ log a!` (`ph(n) ≤ log n!` for every integer `n ≥ 0`, with `ph(0) = 0`), and the
hooks of row `i − 1` of the diagram `a⁺_{j,τ}` multiply to at least `(a⁺_{j,τ,i−1})!` (a); so (b) leaves only `ph` of the first
row and of the `(j − 1)(t + 1)` block rows (each at most `ϑ + 1`, the width of the window of the step weights at `τ`); at a
top place `ph(a_τ + w − κ_j) ≤ ph(a_τ) + w·log(a_τ + w)`. (d) Sum the rows of (b); `a⁻_τ`, the cloud, `kκ_j` and the block
rows go into `δ_{j,τ}`.

*Check.* Off the tops the per-place error is `w_j(τ)·La`, so `Σ_jΣ_τ eE_{j,τ} = O(f·m·b·La)`; at a top place an error of
size `a_τ` in (c) would add `m·a_τ` per top place, above the budget of the chain. `ph` is not monotone on `[0, 1]`
(`ph(0) = 0 > ph(1) = −1`), which is why (c) compares through `log ν!`.

*NEW* (elementary; the hook-length formula of Frame, Robinson and Thrall). *Needs:* 8.4, 8.8; SchurWeyl Layer 5 (hook
lengths); ThetaChainsOnDefiniteUnitaryGroups §2.3, ThetaChainsOnDefiniteUnitaryGroups §3.4, LocalGainOfThetaChains §4.9f, IntegralWeylModulesOfGeneralLinearGroups §3.1.

### 8.19e The theta conditions of the twist selection are polynomial conditions

Let `ℓ` be a prime under a twisted place, not a type prime, `δ_ℓ` its auxiliary character (ThetaChainsOnDefiniteUnitaryGroups §2.5), and use the twisting
places and characters of CongruenceModulesOfThetaLifts §7.8: pairs `{𝔮, c𝔮}` of places of degree one over `ℚ` above places of `F` split in `E`, that split
completely in the field `𝒢_M` of CongruenceModulesOfThetaLifts §7.8 (2), with characters `d_𝔮` of order `ℓ^M` ramified at the pair, and for roots of unity
`u = (u_𝔮)_𝔮` of order dividing `ℓ^M` the twist `ψ_u := ∏_𝔮 u_𝔮^{d_𝔮}`. Polynomial conditions are those of CongruenceModulesOfThetaLifts §7.8 (2), of the second kind of SelmerLengthBoundsAndLocalLifting §3.25b (2) (a rule attaching to
every family, at every level `M`, a polynomial `f ∈ O[X_𝔮]` with `f ≡ Dd·g` modulo the ideal generated by the second-half variables and
the `(1 + X_𝔮)^{ℓ^M} − 1` of the first-half ones, `v(g(0)) ≤ v₀`, and `Dd ≡ w·∏_{𝔮 first half}X_𝔮^{n_𝔮}` modulo the maximal ideal and the
`X_𝔮^{ℓ^M}`, with `w(0) ≠ 0` and every `n_𝔮 ≤ n_max`; `v₀` the level, `n_max` the exponent bound); the product of two such rules is one,
with the sum of the levels and of the exponent bounds.

(a) *Theta values.* For a twisting datum with sign `s = +1` (ThetaChainsOnDefiniteUnitaryGroups §2.5), every square `(i, j)` of the
grid of RowTowerAndRallisIdentities §5.8a, with Hecke character `ν_1 = μ_{j+1}/χ_{m−i}` for the base
tuple, every integer `1 ≤ s ≤ h_sq(i, j)` (half the sum of the two ranks of the square, RowTowerAndRallisIdentities §5.8d), and `χ := ν_1δ_ℓ`, the twisted theta value
`u ↦ Σ_δ th_χ(Q, δ)ψ_u(δ)` of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19d (iii) (the twisted toric sum normalised by the untwisted one) gives a polynomial condition of
the second kind: relative to `H_𝒞 := ker χ̄ ⊂ G_E` (open, and normal in `G_F` because `χ` is trivial on `𝔸_F^×`, so that
`χ̄∘c = χ̄^{−1}` has the same kernel; the scalar element `z` of CongruenceModulesOfThetaLifts §7.8 (1) is central modulo it, and the condition is used when
`χ̄(z) ≠ 1`) and the finite set `A_𝒞` of places above `ℓ`, the conductor of `χ` and the auxiliary primes: to a family whose
first-half Frobenius elements lie in `z·H_𝒞` and whose second-half ones lie in `H_𝒞` it attaches the polynomial `f` of
ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19d (iii) in all its variables (the twisted theta value times `ℓ^{N₀}`), which is congruent, modulo the ideal
generated by the second-half variables and the `(1 + X_{P_a})^{ℓ^M} − 1` (the coset form of SelmerLengthBoundsAndLocalLifting §3.26), to `F = Dd·g`
with `v(g(0)) = N₀` (`g(0)` is `ℓ^{N₀}` times a unit times the untwisted value `Σ_δ th_χ(∅, δ) = 1`) and `Dd ≡ ∏_a X_{P_a}^{e_a}·(a unit)` modulo
the maximal ideal and the `X_𝔮^{ℓ^M}`, `e_a ∈ {0, 2}`: a condition of level `N₀` and exponent bound `2`.

(b) *Indices of twisted theta lattices.* Let `ℓ` be a prime under a twisted place, `𝒪` the coefficient ring at a place above
`ℓ`, `j` a step and one of the two conjugate places. Let `B_all` be a finitely generated module of forms of step `j` over `𝒪`, stable
under the Hecke operators `T_{n,P}` (`1 ≤ n ≤ r`, `P` split, outside a finite set), `A` an endomorphism commuting with them with
`A(B_all) ⊂ B_all`, `B` a Hecke-stable lattice in the span of `A(B_all)` with `A(B_all) ⊂ B`, and `θ_1, …, θ_k` (`k = rk B`) theta series
with `A(θ_a)` a basis of `B ⊗ ℚ`, such that: for some `c ≥ 0` and all admissible `Q`, `M`, `ℓ^c·`(the universal twist of `θ_a` for `Q`,
`M`) has coefficients in `B_all` (so `ℓ^c·A(θ_a(Q, χ)) ∈ B ⊗ 𝒪[Δ_{Q,M}]`, `Δ_{Q,M}` the twisting group); the universal twists satisfy
the Euler-factor relation `θ_a(Q, χ) = (1 + Σ_{n=1}^r (−1)^n N(P)^{n(n−1)/2}·χ′(Frob_P)^{±n}·T_{n,P})·θ_a(Q ∖ {P, P̄}, χ′)` when a conjugate
pair `{P, P̄}` leaves `Q` (`χ` the inflation of `χ′`); and every Hecke eigenvector of `B/𝔪B` has the eigenvalues, modulo `𝔪`, of an
eigensystem of the step and place. Let `z` be the element of CongruenceModulesOfThetaLifts §7.8 (1). Then there are an open subgroup `H ⊂ G_E`, normal in `G_E`,
and a finite set `A₀` of places such that for every `M ≥ 1` and every family of twisting places in position relative to
`(H, z, A₀)` there is `f ∈ 𝒪[X_𝔮]` with: `f ≡ Dd·g` modulo the ideal generated by the second-half variables and the
`(1 + X_a)^{ℓ^M} − 1`; `v(g(0)) ≤ v₀ := c·k + ι(1)` (in units of `v(ℓ)`), `ι(1)` the signed index at `ℓ` of the span of the `A(θ_a)`
in `B`; `Dd ≡ w·∏_a X_a^{ν_a}` modulo the maximal ideal and the `X_𝔮^{ℓ^M}`, with `w(0) ≠ 0`, `ν_a ≤ r·k`; and for all roots of unity
`u` of order dividing `ℓ^M` with `f(u − 1) ≠ 0` and every lattice `T_u` containing the `A`-images of the twisted theta series:
`[B : T_u]_ℓ ≤ ι(1) + v(f(u − 1)) − v₀` (signed indices). So `f` is a polynomial condition of the second kind (SelmerLengthBoundsAndLocalLifting §3.25b (2); CongruenceModulesOfThetaLifts §7.8 (2)), of
level `v₀` and exponent bound `r·k`, relative to its own subgroup and set of places; the same holds for every open
subgroup of `H` (a family in position for a subgroup is in position for every larger one), in particular for
`H ∩ cHc^{−1}`, normal in `G_F`.

(c) *The lattices of the chain.* For every prime `ℓ` under a twisted
place (the type primes included), every step `j` and each of the two conjugate places, the hypotheses of (b) hold for `B_all` the
integral forms of the type of step `j`, `A := |G₀|·`(the good projector of RowTowerAndRallisIdentities §5.3), `B := B_all ∩` (the good part), and theta series
`θ_a` of the class-sum lifts of step `j` (RowTowerAndRallisIdentities §5.11) whose `A`-images form a basis of the good part, with the twisting places and
characters above: Hecke stability, the integrality with one `c` for all `Q`, `M`, the Euler-factor relation in the Hecke
operators, and the eigensystem condition; and `z` is central modulo the subgroup `H` that (b) produces.

*Route.* (a) is ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19d (iii): integrality uniform in `Q`, the Euler-factor relation when a conjugate pair leaves `Q`, and the
reduction modulo the maximal ideal with exponents `e_a ∈ {0, 2}`; these are the data of the second kind. A product of two conditions of
the second kind is one: the congruences multiply, and the levels and the exponent bounds add. (b) `f` is the determinant of the coordinates of the `ℓ^c·A(θ_a(Q, χ_u))` in a basis of `B`. The relation gives
`f(u − 1) = ∏_{pairs} det(1 + Σ_n (−1)^n N(P)^{n(n−1)/2}·y_P^n·t_n(P))·det(m₀)`, `t_n(P)` the matrix of `T_{n,P}` and `m₀` the untwisted
matrix, with `v(det m₀) = c·k + ι(1)` (its columns are the coordinates of the `ℓ^c·A(θ_a)`). At the first-half places and `u = 1`
each factor is a unit: the Frobenius lies in `z·H`, and `H` is chosen so that the Hecke polynomial of every eigensystem at `1`
is then a unit (the eigensystem condition). At a second-half place `y = (1 + X_a)^{ε_a}` with `ε_a` prime to `ℓ`, and a polynomial
of degree `≤ r·k` with constant term `1` over the residue field becomes `w(X)·X^ν`, `ν ≤ r·k`. The index of a span is the
valuation of the coordinate determinant; a larger lattice has smaller index. These are the data of the second kind.
(c): the route is not given here; the Euler-factor
relation comes from a distribution relation of the twisted test functions under the Hecke double cosets at a split place and
from Artin reciprocity for the uniformiser idele; the other hypotheses from the description of the type part and of the good
projector.

*Check.* With `ε′ = ℓ^{−2}` in the twist selection, the `2m` conditions of (b) (steps and the two places) are combined either
into one condition, their product (levels and exponent bounds add), or each taken with `ε′/(2m)` (CongruenceModulesOfThetaLifts §7.8 (2) takes finitely
many conditions, each with its own subgroup); one condition per step and place with `ℓ^{−2}` each would allow `2m/ℓ²` in all.
The exponent bound `r·k` depends on the rank `k` of the lattice and on `r`, not on `M`, the number of places or the places.

*NEW*. *Needs:* ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19d, RowTowerAndRallisIdentities §5.3, RowTowerAndRallisIdentities §5.8a, RowTowerAndRallisIdentities §5.11, ThetaChainsOnDefiniteUnitaryGroups §2.5, CongruenceModulesOfThetaLifts §7.8; SelmerLengthBoundsAndLocalLifting §3.26.

### 8.20 The local terms of the glued target

Assume the hypotheses of RowTowerAndRallisIdentities §5.8b for the grid of the chain and a scale `x ≥ x₀` with the
size predicate `Size_□` of RowTowerAndRallisIdentities §5.8e (on which the rational structures of RowTowerAndRallisIdentities §5.8 and 7.13 rest). Let `R_0 ⊂ 𝔼_0` be the glued lattice of 7.13 formed in the base-level part `𝔼_0`
(RowTowerAndRallisIdentities §5.4), `D_0 = dim 𝔼_0`, `Tw` the set of twisted places of a twisting datum with sign `s = +1`
(ThetaChainsOnDefiniteUnitaryGroups §2.5) and `ξ_𝔭` the tuple used at `𝔭`. For a step `j` and `𝔭 ∈ Tw` let
`P_jM` be the projected lattice of CongruenceModulesOfThetaLifts §7.15 for `ξ_𝔭` (the orthogonal projection of the `∇`-valued integral forms on `U(V_j)` onto
the lifted subspace `Z_j`, of dimension `d_Z = D_0` by RowTowerAndRallisIdentities §5.9), mapped into `M^W_j ⊗ 𝕃` by the rational model lift `θ_j(ξ_𝔭)` (RowTowerAndRallisIdentities §5.7,
RowTowerAndRallisIdentities §5.11, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19), and `ℐ_j(𝔭)`, `𝔧_j(𝔭)`, `D_j` the dual index, the Weyl exponent `𝔧_j(𝔭)` (an exponent of the rational prime `ℓ(𝔭)`) and the
duality defect of CongruenceModulesOfThetaLifts §7.15. Let `G₀` be the finite group of the types at `g₀, g₁`, `s₀` the least positive integer with
`s₀·Δ_𝒸 ⊂ ∇_𝒸^∨` for the coefficient lattices `Δ_𝒸 ⊂ ∇_𝒸` of the forms on `U(X^h)` at every class `𝒸` (the Weyl lattices tensored
with the integral models of the types), `F_j(𝔭)` the bulk of LocalGainOfThetaChains §4.9f (d) (one number, the flow programme summed over all
Frobenius orbits above `ℓ(𝔭)`; the same number enters the column side through LocalGainOfThetaChains §4.9f: at a prime inert in `K` and in
`ℚ(√−q)` the column side claims `F_j(𝔭) − 𝔉^A_j(𝔭)` and returns the part `𝔉^A_j(𝔭) ≤ 2f·m·b/ℓ(𝔭)` at the places of `𝒜_p`, which
contain every linked place, inside its cost LocalGainOfThetaChains §4.9f (e)), and `ℓ(𝔭)` the residue characteristic of `𝔭`.

*The theta data of a step.* The *own primes* are the auxiliary primes `p_δ, p′_δ` of ThetaChainsOnDefiniteUnitaryGroups §2.4 (b) (distinct, `≡ 1 (mod 2o_δ·f_E)`, hence
totally split in `E`, different from `g₀, g₁` and from every twisted prime, ThetaChainsOnDefiniteUnitaryGroups §2.5); `p_o` denotes either of them. They are prime to `Q·q·d` (`Q` of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a)
and split in `K`; `ζ_{p_o} ∈ 𝕂` and the ray class field `K(g₀g₁p_o)` of `K` lies in `𝕂` (ThetaChainsOnDefiniteUnitaryGroups §2.6 (a) (ii)), so the cover of level `g₀g₁·p_o` (ideal level times
`𝔓_o𝒪_E`) is defined over `𝕂` itself, with geometrically irreducible components (clause (o) below). The *logarithmic size* is a number `L ≥ max(3, log k)` with `log g_i ≤ 9L + 1`, `log rd_E, log d, log f ≤ 2L`,
`log p_δ, log p′_δ ≤ L`, and `log(1 + DF(w)) ≤ 2L`, `log n(w) ≤ L` for the weights `w` of the runs below (in the chain `L = x^ε`). For
each step `j` there are two runs of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a, one for each own prime `p_o`: the short theta series of a run are realised on the
cover of level multiplied by `p_o` (ideal level multiplied by `𝔓_o𝒪_E`, `𝔓_o` a prime of `K` above `p_o`, `𝔓_o + c𝔓_o = 1`), at the
level `g₀g₁p_o`, and are integral only after multiplication by a power of `p_o` at the places above `p_o` ((vii) (b) below); so each
run is used only at the places whose residue characteristic is not its own prime, and the two runs cover every place. For
a run: an integer `T ≥ 1`, its degree, and the weights
`w_L`, `w_F` with `w_F + T·w_L = λ^W_j` (the weight of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19), `n` the dimension of the flag bundle, defined by
division with remainder: with `κ := λ^W_j` and `T′ := T + n + 2`, `w_L` is the weight of scalar weight `n_W` whose consecutive gaps are
`⌊(gap(κ) + 2)/T′⌋`, with last entries `⌊(κ_{τ,p_j−1} − (n + 2)n_W − 2r)/T′⌋` and `⌊κ_{τ,q_j−1}/T′⌋` in the two blocks, and `w_F := κ − T·w_L`,
of scalar weight `n_P = r + t − T·n_W`; with `N`, `c_ℓ`, `s_W`, `ν*`,
`ν_dep` of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a for `w_L`, put `z(w) := p_o^{DF(w)+2f·r·n(w)}` and
`s_F := z(w_F)·N(w_F)·∏_{ℓ∈S_small∪{q,d}} ℓ^{c_ℓ(w_F)}`, `s_0 := z(w_F + n·w_L)·N(w_L)^n·N(w_F)·∏_ℓ ℓ^{n·c_ℓ(w_L)+c_ℓ(w_F)}`,
`s_K := z(λ^W_j)·N(λ^W_j)·∏_ℓ ℓ^{T·c_ℓ(w_L)+c_ℓ(w_F)}`. The *scalar of step `j`* is
`𝔰_j := N_j·(g₀g₁)^{f·r·n_P⁰}·∏_{ℓ∈S_small∪{q,d}} ℓ^{T·c_ℓ(w_L)+c_ℓ(w_F)}`, `N_j := N(λ^W_j)`, `n_P⁰` the threshold of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a (N1); for a place
`v` of `𝕃` put `n_j(v) := v_v(N_j)/e_v`, which is `D⁺_j := D⁺(λ^W_j)` at the places above `π` and `D⁻_j := D⁻(λ^W_j)` at the places
above `π̄`, so that `n_j(𝔭) + n_j(c_𝕃(𝔭)) = D⁺_j + D⁻_j = DF(λ^W_j) = D^H_j` at the type primes, by the definitions of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19 and
LocalGainOfThetaChains §4.9f (d). For a place `v` of `𝕃` above the place `𝔩` of `𝕂` (ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a) and the prime `ℓ`, `e₁(v)` the ramification index of `v` over
`𝔩`: `E_j(v) := e₁(v)·⌈e_𝔩·T·(ν*(𝔩) + [ℓ ∈ {g₀, g₁, q, d} ∪ S_small])⌉` (an admissible exponent for ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.18b with ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a, being at
least `e₁(v)·T·ν_dep(𝔩)`) and `ϵ_j(v) := (E_j(v) − v_v(𝔰_j))/e_v`. Let `DF` be a number at least `DF(w_L)` for every step and
run, `wt_j := 2f·b`, `θ_k(ℓ) := ℓ^{−i₀}` with `i₀` the least odd `i ≥ 3` with `k^{3/2} < ℓ^i`
(so `Σ_ℓ θ_k(ℓ)·log ℓ ≤ C/k`), and `S_small`, `vd` those of ThetaChainsOnDefiniteUnitaryGroups §2.1.

*The page conditions* (`SizePage`) for a run of step `j`, with constants `C₁, C_P ≥ 0` fixed before `ε`:
(P1) `2·DF(λ^W_j) + 2 < g_i` (`i = 0, 1`), where `λ^W_j = w_F + T·w_L`;
(P2) `DF(λ^W_j) ≤ k·(2f·b + f(Sc + η_w))` and `k ≤ min(q, d) − 1`;
(P3) `m ≥ 2`, `k ≥ m + 3`, every prime inert in `K` is `≥ 5`; `w_j(τ) > 0`; with `W(τ)` the gap of `w_L` at the index `k − 1` at the big
position of `τ` and `R_w` its remaining degree: `(1 − θ₀)·w_j(τ) ≤ T·W(τ) ≤ w_j(τ) + C₁(Sc + η_w)` for some `0 ≤ θ₀ ≤ 1` with
`(k − 1)θ₀ ≤ 5m`; `T·R_w ≤ C₁·f·k·(Sc + η_w)`; `T·(w_L)_{τ,0} ≤ 3b` for every `τ`; `n(w_L) ≥ 10r(f + f²(k − 1)³L²/m)` for the logarithmic size `L`; `w_j(τ′) ≤ X″·w_j(τ)` for all `τ, τ′`;
(P4) with `A := (2b + Sc)/T`: `(w_L)_{τ,0} ≤ A` for `τ ∈ Φ`, and
`T·(f·q_j·(1 + vd/2)·A + q_j·Σ_{τ∉Φ}(w_L)_{τ,0}) ≤ C_P·m·(2 + vd)·(2f·b + f(Sc + η_w))`, `C_P ≥ 1`;
(P5) `0 ≤ min(w_j(τ), w_j(cσ_dτ)) ≤ 2b′` on every pair of places exchanged by the inertia at `d`.

*The support condition (T3) on the twisting datum* (a condition of chain data on `Tw`): at every place `𝔭 ∉ Tw` and at `c_𝕃(𝔭)`, for every step `j`, the base tuple has signed
index `0` (the difference of the two relative lengths) of its lattice of theta lifts against the integral lattice of step `j`,
and signed index `0` of its projected lattice against the dual, and `F_j(𝔭) = 0`. Prove:

(o) *The own primes.* For each own prime `p_o`, `ζ_{p_o}` and the ray class field `K(g₀g₁p_o)` of `K` lie in the coefficient field `𝕂`; so every
automorphism of `ℂ` fixing `𝕂` fixes the CM elliptic curve `ℂ/𝒪_K` with its level structure of level `g₀g₁p_o` up to isomorphism, and the
cover of level `g₀g₁·p_o` is defined over `𝕂`, with geometrically irreducible components;

(i) at every place `𝔭` outside `Tw` and outside the support of the Gram determinant of a local basis of `R_0` (for the
quotient form, the basis taken at the pair `{𝔭, c_𝕃(𝔭)}`) the Gram valuation vanishes, and, under (T3), so do the local indices of
`θ_j(1)(P_jM)` in `M^W_j` and the dual indices of (iv);

(ii) that Gram determinant has `v_𝔭 ≤ D_0·v_𝔭(|G₀|·s₀)`;

(iii) `Σ_𝔭 ϱ(𝔭)·v_𝔭(|G₀|·s₀) ≤ log|G₀| + log s₀ =: LG`;

(iv) at `𝔭 ∈ Tw`, the signed dual index `ℐ_j(𝔭) = [P_jM : (P_jM)^∨]_𝔭` (the one the gluing identity charges; for the form of CongruenceModulesOfThetaLifts §7.15)
satisfies `ℐ_j(𝔭) ≤ e_𝔭η_j(𝔭) + D_0·e_𝔭·(𝔧_j(𝔭) + v_{ℓ(𝔭)}(D_j))` (CongruenceModulesOfThetaLifts §7.15 (b), `d^Z_j ≤ D_0`);

(v) the *duality term* `E2_j := Σ_{𝔭∈Tw} ϱ(𝔭)·(e_𝔭η_j(𝔭)/D_0 + e_𝔭v_{ℓ(𝔭)}(D_j))` satisfies
`E2_j ≤ Σ_{𝔭∈Tw} ϱ(𝔭)e_𝔭η_j(𝔭)/D_0 + log D_j`, with `D_j | D_V` (CongruenceModulesOfThetaLifts §7.15 (c)); and for a good twisting datum (CongruenceModulesOfThetaLifts §7.10a) and a host with wild-kernel budget `κ_W` (CongruenceModulesOfThetaLifts §7.11), under
the depth hypothesis of CongruenceModulesOfThetaLifts §7.10a, `E2_j ≤ (C + κ_W)·x^ε·B₀ + log D_j`;

(vi) `Σ_{𝔭∈Tw} ϱ(𝔭)·e_𝔭·2/ℓ(𝔭)² ≤ Σ_ℓ 2·log ℓ/ℓ² < 1 =: E3`;

(vii) *The generation inputs.* For every step `j` and both runs, the weights of the run satisfy `T·(w_L)_{τ,i} ≤ κ_{τ,i}` for all entries,
`T·DF(w_L) ≤ DF(κ)`, `T ≤ (w_L)_{τ,p_j−1} + 1` and `|w_F| ≤ (n + 2)|w_L| + 5f·r²·T`; with a share parameter `δ₂ ∈ [x^{−ε}, 1]` they satisfy, at the
parameters of the chain, the size conditions (N1), (N2) of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a (`SizeGen`) and the page conditions `SizePage` above; and, in the notation of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a
and with the logarithmic size `L`:
(a) (*sup norms*) for every weight `w` of the runs (`w_L`, `w_F`, `w_F + n·w_L`, `λ^W_j`, and the two weights of (N5)), which has
`r ≤ n(w)` and positive last entries: a theta rule of weight `w` with harmonic polynomial `P` has, at every embedding `σ`,
`log sup_σ ≤ log‖P‖_{1,σ} + 10·L·|a(w)| + 200·f·r·n(w)·L`; `Th^{all}(w)` is generated over `𝒪_𝕂` by at most
`(g₀g₁)^{f·r·n(w)}·[𝕂:ℚ]·(1 + DF(w))^{f·r·n(w)}` rules of logarithmic sup norm at most
`400·f·r·L·|w| + 3f·r·n(w)·L + 5·log[𝕂:ℚ] + log|d_𝕂|/[𝕂:ℚ] + 2`; and every short theta series of weight `w` is a `𝕂`-combination of short
theta series of logarithmic sup norm at most `400·f·r·L·|w|`;
(b) (*integrality of theta rules*) with `vd(p) := v_p(disc E)/[E:ℚ]` and the valuation `v_y` at a point normalised by
`v_y(ϖ_𝔩) = 1`: for every weight `w`, every theta rule `g` of weight `w`, every finite place `𝔩` of `𝕂` and every integral framed point `y`
above `𝔩` over a complete discrete valuation ring with finite residue field,
`v_y(g) ≥ −(v_𝔩(N(w)) + Σ_{p | f_E} v_𝔩(p)·vd(p)·DF(w)/2)`, and for a short theta series `g` of weight `w` of a run with own prime `p_o`,
`v_y(g) ≥ −(v_𝔩(N(w)) + Σ_{p | f_E} v_𝔩(p)·vd(p)·DF(w)/2 + v_𝔩(g₀g₁)·f·r·n(w) + v_𝔩(p_o)·(DF(w) + f·r·n(w)))`; and
`vd(q), vd(d) ≤ 1` (the bounds are those of a host Galois over `ℚ`, FrobeniusRestrictedRieszSums §0.1, with `HostSplitting E`, FrobeniusRestrictedRieszSums §0.3: no prime of `E`
above a prime dividing `f_E` is fixed by complex conjugation; the level `g₀g₁` is odd, each of its primes is `α·ᾱ` with `α | π` and
the half-level ideal in `(ᾱ)`);
(c) (*base points, with a norm bound*) for every weight `w` with `r ≤ n(w)`, positive last entries and `DF(w) + 2 ≤ min(g₀, g₁)`,
the two weights of (N5) (which exist and are dominant with positive last entries) among them: on every connected component
at the good embedding some theta rule of weight `w` whose harmonic polynomial has `ℓ¹`-norm `≤ exp(140·r·L·|a(w)|)` at every
embedding is nonzero at some point; and the number `N_c` of connected components at the good embedding satisfies
`log N_c ≤ 41·(f·r·L)²`;
(d) (I2), (I3), (I4) of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a for the weight `λ^W_j`;
(e) (the quotient by the deep cusp forms) the level structure is principal of level `M`, the similitude level is `1`,
`r ≥ 3`, and the automorphy characters of the weight are trivial on the arithmetic groups and on the transvections of level
`M′`; there are `ρ_P` linear forms on the forms of weight `λ^W_j` over a number field `𝕂₁ ⊃ 𝕂` of bounded degree, the coefficients,
in the parameter and in the letters, of a form along algebraic arcs over number fields into boundary strata of rank one over
`𝒪_E` whose abelian part has complex multiplication, with: (kill) for such an arc, a cocharacter `ξ ≠ 0` and `ν₀ ∈ E` tied to the
order of the coefficient there are a component, an isotropic `ξ′`, frames `fr(x)` of the domain, `u₁ ≠ 0` and `κ(x) ≠ 0` with
`coeff(F; x)·u₁^{order} = κ(x)·FJ_{ξ′, Re τ(ν₀)}(F)(fr(x))` for every tuple `x` of invertible letter matrices and every bounded `F`;
(detect) a cusp form that is not deep has a nonzero Fourier–Jacobi coefficient of trace `≤ c₁` (ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a (I5)) at a frame where the
Hermitian lattice splits along the isotropic direction into pieces of bounded size, its frequency is `Re τ(ν₀)` for a totally
real `ν₀` with `τ(ν₀) ≥ 0`, integral against the transvection lattice, and such a point carries an arc as above over a number
field of bounded degree whose frame it is; (integrality) at every finite place the coefficient of an integral form has order
at least that of its value line minus `e·|a(λ^W_j)|·max(v(d_E), v(n′))`; (size) the archimedean bound and the degree bound of
the value lines that (arch), (deg) of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a‴ ask;
(f) the chosen generators of `𝒲` and the chosen short theta series of the weights `w_F`, `w_F + n·w_L`, `λ^W_j` have bounded sup
norms, and the statements of (I6) over the Gauss point of the space of coefficients hold (interpolation, division with
jets, regularity terms, independence of the leading monomials, the two dimension bounds: the passage of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.18a (e) from the
complex points to the Gauss point);
(g) for `j < m`: a boundary form `η` of the shape of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a′ (c), nonzero on every component, a cusp form, with its
archimedean bound; the local point data on the generic zero-cycle of (I8); and the two height inequalities of (I8) (for
`j = m` the height inequality);
(h) (Ch) every algebraic integral framed point of the step variety has, after a finite extension of the valuation ring, a
uniformised model (its integral charts, with saturated frames and a chart depth independent of the chart, are TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.8b′).

*Route.* (o) `p_o` and the odd number `g₀g₁p_o ≥ 3` divide `N = g₀g₁p_δp′_δ`, so ThetaChainsOnDefiniteUnitaryGroups §2.6 (a) (ii) gives `ζ_{p_o} ∈ 𝕂`,
`K(g₀g₁p_o) ⊂ 𝕂` and the statement on the curve; the passage from these to geometrically irreducible components of the cover is not
given here. (vii) The weights are explicit: floor division gives `T·⌊(y + 2)/T′⌋ ≤ y` for `y ≥ 0`, hence the entrywise bounds and (N1);
with `DF(κ) ≤ k·(2f·b + f(Sc + η_w))` the size conditions of the chain give (N2), (P1) and (P2). (P4):
`T·(w_L)_{τ,i} ≤ κ_{τ,i}` entrywise (floor division). The first entry of `κ = λ^W_j` is at most `w_j(τ) + Sc` in the block of
size `p_j` and at most `η_w` in the block of size `q_j`; and `0 ≤ w_j(τ) ≤ 2b` when `x ≥ 3` and `k·b′ ≤ b` (the windows of
ThetaChainsOnDefiniteUnitaryGroups §2.3b). At `τ ∈ Φ` the entry `(w_L)_{τ,0}` is the first of the block of size `p_j`, at
`τ ∉ Φ` the first of the block of size `q_j`; so `T·(w_L)_{τ,0} ≤ 2b + Sc` on `Φ` and `T·Σ_{τ∉Φ}(w_L)_{τ,0} ≤ f·η_w`. Hence the
left side is `q_j·(f(1 + vd/2)(2b + Sc) + T·Σ_{τ∉Φ}(w_L)_{τ,0}) ≤ q_j(2 + vd)(2f·b + f(Sc + η_w))`, and `q_j = m − j ≤ m`.
The routes of (P3), (P5) for these
weights and of (a)–(h) are not given here. (i) Off `Tw` the tuple is the base tuple; (T3) is the vanishing of its indices and of `F_j` there. (ii) If `l·M^∨ ⊂ M`
then the Gram determinant of a local basis of a projection `P(M)` for the quotient form `(PH^{−1}P^*)^{−1}` has valuation at
most `D·v(l)`: the dual of `P(M)` is `M^∨ ∩ (ker P)^⊥ ⊂ l^{−1}P(M)` (projection and intersection are dual,
HermitianFormsAndLattices §4.0a (b), in its surjection form). Apply it to the integral forms on `U(X^h)` and the projection of
RowTowerAndRallisIdentities §5.4 with `l = |G₀|·s₀`: the class-sum lattices with values in `Δ` and in `∇` are dual up to `s₀` (DiscreteSeriesCoefficientsAndAutomorphicMetrics
§7.5a), and the good projector has denominators dividing `|G₀|`. (iii) The product formula for the integer `|G₀|·s₀`. (iv) is
CongruenceModulesOfThetaLifts §7.15 (b). (v) The product formula bounds `Σ_𝔭 ϱ(𝔭)e_𝔭v_ℓ(D_j)` by `log D_j`; for a good twisting datum and wild-kernel budget `κ_W`, CongruenceModulesOfThetaLifts §7.11 (with `d^Z_j ≤ D_0`) bounds
`Σ_𝔭 ϱ(𝔭)e_𝔭η_j(𝔭)` by `D_0·(C + κ_W)·x^ε·B₀`. (vi) `Σ_{𝔭|ℓ} ϱ(𝔭)e_𝔭 = log ℓ`, and `Σ_ℓ 2 log ℓ/ℓ² = 0.98618…`.

*Check.* For the scalar: `v_v(𝔰_j)/e_v = T·c_ℓ(w_L) + c_ℓ(w_F)` above `q`, `d` and the small primes, `n_j(v) + f·r·n_P⁰` above the type
primes, `0` elsewhere; with `vd` the mean different exponent alone (and not `v_ℓ(Q)`) the scalar part at a small prime would
be wrong: it is `v_ℓ(Q)·DF`.

*NEW* (this form), elementary given its inputs. *Needs:* FrobeniusRestrictedRieszSums §0.1, FrobeniusRestrictedRieszSums §0.3, FrobeniusRestrictedRieszSums §0.4, ThetaChainsOnDefiniteUnitaryGroups §2.4, TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.8b′, LocalGainOfThetaChains §4.9f, RowTowerAndRallisIdentities §5.4, RowTowerAndRallisIdentities §5.7, RowTowerAndRallisIdentities §5.8, RowTowerAndRallisIdentities §5.8b, RowTowerAndRallisIdentities §5.8d, RowTowerAndRallisIdentities §5.8e, RowTowerAndRallisIdentities §5.9, RowTowerAndRallisIdentities §5.11, CongruenceModulesOfThetaLifts §7.5a, CongruenceModulesOfThetaLifts §7.11, 7.13, CongruenceModulesOfThetaLifts §7.15, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a, ThetaChainsOnDefiniteUnitaryGroups §2.1, ThetaChainsOnDefiniteUnitaryGroups §2.3b, ThetaChainsOnDefiniteUnitaryGroups §2.5,
ThetaChainsOnDefiniteUnitaryGroups §2.9; HermitianFormsAndLattices §4.0a (b); DiscreteSeriesCoefficientsAndAutomorphicMetrics §7.5a.

### 8.20a The depth table

In the notation of 8.20, with `C₁`, `C_P` the constants of `SizePage`, there is
`C₀ ≥ 20`, depending only on `C₁`, such that for every `C ≥ max(C₀, C_P)`, with `Y := C·DF` and
`aE_j(ℓ) := C·(log k·m·wt_j + f·k·(Sc + η_w))/ℓ + C·k·wt_j·θ_k(ℓ) + [ℓ > X″]·C·k·wt_j/ℓ²`, every step `j` and every twisted place `𝔭`
above a prime `ℓ`, with
`𝔭′ := c_𝕃(𝔭)` and the run whose own prime is not `ℓ`, the following clauses hold:
(good) if `ℓ ∉ {g₀, g₁, q, d} ∪ S_small` and `ℓ ≤ Y`: `ϵ_j(𝔭), ϵ_j(𝔭′) ≤ F_j(𝔭) + aE_j(ℓ) + 1`; if `ℓ > Y`: `ϵ_j(𝔭) = ϵ_j(𝔭′) = 0`;
(small) if `ℓ ∈ S_small`: `ϵ_j(𝔭), ϵ_j(𝔭′) ≤ C·m·(2 + vd)·(wt_j + f(Sc + η_w)) + T + 1`;
(auxiliary) if `ℓ ∈ {q, d}`: `ϵ_j(𝔭), ϵ_j(𝔭′) ≤ wt_j + f(Sc + η_w) + T + 1`;
(type) if `ℓ ∈ {g₀, g₁}`: `ϵ_j(𝔭) ≤ 2T − n_j(𝔭)` and `ϵ_j(𝔭′) ≤ 2T − n_j(𝔭′)`, so `ϵ_j(𝔭) + ϵ_j(𝔭′) ≤ 4T + 2F_j(𝔭)`;
under the page conditions `SizePage` of 8.20, (Ch) of 8.20 (vii) (h), and the integral charts of TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.8b′.
The values of `F_j` (`0` above `q` and the small primes, `−D^H_j/2` above the type primes, `−2f·k·b′ ≤ F_j ≤ 0` above `d` by (P5),
`≥ 0` elsewhere) are LocalGainOfThetaChains §4.9f (d); every prime ramified in `E` lies in `S_small ∪ {q, d}` (ThetaChainsOnDefiniteUnitaryGroups §2.1).

*Route.* (1) *Rounding:* for integers `e₁, e₂ ≥ 1` and real `x`, `e₁⌈e₂x⌉/(e₁e₂) < x + 1/e₂`. (2) *The scalar* (8.20, Check):
`v_v(𝔰_j)/e_v = T·c_ℓ(w_L) + c_ℓ(w_F)` above `q`, `d` and `S_small`; `= n_j(v) + f·r·n_P⁰` above `g₀, g₁`; `0` elsewhere. (3) *Good primes:*
`ϵ_j = E_j/e_v < T·ν_W(𝔩) + 1`. If `ℓ·T·f·(k − 1)³·L ≥ m·b`, the first rows of `w_L` are `≤ 3b/T ≤ s·(ℓ − 1)` with
`s = ⌈(9/2)·f(k − 1)³L/m⌉` and `4r·s·f ≤ n(w_L)` (as `L ≥ 3`), so the depth-zero clause TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.19f (g4) applies on the copies the page
provides and `ν_W(𝔩) = 0`. Otherwise TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.19d and TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.19f (a), with the row datum of TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.19e (c) at the points of the chain (signature
`(p_j, q_j) = (k + j − 1, m − j)`; `ℓ ≠ 2`, `ℓ ∤ disc(E)`, `ℓ` prime to the level; the row datum at the orbits disjoint from their
conjugate), summed over the Frobenius orbits (`Σn_o = f`, `Σ_{orbits}Σ_aw(a) ≤ wt_j`, `j_t = m`, `n = k − 1`; orbits of type (A) at a
prime inert in `K` of split type; the term `T·R_w^{tot}/(ℓ − 1)` of TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.19d with the total remaining degree, bounded by (P3)), or the
clause of TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.19f for the type of the orbits (g2 at a prime split in `K`, type (K), at every `ℓ ≥ 3`, so also at a split prime `3`;
g1 for Frobenius equal to complex conjugation, type (C); g3 for odd conjugate type (O) at orbits alternating between `Φ` and
`cΦ`), gives
`T·ν_W ≤ F_j + C(log k·m·wt_j/ℓ + f·k(Sc + η_w)/ℓ + k·θ_k(ℓ)·wt_j + [ℓ > X″]·k·wt_j/ℓ² + T·f(k − 1)³log²k)`, and the last term is
`< log k·m·b/ℓ ≤ log k·m·wt_j/ℓ` (here `b ≤ wt_j` is used). For `ℓ > DF(w_L)`: `ν_W = 0` (ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a′ (a)), `E_j = 0`, and `F_j ≥ 0` above `Y`.
The local inputs at every point: the unramified Hodge–Tate colength bound TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.8c above the odd primes outside
`S_small ∪ {q, d}`, in the charts of (Ch). (4) *Auxiliary primes:* `ν_W ≤ DF(w_L)/(ℓ − 1)` (ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a′ (a)), so
`ϵ_j < T·ν_W + T + 1 − c_ℓ(w_F) ≤ DF(λ^W_j)/(ℓ − 1) + T + 1 ≤ wt_j + f(Sc + η_w) + T + 1` by (P2). (5) *Small primes:* every small
prime splits in `K`, so (U1), (U2) of TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.18 (a) hold; TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.18 (a)–(b) in its product form: at a place `w` with `n_w` embeddings in `Φ`
(the small prime splits in `K`, so a place `w` above the prime of `K` that `Φ` singles out has `w ≠ w̄` and all its embeddings in `Φ`;
the eigen-submodules have the constant ranks `p_j` at `w` and `q_j` at `w̄`, and the exponent `v_ℓ(disc(E_w/ℚ_ℓ))/n_w` of the different
at `w` is `vd(ℓ) ≤ vd`: these are the hypotheses of HodgeTateLatticesAndLubinTateLogarithms §0.5e),
HodgeTateLatticesAndLubinTateLogarithms §0.5e bounds the PRODUCT of the colengths over these embeddings by `|ℓ|^{n_w·q_j·(1/(ℓ − 1) + vd/2)}`,
so the exponents `len(τ)` with this product satisfy `Σ_τ len(τ)·(w_L)_{τ,0} ≤ n_w·q_j·(1/(ℓ − 1) + vd/2)·max_τ(w_L)_{τ,0}` (no exponent is
assigned to a single embedding), and `q_j/(ℓ − 1)` off `Φ` (the Hodge–Tate inclusion in chart form, HodgeTateLatticesAndLubinTateLogarithms §0.5f); summed over the places,
`ν_W ≤ f·q_j(1 + vd/2)A + q_jΣ_{τ∉Φ}(w_L)_{τ,0}` with `A ≥ (w_L)_{τ,0}` on `Φ`; then (P4) and `C_P ≤ C`. (6) *Type primes:* `T·ν* < 1/2` by (P1); `e_𝔩T` is an
integer, so `E_j/e_v ≤ T + (e_𝔩 + 1)/(2e_𝔩) ≤ T + 1`, and `ϵ_j(v) ≤ 2T − n_j(v)`; `n_j(𝔭) + n_j(𝔭′) = D⁺_j + D⁻_j = D^H_j = −2F_j(𝔭)` by ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19 and LocalGainOfThetaChains §4.9f (d). The
direction: "depth `≤` flow programme" is an upper bound for the row depth, and the column side uses the same number `F_j` as a
lower bound for its divisibility (LocalGainOfThetaChains §4.9f (d)); nothing is asserted as an equality. The passage from the chart depths to the
numbers `ϵ_j` is the rounding and the bookkeeping of the scalar `𝔰_j` (steps (1)–(2)). At the orbits of type (O) that do not
alternate between `Φ` and `cΦ` no clause of TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.19f applies: step (3) for them is not given here.

*Check.* `g = 13`, `T = 3`, `DF(w_L) = 1`, `(D⁺, D⁻) = (3, 2)`, `e_𝔩 = 12`, `e₁ = 2`: `E = 78`, `E/e_v = 13/4 ≤ T + 13/24`. The table
contains no theta function: `E_j` and `𝔰_j` are defined by formulas. Without the case split of step (3) the error
`T·f(k − 1)³log²k` of TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.19d would not be in `aE_j(ℓ)`.

*NEW* (this form), elementary given its inputs. *Needs:* ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a′, 8.20; TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.8b, TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.8b′, TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.8c, LocalGainOfThetaChains §4.9f, TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.18, TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.19d, TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.19e, TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.19f, ThetaChainsOnDefiniteUnitaryGroups §2.1, ThetaChainsOnDefiniteUnitaryGroups §2.3b,
ThetaChainsOnDefiniteUnitaryGroups §2.9a; HodgeTateLatticesAndLubinTateLogarithms §§0.5e, 0.5f.

### 8.20b The indices at the twisted places and the total of the local terms

In the
notation of 8.20, for a twisting datum that is good (CongruenceModulesOfThetaLifts §7.10a) for the polynomial conditions of 8.19e (a) and (b), and under the
hypotheses of RowTowerAndRallisIdentities §5.8b for the grid of the chain and a scale `x ≥ x₀` with the size predicate `Size_□` of RowTowerAndRallisIdentities §5.8e,
for every `𝔭 ∈ Tw`: `Σ_j` (the local indices of `θ_j(ξ_𝔭)(P_jM)` in `M^W_j` at `𝔭` and at `c_𝕃(𝔭)`)
`≤ (Σ_j(2e_𝔭F_j(𝔭) + e_𝔭·err_j(𝔭)) + 2e_𝔭/ℓ(𝔭)²)·D_0`, where `err_j(𝔭)` is the sum of the remainders `r(𝔩)/(e_𝔩·[P : U]·D_0)` of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a at `𝔭`,
`𝔭′` and of the depth error `ϵ_j(𝔭) + ϵ_j(𝔭′) − 2F_j(𝔭)`, plus `4f·r²` at the type primes (the index of the unipotent level); by 8.20a
the depth error is at most `2(aE_j(ℓ) + 1)` at good primes `ℓ ≤ Y`, at most `−2F_j(𝔭)` above `Y`, `4T` at the type primes,
`2C·m(2 + vd)(wt_j + f(Sc + η_w)) + 2T + 2` at the small primes and `2(wt_j + f(Sc + η_w) + T + 1) + 4[ℓ = d]·f·k·b′` at `q`, `d`. For every
`j`, the *index term* `E1_j := Σ_{𝔭∈Tw} ϱ(𝔭)e_𝔭(err_j(𝔭) + 𝔧_j(𝔭))` satisfies `E1_j ≤ C·x^ε·(B₀ + N_c)` under the size conditions of ThetaChainsOnDefiniteUnitaryGroups §2.1,
the bound CongruenceModulesOfThetaLifts §7.16a (3) for the Weyl exponents, `SizeDep` (ThetaChainsOnDefiniteUnitaryGroups §2.1) and the size conditions `k·b′ ≤ b`, `g₀, g₁ ≤ b^{e_g}`, `T ≤ b`, `P³T² ≤ b`,
`(f·r·x^ε)^{e_P} ≤ b`, `Y ≤ m·b`, `log Y ≤ 2x^ε`, `k·(Sc + η_w)·x^ε ≤ m·b`, `k ≤ X″` and `log k ≤ x^ε` (`e_g`, `e_P` fixed before `ε`); the good
primes then contribute at most `C·x^ε·B₀` and the bad primes at most `C·B₀` per step.

Consequently, for a good twisting datum and a host with wild-kernel budget `κ_W`, under the depth hypothesis of CongruenceModulesOfThetaLifts §7.10a, (T3), the hypotheses of RowTowerAndRallisIdentities §5.8 and the size
conditions of ThetaChainsOnDefiniteUnitaryGroups §2.1,
`SizeGen`, `SizePage` and those above, `LG + Σ_j(E1_j + E2_j) + E3 ≤ (C + κ_W)·m·(B₀ + N_c)·x^{e_D ε}` (`e_D = 1`).

*Route.* At each `v ∈ {𝔭, c_𝕃(𝔭)}` the lifted lattice is compared with the integral forms through four inclusions (the lift
commutes with the good projector and factors through the projection; the adelic theta series of the tuple are lifts of
integral forms; the twisted lattice against the untwisted one by 8.19e (b), whose hypotheses for these lattices are 8.19e (c), and
the twist selection CongruenceModulesOfThetaLifts §7.8 (2) with `ε′ = 1/ℓ²` for the product of the `2m` conditions of 8.19e (b) (the steps and the two places;
levels and exponent bounds add) for the good twisting datum, the signed indices growing by `e_𝔭·ig_j(v)` with
`Σ_j(ig_j(𝔭) + ig_j(c_𝕃𝔭)) ≤ 2/ℓ²` (or CongruenceModulesOfThetaLifts §7.8 (2) for the `2m` conditions each with `ε′/(2m)`); the geometric short theta series traced to the eigenspace are adelic theta series of the base
kernels); the last index is bounded by ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.18b with the uniform bound ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a (with `E = E_j(v)` and `σ = 𝔰_j`: `Θ_{λ^W_j} ⊂ 𝔰_j·Th^{short}(λ^W_j)` by
ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a″ (c), `𝔰_j` dividing the three products of scalars, which are `𝔰_j` times `z(w_F)·(g₀g₁)^{f·r·(n_P − n_P⁰)}`,
`z(w_F + n·w_L)·(g₀g₁)^{f·r·(n_P + n·n_W − n_P⁰)}` and `z(λ^W_j)·(g₀g₁)^{f·r·(r + t − n_P⁰)}`, with `N(λ^W_j) = N(w_L)^T·N(w_F)`), whose
hypotheses (N3)–(N5), (I1)–(I8) hold at these parameters. (N3): by 8.20 (vii) (a), ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a″ (a) and the bounds for the scalars (with
`G = C·f·r·(L + log(g₀g₁qd) + log p_o) + 2·max(log[𝕂:ℚ] + log|d_𝕂|/[𝕂:ℚ], log[E:ℚ] + log|d_E|/[E:ℚ])`; a finite spanning subset with
these bounds is extracted from the spanning set of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a″ (a)). (N4): the depth sum by ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a′ (a); integrality by 8.20 (vii) (b):
`s_W·Th^{all}(w) ⊂ M_w` because `v_𝔩(s_W) = v_𝔩(N(w)) + Σ_ℓ e_𝔩·c_ℓ(w)` covers the loss of 8.20 (vii) (b) (`c_ℓ(w) = v_ℓ(Q)·DF(w) ≥ vd(ℓ)·DF(w)` at the
small primes, `⌈DF(w)/2⌉ ≥ vd·DF(w)/2` at `q`, `d`, every prime of `f_E` lying in `S_small ∪ {q, d}`, ThetaChainsOnDefiniteUnitaryGroups §2.1), and the short theta series
likewise with the factors `(g₀g₁)^{f·r·n(w)}` and `z(w)` (the own prime). (N5): for each of its two weights, 8.20 (vii) (c) gives on each
of the `N_c` components a rule nonzero at a point; for an `N_c × N_c` matrix with nonzero diagonal there are integers
`0 ≤ n_i ≤ N_c` with `Σ_i n_i·v_{i,c} ≠ 0` for every column `c` (each column excludes at most `(N_c + 1)^{N_c−1}` of the `(N_c + 1)^{N_c}`
vectors), so a combination of the rules with such coefficients is nonzero at a point of every component; multiplied by the
scalar `s_W` formed for the weight it is integral by 8.20 (vii) (b), of logarithmic sup norm at most
`2·log N_c + 400·f·r·L·|w| + (log(g₀g₁) + log(f²qd))·|w|` by 8.20 (vii) (a); a form nonzero at a point of each connected component is not a
zero divisor (the components are irreducible). (I1): by ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a from (N3), (N4) and (I3) of 8.20 (vii) (d). (I2)–(I4) by 8.20 (vii) (d). (I5) by
ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a‴ with 8.20 (vii) (e). (I6) by ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a″ (b), ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.18a (e) and 8.20 (vii) (f). (I7): by ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a from (I1) and (I6). (I8) by ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a′ (b), (c) with 8.20 (vii) (g),
8.20 (vii) (h); its depth is at most the bulk `F_j(𝔭)` plus the errors of 8.20a; summing over `j` and both
places gives the first claim with `err_j` collecting the depth errors and the remainders `r(𝔩)/(e_𝔩·[P : U]·D_0)` (lengths at `𝔭 | 𝔩` are `e(𝔭/𝔩)` times lengths at `𝔩`, and
`Σ_{𝔭|𝔩}ϱ(𝔭)e_𝔭 = e_𝔩·ϱ(𝔩)`; each run of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a
used at the places whose residue characteristic is not its own prime), and `𝔧_j(𝔭) ≤ 𝔧_j(ℓ)` with `Σ_ℓ 𝔧_j(ℓ)·log ℓ ≤ 30·|Φ_th|·m·b·x^{2ε} + 2m·b ≤ 16·x^ε·B₀` per step (CongruenceModulesOfThetaLifts §7.16a (3) (a), (b); CongruenceModulesOfThetaLifts §7.15). The sizes
at the parameters: CongruenceModulesOfThetaLifts §7.15 (c), CongruenceModulesOfThetaLifts §7.16a (3), `log|G₀| ≤ C·f·r²·log g₁ ≤ b`, the remainder of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a at most `3·f·m·b·δ₂` per
step with `δ₂ ≥ x^{−ε}`, and `log log x ≤ x^ε` for large `x`. The total: (iii), (v), (vi) of 8.20 and the bound for `E1_j`.

*Check.* (`Y`, `aE_j` and `C` are those of 8.20a.) The twist term `2e_𝔭/ℓ(𝔭)²` is paid once for the sum over the steps and the two places of the pair, with the
rational prime `ℓ(𝔭)`, because 8.19e (b) is applied to the product of the `2m` conditions; per step, or with `N𝔭` in place of
`ℓ(𝔭)`, it would add `m·E3` to 8.21 (a), or be unsupported when the residue degree exceeds `1`. The factor `D_0` on it is not
needed by the argument. `e_g = 9`, `e_P = 12`, and `(4C² + 25C + 12)` for the constant of the good primes, are the values of one
construction.

*NEW* (this form), elementary given its inputs. *Needs:* ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.18b, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a′, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a″, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19a‴, 8.19e, 8.20, 8.20a, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.18a, CongruenceModulesOfThetaLifts §7.8,
CongruenceModulesOfThetaLifts §7.5a, CongruenceModulesOfThetaLifts §7.11, CongruenceModulesOfThetaLifts §7.15, CongruenceModulesOfThetaLifts §7.16a, FrobeniusRestrictedRieszSums §0.1, FrobeniusRestrictedRieszSums §0.3, ThetaChainsOnDefiniteUnitaryGroups §2.1, ThetaChainsOnDefiniteUnitaryGroups §2.3b.

### 8.21 The slope of the target

Under the hypotheses of RowTowerAndRallisIdentities §5.8b for the grid of the chain and a scale `x ≥ x₀` with the size predicate
`Size_□` of RowTowerAndRallisIdentities §5.8e (as in 8.20). (a) *Base level.* With the
notation of 8.20, let `𝔫 > 0` be the descent
constant of RowTowerAndRallisIdentities §5.10 (one number for every embedding; RowTowerAndRallisIdentities §5.11 makes it positive). Let `𝔼_0` carry at EVERY embedding the metric of
8.9: the metric of RowTowerAndRallisIdentities §5.12 divided by its factor `n := |P_0|` (at `σ₀` the Petersson form divided by `n`; at `σ ≠ σ₀` the form
transported by `ι_1` from `𝔫·∏_jλ_j(1, 𝔥, σ)·X_1^σ`), and let each `M^W_j ⊗ 𝕃` carry the Petersson form divided by the same `n`,
`λ_j` being the scalar of `θ_j` for these forms (the same as for the undivided forms, both sides being divided by `n`); then
`ι_1^*ι_1 = 𝔫·∏_jλ_j(1, 𝔥, σ)` on the `𝔥`-part at every embedding and no further constant occurs. Let `R_0^∨` carry the dual
metric, and let `s^{st}_j` be any number with `s^{st}_j ≥ −μ(M^W_j)` for the metric of the rational model lifts of RowTowerAndRallisIdentities §5.11 divided by
`n` (ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19 (b), (c) supply `s^{st}_j = (p_j − q_j)Σ_τ w_j(τ)·log Ω + C·B₀·log log x`, under their hypotheses: dividing a metric by `n`
lowers `−μ` by `log n`). The dual indices `ℐ_j(𝔭)` of 8.20 (iv) are those of the form of CongruenceModulesOfThetaLifts §7.15; for the form divided by `n` they
change by `D_0·v_𝔭(n)`, which the identity of the route charges with the forms divided by `n`, and in total these shifts are
`Σ_jΣ_𝔭 ϱ(𝔭)·v_𝔭(n) = m·log n ≤ m·log|G₀|` (integral valuations `v_𝔭`, product formula). Put `F_tot := Σ_j Σ_{𝔭∈Tw} sz_𝔭(F_j(𝔭))`, the *bulk divisibility*, with the bulk `F_j`
of LocalGainOfThetaChains §4.9f (d). Then, for a good twisting datum (CongruenceModulesOfThetaLifts §7.10a) and under the condition (T3) of 8.20 (through 8.20 (i) and 8.20b),

`μ(R_0^∨) ≤ log 𝔫 + Σ_{j=1}^m s^{st}_j + F_tot + LG + m·log|G₀| + Σ_j(E1_j + E2_j) + E3`.

(With the Petersson forms themselves on `𝔼_0` and on the `M^W_j` each `−μ(M^W_j)` is larger by `log n`; the inequality survives,
the right side having `m ≥ 1` such terms, but the identity behind it does not.)

(b) *Passage to the level of the rows.* Let `R ⊂ 𝔼 = 𝔼_1` be the glued lattice of 7.13 (formed in the part of level
`(P_1, χ_{P_1})`, the level of the rows of RowTowerAndRallisIdentities §5.3), and `δ_G ≤ 1/3` a number with `(1 − δ_G)n̄ ≤ n_s ≤ (1 + δ_G)n̄` for some `n̄ > 0` and
the multiplicities `n_s` of the level `(P_1, χ_{P_1})` in the representations of `G₀` occurring in `𝔼^♮` (RowTowerAndRallisIdentities §5.4), each of which
contains the level `(P_0, χ_{P_0})` with multiplicity one. If `H₀ ≥ μ_max(R_0)`, then `μ_max(R) ≤ H₀ + C·log|G₀|` and
`μ(R^∨) ≤ μ(R_0^∨) + 3δ_G·(μ(R_0^∨) + H₀ + C·log|G₀|) + C·log|G₀|`, `C` absolute.

(c) *The multiplicities.* Suppose `12f·r ≤ min(g₀, g₁)` (`r` the rank of the general linear groups of `G₀` at the type places;
this gives `δ_G ≤ 1/3` below, and `2fr ≤ min(g₀, g₁)` is the hypothesis `sn ≤ g` of FiniteReductiveGroups §2.8 (c)); the size
conditions of ThetaChainsOnDefiniteUnitaryGroups §2.1 give it (`g_i ≥ (kb)^{A_g}` while `f·r ≤ x^C`). By RowTowerAndRallisIdentities §5.3 (v), every representation of `G₀`
occurring in `𝔼^♮` is, at each of the `2f` type places, the whole Harish-Chandra induced representation `R_L^G σ` of a cuspidal
pair (not a constituent of it) and contains `(P_0, χ_{P_0})` exactly once, and at each type place the level `(P_1, χ_{P_1})` is the
pair `(H_{r_S}, ϕ_{r_S})` of FiniteReductiveGroups §2.7 (b) with the same `k`. Then (b) holds with `n̄ = ∏_v N(v)^k`
over the `2f` type places and `δ_G = 4f·r/min(g₀, g₁)` (FiniteReductiveGroups §2.8 (c) with `s = 2f` fields `𝔽_{N(v)}` of
cardinality `q_v = N(v) ≥ g := min(g₀, g₁)`, `n = r`, at each place the pair `(H_{i_v}, ϕ_{i_v})` of FiniteReductiveGroups §2.7 (b) given by the level with
one `k`, and the cuspidal pair of the induced representation; `δ = 2sn/g`). Under the size conditions, `log|G₀| ≤ C·f·r²·log g₁`.

*Route.* (a) For a lattice `L` with metric `X` and any basis `e` of `L ⊗ 𝕃`,
`−rk L·μ(L) = mean_σ log det Gram_σ(e) − 2Σ_𝔭 ϱ(𝔭)·idx_𝔭(L : ⟨e⟩)`, the mean over the embeddings `σ : 𝕃 → ℂ` of the Gram
determinants of squared norms (SlopesOfHermitianVectorBundles §1.2 with `μ = 2μ̂`). Take `e = ι_1(f)`, `f` a basis of the
rational coordinates of the base tuple at the base level (RowTowerAndRallisIdentities §5.12): at every embedding the Gram determinant of `ι_1(f)` is
`𝔫^{D_0}` times the product over `j` of the Gram determinants of the rational model lifts (RowTowerAndRallisIdentities §5.7, RowTowerAndRallisIdentities §§5.10–5.12); for each `j` the
same formula applied to the `𝕃`-rational Hermitian forms of the coordinates turns the mean of `log det` of the model lift
into `−D_0·μ(M^W_j)` plus local indices. At a twisted place `𝔭` divide the identity for the tuple `ξ_𝔭` by the one for the
base tuple at the base embedding: the metrics cancel, and what remains is an identity in `𝕃` whose valuations at the pair
`{𝔭, c_𝕃(𝔭)}`, with local bases taken at the pair, express the change of lattice through the local terms of the tuple
`ξ_𝔭`. This is the gluing identity SlopesOfHermitianVectorBundles §1.2a (iii) with `ρ_t = 1`, divided by `−[𝕃:ℚ]·D_0/2`, used as the lower
bound for `deĝ(R̄_0)` of its last sentence; its hypotheses hold here: the determinant identity
`det(ι_1^*ι_1) = 𝔫^{D_0}∏_j det(θ_j^*θ_j)` at every embedding for the base tuple (RowTowerAndRallisIdentities §5.10 at `σ₀`, RowTowerAndRallisIdentities §5.12 at the others), the same at
the base embedding for every tuple (RowTowerAndRallisIdentities §5.10), and the forms on the coordinates Hermitian at the base embedding and, for the
base tuple, rational over a subfield on which every embedding commutes with `c_𝕃` (RowTowerAndRallisIdentities §5.11, RowTowerAndRallisIdentities §5.12). Summing, with
`μ(R_0^∨) = −μ(R_0)` (SlopesOfHermitianVectorBundles §1.7), gives the bound with the local terms of 8.20 (the indices at the
twisted places by 8.20 (iv) and 8.20b, the Gram term by (ii), the shift of the dual indices between the form of CongruenceModulesOfThetaLifts §7.15 and the
form divided by `n` by `m·log|G₀|`; off `Tw` nothing by 8.20 (i) under (T3)), and `2Σ_𝔭 ϱ(𝔭)e_𝔭F_j(𝔭) = Σ_𝔭 sz_𝔭(F_j(𝔭))`; each pair
`{𝔭, c_𝕃(𝔭)}` is counted at both places. (b) Up to an index `|G₀|^{O(rk)}`, `R_0 = ⊕_sR_s` (orthogonal isotypic parts; a
lattice between `⊕R_s` and `|G₀|^{−1}⊕R_s` has degree within `2·log|G₀|·rk` of the sum), and `R` is, up to maps of norm `≤ 1` with
denominators dividing `|G₀|³`, the sum of `n_s` copies of `R_s`, `n_s ∈ [(1 − δ_G)n̄, (1 + δ_G)n̄]`; so `−μ(R)` and `−μ(R_0)` are
the means of the slopes `−μ(R_s)` with the weights `n_s·rk R_s` and `rk R_s`; since every `μ(R_s) ≤ μ_max(R_0) + C·log|G₀| ≤ H₀ + C·log|G₀|`,
the two means differ by at most `3δ_G(H₀ − μ(R_0) + C·log|G₀|)` (only the bounds `(1 ± δ_G)n̄` are used, not that `n̄` is the
mean); the maximal slope moves by at most `C·log|G₀|` (SlopesOfHermitianVectorBundles §§2.2, 2.4 (b)). (c) The multiplicity of a
product over the places is the product of the multiplicities; at one place FiniteReductiveGroups §2.8 (a)–(b) give
`g^k(1 − g^{−1}) ≤ m ≤ g^k(1 + g^{−1})^r` (from the exact multiplicity through FiniteReductiveGroups §2.7 (b) and the Mackey formula), and over `2f` places
`∏(1 − g_v^{−1}) ≥ 1 − 2f/g`, `∏(1 + g_v^{−1})^r ≤ e^{2fr/g} ≤ 1 + 4fr/g`. The bound concerns the whole induced representation:
for a constituent it fails when `r ≥ 3` (`α∘det ⊂ R_T^G(α ⊠ ⋯ ⊠ α)` has multiplicity `0`).

*Check.* With all tuples equal to the base tuple, no step (`m = 0`) and `𝔫 = 1`, (a) is the product formula for the
Gram determinant of a local basis of `R_0`. For `(𝒪_𝕃, c·|·|)` and `e = 1` the Gram determinant is `c²` at every embedding
and `−μ = 2 log c`; with `(2/[𝕃:ℚ])Σ_σ` in place of the mean the first formula would give `4 log c`. A local basis at `𝔭`
alone instead of at the pair `{𝔭, c_𝕃(𝔭)}` would make the Gram hypothesis false: for `𝕃 = ℚ(i)`, `L = 𝒪` and `𝔭 = (2 + i)`,
`e = (2 − i)^{−1}` is a local basis at `𝔭` (index `0` there) but not at `c_𝕃(𝔭)`, and its Gram determinant `e·c_𝕃(e) = 1/5` has
valuation `−1` at `𝔭`; only over the pair does the sum of the Gram valuations (`−1` at each place) equal twice the sum of the
indices (`0` at `𝔭`, `−1` at `c_𝕃(𝔭)`). In one construction the passage constants are
`14` and `28`, and `δ_G ≤ 8fr/min(g₀, g₁)` (8.21 (c) gives `4fr/min(g₀, g₁)`).

*NEW* (instance). *Needs:* ThetaChainsOnDefiniteUnitaryGroups §2.1, RowTowerAndRallisIdentities §5.3, RowTowerAndRallisIdentities §5.4, RowTowerAndRallisIdentities §5.8, RowTowerAndRallisIdentities §5.8b, RowTowerAndRallisIdentities §5.8e, RowTowerAndRallisIdentities §5.10, RowTowerAndRallisIdentities §5.11, RowTowerAndRallisIdentities §5.12, 7.13, 8.9, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19, 8.20; SlopesOfHermitianVectorBundles §§1.2, 1.2a (iii), 1.7,
2.2, 2.4; FiniteReductiveGroups §§2.7 (b), 2.8.

### 8.22 The division inequality

*Statement.* Assume that the twisting datum is good (CongruenceModulesOfThetaLifts §7.10a) and that the host has wild-kernel
budget `κ_W = 1` (CongruenceModulesOfThetaLifts §7.11; for instance `V(E, t) ≤ b`), the depth hypothesis of CongruenceModulesOfThetaLifts §7.10a, the condition (T3) of 8.20, the hypotheses of RowTowerAndRallisIdentities §5.8b
for the grid of the chain and a scale `x ≥ x₀` with the size predicate `Size_□` of RowTowerAndRallisIdentities §5.8e (through 7.13),
`[F:ℚ] ≥ 2`, the size conditions of ThetaChainsOnDefiniteUnitaryGroups §2.1 (with `SizeT_u` of ThetaChainsOnDefiniteUnitaryGroups §2.8 and `SizeDep`), `SizeGen`, `SizePage` and
those of 8.20b and those of 8.21, and

`N_m²·m³·x + (mϑ + Sc + k)·N_m ≤ b`, `k·Sc + m(t + 1)ϑ ≤ w″`, `N_m²·w″ ≤ b`, `(N_m² + m·k)·b′ ≤ a`,
`a⁻_τ ≤ 2b′` for `τ ∈ Φ_top`, `|log Ω| ≤ La ≤ 2x^ε`, `log(g₀g₁) ≤ C·La`, `log T(u) ≤ x`,

and suppose `H₀ ≥ μ_max(R_0)` with `3δ_G·(μ(R_0^∨) + H₀ + C·log|G₀|) ≤ 1` for the passage of 8.21 (b), `δ_G` of 8.21 (c) (under its hypotheses). Then for
every word `u`, with `F_tot` of 8.21 (a) and `h_u` of 8.9,

`μ(R^∨) + h_u − F_tot ≤ Σ_{τ∈Φ_top} ( m·(ph(a_τ) − a_τ·log Ω) − a_τ·log T(u) ) + C·|Φ_top|·a·La + C·m·(B₀ + N_c)·x^{e_D ε}`,

`e_D = 1`.

*Route.* Add the target bound and the explicit height, in five named cancellations.
(T) By 8.21 (a) with `s^{st}_j` from ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19 (b), (c) (for the norms of RowTowerAndRallisIdentities §5.11, the metric of the model lifts) and the local terms of
8.20, 8.20b, and
the passage 8.21 (b), (c) from `R_0` to `R` (whose passage term is then at most `1 + C·log|G₀| ≤ C·B₀`):
`μ(R^∨) ≤ log 𝔫 + Σ_jΣ_{τ∈Φ}(p_j − q_j)·w_j(τ)·log Ω + F_tot + E_T`, `E_T ≤ C m(B₀ + N_c)x^{e_D ε}` (8.20b, last clause, and `m·log|G₀| ≤ m·b`). `F_j`
vanishes at the untwisted places by (T3), so the twisted-place sum is `F_tot`.
(D1) *Descent constant.* `+log 𝔫` of (T) cancels `−log 𝔫` of `h_u` (one metric on the rows, that of 8.9, on both sides);
the term `log|P_1| ≤ log|G₀| ≤ C·B₀` of `h_u` goes into the error.
(D2) *Bulk divisibility.* `+F_tot` of (T) cancels `−F_tot`: both are the sums of `sz_𝔭` of the one bulk `F_j` of LocalGainOfThetaChains §4.9f (d)
(the part `𝔉^A_j` that the column side does not claim is in its cost, LocalGainOfThetaChains §4.9f (e), 8.20); the one bulk vanishes off `Tw` by (T3).
(D3) *Stirling against hooks.* By 8.10 (c), `Σ_jΣ_τ(Σ_i ph(ν_{j,τ,i}) − log H^+_{j,τ}) ≤ m·Σ_{τ∈Φ_top} ph(a_τ) + Σ_{j,τ} eE_{j,τ}`.
(D4) *The period.* By 8.10 (d), `−Σ_{j,τ}(Σ_iν_{j,τ,i})·log Ω = −m·(Σ_{τ∈Φ_top}a_τ)·log Ω − Σ_{j,τ}k·w_j(τ)·log Ω − Σ_{j,τ}δ_{j,τ}·log Ω`;
the middle term against (T) leaves `Σ_{j,τ}(p_j − q_j − k)·w_j(τ)·log Ω`, and `p_j − q_j − k = 2j − 1 − m` with
`Σ_{j=1}^m(2j − 1 − m) = 0`, so it equals `Σ_{j,τ}(2j − 1 − m)(w_j(τ) − w_1(τ))·log Ω`; the kind of a place (thick, top,
thin) does not depend on `j`, so `|w_j(τ) − w_1(τ)| ≤ ϑ + 1` and the term is at most `f·m²·(ϑ + 1)·La`.
(D5) *The top period.* The top term `t_u` of 8.7 (b) in `h_u` contributes `−(Σ_{τ∈Φ_top}a_τ)·log T(u)`.
The remaining errors: `Σ eE_{j,τ} ≤ C(f m b La + m|Φ_top|b′La)`, `Σ|δ_{j,τ}|·La ≤ C(f m b La + |Φ_top|m k b′La)`,
`m·C₁f m³N_m²·La`, `m·A_R f(r+t)²log(b·rd_E·g₀g₁(r+t))`, the `La`-term of `t_u` (its part `C₂N_m²Σ_{τ∈Φ_top}a⁻_τ·La` is at
most `C|Φ_top|aLa` by `N_m²·b′ ≤ a`, its part `C₂N_m²f(mϑ + Sc + 1)La` at most `C·f·b·La` by `mϑ, Sc ≤ w″` and `N_m²·w″ ≤ b`), and
`E_T`; by the size conditions each is at most `C|Φ_top|aLa` or `C m(B₀ + N_c)x^{e_D ε}` (note `f·m·b·La ≤ 2B₀`). Any fixed `e_D ≥ 1` would do;
`e_D = 1` is what these bounds give.

*Check.* The large powers `Ω^{k·w_j(τ)}`, with `k·w_j(τ) ≫ a_τ`, cancel only because the kernel's exponent `k·w_j(τ)`
(8.10 (d)) and the step lattice's exponent `(p_j − q_j)·w_j(τ)` (ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19) differ by `(2j − 1 − m)·w_j(τ)`, which sums to
almost nothing over the chain; a discrepancy `c·w_j(τ)·log Ω` per place and lift with `c` of size `1` would add
`f·m·b·La`, and one of size `k` would make the inequality trivial. A mismatch between the bulk of the rows and that of
the columns at the places of the inert class would be of size `f·m·k·b`, above the whole budget: (D2) needs one number.

*NEW*. *Needs:* 8.9, 8.10, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19, 8.20, 8.20b, 8.21; ThetaChainsOnDefiniteUnitaryGroups §2.1, ThetaChainsOnDefiniteUnitaryGroups §2.2, ThetaChainsOnDefiniteUnitaryGroups §2.3, ThetaChainsOnDefiniteUnitaryGroups §2.3b, ThetaChainsOnDefiniteUnitaryGroups §2.5, ThetaChainsOnDefiniteUnitaryGroups §2.8, LocalGainOfThetaChains §4.9f.

### 8.23 The cost of the type primes

*Statement.* For every word `u` and step `j`, with `E_{u,j}` of LocalGainOfThetaChains §4.9f (e) and `A_top` of 8.7 (b), under
the size conditions of ThetaChainsOnDefiniteUnitaryGroups §2.1 (with `SizeT_u` of ThetaChainsOnDefiniteUnitaryGroups §2.8 and the cost condition `𝔢_u·log T(u) ≤ C·B₀` at the level prime):
(a) `|Σ_𝔭 sz_𝔭(E_{u,j}(𝔭)) − A_top·log(g₀g₁)| ≤ C·B₀` and `Σ_{𝔭 ∤ g₀g₁}|sz_𝔭(E_{u,j}(𝔭))| ≤ C·B₀`; hence
`E_tot(u) := Σ_jΣ_𝔭 sz_𝔭(E_{u,j}(𝔭)) ≤ m·A_top·log(g₀g₁) + C·m·B₀`;
(b) for all words `u, u′`, `|(h_u + A_top·log T(u)) − (h_{u′} + A_top·log T(u′))| ≤ C·B₀`, with `C` depending on `ε`.

*Route.* (a) `E_{u,j}` is defined by cases (LocalGainOfThetaChains §4.9f (e)); by the product formula `Σ_{𝔭|p} sz_𝔭(·)` of an entry that depends on `𝔭`
only through `p` is `2 log p` times it. (i) Stabilisers: `Σ_𝔭 sz_𝔭(v_p(D_Γ)) = 2 log D_Γ ≤ C·f·N_m·log(f·N_m)` (ThetaChainsOnDefiniteUnitaryGroups §3.6). (ii) Primes
`≤ X″` inert in `K`: at most `C·B₀` per step (the cost terms `𝔩_j`, `𝔯_j` of LocalGainOfThetaChains §4.9e (b) sum to this by Mertens), of which the returned
bulk `𝔉^A_j(p) ≤ 2fmb/p` sums to `o(B₀)`; at the primes of conjugate type the entry of LocalGainOfThetaChains §4.9f (e) likewise. (iii) `d`:
`|Ẽ_{u,j}(𝔭)| ≤ |Φ_top|·b + 2f·k·b′` at `𝔭 | d` (the weights on the side `A` are `≤ 2b′`, the first rows on the other side `≤ 2b`), so
`Σ_{𝔭|d} sz_𝔭 ≤ 2 log d·(|Φ_top|·b + 2f·k·b′) ≤ C·B₀`. (iv) Type primes: the cost sits at the places above one prime of `K` over
`g_i`, and `Σ_{𝔭|g_i} sz_𝔭(E_{u,j}(𝔭)) = (Σ_τ|ν_j(u, τ)| − D⁺_j − D⁻_j)·log g_i + 2 log g_i·(v_{g_i}(D_Γ) + C_g·f·(N_m² + m²ϑ))` with
`D^H_j = D⁺_j + D⁻_j` of LocalGainOfThetaChains §4.9f (d) (the total size of the two diagrams of step `j`, at which the bulk of LocalGainOfThetaChains §4.9f (d) is `−D^H_j/2`); the
degree count `|Σ_τ|ν_j(u, τ)| − D⁺_j − D⁻_j − A_top| ≤ err_G` with `err_G·log(g₀g₁) ≤ C·B₀` (the kernel rows of 8.10 (b) against the rows of
`a⁺`: every row but the first at a top place is matched up to the shifts of ThetaChainsOnDefiniteUnitaryGroups §2.3; and
`0 < D⁻_j = Σ_τΣ_{c<q_j}(e′_{j+c}(τ) − w_j(τ) − c − (t + 1)/2) ≤ f·q_j·max_τ(e′_{m−1}(τ) − w_j(τ))`, which for nodes in arithmetic
progression of step `h₀` with the step weights at the midpoints is `≤ f·q_j²·h₀/2 ≤ f·m·ϑ/2`) leaves `A_top·log g_i` up to `C·B₀`. (v) Level
prime: the cost `𝔢_u` sits at the places above `π_u` and is `0` above `π̄_u` (LocalGainOfThetaChains §4.9f (e), ThetaChainsOnDefiniteUnitaryGroups §2.8), so
`Σ_{𝔭|T(u)} sz_𝔭(E_{u,j}) = 𝔢_u·log T(u) ≤ C·B₀`. (b) In the definition of `h_u` (8.9) the word enters only through
`−A_top·log T(u)` in `t_u` and through the kernel terms, so the left side is `|Σ_jΣ_τ(Kt_{j,τ}(u) − Kt_{j,τ}(u′))|`. Only the rows
`1 ≤ i ≤ k − 2` of a place depend on the word (8.10 (b)), each changes by at most `Sc` and lies in `[1, M]`, `M := Sc + max w_j`,
and `|ph(y) − ph(y′)| ≤ |y − y′|·log M` on `[1, M]`; so the difference is at most `m·f·k·Sc·(log M + |log Ω|)`, and `k·Sc ≤ b`,
`log M + |log Ω| ≤ C·x^ε` give `≤ C·m·f·b·x^ε = C·B₀`.

*Check.* Two words share `v, e′, e` (ThetaChainsOnDefiniteUnitaryGroups §2.3), so the hook products `H^+_{j,τ}`, `𝔫` and the top weights do not depend on the
word; only the inner entries of `u(τ)` do, by at most `Δ_w` each, and `Sc = 4kΔ_w`. The factor `T(u)^{−n_τ}` of the restriction is
archimedean (ThetaChainsOnDefiniteUnitaryGroups §3.9 (c)), not a cost; the costs of the level prime are those of (a)(v).

*NEW*. *Needs:* ThetaChainsOnDefiniteUnitaryGroups §2.3, ThetaChainsOnDefiniteUnitaryGroups §2.3b, ThetaChainsOnDefiniteUnitaryGroups §2.7, ThetaChainsOnDefiniteUnitaryGroups §2.8, ThetaChainsOnDefiniteUnitaryGroups §2.9, ThetaChainsOnDefiniteUnitaryGroups §2.9a, ThetaChainsOnDefiniteUnitaryGroups §2.9b, ThetaChainsOnDefiniteUnitaryGroups §3.6, ThetaChainsOnDefiniteUnitaryGroups §3.9, LocalGainOfThetaChains §4.9e, LocalGainOfThetaChains §4.9f, 8.7, 8.8, 8.9, 8.10, 8.20.

### 8.24a Valuations of the ratios of square constants at the twisted places

For a twisting datum with sign `s = +1` and a
square `(i, j)` of the grid of RowTowerAndRallisIdentities §5.8a let `ν_ξ = μ_{j+1}(ξ)/χ_{m−i}` be its Hecke character for the tuple `ξ` (RowTowerAndRallisIdentities §5.8d), `h_sq` half
the sum of the two ranks of the square, `ρ_ξ(s) := Λ(s, ν_ξ)/Λ(s, ν_1)` for integers `1 ≤ s ≤ h_sq` (all these values are nonzero
toric sums, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19d (ii)), and `r_{ij}(ξ) := c(i, j, ξ)/c(i, j, 1)`. For a finite place `𝔭 | ℓ` of `𝕃` let `g_s(𝔭)` be the mean
`𝔭`-adic valuation of the conjugates of the normalised value `Λ(s, ν_1)^♮` (ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19b), truncated at `0`, and `n_s(ℓ)` the
denominator exponent of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19b (i) for `Λ(s, ·)`.

(a) Under the hypotheses of RowTowerAndRallisIdentities §5.8b for the grid of the chain and a scale `x ≥ x₀` with the size predicate
`Size_□` of RowTowerAndRallisIdentities §5.8e (the bottom norms below are then nonzero elements of `𝕃`, RowTowerAndRallisIdentities §5.8d): `r_{ij}(ξ)` is, up to a
unit away from the twist places of `ξ` and up to `p_□ + q_□` step quotients `u_k` (RowTowerAndRallisIdentities §5.8d) with
`v_𝔭(u_k) ≤ 2Σ_{𝔮}c(𝔮)·v_𝔭(N𝔮)` (the sum over the places of `S₀`, `c(𝔮)` the conductor exponents; `v_𝔭(u_k) = 0` at the places of (d)),
the product of the ratio of the
bottom constants `c⁰(ξ)/c⁰(1)` and of `∏_{k=1}^{p_□}ρ_ξ(e + q_□ − k + 1)·∏_{k=1}^{q_□}ρ_ξ(e + k)^{−1}` (`p_□ = ⌊(m − j − 1)/2⌋`,
`q_□ = ⌊(m − j)/2⌋`, so `p_□ + q_□ = m − j − 1`; `e` half the difference of the ranks of the squares `(i + 1, j + 1)` and `(i, j)`);
`v_𝔭(c⁰(ξ)/c⁰(1)) ≤ v_𝔭(A(ξ)) + v_𝔭(A′(1)) + 6d_l(𝔭)`, where the big bottom norm `A(ξ)` of `ξ` is a constant times
`∏_{s=1−e_□}^{h_□}Λ(s, ν_ξ)` (`e_□`, `h_□ ≤ h_sq` the numbers of RowTowerAndRallisIdentities §5.8d, half the difference and half the sum of the two shifted
ranks of the bottom pair of the square),
`A′(1)` the small bottom norm of the base tuple and `d_l(𝔭) := d(ℓ)·v_𝔭(ℓ)` for `𝔭 | ℓ`, where `d(ℓ) ≥ 0` is the *integrality
defect at `ℓ`* of 8.24b (i): an exponent such that the masses of the classes of the bottom pairs have `ℓ`-adic valuation at most
`d(ℓ)` and the class sums of jets of CM theta values that are the coordinates of the bottom pairs, at class representatives
integral above `ℓ`, have `ℓ`-adic absolute value at most `ℓ^{d(ℓ)}` under every embedding of `ℚ̄` into `ℂ_ℓ`; then every bottom
norm `x` of RowTowerAndRallisIdentities §5.8d (for `ξ` and for the base tuple) is nonzero with `v_𝔭(x) ≥ −3d_l(𝔭)` (two
coordinates and one mass); and `ρ_ξ(s)` for `s ≤ 0` is a unit away from the twist places times `ρ_ξ(1 − s)` (the functional
equation in ratio form).

(b) For every finite place `𝔭 | ℓ` not above the twist places of `ξ`: `v_𝔭(ρ_ξ(s)) + g_s(𝔭) ≥ −n_s(ℓ)·v_𝔭(ℓ)`.

(c) For a good twisting datum (CongruenceModulesOfThetaLifts §7.10a): if `ξ = ξ_𝔭` is the tuple twisted at `𝔭` (ThetaChainsOnDefiniteUnitaryGroups §2.5), so that `ν_ξ = ν_1δ_ℓψ_𝔭`
(the twisting datum has the sign `s = +1`, ThetaChainsOnDefiniteUnitaryGroups §2.5), and `𝔭` does not divide the norms
of the twist places of `ξ_𝔭`: for every `1 ≤ s ≤ h_sq`, whenever `z ∈ 𝕃` and `z·Λ(s, ν_1δ_ℓ) = Λ(s, ν_1δ_ℓψ_𝔭)`, `v_𝔭(z) ≤ v_𝔭(ℓ)/ℓ²`.

(d) Consequently, for `ξ = ξ_𝔭`,
`v_𝔭(r_{ij}(ξ_𝔭)) ≤ |v_𝔭(A)| + |v_𝔭(A′)| + 4Σ_{s≤h_sq}(|g_s(𝔭)| + |v_𝔭(Λ(s, ν_1δ_ℓ)/Λ(s, ν_1)) + g_s(𝔭)|) + 5Σ_{s≤h_sq}n_s(ℓ)v_𝔭(ℓ) + 2h_sq·v_𝔭(ℓ)/ℓ² + 6d_l(𝔭) + (p_□ + q_□)·2Σ_𝔮c(𝔮)v_𝔭(N𝔮)`, with `A, A′` the bottom norms of the base tuple.

*Route.* (a) The tower recursion of RowTowerAndRallisIdentities §5.8d (ThetaLiftsForDefiniteUnitaryGroups §6.12), the Rallis norms of the
definite bottom pair, and the functional equation of `Λ(s, ν)` in ratio form. (b) ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19b (i) for the numerator, the gauge `g_s`
for the denominator. (c) Both values are toric sums (ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19d (i), with no correction factor, `ψ_𝔭` being ramified at all of
`Q(ξ_𝔭)`); the `𝔭`-adic valuation of `z` is read through an embedding of `ℂ` into an algebraic closure of the `ℓ`-adic
coefficient field, which agrees with the `𝔭`-adic embedding only on a subfield, so `z` is moved by an automorphism of `ℂ`;
by ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19c the moved ratio is the toric ratio for `ψ_𝔭^a`, `a` prime to `ℓ` (`ψ_𝔭` has `ℓ`-power order); by ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19d (iii) it is a
unit times the twisted theta value `Σ_δ th_χ(Q, δ)ψ_𝔭^a(δ)` (`χ = ν_1δ_ℓ`), whose untwisted value is `1`; `ψ_𝔭` is an
`ℓ^{−2}`-good twist for the polynomial condition 8.19e (a) (the twisting datum being good), so clause (c) of the definition of a good twist in CongruenceModulesOfThetaLifts §7.8 (2), at
the exponent `m′ = a` (prime to `ℓ`), bounds the valuation of the polynomial of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19d (iii) by its level plus `ℓ^{−2}`, hence
that of the twisted theta value (the polynomial divided by `ℓ^{N₀}`) by `ℓ^{−2}`. (d) In (a) each `v_𝔭(ρ(s))`, `1 ≤ s ≤ h_sq`, enters at most
four times: the four index families (the reflected range `1 − e_□ … 0`, the range `1 … h_□` of the big bottom norm, the `p_□`
numerators and the `q_□` denominators of the tower) each map injectively into `[1, h_sq]`; with the
upper bound (c) (applied to `ρ(s)/zd_s`, `zd_s = Λ(s, ν_1δ_ℓ)/Λ(s, ν_1)`) where it is in the numerator and the lower bound (b)
where it is in the denominator: a larger valuation of the ratio is the unfavourable direction for the slope test. One
point of this route is not given here: in (b), the passage from the pointwise gauge to the mean over the embeddings.

*Check.* With no twist (`ξ = 1`) every ratio is `1` and (d) is trivially true; the term `2h_sq·v_𝔭(ℓ)/ℓ²` is the whole cost of the
twist, summable over `ℓ` with the weights `ϱ(𝔭)`. For the hosts `E = ℚ_n·ℚ(ψ)·ℚ(√−q)·ℚ(√−d)` of FrobeniusRestrictedRieszSums §0.4, `d` is
prime and `2` is ramified in `E` when `n ≥ 1`, so the two hypotheses of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19b that this layer carries hold there.

*NEW*. *Needs:* RowTowerAndRallisIdentities §5.8a, RowTowerAndRallisIdentities §5.8b, RowTowerAndRallisIdentities §5.8d, RowTowerAndRallisIdentities §5.8e, CongruenceModulesOfThetaLifts §7.8, CongruenceModulesOfThetaLifts §7.11, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19b, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19c, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19d, 8.19e, 8.24b, ThetaChainsOnDefiniteUnitaryGroups §2.5; ThetaLiftsForDefiniteUnitaryGroups §6.12.

### 8.24b Integrality of the bottom norms

There is an absolute `C > 0` such that for the bottom pairs of RowTowerAndRallisIdentities §5.8d of rank at most `2N` and
weights at most `2B` at a level `Q` all of whose prime factors split in `K`, and every `L ≥ 1` with `log rd_E ≤ L`: (i) there
are a finite set `S_d` of primes and exponents `d(ℓ) ≥ 0`, zero outside `S_d`, with
`Σ_ℓ d(ℓ)·log ℓ ≤ C·f·2N·log(2fN) + C·f·2N·B·L + C·f·(2N)²·B·log Q`, such that for every prime `ℓ`: every class has a
representative integral above `ℓ`; the mass of every class has `ℓ`-adic valuation at most `d(ℓ)`; and at such
representatives the coordinates (class sums of jets of CM theta values) are algebraic numbers of `ℓ`-adic absolute value
at most `ℓ^{d(ℓ)}` under every embedding of `ℚ̄` into `ℂ_ℓ`; (ii) consequently every nonzero bottom norm `x ∈ 𝕃` has
`v_𝔭(x) ≥ −3d(ℓ)·v_𝔭(ℓ)` at every `𝔭 | ℓ`, and `Σ_𝔭 ϱ(𝔭)·d_l(𝔭) ≤ C·f·2N·log(2fN) + C·f·2N·B·L + C·f·(2N)²·B·log Q`.

*Route.* (ii) from (i): a bottom norm is the sum over the classes of the squared absolute values of the coordinates
divided by the mass. (i) is a statement of [FormalProof] on the theta functions of a CM elliptic curve at torsion points
(their Galois conjugates, their jets and their behaviour at `2`); its proof is not given here. It is not a consequence of
ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19b (i), which concerns lattice sums and toric sums.

*NEW*. *Needs:* RowTowerAndRallisIdentities §5.8d.

### 8.24 The maximal slope of the target

With the metric of 8.9 on `𝔼_0` and `𝔼`, under the size
conditions of ThetaChainsOnDefiniteUnitaryGroups §2.1, the hypotheses of 8.8 at every step and place (for the Rallis
eigenvalues in term (3) of the route), the hypotheses of RowTowerAndRallisIdentities §5.8b for the grid of the chain and a scale `x ≥ x₀` with the
size predicate `Size_□` of RowTowerAndRallisIdentities §5.8e, for a good twisting datum (CongruenceModulesOfThetaLifts §7.10a): (a) `μ_max(R_0) + log 𝔫 ≤ x^{C}·b`, with `C` depending only on the constants fixed before
`ε`; (b) consequently `H₀ := x^C·b − log 𝔫` satisfies the hypothesis `H₀ ≥ μ_max(R_0)` of 8.21 (b), and, for a host with wild-kernel
budget `κ_W = 1` (CongruenceModulesOfThetaLifts §7.11), under the depth hypothesis of CongruenceModulesOfThetaLifts §7.10a, the condition (T3) of 8.20 and `[F:ℚ] ≥ 2` (through ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19), with the size conditions of 8.22, the smallness condition of 8.21 (b) holds for `δ_G` of 8.21 (c)
(under its hypotheses) and `μ(R^∨) ≤ log 𝔫 + Σ_j s^{st}_j + F_tot + C·m·(B₀ + N_c)·x^{e_D ε}` and `μ_max(R) + log 𝔫 ≤ x^{C}·b` for the
lattice `R` of the rows.

*Route.* (a) *Slope test.* For an injective `𝕃`-linear map `Ψ` of Hermitian lattices with `Ψ(L)_𝔭 ⊂ 𝔭^{−a(𝔭)}M_𝔭` for all
`𝔭`: `μ_max(L) ≤ μ_max(M) + ht(Ψ) + 2Σ_𝔭ϱ(𝔭)a(𝔭)` (SlopesOfHermitianVectorBundles §2.4 (b) with its finite-place bound, in the
normalisation `μ = 2μ̂`, and SlopesOfHermitianVectorBundles §2.1 for the lattice `𝔞M`, `𝔞 = ∏_𝔭𝔭^{−a(𝔭)}`). The integers `a(𝔭)` may be negative here; the bound
`‖Ψ‖_𝔭 ≤ N𝔭^{a(𝔭)}` holds for `a(𝔭)` of either sign, and applying SlopesOfHermitianVectorBundles §2.4 (b) with `max(a(𝔭), 0)` in place of `a(𝔭)` gives the same
inequality with a right side that is not smaller, which is all that is used. Apply it to `L = R_0` with the metric of 8.9 divided by `𝔫` (which adds `log 𝔫` to its slopes), `M`
the lattice of test values and `Ψ = (c_tot(1)κ_G^{−1}ℬ_a)_a` (RowTowerAndRallisIdentities §5.8): `Ψ` is injective because the test map of the base tuple has
the kernel of the descent and `ι_1` is bijective onto `𝔼_0`; `Ψ∘ι_ξ∘proj = ζ_ξ·(c_tot(1)/c_tot(ξ))·v_ξ` with `ζ_ξ` a root of
unity and `v_ξ` the vector of class sums of jets of CM theta values, so `a(𝔭) = d_F(𝔭) + Σ_{i,j}v_𝔭(r_{ij}(ξ_𝔭))` (zero outside the
twisted places and the support of `d_F`). Five terms: (1) `μ_max(M)`, where `M` is the dual, for the invariant Hermitian metric, of the orthogonal sum over the pairs
(coset datum `𝐜`, class `κ ∈ Cl⁺ = U(X⁺)(F)\U(X⁺)(𝔸_f)/K⁺`) of the Weyl lattices of highest weight `Λ⁺` of the class lattices of `X⁺`
(RowTowerAndRallisIdentities §5.8a, RowTowerAndRallisIdentities §5.8e): `μ_max(M) ≤ 4·f·ν·R·log(νR)`, `ν = rank X⁺ = r + 1 + m(s − 1)`, `R ≥ 1` a bound for the spread of `Λ⁺` at every real
place, independently of the number of pairs (IntegralWeylModulesOfGeneralLinearGroups §3.3); (2) the archimedean height of the
test map of the base tuple for the quotient metric, at most `C·m·(f·N·b·log b + m·N²·σ_G)` with `N = k + m(t + s + 1)` and
`σ_G = Σ_{v∈S_□} d(v)·log N v` (`𝔪_□ = ∏_{v∈S_□} w(v)^{d(v)}`, `d(v_□) = d_□` the depth of RowTowerAndRallisIdentities §5.8a): a sum of size terms among which the
number of coset data, `N(𝔪_□)^{Σ_{i<m}(r+is)(r+(i+1)s)} ≤ exp(2m·N²·σ_G)` (each factor is `#(Hom(Λ_{i+1,0}, Λ_{i,0})/𝔪_□·Hom) ≤ N(𝔪_□)^{N²}` and
`N(𝔪_□) ≤ e^{2σ_G}`), and the number of classes, `#Cl⁺ ≤ h(ν)·N(𝔪_□)^{ν²}` (`h(ν)` a class-number bound at full level times the
index of `K⁺`), both at most `exp(m·a₁)`, `a₁ = C·f·N·b·log b + C·m·N²·σ_G`; with `d_□·log N(v_□)` of the size that RowTowerAndRallisIdentities §5.8a fixes, this
is at most `x^C·b` (`log b = x^ε`); (3) `−mean_σ min_𝔥 Σ_j log λ_j(1, 𝔥, σ) ≤ C·f·m·N_m²·log b` by 8.8 (b), since `ι_1` multiplies
squared norms by `𝔫∏_jλ_j` on each part and the parts are orthogonal; (4) `2Σϱ(𝔭)d_F(𝔭)`, the denominators of the test
values (`d_F(𝔭) ≥ 0` the least integer with `v_{ξ_𝔭}(R_0) ⊂ 𝔭^{−d_F(𝔭)}M` at `𝔭`, `v_ξ` the vector of class sums of jets of CM theta
values; `d_F = 0` outside a finite set) (their sum `2Σ_𝔭ϱ(𝔭)d_F(𝔭)` is of polynomial size; this bound is a statement of
[FormalProof] of its own, distinct from 8.24b, and its proof is not given here); (5)
`2Σ_𝔭ϱ(𝔭)Σ_{i,j}v_𝔭(r_{ij}(ξ_𝔭))`, bounded by 8.24a (d) summed with the weights `ϱ(𝔭)`: the product formula bounds
`Σ_𝔭ϱ(𝔭)|v_𝔭(x)|` for the bottom norms by their archimedean sizes plus the denominators (for a nonzero `x` with
`v_𝔭(x) ≥ −3d_l(𝔭)` at every `𝔭`: `Σ_𝔭ϱ(𝔭)|v_𝔭(x)| ≤ mean_σ log⁺|σ(x)| + 6Σ_𝔭ϱ(𝔭)d_l(𝔭)`, with 8.24b), the gauges and the denominator
exponents sum to polynomial size (ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19b (ii) for the part `c_E(l)`: `Σ_l c_E(l)·log l ≤ fk·log(fk + 1)`, `k = 2s`,
when `fk ≥ 16`, which holds under the size conditions of ThetaChainsOnDefiniteUnitaryGroups §2.1, as they give `f = 2|A| ≥ 2x^{A_n}`; the other parts of the
exponent vanish unless `l` divides `𝔣·d_E`, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19b (i)), and `Σ_ℓ log ℓ/ℓ² < 1`. Each is polynomial in `b`, `x` and the ranks, with
exponents fixed before `ε`. (b) Insert (a), `δ_G = 4fr/min(g₀, g₁)` of 8.21 (c) and `log|G₀| ≤ C·f·r²·log g₁` into 8.21 (a)–(b)
and 8.20b (last clause); every added term is at most `C·m·(B₀ + N_c)·x^{e_D ε}` (the passage term is `≤ 1 + C·log|G₀|` because
`δ_G·x^C·b` is tiny when `min(g₀, g₁) ≥ (kb)^{A_g}`). In (a), the bound of term (4) and the
bounds of the terms (4), (5) linear in `b` are not given here.

*NEW* (this application); the principle (a lattice mapping injectively with small height into a lattice of small maximal
slope has small maximal slope) is Bost's (Bost 1996, Prop. 4.3 (1), p. 131). *Needs:* RowTowerAndRallisIdentities §5.8, RowTowerAndRallisIdentities §5.8b, RowTowerAndRallisIdentities §5.8d, RowTowerAndRallisIdentities §5.8e, RowTowerAndRallisIdentities §5.10, RowTowerAndRallisIdentities §5.11, RowTowerAndRallisIdentities §5.12, CongruenceModulesOfThetaLifts §7.8, CongruenceModulesOfThetaLifts §7.11, 7.13, 8.8, 8.9, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.19b, 8.20, 8.21,
8.24a, 8.24b, ThetaChainsOnDefiniteUnitaryGroups §2.1, RowTowerAndRallisIdentities §5.8a; SlopesOfHermitianVectorBundles §§1.3, 2.1, 2.4 (b); IntegralWeylModulesOfGeneralLinearGroups §3.3.

### Examples

- For `m = 1`, `S_0 = S_1 = 𝕃`, `K_1 = id`, `V = Q = 𝒯 = 𝕃²` with the coordinate lines as `Q_1, Q_2` and `ι` multiplying
  squared norms by `1` and `4` on them (`κ = 1`, `λ_1 = 1` and `4`), and `B(1)(ιF) = F_1`: `‖B‖² = 1 = ‖Pt‖²·‖K_1‖²/1`; with `max_π` in place of `min_π` the bound of 8.1 would read
  `‖B‖² ≤ 1/4`, which is false (8.1, Check).
- For one variable, `Th(u) = e^{u²/2}` and the block `ū^{2n}`, the left side of 8.2 (c) is `((2n)!/(2^n n!))²·Ω^{−2n} ∼ 2(2n/e)^{2n}Ω^{−2n}`
  and the right side `e(4n + 2)²(2n/e)^{2n}Ω^{−2n}`: the factor `exp(ph(2n))` is attained (8.2, Check).
- For `E = K` there is no transport term: `𝔡_{E/K} = 𝒪_K` and `log Ω = log Ω_K` (8.5c, Check).
- For `n = 0`, `λ = (a)` at one place, `br` takes the coefficient of `z^a` and multiplies it by `t^{−a}`, and its squared norm
  is `β·(|t|²g)^{−a} = β·T_br^{−a}` (8.7, Check).
- `ph` is not monotone on `[0, 1]`: `ph(0) = 0 > ph(1) = −1`, which is why 8.10 (c) compares through `log ν!` (8.10, Check).
- For `g = 13`, `T = 3`, `DF(w_L) = 1`, `(D⁺, D⁻) = (3, 2)`, `e_𝔩 = 12`, `e₁ = 2`: `E = 78` and `E/e_v = 13/4 ≤ T + 13/24` (8.20a, Check).
- For `(𝒪_𝕃, c·|·|)` and `e = 1` the Gram determinant is `c²` at every embedding and `−μ = 2 log c` (8.21, Check).
- With no twist every ratio of square constants is `1`, and 8.24a (d) holds trivially (8.24a, Check).

### Dependencies

Layer 7 (7.13, 7.14). FrobeniusRestrictedRieszSums §§0.1, 0.3, 0.4; ThetaChainsOnDefiniteUnitaryGroups §§2.1, 2.2, 2.3, 2.3b, 2.4,
2.5, 2.6, 2.7, 2.8, 2.9, 2.9a, 2.9b, 3.1, 3.1a, 3.1d, 3.2, 3.4, 3.6, 3.8, 3.9; TaylorBoundsAndDepthsOnHeightTwoFormalGroups §§4.8b,
4.8b′, 4.8c, 4.18, 4.19d, 4.19e, 4.19f; LocalGainOfThetaChains §§4.9e, 4.9f, 4.16; RowTowerAndRallisIdentities §§5.1, 5.3, 5.4, 5.7,
5.8, 5.8a, 5.8b, 5.8d, 5.8e, 5.9, 5.10, 5.11, 5.12; SeesawForThetaChains §§6.1, 6.5, 6.8, 6.14, 6.15; CongruenceModulesOfThetaLifts
§§7.5a, 7.5b, 7.8, 7.10a, 7.11, 7.15, 7.16a; ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §§8.5, 8.18a, 8.18b, 8.19,
8.19a, 8.19a′, 8.19a″, 8.19a‴, 8.19b, 8.19c, 8.19d; HermitianFormsAndLattices §§4.0a, 5.5, 6.3; SlopesOfHermitianVectorBundles
§§1.2, 1.2a, 1.3, 1.7, 2.1, 2.2, 2.4; HodgeTateLatticesAndLubinTateLogarithms §§0.5e, 0.5f; SelmerLengthBoundsAndLocalLifting
§§3.25b, 3.26; IntegralWeylModulesOfGeneralLinearGroups §§1.1, 3.1, 3.3; FiniteReductiveGroups §§2.7, 2.8;
DiscreteSeriesCoefficientsAndAutomorphicMetrics §§7.5a, 7.5b, 8.3; ThetaLiftsForDefiniteUnitaryGroups §6.12;
AutomorphicFormsOnReductiveGroups §§7.4–7.6; ClassicalGroups §§5.1, 6.1; SchurWeyl Layer 5; SpecialFunctionsTheta Layer 7;
Mathlib's Gaussian integrals, power series of entire functions and mean-value inequality for subharmonic functions (8.2, 8.3).

## Downstream consumers

ThetaChainsAndFrobeniusPrimeSums consumes this roadmap as follows. The bounds for the divided source lattices
(ThetaChainsAndFrobeniusPrimeSums §9.2) and the slope inequality of the chain (ThetaChainsAndFrobeniusPrimeSums §9.6) are
formed on the divided sources `N′_u` and the glued target `R` of 7.13, with the integrality 7.14 of the maps
`B_u : N′_u → R^∨`, their heights 8.9 (through the top term of 8.7), the slope of the target 8.21, the cost of the type
primes 8.23 and the maximal slope 8.24. Chain data and their parameters (ThetaChainsAndFrobeniusPrimeSums §§10.0, 10.4,
10.6–10.9) carry the hypotheses of 7.13, 7.14, 8.19e, 8.20, 8.20b and 8.21–8.24 and use the division inequality 8.22.
ThetaChainsAndFrobeniusPrimeSums §10.0 (D4) puts the conditions (T1), (T2) and (T3) on the twisting datum into chain data,
and ThetaChainsAndFrobeniusPrimeSums §§10.7 (b), 10.9 (c), (d) verify them together with the good twisting datum and the
wild-kernel budget. ThetaChainsAndFrobeniusPrimeSums §10.6 fixes the order of the constants and the numbers `A_n`, `J` and
`c_H` that the size predicates take as arguments, and ThetaChainsAndFrobeniusPrimeSums §10.6d checks at the parameters of
the chain the facts on the own primes that 8.20 uses (prime to `Q·q·d`, `log p_δ, log p′_δ ≤ L`) and the size conditions on
the weights of a run.

## Scope and ownership

This sub-roadmap of [RiemannHypothesisForDirichletLFunctions](../README.md) is independently definitive.

This roadmap owns: integrality after division for a pairing linear in one variable and semilinear in the other (7.12); for
the chain of theta lifts, the divided source, the glued target and its lattice of semilinear functionals, and the
integrality of the period pairing (7.13, 7.14); the height of a map that factors through a chain of operators, Taylor
blocks in the Fock model, pointwise bounds for theta functions with Gaussian growth, the norms and heights of the step
operators with the transported mean CM period, the scaled branching map and the top period, the lower bound for the Rallis
eigenvalues by hook products, the explicit height of the period pairing and the comparison of Stirling terms with hook
products (8.1–8.10); the theta conditions of the twist selection as polynomial conditions of the second kind, with the index
statement for twisted theta lattices (8.19e); the local terms of the glued target, the depth table and the indices at the
twisted places (8.20, 8.20a, 8.20b); the slope of the target with the passage from the base level to the level of the rows
(8.21); the division inequality and the cost of the type primes (8.22, 8.23); the valuations of the ratios of square
constants, the integrality of the bottom norms and the maximal slope of the target (8.24a, 8.24b, 8.24).

Not owned here. The chain data, the column and row spaces, words, characters, the coefficient fields, the levels and the
forms of the chain are ThetaChainsOnDefiniteUnitaryGroups Layers 2–3; the gain exponents, the bulk and cost of a step and the
gain sublattice are LocalGainOfThetaChains §§4.9e, 4.9f, 4.16; Taylor bounds, depths and integral charts are
TaylorBoundsAndDepthsOnHeightTwoFormalGroups §§4.8b, 4.8b′, 4.8c, 4.18, 4.19d–4.19f; the rows, the descent, the model lifts, their Rallis eigenvalues
and the rational structure of the grid with its determinant identities are RowTowerAndRallisIdentities §§5.1, 5.3–5.12;
the period pairing and its seesaw are SeesawForThetaChains §§6.1, 6.14, 6.15; the congruence lengths, the twist
selection, the good twisting datum and the wild-kernel budget are CongruenceModulesOfThetaLifts §§7.5a, 7.5b, 7.8, 7.10a, 7.11, 7.15, 7.16a; the CM periods,
toric sums, the step lattices on the unitary Shimura varieties and the generation of integral forms by theta series are
ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §§8.5, 8.11–8.19d. The Fischer norm of a product of minors (the hook-product
identity) and integral branching are IntegralWeylModulesOfGeneralLinearGroups §§3.1, 1.1; slopes, heights and the gluing lemma are
SlopesOfHermitianVectorBundles Layers 1–2; lattices from local data are HermitianFormsAndLattices §4.0; the
multiplicities of the Bessel-type characters are FiniteReductiveGroups §§2.7, 2.8.

## Exact supplier contracts

### From Mathlib

- Dedekind domains, the valuations at their maximal ideals and fractional ideals (`IsDedekindDomain`,
  `IsDedekindDomain.HeightOneSpectrum`, `FractionalIdeal`, `FractionalIdeal.count`), rings of integers of number fields
  (`NumberField.RingOfIntegers`). Used in 7.12.
- Gaussian integrals on `ℂ^n`, power series of entire functions and dominated convergence. Used in 8.2.
- The mean-value inequality for subharmonic functions and volumes of balls. Used in 8.3.

### From TauCetiRoadmap.AutomorphicFormsOnReductiveGroups

- §§7.4–7.6: algebraic modular forms in Gross's models and composition and adjoints of class-set operators. Used in 8.7.

### From TauCetiRoadmap.ClassicalGroups

- §5.1 (the Weyl dimension formula) and §6.1 (branching `GL_n ↓ GL_{n−1}`, Gelfand–Tsetlin). Used in 8.7.

### From TauCetiRoadmap.SchurWeyl

- Layer 5 (hook lengths). Used in 8.10.

### From TauCetiRoadmap.SpecialFunctionsTheta

- Layer 7 (Riemann theta functions and their quasi-periodicity). Used in 8.3.

### From FrobeniusRestrictedRieszSums, a sub-roadmap of this family

- 0.1, 0.3, 0.4: the host, its predicates `SplitRamification d` and `HostSplitting E`, the cyclic hosts and the auxiliary pair.
  Used in 8.20, 8.20b.

### From ThetaChainsOnDefiniteUnitaryGroups, a sub-roadmap of this family

- 2.1 (the size conditions), 2.2 (the spaces of the chain), 2.3, 2.3b (words, weights and the cloud), 2.4 (characters and the
  auxiliary primes), 2.5 (the twisting datum and the tuples `ξ_𝔭`), 2.6 (the fields `𝕂 ⊂ 𝕃`; (a) (ii) for the own primes), 2.7
  (the type primes and `SizeG`), 2.8 (the level primes and `SizeT_u`), 2.9, 2.9a, 2.9b (the levels). Used in 7.13, 7.14, 8.4–8.10, 8.19e,
  8.20–8.24a.
- 3.1, 3.1a, 3.1d (forms of the chain, CM abelian varieties and their theta functions), 3.2, 3.4 (the step operators and their
  weights), 3.6 (stabiliser orders), 3.8 (the source lattices and their metrics), 3.9, 3.10 (the top period and its
  integrality). Used in 7.13, 7.14, 8.4–8.7, 8.9, 8.10, 8.23.

### From TaylorBoundsAndDepthsOnHeightTwoFormalGroups, a sub-roadmap of this family

- 4.8b, 4.8b′, 4.8c (depths, integral charts, the unramified Hodge–Tate colength bound), 4.18, 4.19d, 4.19e, 4.19f (product form,
  row data and the depth clauses). Used in 8.20, 8.20a.

### From LocalGainOfThetaChains, a sub-roadmap of this family

- 4.9e, 4.9f (the ledger of a step: gain, bulk `F_j`, cost `E_{u,j}`, the diagrams `a^±_{j,τ}` and the net exponent `𝔊_u`), 4.10,
  4.16, 4.16b (the valuation bound for the period and the gain sublattice `N_u`). Used in 7.13, 7.14, 8.6–8.8, 8.10, 8.20–8.23.

### From RowTowerAndRallisIdentities, a sub-roadmap of this family

- 5.1, 5.3, 5.4 (Petersson forms, the rows and their parts, the good descent `ι_ξ`), 5.5, 5.6, 5.7 (the model lifts and their
  Rallis eigenvalues), 5.8, 5.8a, 5.8b, 5.8d, 5.8e (the rational structure `𝔼_{1,𝕃}`, the grid, its square constants and the size
  predicate `Size_□` with its scale `x₀`), 5.9 (multiplicity comparison), 5.10, 5.11, 5.12 (the descent constant `𝔫`,
  the rational model lifts and the determinant identities). Used in 7.13, 7.14, 8.8, 8.9, 8.19e, 8.20–8.24a.
- 5.8d (the bottom pairs of the squares: their classes with representatives and masses, their coordinates (class sums of
  jets of CM theta values) and their bottom norms). Used in 8.24a, 8.24b.

### From SeesawForThetaChains, a sub-roadmap of this family

- 6.1, 6.14, 6.15 (the period pairing `B_u`, its seesaw identity and its semilinearity), 6.5, 6.8 (the admissible finite data).
  Used in 7.13, 7.14, 8.6, 8.9; 6.14 and 6.15 under the hypotheses of 6.14 (among them that the Bessel–Poincaré series of
  `u` is nonzero on the new forms `M_u`), which 7.13, 7.14 and 8.9 carry.

### From CongruenceModulesOfThetaLifts, a sub-roadmap of this family

- 7.5a, 7.5b (lifted eigensystems and the lifted subspace), 7.8 (twist selection and good twists), 7.10a (the good twisting
  datum), 7.11 (the wild-kernel budget and the congruence bound), 7.15 (the projected lattice, the dual index and the Weyl
  exponent), 7.16a (the bound for the Weyl exponents). Used in 8.19e, 8.20, 8.20b, 8.21, 8.22, 8.24a, 8.24.

### From ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, a sub-roadmap of this family

- 8.5 (the Chowla–Selberg statement for the mean period). Used in 8.5c.
- 8.18a, 8.18b, 8.19, 8.19a, 8.19a′, 8.19a″, 8.19a‴ (the step lattices `M^W_j`, their slope bound, the generation of integral
  forms by theta series and the depth of the theta lattices). Used in 8.20–8.22, 8.24.
- 8.19b, 8.19c, 8.19d (denominators of CM values, toric ratios and twisted theta values). Used in 8.19e, 8.24a, 8.24.

### From HermitianFormsAndLattices, a sub-roadmap of this family

- 4.0 (g): lattices from local data in module form. Used in 7.13.
- 4.0a (b): projection and intersection are dual. Used in 8.20.
- 5.5, 6.3 (masses and the closed mass formula). Used in 8.6, 8.8.

### From SlopesOfHermitianVectorBundles, a sub-roadmap of this family

- 1.2, 1.3, 1.7: slopes, heights of maps (finite and archimedean parts), duals. Used in 8.1, 8.21, 8.24.
- 1.2a (iii): the gluing lemma, for a number field with an involution, an embedding `σ₀` with `σ₀(x^*) = conj(σ₀(x))`, a
  `*`-stable subfield on which every embedding commutes with the involution, and bases local at the pairs `{𝔭, 𝔭*}`. Used in 8.21.
- 2.1, 2.2: maximal and minimal slopes, their shift by a fractional ideal, duality, direct sums. Used in 7.13, 8.21, 8.24.
- 2.4 (b): Bost's slope inequality with its finite-place bound. Used in 8.21, 8.24.

### From HodgeTateLatticesAndLubinTateLogarithms, a sub-roadmap of this family

- 0.5e (the colength bound at a place disjoint from its conjugate, with constant ranks at `w` and `w̄`), 0.5f (the cokernel
  bound in chart form). Used in 8.20a.

### From SelmerLengthBoundsAndLocalLifting, a sub-roadmap of this family

- 3.25b (2) (polynomials of the second kind), 3.26 (twist selection in the coset form). Used in 8.19e.

### From IntegralWeylModulesOfGeneralLinearGroups, a sub-roadmap of this family

- 1.1: integral branching `GL_N ↓ GL_{N−1}` with the integer `c_Br` and `br∘io = c_Br²·⟨ξ, ξ⟩·id`, `⟨ξ, ξ⟩ ≤ dim V_λ`. Used in 8.7.
- 3.1: the Fischer norm of a product of leading minors is the hook product. Used in 8.8, 8.10.
- 3.3: the maximal slope of the dual of an orthogonal sum of Weyl lattices of self-dual Hermitian lattices. Used in 8.24.

### From FiniteReductiveGroups, a sub-roadmap of this family

- 2.7 (b), 2.8 (a)–(c): the Bessel-type pairs and the multiplicities of their characters in Harish-Chandra induced cuspidal
  representations, over several fields. Used in 8.21.

### From DiscreteSeriesCoefficientsAndAutomorphicMetrics, a sub-roadmap of this family

- 7.5a, 7.5b: class-set integration, the perfect pairing of class-sum lattices and kernel operators between class sets. Used in
  8.7, 8.20.
- 8.3: the formal degree of a discrete series. Used in 8.8.

### From ThetaLiftsForDefiniteUnitaryGroups, a sub-roadmap of this family

- 6.12: the tower recursion of the constants, through RowTowerAndRallisIdentities §5.8d. Used in 8.24a.

## References

- [FormalProof] Levent Alpöge, the Lean formalization of the Riemann hypothesis and of the Riemann hypothesis for Dirichlet L-functions announced in [Announcement]; source with a public verification setup: <https://github.com/leanprover-community/riemann-hypothesis>.
- [Announcement] Levent Alpöge, the announcement of that proof, 20 November 2026: <https://alpo.ge/remark.pdf>.
- V. Bargmann, *On a Hilbert space of analytic functions and an associated integral transform*, Comm. Pure Appl. Math. 14
  (1961): 8.2.
- L. Kronecker; M. Lerch, *Sur quelques formules relatives au nombre des classes*, Bull. Sci. Math. 21 (1897); S. Chowla and
  A. Selberg, *On Epstein's zeta-function*, J. reine angew. Math. 227 (1967): the CM period of the Conventions, 8.5c.
- J. S. Frame, G. de B. Robinson and R. M. Thrall, *The hook graphs of the symmetric group*, Canad. J. Math. 6 (1954): 8.10.
- D. P. Zhelobenko; I. M. Gelfand and M. L. Tsetlin: 8.7.
- J.-B. Bost, *Périodes et isogénies des variétés abéliennes sur les corps de nombres*, Séminaire Bourbaki exp. 795,
  Astérisque 237 (1996), 115–161: App. A.2, pp. 146–147 (the normalised degree and slope, Conventions); Prop. 4.3 (1),
  p. 131 (the slope inequality for a map that is injective on the generic fibres, 8.24).
- É. Gaudron and G. Rémond, *Théorème des périodes et degrés minimaux d'isogénies*, Comment. Math. Helv. 89 (2014); in the
  version read (HAL hal-00590958v1, 2011), §3.2, Lemme 3.9 and its proof: the slope inequality for a map whose norms at
  the finite places are at most `1`, 8.24.
