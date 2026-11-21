# Roadmap: discrete series coefficients and automorphic metrics

**Summary.** This roadmap adds to the theory of automorphic forms a set of statements about real reductive groups, algebraic modular forms, the automorphic spectrum and automorphic vector bundles. It works in four settings, each with its own standing hypotheses: a connected real reductive group `G` with a maximal compact subgroup `K`, specialised to `U(p, q)` and to products of its bounded symmetric domain where a statement says so; a connected reductive group `G` over a number field `F` with `G(F_∞)/A_∞` compact and `Z_G(F)` discrete in `Z_G(𝔸_f)`, with a compact open level `J ⊂ G(𝔸_f)`; a connected reductive group over a number field with its spaces of cuspidal and discrete automorphic forms; and a Shimura datum `(G, X)` with a neat level `K` and a smooth projective toroidal compactification `Sh_K^Σ` whose boundary `D` is a divisor with simple normal crossings.

The headline theorems are these. (1) Let `G` have a Cartan subgroup compact modulo the split centre `A_G`, and normalise the Haar measure on `G/A_G` by the Haar probability measure of the compact dual `U`. Then the discrete series `π_λ` of regular Harish-Chandra parameter `λ` has formal degree `d(π_λ) = ∏_{α>0} |⟨λ, α^∨⟩| / ∏_{α>0} ⟨ρ, α^∨⟩`, the formal degree being defined by Schur orthogonality; it is the dimension of the irreducible representation of `U` of infinitesimal character `λ` when `λ` is dominant for a chamber of `U`. (2) Let `G = U(p, q)` with `p, q ≥ 1`, `n = p + q`, `q₀ = min(p, q)`, and `σ` the discrete series of Harish-Chandra parameter `λ` whose entries of different signs are at least `h ≥ 120·n·q₀^{3/2}` apart, with lowest `K`-type isotypic subspace `V_Λ`. Then the compression of `σ` to `V_Λ` is, on `exp 𝔭`, an explicit `K`-average of a product of powers of leading principal minors, and `|⟨σ(g)u, v⟩| ≤ exp(−(h/8)·min(d(g)², d(g)/√(2q₀)))·‖u‖·‖v‖` for all `u, v ∈ V_Λ`, where `d(k·exp X) = ‖X‖_HS`. (3) For `G` over `F` as above, class representatives `t_i` of `G(F)\G(𝔸_f)/J` and the finite groups `Γ_i = G(F) ∩ t_i J t_i⁻¹`, put `mass J = Σ_i |Γ_i|⁻¹`. Then `vol(G(F)A_∞\G(𝔸)) = vol(G_∞J/A_∞) · mass J`, and for a finite free coefficient module `M` over a field of characteristic zero on which `Γ_i` acts through `ρ_i`, `dim S(J, M) = Σ_i |Γ_i|⁻¹ Σ_{γ∈Γ_i} tr ρ_i(γ) = mass J · dim M + Σ_i |Γ_i|⁻¹ Σ_{γ∈Γ_i∖{1}} tr ρ_i(γ)`. (4) In the Shimura setting, the metric induced by a `K_∞`-invariant inner product on the automorphic vector bundle `V(J)` of a representation `J` unitary on the stabiliser `K_∞` of a point of `X` is good along `D` relative to the canonical extension `V(J)^can_Σ`. Consequently, with `κ_K = χ_top(Sh_K(ℂ))/χ_top(X̌)` for the compact dual `X̌` and `Sh_K(ℂ)` connected, every polynomial `P` of weighted degree `dim X` in the Chern classes of such bundles `V(J₁), …, V(J_m)` satisfies `P(c(V(J_•)^can_Σ))[Sh_K^Σ] = κ_K · P(c(V̌(J_•)))[X̌]`, and the same proportionality holds on fibre products of flag bundles.

The roadmap extends [AutomorphicFormsOnReductiveGroups](../../AutomorphicFormsOnReductiveGroups/README.md), whose real representation theory, holomorphic discrete series and algebraic modular forms with their class sets and finite stabilisers it uses; [AutomorphicSpectralTheory](../../AutomorphicSpectralTheory/README.md), whose cuspidal and discrete spectrum it uses; and AutomorphicBundles, whose automorphic vector bundles, canonical extensions and compact duals it uses. Good metrics and their Chern forms come from [SingularHermitianMetricsAndL2Methods](../SingularHermitianMetricsAndL2Methods/README.md), and the formal degree from the Schur–Godement orthogonality of [VonNeumannAlgebras](../../VonNeumannAlgebras/README.md). In the family [RiemannHypothesisForDirichletLFunctions](../README.md), the class-set formulas feed the theta lifts between definite unitary groups and the masses of Hermitian lattices, and the coefficient bounds, formal degrees and trace-class statements feed the limit multiplicity and the Gram bounds for Bessel–Poincaré series.

The layers are in increasing order. Layer 2 gives an explicit formula for the lowest-`K`-type coefficient of a gapped discrete series of `U(p, q)`, with its decay and weighted integrability, and decomposes the tensor products of gapped discrete series with the standard representation, its dual and its exterior powers. Layer 6 describes holomorphic discrete series as lowest-weight modules and bounds Poincaré series of discrete subgroups of `U(p, q)^f` uniformly on products of its domain. Layer 7 gives, for groups compact at infinity, the class-set integration formula with its inner product, mass and perfect pairing, kernel operators between class sets, and the dimension formula. Layer 8 proves that `K`-finite vectors of admissible Banach representations are analytic, that irreducible unitary representations with isomorphic Harish-Chandra modules are unitarily equivalent, and the formal-degree formula; the route of the formal degree for `U(p, q)` uses the coefficient formula of Layer 2 and the split Casimir operator behind its tensor products. One citation runs forward: the formula of 2.4a uses the analyticity of lowest-`K`-type vectors, 8.1, which rests on nothing in this roadmap and may be built first. Layer 9 proves that `R(f)` is trace class on the cuspidal and on the discrete spectrum. Layer 10 proves that invariant metrics on automorphic vector bundles are good along the boundary and deduces Hirzebruch–Mumford proportionality.

## Conventions

Notation and conventions not restated here are those of the roadmaps this one extends: for real groups and algebraic modular forms, the Conventions of AutomorphicFormsOnReductiveGroups and AutomorphicFormsOnReductiveGroups §§2.4, 6.1, 7.4 and 7.5 (discrete series, Harish-Chandra parameters, lowest compact types and the connected real split centre `A_G`; the Hermitian datum with its subspaces `𝔭⁺`, `𝔭⁻`; the form spaces `S(J, M)` with their level and rational models, class representatives and stabilisers); for the automorphic spectrum, the Conventions of AutomorphicSpectralTheory and AutomorphicSpectralTheory §4.4 (`[G]¹`, `L²_cusp([G]¹)`, `L²_disc([G]¹)`) and AutomorphicSpectralTheory §6.4 (the operator `R(f)` of a test function); for automorphic vector bundles, the Conventions and Layers 5 and 6 of AutomorphicBundles (the automorphic vector bundle `V(J)` of a representation `J` and its canonical extension `V(J)^can_Σ`); and for good metrics, SingularHermitianMetricsAndL2Methods §5.3.

Real groups (Layers 2, 6 and 8). `G` is a connected real reductive group, `K` a maximal compact subgroup, `𝔤/𝔞_G = 𝔨 ⊕ 𝔭` the Cartan decomposition, and `π_λ` the discrete series of regular Harish-Chandra parameter `λ`, whose lowest `K`-type has highest weight `λ + ρ_n − ρ_c`. In 8.3, `U` is the compact dual of `G`, not the enveloping algebra of the Conventions of AutomorphicFormsOnReductiveGroups. For `U(p, q)`, `n = p + q`, `K = U(p) × U(q)` and `𝔭 ≅ ℂ^{pq}`. When `G/K` is Hermitian symmetric, `𝔭_ℂ = 𝔭⁺ ⊕ 𝔭⁻` is its decomposition into abelian `K`-stable subspaces. The letter `ρ` is the half-sum of positive roots, except in 6.8a, where it is the function `−Σ_k log det(1 − Z_kZ_k^*)` on a product of domains of `U(p, q)`, and in 7.5b, where it is an algebraic coefficient representation.

Unitary groups by sign vectors (Layer 2). For Layer 2, `n = p + q`, `ε ∈ {+1, −1}^n` is a sign vector with `p` entries `+1` and `q` entries `−1`, `J = diag(ε)`, `G = {g ∈ GL_n(ℂ) : g^*Jg = J}` (isomorphic to `U(p, q)`), `K = G ∩ U(n)` (isomorphic to `U(p) × U(q)`), `𝔭 = {X ∈ M_n(ℂ) : X^* = X, XJ = −JX}`, so that `G = K·exp 𝔭`, and `q₀ = min(p, q)`. Weights of the diagonal torus are vectors `μ ∈ ℝ^n`; the positive roots are `e_a − e_b` with `a < b`, compact when `ε_a = ε_b`; `ρ_c` and `ρ_n` are the half-sums of the compact and of the noncompact positive roots. A *Harish-Chandra parameter* is a strictly decreasing `λ ∈ ((n − 1)/2 + ℤ)^n`; the *discrete series of parameter `(ε, λ)`* is the irreducible unitary representation `σ` of `G` with square-integrable matrix coefficients whose lowest `K`-type has highest weight `Λ = λ + ρ_n − ρ_c` (AutomorphicFormsOnReductiveGroups §2.4). By Blattner's formula (Hecht–Schmid 1975, Theorem (1.3), p. 130, applied to `SU(p, q)`, as `G = Z_G·SU(p, q)`), every `K`-type of `σ` has highest weight `Λ` plus a sum of positive roots and `Λ` occurs once, so `Λ` is the unique minimiser of `‖μ + 2ρ_c‖²` among the highest weights `μ` of the `K`-types of `σ` (as `Λ + 2ρ_c = λ + ρ` pairs positively with every positive root); `V_Λ ⊂ σ` is its `Λ`-isotypic subspace. The parameter has *gap `h`* if `|λ_a − λ_b| ≥ h` whenever `ε_a ≠ ε_b`. `Δ_i(z)` is the leading principal `i × i` minor of a matrix `z`, `‖·‖_HS` and `‖·‖_op` are the Hilbert–Schmidt and operator norms of a matrix, and for `g = k·exp X` with `k ∈ K`, `X ∈ 𝔭`, `d(g) = ‖X‖_HS`. Haar measure on `K` has total mass one.

Groups compact at infinity (Layer 7), with the notation of AutomorphicFormsOnReductiveGroups §§7.4–7.5: `G/F` connected reductive with `G(F_∞)/A_∞` compact and `Z_G(F)` discrete in `Z_G(𝔸_f)`, where `A_∞` is the identity component of the real points of the maximal `ℚ`-split torus in the centre of `Res_{F/ℚ}G` (trivial when `G(F_∞)` is compact); `G_∞ = G(F ⊗ ℝ)`; `J ⊂ G(𝔸_f)` compact open; representatives `t_i` of `G(F)\G(𝔸_f)/J`; `Γ_i = G(F) ∩ t_i J t_i⁻¹`, finite by AutomorphicFormsOnReductiveGroups §7.5. Haar measures on `G(𝔸)` and on `A_∞` are fixed, and `G(F)A_∞\G(𝔸)` carries the quotient measure, of finite volume.

Shimura varieties (Layer 10). `(G, X)` is a Shimura datum, `K` a neat level (not a maximal compact subgroup), `K_∞` the stabiliser of a point of `X`, `Sh_K^Σ` a smooth projective toroidal compactification of `Sh_K` with boundary `D`, `X̌` the compact dual of `X`, `V̌(J)` the homogeneous vector bundle on `X̌` defined by a representation `J`, and `χ_top` the topological Euler characteristic.

**Statements of the formal proof.** Where a target names [FormalProof], the form that proof establishes is recorded at the target: its
hypotheses, ranges and constants are those of the proof, including restrictions that the route written here does not
visibly use. A wider or sharper form stated beside it is this roadmap's own, proved by the route written here, and is not in
[FormalProof].

## Layer 2: Coefficients and tensor products of discrete series

The lowest-`K`-type coefficient of a discrete series of `U(p, q)` with gapped parameter (an explicit formula, its decay and its weighted integrability), and the tensor products of gapped discrete series with the standard representation, its dual and its exterior powers.

### 2.4a Lowest-`K`-type coefficients of gapped discrete series of `U(p, q)`

Let `λ` be a Harish-Chandra parameter with gap `h`, and put `Φ_λ(z) = ∏_{i=1}^{n−1} Δ_i(z)^{−(λ_i − λ_{i+1} + 1)} · (det z)^{−(λ_n − (n−1)/2)}`, a function on the matrices all of whose leading principal minors are nonzero. Prove that:

(a) *(kernel bound)* for `q₀ ≥ 1`, `k ∈ K` and `X ∈ 𝔭`, the leading principal minors of `k⁻¹·exp(X)·k` are positive and `Φ_λ(k⁻¹·exp(X)·k) ≤ exp(−(h/8)·min(‖X‖²_HS, ‖X‖_HS/√(2q₀)))`;

(b) *(formula)* if `h ≥ 120·n·q₀^{3/2}` and `σ` is the discrete series of parameter `(ε, λ)`, then `V_Λ` is irreducible under `K`, and for a unit vector `w ∈ V_Λ` of weight `Λ`, all `u, v ∈ V_Λ`, `k₁ ∈ K` and `X ∈ 𝔭`, `⟨σ(k₁·exp X)u, v⟩ = dim V_Λ · ∫_K Φ_λ(k⁻¹·exp(X)·k) · ⟨u, σ(k)w⟩ · ⟨σ(k)w, σ(k₁)⁻¹v⟩ dk`;

(c) *(decay)* for `q₀ ≥ 1`, under the hypotheses of (b), for all `g ∈ G` and `u, v ∈ V_Λ`, `|⟨σ(g)u, v⟩| ≤ exp(−(h/8)·min(d(g)², d(g)/√(2q₀)))·‖u‖·‖v‖`; consequently `|⟨σ(g)u, v⟩| ≤ exp(−(h/8)·min(2δ², δ/√q₀))·‖u‖·‖v‖` with `δ = log‖g‖_op`, and `|⟨σ(g)u, v⟩| ≤ n^{A/2}·e^{A/√(2q₀)}·‖g‖_HS^{−A}·‖u‖·‖v‖` with `A = h/(8√(2q₀))`. The first bound for `u = v` holds already when `h > max(8nq₀, npq + 1)`;

(d) *(weighted integrability)* for `q₀ ≥ 1`, a unit vector `w ∈ V_Λ` and a real `N ≥ 0`: if `h > npq + 1` and `h > 8√(2q₀)·(N + 2nq₀)`, then `∫_G |⟨σ(g)w, w⟩|·‖g‖_op^N dg < ∞`. In particular the coefficient is integrable when `h > max(npq + 1, 16√(2q₀)·n·q₀)`. The hypothesis `h > npq + 1` is not needed under the hypotheses of (b): if `q₀ ≥ 1`, `h ≥ 120·n·q₀^{3/2}` and `h > 8√(2q₀)·(N + 2nq₀)`, then `∫_G |⟨σ(g)u, v⟩|·‖g‖_op^N dg < ∞` for all `u, v ∈ V_Λ`; in particular these coefficients are integrable whenever `h ≥ 120·n·q₀^{3/2}`, because `120·n·q₀^{3/2} > 16√(2q₀)·n·q₀`.

The formula (b), the variant of (c) under `h > max(8nq₀, npq + 1)` and (d), with their thresholds, are statements of [FormalProof]; the route below outlines them and names the steps it does not give. The three bounds of (c) are deduced from (a) and (b) in the route, and the second sentence of (d) is (d) at `N = 0`.
(a) follows from [FormalProof], `Development/AbelianVarietyTheory/Proofs/FlagMeasures/ProdLeadMinorDecay.lean`
(`GlobalTheory.MinorDecay.prod_leadMinor_decay`), `Development/AbelianVarietyTheory/Proofs/FlagMeasures/DecGapOfFormula.lean`
(`GlobalTheory.DecGapBound.norm_Phi_le`); (b) follows from [FormalProof],
`Development/AbelianVarietyTheory/Statements/CuspFrameWeights/EigenfunctionFiniteCoefficients.lean`
(`GlobalTheory.DSId.FormulaGap`),
`Development/AbelianVarietyTheory/Proofs/FlagMeasures/LowestKTypeCompressionFormulaOfStrictLowestKType.lean`
(`GlobalTheory.Jet.FormGapFree.formulaGap`),
`Development/AbelianVarietyTheory/Proofs/FlagMeasures/LowestKTypeMultiplicityOneLargeGaps.lean`
(`GlobalTheory.Jet.MultGap.isKTypeOf_lowKSub`); the first two bounds of (c): [FormalProof],
`Development/AbelianVarietyTheory/Statements/CuspFrameWeights/EigenfunctionFiniteCoefficients.lean` (`GlobalTheory.DSId.DecGap`),
`Development/AbelianVarietyTheory/Definitions/SemilocalFrames/PosPartUnitaryMul.lean` (`GlobalTheory.Dec.decHS`),
`Development/AbelianVarietyTheory/Definitions/SemilocalFrames/LayerProd.lean` (`GlobalTheory.Count.decE`); the variant of (c):
[FormalProof], `ReciprocityTheory/ReductiveGroups/DiscreteSeries/FormalDegree/CoefDec.lean`
(`ReciprocityTheory.ChartRestriction.DS.coef_dec_of_isDS`); the first sentence of (d): [FormalProof],
`ReciprocityTheory/ReductiveGroups/DiscreteSeries/FormalDegree/CoefWeightedG.lean`
(`ReciprocityTheory.ChartRestriction.DS.coefWeightedN`); its last sentence follows from (c) and [FormalProof],
`ReciprocityTheory/ReductiveGroups/DiscreteSeries/FormalDegree/CoefIntVG.lean`
(`ReciprocityTheory.ChartRestriction.DS.integrable_opPow_of_dec`).

*Route.* (a) Diagonalise `Y = k⁻¹Xk = U·diag(y)·U^*`. By the Cauchy–Binet formula `Δ_i(e^Y) = Σ_{|J|=i} w_J·e^{S_J}` with `S_J = Σ_{j∈J}y_j` and probability weights `w_J = |det U_{[1,i],J}|²`. The `S_J` have mean `0` (the diagonal of `Y` vanishes), second moment `V_i = Σ_{b≤i<a}|Y_{ab}|²` and modulus at most `R = √(2q₀)·‖Y‖_HS` (the rank of `Y` is at most `2q₀`), so `log Δ_i(e^Y) ≥ min(1, 1/R)·V_i/4` (from `e^t ≥ 1 + t + t²/3` on `|t| ≤ 1`). Summation by parts gives `Σ_{i<n}(λ_i − λ_{i+1} + 1)·V_i ≥ Σ_{b<a}|Y_{ab}|²·(λ_b − λ_a) ≥ h·‖Y‖²_HS/2`, because `Y_{ab} ≠ 0` only when `ε_a ≠ ε_b`. (b) Let `Ψ` be the right side, an `End(V_Λ)`-valued function. It is `K`-bi-equivariant with `Ψ(1) = 1`, real analytic, and annihilated near `1` by the first-order system of the Schmid operator: `Σ_{a,b}(E_{ab}Ψ)·G_{ab} = 0` for every `G` in the `K`-isotypic part of `𝔭_ℂ ⊗ V_Λ` of types `Λ − β`, `β` a positive noncompact root. The compression of `σ` to `V_Λ` has the same properties, the types `Λ − β` not occurring in `σ` (minimality of `‖Λ + 2ρ_c‖`) and lowest-`K`-type vectors being analytic (8.1). For `h > 2n` a smooth `K`-bi-equivariant solution of this system vanishing at `1` has vanishing Taylor series at `1`; the difference of the two functions is analytic along `t ↦ exp(tX)`, hence zero. The vanishing of the Taylor series of such a solution when `h > 2n`, the computation showing that `Ψ` satisfies the system, and the analyticity of `Ψ` are not given here. (c) By (b) at `X = 0` (Schur orthogonality on `K`), the Cauchy–Schwarz inequality on `K` and (a); then `√2·log‖g‖_op ≤ d(g)`, `min(t², t/s) ≥ t/s − 1/s²` and `‖g‖²_HS ≤ n·e^{2d(g)}`. The variant under `h > max(8nq₀, npq + 1)`: the right side of (b) is a square-integrable eigenfunction of the Casimir operator with eigenvalue `|λ|² − |ρ|²`, so it generates a discrete series of parameter `(ε, λ)` inside `L²(G)`, and the discrete series of that parameter is unique when `h > npq + 1`; the proof of this uniqueness is not given here. (d) By (c) and the integration formula for `G = K·exp 𝔭`. The last sentence of (d) holds under the hypotheses of (b), by (c) and the same integration formula: a continuous function on `G` bounded by `1` and by `exp(−(h/8)·min(‖X‖²_HS, ‖X‖_HS/√(2q₀)))` at `k·exp X` is integrable against `‖g‖_op^N` when `h > 8√(2q₀)·(N + 2nq₀)`. The route of (d) is not given here in more detail.

*Needs:* AutomorphicFormsOnReductiveGroups §2.4 (discrete series, Harish-Chandra parameters, lowest compact types); 8.1 (analytic vectors); RepresentationTheory/CompactGroups §4.1 (Schur orthogonality).

**Checks.**

- `U(1, 1)`, `ε = (+, −)`, `λ₁ − λ₂ = h`: `K` is the diagonal torus, `V_Λ` is a line, and for `X = [[0, x], [x̄, 0]]` the matrix `exp X` has diagonal entries `cosh|x|` and determinant `1`, which conjugation by `K` does not change. So `Φ_λ = cosh(|x|)^{−(h+1)}` and (b) reads `⟨σ(exp X)w, w⟩ = cosh(|x|)^{−(h+1)}`: the coefficient of the holomorphic discrete series of `SU(1, 1)` of lowest weight `h + 1`, whose Harish-Chandra parameter is `h` (8.3, Checks). Here, with `t = |x|`, `‖X‖²_HS = 2t²` and `√(2q₀) = √2`, so (a) is `cosh(t)^{−(h+1)} ≤ exp(−(h/8)·min(2t², t))`, true because `log cosh t ≥ min(t²/4, t/8)` for `t ≥ 0`.
- The thresholds are not sharp: for `U(1, 1)` the Haar measure is `sinh(2t)dt` in the radial variable, so the coefficient is integrable exactly when `h > 1`, while (d) asks `h > 32√2`.
- The gap concerns entries of different signs only: for `q₀ = 0` the group is compact and every statement is empty or trivial.

### 2.4b Tensor products of gapped discrete series with the standard representation

`G` acts on `ℂ^n` by the standard representation, on `(ℂ^n)^∨` by `g ↦ (g⁻¹)^T`, and on `Λ^lℂ^n` by the exterior power; `e_s` is the `s`-th basis vector of `ℝ^n` and `e_I = Σ_{i∈I}e_i`. Let `σ` be the discrete series of parameter `(ε, μ)`, with gap `h`. Put `t₀ = max(2n, 16nq₀ + 8√(2q₀))` and `t₁ = max(t₀, npq + 1)`. Prove that:

(a) *(matrix coefficients)* if `q₀ = 0` or `h > t₀ + 1`: let `S⁺` be the set of `s` with `μ + e_s` strictly decreasing, and `σ_s` the discrete series of parameter `(ε, μ + e_s)` for `s ∈ S⁺`. The `σ_s` are pairwise inequivalent, and the linear span of the functions `g ↦ ⟨σ(g)v, w⟩·⟨gx, y⟩` on `G` (`v, w` `K`-finite vectors of `σ`; `x, y ∈ ℂ^n`) equals the linear span of the matrix coefficients of the `σ_s`, `s ∈ S⁺`, between `K`-finite vectors. The same holds with `μ − e_s` and `⟨g⁻¹x, y⟩`;

(b) *(smooth vectors)* for `p ≥ q ≥ 1`: if `l ≥ 0`, `h > t₁ + n² + 3 + l` and `μ_a − μ_{a+1} ≥ l + 1` for all `a`, then `Λ^lℂ^n ⊗ σ^∞ = ⊕_{|I|=l} σ_{μ+e_I}^∞`, where `σ_{μ+e_I}` is the discrete series of parameter `(ε, μ + e_I)`: there are `G`-equivariant linear maps `ι_I : σ_{μ+e_I}^∞ → Λ^lℂ^n ⊗ σ^∞` and `π_I` in the opposite direction, continuous for the topologies of smooth vectors, with `π_Iι_I = 1`, `π_Iι_J = 0` for `I ≠ J` and `Σ_Iι_Iπ_I = 1`. If `h > t₁ + n² + 3` and `μ_a − μ_{a+1} ≥ 2` for all `a`, then in the same sense `(ℂ^n)^∨ ⊗ σ^∞ = ⊕_{s=1}^{n} σ_{μ−e_s}^∞`.

(a) and (b), with their thresholds, are statements of [FormalProof]; the route below outlines them and names the steps it does not give.
(a) follows from [FormalProof],
`ReciprocityTheory/ReductiveGroups/DiscreteSeries/ExceptionalGroupG2/TensorProductsG2/FormalDegreeConstantDiscrete.lean`
(`ReciprocityTheory.ChartRestriction.DS.G2.zuckerman_tensor_exists`), `Formalism/PeriodIntegrals/ZuckTensor.lean`
(`PI.ZuckTensor.TensorDS`),
`ReciprocityTheory/ReductiveGroups/DiscreteSeries/ExceptionalGroupG2/TensorProductsG2/Transported.lean`
(`ReciprocityTheory.ChartRestriction.DS.G2.thrS`); (b), exterior powers: [FormalProof],
`CompanionTheory/AutomorphicTheory/ZuckermanCommutation/ZuckermanFunctors/ZuckermanGapSmall.lean`
(`CompanionTheory.Zuck.zuckerman_gap_small`),
`CompanionTheory/AutomorphicTheory/ZuckermanCommutation/ZuckermanFunctors/ZuckermanLibraryBounds.lean`
(`CompanionTheory.Zuck.thr`), `Formalism/PeriodIntegrals/UpqRep.lean` (`PI.UpqRep.IsDSHpk`); (b), the dual: [FormalProof],
`CompanionTheory/AutomorphicTheory/ZuckermanCommutation/ZuckermanFunctors/ZuckermanGapSmall.lean`
(`CompanionTheory.Zuck.zuckerman_gap_small`),
`Development/AbelianVarietyTheory/Definitions/Jets/SumIoPrAlt.lean` (`BranchingSupport.dualM`).

*Route.* (a) On `ℂ^n ⊗ M`, `M` the Harish-Chandra module of `σ`, the split Casimir operator `Σ_{a,b}e_{ab} ⊗ E_{ba}` commutes with `𝔤` and `K`. The matrix coefficients of `σ` times `‖g‖_HS` are square integrable (2.4a (c), (d)), which gives a positive definite invariant Hermitian form on `ℂ^n ⊗ M`, for which this operator is symmetric; a finite-dimensional generating subspace stable under it gives a real polynomial with simple roots annihilating it, hence a decomposition into finitely many eigen-submodules with equivariant projectors. Each eigen-submodule is zero or generates a unitary representation with square-integrable coefficients, lowest `K`-type and Casimir eigenvalue those of a parameter `μ + e_s`; by the uniqueness of the discrete series of a gapped parameter (2.4a) it is `σ_s`. It is zero exactly when `μ + e_s` is not strictly decreasing. (b) In the category of the spaces `F ⊗ U^∞` (`F` finite-dimensional, `U` unitary) with continuous equivariant maps: (a) and the decay of smooth coefficients give injectivity of the map to the constituents and the occurrence of each; the adjunction between `ℂ^n ⊗ ·` and `(ℂ^n)^∨ ⊗ ·` and the Casimir eigenvalues give multiplicity one. Exterior powers by induction on `l`, decomposing `Λ^lℂ^n ⊗ ℂ^n ⊗ σ^∞` in two ways and isolating `Λ^{l+1}ℂ^n ⊗ σ^∞` by the eigenvalue of the split Casimir operator of `Λ^lℂ^n ⊗ ℂ^n`; the induction is the reason for the hypothesis `μ_a − μ_{a+1} ≥ l + 1`. This is a case of Zuckerman's theorem (1977) on tensor products with finite-dimensional representations, which gives `σ_μ ⊗ F ≅ ⊕_ν σ_{μ+ν}` on Harish-Chandra modules, each weight `ν` of `F` counted with its multiplicity, whenever every `μ + ν` is regular in the chamber of `μ`; the general theorem is not a target here. For `F = ℂ^n` or `(ℂ^n)^∨` the decomposition into discrete series, of characters and up to infinitesimal equivalence, is also Hecht–Schmid 1975, Theorem (1.4) and Corollary (1.5), p. 131, whose hypothesis `⟨μ + ν, β⟩ > 0` for every weight `ν` of `F` and every positive noncompact root `β` holds when `h ≥ 2`. The remaining steps of the route are not given here: that an eigen-submodule is nonzero exactly when `μ + e_s` is strictly decreasing, the inequivalence of the `σ_s`, and, in (b), the injectivity, occurrence and multiplicity-one steps and the counting of Casimir eigenvalues in the induction.

*Needs:* 2.4a; AutomorphicFormsOnReductiveGroups §§2.1, 2.2, 2.4; RepresentationTheory/LieHighestWeight Layers 3, 7 and 9.

**Checks.**

- `U(1, 1)`, `ε = (+, −)`, `μ₁ − μ₂ = h`, so that `σ` restricted to `SU(1, 1)` is the holomorphic discrete series `D_{h+1}`, with `K`-types `h + 1, h + 3, …`. The weights of `ℂ²` are `±1`, so `ℂ² ⊗ σ` has the weights `h` once and `h + 2j`, `j ≥ 1`, twice: those of `D_h ⊕ D_{h+2}`, the parameters `μ + e_2` and `μ + e_1`. Both are strictly decreasing when `h ≥ 2`.
- The gap cannot be dropped: for `h = 1`, `μ + e_2` has two equal entries, `S⁺ = {1}`, but `ℂ² ⊗ D_2` has the weight `1`, which `D_3` has not (the complement is a limit of discrete series, not square integrable). So (a) fails for `h = 1`.
- Multiplicities: `F = ℂ^n ⊗ (ℂ^n)^∨` has the zero weight with multiplicity `n` (the weights `e_a − e_a`), so when every `μ + ν`, `ν` a weight of `F`, is regular in the chamber of `μ`, `σ ⊗ F` contains `σ` exactly `n` times, once for `n = 1`, whereas the trivial summand of `F` accounts for one copy only; a statement for general `F` must count weights with multiplicity.

### Examples

For `U(1, 1)`, `ε = (+, −)` and `λ₁ − λ₂ = h`, `K` is the diagonal torus, `V_Λ` is a line, `Φ_λ = cosh(|x|)^{−(h+1)}` at `X = [[0, x], [x̄, 0]]`, and the formula of 2.4a (b) reads `⟨σ(exp X)w, w⟩ = cosh(|x|)^{−(h+1)}`, the coefficient of the holomorphic discrete series of `SU(1, 1)` of lowest weight `h + 1`; this coefficient is integrable exactly when `h > 1`, while 2.4a (d) asks `h > 32√2`, so the thresholds are not sharp (2.4a). For `U(1, 1)` with `μ₁ − μ₂ = h ≥ 2`, `ℂ² ⊗ D_{h+1}` has the weights of `D_h ⊕ D_{h+2}`, the discrete series of parameters `μ + e_2` and `μ + e_1`; for `h = 1` it has the weight `1`, which `D_3` has not, so the gap cannot be dropped from 2.4b (a); and `F = ℂ^n ⊗ (ℂ^n)^∨` has the zero weight with multiplicity `n`, so in the regular range `σ ⊗ F` contains `σ` exactly `n` times and a statement for general `F` must count weights with multiplicity (2.4b).

### Dependencies

AutomorphicFormsOnReductiveGroups §§2.1, 2.2, 2.4 (Harish-Chandra modules, infinitesimal characters, discrete series, Harish-Chandra parameters and lowest compact types); 8.1 (analytic vectors, for the formula of 2.4a (b)); RepresentationTheory/CompactGroups §4.1 (Schur orthogonality); RepresentationTheory/LieHighestWeight Layers 3, 7 and 9.

## Layer 6: Holomorphic discrete series and Poincaré series

Holomorphic discrete series of a group with Hermitian symmetric space as lowest-weight modules, and a uniform bound for Poincaré series of discrete subgroups of `U(p, q)^f` on products of its domain.

### 6.8 Holomorphic discrete series as lowest-weight modules

This target extends AutomorphicFormsOnReductiveGroups §6.8, which constructs the scalar holomorphic discrete series of `Sp₂ₙ(ℝ)` and `U(n, n)` with their parameters and minimal compact types, to every holomorphic discrete series: for `G` with `G/K` Hermitian symmetric, `𝔭_ℂ = 𝔭⁺ ⊕ 𝔭⁻` the decomposition into abelian `K`-stable subspaces, a discrete series whose Harish-Chandra parameter lies in the holomorphic chamber is a lowest-weight module: `𝔭⁻` kills the lowest `K`-type `V_{λ₀}`, the `K`-finite part is `U(𝔭⁺)·V_{λ₀} ≅ S(𝔭⁺) ⊗ V_{λ₀}` as a `K`-module, and its `K`-types are `λ₀` plus `ℕ`-combinations of the weights of `𝔭⁺`. Instances: `U(p,q)` and the real points of `{(g, z) : z² = det g}` over it. For `Sp_{2g}(ℝ)`, LevelOneAutomorphicFormsForClassicalGroups §3.4 states the converse direction for the unitary lowest-weight modules `ρ_k` (for `k_g > g`, `ρ_k` is a holomorphic discrete series), with their existence and uniqueness.
The form that the formal proof uses is [FormalProof],
`Development/AbelianVarietyTheory/PublishedTheorems/TwistedTraceFormula/HolomorphicDiscreteSeries.lean`
(`GlobalTheory.Published.HolomorphicDiscreteSeries`),
`Development/AbelianVarietyTheory/Proofs/DivisorProofs/HolomorphicDiscreteSeriesHolds.lean`
(`GlobalTheory.HolDS.holomorphicDiscreteSeries_holds`).

*Route.* Harish-Chandra's realisation of the holomorphic discrete series on holomorphic functions on the bounded symmetric domain `G/K` with values in `V_{λ₀}`, square integrable for the weight given by `λ₀` (Harish-Chandra, *Representations of semisimple Lie groups IV–VI*; Knapp, *Representation theory of semisimple groups*, Ch. VI): the `K`-finite vectors are the `V_{λ₀}`-valued polynomials, `𝔭⁻` acts by derivations and kills the constants, `𝔭⁺` acts by multiplication by linear functions modulo `𝔨`, and `𝔭⁺` is abelian. Identification with the discrete series of parameter `λ` by the lowest `K`-type `λ + ρ_n − ρ_c` (AutomorphicFormsOnReductiveGroups §2.4).

*Needs:* AutomorphicFormsOnReductiveGroups §§2.1–2.4, 6.1, 6.8; RepresentationTheory/LieHighestWeight Layers 3, 7 and 9.

**Checks.**

- `SL₂(ℝ)`, `D_k⁺`: lowest `K`-type `k`, `𝔭⁺` of weight `2`, `K`-types `k, k + 2, k + 4, …`.

### 6.8a Poincaré series on products of the domains of `U(p, q)`

Let `p, q, f ≥ 0`, `n = p + q`, `D_{p,q} = {Z ∈ M_{p×q}(ℂ) : 1 − ZZ^* is positive definite}`, on which `U(p, q) = {g ∈ GL_n(ℂ) : g^*·diag(1_p, −1_q)·g = diag(1_p, −1_q)}` acts by `g·Z = (AZ + B)(CZ + D)⁻¹` for `g = [[A, B], [C, D]]`, and `ρ(Z) = −Σ_{k=1}^{f} log det(1 − Z_kZ_k^*)` on `D_{p,q}^f` (the logarithm of the Bergman kernel is `n·ρ` up to a constant). Prove that for every real `s > 2fn²` and every discrete subgroup `Γ` of `U(p, q)^f` there is `C < ∞` with `Σ_{γ∈Γ} e^{−s·ρ(γ·Z)} ≤ C` for all `Z ∈ D_{p,q}^f`, where `C` depends only on `f, p, q, s` and on a number `c > 0` such that every `γ ≠ 1` in `Γ` has, in some factor, an entry of `γ_k − 1` of modulus at least `c`.
The bound is [FormalProof],
`ReciprocityTheory/ReductiveGroups/ArithmeticGeometry/ArakelovVolumes/UpperBounds/SumBoundStatement.lean`
(`ReciprocityTheory.ChartRestriction.G.AR.Up.SumBoundStatement`); the dependence of `C` follows from [FormalProof],
`ReciprocityTheory/ReductiveGroups/ArithmeticGeometry/ArakelovVolumes/UpperBounds/SumBoundStatementPfC.lean`
(`ReciprocityTheory.ChartRestriction.G.AR.Up.sumBd_sum`).

*Route.* Write `Z_k = G_k·0` with `G_k ∈ U(p, q)`; then `det(1 − (g·0)(g·0)^*) = |det D(g)|⁻²`, so the sum is `Σ_γ∏_k|det D(γ_kG_k)|^{−2s}`. For `g ∈ U(p, q)`: `|det D(g)|² ≥ 1 + ‖B(g)‖²_HS`, and every entry of `g` has modulus squared at most `(n + 1)·|det D(g)|²`; hence a tuple with an entry of modulus `> R` contributes at most `((n + 1)/R²)^s`. The tuples `(γ_kG_k)_k`, `γ ∈ Γ`, with all entries of modulus `≤ R` are pairwise at distance at least `c/((n + 1)R)` in the matrix space `M_n(ℂ)^f`, of real dimension `2fn²`, so their number is at most `((4(n + 1)/c + 3)·R²)^{2fn²}`. Summing over `R = 2^j` gives a geometric series of ratio `4^{2fn² − s}`.

*Needs:* Mathlib (matrices, determinants, discrete subgroups).

**Checks.**

- `Γ = 1`: the sum is `e^{−sρ(Z)} = ∏_k det(1 − Z_kZ_k^*)^s ≤ 1`.
- The unit disc (`p = q = f = 1`, threshold `s > 8`) and `Γ` generated by one parabolic element: in the upper half plane, where `1 − |w|² = 4·Im τ/|τ + i|²`, the sum is `Σ_{m∈ℤ}(4y/((x + m)² + (y + 1)²))^s`, which for `y → ∞` is asymptotic to a constant times `y^{1−s}` when `s > 1/2`. It is bounded on the disc exactly when `s ≥ 1`: a threshold is necessary, and `2fn²` is not sharp.

### Examples

For `SL₂(ℝ)` and the holomorphic discrete series `D_k⁺`, the lowest `K`-type is `k`, `𝔭⁺` has weight `2`, and the `K`-types are `k, k + 2, k + 4, …` (6.8). For `Γ = 1` the Poincaré sum is `∏_k det(1 − Z_kZ_k^*)^s ≤ 1`; on the unit disc (`p = q = f = 1`, threshold `s > 8`) with `Γ` generated by one parabolic element, the sum is bounded exactly when `s ≥ 1`, so a threshold is necessary and `2fn²` is not sharp (6.8a).

### Dependencies

AutomorphicFormsOnReductiveGroups §§2.1–2.4, 6.1, 6.8 (real representation theory, discrete series and their lowest compact types, the Hermitian datum, the scalar holomorphic discrete series); RepresentationTheory/LieHighestWeight Layers 3, 7 and 9; Mathlib's matrices, determinants and discrete subgroups (6.8a).

## Layer 7: Algebraic modular forms on groups compact at infinity

The class-set integration formula with the inner product and the mass, kernel operators between class sets, and the dimension of spaces of algebraic modular forms, for groups compact at infinity.

### 7.5a Class-set integration, inner products and the mass

Define `mass J = Σ_i |Γ_i|⁻¹` and, for a coefficient module `M` with a `G(F)`-invariant (through the archimedean or level action, as in AutomorphicFormsOnReductiveGroups §7.4) Hermitian form `⟨·,·⟩_M`, the *class-set inner product* `⟨f, f′⟩_J = Σ_i |Γ_i|⁻¹ ⟨f(t_i), f′(t_i)⟩_M` on `S(J, M)`.
The class-set inner product is [FormalProof], `Formalism/LocalToGlobal/Divisibility/ClassSum.lean` (`Formalism.L2.DIV.CSD.csum`),
`Formalism/QuotientMetricDivisors/ClassSumDualLe.lean` (`Formalism.DivisionValues.IsClassSum`). Prove:

- *Integration formula.* For every continuous function `F` on `G(F)A_∞\G(𝔸)` that is right invariant under `G_∞J`, `∫_{G(F)A_∞\G(𝔸)} F = vol(G_∞J/A_∞) · Σ_i |Γ_i|⁻¹ F(t_i)`, with `vol(G_∞J/A_∞)` the volume of the image of `G_∞J` in `A_∞\G(𝔸)` for the quotient measure. More generally, for `F` right `J`-invariant, `∫_{G(F)A_∞\G(𝔸)} F = vol(G_∞J/A_∞) Σ_i |Γ_i|⁻¹ ∫_{G_∞/A_∞} F(k t_i) dk` with `dk` of total mass one on the compact group `G_∞/A_∞`. When `G_∞` is compact (`A_∞ = 1`) these are integrals over `G(F)\G(𝔸)` with `vol(G_∞J)`.
  The form that the formal proof uses is [FormalProof],
  `Development/AbelianVarietyTheory/Proofs/DecoratedLatticeProofs/IntegralDefiniteQuotientEqClassSumStatement.lean`
  (`GlobalTheory.T.integral_definiteQuotient_eq_classSum`).
- *Volume.* `vol(G(F)A_∞\G(𝔸)) = vol(G_∞J/A_∞) · mass J`; for `J′ ⊂ J` of finite index, `mass J′ = [J : J′] · mass J`.
- *Independence.* `mass J` and `⟨·,·⟩_J` do not depend on the representatives.
- *Comparison.* Under the automorphic realisation of AutomorphicFormsOnReductiveGroups §7.5 (`automorphicEquiv`), for an irreducible coefficient `V_ℂ` and a `G_∞`-invariant inner product, the Petersson product of the automorphic forms attached to `f, f′` and to unit vectors `ℓ, ℓ′ ∈ V_ℂ^∨` equals `vol(G_∞J/A_∞) (dim V_ℂ)⁻¹ ⟨ℓ, ℓ′⟩ ⟨f, f′⟩_J` (Schur orthogonality on `G_∞/A_∞`), the Petersson product being the integral over `G(F)A_∞\G(𝔸)`.
- *Hecke adjoints.* For `g ∈ G(𝔸_f)` with the coefficient action extending as in AutomorphicFormsOnReductiveGroups §7.4 and unitary on `M`, the adjoint of `[JgJ]` for `⟨·,·⟩_J` is `[Jg⁻¹J]`.
- *Duality of lattices of forms.* Let `𝒪` be the ring of integers of a number field with an involution, `⟨·,·⟩_M` nondegenerate, and for each class `i` let `∇_i ⊂ M` be an `𝒪`-lattice and `Δ_i ⊂ M` an `𝒪`-submodule stable under `Γ_i` (in the level model these are one `J`-stable lattice each; in the rational model the lattices `M_{t_i}` of 7.5b). Write `S(∇)`, `S(Δ)` for the forms with `f(t_i) ∈ ∇_i`, respectively `Δ_i`, for all `i`, `∇_i^∨` for the dual lattice in `M` and `S(∇)^∨` for the dual of `S(∇)` under `⟨·,·⟩_J`. Let `s ≥ 1` be an integer and `N_J = lcm_i |Γ_i|`. Then: (i) if `s·∇_i^∨ ⊂ Δ_i` for all `i`, then `s·S(∇)^∨ ⊂ S(Δ)`; (ii) if `s·Δ_i ⊂ ∇_i^∨` for all `i`, then `N_J·s·S(Δ) ⊂ S(∇)^∨`. In particular, for a lattice `M_𝒪` and its dual `M_𝒪^∨`, `N_J·S(J, M_𝒪^∨) ⊂ S(J, M_𝒪)^∨ ⊂ S(J, M_𝒪^∨)`: the pairing between `S(J, M_𝒪)` and `S(J, M_𝒪^∨)` takes values in `N_J⁻¹𝒪` and is perfect after inverting `N_J`. The two hypotheses on `s` are independent, and a statement about lattices dual up to an integer must say which of them it assumes. For definite quaternion algebras with a fixed central character, the analogous pairing and Hecke adjoint are HilbertModularVarietiesAndShimuraCurves §R18.3.5 (OrdinaryAutomorphicFormsAndModularityLifting §1.4 for trivial coefficients).
  (i) and the pairing follow from [FormalProof], `Formalism/QuotientMetricDivisors/ClassSumDualGeF.lean`
  (`Formalism.DivisionValues.ClassSumDualLeF`), `Formalism/LocalToGlobal/Divisibility/ClassSum.lean`
  (`Formalism.L2.DIV.CSD.Good`).

*Route.* `G(F)A_∞\G(𝔸) = ⊔_i G(F)A_∞\G(F)A_∞ t_i G_∞ J`, and the stabiliser of `t_i G_∞J A_∞` in `G(F)` is `Γ_i` (compactness of `G_∞/A_∞` and discreteness of `Z_G(F)` in `Z_G(𝔸_f)` make it the finite-adelic stabiliser); the volume statement is the formula for `F = 1`, and the index statement is the orbit count of `Γ_i` on `J/J′` (sum over orbits of `|stabiliser|⁻¹` equals `[J : J′]/|Γ_i|`). The comparison is Schur orthogonality (RepresentationTheory/CompactGroups §4.1). The Hecke adjoint is the substitution `x ↦ x g` in the integration formula. Duality of lattices of forms: (i) replacing `∇_i` by the intersection of its translates under `Γ_i` changes neither `S(∇)` nor the hypothesis (the dual of the intersection is the sum of the translates of `∇_i^∨`, and `Δ_i` is stable), so let `∇_i` be stable; for `f′ ∈ S(∇)^∨` and `m ∈ ∇_i`, pair `f′` with the form supported on the class of `t_i` with value `Σ_{γ∈Γ_i}γm` (evaluation equivalence of AutomorphicFormsOnReductiveGroups §7.5): by the invariance of `f′(t_i)` the result is `⟨m, f′(t_i)⟩`, so `f′(t_i) ∈ ∇_i^∨` and `s·f′(t_i) ∈ Δ_i`. (ii): `|Γ_i|⁻¹ ∈ N_J⁻¹ℤ`.

(B. Gross, *Algebraic modular forms*, Israel J. Math. 113 (1999), §§4–8; the pairing as in Thorne 2012, proof of Lemma 6.4.) *Needs:* AutomorphicFormsOnReductiveGroups §§7.4, 7.5; AdelicAlgebraicGroups §§2.3, 2.4, 3.4; RepresentationTheory/CompactGroups §4.1.

**Checks.**

- One class with `Γ = {±1}` and trivial coefficients: `mass = 1/2`, and the class-set product of the constant `1` with itself is `1/2`, not `1`.
- `J′ ⊂ J` of index `2`, one class for `J` with `Γ = {±1}` acting nontrivially on `J/J′`: `Cl(J′)` has one class with trivial stabiliser, and `mass J′ = 1 = 2 · (1/2)`.
- For `G` the norm-one torus of an imaginary quadratic field `k` over `ℚ` and `J = G(ℤ̂)`: `G` is commutative, so every stabiliser is `G(ℚ) ∩ J = μ(k)`, and `mass J = |Cl(J)|/|μ(k)|`.
- For `G = GL₁` over `ℚ` (`A_∞ = ℝ_{>0}`, `G_∞/A_∞ = {±1}`) and `J = ℤ̂^×`: one class, `Γ = {±1}`, `mass J = 1/2`, and `vol(ℚ^×ℝ_{>0}\𝔸^×) = vol(ℝ^×ℤ̂^×/ℝ_{>0})/2`; integrating over `ℚ^×\𝔸^×` instead would be infinite.
- `M = ℚ` with the form `p·xy`, one class with trivial stabiliser, `∇ = Δ = ℤ`: `∇^∨ = p⁻¹ℤ`, so (ii) holds with `s = 1` and (i) needs `p | s`.
- For `G = SO(q)` of a totally positive form `q` over a totally real field and `J` the integral stabiliser of a lattice, the Volume clause is GeometryOfNumbersAndQuadraticArithmetic §3.3.4 (the proper mass identity), `mass J` being the proper mass of the genus.

### 7.5b Kernel operators between class sets

For two groups `G`, `G′` as above with levels `J`, `J′` and coefficients `M`, `M′`, a *kernel* is a function `k : G(𝔸_f) × G′(𝔸_f) → Hom(M, M′)` with the transformation law of the model in use (AutomorphicFormsOnReductiveGroups §7.4):

- in the level model (`f(γ t u) = u⁻¹ f(t)`, `J` acting on `M`): `k(γ t u, γ′ t′ u′) = u′⁻¹ ∘ k(t, t′) ∘ u` for `γ ∈ G(F)`, `γ′ ∈ G′(F)`, `u ∈ J`, `u′ ∈ J′`;
- in Gross's rational model (`F(γ t u) = ρ(γ) F(t)` for an algebraic `ρ`, `ρ′`): `k(γ t u, γ′ t′ u′) = ρ′(γ′) ∘ k(t, t′) ∘ ρ(γ)⁻¹`;

the conversion `f(g) = ρ(g_p)⁻¹F(g)` of AutomorphicFormsOnReductiveGroups §7.4 carries rational kernels to level kernels by `k_{level}(t, t′) = ρ′(t′_p)⁻¹ k_{rat}(t, t′) ρ(t_p)`. Define the *kernel operator* `K_k : S(J, M) → S(J′, M′)`, `(K_k f)(t′) = Σ_i |Γ_i|⁻¹ k(t_i, t′) f(t_i)`, in either model; the conversion intertwines the two.
The kernel operator is [FormalProof], `Formalism/ThetaLiftIndependence/Statement.lean` (`Formalism.ThetaLiftIndependence.kerOpM`).
Prove:

- *Well defined.* `K_k f` lies in `S(J′, M′)` and does not depend on the representatives `t_i`.
- *Adjoint.* For the class-set inner products of 7.5a, the adjoint of `K_k` is the kernel operator with kernel `(t′, t) ↦ k(t, t′)^*` from `S(J′, M′)` to `S(J, M)`.
- *Composition.* `K_{k′} ∘ K_k = K_{k′ ⋆ k}` with `(k′ ⋆ k)(t, t″) = Σ_{i′} |Γ′_{i′}|⁻¹ k′(t′_{i′}, t″) k(t, t′_{i′})`.
- *Integrality.* In the level model: if `M_𝒪 ⊂ M`, `M′_𝒪 ⊂ M′` are `J`-, `J′`-stable lattices and every `k(t_i, t′)` maps `M_𝒪` into `M′_𝒪`, then `N_J · K_k` maps `S(J, M_𝒪)` into `S(J′, M′_𝒪)`, `N_J = lcm_i |Γ_i|`. In the rational model, with `J`-stable adelic lattices `M̂`, `M̂′` and `M_t = M ∩ ρ(t)M̂`, `M′_{t′} = M′ ∩ ρ′(t′)M̂′`: if `k(t, t′)M_t ⊂ M′_{t′}` for all `t`, `t′`, then `N_J · K_k` maps the forms with `F(t) ∈ M_t` to the forms with `F′(t′) ∈ M′_{t′}`. For a composite of `m` such operators the denominator is the product of the `N_J` of the sources.
- *Hecke equivariance.* If `k(t g, t′) = k(t, t′ g′)` after the action of Hecke operators `[JgJ]`, `[J′g′J′]` (formally: `k ⋆ [JgJ] = [J′g′J′] ⋆ k`), then `K_k` intertwines them.

*Route.* Each term is invariant under replacing `t_i` by `γ t_i u` because of the transformation laws (level model: `k(γt_iu, t′) f(γt_iu) = k(t_i, t′) u u⁻¹ f(t_i)`; rational model: `k(γt_i, t′) F(γt_i) = k(t_i, t′) ρ(γ)⁻¹ ρ(γ) F(t_i)`) and `|Γ_{γ t_i u}| = |Γ_i|`; the adjoint and the composition are finite rearrangements; integrality is `|Γ_i|⁻¹ ∈ N_J⁻¹ ℤ`. Elementary.

*Needs:* AutomorphicFormsOnReductiveGroups §§7.4, 7.5; 7.5a.

**Checks.**

- Kernel `k(t, t′) = |Γ_t| δ_{[t] = [t′]}` on `G = G′`, `J = J′`, trivial coefficients: `K_k` is the identity; without the factor `|Γ_t|` it would be multiplication by `|Γ_i|⁻¹` on the class `i`.
- The integrality denominator is attained: one class with `Γ = {±1}`, trivial coefficients, kernel `1`: `K_k 1 = 1/2`.

### 7.5c Dimensions of spaces of algebraic modular forms

For a finite free coefficient module `M` over a field of characteristic zero on which every `Γ_i` acts through a representation `ρ_i`, prove:

- `dim S(J, M) = Σ_i dim M^{Γ_i} = Σ_i |Γ_i|⁻¹ Σ_{γ ∈ Γ_i} tr ρ_i(γ)`;
- hence `dim S(J, M) = mass J · dim M + Σ_i |Γ_i|⁻¹ Σ_{γ ∈ Γ_i ∖ {1}} tr ρ_i(γ)`, and `dim S(J, M) = mass J · dim M` when every `Γ_i` is trivial, in particular at sufficiently small level (AutomorphicFormsOnReductiveGroups §7.5);
- *central-term form:* `Z_J = Z_G(F) ∩ J` lies in every `Γ_i`; if `M` is irreducible and `Z_J` acts on it by a character `ω`, then `dim S(J, M) = |Z_J| · mass J · dim M · [ω|_{Z_J} = 1] + Σ_i |Γ_i|⁻¹ Σ_{γ ∈ Γ_i ∖ Z_J} tr ρ_i(γ)`;
- for `J′ ⊂ J` of finite index with every `Γ′_i` trivial, `dim S(J′, M) = [J : J′] · mass J · dim M`; for an algebraic coefficient `M = V_λ` of a compact form, `dim M` is given by the Weyl dimension formula (ClassicalGroups Layer 5 for unitary groups).

*Route.* The evaluation equivalence of AutomorphicFormsOnReductiveGroups §7.5 and the averaging projector onto `M^{Γ_i}`; 7.5a for the mass and the index; for the central-term form, `Z_J` is central in `G(F)` and contained in `t_iJt_i⁻¹`, and `Σ_{z ∈ Z_J} ω(z) = |Z_J|·[ω|_{Z_J} = 1]`. Elementary.

*Needs:* AutomorphicFormsOnReductiveGroups §7.5; 7.5a; ClassicalGroups Layer 5; Mathlib `FDRep.average_char_eq_finrank_invariants` (one class).

**Checks.**

- Trivial coefficients, one class with `Γ = {±1}`: `dim = 1`, `mass · dim M = 1/2`; the correction term is `1/2`.
- Sign coefficients on the same class: `dim = 0 = 1/2 − 1/2`.
- Central-term form for that class with `Γ = Z_J = {±1}`: trivial coefficients give `2 · 1/2 · 1 = 1`, sign coefficients `0`, with no remaining term.

### Examples

One class with stabiliser `Γ = {±1}`: with trivial coefficients `mass = 1/2`, the class-set product of the constant `1` with itself is `1/2` (7.5a), the kernel operator with kernel `1` sends `1` to `1/2` (7.5b), and `dim S = 1 = 1/2 + 1/2` while sign coefficients give `dim S = 0 = 1/2 − 1/2` (7.5c). For `G = GL₁` over `ℚ` and `J = ℤ̂^×`, one class with `Γ = {±1}` and `mass J = 1/2`; for the norm-one torus of an imaginary quadratic field `k` and `J = G(ℤ̂)`, `mass J = |Cl(J)|/|μ(k)|` (7.5a).

### Dependencies

AutomorphicFormsOnReductiveGroups §§7.4, 7.5 (the form spaces, their models and Hecke operators, finite stabilisers, the evaluation equivalence and the automorphic realisation); AdelicAlgebraicGroups §§2.3, 2.4, 3.4; RepresentationTheory/CompactGroups §4.1 (Schur orthogonality); ClassicalGroups Layer 5 (Weyl's dimension formula for unitary groups).

## Layer 8: Analytic vectors, Harish-Chandra modules and formal degrees

Three statements about a real reductive group `G`: analyticity of `K`-finite vectors, unitary equivalence read off from Harish-Chandra modules, and the formula for the formal degree of a discrete series.

### 8.1 `K`-finite vectors are analytic

`K`-finite vectors of an admissible Banach representation of a real reductive `G` are analytic vectors, and their matrix coefficients are real-analytic functions on `G`. NoncompactQuantumSymmetry M0 (item 3) proves the analyticity for admissible unitary representations of connected semisimple groups with finite centre.
The form that the formal proof uses is [FormalProof],
`Development/AbelianVarietyTheory/Proofs/FlagMeasures/LowestKTypeAnalytic.lean` (`GlobalTheory.Jet.Anal.lowK_analytic`).

*Route.* Harish-Chandra: a `K`-finite vector of an admissible representation is `𝒵(𝔤)`-finite, so it is annihilated by a polynomial in the Casimir operator `Ω`; with the Casimir `Ω_K` of `K`, `Ω + 2Ω_K` is an elliptic operator on `G`, and elliptic regularity makes the vector analytic. For connected semisimple `G` and representations permissible in Harish-Chandra's sense with finite-dimensional `K`-isotypic subspaces, this is Harish-Chandra 1953, Lemma 34, p. 228, the analytic vectors being his well-behaved vectors (§7, p. 209).

*Needs:* AutomorphicFormsOnReductiveGroups §§2.1, 2.2 (infinitesimal characters, Harish-Chandra finiteness).

### 8.2 Unitary equivalence from an isomorphism of Harish-Chandra modules

Irreducible unitary representations of a real reductive `G` with isomorphic Harish-Chandra modules are unitarily equivalent (a positive multiple of the module isomorphism extends to a unitary isomorphism); the closure of an admissible `(𝔤, K)`-submodule of a unitary representation is `G`-stable with that submodule as its `K`-finite part. For connected semisimple groups with finite centre, the first clause, and the second for admissible unitary representations, are NoncompactQuantumSymmetry M0 (item 3).

*Route.* Harish-Chandra 1953, Theorem 5, p. 228 (closed invariant subspaces and submodules of the `K`-finite part) and Theorem 8, p. 231 (infinitesimal equivalence of irreducible unitary representations is equivalence): `K`-finite matrix coefficients are real-analytic (8.1), so a closed subspace is `G`-stable as soon as its `K`-finite part is `𝔤`-stable (the coefficients against its orthogonal complement vanish to infinite order at `1`); the invariant Hermitian form on an irreducible Harish-Chandra module is unique up to a scalar, so a module isomorphism is a multiple of an isometry.

*Needs:* AutomorphicFormsOnReductiveGroups §§2.1–2.2; 8.1.

### 8.3 Formal degree of a discrete series

Let `G` be a connected real reductive group with a Cartan subgroup `T` compact modulo the split centre `A_G`, `K` a maximal compact subgroup, `𝔤/𝔞_G = 𝔨 ⊕ 𝔭` the Cartan decomposition and `U` the compact dual, the compact group with Lie algebra `𝔨 ⊕ i𝔭`. Normalise the Haar measure on `G/A_G` so that it corresponds, under the identification of `𝔨 ⊕ 𝔭` with `𝔨 ⊕ i𝔭`, to the Haar measure of total mass one on `U`: both are given by the same invariant volume form on `𝔨 ⊕ 𝔭`, transported by left translation. For a regular Harish-Chandra parameter `λ`, the discrete series `π_λ` has formal degree `d(π_λ) = ∏_{α>0} |⟨λ, α^∨⟩| / ∏_{α>0} ⟨ρ, α^∨⟩` for this measure, the formal degree being defined by Schur orthogonality (VonNeumannAlgebras Layer 9), not by this formula; it equals the dimension of the irreducible representation of `U` whose infinitesimal character is `λ`, when `λ` is dominant for a chamber of `U`.
The form that the formal proof uses is [FormalProof],
`Development/AbelianVarietyTheory/PublishedTheorems/AutomorphicForms₂/FormalDegreeCompactDualIff.lean`
(`GlobalTheory.Published.FormalDegreeCompactDual`),
`Development/WeilBound/RepresentationTheoryGL/DiscreteSeries/DiscreteSeriesCovers/FdTopB.lean`
(`PositivityTheory.RgFd.B.formalDegreeCompactDual`), `Formalism/SharpRestriction/CuspSpanNormBounds/RelevantZeroGramTerms.lean`
(`Formalism.MainNotions.S.IsFdeg`).

*Route.* Harish-Chandra (*Discrete series for semisimple Lie groups II*, 1966): the character formula on the elliptic set and the Plancherel measure of the discrete series. For `U(p,q)` there is a self-contained route: Schur orthogonality turns the formula into `∫_G ‖Ψ_λ(g)‖²_HS dg = (dim V_λ)²/d(π_λ)` for the matrix coefficient `Ψ_λ` of the lowest `K`-type `V_λ`; translation functors (tensoring with the standard representation) give the step identity `d(λ + e_s) = d(λ)·∏_{s′≠s}(λ_s + 1 − λ_{s′})/(λ_s − λ_{s′})` for parameters with large gaps, so `d(λ)/∏_{a<b}|λ_a − λ_b|` is constant along `λ + tD`, `D = (n−1, …, 1, 0)`; along that ray the lowest-`K`-type coefficient restricted to `exp(𝔭)` concentrates at `0`, and Laplace's method (a Gaussian integral in the `pq` complex coordinates of `𝔭`) identifies the constant; the gap hypothesis is removed by a moment argument in `t`, the norms `∫_G‖Ψ_{λ+tD}‖²` being moments of one bounded function.

*Needs:* AutomorphicFormsOnReductiveGroups §2.4 (discrete series and their parameters); for the route for `U(p, q)`, 2.4a (b), (c) and the split Casimir operator of the route of 2.4b (a); VonNeumannAlgebras Layer 9; RepresentationTheory/CompactGroups Layer 0 (Haar measure of mass one); RepresentationTheory/LieHighestWeight Layer 6 (Weyl dimension formula).

**Checks.**

- `U(p,q)`, `n = p + q`: in polar coordinates `g = k·exp X`, `dk` the probability measure on `K = U(p) × U(q)` and `X ∈ 𝔭 ≅ ℂ^{pq}`, the measure is `c_{p,q}·J(X)·dX` with `J` the Jacobian density against Lebesgue measure and `c_{p,q} = ∏_{i=0}^{n−1} i! / (π^{pq} ∏_{i=0}^{p−1} i! ∏_{i=0}^{q−1} i!)`; for `U(1,1)` this is `1/π`.
  The constant `c_{p,q}` is [FormalProof], `ReciprocityTheory/ReductiveGroups/DiscreteSeries/FormalDegree/PmatIsHermitian.lean`
  (`ReciprocityTheory.ChartRestriction.DS.cPQ`).
- `SL₂(ℝ)` (`≅ SU(1,1)`), `K = SO(2)`: the holomorphic discrete series `D_k`, `k ≥ 2`, has parameter `λ` with `⟨λ, α^∨⟩ = k − 1` and `d = k − 1` for the measure above, the dimension of the representation of `SU(2)` of highest weight `k − 2`. That measure is `(4π)⁻¹·dx dy/y²` on the upper half plane times `dk` with `vol(K) = 1`, so for `dx dy/y² ⊗ dk` the formal degree is `(k − 1)/(4π)` (the hyperbolic plane of curvature `−1` corresponds to the sphere of curvature `1`, of area `4π`). For even `k` this is the formal degree computed in VonNeumannAlgebras Layer 9, and NoncompactQuantumSymmetry M4.P fixes all discrete formal degrees of `SL₂(ℝ)` in its Plancherel theorem.
- Compact `G`: `𝔭 = 0`, the measure is the probability Haar measure, and `d(π_λ) = dim π_λ` (Weyl's dimension formula).

### Examples

For `SL₂(ℝ)` and the measure of 8.3, `(4π)⁻¹·dx dy/y²` on the upper half plane times the probability measure on `K = SO(2)`, the holomorphic discrete series `D_k`, `k ≥ 2`, has formal degree `k − 1`, the dimension of the representation of `SU(2)` of highest weight `k − 2`; for `dx dy/y² ⊗ dk` it is `(k − 1)/(4π)`. For `U(1, 1)` the constant `c_{p,q}` of the polar-coordinate form of the measure is `1/π`. For compact `G` the measure is the probability Haar measure and the formal degree is the dimension (8.3).

### Dependencies

AutomorphicFormsOnReductiveGroups §§2.1, 2.2, 2.4 (compact-finite vectors and admissibility, infinitesimal characters and Harish-Chandra finiteness, discrete series and their parameters); VonNeumannAlgebras Layer 9 (Schur–Godement orthogonality and the formal degree); RepresentationTheory/CompactGroups Layer 0 (Haar measure of mass one); RepresentationTheory/LieHighestWeight Layer 6 (Weyl dimension formula); Layer 2 (the coefficient formula and decay of 2.4a (b), (c) and the split Casimir operator of 2.4b (a), for the route of 8.3 for `U(p, q)`).

## Layer 9: Trace class on the cuspidal and discrete spectrum

The operator `R(f)` of a smooth compactly supported test function on the cuspidal and on the discrete spectrum.

### 9.1 Trace class on the cuspidal and discrete spectrum

Let `G` be a connected reductive group over a number field `F` and `f ∈ C_c^∞(G(𝔸)¹)`. Then `R(f)` restricted to `L²_cusp([G]¹)` is trace class, and `R(f)` restricted to `L²_disc([G]¹)` is trace class. The formal proof uses only the cuspidal clause, for unitary groups and for test functions that are finite sums of products of a smooth compactly supported function at the archimedean places and a locally constant compactly supported function at the finite places.
The cuspidal clause in that form is [FormalProof],
`Development/AbelianVarietyTheory/PublishedTheorems/TwistedTraceFormula/CuspDiscreteDecompositionOfTraceClass.lean`
(`GlobalTheory.Published.CuspTraceClass`),
`Development/AbelianVarietyTheory/Proofs/TwistedOperators/CuspTraceClassOfFactorisation.lean`
(`GlobalTheory.Published.cuspTraceClass_of_factorisation`).

*Route (cuspidal).* By Dixmier–Malliavin (AutomorphicFormsOnReductiveGroups §2.7 `dixmierMalliavin`) write `f = Σ_i f_i ∗ g_i` with `f_i, g_i ∈ C_c^∞`; each `R(f_i)` restricted to `L²_cusp` has a kernel bounded through the rapid decay of cusp forms (AutomorphicSpectralTheory §3.4), hence is Hilbert–Schmidt (AutomorphicSpectralTheory §0.8); a product of two Hilbert–Schmidt operators is trace class (AutomorphicSpectralTheory §0.9). *Route (discrete).* Müller 1989 for `K_∞`-finite `f` (Corollary 8.8 in the numbering of its preprint MPI 88-31, p. 84) and Müller 1998 for general `f`: the residual spectrum is controlled by the Eisenstein series of AutomorphicSpectralTheory §4.4 and the same factorisation. *Needs:* AutomorphicSpectralTheory §§0.8, 0.9, 3.4, 4.4–4.5, 6.4; AutomorphicFormsOnReductiveGroups §2.7; OperatorTheory/OperatorIdeals OI-B30, OI-B41 (trace class and Hilbert–Schmidt).

**Checks.**

- `G = GL₁` over `ℚ`: `[G]¹` is compact, `L²_cusp = L²`, and `R(f)` is a convolution operator on a compact group, trace class with trace `Σ_χ χ̂(f)`. When `[G]¹` is compact, 9.1 is AutomorphicSpectralTheory §6.17.
- `R(f)` on the whole of `L²([SL₂])` is not trace class: the continuous spectrum contributes a non-discrete part.

### Examples

For `G = GL₁` over `ℚ`, `[G]¹` is compact, `L²_cusp = L²`, and `R(f)` is a convolution operator on a compact group, trace class with trace `Σ_χ χ̂(f)`; on the whole of `L²([SL₂])`, `R(f)` is not trace class, because the continuous spectrum contributes a non-discrete part (9.1).

### Dependencies

AutomorphicSpectralTheory §§0.8, 0.9, 3.4, 4.4, 4.5, 6.4 (Hilbert–Schmidt operators of `L²` kernels, the trace class of a product of two Hilbert–Schmidt operators, rapid decay, the cuspidal, residual and discrete spectrum, finite multiplicity, the operator `R(f)` and its kernel); AutomorphicFormsOnReductiveGroups §2.7 (the Dixmier–Malliavin factorisation); OperatorTheory/OperatorIdeals OI-B30, OI-B41 (Hilbert–Schmidt and trace-class operators).

## Layer 10: Good invariant metrics and Hirzebruch–Mumford proportionality

Invariant metrics on automorphic vector bundles are good relative to the canonical extension, and the Chern numbers of canonical extensions are proportional to those of the homogeneous bundles on the compact dual.

### 10.1 Invariant metrics are good

Prove: let `(G, X)` be a Shimura datum, `K` a neat level, `Sh_K^Σ` a smooth projective toroidal compactification with simple normal crossings boundary `D` (ShimuraCompactifications Layer 2 with a smooth projective `Σ`), `J` a representation of the coefficient group whose restriction to the stabiliser `K_∞` of a point of `X` is unitary, and `h` the hermitian metric on the automorphic vector bundle `V(J)` over `Sh_K(ℂ)` induced by a `K_∞`-invariant inner product (the `G(ℝ)`-invariant metric). Then `h` is good along `D` relative to the canonical extension `V(J)^can_Σ` of AutomorphicBundles §5.3 (AutomorphicBundles §6.1 for general data), in the sense of SingularHermitianMetricsAndL2Methods §5.3. Consequently the canonical extension is the unique extension of `V(J)` relative to which `h` is good (SingularHermitianMetricsAndL2Methods §5.3(b)). In particular, for the representation on `(𝔤/𝔮)^∨`, `𝔮` the Lie algebra of the parabolic subgroup of `G_ℂ` stabilising a point of `X̌` (not the Cartan complement `𝔭` of the Conventions), whose automorphic bundle is `Ω¹` of `Sh_K(ℂ)`, the canonical extension is `Ω¹(log D)`: the invariant metric is good relative to `Ω¹(log D)` as well (its frames `dq_j/q_j` have norms of logarithmic growth, as for the Poincaré metric, SingularHermitianMetricsAndL2Methods §5.5), and the extension relative to which a metric is good is unique.

*Route.* Mumford's estimate (Mumford 1977, Main Theorem 3.1, p. 256: the invariant metric on the bundle of a representation of the stabiliser is good relative to a unique extension; Proposition 3.4 a), p. 264, for `Ω¹(log D)`): near a point of a boundary stratum use the degeneration charts of ShimuraCompactifications Layer 2 (ShimuraCompactifications §2.3) in Siegel-domain coordinates (a Siegel domain of the third kind fibred over the boundary component), in which the canonical frames of AutomorphicBundles §5.1 are the frames constant along the unipotent radical; the invariant metric in these frames is computed from the action of the parabolic subgroup, and its entries are polynomials in `log|q_j|` with bounded coefficients, together with their inverses; the connection forms are combinations of `dq_j/(q_j log|q_j|)` and smooth forms, which have Poincaré growth.

*Needs:* AutomorphicBundles §§5.1–5.3, 6.1; ShimuraCompactifications §§1.1, 1.3 (boundary datum and boundary torsors), ShimuraCompactifications §§2.3, 2.6–2.7 (charts, normal crossings), ShimuraCompactifications §6.7 (universal degeneration) and ShimuraCompactifications §7.12 (logarithmic Kodaira–Spencer, the PEL case of the identification with `Ω¹(log D)`); ShimuraData Layer 2 (the Hermitian symmetric domain); ShimuraVarieties §2.1 (rational boundary components and their normalisers, the maximal rational parabolic subgroups); SingularHermitianMetricsAndL2Methods §§5.1–5.3, 5.5.

**Checks.**

- The modular curve `X(N)`, `N ≥ 3`, and `J` the standard character giving `ω`: in the frame `dz` near a cusp, `‖dz‖² = Im τ = −(1/2π)log|q|`; the connection form `∂ log(−log|q|)` has Poincaré growth, so the metric is good relative to the canonical extension `ω` (AutomorphicBundles §5.3) and not relative to `ω(−cusps)`.
- For ball quotients, the Poincaré growth of the invariant metric and the growth of the logarithmic canonical frame are BallQuotientsAndComplexHyperbolicLattices §§8.3–8.4.

### 10.2 Hirzebruch–Mumford proportionality

Prove: in the setting of 10.1 with `Sh_K(ℂ)` connected (or componentwise), let `X̌` be the compact dual of `X` and, for a representation `J`, `V̌(J)` the homogeneous vector bundle on `X̌` defined by the same representation (AutomorphicBundles §0.5). Put `κ_K = χ_top(Sh_K(ℂ))/χ_top(X̌)`, the Euler characteristic of the open variety divided by that of the compact dual; it is a signed number (for modular curves it is negative). Then for finitely many representations `J₁, …, J_m` as in 10.1 and every polynomial `P` of weighted degree `dim X` in the Chern classes of `V(J₁), …, V(J_m)`, `P(c(V(J₁)^can_Σ), …, c(V(J_m)^can_Σ))[Sh_K^Σ] = κ_K·P(c(V̌(J₁)), …, c(V̌(J_m)))[X̌]`. The same holds for fibre products of flag bundles: if `Fl → Sh_K^Σ` is the fibre product of the bundles of full (or partial) flags of `V(J₁)^can_Σ, …, V(J_m)^can_Σ`, `Fľ → X̌` the corresponding bundle over the compact dual, and `Q` a polynomial in the first Chern classes of the tautological line bundles (graded pieces) of degree `dim Fl`, then `∫_{Fl} Q = κ_K·∫_{Fľ} Q`.
For flag bundles, the form that the formal proof uses is [FormalProof],
`Development/AbelianVarietyTheory/PublishedTheorems/AutomorphicForms₂/MumfordProportionality.lean`
(`GlobalTheory.Published.MumfordProportionality`),
`Development/AbelianVarietyTheory/Proofs/IwasawaDecomposition/ToroidalFlagProportionalityOfGoodChernWeilStatement.lean`
(`GlobalTheory.T.toroidalFlagProportionality_of_goodChernWeil`).

*Route.* By SingularHermitianMetricsAndL2Methods §5.4, applied to the direct sum of the `V(J_i)` with the invariant metric (good by 10.1), `P(c(V(J_•)^can_Σ))[Sh_K^Σ] = ∫_{Sh_K(ℂ)} P(c(V(J_•), h))`. The Chern forms of invariant metrics are invariant forms on `X`; the duality between the noncompact symmetric space `X` and its compact dual `X̌` identifies invariant forms on both, the curvature tensors differing by a sign, so that every top-degree polynomial in the Chern forms corresponds to `(−1)^{dim X}` times the one for the `V̌(J_i)`. Integrating gives proportionality with a constant independent of the `J_i` and of `P`; the case of the logarithmic tangent bundle (`c_top(T_{Sh^Σ}(−log D))[Sh^Σ] = χ_top(Sh_K(ℂ))`, logarithmic Gauss–Bonnet, with `Ω¹(log D)` the canonical extension of `Ω¹` by 10.1) identifies it as `κ_K`. For one bundle this is Mumford 1977, Proportionality Theorem 3.2, p. 262, with Theorem 1.4, p. 242, for the Chern forms of a good metric. For flag bundles, push forward along `Fl → Sh_K^Σ` and `Fľ → X̌`: the push-forward of `Q` is the same universal polynomial in the Chern classes of the `V(J_i)` on both sides (fibre integration over products of flag varieties), so the flag statement follows from the first.

*Needs:* AutomorphicBundles §§5.3, 6.1; 10.1; AutomorphicBundles §0.5 (equivariant coefficients on the compact dual); SingularHermitianMetricsAndL2Methods §5.4; CharacteristicClasses C2.3 (Euler number), C2.5–C2.6 (fibre integration, flag bundles), C4.1–C4.2. The logarithmic Gauss–Bonnet identity is part of this target: from the residue sequence `0 → Ω¹ → Ω¹(log D) → ⊕_i O_{D_i} → 0`, `c(T(−log D)) = c(T)·∏_i(1 + [D_i])^{−1}`, and inclusion–exclusion over the strata of `D` with `c_top = χ_top` on each compact stratum.

**Checks.**

- `X(N)`, `N ≥ 3`, `J` the character giving `ω`: on `X̌ = ℙ¹` the same character gives `O(−1)` (`ω^{⊗2}` is `Ω¹(log cusps)`, which corresponds to `Ω¹_{ℙ¹} = O(−2)`), `κ = χ(Y(N))/χ(ℙ¹) = (2 − 2g − #cusps)/2 < 0`, and 10.2 gives `deg ω = κ·(−1) = (2g − 2 + #cusps)/2`, the correct value. A positive volume in place of the signed `κ` would give a negative degree.
- Several representations: on `X(N) × X(N)` (the datum `GL₂ × GL₂`), with `J₁`, `J₂` the characters giving `ω` on the two factors, the mixed monomial `c₁(V(J₁))·c₁(V(J₂))` is `(deg ω)²` on the left and `κ_{K×K}·(−1)(−1)` on the right, with `κ_{K×K} = κ_K² = (deg ω)²`; it is not a Chern monomial of a single `V(J)`.

### Examples

On the modular curve `X(N)`, `N ≥ 3`, with `J` the standard character giving `ω`, `‖dz‖² = Im τ = −(1/2π)log|q|` near a cusp, so the invariant metric is good relative to `ω` and not relative to `ω(−cusps)` (10.1); with `κ = (2 − 2g − #cusps)/2` and `O(−1)` on `X̌ = ℙ¹`, 10.2 gives `deg ω = (2g − 2 + #cusps)/2`, and on `X(N) × X(N)` the mixed monomial `c₁(V(J₁))·c₁(V(J₂))` equals `(deg ω)² = κ_{K×K}` (10.2).

### Dependencies

AutomorphicBundles §§0.5, 5.1–5.3, 6.1 (equivariant coefficients on the compact dual, chart coefficients, gluing and the canonical extension, also for general data); ShimuraCompactifications §§1.1, 1.3, 2.3, 2.6, 2.7, 6.7, 7.12; ShimuraData Layer 2 (the Hermitian symmetric domain); ShimuraVarieties §2.1 (rational boundary components and their normalisers, the maximal rational parabolic subgroups); SingularHermitianMetricsAndL2Methods §§5.1–5.5 (Poincaré growth, good forms, good metrics and the uniqueness of the extension, Chern–Weil theory for good metrics, Poincaré-type metrics); CharacteristicClasses C2.3, C2.5, C2.6, C4.1, C4.2 (Euler number, fibre integration, flag bundles, Chern–Weil forms).

## Downstream consumers

In the family RiemannHypothesisForDirichletLFunctions: ThetaLiftsForDefiniteUnitaryGroups uses the class-set formula and the Hecke adjoints of 7.5a and the kernel operators of 7.5b for its lifts as operators on class sets (ThetaLiftsForDefiniteUnitaryGroups §§1.2, 1.4, 1.6), and the volume statement of 7.5a for the volume of a genus (ThetaLiftsForDefiniteUnitaryGroups §5.4). HermitianFormsAndLattices uses 7.5a for the mass of a genus as a volume (HermitianFormsAndLattices §5.5) and the Hermitian instance of 7.5c with the mass formula. The theta-chain roadmaps use the mass-weighted metrics of 7.5a, the chain operator with its integrality from 7.5b and the expected dimension of the source spaces from 7.5c (mass times local index times Weyl dimension). BesselPoincareSeriesAndGramBounds uses the formal degree 8.3 for the main term `d(σ)·vol·e(1)` of the limit multiplicity and of the Gram bounds, 9.1 for the projector onto the forms of a discrete series with gap and its trace, for unitary groups of isotropic Hermitian spaces, the decay and the weighted integrability of 2.4a (c), (d) (BesselPoincareSeriesAndGramBounds §5.13 (f)), the decay of 2.4a (c) with its threshold `h ≥ 120·n·q₀^{3/2}` (BesselPoincareSeriesAndGramBounds §5.16 (e)), and the dual case of 2.4b (b), a decomposition of smooth vectors with continuous projections (BesselPoincareSeriesAndGramBounds §§5.13d (g), 5.18 (i₁)); RowTowerAndRallisIdentities uses the integrability of 2.4a (d), whose hypotheses are `h > npq + 1` and `h > 16√(2q₀)·n·q₀` (RowTowerAndRallisIdentities §§5.3, 5.5 (a)). RowTowerAndRallisIdentities also uses 9.1 (RowTowerAndRallisIdentities §§5.3, 5.9), and 6.8 and 8.3 for its model lifts (RowTowerAndRallisIdentities §5.7). ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties uses 6.8a with `f = |Φ|`, `n = N` and `s = e_P` (ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.18a (b)): for its domain of frames, the potential `−Σ_τ log|Δ_{τ,p}|` (`Δ_{τ,p}` the `p`-th leading minor of the Gram matrix) restricted to the big cell is the function `ρ` of 6.8a, so its Poincaré sum with exponent `e` is bounded for `e > 2|Φ|N²`, while that roadmap's own hypothesis is `e > 4|Φ|N²`. It also uses 10.2 for the arithmetic proportionality of the product over the real places of the flag bundles of the two eigen-bundles of the Lie algebra on unitary Shimura varieties (mixed monomials in Chern classes of different automorphic bundles), and 10.1 through the intersection numbers of log-log singular metrics.

## Scope and ownership

This sub-roadmap of [RiemannHypothesisForDirichletLFunctions](../README.md) is independently definitive.

This roadmap owns: the analyticity of `K`-finite vectors of admissible Banach representations of real reductive groups and of their matrix coefficients (8.1); unitary equivalence of irreducible unitary representations with isomorphic Harish-Chandra modules, and the `G`-stability of the closure of an admissible `(𝔤, K)`-submodule of a unitary representation (8.2); the formula for the formal degree of a discrete series for the measure normalised by the compact dual (8.3); the explicit formula, the decay and the weighted integrability of the lowest-`K`-type coefficients of gapped discrete series of `U(p, q)` (2.4a) and the tensor products of gapped discrete series of `U(p, q)` with the standard representation, its dual and its exterior powers (2.4b); the description of holomorphic discrete series as lowest-weight modules (6.8) and the uniform bound for Poincaré series of discrete subgroups of `U(p, q)^f` on products of its domain (6.8a); for groups compact at infinity, the class-set integration formula, the class-set inner product, the mass, the Petersson comparison, the Hecke adjoints and the integral pairing (7.5a), kernel operators between class sets (7.5b) and the dimension formula (7.5c); the trace class property of `R(f)` on the cuspidal and on the discrete spectrum (9.1); and the goodness of invariant metrics on automorphic vector bundles relative to the canonical extension (10.1) with Hirzebruch–Mumford proportionality, also for flag bundles (10.2).

Not owned here. The real representation theory (compact-finite vectors and admissibility, infinitesimal characters and Harish-Chandra finiteness, discrete series with their parameters and lowest compact types, smooth Fréchet representations and the Dixmier–Malliavin factorisation), the Hermitian group datum, the scalar holomorphic discrete series, and the algebraic modular forms of groups compact at infinity with their two models, Hecke operators, finite stabilisers, evaluation equivalence and automorphic realisation are AutomorphicFormsOnReductiveGroups §§2.1–2.4, 2.7, 6.1, 6.8 and 7.4–7.5; 6.8 extends that roadmap's §6.8 from the scalar holomorphic discrete series of `Sp₂ₙ(ℝ)` and `U(n, n)` to every holomorphic discrete series. Zuckerman's theorem on the tensor product of a discrete series with an arbitrary finite-dimensional representation, of which 2.4b is a case, is not stated here. Schur–Godement orthogonality, which defines the formal degree, is [VonNeumannAlgebras](../../VonNeumannAlgebras/README.md) Layer 9. The cuspidal, residual and discrete spectrum, rapid decay and finite multiplicity are AutomorphicSpectralTheory §§3.4, 4.4 and 4.5, and the trace class of a product of two Hilbert–Schmidt operators is AutomorphicSpectralTheory §0.9. Automorphic vector bundles, their canonical extensions and the equivariant coefficients on the compact dual are AutomorphicBundles §§0.5, 5.1–5.3 and 6.1. Poincaré growth, good metrics, the uniqueness of the extension relative to which a metric is good, and Mumford's Chern–Weil theory for good metrics are SingularHermitianMetricsAndL2Methods §§5.1–5.5. Toroidal compactifications, their charts and the logarithmic Kodaira–Spencer isomorphism are [ShimuraCompactifications](../../ShimuraCompactifications/README.md); Hermitian symmetric domains are [ShimuraData](../../ShimuraData/README.md), and their rational boundary components are [ShimuraVarieties](../../ShimuraVarieties/README.md) §2.1; the Euler number, fibre integration, flag bundles and Chern–Weil forms are [CharacteristicClasses](../../CharacteristicClasses/README.md) C2.3, C2.5, C2.6, C4.1 and C4.2; Hilbert–Schmidt and trace-class operators are [OperatorTheory/OperatorIdeals](../../OperatorTheory/OperatorIdeals/README.md); rational quotients, Tamagawa normalisation and adelic reduction are AdelicAlgebraicGroups §§2.3, 2.4 and 3.4; Haar measure and Schur orthogonality on compact groups are [RepresentationTheory/CompactGroups](../../RepresentationTheory/CompactGroups/README.md), Weyl's dimension formula for unitary groups is ClassicalGroups Layer 5 ([RepresentationTheory/ClassicalGroups](../../RepresentationTheory/ClassicalGroups/README.md)), and highest weights and Weyl's dimension formula are [RepresentationTheory/LieHighestWeight](../../RepresentationTheory/LieHighestWeight/README.md) (Layer 6 for the dimension formula).

In this family the statements above are used by ThetaLiftsForDefiniteUnitaryGroups, HermitianFormsAndLattices, BesselPoincareSeriesAndGramBounds, RowTowerAndRallisIdentities, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties and the theta-chain roadmaps (Downstream consumers above).

## Exact supplier contracts

### From TauCetiRoadmap.AutomorphicFormsOnReductiveGroups

§2.1: compact-finite vectors, admissibility and Harish-Chandra modules (8.1, 8.2, 2.4b, 6.8). §2.2: infinitesimal characters and Harish-Chandra's finiteness theorem, in particular that a `K`-finite vector of an admissible representation is `𝒵(𝔤)`-finite (8.1, 8.2, 2.4b). §2.3: normalized real induction and Casselman's embedding (within §§2.1–2.4 for 6.8). §2.4: discrete series exist exactly when a Cartan subgroup is compact modulo `A_G`, are labelled by regular Harish-Chandra parameters, and have lowest compact type of highest weight `λ + ρ_n − ρ_c` (8.3, 2.4a, 2.4b, 6.8). §2.7: `dixmierMalliavin`, every vector of a smooth Fréchet representation is a finite sum `Σ_i π(a_i)v_i` with `a_i ∈ C_c^∞`, so that `f = Σ_i f_i ∗ g_i` (9.1). §6.1: the Hermitian group datum with the abelian subspaces `𝔭⁺`, `𝔭⁻` (6.8). §6.8: the scalar holomorphic discrete series of `Sp₂ₙ(ℝ)` and `U(n, n)`, their parameters and minimal compact types (6.8). §7.4: the form spaces `S(J, M)` in the level model `f(γtu) = u⁻¹f(t)` and in Gross's rational model `F(γt) = ρ(γ)F(t)`, the conversion `f(g) = ρ(g_p)⁻¹F(g)`, and the Hecke operators `[JgJ]` (7.5a–7.5c). §7.5: finiteness of the stabilisers `Γ_i`, the evaluation equivalence `S(J, M) ≃ ⊕_i M^{Γ_i}`, sufficiently small level, and the automorphic realisation `automorphicEquiv` (7.5a–7.5c).

### From TauCetiRoadmap.AutomorphicSpectralTheory

§0.8: a square-integrable kernel defines a Hilbert–Schmidt operator (9.1). §0.9: a product `BC` of two Hilbert–Schmidt operators is trace class, with `‖BC‖₁ ≤ ‖B‖_HS‖C‖_HS` (9.1). §3.4: rapid decay, which bounds the kernels of the operators `R(f_i)` on `L²_cusp` (9.1). §4.4: `L²_cusp`, `L²_res` and `L²_disc = L²_cusp ⊕ L²_res`, with the residual spectrum spanned by square-integrable residues of Eisenstein series (9.1). §4.5: finite multiplicity in the discrete spectrum (9.1). §6.4: the operator `R(f)` of `f ∈ C_c^∞(G(𝔸)¹)` on `[G]¹` and its kernel (9.1).

### From TauCetiRoadmap.AutomorphicBundles

§0.5: equivariant coefficients on the compact dual, giving the homogeneous vector bundle `V̌(J)` on `X̌` of a representation `J` (10.2). §5.1: coefficients on degeneration charts with their canonical frames (10.1). §5.2: gluing of the canonical extension (10.1). §5.3: the canonical extension `V(J)^can_Σ` on a smooth toroidal model, characterised by canonical boundary frames (10.1, 10.2). §6.1: the canonical extension for general Shimura data, agreeing with §5.3 on Hodge-type charts (10.1, 10.2).

### From TauCetiRoadmap.VonNeumannAlgebras

Layer 9: Schur–Godement orthogonality for square-integrable irreducible unitary representations, which defines the formal degree (8.3).

### From TauCetiRoadmap.RepresentationTheory

RepresentationTheory/CompactGroups: the Haar measure of total mass one (Layer 0; 8.3), and Schur orthogonality for one irreducible representation (RepresentationTheory/CompactGroups §4.1; 2.4a, 7.5a). ClassicalGroups Layer 5: Weyl's dimension formula for unitary groups (7.5c). RepresentationTheory/LieHighestWeight: highest weights and infinitesimal characters (Layers 3, 7 and 9; 2.4b, 6.8), and Weyl's dimension formula (Layer 6; 8.3).

### From Mathlib

Matrices over `ℂ` with their determinants (`Matrix.det`) and leading principal minors, the Hilbert–Schmidt and operator norms, and discrete subgroups of topological groups (`DiscreteTopology`) (2.4a (a), 6.8a). `FDRep.average_char_eq_finrank_invariants`: for a finite group `Γ` whose order is invertible in `k` and a finite-dimensional representation `M`, `dim M^Γ = |Γ|⁻¹ Σ_{γ∈Γ} tr ρ(γ)`, the case of one class of the first statement of 7.5c.

### From TauCetiRoadmap.AdelicAlgebraicGroups

§2.3: rational quotients; §2.4: gauge forms and Tamagawa normalisation; §3.4: adelic reduction and arithmetic quotients (7.5a).

### From TauCetiRoadmap.OperatorTheory

OperatorIdeals OI-B30, OI-B41: the trace-class and Hilbert–Schmidt operator-ideal families (9.1).

### From TauCetiRoadmap.ShimuraCompactifications

§§1.1, 1.3: the mixed boundary datum of a rational boundary component and the boundary torsors over the pure boundary Shimura variety (10.1). Layer 2: smooth projective toroidal compactifications with simple normal crossings boundary for a smooth projective cone decomposition, with §2.3 (degeneration charts) and §§2.6–2.7 (smooth cone systems at neat level, algebraization, normal crossings); §6.7: the universal degeneration on a cusp chart; §7.12: the logarithmic Kodaira–Spencer isomorphism, the PEL case of the identification of the canonical extension of `Ω¹` with `Ω¹(log D)` (10.1).

### From TauCetiRoadmap.ShimuraData

Layer 2: the Hermitian symmetric domain of a Shimura datum (10.1).

### From TauCetiRoadmap.ShimuraVarieties

§2.1: the rational boundary components of the Hermitian symmetric domain, characterised by their normalisers, which for a `ℚ`-simple noncompact factor are the proper maximal rational parabolic subgroups (10.1).

### From TauCetiRoadmap.CharacteristicClasses

C2.3: the Euler number as a sum of local indices of a transverse section; C2.5: fibre integration; C2.6: flag-bundle transfer; C4.1–C4.2: invariant polynomials, Chern–Weil forms and their comparison with Chern classes (10.2).

### From SingularHermitianMetricsAndL2Methods, a sub-roadmap of this family

5.1: Poincaré growth along a divisor with normal crossings. 5.2: good forms. 5.3: good metrics relative to an extension of a vector bundle across the boundary, and (b) the uniqueness of the extension relative to which a metric is good (10.1). 5.4: Chern–Weil theory for good metrics: the Chern numbers of the extension are the integrals of the Chern forms of the good metric over the open part (10.2). 5.5: Poincaré-type metrics, whose frames `dq_j/q_j` have norms of logarithmic growth (10.1).

## References

- Harish-Chandra, Representations of a semisimple Lie group on a Banach space I, Trans. Amer. Math. Soc. 75 (1953), §7, p. 209, Lemma 34, p. 228, Theorem 5, p. 228, and Theorem 8, p. 231: analytic vectors and the passage between Harish-Chandra modules and unitary representations (8.1, 8.2).
- Harish-Chandra, Representations of semisimple Lie groups IV, V, VI, Amer. J. Math. 77–78 (1955–1956): the holomorphic discrete series on bounded symmetric domains (6.8).
- Harish-Chandra, Discrete series for semisimple Lie groups II, Acta Math. 116 (1966): the character formula on the elliptic set and the formal degree (8.3).
- A. W. Knapp, Representation theory of semisimple groups: an overview based on examples, Princeton University Press, 1986, Ch. VI: holomorphic discrete series (6.8).
- B. H. Gross, Algebraic modular forms, Israel J. Math. 113 (1999), §§4–8: class sets, the mass and the inner product (7.5a).
- H. Hecht and W. Schmid, A proof of Blattner's conjecture, Invent. Math. 31 (1975), Theorem (1.3), p. 130 (Blattner's formula; Conventions), and Theorem (1.4) and Corollary (1.5), p. 131 (tensor products of a discrete series with a finite-dimensional representation; 2.4b).
- J. Thorne, On the automorphy of l-adic Galois representations with small residual image, J. Inst. Math. Jussieu 11 (2012), proof of Lemma 6.4, in the numbering of arXiv:1107.5989v1: the integral pairing (7.5a).
- W. Müller, The trace class conjecture in the theory of automorphic forms, Ann. of Math. 130 (1989), cited in the numbering of its preprint MPI 88-31 (Max-Planck-Institut für Mathematik, 1988), Corollaries 0.2 and 8.8, for `K`-finite test functions; and its sequel, The trace class conjecture in the theory of automorphic forms II, Geom. Funct. Anal. 8 (1998): the discrete spectrum (9.1).
- D. Mumford, Hirzebruch's proportionality theorem in the non-compact case, Invent. Math. 42 (1977), Theorem 1.4, p. 242, Main Theorem 3.1, p. 256, Proportionality Theorem 3.2, p. 262, and Proposition 3.4, p. 264: good metrics and proportionality (10.1, 10.2).
- M. Harris, Functorial properties of toroidal compactifications of locally symmetric varieties, Proc. London Math. Soc. 59 (1989): canonical extensions (10.1, 10.2).
- G. Zuckerman, Tensor products of finite and infinite dimensional representations of semisimple Lie groups, Ann. of Math. 106 (1977): tensor products of a discrete series with a finite-dimensional representation (2.4b).
- [FormalProof] Levent Alpöge, the Lean formalization of the Riemann hypothesis and of the Riemann hypothesis for Dirichlet L-functions announced in [Announcement], distributed as a Lean archive in fourteen parts on its author's page (footnote 1 of [Announcement]); source with a public verification setup: <https://github.com/leanprover-community/riemann-hypothesis>. It is the source of 2.4a (b), of the variant of 2.4a (c) and of 2.4a (d), and of 2.4b, with their thresholds.
- [Announcement] Levent Alpöge, the announcement of that proof, 20 November 2026: <https://alpo.ge/remark.pdf>.
